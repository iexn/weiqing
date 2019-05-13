<?php 
namespace szxh\logic;
use szxh\Logic;

class Common extends Logic {

    protected function sort($sortArr) {
        $modelname = $this->modelname;
        if(empty($modelname)) {
            throw new \Exception('CommonApi: 执行方法sort中系统参数$this->modelname未定义');
        }
        if(empty($sortArr)) {
            return $this->setInfo(1099, '数据异常，请按正确方式操作');
        }

        $data = [];

        foreach ($sortArr as $id => $value) {
            if(!is_numeric($value) || $value < 0) {
                return $this->setInfo(1006, '排序数值存在错误。请保证其为数字并且均大于0');
            }
            $data[] = [
                'id' => $id,
                'sort' => $value
            ];
        }

        $res = model($modelname)->sortList($data);

        if($res === false) {
            return $this->setInfo(1008, '保存失败，请稍后尝试');
        }

        return $this->setInfo(0, '保存成功');
    }


    protected function delete($ids) {
        if($_W['role'] == 'clerk') {
            return $this->setInfo(1010, '没有权限删除订单，如需操作请联系管理员');
        }
        $modelname = $this->modelname;
        if(empty($modelname)) {
            throw new \Exception('CommonApi: 执行方法delete中系统参数$this->modelname未定义');
        }
        if(empty($ids)) {
            return $this->setInfo(1099, '请选择删除项');
        }

        $res = model($this->modelname)->deleteRow($ids);

        if($res === false) {
            return $this->setInfo(1008, '删除失败，请稍后尝试');
        }

        return $this->setInfo(0, '删除成功');
    }

    protected function save($data, $id = false) {
        // 验证数据是否完整
        $data = model($this->modelname)->validSave($data, $id);
        if($data === false) {
            return $this->setInfo(model($this->modelname)->getCode(), model($this->modelname)->getMessage());
        }

        $res = model($this->modelname)->saveRow($data, $id);

        if($res !== false) {
            return $this->setInfo(0, '保存成功');
        }

        return $this->setInfo(1099, '服务器异常，请稍后再试');
    }
    
}