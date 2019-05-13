<?php 
global $_W, $_GPC;
$_W['modulename'] = $this->modulename;
$active_id = $_GPC['pid'];
$oid = $_GPC['oid'];


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
