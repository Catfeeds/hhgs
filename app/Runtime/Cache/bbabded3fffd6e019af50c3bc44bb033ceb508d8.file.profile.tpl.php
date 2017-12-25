<?php /* Smarty version Smarty-3.1.6, created on 2017-12-25 18:51:48
         compiled from "./ThemeAdmin/default/User/profile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6289238605a40d8449035d0-11224879%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bbabded3fffd6e019af50c3bc44bb033ceb508d8' => 
    array (
      0 => './ThemeAdmin/default/User/profile.tpl',
      1 => 1487319230,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6289238605a40d8449035d0-11224879',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'info' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a40d84496a36',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a40d84496a36')) {function content_5a40d84496a36($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'个人信息修改'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-info-circle"></i> 个人信息修改</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-info-circle"></i>个人信息修改</li>
			</ol>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='error_report'>
				错误：
				<span class='text-danger'></span>
			</div>
		</div>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<div class='form-horizontal'>
						<h4>个人信息</h4>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>登录名</label>
							<div class='col-md-6 col-xs-12'>
								<input type='text' class='form-control' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["user_login"];?>
' disabled>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>用户昵称</label>
							<div class='col-md-6 col-xs-12'>
								<input id='username' type='text' class='form-control' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["user_nickname"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>邮箱</label>
							<div class='col-md-6 col-xs-12'>
								<input id='useremail' type='email' class='form-control' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["user_email"];?>
'>
							</div>
						</div>
						<button id='profile_submit' class='btn btn-danger'>更新个人信息</button>
						<hr>
						<h4>密码设置</h4>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>原密码</label>
							<div class='col-md-6 col-xs-12'>
								<input id='password' type='text' class='form-control'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>新密码</label>
							<div class='col-md-6 col-xs-12'>
								<input id='newpassword' type='password' class='form-control'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>重复新密码</label>
							<div class='col-md-6 col-xs-12'>
								<input id='pass_repeat' type='password' class='form-control'>
							</div>
						</div>
						<button id='pass_submit' class='btn btn-danger'>更新密码</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<script type="text/javascript" src='<?php echo @JS;?>
ajax.js'></script>
<script type="text/javascript" src='<?php echo @THEMEADMIN;?>
assets/js/users.js'></script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>