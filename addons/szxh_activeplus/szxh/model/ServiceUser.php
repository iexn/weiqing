<?php 
namespace szxh\model;
class ServiceUser extends Common {

    public function __construct() {
        parent::__construct();
        $this->setTableName('ServiceUser');
    }


    public function getList($page = 1) {
        global $_W;

        if($page === false) {
            return $this->query->from($this->tableName)->where('uniacid', $_W['uniacid'])->orderby('sort', 'DESC')->orderby('id', 'DESC')->getall();
        }

        $page = intval($page);

        $list = $this->query->from($this->tableName)->where('uniacid', $_W['uniacid'])->orderby('sort', 'DESC')->orderby('id', 'DESC')->page($page, 10)->getall();
        $total = $this->getLastQueryTotal();

        $this->pageHtml = pagination($total, $page, 10);

        return $list;
    }

    public function lastPageHtml() {
        $html = $this->pageHtml;
        $this->pageHtml = '';
        return $html;
    }

    /**
     * 获取单条数据
     */
    public function findRow($id) {
        global $_W;
        return $this->query->from($this->tableName)->where('uniacid', $_W['uniacid'])->where('id', $id)->get();
    }

    /**
     * 验证数据
     *  $data = [
     *      'name'          => $_POST['name'],
     *      'avatar'        => $_POST['avatar'],
     *      'mobile'        => $_POST['mobile'],
     *      'wechat_qrcode' => $_POST['wechat_qrcode'],
     *      'sort'          => $_POST['sort'],
     *  ];
     */
    public function validSave($data, $id) {
        global $_W;
        // 数据验证
        
        if(empty($data['name'])) {
            return $this->setInfo(14, '请填写姓名');
        }

        if(istrlen($data['name']) > 20) {
            return $this->setInfo(15, '姓名不能超过20个字');
        }

        if(empty($data['avatar'])) {
            return $this->setInfo(16, '请上传头像');
        }

        if(empty($data['mobile'])) {
            return $this->setInfo(17, '请填写手机号');
        }

        if(empty($data['wechat_qrcode'])) {
            return $this->setInfo(18, '请上传微信二维码');
        }

        if(!isset($data['sort']) || !is_numeric($data['sort']) || $data['sort'] < 0) {
            return $this->setInfo(19, '排序数字不正确');
        }

        $data['uniacid'] = $_W['uniacid'];

        if(empty($data['uid'])) {
            return $this->setInfo(20, '请选择操作员');
        }

        return $data;
    }

    public function saveRow($data, $id = false) {
        // 数据库交互
        // 判断新增还是修改
        if($id !== false) {

            $res = pdo_update($this->tableName, $data, ['id' => $id]);

        } else {

            $data['create_time'] = TIMESTAMP;

            $res = pdo_insert($this->tableName, $data);

        }

        return $res;
    }


    /**
     * excel需要的数据
     */
    public function getExcelList($condition) {
        global $_W;
        
        $list = $this->query->from($this->tableName)
                            ->select(['id','name','mobile'])
                            ->where('uniacid', $_W['uniacid'])
                            ->orderby('sort', 'DESC')
                            ->orderby('id', 'DESC')
                            ->getall();

        foreach ($list as &$item) {
            // 计算当前页面的客服，在时间范围内的统计数据

            $recode = model('Order')->getStatisticFromRow($item['id'], $condition['starttime'], $condition['endtime']);
            $item['new']    = $recode['new_count'];
            $item['old']    = $recode['old_count'];
            $item['all']    = $recode['new_count'] + $recode['old_count'];
            // $item['spread'] = $recode['spread_count'];
            unset($item['id']);

            $item = array_values($item);

        }
        return $list;
    }

}