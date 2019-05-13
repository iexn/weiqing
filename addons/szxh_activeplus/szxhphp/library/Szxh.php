<?php 
namespace szxh;

use szxh\template\Template;

class szxh extends \WeModuleSite {

    protected $className;

    // 暂存数据对象
    private $assignData = [];

    // 其他模板引擎类
    private $T = null;

    public function __construct() {
        global $_W;
        load()->model('site');

        // 加载框架文件
        $this->loadExtend();

        if(TEMPLATE == 'THINK') {
            include MFRAME. '/library/template/Template.php';
            $this->T = new Template();
        }

    }

    /******************       TP风格函数             ***************/

    /**
     * 生成模板函数
     */
    public function display($name) {
        global $_W, $_GPC;
        if(TEMPLATE == 'THINK') {
            $path = '';
            if(!defined('IN_SYS')) {
                $path = 'mobile/';
            }
            $this->T->fetch($path.$name);
        }
        foreach ($this->assignData as $key => $value) {
            $$key = $value;
        }
        include $this->template($name);
        return;
    }

    /**
     * 创建模板用变量
     */
    public function assign($field = '', $value = '') {
        if(TEMPLATE == 'THINK') {
            // TODO: 数据带不过去
            $this->T->assign($field, $value);
        }
        // 如果第一个参数为数组，意味着多项变量一起传。这是第二个参数没有用
        if(is_array($field)) {
            foreach ($field as $key => $val) {
                $this->assignData[$key] = $val;
            }
        } else {
            $this->assignData[$field] = $value;
        }
    }

    /**
     * 返回接口
     */
    protected function result($errno, $message, $data = '') {
        header('Content-Type:application/json;charset=utf-8');
        exit(json_encode(array(
            'errno' => $errno,
            'message' => $message,
            'data' => $data,
        )));
    }

    /**
     * 加载框架必备内容
     */
    private function loadExtend() {

        include MFRAME. '/common/functions.php';
        include MFRAME. '/library/Guard.php';
        include MFRAME. '/library/Logic.php';
        include MFRAME. '/library/Model.php';
        include MFRAME. '/library/Db.php';

        $funcDir = MROOT. '/szxh/function';

        // 加载框架内所有自定义function.php，定位在szxh/function文件夹中
        if(is_dir($funcDir)) {

            $files = scandir($funcDir);
            if(!empty($files)) {

                // common.php拥有最高加载权
                $commonFunction = $funcDir.'/common.php';

                if(file_exists($commonFunction)) {
                    include $commonFunction;
                }

                foreach ($files as $file) {
                    if($file == '.' || $file == '..') {
                        continue;
                    }
                    if($file == 'common.php') {
                        continue;
                    }

                    if(preg_match('/\.php$/is', $file)) {
                        include $funcDir . '/' . $file;
                    }

                }

            }

        }
    }

}