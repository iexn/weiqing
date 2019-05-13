<?php 
namespace szxh;
class Model extends \We7Table {

    private $code         = '';
    private $message      = '';
    private $data         = [];
    private $url          = '';
    private $validField   = '';
    protected $valid_rule = [];
    protected $valid_msg  = [];
    private $cacheData    = [];

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
        $this->code       = '';
        $this->message    = '';
        $this->data       = [];
        $this->url        = '';
        $this->validField = '';
    }

    public function setInfo($code = 0, $message = '', $data = [], $url = '', $validField = '') {
        $this->clearInfo();
        $this->code       = $code;
        $this->message    = $message;
        $this->data       = $data;
        $this->url        = $url;
        $this->validField = $validField;
        return $code === 0;
    }

    protected function setValidateRule($rule) {
        $this->valid_rule = $rule;
        return $this;
    }

    protected function setValidateMsg($msg) {
        $this->valid_msg = $msg;
        return $this;
    }

    protected function validate($data) {
        if(!$this->valid_rule) {
            return error(0);
        }
        $validator = \Validator::create($data, $this->valid_rule, $this->valid_msg);
        $result = $validator->valid();
        return $result;
    }

    /**
     * 设置缓存数据
     */
    public function cache($key, $value = null) {
        if($value == null) {
            return $this->cacheData[$key];
        } else {
            $this->cacheData[$key] = $value;
        }
        return $this;
    }

}