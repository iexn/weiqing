<?php 
namespace szxh;

class Guard {

    public static function wechat() {
        if(strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') == false) {
            $html = '';
            $html .= '<head><title>抱歉，出错了</title><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0"><link rel="stylesheet" type="text/css" href="https://res.wx.qq.com/open/libs/weui/0.4.1/weui.css"></head>';
            $html .= '<body><div class="weui_msg"><div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div><div class="weui_text_area"><h4 class="weui_msg_title">请在微信客户端打开链接</h4></div></div></body>';
            echo $html;
            exit;
        }
        return true;
    }

    public static function shield($tolink = true) {
        // 获取防屏蔽配置，返回以上内容，均为数组
        $shield = model('Shield')->findRow();
        
        // 未开启功能时
        if($shield['status'] != 1) {
            return true;
        }

        $shield['domain_bl'] = explode("\r\n", $shield['domain_bl']);
        $shield['domain_wl'] = explode("\r\n", $shield['domain_wl']);
        $shield['shield_url'] = explode("\r\n", $shield['shield_url']);

        $servername = servername();
        
        // 黑名单验证
        if(in_array($servername, $shield['domain_bl'])) {
            tolink('about blank');
        }

        // 白名单验证
        if(in_array($servername, $shield['domain_wl'])) {
            return true;
        }
        
        // 可以更改域名，获取主域名
        $domain = domain($servername); // domain.com
        
        // 地址栏内容
        $route = servername(true);

        // 添加域名之后的所有参数
        $route .= $_SERVER['REQUEST_URI'];
        if(strpos($route, 'wxref=mp.weixin.qq.com')) {
            $route = str_replace('wxref=mp.weixin.qq.com', '', $route);
        }

        if(strpos($route, $shield['shield_url'][0]) !== false) {
            return true;
        }

        // 修改2级、3级域名
        $domain = random(5) .'.'. $shield['shield_url'][0];

        // 替换域名内容
        $routeTo = str_replace($servername, $domain, $route);

        if($route == $routeTo) {
            return true;
        }

        if($tolink) {
            tolink($routeTo);
        }

        return $routeTo;
    }

    public static function shareUrl() {
        // 获取分享用权限
        $shield = model('Shield')->findRow();

        // 是否开启防屏蔽
        if($shield['status'] == 1) {
            // 获取分享主域名页面地址
            $route = 'http://'. $shield['share_url'];
        } else {
            $route = servername(true);
        }

        // 添加域名之后的所有参数
        $route .= address();
        
        return wxref($route);
    }

}