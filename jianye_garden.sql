-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-01-19 10:49:13
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='首页幻灯片' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `carousel`
--

INSERT INTO `carousel` (`id`, `img`, `link`, `type`, `time`, `mark`) VALUES
(4, 'upload/carousel/2018-01-08/5a53496f5b33c.png', '', 1, '1515407730', ''),
(5, 'upload/carousel/2018-01-08/5a53177dc5d66.png', 'http://mp.weixin.qq.com/s/x65Oa5gj5wqBcCYKQ_cszQ', 1, '1515394987', '活动2'),
(6, 'upload/carousel/2018-01-08/5a53199c9fd0b.png', '', 2, '1515395493', '商城');

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
  `level` int(4) NOT NULL COMMENT '成长值',
  `score` int(4) NOT NULL COMMENT '活跃值',
  `ls_update` tinyint(4) DEFAULT '0' COMMENT '积分是否已经获取',
  `notice` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否短信通知未按时到达业主',
  `atime` varchar(15) NOT NULL COMMENT '活动添加时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='活动表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `w_activity`
--

INSERT INTO `w_activity` (`uid`, `name`, `titleimg`, `date`, `time`, `edate`, `etime`, `address`, `limitnum`, `carrynum`, `costtype`, `cost`, `isfree`, `hexiao`, `detail`, `status`, `level`, `score`, `ls_update`, `notice`, `atime`) VALUES
(00000001, '测试活动', '2018-01-08/5a5311f68026a.png', '2018-01-08', '01:00', '2018-01-09', '01:00', '郑州·惠济区·英才街·建业花园里', 30, 3, 1, 1, 1, '5500', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;国外圣诞节传统会在家里备上牛奶饼干，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;犒赏来送礼物的圣诞老人；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;而这支影片中的孩子就精心为&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;圣诞老人准备了这一切，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;翘首以盼圣诞老人的到来..&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180108/1515393408704637.png&quot; title=&quot;1515393408704637.png&quot; alt=&quot;11.png&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(192, 0, 0);&quot;&gt;&lt;strong&gt;活动开始时间&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;2018年1月15日&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;AM&amp;nbsp; 8：00&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(192, 0, 0);&quot;&gt;活动人群&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;所有人&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(192, 0, 0);&quot;&gt;活动地址&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color:#7f7f7f&quot;&gt;建业花园里&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;//&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;/&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;我们不见不散&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, 10, 20, 1, 0, '1515404658'),
(00000002, '春节活动', '2018-01-09/5a542243c0748.png', '2018-01-08', '11:12', '2018-01-20', '11:11', '郑州·惠济区·英才街·建业花园里', 50, 4, 1, 5, 1, '1100', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(192, 0, 0);&quot;&gt;&lt;strong&gt;活动开始时间&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;2018年1月15日&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;AM&amp;nbsp; 8：00&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(192, 0, 0);&quot;&gt;活动人群&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;所有人&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(192, 0, 0);&quot;&gt;活动地址&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;建业花园里&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;//&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;/&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; padding: 0px; list-style: none; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;我们不见不散&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180109/1515463397505222.png&quot; title=&quot;1515463397505222.png&quot; alt=&quot;默认标题_官方公众号首图_2018.01.09.png&quot;/&gt;&lt;/p&gt;', 1, 10, 20, 1, 0, '1516271271'),
(00000003, '测试', '2018-01-16/5a5d5c2b05307.png', '2018-01-16', '09:10', '2018-01-17', '10:01', '郑州·建业花园里', 30, 5, 0, 0, 2, '11110', '&lt;p style=&quot;text-align: center; line-height: 1.75em;&quot;&gt;拉开距离；酷家乐；酷家乐；酷家乐；&lt;/p&gt;&lt;p style=&quot;line-height: 1.75em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; line-height: 1.75em;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;活动时间&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; line-height: 1.75em;&quot;&gt;11月11号&lt;/p&gt;&lt;p style=&quot;line-height: 1.75em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; line-height: 1.75em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;活动地点&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; line-height: 1.75em;&quot;&gt;建业花园里&lt;/p&gt;&lt;p style=&quot;line-height: 1.75em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180116/1516068121210593.png&quot; title=&quot;1516068121210593.png&quot; alt=&quot;banner2.png&quot;/&gt;&lt;/p&gt;', 1, 10, 20, 1, 0, '1516154459'),
(00000004, '四点半课堂——神奇魔术箱 ', '2018-01-16/5a5db3e0403d5.jpg', '2018-01-16', '08:00', '2018-01-20', '17:00', '建业花园里尚书房', 15, 2, 1, 5, 2, '987654', '&lt;p style=&quot;text-align: center; line-height: 2em;&quot;&gt;本周六四点半课堂开课啦~&lt;/p&gt;&lt;p style=&quot;text-align: center; line-height: 2em;&quot;&gt;限额15人，&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; line-height: 2em;&quot;&gt;欲报从速&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-align: center;&quot;&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180116/1516091893637357.jpg&quot; title=&quot;1516091893637357.jpg&quot; alt=&quot;timg (3).jpg&quot;/&gt;&lt;/p&gt;', 2, 10, 20, 1, 0, '1516154884');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='活动参与信息' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `w_act_attend`
--

INSERT INTO `w_act_attend` (`uid`, `act_uid`, `u_uid`, `uname`, `phone_num`, `carry_num`, `is_arrival`, `arrival_time`, `b_time`, `qrcode`) VALUES
(00000001, 00000001, 00000005, '田露露', '15136962615', 1, 0, NULL, '1515393607', 'upload/qrcode/20180108/20180108144008921.png'),
(00000002, 00000001, 00000006, '旺仔', '15139683210', 0, 0, NULL, '1515394105', 'upload/qrcode/20180108/20180108144825540.png'),
(00000008, 00000001, 00000001, '张小超', '18639932721', 0, 1, '1515405526', '1515405486', 'upload/qrcode/20180108/20180108175806771.png'),
(00000009, 00000001, 00000007, '何小道', '18739974647', 2, 1, '1515463517', '1515463490', 'upload/qrcode/20180109/20180109100450491.png'),
(00000010, 00000003, 00000016, '付晨', '13803714294', 3, 1, '1516068392', '1516068333', 'upload/qrcode/20180116/20180116100534172.png'),
(00000011, 00000003, 00000017, '李亚昆', '13939073813', 1, 1, '1516068486', '1516068345', 'upload/qrcode/20180116/20180116100545822.png'),
(00000012, 00000004, 00000017, '李亚昆', '13939073813', 1, 1, '1516092554', '1516091980', 'upload/qrcode/20180116/20180116163941359.png'),
(00000013, 00000004, 00000016, '付晨', '13803714294', 2, 1, '1516095183', '1516095165', 'upload/qrcode/20180116/20180116173245439.png'),
(00000014, 00000002, 00000001, '张小超', '18639932721', 0, 0, NULL, '1516272036', 'upload/qrcode/20180118/20180118184036286.png');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户意见表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `w_advice`
--

INSERT INTO `w_advice` (`uid`, `u_uid`, `content`, `atime`) VALUES
(1, 00000005, '略略略', '2018-01-08 20:20:55');

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
(1, '何小道', NULL, '410901199010142014', '18739974647', '花园里', '花园里', '00000001', '1515414014'),
(2, '黄少辉', NULL, '410328198204110515', '13938413555', 'N3', 'N3-2-1-904', '00000001', '1516155552'),
(3, '姜静静', NULL, '410328199012180521', '18503895789', 'N3', '1号楼东单元8层中户', '00000001', '1516155924'),
(4, '姜静静', NULL, '410328199012180521', '18503895789', 'N3', 'N3-1-805', '00000001', '1516155991');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='置业顾问' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `w_consultant`
--

INSERT INTO `w_consultant` (`uid`, `name`, `headimg`, `sex`, `birth`, `deal`, `fans`, `degree`, `phone_num`, `level`, `atime`) VALUES
(00000001, '张小超', '2018-01-08/5a5354f9ca4fb.png;', 1, '644425200', 15, 34, 4, '17698082789', 1, '1515410846');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='置业顾问评论' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `w_cons_comment`
--

INSERT INTO `w_cons_comment` (`uid`, `cons_uid`, `u_uid`, `degree`, `content`, `atime`) VALUES
(6, 00000001, 00000007, 5, '长的真帅', '1515412817'),
(7, 00000001, 00000005, 3, '', '1515413207'),
(8, 00000001, 00000017, 5, '', '1516069223');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='置业顾问预约' AUTO_INCREMENT=86 ;

--
-- 转存表中的数据 `w_cons_order`
--

INSERT INTO `w_cons_order` (`uid`, `cons_uid`, `u_uid`, `name`, `phone_num`, `type`, `date`, `time`, `code`, `is_arrival`, `atime`) VALUES
(79, 00000001, 00000007, '小道', '18739974647', 1, '2018-01-09', '19:30', '254119', 1, '1515411016'),
(80, 00000001, 00000005, '田露露', '15136962615', 1, '2018-01-08', '21:42', '189272', 1, '1515411783'),
(81, 00000001, 00000001, '张小超', '18639932721', 2, '', '', '752022', 1, '1515412043'),
(82, 00000001, 00000005, '田露露', '15136962615', 1, '2018-01-08', '20:24', '879497', 0, '1515414255'),
(83, 00000001, 00000017, '李亚昆', '13939073813', 1, '2018-01-16', '14:20', '455219', 1, '1516068996'),
(84, 00000001, 00000001, '张小超', '18639932721', 1, '2018-01-20', '20:12', '485857', 1, '1516264013'),
(85, 00000001, 00000001, '张小超', '18639932721', 1, '2018-01-20', '20:12', '548850', 0, '1516325926');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='家庭成员对应表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `w_family`
--

INSERT INTO `w_family` (`uid`, `p_uid`, `child_uid`, `relation`, `a_time`) VALUES
(00000010, 00000001, 00000007, 4, '1516186844'),
(00000018, 00000001, 00000016, 8, '1516188353'),
(00000019, 00000001, 00000003, 5, '1516188353');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='花园小铺商品' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `w_goods`
--

INSERT INTO `w_goods` (`uid`, `goods_name`, `goods_num`, `goods_last`, `pay_type`, `goods_price`, `goods_img`, `goods_intro`, `goods_detail`, `goods_level`, `goods_stime`, `goods_etime`, `goods_convert`, `goods_status`, `goods_lock`, `goods_degree`, `goods_delete`, `atime`) VALUES
(00000001, '蔓越莓西饼', 100, 89, 1, '50.00', '2018-01-08/5a53315eb533b.png;2018-01-08/5a533163c457c.png;', '美国进口展艺蔓越莓的浪漫结合，真材实料，酥脆口感', '&lt;p&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180108/1515400982492579.jpeg&quot; title=&quot;1515400982492579.jpeg&quot; alt=&quot;WechatIMG384.jpeg&quot;/&gt;&lt;/p&gt;', 1, '1515372000', '1515423000', 1, 1, '2018-01-08 17:10:26', 1, 1, '1515402626'),
(00000002, '希腊可球', 100, 90, 1, '50.00', ';;2018-01-08/5a5336ead146c.png;2018-01-08/5a53370e0599f.png;2018-01-08/5a5337126c067.png;', '轻轻一口，品味曲奇和果酱的唇唇爱恋~', '&lt;style type=&quot;text/css&quot;&gt;p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; text-align: justify; font: 11.0px ''Helvetica Light''; color: #3e3e3e; -webkit-text-stroke: #3e3e3e; background-color: #feffff}\nspan.s1 {font-kerning: none}&lt;/style&gt;&lt;p class=&quot;p1&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 新西兰进口安佳黄油、柴鸡蛋、太古糖粉、麦古草莓果酱的精准配比，带来酥香口感，轻轻一口，品味曲奇和果酱的唇唇爱恋~&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot;&gt;&lt;span class=&quot;s1&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot;&gt;&lt;span class=&quot;s1&quot;&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180108/1515402880637562.jpg&quot; title=&quot;1515402880637562.jpg&quot; alt=&quot;椰蓉球3.jpg&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;售 &amp;nbsp;价：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot;&gt;&lt;span class=&quot;s1&quot;&gt;大份16元，内含独立包装20个&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot;&gt;&lt;span class=&quot;s1&quot;&gt;小份8元，内含独立包装9个&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot;&gt;&lt;strong&gt;&lt;span class=&quot;s1&quot;&gt;保质期：&lt;/span&gt;&lt;/strong&gt;&lt;span class=&quot;s1&quot;&gt;密封干燥可保质15天&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot;&gt;&lt;strong&gt;&lt;span class=&quot;s1&quot;&gt;备注：&lt;/span&gt;&lt;/strong&gt;&lt;span class=&quot;s1&quot;&gt;希腊可球一盒包含坚果、果酱两种口味。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, '1515388200', '1515489000', 1, 1, '2018-01-08 17:17:07', 1, 1, '1515403027'),
(00000003, '蔓越莓西饼', 100, 88, 1, '50.00', '2018-01-08/5a53375651cb1.png;2018-01-08/5a533760c6f47.png;2018-01-08/5a53376f693c9.png;2018-01-08/5a5337b022a6d.png;', '真材实料，酥脆口感，浓浓奶香，让你放心贴秋膘。', '&lt;p&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180108/1515403113548150.jpeg&quot; title=&quot;1515403113548150.jpeg&quot; alt=&quot;WechatIMG384.jpeg&quot;/&gt;&lt;/p&gt;', 1, '1515402900', '1517308200', 1, 1, '2018-01-16 10:24:28', 1, 0, '1516069468'),
(00000004, '手工牛轧糖', 100, 64, 1, '70.00', ';;2018-01-09/5a54263b37bf5.png;;;;', '一口，满满的幸福感。', '&lt;style type=&quot;text/css&quot;&gt;p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; text-align: justify; font: 11.0px ''Helvetica Light''; color: #3e3e3e; -webkit-text-stroke: #3e3e3e}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; text-align: justify; font: 11.0px ''Helvetica Light''; color: #3e3e3e; -webkit-text-stroke: #3e3e3e; background-color: #feffff}\nspan.s1 {font: 14.0px Helvetica; font-kerning: none; background-color: #feffff}\nspan.s2 {font-kerning: none; background-color: #feffff}\nspan.s3 {font-kerning: none}&lt;/style&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span class=&quot;s1&quot;&gt;&lt;strong&gt;&lt;img src=&quot;/jianye_garden/upload/image/20180109/1515464310531330.png&quot; title=&quot;1515464310531330.png&quot; alt=&quot;手工牛轧糖22.png&quot;/&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span class=&quot;s1&quot;&gt;&lt;strong&gt;手工牛轧糖：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;展艺无添加棉花糖、新西兰进口安佳黄油、&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;雀巢奶粉、美国进口坚果，小锅熬制，&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;时间和温度精准平衡，奶油与坚果充分融合。&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;一口，满满的幸福感。&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;&lt;span class=&quot;s2&quot;&gt;售 &amp;nbsp;价：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;大份18元，内含独立包装20颗&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;小份4元，内含独立包装4颗&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;&lt;span class=&quot;s2&quot;&gt;保质期：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;密封冷藏可保质20天&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p2&quot; style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;&lt;span class=&quot;s3&quot;&gt;备注：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p class=&quot;p2&quot; style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127);&quot;&gt;牛轧糖有蔓越莓和坚果两种口味，随机发货哟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, '1515449400', '1516243800', 1, 1, '2018-01-09 10:28:03', 1, 1, '1515464883'),
(00000005, '手工牛轧糖', 90, 38, 1, '10.00', '2018-01-09/5a542bd827533.png;;2018-01-09/5a54315a4cec5.png;2018-01-09/5a543168c94ec.png;', '一口，满满的幸福感。', '&lt;p&gt;手工牛轧糖：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;展艺无添加棉花糖、新西兰进口安佳黄油、&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;雀巢奶粉、美国进口坚果，小锅熬制，&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;时间和温度精准平衡，奶油与坚果充分融合。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;一口，满满的幸福感。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;售&amp;nbsp; 价：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;大份18元，内含独立包装20颗&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;小份4元，内含独立包装4颗&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;保质期：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;密封冷藏可保质20天&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;备注：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;牛轧糖有蔓越莓和坚果两种口味，随机发货哟&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, '1515379200', '1516156800', 1, 1, '2018-01-16 10:23:44', 1, 0, '1515467117');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='花园小铺订单' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `w_goods_order`
--

INSERT INTO `w_goods_order` (`uid`, `u_uid`, `order_id`, `goods_id`, `deliver_type`, `order_money`, `order_num`, `pay_time`, `uname`, `phone_num`, `order_status`, `order_remarks`, `recieve_time`) VALUES
(1, 00000005, '2018010820200823', 00000003, 1, '50.00', 1, '1515414008', '田露露', '15136962615', 0, '', NULL),
(2, 00000007, '2018010910085226', 00000003, 1, '50.00', 1, '1515463732', '何小道', '18739974647', 0, '多给点', NULL),
(3, 00000017, '2018011610232986', 00000005, 1, '10.00', 1, '1516069409', '李亚昆', '13939073813', 1, '', '1516158823'),
(4, 00000016, '2018011610234457', 00000005, 1, '10.00', 1, '1516069424', '付晨', '13803714294', 1, '', '1516158820');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户等级与积分' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `w_grade`
--

INSERT INTO `w_grade` (`uid`, `u_uid`, `level`, `score`) VALUES
(1, 00000001, 60, 119),
(2, 00000002, 0, 0),
(3, 00000003, 0, 100),
(4, 00000004, 0, 0),
(5, 00000005, 87, 222),
(6, 00000006, 12, 22),
(7, 00000007, 91, 181),
(8, 00000011, 42, 82),
(9, 00000012, 24, 44),
(10, 00000013, 2, 2),
(11, 00000014, 0, 0),
(12, 00000015, 0, 0),
(13, 00000016, 37, 57),
(14, 00000017, 85, 255),
(15, 00000020, 2, 2),
(16, 00000021, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='积分、等级成长表' AUTO_INCREMENT=134 ;

--
-- 转存表中的数据 `w_growth`
--

INSERT INTO `w_growth` (`uid`, `u_uid`, `type`, `of`, `inc_dec`, `number`, `time`) VALUES
(1, 00000005, 2, 3, 1, 2, '2018-01-08 14:34:40'),
(2, 00000005, 1, 3, 1, 2, '2018-01-08 14:34:40'),
(3, 00000006, 2, 3, 1, 2, '2018-01-08 14:49:45'),
(4, 00000006, 1, 3, 1, 2, '2018-01-08 14:49:45'),
(5, 00000005, 2, 1, 1, 65, '2018-01-08 17:27:57'),
(6, 00000005, 1, 1, 1, 230, '2018-01-08 17:27:57'),
(11, 00000001, 2, 4, 2, 0, '2018-01-08 17:58:06'),
(12, 00000001, 1, 4, 2, 1, '2018-01-08 17:58:06'),
(13, 00000005, 1, 4, 1, 10, '2018-01-08 17:59:09'),
(14, 00000006, 1, 4, 1, 10, '2018-01-08 17:59:09'),
(15, 00000001, 1, 4, 1, 10, '2018-01-08 17:59:09'),
(16, 00000005, 2, 4, 1, 20, '2018-01-08 17:59:09'),
(17, 00000006, 2, 4, 1, 20, '2018-01-08 17:59:09'),
(18, 00000001, 2, 4, 1, 20, '2018-01-08 17:59:09'),
(19, 00000007, 2, 3, 1, 2, '2018-01-08 19:05:55'),
(20, 00000007, 1, 3, 1, 2, '2018-01-08 19:05:55'),
(27, 00000005, 1, 5, 2, 50, '2018-01-08 20:20:08'),
(32, 00000005, 2, 2, 1, 10, '2018-01-08 20:21:43'),
(33, 00000005, 1, 2, 1, 20, '2018-01-08 20:21:43'),
(42, 00000001, 1, 6, 2, 0, '2018-01-08 20:42:11'),
(43, 00000007, 2, 3, 1, 2, '2018-01-09 10:03:55'),
(44, 00000007, 1, 3, 1, 2, '2018-01-09 10:03:55'),
(45, 00000007, 2, 1, 1, 15, '2018-01-09 10:04:09'),
(46, 00000007, 1, 1, 1, 30, '2018-01-09 10:04:09'),
(47, 00000007, 2, 4, 2, 0, '2018-01-09 10:04:50'),
(48, 00000007, 1, 4, 2, 5, '2018-01-09 10:04:50'),
(49, 00000007, 1, 6, 2, 0, '2018-01-09 10:06:46'),
(50, 00000007, 2, 1, 1, 49, '2018-01-09 10:07:58'),
(51, 00000007, 1, 1, 1, 199, '2018-01-09 10:07:58'),
(52, 00000007, 1, 5, 2, 50, '2018-01-09 10:08:52'),
(53, 00000011, 2, 3, 1, 2, '2018-01-09 10:53:38'),
(54, 00000011, 1, 3, 1, 2, '2018-01-09 10:53:38'),
(55, 00000011, 2, 1, 1, 40, '2018-01-09 10:54:57'),
(56, 00000011, 1, 1, 1, 80, '2018-01-09 10:54:57'),
(57, 00000012, 2, 3, 1, 2, '2018-01-10 17:56:01'),
(58, 00000012, 1, 3, 1, 2, '2018-01-10 17:56:01'),
(59, 00000012, 2, 1, 1, 15, '2018-01-10 17:56:27'),
(60, 00000012, 1, 1, 1, 30, '2018-01-10 17:56:27'),
(61, 00000012, 2, 1, 1, 4, '2018-01-10 17:56:41'),
(62, 00000012, 1, 1, 1, 9, '2018-01-10 17:56:41'),
(63, 00000013, 2, 3, 1, 2, '2018-01-13 15:58:33'),
(64, 00000013, 1, 3, 1, 2, '2018-01-13 15:58:33'),
(65, 00000016, 1, 4, 1, 10, '2018-01-16 10:09:07'),
(66, 00000017, 1, 4, 1, 10, '2018-01-16 10:09:07'),
(67, 00000016, 2, 4, 1, 20, '2018-01-16 10:09:07'),
(68, 00000017, 2, 4, 1, 20, '2018-01-16 10:09:07'),
(69, 00000007, 1, 6, 2, 0, '2018-01-16 10:12:29'),
(70, 00000016, 1, 6, 2, 0, '2018-01-16 10:12:45'),
(71, 00000017, 1, 6, 2, 0, '2018-01-16 10:13:11'),
(72, 00000017, 1, 5, 2, 10, '2018-01-16 10:23:29'),
(73, 00000016, 1, 5, 2, 10, '2018-01-16 10:23:44'),
(74, 00000007, 2, 3, 1, 2, '2018-01-16 10:29:47'),
(75, 00000007, 1, 3, 1, 2, '2018-01-16 10:29:47'),
(76, 00000017, 2, 1, 1, 49, '2018-01-16 10:31:22'),
(77, 00000017, 1, 1, 1, 99, '2018-01-16 10:31:22'),
(78, 00000016, 2, 1, 1, 9, '2018-01-16 10:34:02'),
(79, 00000016, 1, 1, 1, 19, '2018-01-16 10:34:02'),
(80, 00000017, 2, 1, 1, 5, '2018-01-16 10:34:28'),
(81, 00000017, 1, 1, 1, 10, '2018-01-16 10:34:28'),
(82, 00000016, 2, 1, 1, 5, '2018-01-16 10:34:35'),
(83, 00000016, 1, 1, 1, 10, '2018-01-16 10:34:35'),
(84, 00000017, 2, 1, 1, 4, '2018-01-16 10:34:42'),
(85, 00000017, 1, 1, 1, 9, '2018-01-16 10:34:42'),
(86, 00000017, 2, 1, 1, 4, '2018-01-16 10:35:11'),
(87, 00000017, 1, 1, 1, 109, '2018-01-16 10:35:11'),
(90, 00000007, 2, 2, 1, 10, '2018-01-16 10:37:16'),
(91, 00000007, 1, 2, 1, 20, '2018-01-16 10:37:16'),
(92, 00000016, 2, 3, 1, 2, '2018-01-16 10:47:01'),
(93, 00000016, 1, 3, 1, 2, '2018-01-16 10:47:01'),
(94, 00000007, 1, 4, 1, 10, '2018-01-16 10:56:54'),
(95, 00000007, 2, 4, 1, -20, '2018-01-16 10:56:54'),
(96, 00000017, 2, 4, 2, 0, '2018-01-16 16:39:40'),
(97, 00000017, 1, 4, 2, 5, '2018-01-16 16:39:41'),
(98, 00000016, 2, 4, 2, 0, '2018-01-16 17:32:45'),
(99, 00000016, 1, 4, 2, 5, '2018-01-16 17:32:45'),
(100, 00000017, 1, 4, 1, 10, '2018-01-16 17:33:24'),
(101, 00000016, 1, 4, 1, 10, '2018-01-16 17:33:24'),
(102, 00000017, 2, 4, 1, 20, '2018-01-16 17:33:24'),
(103, 00000016, 2, 4, 1, 20, '2018-01-16 17:33:24'),
(104, 00000012, 2, 3, 1, 2, '2018-01-16 21:47:11'),
(105, 00000012, 1, 3, 1, 2, '2018-01-16 21:47:11'),
(106, 00000020, 2, 3, 1, 2, '2018-01-17 10:21:52'),
(107, 00000020, 1, 3, 1, 2, '2018-01-17 10:21:52'),
(116, 00000001, 2, 2, 1, 10, '2018-01-17 19:00:44'),
(117, 00000001, 1, 2, 1, 20, '2018-01-17 19:00:44'),
(118, 00000001, 2, 2, 1, 10, '2018-01-17 19:01:25'),
(119, 00000001, 1, 2, 1, 20, '2018-01-17 19:01:25'),
(120, 00000001, 2, 2, 1, 10, '2018-01-17 19:02:38'),
(121, 00000001, 1, 2, 1, 20, '2018-01-17 19:02:38'),
(122, 00000001, 2, 2, 1, 10, '2018-01-17 19:03:51'),
(123, 00000001, 1, 2, 1, 20, '2018-01-17 19:03:51'),
(124, 00000001, 2, 2, 1, 10, '2018-01-17 19:05:07'),
(125, 00000001, 1, 2, 1, 20, '2018-01-17 19:05:07'),
(126, 00000001, 1, 6, 2, 0, '2018-01-18 16:14:49'),
(127, 00000001, 1, 6, 2, 0, '2018-01-18 16:20:50'),
(128, 00000001, 2, 4, 2, 0, '2018-01-18 18:40:36'),
(129, 00000001, 1, 4, 2, 5, '2018-01-18 18:40:36'),
(130, 00000001, 1, 6, 2, 0, '2018-01-18 19:55:35'),
(131, 00000001, 1, 6, 2, 0, '2018-01-18 19:56:02'),
(132, 00000001, 1, 6, 2, 0, '2018-01-19 09:31:04'),
(133, 00000001, 1, 6, 2, 0, '2018-01-19 09:35:19');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `w_logs`
--

INSERT INTO `w_logs` (`ID`, `user_id`, `login_time`, `login_ip`, `login_referer`) VALUES
(1, 1, '1515233789', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(2, 1, '1515234595', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(3, 1, '1515400408', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(4, 1, '1516066281', '61.158.149.97', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(5, 1, '1516067445', '61.158.149.97', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(6, 1, '1516086597', '125.47.59.73', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(7, 1, '1516087574', '125.47.59.73', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(8, 2, '1516091604', '61.52.60.1', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(9, 1, '1516091608', '117.136.44.169', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(10, 1, '1516154661', '219.156.119.194', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(11, 1, '1516154672', '219.156.119.194', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(12, 1, '1516177236', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html'),
(13, 1, '1516271224', '117.158.25.204', 'http://api.yunhuangtech.com/jianye_garden/admin/index/login.html');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户基本信息表' AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `w_members`
--

INSERT INTO `w_members` (`uid`, `openid`, `uname`, `sex`, `id_card`, `birth`, `phone_num`, `marital_status`, `address`, `headimg`, `trade`, `job`, `residence`, `hobby`, `area`, `houseinfo`, `buy_reason`, `buy_times`, `car_amount`, `car_brand`, `is_authen`, `pro_consultant`, `degree`, `rg_time`) VALUES
(00000001, 'oVrTx0vZzERNFpGbv95EeSvH3ALQ', '张小超', 0, NULL, NULL, '18639932721', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKI9KbIia1sNIPl5vxcpueYibTrl3rcM1mEv9JeKhg82KibvGQHewE6aODx9aPq6JRaBE0k0eVTg4wVQ/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, 1, 0, '1515234684'),
(00000002, 'oVrTx0kYvPq0tf5DInKLJZH586bE', '测试', 0, NULL, NULL, '17719833263', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/qFxAVfzXmkgvR3ltzqyUt6hEIoneJ6SMOhFkad4BNxgaYI963xjXo4dvQABc6rEuCibUeNiaMv4QaUYR4wniaNdnQ/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515234844'),
(00000003, 'oVrTx0hbIo_ibgJUVeNyIMg6-3zY', '张小妞', 0, NULL, NULL, '17603879570', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/6UK6uQ3flHLdSpmXtazcwV6jRPAXia86AliaaIAO4MVnJ7ShR2rt43F2rGL1uTny3arzyQPiayVIyMeg6WnJiaZrKw/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515235718'),
(00000004, 'oVrTx0s0Icw7iCAiXLvQICE0meOQ', '韩占俊', 0, NULL, NULL, '13323852307', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epBxUKEajmrvOhppDZDpQ5TfYSULpQXv0JPibxjicCFWAIBXTUHtdZ7rqic50qopK1YKltpnrib4ZuEjQ/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515293310'),
(00000005, 'oVrTx0hsLA40t-tmk2MSq7Tq9bGQ', '田露露', 2, NULL, '831657600', '15136962615', 3, '郑州', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er4NbjuCLTHQyFbK41Woxa5IuWwhfTMmvNCZBUUkXF1Oq9tcicQyAV17fFfhfECY9xqL1ldpse86xQ/0', 1, '运营', '郑州', '游泳', NULL, NULL, 1, 1, 2, '法拉利', 1, 1, 1, '1515393275'),
(00000006, 'oVrTx0ga9LgiM1afmHTKf9aLg7ck', '旺仔', 0, NULL, NULL, '15139683210', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLElNvY31Iic1ma14vI5Zrf6c35gDVSdADZ1icMLwWJ3JzUwUMFpcqf4uCibvaDDsnAHdQ1FnaqvYIXA/0', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515393608'),
(00000007, 'oVrTx0te2CIOh34sSYEtr2CCKUG8', '何小道', 1, '410901199010142014', '789580800', '18739974647', 1, '郑州', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL8BkamqsibpiadDPibwdicGicEKibiaASU40BLmxPpgDdH67ksn3lKQEcicsDibbg3HSPaEPSl9WqRN9dwIMQ/0', 1, '运营', '郑州', '网球', '花园里', '花园里', 1, 1, 2, '奔驰', 1, 1, 1, '1515393973'),
(00000010, NULL, '懒懒', 2, NULL, '1515340800', '15136962615', 0, NULL, NULL, 1, NULL, NULL, '我', NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515414103'),
(00000011, 'oVrTx0mlOOgtO9Pw1i9SzWLNg3VQ', '马志远', 1, NULL, '728236800', '13140162660', 1, '', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI51N7wTQbWdMGTtcSQ2LVicGZ2cZWlO70Ynw4ia3SpYcnRE5QeUsoic2YKJ6TsO38qZu02ItLTqSUxA/0', 3, '', '', '', NULL, NULL, 1, 1, 1, '', 0, NULL, 0.6154, '1515466415'),
(00000012, 'oVrTx0jVmPjZrUV9vbtEeO9470T0', '赵剑锋', 1, NULL, '', '15093219133', 4, '', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkdO1WNvwG6ZYdCErp0dtWWYW760z8soLnfxvNmILuRa97mrQSicLKGmQEsATKhH8H7EhYUl7Y0jA/132', 7, '', '', '', NULL, NULL, 0, 0, 0, '', 0, NULL, 0.3077, '1515578131'),
(00000013, 'oVrTx0ud5YQT6Rgqarxx-0wIN4CM', '梁妙茹', 0, NULL, NULL, '15890119720', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLZn90QEWTkWS8xDeCq9DQ9pCBN4edd2k2IfORq3CbTD719MlNraOIbVlXZMrdRpRSicxqm1ibbS2QQ/132', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515830309'),
(00000014, 'oVrTx0o_5Iv91dFw3y3IdAcG-IOc', '文玉杰', 0, NULL, NULL, '18603869790', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL82pibB8LV0u4AcIHAZ8qw6MlMR68PStn0fPDwn7a7yfsaenKU5W6G44td6hCTvPGQAEOd3tBECqg/132', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515858300'),
(00000015, 'oVrTx0rkevdOgVMIdz2ctiJDKQzc', '董晗', 0, NULL, NULL, '18537137707', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq0Glq8TfPA5OzI9RaOibSgsMnxcffMe4TbMLB9nSQ4XPVPklVk1oEricLJaAJqQpcaKm5xmeam5hkw/132', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1515988820'),
(00000016, 'oVrTx0s5aVbcwxQdx5EjnGaPD9uA', '付晨', 2, NULL, '659894400', '13803714294', 0, '', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKQBriamgROaBsJmFonoFkjkZHSqRfFUticaZ5kNIrZCZBxqgyVME7zNnRfqUDTnIZYxAgFXicc7UFxQ/132', 4, '', '', 'cccc', NULL, NULL, 0, 0, 0, '', 0, NULL, 0.2308, '1516068317'),
(00000017, 'oVrTx0v6MOnOUupthTgw0eWSAXZU', '李亚昆', 2, NULL, '768412800', '13939073813', 1, '花园里', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIvUlPIIteoHGWSPeOgj5oCodFPBTh9VOm8WIYSvT4YOXvQfooXdgPuyoIsV06tjue2zca9ic3S5Dw/132', 3, '文案', '花园里', '看电影', NULL, NULL, 2, 1, 1, '无', 0, 1, 1, '1516068329'),
(00000020, 'oVrTx0mw-mbrZlcS4c-7l3pAe1EI', '黄少辉', 0, NULL, NULL, '13938413555', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiaeSUwYxkOFQsib3eXWDrfDqG7ibk8iaZibxpSyCJ4KKzYZriaOxQYA3TJeQQzGnib5Wv7XCCc9Q5ibX70Q/132', 0, NULL, NULL, NULL, 'N3', 'N3-2-1-904', 0, 0, 0, NULL, 1, 1, 0, '1516155702'),
(00000021, 'oVrTx0nuldHYGOCi8C3pJvIz4gHo', '乔大哥', 0, NULL, NULL, '13783512633', 0, NULL, 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKmlxnltsoGCAOLNVQUeiaDEwljKISL1244OR1V3oDsymC63z9icNsCmrHadxMegYXIZA1UA46CTu9w/132', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '1516260726');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='推荐人列表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `w_recomment`
--

INSERT INTO `w_recomment` (`uid`, `u_uid`, `r_u_uid`, `status`, `atime`) VALUES
(1, 00000016, 00000000, 0, '1516070694'),
(2, 00000016, 00000000, 0, '1516070706'),
(3, 00000016, 00000007, 0, '1516070727');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='服务预约' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `w_service`
--

INSERT INTO `w_service` (`uid`, `name`, `img`, `intro`, `detail`, `level`, `area`, `stime`, `etime`, `pay_way`, `cost`, `number`, `last_number`, `status`, `slock`, `score`, `atime`) VALUES
(3, '空调清洗', '2018-01-08/5a532d12cca97.png', '空调机的维护、空调保养', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &lt;/span&gt;&lt;span style=&quot;color: rgb(127, 127, 127); font-size: 12px;&quot;&gt;空调清洗是空调机的维护、空调保养的主要关键，有利于提高制冷效果，有利缩短降温时间，有利空调节能，有利延长空调机使用寿命，是合理使用空调，加强规范管理的重要组成部分。&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(127, 127, 127); font-size: 12px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;span style=&quot;font-family: arial, 宋体, sans-serif; text-indent: 28px; background-color: rgb(255, 255, 255); font-size: 12px; color: rgb(127, 127, 127);&quot;&gt;每年在换季的时节空调首次开机前都应该进行彻底的清洁与消毒，但是在空调使用频繁月份如夏季，由于人们可能会长时间待在空调房内，室内空气质量直接影响着我们的健康，所以需要定期对空调进行清洁。简单的方法便是对空调每月消毒1次。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;', 1, '金水区', '2018-01-07', '2018-01-31', 1, '0.00', 5, 4, 1, '2018-01-16 10:13:11', 2, '1515400602'),
(4, '冰箱清洗', '2018-01-16/5a5d5f357ce51.png', '每隔一段时间清洗冰箱是必要的,很多人随便找个清洁工就清理了。', '', 1, '金水区', '2018-01-16', '2018-01-31', 1, '0.00', 5, 3, 1, '2018-01-19 09:35:19', 10, '1516068850');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `w_service_order`
--

INSERT INTO `w_service_order` (`uid`, `u_uid`, `service_uid`, `uname`, `phone_num`, `order_date`, `order_ampm`, `address`, `status`, `atime`) VALUES
(23, 00000001, 3, '张小超', '18639932721', '2018-01-01', 1, '撒', 0, '1515415331'),
(24, 00000007, 3, '何小道', '18739974647', '2018-01-11', 1, '金水区', 0, '1515463606'),
(25, 00000007, 3, '何小道', '18739974647', '2018-01-16', 1, '国基路', 0, '1516068749'),
(26, 00000016, 3, '付晨', '13803714294', '2018-01-12', 1, '回来的歌', 0, '1516068765'),
(27, 00000017, 3, '李亚昆', '13939073813', '2018-01-16', 2, '花园里', 1, '1516068791'),
(33, 00000001, 4, '张小超', '18639932721', '2018-01-20', 1, '家', 0, '1516325719');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台用户数据表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `w_users`
--

INSERT INTO `w_users` (`ID`, `user_login`, `user_pass`, `user_nickname`, `user_email`, `user_registered`, `user_status`, `w_user_level`, `user_deleted`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'admin@admin.com', '1487256416', 1, 10, 0),
(2, '001', 'e10adc3949ba59abbe56e057f20f883e', '王佳', '438214609@qq.com', '1516089864', 1, 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
