<?php 
global $_W, $_GPC;
$active_id = $_GPC['pid'];
$et = $_GPC['et'];


// 活动信息
$row = logic('Active')->getActive($active_id, false);
if($row === false) {
    message(logic()->getMessage());
}

$serviceuser = logic('ServiceUser')->findRow($row['service_user_id']);

$_W['page']['title'] = $row['title'];

$this->assign('row', $row);
$this->assign('serviceuser', $serviceuser);
$this->display('active_attract');
return;