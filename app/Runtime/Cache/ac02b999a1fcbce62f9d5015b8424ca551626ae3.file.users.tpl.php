<?php /* Smarty version Smarty-3.1.6, created on 2017-12-25 18:51:38
         compiled from "./ThemeAdmin/default/User/users.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20021752095a40d83a95b569-11131012%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ac02b999a1fcbce62f9d5015b8424ca551626ae3' => 
    array (
      0 => './ThemeAdmin/default/User/users.tpl',
      1 => 1487384758,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20021752095a40d83a95b569-11131012',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'userinfos' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a40d83aa19d2',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a40d83aa19d2')) {function content_5a40d83aa19d2($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'用户管理'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-users"></i> 用户管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-users"></i>用户管理</li>
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
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>
									<input id='select_all' type='checkbox'>
								</th>
								<th class='th_second'>用户名</th>
								<th>用户昵称</th>
								<th>电子邮件</th>
								<th>角色</th>
								<th>添加时间</th>
								<th>用户状态</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['userinfos']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td>
										<input class='checkbox' type='checkbox' name='name[]' data-uid='<?php echo $_smarty_tpl->tpl_vars['item']->value["id"];?>
'>
									</td>
									<td>
										<a href="<?php echo @ADMIN;?>
User/user_edit.html?id=<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['user_login'];?>
</a>
										<div class='handle'>
											<a href="<?php echo @ADMIN;?>
User/user_edit.html?id=<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
">编辑</a>
											<!-- <span class='grey'>|</span>
											<a class='delete danger' href="javascript:void(0);" data-uid="<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
">删除</a> -->
										</div>
									</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['user_nickname'];?>
</td>
									<td>
										<a href="mailto:<?php echo $_smarty_tpl->tpl_vars['item']->value['user_email'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['user_email'];?>
</a>
									</td>
									<td>
										<?php if ($_smarty_tpl->tpl_vars['item']->value['w_user_level']==10){?>
										<span>超级管理员</span>
										<?php }elseif($_smarty_tpl->tpl_vars['item']->value['w_user_level']==9){?>
										<span>管理员</span>
										<?php }elseif($_smarty_tpl->tpl_vars['item']->value['w_user_level']==1){?>
										<span>普通</span>
										<?php }?>
									</td>
									<td>
										<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['user_registered'],'%Y-%m-%d %H:%M:%S');?>

									</td>
									<td>
										<?php if ($_smarty_tpl->tpl_vars['item']->value['user_status']==1){?>
										<p class='text-success'>正常</p>
										<?php }else{ ?>
										<p class='text-danger'>禁用</p>
										<?php }?>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
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
		$('#select_all').click(function(){
			var this_check=$(this).prop('checked');
			if(this_check)
				$('.checkbox').prop('checked',true);
			else
				$('.checkbox').prop('checked',false);
		});
	});
</script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>