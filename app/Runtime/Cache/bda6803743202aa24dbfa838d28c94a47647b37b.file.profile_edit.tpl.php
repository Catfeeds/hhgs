<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 20:56:33
         compiled from "./Theme/default/Member/profile_edit.tpl" */ ?>
<?php /*%%SmartyHeaderCode:128640345a2f3e4e301736-85884970%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bda6803743202aa24dbfa838d28c94a47647b37b' => 
    array (
      0 => './Theme/default/Member/profile_edit.tpl',
      1 => 1514465784,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '128640345a2f3e4e301736-85884970',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a2f3e4e3309a',
  'variables' => 
  array (
    'info' => 0,
    'trade' => 0,
    't' => 0,
    'completion' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a2f3e4e3309a')) {function content_5a2f3e4e3309a($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/alidata/www/api/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>个人信息</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Member/css/profile_edit.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			<p class='headimg'>
				<img src="<?php echo $_smarty_tpl->tpl_vars['info']->value['headimg'];?>
">
			</p>
			<p class='tips'>个人信息越完善，特权越多哟！</p>
			<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
				<p class='line'>
					<label>姓名</label>
					<input name='name' type='text' disabled value='<?php echo $_smarty_tpl->tpl_vars['info']->value["uname"];?>
'>
				</p>
				<p class='line'>
					<label>性别</label>
					<select id='sex' name='sex'>
						<option value=0>请选择性别</option>
						<option value=1 <?php if ($_smarty_tpl->tpl_vars['info']->value['sex']==1){?>selected<?php }?>>男</option>
						<option value=2 <?php if ($_smarty_tpl->tpl_vars['info']->value['sex']==2){?>selected<?php }?>>女</option>
					</select>
				</p>
				<p class='line'>
					<label>身份证号码</label>
					<input id='id' name='id' type='number' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["id_card"];?>
'>
				</p>
				<p class='line'>
					<label>生日</label>
					<span class='wrp'><input id='birth' name='birth' type='date' value='<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value["birth"],"%Y-%m-%d");?>
'></span>
				</p>
				<p class='line'>
					<label>年龄</label>
					<input id='age' name='age' type='number' disabled="">
				</p>
				<p class='line'>
					<label>手机号码</label>
					<input id='phone' name='phone' type='tel' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["phone_num"];?>
'>
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
					<label>职业</label>
					<input id='job' name='job' type='text' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["job"];?>
'>
				</p>
				<p class='line'>
					<label>婚姻状态</label>
					<select id='marry' name='marry'>
						<option value=0>请选择婚姻状态</option>
						<option value=1 <?php if ($_smarty_tpl->tpl_vars['info']->value['marital_status']==1){?>selected<?php }?>>单身</option>
						<option value=2 <?php if ($_smarty_tpl->tpl_vars['info']->value['marital_status']==2){?>selected<?php }?>>已婚</option>
						<option value=3 <?php if ($_smarty_tpl->tpl_vars['info']->value['marital_status']==3){?>selected<?php }?>>恋爱中</option>
						<option value=4 <?php if ($_smarty_tpl->tpl_vars['info']->value['marital_status']==4){?>selected<?php }?>>有小孩</option>
					</select>
				</p>
				<p class='line'>
					<label>常住地</label>
					<input id='addr' name='addr' type='text' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["address"];?>
'>
				</p>
				<p class='line'>
					<label>现住址</label>
					<input id='residence' name='residence' type='text' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["residence"];?>
'>
				</p>
				<p class='line'>
					<label>兴趣爱好</label>
					<input id='hobby' name='hobby' type='text' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["hobby"];?>
'>
				</p>
				<p class='line'>
					<label>房源信息</label>
					<input id='houseinfo' name='houseinfo' type='text' disabled value='<?php echo $_smarty_tpl->tpl_vars['info']->value["houseinfo"];?>
'>
				</p>
				<p class='line'>
					<label>置业顾问</label>
					<input id='consultant' name='consultant' disabled type='text'>
				</p>
				<p class='line'>
					<label>置业动机</label>
					<select id='reason' name='reason'>
						<option value=0>请选择置业动机</option>
						<option <?php if ($_smarty_tpl->tpl_vars['info']->value['buy_reason']==1){?>selected<?php }?> value=1>自住</option>
						<option <?php if ($_smarty_tpl->tpl_vars['info']->value['buy_reason']==2){?>selected<?php }?> value=2>投资</option>
						<option <?php if ($_smarty_tpl->tpl_vars['info']->value['buy_reason']==3){?>selected<?php }?> value=3>孩子上学</option>
						<option <?php if ($_smarty_tpl->tpl_vars['info']->value['buy_reason']==4){?>selected<?php }?> value=4>其他</option>
					</select>
				</p>
				<p class='line'>
					<label>置业次数</label>
					<select id='times' name='times'>
						<option  <?php if ($_smarty_tpl->tpl_vars['info']->value['buy_times']==0){?>selected<?php }?> value=0>请选择置业次数</option>
						<option  <?php if ($_smarty_tpl->tpl_vars['info']->value['buy_times']==1){?>selected<?php }?> value=1>1次</option>
						<option  <?php if ($_smarty_tpl->tpl_vars['info']->value['buy_times']==2){?>selected<?php }?> value=2>2次</option>
						<option  <?php if ($_smarty_tpl->tpl_vars['info']->value['buy_times']==3){?>selected<?php }?> value=3>3次及以上</option>
					</select>
				</p>
				<p class='line'>
					<label>爱车数量</label>
					<select id='car' name='car'>
						<option value=0>请选择爱车数量</option>
						<option <?php if ($_smarty_tpl->tpl_vars['info']->value['car_amount']==1){?>selected<?php }?> value=1>无</option>
						<option <?php if ($_smarty_tpl->tpl_vars['info']->value['car_amount']==2){?>selected<?php }?> value=2>1辆</option>
						<option <?php if ($_smarty_tpl->tpl_vars['info']->value['car_amount']==3){?>selected<?php }?> value=3>2辆</option>
						<option <?php if ($_smarty_tpl->tpl_vars['info']->value['car_amount']==4){?>selected<?php }?> value=4>3辆及以上</option>
					</select>
				</p>
				<p class='line'>
					<label>爱车品牌</label>
					<input id='carbrand' name='carbrand' type='text' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["car_brand"];?>
'>
				</p>
				<p style='text-align: center;'>完成度：<?php echo $_smarty_tpl->tpl_vars['completion']->value;?>
%</p>
				<p class=btn>
					<button type=submit>
						<div class='sub_bg'>更新信息</div>
					</button>
				</p>
			</form>
		</div>
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src='<?php echo @JS;?>
card.js'></script>
	<script type="text/javascript">
		$(function(){
			// 手机号码验证
			jQuery.validator.addMethod("isphone", function(value, element) {
			  	var length = value.length; 
			  	
			  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
			  	
			  	return this.optional(element) || (length == 11 && mobile.test(value)); 
			}, "手机号码格式错误"); 
			// 身份证验证
			jQuery.validator.addMethod("isIdCardNo", function(value, element) { 
				return this.optional(element) || idCardNoUtil.checkIdCardNo(value); 
			}, "请正确输入您的身份证号码"); 
			var set_age=function(element){
				let birth=element.val();
				birthstamp=Date.parse(new Date(birth));
				let nowstamp=Date.parse(new Date());
				let age= Math.floor((nowstamp-birthstamp)/1000/(60*60*24*365));
				if(!isNaN(age))
					$('#age').val(age);
			}
			let birth=$('#birth').val();
			if(birth)
				set_age($('#birth'));
			$('#form').validate({
				// debug:true,
				rules:{
					id:'isIdCardNo',
					phone:'isphone'

				},
				messages:{
					id:'请输入正确的身份证号码',
					phone:'手机号码格式错误'
				},
				errorPlacement:function(error,element){
					$(element).closest('.line').after(error);
				},
				submitHandler:function(){
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'sex':$('#sex').val(),
							'id':$('#id').val(),
							'birth':$('#birth').val(),
							'phone':$('#phone').val(),
							'marry':$('#marry').val(),
							'addr':$('#addr').val(),
							'trade':$('#trade').val(),
							'job':$('#job').val(),
							'residence':$('#residence').val(),
							'hobby':$('#hobby').val(),
							// 'houseinfo':$('#houseinfo').val(),
							'reason':$('#reason').val(),
							'times':$('#times').val(),
							'car':$('#car').val(),
							'carbrand':$('#carbrand').val(),
						},
						success:function(msg){
							if(msg['code']==200){
								alert('信息更新成功');
								window.location.href=location.href;
							}else{
								console.log(msg['data']);
							}
						}
					});
				}
			});
			// 年龄自动生成
			$('#birth').blur(function(){
				set_age($(this));
			});
		});
	</script>
</body>
</html><?php }} ?>