<?php /* Smarty version Smarty-3.1.6, created on 2017-12-24 15:31:50
         compiled from "./ThemeAdmin/default/Member/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8678371875a3e2fd68eeca7-13172466%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f240b027b2987582312b800f9429590741dc1bf8' => 
    array (
      0 => './ThemeAdmin/default/Member/index.tpl',
      1 => 1514100663,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8678371875a3e2fd68eeca7-13172466',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3e2fd6987d4',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'list' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3e2fd6987d4')) {function content_5a3e2fd6987d4($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'注册用户信息'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 注册用户信息</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-envira"></i>注册用户信息</li>	
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
								<th>用户名称</th>
								<th>性别</th>
								<th>手机号码</th>
								<th>出生日期</th>
								<th>业主认证</th>
								<th>房源信息</th>
								<th>置业顾问</th>
								<th>注册时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uname'];?>
</td>
									<td><?php if ($_smarty_tpl->tpl_vars['item']->value['sex']==1){?>男<?php }else{ ?>女<?php }?></td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['phone_num'];?>
</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['birth'],'%Y-%m-%d');?>
</td>
									<td><?php if ($_smarty_tpl->tpl_vars['item']->value['is_authen']==1){?><p class='text-success'>已认证</p><?php }else{ ?><p class='text-danger'>未认证</p><?php }?></td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['houseinfo'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['consname'];?>
</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['rg_time'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td>
										<a class='btn btn-primary' href='<?php echo @ADMIN;?>
Member/info.html?uid=<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
'>查看详细</a>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
					<div class='text-center'>
						<?php echo $_smarty_tpl->tpl_vars['list']->value['page'];?>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>