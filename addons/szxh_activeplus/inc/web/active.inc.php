<?php

/**
 * ------------------------
 * 活动管理模块 2 4 5 6 8 9 10
 * ------------------------
 */

// 验证后台登录
checklogin();
global $_W, $_GPC;
$_W['page']['title'] = '活动管理';
$et = $_GPC['et'];

/**
 * 编辑界面
 */
if ($et == 2) {
    $data = logic('Active')->saveData($_GPC['pid'] ?: $_GPC['copyid']);
    if ($data === false) {
        message(logic()->getMessage(), logic()->getUrl());
    }
    if (empty($_GPC['pid'])) {
        unset($data['row']['id']);
    }
    $this->assign('row', $data['row']);
    $this->assign('activeCates', $data['activeCates']);
    $this->assign('serviceUsers', $data['serviceUsers']);
    $this->assign('gifts', $data['gifts']);
    $this->display('active_update');
    return;
}

/**
 * 删除活动
 */
if ($et == 4) {
    logic('Active')->delete($_GPC['id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

/**
 * 添加
 */
if ($et == 5) {
    $params = logic('Active')->getSaveParams($_POST);
    logic()->save($params, $_POST['id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

/**
 * 订单列表
 */
if ($et == 6) {

    $data = logic('Active')->orderList($_GPC['pid'], $_GPC['page']);
    if ($data === false) {
        message(logic()->getMessage(), logic()->getUrl());
    }

    $this->assign('row', $data['row']);
    $this->assign('orderList', $data['orderList']);
  	$this->assign('page', $data['page']);
    $this->display('active_order');
    return;
}

/**
 * 删除订单
 */
if ($et == 8) {
    logic('Active')->deleteOrder($_GPC['id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

/**
 * 补发奖励
 */
if ($et == 9) {
    logic('Active')->resendReward($_GPC['order_sn']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

/**
 * 显示二维码
 */
if ($et == 10) {
    global $_W;
    $url = qrurl($_GPC['pid']);
    load()->library('qrcode');
    echo Qrcode::png($url);
    return $url;
}

/**
 * 输出资源地址
 */
if ($et == 13) {
    $this->result(0, '开始设计', ['path' => tomedia($_POST['src'])]);
    return;
}

/**
 * 导出excel
 */
if ($et == 14) {

    // 获取订单数据
    $data = logic('Active')->orderList($_GPC['pid']);
    if ($data === false) {
        message(logic()->getMessage(), logic()->getUrl());
    }

    $active = $data['row'];
    $list = $data['orderList'];

    // 生成excels数据
    $excels = logic()->getExcelList($list);
    if ($excels === false) {
        message(logic()->getMessage(), logic()->getUrl());
    }

    // 导出excel
    logic()->outputExcel($excels, $active['title']);

    return;
}

// 指定用户类型：1普通用户、2校长
if ($et == 15) {
    logic('Active')->setPrinc($_GPC['wechat_id'], $_GPC['type'], $_GPC['active_id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

// 校长返利列表
if ($et == 16) {
    $data = logic('Transfers')->index($_GPC['page'], [
        'order_sn' => $_GPC['order_sn'],
        'send_type' => 3,
        'active_id' => $_GPC['pid'],
        'title' => $_GPC['title'],
        'start' => $_GPC['time']['start'],
        'end' => $_GPC['time']['end'],
    ]);
    $this->assign('list', $data['list']);
    $this->assign('page', $data['page']);
    $this->display('transfers_princ');
    return;
}

// 导出校长返利记录
if($et == 17) {
    // 获取数据
    $data = logic('Transfers')->transfersList([
        'order_sn' => $_GPC['order_sn'],
        'send_type' => 3,
        'active_id' => $_GPC['pid'],
        'title' => $_GPC['title'],
        'start' => $_GPC['time']['start'],
        'end' => $_GPC['time']['end'],
    ]);
    if ($data === false) {
        message(logic()->getMessage(), logic()->getUrl());
    }

    $active = $data['row'];
    $list = $data['transfersList'];

    // 生成excels数据
    $excels = logic()->getTransfersExcelList($list);
    if ($excels === false) {
        message(logic()->getMessage(), logic()->getUrl());
    }

    // 导出excel
    logic()->outputExcel($excels, '【校长】'.$active['title']);

    return;
}

//-----------------------------------------

$data = logic('Active')->index($_GPC['page'], [
    'uid' => $_GPC['uid'],
    'active_id' => $_GPC['active_id'],
    'title' => $_GPC['title'],
]);

$this->assign('list', $data['list']);
$this->assign('page', $data['page']);
$this->assign('services', $data['services']);

$this->display('active_list');
return;
