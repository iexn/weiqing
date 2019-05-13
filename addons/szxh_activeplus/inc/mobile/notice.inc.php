<?php 
/**
 * 框架通知函数
 */
guard('wechat');
global $_W, $_GPC;
$et = $_GPC['et'];

/**
 * 分享通知，使用 js_share() 函数调用的通知。
 * 注意：
 * 1. 如果想要分享后的处理步骤，必须在site.php文件类中定义wxshare()方法
 * 2. wxshare方法支持1个参数，里面包含通知地址的一系列参数，重要的是他包括 js_share() 函数传递的所有参数
 */
if($et == 'wx_share') {
    if(method_exists($this, 'wxshare')) {
        $res = $this->wxshare($_GET);
        if($res === false) {
            return $this->result(100, '分享调用失败或未通知成功');
        }
        return $this->result(0, '分享调用成功');
    }
    return;
}

if($et == 'qrcode') {
    output_qrcode($_GPC['value']);
    return;
}