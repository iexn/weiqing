<?php
/**
 * szxh_activeplus模块微站定义
 *
 * @author 三只小猴拓客
 * @url 
 */
defined('IN_IA') or exit('Access Denied');

include __DIR__. '/szxhphp/start.php';

class Szxh_activeplusModuleSite extends szxh\szxh {


	/**
     * 支付成功处理逻辑
     */
    public function payResult($ret) {
        global $_W;
        
        // model('Log')->add('payResult参数示例', json_encode($ret));
        // 成功支付
        if ($ret['result'] == 'success') {

            $ret['tid'] = explode('_', $ret['tid'])[0];

            $order = model('Order')->isOrderBySn($ret['tid']);

            if(empty($order)) { 
                message('订单信息获取失败，请联系管理员处理');
            }

            if($order['status'] != 1) {
                message('订单已支付过');
            }

            // 已处理过的订单
            if($order['complete_time'] != 0) {
                message('订单已完成');
            }



            // 1. 修改订单支付状态，将订单状态改为已完成
            model('Order')->saveBuyed($order['order_sn']);

            // 2. 记录当前活动报名人数，人数+1
            model('Active')->saveBuyed($order['active_id']);

            // 3. 如果有推荐人的话，给推荐人返钱，钱的数额和推荐人ID从订单表中获取   不能为推广员报名的订单
            if($order['referrals_wechat_id'] != '' && $order['type'] != 3) {

                $transfers_sn = model('Order')->transfers($order);
            }

            // 给校长返钱
            if($order['type'] != 3) {
                model('Order')->princTransfers($order, $transfers_sn);
            }

        }

        parent::payResult($ret);
    }
    
    public function wxshare($params) {
        global $_W, $_GPC;
        $_W['modulename'] = $this->modulename;
        $active_id = $params['pid'];
        $oid = $params['oid'];


        checkauth();

        if(empty($active_id)) {
            message('未选择活动');
        }


        if(!empty($_W['fans'])) {
            $openid = $_W['fans']['openid'];
            $nickname = $_W['fans']['tag']['nickname'];
            $avatar = $_W['fans']['tag']['avatar'];
        } else {
            // message('用户信息获取异常，请重新进入活动');
            return message('用户信息获取异常，请重新进入活动');
        }

        // 活动信息
        $row = logic('Active')->getActive($active_id);
        if($row === false) {
            message(logic()->getMessage());
        }

        if($row['design_status'] != 2) {
            return message('未找到相关分享内容');
        }

        $order = model('Order')->isOrderById($oid);

        // 返回已分享次数
        $res = model('Active')->recodeShareLog($row, $openid, $order['order_sn']);
        

    }
	

}