<?php 
namespace szxh\model;
class Order extends Common {

    public function __construct() {
        parent::__construct();
        $this->setTableName('Order');
    }

    /**
     * 判断微信用户是否已报名过此活动
     * 通过wechat_id的方式
     */
    public function isOrderByWechatId($active_id, $wechat_id) {
        if(empty($active_id) || empty($wechat_id)) {
            return false;
        }
        return $this->query->from($this->tableName)->where('active_id', $active_id)->where('wechat_id', $wechat_id)->get();
        
    }

    /**
     * 判断微信用户是否已报名过此活动
     * 通过主键id的方式
     */
    public function isOrderById($id) {
        if(empty($id)) {
            return false;
        }
        return $this->query->from($this->tableName)->where('id', $id)->get();
    }

    /**
     * 判断微信用户是否已报名过此活动
     * 通过order_sn的方式
     */
    public function isOrderBySn($order_sn) {
        if(empty($order_sn)) {
            return false;
        }
        return $this->query->from($this->tableName)->where('order_sn', $order_sn)->get();
    }

    public function validAdd($data, $active_id, $wechat_id) {
        if(empty($active_id)) {
            return $this->setInfo(11, '活动获取失败，请重新尝试');
        }

        if(empty($data['name'])) {
            return $this->setInfo(12, '请填写姓名', 'name');
        }

        if(empty($data['mobile'])) {
            return $this->setInfo(13, '请填写手机号', 'mobile');
        }

        if(!is($data['mobile'], 'mobile')) {
            return $this->setInfo(21, '手机号格式不正确', 'mobile');
        }

        if(empty($data['type'])) {
            return $this->setInfo(14, '请选择身份类型', 'type');
        }

        if($data['type'] != 1 && $data['type'] != 2 && $data['type'] != 3) {
        // if($data['type'] != 1 && $data['type'] != 2) {
            return $this->setInfo(16, '身份类型选择错误', 'type');
        }

        if($data['type'] != 3) {
            if(empty($data['price']) || $data['price'] < 0) {
                return $this->setInfo(17, '活动金额获取失败');
            }
        } else {
            $data['price'] = 0.00;
        }

        // 分享人判断
        if(!empty($data['referrals'])) {
            $refOrder = $this->isOrderById($data['referrals']);
            // 下单过并且已支付才能返利，返利到下单的记录数据的微信ID上
            if(!empty($refOrder) && $refOrder['status'] == 2) {
                $data['referrals_wechat_id'] = $refOrder['wechat_id'];
                $data['referrals_name'] = $refOrder['name'];

                if(empty($data['referrals_min_reward']) || empty($data['referrals_max_reward'])) {
                    $data['referrals_reward'] = 0.00;
                }

                $data['referrals_reward'] = rand($data['referrals_min_reward'] * 100, $data['referrals_max_reward'] * 100) / 100;
            }

        }
        unset($data['referrals']);
        unset($data['referrals_max_reward']);
        unset($data['referrals_min_reward']);

        // 是否已经报名过
        $hasOrder = $this->isOrderByWechatId($active_id, $wechat_id);
        if($hasOrder) {
            return $this->setInfo(15, '您已报名过，请勿重复提交');
        }

        return $data;
    }

    /**
     * 创建订单
     * data为验证之后的原封数据
     */
    public function create($active_id, $wechat_id, $data) {

        $data['create_time'] = TIMESTAMP;
        $data['order_sn'] = $this->setsn();
        $data['active_id'] = $active_id;
        $data['wechat_id'] = $wechat_id;

        $res = pdo_insert($this->tableName, $data);

        if(!$res) {
            return $this->setInfo(17, '创建订单失败');
        }

        return $data;

    }

    public function saveBuyed($order_sn) {
        pdo_update($this->tableName, ['status'=>2, 'complete_time'=>TIMESTAMP], ['order_sn'=>$order_sn]);
    }

    public function changeRewardStatus($order_sn, $status) {
        pdo_update($this->tableName, ['referrals_reward_status'=>$status], ['order_sn'=>$order_sn]);
    }

    /**
     * 订单列表
     */
    public function getList($active_id, $page = false) {
        $this->query->from($this->tableName, 'ord')
                    ->select('ord.*', 't.reward AS referrals_reward', 't.status AS referrals_reward_status')
        			->leftjoin(getTableName('transfers'), 't')
        			->on(['ord.order_sn'=>'t.order_sn', 't.send_type'=>1])
      				->where('ord.active_id', $active_id)
          			->orderby('ord.create_time', 'DESC');
      	if($page !== false) {
          	$page = intval($page);
          	$this->query->page($page, 10);
        }
      	$list = $this->query->getall();
      	$total = $this->getLastQueryTotal();
      	$this->setPageHtml(pagination($total, $page, 10));
      	return $list;
    }

    /**
     * 发放红包操作
     * 成功返回true，失败返回false
     * 注意：如果发放奖励，请确保referrals_wechat_id字段有值
     */
    public function transfers($order) {
        $main = Vendor('wxpay/Transfers');
        $pay = new $main();

        // 获取活动信息
        $act = model('Active')->findRow($order['active_id']);
        if(empty($act)) {
            return $this->setInfo(10, '活动不存在，发放红包失败');
        }

        // 开启发放红包时处理
        if($act['redpack_status'] == 1) {

            // 是否开启支付后获得红包，并且推荐人已支付
            // 如果未开启(2)直接发放红包，已开启(1)时判断推荐人是否已付款，如果未支付不发放奖励
            if($act['redpack_ispay'] == 1) {
                $order_ref = $this->isOrderByWechatId($act['id'], $order['referrals_wechat_id']);
                // 如果没付款
                if($order_ref['status'] != 2) {
                    return false;
                }
            }

            $transfers_sn = model('Transfers')->setOrder($order['order_sn'], $order['referrals_wechat_id'], $order['referrals_reward'], $act['redpack_type'], false, [
                'active_id' => $order['active_id'],
                'send_type' => 1, // 推荐
            ]);

            // 不在以下两种发放条件返回的信息
            $res = '未设置正确的红包发放形式，发放失败';

            // 现金红包
            if($act['redpack_type'] == 1) {
                $res = $pay->sendredpack($order['referrals_wechat_id'], $order['referrals_reward'], $transfers_sn, $act['redpack_name'], $act['redpack_sender'],  $act['redpack_wishing'], $act['redpack_remark']);
            }

            // 企业付款
            if($act['redpack_type'] == 2) {
                $res = $pay->transfers($order['referrals_wechat_id'], $order['referrals_reward'], $transfers_sn, $act['transfers_remark']);
            }

            // 奖励发放失败
            if($res !== true) {
                $this->changeRewardStatus($order['order_sn'], 2);
                pdo_update(getTableName('transfers'), [
                    'status' => 3,
                    'reward_msg' => $res,
                    'send_type' => 1,
                    'active_id' => $order['active_id']
                ], [
                    'transfers_sn' => $transfers_sn
                ]);
                return $res;
            }

            // 发放成功
            
            pdo_update(getTableName('transfers'), [
                'status' => 2,
                'reward_msg' => $res,
                'send_type' => 1,
                'active_id' => $order['active_id']
            ], [
                'transfers_sn' => $transfers_sn
            ]);

            $this->changeRewardStatus($order['order_sn'], 1);
            return $transfers_sn;

        }
        
        return true;
        
    }

    // 给校长返钱
    public function princTransfers($order, $transfers_sn) {
        $main = Vendor('wxpay/Transfers');
        $pay = new $main();

        // 获取活动信息
        $act = model('Active')->findRow($order['active_id']);
        if(empty($act)) {
            return $this->setInfo(10, '活动不存在，发放红包失败');
        }

        $princ = $act['princ'];

        if($act['redpack_status'] == 1 && !empty($princ)) {

            $transfers_sn = model('Transfers')->setOrder($order['order_sn'], $princ, $act['princ_reward'], $act['redpack_type'], $transfers_sn, [
                'active_id' => $order['active_id'],
                'send_type' => 3 // 校长
            ]);

            // 不在以下两种发放条件返回的信息
            $res = '未设置正确的红包发放形式，发放失败';

            // 现金红包
            if($act['redpack_type'] == 1) {
                $res = $pay->sendredpack($princ, $act['princ_reward'], $transfers_sn, $act['redpack_name'], $act['redpack_sender'],  $act['redpack_wishing'], $act['redpack_remark']);
            }

            // 企业付款
            if($act['redpack_type'] == 2) {
                $res = $pay->transfers($princ, $act['princ_reward'], $transfers_sn, $act['transfers_remark']);
            }

            if($res === true) {
                pdo_update(getTableName('transfers'), [
                    'status' => 2,
                    'reward_msg' => $res,
                    'send_type' => 3,
                    'active_id' => $order['active_id']
                ], [
                    'transfers_sn' => $transfers_sn
                ]);
                return true;
            } else {
                pdo_update(getTableName('transfers'), [
                    'status' => 3,
                    'reward_msg' => $res,
                    'send_type' => 3,
                    'active_id' => $order['active_id']
                ], [
                    'transfers_sn' => $transfers_sn
                ]);
                return false;
            }


            return true;

        }
    }

    /**
     * 获取单客服的统计数据
     * @return 返回该段时间该客服获得的新老客户数量
     */
    public function getStatisticFromRow($serviceid, $starttime, $endtime) {

        $params = [
            ':activeplusorder' => tablename($this->tableName),
            ':activeplus' => tablename('szxh_activeplus'),
            ':serviceid' => $serviceid,
            ':starttime' => $starttime,
            ':endtime' => $endtime
        ];

        // 计数
        $sql = "SELECT COUNT( CASE WHEN ord.type = 1 THEN 1 ELSE NULL END ) AS new_count, COUNT( CASE WHEN ord.type = 2 THEN 1 ELSE NULL END ) AS old_count, COUNT( CASE WHEN ord.type = 3 THEN 1 ELSE NULL END ) AS spread_count FROM {$params[':activeplusorder']} AS ord LEFT JOIN {$params[':activeplus']} AS act ON ord.active_id = act.id WHERE ord.status = 2 AND act.service_user_id = {$params[':serviceid']} AND ord.complete_time >= {$params[':starttime']} AND ord.complete_time <= {$params[':endtime']}";

        $list = pdo_fetch($sql);

        return $list;

    }

    /**
     * 获取单活动的统计数据
     * @return 返回该段时间该客服获得的新老客户数量
     */
    public function getStatisticFromAct($active_id) {

        $params = [
            ':activeplusorder' => tablename($this->tableName),
            ':activeplus' => tablename('szxh_activeplus'),
            ':active_id' => $active_id,
            // ':starttime' => $starttime,
            // ':endtime' => $endtime
        ];

        // 计数
        $sql = "SELECT COUNT( CASE WHEN ord.type = 1 THEN 1 ELSE NULL END ) AS new_count, COUNT( CASE WHEN ord.type = 2 THEN 1 ELSE NULL END ) AS old_count, COUNT( CASE WHEN ord.type = 3 THEN 1 ELSE NULL END ) AS spread_count FROM {$params[':activeplusorder']} AS ord LEFT JOIN {$params[':activeplus']} AS act ON ord.active_id = act.id WHERE ord.status = 2 AND act.id = {$params[':active_id']}";

        $list = pdo_fetch($sql);

        return $list;

    }

}