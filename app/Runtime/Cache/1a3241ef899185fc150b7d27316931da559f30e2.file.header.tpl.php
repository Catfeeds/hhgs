<?php /* Smarty version Smarty-3.1.6, created on 2018-01-05 20:31:28
         compiled from "/Applications/MAMP/htdocs/jianye_garden/ThemeAdmin/default/tpl/header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7409233665a38b5dbb9a292-11855364%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1a3241ef899185fc150b7d27316931da559f30e2' => 
    array (
      0 => '/Applications/MAMP/htdocs/jianye_garden/ThemeAdmin/default/tpl/header.tpl',
      1 => 1515155486,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7409233665a38b5dbb9a292-11855364',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a38b5dbc0bb9',
  'variables' => 
  array (
    'title' => 0,
    'username' => 0,
    'level' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a38b5dbc0bb9')) {function content_5a38b5dbc0bb9($_smarty_tpl) {?><!DOCTYPE html>
<html lang="zh-cn">
	<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>		

		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="<?php echo @THEMEADMIN;?>
assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="<?php echo @ORG;?>
boot/bootstrap.min.css" rel="stylesheet">		
		<link href="<?php echo @THEMEADMIN;?>
assets/css/jquery.mmenu.css" rel="stylesheet">		
		<link href="<?php echo @THEMEADMIN;?>
assets/css/font-awesome.min.css" rel="stylesheet">
	    <link href="<?php echo @THEMEADMIN;?>
assets/css/style.min.css" rel="stylesheet">	

		<!--[if !IE]><!-->
		<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
		<!--<![endif]-->
		<!--[if IE]>		
			<script src="<?php echo @ORG;?>
jquery/jquery-1.8.2.min.js"></script>
		<![endif]-->
		
	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
	<body>
		<!-- start: 顶部菜单 -->
		<div class="navbar" role="navigation">
			<div class="container-fluid">				
				<ul class="nav navbar-nav navbar-actions navbar-left">
					<li class="visible-md visible-lg"><a href="#" id="main-menu-toggle"><i class="fa fa-th-large" title='收起或展开菜单'></i></a></li>
					<li class="visible-xs visible-sm"><a href="#" id="sidebar-menu"><i class="fa fa-navicon"></i></a></li>			
				</ul>
				<!-- 顶部右侧菜单 -->
		        <ul class="nav navbar-nav navbar-right">
					<!-- <li class="dropdown visible-md visible-lg">
						 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gears"></i></a>					
						<ul class="dropdown-menu update-menu" role="menu">
							<li><a href="<?php echo @ADMIN;?>
Archive/post_new.html"><i class="fa fa-plus-square"></i> 写文章 </a>
	                        </li>
	                        <li><a href="<?php echo @ADMIN;?>
Pages/page_new.html"><i class="fa fa-plus-square"></i> 新建页面 </a>
	                        </li>
						</ul>
					</li> -->
					<li class="dropdown visible-md visible-lg">
		        		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><b class='fa fa-user' style='margin: 22px 0 0 0;width: 32px;text-align: center;color: #c8c8c8;font-size: 18px;'></b><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
</a>
		        		<ul class="dropdown-menu">
							<li class="dropdown-menu-header">
								<strong>帐号信息</strong>
							</li>						
							<li><a href="<?php echo @ADMIN;?>
User/profile.html"><i class="fa fa-user"></i> 个人信息</a></li>
							<li><a onclick="return confirm('是否退出系统?');" href="<?php echo @ADMIN;?>
?m=index&a=logout"><i class="fa fa-sign-out"></i> 退出登录</a></li>	
		        		</ul>
		      		</li>
					<li><a onclick="return confirm('是否退出系统?');" href="<?php echo @ADMIN;?>
?m=index&a=logout"><i class="fa fa-power-off"></i></a></li>
				</ul>
			</div>		
		</div>
		<!-- end: 顶部菜单 -->
		<div class="container-fluid content">
			<div class="row">					
				<!-- start: Main Menu -->
				<div class="sidebar ">
					<div class="sidebar-collapse">
						<div class="sidebar-header t-center">
	                        <span><img class="text-logo" src="<?php echo @THEMEADMIN;?>
assets/img/logo.png"></span>
	                    </div>										
						<div class="sidebar-menu">
							<ul class="nav nav-sidebar">
								<li><a href="<?php echo @ADMIN;?>
"><i class="fa fa-tachometer"></i><span class="text">  概况</span></a></li>
								<li>
									<a href="<?php echo @ADMIN;?>
Carousel/index.html"><i class="fa fa-envira"></i><span class="text"> 幻灯片管理</span></span></a>	
								</li>
								<li>
									<a href="#"><i class="fa fa-glass"></i><span class="text"> 活动管理</span> <span class="fa fa-angle-down pull-right"></span></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
Activity/index.html"><i class="fa fa-list-alt"></i><span class="text"> 活动列表</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Activity/act_new.html"><i class="fa fa-plus-square"></i><span class="text"> 新建活动</span></a></li>
									</ul>	
								</li>
								<li>
									<a href="#"><i class="fa fa-server"></i><span class="text"> 服务</span> <span class="fa fa-angle-down pull-right"></span></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
Service/slist.html"><i class="fa fa-puzzle-piece"></i><span class="text"> 服务管理</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Service/service_order.html"><i class="fa fa-paw"></i><span class="text"> 服务预约管理</span></a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-cubes"></i><span class="text"> 业主管理</span> <span class="fa fa-angle-down pull-right"></span></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
Member/index.html"><i class="fa fa-list-alt"></i><span class="text"> 注册用户列表</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Member/h_list.html"><i class="fa fa-list-alt"></i><span class="text"> 业主信息列表(导入)</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Member/h_new.html"><i class="fa fa-plus-square"></i><span class="text"> 业主信息导入</span></a></li>
									</ul>	
								</li>
								<li>
									<a href="#"><i class="fa fa-building"></i><span class="text"> 置业顾问</span> <span class="fa fa-angle-down pull-right"></span></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
Consultant/index.html"><i class="fa fa-list-alt"></i><span class="text"> 置业顾问列表</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Consultant/cnew.html"><i class="fa fa-plus-square"></i><span class="text"> 置业顾问添加</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Consultant/cons_order.html"><i class="fa fa-bell"></i><span class="text"> 预约管理</span></a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-shopping-cart"></i><span class="text"> 花园小铺</span> <span class="fa fa-angle-down pull-right"></span></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
Shop/goods.html"><i class="fa fa-puzzle-piece"></i><span class="text"> 商品管理</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Shop/order.html"><i class="fa fa-paw"></i><span class="text"> 订单管理</span></a></li>
									</ul>
								</li>
								<li><a href="<?php echo @ADMIN;?>
Award/index.html"><i class="fa fa-superpowers"></i><span class="text"> 成长值与活跃值设置</span></a></li>
								<li><a href="<?php echo @ADMIN;?>
Advice/index.html"><i class="fa  fa-bell-o"></i><span class="text"> 客户意见与建议</span></a></li>
								<li><a href="<?php echo @ADMIN;?>
Recommend/index.html"><i class="fa fa-gift"></i><span class="text"> 推荐管理</span></a></li>
								<!-- <li>
									<a href="#"><i class="fa fa-list-alt"></i><span class="text"> 内容管理</span> <span class="fa fa-angle-down pull-right"></span></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
Archive/category.html"><i class="fa fa-bars"></i><span class="text"> 分类目录</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Archive/post_list.html"><i class="fa fa-archive"></i><span class="text"> 所有文章</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Archive/post_new.html"><i class="fa fa-plus-square"></i><span class="text"> 写文章</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Archive/tags.html"><i class="fa fa-tags"></i><span class="text"> 标签</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Option/archive_set.html"><i class="fa fa-gear"></i><span class="text"> 文章设置</span></a></li>
									</ul>
								</li> -->
							
								<!-- 系统设置与用户管理只有管理员才可以操作 -->
								<?php if ($_smarty_tpl->tpl_vars['level']->value=='10'){?>
								<!-- <li>
									<a href="#"><i class="fa fa-cogs"></i><span class="text"> 系统设置</span> <span class="fa fa-angle-down pull-right"></span></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
Option/site_basic.html"><i class="fa fa-asterisk"></i><span class="text"> 基本参数</span></a></li>	
									</ul>
								</li> -->
								<li>
									<a href="#"><i class="fa fa-user"></i><span class="text"> 用户</span> <span class="fa fa-angle-down pull-right"></span></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
User/profile.html"><i class="fa fa-info-circle"></i><span class="text"> 个人信息</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
User/users.html"><i class="fa fa-users"></i><span class="text"> 用户管理</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
User/user_new.html"><i class="fa fa-user-plus"></i><span class="text"> 添加新用户</span></a></li>
									</ul>
								</li>
								<?php }?>
								<!-- <li><a href="<?php echo @ADMIN;?>
Archive/trash.html"><i class="fa fa-trash-o"></i><span class="text">  回收站</span></a></li> -->
								<?php if ($_smarty_tpl->tpl_vars['level']->value=='10'){?>
							<!-- 	<li>
									<a href="#"><i class="fa fa-folder-open-o"></i><span class="text"> 日志</span><span class="fa fa-angle-down pull-right"></a>
									<ul class="nav sub">
										<li><a href="<?php echo @ADMIN;?>
Log/arc_log.html"><i class="fa fa-sticky-note-o"></i><span class="text"> 文章</span></a></li>
										<li><a href="<?php echo @ADMIN;?>
Log/login_log.html"><i class="fa fa-sign-in"></i><span class="text"> 用户登录</span></a></li>
									</ul>
								</li> -->
								<?php }?>
							</ul>
						</div>					
					</div>
					<div class="sidebar-footer">					
						
						<div class="sidebar-brand">
							hello world
						</div>
						
						<ul class="sidebar-terms">
							<!-- <li><a href="index.html#">Terms</a></li>
							<li><a href="index.html#">Privacy</a></li>
							<li><a href="index.html#">Help</a></li>
							<li><a href="index.html#">About</a></li> -->
						</ul>
						
						<div class="copyright text-center">
							<small>poweredby <i class="fa fa-star"></i> <a href='#'>云皇科技</a></small>
						</div>					
					</div>		
				</div>
				<!-- end: Main Menu -->
		<script type="text/javascript">
			// $(window).bind('beforeunload',function(){
			// 	return '确定离开此页面吗？';
			// });
		</script><?php }} ?>