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
                        <li <?php if(cna('Index/index')): ?>class="active"<?php endif; ?>> <a href="<?php echo U('Index/index');?>">活动统计列表</a></li>
                        <li <?php if(cna('Index/user')): ?>class="active"<?php endif; ?>> <a href="<?php echo U('Index/user');?>">客服统计列表</a></li>
                        <li <?php if(cna('Send/activeLog')): ?>class="active"<?php endif; ?>> <a href="<?php echo U('Send/activeLog');?>">发货管理列表</a></li>
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
        
<a href="<?php echo U('Send/exportExcel2', $_GET);?>" class="btn btn-warning">导出当前数据</a>
<form class="navbar-form navbar-right" id="form_search" method="GET" action="">
    结束时间：
    <button type="button" class="btn btn-default" id="daterange-btn">
        <span><i class="fa fa-calendar"></i> 结束时间</span>
        <i class="fa fa-caret-down"></i>
    </button>
    <input type="text" name="active_id" value="<?php echo ($_GET['active_id']); ?>" class="form-control" placeholder="活动ID">
    <input type="text" name="title" value="<?php echo ($_GET['title']); ?>" class="form-control" placeholder="活动名称">
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
            <th>已发主礼品B</th>
            <th>已发主礼品C</th>
            <th>已发附加礼品A</th>
            <th>已发附加礼品B</th>
            <th>已发附加礼品C</th>
            <th>待发（主/附）</th>
            <th width="130">操作</th>
        </tr>
        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><tr>
            <td><?php echo ($item['id']); ?></td>
            <td><?php echo ($item['title']); ?></td>
            <td><?php echo ($item['username']); ?></td>
            <td><?php echo (date('Y-m-d', $item['end_time'])); ?></td>
            <td><?php echo ($item['all']); ?></td>
            <td><?php echo ($item['old']); ?></td>
            <td><?php echo ((isset($item['new_user_gift']) && ($item['new_user_gift'] !== ""))?($item['new_user_gift']):'无'); ?>：<?php echo ((isset($item['all1_num']) && ($item['all1_num'] !== ""))?($item['all1_num']):0); ?></td>
            <td><?php echo ((isset($item['new_user_gift2']) && ($item['new_user_gift2'] !== ""))?($item['new_user_gift2']):'无'); ?>：<?php echo ((isset($item['all2_num']) && ($item['all2_num'] !== ""))?($item['all2_num']):0); ?></td>
            <td><?php echo ((isset($item['new_user_gift3']) && ($item['new_user_gift3'] !== ""))?($item['new_user_gift3']):'无'); ?>：<?php echo ((isset($item['all3_num']) && ($item['all3_num'] !== ""))?($item['all3_num']):0); ?></td>
            <td><?php echo ((isset($item['old_user_gift']) && ($item['old_user_gift'] !== ""))?($item['old_user_gift']):'无'); ?>：<?php echo ((isset($item['old1_num']) && ($item['old1_num'] !== ""))?($item['old1_num']):0); ?></td>
            <td><?php echo ((isset($item['old_user_gift2']) && ($item['old_user_gift2'] !== ""))?($item['old_user_gift2']):'无'); ?>：<?php echo ((isset($item['old2_num']) && ($item['old2_num'] !== ""))?($item['old2_num']):0); ?></td>
            <td><?php echo ((isset($item['old_user_gift3']) && ($item['old_user_gift3'] !== ""))?($item['old_user_gift3']):'无'); ?>：<?php echo ((isset($item['old3_num']) && ($item['old3_num'] !== ""))?($item['old3_num']):0); ?></td>
            <td>
                <?php echo ($item['all'] - $item['all1_num'] - $item['all2_num'] - $item['all3_num']); ?>
                /
                <?php echo ($item['old'] - $item['old1_num'] - $item['old2_num'] - $item['old3_num']); ?>
            </td>
            <td>
                <a href="javascript:;" class="sendlog" data-id="<?php echo ($item['active_id']); ?>" data-title="<?php echo ($item['title']); ?>">记录</a>
            </td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
    </table>
</form>
<?php echo ($page); ?>
<!-- modal -->
<div class="modal fade bs-example-modal-sm" id="sendlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document" style="width:1200px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><?php echo ($item['title']); ?></h4>
            </div>
            <div class="modal-body">
                <p class="help-block">* 首次编辑视为发货，将会记录发货时间</p>
                <table class="table">
                <thead>
                <tr>
                    <th>发货时间</th>
                    <th>主礼品A</th>
                    <th>主礼品B</th>
                    <th>主礼品C</th>
                    <th>附加礼品A</th>
                    <th>附加礼品B</th>
                    <th>附加礼品C</th>
                    <th>物流公司</th>
                    <th>物流单号</th>
                    <th>操作</th>
                </tr>  
                </thead>
                <tbody id="send_tbody">
                    
                </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭页面</button>
            </div>
        </div>
    </div>
</div>
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
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">主礼品</label>
                        <div class="col-sm-10">
                            <div class="col-sm-6">
                                <select name="gift1_name" class="form-control" id="gift1_name">
                                    <option value="">---</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <input type="number" class="form-control col-sm-6" name="gift1_num" id="gift1_num" placeholder="数量">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <div class="col-sm-6">
                                <select name="gift3_name" class="form-control" id="gift3_name">
                                    <option value="">---</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <input type="number" class="form-control col-sm-6" name="gift3_num" id="gift3_num" placeholder="数量">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <div class="col-sm-6">
                                <select name="gift5_name" class="form-control" id="gift5_name">
                                    <option value="">---</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <input type="number" class="form-control col-sm-6" name="gift5_num" id="gift5_num" placeholder="数量">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">附加礼品</label>
                        <div class="col-sm-10">
                            <div class="col-sm-6">
                                <select name="gift2_name" class="form-control" id="gift2_name">
                                    <option value="">---</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <input type="number" class="form-control col-sm-6" name="gift2_num" id="gift2_num" placeholder="数量">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <div class="col-sm-6">
                                <select name="gift4_name" class="form-control" id="gift4_name">
                                    <option value="">---</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <input type="number" class="form-control col-sm-6" name="gift4_num" id="gift4_num" placeholder="数量">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <div class="col-sm-6">
                                <select name="gift6_name" class="form-control" id="gift6_name">
                                    <option value="">---</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <input type="number" class="form-control col-sm-6" name="gift6_num" id="gift6_num" placeholder="数量">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">物流公司</label>
                        <div class="col-sm-10">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" name="ex_name" id="ex_name">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">物流单号</label>
                        <div class="col-sm-10">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" name="ex_sn" id="ex_sn">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">快递单</label>
                        <div class="col-sm-10">
                            <div class="col-sm-12">
                                <?php echo tpl_form_field_image('images', $item['images']);?>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">发货备注</label>
                        <div class="col-sm-10">
                            <div class="col-sm-12">
                                <textarea name="remarks" id="remarks" class="form-control" disabled style="resize:none;height:120px"></textarea>
                            </div>
                        </div>
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
    require(['moment','daterangepicker'], function(moment) {
        $('.sendlog').on('click', function() {
            var data = $(this).data();
            $('#sendlog').find('.modal-title').html(data.title);

            $.post("<?php echo U('sendAllLog');?>", {
                id: data.id
            })
            .then(function(res) {
                if(res.status != 1) {
                    alert(res.info);
                    return false;
                }
                var data = res.url.list;
                $('#send_tbody').empty();
                var s = '';
                for(var i in data) {
                    if(data[i].send_time == 0) {
                        data[i].send_time = '---';
                    }
                    s += '<tr>\
                            <td>'+ data[i].send_time +'</td>\
                            <td>'+ data[i].gift1_name + ' ' + data[i].gift1_num +'</td>\
                            <td>'+ data[i].gift3_name + ' ' + data[i].gift3_num +'</td>\
                            <td>'+ data[i].gift5_name + ' ' + data[i].gift5_num +'</td>\
                            <td>'+ data[i].gift2_name + ' ' + data[i].gift2_num +'</td>\
                            <td>'+ data[i].gift4_name + ' ' + data[i].gift4_num +'</td>\
                            <td>'+ data[i].gift6_name + ' ' + data[i].gift6_num +'</td>\
                            <td>'+data[i].ex_name+'</td>\
                            <td>'+data[i].ex_sn+'</td>\
                            <td><a href="javascript:;" class="toeditbtn" data-id="'+ data[i].id +'">编辑</a></td>\
                        </tr>';
                }
                $('#send_tbody').html(s);
                $('#send_tbody').find('.toeditbtn').on('click', tostatus3);
                $('#sendlog').modal('show');
            });

            $('#sendlog').modal('show');
        });
        $('#sendlog').on('hidden.bs.modal', function () {
            $('#modal').find('.modal-title').html('');
            $('#modal').find('#qrcodeLabel').prop('src', '');
            $('#modal').find('.cliplink').attr('data-text', '');
        });

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
        

        function tostatus3(e) {
            var text = $(this).html();
            var _this = this;
            $(this).html(text + ' <i class="fa fa-spinner fa-spin"></i>').prop('disabled', true);
            var id = $(this).attr('data-id');
            $.post("<?php echo U('Send/findRow');?>", {
                id: id
            })
            .then(function(res) {
                $(_this).html(text).prop('disabled', false);
                if(res.status != 1) {
                    alert(res.info);
                    return false;
                }
                var data = res.url;
                console.log(data);
                $('#send_id').val(data.id);
                $('#active_id').html('[' + data.active_id + ']');
                $('#modal_title').html(data.title);

                $('#sur1').html(' ( ' + data.sended1 + ' / ' + data.total1 + ' )');
                $('#sur2').html(' ( ' + data.sended2 + ' / ' + data.total2 + ' )');
                $('input[name=images]').val(data.images);
                $('#remarks').val(data.remarks);
                
                var new_s = '', old_s = '';
                for(var i in data.new_list) {
                    new_s += $('<option>').text(data.new_list[i]).val(data.new_list[i]).prop('outerHTML');
                }
                for(var i in data.old_list) {
                    old_s += $('<option>').text(data.old_list[i]).val(data.old_list[i]).prop('outerHTML');
                }
                
                $('#gift1_name').find('option').not(':first').remove();
                $('#gift3_name').find('option').not(':first').remove();
                $('#gift5_name').find('option').not(':first').remove();
                $('#gift1_name').append(new_s);
                $('#gift3_name').append(new_s);
                $('#gift5_name').append(new_s);
                $('#gift2_name').find('option').not(':first').remove();
                $('#gift4_name').find('option').not(':first').remove();
                $('#gift6_name').find('option').not(':first').remove();
                $('#gift2_name').append(old_s);
                $('#gift4_name').append(old_s);
                $('#gift6_name').append(old_s);
                // $('input[name=images]').parent().next().find('img').prop('src', util.tomedia(data.images))
                
                $('#gift1_name').val(data.gift1_name);
                $('#gift2_name').val(data.gift2_name);
                $('#gift3_name').val(data.gift3_name);
                $('#gift4_name').val(data.gift4_name);
                $('#gift5_name').val(data.gift5_name);
                $('#gift6_name').val(data.gift6_name);
                $('#gift1_num').val(data.gift1_num);
                $('#gift2_num').val(data.gift2_num);
                $('#gift3_num').val(data.gift3_num);
                $('#gift4_num').val(data.gift4_num);
                $('#gift5_num').val(data.gift5_num);
                $('#gift6_num').val(data.gift6_num);
                $('#ex_name').val(data.ex_name);
                $('#ex_sn').val(data.ex_sn);

                $('#edit').modal('show');
            })
            .fail(function() {
                alert('服务器繁忙，请稍后再试');
                $(_this).html(text).prop('disabled', false);
            });
        }

    });
    require(['jquery'], function($) {
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
                $('#gift1_name').val(data.gift1_name);
                $('#gift2_name').val(data.gift2_name);
                $('#gift3_name').val(data.gift3_name);
                $('#gift4_name').val(data.gift4_name);
                $('#gift5_name').val(data.gift5_name);
                $('#gift6_name').val(data.gift6_name);
                $('#gift1_num').val(data.gift1_num);
                $('#gift2_num').val(data.gift2_num);
                $('#gift3_num').val(data.gift3_num);
                $('#gift4_num').val(data.gift4_num);
                $('#gift5_num').val(data.gift5_num);
                $('#gift6_num').val(data.gift6_num);
                $('#ex_name').val(data.ex_name);
                $('#ex_sn').val(data.ex_sn);
                $('#sur1').html(' ( ' + data.sended1 + ' / ' + data.total1 + ' )');
                $('#sur2').html(' ( ' + data.sended2 + ' / ' + data.total2 + ' )');
                $('input[name=images]').val(data.images);
                $('#remarks').val(data.remarks);
                
                var new_s = '', old_s = '';
                for(var i in data.new_list) {
                    new_s += $('<option>').text(data.new_list[i]).val(data.new_list[i]).prop('outerHTML');
                }
                for(var i in data.old_list) {
                    old_s += $('<option>').text(data.old_list[i]).val(data.old_list[i]).prop('outerHTML');
                }
                
                $('#gift1_name').find('option').not(':first').remove();
                $('#gift3_name').find('option').not(':first').remove();
                $('#gift5_name').find('option').not(':first').remove();
                $('#gift1_name').append(new_s);
                $('#gift3_name').append(new_s);
                $('#gift5_name').append(new_s);
                $('#gift2_name').find('option').not(':first').remove();
                $('#gift4_name').find('option').not(':first').remove();
                $('#gift6_name').find('option').not(':first').remove();
                $('#gift2_name').append(old_s);
                $('#gift4_name').append(old_s);
                $('#gift6_name').append(old_s);
                // $('input[name=images]').parent().next().find('img').prop('src', util.tomedia(data.images))

                $('#edit').modal('show');
            })
            .fail(function() {
                alert('服务器繁忙，请稍后再试');
                $(_this).html(text).prop('disabled', false);
            });
        });
    });
    require(['jquery'], function($) {
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