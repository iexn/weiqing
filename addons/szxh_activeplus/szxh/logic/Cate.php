<?php 
namespace szxh\logic;

class Cate extends Common {

    protected $modelname = 'Cate';

    public function getList() {

        $list = model('Cate')->getList();
        if(empty($list)) {
            $list = [];
        }
        return $list;
        
    }

    public function sort($sortArr) {
        return parent::sort($sortArr);
    }

    public function delete($ids) {
        return parent::delete($ids);
    }

    public function save($data, $id = false) {
        $id = $id ?: false;
        return parent::save($data, $id);
    }

}