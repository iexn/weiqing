<?php 
namespace szxh\model;

class Active extends Common {

    public function __construct() {
        parent::__construct();
        $this->setSystemTableName('activeplus');
    }

    public function saveRow($data, $id = false) {
        global $_W;
        // unset($data['design']);
        // unset($data['design_status']);
        // unset($data['design_img']);
        
        // 判断新增还是修改
        if($id !== false) {

            $res = pdo_update($this->tableName, $data, ['id' => $id, 'uniacid'=>$_W['uniacid']]);

        } else {

            $data['uniacid']     = $_W['uniacid'];
            $data['isfounder']   = +$_W['isfounder'];
            $data['create_time'] = TIMESTAMP;

            if(empty($data['uid'])) {
                $data['uid']     = $_W['uid'];
            }

            $res = pdo_insert($this->tableName, $data);

        }

        return $res;
    }


    /*
    [
        'status'           => $_POST['status'],
        'active_cate_id'   => $_POST['active_cate_id'],
        'title'            => $_POST['title'],
        'cover'            => $_POST['cover'],
        'price'            => $_POST['price'],
        //'min_get'          => $_POST['min_get'],
        //'max_get'          => $_POST['max_get'],
        'service_user_id'  => $_POST['service_user_id'],
        'content'          => $_POST['content'],
        'end_time'         => $_POST['end_time'],
        //'second_title'     => $_POST['second_title'],
        //'planner'          => $_POST['planner'],
        //'inst'             => $_POST['inst'],
        //'school'           => $_POST['school'],
        //'consignee'        => $_POST['consignee'],
        //'consignee_mobile' => $_POST['consignee_mobile'],
        //'consignee_addr'   => $_POST['consignee_addr'],
        //'goods'            => $_POST['goods'],
        //'service_tel'      => $_POST['service_tel'],
        //'bgm'              => $_POST['bgm'],
        'attract'          => $_POST['attract'],
        'redpack_status'   => $_POST['redpack_status'],
        'redpack_type'     => $_POST['redpack_type'],
        'redpack_name'     => $_POST['redpack_name'],
        'redpack_sender'   => $_POST['redpack_sender'],
        'redpack_wishing'  => $_POST['redpack_wishing'],
        'redpack_remark'   => $_POST['redpack_remark']
    ];*/
    public function validSave($data, $id = false) {
        global $_W;

        if($_W['role'] != 'clerk') {
            if($data['status'] != 1 && $data['status'] != 2 && $data['status'] != 3) {
                return $this->setInfo(20, '显示状态发生错误');
            }
        } else {
            unset($data['status']);
        }

        if(empty($data['active_cate_id'])) {
            return $this->setInfo(21, '请选择类别');
        }

        if(empty($data['title'])) {
            return $this->setInfo(22, '请填写内容标题');
        }

        if(istrlen($data['title']) > 100) {
            return $this->setInfo(23, '内容标题不能超过100个字');
        }

        if(empty($data['cover'])) {
            return $this->setInfo(24, '请选择封面');
        }

        if(!isclerkupdate($id)) {
            if(empty($data['price'])) {
                return $this->setInfo(25, '请填写价格');
            }
        } else {
            unset($data['price']);
        }

        if($_W['role'] != 'clerk') {
            if(empty($data['service_user_id'])) {
                return $this->setInfo(14, '请设置客服');
            }
            $service = model('ServiceUser')->findRow($data['service_user_id']);
            if(empty($service)) {
                return $this->setInfo(21, '客服不存在，请重新设置');
            }
            $data['uid'] = $service['uid'];
        } else {
            unset($data['service_user_id']);
        }

        if(empty($data['content'])) {
            return $this->setInfo(26, '请填写内容描述');
        }
        $data['content'] = htmlspecialchars_decode($data['content']);

        if(empty($data['end_time'])) {
            return $this->setInfo(27, '请选择结束时间');
        }
        $data['end_time'] = is_time(1, $data['end_time'])['end'];

        if(in_array($data['attract_status'], [1,2,'1','2']) === false) {
            return $this->setInfo(28, '请设置招商信息');
        } else {
            if(empty($data['attract_title'])) {
                return $this->setInfo(40, '请设置招商标题');
            }
            if(in_array($data['attract_type'], [1,2,3,'1','2','3']) === false) {
                return $this->setInfo(41, '请设置招商显示方式');
            }
            if($data['attract_type'] == 2) {
                if(empty($data['attract_value_link'])) {
                    return $this->setInfo(42, '请设置招商跳转链接');
                }
            }
            if($data['attract_type'] == 3) {
                if(empty($data['attract_value_custom'])) {
                    return $this->setInfo(42, '请设置招商自定义内容');
                }
                $data['attract_value_custom'] = htmlspecialchars_decode($data['attract_value_custom']);
            }
        }


        if(empty($data['redpack_status'])) {
            return $this->setInfo(29, '请设置返利功能');
        }

        if(!in_array($data['redpack_status'], [1,2,'1','2'])) {
            return $this->setInfo(30, '返利功能设置出错，请刷新后重试');
        }

        // 如果使用返利功能，进行以下判断
        if($data['redpack_status'] == 1) {
            if(!isclerkupdate($id)) {
                if(!in_array($data['redpack_type'], [1,2,'1','2'])) {
                    return $this->setInfo(34, '发放形式设置出错，请刷新后重试');
                }
                if(!in_array($data['redpack_ispay'], [1,2,'1','2'])) {
                    return $this->setInfo(34, '支付后返利设置出错，请刷新后重试');
                }
                if(is_int($data['min_get']) || $data['min_get'] <= 0) {
                    return $this->setInfo(31, '返利最小值为1元');
                }
                if(is_int($data['max_get']) || $data['max_get'] > 200) {
                    return $this->setInfo(32, '返利最大值为200');
                }
                if($data['min_get'] > $data['max_get']) {
                    return $this->setInfo(33, '返利最小值不能大于返利最大值');
                }
            } else {
                unset($data['redpack_type']);
                unset($data['redpack_ispay']);
                unset($data['min_get']);
                unset($data['max_get']);
            }
            // 只在现金红包中填写的信息
            if($data['redpack_type'] == 1) {
                if(empty($data['redpack_name'])) {
                    return $this->setInfo(35, '请填写活动名称');
                }
                if(istrlen($data['redpack_name']) > 10) {
                    return $this->setInfo(36, '活动名称不能超过10个字');
                }
                if(empty($data['redpack_sender'])) {
                    return $this->setInfo(38, '请填写发送人姓名');
                }
                if(empty($data['redpack_wishing'])) {
                    return $this->setInfo(37, '请填写红包祝福语');
                }
                if(empty($data['redpack_remark'])) {
                    return $this->setInfo(39, '请填写发放备注');
                }
                unset($data['transfers_remark']);
            }
            // 只在企业付款中填写的信息
            if($data['redpack_type'] == 2) {
                if(empty($data['transfers_remark'])) {
                    return $this->setInfo(40, '请填写转账备注信息');
                }
                unset($data['redpack_name']);
                unset($data['redpack_sender']);
                unset($data['redpack_wishing']);
                unset($data['redpack_remark']);
            }
        }

        return $data;

    }

    public function getList($page = 1, $condition = []) {
        global $_W;
        $this->query->from($this->tableName, 'act')
                    ->select('act.*', 'cate.title AS active_cate_title', 'suser.name AS service_user_name')
                    ->leftjoin(getTableName('cate'), 'cate')
                    ->on('act.active_cate_id', 'cate.id')
                    ->leftjoin(getTableName('ServiceUser'), 'suser')
                    ->on('act.service_user_id', 'suser.id')
                    ->where('act.uniacid', $_W['uniacid'])
                    ->orderby('act.create_time', 'DESC')
                    ->orderby('act.id', 'DESC');

        // 如果是添加的操作员
        if($_W['role'] == 'clerk') {
            $this->query->where('act.uid', $_W['uid']);
        }

        // 添加搜索操作
        if(!empty($condition['uid'])) {
            $this->query->where('act.service_user_id', $condition['uid']);
        }

        if(!empty($condition['active_id'])) {
            $this->query->where('act.id', $condition['active_id']);
        }
        
        if(!empty($condition['title'])) {
            $this->query->where('act.title LIKE', '%'.$condition['title'].'%');
        }

        if($page === false) {
            return $this->getall();
        }

        $page = (int)$page;
        if($page <= 0) {
            $page = 1;
        }

        // 计算总数
        $pageIndex = $page;
        $pageSize  = 10;
        $list      = $this->query->page($pageIndex, $pageSize)->getall();
        $total     = $this->getLastQueryTotal();

        $this->pageHtml = pagination($total, $pageIndex, $pageSize);

        return $list;
    }

    public function lastPageHtml() {
        $html = $this->pageHtml;
        $this->pageHtml = '';
        return $html;
    }

    /**
     * 获取单条数据
     */
    public function findRow($id) {
        global $_W;
        $this->query->from($this->tableName)->where('id', $id)->where('uniacid', $_W['uniacid']);
        if($_W['role'] == 'clerk') {
            $this->where('uid', $_W['uid']);
        }
        $row = $this->get();
        return $row;
    }

    /**
     * 活动浏览人列表
     */
    public function viewers($id) {
        return $this->query->from(getTableName('view'))->select('avatar', 'name')->where('active_id', $id)->orderby('view_time', 'DESC')->limit(0, 27)->getall();
    }

    /**
     * 获取前20位
     */
    public function registers($id, $hideWorker = false) {
        $this->query->from(getTableName('order'))
                    ->select('wechat_id', 'create_time', 'price')
                    ->where('active_id', $id)
                    ->where('status', 2)
                    ->orderby('create_time', 'DESC')
                    ->limit(0, 20);
                    
        if($hideWorker) {
            $this->where('type !=', 3);
        }
        
        return $this->getall();
    }

    /**
     * 添加浏览人记录
     */
    public function setViewer($activeId, $wechat_id, $name, $avatar) {
        
        $row = $this->query->from(getTableName('view'))->where('active_id', $activeId)->where('wechat_id', $wechat_id)->get();

        if(!empty($row)) {
            pdo_query("update ". tablename($this->tableName) . " set views=views+1 where id='".$activeId."'");
            $this->query->from(getTableName('view'))->where('active_id', $activeId)->getall();
            return $this->getLastQueryTotal();
        }
        
        $res = pdo_insert(getTableName('view'), [
            'active_id' => $activeId,
            'wechat_id' => $wechat_id,
            'view_time' => TIMESTAMP,
            'avatar' => $avatar,
            'name' => $name
        ]);

        $this->query->from(getTableName('view'))->where('active_id', $activeId)->getall();

        return $this->getLastQueryTotal();
    }

    /**
     * 添加购买人记录
     */
    public function saveBuyed($activeId) {
        pdo_fetch("update ". tablename($this->tableName) . " set register=register+1 where id=:id", [':id'=>$activeId]);
    }

    // 添加分享记录，并返回已分享次数
    public function recodeShareLog($active, $wechat_id, $order_sn) {
        global $_W;
        $active_id = $active['id'];
        $rewardCount = $active['share_reward_count'] ?: 0;
        $reward = $active['share_reward'] ?: 0;

        // 不开启分享红包
        if($active['redpack_status'] != 1 || $active['share_reward_count'] <= 0) {
            return true;
        }

        // 获取最近一次分享记录和总分享次数
        $recode = $this->query->from(getTableName('sharelog'))->where('uniacid', $_W['uniacid'])->where('active_id', $active_id)->where('wechat_id', $wechat_id)->orderby('share_time', 'DESC')->get();
        $count = $this->getLastQueryTotal();

        // 分享次数+1（本次操作也是一次分享）与该活动分享次数返利（rewarcdCount）进行对比，如果未得红包并且分享达到一定次数，开始返红包
        
        $geted_reward = 0;

        // 没得过红包
        if($recode['geted_reward'] != 1) {

            // 达到次数
            if($count + 1 >= $rewardCount) {
                $geted_reward = 1;

                // 开始发放红包

                $main = vendor('wxpay/Transfers');
                $pay = new $main();
                $transfers_sn = model('Transfers')->setOrder($order['order_sn'], $wechat_id, $reward, $active['redpack_type'], false, [
                    'active_id' => $active['id'],
                    'send_type' => 2
                ]);

                // 不在以下两种发放条件返回的信息
                $res = '未设置正确的红包发放形式，发放失败';

                // 现金红包
                if($active['redpack_type'] == 1) {
                    $res = $pay->sendredpack($wechat_id, $reward, $transfers_sn, $active['redpack_name'], $active['redpack_sender'],  $active['redpack_wishing'], $active['redpack_remark']);
                }

                // 企业付款
                if($active['redpack_type'] == 2) {
                    $res = $pay->transfers($wechat_id, $reward, $transfers_sn, $active['transfers_remark']);
                }

                if($res === true) {
                    pdo_update(getTableName('transfers'), [
                        'status' => 2,
                        'reward_msg' => $res,
                        'send_type' => 2,
                        'active_id' => $active['id']
                    ], [
                        'transfers_sn' => $transfers_sn
                    ]);
                    return true;
                } else {
                    pdo_update(getTableName('transfers'), [
                        'status' => 3,
                        'reward_msg' => $res,
                        'send_type' => 2,
                        'active_id' => $active['id']
                    ], [
                        'transfers_sn' => $transfers_sn
                    ]);
                    return false;
                }

            }

        } else {
            $geted_reward = 1;
        }

        pdo_insert(getTableName('sharelog'), [
            'uniacid' => $_W['uniacid'],
            'active_id' => $active_id,
            'wechat_id' => $wechat_id,
            'order_sn' => $order_sn,
            'share_time' => TIMESTAMP,
            'geted_reward' => $geted_reward
        ]);

        return true;
    }

    /**
     * 设置校长openid
     */
    public function setPrinc($openid, $active_id) {
        $res = pdo_update($this->tableName, [
            'princ' => $openid
        ], [
            'id' => $active_id
        ]);
        if($res === false) {
            return $this->setInfo(103, '操作失败');
        }
        return true;
    }

    public function getAllGifts() {
        $list = $this->query->from($this->tableName)->select('new_user_gift','old_user_gift')->orderby('id', 'DESC')->getall();
        if(empty($list)) {
            return $list;
        }
        $new = array_column($list, 'new_user_gift');
        $old = array_column($list, 'old_user_gift');
        $gifts = array_merge($new, $old);
        return array_unique($gifts);
    }

}