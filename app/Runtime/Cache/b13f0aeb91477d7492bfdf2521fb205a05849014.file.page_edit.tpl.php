<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 14:58:06
         compiled from "./ThemeAdmin/default/Pages/page_edit.tpl" */ ?>
<?php /*%%SmartyHeaderCode:15003830585a4495fe4b5c13-75341313%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b13f0aeb91477d7492bfdf2521fb205a05849014' => 
    array (
      0 => './ThemeAdmin/default/Pages/page_edit.tpl',
      1 => 1514424012,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15003830585a4495fe4b5c13-75341313',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'result' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a4495fe58582',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a4495fe58582')) {function content_5a4495fe58582($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'页面修改'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-pencil-square-o"></i> 页面修改</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-pencil-square-o"></i>页面修改</li>	
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
		<input id='page_id' type='hidden' value="<?php echo $_GET['page'];?>
">
		<div class='col-md-12 margin_30'>
			<input id='title' class='form-control' type='text' placeholder='在此输入标题' value="<?php echo $_smarty_tpl->tpl_vars['result']->value['page_title'];?>
">
		</div>
		<div class='col-md-12 margin_30'>
			<script id="editor" type="text/plain" style="width:100%;height:500px;"><?php echo stripslashes(htmlspecialchars_decode($_smarty_tpl->tpl_vars['result']->value['page_content']));?>
</script>
		</div>
		<div class='col-md-12'>
			<button id='page_edit' class='btn btn-danger'>更新页面</button>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/pages.css">

<!-- ueditor编辑器 -->
<script type="text/javascript" src='<?php echo @ORG;?>
editor/ueditor/ueditor.config.js'></script>
<script type="text/javascript" src='<?php echo @ORG;?>
editor/ueditor/ueditor.all.min.js'></script>
<script type="text/javascript" src='<?php echo @ORG;?>
editor/ueditor/createEditor.js'></script>
<!-- ueditor编辑器 -->
<script type="text/javascript" src='<?php echo @JS;?>
ajax.js'></script>
<script type="text/javascript" src='<?php echo @THEMEADMIN;?>
assets/js/pages.js'></script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>