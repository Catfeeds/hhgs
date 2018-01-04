<?php /* Smarty version Smarty-3.1.6, created on 2018-01-03 16:25:08
         compiled from "./Theme/default/Member/levels.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3575356575a4c8d1e536662-72773277%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '79bc4c9dcc417078e469da774c8fa4eccbf63740' => 
    array (
      0 => './Theme/default/Member/levels.tpl',
      1 => 1514967905,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3575356575a4c8d1e536662-72773277',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a4c8d1e584f2',
  'variables' => 
  array (
    'info' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a4c8d1e584f2')) {function content_5a4c8d1e584f2($_smarty_tpl) {?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>等级权限</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Member/css/common.css">
	<style type="text/css">
		.header{
			background-image: url(<?php echo @THEME;?>
Member/img/lheader.png);
			background-size: cover;
			width: 100%;
			height: 100px;
			padding: 20px 30px;
		}
		.name{
			margin:5px 0;
			font-weight: 500;
		}
		.line{
			color: #666;
		}
	</style>
</head>
<body>
	<div class='container'>
		<div class='header'>
			<h2 class='name'><?php echo $_smarty_tpl->tpl_vars['info']->value['uname'];?>
</h2>
			<div class='line'>等级：Lv<?php echo $_smarty_tpl->tpl_vars['info']->value['lv'];?>
</div> 
			<div class='line'>成长值：<?php echo $_smarty_tpl->tpl_vars['info']->value['level'];?>
</div>
		</div>
		<div>
			<img src="<?php echo @THEME;?>
Member/img/llevel.png">
		</div>
	</div>
</body>
</html><?php }} ?>