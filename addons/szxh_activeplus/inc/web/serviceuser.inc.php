<?php 

/**
 * ------------------------
 * 客服管理模块
 * ------------------------
 */

// 验证后台登录
checklogin();

global $_W, $_GPC;
$_W['page']['title'] = '客服管理';
$et = $_GPC['et'];

// 排序保存接口
if($et == 3) {
    logic('ServiceUser')->sort($_GPC['sort']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

// 删除接口
if($et == 4) {
    logic('ServiceUser')->delete($_GPC['id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}

// 保存编辑接口
if($et == 5) {
    logic('ServiceUser')->save([
        'name'          => $_POST['name'],
        'uid'           => $_POST['uid'],
        'avatar'        => $_POST['avatar'],
        'mobile'        => $_POST['mobile'],
        'wechat_qrcode' => $_POST['wechat_qrcode'],
        'sort'          => $_POST['sort'],
    ], $_POST['id']);
    $this->result(logic()->getCode(), logic()->getMessage());
    return;
}


// 新增/编辑的页面
if($et == 2) {
    $data = logic('ServiceUser')->saveData($_GPC['pid']);
    if($data === false) {
        message(logic()->getMessage(), logic()->getUrl);
    }

    $clerks = module_clerk_info(MNAME);

    $this->assign($data);
    $this->assign('clerks', $clerks);

    $this->display('service_user_update');
    return;
}


// 导出数据
if($et == 15) {

    $excels = logic('ServiceUser')->getExcelList([
        'starttime' => is_time(1, $_GET['searchtime']['start'])['start'],
        'endtime' => is_time(1, $_GET['searchtime']['end'])['end']
    ]);

    logic()->outputExcel($excels);

    return;
}


// # 默认情况


$data = logic('ServiceUser')->index($_GPC['page'], [
    'starttime' => is_time(1, $_GET['searchtime']['start'])['start'],
    'endtime' => is_time(1, $_GET['searchtime']['end'])['end']
]);

// 获取地址栏参数
$url = address();

// 导出excel使用的地址
$export_url = address(['et'=>15]);

// 后台登录用户类型
$clerks = module_clerk_info(MNAME);

$this->assign('list', $data['list']);
$this->assign('page', $data['page']);
$this->assign('url', $url);
$this->assign('export_url', $export_url);
$this->assign('clerks', $clerks);

$this->display('service_user_list');
return;