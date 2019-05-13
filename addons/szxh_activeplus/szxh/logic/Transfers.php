<?php
namespace szxh\logic;

class Transfers extends Common
{

    public function ranks($active_id, $numbers)
    {
        $ranks = model('Transfers')->getRanks($active_id, $numbers);
        $ranks_count = model('Transfers')->getRanksCount($active_id);
        return [
            'ranks' => $ranks,
            'ranks_count' => $ranks_count,
        ];
    }

    public function index($page, $condition = [])
    {

        $list = model('Transfers')->getList($condition, $page);

        return [
            'list' => $list,
            'page' => model('Transfers')->getPageHtml(),
        ];

    }

    /**
     * 返利记录列表
     */
    public function transfersList($condition)
    {

        // 读取订单数据
        $transfersList = model('Transfers')->getList($condition, false);

        return [
            'row' => $row,
            'transfersList' => $transfersList,
        ];

    }

    public function getTransfersExcelList($list)
    {
        $excels = [];
        foreach ($list as $item) {
            // 奖励人
            $user = userinfo($item['wechat_id']);
            $excels[] = [
                'order_sn' => $item['order_sn'] ? 'A' . $item['order_sn'] : '---',
                'nickname' => userinfo($item['order_user_id'])['nickname'] ?: '---',
                'active_name' => $item['title'],
                'reward' => '￥' . $item['reward'],
                'reward_to' => $user['nickname'],
                'send_type' => getTransfersTypeName($item['send_type']),
                'send_time' => date('Y-m-d H:i', $item['create_time']),
                'status' => rewardsn($item['status'], false),
                'intro' => $item['reward_msg'],
            ];
        }
        return $excels;
    }

    public function outputExcel($excels, $title)
    {
        $filename = $title . '返利记录' . date("Ymd_H_i");
        $headname = $title . '返利记录（截止于' . date("Y-m-d H:i") . '）';
        $fileheader = ['订单号', '下单人', '活动标题', '返利金额', '发放至...', '返利类型', '发放时间', '状态', '说明'];
        getExcel($filename, $headname, $fileheader, $excels);
        exit;
    }

}
