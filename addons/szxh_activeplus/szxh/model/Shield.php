<?php 
namespace szxh\model;

class Shield extends Common {

    public function __construct() {
        parent::__construct();
        $this->setSystemTableName('shield');
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

        return $res;
    }

    public function validShield($data) {

        if(empty($data['status'])) {
            return $this->setInfo(121, '页面错误，请刷新后重试');
        }

        // 如果开启，继续验证
        if($data['status'] == 1) {

            if(empty($data['pay_url'])) {
                return $this->setInfo(124, '请填写支付域名');
            }

            if(empty($data['share_url'])) {
                return $this->setInfo(129, '请填写分享域名');
            }

            if(empty($data['shield_url'])) {
                return $this->setInfo(130, '请填写域名绑定信息');
            }

        }

        return $data;

    }

    public function saveShield($data) {
        global $_W;

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