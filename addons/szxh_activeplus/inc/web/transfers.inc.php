<?php
checklogin();

global $_W, $_GPC;
$_W['page']['title'] = '返利记录';
$et = $_GPC['et'];

// 补发
if ($et == 9) {
    $logic = logic('Transfers');
    $logic->resendReward($_GPC['transfers_sn']);
    $this->result($logic->getCode(), $logic->getMessage());
    return;
}

// 导出excel
if ($et == 14) {
    // 获取数据
    $data = logic('Transfers')->transfersList([
        'order_sn' => $_GPC['order_sn'],
        'send_type' => $_GPC['send_type'],
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
    logic()->outputExcel($excels, $active['title']);

    return;
}

$data = logic('Transfers')->index($_GPC['page'], [
    'order_sn' => $_GPC['order_sn'],
    'send_type' => $_GPC['send_type'],
    'title' => $_GPC['title'],
    'start' => $_GPC['time']['start'],
    'end' => $_GPC['time']['end'],
]);
$this->assign('list', $data['list']);
$this->assign('page', $data['page']);
$this->display('transfers');
return;
