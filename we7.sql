-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-04-28 11:27:12
-- 服务器版本： 5.6.17
-- PHP 版本： 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `we7`
--

-- --------------------------------------------------------

--
-- 表的结构 `ims_account`
--

CREATE TABLE `ims_account` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) UNSIGNED NOT NULL,
  `endtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account`
--

INSERT INTO `ims_account` (`acid`, `uniacid`, `hash`, `type`, `isconnect`, `isdeleted`, `endtime`) VALUES
(1, 1, 'uRr8qvQV', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_aliapp`
--

CREATE TABLE `ims_account_aliapp` (
  `acid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `key` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_baiduapp`
--

CREATE TABLE `ims_account_baiduapp` (
  `acid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `key` varchar(32) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_phoneapp`
--

CREATE TABLE `ims_account_phoneapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_toutiaoapp`
--

CREATE TABLE `ims_account_toutiaoapp` (
  `acid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `key` varchar(32) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_webapp`
--

CREATE TABLE `ims_account_webapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_wechats`
--

CREATE TABLE `ims_account_wechats` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account_wechats`
--

INSERT INTO `ims_account_wechats` (`acid`, `uniacid`, `token`, `encodingaeskey`, `level`, `name`, `account`, `original`, `signature`, `country`, `province`, `city`, `username`, `password`, `lastupdate`, `key`, `secret`, `styleid`, `subscribeurl`, `auth_refresh_token`) VALUES
(1, 1, 'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP', '', 1, 'we7team', '', '', '', '', '', '', '', '', 0, '', '', 1, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_wxapp`
--

CREATE TABLE `ims_account_wxapp` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(43) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `appdomain` varchar(255) NOT NULL,
  `auth_refresh_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_xzapp`
--

CREATE TABLE `ims_account_xzapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `original` varchar(50) NOT NULL,
  `lastupdate` int(10) NOT NULL,
  `styleid` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `xzapp_id` varchar(30) NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `key` varchar(80) NOT NULL,
  `secret` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_clerks`
--

CREATE TABLE `ims_activity_clerks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `storeid` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_clerk_menu`
--

CREATE TABLE `ims_activity_clerk_menu` (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(4) NOT NULL,
  `pid` int(6) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `system` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_category`
--

CREATE TABLE `ims_article_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_comment`
--

CREATE TABLE `ims_article_comment` (
  `id` int(10) NOT NULL,
  `articleid` int(10) NOT NULL,
  `parentid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `is_like` tinyint(1) NOT NULL,
  `is_reply` tinyint(1) NOT NULL,
  `like_num` int(10) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_news`
--

CREATE TABLE `ims_article_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `cateid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_show_home` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `click` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_notice`
--

CREATE TABLE `ims_article_notice` (
  `id` int(10) UNSIGNED NOT NULL,
  `cateid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_show_home` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `click` int(10) UNSIGNED NOT NULL,
  `style` varchar(200) NOT NULL,
  `group` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_unread_notice`
--

CREATE TABLE `ims_article_unread_notice` (
  `id` int(10) UNSIGNED NOT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `is_new` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_attachment_group`
--

CREATE TABLE `ims_attachment_group` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_basic_reply`
--

CREATE TABLE `ims_basic_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `content` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_basic_reply`
--

INSERT INTO `ims_basic_reply` (`id`, `rid`, `content`) VALUES
(1, 10, '网址：www.onfinger.cn\n账号：红包拓客\n密码：12345678'),
(3, 12, '网址：www.onfinger.cn\\n账号：活码工具\\n密码：12345678'),
(6, 21, '网址：www.onfinger.cn\n账号：活码工具\n密码：12345678'),
(7, 11, '网址：www.onfinger.cn\n账号：红包拼团\n密码：12345678');

-- --------------------------------------------------------

--
-- 表的结构 `ims_business`
--

CREATE TABLE `ims_business` (
  `id` int(10) UNSIGNED NOT NULL,
  `weid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_attachment`
--

CREATE TABLE `ims_core_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `module_upload_dir` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_attachment`
--

INSERT INTO `ims_core_attachment` (`id`, `uniacid`, `uid`, `filename`, `attachment`, `type`, `createtime`, `module_upload_dir`, `group_id`) VALUES
(1, 2, 1, 'QQ截图20181031193447.png', 'images/2/2018/11/fo8UarolzGsr26G09OXi23g5GlN0c0.png', 1, 1541061084, '', -1),
(9, 0, 0, 'mgnC2.png', 'images/3/2018/11/R6hUrQJ0006qWJY869qbu4u406Byqu.png', 1, 1542022699, '', NULL),
(10, 0, 0, 'e46D1.jpeg', 'images/3/2018/11/DpfytFFNR2BvewBywYPpZTyYNfunex.jpeg', 1, 1542023141, '', NULL),
(11, 0, 0, 'EFCR2.jpeg', 'images/3/2018/11/uxfg54zsogSyco5XmqM5jHgOgYNRyn.jpeg', 1, 1542107192, '', NULL),
(12, 0, 0, 'B91Gj.jpeg', 'images/3/2018/11/DOLpM3mS6kPMnCon3p5CLlzM6OCNMN.jpeg', 1, 1542107211, '', NULL),
(62, 0, 0, 'bhGgx.jpeg', 'images/3/2018/11/uDzc5SPnVEpJhvjhG91LVCUHv9vQ1q.jpeg', 1, 1542764645, '', NULL),
(63, 0, 0, 'UKVYp.jpeg', 'images/3/2018/11/jsyskODK5YoXbKpF0KshBZ06TTSK15.jpeg', 1, 1542764761, '', NULL),
(64, 0, 0, 'SAfDR.jpeg', 'images/3/2018/11/Rt09SnUiUeSaIAj0ttJMTis00SnaKg.jpeg', 1, 1542764800, '', NULL),
(65, 0, 0, 'eCsfs.jpeg', 'images/3/2018/11/wpNH0q9a04aCyC03c99r9Th4aT4n0Q.jpeg', 1, 1542764832, '', NULL),
(66, 0, 0, 'Ffv42.jpeg', 'images/3/2018/11/tTj0BtY22jC04h5y0hH0jeJhDcLLgJ.jpeg', 1, 1542764837, '', NULL),
(67, 0, 0, 'g5ks6.jpeg', 'images/3/2018/11/wId4KD4l46zRMXeUhlX4qAui3gsReR.jpeg', 1, 1542764860, '', NULL),
(68, 0, 0, 'ZVvah.jpeg', 'images/3/2018/11/M9ZB3l44wqQimQ17q11U8vVvJ9N6n8.jpeg', 1, 1542764866, '', NULL),
(69, 0, 0, 'wCclo.jpeg', 'images/3/2018/11/RJ844iIui8Cb0q7JMQ0I049j80ZC4I.jpeg', 1, 1542764884, '', NULL),
(70, 0, 0, 'k2Wx3.jpeg', 'images/3/2018/11/p4hHArr1WhZl1Z04dZbS4RHT4f9RW4.jpeg', 1, 1542764888, '', NULL),
(71, 0, 0, 'yHa5o.jpeg', 'images/3/2018/11/jCxK1cQiTCKbICO6TObiATx737caci.jpeg', 1, 1542767249, '', NULL),
(72, 0, 0, 'jboeA.jpeg', 'images/3/2018/11/q4e1FgS1q4t44NmLQXLS1cN6m214GN.jpeg', 1, 1542767280, '', NULL),
(73, 0, 0, 'zmT3h.jpeg', 'images/3/2018/11/oP0LkuzTBcC6Cucrrr3s78uDbo06bb.jpeg', 1, 1542781352, '', NULL),
(74, 0, 0, 'MlRBF.jpeg', 'images/3/2018/11/b729la9aYKKQW5KaKLH5878wz9LaQl.jpeg', 1, 1542781409, '', NULL),
(75, 0, 0, 'vZX7j.jpeg', 'images/3/2018/11/ek3oGiEiwW30GgO0wwgv33Dw50wP3I.jpeg', 1, 1542781429, '', NULL),
(76, 0, 0, 'JL96v.jpeg', 'images/3/2018/11/GwfCRFGrNGnwy51NNoc5OOzZ1a7oWW.jpeg', 1, 1542781447, '', NULL),
(77, 0, 0, 'daJZN.jpeg', 'images/3/2018/11/s0JWJw1W4J5JkA10ZUOXh41JxXrx4U.jpeg', 1, 1542781698, '', NULL),
(78, 0, 0, '17e58PICji8_1024.jpg', 'images/3/2018/11/xi8LJ77DVi10bFzvJBI80FBfBv0Llb.jpg', 1, 1542783357, '', NULL),
(79, 0, 0, '5295460_223554533140_2.jpg', 'images/3/2018/11/n00pD9lZDLXo8PP3Z833xDLLp99ErR.jpg', 1, 1542783360, '', NULL),
(80, 0, 0, '未标题-1.jpg', 'images/3/2018/11/H9PcVGI6Ig9p7TTwizt9tpI6zuVG2k.jpg', 1, 1542788839, '', NULL),
(81, 0, 0, 'pyDro.jpeg', 'images/3/2018/11/LBBqlJqO77YUDy1HLHodOeN6GnBgyO.jpeg', 1, 1542791283, '', NULL),
(82, 0, 0, 'bcisA.jpeg', 'images/3/2018/11/Vl9fYsEc3kBhlLppliypBLsZbzZoKG.jpeg', 1, 1542791341, '', NULL),
(83, 0, 0, 'qMAt4.jpeg', 'images/3/2018/11/iQgG1gnx1zN15k5SkQSQX6j8sXZGGz.jpeg', 1, 1542791358, '', NULL),
(84, 0, 0, 'Lc54C.jpeg', 'images/3/2018/11/n8N8cVkxq3fr8xFz8lfX86F6Gy89rC.jpeg', 1, 1542791375, '', NULL),
(85, 0, 0, 'u55i1.jpeg', 'images/3/2018/11/I5k1bRN4Xez91nBKZ2l5xFcZ5f454r.jpeg', 1, 1542792080, '', NULL),
(109, 0, 0, 'K85LI.jpeg', 'images/4/2018/11/jKyyKn7z1aa8RF23fnVHdaKyY8K7NB.jpeg', 1, 1543037849, '', NULL),
(110, 0, 0, 'qiQ7i.jpeg', 'images/4/2018/11/vh3Vz9uNo9OoNWu9uMvuzm3I7O7oMv.jpeg', 1, 1543037855, '', NULL),
(111, 0, 0, 'Gr0O2.jpeg', 'images/4/2018/11/g826C4fR8PoCfo284qBNqOi8fh8IpI.jpeg', 1, 1543037875, '', NULL),
(112, 0, 0, 'w0AjH.jpeg', 'images/4/2018/11/e6fp9fKs7P4C5p7A7ZQf6O2A5KnfQf.jpeg', 1, 1543037893, '', NULL),
(113, 0, 0, 'gg6C8.jpeg', 'images/4/2018/11/QdWaUwGhPgpX0wShAp6PdW8WJXzhag.jpeg', 1, 1543037912, '', NULL),
(114, 0, 0, 'VFwLZ.jpeg', 'images/4/2018/11/SbwhhssNNiqw82u2CLScQ2gsGmmcgg.jpeg', 1, 1543039812, '', NULL),
(115, 0, 0, 'qFijq.jpeg', 'images/4/2018/11/uOH9bLL5HLX5e5xa70l1bX97LbHxlB.jpeg', 1, 1543039831, '', NULL),
(116, 0, 0, 'j5Zo6.jpeg', 'images/4/2018/11/b88KzXiX292WzbzBI8tkxbXIKmbxWM.jpeg', 1, 1543039852, '', NULL),
(117, 0, 0, 'cfvD2.jpeg', 'images/4/2018/11/tZM5uSMfuzFiMm1GKGrw5ZswwWudd5.jpeg', 1, 1543040583, '', NULL),
(118, 0, 0, 'YS3X3.jpeg', 'images/4/2018/11/bMI0Lj9ZvI9I9pl2J11cVpZ5CCCume.jpeg', 1, 1543046636, '', NULL),
(119, 0, 0, 'DJbI3.jpeg', 'images/4/2018/11/gOY05z5M3dRhGryY7LOgA5rYy7yG73.jpeg', 1, 1543047477, '', NULL),
(120, 0, 0, 'q2How.jpeg', 'images/4/2018/11/vr33sncL3lCb3suiuBNRROlOrux3L5.jpeg', 1, 1543047497, '', NULL),
(121, 0, 0, 'K33s3.jpeg', 'images/4/2018/11/XBvvpZ497V1mxx7X9bpOxV6Mp99pvj.jpeg', 1, 1543047522, '', NULL),
(122, 0, 0, 'Mw52X.jpeg', 'images/4/2018/11/uOmDkamaODOOt0kY4ogOT7TtOEL0ao.jpeg', 1, 1543048543, '', NULL),
(123, 0, 0, 'szTiE.jpeg', 'images/4/2018/11/exZWWIjFL2qWf2mGq6GwxGKeDlqZl5.jpeg', 1, 1543296889, '', NULL),
(124, 0, 0, 'O1StZ.jpeg', 'images/4/2018/11/WpSS8lxr8TBEss1ZyJqnPSPjEBrjBb.jpeg', 1, 1543296919, '', NULL),
(125, 0, 0, 'v0HPl.jpeg', 'images/4/2018/11/kCJjoBZR3PpcjXJj9g1Ac9bLgBOjjX.jpeg', 1, 1543296950, '', NULL),
(126, 0, 0, 'gQ32E.jpeg', 'images/4/2018/11/bKUEet3U1bcDTcdDh12LkTktEw1TUp.jpeg', 1, 1543296957, '', NULL),
(127, 0, 0, 'XzhXa.jpeg', 'images/4/2018/11/KRYWOrRWTywSLHRLJwqoxls8q3wWTl.jpeg', 1, 1543296978, '', NULL),
(128, 0, 0, 'M0k6f.jpeg', 'images/4/2018/11/ahh08W5LWHbdo5WObdJ0wwOL05wo5O.jpeg', 1, 1543297029, '', NULL),
(129, 0, 0, 'pIJ51.jpeg', 'images/4/2018/11/Yo2j8Z8E8Jg7be81ba1O80BLyjzgOu.jpeg', 1, 1543297031, '', NULL),
(130, 0, 0, '23.jpg', 'images/4/2018/11/aYX9WgIYc06z6R0Uq6yACy1gYYYQx0.jpg', 1, 1543301541, '', NULL),
(131, 0, 0, '未标题-1.jpg', 'images/4/2018/11/E9YZEFfKv9SVZ9V17FKYFf8z9VTo59.jpg', 1, 1543301553, '', NULL),
(132, 0, 0, '未标题-1.jpg', 'images/4/2018/11/W6d67Z9gO22196Fg9zeF76D169s7Pf.jpg', 1, 1543301564, '', NULL),
(136, 0, 0, 'GKEII.jpeg', 'images/4/2018/12/eL8D2L48y7A22yaDNCV7dN8arvznC4.jpeg', 1, 1543644241, '', NULL),
(137, 0, 0, 'AAGqo.jpeg', 'images/4/2018/12/zvB81zApyZ75LhYdzbhDsAP7hW8h7y.jpeg', 1, 1543644290, '', NULL),
(138, 0, 0, 'Tsdxx.jpeg', 'images/4/2018/12/pOa0LiAdEhio7I90l7oC9LOOoyZ11H.jpeg', 1, 1543644311, '', NULL),
(139, 0, 0, 'fJuSu.jpeg', 'images/4/2018/12/KHCDIZ9PmZs3tlB09DSkMT3503CP6B.jpeg', 1, 1543644332, '', NULL),
(142, 0, 0, 'KdHiD.jpeg', 'images/4/2018/12/XOQeeVcP5C9oox5TtOhBh5TpOCjPA6.jpeg', 1, 1544601895, '', NULL),
(144, 0, 0, 'C7ha9.jpeg', 'images/4/2018/12/WbjNvffzJZQ2zHJhhHQW5NhHtH2AVT.jpeg', 1, 1544781367, '', NULL),
(145, 0, 0, '未标题-1.jpg', 'images/4/2018/12/M1uAU34aAEa35b50bNbNU55aH4666e.jpg', 1, 1544781454, '', NULL),
(147, 0, 0, 'KwoJF.jpeg', 'images/4/2018/12/UBN9y5Ty909Y8HYhH398tl3h443f1b.jpeg', 1, 1545018927, '', NULL),
(148, 0, 0, 'v4nHH.jpeg', 'images/4/2018/12/qLaRZRjypap0yjz0sL6bwyyAU9rwUP.jpeg', 1, 1545040409, '', NULL),
(451, 0, 0, 'xmint.jpeg', 'images/3/2018/12/EPjo7uFA5u7Z3fMMjaJOyPf1wFZohY.jpeg', 1, 1546070383, '', NULL),
(490, 0, 0, 'MP4hx.png', 'images/3/2018/12/J9hU29p2am8LN22uMHpnZLLUn2u029.png', 1, 1546238980, '', NULL),
(524, 0, 0, 'k2iBz.jpeg', 'images/3/2019/01/LRu4odrnr8rI41BPh1a81pOEzRR4N1.jpeg', 1, 1547107412, '', NULL),
(538, 0, 0, 'eAa7A.png', 'images/3/2019/01/M7hdy72IMWb7PFBfh4ht1N8MhFITwb.png', 1, 1547353161, '', NULL),
(539, 0, 0, 'SscmH.jpeg', 'images/3/2019/01/He1ju667F1J1Z9HMhXedu6hR6X16v7.jpeg', 1, 1547353177, '', NULL),
(540, 0, 0, 'hHqH0.jpeg', 'images/3/2019/01/VojxBf95x325ABAJfHfB26O396F5Z3.jpeg', 1, 1547353194, '', NULL),
(541, 0, 0, 'CMkQ4.jpeg', 'images/3/2019/01/SN1agd13N211s702Na12T9s37Savd1.jpeg', 1, 1547537301, '', NULL),
(542, 0, 0, 'FSDu1.jpeg', 'images/3/2019/01/GXGKDq66SsVxvVyV1ygxx33CV3tzKY.jpeg', 1, 1547537387, '', NULL),
(548, 0, 11, 'f51b5351f22cdf1ab6b5c65b5935775.png', 'images/0/2019/01/X51h5Hsv1sr2A5D7ssn12ADzVA1S6C.png', 1, 1547782147, '', -1),
(570, 0, 0, 'dZG99.jpeg', 'images/3/2019/01/P5H3cZH3HD95l5PyDQYq0I99siH595.jpeg', 1, 1548301827, '', NULL),
(725, 0, 0, 'murtY.png', 'images/3/2019/03/vLenefEXMHez9mhEXm8Z1zff8fHs8d.png', 1, 1552269950, '', NULL),
(726, 0, 0, 'F993FE16-2A76-4DD9-B9BA-A7B797B23D69.gif', 'images/3/2019/03/K2mrAzguFORc8o523boAYnuoc8BWsw.gif', 1, 1552371333, '', NULL),
(727, 0, 0, '9A2F054D-9E59-436A-B3CB-B40E80246B99.jpeg', 'images/3/2019/03/Arkpivb3vTzvK0kVg3V9VPJP3Z6bPX.jpeg', 1, 1552371388, '', NULL),
(734, 0, 0, 'k9YEE.png', 'images/3/2019/03/WAuT2nM1LWW13EmEO2Jtn9CaFUtt1X.png', 1, 1552714831, '', NULL),
(736, 0, 0, 'OR9PR.jpeg', 'images/3/2019/03/DX03yNAJYf8oO3y3u9ciF400crN3s3.jpeg', 1, 1553328721, '', NULL),
(737, 0, 0, 'p25E1.jpeg', 'images/3/2019/03/Mq755hZ1b7aWB7ULvW7u65880L7W0Q.jpeg', 1, 1553328727, '', NULL),
(738, 0, 0, 'MfHRi.png', 'images/3/2019/03/dQwrfV46fvJH7NwzwAHWj7F6rCcV5I.png', 1, 1553338220, '', NULL),
(740, 0, 0, 'flv69.png', 'images/3/2019/04/ICvXAMvP5R7xkc2h2VV67a229qP15x.png', 1, 1554085018, '', NULL),
(741, 0, 0, 'C3769027-9C7F-4080-B79C-25C1A4D2BA69.png', 'images/3/2019/04/FnM4W999F4K49K4Q9594L35wu53NGR.png', 1, 1554258795, '', NULL),
(742, 0, 0, '31197354-76F3-49B2-AE12-418528BABD35.png', 'images/3/2019/04/D6763yc5LYnKL1f0IP8Dw3o161iDD0.png', 1, 1554258807, '', NULL),
(749, 0, 0, 'Ec7Ac.png', 'images/3/2019/04/nWq3dcQDpWc2PhCbbcDAD3z61zCQBB.png', 1, 1554431924, '', NULL),
(750, 0, 0, 'BCwb5.png', 'images/3/2019/04/kZmHmEB10Q20sHrEecKhaGsKQ1XbsC.png', 1, 1554701673, '', NULL),
(751, 0, 0, 'UvGZa.jpeg', 'images/3/2019/04/X0ao533a75jNA0O44LhGaBzo59nNGn.jpeg', 1, 1554716955, '', NULL),
(752, 0, 0, 'uoFCn.png', 'images/3/2019/04/yPP66sYT6skVS0V0V06X94vs9kkQs1.png', 1, 1554722583, '', NULL),
(757, 0, 0, 'EB35BE81-3C96-4D51-AA46-A7C199133B6C.jpeg', 'images/3/2019/04/UNnU0N9Z1I9u33rak8IrVx1Aj5ra5p.jpeg', 1, 1554948507, '', NULL),
(758, 0, 0, 'F09AB58A-A5AE-44DB-BF4B-4EDC24AB5DB9.png', 'images/3/2019/04/gPPQHTGEXMGvPqPV6EJ6KTpV22qH6k.png', 1, 1554948507, '', NULL),
(759, 0, 0, '9ED25BA9-F1E4-4F1E-B7FC-8E4453FF14C1.jpeg', 'images/3/2019/04/z0w91T2IVuZUw7JZEerU7z0Vst6Avh.jpeg', 1, 1554948507, '', NULL),
(760, 0, 0, 'F9B7AA01-04A5-4537-8D0B-DB4AFB28A66B.jpeg', 'images/3/2019/04/pb722NlLv6S27zb0Q1077fVAsS010F.jpeg', 1, 1554949886, '', NULL),
(761, 0, 0, 'DFDD9F40-DE13-4E86-B463-53E9D50285FA.jpeg', 'images/3/2019/04/Ql3g03eAucS25RN3fz6UWir3zCe6gj.jpeg', 1, 1554963066, '', NULL),
(762, 0, 0, 'E7CACD1A-D90B-44E0-B1DF-D48722EBC577.jpeg', 'images/3/2019/04/l2ecV5W52uCcjUpRMYR55M2CRW5ijM.jpeg', 1, 1554963102, '', NULL),
(766, 0, 0, 'H71d9.jpeg', 'images/3/2019/04/kHg3h92zqT8oh18227MGu59lQT1xt4.jpeg', 1, 1555060369, '', NULL),
(768, 0, 0, 'mJt6f.jpeg', 'images/3/2019/04/PTG459McBTg0oo596ccB9Zm56byo90.jpeg', 1, 1555385713, '', NULL),
(775, 0, 0, '2150E220-FA35-4E3C-BC1D-35AA36F4E870.jpeg', 'images/3/2019/04/uJttLGtyi0MQQ2Vh2zLGBG82hggIoB.jpeg', 1, 1555479446, '', NULL),
(783, 0, 0, '4853DF0B-DD5A-4ADE-A412-1344257E0AE0.jpeg', 'images/3/2019/04/HqEVoO2u3CBZenQUu3n5EUBw2nbWzU.jpeg', 1, 1555552523, '', NULL),
(784, 0, 0, '0AC220C7-2BFA-4AA7-9C6D-E185CB3DB03D.jpeg', 'images/3/2019/04/bge4L5d8LeGBE4MzWbD8BZP878LcZd.jpeg', 1, 1555552523, '', NULL),
(787, 0, 0, '76482FD7-2AB2-4BE8-BA82-18729CEED138.jpeg', 'images/3/2019/04/cKRZ6Kprz5DdkQND2JOEjki5z908Ne.jpeg', 1, 1555742324, '', NULL),
(788, 0, 0, '2AC644CD-A2F7-429F-A3D8-A650C5845DAC.jpeg', 'images/3/2019/04/OLITvT2KJW7oMNgTzJBm2NfzaTNGfn.jpeg', 1, 1555806591, '', NULL),
(789, 0, 0, 'HLudY.png', 'images/3/2019/04/X5xkKh5hwMQu2kq5Hqm54y5Rx4hWzC.png', 1, 1555913514, '', NULL),
(790, 0, 0, 'yT473.png', 'images/3/2019/04/IsHh7NN47PN4ie7ifWWz4aN9nIE4Zn.png', 1, 1555913632, '', NULL),
(791, 0, 0, 'UcJIi.png', 'images/3/2019/04/o7HxOz37NoCX5bV8x7Z8rXo8XLl331.png', 1, 1555913670, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cache`
--

CREATE TABLE `ims_core_cache` (
  `key` varchar(100) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_cache`
--

INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:account_ticket', 's:0:\"\";'),
('we7:module_info:basic', 'a:35:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:11:\"description\";s:201:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:55:\"http://www.w7.com/addons/basic/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:chats', 'a:35:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:55:\"http://www.w7.com/addons/chats/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:custom', 'a:35:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:56:\"http://www.w7.com/addons/custom/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:images', 'a:35:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:56:\"http://www.w7.com/addons/images/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:music', 'a:35:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:11:\"description\";s:183:\"在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:55:\"http://www.w7.com/addons/music/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:news', 'a:35:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:11:\"description\";s:272:\"一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:54:\"http://www.w7.com/addons/news/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:recharge', 'a:35:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:58:\"http://www.w7.com/addons/recharge/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:store', 'a:35:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:5:\"store\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:12:\"站内商城\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:12:\"站内商城\";s:11:\"description\";s:12:\"站内商城\";s:6:\"author\";s:3:\"we7\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:1:\"Z\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"0\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"0\";s:13:\"xzapp_support\";s:1:\"2\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:55:\"http://www.w7.com/addons/store/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:userapi', 'a:35:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:11:\"description\";s:141:\"自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:57:\"http://www.w7.com/addons/userapi/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:video', 'a:35:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:55:\"http://www.w7.com/addons/video/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:voice', 'a:35:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:55:\"http://www.w7.com/addons/voice/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:w7_scaffold', 'a:35:{s:3:\"mid\";s:2:\"13\";s:4:\"name\";s:11:\"w7_scaffold\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:24:\"【开发】微擎模块\";s:7:\"version\";s:5:\"2.3.2\";s:7:\"ability\";s:24:\"【开发】微擎模块\";s:11:\"description\";s:12:\"模块框架\";s:6:\"author\";s:4:\"iexn\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:0:{}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:2:\"N;\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"0\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:45:\"http://www.w7.com/addons/w7_scaffold/icon.jpg\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:61:\"http://www.w7.com/addons/w7_scaffold/preview.jpg?v=1556441093\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_info:wxcard', 'a:35:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:11:\"description\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"0\";s:10:\"oauth_type\";s:1:\"0\";s:14:\"webapp_support\";s:1:\"0\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"0\";s:18:\"toutiaoapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:56:\"http://www.w7.com/addons/wxcard/preview.jpg?v=1556441947\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}s:12:\"recycle_info\";a:0:{}}'),
('we7:module_receive_enable', 'a:0:{}'),
('we7:module_setting:basic:1', 'a:1:{s:6:\"module\";s:5:\"basic\";}'),
('we7:module_setting:chats:1', 'a:1:{s:6:\"module\";s:5:\"chats\";}'),
('we7:module_setting:custom:1', 'a:1:{s:6:\"module\";s:6:\"custom\";}'),
('we7:module_setting:images:1', 'a:1:{s:6:\"module\";s:6:\"images\";}'),
('we7:module_setting:music:1', 'a:1:{s:6:\"module\";s:5:\"music\";}'),
('we7:module_setting:news:1', 'a:1:{s:6:\"module\";s:4:\"news\";}'),
('we7:module_setting:recharge:1', 'a:1:{s:6:\"module\";s:8:\"recharge\";}'),
('we7:module_setting:store:1', 'a:1:{s:6:\"module\";s:5:\"store\";}'),
('we7:module_setting:userapi:1', 'a:1:{s:6:\"module\";s:7:\"userapi\";}'),
('we7:module_setting:video:1', 'a:1:{s:6:\"module\";s:5:\"video\";}'),
('we7:module_setting:voice:1', 'a:1:{s:6:\"module\";s:5:\"voice\";}'),
('we7:module_setting:w7_scaffold:1', 'a:1:{s:6:\"module\";s:11:\"w7_scaffold\";}'),
('we7:module_setting:wxcard:1', 'a:1:{s:6:\"module\";s:6:\"wxcard\";}'),
('we7:setting', 'a:12:{s:14:\"account_ticket\";s:95:\"ticket@@@sXD33PIzkG2ANDqhmTIIF64bw0LjlwWKuFmLvsMIBK4YFmEBv5d7AljRVbSts8dExzPqXEDawBmfVpVF5J5_-A\";s:8:\"authmode\";i:1;s:5:\"basic\";a:1:{s:8:\"template\";s:3:\"2.0\";}s:5:\"close\";a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}s:7:\"cloudip\";a:0:{}s:9:\"copyright\";a:11:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";s:3:\"icp\";s:22:\"津ICP备16004431号-1\";s:13:\"mobile_status\";N;s:10:\"login_type\";N;s:10:\"log_status\";i:1;s:14:\"develop_status\";i:1;s:4:\"bind\";N;s:12:\"welcome_link\";i:6;s:6:\"slides\";a:0:{}s:8:\"baidumap\";a:2:{s:3:\"lng\";N;s:3:\"lat\";N;}}s:10:\"module_ban\";a:0:{}s:18:\"module_receive_ban\";a:5:{s:8:\"szxh_cav\";s:8:\"szxh_cav\";s:15:\"szxh_activeplus\";s:15:\"szxh_activeplus\";s:10:\"szxh_codes\";s:10:\"szxh_codes\";s:11:\"szxh_alliad\";s:11:\"szxh_alliad\";s:13:\"szxh_children\";s:13:\"szxh_children\";}s:14:\"module_upgrade\";a:0:{}s:8:\"platform\";a:5:{s:5:\"token\";s:32:\"A5N88ZL5ITSI8N5ii1m8LM5C385WNMW3\";s:14:\"encodingaeskey\";s:43:\"GluuAWiIlR0wPu3jITNZlj0z0uTHA20t88aR8tarlIU\";s:5:\"appid\";s:18:\"wx333c76c6660807a7\";s:9:\"appsecret\";s:32:\"02a001e37ea4f1d2e8d4e9d64045f985\";s:9:\"authstate\";i:1;}s:8:\"register\";a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}s:4:\"site\";a:6:{s:3:\"key\";i:144845;s:5:\"token\";s:32:\"c85989c54743fc5c1d003d79c6187bef\";s:3:\"url\";s:20:\"http://1.onfinger.cn\";s:7:\"version\";s:5:\"2.0.1\";s:6:\"family\";s:1:\"v\";s:4:\"type\";s:8:\"register\";}}'),
('we7:stat_todaylock:1', 'a:1:{s:6:\"expire\";i:1556449148;}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:system_frame:1', 'a:23:{s:8:\"phoneapp\";a:7:{s:5:\"title\";s:3:\"APP\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=phoneapp&a=display&do=home&\";s:7:\"section\";a:2:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:16:\"phoneapp_profile\";a:3:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:2:{s:28:\"profile_phoneapp_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:6;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:28:\"profile_phoneapp_module_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"front_download\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";b:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"下载APP\";s:3:\"url\";s:40:\"./index.php?c=phoneapp&a=front-download&\";s:15:\"permission_name\";s:23:\"phoneapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:0;s:12:\"displayorder\";i:0;}s:7:\"welcome\";a:7:{s:5:\"title\";s:6:\"首页\";s:4:\"icon\";s:10:\"wi wi-home\";s:3:\"url\";s:48:\"./index.php?c=home&a=welcome&do=system&page=home\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:2;}s:8:\"platform\";a:8:{s:5:\"title\";s:12:\"平台入口\";s:4:\"icon\";s:14:\"wi wi-platform\";s:9:\"dimension\";i:2;s:3:\"url\";s:44:\"./index.php?c=account&a=display&do=platform&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:3;}s:6:\"module\";a:8:{s:5:\"title\";s:12:\"应用入口\";s:4:\"icon\";s:11:\"wi wi-apply\";s:9:\"dimension\";i:2;s:3:\"url\";s:53:\"./index.php?c=module&a=display&do=switch_last_module&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:4;}s:14:\"account_manage\";a:8:{s:5:\"title\";s:12:\"平台管理\";s:4:\"icon\";s:21:\"wi wi-platform-manage\";s:9:\"dimension\";i:2;s:3:\"url\";s:31:\"./index.php?c=account&a=manage&\";s:7:\"section\";a:1:{s:14:\"account_manage\";a:2:{s:5:\"title\";s:12:\"平台管理\";s:4:\"menu\";a:4:{s:22:\"account_manage_display\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"平台列表\";s:3:\"url\";s:31:\"./index.php?c=account&a=manage&\";s:15:\"permission_name\";s:22:\"account_manage_display\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:1:{i:0;a:2:{s:5:\"title\";s:12:\"帐号停用\";s:15:\"permission_name\";s:19:\"account_manage_stop\";}}}s:22:\"account_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"回收站\";s:3:\"url\";s:32:\"./index.php?c=account&a=recycle&\";s:15:\"permission_name\";s:22:\"account_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:12:\"帐号删除\";s:15:\"permission_name\";s:21:\"account_manage_delete\";}i:1;a:2:{s:5:\"title\";s:12:\"帐号恢复\";s:15:\"permission_name\";s:22:\"account_manage_recover\";}}}s:30:\"account_manage_system_platform\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\" 微信开放平台\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:30:\"account_manage_system_platform\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:30:\"account_manage_expired_message\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:22:\" 自定义到期提示\";s:3:\"url\";s:40:\"./index.php?c=account&a=expired-message&\";s:15:\"permission_name\";s:30:\"account_manage_expired_message\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:5;}s:13:\"module_manage\";a:8:{s:5:\"title\";s:12:\"应用管理\";s:4:\"icon\";s:19:\"wi wi-module-manage\";s:9:\"dimension\";i:2;s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=installed&\";s:7:\"section\";a:1:{s:13:\"module_manage\";a:2:{s:5:\"title\";s:12:\"应用管理\";s:4:\"menu\";a:5:{s:23:\"module_manage_installed\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"已安装列表\";s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=installed&\";s:15:\"permission_name\";s:23:\"module_manage_installed\";s:4:\"icon\";N;s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"module_manage_stoped\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"已停用列表\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=recycle&type=1\";s:15:\"permission_name\";s:20:\"module_manage_stoped\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:27:\"module_manage_not_installed\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"未安装列表\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=not_installed&\";s:15:\"permission_name\";s:27:\"module_manage_not_installed\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:21:\"module_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"回收站\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=recycle&type=2\";s:15:\"permission_name\";s:21:\"module_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:23:\"module_manage_subscribe\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"订阅管理\";s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=subscribe&\";s:15:\"permission_name\";s:23:\"module_manage_subscribe\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:6;}s:11:\"user_manage\";a:8:{s:5:\"title\";s:12:\"用户管理\";s:4:\"icon\";s:16:\"wi wi-user-group\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:7:\"section\";a:1:{s:11:\"user_manage\";a:2:{s:5:\"title\";s:12:\"用户管理\";s:4:\"menu\";a:6:{s:19:\"user_manage_display\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"普通用户\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:19:\"user_manage_display\";s:4:\"icon\";N;s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"user_manage_clerk\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"店员管理\";s:3:\"url\";s:39:\"./index.php?c=user&a=display&type=clerk\";s:15:\"permission_name\";s:17:\"user_manage_clerk\";s:4:\"icon\";N;s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"user_manage_check\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"审核用户\";s:3:\"url\";s:39:\"./index.php?c=user&a=display&type=check\";s:15:\"permission_name\";s:17:\"user_manage_check\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"user_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"回收站\";s:3:\"url\";s:41:\"./index.php?c=user&a=display&type=recycle\";s:15:\"permission_name\";s:19:\"user_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:18:\"user_manage_fields\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"用户属性设置\";s:3:\"url\";s:39:\"./index.php?c=user&a=fields&do=display&\";s:15:\"permission_name\";s:18:\"user_manage_fields\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:18:\"user_manage_expire\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"用户过期设置\";s:3:\"url\";s:28:\"./index.php?c=user&a=expire&\";s:15:\"permission_name\";s:18:\"user_manage_expire\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:7;}s:10:\"permission\";a:8:{s:5:\"title\";s:9:\"权限组\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:7:\"section\";a:1:{s:10:\"permission\";a:2:{s:5:\"title\";s:9:\"权限组\";s:4:\"menu\";a:3:{s:23:\"permission_module_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:15:\"permission_name\";s:23:\"permission_module_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:31:\"permission_create_account_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"账号权限组\";s:3:\"url\";s:34:\"./index.php?c=user&a=create-group&\";s:15:\"permission_name\";s:31:\"permission_create_account_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:21:\"permission_user_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"用户权限组合\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:21:\"permission_user_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:8;}s:6:\"system\";a:8:{s:5:\"title\";s:12:\"系统功能\";s:4:\"icon\";s:13:\"wi wi-setting\";s:9:\"dimension\";i:3;s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:7:\"section\";a:4:{s:7:\"article\";a:3:{s:5:\"title\";s:12:\"站内公告\";s:4:\"menu\";a:1:{s:14:\"system_article\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站内公告\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:14:\"system_article\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:12:\"公告列表\";s:15:\"permission_name\";s:26:\"system_article_notice_list\";}i:1;a:2:{s:5:\"title\";s:12:\"公告分类\";s:15:\"permission_name\";s:30:\"system_article_notice_category\";}}}}s:7:\"founder\";b:1;}s:15:\"system_template\";a:3:{s:5:\"title\";s:6:\"模板\";s:4:\"menu\";a:1:{s:15:\"system_template\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:32:\"./index.php?c=system&a=template&\";s:15:\"permission_name\";s:15:\"system_template\";s:4:\"icon\";s:17:\"wi wi-wx-template\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}s:3:\"sms\";a:3:{s:5:\"title\";s:6:\"短信\";s:4:\"menu\";a:2:{s:16:\"system_cloud_sms\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"短信管理\";s:3:\"url\";s:26:\"./index.php?c=cloud&a=sms&\";s:15:\"permission_name\";s:16:\"system_cloud_sms\";s:4:\"icon\";s:9:\"wi wi-sms\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_cloud_sms_sign\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"短信签名\";s:3:\"url\";s:31:\"./index.php?c=cloud&a=sms-sign&\";s:15:\"permission_name\";s:21:\"system_cloud_sms_sign\";s:4:\"icon\";s:14:\"wi wi-sms-sign\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}s:5:\"cache\";a:2:{s:5:\"title\";s:6:\"缓存\";s:4:\"menu\";a:1:{s:26:\"system_setting_updatecache\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"更新缓存\";s:3:\"url\";s:35:\"./index.php?c=system&a=updatecache&\";s:15:\"permission_name\";s:26:\"system_setting_updatecache\";s:4:\"icon\";s:12:\"wi wi-update\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:9;}s:4:\"site\";a:9:{s:5:\"title\";s:12:\"站点设置\";s:4:\"icon\";s:17:\"wi wi-system-site\";s:9:\"dimension\";i:3;s:3:\"url\";s:30:\"./index.php?c=cloud&a=upgrade&\";s:7:\"section\";a:4:{s:5:\"cloud\";a:2:{s:5:\"title\";s:9:\"云服务\";s:4:\"menu\";a:3:{s:14:\"system_profile\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统升级\";s:3:\"url\";s:30:\"./index.php?c=cloud&a=upgrade&\";s:15:\"permission_name\";s:20:\"system_cloud_upgrade\";s:4:\"icon\";s:11:\"wi wi-cache\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_cloud_register\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"注册站点\";s:3:\"url\";s:30:\"./index.php?c=cloud&a=profile&\";s:15:\"permission_name\";s:21:\"system_cloud_register\";s:4:\"icon\";s:18:\"wi wi-registersite\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_cloud_diagnose\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"云服务诊断\";s:3:\"url\";s:31:\"./index.php?c=cloud&a=diagnose&\";s:15:\"permission_name\";s:21:\"system_cloud_diagnose\";s:4:\"icon\";s:14:\"wi wi-diagnose\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:9:{s:19:\"system_setting_site\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:9;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:26:\"system_setting_ipwhitelist\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:11:\"IP白名单\";s:3:\"url\";s:35:\"./index.php?c=system&a=ipwhitelist&\";s:15:\"permission_name\";s:26:\"system_setting_ipwhitelist\";s:4:\"icon\";s:8:\"wi wi-ip\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:28:\"system_setting_sensitiveword\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"过滤敏感词\";s:3:\"url\";s:37:\"./index.php?c=system&a=sensitiveword&\";s:15:\"permission_name\";s:28:\"system_setting_sensitiveword\";s:4:\"icon\";s:15:\"wi wi-sensitive\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_thirdlogin\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\"用户登录/注册设置\";s:3:\"url\";s:33:\"./index.php?c=user&a=registerset&\";s:15:\"permission_name\";s:25:\"system_setting_thirdlogin\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_setting_oauth\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"全局借用权限\";s:3:\"url\";s:29:\"./index.php?c=system&a=oauth&\";s:15:\"permission_name\";s:20:\"system_setting_oauth\";s:4:\"icon\";s:11:\"wi wi-oauth\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:12:\"常用工具\";s:4:\"menu\";a:6:{s:24:\"system_utility_filecheck\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_utility_check\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统常规检测\";s:3:\"url\";s:29:\"./index.php?c=system&a=check&\";s:15:\"permission_name\";s:20:\"system_utility_check\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"backjob\";a:2:{s:5:\"title\";s:12:\"后台任务\";s:4:\"menu\";a:1:{s:10:\"system_job\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"后台任务\";s:3:\"url\";s:38:\"./index.php?c=system&a=job&do=display&\";s:15:\"permission_name\";s:10:\"system_job\";s:4:\"icon\";s:9:\"wi wi-job\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:10;}s:6:\"myself\";a:8:{s:5:\"title\";s:12:\"我的账户\";s:4:\"icon\";s:10:\"wi wi-bell\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:11;}s:7:\"message\";a:8:{s:5:\"title\";s:12:\"消息管理\";s:4:\"icon\";s:10:\"wi wi-bell\";s:9:\"dimension\";i:2;s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:7:\"section\";a:1:{s:7:\"message\";a:2:{s:5:\"title\";s:12:\"消息管理\";s:4:\"menu\";a:3:{s:14:\"message_notice\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息提醒\";s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:15:\"permission_name\";s:14:\"message_notice\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"message_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息设置\";s:3:\"url\";s:42:\"./index.php?c=message&a=notice&do=setting&\";s:15:\"permission_name\";s:15:\"message_setting\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:22:\"message_wechat_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"微信提醒设置\";s:3:\"url\";s:49:\"./index.php?c=message&a=notice&do=wechat_setting&\";s:15:\"permission_name\";s:22:\"message_wechat_setting\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:12;}s:7:\"account\";a:8:{s:5:\"title\";s:9:\"公众号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:9:\"dimension\";i:3;s:3:\"url\";s:41:\"./index.php?c=home&a=welcome&do=platform&\";s:7:\"section\";a:4:{s:8:\"platform\";a:2:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:6:{s:14:\"platform_reply\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{s:22:\"platform_reply_keyword\";a:4:{s:5:\"title\";s:21:\"关键字自动回复\";s:3:\"url\";s:40:\"./index.php?c=platform&a=reply&m=keyword\";s:15:\"permission_name\";s:22:\"platform_reply_keyword\";s:6:\"active\";s:7:\"keyword\";}s:22:\"platform_reply_special\";a:4:{s:5:\"title\";s:24:\"非关键字自动回复\";s:3:\"url\";s:40:\"./index.php?c=platform&a=reply&m=special\";s:15:\"permission_name\";s:22:\"platform_reply_special\";s:6:\"active\";s:7:\"special\";}s:22:\"platform_reply_welcome\";a:4:{s:5:\"title\";s:24:\"首次访问自动回复\";s:3:\"url\";s:40:\"./index.php?c=platform&a=reply&m=welcome\";s:15:\"permission_name\";s:22:\"platform_reply_welcome\";s:6:\"active\";s:7:\"welcome\";}s:22:\"platform_reply_default\";a:4:{s:5:\"title\";s:12:\"默认回复\";s:3:\"url\";s:40:\"./index.php?c=platform&a=reply&m=default\";s:15:\"permission_name\";s:22:\"platform_reply_default\";s:6:\"active\";s:7:\"default\";}s:22:\"platform_reply_service\";a:4:{s:5:\"title\";s:12:\"常用服务\";s:3:\"url\";s:40:\"./index.php?c=platform&a=reply&m=service\";s:15:\"permission_name\";s:22:\"platform_reply_service\";s:6:\"active\";s:7:\"service\";}s:22:\"platform_reply_userapi\";a:5:{s:5:\"title\";s:21:\"自定义接口回复\";s:3:\"url\";s:40:\"./index.php?c=platform&a=reply&m=userapi\";s:15:\"permission_name\";s:22:\"platform_reply_userapi\";s:6:\"active\";s:7:\"userapi\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:22:\"platform_reply_setting\";a:4:{s:5:\"title\";s:12:\"回复设置\";s:3:\"url\";s:38:\"./index.php?c=profile&a=reply-setting&\";s:15:\"permission_name\";s:22:\"platform_reply_setting\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:13:\"platform_menu\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:21:\"platform_menu_default\";a:4:{s:5:\"title\";s:12:\"默认菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:21:\"platform_menu_default\";s:6:\"active\";s:4:\"post\";}s:25:\"platform_menu_conditional\";a:5:{s:5:\"title\";s:15:\"个性化菜单\";s:3:\"url\";s:47:\"./index.php?c=platform&a=menu&do=display&type=3\";s:15:\"permission_name\";s:25:\"platform_menu_conditional\";s:6:\"active\";s:7:\"display\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:11:\"platform_qr\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:22:\"二维码/转化链接\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:14:\"platform_qr_qr\";a:4:{s:5:\"title\";s:9:\"二维码\";s:3:\"url\";s:36:\"./index.php?c=platform&a=qr&do=list&\";s:15:\"permission_name\";s:14:\"platform_qr_qr\";s:6:\"active\";s:4:\"list\";}s:22:\"platform_qr_statistics\";a:4:{s:5:\"title\";s:21:\"二维码扫描统计\";s:3:\"url\";s:39:\"./index.php?c=platform&a=qr&do=display&\";s:15:\"permission_name\";s:22:\"platform_qr_statistics\";s:6:\"active\";s:7:\"display\";}}}s:17:\"platform_masstask\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"定时群发\";s:3:\"url\";s:30:\"./index.php?c=platform&a=mass&\";s:15:\"permission_name\";s:17:\"platform_masstask\";s:4:\"icon\";s:13:\"wi wi-crontab\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:22:\"platform_masstask_post\";a:4:{s:5:\"title\";s:12:\"定时群发\";s:3:\"url\";s:38:\"./index.php?c=platform&a=mass&do=post&\";s:15:\"permission_name\";s:22:\"platform_masstask_post\";s:6:\"active\";s:4:\"post\";}s:22:\"platform_masstask_send\";a:4:{s:5:\"title\";s:12:\"群发记录\";s:3:\"url\";s:38:\"./index.php?c=platform&a=mass&do=send&\";s:15:\"permission_name\";s:22:\"platform_masstask_send\";s:6:\"active\";s:4:\"send\";}}}s:17:\"platform_material\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:\"is_display\";i:1;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:5:{s:22:\"platform_material_news\";a:4:{s:5:\"title\";s:6:\"图文\";s:3:\"url\";s:43:\"./index.php?c=platform&a=material&type=news\";s:15:\"permission_name\";s:22:\"platform_material_news\";s:6:\"active\";s:4:\"news\";}s:23:\"platform_material_image\";a:4:{s:5:\"title\";s:6:\"图片\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=image\";s:15:\"permission_name\";s:23:\"platform_material_image\";s:6:\"active\";s:5:\"image\";}s:23:\"platform_material_voice\";a:4:{s:5:\"title\";s:6:\"语音\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=voice\";s:15:\"permission_name\";s:23:\"platform_material_voice\";s:6:\"active\";s:5:\"voice\";}s:23:\"platform_material_video\";a:5:{s:5:\"title\";s:6:\"视频\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=video\";s:15:\"permission_name\";s:23:\"platform_material_video\";s:6:\"active\";s:5:\"video\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:24:\"platform_material_delete\";a:3:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:24:\"platform_material_delete\";s:10:\"is_display\";b:0;}}}s:13:\"platform_site\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:16:\"微官网-文章\";s:3:\"url\";s:27:\"./index.php?c=site&a=multi&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:4:{s:19:\"platform_site_multi\";a:4:{s:5:\"title\";s:9:\"微官网\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:19:\"platform_site_multi\";s:6:\"active\";s:5:\"multi\";}s:19:\"platform_site_style\";a:4:{s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:39:\"./index.php?c=site&a=style&do=template&\";s:15:\"permission_name\";s:19:\"platform_site_style\";s:6:\"active\";s:5:\"style\";}s:21:\"platform_site_article\";a:4:{s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:40:\"./index.php?c=site&a=article&do=display&\";s:15:\"permission_name\";s:21:\"platform_site_article\";s:6:\"active\";s:7:\"article\";}s:22:\"platform_site_category\";a:4:{s:5:\"title\";s:18:\"文章分类管理\";s:3:\"url\";s:41:\"./index.php?c=site&a=category&do=display&\";s:15:\"permission_name\";s:22:\"platform_site_category\";s:6:\"active\";s:8:\"category\";}}}}}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:2:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:3:{s:7:\"mc_fans\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:15:\"mc_fans_display\";a:4:{s:5:\"title\";s:12:\"全部粉丝\";s:3:\"url\";s:35:\"./index.php?c=mc&a=fans&do=display&\";s:15:\"permission_name\";s:15:\"mc_fans_display\";s:6:\"active\";s:7:\"display\";}s:21:\"mc_fans_fans_sync_set\";a:4:{s:5:\"title\";s:18:\"粉丝同步设置\";s:3:\"url\";s:41:\"./index.php?c=mc&a=fans&do=fans_sync_set&\";s:15:\"permission_name\";s:21:\"mc_fans_fans_sync_set\";s:6:\"active\";s:13:\"fans_sync_set\";}}}s:9:\"mc_member\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{s:17:\"mc_member_diaplsy\";a:4:{s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:37:\"./index.php?c=mc&a=member&do=display&\";s:15:\"permission_name\";s:17:\"mc_member_diaplsy\";s:6:\"active\";s:7:\"display\";}s:15:\"mc_member_group\";a:4:{s:5:\"title\";s:9:\"会员组\";s:3:\"url\";s:36:\"./index.php?c=mc&a=group&do=display&\";s:15:\"permission_name\";s:15:\"mc_member_group\";s:6:\"active\";s:7:\"display\";}s:12:\"mc_member_uc\";a:5:{s:5:\"title\";s:12:\"会员中心\";s:3:\"url\";s:34:\"./index.php?c=site&a=editor&do=uc&\";s:15:\"permission_name\";s:12:\"mc_member_uc\";s:6:\"active\";s:2:\"uc\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:19:\"mc_member_quickmenu\";a:5:{s:5:\"title\";s:12:\"快捷菜单\";s:3:\"url\";s:41:\"./index.php?c=site&a=editor&do=quickmenu&\";s:15:\"permission_name\";s:19:\"mc_member_quickmenu\";s:6:\"active\";s:9:\"quickmenu\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:25:\"mc_member_register_seting\";a:5:{s:5:\"title\";s:12:\"注册设置\";s:3:\"url\";s:46:\"./index.php?c=mc&a=member&do=register_setting&\";s:15:\"permission_name\";s:25:\"mc_member_register_seting\";s:6:\"active\";s:16:\"register_setting\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:24:\"mc_member_credit_setting\";a:4:{s:5:\"title\";s:12:\"积分设置\";s:3:\"url\";s:44:\"./index.php?c=mc&a=member&do=credit_setting&\";s:15:\"permission_name\";s:24:\"mc_member_credit_setting\";s:6:\"active\";s:14:\"credit_setting\";}s:16:\"mc_member_fields\";a:4:{s:5:\"title\";s:18:\"会员字段管理\";s:3:\"url\";s:34:\"./index.php?c=mc&a=fields&do=list&\";s:15:\"permission_name\";s:16:\"mc_member_fields\";s:6:\"active\";s:4:\"list\";}}}s:10:\"mc_message\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"留言管理\";s:3:\"url\";s:27:\"./index.php?c=mc&a=message&\";s:15:\"permission_name\";s:10:\"mc_message\";s:4:\"icon\";s:13:\"wi wi-message\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:5:{s:15:\"profile_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{s:22:\"profile_setting_remote\";a:4:{s:5:\"title\";s:12:\"远程附件\";s:3:\"url\";s:42:\"./index.php?c=profile&a=remote&do=display&\";s:15:\"permission_name\";s:22:\"profile_setting_remote\";s:6:\"active\";s:7:\"display\";}s:24:\"profile_setting_passport\";a:5:{s:5:\"title\";s:12:\"借用权限\";s:3:\"url\";s:42:\"./index.php?c=profile&a=passport&do=oauth&\";s:15:\"permission_name\";s:24:\"profile_setting_passport\";s:6:\"active\";s:5:\"oauth\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:25:\"profile_setting_tplnotice\";a:5:{s:5:\"title\";s:18:\"微信通知设置\";s:3:\"url\";s:42:\"./index.php?c=profile&a=tplnotice&do=list&\";s:15:\"permission_name\";s:25:\"profile_setting_tplnotice\";s:6:\"active\";s:4:\"list\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:22:\"profile_setting_notify\";a:5:{s:5:\"title\";s:18:\"邮件通知参数\";s:3:\"url\";s:39:\"./index.php?c=profile&a=notify&do=mail&\";s:15:\"permission_name\";s:22:\"profile_setting_notify\";s:6:\"active\";s:4:\"mail\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:26:\"profile_setting_uc_setting\";a:5:{s:5:\"title\";s:14:\"UC站点整合\";s:3:\"url\";s:45:\"./index.php?c=profile&a=common&do=uc_setting&\";s:15:\"permission_name\";s:26:\"profile_setting_uc_setting\";s:6:\"active\";s:10:\"uc_setting\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:27:\"profile_setting_upload_file\";a:5:{s:5:\"title\";s:20:\"上传JS接口文件\";s:3:\"url\";s:46:\"./index.php?c=profile&a=common&do=upload_file&\";s:15:\"permission_name\";s:27:\"profile_setting_upload_file\";s:6:\"active\";s:11:\"upload_file\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:15:\"profile_payment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:15:\"profile_payment\";s:4:\"icon\";s:17:\"wi wi-pay-setting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:19:\"profile_payment_pay\";a:4:{s:5:\"title\";s:12:\"支付配置\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:19:\"profile_payment_pay\";s:6:\"active\";s:7:\"payment\";}s:22:\"profile_payment_refund\";a:4:{s:5:\"title\";s:12:\"退款配置\";s:3:\"url\";s:42:\"./index.php?c=profile&a=refund&do=display&\";s:15:\"permission_name\";s:22:\"profile_payment_refund\";s:6:\"active\";s:6:\"refund\";}}}s:23:\"profile_app_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:31:\"profile_app_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:18:\"webapp_module_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"webapp_rewrite\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:9:\"伪静态\";s:3:\"url\";s:31:\"./index.php?c=webapp&a=rewrite&\";s:15:\"permission_name\";s:14:\"webapp_rewrite\";s:4:\"icon\";s:13:\"wi wi-rewrite\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:13;}s:5:\"wxapp\";a:8:{s:5:\"title\";s:15:\"微信小程序\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:9:\"dimension\";i:3;s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:5:{s:14:\"wxapp_entrance\";a:3:{s:5:\"title\";s:15:\"小程序入口\";s:4:\"menu\";a:1:{s:20:\"module_entrance_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"入口页面\";s:3:\"url\";s:36:\"./index.php?c=wxapp&a=entrance-link&\";s:15:\"permission_name\";s:19:\"wxapp_entrance_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:9:\"mc_member\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:15:\"mc_wxapp_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:4:{s:17:\"mc_member_diaplsy\";a:4:{s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:37:\"./index.php?c=mc&a=member&do=display&\";s:15:\"permission_name\";s:17:\"mc_member_diaplsy\";s:6:\"active\";s:7:\"display\";}s:15:\"mc_member_group\";a:4:{s:5:\"title\";s:9:\"会员组\";s:3:\"url\";s:36:\"./index.php?c=mc&a=group&do=display&\";s:15:\"permission_name\";s:15:\"mc_member_group\";s:6:\"active\";s:7:\"display\";}s:24:\"mc_member_credit_setting\";a:4:{s:5:\"title\";s:12:\"积分设置\";s:3:\"url\";s:44:\"./index.php?c=mc&a=member&do=credit_setting&\";s:15:\"permission_name\";s:24:\"mc_member_credit_setting\";s:6:\"active\";s:14:\"credit_setting\";}s:16:\"mc_member_fields\";a:4:{s:5:\"title\";s:18:\"会员字段管理\";s:3:\"url\";s:34:\"./index.php?c=mc&a=fields&do=list&\";s:15:\"permission_name\";s:16:\"mc_member_fields\";s:6:\"active\";s:4:\"list\";}}}}s:10:\"is_display\";i:0;}s:13:\"wxapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:5:{s:33:\"wxapp_profile_module_link_uniacid\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:33:\"wxapp_profile_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"wxapp_profile_payment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:30:\"./index.php?c=wxapp&a=payment&\";s:15:\"permission_name\";s:21:\"wxapp_profile_payment\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:17:\"wxapp_payment_pay\";a:4:{s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:41:\"./index.php?c=wxapp&a=payment&do=display&\";s:15:\"permission_name\";s:17:\"wxapp_payment_pay\";s:6:\"active\";s:7:\"payment\";}s:20:\"wxapp_payment_refund\";a:4:{s:5:\"title\";s:12:\"退款配置\";s:3:\"url\";s:40:\"./index.php?c=wxapp&a=refund&do=display&\";s:15:\"permission_name\";s:20:\"wxapp_payment_refund\";s:6:\"active\";s:6:\"refund\";}}}s:28:\"wxapp_profile_front_download\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"下载程序包\";s:3:\"url\";s:37:\"./index.php?c=wxapp&a=front-download&\";s:15:\"permission_name\";s:28:\"wxapp_profile_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"wxapp_profile_domainset\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"域名设置\";s:3:\"url\";s:32:\"./index.php?c=wxapp&a=domainset&\";s:15:\"permission_name\";s:23:\"wxapp_profile_domainset\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:22:\"profile_setting_remote\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:22:\"profile_setting_remote\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:16:\"statistics_visit\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:22:\"statistics_visit_wxapp\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{s:20:\"statistics_visit_app\";a:4:{s:5:\"title\";s:24:\"app端访问统计信息\";s:3:\"url\";s:42:\"./index.php?c=statistics&a=app&do=display&\";s:15:\"permission_name\";s:20:\"statistics_visit_app\";s:6:\"active\";s:3:\"app\";}s:21:\"statistics_visit_site\";a:4:{s:5:\"title\";s:24:\"所有用户访问统计\";s:3:\"url\";s:51:\"./index.php?c=statistics&a=site&do=current_account&\";s:15:\"permission_name\";s:21:\"statistics_visit_site\";s:6:\"active\";s:4:\"site\";}s:24:\"statistics_visit_setting\";a:4:{s:5:\"title\";s:18:\"访问统计设置\";s:3:\"url\";s:46:\"./index.php?c=statistics&a=setting&do=display&\";s:15:\"permission_name\";s:24:\"statistics_visit_setting\";s:6:\"active\";s:7:\"setting\";}}}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:14;}s:6:\"webapp\";a:7:{s:5:\"title\";s:2:\"PC\";s:4:\"icon\";s:8:\"wi wi-pc\";s:3:\"url\";s:39:\"./index.php?c=webapp&a=home&do=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:15;}s:5:\"xzapp\";a:7:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"icon\";s:11:\"wi wi-xzapp\";s:3:\"url\";s:38:\"./index.php?c=xzapp&a=home&do=display&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:16;}s:6:\"aliapp\";a:7:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"icon\";s:12:\"wi wi-aliapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:17;}s:8:\"baiduapp\";a:7:{s:5:\"title\";s:15:\"百度小程序\";s:4:\"icon\";s:14:\"wi wi-baiduapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:18;}s:10:\"toutiaoapp\";a:7:{s:5:\"title\";s:15:\"头条小程序\";s:4:\"icon\";s:16:\"wi wi-toutiaoapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:19;}s:9:\"appmarket\";a:9:{s:5:\"title\";s:6:\"市场\";s:4:\"icon\";s:12:\"wi wi-market\";s:3:\"url\";s:14:\"http://s.w7.cc\";s:7:\"section\";a:0:{}s:5:\"blank\";b:1;s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:20;}s:9:\"workorder\";a:9:{s:5:\"title\";s:6:\"工单\";s:4:\"icon\";s:10:\"wi wi-bell\";s:9:\"dimension\";i:2;s:3:\"url\";s:44:\"./index.php?c=system&a=workorder&do=display&\";s:7:\"section\";a:1:{s:9:\"workorder\";a:2:{s:5:\"title\";s:12:\"工单系统\";s:4:\"menu\";a:1:{s:16:\"system_workorder\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"工单系统\";s:3:\"url\";s:44:\"./index.php?c=system&a=workorder&do=display&\";s:15:\"permission_name\";s:16:\"system_workorder\";s:4:\"icon\";s:17:\"wi wi-system-work\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:21;}s:4:\"help\";a:7:{s:5:\"title\";s:6:\"帮助\";s:4:\"icon\";s:12:\"wi wi-market\";s:3:\"url\";s:29:\"./index.php?c=help&a=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:22;}s:11:\"custom_help\";a:7:{s:5:\"title\";s:12:\"本站帮助\";s:4:\"icon\";s:12:\"wi wi-market\";s:3:\"url\";s:39:\"./index.php?c=help&a=display&do=custom&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:23;}}'),
('we7:uniaccount:1', 'a:21:{s:4:\"acid\";s:1:\"1\";s:7:\"uniacid\";s:1:\"1\";s:5:\"token\";s:32:\"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP\";s:14:\"encodingaeskey\";s:0:\"\";s:5:\"level\";s:1:\"1\";s:4:\"name\";s:7:\"we7team\";s:7:\"account\";s:0:\"\";s:8:\"original\";s:0:\"\";s:9:\"signature\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:10:\"lastupdate\";s:1:\"0\";s:3:\"key\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:7:\"styleid\";s:1:\"1\";s:12:\"subscribeurl\";s:0:\"\";s:18:\"auth_refresh_token\";s:0:\"\";s:11:\"encrypt_key\";s:0:\"\";}'),
('we7:unicount:1', 's:1:\"1\";'),
('we7:unimodules:1', 'a:1:{i:0;s:11:\"w7_scaffold\";}'),
('we7:unisetting:1', 'a:30:{s:7:\"uniacid\";s:1:\"1\";s:8:\"passport\";a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}s:5:\"oauth\";s:0:\"\";s:11:\"jsauth_acid\";s:1:\"0\";s:2:\"uc\";a:1:{s:6:\"status\";i:0;}s:6:\"notify\";a:1:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}}s:11:\"creditnames\";a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}s:15:\"creditbehaviors\";a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}s:7:\"welcome\";s:0:\"\";s:7:\"default\";s:0:\"\";s:15:\"default_message\";s:0:\"\";s:7:\"payment\";a:4:{s:6:\"credit\";a:3:{s:6:\"switch\";b:0;s:15:\"recharge_switch\";b:0;s:10:\"pay_switch\";b:0;}s:6:\"alipay\";a:6:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:15:\"recharge_switch\";b:0;s:10:\"pay_switch\";b:0;}s:6:\"wechat\";a:7:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";s:15:\"recharge_switch\";b:0;s:10:\"pay_switch\";b:0;}s:8:\"delivery\";a:3:{s:6:\"switch\";b:0;s:15:\"recharge_switch\";b:0;s:10:\"pay_switch\";b:0;}}s:4:\"stat\";s:0:\"\";s:12:\"default_site\";s:1:\"1\";s:4:\"sync\";s:1:\"0\";s:8:\"recharge\";s:0:\"\";s:9:\"tplnotice\";s:0:\"\";s:10:\"grouplevel\";s:1:\"0\";s:8:\"mcplugin\";s:0:\"\";s:15:\"exchange_enable\";s:1:\"0\";s:11:\"coupon_type\";s:1:\"0\";s:7:\"menuset\";s:0:\"\";s:10:\"statistics\";s:0:\"\";s:11:\"bind_domain\";s:0:\"\";s:14:\"comment_status\";s:1:\"0\";s:13:\"reply_setting\";s:1:\"0\";s:14:\"default_module\";s:0:\"\";s:16:\"attachment_limit\";N;s:15:\"attachment_size\";N;s:11:\"sync_member\";s:1:\"0\";}'),
('we7:userbasefields', 'a:46:{s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:6:\"mobile\";s:12:\"手机号码\";s:5:\"email\";s:12:\"电子邮箱\";s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"gender\";s:6:\"性别\";s:5:\"birth\";s:6:\"生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:6:\"地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:6:\"reside\";s:9:\"居住地\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:8:\"password\";s:6:\"密码\";s:12:\"pay_password\";s:12:\"支付密码\";}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:usersfields', 'a:49:{s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"mobile\";s:12:\"手机号码\";s:3:\"vip\";s:9:\"VIP级别\";s:6:\"gender\";s:6:\"性别\";s:9:\"birthyear\";s:12:\"出生生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:12:\"邮寄地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:14:\"resideprovince\";s:12:\"居住地址\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:5:\"email\";s:12:\"电子邮箱\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:10:\"birthmonth\";s:12:\"出生月份\";s:8:\"birthday\";s:12:\"出生日期\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:8:\"password\";s:12:\"用户密码\";s:12:\"pay_password\";s:12:\"支付密码\";}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron`
--

CREATE TABLE `ims_core_cron` (
  `id` int(10) UNSIGNED NOT NULL,
  `cloudid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) UNSIGNED NOT NULL,
  `nextruntime` int(10) UNSIGNED NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron_record`
--

CREATE TABLE `ims_core_cron_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) UNSIGNED NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_job`
--

CREATE TABLE `ims_core_job` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `isdeleted` tinyint(1) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_job`
--

INSERT INTO `ims_core_job` (`id`, `type`, `uniacid`, `payload`, `status`, `title`, `handled`, `total`, `createtime`, `updatetime`, `endtime`, `isdeleted`, `uid`) VALUES
(1, 10, 3, '', 1, '删除小猴大咖汇的素材数据', 496, 496, 1555920540, 1555920592, 1555920593, 1, 1),
(2, 10, 4, '', 1, '删除商家新联盟的素材数据', 242, 242, 1555920614, 1555920658, 1555920659, 1, 1),
(3, 10, 5, '', 1, '删除鹏飞旅行网的素材数据', 1, 1, 1555920618, 1555920619, 1555920636, 1, 1),
(4, 10, 6, '', 1, '删除FIN轻便管理的素材数据', 0, 0, 1555920623, 1555920623, 1555920623, 1, 1),
(5, 10, 7, '', 1, '删除1的素材数据', 0, 0, 1555920627, 1555920627, 1555920627, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_menu`
--

CREATE TABLE `ims_core_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_system` tinyint(3) UNSIGNED NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  `group_name` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_menu`
--

INSERT INTO `ims_core_menu` (`id`, `pid`, `title`, `name`, `url`, `append_title`, `append_url`, `displayorder`, `type`, `is_display`, `is_system`, `permission_name`, `group_name`, `icon`) VALUES
(1, 0, '', '', '', '', '', 0, '', 0, 1, 'phoneapp', 'frame', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_menu_shortcut`
--

CREATE TABLE `ims_core_menu_shortcut` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `position` varchar(100) NOT NULL,
  `updatetime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_paylog`
--

CREATE TABLE `ims_core_paylog` (
  `plid` bigint(11) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) UNSIGNED NOT NULL,
  `card_type` tinyint(3) UNSIGNED NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) UNSIGNED NOT NULL,
  `encrypt_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_performance`
--

CREATE TABLE `ims_core_performance` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_queue`
--

CREATE TABLE `ims_core_queue` (
  `qid` bigint(20) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_refundlog`
--

CREATE TABLE `ims_core_refundlog` (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `refund_uniontid` varchar(64) NOT NULL,
  `reason` varchar(80) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_resource`
--

CREATE TABLE `ims_core_resource` (
  `mid` int(11) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sendsms_log`
--

CREATE TABLE `ims_core_sendsms_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sessions`
--

CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_sessions`
--

INSERT INTO `ims_core_sessions` (`sid`, `uniacid`, `openid`, `data`, `expiretime`) VALUES
('013f6beea69f64790c499001957c9c7d', 50, '14.213.194.102', 'acid|N;uniacid|i:50;', 1555919879),
('01bafa9b903315a7ef86a48cc509108f', 50, '117.136.38.139', 'acid|N;uniacid|i:50;', 1555922444),
('02395a5e97498ae93eef662ca8eeabc0', 50, '223.21.90.243', 'acid|N;uniacid|i:50;', 1555923369),
('02966030a3818e5d2e9dd11dc01aa083', 50, '103.25.28.30', 'acid|N;uniacid|i:50;', 1555920397),
('02c4cf6c4bc5eef150fb2da855b4a999', 50, '223.104.3.153', 'acid|N;uniacid|i:50;', 1555923737),
('0317a67d2fb71fa266dd69a2076fad1d', 50, '120.244.107.233', 'acid|N;uniacid|i:50;', 1555920272),
('034c5568f0004f9e0a69bfbe8c21e281', 50, '114.252.20.205', 'acid|N;uniacid|i:50;', 1555920789),
('034c5f08065bbca660cc8a7b94471b45', 50, '120.244.117.98', 'acid|N;uniacid|i:50;', 1555923330),
('0360153c5567a87928f75eec7dd42c76', 50, '113.47.191.180', 'acid|N;uniacid|i:50;', 1555922215),
('07e3dac4838b9a6e8e20579cecf8bb5b', 50, '61.51.152.240', 'acid|N;uniacid|i:50;', 1555921771),
('08430641669e19d6b6651bd9646f796c', 50, '61.148.245.246', 'acid|N;uniacid|i:50;', 1555920105),
('0a0cae5cc3d90d75a44434a641f29e02', 50, '123.115.50.96', 'acid|N;uniacid|i:50;', 1555920195),
('0bea15aaae2900a89eeb29bac89d11ac', 50, '61.148.226.106', 'acid|N;uniacid|i:50;', 1555922963),
('0c45c1cd3ade96155edaaa18cd24a2b4', 50, '111.197.23.214', 'acid|N;uniacid|i:50;', 1555921639),
('0df674b21fa9d86517ddc9617b349bb6', 50, '223.72.39.148', 'acid|N;uniacid|i:50;', 1555919656),
('0e7457d409c8f02b4097853aabb83b34', 50, '123.118.73.106', 'acid|N;uniacid|i:50;', 1555919767),
('0f7840b78c87bf5974cd3aa57c2dda11', 50, '223.104.3.155', 'acid|N;uniacid|i:50;', 1555922269),
('0f985171347b56ed2db923564bf90f93', 50, '222.128.45.246', 'acid|N;uniacid|i:50;', 1555922901),
('104081fcc67c0d89c645c93fee914276', 50, '114.249.134.30', 'acid|N;uniacid|i:50;', 1555920070),
('10616e2e4250d8310439e27962f02caf', 50, '103.63.154.193', 'acid|N;uniacid|i:50;', 1555919289),
('120aaeb922febd7e0073b9f3a13e7a12', 50, '114.251.228.170', 'acid|N;uniacid|i:50;', 1555923598),
('123bef2b058df33d3531ac5c1d40a7e5', 50, '223.72.67.154', 'acid|N;uniacid|i:50;', 1555920719),
('12e63938b125cb8bd640e5b4490d7711', 50, '61.50.155.186', 'acid|N;uniacid|i:50;', 1555920765),
('136fb539ffbc884518efe4875b75612f', 50, '223.104.3.174', 'acid|N;uniacid|i:50;', 1555919908),
('147a298cebc9a95b69c1300a304a59d3', 50, '117.136.0.164', 'acid|N;uniacid|i:50;', 1555919976),
('15224ba0dcb854ef7aacf0a0dfe97983', 50, '222.129.231.79', 'acid|N;uniacid|i:50;', 1555923023),
('15c852bba257ad0289aac19914becb6b', 50, '120.4.73.169', 'acid|N;uniacid|i:50;', 1555923139),
('164438a65cce0a104443676a65b39552', 50, '114.241.16.46', 'acid|N;uniacid|i:50;', 1555920668),
('167abf0cacef831b43cb7f5bec41e14f', 50, '123.120.215.116', 'acid|N;uniacid|i:50;', 1555920139),
('168d3d4f73fc8cd8761dc9528d7fb86f', 29, '101.91.60.104', 'acid|N;uniacid|i:29;token|a:1:{s:4:\"k2oI\";i:1555920029;}', 1555923629),
('17945cd7a5f3edb4329e46e63e6d673b', 3, '117.12.242.132', 'acid|i:3;uniacid|i:3;token|a:6:{s:4:\"pfj9\";i:1555920012;s:4:\"c2f7\";i:1555920012;s:4:\"MP29\";i:1555920017;s:4:\"KpE7\";i:1555920018;s:4:\"NMRD\";i:1555920018;s:4:\"KPY5\";i:1555920019;}dest_url|s:192:\"http%3A%2F%2F1.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26m%3Dszxh_children%26do%3Dmain%26actid%3D4%26openid%3DoJmJzwDf-gv-sh7Y-70N5_F7eATg%26from%3Dsinglemessage%26isappinstalled%3D0\";oauth_openid|s:28:\"oJmJzwHd65ylVl0bInFTnPH7em-8\";oauth_acid|s:1:\"3\";openid|s:28:\"oJmJzwHd65ylVl0bInFTnPH7em-8\";uid|s:2:\"54\";__acid|i:3;__uniacid|i:3;', 1555923619),
('18b32c6d6cd7663b95da675679a84c59', 50, '114.251.216.154', 'acid|N;uniacid|i:50;', 1555921757),
('1a6b454c442ebb5b6ded36e2fea9544f', 50, '121.71.211.102', 'acid|N;uniacid|i:50;', 1555922862),
('1bd15a75749ebddf8428c9eeb0a20e3e', 50, '59.108.15.42', 'acid|N;uniacid|i:50;', 1555923727),
('1becc3d25874393f47a9d8979257dfc7', 50, '222.129.141.252', 'acid|N;uniacid|i:50;', 1555923818),
('1c2011c245ceb19cbb9ccde024e8480f', 50, '111.197.114.130', 'acid|N;uniacid|i:50;', 1555923329),
('1e906c509f54aeab59e4bb70f1ef1d9f', 50, '125.34.83.231', 'acid|N;uniacid|i:50;', 1555919934),
('202b533158b51c2e64361f191c998e8d', 50, '61.148.244.173', 'acid|N;uniacid|i:50;', 1555921658),
('2031a228b13825035ea2990814b0054c', 50, '120.244.119.38', 'acid|N;uniacid|i:50;', 1555923751),
('204476d7c8cf7af316a91327bac6c4fa', 50, '113.5.5.0', 'acid|N;uniacid|i:50;', 1555920669),
('20869bd1b2ae431c7ac92600f3e9587c', 50, '221.218.194.199', 'acid|N;uniacid|i:50;', 1555919943),
('20a6b736e9d1e8d242a19a21d875f122', 50, '211.103.227.251', 'acid|N;uniacid|i:50;', 1555919444),
('20abe7cb8af0dc7b25d3166486c35f5a', 50, '123.113.141.50', 'acid|N;uniacid|i:50;', 1555921412),
('20bb09c51d3a6ca23fef381f68ac8c60', 50, '117.136.38.171', 'acid|N;uniacid|i:50;', 1555922320),
('21cb794716da629e176758902a265399', 29, '101.91.60.104', 'acid|N;uniacid|i:29;', 1555923631),
('221fd29cb01e81b8f1d0822aa2307f4c', 50, '223.104.3.171', 'acid|N;uniacid|i:50;', 1555919481),
('222228f3438ce6932a6de7aa469066c4', 50, '1.95.233.51', 'acid|N;uniacid|i:50;', 1555921734),
('222880302e1ded80f482afcecee90d52', 50, '110.245.35.117', 'acid|N;uniacid|i:50;', 1555920053),
('2268373cf4d5790a2829dd8711767af8', 50, '223.104.3.151', 'acid|N;uniacid|i:50;', 1555921001),
('22cbcdde0de31e24a6a9a397deee9cb1', 50, '123.118.73.106', 'acid|N;uniacid|i:50;', 1555919794),
('22de2529737ed43c5419220443af633c', 50, '116.136.20.209', 'acid|N;uniacid|i:50;', 1555919931),
('2427969a06b20a3048b98af96ec93ed8', 50, '120.244.118.36', 'acid|N;uniacid|i:50;', 1555920260),
('2721f42de1f86a01517165624b20ae67', 50, '123.118.73.106', 'acid|N;uniacid|i:50;', 1555919742),
('279458c2ecaec1119a3780446085e920', 50, '115.183.33.34', 'acid|N;uniacid|i:50;', 1555919314),
('27a25bd5992a1236c3de6853aac40af0', 50, '223.104.3.13', 'acid|N;uniacid|i:50;', 1555920435),
('27dd7c1cd90e2d4421790f81173e4e1b', 50, '111.197.243.183', 'acid|N;uniacid|i:50;', 1555920100),
('281b0eb6a44ef33cfefabc8dcc1a8486', 50, '113.47.15.65', 'acid|N;uniacid|i:50;', 1555919430),
('2956492630f2772003016fba302b293d', 50, '223.104.178.88', 'acid|N;uniacid|i:50;', 1555919564),
('29baf804edb6a1f06ed5f3ca0794172c', 50, '114.246.1.85', 'acid|N;uniacid|i:50;', 1555921359),
('2bc2f449aa4008d511c47a1cafd43524', 3, '101.227.139.161', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"ZRQa\";i:1555919438;}dest_url|s:110:\"http%3A%2F%2Fwww.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26m%3Dszxh_children%26do%3Dmain%26actid%3D3\";', 1555923038),
('2ea35f0ac9e5a30a28ecaf38b40c7a32', 3, '117.12.242.132', 'acid|s:1:\"3\";uniacid|i:3;token|a:6:{s:4:\"vqzc\";i:1555919767;s:4:\"zC04\";i:1555919767;s:4:\"SmQg\";i:1555919768;s:4:\"YIQ1\";i:1555919768;s:4:\"WWyX\";i:1555919769;s:4:\"v0Tw\";i:1555919777;}dest_url|s:108:\"http%3A%2F%2Fwww.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dinfringement%26m%3Dszxh_activeplus\";oauth_openid|s:28:\"oJmJzwA6IWntjrRJYLMx-9mZVXBU\";oauth_acid|s:1:\"3\";openid|s:28:\"oJmJzwA6IWntjrRJYLMx-9mZVXBU\";uid|s:4:\"3435\";', 1555923378),
('2f8876d1c4c8f8245efd2b5910474e9a', 50, '223.72.55.152', 'acid|N;uniacid|i:50;', 1555920636),
('302030535be8c72a4789b4abae39cf10', 50, '223.104.3.129', 'acid|N;uniacid|i:50;', 1555922600),
('30394f2b0709bf446e7e68dd0a7c1a06', 50, '122.97.178.47', 'acid|N;uniacid|i:50;', 1555922993),
('32aa5af9b36dbc835b65d50fe9fa5c1f', 50, '223.104.3.239', 'acid|N;uniacid|i:50;', 1555920571),
('33d75335d9da51ac13bd6334266516f5', 50, '183.197.141.98', 'acid|N;uniacid|i:50;', 1555921618),
('33e4acc40dc65799621e92183711effa', 50, '223.20.246.92', 'acid|N;uniacid|i:50;', 1555920360),
('3561ee79483dac715fec899ff35ee8ed', 50, '223.72.66.180', 'acid|N;uniacid|i:50;', 1555921478),
('381abb7468a79d5712fa159714dec7c7', 50, '223.104.101.27', 'acid|N;uniacid|i:50;', 1555920073),
('38f406e5e18560ae30c4a61fe007c3ab', 50, '223.72.52.186', 'acid|N;uniacid|i:50;', 1555923411),
('3abc026c88cca7884ee7d81a3df918e2', 50, '223.104.101.155', 'acid|N;uniacid|i:50;', 1555919660),
('3bd1890629870475cd7d7a00b019780e', 50, '117.136.0.168', 'acid|N;uniacid|i:50;', 1555920437),
('3c00d82e862c829de93dd7eb3360a9b5', 50, '223.104.3.195', 'acid|N;uniacid|i:50;', 1555920012),
('3c47fc7f1e683fbcbe7a7e469cab3e5b', 50, '111.196.50.240', 'acid|N;uniacid|i:50;', 1555921554),
('3d180c7d36a14fe7d72df0364e01f94c', 50, '221.218.166.180', 'acid|N;uniacid|i:50;', 1555923337),
('3dc69125f88868bcdac9c78718c96ae3', 50, '106.38.159.194', 'acid|N;uniacid|i:50;', 1555922333),
('3e85f7d2e1ed3df82f5210592abcc92d', 50, '125.34.66.145', 'acid|N;uniacid|i:50;', 1555922977),
('3f7972c67e05b74f004882adc81d0ffe', 50, '111.192.11.124', 'acid|N;uniacid|i:50;', 1555923602),
('412b53b5b70122449c910ada6d9389dc', 50, '121.69.11.88', 'acid|N;uniacid|i:50;', 1555919327),
('419c19bc4a870de5c1243a4d3b57ff33', 50, '212.129.128.148', 'acid|N;uniacid|i:50;', 1555921381),
('42935d9eeb742612888543b894154949', 50, '114.241.67.209', 'acid|N;uniacid|i:50;', 1555922541),
('43724fa250b1e29dfe15c85536f1f1bd', 50, '36.112.10.116', 'acid|N;uniacid|i:50;', 1555923566),
('43b1e67cc1f4642350f94322bc3ba333', 50, '220.195.66.116', 'acid|N;uniacid|i:50;', 1555919766),
('443720c38480f9fc4864caf62a95846a', 50, '110.152.76.26', 'acid|N;uniacid|i:50;', 1555921156),
('446a0939fece604f2a8e7e081cdd8de5', 50, '223.72.79.74', 'acid|N;uniacid|i:50;', 1555921050),
('4489cb72872ae2edc9b4aa1d250fe8c5', 50, '120.244.45.86', 'acid|N;uniacid|i:50;', 1555920088),
('44afaad5feb5f0a7be92c46eb2b4a332', 50, '223.104.3.171', 'acid|N;uniacid|i:50;', 1555922671),
('454646323fe45b0b6667681260ca3a84', 50, '111.206.110.9', 'acid|N;uniacid|i:50;', 1555920217),
('45b876da0782b75537e6a4b9c23d1962', 50, '124.64.17.132', 'acid|N;uniacid|i:50;', 1555920313),
('4707cb4ca8ebd7f5f37154605e56e7f6', 50, '223.104.3.171', 'acid|N;uniacid|i:50;', 1555919525),
('471cccb8fc7019b7aab0b2ad50da6736', 50, '111.197.17.166', 'acid|N;uniacid|i:50;', 1555920328),
('4a2307530f6a311c0932824f86476ebe', 50, '111.196.50.240', 'acid|N;uniacid|i:50;', 1555921336),
('4a3e163b1357ca5ceaff4ce6ccf3bd87', 3, '61.151.178.165', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"wu88\";i:1555919637;}dest_url|s:135:\"http%3A%2F%2Fwww.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dinfringement%26m%3Dszxh_activeplus%26wxref%3Dmp.weixin.qq.com\";', 1555923237),
('4e5cfe7b6fb15813cf43ed09099a8f7b', 50, '180.78.184.46', 'acid|N;uniacid|i:50;', 1555920853),
('4f03605c27b56562bbdf7bc79b707adb', 50, '117.136.38.155', 'acid|N;uniacid|i:50;', 1555920858),
('502ecf7808ba7c66690cae11530332dc', 50, '112.224.65.70', 'acid|N;uniacid|i:50;', 1555923346),
('505447fce4526da2b00277b60549333e', 50, '124.64.17.192', 'acid|N;uniacid|i:50;', 1555923073),
('5234ca7cadc6ceb96756319dcd2c6959', 50, '111.197.23.147', 'acid|N;uniacid|i:50;', 1555920483),
('52657ed06ce7e7da323dea579c3468a3', 50, '106.121.138.6', 'acid|N;uniacid|i:50;', 1555922539),
('53435c1bc104c5f3146a3d17adf13f2e', 50, '42.122.138.2', 'acid|N;uniacid|i:50;', 1555922091),
('537903beab315c3dc58f95db412ecf41', 50, '111.202.248.172', 'acid|N;uniacid|i:50;', 1555921156),
('568a261d33dc06da7cd81b565013dcc5', 50, '114.249.218.69', 'acid|N;uniacid|i:50;', 1555922491),
('57de3129ca905a41a0a912bd5145c6dd', 50, '112.36.167.139', 'acid|N;uniacid|i:50;', 1555920398),
('5adbbcd37a2a336c1d7d5909d8503dc0', 50, '120.244.47.80', 'acid|N;uniacid|i:50;', 1555923608),
('5b2e4045d0094fcec2de42d8c4d89462', 50, '124.64.18.1', 'acid|N;uniacid|i:50;', 1555923561),
('5b78d47124deded90a2c28703b172e97', 50, '59.108.15.99', 'acid|N;uniacid|i:50;', 1555920618),
('5c6be44e54f4ab83b8493be03d226882', 50, '117.136.0.169', 'acid|N;uniacid|i:50;', 1555922452),
('5c9c3f130ff7c56a66c005fcc4b8e00c', 50, '114.241.66.71', 'acid|N;uniacid|i:50;', 1555922233),
('5cd8126faf8df1c4953260977b6d124a', 50, '118.198.245.64', 'acid|N;uniacid|i:50;', 1555919636),
('5d16f2ee9f354993a2078f612dcafda6', 50, '117.136.0.146', 'acid|N;uniacid|i:50;', 1555920220),
('5e4827edb43be17ec718d6e2826c62a5', 50, '223.104.3.139', 'acid|N;uniacid|i:50;', 1555922627),
('604337f2c2bb7b7b61da4b02a8357ec0', 50, '123.113.3.47', 'acid|N;uniacid|i:50;', 1555919420),
('6070307aed4605aab2277ccb13da7a7c', 50, '117.136.97.41', 'acid|N;uniacid|i:50;', 1555923457),
('60aa546c4566f778ed3dfc94cf516cd4', 50, '223.104.3.240', 'acid|N;uniacid|i:50;', 1555921472),
('613b1b5bf1ecdfa6485f9825132545f9', 50, '106.119.15.66', 'acid|N;uniacid|i:50;', 1555921075),
('65af47a4441b1a1fee283999f8c61265', 50, '123.118.73.106', 'acid|N;uniacid|i:50;', 1555919776),
('6695fc752cfcf94e144f07e1323a374e', 50, '114.244.251.80', 'acid|N;uniacid|i:50;', 1555920742),
('6797147837a38dae6a0f3587a0aee02f', 50, '115.171.63.16', 'acid|N;uniacid|i:50;', 1555920187),
('683156ed1184148dbf2e2c8beaba7331', 50, '223.104.3.206', 'acid|N;uniacid|i:50;', 1555920705),
('6887261052ff76a3c7a887406dc3e92a', 50, '59.109.152.87', 'acid|N;uniacid|i:50;', 1555919398),
('69ade8bd0dd719daf54e058e9b3df311', 50, '223.104.3.193', 'acid|N;uniacid|i:50;', 1555919974),
('6a12391a03c2c1d1f0fe0c0d0d94e350', 50, '123.117.157.0', 'acid|N;uniacid|i:50;', 1555921672),
('6b105901a6ddf03a518c070a42d3a974', 3, '61.151.178.236', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"BnQ2\";i:1555919416;}dest_url|s:108:\"http%3A%2F%2F1.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26m%3Dszxh_children%26do%3Dmain%26actid%3D3\";', 1555923016),
('6bf3f3a6c2a2e9a7d6ad5911c1cad771', 50, '223.104.3.153', 'acid|N;uniacid|i:50;', 1555919567),
('715943a54e60a29b5ff8bd2a7c9cd788', 50, '183.197.150.7', 'acid|N;uniacid|i:50;', 1555921951),
('718e361a699ca87bd1db512abb3ff356', 50, '223.104.3.207', 'acid|N;uniacid|i:50;', 1555923048),
('78471381e7be9bd4e2e3fdc82894c5e8', 50, '180.78.186.142', 'acid|N;uniacid|i:50;', 1555921925),
('7899b02c56a879ee29308d7368eb3efb', 50, '43.224.47.139', 'acid|N;uniacid|i:50;', 1555923388),
('7b1ce4ab00a9b70a451ab23d34adcd24', 50, '114.243.201.9', 'acid|N;uniacid|i:50;', 1555919787),
('7ce13276823a55425f75d55c2f434007', 50, '117.136.0.202', 'acid|N;uniacid|i:50;', 1555923220),
('7d5bbc5f17ff31e1abd7efe2d069c35e', 50, '111.199.189.251', 'acid|N;uniacid|i:50;', 1555920791),
('7da7e26869261e13fad5655ffd30f100', 50, '111.197.22.195', 'acid|N;uniacid|i:50;', 1555920279),
('7ef76ec7a4cc0bb156ffab1b31a30dff', 50, '114.249.134.30', 'acid|N;uniacid|i:50;', 1555919984),
('7f263895c95a24e533fb5de8af1a0b67', 50, '223.104.3.230', 'acid|N;uniacid|i:50;', 1555919980),
('7f40d70a034581f4a694b36178bffc52', 50, '117.136.38.61', 'acid|N;uniacid|i:50;', 1555919770),
('82c1a31e6307576cb3dc2e4985e8e0c4', 50, '124.204.231.207', 'acid|N;uniacid|i:50;', 1555920541),
('834a3dfc7e6dfd43c2c7bbb65b922e1e', 50, '124.64.19.8', 'acid|N;uniacid|i:50;', 1555923161),
('83ddcf89df9ec91cbec6781d4600d765', 50, '223.104.3.197', 'acid|N;uniacid|i:50;', 1555923669),
('84d6230b2d73fde16b0d22d81d870273', 50, '111.201.246.0', 'acid|N;uniacid|i:50;', 1555920088),
('8507b23826cc54dae79ab22e0cd7eba5', 50, '114.246.2.195', 'acid|N;uniacid|i:50;', 1555919834),
('85e86ba32aa177579121eeedb36824eb', 50, '220.195.66.30', 'acid|N;uniacid|i:50;', 1555922123),
('88c65ae8fb954eb47d6ef7877e6fc1eb', 50, '121.71.30.212', 'acid|N;uniacid|i:50;', 1555919557),
('89057c9c316689ac0b8118e57f108af4', 50, '106.118.173.99', 'acid|N;uniacid|i:50;', 1555919872),
('8b71764e688f9db413f45e8ba4c3b718', 50, '118.114.246.168', 'acid|N;uniacid|i:50;', 1555919951),
('8b7a7a1faddbc333c4ea1f851df7d2bf', 50, '223.104.3.194', 'acid|N;uniacid|i:50;', 1555923525),
('8cccab0587b19ffba74ee1d54ea963f3', 50, '223.104.3.197', 'acid|N;uniacid|i:50;', 1555923680),
('8d503412d12f4a3b26dcf864e47c6127', 50, '117.136.38.57', 'acid|N;uniacid|i:50;', 1555920114),
('8e45d31dbca46bcf78ebaca2dccb8037', 50, '221.216.44.165', 'acid|N;uniacid|i:50;', 1555920319),
('8e4d9645bbdb420ad4e82c2544992a99', 50, '223.104.3.151', 'acid|N;uniacid|i:50;', 1555920685),
('8fa7bf4a9d406b191a363c078e6fed47', 3, '61.129.6.251', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"diIn\";i:1555915805;}dest_url|s:155:\"http%3A%2F%2Fwww.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26m%3Dszxh_children%26do%3DMain%26et%3Dpay%26order_id%3D2019042214490519140%26act_id%3D4\";', 1555919405),
('8ff1a9bb25655368301dd431b038b7f4', 50, '101.242.124.154', 'acid|N;uniacid|i:50;', 1555922065),
('91093f1bef718abea43b56e3cece3e19', 50, '114.244.229.212', 'acid|N;uniacid|i:50;', 1555920440),
('91d1149e8f640d5309a2d9606ec38be6', 50, '223.104.3.2', 'acid|N;uniacid|i:50;', 1555920343),
('93d47576211efaafc09722712cca7c2e', 50, '223.104.3.199', 'acid|N;uniacid|i:50;', 1555919963),
('9473125bee1cc84a1bc429ce86e27788', 29, '183.61.51.62', 'acid|N;uniacid|i:29;token|a:1:{s:4:\"z88p\";i:1555916117;}', 1555919717),
('959670026326e16637fe6c94ca88dd81', 50, '111.199.188.62', 'acid|N;uniacid|i:50;', 1555922085),
('95eeadeece6b42b5dc075d575c5cd744', 50, '223.104.3.163', 'acid|N;uniacid|i:50;', 1555922780),
('96b38b024690d6a15218f30cbfa6fc5d', 50, '111.197.19.106', 'acid|N;uniacid|i:50;', 1555919295),
('96b3a9b3195791bf0c11b232c1a278d8', 50, '61.148.243.20', 'acid|N;uniacid|i:50;', 1555920466),
('97991ca595f24dea5ae379b42945f487', 50, '111.196.208.195', 'acid|N;uniacid|i:50;', 1555919757),
('9835ff6c17264c7b98765bbe20960b9e', 50, '114.242.248.69', 'acid|N;uniacid|i:50;', 1555921447),
('99aa428e740cdbf7ed5dcf24024136b7', 50, '223.104.3.131', 'acid|N;uniacid|i:50;', 1555922650),
('99de7fe12375165f945d1fdb52444594', 50, '117.136.38.129', 'acid|N;uniacid|i:50;', 1555919320),
('9a3a58dc15a52e947c70d4e593d1911c', 29, '61.151.178.163', 'acid|N;uniacid|i:29;', 1555923765),
('9a5da0bd637178f6697452ffadc72616', 50, '106.38.159.194', 'acid|N;uniacid|i:50;', 1555922342),
('9b1e7562be58aa3612766613f0bc2e6a', 50, '120.244.45.86', 'acid|N;uniacid|i:50;', 1555919921),
('9b4c4aadf746ec69a5de526edbbe8c76', 50, '221.223.198.46', 'acid|N;uniacid|i:50;', 1555919791),
('9bccc6c6d1384d9f149b214bc2e94699', 50, '221.218.192.16', 'acid|N;uniacid|i:50;', 1555919401),
('9d830ba0b57493462e2c373b820daddb', 50, '223.104.185.196', 'acid|N;uniacid|i:50;', 1555923048),
('9da17f7355d8806332befa746023923f', 50, '223.104.3.2', 'acid|N;uniacid|i:50;', 1555920231),
('9e5df6e16d2b0d51b3ec4f6f418ece31', 50, '117.136.0.160', 'acid|N;uniacid|i:50;', 1555921369),
('9f95c5cdd719a5547026abaf89493687', 50, '116.227.26.216', 'acid|N;uniacid|i:50;', 1555920557),
('a154fe121a63912fffa1ca45a988f4ba', 50, '223.104.3.207', 'acid|N;uniacid|i:50;', 1555922129),
('a16e974dcaa433c53fea54e303a47f84', 50, '223.104.3.155', 'acid|N;uniacid|i:50;', 1555921323),
('a1fd83095450ff191f8ee9c2315f7f2b', 50, '106.121.134.51', 'acid|N;uniacid|i:50;', 1555921312),
('a2475385f3be1de74ae242368c138f8d', 50, '117.136.38.52', 'acid|N;uniacid|i:50;', 1555920626),
('a3a66f4f8fe02a5e18d79b519b090826', 50, '111.198.243.141', 'acid|N;uniacid|i:50;', 1555923801),
('a465fc0282f25ce3c45dbf610427f2f0', 50, '111.203.246.225', 'acid|N;uniacid|i:50;', 1555921246),
('a4e3fefd7aaf606a6b2461cd4b1a1c5b', 50, '114.243.193.147', 'acid|N;uniacid|i:50;', 1555919872),
('a50bc40ddc77885b01b1261ec6f222dd', 50, '114.243.201.9', 'acid|N;uniacid|i:50;', 1555919805),
('a5772afb334a45f7faa91fa1f64a9296', 50, '124.204.243.156', 'acid|N;uniacid|i:50;', 1555922114),
('a5b604a0108881c77063e7d974b8b0af', 50, '223.104.3.148', 'acid|N;uniacid|i:50;', 1555922921),
('a624690c73bed5ab5eb42d190dbc1961', 3, '61.151.178.166', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"HMHN\";i:1555915945;}dest_url|s:155:\"http%3A%2F%2Fwww.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26m%3Dszxh_children%26do%3DMain%26et%3Dpay%26order_id%3D2019042214512484662%26act_id%3D4\";', 1555919545),
('a63a54c367ee1cbb320c6e64eb5822fb', 50, '60.26.95.88', 'acid|N;uniacid|i:50;', 1555919900),
('a68127378308348f4ea3556eaa92b8c2', 50, '27.190.251.203', 'acid|N;uniacid|i:50;', 1555922447),
('a6fea5afde26084629db44c1fc73afd2', 50, '124.64.18.102', 'acid|N;uniacid|i:50;', 1555920047),
('a8190b6b6eb19930a72d32b8baa3f6c5', 50, '223.104.175.70', 'acid|N;uniacid|i:50;', 1555923774),
('a852e12611751969150626d11228ff2c', 50, '106.38.132.86', 'acid|N;uniacid|i:50;', 1555921154),
('aaefa8270e334dd9bac9515c0b957001', 50, '115.27.217.211', 'acid|N;uniacid|i:50;', 1555920575),
('ac4d72295260b1281edf3730a1918dfe', 50, '183.197.120.49', 'acid|N;uniacid|i:50;', 1555919744),
('ac68b8cafaac0250515f86250af3a391', 50, '124.224.92.86', 'acid|N;uniacid|i:50;', 1555919573),
('ad18d288bef9876afebfee1939d21548', 2, '117.12.242.132', 'acid|N;uniacid|i:2;token|a:3:{s:4:\"rPRR\";i:1555915968;s:4:\"qnt3\";i:1555915969;s:4:\"R23h\";i:1555915971;}', 1555919571),
('ae1e5914fb830aaf617c097fd9b003c2', 50, '124.64.19.90', 'acid|N;uniacid|i:50;', 1555920606),
('ae6dbc991dc9a3af22a92ef00123a836', 50, '61.149.136.210', 'acid|N;uniacid|i:50;', 1555923146),
('aee720877e5018384eef3aacfa4705e0', 50, '223.104.3.51', 'acid|N;uniacid|i:50;', 1555920305),
('af1d4cc679640e60ce7e6891df5a08b6', 50, '117.136.79.220', 'acid|N;uniacid|i:50;', 1555922451),
('b09e6864290f9168355aa08796eb0b54', 50, '114.242.249.216', 'acid|N;uniacid|i:50;', 1555919618),
('b225879f560c3dbe7d36dc1255591976', 50, '114.242.250.79', 'acid|N;uniacid|i:50;', 1555920715),
('b2abc15e981c7458a5551e941f3938bb', 50, '220.195.67.188', 'acid|N;uniacid|i:50;', 1555921113),
('b360cb89d6dd463660492a31d1ee5709', 50, '114.249.171.60', 'acid|N;uniacid|i:50;', 1555922636),
('b549349ab53dbc1adcda082c27f2ce9e', 50, '223.104.3.178', 'acid|N;uniacid|i:50;', 1555921799),
('b5d86213a38c76c5465f99db1fe21572', 50, '219.237.72.34', 'acid|N;uniacid|i:50;', 1555922504),
('b5eefc6b81623609fc40c3fb32371018', 50, '124.127.106.203', 'acid|N;uniacid|i:50;', 1555923596),
('b73ef6bb633f1d8c4eb895bed8d461ac', 50, '114.242.250.171', 'acid|N;uniacid|i:50;', 1555920665),
('b794b174a9e4258a185aae7cef066180', 50, '124.64.19.232', 'acid|N;uniacid|i:50;', 1555919798),
('ba1d172e24609c20499dd9c6fc67e0e1', 50, '221.7.8.52', 'acid|N;uniacid|i:50;', 1555922099),
('ba58d8d9814e6ed66b008af8ec9f22a2', 50, '120.244.129.203', 'acid|N;uniacid|i:50;', 1555922632),
('bbda3e504372711c2554247d3b88b9fd', 50, '111.32.81.176', 'acid|N;uniacid|i:50;', 1555919561),
('bc435ebc7f1775ce42ecdacbf4284212', 50, '114.249.135.215', 'acid|N;uniacid|i:50;', 1555919806),
('bf868169af14e6ad0c43ab6135c249d2', 50, '222.130.38.199', 'acid|N;uniacid|i:50;', 1555920828),
('bf99fa071b0814d26dd46c27b1b35342', 50, '114.255.11.125', 'acid|N;uniacid|i:50;', 1555923462),
('c0f4530b7e98b1fe166e94a9fa175f9c', 50, '221.221.80.14', 'acid|N;uniacid|i:50;', 1555921270),
('c258bda854022f19b7ed445f119acc58', 50, '124.65.80.94', 'acid|N;uniacid|i:50;', 1555923066),
('c4b260ee2f2c476f24544dad4cc60a43', 50, '61.49.251.242', 'acid|N;uniacid|i:50;', 1555923205),
('c7c542f671b5ed9a03ff5ca3bf0d01b6', 50, '124.64.18.133', 'acid|N;uniacid|i:50;', 1555920646),
('c92d81fa56dbfd22ca0ee3fc11129a94', 50, '101.41.215.209', 'acid|N;uniacid|i:50;', 1555920511),
('c95dee326c12e7f18daa2d4a8841a1b1', 50, '124.200.154.22', 'acid|N;uniacid|i:50;', 1555920433),
('cc6ff8e987d35b6e47dfbf696d66d370', 3, '101.89.29.86', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"Afg8\";i:1555919910;}dest_url|s:148:\"http%3A%2F%2F1.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26m%3Dszxh_children%26do%3Dmain%26actid%3D4%26openid%3DoJmJzwDf-gv-sh7Y-70N5_F7eATg\";', 1555923510),
('cd1e24acc1a7bd10f8392c00ef7c54f3', 50, '124.204.243.156', 'acid|N;uniacid|i:50;', 1555922028),
('cdef8fe032c49fd05e62c080dd7df893', 3, '117.12.242.132', 'acid|i:3;uniacid|i:3;token|a:6:{s:4:\"OrYj\";i:1555919720;s:4:\"hFcG\";i:1555919803;s:4:\"QMbE\";i:1555919919;s:4:\"QzfQ\";i:1555919942;s:4:\"KTfR\";i:1555919954;s:4:\"Z1NN\";i:1555920011;}dest_url|s:110:\"http%3A%2F%2Fwww.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26m%3Dszxh_children%26do%3Dmain%26actid%3D4\";oauth_openid|s:28:\"oJmJzwDf-gv-sh7Y-70N5_F7eATg\";oauth_acid|s:1:\"3\";openid|s:28:\"oJmJzwDf-gv-sh7Y-70N5_F7eATg\";userinfo|s:720:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9KbUp6d0RmLWd2LXNoN1ktNzBONV9GN2VBVGciO3M6ODoibmlja25hbWUiO3M6OToi6bG85rC05oOFIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLmnJ3pmLMiO3M6ODoicHJvdmluY2UiO3M6Njoi5YyX5LqsIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL2dWelBlRm5telJtTTZIbVhQa25NWlpneld0a3lZSVFlaWMzV1J0MkxrUnVmZlhQaWJqdlZPWWdBYmprZEtsbUptUnFSQjdLN3NiUWNpY1laSGFpYTAySTR4Zy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9nVnpQZUZubXpSbU02SG1YUGtuTVpaZ3pXdGt5WUlRZWljM1dSdDJMa1J1ZmZYUGlianZWT1lnQWJqa2RLbG1KbVJxUkI3SzdzYlFjaWNZWkhhaWEwMkk0eGcvMTMyIjt9\";uid|s:4:\"3443\";__acid|i:3;__uniacid|i:3;', 1555923611),
('ce0e90f1a16c6d2ed711f20f90fb1c07', 50, '123.118.74.101', 'acid|N;uniacid|i:50;', 1555922073),
('ce7c074e1766f4e2e02fe79e131e232c', 29, '61.129.6.227', 'acid|N;uniacid|i:29;token|a:1:{s:4:\"rDVe\";i:1555916667;}', 1555920267),
('cef27765cfb43c3d5fe1264b9c5c8818', 50, '223.104.3.196', 'acid|N;uniacid|i:50;', 1555923597),
('cff655a30a1067c458f57b20156ff64f', 50, '111.197.20.3', 'acid|N;uniacid|i:50;', 1555922886),
('d0514339f4b615cc35e8ee97093c8293', 50, '119.176.14.67', 'acid|N;uniacid|i:50;', 1555923337),
('d093e8a5e7ba32ea8d47330083c7dfab', 50, '222.168.205.146', 'acid|N;uniacid|i:50;', 1555921450),
('d12d8d9d2350c729faf199ff46700fab', 50, '106.121.71.117', 'acid|N;uniacid|i:50;', 1555921107),
('d64c99e6bb80160be081aa67008ee9d8', 50, '223.104.3.201', 'acid|N;uniacid|i:50;', 1555923532),
('d702e45e23bc0bd5a04d6d390b70038a', 50, '223.104.3.30', 'acid|N;uniacid|i:50;', 1555923779),
('d705a26d8f59d7aaa14b978975613a6a', 50, '223.104.3.150', 'acid|N;uniacid|i:50;', 1555923327),
('d82fde28f3795a4a84895352bf2e22a4', 50, '223.104.3.243', 'acid|N;uniacid|i:50;', 1555920387),
('d89d61a94c8e791fbbaf6e85b190c6ad', 50, '123.118.73.101', 'acid|N;uniacid|i:50;', 1555923544),
('d8f72f50ab69387f5dbe86bd8e1389e5', 50, '120.244.44.131', 'acid|N;uniacid|i:50;', 1555923141),
('da060dbfc2d7e0cc9b02fba30d6369e5', 29, '61.151.178.163', 'acid|N;uniacid|i:29;token|a:1:{s:4:\"LnYI\";i:1555920162;}', 1555923762),
('daeb64633beab66802eb6847b8f91ecd', 50, '101.240.81.2', 'acid|N;uniacid|i:50;', 1555923422),
('db8ec5412a493aaa9256405bc0258525', 50, '114.240.103.212', 'acid|N;uniacid|i:50;', 1555920165),
('dbe6818e10105fdb3352c5af2f18b4d1', 50, '221.218.173.154', 'acid|N;uniacid|i:50;', 1555919650),
('dfaa543445cba2bb91e6148668a5276b', 50, '117.136.38.54', 'acid|N;uniacid|i:50;', 1555920170),
('e1c50d6d68d6bdf84ddaa4137e4a145a', 50, '114.87.224.204', 'acid|N;uniacid|i:50;', 1555922337),
('e21eee166f6c22d8de116c0e455894e3', 50, '106.39.42.160', 'acid|N;uniacid|i:50;', 1555920613),
('e327b1f59688154ad9d46bae93203c25', 50, '223.72.97.74', 'acid|N;uniacid|i:50;', 1555920523),
('e388fde94f4111ca66f95bdfba848192', 50, '59.109.158.176', 'acid|N;uniacid|i:50;', 1555921652),
('e5dc3267ee9d84ced75d4778dd6b1297', 50, '124.204.250.86', 'acid|N;uniacid|i:50;', 1555921764),
('e67786bb08f4b13f608f30fbf503f0e7', 50, '124.65.80.94', 'acid|N;uniacid|i:50;', 1555922776),
('e6d70ad3358c6daf9e9afcaccee5f4ae', 50, '113.200.205.211', 'acid|N;uniacid|i:50;', 1555922935),
('eadd9524d6e201484845d524b757624d', 3, '61.151.178.236', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"COwW\";i:1555919827;}dest_url|s:138:\"http%3A%2F%2Fwww.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dmain%26m%3Dszxh_activeplus%26pid%3D13%26wxref%3Dmp.weixin.qq.com\";', 1555923427),
('eae06469b954fbe68b0beca972525f78', 50, '106.38.159.194', 'acid|N;uniacid|i:50;', 1555922409),
('ebbb37ea6013c79eade251d4373f43d9', 50, '220.195.66.172', 'acid|N;uniacid|i:50;', 1555922546),
('ebfcaf91d8f2832f899bfc8db14b5c8e', 50, '117.136.38.55', 'acid|N;uniacid|i:50;', 1555923447),
('ec79d335f175d347dc41c74479c92793', 50, '106.41.33.216', 'acid|N;uniacid|i:50;', 1555920626),
('ed8ce34bd708d6617ec8fc7adf25f772', 50, '115.183.37.216', 'acid|N;uniacid|i:50;', 1555923356),
('ee60c69de5b9acc71e24b627a5364487', 50, '125.33.47.203', 'acid|N;uniacid|i:50;', 1555922089),
('eef6140b41498bbc8f5a4414acb3d840', 3, '39.96.64.12', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"vTx3\";i:1555919768;}', 1555923368),
('ef6d7792a0c7b4ecbc1c0200b2b67b00', 50, '1.202.187.110', 'acid|N;uniacid|i:50;', 1555920367),
('f239ccc71905ae13a7dd9274528961f0', 50, '223.104.3.153', 'acid|N;uniacid|i:50;', 1555919456),
('f2c4c2417fa9d4231c1983a2a01e2d3e', 50, '223.79.134.183', 'acid|N;uniacid|i:50;', 1555921699),
('f38a43c9c31ccb8f7173d57ff34dde8c', 29, '61.129.6.227', 'acid|N;uniacid|i:29;', 1555920273),
('f3a501609cb4f44c82a28ccb5c07f654', 50, '117.136.38.62', 'acid|N;uniacid|i:50;', 1555919833),
('f4027f96db54e9455456954fa05daf6e', 50, '114.249.132.231', 'acid|N;uniacid|i:50;', 1555920453),
('f57a5472f0e793a99beb3552109778bd', 50, '115.171.171.117', 'acid|N;uniacid|i:50;', 1555923444),
('f8d00ee8c0426ac45dd05f24622ffb3c', 50, '124.64.17.76', 'acid|N;uniacid|i:50;', 1555922769),
('f955fe64318886a95fcb4aafbf57340d', 50, '199.119.233.217', 'acid|N;uniacid|i:50;', 1555919781),
('f9bb83c86db6fc2e51a8b526caacb3e8', 50, '218.205.138.10', 'acid|N;uniacid|i:50;', 1555923524),
('f9f0b754394fcb79f45532bb30ab591e', 3, '101.89.29.86', 'acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"MXVB\";i:1555919851;}dest_url|s:148:\"http%3A%2F%2F1.onfinger.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26m%3Dszxh_children%26do%3Dmain%26actid%3D4%26openid%3DoJmJzwDf-gv-sh7Y-70N5_F7eATg\";', 1555923451),
('fa28a300201886cde66532a501c2f5cf', 50, '111.194.9.46', 'acid|N;uniacid|i:50;', 1555921317),
('fb500482699cee693cdd7b1b277681ed', 50, '61.148.226.106', 'acid|N;uniacid|i:50;', 1555922981),
('fba817311696074ce59cfefdd2d183c1', 50, '223.104.3.135', 'acid|N;uniacid|i:50;', 1555922470),
('fd5393b7d4b6d6b4c6f1f7c60ef0757e', 50, '106.121.70.222', 'acid|N;uniacid|i:50;', 1555922683),
('fd735e25e9c55be18ad9e115dd269b31', 50, '218.57.182.240', 'acid|N;uniacid|i:50;', 1555923345),
('fd82fccb3efbf989f278dbb519f1cefd', 50, '220.195.66.43', 'acid|N;uniacid|i:50;', 1555921483),
('feaafebb5cf761bbc62026ebd77437b3', 50, '117.136.0.180', 'acid|N;uniacid|i:50;', 1555919476);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_settings`
--

CREATE TABLE `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_settings`
--

INSERT INTO `ims_core_settings` (`key`, `value`) VALUES
('account_ticket', 's:95:\"ticket@@@sXD33PIzkG2ANDqhmTIIF64bw0LjlwWKuFmLvsMIBK4YFmEBv5d7AljRVbSts8dExzPqXEDawBmfVpVF5J5_-A\";'),
('authmode', 'i:1;'),
('basic', 'a:1:{s:8:\"template\";s:3:\"2.0\";}'),
('close', 'a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}'),
('cloudip', 'a:0:{}'),
('copyright', 'a:11:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";s:3:\"icp\";s:22:\"津ICP备16004431号-1\";s:13:\"mobile_status\";N;s:10:\"login_type\";N;s:10:\"log_status\";i:1;s:14:\"develop_status\";i:1;s:4:\"bind\";N;s:12:\"welcome_link\";i:6;s:6:\"slides\";a:0:{}s:8:\"baidumap\";a:2:{s:3:\"lng\";N;s:3:\"lat\";N;}}'),
('module_ban', 'a:0:{}'),
('module_receive_ban', 'a:5:{s:8:\"szxh_cav\";s:8:\"szxh_cav\";s:15:\"szxh_activeplus\";s:15:\"szxh_activeplus\";s:10:\"szxh_codes\";s:10:\"szxh_codes\";s:11:\"szxh_alliad\";s:11:\"szxh_alliad\";s:13:\"szxh_children\";s:13:\"szxh_children\";}'),
('module_upgrade', 'a:0:{}'),
('platform', 'a:5:{s:5:\"token\";s:32:\"A5N88ZL5ITSI8N5ii1m8LM5C385WNMW3\";s:14:\"encodingaeskey\";s:43:\"GluuAWiIlR0wPu3jITNZlj0z0uTHA20t88aR8tarlIU\";s:5:\"appid\";s:18:\"wx333c76c6660807a7\";s:9:\"appsecret\";s:32:\"02a001e37ea4f1d2e8d4e9d64045f985\";s:9:\"authstate\";i:1;}'),
('register', 'a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}'),
('site', 'a:6:{s:3:\"key\";i:144845;s:5:\"token\";s:32:\"c85989c54743fc5c1d003d79c6187bef\";s:3:\"url\";s:20:\"http://1.onfinger.cn\";s:7:\"version\";s:5:\"2.0.1\";s:6:\"family\";s:1:\"v\";s:4:\"type\";s:8:\"register\";}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_location`
--

CREATE TABLE `ims_coupon_location` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) UNSIGNED NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cover_reply`
--

CREATE TABLE `ims_cover_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_cover_reply`
--

INSERT INTO `ims_cover_reply` (`id`, `uniacid`, `multiid`, `rid`, `module`, `do`, `title`, `description`, `thumb`, `url`) VALUES
(1, 1, 0, 7, 'mc', '', '进入个人中心', '', '', './index.php?c=mc&a=home&i=1'),
(2, 1, 1, 8, 'site', '', '进入首页', '', '', './index.php?c=home&i=1&t=1');

-- --------------------------------------------------------

--
-- 表的结构 `ims_custom_reply`
--

CREATE TABLE `ims_custom_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_images_reply`
--

CREATE TABLE `ims_images_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_job`
--

CREATE TABLE `ims_job` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_cash_record`
--

CREATE TABLE `ims_mc_cash_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `clerk_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `clerk_type` tinyint(3) UNSIGNED NOT NULL,
  `fee` decimal(10,2) UNSIGNED NOT NULL,
  `final_fee` decimal(10,2) UNSIGNED NOT NULL,
  `credit1` int(10) UNSIGNED NOT NULL,
  `credit1_fee` decimal(10,2) UNSIGNED NOT NULL,
  `credit2` decimal(10,2) UNSIGNED NOT NULL,
  `cash` decimal(10,2) UNSIGNED NOT NULL,
  `return_cash` decimal(10,2) UNSIGNED NOT NULL,
  `final_cash` decimal(10,2) UNSIGNED NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `trade_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_chats_record`
--

CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `flag` tinyint(3) UNSIGNED NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_recharge`
--

CREATE TABLE `ims_mc_credits_recharge` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `backtype` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_record`
--

CREATE TABLE `ims_mc_credits_record` (
  `id` int(11) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) UNSIGNED NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `clerk_type` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `remark` varchar(200) NOT NULL,
  `real_uniacid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_groups`
--

CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `groups` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_tag_mapping`
--

CREATE TABLE `ims_mc_fans_tag_mapping` (
  `id` int(11) UNSIGNED NOT NULL,
  `fanid` int(11) UNSIGNED NOT NULL,
  `tagid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_mc_fans_tag_mapping`
--

INSERT INTO `ims_mc_fans_tag_mapping` (`id`, `fanid`, `tagid`) VALUES
(249, 115, '105'),
(248, 167, '105'),
(247, 623, '105'),
(246, 624, '105'),
(245, 625, '105'),
(244, 626, '105'),
(243, 627, '105'),
(242, 628, '105'),
(241, 629, '105'),
(240, 630, '105'),
(239, 631, '105'),
(237, 633, '105'),
(236, 634, '105'),
(235, 635, '105'),
(234, 636, '105'),
(233, 637, '105'),
(232, 638, '105'),
(231, 639, '105'),
(230, 640, '105'),
(229, 641, '105'),
(228, 642, '105'),
(227, 643, '105'),
(226, 644, '105'),
(225, 645, '105'),
(224, 646, '105'),
(223, 647, '105'),
(222, 648, '105'),
(221, 649, '105'),
(220, 650, '105'),
(219, 651, '105'),
(218, 652, '105'),
(217, 653, '105'),
(216, 654, '105'),
(215, 655, '105'),
(214, 656, '105'),
(213, 658, '105'),
(212, 659, '105'),
(211, 660, '105'),
(210, 661, '105'),
(209, 662, '105'),
(208, 663, '105'),
(207, 664, '105'),
(206, 665, '105'),
(205, 666, '105'),
(204, 667, '105'),
(203, 668, '105'),
(202, 669, '105'),
(201, 670, '105'),
(200, 671, '105'),
(199, 672, '105'),
(198, 673, '105'),
(197, 675, '105'),
(196, 676, '105'),
(195, 677, '105'),
(194, 678, '105'),
(193, 679, '105'),
(192, 680, '105'),
(191, 681, '105'),
(190, 682, '105'),
(189, 683, '105'),
(188, 684, '105'),
(187, 685, '105'),
(186, 686, '105'),
(185, 687, '105'),
(184, 688, '105'),
(183, 689, '105'),
(182, 690, '105'),
(181, 691, '105'),
(180, 692, '105'),
(179, 694, '105'),
(178, 695, '105'),
(177, 696, '105'),
(176, 697, '105'),
(175, 698, '105'),
(174, 699, '105'),
(173, 700, '105'),
(172, 701, '105'),
(171, 702, '105'),
(170, 703, '105'),
(169, 704, '105'),
(168, 705, '105'),
(167, 706, '105'),
(166, 707, '105'),
(165, 708, '105'),
(164, 709, '105'),
(163, 710, '105'),
(162, 711, '105'),
(161, 712, '105'),
(160, 713, '105'),
(158, 715, '105'),
(157, 716, '105'),
(156, 717, '105'),
(155, 718, '105'),
(153, 720, '105'),
(152, 721, '105'),
(151, 722, '105'),
(150, 723, '105'),
(149, 724, '105'),
(148, 725, '105'),
(147, 726, '105'),
(146, 727, '105'),
(145, 728, '105'),
(144, 729, '105'),
(143, 730, '105'),
(142, 731, '105'),
(141, 732, '105'),
(140, 733, '105'),
(139, 734, '105'),
(138, 735, '105'),
(137, 736, '105'),
(136, 737, '105'),
(135, 738, '105'),
(134, 739, '105'),
(133, 740, '105'),
(132, 741, '105'),
(131, 742, '105'),
(130, 743, '105'),
(129, 744, '105'),
(128, 745, '105'),
(127, 746, '105'),
(126, 747, '105'),
(125, 748, '105'),
(124, 749, '105'),
(123, 750, '105'),
(121, 752, '105'),
(120, 753, '105'),
(119, 754, '105'),
(118, 755, '105'),
(117, 756, '105'),
(116, 757, '105'),
(115, 759, '105'),
(114, 760, '105'),
(113, 761, '105'),
(112, 762, '105'),
(111, 763, '105'),
(110, 764, '105'),
(109, 765, '105'),
(108, 766, '105'),
(107, 768, '105'),
(106, 769, '105'),
(105, 770, '105'),
(104, 771, '105'),
(103, 772, '105'),
(101, 774, '105'),
(100, 775, '105'),
(99, 776, '105'),
(98, 777, '105'),
(97, 778, '105'),
(96, 779, '105'),
(95, 780, '105'),
(94, 781, '105'),
(93, 782, '105'),
(92, 783, '105'),
(91, 784, '105'),
(90, 785, '105'),
(89, 786, '105'),
(88, 787, '105'),
(87, 788, '105'),
(86, 789, '105'),
(85, 790, '105'),
(84, 791, '105'),
(83, 792, '105'),
(82, 793, '105'),
(81, 794, '105'),
(80, 795, '105'),
(79, 796, '105'),
(78, 797, '105'),
(77, 798, '105'),
(76, 799, '105'),
(75, 800, '105'),
(74, 801, '105'),
(73, 802, '105'),
(72, 803, '105'),
(71, 804, '105'),
(70, 805, '105'),
(69, 806, '105'),
(68, 807, '105'),
(67, 808, '105'),
(66, 809, '105'),
(65, 810, '105'),
(64, 811, '105'),
(63, 812, '105'),
(62, 813, '105'),
(61, 814, '105'),
(60, 815, '105'),
(59, 816, '105'),
(58, 817, '105'),
(57, 818, '105'),
(56, 819, '105'),
(55, 820, '105'),
(54, 821, '105'),
(53, 822, '105'),
(52, 823, '105'),
(51, 824, '105'),
(50, 825, '105'),
(49, 826, '105'),
(48, 827, '105'),
(47, 828, '105'),
(46, 829, '105'),
(45, 830, '105'),
(44, 831, '105'),
(43, 832, '105'),
(42, 833, '105'),
(41, 834, '105'),
(40, 835, '105'),
(39, 836, '105'),
(38, 837, '105'),
(37, 838, '105'),
(36, 839, '105'),
(34, 841, '105'),
(33, 842, '105'),
(32, 843, '105'),
(31, 844, '105'),
(30, 845, '105'),
(29, 846, '105'),
(28, 847, '105'),
(26, 849, '105'),
(25, 850, '105'),
(24, 851, '105'),
(23, 852, '105'),
(22, 853, '105'),
(19, 856, '105'),
(18, 857, '105'),
(17, 858, '105'),
(16, 859, '105'),
(15, 860, '105'),
(14, 861, '105'),
(13, 862, '105'),
(12, 863, '105'),
(11, 864, '105'),
(10, 865, '105'),
(9, 866, '105'),
(8, 867, '105'),
(7, 868, '105'),
(6, 869, '105'),
(4, 871, '105'),
(3, 872, '105'),
(2, 873, '105'),
(1, 874, '105');

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_groups`
--

CREATE TABLE `ims_mc_groups` (
  `groupid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) UNSIGNED NOT NULL,
  `isdefault` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_mc_groups`
--

INSERT INTO `ims_mc_groups` (`groupid`, `uniacid`, `title`, `credit`, `isdefault`) VALUES
(1, 1, '默认会员组', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_handsel`
--

CREATE TABLE `ims_mc_handsel` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) UNSIGNED NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_fans`
--

CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(60) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) UNSIGNED NOT NULL,
  `followtime` int(10) UNSIGNED NOT NULL,
  `unfollowtime` int(10) UNSIGNED NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) UNSIGNED DEFAULT NULL,
  `unionid` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_ucenter`
--

CREATE TABLE `ims_mc_mapping_ucenter` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `centeruid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mass_record`
--

CREATE TABLE `ims_mc_mass_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) UNSIGNED NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) UNSIGNED NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `cron_id` int(10) UNSIGNED NOT NULL,
  `sendtime` int(10) UNSIGNED NOT NULL,
  `finalsendtime` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `msg_id` varchar(50) NOT NULL,
  `msg_data_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_members`
--

CREATE TABLE `ims_mc_members` (
  `uid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `mobile` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) UNSIGNED NOT NULL,
  `credit2` decimal(10,2) UNSIGNED NOT NULL,
  `credit3` decimal(10,2) UNSIGNED NOT NULL,
  `credit4` decimal(10,2) UNSIGNED NOT NULL,
  `credit5` decimal(10,2) UNSIGNED NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) UNSIGNED NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) UNSIGNED NOT NULL,
  `birthmonth` tinyint(3) UNSIGNED NOT NULL,
  `birthday` tinyint(3) UNSIGNED NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `pay_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_address`
--

CREATE TABLE `ims_mc_member_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(50) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_fields`
--

CREATE TABLE `ims_mc_member_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_property`
--

CREATE TABLE `ims_mc_member_property` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(11) NOT NULL,
  `property` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_oauth_fans`
--

CREATE TABLE `ims_mc_oauth_fans` (
  `id` int(10) UNSIGNED NOT NULL,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_menu_event`
--

CREATE TABLE `ims_menu_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_message_notice_log`
--

CREATE TABLE `ims_message_notice_log` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_read` tinyint(3) NOT NULL,
  `uid` int(11) NOT NULL,
  `sign` varchar(22) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_message_notice_log`
--

INSERT INTO `ims_message_notice_log` (`id`, `message`, `is_read`, `uid`, `sign`, `type`, `status`, `create_time`, `end_time`, `url`) VALUES
(41, '我们鼓励开发者发布分佣型应用，发展分享经济，让微擎生态圈更加繁荣稳定', 2, 0, '180710', 11, NULL, 1493103126, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=23611'),
(42, '微擎云服务更新提速公告，更新出错的用户请看这里【2017年5月11日】', 2, 0, '168132', 11, NULL, 1494440044, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=23891'),
(43, '微擎0.8,1.0系统维护说明', 2, 0, '168166', 11, NULL, 1494493155, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=23909'),
(44, '2017微擎团队端午节放假通知', 2, 0, '168602', 11, NULL, 1495697604, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=24100'),
(45, '关于打了阿里云的补丁造成微擎系统不能更新的解释说明', 2, 0, '169098', 11, NULL, 1497353034, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=24386'),
(46, '微擎1.4.1更新（修复店员工作台问题）', 2, 0, '169140', 11, NULL, 1497431213, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=24403'),
(47, '微擎分销商入驻计划（第二批招商开始）', 2, 0, '170046', 11, NULL, 1499939625, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=24851'),
(48, '微擎1.5.3更新（增加副创始人权限，公众号流量统计，上传改版等）', 2, 0, '170747', 10, NULL, 1502261279, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25185'),
(49, '微擎1.5.4更新（添加帮助系统）', 2, 0, '170970', 10, NULL, 1503026731, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25328'),
(50, '微擎用户以及开发者请注意，近期会有两项新调整', 2, 0, '171299', 11, NULL, 1504165132, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25728'),
(51, '调查一下还有多少站点没有开启https', 2, 0, '171322', 11, NULL, 1504178646, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25780'),
(52, '免费配置https服务活动进行中', 2, 0, '171387', 11, NULL, 1504231683, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25786'),
(53, '神器！微擎乾坤盾上线，能有效应对各类DDOS攻击、机器恶意刷票', 2, 0, '171474', 11, NULL, 1504596774, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25835'),
(54, '通知！为提高服务质量，微擎客服体系进一步规范，微擎用户必看！', 2, 0, '171515', 11, NULL, 1504677690, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25854'),
(55, '微擎1.5.5更新（商城功能+重大优化）', 2, 0, '171559', 10, NULL, 1504767738, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25872'),
(56, '更新至微擎1.5.5打开空白的解决方案【2017年9月7日】', 2, 0, '171585', 11, NULL, 1504789521, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25881'),
(57, '微擎1.5.6更新（小程序，公众号个数，应用权限组购买+公众号访问量限制和购买）', 2, 0, '171745', 10, NULL, 1505295757, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=25986'),
(58, '微擎1.5.7更新（小程序可以直接上传微信，商城价格可以设置年月日，增加微信支付等）', 2, 0, '171878', 10, NULL, 1505703087, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=26038'),
(59, '微擎1.5.9更新（增加工单系统）', 2, 0, '172615', 10, NULL, 1508393659, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=26366'),
(60, '微擎1.6.1更新', 2, 0, '172904', 10, NULL, 1509417959, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=26496'),
(61, '微擎1.6.2更新', 2, 0, '173088', 10, NULL, 1510041312, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=26576'),
(62, '微擎1.6.3更新（公众号可以进行域名绑定，支持微信，QQ登录）', 2, 0, '173282', 10, NULL, 1510717425, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=26650'),
(63, '微擎1.6.4更新', 2, 0, '173656', 10, NULL, 1512024100, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=26793'),
(64, '微擎1.6.5更新（公众号应用直接打包成小程序，增加PC应用，后台新皮肤）', 2, 0, '174246', 10, NULL, 1514185647, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=26964'),
(65, '微擎1.6.6更新（可以自定义帮助系统）', 2, 0, '174552', 10, NULL, 1515119714, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=27018'),
(66, '微擎1.6.7更新（公众号应用打包成小程序可以支付了）', 2, 0, '174709', 10, NULL, 1515650324, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=27088'),
(67, '微擎1.6.9更新（小程序公众号PC可数据同步）', 2, 0, '175144', 10, NULL, 1517208850, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=28833'),
(68, '微擎小二投诉专员上线啦！', 2, 0, '175166', 11, NULL, 1517215198, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=28836'),
(69, '微擎1.7.0更新（非授权域名可以接收短信）', 2, 0, '175275', 10, NULL, 1517554773, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=28880'),
(70, '微擎团队2018年春节放假通知', 2, 0, '175296', 11, NULL, 1517558795, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=28882'),
(71, '微擎2017年优秀开发者名单公布', 2, 0, '175453', 11, NULL, 1518075815, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=28927'),
(72, '微擎云服务将推出用户信用机制，存在恶意行为的用户将无法充值、购买', 2, 0, '176084', 11, NULL, 1520409032, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=29037'),
(73, '微擎1.7.2更新（20多处新功能及优化）', 2, 0, '176424', 10, NULL, 1521614335, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=29284'),
(74, '年费增值服务用户和大客户看一下', 2, 0, '177090', 11, NULL, 1524038301, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=30227'),
(75, '微擎1.7.3更新(入口优化)', 2, 0, '177284', 10, NULL, 1524709253, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=30302'),
(76, '微擎小程序开发者大赛开始啦！', 2, 0, '177496', 11, NULL, 1525398131, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=30401'),
(77, '微擎1.7.4更新(熊掌号)', 2, 0, '178451', 10, NULL, 1528869548, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=31328'),
(78, '微擎1.7.7更新(PC可域名绑定伪静态，小程序数据互通等)', 2, 0, '179299', 10, NULL, 1531895407, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=31589'),
(79, '微擎1.7.9更新(熊掌号全面完善，商城可根据不同用户设置价格) ', 2, 0, '179667', 10, NULL, 1533178273, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=31696'),
(80, '【太原微擎科技】招聘前端开发工程师（VUE），6-10K', 2, 0, '180426', 11, NULL, 1535621418, 0, 'http://bbs.we7.cc/forum.php?mod=viewthread&tid=32436'),
(81, 'ceshi 2018-11-02 11:11:24注册成功--admin', 2, 2, '2', 4, 2, 1541128284, 0, ''),
(82, '刘美佳 2018-11-22 14:23:10注册成功--admin', 2, 3, '3', 4, 2, 1542867790, 0, ''),
(83, '尹月1 2018-11-22 14:50:02注册成功--admin', 2, 4, '4', 4, 2, 1542869402, 0, ''),
(84, '红包拓客 2018-11-22 15:03:24注册成功--admin', 2, 5, '5', 4, 2, 1542870204, 0, ''),
(85, '红包拼团 2018-11-22 15:07:14注册成功--admin', 2, 6, '6', 4, 2, 1542870434, 0, ''),
(86, '活码工具 2018-11-22 15:09:13注册成功--admin', 2, 7, '7', 4, 2, 1542870553, 0, ''),
(87, '王大发 2018-12-05 11:16:22注册成功--admin', 2, 8, '8', 4, 2, 1543979782, 0, ''),
(88, '李先生 2018-12-19 13:44:47注册成功--system', 2, 9, '9', 4, 2, 1545198287, 0, ''),
(89, '异业联盟 2018-12-28 10:23:26注册成功--admin', 2, 10, '10', 4, 2, 1545963806, 0, ''),
(90, '12345678 2019-01-07 12:07:54注册成功--system', 2, 11, '11', 4, 2, 1546834074, 0, ''),
(91, 'lczlkj 2019-01-12 11:47:17注册成功--system', 2, 12, '12', 4, 2, 1547264837, 0, ''),
(92, '18193600915 2019-01-23 20:55:43注册成功--system', 2, 13, '13', 4, 2, 1548248143, 0, ''),
(93, '轻便管理 2019-02-18 16:04:39注册成功--system', 2, 14, '14', 4, 2, 1550477079, 0, ''),
(94, 'SXLYBKJ 2019-03-01 09:59:42注册成功--system', 2, 15, '15', 4, 2, 1551405582, 0, ''),
(95, '王德发 2019-03-01 19:12:18注册成功--', 2, 16, '16', 4, 2, 1551438738, 0, ''),
(96, '王传奇 2019-03-01 19:37:13注册成功--', 2, 17, '17', 4, 2, 1551440232, 0, ''),
(97, '小明 2019-03-04 17:32:04注册成功--admin', 2, 18, '18', 4, 2, 1551691924, 0, ''),
(98, '拼团拼多多 2019-04-04 15:44:12注册成功--admin', 1, 1, '19', 4, 2, 1554363851, 0, ''),
(99, '13833182222 2019-04-09 15:05:53注册成功--system', 1, 1, '20', 4, 2, 1554793553, 0, ''),
(100, 'ceshi1234 2019-04-16 21:59:47注册成功--system', 1, 1, '21', 4, 2, 1555423187, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_mobilenumber`
--

CREATE TABLE `ims_mobilenumber` (
  `id` int(11) NOT NULL,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `dateline` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules`
--

CREATE TABLE `ims_modules` (
  `mid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) UNSIGNED NOT NULL,
  `target` int(10) UNSIGNED NOT NULL,
  `iscard` tinyint(3) UNSIGNED NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL,
  `app_support` tinyint(1) NOT NULL,
  `welcome_support` int(2) NOT NULL,
  `oauth_type` tinyint(1) NOT NULL,
  `webapp_support` tinyint(1) NOT NULL,
  `phoneapp_support` tinyint(1) NOT NULL,
  `account_support` tinyint(1) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules`
--

INSERT INTO `ims_modules` (`mid`, `name`, `type`, `title`, `version`, `ability`, `description`, `author`, `url`, `settings`, `subscribes`, `handles`, `isrulefields`, `issystem`, `target`, `iscard`, `permissions`, `title_initial`, `wxapp_support`, `app_support`, `welcome_support`, `oauth_type`, `webapp_support`, `phoneapp_support`, `account_support`, `xzapp_support`, `aliapp_support`, `logo`, `baiduapp_support`, `toutiaoapp_support`) VALUES
(1, 'basic', 'system', '基本文字回复', '1.0', '和您进行简单对话', '一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(2, 'news', 'system', '基本混合图文回复', '1.0', '为你提供生动的图文资讯', '一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(3, 'music', 'system', '基本音乐回复', '1.0', '提供语音、音乐等音频类回复', '在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(4, 'userapi', 'system', '自定义接口回复', '1.1', '更方便的第三方接口设置', '自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(5, 'recharge', 'system', '会员中心充值模块', '1.0', '提供会员充值功能', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(6, 'custom', 'system', '多客服转接', '1.0.0', '用来接入腾讯的多客服系统', '', 'WeEngine Team', 'http://bbs.we7.cc', 0, 'a:0:{}', 'a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(7, 'images', 'system', '基本图片回复', '1.0', '提供图片回复', '在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(8, 'video', 'system', '基本视频回复', '1.0', '提供图片回复', '在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(9, 'voice', 'system', '基本语音回复', '1.0', '提供语音回复', '在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(10, 'chats', 'system', '发送客服消息', '1.0', '公众号可以在粉丝最后发送消息的48小时内无限制发送消息', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(11, 'wxcard', 'system', '微信卡券回复', '1.0', '微信卡券回复', '微信卡券回复', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 0, 0, 0, 0, 2, 0, 0, '', 0, 0),
(12, 'store', 'business', '站内商城', '1.0', '站内商城', '站内商城', 'we7', '', 0, '', '', 0, 1, 0, 0, '', 'Z', 1, 0, 1, 0, 1, 1, 0, 2, 0, '', 0, 0),
(13, 'w7_scaffold', 'activity', '【开发】微擎模块', '2.3.2', '【开发】微擎模块', '模块框架', 'iexn', '', 0, 'a:0:{}', 'a:0:{}', 0, 0, 0, 0, 'N;', '', 1, 0, 1, 1, 1, 1, 2, 1, 1, 'addons/w7_scaffold/icon.jpg', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_bindings`
--

CREATE TABLE `ims_modules_bindings` (
  `eid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `entry` varchar(30) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) UNSIGNED NOT NULL,
  `multilevel` tinyint(1) NOT NULL,
  `parent` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules_bindings`
--

INSERT INTO `ims_modules_bindings` (`eid`, `module`, `entry`, `call`, `title`, `do`, `state`, `direct`, `url`, `icon`, `displayorder`, `multilevel`, `parent`) VALUES
(1, 'w7_scaffold', 'menu', '', '菜单1', 'active', 'et=1', 0, '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_cloud`
--

CREATE TABLE `ims_modules_cloud` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `install_status` tinyint(4) NOT NULL,
  `account_support` tinyint(4) NOT NULL,
  `wxapp_support` tinyint(4) NOT NULL,
  `webapp_support` tinyint(4) NOT NULL,
  `phoneapp_support` tinyint(4) NOT NULL,
  `welcome_support` tinyint(4) NOT NULL,
  `main_module_name` varchar(50) NOT NULL,
  `main_module_logo` varchar(100) NOT NULL,
  `has_new_version` tinyint(1) NOT NULL,
  `has_new_branch` tinyint(1) NOT NULL,
  `is_ban` tinyint(4) NOT NULL,
  `lastupdatetime` int(11) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL,
  `buytime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_ignore`
--

CREATE TABLE `ims_modules_ignore` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_plugin`
--

CREATE TABLE `ims_modules_plugin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `main_module` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_plugin_rank`
--

CREATE TABLE `ims_modules_plugin_rank` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `rank` int(10) NOT NULL,
  `plugin_name` varchar(200) NOT NULL,
  `main_module_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_rank`
--

CREATE TABLE `ims_modules_rank` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `uid` int(10) NOT NULL,
  `rank` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules_rank`
--

INSERT INTO `ims_modules_rank` (`id`, `module_name`, `uid`, `rank`, `uniacid`) VALUES
(1, 'w7_scaffold', 0, 0, 1),
(2, 'w7_scaffold', 0, 0, 1),
(3, 'w7_scaffold', 0, 0, 1),
(4, 'w7_scaffold', 0, 0, 1),
(5, 'w7_scaffold', 0, 0, 1),
(6, 'w7_scaffold', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_recycle`
--

CREATE TABLE `ims_modules_recycle` (
  `id` int(10) NOT NULL,
  `modulename` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `account_support` tinyint(1) NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL,
  `welcome_support` tinyint(1) NOT NULL,
  `webapp_support` tinyint(1) NOT NULL,
  `phoneapp_support` tinyint(1) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules_recycle`
--

INSERT INTO `ims_modules_recycle` (`id`, `modulename`, `name`, `type`, `account_support`, `wxapp_support`, `welcome_support`, `webapp_support`, `phoneapp_support`, `xzapp_support`, `aliapp_support`, `baiduapp_support`, `toutiaoapp_support`) VALUES
(36, '', 'nmyx_activeexpirty', 2, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(52, '', '11szxh_codes', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(58, '', 'szxh_activeplus1217', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(70, '', 'szxh_alliad0125', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(71, '', 'szxh_alliad__', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_music_reply`
--

CREATE TABLE `ims_music_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_news_reply`
--

CREATE TABLE `ims_news_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `media_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_news_reply`
--

INSERT INTO `ims_news_reply` (`id`, `rid`, `parent_id`, `title`, `author`, `description`, `thumb`, `content`, `url`, `displayorder`, `incontent`, `createtime`, `media_id`) VALUES
(4, 9, 0, '121', '', '', 'http://www.onfinger.cn/web/index.php?c=utility&a=wxcode&do=image&attach=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FWQ4b4ofOaoQIUmxQDInatbWoHjkaWSqcjV9UJNhAOguutp3OuDntOAl0OUL9oyFiaeNMBXiaib7yzPPGGa0ibldIyw%2F0%3Fwx_fmt%3Djpeg', '', 'http://mp.weixin.qq.com/s?__biz=MzI5MDIxODE1OQ==&mid=100000051&idx=1&sn=a457b037ea3cd13062df69092e4b5619&chksm=6c2208f35b5581e5c1043c82c736dab17f5ddd90204dade82eec095751f520ef593624410aca#rd', 0, 0, 1542869053, 'nZ91NdTbpjpAhfD_a1aVIrKdCCDyGrDsqeBTJHdMF3g'),
(5, 9, 4, '1111', '', '', 'http://www.onfinger.cn/web/index.php?c=utility&a=wxcode&do=image&attach=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FWQ4b4ofOaoQIUmxQDInatbWoHjkaWSqcgYXlaDCibCTqD8JtbxBpUPxXOxlLolNialiaB0siaqZOs9IicB9CUTP0c8A%2F0%3Fwx_fmt%3Djpeg', '', 'http://mp.weixin.qq.com/s?__biz=MzI5MDIxODE1OQ==&mid=100000051&idx=2&sn=e5703f5174d73df0d05737abe2235518&chksm=6c2208f35b5581e5103a88657864d577d271ec88830fe1f99335d381e74528336b4edcd91429#rd', 1, 0, 1542869053, 'nZ91NdTbpjpAhfD_a1aVIrKdCCDyGrDsqeBTJHdMF3g'),
(6, 9, 4, '231', '', '', 'http://www.onfinger.cn/web/index.php?c=utility&a=wxcode&do=image&attach=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FWQ4b4ofOaoQIUmxQDInatbWoHjkaWSqcgYXlaDCibCTqD8JtbxBpUPxXOxlLolNialiaB0siaqZOs9IicB9CUTP0c8A%2F0%3Fwx_fmt%3Djpeg', '', 'http://mp.weixin.qq.com/s?__biz=MzI5MDIxODE1OQ==&mid=100000051&idx=3&sn=c4bea42a94b122a368018fc6f6d71e82&chksm=6c2208f35b5581e5e9b9fe83625d27070a4aec5f999cde983242833a328acb75999d9aa40b38#rd', 2, 0, 1542869053, 'nZ91NdTbpjpAhfD_a1aVIrKdCCDyGrDsqeBTJHdMF3g'),
(7, 13, 0, '鼓赞音乐培训中心仅需29.98享原价308元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/Q6SP9dYj86Pd4J946pI977i6n876dj.jpg', '', '', 0, 0, 1542872086, '7'),
(8, 14, 0, '千姿舞蹈仅需 29.98 元抢购千元大礼包', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/v8HmQ58KF4t97o85Fh8Kzf849r8K44.jpg', '', '', 0, 0, 1542872256, '12'),
(9, 15, 0, '凤凰机器人双十一钜惠来袭', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/XrC66P2Me7pEZoCrp66eo77McVM7cx.jpg', '', '', 0, 0, 1542871969, '4'),
(10, 16, 0, '博弈跆拳道仅需29.98狂抢价值480元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/uwAiK8awdFGk53GgGQi8w8Zq6r6eIq.jpg', '', '', 0, 0, 1542872153, '9'),
(11, 17, 0, '功夫博远武术仅需29.98元获得298元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/p6kl166xx2X6EzRasdvcevKo63d12L.jpg', '', '', 0, 0, 1542872016, '5'),
(12, 18, 0, '清华少儿英语+三人行辅导仅需29.98狂抢千元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/l4H2DH6371V4gj467D1Dt79xvtr13l.jpg', '', '', 0, 0, 1542872116, '8'),
(13, 19, 0, '画艺美术培训仅需29.98元狂抢价值680元美术精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/qK3ki8vwI1vYvg1v4CY4INU958ubYI.jpg', '', '', 0, 0, 1542872223, '11'),
(30, 20, 0, '鼓赞音乐培训中心仅需29.98享原价308元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/Q6SP9dYj86Pd4J946pI977i6n876dj.jpg', '', '', 0, 0, 1542872086, '7'),
(31, 20, 0, '凤凰机器人双十一钜惠来袭', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/XrC66P2Me7pEZoCrp66eo77McVM7cx.jpg', '', '', 0, 0, 1542871969, '4'),
(32, 20, 0, '功夫博远武术仅需29.98元获得298元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/p6kl166xx2X6EzRasdvcevKo63d12L.jpg', '', '', 0, 0, 1542872016, '5'),
(33, 20, 0, '翰林城幼儿园亲子早教课仅需29.98享原价1200元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/yjCV27Jkm8A38C2m7n3f23Zk87QtK8.jpg', '', '', 0, 0, 1542872055, '6'),
(34, 20, 0, '清华少儿英语+三人行辅导仅需29.98狂抢千元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/l4H2DH6371V4gj467D1Dt79xvtr13l.jpg', '', '', 0, 0, 1542872116, '8'),
(35, 20, 0, '博弈跆拳道仅需29.98狂抢价值480元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/uwAiK8awdFGk53GgGQi8w8Zq6r6eIq.jpg', '', '', 0, 0, 1542872153, '9'),
(36, 20, 0, '静泉瑜伽仅需29.98元抢购1260元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/qfq05rQ0IPVbHgPB0EiIirPYE5G0Hp.jpg', '', '', 0, 0, 1542872187, '10'),
(37, 20, 0, '画艺美术培训仅需29.98元狂抢价值680元美术精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/qK3ki8vwI1vYvg1v4CY4INU958ubYI.jpg', '', '', 0, 0, 1542872223, '11'),
(38, 20, 0, '千姿舞蹈仅需 29.98 元抢购千元大礼包', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/v8HmQ58KF4t97o85Fh8Kzf849r8K44.jpg', '', '', 0, 0, 1542872256, '12'),
(39, 22, 0, '千姿舞蹈仅需 29.98 元抢购千元大礼包', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/v8HmQ58KF4t97o85Fh8Kzf849r8K44.jpg', '', '', 0, 0, 1542872256, '12'),
(40, 22, 0, '画艺美术培训仅需29.98元狂抢价值680元美术精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/qK3ki8vwI1vYvg1v4CY4INU958ubYI.jpg', '', '', 0, 0, 1542872223, '11'),
(41, 22, 0, '静泉瑜伽仅需29.98元抢购1260元精品课程', '', '', 'http://www.onfinger.cn/attachment/images/4/2018/11/qfq05rQ0IPVbHgPB0EiIirPYE5G0Hp.jpg', '', '', 0, 0, 1542872187, '10');

-- --------------------------------------------------------

--
-- 表的结构 `ims_phoneapp_versions`
--

CREATE TABLE `ims_phoneapp_versions` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `modules` text,
  `createtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_profile_fields`
--

CREATE TABLE `ims_profile_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_profile_fields`
--

INSERT INTO `ims_profile_fields` (`id`, `field`, `available`, `title`, `description`, `displayorder`, `required`, `unchangeable`, `showinregister`, `field_length`) VALUES
(1, 'realname', 1, '真实姓名', '', 0, 1, 1, 1, 0),
(2, 'nickname', 1, '昵称', '', 1, 1, 0, 1, 0),
(3, 'avatar', 1, '头像', '', 1, 0, 0, 0, 0),
(4, 'qq', 1, 'QQ号', '', 0, 0, 0, 1, 0),
(5, 'mobile', 1, '手机号码', '', 0, 0, 0, 0, 0),
(6, 'vip', 1, 'VIP级别', '', 0, 0, 0, 0, 0),
(7, 'gender', 1, '性别', '', 0, 0, 0, 0, 0),
(8, 'birthyear', 1, '出生生日', '', 0, 0, 0, 0, 0),
(9, 'constellation', 1, '星座', '', 0, 0, 0, 0, 0),
(10, 'zodiac', 1, '生肖', '', 0, 0, 0, 0, 0),
(11, 'telephone', 1, '固定电话', '', 0, 0, 0, 0, 0),
(12, 'idcard', 1, '证件号码', '', 0, 0, 0, 0, 0),
(13, 'studentid', 1, '学号', '', 0, 0, 0, 0, 0),
(14, 'grade', 1, '班级', '', 0, 0, 0, 0, 0),
(15, 'address', 1, '邮寄地址', '', 0, 0, 0, 0, 0),
(16, 'zipcode', 1, '邮编', '', 0, 0, 0, 0, 0),
(17, 'nationality', 1, '国籍', '', 0, 0, 0, 0, 0),
(18, 'resideprovince', 1, '居住地址', '', 0, 0, 0, 0, 0),
(19, 'graduateschool', 1, '毕业学校', '', 0, 0, 0, 0, 0),
(20, 'company', 1, '公司', '', 0, 0, 0, 0, 0),
(21, 'education', 1, '学历', '', 0, 0, 0, 0, 0),
(22, 'occupation', 1, '职业', '', 0, 0, 0, 0, 0),
(23, 'position', 1, '职位', '', 0, 0, 0, 0, 0),
(24, 'revenue', 1, '年收入', '', 0, 0, 0, 0, 0),
(25, 'affectivestatus', 1, '情感状态', '', 0, 0, 0, 0, 0),
(26, 'lookingfor', 1, ' 交友目的', '', 0, 0, 0, 0, 0),
(27, 'bloodtype', 1, '血型', '', 0, 0, 0, 0, 0),
(28, 'height', 1, '身高', '', 0, 0, 0, 0, 0),
(29, 'weight', 1, '体重', '', 0, 0, 0, 0, 0),
(30, 'alipay', 1, '支付宝帐号', '', 0, 0, 0, 0, 0),
(31, 'msn', 1, 'MSN', '', 0, 0, 0, 0, 0),
(32, 'email', 1, '电子邮箱', '', 0, 0, 0, 0, 0),
(33, 'taobao', 1, '阿里旺旺', '', 0, 0, 0, 0, 0),
(34, 'site', 1, '主页', '', 0, 0, 0, 0, 0),
(35, 'bio', 1, '自我介绍', '', 0, 0, 0, 0, 0),
(36, 'interest', 1, '兴趣爱好', '', 0, 0, 0, 0, 0),
(37, 'birthmonth', 0, '出生月份', '出生月份', 0, 0, 0, 0, 0),
(38, 'birthday', 0, '出生日期', '出生日期', 0, 0, 0, 0, 0),
(39, 'credit1', 0, '积分', '积分', 0, 0, 0, 0, 0),
(40, 'credit2', 0, '余额', '余额', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode`
--

CREATE TABLE `ims_qrcode` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) UNSIGNED NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) UNSIGNED NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) UNSIGNED NOT NULL,
  `subnum` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode_stat`
--

CREATE TABLE `ims_qrcode_stat` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `qid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `qrcid` bigint(20) UNSIGNED NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_robot_rule`
--

CREATE TABLE `ims_robot_rule` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '规则名称',
  `rule_key` varchar(255) NOT NULL COMMENT '规则加密串',
  `type` varchar(255) NOT NULL COMMENT '类型，1列表 2单值',
  `index` varchar(255) NOT NULL COMMENT '单值规则',
  `group` varchar(255) NOT NULL COMMENT '队列规则列表json',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule`
--

CREATE TABLE `ims_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `containtype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_rule`
--

INSERT INTO `ims_rule` (`id`, `uniacid`, `name`, `module`, `displayorder`, `status`, `containtype`) VALUES
(1, 0, '城市天气', 'userapi', 255, 1, ''),
(2, 0, '百度百科', 'userapi', 255, 1, ''),
(3, 0, '即时翻译', 'userapi', 255, 1, ''),
(4, 0, '今日老黄历', 'userapi', 255, 1, ''),
(5, 0, '看新闻', 'userapi', 255, 1, ''),
(6, 0, '快递查询', 'userapi', 255, 1, ''),
(7, 1, '个人中心入口设置', 'cover', 0, 1, ''),
(8, 1, '微擎团队入口设置', 'cover', 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule_keyword`
--

CREATE TABLE `ims_rule_keyword` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_rule_keyword`
--

INSERT INTO `ims_rule_keyword` (`id`, `rid`, `uniacid`, `module`, `content`, `type`, `displayorder`, `status`) VALUES
(1, 1, 0, 'userapi', '^.+天气$', 3, 255, 1),
(2, 2, 0, 'userapi', '^百科.+$', 3, 255, 1),
(3, 2, 0, 'userapi', '^定义.+$', 3, 255, 1),
(4, 3, 0, 'userapi', '^@.+$', 3, 255, 1),
(5, 4, 0, 'userapi', '日历', 1, 255, 1),
(6, 4, 0, 'userapi', '万年历', 1, 255, 1),
(7, 4, 0, 'userapi', '黄历', 1, 255, 1),
(8, 4, 0, 'userapi', '几号', 1, 255, 1),
(9, 5, 0, 'userapi', '新闻', 1, 255, 1),
(10, 6, 0, 'userapi', '^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$', 3, 255, 1),
(11, 7, 1, 'cover', '个人中心', 1, 0, 1),
(12, 8, 1, 'cover', '首页', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_article`
--

CREATE TABLE `ims_site_article` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) UNSIGNED NOT NULL,
  `pcate` int(10) UNSIGNED NOT NULL,
  `ccate` int(10) UNSIGNED NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `edittime` int(10) NOT NULL,
  `click` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_article_comment`
--

CREATE TABLE `ims_site_article_comment` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `articleid` int(10) NOT NULL,
  `parentid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `content` text,
  `is_read` tinyint(1) NOT NULL,
  `iscomment` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_category`
--

CREATE TABLE `ims_site_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `nid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) UNSIGNED NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) UNSIGNED NOT NULL,
  `css` varchar(500) NOT NULL,
  `multiid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_multi`
--

CREATE TABLE `ims_site_multi` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `bindhost` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_multi`
--

INSERT INTO `ims_site_multi` (`id`, `uniacid`, `title`, `styleid`, `site_info`, `status`, `bindhost`) VALUES
(1, 1, '微擎团队', 1, '', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_nav`
--

CREATE TABLE `ims_site_nav` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `categoryid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_page`
--

CREATE TABLE `ims_site_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `multipage` longtext NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `goodnum` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_slide`
--

CREATE TABLE `ims_site_slide` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_cash_log`
--

CREATE TABLE `ims_site_store_cash_log` (
  `id` int(10) NOT NULL,
  `founder_uid` int(10) NOT NULL,
  `number` char(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_cash_order`
--

CREATE TABLE `ims_site_store_cash_order` (
  `id` int(10) NOT NULL,
  `number` char(30) NOT NULL,
  `founder_uid` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `order_amount` decimal(10,2) NOT NULL,
  `cash_log_id` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_create_account`
--

CREATE TABLE `ims_site_store_create_account` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `endtime` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_goods`
--

CREATE TABLE `ims_site_store_goods` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL,
  `account_num` int(10) NOT NULL,
  `wxapp_num` int(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `slide` varchar(1000) NOT NULL,
  `category_id` int(10) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `synopsis` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `module_group` int(10) NOT NULL,
  `api_num` int(10) NOT NULL,
  `user_group_price` varchar(1000) DEFAULT NULL,
  `user_group` int(10) NOT NULL,
  `account_group` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_order`
--

CREATE TABLE `ims_site_store_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `orderid` varchar(28) NOT NULL,
  `goodsid` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `buyerid` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `changeprice` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `endtime` int(15) NOT NULL,
  `wxapp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles`
--

CREATE TABLE `ims_site_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `templateid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_styles`
--

INSERT INTO `ims_site_styles` (`id`, `uniacid`, `templateid`, `name`) VALUES
(1, 1, 1, '微站默认模板_gC5C');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles_vars`
--

CREATE TABLE `ims_site_styles_vars` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `templateid` int(10) UNSIGNED NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_templates`
--

CREATE TABLE `ims_site_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_templates`
--

INSERT INTO `ims_site_templates` (`id`, `name`, `title`, `version`, `description`, `author`, `url`, `type`, `sections`) VALUES
(1, 'default', '微站默认模板', '', '由微擎提供默认微站模板套系', '微擎团队', 'http://we7.cc', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_fans`
--

CREATE TABLE `ims_stat_fans` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `new` int(10) UNSIGNED NOT NULL,
  `cancel` int(10) UNSIGNED NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_stat_fans`
--

INSERT INTO `ims_stat_fans` (`id`, `uniacid`, `new`, `cancel`, `cumulate`, `date`) VALUES
(358, 1, 0, 0, 0, '20190421'),
(359, 1, 0, 0, 0, '20190420'),
(360, 1, 0, 0, 0, '20190419'),
(361, 1, 0, 0, 0, '20190418'),
(362, 1, 0, 0, 0, '20190417'),
(363, 1, 0, 0, 0, '20190416'),
(364, 1, 0, 0, 0, '20190415'),
(365, 1, 0, 0, 0, '20190422'),
(366, 1, 0, 0, 0, '20190427'),
(367, 1, 0, 0, 0, '20190426'),
(368, 1, 0, 0, 0, '20190425'),
(369, 1, 0, 0, 0, '20190424'),
(370, 1, 0, 0, 0, '20190423');

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_keyword`
--

CREATE TABLE `ims_stat_keyword` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `hit` int(10) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_msg_history`
--

CREATE TABLE `ims_stat_msg_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_rule`
--

CREATE TABLE `ims_stat_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `hit` int(10) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_visit`
--

CREATE TABLE `ims_stat_visit` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `module` varchar(100) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `ip_count` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_stat_visit`
--

INSERT INTO `ims_stat_visit` (`id`, `uniacid`, `module`, `count`, `date`, `type`, `ip_count`) VALUES
(315, 1, '', 1, 20190422, 'web', 0),
(316, 1, 'we7_account', 1, 20190422, 'web', 0),
(317, 1, '', 22, 20190423, 'web', 1),
(318, 1, 'we7_account', 4, 20190423, 'web', 0),
(319, 1, '', 6, 20190424, 'web', 1),
(320, 1, 'we7_account', 2, 20190424, 'web', 0),
(321, 1, '', 2, 20190425, 'web', 1),
(322, 1, 'we7_account', 1, 20190425, 'web', 0),
(323, 1, '', 5, 20190428, 'web', 1),
(324, 1, 'we7_account', 9, 20190428, 'web', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_visit_ip`
--

CREATE TABLE `ims_stat_visit_ip` (
  `id` int(10) NOT NULL,
  `ip` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `module` varchar(100) NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_stat_visit_ip`
--

INSERT INTO `ims_stat_visit_ip` (`id`, `ip`, `uniacid`, `type`, `module`, `date`) VALUES
(4520, 1963782788, 3, 'app', 'szxh_children', 20190422),
(4521, 2130706433, 3, 'web', '', 20190422),
(4522, 2130706433, 1, 'web', '', 20190423),
(4523, 2130706433, 1, 'web', '', 20190424),
(4524, 2130706433, 1, 'web', '', 20190425),
(4525, 2130706433, 1, 'web', '', 20190428);

-- --------------------------------------------------------

--
-- 表的结构 `ims_system_stat_visit`
--

CREATE TABLE `ims_system_stat_visit` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `uid` int(10) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `updatetime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account`
--

CREATE TABLE `ims_uni_account` (
  `uniacid` int(10) UNSIGNED NOT NULL,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) UNSIGNED NOT NULL,
  `rank` int(10) DEFAULT NULL,
  `title_initial` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_account`
--

INSERT INTO `ims_uni_account` (`uniacid`, `groupid`, `name`, `description`, `default_acid`, `rank`, `title_initial`) VALUES
(1, -1, '微擎团队', '一个朝气蓬勃的团队', 1, NULL, 'W');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_group`
--

CREATE TABLE `ims_uni_account_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `groupid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_account_group`
--

INSERT INTO `ims_uni_account_group` (`id`, `uniacid`, `groupid`) VALUES
(1, 4, -1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_menus`
--

CREATE TABLE `ims_uni_account_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `menuid` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) UNSIGNED NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) UNSIGNED NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `isdeleted` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_account_menus`
--

INSERT INTO `ims_uni_account_menus` (`id`, `uniacid`, `menuid`, `type`, `title`, `sex`, `group_id`, `client_platform_type`, `area`, `data`, `status`, `createtime`, `isdeleted`) VALUES
(1, 4, 0, 1, '1', 0, -1, 0, '', 'YToxOntzOjY6ImJ1dHRvbiI7YTozOntpOjA7YToyOntzOjQ6Im5hbWUiO3M6MTI6Iue6ouWMheaLk+WuoiI7czoxMDoic3ViX2J1dHRvbiI7YToyOntpOjA7YTozOntzOjQ6Im5hbWUiO3M6OToi566A5piT5p2/IjtzOjQ6InR5cGUiO3M6NToiY2xpY2siO3M6Mzoia2V5IjtzOjE1OiLnroDmmJPniYjmoYjkvosiO31pOjE7YTozOntzOjQ6Im5hbWUiO3M6OToi5q2j5byP54mIIjtzOjQ6InR5cGUiO3M6NToiY2xpY2siO3M6Mzoia2V5IjtzOjEyOiLmtLvnoIHlt6XlhbciO319fWk6MTthOjI6e3M6NDoibmFtZSI7czoxMjoi57qi5YyF5ou85ZuiIjtzOjEwOiJzdWJfYnV0dG9uIjthOjE6e2k6MDthOjM6e3M6NDoibmFtZSI7czoxNToi5a2Q6I+c5Y2V5ZCN56ewIjtzOjQ6InR5cGUiO3M6NToiY2xpY2siO3M6Mzoia2V5IjtzOjEyOiLmi7zlm6LmoYjkvosiO319fWk6MjthOjI6e3M6NDoibmFtZSI7czoxMjoi5L2T6aqM5ZCO5Y+wIjtzOjEwOiJzdWJfYnV0dG9uIjthOjQ6e2k6MDthOjM6e3M6NDoibmFtZSI7czoxMjoi57qi5YyF5ouT5a6iIjtzOjQ6InR5cGUiO3M6NToiY2xpY2siO3M6Mzoia2V5IjtzOjE4OiLnuqLljIXmi5PlrqLlr4bnoIEiO31pOjE7YTozOntzOjQ6Im5hbWUiO3M6MTI6Iue6ouWMheaLvOWboiI7czo0OiJ0eXBlIjtzOjU6ImNsaWNrIjtzOjM6ImtleSI7czoxODoi57qi5YyF5ou85Zui5a+G56CBIjt9aToyO2E6Mzp7czo0OiJuYW1lIjtzOjEyOiLmtLvnoIHlt6XlhbciO3M6NDoidHlwZSI7czo1OiJjbGljayI7czozOiJrZXkiO3M6MTg6Iua0u+eggeW3peWFt+WvhueggSI7fWk6MzthOjM6e3M6NDoibmFtZSI7czoxMjoi6IGU57O75oiR5LusIjtzOjQ6InR5cGUiO3M6ODoibWVkaWFfaWQiO3M6ODoibWVkaWFfaWQiO3M6NDM6Im5aOTFOZFRicGpwQWhmRF9hMWFWSXNCd3h5Y1Q0WkRTdXJhSHR0c2ZFLVkiO319fX19', 1, 1542876609, 0),
(2, 3, 0, 1, '2', 0, -1, 0, '', 'YToxOntzOjY6ImJ1dHRvbiI7YToxOntpOjA7YTozOntzOjQ6Im5hbWUiO3M6MTM6IuiPnOWNleWQjeensDEiO3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjM6InVybCI7czo0NjoiaHR0cDovL3d3dy5vbmZpbmdlci5jbi9hcHAvaW5kZXgucGhwP2k9MyZjPW1jJiI7fX19', 1, 1542863153, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_modules`
--

CREATE TABLE `ims_uni_account_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `settings` text NOT NULL,
  `shortcut` tinyint(1) UNSIGNED NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_modules_shortcut`
--

CREATE TABLE `ims_uni_account_modules_shortcut` (
  `id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` varchar(250) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `version_id` int(10) NOT NULL,
  `module_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_users`
--

CREATE TABLE `ims_uni_account_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_group`
--

CREATE TABLE `ims_uni_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `modules` text NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_group`
--

INSERT INTO `ims_uni_group` (`id`, `owner_uid`, `name`, `modules`, `templates`, `uniacid`, `uid`) VALUES
(2, 0, '', 'a:5:{s:7:\"modules\";a:0:{}s:5:\"wxapp\";a:0:{}s:6:\"webapp\";a:0:{}s:5:\"xzapp\";a:0:{}s:8:\"phoneapp\";a:0:{}}', 'N;', 0, 5),
(3, 0, '', 'a:5:{s:7:\"modules\";a:0:{}s:5:\"wxapp\";a:0:{}s:6:\"webapp\";a:0:{}s:5:\"xzapp\";a:0:{}s:8:\"phoneapp\";a:0:{}}', 'N;', 0, 6),
(4, 0, '', 'a:5:{s:7:\"modules\";a:0:{}s:5:\"wxapp\";a:0:{}s:6:\"webapp\";a:0:{}s:5:\"xzapp\";a:0:{}s:8:\"phoneapp\";a:0:{}}', 'N;', 0, 7);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_link_uniacid`
--

CREATE TABLE `ims_uni_link_uniacid` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `link_uniacid` int(10) NOT NULL,
  `version_id` int(10) NOT NULL,
  `module_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_modules`
--

CREATE TABLE `ims_uni_modules` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `module_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_modules`
--

INSERT INTO `ims_uni_modules` (`id`, `uniacid`, `module_name`) VALUES
(1, 1, 'w7_scaffold');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_settings`
--

CREATE TABLE `ims_uni_settings` (
  `uniacid` int(10) UNSIGNED NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) UNSIGNED NOT NULL,
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `payment` text NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) UNSIGNED DEFAULT NULL,
  `sync` tinyint(3) UNSIGNED NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(2000) NOT NULL,
  `grouplevel` tinyint(3) UNSIGNED NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) UNSIGNED NOT NULL,
  `coupon_type` tinyint(3) UNSIGNED NOT NULL,
  `menuset` text NOT NULL,
  `statistics` varchar(100) NOT NULL,
  `bind_domain` varchar(200) NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `reply_setting` tinyint(4) NOT NULL,
  `default_module` varchar(100) NOT NULL,
  `attachment_limit` int(11) DEFAULT NULL,
  `attachment_size` varchar(20) DEFAULT NULL,
  `sync_member` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_settings`
--

INSERT INTO `ims_uni_settings` (`uniacid`, `passport`, `oauth`, `jsauth_acid`, `uc`, `notify`, `creditnames`, `creditbehaviors`, `welcome`, `default`, `default_message`, `payment`, `stat`, `default_site`, `sync`, `recharge`, `tplnotice`, `grouplevel`, `mcplugin`, `exchange_enable`, `coupon_type`, `menuset`, `statistics`, `bind_domain`, `comment_status`, `reply_setting`, `default_module`, `attachment_limit`, `attachment_size`, `sync_member`) VALUES
(0, '', '', 0, '', '', '', '', '', '', '', '', '', NULL, 0, '', '', 0, '', 0, 0, '', '', '', 0, 0, '', NULL, '295', 0),
(1, 'a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}', '', 0, 'a:1:{s:6:\"status\";i:0;}', 'a:1:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}}', 'a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}', 'a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}', '', '', '', 'a:4:{s:6:\"credit\";a:3:{s:6:\"switch\";b:0;s:15:\"recharge_switch\";b:0;s:10:\"pay_switch\";b:0;}s:6:\"alipay\";a:6:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:15:\"recharge_switch\";b:0;s:10:\"pay_switch\";b:0;}s:6:\"wechat\";a:7:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";s:15:\"recharge_switch\";b:0;s:10:\"pay_switch\";b:0;}s:8:\"delivery\";a:3:{s:6:\"switch\";b:0;s:15:\"recharge_switch\";b:0;s:10:\"pay_switch\";b:0;}}', '', 1, 0, '', '', 0, '', 0, 0, '', '', '', 0, 0, '', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_verifycode`
--

CREATE TABLE `ims_uni_verifycode` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `failed_count` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_cache`
--

CREATE TABLE `ims_userapi_cache` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_reply`
--

CREATE TABLE `ims_userapi_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_userapi_reply`
--

INSERT INTO `ims_userapi_reply` (`id`, `rid`, `description`, `apiurl`, `token`, `default_text`, `cachetime`) VALUES
(1, 1, '\"城市名+天气\", 如: \"北京天气\"', 'weather.php', '', '', 0),
(2, 2, '\"百科+查询内容\" 或 \"定义+查询内容\", 如: \"百科姚明\", \"定义自行车\"', 'baike.php', '', '', 0),
(3, 3, '\"@查询内容(中文或英文)\"', 'translate.php', '', '', 0),
(4, 4, '\"日历\", \"万年历\", \"黄历\"或\"几号\"', 'calendar.php', '', '', 0),
(5, 5, '\"新闻\"', 'news.php', '', '', 0),
(6, 6, '\"快递+单号\", 如: \"申通1200041125\"', 'express.php', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users`
--

CREATE TABLE `ims_users` (
  `uid` int(10) UNSIGNED NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `groupid` int(10) UNSIGNED NOT NULL,
  `founder_groupid` tinyint(4) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) UNSIGNED NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) UNSIGNED NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) UNSIGNED NOT NULL,
  `endtime` int(10) UNSIGNED NOT NULL,
  `register_type` tinyint(3) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `welcome_link` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users`
--

INSERT INTO `ims_users` (`uid`, `owner_uid`, `groupid`, `founder_groupid`, `username`, `password`, `salt`, `type`, `status`, `joindate`, `joinip`, `lastvisit`, `lastip`, `remark`, `starttime`, `endtime`, `register_type`, `openid`, `welcome_link`) VALUES
(1, 0, 1, 0, 'admin', '907ece0ea7062a22fdf4b7660a527a6d0944e713', 'a58fc1b2', 0, 0, 1539929277, '', 1556432526, '127.0.0.1', '', 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_bind`
--

CREATE TABLE `ims_users_bind` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `bind_sign` varchar(50) NOT NULL,
  `third_type` tinyint(4) NOT NULL,
  `third_nickname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_create_group`
--

CREATE TABLE `ims_users_create_group` (
  `id` int(10) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `maxaccount` int(10) NOT NULL,
  `maxwxapp` int(10) NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_extra_group`
--

CREATE TABLE `ims_users_extra_group` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uni_group_id` int(10) NOT NULL,
  `create_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_extra_limit`
--

CREATE TABLE `ims_users_extra_limit` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `maxaccount` int(10) NOT NULL,
  `maxwxapp` int(10) NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `timelimit` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users_extra_limit`
--

INSERT INTO `ims_users_extra_limit` (`id`, `uid`, `maxaccount`, `maxwxapp`, `maxwebapp`, `maxphoneapp`, `maxxzapp`, `maxaliapp`, `timelimit`, `maxbaiduapp`, `maxtoutiaoapp`) VALUES
(1, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_extra_modules`
--

CREATE TABLE `ims_users_extra_modules` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `support` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_extra_templates`
--

CREATE TABLE `ims_users_extra_templates` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `template_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_failed_login`
--

CREATE TABLE `ims_users_failed_login` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_group`
--

CREATE TABLE `ims_users_founder_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) UNSIGNED NOT NULL,
  `maxsubaccount` int(10) UNSIGNED NOT NULL,
  `timelimit` int(10) UNSIGNED NOT NULL,
  `maxwxapp` int(10) UNSIGNED NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_own_create_groups`
--

CREATE TABLE `ims_users_founder_own_create_groups` (
  `id` int(10) NOT NULL,
  `founder_uid` int(10) NOT NULL,
  `create_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_own_uni_groups`
--

CREATE TABLE `ims_users_founder_own_uni_groups` (
  `id` int(10) NOT NULL,
  `founder_uid` int(10) NOT NULL,
  `uni_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_own_users`
--

CREATE TABLE `ims_users_founder_own_users` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `founder_uid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_own_users_groups`
--

CREATE TABLE `ims_users_founder_own_users_groups` (
  `id` int(10) NOT NULL,
  `founder_uid` int(10) NOT NULL,
  `users_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_group`
--

CREATE TABLE `ims_users_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) UNSIGNED NOT NULL,
  `maxsubaccount` int(10) UNSIGNED NOT NULL,
  `timelimit` int(10) UNSIGNED NOT NULL,
  `maxwxapp` int(10) UNSIGNED NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users_group`
--

INSERT INTO `ims_users_group` (`id`, `owner_uid`, `name`, `package`, `maxaccount`, `maxsubaccount`, `timelimit`, `maxwxapp`, `maxwebapp`, `maxphoneapp`, `maxxzapp`, `maxaliapp`, `maxbaiduapp`, `maxtoutiaoapp`) VALUES
(1, 0, '体验', 'a:1:{i:0;i:1;}', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, '管理组', 'N;', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_invitation`
--

CREATE TABLE `ims_users_invitation` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) UNSIGNED NOT NULL,
  `inviteuid` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_lastuse`
--

CREATE TABLE `ims_users_lastuse` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) DEFAULT NULL,
  `modulename` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users_lastuse`
--

INSERT INTO `ims_users_lastuse` (`id`, `uid`, `uniacid`, `modulename`, `type`) VALUES
(19, 1, 1, '', 'account_display'),
(20, 1, 1, 'w7_scaffold', 'module_display');

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_permission`
--

CREATE TABLE `ims_users_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  `modules` text NOT NULL,
  `templates` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_profile`
--

CREATE TABLE `ims_users_profile` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `edittime` int(10) NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) UNSIGNED NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) UNSIGNED NOT NULL,
  `birthmonth` tinyint(3) UNSIGNED NOT NULL,
  `birthday` tinyint(3) UNSIGNED NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  `is_send_mobile_status` tinyint(3) NOT NULL,
  `send_expire_status` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users_profile`
--

INSERT INTO `ims_users_profile` (`id`, `uid`, `createtime`, `edittime`, `realname`, `nickname`, `avatar`, `qq`, `mobile`, `fakeid`, `vip`, `gender`, `birthyear`, `birthmonth`, `birthday`, `constellation`, `zodiac`, `telephone`, `idcard`, `studentid`, `grade`, `address`, `zipcode`, `nationality`, `resideprovince`, `residecity`, `residedist`, `graduateschool`, `company`, `education`, `occupation`, `position`, `revenue`, `affectivestatus`, `lookingfor`, `bloodtype`, `height`, `weight`, `alipay`, `msn`, `email`, `taobao`, `site`, `bio`, `interest`, `workerid`, `is_send_mobile_status`, `send_expire_status`) VALUES
(1, 9, 1545198287, 0, '李先生', '李先生', '', '50563467', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(2, 11, 1546834074, 0, 'dasdsa', 'ddsdsa', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(3, 12, 1547264837, 0, '孙明山', '山哥', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(4, 13, 1548248143, 0, '321', '123', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(5, 14, 1550477079, 0, '贾建松', '轻便管理-M', '', '251180418', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(6, 15, 1551405582, 0, '刘飞', '龙胤邦', '', '2721497898', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(7, 20, 1554793553, 0, '程华', '山西易客多科技', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(8, 21, 1555423187, 0, 'sd', 'ces', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_video_reply`
--

CREATE TABLE `ims_video_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_voice_reply`
--

CREATE TABLE `ims_voice_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_attachment`
--

CREATE TABLE `ims_wechat_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) UNSIGNED NOT NULL,
  `height` int(10) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `module_upload_dir` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_news`
--

CREATE TABLE `ims_wechat_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED DEFAULT NULL,
  `attach_id` int(10) UNSIGNED NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) UNSIGNED NOT NULL,
  `url` varchar(200) NOT NULL,
  `displayorder` int(2) NOT NULL,
  `need_open_comment` tinyint(1) NOT NULL,
  `only_fans_can_comment` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxapp_general_analysis`
--

CREATE TABLE `ims_wxapp_general_analysis` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `session_cnt` int(10) NOT NULL,
  `visit_pv` int(10) NOT NULL,
  `visit_uv` int(10) NOT NULL,
  `visit_uv_new` int(10) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `stay_time_uv` varchar(10) NOT NULL,
  `stay_time_session` varchar(10) NOT NULL,
  `visit_depth` varchar(10) NOT NULL,
  `ref_date` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxapp_versions`
--

CREATE TABLE `ims_wxapp_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `version` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `modules` varchar(1000) NOT NULL,
  `design_method` tinyint(1) NOT NULL,
  `template` int(10) NOT NULL,
  `quickmenu` varchar(2500) NOT NULL,
  `createtime` int(10) NOT NULL,
  `type` int(2) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `appjson` text NOT NULL,
  `default_appjson` text NOT NULL,
  `use_default` tinyint(1) NOT NULL,
  `last_modules` varchar(1000) DEFAULT NULL,
  `tominiprogram` varchar(1000) NOT NULL,
  `upload_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxcard_reply`
--

CREATE TABLE `ims_wxcard_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `ims_account`
--
ALTER TABLE `ims_account`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `idx_uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_account_aliapp`
--
ALTER TABLE `ims_account_aliapp`
  ADD PRIMARY KEY (`acid`);

--
-- 表的索引 `ims_account_baiduapp`
--
ALTER TABLE `ims_account_baiduapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_account_phoneapp`
--
ALTER TABLE `ims_account_phoneapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_account_toutiaoapp`
--
ALTER TABLE `ims_account_toutiaoapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_account_webapp`
--
ALTER TABLE `ims_account_webapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_account_wechats`
--
ALTER TABLE `ims_account_wechats`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `idx_key` (`key`) USING BTREE;

--
-- 表的索引 `ims_account_wxapp`
--
ALTER TABLE `ims_account_wxapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_account_xzapp`
--
ALTER TABLE `ims_account_xzapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_activity_clerks`
--
ALTER TABLE `ims_activity_clerks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `password` (`password`) USING BTREE,
  ADD KEY `openid` (`openid`) USING BTREE;

--
-- 表的索引 `ims_activity_clerk_menu`
--
ALTER TABLE `ims_activity_clerk_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_article_category`
--
ALTER TABLE `ims_article_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`) USING BTREE;

--
-- 表的索引 `ims_article_comment`
--
ALTER TABLE `ims_article_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articleid` (`articleid`) USING BTREE;

--
-- 表的索引 `ims_article_news`
--
ALTER TABLE `ims_article_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `cateid` (`cateid`) USING BTREE;

--
-- 表的索引 `ims_article_notice`
--
ALTER TABLE `ims_article_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `cateid` (`cateid`) USING BTREE;

--
-- 表的索引 `ims_article_unread_notice`
--
ALTER TABLE `ims_article_unread_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `notice_id` (`notice_id`) USING BTREE;

--
-- 表的索引 `ims_attachment_group`
--
ALTER TABLE `ims_attachment_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_basic_reply`
--
ALTER TABLE `ims_basic_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_business`
--
ALTER TABLE `ims_business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lat_lng` (`lng`,`lat`) USING BTREE;

--
-- 表的索引 `ims_core_attachment`
--
ALTER TABLE `ims_core_attachment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_core_cache`
--
ALTER TABLE `ims_core_cache`
  ADD PRIMARY KEY (`key`);

--
-- 表的索引 `ims_core_cron`
--
ALTER TABLE `ims_core_cron`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createtime` (`createtime`) USING BTREE,
  ADD KEY `nextruntime` (`nextruntime`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `cloudid` (`cloudid`) USING BTREE;

--
-- 表的索引 `ims_core_cron_record`
--
ALTER TABLE `ims_core_cron_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `tid` (`tid`) USING BTREE,
  ADD KEY `module` (`module`) USING BTREE;

--
-- 表的索引 `ims_core_job`
--
ALTER TABLE `ims_core_job`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_core_menu`
--
ALTER TABLE `ims_core_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_core_menu_shortcut`
--
ALTER TABLE `ims_core_menu_shortcut`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- 表的索引 `ims_core_paylog`
--
ALTER TABLE `ims_core_paylog`
  ADD PRIMARY KEY (`plid`),
  ADD KEY `idx_openid` (`openid`) USING BTREE,
  ADD KEY `idx_tid` (`tid`) USING BTREE,
  ADD KEY `idx_uniacid` (`uniacid`) USING BTREE,
  ADD KEY `uniontid` (`uniontid`) USING BTREE;

--
-- 表的索引 `ims_core_performance`
--
ALTER TABLE `ims_core_performance`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_core_queue`
--
ALTER TABLE `ims_core_queue`
  ADD PRIMARY KEY (`qid`),
  ADD KEY `uniacid` (`uniacid`,`acid`) USING BTREE,
  ADD KEY `module` (`module`) USING BTREE,
  ADD KEY `dateline` (`dateline`) USING BTREE;

--
-- 表的索引 `ims_core_refundlog`
--
ALTER TABLE `ims_core_refundlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_uniontid` (`refund_uniontid`) USING BTREE,
  ADD KEY `uniontid` (`uniontid`) USING BTREE;

--
-- 表的索引 `ims_core_resource`
--
ALTER TABLE `ims_core_resource`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `acid` (`uniacid`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE;

--
-- 表的索引 `ims_core_sendsms_log`
--
ALTER TABLE `ims_core_sendsms_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_core_sessions`
--
ALTER TABLE `ims_core_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- 表的索引 `ims_core_settings`
--
ALTER TABLE `ims_core_settings`
  ADD PRIMARY KEY (`key`);

--
-- 表的索引 `ims_coupon_location`
--
ALTER TABLE `ims_coupon_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`) USING BTREE;

--
-- 表的索引 `ims_cover_reply`
--
ALTER TABLE `ims_cover_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_custom_reply`
--
ALTER TABLE `ims_custom_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_images_reply`
--
ALTER TABLE `ims_images_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_job`
--
ALTER TABLE `ims_job`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_mc_cash_record`
--
ALTER TABLE `ims_mc_cash_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- 表的索引 `ims_mc_chats_record`
--
ALTER TABLE `ims_mc_chats_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`) USING BTREE,
  ADD KEY `openid` (`openid`) USING BTREE,
  ADD KEY `createtime` (`createtime`) USING BTREE;

--
-- 表的索引 `ims_mc_credits_recharge`
--
ALTER TABLE `ims_mc_credits_recharge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uniacid_uid` (`uniacid`,`uid`) USING BTREE,
  ADD KEY `idx_tid` (`tid`) USING BTREE;

--
-- 表的索引 `ims_mc_credits_record`
--
ALTER TABLE `ims_mc_credits_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- 表的索引 `ims_mc_fans_groups`
--
ALTER TABLE `ims_mc_fans_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_mc_fans_tag_mapping`
--
ALTER TABLE `ims_mc_fans_tag_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mapping` (`fanid`,`tagid`) USING BTREE,
  ADD KEY `fanid_index` (`fanid`) USING BTREE,
  ADD KEY `tagid_index` (`tagid`) USING BTREE;

--
-- 表的索引 `ims_mc_groups`
--
ALTER TABLE `ims_mc_groups`
  ADD PRIMARY KEY (`groupid`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_mc_handsel`
--
ALTER TABLE `ims_mc_handsel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`touid`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_mc_mapping_fans`
--
ALTER TABLE `ims_mc_mapping_fans`
  ADD PRIMARY KEY (`fanid`),
  ADD UNIQUE KEY `openid_2` (`openid`) USING BTREE,
  ADD KEY `acid` (`acid`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `nickname` (`nickname`) USING BTREE,
  ADD KEY `updatetime` (`updatetime`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `openid` (`openid`) USING BTREE;

--
-- 表的索引 `ims_mc_mapping_ucenter`
--
ALTER TABLE `ims_mc_mapping_ucenter`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_mc_mass_record`
--
ALTER TABLE `ims_mc_mass_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`) USING BTREE;

--
-- 表的索引 `ims_mc_members`
--
ALTER TABLE `ims_mc_members`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `groupid` (`groupid`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `email` (`email`) USING BTREE,
  ADD KEY `mobile` (`mobile`) USING BTREE;

--
-- 表的索引 `ims_mc_member_address`
--
ALTER TABLE `ims_mc_member_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uinacid` (`uniacid`) USING BTREE,
  ADD KEY `idx_uid` (`uid`) USING BTREE;

--
-- 表的索引 `ims_mc_member_fields`
--
ALTER TABLE `ims_mc_member_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uniacid` (`uniacid`) USING BTREE,
  ADD KEY `idx_fieldid` (`fieldid`) USING BTREE;

--
-- 表的索引 `ims_mc_member_property`
--
ALTER TABLE `ims_mc_member_property`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_mc_oauth_fans`
--
ALTER TABLE `ims_mc_oauth_fans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`) USING BTREE;

--
-- 表的索引 `ims_menu_event`
--
ALTER TABLE `ims_menu_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `picmd5` (`picmd5`) USING BTREE;

--
-- 表的索引 `ims_message_notice_log`
--
ALTER TABLE `ims_message_notice_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_mobilenumber`
--
ALTER TABLE `ims_mobilenumber`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_modules`
--
ALTER TABLE `ims_modules`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `idx_name` (`name`) USING BTREE;

--
-- 表的索引 `ims_modules_bindings`
--
ALTER TABLE `ims_modules_bindings`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `idx_module` (`module`) USING BTREE;

--
-- 表的索引 `ims_modules_cloud`
--
ALTER TABLE `ims_modules_cloud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `lastupdatetime` (`lastupdatetime`) USING BTREE;

--
-- 表的索引 `ims_modules_ignore`
--
ALTER TABLE `ims_modules_ignore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`) USING BTREE;

--
-- 表的索引 `ims_modules_plugin`
--
ALTER TABLE `ims_modules_plugin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `main_module` (`main_module`) USING BTREE;

--
-- 表的索引 `ims_modules_plugin_rank`
--
ALTER TABLE `ims_modules_plugin_rank`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_modules_rank`
--
ALTER TABLE `ims_modules_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- 表的索引 `ims_modules_recycle`
--
ALTER TABLE `ims_modules_recycle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modulename` (`modulename`) USING BTREE;

--
-- 表的索引 `ims_music_reply`
--
ALTER TABLE `ims_music_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_news_reply`
--
ALTER TABLE `ims_news_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_phoneapp_versions`
--
ALTER TABLE `ims_phoneapp_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `version` (`version`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_profile_fields`
--
ALTER TABLE `ims_profile_fields`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_qrcode`
--
ALTER TABLE `ims_qrcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qrcid` (`qrcid`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `ticket` (`ticket`) USING BTREE;

--
-- 表的索引 `ims_qrcode_stat`
--
ALTER TABLE `ims_qrcode_stat`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_robot_rule`
--
ALTER TABLE `ims_robot_rule`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_rule`
--
ALTER TABLE `ims_rule`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_rule_keyword`
--
ALTER TABLE `ims_rule_keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_content` (`content`) USING BTREE,
  ADD KEY `rid` (`rid`) USING BTREE,
  ADD KEY `idx_rid` (`rid`) USING BTREE,
  ADD KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`) USING BTREE;

--
-- 表的索引 `ims_site_article`
--
ALTER TABLE `ims_site_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_iscommend` (`iscommend`) USING BTREE,
  ADD KEY `idx_ishot` (`ishot`) USING BTREE;

--
-- 表的索引 `ims_site_article_comment`
--
ALTER TABLE `ims_site_article_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `articleid` (`articleid`) USING BTREE;

--
-- 表的索引 `ims_site_category`
--
ALTER TABLE `ims_site_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_site_multi`
--
ALTER TABLE `ims_site_multi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `bindhost` (`bindhost`) USING BTREE;

--
-- 表的索引 `ims_site_nav`
--
ALTER TABLE `ims_site_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `multiid` (`multiid`) USING BTREE;

--
-- 表的索引 `ims_site_page`
--
ALTER TABLE `ims_site_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `multiid` (`multiid`) USING BTREE;

--
-- 表的索引 `ims_site_slide`
--
ALTER TABLE `ims_site_slide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `multiid` (`multiid`) USING BTREE;

--
-- 表的索引 `ims_site_store_cash_log`
--
ALTER TABLE `ims_site_store_cash_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `founder_uid` (`founder_uid`) USING BTREE;

--
-- 表的索引 `ims_site_store_cash_order`
--
ALTER TABLE `ims_site_store_cash_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `founder_uid` (`founder_uid`) USING BTREE;

--
-- 表的索引 `ims_site_store_create_account`
--
ALTER TABLE `ims_site_store_create_account`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_site_store_goods`
--
ALTER TABLE `ims_site_store_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `price` (`price`) USING BTREE;

--
-- 表的索引 `ims_site_store_order`
--
ALTER TABLE `ims_site_store_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goodid` (`goodsid`) USING BTREE,
  ADD KEY `buyerid` (`buyerid`) USING BTREE;

--
-- 表的索引 `ims_site_styles`
--
ALTER TABLE `ims_site_styles`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_site_styles_vars`
--
ALTER TABLE `ims_site_styles_vars`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_site_templates`
--
ALTER TABLE `ims_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_stat_fans`
--
ALTER TABLE `ims_stat_fans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`date`) USING BTREE;

--
-- 表的索引 `ims_stat_keyword`
--
ALTER TABLE `ims_stat_keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`) USING BTREE;

--
-- 表的索引 `ims_stat_msg_history`
--
ALTER TABLE `ims_stat_msg_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`) USING BTREE;

--
-- 表的索引 `ims_stat_rule`
--
ALTER TABLE `ims_stat_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`) USING BTREE,
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_stat_visit`
--
ALTER TABLE `ims_stat_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `module` (`module`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_stat_visit_ip`
--
ALTER TABLE `ims_stat_visit_ip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_date_module_uniacid` (`ip`,`date`,`module`,`uniacid`) USING BTREE;

--
-- 表的索引 `ims_system_stat_visit`
--
ALTER TABLE `ims_system_stat_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- 表的索引 `ims_uni_account`
--
ALTER TABLE `ims_uni_account`
  ADD PRIMARY KEY (`uniacid`);

--
-- 表的索引 `ims_uni_account_group`
--
ALTER TABLE `ims_uni_account_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_uni_account_menus`
--
ALTER TABLE `ims_uni_account_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `menuid` (`menuid`) USING BTREE;

--
-- 表的索引 `ims_uni_account_modules`
--
ALTER TABLE `ims_uni_account_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_module` (`module`) USING BTREE,
  ADD KEY `idx_uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_uni_account_modules_shortcut`
--
ALTER TABLE `ims_uni_account_modules_shortcut`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_uni_account_users`
--
ALTER TABLE `ims_uni_account_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_memberid` (`uid`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_uni_group`
--
ALTER TABLE `ims_uni_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_uni_link_uniacid`
--
ALTER TABLE `ims_uni_link_uniacid`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_uni_modules`
--
ALTER TABLE `ims_uni_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_uni_settings`
--
ALTER TABLE `ims_uni_settings`
  ADD PRIMARY KEY (`uniacid`);

--
-- 表的索引 `ims_uni_verifycode`
--
ALTER TABLE `ims_uni_verifycode`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_userapi_cache`
--
ALTER TABLE `ims_userapi_cache`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_userapi_reply`
--
ALTER TABLE `ims_userapi_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_users`
--
ALTER TABLE `ims_users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 表的索引 `ims_users_bind`
--
ALTER TABLE `ims_users_bind`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `bind_sign` (`bind_sign`) USING BTREE;

--
-- 表的索引 `ims_users_create_group`
--
ALTER TABLE `ims_users_create_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_extra_group`
--
ALTER TABLE `ims_users_extra_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_extra_limit`
--
ALTER TABLE `ims_users_extra_limit`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_extra_modules`
--
ALTER TABLE `ims_users_extra_modules`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_extra_templates`
--
ALTER TABLE `ims_users_extra_templates`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_failed_login`
--
ALTER TABLE `ims_users_failed_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_username` (`ip`,`username`) USING BTREE;

--
-- 表的索引 `ims_users_founder_group`
--
ALTER TABLE `ims_users_founder_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_founder_own_create_groups`
--
ALTER TABLE `ims_users_founder_own_create_groups`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_founder_own_uni_groups`
--
ALTER TABLE `ims_users_founder_own_uni_groups`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_founder_own_users`
--
ALTER TABLE `ims_users_founder_own_users`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_founder_own_users_groups`
--
ALTER TABLE `ims_users_founder_own_users_groups`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_group`
--
ALTER TABLE `ims_users_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_invitation`
--
ALTER TABLE `ims_users_invitation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_code` (`code`) USING BTREE;

--
-- 表的索引 `ims_users_lastuse`
--
ALTER TABLE `ims_users_lastuse`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_permission`
--
ALTER TABLE `ims_users_permission`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_users_profile`
--
ALTER TABLE `ims_users_profile`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ims_video_reply`
--
ALTER TABLE `ims_video_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_voice_reply`
--
ALTER TABLE `ims_voice_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 表的索引 `ims_wechat_attachment`
--
ALTER TABLE `ims_wechat_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `media_id` (`media_id`) USING BTREE,
  ADD KEY `acid` (`acid`) USING BTREE;

--
-- 表的索引 `ims_wechat_news`
--
ALTER TABLE `ims_wechat_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `attach_id` (`attach_id`) USING BTREE;

--
-- 表的索引 `ims_wxapp_general_analysis`
--
ALTER TABLE `ims_wxapp_general_analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`) USING BTREE,
  ADD KEY `ref_date` (`ref_date`) USING BTREE;

--
-- 表的索引 `ims_wxapp_versions`
--
ALTER TABLE `ims_wxapp_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `version` (`version`) USING BTREE,
  ADD KEY `uniacid` (`uniacid`) USING BTREE;

--
-- 表的索引 `ims_wxcard_reply`
--
ALTER TABLE `ims_wxcard_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ims_account`
--
ALTER TABLE `ims_account`
  MODIFY `acid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_account_wxapp`
--
ALTER TABLE `ims_account_wxapp`
  MODIFY `acid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_activity_clerks`
--
ALTER TABLE `ims_activity_clerks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_activity_clerk_menu`
--
ALTER TABLE `ims_activity_clerk_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_article_category`
--
ALTER TABLE `ims_article_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_article_comment`
--
ALTER TABLE `ims_article_comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_article_news`
--
ALTER TABLE `ims_article_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_article_notice`
--
ALTER TABLE `ims_article_notice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_article_unread_notice`
--
ALTER TABLE `ims_article_unread_notice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_attachment_group`
--
ALTER TABLE `ims_attachment_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_basic_reply`
--
ALTER TABLE `ims_basic_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `ims_business`
--
ALTER TABLE `ims_business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_attachment`
--
ALTER TABLE `ims_core_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=792;

--
-- 使用表AUTO_INCREMENT `ims_core_cron`
--
ALTER TABLE `ims_core_cron`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_cron_record`
--
ALTER TABLE `ims_core_cron_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_job`
--
ALTER TABLE `ims_core_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `ims_core_menu`
--
ALTER TABLE `ims_core_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_core_menu_shortcut`
--
ALTER TABLE `ims_core_menu_shortcut`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_paylog`
--
ALTER TABLE `ims_core_paylog`
  MODIFY `plid` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_performance`
--
ALTER TABLE `ims_core_performance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_queue`
--
ALTER TABLE `ims_core_queue`
  MODIFY `qid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_refundlog`
--
ALTER TABLE `ims_core_refundlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_resource`
--
ALTER TABLE `ims_core_resource`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_core_sendsms_log`
--
ALTER TABLE `ims_core_sendsms_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_coupon_location`
--
ALTER TABLE `ims_coupon_location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_cover_reply`
--
ALTER TABLE `ims_cover_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `ims_custom_reply`
--
ALTER TABLE `ims_custom_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_images_reply`
--
ALTER TABLE `ims_images_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_job`
--
ALTER TABLE `ims_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_cash_record`
--
ALTER TABLE `ims_mc_cash_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_chats_record`
--
ALTER TABLE `ims_mc_chats_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_credits_recharge`
--
ALTER TABLE `ims_mc_credits_recharge`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_credits_record`
--
ALTER TABLE `ims_mc_credits_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_fans_groups`
--
ALTER TABLE `ims_mc_fans_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_fans_tag_mapping`
--
ALTER TABLE `ims_mc_fans_tag_mapping`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- 使用表AUTO_INCREMENT `ims_mc_groups`
--
ALTER TABLE `ims_mc_groups`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_mc_handsel`
--
ALTER TABLE `ims_mc_handsel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_mapping_fans`
--
ALTER TABLE `ims_mc_mapping_fans`
  MODIFY `fanid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_mapping_ucenter`
--
ALTER TABLE `ims_mc_mapping_ucenter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_mass_record`
--
ALTER TABLE `ims_mc_mass_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_members`
--
ALTER TABLE `ims_mc_members`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_member_address`
--
ALTER TABLE `ims_mc_member_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_member_fields`
--
ALTER TABLE `ims_mc_member_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_member_property`
--
ALTER TABLE `ims_mc_member_property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_mc_oauth_fans`
--
ALTER TABLE `ims_mc_oauth_fans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_menu_event`
--
ALTER TABLE `ims_menu_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_message_notice_log`
--
ALTER TABLE `ims_message_notice_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- 使用表AUTO_INCREMENT `ims_mobilenumber`
--
ALTER TABLE `ims_mobilenumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_modules`
--
ALTER TABLE `ims_modules`
  MODIFY `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `ims_modules_bindings`
--
ALTER TABLE `ims_modules_bindings`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_modules_cloud`
--
ALTER TABLE `ims_modules_cloud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_modules_ignore`
--
ALTER TABLE `ims_modules_ignore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_modules_plugin`
--
ALTER TABLE `ims_modules_plugin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_modules_plugin_rank`
--
ALTER TABLE `ims_modules_plugin_rank`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_modules_rank`
--
ALTER TABLE `ims_modules_rank`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `ims_modules_recycle`
--
ALTER TABLE `ims_modules_recycle`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- 使用表AUTO_INCREMENT `ims_music_reply`
--
ALTER TABLE `ims_music_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_news_reply`
--
ALTER TABLE `ims_news_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用表AUTO_INCREMENT `ims_phoneapp_versions`
--
ALTER TABLE `ims_phoneapp_versions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_profile_fields`
--
ALTER TABLE `ims_profile_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 使用表AUTO_INCREMENT `ims_qrcode`
--
ALTER TABLE `ims_qrcode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_qrcode_stat`
--
ALTER TABLE `ims_qrcode_stat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_robot_rule`
--
ALTER TABLE `ims_robot_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_rule`
--
ALTER TABLE `ims_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `ims_rule_keyword`
--
ALTER TABLE `ims_rule_keyword`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `ims_site_article`
--
ALTER TABLE `ims_site_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_article_comment`
--
ALTER TABLE `ims_site_article_comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_category`
--
ALTER TABLE `ims_site_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_multi`
--
ALTER TABLE `ims_site_multi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_site_nav`
--
ALTER TABLE `ims_site_nav`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_page`
--
ALTER TABLE `ims_site_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_slide`
--
ALTER TABLE `ims_site_slide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_store_cash_log`
--
ALTER TABLE `ims_site_store_cash_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_store_cash_order`
--
ALTER TABLE `ims_site_store_cash_order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_store_create_account`
--
ALTER TABLE `ims_site_store_create_account`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_store_goods`
--
ALTER TABLE `ims_site_store_goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_store_order`
--
ALTER TABLE `ims_site_store_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_styles`
--
ALTER TABLE `ims_site_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_site_styles_vars`
--
ALTER TABLE `ims_site_styles_vars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_site_templates`
--
ALTER TABLE `ims_site_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_stat_fans`
--
ALTER TABLE `ims_stat_fans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- 使用表AUTO_INCREMENT `ims_stat_keyword`
--
ALTER TABLE `ims_stat_keyword`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_stat_msg_history`
--
ALTER TABLE `ims_stat_msg_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_stat_rule`
--
ALTER TABLE `ims_stat_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_stat_visit`
--
ALTER TABLE `ims_stat_visit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- 使用表AUTO_INCREMENT `ims_stat_visit_ip`
--
ALTER TABLE `ims_stat_visit_ip`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4526;

--
-- 使用表AUTO_INCREMENT `ims_system_stat_visit`
--
ALTER TABLE `ims_system_stat_visit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_uni_account`
--
ALTER TABLE `ims_uni_account`
  MODIFY `uniacid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_uni_account_group`
--
ALTER TABLE `ims_uni_account_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_uni_account_menus`
--
ALTER TABLE `ims_uni_account_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `ims_uni_account_modules`
--
ALTER TABLE `ims_uni_account_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_uni_account_modules_shortcut`
--
ALTER TABLE `ims_uni_account_modules_shortcut`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_uni_account_users`
--
ALTER TABLE `ims_uni_account_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_uni_group`
--
ALTER TABLE `ims_uni_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `ims_uni_link_uniacid`
--
ALTER TABLE `ims_uni_link_uniacid`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_uni_modules`
--
ALTER TABLE `ims_uni_modules`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_uni_verifycode`
--
ALTER TABLE `ims_uni_verifycode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_userapi_cache`
--
ALTER TABLE `ims_userapi_cache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_userapi_reply`
--
ALTER TABLE `ims_userapi_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `ims_users`
--
ALTER TABLE `ims_users`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_users_bind`
--
ALTER TABLE `ims_users_bind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_create_group`
--
ALTER TABLE `ims_users_create_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_extra_group`
--
ALTER TABLE `ims_users_extra_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_extra_limit`
--
ALTER TABLE `ims_users_extra_limit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ims_users_extra_modules`
--
ALTER TABLE `ims_users_extra_modules`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_extra_templates`
--
ALTER TABLE `ims_users_extra_templates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_failed_login`
--
ALTER TABLE `ims_users_failed_login`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_founder_group`
--
ALTER TABLE `ims_users_founder_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_founder_own_create_groups`
--
ALTER TABLE `ims_users_founder_own_create_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_founder_own_uni_groups`
--
ALTER TABLE `ims_users_founder_own_uni_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_founder_own_users`
--
ALTER TABLE `ims_users_founder_own_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_founder_own_users_groups`
--
ALTER TABLE `ims_users_founder_own_users_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_group`
--
ALTER TABLE `ims_users_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `ims_users_invitation`
--
ALTER TABLE `ims_users_invitation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_lastuse`
--
ALTER TABLE `ims_users_lastuse`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `ims_users_permission`
--
ALTER TABLE `ims_users_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_users_profile`
--
ALTER TABLE `ims_users_profile`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `ims_video_reply`
--
ALTER TABLE `ims_video_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_voice_reply`
--
ALTER TABLE `ims_voice_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_wechat_attachment`
--
ALTER TABLE `ims_wechat_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_wechat_news`
--
ALTER TABLE `ims_wechat_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_wxapp_general_analysis`
--
ALTER TABLE `ims_wxapp_general_analysis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_wxapp_versions`
--
ALTER TABLE `ims_wxapp_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ims_wxcard_reply`
--
ALTER TABLE `ims_wxcard_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
