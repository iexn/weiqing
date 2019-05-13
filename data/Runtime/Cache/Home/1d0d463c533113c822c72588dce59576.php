<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>活动统计</title>
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/fontawesome/css/all.css">
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/daterangepicker/daterangepicker.css">
    <link href="./resource/css/common.css?v=201809180005" rel="stylesheet">
    <style>
        .uploader-modal{z-index: 1070}
    </style>
    <script type="text/javascript">
    if(navigator.appName == 'Microsoft Internet Explorer'){
        if(navigator.userAgent.indexOf("MSIE 5.0")>0 || navigator.userAgent.indexOf("MSIE 6.0")>0 || navigator.userAgent.indexOf("MSIE 7.0")>0) {
            alert('您使用的 IE 浏览器版本过低, 推荐使用 Chrome 浏览器或 IE8 及以上版本浏览器.');
        }
    }
    window.sysinfo = {
        'uniacid': '2',
        'acid': '2',
        'uid': '1',
        'isfounder': 1,
        'family': 'v',
        'siteroot': 'http://www.hjjhj.com/',
        'siteurl': 'http://www.hjjhj.com/web/index.php?c=site&a=entry&eid=48&version_id=0',
        'attachurl': 'http://wq.hjjhj.com/',
        'attachurl_local': 'http://www.hjjhj.com/attachment/',
        'attachurl_remote': 'http://wq.hjjhj.com/',
        'module' : {'url' : 'http://www.hjjhj.com/addons/szxh_rptouke/', 'name' : 'szxh_rptouke'},
        'cookie' : {'pre': '0a52_'},
        'account' : {"acid":"2","uniacid":"2","token":"BVkkg1eLJGLZeDrDhF0r6mpwVr1HLzGH","encodingaeskey":"HGxlLfLwMwxr43y3D4glLYFf3uZ5c30zfldoc3XgkX5","level":"4","name":"u624du827au5c11u5e74u4e4bu5bb6","account":"","original":"gh_14747d3fdaec","signature":"","country":"","province":"","city":"","username":"","password":"","lastupdate":"0","key":"wx41fe70a25e3642de","secret":"b6418774760f4a25751977d1ec6201a2","styleid":"0","subscribeurl":"","auth_refresh_token":"","encrypt_key":"wx41fe70a25e3642de","hash":"P0X7x9Xe","type":"1","isconnect":"1","isdeleted":"0","endtime":"0","groupid":"0","description":"","default_acid":"2","rank":null,"title_initial":"C","type_sign":"account","starttime":"1536119553","groups":{"2":{"groupid":"2","uniacid":"2","title":"u9ed8u8ba4u4f1au5458u7ec4","credit":"0","isdefault":"1"}},"setting":{"uniacid":"2","passport":"","oauth":{"host":"http://cysn.ewwew.com","account":"2"},"jsauth_acid":"2","uc":"","notify":"","creditnames":{"credit1":{"title":"u79efu5206","enabled":1},"credit2":{"title":"u4f59u989d","enabled":1}},"creditbehaviors":{"activity":"credit1","currency":"credit2"},"welcome":"","default":"","default_message":"","payment":{"wechat":{"recharge_switch":"false","pay_switch":"false","switch":"1","has_config":"true","recharge_set":"true","support_set":"false","version":"2","mchid":"1440284302","account":"2","apikey":"w2jvtrqcmgnx2fszb4cluh501udl4plg","signkey":"w2jvtrqcmgnx2fszb4cluh501udl4plg"},"wechat_refund":{"switch":"1","cert":"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","key":"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"}},"stat":"","default_site":"2","sync":"0","recharge":"","tplnotice":"","grouplevel":"0","mcplugin":"","exchange_enable":"0","coupon_type":"0","menuset":"","statistics":"","bind_domain":"","comment_status":"0","reply_setting":"0","default_module":"","attachment_limit":null,"attachment_size":0},"grouplevel":"0","logo":"http:\/\/wq.hjjhj.com\/headimg_2.jpg?time=1542713247","qrcode":"http:\/\/wq.hjjhj.com\/qrcode_2.jpg?time=1542713247","type_name":"\u516c\u4f17\u53f7","switchurl":".\/index.php?c=account&a=display&do=switch&uniacid=2","setmeal":{"uid":"9","username":"u4e3bu7ba11","groupid":"2","groupname":"u4e3bu7ba1","timelimit":"2018-09-05 ~ u65e0u9650u5236"}},
        'server' : {'php' : '5.6.38'},
    };
    </script>
    <script>var require = { urlArgs: 'v=201809180005' };</script>
    <script type="text/javascript" src="./resource/js/lib/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="./resource/js/lib/bootstrap.min.js"></script>
    <script type="text/javascript" src="./resource/js/app/util.js?v=201809180005"></script>
    <script type="text/javascript" src="./resource/js/app/common.min.js?v=201809180005"></script>
    <script type="text/javascript" src="./resource/js/require.js?v=201809180005"></script>
</head>

<body>

    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="container">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                            aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">统计端</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li <?php if(cna('Index/index')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Index/index');?>">活动统计列表</a></li>
                            <li <?php if(cna('Index/user')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Index/user');?>">客服统计列表</a></li>
                            <li <?php if(cna('Send/index')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Send/index');?>">发货管理列表</a></li>
                            <li <?php if(cna('Gift/index')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Gift/index');?>">发货统计</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="<?php echo url('module/display');?>" target="_blank">返回微擎</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div style="margin-top:40px;padding:25px">
        

<form class="form">
    <table class="table table-hover">
        <tr>
            <th>#</th>
            <th>ID</th>
            <th>礼品名称</th>
            <th>应发总量</th>
            <th>实发量</th>
            <th>操作</th>
        </tr>
        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><tr>
            <td>#</td>
            <td><?php echo ($item['id']); ?></td>
            <td><?php echo ($item['name']); ?></td>
            <td></td>
            <td></td>
            <td>
                <a href="javascript:;">发货记录</a>
            </td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
    </table>
</form>
<?php echo ($page); ?>

    </div>

    <!-- <script src="../addons/szxh_list/Public/require.min.js"></script> -->
    <script>

        // require.config({
        //     baseUrl: '.',
        //     paths: {
        //         'jquery': '../addons/szxh_list/Public/library/jquery/jquery.min',
        //         // 'bootstrap': '../addons/szxh_list/Public/library/bootstrap/js/bootstrap.min',
        //         // 'moment': '../addons/szxh_list/Public/library/daterangepicker/moment',
        //         // 'daterangepicker': '../addons/szxh_list/Public/library/daterangepicker/daterangepicker',
        //     },
        //     shim: {
        //         'jquery': { exports: 'jquery' },
        //         // 'bootstrap': { deps: ['jquery'] },
        //         // 'moment': { exports: 'moment' },
        //         // 'daterangepicker': { deps: ['bootstrap'] },
        //         // ---
        //     }
        // });
        require(['jquery'], function($, util) {
            window.util = util;
            function post(url, data, callback, useTip) {
                useTip = useTip == undefined ? true : useTip;
                if(!useTip && callback === false) {
                    useTip = false;
                }
                $.post(url, data, function(res) {
                    if(typeof res != 'object') {
                        xalert('服务器繁忙，请稍后再试。');
                        return;
                    }
                    if(res.status == 1) {
                        xalert(res.info, true, useTip);
                        callback && callback(res);
                        return;
                    }
                    
                    xalert(res.info, false, useTip);
                })
            }
            function xalert(message, isSuccess, useTip) {
                if(!useTip) {
                    return;
                }
                alert(message);
            }
            $('#form_search').on('submit', function() {
                if($(this).prop('method') != 'get') {
                    return true;
                }
                var protocol = window.location.protocol;
                var host     = window.location.host;
                var pathname = window.location.pathname;
                var search   = window.location.search;
                var hash     = window.location.hash;
                var serializes = $(this).serializeArray();
                var searchObj = {};
                search.substr(1).split('&').forEach(function(item) {
                    item = item.split('=');
                    searchObj[item[0]] = item[1];
                });
                serializes.forEach(function(item) {
                    searchObj[item.name] = item.value;
                });
                search = [];
                for(key in searchObj) {
                    search.push(key + '=' + searchObj[key]);
                }
                search = '?' + search.join('&');
                var href = protocol + '//' + host + pathname + search + hash;
                location.href = href;
                return false;
            });
            $('.ajax-post').on('click', function() {
                if($(this).hasClass('confirm')) {
                    if(!confirm($(this).attr('data-confirm') || '继续执行当前操作吗？')) {
                        return false;
                    }
                }

                var url = $(this).prop('href') || $(this).attr('url');
                var data = $('#form').serialize();
                if(url == undefined) {
                    return false;
                }
                post(url, data, function() {
                    // setTimeout(function() {
                        location.reload();
                    // }, 2000);
                });
                return false;
            })
        })
    </script>
    
<script>
    require(['jquery','moment','bootstrap','daterangepicker'], function($, moment) {
        $('#daterange-btn').daterangepicker({
            ranges: {
                '今天': [moment().startOf(), moment().endOf()],
                '昨天': [moment().subtract(1, 'days').startOf(), moment().subtract(1, 'days').endOf()],
                '本周': [moment().startOf('week'), moment().endOf('week')],
                '上周': [moment().subtract(1, 'week').startOf('week'), moment().subtract(1, 'week').endOf('week')],
                '本月': [moment().startOf('month'), moment().endOf('month')],
                '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
                '今年': [moment().startOf('year'), moment().endOf('year')],
                '上一年': [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('year')],
            },
            startDate: moment(<?php echo ($start_time); ?>),
            endDate: moment(<?php echo ($end_time); ?>).endOf('days')
        }, cb);

        function cb(start, end) {
            $('#daterange-btn span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
            // $('#start_time').val((''+start).substr(0, 10) || '');
            // $('#end_time').val((''+end).substr(0, 10) || '');
            $('#start_time').val(start.format('YYYY-MM-DD'));
            $('#end_time').val(end.format('YYYY-MM-DD'));
        }
        var start = moment(<?php echo ($start_time); ?>);
        var end = moment(<?php echo ($end_time); ?>);
        cb(start, end);
        
        $('#form').on('submit', function() {
            $.post($(this).prop('action'), $(this).serialize(), function(res) {
                console.log(res);
                alert(res.message);
                if(res.errno != 0) {
                    return false;
                } else {
                    location.reload();
                }

            });
            return false;
        })

    });
</script>


</body>
</html>