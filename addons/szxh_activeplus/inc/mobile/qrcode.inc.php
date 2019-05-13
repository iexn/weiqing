<?php 
global $_W, $_GPC;
$et = $_GPC['et'];

$url = web2app_url('main', [
    'pid' => $_GPC['pid'],
    'oid' => $_GPC['oid']
]);

output_qrcode($url);