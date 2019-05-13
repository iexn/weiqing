<?php 

// 获取支付地址
function payUrl($route) {
    return $route. domain(servername());
}

/**
 * 返回是否是操作员执行的修改动作
 */
function isclerkupdate($id) {
    global $_W;

    if($_W['role'] != 'clerk') {
        return false;
    }

    if($id === false) {
        return false;
    }

    return true;
}

function tpl_form_field_image_simple($name, $value = '', $default = '', $options = array()) {
    global $_W;
    if (empty($default)) {
        $default = './resource/images/nopic.jpg';
    }
    $val = $default;
    if (!empty($value)) {
        $val = tomedia($value);
    }
    if (!empty($options['global'])) {
        $options['global'] = true;
    } else {
        $options['global'] = false;
    }
    if (empty($options['class_extra'])) {
        $options['class_extra'] = '';
    }
    if (isset($options['dest_dir']) && !empty($options['dest_dir'])) {
        if (!preg_match('/^\w+([\/]\w+)?$/i', $options['dest_dir'])) {
            exit('图片上传目录错误,只能指定最多两级目录,如: "we7_store","we7_store/d1"');
        }
    }
    $options['direct'] = true;
    $options['multiple'] = false;
    if (isset($options['thumb'])) {
        $options['thumb'] = !empty($options['thumb']);
    }
    $options['fileSizeLimit'] = intval($GLOBALS['_W']['setting']['upload']['image']['limit']) * 1024;
    $s = '';
    if (!defined('TPL_INIT_IMAGE')) {
        $s = '
        <script type="text/javascript">
            function showImageDialog(elm, opts, options) {
                require(["util"], function(util){
                    var btn = $(elm);
                    var ipt = btn.parent().prev();
                    var val = ipt.val();
                    var img = ipt.parent().next().children();
                    options = '.str_replace('"', '\'', json_encode($options)).';
                    util.image(val, function(url){
                        if(url.url){
                            if(img.length > 0){
                                img.get(0).src = url.url;
                            }
                            ipt.val(url.attachment);
                            ipt.attr("filename",url.filename);
                            ipt.attr("url",url.url);
                        }
                        if(url.media_id){
                            if(img.length > 0){
                                img.get(0).src = "";
                            }
                            ipt.val(url.media_id);
                        }
                    }, options);
                });
            }
        </script>';
        define('TPL_INIT_IMAGE', true);
    }

    if($options['is_readonly'] == true) {
        $readonly = ' readonly="readonly" ';
    }

    $s .= '
        <div class="input-group ' . $options['class_extra'] . '">
            <input type="text" name="' . $name . '" value="' . $value . '"' . ($options['extras']['text'] ? $options['extras']['text'] : '') . ' class="form-control" autocomplete="off" '.$readonly.' id="form_image_simple_'.$name.'">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button" onclick="showImageDialog(this);">选择图片</button>
            </span>
        </div>';
    return $s;
}


function qrurl($pid) {
    return web2app_url('main', ['pid'=>$pid]);
}


function robot($data, $tablename, $id, $action, $count = 10, $append = []) {
    global $_W;
    $table = $_W['current_module']['name'] . '_robot';
    $tableBind = $_W['current_module']['name'] . '_robot_bind';
    if(!pdo_tableexists($table) || !pdo_tableexists($tableBind)) {
        return $data;
    }
    $table = tablename($table);
    $tableBind = tablename($tableBind);
    if(empty($tablename) || empty($id) || empty($action)) {
        return $data;
    }
    switch($action) {
        case 'count':
        case 'count2':
            $sql = "SELECT COUNT(A.id) AS data_count FROM {$table} AS A LEFT JOIN {$tableBind} AS B ON A.rb_id=B.id WHERE A.tablename='{$tablename}' AND B.bind_id='{$id}'";
            $res = pdo_fetch($sql);
            $data += $res['data_count'];
            if($action == 'count2') {
                $data += $res['data_count'];
            }
        break;
        case 'appendlist';
            $sql = "SELECT A.avatar, A.nickname FROM {$table} AS A LEFT JOIN {$tableBind} AS B ON A.rb_id=B.id WHERE A.tablename='{$tablename}' AND B.bind_id='{$id}' ORDER BY A.id DESC LIMIT {$count}";
            $res = pdo_fetchall($sql);
            $res = array_reverse($res);
            $timeconn = 47;
            foreach ($res as &$item) {
                foreach ($append as $key => $value) {
                    switch($value[0]) {
                        case "time":
                            $item[$key] = $value[1] + $timeconn;
                            $timeconn += 83;
                        break;
                        case "value":
                            $item[$key] = $value[1];
                        break;
                        case "replace": 
                            $item[$key] = $item[$value[1]];
                        default: continue 2;
                    }
                }
            }
            $res = array_reverse($res);
            $data = array_merge($data, $res);
    }
    return $data;
}