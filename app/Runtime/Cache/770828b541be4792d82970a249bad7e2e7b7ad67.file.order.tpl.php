<?php /* Smarty version Smarty-3.1.6, created on 2017-12-25 19:42:33
         compiled from "./ThemeAdmin/default/Shop/order.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20489898985a40e429c2c685-42460199%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '770828b541be4792d82970a249bad7e2e7b7ad67' => 
    array (
      0 => './ThemeAdmin/default/Shop/order.tpl',
      1 => 1514202008,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20489898985a40e429c2c685-42460199',
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
  'unifunc' => 'content_5a40e429c7ab9',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a40e429c7ab9')) {function content_5a40e429c7ab9($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'订单管理'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-paw"></i> 订单管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-paw"></i>订单管理</li>	
			</ol>
		</div>
		<div class='col-md-12'>
			<div class='error_report'>
				错误：
				<span class='text-danger'></span>
			</div>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>