<?php /* Smarty version Smarty-3.1.6, created on 2017-12-24 15:33:31
         compiled from "./ThemeAdmin/default/Consultant/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5686519865a3f44c477a9d8-08946360%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '30edcdc7c1f8860db5adc75531198ccc67a3369e' => 
    array (
      0 => './ThemeAdmin/default/Consultant/index.tpl',
      1 => 1514100806,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5686519865a3f44c477a9d8-08946360',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3f44c481946',
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
<?php if ($_valid && !is_callable('content_5a3f44c481946')) {function content_5a3f44c481946($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'置业顾问列表'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 置业顾问列表</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-envira"></i>置业顾问列表</li>	
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
								<th>姓名</th>
								<th>性别</th>
								<th>出生日期</th>
								<th>联系电话</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</td>
									<td><?php if ($_smarty_tpl->tpl_vars['item']->value['sex']==1){?>男<?php }else{ ?>女<?php }?></td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['birth'],'%Y-%m-%d');?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['phone_num'];?>
</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['atime'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td>
										<a href="<?php echo @ADMIN;?>
Consultant/cnew.html?uid=<?php echo $_smarty_tpl->tpl_vars['item']->value['uid'];?>
">详细信息</a>
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
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>