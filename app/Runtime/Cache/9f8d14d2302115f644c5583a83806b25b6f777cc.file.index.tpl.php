<?php /* Smarty version Smarty-3.1.6, created on 2017-12-27 17:01:17
         compiled from "./Theme/default/Service/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4898067165a3763321406e2-22267526%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9f8d14d2302115f644c5583a83806b25b6f777cc' => 
    array (
      0 => './Theme/default/Service/index.tpl',
      1 => 1514365275,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4898067165a3763321406e2-22267526',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3763321bfbd',
  'variables' => 
  array (
    'list' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3763321bfbd')) {function content_5a3763321bfbd($_smarty_tpl) {?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>服务</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Service/css/index.css">
</head>
<body>
	<div class='container'>
		<div class='list'>
			<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
				<a href="<?php echo @HOME;?>
Service/order.html?uid=<?php echo $_smarty_tpl->tpl_vars['item']->value['uid'];?>
">
					<div class='item'>
						<img src="<?php echo @UPLOAD;?>
service/<?php echo $_smarty_tpl->tpl_vars['item']->value['img'];?>
">
					</div>
				</a>
			<?php } ?>
		</div>
	</div>
</body>
</html><?php }} ?>