<?php 
global $_W, $_GPC;
$_W['modulename'] = $this->modulename;
$active_id = $_GPC['pid'];
$oid = $_GPC['oid'];
$rand = $_GPC['rand'];

if(empty($active_id)) {
    message('活动分享内容有误，请重新进入活动分享');
}

if(empty($oid)) {
    message('活动分享内容有误，请重新进入活动分享');
}

if(empty($rand)) {
    message('活动分享内容有误，请重新进入活动分享');
}

$this->assign('active_id', $active_id);
$this->assign('oid', $oid);
$this->assign('rand', $rand);

$this->display('share');