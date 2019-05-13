<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>微擎 - 公众平台自助引擎 -  Powered by WE7.CC</title>
    <link href="./resource/css/bootstrap.min.css?v=20170426" rel="stylesheet">
    <link href="./resource/css/common.css?v=20170426" rel="stylesheet">
    <script type="text/javascript">
        window.sysinfo = <?php echo json_encode($sysinfo);?>
    </script>
    <script type="text/javascript" src="../addons/szxh_list/Public/library/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="./resource/js/lib/bootstrap.min.js"></script>
    <script type="text/javascript" src="./resource/js/app/util.js?v=20170426"></script>
    <script type="text/javascript" src="./resource/js/app/common.min.js?v=20170426"></script>
    <script src="../addons/szxh_list/Public/require.min.js"></script>
    <script src="../addons/szxh_list/Public/config.js"></script>
</head>
<body>
    <?php echo tpl_form_field_emoji('name');?>
    <script type="text/javascript">
        require([], function() {
           util.image();
        })

    </script>
</body>
</html>