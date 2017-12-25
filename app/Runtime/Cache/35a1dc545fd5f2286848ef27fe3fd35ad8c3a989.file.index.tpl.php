<?php /* Smarty version Smarty-3.1.6, created on 2017-12-25 18:37:45
         compiled from "./Theme/default/Consultant/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13533942805a40991636c2a6-10497333%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '35a1dc545fd5f2286848ef27fe3fd35ad8c3a989' => 
    array (
      0 => './Theme/default/Consultant/index.tpl',
      1 => 1514198262,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13533942805a40991636c2a6-10497333',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a4099163b393',
  'variables' => 
  array (
    'list' => 0,
    'item' => 0,
    'info' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a4099163b393')) {function content_5a4099163b393($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>置业顾问</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Consultant/css/index.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
				<div class='item' data-uid="<?php echo $_smarty_tpl->tpl_vars['item']->value['uid'];?>
">
					<div class='img'>
						<img src="<?php echo @UPLOAD;?>
headimg/<?php echo $_smarty_tpl->tpl_vars['item']->value['headimg'];?>
">
					</div>
					<div class='info'>
						<p class='name'><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</p>
						<p class='stars'>
							<span class='starimg' style='width: <?php echo 12*$_smarty_tpl->tpl_vars['item']->value["degree"];?>
px'>
							</span>	
							<span><?php echo sprintf('%.1f',$_smarty_tpl->tpl_vars['item']->value['degree']);?>
</span>
							<span class='pj <?php if ($_smarty_tpl->tpl_vars['item']->value["comment"]==1){?>pj_can<?php }?>'>评价</span>
						</p>
						<p class='infop'>年龄：<span><?php echo sprintf('%d',((time()-$_smarty_tpl->tpl_vars['item']->value['birth'])/3600/24/365));?>
</span>&nbsp;&nbsp;性别：<span><?php if ($_smarty_tpl->tpl_vars['item']->value['sex']==1){?>男<?php }else{ ?>女<?php }?></span></p>
						<p class='infop'>
							成交：<span><?php echo $_smarty_tpl->tpl_vars['item']->value['deal'];?>
</span>套&nbsp;&nbsp;关注人数：<span><?php echo $_smarty_tpl->tpl_vars['item']->value['fans'];?>
</span>
						</p>
					</div>
					<div class='btn yuyue'>预约</div>
				</div>
			<?php } ?>
		</div>
	</div>
	<div class='cover'>
		<div class='box'>
			<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
				<input id='cons_uid' type="hidden" name="cons_uid">
				<p class='line'>
					<label>姓名</label>
					<input id='name' name='name' type='text' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["uname"];?>
'>
				</p>
				<p class='line'>
					<label>手机号码</label>
					<input id='phone' name='phone' type='tel' value='<?php echo $_smarty_tpl->tpl_vars['info']->value["phone_num"];?>
'>
				</p>
				<p class='line'>
					<label>预约方式</label>
					<select id='type' name='type'>
						<option value=1 <?php if ($_smarty_tpl->tpl_vars['info']->value['type']==1){?>selected<?php }?>>在线预约</option>
						<option value=2 <?php if ($_smarty_tpl->tpl_vars['info']->value['type']==2){?>selected<?php }?>>到场预约</option>
					</select>
				</p>
				<p class='line'>
					<label>预约日期</label>
					<span class='wrp'><input id='date' name='date' type='date' value='<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value["date"],"%Y-%m-%d");?>
'></span>
				</p>
				<p class='line'>
					<label>预约时间</label>
					<span class='wrp'><input id='time' name='time' type='time' value='<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value["time"],"%Y-%m-%d");?>
'></span>
				</p>
				<p id='error'></p>
				<p style='padding: 15px 0;'>
					<button type='submit' class='btn btn-submit'>报名预约</button>
				</p>
			</form>		
		</div>
		<p class='close'>
			<img src="<?php echo @THEME;?>
Consultant/img/close.png">
		</p>
	</div>
	<div class='cover_comment'>
		<div id='close'>
			<img src="<?php echo @THEME;?>
Consultant/">
		</div>
		<div class='box'>
			<input id='comm_uid' type="hidden">
			<div id="star">
				<span>请对置业顾问进行评价</span>
				<ul>
					<li><a href="javascript:;">1</a></li>
					<li><a href="javascript:;">2</a></li>
					<li><a href="javascript:;">3</a></li>
					<li><a href="javascript:;">4</a></li>
					<li><a href="javascript:;">5</a></li>
				</ul>
				<span></span>
				<p></p>
			</div>
			<div class='text' style='padding-top: 10px;'>
				<textarea id='comment' rows="5" style='width: 100%;resize:none;border:1px solid rgba(130,130,130,0.2);padding: 3px;' placeholder="请留下您对本顾问的建议/意见，以便我们为您提供更好的服务！！！"></textarea>
			</div>
			<div style='padding-top: 10px;'>
				<button id='com_sub' class='btn btn-submit'>提交您的评论</button>
			</div>
		</div>
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src='<?php echo @THEME;?>
Consultant/js/stars.js'></script>
	<script type="text/javascript">
		$(function(){
			$('.yuyue').click(function(){
				let uid=$(this).parent().data('uid');
				$('#cons_uid').val(uid);
				$('.cover').slideDown();
			});
			// 手机号码验证
			jQuery.validator.addMethod("isphone", function(value, element) {
			  	var length = value.length; 
			  	
			  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
			  	
			  	return this.optional(element) || (length == 11 && mobile.test(value)); 
			}, "手机号码格式错误"); 
			$('#form').validate({
				debug:true,
				rules:{
					name:'required',
					phone:{
						required:true,
						isphone:true,
					},
					date:'required',
					time:'required',
				},
				messages:{
					name:'姓名不能为空',
					phone:'手机号码格式错误',
					date:'请选择预约日期',
					time:'请选择预约时间'
				},
				errorPlacement:function(error,element){
					$('#error').html(error);
				},
				submitHandler:function(){
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'cons_uid':$('#cons_uid').val(),
							'name':$('#name').val(),
							'date':$('#date').val(),
							'time':$('#time').val(),
							'phone_num':$('#phone').val(),
							'type':$('#type').val(),
						},
						success:function(msg){
							if(msg['code']==200){
								alert('报名预约成功');
								window.location.href=location.href;
							}else{
								console.log(msg['data']);
							}
						}
					});
				}
			});
			$('.close img').click(function(){
				$('#cons_uid').val('');
				$('.cover').hide();
			});
			$('.pj_can').click(function(){
				let comm_uid=$(this).parent().parent().parent().data('uid');
				$('#comm_uid').val(comm_uid);
				$('.cover_comment').slideDown();
			});
			// 提交评论
			$('#com_sub').click(function(){
				let cons_uid=$('#comm_uid').val();
				let score=$('#score').data('value');
				let comment=$('#comment').val();
				if(score==''){
					alert('请输入您的评分');
				}
				$.ajax({
					type:'POST',
					dataType:'json',
					url:'<?php echo @HOME;?>
Consultant/comment_submit',
					data:{
						'cons_uid':cons_uid,
						'score':score,
						'comment':comment
					},
					success:function(msg){
						if(msg['code']==200){
							alert('评论提交成功');
							window.location.reload();
						}else{
							alert(msg['data']);
						}
					}
				});
			});
		});
	</script>
</body><?php }} ?>