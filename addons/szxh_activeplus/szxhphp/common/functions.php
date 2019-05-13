<?php 
/**
 * 创建加载model和logic的构造器
 *
 * @param string $type 构造器类型，可选值为model和logic
 * @param string $name 构造器名称，对应文件夹中的php文件名，如 Name => Name.php
 * @return object 返回构造器指定实例的类单例
 */
function L($type, $name) {
    if(!in_array($type, ['model', 'logic'])) {
        throw new Exception("系统内部错误：L函数加载器类型有误", 1);
    }
    static $loaded = [
        'model' => [],
        'common_model' => false,
        'logic' => [],
        'common_logic' => false
    ];

    $classObject = $loaded[$type][$name];
    if(!empty($classObject)) {
        return $classObject;
    }

    global $_W;
    $commonfile = MROOT. "/szxh/{$type}/Common.php";
    $logicfile  = MROOT. "/szxh/{$type}/{$name}.php";

    $namespaceName = str_replace('/', '\\', $name);
    $className  = "szxh\\{$type}\\{$namespaceName}";

    if(!$loaded["common_". $type] && file_exists($commonfile)) {
        include $commonfile;
        $loaded["common_". $type] = true;
    }

    if(!file_exists($logicfile)) {
        throw new Exception("{$logicfile} 文件未找到", 1);
    }
    include $logicfile;

    if(!class_exists($className)) {
        throw new Exception("class {$className} 未找到", 1);
    }
    $class = new $className();
    $loaded[$type][$name] = $class;
    return $class;
}

/**
 * 类似tp的model函数
 *
 * @param string $name model文件名称
 * @return object 返回model文件单例
 */
function model($name = '') {
    static $modelObj;
    if(empty($name) && !empty($modelObj)) {
        return $modelObj;
    }
    $modelObj = L('model', $name);
    return $modelObj;
}

/**
 * 类似model函数的logic函数
 *
 * @param string $name logic文件名称
 * @return object 返回logic文件单例
 */
function logic($name = '') {
    static $logicObj;
    if(empty($name) && !empty($logicObj)) {
        return $logicObj;
    }
    $logicObj = L('logic', $name);
    return $logicObj;
}

/**
 * 保证当前状态为正常状态，否则执行对应的处理
 * @param  string $name 执行状态名称
 * @param  any $any 执行对应状态需要的参数，从第二个参数起一直往后
 * @return void
 */
function guard($name = '') {
    $params = func_get_args();
    array_shift($params);
    return call_user_func_array("\\szxh\\Guard::$name", $params);
}

function db($name = '')
{
    $params = func_get_args();
    array_shift($params);
    return call_user_func_array("\\szxh\\Db::$name", $params);
}

/**
 * 获取附加功能类文件，需要自己实例其中的类
 * $class 为调用文件路径，以vendor目录开始，比如：wxpay/Transfers，不需要添加后缀.php
 */
function vendor($class) {

    static $vendor = [];

    // 连接过的文件直接返回正常实例前的名字
    if(!empty($vendor[$class])) {
        return $vendor[$class];
    }

    $filename = MFRAME. "/vendor/{$class}.php";

    if(!file_exists($filename)) {
        throw new \Exception("{$filename}文件未找到", 1);
        
    }

    include MFRAME. "/vendor/{$class}.php";

    $classname = 'szxh\\'. str_replace('/', '\\', $class);

    if(!class_exists($classname)) {
        throw new \Exception("{$classname}不存在", 1);
    }

    $vendor[$class] = $classname;

    return $classname;

}

/**
 * 获取指定参数域名的主域名部分
 *
 * @param string $servername 域名
 * @return string 当前域名的主域名
 */
function domain($servername) {
    $server = array_reverse(explode('.', $servername));
    return $server[1]. '.'. $server[0]; // domain.com
}

/**
 * 获取实际访问的主机名
 *
 * @param boolean $scheme 默认为false。如果为true，在主机名前添加协议
 * @return string 返回当前访问的主机名
 */
function servername($scheme = false) {
    $hostname = $_SERVER['HTTP_HOST'];
    if($scheme) {
        $hostname = scheme() . $hostname;
    }
    return $hostname;
}

/**
 * 获取当前访问协议，包含 ://
 */
function scheme() {
    return $_SERVER['REQUEST_SCHEME'] ? $_SERVER['REQUEST_SCHEME'] .'://' : 'http://';
}

/**
 * 为当前链接添加锚点 #
 *
 * @param string $url 需要添加锚点的链接，如果链接中包含锚点，此函数将取消当前锚点。
 * @param string $hash 锚点名。不设置将不添加锚点
 * @return string 包含锚点名的URL地址
 */
function ref($url, $hash = '') {
    if(strpos($url, '#') !== false) {
        $url = explode('#', $url)[0];
    }
    if(!empty($hash)) {
        $hash = '#'.$hash;
    }
    return $url.$hash;
}

/**
 * 增加微信标识锚点名
 *
 * @param string 需要添加微信标识锚点的链接
 * @return string 包含微信锚点的URL地址
 */
function wxref($url) {
    if(strpos($url, 'wxref=mp.weixin.qq.com') !== false && strpos($url, '#wechat_redirect') === false) {
        $url = ref($url, 'wechat_redirect');
    }
    return $url;
}

/**
 * 当前域名地址，默认为当前访问地址
 * $params必须为数组
 * $use_gets是否使用$_GET参数
 */
function address($params = [], $use_gets = true) {
    global $_W;
    if($use_gets) {
        $params = array_merge($_GET, $params);
    }
    return $_W['script_name'] . '?' . http_build_query($params);
}

/**
 * $_GET 所有参数转换为地址栏字符串形式
 */
function get_query($get) {
    return wxref(http_build_query($get));
}

/**
 * 网站自定义跳转，在当前子模块中跳转
 * aurl(2);                             => et=2
 * aurl(2, 40);                         => et=2&eid=40
 * aurl(2, 'active');                   => et=2&m=szxh_module&do=active
 * aurl(['order_id'=>12]);              => order_id=12
 * aurl(2, ['order_id'=>12]);           => et=2&order_id=12
 * aurl(2, 40, ['order_id'=>12]);       => et=2&eid=40&order_id=12
 * aurl(2, 'active', ['order_id'=>12]); => et=2&m=szxh_module&do=active&order_id=12
 * aurl('active');                      => m=szxh_module&do=active
 * aurl('active', ['order_id'=>12]);    => m=szxh_module&do=active&order_id=12
 * 
 */
function aurl($et = false, $eid = false, $paramsTo = []) {

    global $_W, $_GPC;

    $query = [];
    if(!is_numeric($et)) {
        $paramsTo = $eid;
        $eid = $et;
        $et = false;
    }

    if(is_array($eid)) {
        $paramsTo = $eid;
        $eid = false;
    }

    if(!is_array($paramsTo)) {
        $paramsTo = [];
    }


    if(empty($et) && !empty($paramsTo['et'])) {
        $et = $paramsTo['et'];
        unset($paramsTo['et']);
    }

    if(!empty($paramsTo['eid']) || !empty($paramsTo['do'])) {
        $eid = $paramsTo['eid'] ?: $paramsTo['do'];
        unset($paramsTo['eid']);
        unset($query['do']);
    } else if(empty($eid)) {
        if(!empty($_GPC['eid'])) {
            $eid = $_GPC['eid'];
        } else {
            $eid = $_GPC['do'];
        }
    }
    
    if(is_numeric($eid)) {
        $query['eid'] = $eid;
    } else if(is_string($eid)) {
        $query['m'] = MNAME;
        $query['do'] = $eid;
    }

    if(!empty($et)) {
        $query['et'] = $et;
    }

    $query = array_merge($query, ['version_id' => 0], $paramsTo);

    return url('site/entry', $query);
}

/**
 * 手机自定义跳转，在当前子模块中跳转
 */
function purl($do, $query = [], $noredirect = true, $addhost = false) {
    global $_W;
    unset($query['i']);
    unset($query['c']);
    $query['do'] = $do;
    $query['m'] = $query['m'] ?: strtolower(MNAME);
    return murl('entry', $query, $noredirect, $addhost);
}

/**
 * 跳转至其他链接
 * 建议配合aurl和purl使用
 */
function tolink($url) {
    header("location: " . $url, true);
    exit;
}

/**
 * 从微擎后台生成可在app端查看的指定页面
 * $do 跳转app.inc
 * $params 自定义参数
 */
function web2app_url($do, $params = [], $hash = '', $addhost = false) {
    global $_W;
    $modelurl = purl($do, $params, true, $addhost);

    $p = explode('?', $modelurl, 2);

    if(count($p) < 2) {
        array_unshift($p, '');
    }

    $scriptName = str_replace('web', 'app', $_SERVER['SCRIPT_NAME']);

    $url = servername(true).$scriptName.'?'. $p[1];

    return ref($url, $hash);
}

/**
 * 获取多选的名称分组，支持使用 , ; | / 拆分
 * 如： '1,2,3'或'1;2;3' 可变为 ['1','2','3']
 */
function get_keys_array($keys = '') {
    if(is_array($keys)) {
        return $keys;
    }
    return preg_split('/[,;|\/]+/', trim($keys));
}

/**
 * 驼峰法转小写下划线命名 
 * 如： getName => get_name
 */
function camelToLower($str = '') {
    return strtolower(preg_replace('/((?<=[a-z])(?=[A-Z]))/', '_', $str));
}

/**
 * 驼峰法转大写下划线命名 
 * 如： getName => GET_NAME
 */
function camelToUpper($str = '') {
    return strtoupper(preg_replace('/((?<=[a-z])(?=[A-Z]))/', '_', $str));
}

/**
 * 获取时间上下限时间戳数组，参数2为时间戳，默认为当前时间
 * 参数1： 1当天  2本月  3今年
 * timestring 最好传日期格式，传时间戳容易出问题
 */
function is_time($type = 1, $timeString = 0) {
    if($timeString === false) {
        return [
            "start" => false,
            "end"   => false
        ];
    }
    if(strtotime($timeString) === false) {
        if (!(is_numeric($timeString) && 0 < $timeString)) {$timeString = $_SERVER['REQUEST_TIME'];}
    } else {
        $timeString = strtotime($timeString);
    }
    $timeArray = array();
    switch ($type) {
        case 1://当天日期范围
            $timeArray['start'] = strtotime(date('Y-m-d 00:00:00', $timeString));
            $timeArray['end'] = $timeArray['start']+3600*24-1;
            break;
        case 2://当月日期范围
            $timeArray['start'] = strtotime(date('Y-m-01 00:00:00', $timeString));
            $timeArray['end'] = $timeArray['start']+3600*24*date('t', $timeString)-1;
            break;
        case 3://当年日期范围
            $timeArray['start'] = strtotime(date('Y-01-01 00:00:00', $timeString));
            $timeArray['end'] = $timeArray['start']+(!!date('L', $timeString)?366:365)*3600*24-1;
            break;
    }
    return $timeArray;
}

/**
 * true：获取毫秒表示时间字符串
 * 默认：毫秒时间戳
 * @return string
 */
function get_microtime($boolean = false) {
    // $microtime = microtime();
    // $microtime = explode(' ', $microtime);
    // $mic  = substr($microtime[0], 2, 3);  //毫秒
    // if($boolean) {
    //  $time = date('His', $microtime[1]);  //时间
    // } else {
    //  $time = $microtime[1];
    // }
    $microtime = $_SERVER['REQUEST_TIME_FLOAT'];
    $microtime = explode('.', $microtime);
    $mic = $microtime[1];
    while(strlen($mic) < 4) {
        $mic = '0'.$mic;
    }
    if($boolean) {
        $time = date('His', $microtime[0]);
    } else {
        $time = $microtime[0];
    }
    return $time.$mic;
}

/**
 * 正则调用
 *
 * @param string 需要验证的字符串
 * @param string 需要验证的类型，可以选择以下switch项，还可自定义正则表达式，如：/\w+/。左右两边的/可以省略
 * @param array 特殊验证需要传递此参数
 * @return 如果验证成功，返回true，否则返回false
 */
function is($value, $rule, $data = []) {
    switch ($rule) {
        case 'require':
            // 必须
            $result = !empty($value) || '0' == $value;
            break;
        case 'accepted':
            // 接受
            $result = in_array($value, ['1', 'on', 'yes']);
            break;
        case 'date':
            // 是否是一个有效日期
            $result = false !== strtotime($value);
            break;
        case 'alpha':
            // 只允许字母
            $result = regex($value, '/^[A-Za-z]+$/');
            break;
        case 'alphaNum':
            // 只允许字母和数字
            $result = regex($value, '/^[A-Za-z0-9]+$/');
            break;
        case 'alphaDash':
            // 只允许字母、数字和下划线 破折号
            $result = regex($value, '/^[A-Za-z0-9\-\_]+$/');
            break;
        case 'chs':
            // 只允许汉字
            $result = regex($value, '/^[\x{4e00}-\x{9fa5}]+$/u');
            break;
        case 'chsAlpha':
            // 只允许汉字、字母
            $result = regex($value, '/^[\x{4e00}-\x{9fa5}a-zA-Z]+$/u');
            break;
        case 'chsAlphaNum':
            // 只允许汉字、字母和数字
            $result = regex($value, '/^[\x{4e00}-\x{9fa5}a-zA-Z0-9]+$/u');
            break;
        case 'chsDash':
            // 只允许汉字、字母、数字和下划线_及破折号-
            $result = regex($value, '/^[\x{4e00}-\x{9fa5}a-zA-Z0-9\_\-]+$/u');
            break;
        case 'activeUrl':
            // 是否为有效的网址
            $result = checkdnsrr($value);
            break;
        case 'ip':
            // 是否为IP地址
            $result = filter($value, [FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 | FILTER_FLAG_IPV6]);
            break;
        case 'url':
            // 是否为一个URL地址
            $result = filter($value, FILTER_VALIDATE_URL);
            break;
        case 'float':
            // 是否为float
            $result = filter($value, FILTER_VALIDATE_FLOAT);
            break;
        case 'number':
            $result = is_numeric($value);
            break;
        case 'integer':
            // 是否为整型
            $result = filter($value, FILTER_VALIDATE_INT);
            break;
        case 'email':
            // 是否为邮箱地址
            $result = filter($value, FILTER_VALIDATE_EMAIL);
            break;
        case 'boolean':
            // 是否为布尔值
            $result = in_array($value, [true, false, 0, 1, '0', '1'], true);
            break;
        case 'array':
            // 是否为数组
            $result = is_array($value);
            break;
        case 'file':
            $result = $value instanceof File;
            break;
        case 'image':
            $result = $value instanceof File && in_array(getImageType($value->getRealPath()), [1, 2, 3, 6]);
            break;
        case 'token':
            $result = token($value, '__token__', $data);
            break;
        case 'id':
            // 单个ID
            $result = regex($value, '/^[1-9][0-9]*$/');
            break;
        case 'ids':
            // ID序列
            $result = regex($value, '/^[1-9][0-9]*(,[1-9][0-9]*)*$/');
            break;
        case 'mobile':
            // 手机号
            $result = regex($value, '/^0?(1[0-9][0-9])[0-9]{8}$/');
            break;
        case 'email':
            // 邮箱
            $result = regex($value, '/[\\w!#$%&\'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?/');
            break;
        case 'qq':
            // qq
            $result = regex($value, '/^\d{5,10}$/');
            break;
        case 'password':
            // 登录密码
            $result = regex($value, '/^(?=.*\\d)(?=.*[a-zA-Z]).{6,16}$/');
            break;
        case 'price':
            // 价格数字字符串，可以为负
            $result = regex($value, '/^(\-)?\d+(\.\d{0,2})?$/');
            break;
        default:
            // 正则验证
            $result = regex($value, $rule);
    }
    return $result;
}

/**
 * 创建正则表达式并且开始验证
 *
 * @param string 需要验证的字符串
 * @param string 正则表达式，左右两边的/可以省略
 * @return boolean 如果验证成功，返回true，否则返回false
 */
function regex($name, $rule) {
    if (0 !== strpos($rule, '/') && !preg_match('/\/[imsU]{0,4}$/', $rule)) {
        // 不是正则表达式则两端补上/
        $rule = '/^' . $rule . '$/';
    }
    return 1 === preg_match($rule, (string) $name);
}


function filter($value, $rule) {
    if (is_string($rule) && strpos($rule, ',')) {
        list($rule, $param) = explode(',', $rule);
    } elseif (is_array($rule)) {
        $param = isset($rule[1]) ? $rule[1] : null;
        $rule  = $rule[0];
    } else {
        $param = null;
    }
    return false !== filter_var($value, is_int($rule) ? $rule : filter_id($rule), $param);
}

/**
 * 获取用户信息
 * 当$openid为true时获取当前打开页面的用户信息
 */
function userinfo($openid = true) {
    global $_W;
    if($openid === true) {
        return $_W['fans']['tag'] ?: false;
    }
    if($_W['fans']['openid'] == $openid) {
        return $_W['fans']['tag'] ?: false;
    }
    return mc_fansinfo($openid)['tag'] ?: false;
}

/**
 * 返回是否是操作员
 * Tips：微擎后台权限分站长、管理员和操作员(clerk)
 */
function isclerk() {
    global $_W;

    if($_W['role'] != 'clerk') {
        return false;
    }

    return true;
}

/**
 * 导出excel表格
 *
 * @param String $fileName 文件名
 * @param String $headname 标题名
 * @param Array $headArr   表头数组
 * @param Array-Array $data 数据二维数组
 * @return void
 */
function getExcel($fileName, $headname, $headArr, $data) {

    load()->library('phpexcel/PHPExcel');
    load()->library('phpexcel/PHPExcel/Writer/Excel2007');
    load()->library('phpexcel/PHPExcel/Writer/Excel5');
    load()->library('phpexcel/PHPExcel/IOFactory');

    if(empty($data) || !is_array($data)){
        echo "当前数据不能导出，或不存在数据";
        exit;
    }
    if(empty($fileName)){
        echo "文件名不能为空";
        exit;
    }
 
    // 重新定义文件名 
    $date = date("Y_m_d",time());
    $fileName .= "_{$date}.xlsx";

    //创建新的PHPExcel对象 
    $objPHPExcel = new \PHPExcel();
    $objProps = $objPHPExcel->getProperties();
    
    //设置活动单指数到第一个表,所以Excel打开这是第一个表
    $objPHPExcel->setActiveSheetIndex(0);

    $row = 1;
    if(!empty($headname)) {
        $row++;
    }

    //设置表头
    $key = ord("A");

    $objActSheet = $objPHPExcel->getActiveSheet();

    // 设置第一行标题
    // 设置合并宽度
    $headspan = ord('A');
    $headspan += count($headArr) - 1;
    $headspan = chr($headspan);
    // 合并第一行
    $objActSheet->mergeCells('A1:'.$headspan.'1');
    // 设置第一行文字
    $objActSheet->setCellValue('A1', $headname);
    // 第一行加粗
    $objActSheet->getStyle('A1')->getFont()->setBold(true);
    // 获取第一行对齐方式
    $objAlignA5 = $objActSheet->getStyle('A1')->getAlignment();
    // 第一行文字居中
    $objAlignA5->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

    // 加载表头
    foreach($headArr as $v){
        $colum = chr($key);
        // 设置表头值
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum.$row, $v);
        // 设置表头样式 - 设置成文本格式
        $objActSheet->getStyle($colum)->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_TEXT);
        // 设置表头样式 - 设置成粗体
        $objActSheet->getStyle($colum.$row)->getFont()->setBold(true);
        $key += 1;
    }

    // 从第二行开始写入数据
    $column = $row + 1;
    // 写入数据
    foreach($data as $key => $rows) { //行写入
        $span = ord("A");
        foreach($rows as $keyName=>$value) {// 列写入
            $j = chr($span);
            $objActSheet->setCellValue($j.$column, filterExcel($value));
            $span++;
        }
        $column++;
    }

    // 修改文字编码
    $filename = iconv("utf-8", "gb2312", $filename);
    // $sheetname = iconv("utf-8", "gb2312", $sheetname);

    //重命名表
    // $objPHPExcel->getActiveSheet()->setTitle($sheetname);

    

    //将输出重定向到一个客户端web浏览器(Excel2007)
    ob_clean();
    // header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    // header("Content-Disposition: attachment; filename=\"$fileName\"");
    // header('Cache-Control: max-age=0');
    // $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
    header('Pragma:public');
    header('Expires:0');
    header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
    header('Content-Type:application/force-download');
    header('Content-Type:application/vnd.ms-excel');
    header('Content-Type:application/octet-stream');
    header('Content-Type:application/download');
    header("Content-Disposition: attachment; filename=\"$fileName\"");
    header('Content-Transfer-Encoding:binary');
    $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $objWriter->save('php://output'); //文件通过浏览器下载
    exit;

}

/**
 * 处理导出excel特殊字符
 */
function filterExcel($value) {
    $value = filterEmoji($value);
    $value = str_replace('==', '=', $value);
    return $value;
}

/**
 * 处理特殊字符
 */
function filterEmoji($emojiStr){
    $emojiStr = preg_replace_callback('/./u',function(array $match){
        return strlen($match[0]) >= 4 ? '' : $match[0];
    },$emojiStr);
    return $emojiStr;
}

/**
 * 生成为二维码图片
 * @param string $string 二维码图片扫描内容
 */
function output_qrcode($string) {
    ob_clean();
    load()->library('qrcode');
    echo Qrcode::png($string);
}

/**
 * 获取表名，与 $this->setTableName() 设置结果一致。
 */
function getTableName($name, $addon = false) {
    if(empty($addon)) {
        $addon = MPREFIX;
    } else {
        $addon .= '_';
    }
    return $addon. camelToLower($name);
}

/**
 * 获取表名，与 $this->setSystemTableName() 设置结果一致
 */
function getSystemTableName($name, $addon = false) {
    if(empty($addon)) {
        $addon = M_SYSTEM_PREFIX;
    } else {
        $addon .= '_';
    }
    return $addon. camelToLower($name);
}

/**
 * 获取当前公众号配置项
 * getSystemConfig=true时获取系统配置项
 */
function getConfig($getSystemConfig = false) {
    global $_W;

    $configSql = "SELECT * FROM ". tablename(getTableName('config')) ." WHERE uniacid=". $_W['uniacid'] ." LIMIT 1";
    $insertSql = "INSERT INTO ". tablename(getTableName('config')) ." (uniacid) VALUES (". $_W['uniacid'] .")";

    $row = pdo_fetch($configSql);

    if(empty($row)) {
        pdo_run($insertSql);
        $row = getConfig($getSystemConfig);
    }

    return $row;
}

function getSystemConfig($name = true) {
    global $_W;

    $configSql = "SELECT * FROM ". tablename(getSystemTableName('config')) ." WHERE uniacid=". $_W['uniacid'] ." AND modulename='" . MNAME . "' LIMIT 1";
    $insertSql = "INSERT INTO ". tablename(getSystemTableName('config')) ." (uniacid, modulename) VALUES (". $_W['uniacid'] .", '" . MNAME . "')";

    $row = pdo_fetch($configSql);

    if(empty($row)) {
        pdo_run($insertSql);
        $row = getSystemConfig($name);
    }

    if($name !== true) {
        $keys = get_keys_array($name);
        $config = [];
        foreach($keys as $key) {
            $config[$key] = $row[$key];
        }
        return $config;
    }

    return $row;
}

function setSystemConfig($name, $value) {
    global $_W;

    $sets = [];
    if(is_array($name)) {
        $sets = array_merge($sets, $name);
    } else {
        $sets[$name] = $value;
    }

    $set = [];
    foreach($sets as $setKey => $setValue) {
        $set[] = $setKey . '="' . $setValue . '"';
    }
    
    $updateSqlSet = implode(' AND ', $set);

    if(empty($updateSqlSet)) {
        return '缺少保存内容';
    }

    $configSql = "SELECT * FROM ". tablename(getSystemTableName('config')) ." WHERE uniacid=". $_W['uniacid'] ." AND modulename='" . MNAME . "' LIMIT 1";
    $insertSql = "INSERT INTO ". tablename(getSystemTableName('config')) ." (uniacid, modulename) VALUES (". $_W['uniacid'] .", '" . MNAME . "')";
    $updateSql = "UPDATE ". tablename(getSystemTableName('config')) ." SET %s WHERE uniacid=". $_W['uniacid'] ." AND modulename='". MNAME ."'";
    $updateSql = sprintf($updateSql, $updateSqlSet);


    $row = pdo_fetch($configSql);
    if(empty($row)) {
        pdo_run($insertSql);
        return setSystemConfig($name, $value);
    }

    $row = pdo_fetch($updateSql);
    if($row === false) {
        return '保存失败';
    }

    return true;
}

/**
 * 人性化显示打印信息（针对服务器没有开启xdebug情况）
 */
function dump($value) {
    echo '<pre>';
    var_dump($value);
    echo '</pre>';
}

/**
 * 在php中创建js的console对象进行打印
 */
function console($message, $type = 'log') {
    echo "<script>console.{$type}({$message})</script>";
}

/**
 * 封装系统的register_jssdk函数，分别判断微信版本调用不同版本的jssdk
 */
function wx_jssdk($debug = false){
    
    $agent = $_SERVER['HTTP_USER_AGENT'];

    preg_match("/MicroMessenger\\\/\(\\w+\\.\\w+\\.\\w+\)[\\s\\S]/", $agent, $agentres);

    if(empty($agentres)) {
        register_jssdk($debug);
        return 0;
    }

    $version = str_replace('.', '', $agentres[1]);

    // 老版本微信
    if($version < 672) {
        register_jssdk($debug);
        return $version;
    }

    global $_W;
    
    if (defined('HEADER')) {
        echo '';
        return;
    }
    
    $sysinfo = array(
        'uniacid'   => $_W['uniacid'],
        'acid'      => $_W['acid'],
        'siteroot'  => $_W['siteroot'],
        'siteurl'   => $_W['siteurl'],
        'attachurl' => $_W['attachurl'],
        'cookie'    => array('pre'=>$_W['config']['cookie']['pre'])
    );
    if (!empty($_W['acid'])) {
        $sysinfo['acid'] = $_W['acid'];
    }
    if (!empty($_W['openid'])) {
        $sysinfo['openid'] = $_W['openid'];
    }
    if (defined('MODULE_URL')) {
        $sysinfo['MODULE_URL'] = MODULE_URL;
    }
    $sysinfo = json_encode($sysinfo);
    $jssdkconfig = json_encode($_W['account']['jssdkconfig']);
    $debug = $debug ? 'true' : 'false';
    
    $script = <<<EOF

<script src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script type="text/javascript">
    window.sysinfo = window.sysinfo || $sysinfo || {};
    
    // jssdk config 对象
    jssdkconfig = $jssdkconfig || {};
    
    // 是否启用调试
    jssdkconfig.debug = $debug;
    
    jssdkconfig.jsApiList = [
        'checkJsApi',
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo',
        'hideMenuItems',
        'showMenuItems',
        'hideAllNonBaseMenuItem',
        'showAllNonBaseMenuItem',
        'translateVoice',
        'startRecord',
        'stopRecord',
        'onRecordEnd',
        'playVoice',
        'pauseVoice',
        'stopVoice',
        'uploadVoice',
        'downloadVoice',
        'chooseImage',
        'previewImage',
        'uploadImage',
        'downloadImage',
        'getNetworkType',
        'openLocation',
        'getLocation',
        'hideOptionMenu',
        'showOptionMenu',
        'closeWindow',
        'scanQRCode',
        'chooseWXPay',
        'openProductSpecificView',
        'addCard',
        'chooseCard',
        'openCard',
        'updateAppMessageShareData',
        'updateTimelineShareData'
    ];
    
    wx.config(jssdkconfig);
    
</script>
EOF;
    echo $script;
    return $version;
}

/**
 * requirejs版本加载wx
 * 封装系统的register_jssdk函数，分别判断微信版本调用不同版本的jssdk
 */
function require_wx_jssdk($debug = false) {
    
    $agent = $_SERVER['HTTP_USER_AGENT'];

    preg_match("/MicroMessenger\\\/\(\\w+\\.\\w+\\.\\w+\)[\\s\\S]/", $agent, $agentres);

    if(empty($agentres)) {
        require_register_jssdk($debug);
        return 0;
    }

    $version = str_replace('.', '', $agentres[1]);

    // 老版本微信
    if($version < 672) {
        require_register_jssdk($debug);
        return $version;
    }

    global $_W;
    
    if (defined('HEADER')) {
        echo '';
        return;
    }
    
    $sysinfo = array(
        'uniacid'   => $_W['uniacid'],
        'acid'      => $_W['acid'],
        'siteroot'  => $_W['siteroot'],
        'siteurl'   => $_W['siteurl'],
        'attachurl' => $_W['attachurl'],
        'cookie'    => array('pre'=>$_W['config']['cookie']['pre'])
    );
    if (!empty($_W['acid'])) {
        $sysinfo['acid'] = $_W['acid'];
    }
    if (!empty($_W['openid'])) {
        $sysinfo['openid'] = $_W['openid'];
    }
    if (defined('MODULE_URL')) {
        $sysinfo['MODULE_URL'] = MODULE_URL;
    }
    $sysinfo = json_encode($sysinfo);
    $jssdkconfig = json_encode($_W['account']['jssdkconfig']);
    $debug = $debug ? 'true' : 'false';
    
    $script = <<<EOF

<script type="text/javascript">
    require.config({
        'paths': {
            'wx': 'http://res.wx.qq.com/open/js/jweixin-1.4.0'
        }
    });

    require(['wx'], function(wx) {
            
        
        window.sysinfo = window.sysinfo || $sysinfo || {};
        
        // jssdk config 对象
        jssdkconfig = $jssdkconfig || {};
        
        // 是否启用调试
        jssdkconfig.debug = $debug;
        
        jssdkconfig.jsApiList = [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'hideMenuItems',
            'showMenuItems',
            'hideAllNonBaseMenuItem',
            'showAllNonBaseMenuItem',
            'translateVoice',
            'startRecord',
            'stopRecord',
            'onRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'uploadVoice',
            'downloadVoice',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard',
            'updateAppMessageShareData',
            'updateTimelineShareData'
        ];
        
        wx.config(jssdkconfig);
        
    });
</script>
EOF;
    echo $script;
    return $version;
}

function require_register_jssdk($debug = false) {
	
	global $_W;
	
	if (defined('HEADER')) {
		echo '';
		return;
	}
	
	$sysinfo = array(
		'uniacid' 	=> $_W['uniacid'],
		'acid' 		=> $_W['acid'],
		'siteroot' 	=> $_W['siteroot'],
		'siteurl' 	=> $_W['siteurl'],
		'attachurl' => $_W['attachurl'],
		'cookie' 	=> array('pre'=>$_W['config']['cookie']['pre'])
	);
	if (!empty($_W['acid'])) {
		$sysinfo['acid'] = $_W['acid'];
	}
	if (!empty($_W['openid'])) {
		$sysinfo['openid'] = $_W['openid'];
	}
	if (defined('MODULE_URL')) {
		$sysinfo['MODULE_URL'] = MODULE_URL;
	}
	$sysinfo = json_encode($sysinfo);
	$jssdkconfig = json_encode($_W['account']['jssdkconfig']);
	$debug = $debug ? 'true' : 'false';
	
	$script = <<<EOF

<script type="text/javascript">
    require.config({
        paths: {
            'wx': 'https://res.wx.qq.com/open/js/jweixin-1.3.2'
        }
    });
    require(['wx'], function(wx) {
        window.sysinfo = window.sysinfo || $sysinfo || {};
	
        // jssdk config 对象
        jssdkconfig = $jssdkconfig || {};
        
        // 是否启用调试
        jssdkconfig.debug = $debug;
        
        jssdkconfig.jsApiList = [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'hideMenuItems',
            'showMenuItems',
            'hideAllNonBaseMenuItem',
            'showAllNonBaseMenuItem',
            'translateVoice',
            'startRecord',
            'stopRecord',
            'onRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'uploadVoice',
            'downloadVoice',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard'
        ];
        
        wx.config(jssdkconfig);
    });
	
</script>
EOF;
	echo $script;
}

/**
 * 创建分享js
 * params['et'] 为操作标识，不可设置重复的自定义参数
 */
function js_share($title, $desc, $link, $imgUrl = '', $params = []) {
    global $_W;
    $version = $_W['jssdk_version'];
    if(empty($version)) {
        $version = 0;
    }

    if(!empty($imgUrl)) {
        $imgUrl = '"' . $imgUrl . '"';
    } else {
        $imgUrl = "$('img')[0].src";
    }

    $params['et'] = 'wx_share';
    $url = purl('notice', $params);

    // 老版jssdk处理
    if($version < 672) {
        $logic = "data.success=callback;wx.onMenuShareAppMessage(data);wx.onMenuShareTimeline(data);";
    } else {
        $logic = "wx.updateAppMessageShareData(data,callback);wx.updateTimelineShareData(data,callback);";
    }

    $tmp = "wx.ready(function(){var shareData={title:'{$title}',desc:'{$desc}',link:'{$link}',imgUrl:{$imgUrl}};
        function shareCallback(res){if(res.errMsg=='onMenuShareAppMessage:ok'||res.errMsg=='sendAppMessage:ok'){
            $.get('{$url}')            
        }}wxshare(shareData,shareCallback)});function wxshare(data,callback,version){{$logic}}";

    return $tmp;
}

/**
 * 直接生成分享图片（图片下方添加长按识别二维码并生成新图）
 * $src: 原图
 * $qrcodeSrc: 二维码内容，一般为活动地址
 * 注意：
 *   1. 原图必须为jpg,jpeg,png,gif中的其中一个，且图片路径必须为外网可访问地址
 *   2. 必须存在inc/mobile/notice.inc.php文件
 *   3. 必须存在template/resource/images/sharebottom_80_30.png文件
 */
function output_shareImage($src, $qrcodeSrc) {

    $src_bottom = WEB_RESOURCE. "/images/sharebottom_80_30.png";

    if(strpos($src, '.') !== false) {
        $ss = explode('.', $src);
        $suffix = $ss[count($ss) - 1];
    } else {
        $suffix = 'jpg';
    }
    switch($suffix) {
        case 'jpg':
        case 'jpeg':
            $img = imagecreatefromjpeg($src);
        break;
        case 'png':
            $img = imagecreatefrompng($src);
        break;
        case 'gif':
            $img = imagecreatefromgif($src);
        break;
        default:
            return '图片格式不正确。只支持jpg,jpeg,png,gif格式图片';
    }

    $ix = imagesx($img);
    $iy = imagesy($img);

    $img_bottom = imagecreatefrompng($src_bottom);
    $ibx = imagesx($img_bottom);
    $iby = imagesy($img_bottom);

    $qrcode = imagecreatefrompng(web2app_url('notice', ['et'=>'qrcode', 'value'=>$qrcodeSrc]));
    $qx = imagesx($qrcode);
    $qy = imagesy($qrcode);

    imagecopyresized($img_bottom, $qrcode, 80, 30, 0, 0, 100, 100, $qx, $qy);

    $newimg = imagecreatetruecolor($ix, $iy + $ix / ($ibx / $iby));

    imagecopyresized($newimg, $img, 0, 0, 0, 0, $ix, $iy, $ix, $iy);
    imagecopyresized($newimg, $img_bottom, 0, $iy + 1, 0, 0, $ix, $ix / ($ibx / $iby), $ibx, $iby);

    switch($suffix) {
        case 'jpg':
        case 'jpeg':
            header('Content-type: image/jpeg');
            imagejpeg($newimg);
        break;
        case 'png':
            header('Content-type: image/png');
            imagepng($newimg);
        break;
    }

    imagedestroy($newimg);

}

/**
 * 为字符串加密
 */
function encry($str) {
    if(is_array($str)) {
        $str = json_encode($str);
    }
    $key = md5('pinqrcode.inc.php');
    return authcode($str, 'ENCODE', $key);
}

/**
 * 将加密字符串解密
 */
function decry($str, $json2array = true) {
    $key = md5('pinqrcode.inc.php');
    $result = authcode($str, 'DECODE', $key);
    if(json_encode(json_decode($result, true)) == $result && $json2array) {
        $result = json_decode($result, true);
    }
    return $result;
}