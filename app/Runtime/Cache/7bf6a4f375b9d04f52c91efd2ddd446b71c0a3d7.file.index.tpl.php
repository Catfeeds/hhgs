<?php /* Smarty version Smarty-3.1.6, created on 2018-01-05 19:54:47
         compiled from "./Theme/default/Recommend/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:9629952085a4f5fcc640370-05053937%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7bf6a4f375b9d04f52c91efd2ddd446b71c0a3d7' => 
    array (
      0 => './Theme/default/Recommend/index.tpl',
      1 => 1515153286,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9629952085a4f5fcc640370-05053937',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a4f5fcc68b05',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a4f5fcc68b05')) {function content_5a4f5fcc68b05($_smarty_tpl) {?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>推荐有礼</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Recommend/css/index.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			<div class='info'>
				<p class='logo'>
					<img src="<?php echo @THEME;?>
Recommend/img/logo.png">
				</p>
				<p>1.仅限本项目业主参与；</p>
				<p>2.若合同总金额在70万以内的奖励老业主价值1000元某商场或超市提货卡；</p>
				<p>3.若合同总金额在70万以上的奖励老业主价值2000元谋商场或超市提货卡</p>
				<div class='code'>
					<p id='words'>MDAwMDAwMzk=</p>
					<p id='clip-btn'  data-clipboard-action="copy" data-clipboard-target="#words" data-clipboard-text="123232">点击复制我的验证码</p>
				</div>
			</div>
			<div class='form'>
				<p>
					<input type="text" name="" placeholder='请输入推荐人邀请码'>
				</p>
				<p>
					<button id='submit'>提交</button>
				</p>
			</div>
		</div>
	</div>
	<div class='tips'>复制成功</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src='<?php echo @ORG;?>
clipboard/clipboard.min.js'></script>
	<script type="text/javascript">
		$(function(){
			// clipboard
		  	var clipboard = new Clipboard('#clip-btn');
		  	clipboard.on('success', function(e) {
		    	$('.tips').show();
		    	setTimeout(function(){
		    		$('.tips').hide();
		    	},1000);
		    });
		    clipboard.on('error', function(e) {
		        $('.tips').html('口令复制失败,请尝试长按复制');
			    $('.tips').show();
		    });
		})
	</script>
</body>
</html><?php }} ?>