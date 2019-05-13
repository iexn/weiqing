<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>活动统计</title>
	<link rel="stylesheet" href="../addons/szxh_list/Public/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/fontawesome/css/all.css">
    <link rel="stylesheet" href="../addons/szxh_list/Public/library/daterangepicker/daterangepicker.css">
    <link href="../addons/szxh_list/Public/css/w7_common.css" rel="stylesheet">
    <style>.uploader-modal{z-index:1060}.table td{vertical-align:middle!important}</style>
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
		'isfounder': <?php if(!empty($_W['isfounder'])): ?>1<?php else: ?>0<?php endif; ?>,
		'family': '<?php echo (IMS_FAMILY); ?>',
		'siteroot': '<?php echo ($_W['siteroot']); ?>',
		'siteurl': '<?php echo ($_W['siteurl']); ?>',
		'attachurl': '<?php echo ($_W['attachurl']); ?>',
		'attachurl_local': '<?php echo ($_W['attachurl_local']); ?>',
		'attachurl_remote': '<?php echo ($_W['attachurl_remote']); ?>',
		'module' : {'url' : '<?php if(defined('MODULE_URL')): ?>{$Think.const.MODULE_URL}<?php endif; ?>', 'name' : '<?php if(defined('IN_MODULE')): echo (IN_MODULE); endif; ?>'},
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
                        <li <?php if(cna('Send/stat')): ?>class="active"<?php endif; ?>><a href="<?php echo U('Send/stat');?>">发货统计</a></li>
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
            <th>礼品名称</th>
            <th>已发货量</th>
            <th>总发货量</th>
            <th width="130">操作</th>
        </tr>
        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><tr>
            <td>#</td>
            <td><?php echo ($item['title']); ?></td>
            <td><?php echo ($item['active_id']); ?></td>
            <td><?php echo ($item['active_id']); ?></td>
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
                    <h4 class="modal-title" id="myModalLabel"><span id="active_id" style="text-decoration:underline"></span><span id="modal_title"></span></h4>
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
        require(['jquery'], function($) {
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
    require(['jquery','bootstrap'], function($) {
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