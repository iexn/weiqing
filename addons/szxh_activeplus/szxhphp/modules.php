<?php 

$dir = __DIR__;
$json_path = $dir. '/szxh_package.json';
$packages_json = file_get_contents($json_path);

if(empty($packages_json)) {
    $packages_json = '{}';
    // 创建szxh_package.json文件
}

$packages = json_decode($packages_json, true);


file_put_contents($json_path, $packages);