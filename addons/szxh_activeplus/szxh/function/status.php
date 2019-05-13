<?php 

function statusName($status) {
    switch($status) {
        case '1': return '审核中';
        case '2': return '正常';
        case '3': return '已关闭';
        default: return '---';
    }
}

function payName($status) {
    if($status == 2) {
        return '已支付';
    }
    return '<span style="color:red">未支付</span>';
}

/**
 * 下单人员报名类型
 */
function order_user_type($type) {
    switch($type) {
        case '1': return '新学（会）员';
        case '2': return '老学（会）员';
        case '3': return '推广员/老师/工作人员';
        default: return '---';
    }
}

/**
 * 返利类型
 */
function getTransfersTypeName($send_type) {
    switch($send_type) {
        case '1': return '推荐返利';
        case '2': return '分享返利';
        case '3': return '校长返利';
        default: return '---';
    }
}

/**
 * 奖励发放状态名称
 */
function rewardsn($status, $useStyle = true) {
    if($useStyle) {
        switch($status) {
            case '1': return '<span>未发放</span>';
            case '2': return '<span style="color:green">成功</span>';
            case '3': return '<span style="color:red">失败</span>';
            default: return '---';
        }
    } else {
        switch($status) {
            case '1': return '未发放';
            case '2': return '成功';
            case '3': return '失败';
            default: return '---';
        }
        
    }
}
