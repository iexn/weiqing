<?php 
namespace szxh\model;

class Log extends Common {

    public function __construct() {
        parent::__construct();
        $this->setSystemTableName('log');
    }

    public function add($name, $content) {
        pdo_insert($this->tableName, [
            'name' => $name,
            'content' => $content,
            'create_time' => TIMESTAMP
        ]);
    }

}