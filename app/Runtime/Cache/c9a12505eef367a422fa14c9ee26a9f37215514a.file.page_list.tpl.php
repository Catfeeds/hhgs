<?php /* Smarty version Smarty-3.1.6, created on 2017-12-19 14:47:03
         compiled from "./ThemeAdmin/default/Pages/page_list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:9407892255a38b5e7e0d207-88893324%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c9a12505eef367a422fa14c9ee26a9f37215514a' => 
    array (
      0 => './ThemeAdmin/default/Pages/page_list.tpl',
      1 => 1489749458,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9407892255a38b5e7e0d207-88893324',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'result' => 0,
    'item' => 0,
    'server' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a38b5e7e7a4a',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a38b5e7e7a4a')) {function content_5a38b5e7e7a4a($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'所有页面'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-list-alt"></i> 所有页面</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-list-alt"></i>所有页面</li>	
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
					<table class='table table-striped table-hover'>
						<thead>
							<tr>
								<th>页面标题</th>
								<th>页面连接</th>
								<th>创建时间</th>
								<th>创建人</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['result']->value['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td>
										<a href="<?php echo @ADMIN;?>
Pages/page_edit.html?page=<?php echo $_smarty_tpl->tpl_vars['item']->value['page_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['page_title'];?>
</a>
										<div class='handle'>
											<a href="<?php echo @ADMIN;?>
Pages/page_edit.html?page=<?php echo $_smarty_tpl->tpl_vars['item']->value['page_id'];?>
">编辑</a>
											<span class='grey'>|</span>
											<a class='danger delete' href="javascript:void(0);" data-uid="<?php echo $_smarty_tpl->tpl_vars['item']->value['page_id'];?>
">删除</a>
											<span class='grey'>|</span>
											<a href="<?php echo @ADMIN;?>
Pages/page_view.html?page=<?php echo $_smarty_tpl->tpl_vars['item']->value['page_id'];?>
" target="_blank">查看</a>
										</div>
									</td>
									<td><a href="http://<?php echo $_smarty_tpl->tpl_vars['server']->value;?>
pages/index/page/<?php echo $_smarty_tpl->tpl_vars['item']->value['page_id'];?>
" target="_blank">http://<?php echo $_smarty_tpl->tpl_vars['server']->value;?>
pages/index/page/<?php echo $_smarty_tpl->tpl_vars['item']->value['page_id'];?>
</a></td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['page_time'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['user_nickname'];?>
</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
					<div class='text-center'><?php echo $_smarty_tpl->tpl_vars['result']->value['page'];?>
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
assets/js/pages.js'></script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>