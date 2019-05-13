<?php 
namespace szxh\model;

class Config extends Common {

    public function __construct() {
        parent::__construct();
        $this->setSystemTableName('config');
    }

    public function getShield($uniacid = false, $modulename = false) {
        
        $row = $this->findRow($uniacid, $modulename);

        if(empty($row)) {
            return false;
        }

        return [
            'is_shield' => $row['is_shield'],
            'domain2'   => $row['domain2'],
            'domain_wl' => explode("\r\n", $row['domain_wl']),
            'domain_bl' => explode("\r\n", $row['domain_bl']),
            'share_domain' => $row['share_schene'] . $row['share_domain']
        ];

    }

    public function getPayurl() {
        $row = model('Shield')->findRow();
        if(empty($row)) {
            return false;
        }
        if(empty($row['status'])) {
            return false;
        }
        if($row['status'] != 1) {
            return false;
        }
        return 'http://'.$row['pay_url'];
    }

    public function findRow($uniacid = false, $modulename = false) {
        global $_W;
        if(empty($uniacid)) {
            $uniacid = $_W['uniacid'];
        }

        if(empty($modulename)) {
            $modulename = MNAME;
        }

        $res = $this->query
                    ->from($this->tableName)
                    ->where('uniacid', $uniacid)
                    ->where('modulename', $modulename)
                    ->get();

        if(strpos($res['pay_url'], 'http://') === 0) {
            $res['schene'] = 'http://';
            $res['pay_url'] = substr($res['pay_url'], 7);
        } else if(strpos($res['pay_url'], 'https://') === 0) {
            $res['schene'] = 'https://';
            $res['pay_url'] = substr($res['pay_url'], 8);
        } else {
            $res['schene'] = '';
        }

        if(strpos($res['share_domain'], 'http://') === 0) {
            $res['share_schene'] = 'http://';
            $res['share_domain'] = substr($res['share_domain'], 7);
        } else if(strpos($res['share_domain'], 'https://') === 0) {
            $res['share_schene'] = 'https://';
            $res['share_domain'] = substr($res['share_domain'], 8);
        } else {
            $res['share_schene'] = '';
        }

        return $res;
    }

    public function validShield($data) {

        $D = [];

        if(empty($data['status'])) {
            return $this->setInfo(121, '页面错误，请刷新后重试');
        }
        $D['status'] = $data['status'];

        // 如果开启，继续验证
        if($data['status'] == 1) {

            if(empty($data['pay_url'])) {
                return $this->setInfo(124, '请填写支付域名');
            }
            $D['pay_url'] = $data['pay_url'];

            if(empty($data['share_url'])) {
                return $this->setInfo(129, '请填写分享域名');
            }
            $D['share_url'] = $data['share_url'];

            if(empty($data['shield_url'])) {
                return $this->setInfo(130, '请填写域名绑定信息');
            }
            $D['shield_url'] = $data['shield_url'];

            $D['domain_wl'] = $data['domain_wl'];
            $D['domain_bl'] = $data['domain_bl'];

        }

        return $D;

    }

    public function saveShield($data) {
        global $_W;
        $this->tableName = 'szxh_shield';

        $uniacid = $_W['uniacid'];
        $modulename = MNAME;

        if(empty($uniacid)) {
            return $this->setInfo(125, '数据错误，请检查是否已绑定微信公众号');
        }

        if(empty($modulename)) {
            return $this->setInfo(125, '数据错误，请检查模块信息是否正确');
        }

        // 获取已配置项
        $shield = $this->query->from($this->tableName)->where('uniacid', $uniacid)->where('modulename', $modulename)->get();

        // 不存在数据，添加
        if(empty($shield)) {

            $data['uniacid']    = $_W['uniacid'];
            $data['modulename'] = MNAME;

            $rse = pdo_insert($this->tableName, $data);

        } else { // 存在数据，更新

            $res = pdo_update($this->tableName, $data, [
                'uniacid' => $uniacid,
                'modulename' => $modulename
            ]);

        }

        return $res;
    }

}