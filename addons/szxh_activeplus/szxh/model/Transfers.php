<?php
namespace szxh\model;

class Transfers extends Common
{

    private $ranksCount;

    public function __construct()
    {
        parent::__construct();
        $this->setTableName('transfers');
    }

    /**
     * type = 1时为企业付款，2为单人红包
     */
    public function setOrder($order_sn, $wechat_id, $reward, $type = 1, $sn_filters = [], $params = [])
    {
        global $_W;

        $transfers_sn = $this->setsn();

        $res = pdo_insert($this->tableName, [
            'transfers_sn' => $transfers_sn,
            'order_sn' => $order_sn,
            'wechat_id' => $wechat_id,
            'reward' => $reward,
            'create_time' => TIMESTAMP,
            'type' => $type,
            'uniacid' => $_W['uniacid'],
            'params' => json_encode($params),
        ]);

        if ($res === false) {
            return $this->setInfo(201, '创建奖励发放失败');
        }

        return $transfers_sn;

    }

    public function getRanks($active_id, $limit = 10)
    {
        global $_W;

        if (empty($active_id)) {
            $this->ranksCount = 0;
            return [];
        }

        $list = $this->query->from($this->tableName, 'transfers')
            ->select('sum(reward) AS rewards, transfers.wechat_id')
            ->leftjoin('szxh_activeplus_order', 'act_order')
            ->on('transfers.order_sn', 'act_order.order_sn')
            ->where('act_order.active_id', $active_id)
            ->where('transfers.uniacid', $_W['uniacid'])
            ->groupby('transfers.wechat_id')
            ->orderby('sum(reward) DESC')
            ->limit(0, $limit)
            ->getall();

        $this->ranksCount = $this->getLastQueryTotal();

        foreach ($list as &$item) {
            $fans = mc_fansinfo($item['wechat_id']);
            $item['avatar'] = $fans['tag']['avatar'];
            $item['username'] = $fans['tag']['nickname'];
        }

        return $list;
    }

    public function getRanksCount($active_id)
    {
        if (!empty($this->ranksCount)) {
            $this->getRanks($active_id);
        }
        return $this->ranksCount;
    }

    public function getList($condition, $page)
    {
        global $_W;
        $this->query->from(getTableName('Transfers'), 'transfers')
            ->select('transfers.*', 'active.title', 'ord.referrals_wechat_id', 'ord.referrals_name', 'ord.wechat_id AS order_user_id')
            ->leftjoin(getSystemTableName('Activeplus'), 'active')
            ->on('transfers.active_id', 'active.id')
            ->leftjoin(getTableName('Order'), 'ord')
            ->on('ord.order_sn', 'transfers.order_sn')
            ->where(['transfers.uniacid' => $_W['uniacid']])
            ->orderby('transfers.create_time', 'DESC');

        if ($page !== false) {
            $this->query->page($page, 10);
        }

        if (!empty($condition['start'])) {
            $this->query->where('transfers.create_time >=', is_time(1, $condition['start'])['start']);
        }
        if (!empty($condition['end'])) {
            $this->query->where('transfers.create_time <=', is_time(1, $condition['end'])['end']);
        }

        if (!empty($condition['active_id'])) {
            $this->query->where('transfers.active_id', $condition['active_id']);
        }

        if (!empty($condition['title'])) {
            $this->query->where('active.title LIKE', '%' . $condition['title'] . '%');
        }

        if (!empty($condition['order_sn'])) {
            $this->query->where('transfers.order_sn LIKE', '%' . $condition['order_sn'] . '%');
        }
        if (!empty($condition['send_type'])) {
            $this->query->where('transfers.send_type', $condition['send_type']);
        }
        $list = $this->getall();

        $total = $this->getLastQueryTotal();
        $this->setPageHtml(pagination($total, $page, 10));
        return $list;
    }

}
