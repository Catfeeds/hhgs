<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 10:47:45
         compiled from "./Theme/default/Service/order.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18134222295a3765bfbe2474-74104601%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd5e8a60521fcd3acb3403bcf21b19488c2eac6af' => 
    array (
      0 => './Theme/default/Service/order.tpl',
      1 => 1514424000,
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
    'sinfo' => 0,
    'uinfo' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3765bfbe47e')) {function content_5a3765bfbe47e($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/alidata/www/api/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
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
			<img src="<?php echo @UPLOAD;?>
service/<?php echo $_smarty_tpl->tpl_vars['sinfo']->value['img'];?>
">
		</div>
		<div class='content'>
			<div class='title'>
				<p class='pt'><?php echo $_smarty_tpl->tpl_vars['sinfo']->value['name'];?>
</p>
				<p class='pn'><?php echo $_smarty_tpl->tpl_vars['sinfo']->value['intro'];?>
</p>
			</div>
			<div class='number'>本周可预约名额:<span><?php echo $_smarty_tpl->tpl_vars['sinfo']->value['number'];?>
</span>名</div>
			<div class='area'>
				<span>服务区域</span>
				<p><?php echo $_smarty_tpl->tpl_vars['sinfo']->value['area'];?>
</p>
			</div>
			<div class='time'>
				<span>上门服务时间</span>
				<p><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['sinfo']->value['stime'],'%Y年%m月%d日');?>
至<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['sinfo']->value['etime'],'%Y年%m月%d日');?>
</p>
			</div>
			<div class='form'>
				<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
					<p class='bline'>
						<span>马上预约</span>
					</p>
					<p class='line'>
						<label>姓名</label>
						<input id='name' name='name' type='text' value='<?php echo $_smarty_tpl->tpl_vars['uinfo']->value["uname"];?>
'>
					</p>
					<p class='line'>
						<label>手机号码</label>
						<input id='phone' name='phone' type='tel' value='<?php echo $_smarty_tpl->tpl_vars['uinfo']->value["phone_num"];?>
'>
					</p>
					<p class='line'>
						<label>预约日期</label>
						<span class='wrp'><input id='date' name='date' type='date' value=''></span>
					</p>
					<p class='line'>
						<label>预约时间</label>
						<select id='time' name='time'>
							<option value=0>请选择预约时间</option>
							<option value='1'>上午</option>
							<option value='2'>下午</option>
						</select>
					</p>
					<p class='line'>
						<label>详细地址</label>
						<input id='address' name='address' type='text' value=''>
					</p>
					<p class='btn_wrap'>
						<button class='btn' type='submit'>提交报名</button>
					</p>
				</form>
			</div>
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
					date:'required',
					time:{
						required:true,
						min:1,
					},
					address:'required'
				},
				messages:{
					name:'姓名不能为空',
					phone:'手机号码格式错误',
					date:'请选择预约日期',
					time:{
						required:'请选择预约时间',
						min:'请选择预约日期'
					},
					address:'地址不能为空',
				},
				errorPlacement:function(error,element){
					// $('#error').html(error);
					console.log(error);
				},
				submitHandler:function(){
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'name':$('#name').val(),
							'date':$('#date').val(),
							'time':$('#time').val(),
							'phone_num':$('#phone').val(),
							'address':$('#address').val(),
						},
						success:function(msg){
							if(msg['code']==200){
								alert('报名预约成功');
								window.location.href=location.href;
							}else{
								alert(msg['data']);
							}
						}
					});
				}
			});
		});
	</script>
</body>
</html><?php }} ?>