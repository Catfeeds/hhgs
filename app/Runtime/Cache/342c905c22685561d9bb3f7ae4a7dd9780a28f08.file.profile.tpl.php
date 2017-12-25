<?php /* Smarty version Smarty-3.1.6, created on 2017-12-19 10:38:48
         compiled from "./Theme/default/Member/profile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8678080145a2e372b8f2ff8-80406101%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '342c905c22685561d9bb3f7ae4a7dd9780a28f08' => 
    array (
      0 => './Theme/default/Member/profile.tpl',
      1 => 1513650237,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8678080145a2e372b8f2ff8-80406101',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a2e372b9641a',
  'variables' => 
  array (
    'info' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a2e372b9641a')) {function content_5a2e372b9641a($_smarty_tpl) {?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>个人中心</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Member/css/profile.css">
</head>
<body>
	<div class='container'>
		<!-- 个人信息 -->
		<div class='header'>
			<div class='headimg'>
				<img src="<?php echo $_smarty_tpl->tpl_vars['info']->value['headimg'];?>
">
				<p class="vip"><img src="<?php echo @THEME;?>
Member/img/vip.png"></p>
			</div>
			<div class='info'>
				<p class='iname'><?php echo $_smarty_tpl->tpl_vars['info']->value['uname'];?>
</p>
				<p class='iauthen'><?php if ($_smarty_tpl->tpl_vars['info']->value['is_authen']==1){?>花园里认证业主<?php }else{ ?>业主未认证<?php }?></p>
			</div>
			<div id='clock_in' class='clockin'>
				<img src="<?php echo @THEME;?>
Member/img/clockin.png">
			</div>
		</div>
		<!-- 等级信息 -->
		<div class='levelgrounp'>
			<div class='l-item'>
				<p class='p-info'><?php if ($_smarty_tpl->tpl_vars['info']->value['score']==null){?>0<?php }else{ ?> <?php echo $_smarty_tpl->tpl_vars['info']->value['score'];?>
<?php }?></p>
				<p class='p-label'>活跃值</p>
			</div>
			<div class='l-item'>
				<p class='p-info'>
					<i>Lv</i> <?php if ($_smarty_tpl->tpl_vars['info']->value['level']==null){?>0<?php }else{ ?> <?php echo $_smarty_tpl->tpl_vars['info']->value['lv'];?>
<?php }?>
				</p>
				<p  class='p-label'>等级</p>
			</div>
			<div class='l-item'>
				<p class='p-info'><?php if ($_smarty_tpl->tpl_vars['info']->value['level']==null){?>0<?php }else{ ?> <?php echo $_smarty_tpl->tpl_vars['info']->value['level'];?>
<?php }?></p>
				<p  class='p-label'>成长值</p>
			</div>
		</div>
		<!-- 菜单项目 -->
		<div class='groups'>
			<div class='item'>
				<a href="<?php echo @HOME;?>
Member/profile_edit.html">
					<p><img src="<?php echo @THEME;?>
Member/img/1.png"></p>
					<p>个人信息</p>
					<p><img src="<?php echo @THEME;?>
Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="#">
					<p><img src="<?php echo @THEME;?>
Member/img/2.png"></p>
					<p>等级权限</p>
					<p><img src="<?php echo @THEME;?>
Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="<?php echo @HOME;?>
Member/family.html">
					<p><img src="<?php echo @THEME;?>
Member/img/3.png"></p>
					<p>家庭成员</p>
					<p><img src="<?php echo @THEME;?>
Member/img/more.png"></p>
				</a>
			</div>
		</div>
		<div class='groups'>
			<div class='item'>
				<a href="#">
					<p><img src="<?php echo @THEME;?>
Member/img/4.png"></p>
					<p>帮助中心</p>
					<p><img src="<?php echo @THEME;?>
Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="#">
					<p><img src="<?php echo @THEME;?>
Member/img/5.png"></p>
					<p>意见反馈</p>
					<p><img src="<?php echo @THEME;?>
Member/img/more.png"></p>
				</a>
			</div>
		</div>
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 签到获取积分与经验值
			$('#clock_in').click(function(){
				$.ajax({
					type:'POST',
					url:'<?php echo @HOME;?>
Member/clock_in',
					dataType:'json',
					success:function(msg){
						if(msg['code']==200){
							alert('签到成功');
						}else
							alert(msg['data']);
					}
				});
			});
		});
	</script>
</body>
</html><?php }} ?>