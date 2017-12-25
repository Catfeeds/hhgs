<?php /* Smarty version Smarty-3.1.6, created on 2017-12-19 10:55:00
         compiled from "./Theme/default/Shop/order.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8240660265a379653792845-28637342%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'efa8ae45375c034e1b5c73bdccdd4d79b704678e' => 
    array (
      0 => './Theme/default/Shop/order.tpl',
      1 => 1513652097,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8240660265a379653792845-28637342',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a37965379470',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a37965379470')) {function content_5a37965379470($_smarty_tpl) {?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>花园小铺</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Shop/css/order.css">
</head>
<body>
	<div class='container'>
		<div class='info'>
			<div class='img'>
				<img src="<?php echo @THEME;?>
Shop/img/WX20171218-171437.png">
			</div>
			<div class='text'>
				<p class='t'>现代简约休闲实木沙发</p>
				<p class='s'>新品体验,正在进行中</p>
				<p class='c'><span>500积分</span></p>
			</div>
		</div>
		<div class='content'>
			<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
				<div class='groups'>
					<div class='item'>
						<p>兑换数量</p>
						<p>
							<input id='number' name='number' type='number' value='1' disabled>
						</p>
					</div>
				</div>
				<div class='groups'>
					<div class='item'>
						<p>配送方式</p>
						<p style='text-align: right;'>
							物业中心自取
						</p>
					</div>
				</div>
				<div class='groups'>
					<div class='item'>
						<p>姓名</p>
						<p>
							<input id='name' name="name" type="text" >
						</p>
					</div>
					<div class='item'>
						<p>联系方式</p>
						<p>
							<input id='phone' name="phone" type="tel" >
						</p>
					</div>
					<div class='item'>
						<p><textarea rows='4' style='resize:none; width: 100%;font-size: 12px;border:none;' placeholder='点击填写备注信息'></textarea></p>
					</div>
				</div>
				<div class='btn_wrap'>
					<p>订单消耗积分：<span>500</span></p>
					<p><button class='btn' type='submit'>提交订单</button></p>
				</div>
			</form>
		</div>		
	</div>
</body>
</html><?php }} ?>