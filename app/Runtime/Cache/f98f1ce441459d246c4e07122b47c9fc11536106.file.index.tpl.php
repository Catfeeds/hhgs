<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 14:59:15
         compiled from "./ThemeAdmin/default/Index/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12965568985a38b5dbad8612-12186312%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f98f1ce441459d246c4e07122b47c9fc11536106' => 
    array (
      0 => './ThemeAdmin/default/Index/index.tpl',
      1 => 1514444352,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12965568985a38b5dbad8612-12186312',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a38b5dbb9115',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'pages' => 0,
    'item' => 0,
    'logs' => 0,
    'archive' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a38b5dbb9115')) {function content_5a38b5dbb9115($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/alidata/www/api/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'首页-概况'), 0);?>


<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-tachometer"></i> 概况</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="index.html">首页</a></li>
				<li><i class="fa fa-tachometer"></i>概况</li>	  	
			</ol>
		</div>
	</div>
	<div class='row'>
		<!-- 最新页面 -->
	<!-- 	<div class='col-md-7'>
			<div class='panel panel-default'>
				<div class='panel-heading'>页面</div>
				<div class='panel-body'>
					<table class='table'>
						<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['pages']->value['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
							<tr>
								<td>
									<a href="<?php echo @ADMIN;?>
Pages/page_edit.html?page=<?php echo $_smarty_tpl->tpl_vars['item']->value['page_id'];?>
" title='编辑'><?php echo $_smarty_tpl->tpl_vars['item']->value['page_title'];?>
</a>
								</td>
								<td><?php echo $_smarty_tpl->tpl_vars['item']->value['user_nickname'];?>
</td>
								<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['page_time'],'%Y-%m-%d %H:%M:%S');?>
</td>	
							</tr>
						<?php } ?>
					</table>
					<div class='text-right'>
						<a href="<?php echo @ADMIN;?>
Pages/page_list.html">查看更多</a>
					</div>
				</div>
			</div>
		</div> -->
		<!-- 登录日志 -->
		<!-- <div class='col-md-5'>
			<div class='panel panel-default'>
				<div class='panel-heading'>登录日志</div>
				<div class='panel-body'>
					<table class='table'>
					<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['logs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
						<tr>
							<td><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</td>
							<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['login_time'],'%Y-%m-%d %H:%M:%S');?>
</td>
							<td><?php echo $_smarty_tpl->tpl_vars['item']->value['login_ip'];?>
</td>
						</tr>						
					<?php } ?>
					</table>
					<div class='text-right'>
						<a href="<?php echo @ADMIN;?>
Log/login_log.html">查看更多</a>
					</div>
				</div>
			</div>
		</div> -->
		<!-- 最新发布 -->
		<!-- <div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-heading'>最新发布</div>
				<div class='panel-body'>
					<table class='table'>
						<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['archive']->value['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
							<tr>
								<td>
									<a href='<?php echo @ADMIN;?>
Archive/post_edit.html?aid=<?php echo $_smarty_tpl->tpl_vars['item']->value["id"];?>
'><?php echo $_smarty_tpl->tpl_vars['item']->value['post_title'];?>
</a>
								</td>
								<td><?php echo $_smarty_tpl->tpl_vars['item']->value['user_nickname'];?>
</td>
								<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['post_date'],'%Y-%m-%d %H:%M:%S');?>
</td>
							</tr>
						<?php } ?>
					</table>
					<div class='text-right'>
						<a href="<?php echo @ADMIN;?>
Archive/post_list.html">查看更多</a>
					</div>
				</div>
			</div>
		</div> -->
		<!-- 快捷操作 -->
		<!-- <div class='col-md-6'>
			<div class='panel panel-default'>
				<div class='panel-heading'>快捷操作</div>
				<div class='panel-body'>
					<span class="label label-primary">
						<a href="<?php echo @ADMIN;?>
Archive/post_new.html">写文章</a>
					</span>
					<span class="label label-success">
						<a href="<?php echo @ADMIN;?>
Pages/page_new.html">新建页面</a>
					</span>
					<span class="label label-info">
						<a href="<?php echo @ADMIN;?>
User/profile.html">个人信息</a>
					</span>
					<span class="label label-danger">
						<a href="<?php echo @ADMIN;?>
Archive/category.html">分类管理</a>
					</span>
					<span class="label label-warning">
						<a href="<?php echo @ADMIN;?>
Archive/tags.html">标签管理</a>
					</span>
				</div>
			</div>
		</div> -->
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/index.css">
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php }} ?>