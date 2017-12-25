<?php /* Smarty version Smarty-3.1.6, created on 2017-12-25 18:51:42
         compiled from "./ThemeAdmin/default/User/user_new.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19306803935a40d83e199d96-01992411%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '50c4e0cf16961c2eb65676c16e2793eaf5e12361' => 
    array (
      0 => './ThemeAdmin/default/User/user_new.tpl',
      1 => 1487315416,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19306803935a40d83e199d96-01992411',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a40d83e1f24c',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a40d83e1f24c')) {function content_5a40d83e1f24c($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'添加新用户'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-user-plus"></i> 添加新用户</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-user-plus"></i>添加新用户</li>
			</ol>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='error_report'>
				错误：
				<span class='text-danger'>错误提示</span>
			</div>
		</div>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel panel-body'>
					<div class='form-horizontal'>
						<h4>添加新用户</h4>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>用户名</label>
							<div class='col-md-6 col-xs-12'>
								<input id='userlogin' type='text' class='form-control'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>用户昵称</label>
							<div class='col-md-6 col-xs-12'>
								<input id='username' type='text' class='form-control'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>电子邮件</label>
							<div class='col-md-6 col-xs-12'>
								<input id='useremail' type='mail' class='form-control' autocomplete='off'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>角色</label>
							<div class='col-md-6 col-xs-12'>
								<select id='user_role' class='form-control'>
									<option value='general'>普通</option>
									<option value='super'>管理员</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>密码</label>
							<div class='col-md-6 col-xs-12'>
								<input id='textpass' type='text' class='form-control'>
								<input id='password' type='password' class='form-control' autocomplete='off' style='display:none;' readonly="true">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>状态</label>
							<div class='col-md-6 col-xs-12'>
								<select id='userstatus' class='form-control'>
									<option value='forbidden'>禁用</option>
									<option value='normal'>正常</option>
								</select>
							</div>
						</div>
						<button id='user_submit' class='btn btn-danger'>添加用户</button>
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
<script type="text/javascript">
	$(function(){
		$('#textpass').on('click focus',function(){
			$(this).hide();
			$('#password').show().attr('readonly',false).focus();
		});
	});
</script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php }} ?>