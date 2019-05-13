<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php echo (OP_TITLE); ?></title>
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/fontawesome/css/all.css">
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/daterangepicker/daterangepicker.css">
    <style>.table td{vertical-align:middle!important}</style>
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
                    <a class="navbar-brand" href="#"><?php echo (OP_TITLE); ?></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li <?php if(cna('Index/index')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Index/index');?>">活动统计列表</a></li>
                        <li <?php if(cna('Index/user')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Index/user');?>">客服统计列表</a></li>
                        <li <?php if(cna('Send/index')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Send/index');?>">发货管理列表</a></li>
                        <li <?php if(cna('Send/stat')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Send/stat');?>">发货统计</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="javascript:;">切换红包模块：<select class="btn btn-link" style="vertical-align:top;padding:0 10px;margin-top:-2px;height:20px;outline:none" onchange="location.href='./index.php?c=site&a=entry&eid=52&version_id=0&mm='+this.value"><option value="Home">红包1</option><option value="Home2">红包2</option></select></a></li>
                        <li><a href="<?php echo url('module/display');?>" target="_blank">返回微擎</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>



    <div style="margin-top:40px;padding:25px">
        
<form class="navbar-form navbar-right" id="form_search" method="GET" action="javascript:;" data-ignore="p,page">
    <input type="text" name="title" value="<?php echo ($_GET['title']); ?>" class="form-control" placeholder="活动名称">
    <div class="form-group">
        <button type="button" class="btn btn-default pull-right" id="daterange-btn">
            <span><i class="fa fa-calendar"></i> 日期选择</span>
            <i class="fa fa-caret-down"></i>
        </button>
        <input type="hidden" name="start_time" id="start_time" value="" />
        <input type="hidden" name="end_time" id="end_time" value="" />
    </div>
    <button type="submit" class="btn btn-default">搜索</button>
</form>
<form class="form">
    <table class="table table-hover">
        <tr>
            <th>#</th>
            <th>ID</th>
            <th>活动名称</th>
            <th>分类</th>
            <th>客服</th>
            <th>活动结束日期</th>
            <th>新会员数量</th>
            <th>老会员数量</th>
            <th>总会员数量</th>
            <th>所在公众号</th>
        </tr>
        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><tr>
            <td>#</td>
            <td><?php echo ($item['id']); ?></td>
            <td><?php echo ($item['title']); ?></td>
            <td><?php echo ($item['active_cate_title']); ?></td>
            <td><?php echo ($item['service_user_name']); ?></td>
            <td><?php echo (date('Y-m-d',$item['end_time'])); ?></td>
            <td><?php echo ($item['new']); ?></td>
            <td><?php echo ($item['old']); ?></td>
            <td><?php echo ($item['all']); ?></td>
            <td><a href="/web/<?php echo ($item['uni_url']); ?>" target="_blank"><?php echo ($item['uni_name']); ?></a></td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
    </table>
</form>
<?php echo ($page); ?>

    </div>

    <script src="../addons/szxh_list/Public/require.min.js"></script>
    <script>
        require.config({
            baseUrl: '.',
            paths: {
                'jquery': '../addons/szxh_list/Public/library/jquery/jquery.min',
                'bootstrap': '../addons/szxh_list/Public/library/bootstrap/js/bootstrap.min',
                'moment': '../addons/szxh_list/Public/library/daterangepicker/moment',
                'tool': '../addons/szxh_list/Public/js/tool',
                'daterangepicker': '../addons/szxh_list/Public/library/daterangepicker/daterangepicker',
                'util': './resource/js/app/util.js?v=20170426',
            },
            shim: {
                'jquery': { exports: 'jquery' },
                'bootstrap': { deps: ['jquery'] },
                'moment': { exports: 'moment' },
                'daterangepicker': { deps: ['bootstrap'] },
                'tool': {exports: 'tool'}
            }
        });
        window.util = {};
        require(['jquery','util'], function($, util) {
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
                var ignore = ($(this).attr('data-ignore') || '').split(',');
                search.substr(1).split('&').forEach(function(item) {
                    item = item.split('=');
                    searchObj[item[0]] = item[1];
                });
                serializes.forEach(function(item) {
                    searchObj[item.name] = item.value;
                });
                search = [];
                for(key in searchObj) {
                    if(ignore.indexOf(key) > -1) {
                        continue;
                    }
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