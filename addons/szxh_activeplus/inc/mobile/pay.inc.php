<?php
global $_W, $_GPC;
$et = $_GPC['et'];

$active_id = $_GPC['pid'];

guard('wechat');
wx_jssdk();
checkauth();

// 活动信息
$row = logic('Active')->getActive($active_id);
if($row === false) {
    message(logic()->getMessage());
}

$order = model('Order')->isOrderBySn($_GET['order_sn']);

// 已支付返回主页
if($order['status'] == 2) {
    echo '<script>history.back();</script>';exit;
}

$this->assign('row', $row);
$this->assign('order_sn', $order['order_sn']);
$this->assign('pay_sn', !empty($order['order_sn']) ? $order['order_sn'] . '_' . random(5) : '');
$this->assign('price', $order['price']);

$this->display('pay');
return;