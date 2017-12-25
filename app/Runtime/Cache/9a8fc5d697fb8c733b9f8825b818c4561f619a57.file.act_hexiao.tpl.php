<?php /* Smarty version Smarty-3.1.6, created on 2017-12-23 17:11:42
         compiled from "./Theme/default/Writeoff/act_hexiao.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16354113195a3e09a2bbb6a5-96299029%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9a8fc5d697fb8c733b9f8825b818c4561f619a57' => 
    array (
      0 => './Theme/default/Writeoff/act_hexiao.tpl',
      1 => 1514020300,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16354113195a3e09a2bbb6a5-96299029',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3e09a2be900',
  'variables' => 
  array (
    'info' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3e09a2be900')) {function content_5a3e09a2be900($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>活动签到码核销</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link href="<?php echo @ORG;?>
boot/bootstrap.min.css" rel="stylesheet">		
	<style type="text/css">
		.content{
			width: 90%;
			margin:80px auto;
			text-align: center;
		}
	</style>
<body>
	<div class='container'>
		<div class='content'>
			<p>活动名称：<span class='text-info'><?php echo $_smarty_tpl->tpl_vars['info']->value['name'];?>
</span></p>
			<p>报名人姓名：<span class='text-info'><?php echo $_smarty_tpl->tpl_vars['info']->value['uname'];?>
</span></p>
			<p>手机号码：<span class='text-info'><?php echo $_smarty_tpl->tpl_vars['info']->value['phone_num'];?>
</span></p>
			<p>报名时间：<span class='text-info'><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value['b_time'],'%Y-%m-%d %H:%M:%S');?>
</span></p>
			<p>携带人数：<span class='text-info'><?php echo $_smarty_tpl->tpl_vars['info']->value['carry_num'];?>
</span></p>
			<p>是否签到：<span class='text-info'><?php if ($_smarty_tpl->tpl_vars['info']->value['is_arrival']==1){?>是<?php }else{ ?>否<?php }?></span></p>
			<p><input id='hexiao' class='form-control' type='password' placeholder='请输入此次活动的核销密码'></span></p>
			<br>
			<p>
				<button id='hxbtn' class='btn btn-lg btn-info'>签到码核销</button>
			</p>
		</div>
	</div>
	<script type="text/javascript" src='<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js'></script>
	<script type="text/javascript">
		$(function(){
			$('#hxbtn').click(function(){
				let hexiao=$('#hexiao').val();
				if(hexiao==''){
					alert('请输入核销码密码');
				}else{
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'hexiao':hexiao
						},
						success:function(msg){
							if(msg['code']==200){
								alert(msg['data']);
							}else
								alert(msg['data']);
						}
					});
				}
			});
		});
	</script>
</body>
</html><?php }} ?>