<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 20:43:47
         compiled from "./Theme/default/Activity/attend.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14542077275a372da52c6971-53175042%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9eff014833b44c426b0e831f565c075383428813' => 
    array (
      0 => './Theme/default/Activity/attend.tpl',
      1 => 1514465022,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14542077275a372da52c6971-53175042',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a372da533ad0',
  'variables' => 
  array (
    'ainfo' => 0,
    'join' => 0,
    'uinfo' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a372da533ad0')) {function content_5a372da533ad0($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/alidata/www/api/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>活动</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Activity/css/attend.css">
</head>
<body>
	<div class='container'>
		<div class='header'>
			<img src="<?php echo @UPLOAD;?>
activity/<?php echo $_smarty_tpl->tpl_vars['ainfo']->value['titleimg'];?>
">
		</div>
		<div class='content'>
			<input id='uid' type="hidden" name='uid' value="<?php echo $_smarty_tpl->tpl_vars['ainfo']->value['uid'];?>
">
			<div class='info'>
				<p class='title'><?php echo $_smarty_tpl->tpl_vars['ainfo']->value['name'];?>
</p>
				<p class='info-line'>
					<label><img src="<?php echo @THEME;?>
Activity/img/time.png"></label>
					<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['ainfo']->value['date'],'%Y年%m月%d日');?>
 <?php echo $_smarty_tpl->tpl_vars['ainfo']->value['time'];?>

				</p>
				<p class='info-line'>
					<label><img src="<?php echo @THEME;?>
Activity/img/po.png"></label>
					<?php echo $_smarty_tpl->tpl_vars['ainfo']->value['address'];?>

				</p>
				<p class='info-line'>
					<label><img src="<?php echo @THEME;?>
Activity/img/per.png"></label>
					当前报名人数<?php echo $_smarty_tpl->tpl_vars['join']->value;?>
人，活动人数上限<?php echo $_smarty_tpl->tpl_vars['ainfo']->value['limitnum'];?>
人
				</p>
			</div>
			<div class='detail'>
				<div class='pcontent'>
				<?php echo stripslashes(htmlspecialchars_decode($_smarty_tpl->tpl_vars['ainfo']->value['detail']));?>

				</div>
			</div>
			<div class='form'>
				<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
					<p class='bline'>
						<span>我要报名</span>
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
						<label>报名人数</label>
<!-- 						<input id='number' name='number' type='number' value='<?php echo $_smarty_tpl->tpl_vars['uinfo']->value["carry_num"];?>
' min=0 max='<?php echo $_smarty_tpl->tpl_vars['ainfo']->value["carrynum"];?>
'>
 -->						<select id='number' name='number'>
							<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['ainfo']->value['carrynum'];?>
<?php $_tmp1=ob_get_clean();?><?php if (isset($_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum'])) unset($_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['name'] = 'carrynum';
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['loop'] = is_array($_loop=$_tmp1) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['show'] = true;
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['max'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['loop'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['step'] = 1;
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['start'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['step'] > 0 ? 0 : $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['loop']-1;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['show']) {
    $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['total'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['loop'];
    if ($_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['total'] == 0)
        $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['show'] = false;
} else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['total'] = 0;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['show']):

            for ($_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['index'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['iteration'] = 1;
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['iteration'] <= $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['total'];
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['index'] += $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['step'], $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['iteration']++):
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['rownum'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['iteration'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['index_prev'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['index'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['index_next'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['index'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['first']      = ($_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['iteration'] == 1);
$_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['last']       = ($_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['iteration'] == $_smarty_tpl->tpl_vars['smarty']->value['section']['carrynum']['total']);
?>
								<option <?php if ($_smarty_tpl->tpl_vars['uinfo']->value["carry_num"]==$_smarty_tpl->getVariable('smarty')->value['section']['carrynum']['index']){?>selected<?php }?> value='<?php echo $_smarty_tpl->getVariable('smarty')->value['section']['carrynum']['index'];?>
'><?php echo $_smarty_tpl->getVariable('smarty')->value['section']['carrynum']['index'];?>
</option>
							<?php endfor; endif; ?>
						</select>
					</p>
					<p class='qrcode'>
						<?php if ($_smarty_tpl->tpl_vars['uinfo']->value['qrcode']){?>
						<img src="<?php echo @HOME;?>
<?php echo $_smarty_tpl->tpl_vars['uinfo']->value['qrcode'];?>
">
						<?php }?>
					</p>
					<p id='error'></p>
					<p class='btn_wrap'>
						<button class='btn' type='submit' <?php if ($_smarty_tpl->tpl_vars['uinfo']->value['uid']!=''){?>disabled>报名成功<?php }else{ ?>>提交报名<?php }?></button>
					</p>
				</form>
			</div>
		</div>
	</div>
	<div class='cover'>
		<div class='message_box'>
			<p id='img'></p>
			<p class='content'></p>
			<p class='btn'>
				<button id='close'>确认</button>
			</p>
		</div>
	</div>
	<script type="text/javascript" src='<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js'></script>
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
						isphone:true,
						required:true
					},
					number:{
						required:true,
						digits:true,
						min:0,
						max:<?php echo $_smarty_tpl->tpl_vars['ainfo']->value["carrynum"];?>
,
					}

				},
				messages:{
					name:'请输入您的姓名',
					phone:{
						required:'手机号码不能为空',
						isphone:'请输入正确的手机号码'
					},
					number:{
						required:'请输入报名人数',
						digits:'报名人数必须为整数',
						min:'报名人数不能为负数',
						max:'最多可携带<?php echo $_smarty_tpl->tpl_vars['ainfo']->value["carrynum"];?>
人'
					}
				},
				errorPlacement:function(error,element){
					$('#error').html(error);
				},
				submitHandler:function(){
					$.ajax({
						url:'attend_post.html?uid=<?php echo $_smarty_tpl->tpl_vars['ainfo']->value["uid"];?>
',
						type:'POST',
						dataType:'json',
						data:{
							'name':$('#name').val(),
							'phone':$('#phone').val(),
							'number':$('#number').val()
						},
						success:function(msg){
							if(msg['code']==200){
								$('.message_box .img').html('<img src="<?php echo @HOME;?>
"'+msg['data']+'>');
								$('.message_box .content').html('报名成功,请妥善保管您的签到二维码');
								$('.cover').show();
							}else{
								$('.message_box .content').html(msg['data']);
								$('.cover').show();
							}
						}
					});
				},
			});

			$('#close').click(function(){
				$('.cover').slideUp();
				setTimeout(function(){
					window.location.reload();
				},1000);
			});
		});
	</script>
</body>
</html><?php }} ?>