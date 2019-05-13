<?php
/**
 * szxh_activeplus支付宝小程序接口定义
 *
 * @author 三只小猴拓客
 * @url 
 */
defined('IN_IA') or exit('Access Denied');

class Szxh_activeplusModuleAliapp extends WeModuleAliapp {
	public function doPageTest(){
		global $_GPC, $_W;
		// 此处开发者自行处理
		include $this->template('test');
	}
}