<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>微擎 - 公众平台自助引擎 -  Powered by WE7.CC</title>
    <meta name="keywords" content="<?php if(empty($_W['page']['copyright']['keywords'])): if(IMS_FAMILY != 'x'): ?>微擎,微信,微信公众平台,we7.cc<?php endif; else: echo ($_W['page']['copyright']['keywords']); endif; ?>" />
    <meta name="description" content="<?php if(empty($_W['page']['copyright']['description'])): if(IMS_FAMILY != 'x'): ?>公众平台自助引擎（www.we7.cc），简称微擎，微擎是一款免费开源的微信公众平台管理系统，是国内最完善移动网站及移动互联网技术解决方案。<?php endif; else: echo ($_W['page']['copyright']['description']); endif; ?>" />
    <link rel="shortcut icon" href="<?php if(!empty($_W['setting']['copyright']['icon'])): echo ($_W['attachurl']); echo ($_W['setting']['copyright']['icon']); else: ?>./resource/images/favicon.ico<?php endif; ?>" />
    <link href="./resource/css/bootstrap.min.css?v=20170426" rel="stylesheet">
    <link href="./resource/css/common.css?v=20170426" rel="stylesheet">
    <script type="text/javascript">
    if(navigator.appName == 'Microsoft Internet Explorer'){
        if(navigator.userAgent.indexOf("MSIE 5.0")>0 || navigator.userAgent.indexOf("MSIE 6.0")>0 || navigator.userAgent.indexOf("MSIE 7.0")>0) {
            alert('您使用的 IE 浏览器版本过低, 推荐使用 Chrome 浏览器或 IE8 及以上版本浏览器.');
        }
    }
    window.sysinfo = {
        <?php if(!empty($_W['uniacid'])): ?>'uniacid': '<?php echo ($_W['uniacid']); ?>',<?php endif; ?>
        <?php if(!empty($_W['acid'])): ?>'acid': '<?php echo ($_W['acid']); ?>',<?php endif; ?>
        <?php if(!empty($_W['openid'])): ?>'openid': '<?php echo ($_W['openid']); ?>',<?php endif; ?>
        <?php if(!empty($_W['uid'])): ?>'uid': '<?php echo ($_W['uid']); ?>',<?php endif; ?>
        'isfounder': <?php if(empty($_W['isfounder'])): ?>1<?php else: ?>0<?php endif; ?>,
        'family': '{IMS_FAMILY}',
        'siteroot': '<?php echo ($_W['siteroot']); ?>',
        'siteurl': '<?php echo ($_W['siteurl']); ?>',
        'attachurl': '<?php echo ($_W['attachurl']); ?>',
        'attachurl_local': '<?php echo ($_W['attachurl_local']); ?>',
        'attachurl_remote': '<?php echo ($_W['attachurl_remote']); ?>',
        'module' : {
            'url' : '<?php if(defined('MODULE_URL')): echo (MODULE_URL); endif; ?>', 'name' : '<?php if(defined('IN_MODULE')): echo (IN_MODULE); endif; ?>'
        },
        'cookie' : {
            'pre': '<?php echo ($_W['config']['cookie']['pre']); ?>'
        },
        'account' : <?php echo json_encode($_W['account']);?>,
        'server' : {
            'php' : '<?php echo phpversion();?>'
        },
    };
    </script>
    <script>var require = { urlArgs: 'v=20170426' };</script>
    <script type="text/javascript" src="./resource/js/lib/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="./resource/js/lib/bootstrap.min.js"></script>
    <script type="text/javascript" src="./resource/js/app/util.js?v=20170426"></script>
    <script type="text/javascript" src="./resource/js/app/common.min.js?v=20170426"></script>
    <script type="text/javascript" src="./resource/js/require.js?v=20170426"></script>
</head>
<body>
    <p><?php echo tpl_form_field_emoji('name');?></p>
    <p><?php echo tpl_form_field_color('name');?></p>

</body>
</html>