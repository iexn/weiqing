<?php 

/**
 * ------------------------
 * 新建活动模块
 * ------------------------
 */

// 验证后台登录
checklogin();

global $_W, $_GPC;
$_W['page']['title'] = '新建活动';
$et = $_GPC['et'];

/**
 * 添加
 */
if($et == 5) {
    $params = logic('Active')->getSaveParams($_POST);

    logic()->save($params, $_POST['id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}


// ----------------------


$data = logic('Active')->saveData($_GPC['pid']);
if($data === false) {
    message(logic()->getMessage(), logic()->getUrl()); 
}

$this->assign('row', $data['row']);
$this->assign('activeCates', $data['activeCates']);
$this->assign('serviceUsers', $data['serviceUsers']);

$this->display('active_update');
return;