<?php
/**
 * szxh_activeplus熊掌号接口定义
 *
 * @author 三只小猴拓客
 * @url 
 */
defined('IN_IA') or exit('Access Denied');

class Szxh_activeplusModuleXzapp extends WeModuleXzapp {
	public function doPageTest(){
		global $_GPC, $_W;
		// 此处开发者自行处理
		include $this->template('test');
	}

}