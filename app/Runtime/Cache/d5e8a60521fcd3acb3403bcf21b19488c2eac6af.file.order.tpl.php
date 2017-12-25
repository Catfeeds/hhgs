<?php /* Smarty version Smarty-3.1.6, created on 2017-12-18 15:44:55
         compiled from "./Theme/default/Service/order.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18134222295a3765bfbe2474-74104601%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd5e8a60521fcd3acb3403bcf21b19488c2eac6af' => 
    array (
      0 => './Theme/default/Service/order.tpl',
      1 => 1513583091,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18134222295a3765bfbe2474-74104601',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3765bfbe47e',
  'variables' => 
  array (
    'info' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3765bfbe47e')) {function content_5a3765bfbe47e($_smarty_tpl) {?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>服务</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Service/css/order.css">
</head>
<body>
	<div class='container'>
		<div class='header'>
			<img src="<?php echo @THEME;?>
Service/img/WX20171218-150804.png">
		</div>
		<div class='content'>
			<div class='title'>
				<p class='pt'>清风徐来 给您健康的额家</p>
				<p class='pn'>建业·花园里空调清洗服务-还您清新空气</p>
			</div>
			<div class='number'>本周可预约名额:<span>2</span>名</div>
			<div class='area'>
				<span>服务区域</span>
				<p>惠济区花园里公社</p>
			</div>
			<div class='time'>
				<span>上门服务时间</span>
				<p>2017年12月24号</p>
			</div>
			<div class='form'>
				<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
					<p class='bline'>
						<span>马上预约</span>
					</p>
					<p class='line'>
						<label>姓名</label>
						<input id='name' name='name' type='text' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["name"];?>
'>
					</p>
					<p class='line'>
						<label>手机号码</label>
						<input id='phone' name='phone' type='tel' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["phone_num"];?>
'>
					</p>
					<p class='line'>
						<label>预约日期</label>
						<span class='wrp'><input id='date' name='date' type='date' value=''></span>
					</p>
					<p class='line'>
						<label>预约时间</label>
						<select id='relation' name='relation'>
							<option value=0>请选择预约时间</option>
							<option value='1'>上午</option>
							<option value='2'>下午</option>
						</select>
					</p>
					<p class='btn_wrap'>
						<button class='btn' type='submit'>提交报名</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html><?php }} ?>