<?php 

$prefix = 'ims_';

// 1.3.1 版本数据库
$sql = "

  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_activeplus` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `uniacid` int(11) NOT NULL COMMENT '公众号ID',
    `uid` int(11) NOT NULL COMMENT '操作员ID',
    `isfounder` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '是否为站长添加的活动',
    `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1正在进行 2关闭',
    `active_cate_id` int(11) NOT NULL COMMENT '活动类别ID',
    `title` varchar(100) NOT NULL COMMENT '活动标题',
    `cover` varchar(100) NOT NULL COMMENT '活动封面图',
    `price` double(10,2) NOT NULL COMMENT '参与价格',
    `min_get` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '推荐返利最小值',
    `max_get` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '推荐返利最大值',
    `service_user_id` int(11) NOT NULL COMMENT '客服ID',
    `content` text NOT NULL COMMENT '活动描述',
    `end_time` int(11) NOT NULL COMMENT '结束时间',
    `second_title` varchar(50) NOT NULL DEFAULT '' COMMENT '活动小标题',
    `planner` varchar(20) NOT NULL DEFAULT '' COMMENT '策划人',
    `inst` varchar(50) NOT NULL DEFAULT '' COMMENT '机构地区',
    `school` varchar(50) NOT NULL DEFAULT '' COMMENT '学校名称',
    `consignee` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人姓名',
    `consignee_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人联系电话',
    `consignee_addr` varchar(50) NOT NULL DEFAULT '' COMMENT '收货地址',
    `goods` varchar(50) NOT NULL DEFAULT '' COMMENT '货',
    `new_user_gift` varchar(80) NOT NULL DEFAULT '' COMMENT '新学员礼品',
    `old_user_gift` varchar(80) NOT NULL DEFAULT '' COMMENT '老学员礼品',
    `service_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '客服电话',
    `bgm` varchar(100) NOT NULL DEFAULT '' COMMENT '背景音乐',
    `views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
    `register` int(11) NOT NULL DEFAULT '0' COMMENT '报名人数',
    `attract` varchar(200) NOT NULL DEFAULT '' COMMENT '招商二维码图片',
    `create_time` int(11) NOT NULL,
    `redpack_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1 使用 2 不使用',
    `redpack_ispay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自己支付后有红包  1是  2否',
    `redpack_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 现金红包 2 企业付款',
    `redpack_name` varchar(10) NOT NULL COMMENT '红包名称',
    `redpack_sender` varchar(10) NOT NULL COMMENT '红包发送人',
    `redpack_wishing` varchar(20) NOT NULL COMMENT '红包祝福语',
    `redpack_remark` varchar(20) NOT NULL COMMENT '红包备注',
    `transfers_remark` varchar(20) NOT NULL DEFAULT '' COMMENT '企业付款转账备注信息',
    `share_reward_count` int(11) NOT NULL COMMENT '分享次数达到后给分享人发红包，默认0不开启功能',
    `share_reward` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '分享次数达到后红包金额',
    `design_img` varchar(400) NOT NULL DEFAULT '',
    `design_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1关闭  2开启',
    `design` text NOT NULL,
    `redpack_show_number` int(11) NOT NULL DEFAULT '10' COMMENT '红包排行榜显示相互量',
    `buyer_show_number` int(11) NOT NULL DEFAULT '5' COMMENT '购买记录显示数量',
    `is_cav` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否核销 1否 2是',
    `princ` DOUBLE(10,2) NOT NULL DEFAULT '0' COMMENT '校长返利',
    `princ_reward` DOUBLE(10,2) NOT NULL DEFAULT '0' COMMENT '校长返利',
    `attract_status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '是否开启，1开启 2关闭',
    `attract_title` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '显示标题，最多20个字',
    `attract_type` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '显示方式，1客服二维码，2链接，3自定义内容',
    `attract_value_link` VARCHAR(500) NOT NULL DEFAULT '' COMMENT '自定义跳转链接',
    `attract_value_custom` TEXT NOT NULL COMMENT '自定义内容'
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;


  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_activeplus_cate` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `uniacid` int(11) NOT NULL,
    `title` varchar(15) NOT NULL,
    `sort` int(11) NOT NULL DEFAULT '0',
    `create_time` int(11) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='szxh:活动分类';
 

  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_activeplus_order` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `active_title` varchar(100) NOT NULL DEFAULT '',
    `order_sn` varchar(20) NOT NULL COMMENT '订单号',
    `user_type` tinyint(100) NOT NULL DEFAULT '1',
    `active_id` int(11) NOT NULL COMMENT '活动ID',
    `wechat_id` varchar(64) NOT NULL COMMENT '微信ID',
    `name` varchar(20) NOT NULL COMMENT '姓名',
    `mobile` varchar(15) NOT NULL COMMENT '手机号',
    `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1新用户 2老用户 3推广员',
    `price` double(10,2) NOT NULL DEFAULT '0.00',
    `create_time` int(11) NOT NULL COMMENT '报名时间',
    `complete_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单完成时间，到异步通知之后算为完成',
    `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1未付款 2已付款',
    `referrals_wechat_id` varchar(64) NOT NULL DEFAULT '' COMMENT '推荐人微信ID，没有为空',
    `referrals_name` varchar(20) NOT NULL DEFAULT '' COMMENT '推荐人姓名（订单内填写的姓名）',
    `referrals_reward` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '推荐人奖金',
    `referrals_reward_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发放成功，0未发放 1已发放 2发放失败',
    UNIQUE `order_sn` (`order_sn`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动报名表';


  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_activeplus_register` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `active_id` int(11) NOT NULL,
    `wechat_id` varchar(32) NOT NULL,
    `create_time` int(11) NOT NULL COMMENT '参加时间',
    `get_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '获取返利',
    `referrals_wechat_id` varchar(32) NOT NULL DEFAULT '' COMMENT '推荐人微信ID，可以为空',
    `avatar` varchar(32) NOT NULL DEFAULT ''
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动报名表';


  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_activeplus_transfers` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `uniacid` int(11) NOT NULL,
    `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1企业付款 2单人红包',
    `transfers_sn` varchar(20) NOT NULL COMMENT '奖励订单号',
    `order_sn` varchar(20) NOT NULL COMMENT '活动订单号',
    `reward` double(10,2) NOT NULL COMMENT '奖金',
    `wechat_id` varchar(64) NOT NULL COMMENT '发放到用户',
    `create_time` int(11) NOT NULL,
    `status` TINYINT(1) NOT NULL DEFAULT '1',
    `params` TEXT NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='奖金记录';


  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_activeplus_view` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `active_id` int(11) NOT NULL COMMENT '活动ID',
    `wechat_id` varchar(64) NOT NULL COMMENT '微信ID',
    `view_time` int(11) NOT NULL COMMENT '查看时间',
    `avatar` varchar(320) NOT NULL DEFAULT '' COMMENT '微信头像',
    `name` varchar(16) NOT NULL DEFAULT ''
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='查看活动用户记录，根据时间记录，新纪录者增加活动浏览数1,120分钟内相同用户不记录';


  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_config` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `uniacid` int(11) NOT NULL COMMENT '公众号id',
    `modulename` varchar(40) NOT NULL COMMENT '模块名',
    `is_shield` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否开启防屏蔽设置 1开启 2关闭',
    `share_domain` varchar(225) NOT NULL DEFAULT '' COMMENT '分享主域名',
    `domain2` varchar(10) NOT NULL DEFAULT '' COMMENT '页面2级域名',
    `pay_url` varchar(255) NOT NULL DEFAULT '' COMMENT '支付域名，包含协议',
    `domain_wl` text NOT NULL COMMENT '域名白名单',
    `domain_bl` text NOT NULL COMMENT '域名黑名单'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='szxh模块控制';


  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_log` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(20) NOT NULL,
    `content` text NOT NULL,
    `create_time` int(11) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台测试用';


  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_activeplus_service_user` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `uniacid` int(11) NOT NULL,
    `uid` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `wechat_qrcode` varchar(100) NOT NULL COMMENT '微信二维码链接地址',
    `mobile` varchar(13) NOT NULL COMMENT '手机号',
    `avatar` varchar(100) NOT NULL COMMENT '头像',
    `sort` int(11) NOT NULL DEFAULT '0',
    `create_time` int(11) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客服';



  CREATE TABLE IF NOT EXISTS `{$prefix}szxh_users` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `uniacid` int(11) NOT NULL,
    `uid` varchar(32) NOT NULL COMMENT '微信唯一标志',
    `name` varchar(16) NOT NULL COMMENT '用户昵称',
    `avatar` varchar(32) NOT NULL COMMENT '头像地址',
    `create_time` int(11) NOT NULL COMMENT '加入时间',
    `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户类型：1新用户（默认） 2老用户  3推广员',
    `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态，一般为1。2为禁用'
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='szxh:微信用户';

  CREATE TABLE IF NOT EXISTS `ims_szxh_shield` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `uniacid` int(11) NOT NULL,
    `modulename` varchar(40) NOT NULL,
    `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1开启 2关闭',
    `pay_url` varchar(200) NOT NULL,
    `share_url` varchar(200) NOT NULL,
    `shield_url` text NOT NULL COMMENT '跳转随机域名',
    `domain_wl` text NOT NULL COMMENT '白名单不跳转',
    `domain_bl` text NOT NULL COMMENT '黑名单跳空白页'
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

  CREATE TABLE IF NOT EXISTS `ims_szxh_activeplus_sharelog` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `uniacid` int(11) NOT NULL,
    `active_id` int(11) NOT NULL,
    `wechat_id` varchar(32) NOT NULL,
    `order_sn` varchar(20) NOT NULL,
    `share_time` int(11) NOT NULL DEFAULT '0' COMMENT '分享时间',
    `geted_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '出现1时即为已获得奖励'
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享次数记录：可能不准确，以分享回调记录为主';

  COMMIT;
  ";


  pdo_run($sql);