-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-01-06 18:10:50
-- 服务器版本： 5.6.21-log
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jianye_garden`
--

-- --------------------------------------------------------

--
-- 表的结构 `carousel`
--

CREATE TABLE IF NOT EXISTS `carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '类型1、活动；2、商城',
  `time` varchar(20) DEFAULT NULL,
  `mark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='首页幻灯片' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `carousel`
--

INSERT INTO `carousel` (`id`, `img`, `link`, `type`, `time`, `mark`) VALUES
(2, 'upload/carousel/2018-01-04/5a4ddd8cc7dea.png', '#', 1, '1515052432', ''),
(3, 'upload/carousel/2018-01-06/5a507009c850e.jpg', '#', 2, '1515221009', '');

-- --------------------------------------------------------

--
-- 表的结构 `w_activity`
--

CREATE TABLE IF NOT EXISTS `w_activity` (
  `uid` bigint(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '活动名称',
  `titleimg` varchar(200) NOT NULL COMMENT '活缩略图片',
  `date` varchar(20) NOT NULL COMMENT '活动日期',
  `time` varchar(10) NOT NULL COMMENT '活动时间',
  `edate` varchar(20) NOT NULL COMMENT '结束日期',
  `etime` varchar(10) NOT NULL COMMENT '结束时间',
  `address` varchar(200) NOT NULL COMMENT '活动地址',
  `limitnum` int(11) NOT NULL COMMENT '总人数限制',
  `carrynum` tinyint(4) NOT NULL DEFAULT '1' COMMENT '每人可携带人数',
  `costtype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '消费类别 0、无消费，1、积分，2、微信',
  `cost` float NOT NULL COMMENT '所需花费数量',
  `isfree` tinyint(4) NOT NULL DEFAULT '1' COMMENT '报名条件1业主，2所有人',
  `hexiao` varchar(10) NOT NULL COMMENT '核销密码',
  `detail` text NOT NULL COMMENT '活动简介',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '活动状态1进行中，2，已结束，3暂停',
  `level` tinyint(4) NOT NULL COMMENT '成长值',
  `score` tinyint(4) NOT NULL COMMENT '活跃值',
  `ls_update` tinyint(4) DEFAULT '0' COMMENT '积分是否已经获取',
  `atime` varchar(15) NOT NULL COMMENT '活动添加时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='活动表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `w_activity`
--

INSERT INTO `w_activity` (`uid`, `name`, `titleimg`, `date`, `time`, `edate`, `etime`, `address`, `limitnum`, `carrynum`, `costtype`, `cost`, `isfree`, `hexiao`, `detail`, `status`, `level`, `score`, `ls_update`, `atime`) VALUES
(00000001, '花园里活动测试数据1', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-21', '18:30', '2017-12-23', '23:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 1, 1, 1, '', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 1, 0, 0, 0, '1513688949'),
(00000002, '活动测试1', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-28', '18:30', '2018-01-26', '20:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 0, 0, 2, '1234', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 1, 1, 5, 1, '1515064247'),
(00000003, '活动测试2', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-29', '18:30', '2017-12-29', '19:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 1, 20, 1, '', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 3, 0, 0, 0, '1513928794'),
(00000004, '花园里活动测试数据', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-21', '18:30', '2017-12-22', '17:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 0, 0, 2, '', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 2, 0, 0, 0, '1513928318'),
(00000005, '花园里活动测试数据1', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-29', '18:30', '2017-12-22', '16:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 0, 0, 2, '', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 1, 0, 0, 0, '1513688949'),
(00000006, '元旦活动测试', '2018-01-04/5a4e13bfe5df3.png', '2018-01-04', '18:00', '2018-01-05', '18:00', '建业花园公社', 50, 1, 1, 10, 1, '8765', '&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;最近一段时间，我们数字尾巴迎来了一年一度的「DGfesta」年度评选活动，你为自己所喜欢的数码产品投票了吗？&lt;/span&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;作为一个数码爱好者的你，相信对今年发布的产品不会陌生&lt;a href=&quot;http://www.dgtle.com/dgfesta2017.html&quot; target=&quot;_blank&quot; style=&quot;word-wrap: break-word; box-sizing: border-box; color: rgb(51, 122, 183); text-decoration-line: none; background-color: transparent;&quot;&gt;（点击这里查看今年的优秀数码产品）&lt;/a&gt;。今年发布的数码产品中，有你心心念念的「至爱」吗？&lt;/span&gt;&lt;strong style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;&gt;如果，你对一款产品心心念念，你一定会在不自觉之间喜欢上，并给它投上自己的一票。&lt;/strong&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;但我们认为，只让大家投票支持并不能够让所有人得到满足，对于一款优秀的产品，大家对它一定还有很多话想说，还有很多内容想要分享。&lt;/span&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;span style=&quot;box-sizing: border-box; word-wrap: break-word;&quot;&gt;所以这一次，我们想你来到「兴趣小组」中，为你喜爱的数码产品打 call，选出你心目中的&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; word-wrap: break-word;&quot;&gt;「年度数码」&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; word-wrap: break-word;&quot;&gt;。&lt;/span&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;如果你是一名苹果的粉丝，那么我们相信，你一定对今年的 iPhone X 有很多话想说；&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;如果你对索尼大法有信仰加成，那你一定对 α7R3 和 α9 都不会陌生；&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;还有还有，如果你是个无人机发烧友，手掌大小的晓 Spark 相信能让你心心念念；&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;span style=&quot;font-size: 12px; word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;……&lt;/span&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;span style=&quot;font-size: 12px; word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;总之，无论你心中支持哪一款数码产品，我们都鼓励大家说出来，为它打 call，用心分享的尾巴还能赢取丰富礼品。&lt;/span&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;hr class=&quot;l&quot; style=&quot;word-wrap: break-word; box-sizing: content-box; clear: both; height: 0px; margin-top: 20px; margin-bottom: 20px; border-right: none; border-bottom: none; border-left: none; border-image: initial; border-top-style: dotted; border-top-color: rgb(193, 199, 207); float: left; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(205, 205, 205); width: 860px;&quot;/&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;活动奖品&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;strong style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;&gt;最佳分享奖 1 名&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;最用心分享&lt;strong style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;&gt;「年度数码」&lt;/strong&gt;的尾巴，将获得小米降噪耳机。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;strong style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;&gt;分享鼓励奖 3 名&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180104/1515067330311643.jpg&quot; title=&quot;1515067330311643.jpg&quot; alt=&quot;1515067330311643.jpg&quot; width=&quot;300&quot; height=&quot;&quot; border=&quot;0&quot; vspace=&quot;0&quot; style=&quot;width: 300px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;阅读数、点赞数等综合排名前三的尾巴，可以获得 3life 叁活兔灯一个。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;参与方式&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;span style=&quot;font-size: 12px; word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;在「兴趣小组」中发布带有&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-size: 12px; word-wrap: break-word;&quot;&gt;「年度数码」&lt;/span&gt;&lt;span style=&quot;font-size: 12px; word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;的内容，即视为参与本次活动。为了让我们能够从瀚如星海的小组内容中将你发现，&lt;/span&gt;请参与本次活动的尾巴，在小组标题或内容中加上&lt;span style=&quot;font-size: 12px; word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;&lt;strong style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;&gt;「年度数码」。&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;strong style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250); font-size: 12px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;strong style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;&gt;&lt;span style=&quot;font-size: 12px; word-wrap: break-word; box-sizing: border-box; background-color: rgb(250, 250, 250);&quot;&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;strong style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;&gt;下面的例子，可以让你更了解本次活动的规范：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180104/1515067309174839.jpg&quot; title=&quot;1515067309174839.jpg&quot; alt=&quot;1515067309174839.jpg&quot; width=&quot;300&quot; height=&quot;&quot; border=&quot;0&quot; vspace=&quot;0&quot; style=&quot;width: 300px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;word-wrap: break-word; box-sizing: border-box;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;※ 如何进入「兴趣小组」&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, 1, 1, 0, '1515067368');

-- --------------------------------------------------------

--
-- 表的结构 `w_act_attend`
--

CREATE TABLE IF NOT EXISTS `w_act_attend` (
  `uid` bigint(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `act_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '活动主键',
  `u_uid` int(8) unsigned zerofill NOT NULL COMMENT '用户主键',
  `uname` varchar(50) NOT NULL COMMENT '用户姓名',
  `phone_num` varchar(15) NOT NULL COMMENT '手机号码',
  `carry_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '携带人数',
  `is_arrival` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否签到',
  `arrival_time` varchar(20) DEFAULT NULL COMMENT '签到时间',
  `b_time` varchar(20) NOT NULL COMMENT '报名时间',
  `qrcode` varchar(200) DEFAULT NULL COMMENT '报名二维码',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='活动参与信息' AUTO_INCREMENT=147 ;

--
-- 转存表中的数据 `w_act_attend`
--

INSERT INTO `w_act_attend` (`uid`, `act_uid`, `u_uid`, `uname`, `phone_num`, `carry_num`, `is_arrival`, `arrival_time`, `b_time`, `qrcode`) VALUES
(00000001, 00000002, 00000011, '张小超', '15698888882', 1, 1, '1513693386', '1513689001', '/20171205/1513939550.png'),
(00000002, 00000001, 00000013, '张小超', '15698888882', 1, 1, '1513693386', '1513689001', ''),
(00000033, 00000002, 00000001, '张小超', '18639932721', 1, 1, '1514020203', '1513999503', 'upload/qrcode/20171223/20171223112503932.png'),
(00000039, 00000001, 00000003, '张小超', '18639932721', 0, 0, NULL, '1514013584', 'upload/qrcode/20171223/20171223151944782.png'),
(00000146, 00000006, 00000039, '张小超', '18639932721', 1, 0, NULL, '1515140908', 'upload/qrcode/20180105/20180105162828163.png');

-- --------------------------------------------------------

--
-- 表的结构 `w_advice`
--

CREATE TABLE IF NOT EXISTS `w_advice` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `u_uid` bigint(8) unsigned zerofill NOT NULL,
  `content` text,
  `atime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户意见表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `w_advice`
--

INSERT INTO `w_advice` (`uid`, `u_uid`, `content`, `atime`) VALUES
(1, 00000001, '你小心点', '2018-01-03 11:34:32'),
(2, 00000001, '门口保安长得太丑 把我家孩子吓哭了', '2018-01-03 11:35:26'),
(3, 00000001, '门口保安还没换呢怎么', '2018-01-03 11:36:02');

-- --------------------------------------------------------

--
-- 表的结构 `w_autheninfo`
--

CREATE TABLE IF NOT EXISTS `w_autheninfo` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `birth` varchar(50) DEFAULT NULL COMMENT '生日',
  `idcard` varchar(20) DEFAULT NULL,
  `phone_num` varchar(15) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL COMMENT '地块',
  `houseinfo` varchar(200) DEFAULT NULL COMMENT '房源信息',
  `consultant` varchar(10) DEFAULT NULL COMMENT '置业顾问',
  `atime` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `w_autheninfo`
--

INSERT INTO `w_autheninfo` (`uid`, `name`, `birth`, `idcard`, `phone_num`, `area`, `houseinfo`, `consultant`, `atime`) VALUES
(1, '张小超', NULL, '410901199010142014', '18744483432', '桃李苑', '2号楼东单元10层东户', '3', '1514122451'),
(2, '张小超', NULL, '410901199010102123', '18744483432', '桃李苑', '2号楼东单元10层东户', '1', ''),
(3, 'zhang ', NULL, '410901199010142014', '17603879576', '瀚海晴洲', '3号楼7楼707', '3', '1514115910'),
(4, '张小超', NULL, '410901199010142014', '18639932721', '国基路', '瀚海晴洲', '00000001', '1515038356');

-- --------------------------------------------------------

--
-- 表的结构 `w_consultant`
--

CREATE TABLE IF NOT EXISTS `w_consultant` (
  `uid` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `headimg` varchar(200) DEFAULT NULL COMMENT '头像信息',
  `sex` tinyint(1) NOT NULL COMMENT '性别',
  `birth` varchar(15) NOT NULL COMMENT '出生日期',
  `deal` int(11) NOT NULL DEFAULT '8' COMMENT '成交数量',
  `fans` int(11) NOT NULL DEFAULT '20' COMMENT '关注人数',
  `degree` float NOT NULL DEFAULT '5' COMMENT '星级',
  `phone_num` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '权重，权重越大排名越靠前',
  `atime` varchar(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='置业顾问' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `w_consultant`
--

INSERT INTO `w_consultant` (`uid`, `name`, `headimg`, `sex`, `birth`, `deal`, `fans`, `degree`, `phone_num`, `level`, `atime`) VALUES
(00000001, '张召忠123', '2017-12-24/5a3f50a8de0bd.jpg', 1, '655737681', 8, 20, 5, '18777772332', 1, '1514100352'),
(00000003, 'ZHANG', NULL, 2, '655737681', 8, 20, 5, '18639932321', 1, '1514115466'),
(00000004, '长张晓超', NULL, 1, '655737681', 8, 20, 5, '15268320000', 1, '1514115607'),
(00000005, '长张晓超', NULL, 2, '655737681', 8, 20, 5, '17603879576', 1, '1514115645');

-- --------------------------------------------------------

--
-- 表的结构 `w_cons_comment`
--

CREATE TABLE IF NOT EXISTS `w_cons_comment` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cons_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '置业顾问id',
  `u_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '用户ID',
  `degree` tinyint(4) NOT NULL COMMENT '用户评论等级',
  `content` text COMMENT '评价内容',
  `atime` varchar(15) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='置业顾问评论' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `w_cons_comment`
--

INSERT INTO `w_cons_comment` (`uid`, `cons_uid`, `u_uid`, `degree`, `content`, `atime`) VALUES
(1, 00000002, 00000001, 2, '很不错的服务态度', ''),
(2, 00000001, 00000002, 5, '很不错的服务态度', ''),
(3, 00000001, 00000000, 3, NULL, '1514198273'),
(4, 00000001, 00000001, 3, NULL, '1514198436');

-- --------------------------------------------------------

--
-- 表的结构 `w_cons_order`
--

CREATE TABLE IF NOT EXISTS `w_cons_order` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cons_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '置业顾问id',
  `u_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '用户名称',
  `phone_num` varchar(15) NOT NULL COMMENT '手机号码',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '预约类型1、在线 2、现场',
  `date` varchar(15) NOT NULL COMMENT '预约日期',
  `time` varchar(10) NOT NULL COMMENT '预约时间',
  `code` varchar(10) NOT NULL COMMENT '验证码',
  `is_arrival` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否到达',
  `atime` varchar(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='置业顾问预约' AUTO_INCREMENT=79 ;

--
-- 转存表中的数据 `w_cons_order`
--

INSERT INTO `w_cons_order` (`uid`, `cons_uid`, `u_uid`, `name`, `phone_num`, `type`, `date`, `time`, `code`, `is_arrival`, `atime`) VALUES
(5, 00000001, 00000001, '张小超', '18639932721', 2, '2018-01-02', '15:20', '258828', 1, '1514192441'),
(6, 00000003, 00000001, '张小超', '18639932722', 1, '2018-01-21', '14:00', '116151', 1, '1514192660'),
(7, 00000001, 00000001, '张小超', '18639932721', 1, '2017-02-01', '12:03', '446633', 0, '1514429831'),
(30, 00000003, 00000001, '张小超', '18639932721', 1, '2017-01-01', '12:12', '705696', 0, '1514468348'),
(31, 00000003, 00000001, '张小超', '18639932721', 2, '', '', '728085', 0, '1514469170'),
(32, 00000003, 00000001, '张小超', '18639932721', 2, '', '', '608432', 0, '1514469184'),
(64, 00000001, 00000001, '张小超', '18639932721', 1, '2018-01-15', '12:30', '583108', 0, '1514873933'),
(65, 00000001, 00000001, '张小超', '18639932721', 1, '2018-01-03', '12:31', '960659', 0, '1514874601'),
(78, 00000001, 00000038, '测试用户张小妞', '17603879576', 2, '', '', '259742', 1, '1514881714');

-- --------------------------------------------------------

--
-- 表的结构 `w_family`
--

CREATE TABLE IF NOT EXISTS `w_family` (
  `uid` bigint(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `p_uid` bigint(8) unsigned zerofill NOT NULL,
  `child_uid` bigint(8) unsigned zerofill NOT NULL,
  `relation` tinyint(4) NOT NULL,
  `a_time` varchar(15) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='家庭成员对应表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `w_family`
--

INSERT INTO `w_family` (`uid`, `p_uid`, `child_uid`, `relation`, `a_time`) VALUES
(00000001, 00000001, 00000002, 3, '1513238386'),
(00000002, 00000001, 00000003, 5, '1514426312'),
(00000003, 00000001, 00000004, 4, '1513238581'),
(00000004, 00000001, 00000005, 1, '1513324466'),
(00000023, 00000001, 00000025, 2, '1513344860'),
(00000024, 00000001, 00000026, 3, '1514426356'),
(00000025, 00000029, 00000030, 4, '1514448860'),
(00000026, 00000031, 00000032, 7, '1514535688'),
(00000027, 00000039, 00000040, 4, '1515138109');

-- --------------------------------------------------------

--
-- 表的结构 `w_goods`
--

CREATE TABLE IF NOT EXISTS `w_goods` (
  `uid` bigint(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_num` int(11) NOT NULL COMMENT '商品库存',
  `goods_last` int(11) NOT NULL COMMENT '商品余量',
  `pay_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '兑换类型1、积分；2、微信支付',
  `goods_price` decimal(11,2) NOT NULL COMMENT '商品价格',
  `goods_img` varchar(500) NOT NULL COMMENT '商品图片',
  `goods_intro` varchar(200) DEFAULT NULL COMMENT '商品介绍',
  `goods_detail` text COMMENT '商品详情',
  `goods_level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '该商品的兑换等级',
  `goods_stime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `goods_etime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `goods_convert` tinyint(4) NOT NULL DEFAULT '1' COMMENT '兑换数量限制',
  `goods_status` tinyint(11) NOT NULL DEFAULT '1' COMMENT '物品状态1、上架；2、下架',
  `goods_lock` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '乐观锁',
  `goods_degree` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品权重',
  `goods_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否被删除',
  `atime` varchar(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='花园小铺商品' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `w_goods`
--

INSERT INTO `w_goods` (`uid`, `goods_name`, `goods_num`, `goods_last`, `pay_type`, `goods_price`, `goods_img`, `goods_intro`, `goods_detail`, `goods_level`, `goods_stime`, `goods_etime`, `goods_convert`, `goods_status`, `goods_lock`, `goods_degree`, `goods_delete`, `atime`) VALUES
(00000001, '花园小铺特色糕点', 100, 55, 1, '300.00', '2017-12-26/5a41f4722cbad.jpg;', '花园小铺特色糕点1', '花园小铺特色糕点', 1, '1514274968', '', 5, 1, '2017-12-26 09:48:35', 1, 0, '1514252866'),
(00000002, '花园小铺特色糕点(特惠版)', 100, 52, 1, '200.00', '2017-12-26/5a41f7e002127.jpg;2017-12-26/5a41f7e28ef8c.jpg;', '花园小铺特色糕点', '&lt;p&gt;花园小铺特色糕点,欢迎业主品尝&lt;/p&gt;', 2, '1514274968', '1546275661', 2, 1, '2018-01-06 16:57:12', 2, 0, '1514252866'),
(00000003, '花园小铺特色糕点', 100, 54, 1, '500.00', '', '花园小铺特色糕点', '花园小铺特色糕点', 1, '1514274968', '1546275661', 1, 1, '2017-12-26 09:48:35', 1, 0, '1514252866');

-- --------------------------------------------------------

--
-- 表的结构 `w_goods_order`
--

CREATE TABLE IF NOT EXISTS `w_goods_order` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '用户uid',
  `order_id` varchar(20) NOT NULL COMMENT '订单编号',
  `goods_id` bigint(8) unsigned zerofill NOT NULL COMMENT '商品id',
  `deliver_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '配送方式1、自取',
  `order_money` decimal(11,2) NOT NULL COMMENT '订单总金额',
  `order_num` int(11) NOT NULL COMMENT '订单数量',
  `pay_time` varchar(20) NOT NULL COMMENT '付款时间',
  `uname` varchar(50) NOT NULL COMMENT '客户名称',
  `phone_num` varchar(15) NOT NULL COMMENT '手机号码',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态0、未完成；1、已完成',
  `order_remarks` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `recieve_time` varchar(20) DEFAULT NULL COMMENT '收货时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='花园小铺订单' AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `w_goods_order`
--

INSERT INTO `w_goods_order` (`uid`, `u_uid`, `order_id`, `goods_id`, `deliver_type`, `order_money`, `order_num`, `pay_time`, `uname`, `phone_num`, `order_status`, `order_remarks`, `recieve_time`) VALUES
(1, 00000039, '20171226140809123', 00000001, 1, '500.00', 1, '1514274968', '张小超', '13693938208', 1, '少放辣椒', '1514278292'),
(2, 00000001, '20171226140809123', 00000001, 1, '500.00', 1, '1514274968', '张小超', '13693938208', 0, '少放辣椒', '1483203661'),
(3, 00000001, '20171226140809213', 00000001, 1, '300.00', 1, '1514298355', '张小超', '18639932721', 0, '备注信息就随便写点吧 ，方正不要太甜就好', NULL),
(41, 00000039, '2018010616571244', 00000002, 1, '200.00', 1, '1515229032', '张小超', '18639932721', 0, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `w_grade`
--

CREATE TABLE IF NOT EXISTS `w_grade` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '用户id',
  `level` int(11) DEFAULT '0' COMMENT '等级值',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分值',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户等级与积分' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `w_grade`
--

INSERT INTO `w_grade` (`uid`, `u_uid`, `level`, `score`) VALUES
(1, 00000001, 993, 1644),
(2, 00000002, 373, 716),
(3, 00000027, 2, 2),
(4, 00000028, 2, 2),
(5, 00000029, 89, 174),
(6, 00000031, 87, 172),
(7, 00000033, 4, 4),
(8, 00000034, 2, 2),
(9, 00000035, 2, 2),
(10, 00000038, 14, 14),
(11, 00000039, 82, 41);

-- --------------------------------------------------------

--
-- 表的结构 `w_growth`
--

CREATE TABLE IF NOT EXISTS `w_growth` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `u_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '用户主键',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '积分为1，等级为2',
  `of` tinyint(4) NOT NULL COMMENT '那种方式获取的积分：1完善个人；2成员添加；3签到；4活动；5订单,6服务',
  `inc_dec` tinyint(4) NOT NULL DEFAULT '1' COMMENT '积分增加或减少1+；2-',
  `number` int(11) NOT NULL COMMENT '增长数值',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='积分、等级成长表' AUTO_INCREMENT=243 ;

--
-- 转存表中的数据 `w_growth`
--

INSERT INTO `w_growth` (`uid`, `u_uid`, `type`, `of`, `inc_dec`, `number`, `time`) VALUES
(2, 00000001, 2, 1, 1, 5, '2017-12-15 18:40:18'),
(3, 00000001, 1, 2, 1, 10, '2017-12-15 18:40:18'),
(32, 00000001, 1, 2, 1, 5, '2017-12-15 18:41:50'),
(33, 00000001, 1, 1, 1, 10, '2017-12-15 18:41:50'),
(34, 00000001, 2, 1, 1, 5, '2017-12-15 18:44:21'),
(44, 00000001, 2, 1, 1, 5, '2017-12-15 19:56:46'),
(45, 00000001, 1, 2, 1, 10, '2017-12-15 19:56:46'),
(46, 00000001, 2, 1, 1, 10, '2017-12-15 21:15:08'),
(47, 00000001, 1, 1, 1, 20, '2017-12-15 21:15:08'),
(48, 00000001, 1, 2, 1, 10, '2017-12-15 21:25:53'),
(49, 00000001, 1, 2, 1, 20, '2017-12-15 21:25:53'),
(52, 00000001, 2, 1, 1, 55, '2017-12-15 22:33:26'),
(60, 00000001, 2, 1, 1, 50, '2017-12-15 22:36:46'),
(61, 00000001, 1, 1, 1, 100, '2017-12-15 22:36:46'),
(64, 00000001, 2, 1, 1, 5, '2017-12-15 22:44:42'),
(65, 00000001, 1, 1, 1, 10, '2017-12-15 22:44:42'),
(66, 00000001, 2, 1, 1, 5, '2017-12-15 22:48:14'),
(67, 00000001, 1, 1, 1, 10, '2017-12-15 22:48:14'),
(76, 00000001, 2, 3, 1, 2, '2017-12-16 16:07:00'),
(77, 00000001, 1, 3, 1, 2, '2017-12-16 16:07:00'),
(78, 00000001, 1, 5, 2, 300, '2017-12-26 22:25:55'),
(79, 00000001, 1, 6, 2, 100, '2017-12-27 18:46:18'),
(80, 00000001, 1, 6, 2, 100, '2017-12-27 18:50:00'),
(81, 00000001, 2, 3, 1, 2, '2017-12-28 09:33:32'),
(82, 00000001, 1, 3, 1, 2, '2017-12-28 09:33:32'),
(83, 00000001, 1, 6, 2, 100, '2017-12-28 10:48:38'),
(84, 00000027, 2, 3, 1, 2, '2017-12-28 15:31:41'),
(85, 00000027, 1, 3, 1, 2, '2017-12-28 15:31:41'),
(86, 00000028, 2, 3, 1, 2, '2017-12-28 15:34:14'),
(87, 00000028, 1, 3, 1, 2, '2017-12-28 15:34:14'),
(88, 00000029, 2, 3, 1, 2, '2017-12-28 15:43:29'),
(89, 00000029, 1, 3, 1, 2, '2017-12-28 15:43:29'),
(90, 00000029, 2, 1, 1, 75, '2017-12-28 15:44:53'),
(91, 00000029, 1, 1, 1, 150, '2017-12-28 15:44:53'),
(92, 00000029, 2, 2, 1, 10, '2017-12-28 16:14:20'),
(93, 00000029, 1, 2, 1, 20, '2017-12-28 16:14:20'),
(94, 00000031, 2, 3, 1, 2, '2017-12-29 16:03:43'),
(95, 00000031, 1, 3, 1, 2, '2017-12-29 16:03:43'),
(96, 00000031, 2, 1, 1, 75, '2017-12-29 16:11:27'),
(97, 00000031, 1, 1, 1, 150, '2017-12-29 16:11:27'),
(98, 00000031, 2, 2, 1, 10, '2017-12-29 16:21:28'),
(99, 00000031, 1, 2, 1, 20, '2017-12-29 16:21:28'),
(100, 00000033, 2, 3, 1, 2, '2017-12-29 16:50:00'),
(101, 00000033, 1, 3, 1, 2, '2017-12-29 16:50:00'),
(102, 00000034, 2, 3, 1, 2, '2017-12-29 18:04:03'),
(103, 00000034, 1, 3, 1, 2, '2017-12-29 18:04:03'),
(120, 00000001, 2, 3, 1, 2, '2018-01-03 10:44:08'),
(121, 00000001, 1, 3, 1, 2, '2018-01-03 10:44:08'),
(122, 00000038, 2, 3, 1, 2, '2018-01-03 10:45:38'),
(123, 00000038, 1, 3, 1, 2, '2018-01-03 10:45:38'),
(124, 00000001, 2, 1, 1, 8, '2018-01-03 18:31:29'),
(125, 00000001, 1, 1, 1, 116, '2018-01-03 18:31:29'),
(126, 00000001, 2, 1, 1, 4, '2018-01-03 18:31:43'),
(127, 00000001, 1, 1, 1, 9, '2018-01-03 18:31:43'),
(152, 00000001, 2, 1, 1, 37, '2018-01-03 18:41:24'),
(153, 00000001, 1, 1, 1, 74, '2018-01-03 18:41:24'),
(154, 00000001, 2, 1, 1, 474, '2018-01-03 18:56:19'),
(155, 00000001, 1, 1, 1, 948, '2018-01-03 18:56:19'),
(156, 00000001, 2, 1, 1, 39, '2018-01-03 19:01:19'),
(157, 00000001, 1, 1, 1, 178, '2018-01-03 19:01:19'),
(158, 00000001, 2, 1, 1, 47, '2018-01-03 19:03:17'),
(159, 00000001, 1, 1, 1, 94, '2018-01-03 19:03:17'),
(160, 00000001, 2, 1, 1, 4, '2018-01-03 19:03:42'),
(161, 00000001, 1, 1, 1, 109, '2018-01-03 19:03:42'),
(162, 00000039, 2, 3, 1, 2, '2018-01-03 22:41:49'),
(163, 00000039, 1, 3, 1, 2, '2018-01-03 22:41:49'),
(164, 00000039, 2, 1, 1, 9, '2018-01-04 10:53:52'),
(165, 00000039, 1, 1, 1, 19, '2018-01-04 10:53:52'),
(166, 00000039, 2, 1, 1, 5, '2018-01-04 11:49:00'),
(167, 00000039, 1, 1, 1, 10, '2018-01-04 11:49:00'),
(168, 00000039, 2, 1, 1, 29, '2018-01-04 11:49:59'),
(169, 00000039, 1, 1, 1, 59, '2018-01-04 11:49:59'),
(170, 00000039, 2, 3, 1, 2, '2018-01-04 12:07:06'),
(171, 00000039, 1, 3, 1, 2, '2018-01-04 12:07:06'),
(174, 00000039, 2, 3, 1, 2, '2018-01-05 15:32:00'),
(175, 00000039, 1, 3, 1, 2, '2018-01-05 15:32:00'),
(176, 00000038, 2, 3, 1, 2, '2018-01-05 15:34:03'),
(177, 00000038, 1, 3, 1, 2, '2018-01-05 15:34:03'),
(178, 00000039, 2, 1, 1, 4, '2018-01-05 15:38:25'),
(179, 00000039, 1, 1, 1, 9, '2018-01-05 15:38:25'),
(180, 00000039, 2, 1, 1, 5, '2018-01-05 15:39:18'),
(181, 00000039, 1, 1, 1, 10, '2018-01-05 15:39:18'),
(182, 00000039, 2, 1, 1, 4, '2018-01-05 15:40:02'),
(183, 00000039, 1, 1, 1, 9, '2018-01-05 15:40:02'),
(184, 00000039, 2, 2, 1, 10, '2018-01-05 15:41:49'),
(185, 00000039, 1, 2, 1, 20, '2018-01-05 15:41:49'),
(195, 00000039, 1, 4, 2, 10, '2018-01-05 16:15:03'),
(196, 00000039, 2, 4, 2, 0, '2018-01-05 16:28:28'),
(197, 00000039, 1, 4, 2, 10, '2018-01-05 16:28:28'),
(198, 00000039, 2, 3, 1, 2, '2018-01-06 15:05:54'),
(199, 00000039, 1, 3, 1, 2, '2018-01-06 15:05:54'),
(200, 00000039, 2, 1, 1, 4, '2018-01-06 15:41:58'),
(201, 00000039, 1, 1, 1, 109, '2018-01-06 15:41:58'),
(238, 00000039, 1, 5, 2, 200, '2018-01-06 16:54:22'),
(239, 00000039, 1, 5, 2, 200, '2018-01-06 16:57:12'),
(240, 00000033, 2, 3, 1, 2, '2018-01-06 17:28:34'),
(241, 00000033, 1, 3, 1, 2, '2018-01-06 17:28:34'),
(242, 00000039, 1, 6, 2, 100, '2018-01-06 17:29:46');

-- --------------------------------------------------------

--
-- 表的结构 `w_logs`
--

CREATE TABLE IF NOT EXISTS `w_logs` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(10) NOT NULL,
  `login_time` varchar(20) NOT NULL,
  `login_ip` varchar(20) NOT NULL,
  `login_referer` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

--
-- 转存表中的数据 `w_logs`
--

INSERT INTO `w_logs` (`ID`, `user_id`, `login_time`, `login_ip`, `login_referer`) VALUES
(1, 1, '1511754249', '127.0.0.1', 'http://127.0.0.1/demo/admin/index/login.html'),
(2, 1, '1511876108', '127.0.0.1', 'http://127.0.0.1/demo/admin/index/login.html'),
(3, 1, '1512101477', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(4, 1, '1512101536', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(5, 1, '1512101721', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(6, 1, '1512101724', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(7, 1, '1512101734', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(8, 1, '1512101736', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(9, 1, '1512101738', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(10, 1, '1512101744', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(11, 1, '1512101746', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(12, 1, '1512101758', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(13, 1, '1512101761', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(14, 1, '1512101771', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(15, 1, '1512101819', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(16, 1, '1512101840', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(17, 1, '1512101858', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(18, 1, '1512101867', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(19, 1, '1512112511', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(20, 1, '1512112514', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(21, 1, '1512112518', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(22, 1, '1512112531', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(23, 1, '1512112570', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(24, 1, '1512112572', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(25, 1, '1512112572', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(26, 1, '1512112573', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(27, 1, '1512112573', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(28, 1, '1512112583', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(29, 1, '1512112596', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(30, 1, '1512112647', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(31, 1, '1512112649', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(32, 1, '1512112668', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(33, 1, '1512112678', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(34, 1, '1512112880', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(35, 1, '1512113201', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(36, 1, '1512113231', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(37, 1, '1512113488', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(38, 1, '1512113522', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(39, 1, '1512113525', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(40, 1, '1512113534', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(41, 1, '1512113541', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(42, 1, '1512115831', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(43, 1, '1512115840', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(44, 1, '1512116037', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(45, 1, '1512116441', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(46, 1, '1512116548', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(47, 1, '1512116709', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(48, 1, '1512116717', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(49, 1, '1512123493', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(50, 1, '1512123496', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(51, 1, '1512123507', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(52, 1, '1512123725', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(53, 1, '1512123731', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(54, 1, '1512123759', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(55, 1, '1512123760', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(56, 1, '1512123769', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(57, 1, '1512123934', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(58, 1, '1512123935', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(59, 1, '1512123935', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(60, 1, '1512123963', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(61, 1, '1512123964', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(62, 1, '1512123977', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(63, 1, '1512123985', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(64, 1, '1512124162', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(65, 1, '1512124163', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(66, 1, '1512124167', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(67, 1, '1512124208', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(68, 1, '1512124210', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(69, 1, '1512124215', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(70, 1, '1512124219', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(71, 1, '1512124224', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(72, 1, '1512124228', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(73, 1, '1512124240', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(74, 1, '1512124485', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(75, 1, '1512124485', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(76, 1, '1512124492', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(77, 1, '1512125421', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(78, 1, '1512127552', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(79, 1, '1512127554', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(80, 1, '1512127558', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(81, 1, '1512127561', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(82, 1, '1512127563', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(83, 1, '1512127627', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(84, 1, '1512127629', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(85, 1, '1513666011', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(86, 1, '1514018780', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(87, 1, '1514198695', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(88, 1, '1514340195', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(89, 1, '1514355491', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(90, 1, '1514369343', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html'),
(91, 1, '1514429880', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(92, 1, '1514449900', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(93, 1, '1514858647', '219.156.124.12', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(94, 1, '1514858805', '219.156.124.12', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(95, 1, '1514859391', '219.156.124.12', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(96, 1, '1514964769', '45.55.155.187', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(97, 1, '1515038287', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(98, 1, '1515157536', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html');

-- --------------------------------------------------------

--
-- 表的结构 `w_members`
--

CREATE TABLE IF NOT EXISTS `w_members` (
  `uid` bigint(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '唯一值',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信openid',
  `uname` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `sex` tinyint(1) DEFAULT '0' COMMENT '用户性别',
  `id_card` varchar(20) DEFAULT NULL COMMENT '用户身份证',
  `birth` varchar(15) DEFAULT NULL COMMENT '用户出生日期',
  `phone_num` varchar(15) DEFAULT NULL COMMENT '用户电话号码',
  `marital_status` tinyint(1) DEFAULT '0' COMMENT '用户婚姻状态',
  `address` varchar(200) DEFAULT NULL COMMENT '用常住地',
  `headimg` varchar(200) DEFAULT NULL COMMENT '用户微信头像',
  `trade` tinyint(4) DEFAULT '0' COMMENT '行业',
  `job` varchar(50) DEFAULT NULL COMMENT '职业',
  `residence` varchar(200) DEFAULT NULL COMMENT '现居地',
  `hobby` varchar(200) DEFAULT NULL COMMENT '兴趣',
  `area` varchar(20) DEFAULT NULL COMMENT '房源区域信息',
  `houseinfo` varchar(200) DEFAULT NULL COMMENT '房源信息',
  `buy_reason` tinyint(4) DEFAULT '0' COMMENT '置业动机',
  `buy_times` tinyint(4) DEFAULT '0' COMMENT '置业次数',
  `car_amount` tinyint(11) DEFAULT '0' COMMENT '汽车数量',
  `car_brand` varchar(50) DEFAULT NULL COMMENT '汽车品牌',
  `is_authen` tinyint(1) DEFAULT '0' COMMENT '是否已认证为业主',
  `pro_consultant` bigint(8) DEFAULT NULL COMMENT '置业顾问',
  `degree` float NOT NULL DEFAULT '0' COMMENT '个人信息完善度',
  `rg_time` varchar(15) DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户基本信息表' AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `w_members`
--

INSERT INTO `w_members` (`uid`, `openid`, `uname`, `sex`, `id_card`, `birth`, `phone_num`, `marital_status`, `address`, `headimg`, `trade`, `job`, `residence`, `hobby`, `area`, `houseinfo`, `buy_reason`, `buy_times`, `car_amount`, `car_brand`, `is_authen`, `pro_consultant`, `degree`, `rg_time`) VALUES
(00000001, 'oMP-Ms85vH3sMnMlEArs-mWKpXS4', '张小超', 1, '410901199010140000', '652201200', '18639932720', 2, '金水区国基路国家知识产权产业园区', 'http://wx.qlogo.cn/mmopen/vi_32/JHmjZqrYjAxZuKnt2dhN2mBuRSvKM4dOwzwlNTHicKVVMYH1ZUANhNYfs1tvPjDnZOAO6oD3ibFicl8FxjEky61TQ/0', 1, '自由开发者', '国基路', '美剧', '英才街', '英才街花园里', 2, 1, 2, '丰田', 1, 1, 1, '1514427078'),
(00000002, 'oMP-Ms_UjMSk3nBg866OrSvoTl6A', '张', 2, NULL, '1526832000', '18603879576', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/JHmjZqrYjAxZuKnt2dhN2mBuRSvKM4dOwzwlNTHicKVVMYH1ZUANhNYfs1tvPjDnZOAO6oD3ibFicl8FxjEky61TQ/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '1514533392'),
(00000003, NULL, '张妞妞', 2, NULL, '648399600', '15286919999', 0, NULL, NULL, 7, NULL, NULL, '吃', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '1513238479'),
(00000004, NULL, '小小静', 1, NULL, '1441123200', '17609887651', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '1513238581'),
(00000005, NULL, '父亲', 1, NULL, '30038400', '13608882122', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '1513324466'),
(00000025, NULL, '母亲', 2, NULL, '-36835200', '18766662343', 0, NULL, NULL, 4, NULL, NULL, '麻将', NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1513344860'),
(00000026, NULL, '张小小', 2, NULL, '1512057600', '18711112344', 0, NULL, NULL, 13, NULL, NULL, '吃吃吃吃', NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1514426356'),
(00000027, 'oMP-MsxP79pS6GspzoelQkmIa8hU', '小黄小白', 0, NULL, NULL, '17719833263', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/FwYibQD5c3ohMkn0HPJoKcYEjRm6D6aZQI2DqY44Gq5C2NVGgAfzYaVbRr3fWbfMFjhc5rnEn0KW8JmKibfSNtQg/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1514446292'),
(00000028, 'oMP-Ms2jnEPaCORYitfd7Unj1eHY', '韩翠朋', 0, NULL, NULL, '13027603180', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erFaEibzqkrO98ZZt0sRAIRQnAPhNUX0Vib7CUiaFJR9b7OnKkLvXmEGmibRk1OKme6ejhxluz5W4iad9w/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1514446444'),
(00000029, 'oVrTx0jb76mQCjB2gYY0HSpwykak', '何亦航', 1, '410223199010090015', '655401600', '17698082789', 3, '郑州', 'http://wx.qlogo.cn/mmopen/vi_32/QHC4axLyIbQwrSMC3ytCJ0zo0gjOiciaVwHCQ4lncqCTb738skxD0seHKZ57mkcbb2FyfWTwmRRbVwM2stgJ2HZQ/0', 1, '运营', '郑州', '游戏', NULL, NULL, 1, 1, 2, '沃尔沃', 0, NULL, 0.9375, '1515146507'),
(00000030, NULL, '张大哥', 1, NULL, '1293465600', '17698082753', 0, NULL, NULL, 1, NULL, NULL, '哈哈哈', NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1514448860'),
(00000031, 'oMP-Ms4I17bC1QHNMBI-015b6M_U', '田露露', 2, '410403199605105541', '831657600', '15136962615', 3, '郑州', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epdP2EdxIolEU9FtNZ5lCkrgrrHzMvg6RlAMyaUGnTQLrqp7iaoL9od8RhibLaqeevMm2dvSbEYHG9g/0', 1, '运营', '郑州市金水区东风路街道信息学院路', '玩', NULL, NULL, 1, 2, 2, '奔驰', 1, NULL, 0.9375, '1514534619'),
(00000032, NULL, '田露', 2, NULL, '815241600', '15136962615', 0, NULL, NULL, 1, NULL, NULL, '玩', NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1514535688'),
(00000033, 'oVrTx0mdTsxQJPSStlxkKb6ujBuM', '丁莺', 0, NULL, NULL, '18539406323', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eopcEkI9VoKdrvTfwKaq54coibBaGorglW09Zicz8ibClaQbEpCicOVF53cpMrHEnSl1lRhsJeYu11q2g/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515230701'),
(00000034, 'oMP-Ms-IwhrfTKUQAlUMKdDrb6tc', '晨晨', 0, NULL, NULL, '13803714294', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIotaxIecc2cGL1A7894EQNs56fk70kRKfa9MQjVsIibExfY3ribBCdgxIhuEW4ucHXlsEZUQavJ8cg/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, 0, '1514541804'),
(00000035, 'oMP-Ms8fMkBkTVG2iuWF0WSW2kPU', '李亚昆', 0, NULL, NULL, '13939073813', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJEgefCPGLGTpxDxTohNhRIJdHs9VVxZGkbW3GcNc2kFwln4JjofQ697iaOurXfRjZNcFAxu2f0S9w/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, 0, '1514541897'),
(00000036, 'oMP-Ms7Z2gqnfCu2OMAf9AbGHT6s', '周好伟', 0, NULL, NULL, '13838064044', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKKib95icQouCNYmGkJIRYLIcsOvJdbkypUrggkFEJ5xvjZ10vug6LJZXluJLSxmC7snAy4F3ic6Uib7Q/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1514542469'),
(00000037, 'oMP-Ms7kt4qAvFKoupKHu38uj84o', '蔡文娇', 0, NULL, NULL, '17797752362', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIOJwaVqaqdH5WFc04Lp5f6UvtTmxUeQMzk26wz3prbNplibKl7IZ3zsTVEZAiav7jtCkzjiaibQeIeew/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, 0, '1514858816'),
(00000038, 'oVrTx0hbIo_ibgJUVeNyIMg6-3zY', '张', 0, '410901199010142014', NULL, '17603879576', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/6UK6uQ3flHLdSpmXtazcwV6jRPAXia86AliaaIAO4MVnJ7ShR2rt43F2rGL1uTny3arzyQPiayVIyMeg6WnJiaZrKw/0', 0, NULL, NULL, NULL, '瀚海晴洲', '3号楼7楼707', 0, 0, 0, NULL, 0, 3, 0, '1515135656'),
(00000039, 'oVrTx0vZzERNFpGbv95EeSvH3ALQ', '张小超', 1, '410901199010142014', '657302400', '18639932721', 2, '郑州', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKI9KbIia1sNIPl5vxcpueYibTrl3rcM1mEv9JeKhg82KibvGQHewE6aODx9aPq6JRaBE0k0eVTg4wVQ/0', 1, '开发者', '郑州', '美剧', '国基路', '瀚海晴洲', 1, 1, 2, '丰田', 1, 1, 1, '1514990503'),
(00000040, NULL, '小小超', 1, NULL, '1493913600', '18639937283', 0, NULL, NULL, 13, NULL, NULL, '吃', NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515138109');

-- --------------------------------------------------------

--
-- 表的结构 `w_options`
--

CREATE TABLE IF NOT EXISTS `w_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL,
  `option_value` longtext,
  `time` varchar(50) NOT NULL,
  `describe` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `w_options`
--

INSERT INTO `w_options` (`option_id`, `option_name`, `option_value`, `time`, `describe`) VALUES
(8, 'date_format', 'hommization', '1488784567', '文章日期的显示格式'),
(10, 'basic_option', 'a:6:{s:9:"site_name";s:4:"Demo";s:8:"keywords";s:4:"demo";s:8:"describe";s:4:"demo";s:6:"record";s:21:"豫ICP备123456789号";s:9:"copyright";s:47:"copyright © 2015-2017 Demo All Rights Reserved";s:4:"code";s:0:"";}', '1491445004', '网站基础设置信息'),
(11, 'wechat_info', 'a:9:{s:5:"name1";s:6:"测试";s:5:"name2";s:5:"ceshi";s:4:"w_id";s:9:"123456789";s:6:"w_type";s:1:"4";s:7:"w_appid";s:9:"123456789";s:8:"w_secret";s:9:"987654321";s:5:"w_api";s:18:"http:123456789.com";s:7:"w_token";s:8:"76890543";s:8:"w_aeskey";s:19:"yrxdEfdsf%TYdsfdfsd";}', '1488423107', '网站基础设置信息');

-- --------------------------------------------------------

--
-- 表的结构 `w_pages`
--

CREATE TABLE IF NOT EXISTS `w_pages` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(100) NOT NULL,
  `page_content` longtext NOT NULL,
  `page_time` varchar(50) NOT NULL COMMENT '新增时间',
  `page_author` bigint(20) DEFAULT NULL,
  `page_status` varchar(20) NOT NULL DEFAULT 'open' COMMENT '状态使人否被删除',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='自定义页面' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `w_pages`
--

INSERT INTO `w_pages` (`page_id`, `page_title`, `page_content`, `page_time`, `page_author`, `page_status`) VALUES
(1, '4文档', '&lt;p&gt;达到撒旦&lt;/p&gt;', '1488527648', 39, 'open'),
(2, '俄文', '&lt;p&gt;仨打算阿斯顿的大撒旦&lt;/p&gt;', '1488440942', 1, 'closed'),
(3, '&lt;p&gt;仨打算阿斯顿的&lt;/p&gt;', '&lt;p&gt;仨打算阿斯顿的&lt;/p&gt;', '1488440651', 1, 'closed'),
(4, '俄文', '&lt;p&gt;仨打算阿斯顿的&lt;/p&gt;', '1488440746', 1, 'closed'),
(5, '俄文', '&lt;p&gt;仨打算阿斯顿的&lt;/p&gt;', '1488440750', 1, 'closed'),
(6, '俄文', '&lt;p&gt;仨打算阿斯顿的&lt;/p&gt;', '1488440779', 1, 'closed'),
(7, 'bug', '&lt;p&gt;黄金卡发货快点撒甲方的卡萨&lt;/p&gt;', '1488523924', 1, 'closed'),
(8, '测试柚子', '&lt;p&gt;啊hi凤凰军事开了房间刷卡缴费考虑到撒酒疯打了卡金佛IE九分裤的房间看大家都公开复合弓尽快发货国际分工 &lt;img title=&quot;1488524166102617.png&quot; alt=&quot;QQ截图20170224143021.png&quot; src=&quot;/upload/image/20170303/1488524166102617.png&quot;/&gt;&lt;/p&gt;', '1488524203', 1, 'closed'),
(9, '大师傅', '&lt;p&gt;阿法第三方&lt;/p&gt;', '1488527204', 39, 'closed'),
(10, '讽德诵功', '&lt;p&gt;的发生股份&lt;/p&gt;', '1488527290', 39, 'open'),
(11, '关于我们', '', '1490753879', 1, 'open'),
(12, '服务与支持', '', '1490753917', 1, 'open');

-- --------------------------------------------------------

--
-- 表的结构 `w_post`
--

CREATE TABLE IF NOT EXISTS `w_post` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_parent` bigint(20) DEFAULT NULL COMMENT '修改的对应的父级ID',
  `post_author` bigint(20) NOT NULL,
  `post_date` varchar(20) NOT NULL,
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_status` varchar(20) NOT NULL COMMENT '档案状态:publish,draft,inherit(版本)',
  `comment_staus` varchar(20) NOT NULL DEFAULT 'closed' COMMENT '评论状态:open,closed',
  `post_modified` varchar(50) DEFAULT NULL COMMENT '修改时间',
  `post_type_delete` varchar(20) NOT NULL DEFAULT 'open' COMMENT '档案类型:open,closed',
  `post_describe` varchar(200) NOT NULL COMMENT '档案描述',
  `post_thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `post_seqencing` bigint(10) DEFAULT '0' COMMENT '排序',
  `post_assist` bigint(20) DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='档案/文章' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `w_recomment`
--

CREATE TABLE IF NOT EXISTS `w_recomment` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `u_uid` bigint(8) unsigned zerofill NOT NULL,
  `r_u_uid` bigint(8) unsigned zerofill NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `atime` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='推荐人列表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `w_recomment`
--

INSERT INTO `w_recomment` (`uid`, `u_uid`, `r_u_uid`, `status`, `atime`) VALUES
(1, 00000039, 00000039, 1, '1515155196'),
(2, 00000029, 00000029, 0, '1515233399');

-- --------------------------------------------------------

--
-- 表的结构 `w_relation`
--

CREATE TABLE IF NOT EXISTS `w_relation` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `relation` varchar(10) DEFAULT NULL,
  `mark` varchar(100) DEFAULT NULL,
  `time` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='家庭关系' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `w_relation`
--

INSERT INTO `w_relation` (`uid`, `relation`, `mark`, `time`) VALUES
(1, '父亲', '1', NULL),
(2, '母亲', '2', NULL),
(3, '女儿', '2', NULL),
(4, '儿子', '1', NULL),
(5, '妻子', '2', NULL),
(6, '丈夫', '1', NULL),
(7, '姐姐', '2', NULL),
(8, '妹妹', '2', NULL),
(9, '哥哥', '1', NULL),
(10, '弟弟', '1', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `w_service`
--

CREATE TABLE IF NOT EXISTS `w_service` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '服务名称',
  `img` varchar(200) NOT NULL COMMENT '服务图片',
  `intro` varchar(200) NOT NULL COMMENT '服务介绍',
  `detail` text NOT NULL COMMENT '服务详细说明',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '服务等级默认一级成员可用',
  `area` varchar(100) NOT NULL COMMENT '区域',
  `stime` varchar(20) NOT NULL COMMENT '开始时间',
  `etime` varchar(20) NOT NULL COMMENT '结束时间',
  `pay_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `cost` decimal(11,2) NOT NULL COMMENT '花费',
  `number` tinyint(4) NOT NULL DEFAULT '1' COMMENT '名额',
  `last_number` tinyint(4) NOT NULL COMMENT '剩余名额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '服务状态',
  `slock` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '乐观锁',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '获得积分',
  `atime` varchar(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='服务预约' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `w_service`
--

INSERT INTO `w_service` (`uid`, `name`, `img`, `intro`, `detail`, `level`, `area`, `stime`, `etime`, `pay_way`, `cost`, `number`, `last_number`, `status`, `slock`, `score`, `atime`) VALUES
(1, '冰箱清洗', '2017-12-27/5a435b50f0bba.png', '冰箱内部清洗', '&lt;p&gt;冰箱内部清洗，冰箱内部清洗，冰箱内部清洗冰箱内部清洗冰箱内部清洗&lt;/p&gt;', 1, '惠济区', '2017-12-12', '2018-01-12', 1, '100.00', 3, 0, 1, '2018-01-06 17:29:46', 15, '1515230908'),
(2, '厨房清洗', '2017-12-27/5a435bc6c3ba8.png', '厨房清洗', '&lt;p&gt;厨房清洗厨房清洗厨房清洗厨房清洗厨房清洗厨房清洗&lt;/p&gt;', 1, '惠济区', '2017-12-12', '2018-01-12', 1, '100.00', 1, 0, 1, '2017-12-28 10:48:38', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `w_service_order`
--

CREATE TABLE IF NOT EXISTS `w_service_order` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `u_uid` bigint(8) unsigned zerofill NOT NULL COMMENT '用户编号',
  `service_uid` int(11) NOT NULL COMMENT '服务编号',
  `uname` varchar(50) NOT NULL COMMENT '用户姓名',
  `phone_num` varchar(15) NOT NULL COMMENT '电话号码',
  `order_date` varchar(20) NOT NULL COMMENT '下单预订日期',
  `order_ampm` tinyint(4) NOT NULL DEFAULT '1' COMMENT '上午或下午',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `atime` varchar(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `w_service_order`
--

INSERT INTO `w_service_order` (`uid`, `u_uid`, `service_uid`, `uname`, `phone_num`, `order_date`, `order_ampm`, `address`, `status`, `atime`) VALUES
(1, 00000001, 1, '怂', '13693938208', '2017-12-27', 1, '国基路国家知识产权产业设计园区', 1, '1514361838'),
(2, 00000001, 1, '不怂', '13693938208', '2017-12-27', 2, '国基路国家知识产权产业设计园区', 0, '1514361838'),
(3, 00000001, 1, '张小超', '18639932721', '2017-12-23', 1, '瀚海晴洲', 0, '1514371578'),
(4, 00000001, 1, '张小超', '18639932721', '2018-01-01', 2, '国际篱笆', 0, '1514371800'),
(5, 00000001, 2, '张小超', '18639932721', '2017-01-01', 1, '英才街1024号', 0, '1514429318'),
(6, 00000039, 1, '张小超', '18639932721', '2018-01-08', 2, '啦啦', 0, '1515230986');

-- --------------------------------------------------------

--
-- 表的结构 `w_slnumber`
--

CREATE TABLE IF NOT EXISTS `w_slnumber` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `lnumber` int(11) NOT NULL COMMENT '经验值',
  `snumber` int(11) NOT NULL COMMENT '积分值',
  `mark` varchar(20) NOT NULL,
  `rtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='积分与经验值增幅' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `w_slnumber`
--

INSERT INTO `w_slnumber` (`uid`, `lnumber`, `snumber`, `mark`, `rtime`) VALUES
(1, 5, 10, '完善信息', '2017-12-15 04:15:52'),
(2, 10, 20, '添加成员', '2017-12-15 04:15:52'),
(3, 2, 2, '签到', '2017-12-15 04:15:52');

-- --------------------------------------------------------

--
-- 表的结构 `w_term`
--

CREATE TABLE IF NOT EXISTS `w_term` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_taxonomy` varchar(20) DEFAULT NULL COMMENT '分类系统',
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL COMMENT '别名',
  `term_group` bigint(10) DEFAULT '0' COMMENT '父节点',
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章/档案栏目' AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `w_term`
--

INSERT INTO `w_term` (`term_id`, `term_taxonomy`, `name`, `slug`, `term_group`) VALUES
(1, 'category', '默认分类', 'default', 0),
(8, 'nav_menu', '四级目录dsds他', '4342', 0),
(33, 'post_tag', 'xxx', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `w_term_relationship`
--

CREATE TABLE IF NOT EXISTS `w_term_relationship` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL COMMENT '文章ID',
  `term_taxonomy_id` int(11) NOT NULL COMMENT 'termid',
  `tag_or_category` varchar(20) NOT NULL COMMENT '是tag还是category',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章关联表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `w_trade`
--

CREATE TABLE IF NOT EXISTS `w_trade` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mark` varchar(100) NOT NULL,
  `atime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='行业信息' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `w_trade`
--

INSERT INTO `w_trade` (`uid`, `name`, `mark`, `atime`) VALUES
(1, '互联网', '', '2017-12-15 18:11:28'),
(2, '通信', '', '2017-12-15 18:11:28'),
(3, '房地产', '', '2017-12-15 18:11:28'),
(4, '文化传媒', '', '2017-12-15 18:11:28'),
(5, '金融', '', '2017-12-15 18:11:28'),
(6, '汽车', '', '2017-12-15 18:11:28'),
(7, '教育', '', '2017-12-15 18:11:28'),
(8, '贸易', '', '2017-12-15 18:11:28'),
(9, '医疗', '', '2017-12-15 18:11:28'),
(10, '服务业', '', '2017-12-15 18:11:28'),
(11, '政府机构', '', '2017-12-15 18:11:28'),
(12, '私营业主', '', '2017-12-15 18:11:28'),
(13, '其他行业', '', '2017-12-15 18:11:28');

-- --------------------------------------------------------

--
-- 表的结构 `w_users`
--

CREATE TABLE IF NOT EXISTS `w_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_nickname` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_registered` varchar(20) NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0',
  `w_user_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `user_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台用户数据表' AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `w_users`
--

INSERT INTO `w_users` (`ID`, `user_login`, `user_pass`, `user_nickname`, `user_email`, `user_registered`, `user_status`, `w_user_level`, `user_deleted`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'admin@admin.com', '1487256416', 1, 10, 0),
(40, '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '11@11.com', '1490853725', 0, 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
