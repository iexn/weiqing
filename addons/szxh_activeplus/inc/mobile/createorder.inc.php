<?php 
global $_W, $_GPC;
$active_id = $_GPC['pid'];
$et = $_GPC['et'];

if(!empty($_W['fans'])) {
    $wechat_id = $_W['fans']['openid'];
    $nickname = $_W['fans']['tag']['nickname'];
    $avatar = $_W['fans']['tag']['avatar'];
} else {
    // message('用户信息获取异常，请重新进入活动');
    return $this->result(20, '用户信息获取异常，请重新进入活动');
}

// 活动信息
$row = logic('Active')->getActive($active_id);
if($row === false) {
    message(logic()->getMessage());
}

// 判断是否是未支付的订单
if(!empty($_POST['order_sn'])) {
    $order = model('Order')->isOrderBySn($_POST['order_sn']);
    if(!$order || $order['wechat_id'] != $wechat_id) {
        // message('订单获取异常，请刷新后重试');
        return $this->result(15, '订单获取异常，请刷新后重试');
    }
    $order_sn = $order['order_sn'];
    $order_price = $order['price'];

} else {

    // 判断提交信息是否正常
    $data = model('Order')->validAdd([
        'name'   => $_POST['name'],
        'mobile' => $_POST['mobile'],
        'type'   => $_POST['type'],
        'price'  => $row['price'],
        'referrals' => $_POST['oid'],
        'referrals_min_reward' => $row['min_get'],
        'referrals_max_reward' => $row['max_get']
    ], $active_id, $wechat_id);

    if(empty($data)) {
        // message(model('Order')->getMessage());
        return $this->result(model('Order')->getCode(), model('Order')->getMessage(), ['err_field'=>model('Order')->getValidField()]);
    }

    $data['active_title'] = $row['title'];

    // 生成订单，返回订单号和订单金额
    $order = model('Order')->create($active_id, $wechat_id, $data);
    if(!$order) {
        // message('创建订单失败，请重新尝试');
        $this->result(16, '创建订单失败，请重新尝试');
    }

    $order_sn = $order['order_sn'];
    $order_price = $order['price'];

}

// 推广员不进行支付直接完成
if($order['type'] == 3) {

    $this->payResult([
        'result' => 'success',
        'tid' => $order_sn
    ]);

    $this->result(0, '报名成功！', ['type' => 3]);
}

// 拉取订单，申请支付

// js支付提供接口
$pay_url = model('Config')->getPayurl();
$this->result(0, '订单创建成功！', ['order_sn'=>$order_sn, 'price'=>$order_price, 'pay_url'=>$pay_url ?: '']);

// php支付跳转
// $this->pay([
//     'tid' => $order_sn,
//     'ordersn' => $order_sn,
//     'title' => $row['title'],
//     'fee' => $order_price
// ]);
