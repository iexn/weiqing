<?php 
global $_W, $_GPC;
$et = $_GPC['et'];

guard('wechat');
guard('shield');

$active_id = $_GPC['pid'];

// 活动信息
$row = logic('Active')->getActive($active_id, false);
if($row === false) {
    message(logic()->getMessage());
}

// 基本信息处理
checkauth();
$version = wx_jssdk();
$_W['page']['title'] = $row['title'];


// 该用户记录数据
if(!empty($_W['fans'])) {
    $wechat_id = $_W['fans']['openid'];
    $nickname  = $_W['fans']['tag']['nickname'];
    $avatar    = $_W['fans']['tag']['avatar'];

    // 浏览人记录
    $viewers_all = model('Active')->setViewer($active_id, $wechat_id, $nickname, $avatar);

    // 获取下单情况，没有为空
    $buyed = false; // 是否已支付过当前活动
    $order = model('Order')->isOrderByWechatId($active_id, $wechat_id);
    if($order['status'] == 2) {
        $buyed = true;
    }

    // 分享人跳转
    if(!empty($order['id'])) {

        // 是否存在oid，如果不存在查询自己的订单ID，跳转到oid为自己的页面
        $url = purl('main', [
            'pid' => $active_id,
            'oid' => $order['id']
        ], false);

        // 已报名的话访问页面不是自己的，跳转到自己的
        if($_GPC['oid'] != $order['id']) {
            tolink($url);
        }

    }

    // 修改分享内容
    $row['second_title'] = logic('Active')->editSecondTitle($row['second_title'], $_GPC['oid'], $row['title']);

}


// 读取浏览人列表
$viewers = logic('Active')->viewers($active_id);

// 读取已下单列表
$regs = logic('Active')->regs($active_id, $row['create_time'], $row['price']);

// 获取排行榜以及获得红包人数
$ranks = logic('Transfers')->ranks($active_id, $row['redpack_show_number']);

// 分享地址
$domainurl = guard('shareUrl');

$this->assign('row', $row);
$this->assign('viewers', $viewers);
$this->assign('regs', $regs);
$this->assign('ranks', $ranks['ranks']);
$this->assign('ranks_count', $ranks['ranks_count']);
$this->assign('buyed', $buyed);
$this->assign('order', $order);
$this->assign('domainurl', $domainurl);
$this->assign('version', $version);
$this->assign('time', $row['outtime']); // 活动到期时间戳
$this->assign('viewers_all', $viewers_all);

$this->display('active_main');
return;