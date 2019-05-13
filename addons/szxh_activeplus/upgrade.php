<?php 


/**
 * 更新细则：
 * 1. 发布到版本之后，后续的数据库变动信息均要在此文件中记录，无论哪个版本不得删除。
 * 2. 使用switch判断版本号更新，版本号使用 $_W['current_module']['version'] 获取
 * 3. 对于表在变动时产生的数据异常问题一定要明确解决，不要留下隐患。
 */

global $_W;

switch($_W['current_module']['version']) {

    // 发布了1.0.1版本后，更新的内容在这里操作，不要使用break
    // case按照版本顺序从最早更新到最近更新依次排列
    case '1.0.1':
    case '1.0.2':
        $sql = "
            ALTER TABLE `ims_szxh_activeplus_service_user` ADD `uid` INT NOT NULL COMMENT '操作员id' AFTER `uniacid`;
            ALTER TABLE `ims_szxh_activeplus` ADD `uid` INT NOT NULL COMMENT '操作员id' AFTER `uniacid`;
            ALTER TABLE `ims_szxh_activeplus` ADD `isfounder` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '是否为站长添加的活动' AFTER `uid`;
        ";
        pdo_run($sql);
    case '1.0.3':
        $sql = "
            ALTER TABLE `ims_szxh_activeplus`  ADD `design_img` VARCHAR(400) NOT NULL DEFAULT ''  AFTER `transfers_remark`,  ADD `design_status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1关闭  2开启'  AFTER `design_img`,  ADD `design` TEXT NOT NULL  AFTER `design_status`;
        ";
        pdo_run($sql);
    case '1.0.4':
        $sql = "
            ALTER TABLE `ims_szxh_activeplus` ADD `redpack_show_number` INT NOT NULL DEFAULT '10' COMMENT '红包排行榜显示相互量' AFTER `design`, ADD `buyer_show_number` INT NOT NULL DEFAULT '5' COMMENT '购买记录显示数量' AFTER `redpack_show_number`;
        ";
        pdo_run($sql);
        $sql = "ALTER TABLE `ims_szxh_activeplus` ADD `redpack_ispay` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '是否自己支付后有红包 1是 2否' AFTER `redpack_status`;";
        pdo_run($sql);
    case '1.0.5':
        $sql = "
            CREATE TABLE `ims_szxh_activeplus_sharelog` (
              `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
              `uniacid` int(11) NOT NULL,
              `active_id` int(11) NOT NULL,
              `wechat_id` varchar(32) NOT NULL,
              `order_sn` varchar(20) NOT NULL,
              `share_time` int(11) NOT NULL DEFAULT '0' COMMENT '分享时间',
              `geted_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '出现1时即为已获得奖励'
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享次数记录：可能不准确，以分享回调记录为主';
            ALTER TABLE `ims_szxh_activeplus` ADD `share_reward_count` INT NOT NULL COMMENT '分享次数达到后给分享人发红包，默认0不开启功能' AFTER `transfers_remark`, ADD `share_reward` DOUBLE(10,2) NOT NULL DEFAULT '0' COMMENT '分享次数达到后红包金额' AFTER `share_reward_count`;
        ";
        pdo_run($sql);
    case '1.0.6':
        $sql = "
            ALTER TABLE `ims_szxh_activeplus_order` ADD `user_type` TINYINT NOT NULL DEFAULT '1' AFTER `active_title`;
        ";
        pdo_run($sql);
    case '1.3.0':
        $sql = "
            ALTER TABLE `ims_szxh_activeplus_transfers` ADD `status` TINYINT(1) NOT NULL DEFAULT '1' AFTER `create_time`, ADD `params` TEXT NOT NULL AFTER `status`;
            ALTER TABLE `ims_szxh_activeplus` ADD `princ` DOUBLE(10,2) NOT NULL DEFAULT '0' COMMENT '校长返利' AFTER `type`;
            ALTER TABLE `ims_szxh_activeplus` ADD `princ_reward` DOUBLE(10,2) NOT NULL DEFAULT '0' COMMENT '校长返利' AFTER `princ`;
        ";
        pdo_run($sql);
        $sql = "
            ALTER TABLE `ims_szxh_activeplus` ADD `new_user_gift` varchar(80) NOT NULL DEFAULT '' COMMENT '新学员礼品' AFTER `goods`;
            ALTER TABLE `ims_szxh_activeplus` ADD `old_user_gift` varchar(80) NOT NULL DEFAULT '' COMMENT '老学员礼品' AFTER `new_user_gift`;
        ";
        pdo_run($sql);
        $sql = "
            ALTER TABLE `ims_szxh_activeplus` ADD `attract_status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '是否开启，1开启 2关闭' AFTER `is_cav`, ADD `attract_title` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '显示标题，最多20个字' AFTER `attract_status`, ADD `attract_type` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '显示方式，1客服二维码，2链接，3自定义内容' AFTER `attract_title`, ADD `attract_value_link` VARCHAR(500) NOT NULL DEFAULT '' COMMENT '自定义跳转链接' AFTER `attract_type`, ADD `attract_value_custom` TEXT NOT NULL COMMENT '自定义内容' AFTER `attract_value_link`;
        ";
        pdo_run($sql);
    case '1.3.1':
        $sql = "
            ALTER TABLE `ims_szxh_activeplus` ADD `content_op` TEXT NOT NULL;
            ALTER TABLE `ims_szxh_activeplus_transfers` ADD `reward_msg` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '发放结果通知';
            
        ";
}



// 默认最低版本

// 最低版本无更新内容，只操作一些非更新内容