<?php
/**
 * szxh_activeplus模块APP接口定义
 *
 * @author 三只小猴拓客
 * @url 
 */
defined('IN_IA') or exit('Access Denied');

class Szxh_activeplusModulePhoneapp extends WeModulePhoneapp {
	public function doPageTest(){
		global $_GPC, $_W;
		$errno = 0;
		$message = '返回消息';
		$data = array();
		return $this->result($errno, $message, $data);
	}
	
	
}