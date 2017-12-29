<?php /* Smarty version Smarty-3.1.6, created on 2017-12-29 15:56:32
         compiled from "./Theme/default/Member/advice.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4274075995a45f3dee29ab1-64184855%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '41051f9016a9511b7e7f9fda7eec2172c81b86ad' => 
    array (
      0 => './Theme/default/Member/advice.tpl',
      1 => 1514534191,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4274075995a45f3dee29ab1-64184855',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a45f3dee7465',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a45f3dee7465')) {function content_5a45f3dee7465($_smarty_tpl) {?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>意见反馈</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Member/css/common.css">
	<style type="text/css">
		.btn{
			padding:20px;
		}
		.btn button{
			width: 100%;
			background: transparent;
		}
		.sub_bg{
			background: -webkit-linear-gradient(left, rgb(207,166,108), rgb(238,210,170));
			color: #fff;
			border-radius: 3px;
			padding:7px 0;
		}
		.text{
			padding: 20px;
		}
		.text #text{
			width: 100%;
			border:1px solid rgba(0,0,0,0.1);
			resize:none;
			border-radius: 5px;
			padding: 10px;
		}
	</style>
</head>
<body>
	<div class='container'>
		<div class='content'>
			<div class='text'>
				<textarea rows="8" id='text' placeholder="请输入你的意见或建议，小花将会在第一时间进行评估处理。感谢您的热心反馈哦！"></textarea>
			</div>
			<div class='btn'>
				<button id='submit'>
					<div class='sub_bg'>提交您的意见</div>
				</button>
			</div>
		</div>
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#submit').click(function(){
				alert('您的信息已提交成功');
			});
		});
	</script>
</body>
</html><?php }} ?>