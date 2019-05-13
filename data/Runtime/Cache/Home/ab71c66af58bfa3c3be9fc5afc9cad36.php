<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo (OP_TITLE); ?> 微擎 - 公众平台自助引擎 -  Powered by WE7.CC</title>
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/fontawesome/css/all.css">
    <link rel="stylesheet" href="../addons/szxh_list/Public/css/w7_common.css">
    <style>.uploader-modal{z-index:1060}.table td{vertical-align:middle!important}</style>
    <script type="text/javascript">
        if(navigator.appName == 'Microsoft Internet Explorer'){
            if(navigator.userAgent.indexOf("MSIE 5.0")>0 || navigator.userAgent.indexOf("MSIE 6.0")>0 || navigator.userAgent.indexOf("MSIE 7.0")>0) {
                alert('您使用的 IE 浏览器版本过低, 推荐使用 Chrome 浏览器或 IE8 及以上版本浏览器.');
            }
        }
        window.sysinfo = <?php echo json_encode($sysinfo);?>
    </script>
    <script>var require = { urlArgs: 'v=<?php echo (IMS_RELEASE_DATE); ?>' };</script>
    <script type="text/javascript" src="../addons/szxh_list/Public/library/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="./resource/js/lib/bootstrap.min.js"></script>
    <script type="text/javascript" src="./resource/js/app/util.js"></script>
    <script type="text/javascript" src="./resource/js/app/common.min.js"></script>
    <script src="../addons/szxh_list/Public/require.min.js"></script>
    <!-- <script src="../addons/szxh_list/Public/config.js"></script> -->
    <script>
        require.config({
            baseUrl: '.',
            paths: {
                jquery           : '../addons/szxh_list/Public/library/jquery/jquery.min',
                bootstrap        : '../addons/szxh_list/Public/library/bootstrap/js/bootstrap.min',
                tool             : '../addons/szxh_list/Public/js/tool',

                angular          : './resource/js/lib/angular.min',
                biz              : './resource/js/lib/biz',
                clipboard        : './resource/js/lib/clipboard.min',
                clockpicker      : './resource/components/clockpicker/clockpicker.min',
                colorpicker      : './resource/components/colorpicker/spectrum',
                datetimepicker   : './resource/components/datetimepicker/jquery.datetimepicker',
                daterangepicker  : '../addons/szxh_list/Public/library/daterangepicker/daterangepicker',
                district         : './resource/js/lib/district',
                echarts          : './resource/js/lib/echarts.min',
                emoji            : './resource/components/emoji/emoji',
                fileSaver        : '//cdn.bootcss.com/FileSaver.js/2014-11-29/FileSaver',
                filestyle        : './resource/js/lib/bootstrap-filestyle.min',
                fileUploader     : './resource/components/fileuploader/fileuploader.min',
                fontawesome      : './resource/components/fontawesome/fontawesome',
                hammer           : './resource/js/lib/hammer.min',
                jszip            : '//cdn.bootcss.com/jszip/3.1.5/jszip',
                map              : 'https://api.map.baidu.com/getscript?v=2.0&ak=F51571495f717ff1194de02366bb8da9&services=&t=20140530104353',
                material         : './resource/components/fileuploader/fileuploader.min',
                moment           : '../addons/szxh_list/Public/library/daterangepicker/moment',
                qqmap            : 'https://map.qq.com/api/js?v=2.exp',
                slimscroll       :  './resource/js/lib/jquery.slimscroll.min',
                swiper           : './resource/components/swiper/swiper.min',
                trade            : './resource/components/trade/trade',
                ueditor          : './resource/components/ueditor/ueditor.all.min',
                underscore       : './resource/js/lib/underscore-min',
                util             : './resource/js/app/util',
                validator        : './resource/js/lib/bootstrapValidator.min',
                webuploader      : './resource/components/webuploader/webuploader.min',
                'bootstrap.switch' : './resource/components/switch/bootstrap-switch.min',
                'jquery.ui'        : './resource/js/lib/jquery-ui-1.10.3.min',
                'jquery.caret'     : './resource/js/lib/jquery.caret',
                'jquery.jplayer'   : './resource/components/jplayer/jquery.jplayer.min',
                'jquery.zclip'     : './resource/components/zclip/jquery.zclip.min',
                'jquery.wookmark'  : './resource/js/lib/jquery.wookmark.min',
                'jquery.qrcode'    : './resource/js/lib/jquery.qrcode.min',
                'angular.sanitize' : './resource/js/lib/angular-sanitize.min',
                'angular.hotkeys'  : './resource/js/lib/angular.hotkeys',
                'we7.check'        : './resource/js/lib/we7.check',
            },
            map: {
                '*': {'css': '../addons/szxh_list/Public/css.min'}
            },
            shim: {
                map                : {exports: 'BMap'},
                chart              : {exports: 'Chart'},
                colorpicker        : {deps: ['css!./resource/components/colorpicker/spectrum.css']},
                daterangepicker    : {deps: ['css!../addons/szxh_list/Public/library/daterangepicker/daterangepicker.css']},
                datetimepicker     : {deps: ['css!./resource/components/datetimepicker/jquery.datetimepicker.css']},
                clockpicker        : {deps: ['css!./resource/components/clockpicker/clockpicker.min.css']},
                emoji              : {deps: ['css!./resource/components/emoji/emotions.css']},
                fontawesome        : {deps: ['css!./resource/components/fontawesome/style.css']},
                swiper             : {deps: ['css!./resource/components/swiper/swiper.min.css']},
                'bootstrap.switch' : {deps: ['css!./resource/components/switch/bootstrap-switch.min.css']},
                'jquery.toast'     : {deps: ['css!./resource/components/toast/toastr.min.css']},
                'angular.sanitize' : {deps: ['angular']},
                'angular.hotkeys'  : {deps: ['angular']},
            }
        });
    </script>
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
                        <li <?php if(cna('Index/index')): ?>class="active"<?php endif; ?>> <a href="<?php echo U('Index/index');?>">活动统计列表</a></li>
                        <li <?php if(cna('Index/user')): ?>class="active"<?php endif; ?>> <a href="<?php echo U('Index/user');?>">客服统计列表</a></li>
                        <li <?php if(cna('Send/index')): ?>class="active"<?php endif; ?>> <a href="<?php echo U('Send/activeLog');?>">发货管理列表</a></li>
                        <li <?php if(cna('Send/stat')): ?>class="active"<?php endif; ?>> <a href="<?php echo U('Send/stat');?>">发货统计</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="javascript:;">
                                <select class="btn btn-link" style="vertical-align:top;padding:0 10px;margin-top:-2px;height:20px;outline:none"
                                    onchange="if(this.value!='')location.href='<?php echo U();?>&mm='+this.value">
                                    <option value="">切换红包模块【<?php echo (OP_TITLE); ?>】</option>
                                    <option value="Home">红包1</option>
                                    <option value="Home2">红包2</option>
                                </select>
                            </a>
                        </li>
                        <li><a href="<?php echo url('module/display');?>" target="_blank">返回微擎</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

    <div style="margin-top:40px;padding:25px">
        
<a href="<?php echo U('Send/exportExcel', $_GET);?>" class="btn btn-warning">导出当前数据</a>
<form class="navbar-form navbar-right" id="form_search" method="GET" action="">
    报备时间：
    <button type="button" class="btn btn-default" id="daterange-btn">
        <span><i class="fa fa-calendar"></i> 报备时间</span>
        <i class="fa fa-caret-down"></i>
    </button>
    <input type="text" name="active_id" value="<?php echo ($_GET['active_id']); ?>" class="form-control" placeholder="活动ID">
    <input type="text" name="title" value="<?php echo ($_GET['title']); ?>" class="form-control" placeholder="活动名称">
    <select name="status" class="form-control">
        <option value="">全部发货记录</option>
        <option value="1" <?php if($_GET['status'] == 1): ?>selected="selected"<?php endif; ?>>未发货</option>
        <option value="2" <?php if($_GET['status'] == 2): ?>selected="selected"<?php endif; ?>>等待发货</option>
        <option value="3" <?php if($_GET['status'] == 3): ?>selected="selected"<?php endif; ?>>已发货</option>
    </select>
    <input type="hidden" name="start_time" id="start_time" value="" />
    <input type="hidden" name="end_time" id="end_time" value="" />
    <button type="submit" class="btn btn-default">搜索</button>
</form>
<form class="form">
    <table class="table table-hover">
        <tr>
            <th>#</th>
            <th>活动名称</th>
            <th>客服</th>
            <th>结束时间</th>
            <th>主礼品</th>
            <th>附加礼品</th>
            <th>已发主礼品A</th>
            <th>已发助力贫B</th>
            <th>已发附加礼品A</th>
            <th>已发附加礼品B</th>
            <th>待发礼品（主/附）</th>
            <th>状态</th>
            <th width="130">操作</th>
        </tr>
        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><tr>
            <td><?php echo ($item['id']); ?></td>
            <td><?php echo ($item['title']); ?></td>
            <td><?php echo ($item['username']); ?></td>
            <td><?php echo (date('Y-m-d', $item['end_time'])); ?></td>
            <td><?php echo ($item['active_id']); ?></td>
            <td><?php echo ($item['gift1_name']); ?>&emsp;已发：<?php echo ($item['gift1_num']); ?></td>
            <td><?php echo ($item['gift2_name']); ?>&emsp;已发：<?php echo ($item['gift2_num']); ?></td>
            <td><?php echo ($item['ex_name']); ?></td>
            <td><?php echo ($item['ex_sn']); ?></td>
            <td><?php echo (date('Y-m-d H:i', $item['create_time'])); ?></td>
            <td><?php if($item['send_time']): echo (date('Y-m-d H:i', $item['send_time'])); else: ?>---<?php endif; ?></td>
            <td><?php echo (send_status($item['status'])); ?></td>
            <td>
                <?php if($item['status'] == 1): ?><a href="<?php echo U('Send/statusTo2', ['id'=>$item['id']]);?>" class="btn btn-link ajax-post confirm">开始发货</a><?php endif; ?>
                <?php if($item['status'] == 2): ?><button type="button" class="btn btn-link tostatus3" data-id="<?php echo ($item['id']); ?>">完善信息</button><?php endif; ?>
                <?php if($item['status'] == 3): ?><button type="button" class="btn btn-link tostatus3" data-id="<?php echo ($item['id']); ?>">继续编辑</button><?php endif; ?>
            </td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
    </table>
</form>
<?php echo ($page); ?>
<!-- Modal -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form action="javascript:;" method="POST" id="tosend">
        <input type="hidden" name="id" id="send_id">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><span id="active_id"></span> <span id="modal_title"></span></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1"><span id="gift1_name"></span><span id="sur1"></span></label>
                        <input type="number" class="form-control" name="gift1_num" id="gift1_num" placeholder="数量">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1"><span id="gift2_name"></span><span id="sur2"></span></label>
                        <input type="number" class="form-control" name="gift2_num" id="gift2_num" placeholder="数量">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1"><span>物流公司</span></label>
                        <input type="text" class="form-control" name="ex_name" id="ex_name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1"><span>物流单号</span></label>
                        <input type="text" class="form-control" name="ex_sn" id="ex_sn">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1"><span>上传图片</span></label>
                        <?php echo tpl_form_field_image('images', $item['images']);?>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </form>
</div>

    </div>

    <script>
        require([], function() {
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
    require(['moment','daterangepicker'], function(moment) {
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
            startDate: moment("<?php echo ($start_time); ?>"),
            endDate: moment("<?php echo ($end_time); ?>").endOf('days')
        }, cb);

        function cb(start, end) {
            $('#daterange-btn span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
            // $('#start_time').val((''+start).substr(0, 10) || '');
            // $('#end_time').val((''+end).substr(0, 10) || '');
            $('#start_time').val(start.format('YYYY-MM-DD'));
            $('#end_time').val(end.format('YYYY-MM-DD'));
        }
        var start = moment("<?php echo ($start_time); ?>");
        var end = moment("<?php echo ($end_time); ?>");
        cb(start, end);

    });
    require([], function() {
        $('.tostatus3').on('click', function() {
            var text = $(this).html();
            var _this = this;
            $(this).html(text + ' <i class="fa fa-spinner fa-spin"></i>').prop('disabled', true);
            var id = $(this).attr('data-id');
            $.post("<?php echo U('Send/findRow');?>", {
                id: id
            })
            .then(function(res) {
                if(res.status != 1) {
                    alert(res.info);
                    return false;
                }
                $(_this).html(text).prop('disabled', false);
                var data = res.url;
                console.log(data);
                $('#send_id').val(data.id);
                $('#active_id').html('[' + data.active_id + ']');
                $('#modal_title').html(data.title);
                $('#gift1_name').html(data.gift1_name);
                $('#gift2_name').html(data.gift2_name);
                $('#gift1_num').val(data.gift1_num);
                $('#gift2_num').val(data.gift2_num);
                $('#ex_name').val(data.ex_name);
                $('#ex_sn').val(data.ex_sn);
                $('#sur1').html(' ( ' + data.sended1 + ' / ' + data.total1 + ' )');
                $('#sur2').html(' ( ' + data.sended2 + ' / ' + data.total2 + ' )');
                $('input[name=images]').val(data.images);
                $('input[name=images]').parent().next().find('img').prop('src', util.tomedia(data.images))

                $('#edit').modal('show');
            })
            .fail(function() {
                alert('服务器繁忙，请稍后再试');
                $(_this).html(text).prop('disabled', false);
            });
        });
    });
    require([], function() {
        $('#tosend').on('submit', function() {
            var _this = this;
            var data = $(this).serialize();
            var url = "<?php echo U('Send/statusTo3');?>";
            $.post(url, data)
            .then(function(res) {
                if(res.status != 1) {
                    alert(res.info);
                    return false;
                }
                alert('保存成功');
                location.reload();
            })
            .fail(function() {
                alert('服务器繁忙，请稍后再试');
            })
            return false;
        });
    })
</script>

</body>
</html>