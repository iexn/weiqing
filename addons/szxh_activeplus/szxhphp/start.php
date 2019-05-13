<?php 
namespace szxh;
/**
 * @author iexn
 * @version 1.2.0
 * @time 2018-08-15 15:24:30
 * @link https://gitee.com/tianjin_onfinger/w7_scaffold
 */


// 框架版本号
define('MVERSION', '1.2.0');

if(defined('_DIR_')) {
    $dir = _DIR_ . '/szxhphp';
} else {
    $dir = __DIR__;
}
$modulename = basename(dirname($dir));
$prefix = 'szxh_';

if(!defined('DS')) {
    define('DS', DIRECTORY_SEPARATOR);
}

if(!defined('TEMPLATE')) {
    define('TEMPLATE', 'W7');
}

// 框架根目录   szxhphp/
define('MFRAME', $dir);

// 模块根目录   szxh_xxxx/
define('MROOT', $dir. '/..');

// 模块名  szxh_xxxx
define('MNAME', $modulename);

// 获取应用真实名  xxxx
$modulename = strtolower($modulename);
if(strpos($modulename, $prefix) === 0) {
    $modulename = substr($modulename, strlen($prefix));
}

// 系统表前缀 szxh_
define('M_SYSTEM_PREFIX', $prefix);

// 表前缀名   szxh_xxxx
define('MPREFIX', $prefix. $modulename. '_');

// app端访问静态资源路径
define('WEB_RESOURCE', $_W['siteroot'].'addons/'. MNAME .'/resource');

// 系统静态资源路径，不同网站和app端对应不同的资源路径
define('SYSTEM_RESOURCE', './resource');

// 模版引擎 THINK 和 WE7，默认THINK。WE7为系统默认引擎
define('TEMPLATE_TYPE', 'THINK');

// 加载框架
include $dir.'/library/Szxh.php';