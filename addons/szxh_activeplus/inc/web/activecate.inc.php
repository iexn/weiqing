<?php 

/**
 * ------------------------
 * 活动分类模块
 * ------------------------
 */

// 验证后台登录
checklogin();

global $_W, $_GPC;
$_W['page']['title'] = '活动分类管理';
$et = $_GPC['et'];


// 跳转到添加页面
if($et == 2) {
    $data = logic('Active')->cate($_GPC['pid']);
    if($data === false) {
        message(logic()->getMessage(), logic()->getUrl());
    }
    $this->assign('row', $data['row']);
    $this->display('active_cate_update');
    return;
}

// 排序保存
if($et == 3) {
    logic('Cate')->sort($_GPC['sort']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

// 删除操作
if($et == 4) {
    logic('Cate')->delete($_GPC['id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

// 保存内容
if($et == 5) {
    logic('Cate')->save([
        'sort'  => $_POST['sort'],
        'title' => $_POST['title']
    ], $_POST['id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}




// ----------

$list = logic('Cate')->getList();
$this->assign('dataList', $list);
$this->display('active_cate_list');