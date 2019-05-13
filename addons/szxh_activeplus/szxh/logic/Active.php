<?php 
namespace szxh\logic;

class Active extends Common {

    public function getSaveParams($post = []) {
        return [
            'status'              => $_POST['status'],
            'active_cate_id'      => $_POST['active_cate_id'],
            'title'               => $_POST['title'],
            'cover'               => $_POST['cover'],
            'price'               => $_POST['price'],
            'min_get'             => $_POST['min_get'],
            'max_get'             => $_POST['max_get'],
            'service_user_id'     => $_POST['service_user_id'],
            'content'             => $_POST['content'],
            'end_time'            => $_POST['end_time'],
            'second_title'        => $_POST['second_title'],
            'planner'             => $_POST['planner'],
            'inst'                => $_POST['inst'],
            'school'              => $_POST['school'],
            'consignee'           => $_POST['consignee'],
            'consignee_mobile'    => $_POST['consignee_mobile'],
            'consignee_addr'      => $_POST['consignee_addr'],
            'goods'               => $_POST['goods'],
            'service_tel'         => $_POST['service_tel'],
            'bgm'                 => $_POST['bgm'],
            'attract'             => $_POST['attract'],
            'redpack_status'      => $_POST['redpack_status'],
            'redpack_ispay'       => $_POST['redpack_ispay'],
            'redpack_type'        => $_POST['redpack_type'],
            'redpack_name'        => $_POST['redpack_name'],
            'redpack_sender'      => $_POST['redpack_sender'],
            'redpack_wishing'     => $_POST['redpack_wishing'],
            'redpack_remark'      => $_POST['redpack_remark'],
            'transfers_remark'    => $_POST['transfers_remark'],
            'design_img'          => $_POST['design_img'],
            'design_status'       => $_POST['design_status'],
            'design'              => $_POST['design'],
            'redpack_show_number' => $_POST['redpack_show_number'],
            'buyer_show_number'   => $_POST['buyer_show_number'],
            'share_reward_count'  => $_POST['share_reward_count'],
            'share_reward'        => $_POST['share_reward'],
            'princ_reward'        => $_POST['princ_reward'],
            'new_user_gift'       => $_POST['new_user_gift'],
            'old_user_gift'       => $_POST['old_user_gift'],
            'attract_status'      => $_POST['attract_status'],
            'attract_title'       => $_POST['attract_title'],
            'attract_type'        => $_POST['attract_type'],
            'attract_value_link'  => $_POST['attract_value_link'],
            'attract_value_custom'=> $_POST['attract_value_custom'],
            'is_cav'              => $_POST['is_cav']
        ];
    }

    public function save($data, $id = false) {
        $id = $id ?: false;

        // 验证数据是否完整
        $data = model('Active')->validSave($data, $id);
        if($data === false) {
            return $this->setInfo(model('Active')->getCode(), model('Active')->getMessage());
        }

        $res = model('Active')->saveRow($data, $id);
        if($res === false) {
            return $this->setInfo(1099, '服务器异常，请稍后再试');
        }

        return $this->setInfo(0, '保存成功');
    }

    public function delete($ids) {
        $this->modelname = 'Active';
        return parent::delete($ids);
    }

    public function deleteOrder($ids) {
        $this->modelname = 'Order';
        return parent::delete($ids);
    }

    public function resendReward($order_sn) {
        if(empty($order_sn)) {
            return $this->setInfo(110, '订单号不存在');
        }
        $order = model('Order')->isOrderBySn($order_sn);
        if(empty($order)) {
            return $this->setInfo(111, '当前订单不存在');
        }
        if($order['status'] != 2) {
            return $this->setInfo(112, '订单未成功付款');
        }
        if($order['referrals_wechat_id'] == '') {
            return $this->setInfo(113, '该订单没有推荐人，发放失败');
        }
        if($order['referrals_wechat_id'] == $order['wechat_id']) {
            return $this->setInfo(114, '推荐人不能为下单人本身，发放失败');
        }
        if($order['referrals_reward_status'] != 2) {
            return $this->setInfo(115, '当前红包状态正常，不能进行补发');
        }
        // 开始补发
        $res = model('Order')->transfers($order);
        if($res !== true) {
            return $this->setInfo(116, '发放失败:'.$res);
        }
        return $this->setInfo(0, '发放成功');
    }


    public function cate($pid = false) {
        if(empty($pid)) {
            $pid = false;
        }

        // 判断是否为修改，读取数据
        if($pid !== false) {
            $row = model('Cate')->findRow($pid);
            if(empty($row)) {
                // 数据异常返回到列表页
                return $this->setInfo(100, '数据不存在，请返回刷新页面。', aurl());
            }
        }

        return [
            'row' => $row
        ];
    }

    public function index($page, $condition = []) {
        $list = model('Active')->getList($page, $condition);

        if(empty($list)) {
            $list = [];
        }

        foreach ($list as &$item) {
            $recode = model('Order')->getStatisticFromAct($item['id']);
            $item['new'] = $recode['new_count'];
            $item['old'] = $recode['old_count'];
            $item['all'] = $recode['new_count'] + $recode['old_count'];
        }

        // 数据分页
        $page = model('Active')->lastPageHtml();

        return [
            'list' => $list,
            'page'     => $page,
            'services' => model('ServiceUser')->getList(false)
        ];

    }

    /**
     * 添加/修改页面数据
     */
    public function saveData($pid = false) {
        
        $pid = $pid ?: false;
        
        // 判断是否为修改，读取数据
        if($pid !== false) {
            $row = model('Active')->findRow($pid);
            if(empty($row)) {
                // 数据异常返回到列表页
                return $this->setInfo(102, '数据不存在，请返回刷新页面。', aurl());
            }
        } else {
            $row = [];
        }

        $activeCates = model('Cate')->getList();
        $serviceUsers = model('ServiceUser')->getList(false);
        $gifts = model('Active')->getAllGifts();

        return [
            'row'          => $row,
            'activeCates'  => $activeCates,
            'serviceUsers' => $serviceUsers,
            'gifts'        => $gifts
        ];

    }

    /**
     * 活动订单列表
     */
    public function orderList($active_id, $page = false) {

        if(empty($active_id)) {
            return $this->setInfo(104, '活动异常，请尝试其他链接进入.');
        }

        // 读取活动数据
        $row = model('Active')->findRow($active_id);
        if(empty($row)) {
            return $this->setInfo(105, '活动异常，请尝试其他链接进入..');
        }

        // 读取订单数据
        $orderList = model('Order')->getList($active_id, $page);

        return [
            'row' => $row,
            'orderList' => $orderList,
            'page' => model('Order')->getPageHtml()
        ];

    }



    /**
     * 数据数组修改为导出excel顺序
     */
    public function getExcelList($list) {
        $excels = [];
        foreach ($list as $item) {
            $user = mc_fansinfo($item['wechat_id']);
            $ref = mc_fansinfo($item['referrals_wechat_id']);
            $excels[] = [
                'order_sn' => 'A'.$item['order_sn'],
                'price'    => $item['price'],
                // 'nickname' => $user['tag']['nickname'],
                'name'     => $item['name'],
                'type'     => order_user_type($item['type']),
                'mobile'   => $item['mobile'],
                'ref'      => $item['referrals_wechat_id'] == '' ? '---' : $ref['tag']['nickname'],
                'pay_type' => strip_tags(payName($item['status'])),
                'time'     => date('Y-m-d H:i:s', $item['create_time']),
                // 'reward' => ($item['referrals_wechat_id'] == '' || $item['type'] == 3) ? '---' : $item['referrals_reward'],
                // 'reward_status' => ($item['referrals_wechat_id'] == '' || $item['type'] == 3) ? '---' : strip_tags(rewardsn($item['referrals_reward_status']))
            ];
        }
        return $excels;
    }

    /**
     * 导出活动excel，必须有$excels顺序数据和标题
     */
    public function outputExcel($excels, $title) {
        $filename = $title.'活动订单'.date("Ymd_H_i");
        $headname = $title.'活动订单（截止于'.date("Y-m-d H:i").'）';
        $fileheader = ['订单号','金额',/*'微信昵称',*/'真实姓名','类型','手机号','推荐人昵称','支付状态','购买时间'];
        getExcel($filename, $headname, $fileheader, $excels);
        exit;
    }

    public function getActive($active_id, $checkOuttime = true) {

        if(empty($active_id)) {
            return $this->setInfo(104, '活动异常，请尝试其他链接进入');
        }

        // 读取数据
        $row = model('Active')->findRow($active_id);

        if(empty($row)) {
            return $this->setInfo(100, '活动异常，请尝试其他链接进入');
        }

        // status必须为2才能打开
        if($row['status'] == 1) {
            return $this->setInfo(101, '活动正在审核中');
        }

        if($row['status'] == 3) {
            return $this->setInfo(102, '活动已关闭');
        }

        if($row['status'] != 2) {
            return $this->setInfo(103, '活动异常，请尝试其他链接进入');
        }

        $time = $row['end_time'] - TIMESTAMP;

        if($checkOuttime && $time < 0) {
            return $this->setInfo(104, '活动已结束');
        }

        $row['outtime'] = $time;

        return $row;
    }

    public function viewers($active_id) {
        $viewers = model('Active')->viewers($active_id);
        $viewers = robot($viewers, 'view', $active_id, 'appendlist', 27 - count($viewers), [
            'avatar' => ['replace', 'avatar'],
            'name'   => ['replace', 'nickname']
        ]);
        return $viewers;
    }

    /**
     * 已购列表，添加机器人create_time活动创建时间，price活动价格
     */
    public function regs($active_id, $create_time = false, $price = false) {
        $regs = model('Active')->registers($active_id, true);
        $regs = robot($regs, 'order', $active_id, 'appendlist', 10, [
            'nickname'    => ["replace", "nickname"],
            'avatar'      => ["replace", "avatar"],
            'create_time' => ["time", $row['create_time']],
            'price'       => ["value", $row['price']]
        ]);
        return $regs;
    }

    /**
     * 修改分享标题
     */
    public function editSecondTitle($second_title, $oid, $title) {
        // 分享人订单
        $order_o = model('Order')->isOrderById($oid);
        $share_name = $order_o['name'];
        $fans_o = userinfo($order_o['wechat_id']);
        $nickname = $fans_o['nickname'];


        // 修改分享小标题，分享人和下单姓名替换
        if(empty($second_title)) {
            $second_title = '我是%NAME%，我正在参加%TITLE%活动，快来加入我们吧~';
        }
        $second_title = str_replace('%TITLE%', $title, $second_title);
        $second_title = str_replace('%USER%', $nickname, $second_title);
        $second_title = str_replace('%NAME%', $share_name, $second_title);

        return $second_title;
    }

    
    /**
     * 设置/取消校长身份，1取消  2设置
     */
    public function setPrinc($wechat_id, $type, $active_id) {

        // 获取活动
        $active = model('Active')->findRow($active_id);
        if(empty($active)) {
            return $this->setInfo(108, '该活动不存在');
        }

        // 获取订单
        $order = model('Order')->isOrderByWechatId($active_id, $wechat_id);
        if(empty($order)) {
            return $this->setInfo(106, '该用户没有报名活动，无法指定校长');
        }
        if($order['status'] != 2) {
            return $this->setInfo(107, '该用户没有支付，无法指定校长');
        }

        $princ = $order['wechat_id'];
        if($type == 2) { // 设置校长，否则全为取消
            $res = model('Active')->setPrinc($princ, $active['id']);
        } else if($active['princ'] == $princ) {
            $res = model('Active')->setPrinc('', $active['id']);
        } else {
            return $this->setInfo(117, '设置成功');
        }

        if($res === false) {
            return $this->setInfo(model()->getCode(), model()->getMessage());
        }

        return $this->setInfo(0, '设置成功');

    }

}