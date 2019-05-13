<?php 

// 验证后台登录
checklogin();

global $_W, $_GPC;
$_W['page']['title'] = '系统设置';
$et = $_GPC['et'];

// 保存设置
if($et == 5) {
    logic('Config')->saveShield([
        'status'     => $_POST['status'],
        'pay_url'    => $_POST['pay_url'],
        'share_url'  => $_POST['share_url'],
        'shield_url' => $_POST['shield_url'],
        'domain_wl'  => $_POST['domain_wl'],
        'domain_bl'  => $_POST['domain_bl']
    ]);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}


if(ip2long(servername()) !== false) {
    message('请使用域名网址登录后进行操作');
}

$row = model('Shield')->findRow($_W['uniacid'], MNAME);

$this->assign('domain', domain(servername()));
$this->assign('row', $row);
$this->display('config');