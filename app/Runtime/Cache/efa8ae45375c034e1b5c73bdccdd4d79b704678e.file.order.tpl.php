<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 21:11:18
         compiled from "./Theme/default/Shop/order.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8240660265a379653792845-28637342%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'efa8ae45375c034e1b5c73bdccdd4d79b704678e' => 
    array (
      0 => './Theme/default/Shop/order.tpl',
      1 => 1514466676,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8240660265a379653792845-28637342',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a37965379470',
  'variables' => 
  array (
    'goods_info' => 0,
    'mem_info' => 0,
  ),
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
				<img src="<?php echo @UPLOAD;?>
goods/<?php echo $_smarty_tpl->tpl_vars['goods_info']->value['thumbnail'];?>
">
			</div>
			<div class='text'>
				<p class='t'><?php echo $_smarty_tpl->tpl_vars['goods_info']->value['goods_name'];?>
</p>
				<p class='s'><?php echo $_smarty_tpl->tpl_vars['goods_info']->value['goods_intro'];?>
</p>
				<p id='price' class='c'><span><i style='font-style:normal;'><?php echo sprintf("%d",$_smarty_tpl->tpl_vars['goods_info']->value['goods_price']);?>
</i>活跃值</span></p>
			</div>
		</div>
		<div class='content'>
			<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
				<div class='groups'>
					<div class='item'>
						<p>兑换数量</p>
						<p>
							<input id='number' name='number' type='number' value='1'>
						</p>
					</div>
				</div>
				<div class='groups'>
					<div class='item'>
						<p>配送方式</p>
						<p style='text-align: right;'>
							<?php if ($_smarty_tpl->tpl_vars['goods_info']->value['pay_type']==1){?>物业中心自取<?php }else{ ?>其他<?php }?>
						</p>
					</div>
				</div>
				<div class='groups'>
					<div class='item'>
						<p>姓名</p>
						<p>
							<input id='name' name="name" type="text" value='<?php echo $_smarty_tpl->tpl_vars['mem_info']->value["uname"];?>
'>
						</p>
					</div>
					<div class='item'>
						<p>联系方式</p>
						<p>
							<input id='phone' name="phone" type="tel" value='<?php echo $_smarty_tpl->tpl_vars['mem_info']->value["phone_num"];?>
'>
						</p>
					</div>
					<div class='item'>
						<p><textarea id='remarks' name='remarks' rows='4' style='resize:none; width: 100%;font-size: 12px;border:none;' placeholder='点击填写备注信息'></textarea></p>
					</div>
				</div>
				<div class='btn_wrap'>
					<p>订单消耗活跃值：<span id='total'><?php echo sprintf("%d",$_smarty_tpl->tpl_vars['goods_info']->value['goods_price']);?>
</span></p>
					<p><button class='btn' type='submit'>提交订单</button></p>
				</div>
			</form>
		</div>		
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 手机号码验证
			jQuery.validator.addMethod("isphone", function(value, element) {
			  	var length = value.length; 
			  	
			  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
			  	
			  	return this.optional(element) || (length == 11 && mobile.test(value)); 
			}, "手机号码格式错误"); 
			$('#form').validate({
				// debug:true,
				rules:{
					name:'required',
					phone:{
						required:true,
						isphone:true,
					},
					number:{
						required:true,
						digits:true,
					}
				},
				messages:{
					name:'姓名不能为空',
					phone:{
						required:'手机号码不能为空',
					},
					number:{
						required:'兑换数量不能为空',
						digits:'兑换数量必须为整数',
					}

				},
				errorPlacement:function(error,element){
					console.log(error);
				},
				submitHandler:function(){
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'number':$('#number').val(),
							'name':$('#name').val(),
							'phone_num':$('#phone').val(),
							'remarks':$('#remarks').val(),
						},
						success:function(msg){
							if(msg['code']==200){
								alert('兑换成功');
								window.location.href=location.href;
							}else{
								console.log(msg['data']);
							}
						}
					});
				}
			});
			$('#number').blur(function(){
				let price=$('#price span i').html();
				let num=$(this).val();
				total=price*num;
				$('#total').html(total);
			});
		});
	</script>
</body>
</html><?php }} ?>