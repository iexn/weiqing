<?php 
namespace szxh\logic;

class Config extends Common {

    /**
     * 保存
     */
    public function saveShield($data, $id = false) {
        $this->modulename = 'Shield';
        // 验证数据是否完整
        $data = model($this->modulename)->validShield($data);
        if($data === false) {
            return $this->setInfo(model($this->modulename)->getCode(), model($this->modulename)->getMessage());
        }

        $res = model($this->modulename)->saveShield($data);

        if($res === false) {
            return $this->setInfo(1099, model()->getMessage());
        }

        return $this->setInfo(0, '保存成功');
    }

}