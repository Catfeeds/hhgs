-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2017-12-26 15:36:32
-- 服务器版本： 5.6.35
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jianye_garden`
--

-- --------------------------------------------------------

--
-- 表的结构 `carousel`
--

CREATE TABLE `carousel` (
  `id` int(11) NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `mark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页幻灯片';

--
-- 转存表中的数据 `carousel`
--

INSERT INTO `carousel` (`id`, `img`, `link`, `time`, `mark`) VALUES
(2, 'https://hbimg.b0.upaiyun.com/7c8cb9cd75d65415a4b944581f6a7bfc38a04dc8c81d-KvWVjs_fw658', '22', '212312', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `w_activity`
--

CREATE TABLE `w_activity` (
  `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '主键',
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
  `atime` varchar(15) NOT NULL COMMENT '活动添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

--
-- 转存表中的数据 `w_activity`
--

INSERT INTO `w_activity` (`uid`, `name`, `titleimg`, `date`, `time`, `edate`, `etime`, `address`, `limitnum`, `carrynum`, `costtype`, `cost`, `isfree`, `hexiao`, `detail`, `status`, `level`, `score`, `ls_update`, `atime`) VALUES
(00000001, '花园里活动测试数据1', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-21', '18:30', '2017-12-23', '23:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 1, 1, 1, '', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 1, 0, 0, 0, '1513688949'),
(00000002, '活动测试1', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-29', '18:30', '2017-12-29', '20:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 0, 0, 0, '1234', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 1, 1, 5, 1, '1514129346'),
(00000003, '活动测试2', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-29', '18:30', '2017-12-29', '19:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 1, 20, 1, '', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 3, 0, 0, 0, '1513928794'),
(00000004, '花园里活动测试数据', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-21', '18:30', '2017-12-22', '17:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 0, 0, 2, '', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 2, 0, 0, 0, '1513928318'),
(00000005, '花园里活动测试数据1', '2017-12-19/5a38f2436c0d3.jpg', '2017-12-29', '18:30', '2017-12-22', '16:30', '金水区国基路国家知识产权产业设计园区', 100, 1, 0, 0, 2, '', '&lt;p&gt;活动测试内容&lt;/p&gt;&lt;p&gt;虚构&lt;/p&gt;', 1, 0, 0, 0, '1513688949');

-- --------------------------------------------------------

--
-- 表的结构 `w_act_attend`
--

CREATE TABLE `w_act_attend` (
  `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '主键',
  `act_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '活动主键',
  `u_uid` int(8) UNSIGNED ZEROFILL NOT NULL COMMENT '用户主键',
  `uname` varchar(50) NOT NULL COMMENT '用户姓名',
  `phone_num` varchar(15) NOT NULL COMMENT '手机号码',
  `carry_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '携带人数',
  `is_arrival` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否签到',
  `arrival_time` varchar(20) DEFAULT NULL COMMENT '签到时间',
  `b_time` varchar(20) NOT NULL COMMENT '报名时间',
  `qrcode` varchar(200) DEFAULT NULL COMMENT '报名二维码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动参与信息';

--
-- 转存表中的数据 `w_act_attend`
--

INSERT INTO `w_act_attend` (`uid`, `act_uid`, `u_uid`, `uname`, `phone_num`, `carry_num`, `is_arrival`, `arrival_time`, `b_time`, `qrcode`) VALUES
(00000001, 00000002, 00000011, '张小超', '15698888882', 1, 1, '1513693386', '1513689001', '/20171205/1513939550.png'),
(00000002, 00000001, 00000013, '张小超', '15698888882', 1, 1, '1513693386', '1513689001', ''),
(00000033, 00000002, 00000002, '张小超', '18639932721', 0, 1, '1514020203', '1513999503', 'upload/qrcode/20171223/20171223112503932.png'),
(00000039, 00000001, 00000003, '张小超', '18639932721', 0, 0, NULL, '1514013584', 'upload/qrcode/20171223/20171223151944782.png');

-- --------------------------------------------------------

--
-- 表的结构 `w_autheninfo`
--

CREATE TABLE `w_autheninfo` (
  `uid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `phone_num` varchar(15) DEFAULT NULL,
  `area` varchar(50) NOT NULL COMMENT '地块',
  `houseinfo` varchar(200) NOT NULL COMMENT '房源信息',
  `consultant` tinyint(4) NOT NULL COMMENT '置业顾问',
  `atime` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `w_autheninfo`
--

INSERT INTO `w_autheninfo` (`uid`, `name`, `idcard`, `phone_num`, `area`, `houseinfo`, `consultant`, `atime`) VALUES
(1, '张小超', '410901199010142014', '18744483432', '桃李苑', '2号楼东单元10层东户', 3, '1514122451'),
(2, '张小超', '410901199010102123', '18744483432', '桃李苑', '2号楼东单元10层东户', 1, ''),
(3, 'zhang ', '410901199010142014', '17603879576', '瀚海晴洲', '3号楼7楼707', 3, '1514115910');

-- --------------------------------------------------------

--
-- 表的结构 `w_consultant`
--

CREATE TABLE `w_consultant` (
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `headimg` varchar(200) DEFAULT NULL COMMENT '头像信息',
  `sex` tinyint(1) NOT NULL COMMENT '性别',
  `birth` varchar(15) NOT NULL COMMENT '出生日期',
  `deal` int(11) NOT NULL DEFAULT '8' COMMENT '成交数量',
  `fans` int(11) NOT NULL DEFAULT '20' COMMENT '关注人数',
  `degree` float NOT NULL DEFAULT '5' COMMENT '星级',
  `phone_num` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '权重，权重越大排名越靠前',
  `atime` varchar(20) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='置业顾问';

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

CREATE TABLE `w_cons_comment` (
  `uid` bigint(20) NOT NULL,
  `cons_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '置业顾问id',
  `u_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID',
  `degree` tinyint(4) NOT NULL COMMENT '用户评论等级',
  `content` text COMMENT '评价内容',
  `atime` varchar(15) NOT NULL COMMENT '评论时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='置业顾问评论';

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

CREATE TABLE `w_cons_order` (
  `uid` int(11) NOT NULL COMMENT '主键',
  `cons_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '置业顾问id',
  `u_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '用户名称',
  `phone_num` varchar(15) NOT NULL COMMENT '手机号码',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '预约类型1、在线 2、现场',
  `date` varchar(15) NOT NULL COMMENT '预约日期',
  `time` varchar(10) NOT NULL COMMENT '预约时间',
  `code` varchar(10) NOT NULL COMMENT '验证码',
  `is_arrival` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否到达',
  `atime` varchar(20) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='置业顾问预约';

--
-- 转存表中的数据 `w_cons_order`
--

INSERT INTO `w_cons_order` (`uid`, `cons_uid`, `u_uid`, `name`, `phone_num`, `type`, `date`, `time`, `code`, `is_arrival`, `atime`) VALUES
(5, 00000001, 00000001, '张小超', '18639932721', 2, '2018-01-02', '15:32', '258828', 1, '1514192441'),
(6, 00000003, 00000001, '张小超', '18639932721', 1, '2018-01-21', '12:12', '116151', 0, '1514192660');

-- --------------------------------------------------------

--
-- 表的结构 `w_family`
--

CREATE TABLE `w_family` (
  `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `p_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `child_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `relation` tinyint(4) NOT NULL,
  `a_time` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家庭成员对应表';

--
-- 转存表中的数据 `w_family`
--

INSERT INTO `w_family` (`uid`, `p_uid`, `child_uid`, `relation`, `a_time`) VALUES
(00000001, 00000001, 00000002, 3, '1513238386'),
(00000002, 00000001, 00000003, 5, '1513238479'),
(00000003, 00000001, 00000004, 4, '1513238581'),
(00000004, 00000001, 00000005, 1, '1513324466'),
(00000023, 00000001, 00000025, 2, '1513344860');

-- --------------------------------------------------------

--
-- 表的结构 `w_goods`
--

CREATE TABLE `w_goods` (
  `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '主键',
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
  `atime` varchar(20) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='花园小铺商品';

--
-- 转存表中的数据 `w_goods`
--

INSERT INTO `w_goods` (`uid`, `goods_name`, `goods_num`, `goods_last`, `pay_type`, `goods_price`, `goods_img`, `goods_intro`, `goods_detail`, `goods_level`, `goods_stime`, `goods_etime`, `goods_convert`, `goods_status`, `goods_lock`, `goods_degree`, `goods_delete`, `atime`) VALUES
(00000001, '花园小铺特色糕点', 100, 55, 1, '300.00', '2017-12-26/5a41f4722cbad.jpg;', '花园小铺特色糕点1', '花园小铺特色糕点', 1, '1514274968', '', 5, 1, '2017-12-26 09:48:35', 1, 0, '1514252866'),
(00000002, '花园小铺特色糕点(特惠版)', 100, 54, 1, '200.00', '2017-12-26/5a41f7e002127.jpg;2017-12-26/5a41f7e28ef8c.jpg;', '花园小铺特色糕点', '&lt;p&gt;花园小铺特色糕点,欢迎业主品尝&lt;/p&gt;', 2, '1514274968', '1546275661', 2, 1, '2017-12-26 09:48:35', 2, 0, '1514252866'),
(00000003, '花园小铺特色糕点', 100, 54, 1, '500.00', '', '花园小铺特色糕点', '花园小铺特色糕点', 1, '1514274968', '1546275661', 1, 1, '2017-12-26 09:48:35', 1, 0, '1514252866');

-- --------------------------------------------------------

--
-- 表的结构 `w_goods_order`
--

CREATE TABLE `w_goods_order` (
  `uid` bigint(20) NOT NULL,
  `u_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '用户uid',
  `order_id` varchar(20) NOT NULL COMMENT '订单编号',
  `goods_id` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '商品id',
  `deliver_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '配送方式1、自取',
  `order_money` decimal(11,2) NOT NULL COMMENT '订单总金额',
  `order_num` int(11) NOT NULL COMMENT '订单数量',
  `pay_time` varchar(20) NOT NULL COMMENT '付款时间',
  `uname` varchar(50) NOT NULL COMMENT '客户名称',
  `phone_num` varchar(15) NOT NULL COMMENT '手机号码',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态0、未完成；1、已完成',
  `order_remarks` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `recieve_time` varchar(20) DEFAULT NULL COMMENT '收货时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='花园小铺订单';

--
-- 转存表中的数据 `w_goods_order`
--

INSERT INTO `w_goods_order` (`uid`, `u_uid`, `order_id`, `goods_id`, `deliver_type`, `order_money`, `order_num`, `pay_time`, `uname`, `phone_num`, `order_status`, `order_remarks`, `recieve_time`) VALUES
(1, 00000001, '20171226140809123', 00000001, 1, '500.00', 1, '1514274968', '张小超', '13693938208', 1, '少放辣椒', '1514278292'),
(2, 00000001, '20171226140809123', 00000001, 1, '500.00', 1, '1514274968', '张小超', '13693938208', 0, '少放辣椒', '1483203661'),
(3, 00000001, '20171226140809213', 00000001, 1, '300.00', 1, '1514298355', '张小超', '18639932721', 0, '备注信息就随便写点吧 ，方正不要太甜就好', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `w_grade`
--

CREATE TABLE `w_grade` (
  `uid` bigint(20) NOT NULL,
  `u_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '用户id',
  `level` int(11) DEFAULT '0' COMMENT '等级值',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户等级与积分';

--
-- 转存表中的数据 `w_grade`
--

INSERT INTO `w_grade` (`uid`, `u_uid`, `level`, `score`) VALUES
(1, 00000001, 370, 401),
(2, 00000002, 373, 716);

-- --------------------------------------------------------

--
-- 表的结构 `w_growth`
--

CREATE TABLE `w_growth` (
  `uid` int(11) NOT NULL,
  `u_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '用户主键',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '积分为1，等级为2',
  `of` tinyint(4) NOT NULL COMMENT '那种方式获取的积分：1完善个人；2成员添加；3签到；4活动；5订单',
  `inc_dec` tinyint(4) NOT NULL DEFAULT '1' COMMENT '积分增加或减少1+；2-',
  `number` int(11) NOT NULL COMMENT '增长数值',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分、等级成长表';

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
(78, 00000001, 1, 5, 2, 300, '2017-12-26 22:25:55');

-- --------------------------------------------------------

--
-- 表的结构 `w_logs`
--

CREATE TABLE `w_logs` (
  `ID` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `login_time` varchar(20) NOT NULL,
  `login_ip` varchar(20) NOT NULL,
  `login_referer` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(87, 1, '1514198695', '127.0.0.1', 'http://127.0.0.1/jianye_garden/admin/index/login.html');

-- --------------------------------------------------------

--
-- 表的结构 `w_members`
--

CREATE TABLE `w_members` (
  `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '唯一值',
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
  `houseinfo` varchar(200) DEFAULT NULL COMMENT '房源信息',
  `buy_reason` tinyint(4) DEFAULT '0' COMMENT '置业动机',
  `buy_times` tinyint(4) DEFAULT '0' COMMENT '置业次数',
  `car_amount` tinyint(11) DEFAULT '0' COMMENT '汽车数量',
  `car_brand` varchar(50) DEFAULT NULL COMMENT '汽车品牌',
  `is_authen` tinyint(1) DEFAULT '0' COMMENT '是否已认证为业主',
  `pro_consultant` bigint(8) DEFAULT NULL COMMENT '置业顾问',
  `degree` float NOT NULL DEFAULT '0' COMMENT '个人信息完善度',
  `rg_time` varchar(15) DEFAULT NULL COMMENT '注册时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

--
-- 转存表中的数据 `w_members`
--

INSERT INTO `w_members` (`uid`, `openid`, `uname`, `sex`, `id_card`, `birth`, `phone_num`, `marital_status`, `address`, `headimg`, `trade`, `job`, `residence`, `hobby`, `houseinfo`, `buy_reason`, `buy_times`, `car_amount`, `car_brand`, `is_authen`, `pro_consultant`, `degree`, `rg_time`) VALUES
(00000001, 'oMP-Ms85vH3sMnMlEArs-mWKpXS4', '张小超', 2, '410901199010142014', '1441123200', '18639932721', 2, '河南郑州金水区国基路国家知识产权产业园区', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMjzRiaDU5U2WVzFxibnco6DWXuCCQqkHxpxNoLE7Obm6ueajSOjFZkEawrqaAsiaucN3HnFicS53ticg/0', 1, '自由开发者', '国基路', '美剧', NULL, 1, 0, 3, '丰田', 1, 1, 0.875, '1512635242'),
(00000002, NULL, '张小小超', 2, NULL, '1526832000', '17603879576', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '1513238386'),
(00000003, NULL, '张张张', 2, NULL, '648399600', '15286919999', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '1513238479'),
(00000004, NULL, '小小静', 1, NULL, '1441123200', '17609887651', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '1513238581'),
(00000005, NULL, '父亲', 1, NULL, '30038400', '13608882122', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '1513324466'),
(00000025, NULL, '母亲', 2, NULL, '-36835200', '18766662343', 0, NULL, NULL, 4, NULL, NULL, '麻将', NULL, 0, 0, 0, NULL, 0, NULL, 0, '1513344860');

-- --------------------------------------------------------

--
-- 表的结构 `w_options`
--

CREATE TABLE `w_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) NOT NULL,
  `option_value` longtext,
  `time` varchar(50) NOT NULL,
  `describe` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `w_options`
--

INSERT INTO `w_options` (`option_id`, `option_name`, `option_value`, `time`, `describe`) VALUES
(8, 'date_format', 'hommization', '1488784567', '文章日期的显示格式'),
(10, 'basic_option', 'a:6:{s:9:\"site_name\";s:4:\"Demo\";s:8:\"keywords\";s:4:\"demo\";s:8:\"describe\";s:4:\"demo\";s:6:\"record\";s:21:\"豫ICP备123456789号\";s:9:\"copyright\";s:47:\"copyright © 2015-2017 Demo All Rights Reserved\";s:4:\"code\";s:0:\"\";}', '1491445004', '网站基础设置信息'),
(11, 'wechat_info', 'a:9:{s:5:\"name1\";s:6:\"测试\";s:5:\"name2\";s:5:\"ceshi\";s:4:\"w_id\";s:9:\"123456789\";s:6:\"w_type\";s:1:\"4\";s:7:\"w_appid\";s:9:\"123456789\";s:8:\"w_secret\";s:9:\"987654321\";s:5:\"w_api\";s:18:\"http:123456789.com\";s:7:\"w_token\";s:8:\"76890543\";s:8:\"w_aeskey\";s:19:\"yrxdEfdsf%TYdsfdfsd\";}', '1488423107', '网站基础设置信息');

-- --------------------------------------------------------

--
-- 表的结构 `w_pages`
--

CREATE TABLE `w_pages` (
  `page_id` int(10) UNSIGNED NOT NULL,
  `page_title` varchar(100) NOT NULL,
  `page_content` longtext NOT NULL,
  `page_time` varchar(50) NOT NULL COMMENT '新增时间',
  `page_author` bigint(20) DEFAULT NULL,
  `page_status` varchar(20) NOT NULL DEFAULT 'open' COMMENT '状态使人否被删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义页面';

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

CREATE TABLE `w_post` (
  `ID` bigint(20) UNSIGNED NOT NULL,
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
  `post_assist` bigint(20) DEFAULT '0' COMMENT '点赞数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='档案/文章';

-- --------------------------------------------------------

--
-- 表的结构 `w_relation`
--

CREATE TABLE `w_relation` (
  `uid` int(11) NOT NULL,
  `relation` varchar(10) DEFAULT NULL,
  `mark` varchar(100) DEFAULT NULL,
  `time` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家庭关系';

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

CREATE TABLE `w_service` (
  `uid` int(11) NOT NULL,
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
  `slock` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '乐观锁',
  `score` int(11) NOT NULL COMMENT '获得积分',
  `atime` varchar(20) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务预约';

-- --------------------------------------------------------

--
-- 表的结构 `w_service_order`
--

CREATE TABLE `w_service_order` (
  `uid` int(11) NOT NULL,
  `u_uid` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '用户编号',
  `service_uid` int(11) NOT NULL COMMENT '服务编号',
  `uname` varchar(50) NOT NULL COMMENT '用户姓名',
  `phone_num` varchar(15) NOT NULL COMMENT '电话号码',
  `order_date` varchar(20) NOT NULL COMMENT '下单预订日期',
  `order_ampm` tinyint(4) NOT NULL DEFAULT '1' COMMENT '上午或下午',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `atime` varchar(20) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `w_slnumber`
--

CREATE TABLE `w_slnumber` (
  `uid` int(11) NOT NULL,
  `lnumber` int(11) NOT NULL COMMENT '经验值',
  `snumber` int(11) NOT NULL COMMENT '积分值',
  `mark` varchar(20) NOT NULL,
  `rtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分与经验值增幅';

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

CREATE TABLE `w_term` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `term_taxonomy` varchar(20) DEFAULT NULL COMMENT '分类系统',
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL COMMENT '别名',
  `term_group` bigint(10) DEFAULT '0' COMMENT '父节点'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章/档案栏目';

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

CREATE TABLE `w_term_relationship` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL COMMENT '文章ID',
  `term_taxonomy_id` int(11) NOT NULL COMMENT 'termid',
  `tag_or_category` varchar(20) NOT NULL COMMENT '是tag还是category'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章关联表';

-- --------------------------------------------------------

--
-- 表的结构 `w_trade`
--

CREATE TABLE `w_trade` (
  `uid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mark` varchar(100) NOT NULL,
  `atime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行业信息';

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

CREATE TABLE `w_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_nickname` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_registered` varchar(20) NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0',
  `w_user_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `user_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户数据表';

--
-- 转存表中的数据 `w_users`
--

INSERT INTO `w_users` (`ID`, `user_login`, `user_pass`, `user_nickname`, `user_email`, `user_registered`, `user_status`, `w_user_level`, `user_deleted`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'admin@admin.com', '1487256416', 1, 10, 0),
(40, '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '11@11.com', '1490853725', 0, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_activity`
--
ALTER TABLE `w_activity`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_act_attend`
--
ALTER TABLE `w_act_attend`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_autheninfo`
--
ALTER TABLE `w_autheninfo`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_consultant`
--
ALTER TABLE `w_consultant`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_cons_comment`
--
ALTER TABLE `w_cons_comment`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_cons_order`
--
ALTER TABLE `w_cons_order`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_family`
--
ALTER TABLE `w_family`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_goods`
--
ALTER TABLE `w_goods`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_goods_order`
--
ALTER TABLE `w_goods_order`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_grade`
--
ALTER TABLE `w_grade`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_growth`
--
ALTER TABLE `w_growth`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_logs`
--
ALTER TABLE `w_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `w_members`
--
ALTER TABLE `w_members`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_options`
--
ALTER TABLE `w_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `w_pages`
--
ALTER TABLE `w_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `w_post`
--
ALTER TABLE `w_post`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `w_relation`
--
ALTER TABLE `w_relation`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_service`
--
ALTER TABLE `w_service`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_service_order`
--
ALTER TABLE `w_service_order`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_slnumber`
--
ALTER TABLE `w_slnumber`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_term`
--
ALTER TABLE `w_term`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `w_term_relationship`
--
ALTER TABLE `w_term_relationship`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `w_trade`
--
ALTER TABLE `w_trade`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `w_users`
--
ALTER TABLE `w_users`
  ADD PRIMARY KEY (`ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `w_activity`
--
ALTER TABLE `w_activity`
  MODIFY `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `w_act_attend`
--
ALTER TABLE `w_act_attend`
  MODIFY `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=40;
--
-- 使用表AUTO_INCREMENT `w_autheninfo`
--
ALTER TABLE `w_autheninfo`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `w_consultant`
--
ALTER TABLE `w_consultant`
  MODIFY `uid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `w_cons_comment`
--
ALTER TABLE `w_cons_comment`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `w_cons_order`
--
ALTER TABLE `w_cons_order`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `w_family`
--
ALTER TABLE `w_family`
  MODIFY `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `w_goods`
--
ALTER TABLE `w_goods`
  MODIFY `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `w_goods_order`
--
ALTER TABLE `w_goods_order`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `w_grade`
--
ALTER TABLE `w_grade`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `w_growth`
--
ALTER TABLE `w_growth`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- 使用表AUTO_INCREMENT `w_logs`
--
ALTER TABLE `w_logs`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- 使用表AUTO_INCREMENT `w_members`
--
ALTER TABLE `w_members`
  MODIFY `uid` bigint(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一值', AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `w_options`
--
ALTER TABLE `w_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `w_pages`
--
ALTER TABLE `w_pages`
  MODIFY `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `w_post`
--
ALTER TABLE `w_post`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `w_relation`
--
ALTER TABLE `w_relation`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `w_service`
--
ALTER TABLE `w_service`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `w_service_order`
--
ALTER TABLE `w_service_order`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `w_slnumber`
--
ALTER TABLE `w_slnumber`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `w_term`
--
ALTER TABLE `w_term`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `w_term_relationship`
--
ALTER TABLE `w_term_relationship`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `w_trade`
--
ALTER TABLE `w_trade`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `w_users`
--
ALTER TABLE `w_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
