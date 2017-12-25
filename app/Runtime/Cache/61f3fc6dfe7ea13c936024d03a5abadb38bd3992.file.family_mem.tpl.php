<?php /* Smarty version Smarty-3.1.6, created on 2017-12-15 21:22:41
         compiled from "./Theme/default/Member/family_mem.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2178703865a30f633d0b035-68084015%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '61f3fc6dfe7ea13c936024d03a5abadb38bd3992' => 
    array (
      0 => './Theme/default/Member/family_mem.tpl',
      1 => 1513344159,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2178703865a30f633d0b035-68084015',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a30f633d0c72',
  'variables' => 
  array (
    'info' => 0,
    'relation' => 0,
    'r' => 0,
    'trade' => 0,
    't' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a30f633d0c72')) {function content_5a30f633d0c72($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>家庭成员管理</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Member/css/family_mem.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			<div class='headimg'>
				<img src="http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMjzRiaDU5U2WVzFxibnco6DWXuCCQqkHxpxNoLE7Obm6ueajSOjFZkEawrqaAsiaucN3HnFicS53ticg/0">
			</div>
			<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
				<p class='line'>
					<label>姓名</label>
					<input id='name' name='name' type='text' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["uname"];?>
'>
				</p>
				<p class='line'>
					<label>生日</label>
					<span class='wrp'><input id='birth' name='birth' type='date' value='<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value["birth"],"%Y-%m-%d");?>
'></span>
				</p>
				<p class='line'>
					<label>手机号码</label>
					<input id='phone' name='phone' type='tel' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["phone_num"];?>
'>
				</p>
				<p class='line'>
					<label>与本人关系</label>
					<select id='relation' name='relation'>
						<option value=0>请选择与本人关系</option>
						<?php  $_smarty_tpl->tpl_vars['r'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['r']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['relation']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['r']->key => $_smarty_tpl->tpl_vars['r']->value){
$_smarty_tpl->tpl_vars['r']->_loop = true;
?>
							<option value=<?php echo $_smarty_tpl->tpl_vars['r']->value['uid'];?>
 <?php if ($_smarty_tpl->tpl_vars['info']->value['relation']==$_smarty_tpl->tpl_vars['r']->value['uid']){?>selected<?php }?>><?php echo $_smarty_tpl->tpl_vars['r']->value['relation'];?>
</option>
						<?php } ?>
					</select>
				</p>
				<p class='line'>
					<label>行业</label>
					<select id='trade' name='trade'>
						<option value=0>请选择您的行业</option>
						<?php  $_smarty_tpl->tpl_vars['t'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['t']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['trade']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['t']->key => $_smarty_tpl->tpl_vars['t']->value){
$_smarty_tpl->tpl_vars['t']->_loop = true;
?>
							<option <?php if ($_smarty_tpl->tpl_vars['info']->value['trade']==$_smarty_tpl->tpl_vars['t']->value['uid']){?>selected<?php }?> value='<?php echo $_smarty_tpl->tpl_vars['t']->value["uid"];?>
'><?php echo $_smarty_tpl->tpl_vars['t']->value['name'];?>
</option>
						<?php } ?>
					</select>
				</p>
				<p class='line'>
					<label>兴趣爱好</label>
					<input id='hobby' name='hobby' type='tel' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["hobby"];?>
'>
				</p>
				<p class='btn'>
					<button type='submit'>
						<img src="<?php echo @THEME;?>
Member/img/submit.png">
					</button>
				</p>
			</form>
		</div>
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript">
		// 手机号码验证
		jQuery.validator.addMethod("isphone", function(value, element) {
		  	var length = value.length; 
		  	
		  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
		  	
		  	return this.optional(element) || (length == 11 && mobile.test(value)); 
		}, "手机号码格式错误"); 
		$('#form').validate({
			debug:true,
			rules:{
				name:{
					required:true,
				},
				phone:{
					isphone:true,
					required:true
				},
				birth:'required',
				relation:{
					required:true,
					min:1
				}
			},
			messages:{
				name:'请输入姓名',
				phone:'手机号码格式错误',
				birth:'请输入生日',
				relation:{
					required:'请选择与本人关系',
					min:'请选择与本人关系'
				}
			},
			errorPlacement:function(error,element){
				$(element).closest('.line').after(error);
			},
			submitHandler:function(){
				$.ajax({
					type:'POST',
					dataType:'json',
					data:{
						'name':$('#name').val(),
						'birth':$('#birth').val(),
						'phone':$('#phone').val(),
						'relation':$('#relation').val(),
						'trade':$('#trade').val(),
						'hobby':$('#hobby').val()
					},
					success:function(msg){
						console.log(msg);
						if(msg['code']==200){
							window.location.href='<?php echo @HOME;?>
Member/family.html';
						}else{
							console.log(msg['data']);
						}
					}
				});
			}
		});
	</script>
</body>
</html><?php }} ?>