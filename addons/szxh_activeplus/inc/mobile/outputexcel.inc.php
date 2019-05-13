<?php 
global $_W,$_GPC;

// guard('wechat');

$enpid = $_GPC['enpid'];

$pid = decry($enpid);

if(empty($pid)) {
    exit('下载文件错误');
}

if(empty($pid)) {
    exit('数据错误，请刷新后重试');
}

// 获取订单数据
$data = logic('Active')->orderList($pid);
if($data === false) {
    exit(logic('Active')->getMessage());
}

$active = $data['row'];
$list   = $data['orderList'];

// 生成excels数据
$excels = logic()->getExcelList($list);
if($excels === false) {
    exit(logic('Active')->getMessage());
}

// 导出excel
logic()->outputExcel($excels, $active['title']);