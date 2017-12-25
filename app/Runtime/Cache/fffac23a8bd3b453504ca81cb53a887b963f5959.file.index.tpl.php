<?php /* Smarty version Smarty-3.1.6, created on 2017-12-19 14:47:01
         compiled from "./ThemeAdmin/default/HomePage/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:15489203065a38b5e505a989-58037302%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fffac23a8bd3b453504ca81cb53a887b963f5959' => 
    array (
      0 => './ThemeAdmin/default/HomePage/index.tpl',
      1 => 1502436532,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15489203065a38b5e505a989-58037302',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'res' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a38b5e50c14a',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a38b5e50c14a')) {function content_5a38b5e50c14a($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'首页幻灯片'), 0);?>

<style type="text/css">
	.img{
		width: 120px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 首页幻灯片</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-envira"></i>首页幻灯片</li>	
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
					<a href="<?php echo @ADMIN;?>
HomePage/post.html" class='btn btn-primary'>添加新的幻灯片</a>
					<table  class='table table-striped table-hover'>
						<thead>
							<tr>
								<th>图片</th>
								<th>链接</th>								
								<th>时间</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['res']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td>
										<img class='img' src="<?php echo @HOME;?>
<?php echo $_smarty_tpl->tpl_vars['item']->value['img'];?>
">
									</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['link'];?>
</td>							
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['time'],'%Y-%m-%d %H:%M');?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['mark'];?>
</td>
									<td>
										<a href='<?php echo @ADMIN;?>
HomePage/post.html?uid=<?php echo $_smarty_tpl->tpl_vars['item']->value["id"];?>
' class='btn btn-info'>编辑</a>
										<button data-id="<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
" class='btn btn-danger del'>删除</button>
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
<script type="text/javascript" src="<?php echo @THEMEADMIN;?>
assets/js/homepage.js"></script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>