<?php /* Smarty version Smarty-3.1.6, created on 2018-01-04 11:18:09
         compiled from "./Theme/default/Member/profile_edit.tpl" */ ?>
<?php /*%%SmartyHeaderCode:128640345a2f3e4e301736-85884970%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bda6803743202aa24dbfa838d28c94a47647b37b' => 
    array (
      0 => './Theme/default/Member/profile_edit.tpl',
      1 => 1515035879,
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
<?php if ($_valid && !is_callable('content_5a2f3e4e3309a')) {function content_5a2f3e4e3309a($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>个人信息</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Member/css/progress.css">
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
					<label>性别</label>
					<select id='sex' name='sex'>
						<option value=0>请选择性别</option>
						<option value=1 <?php if ($_smarty_tpl->tpl_vars['info']->value['sex']==1){?>selected<?php }?>>男</option>
						<option value=2 <?php if ($_smarty_tpl->tpl_vars['info']->value['sex']==2){?>selected<?php }?>>女</option>
					</select>
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
				<p id='authen' class='line'>
					<label>业主认证</label>
					<input  type='text' readonly value='<?php if ($_smarty_tpl->tpl_vars['info']->value["is_authen"]==1){?>已认证<?php }else{ ?>未认证<?php }?>'>
				</p>
				<div class='cover'>
					<div class='box'>
						<p class='close'>
							<img src="<?php echo @THEME;?>
Member/img/close.png">
						</p>
						<p class='title'><?php if ($_smarty_tpl->tpl_vars['info']->value['is_authen']==1){?>恭喜您，业主身份已认证！<?php }else{ ?>您花园里业主身份未认证！<?php }?></p>
						<p class='text'><?php if ($_smarty_tpl->tpl_vars['info']->value['is_authen']==1){?>认证信息如下：<?php }?></p>
						<div class='authen'>							
							<?php if ($_smarty_tpl->tpl_vars['info']->value['is_authen']==1){?>
							<p class='text'>
								<label>姓名</label>
								<?php echo $_smarty_tpl->tpl_vars['info']->value["uname"];?>

							</p>
							<p class='text'>
								<label>地块：</label>
								<?php echo $_smarty_tpl->tpl_vars['info']->value["area"];?>

							</p>
							<p class='text'>
								<label>房源：</label>
								<?php echo $_smarty_tpl->tpl_vars['info']->value["houseinfo"];?>

							</p>
							<p class='text'>
								<label>身份证号：</label>
								<?php echo $_smarty_tpl->tpl_vars['info']->value["id_card"];?>

							</p>
							<p class='text'>
								<label>置业顾问：</label>
								<?php echo $_smarty_tpl->tpl_vars['info']->value['cons_name'];?>

							</p>	
							<?php }else{ ?>
							<p class='text'>
								请联系花园里小花进行认证，谢谢！
							</p>	
							<?php }?>
						</div>
						<p class='tip'>如有疑问请联系小花：0371-60908262</p>
					</div>
				</div>
				<div class='text-center' style="padding: 8px;">个人信息完成度：</div>
				<div class='progress_w'>
					<div class="progress">
						<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $_smarty_tpl->tpl_vars['completion']->value;?>
%">							
						</div>
						<div class='pg s'>0</div>
						<div class='pg m'>50</div>
						<div class='pg e'>100</div>
					</div>				
					<div>&nbsp;<?php echo $_smarty_tpl->tpl_vars['completion']->value;?>
%</div>
				</div>
				<p class='btns'>
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
					phone:'isphone'

				},
				messages:{
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
							'birth':$('#birth').val(),
							'phone':$('#phone').val(),
							'marry':$('#marry').val(),
							'addr':$('#addr').val(),
							'trade':$('#trade').val(),
							'job':$('#job').val(),
							'residence':$('#residence').val(),
							'hobby':$('#hobby').val(),
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
								alert(msg['data']);
							}
						}
					});
				}
			});
			// 年龄自动生成
			$('#birth').blur(function(){
				set_age($(this));
			});
			$('.close').click(function(){
				$('.cover').hide();
			});
			$('#authen').click(function(){
				$('.cover').show();
			});
			!function animate(){
				$(".charts").each(function(i,item){
					var a=parseInt($(item).attr("w"));
					$(item).animate({
						width: a+"%"
					},1000);
				});
			}();
		});
	</script>
</body>
</html><?php }} ?>