<?php 
namespace szxh\logic;

class ServiceUser extends Common {

    protected $modelname = 'ServiceUser';

    public function sort($sortArr) {
        return parent::sort($sortArr);
    }

    public function delete($ids) {
        return parent::delete($ids);
    }

    public function findRow($id) {
        return model('ServiceUser')->findRow($id);
    }

    /**
     * 有ID为更新，没有为添加
     */
    public function save($data, $id = false) {
        $id = $id ?: false;
        return parent::save($data, $id);
    }

    public function saveData($pid = false) {
        $pid = $pid ?: false;
        // 判断是否为修改，读取数据
        if($pid !== false) {
            $row = model('ServiceUser')->findRow($pid);
            if(empty($row)) {
                // 数据异常返回到列表页
                return $this->setInfo(101, '数据不存在，请返回刷新页面。', aurl());
            }
        }

        return [
            'row' => $row
        ];
    }

    /**
     * condition为查询客服统计，不是注册时间
     */
    public function index($page, $condition = []) {
        $list = model('ServiceUser')->getList($page);
        if(empty($list)) {
            $list = [];
        }

        // 计算当前页面的客服，在时间范围内的统计数据
        foreach ($list as &$item) {
            $recode = model('Order')->getStatisticFromRow($item['id'], $condition['starttime'], $condition['endtime']);
            $item['new'] = $recode['new_count'];
            $item['old'] = $recode['old_count'];
            $item['all'] = $recode['new_count'] + $recode['old_count'];
            $item['spread'] = $recode['spread_count'];
        }

        // 数据分页
        $pageHtml = model('ServiceUser')->lastPageHtml();

        return [
            'list' => $list,
            'page' => $pageHtml
        ];
    }

    public function getExcelList($condition = []) {
        $dataList = model('ServiceUser')->getExcelList($condition);
        if(empty($dataList)) {
            $dataList = [];
        }
        return $dataList;
    }

    public function outputExcel($excels) {
        $filename = ($_GET['searchtime']['start'] ?: date('Y-m-d', is_time(1)['start'])).'至'.($_GET['searchtime']['end'] ?: date('Y-m-d', is_time(1)['end'])).'客服业绩统计';
        $headname = '客服业绩统计';
        $fileheader = ['姓名','电话','新用户','老用户','用户总数'];

        getExcel($filename, $headname, $fileheader, $excels);
        exit;
    }

}