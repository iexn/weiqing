<?php 
namespace szxh\model;
use szxh\Model;

/**
 * 公共模型类，已封装了后台常用部分功能
 */
class Common extends Model {

    private $code = '';
    private $message = '';
    private $data = [];
    private $url = '';
    private $validField = '';
    private $pageHtml = '';

    /**
     * 设置当前model类主表名称
     */
    protected function setTableName($name, $addon = false) {
        $this->tableName = getTableName($name);
        return $this;
    }
    
    protected function setSystemTableName($name, $addon = false) {
        $this->tableName = getSystemTableName($name);
        return $this;
    }

    public function getCode() {
        return $this->code;
    }
    public function getMessage() {
        return $this->message;
    }

    public function getValidField() {
        return $this->validField;
    }

    public function getData() {
        return $this->data;
    }

    public function getUrl() {
        return $this->url;
    }

    private function clearInfo() {
        $this->code = '';
        $this->message = '';
        $this->data = [];
        $this->url = '';
        $this->validField = '';
    }

    public function setInfo($code = 0, $message = '', $data = [], $url = '', $validField = '') {
        $this->clearInfo();
        $this->code = $code;
        $this->message = $message;
        $this->data = $data;
        $this->url = $url;
        $this->validField = $validField;
        return $code === 0;
    }

    /**
     * 保存排序，表必须为事务类型
     */
    public function sortList($sortArr = []) {
        global $_W;

        if(empty($sortArr)) {
            return true;
        }

        pdo_begin();
        foreach ($sortArr as $item) {
            $res = pdo_update($this->tableName, ['sort'=>$item['sort']], ['id'=>$item['id'], 'uniacid'=>$_W['uniacid']]);
            if($res === false) {
                pdo_rollback();
                return false;
            }
        }
        pdo_commit();

        return true;

    }

    /**
     * 删除项，支持多项删除
     * TODO: 是否存在整体一次性删除的方法
     */
    public function deleteRow($id, $checkUniacid = false) {
        global $_W;
        if(is_string($id)) {
            $ids = get_keys_array($id);
        } else {
            $ids = $id;
        }

        // 开始逐条删除
        pdo_begin();
        foreach ($ids as $id) {
            if($checkUniacid) {
                $where = ['id'=>$id, 'uniacid'=>$_W['uniacid']];
            } else {
                $where = ['id'=>$id];
            }
            $res = pdo_delete($this->tableName, $where);
            if($res === false) {
                pdo_rollback();
                return false;
            }
        }
        pdo_commit();

        return true;

    }

    /**
     * 创建20位数字订单号 - 通用
     */
    public function setsn() {
        return date('Ymd', TIMESTAMP) . get_microtime(true) . rand(0,9);
    }

    public function setPageHtml($html) {
        $this->pageHtml = $html;
    }

    public function getPageHtml() {
        $html = $this->pageHtml;
        $this->pageHtml = '';
        return $html;
    }
    
}