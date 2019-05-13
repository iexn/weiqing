<?php 
namespace szxh\model;
/**
 * 活动分类数据交互类
 * 类代码：101
 * 
 */
class Cate extends Common {
    
    public function __construct() {
        parent::__construct();
        $this->setTableName('Cate');
    }

    /**
     * 获取全部数据列表
     */
    public function getList() {
        global $_W;
        return $this->query->from($this->tableName)->where('uniacid', $_W['uniacid'])->orderby('sort', 'DESC')->orderby('id', 'DESC')->getall();
    }

    /**
     * 获取单条数据
     */
    public function findRow($id) {
        global $_W;
        return $this->query->from($this->tableName)->where('id', $id)->where('uniacid', $_W['uniacid'])->get();
    }

    /**
     * 是否存在当前标题项
     */
    public function hasTitle($title, $except = false) {
        global $_W;

        $query = $this->query->from($this->tableName)->where('title', $title)->where('uniacid', $_W['uniacid']);
        if($except !== false) {
            $query->where('id !=', $except);
        }
        $row = $query->get();
        return !!$row;
    }

    /**
     * 删除项，支持多项删除
     * TODO: 是否存在整体一次性删除的方法
     */
    public function deleteRow($id, $checkUniacid = false) {
        global $_W;
        if(is_string($id)) {
            $ids = getKeysArray($id);
        } else {
            $ids = $id;
        }

        // 开始逐条删除
        pdo_begin();
        foreach ($ids as $id) {
            $res = pdo_delete('szxh_activeplus_cate', ['id'=>$id, 'uniacid'=>$_W['uniacid']]);
            if($res === false) {
                pdo_rollback();
                return false;
            }
        }
        pdo_commit();

        return true;

    }

    /**
     * 验证数据是否完整
     */
    public function validSave($data, $id = false) {
        // 数据验证
        if(!isset($data['sort']) || !is_numeric($data['sort']) || $data['sort'] < 0) {
            return $this->setInfo(10, '排序数字不正确', [], '', 'sort');
        }

        if(empty($data['title'])) {
            return $this->setInfo(11, '请填写类别名称', [], '', 'title');
        }

        if(istrlen($data['title']) > 100) {
            return $this->setInfo(12, '类别名称不能超过100个字', [], '', 'title');
        }

        if($this->hasTitle($data['title'], $id)) {
            return $this->setInfo(13, '已存在相同名称类型，请重新设置', [], '', 'title');
        }

        return $data;
    }

    /**
     * 保存数据，必须通过验证否则数据不保证正常
     */
    public function saveRow($data, $id = false) {
        global $_W;
        // 数据库交互

        $data = $_POST;

        // 判断新增还是修改
        if($id !== false) {

            $res = pdo_update('szxh_activeplus_cate', [
                'sort' => $data['sort'],
                'title' => $data['title'],
                'uniacid' => $_W['uniacid']
            ], ['id' => $id]);

        } else {

            $res = pdo_insert('szxh_activeplus_cate', [
                'title' => $data['title'],
                'sort' => $data['sort'],
                'uniacid' => $_W['uniacid'],
                'create_time' => TIMESTAMP
            ]);

        }

        return $res;
    }

}