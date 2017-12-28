<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>活动</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Activity/css/attend.css">
</head>
<body>
	<div class='container'>
		<div class='header'>
			<img src="{$smarty.const.UPLOAD}activity/{$ainfo['titleimg']}">
		</div>
		<div class='content'>
			<input id='uid' type="hidden" name='uid' value="{$ainfo['uid']}">
			<div class='info'>
				<p class='title'>{$ainfo['name']}</p>
				<p class='info-line'>
					<label><img src="{$smarty.const.THEME}Activity/img/time.png"></label>
					{$ainfo['date']|date_format:'%Y年%m月%d日'} {$ainfo['time']}
				</p>
				<p class='info-line'>
					<label><img src="{$smarty.const.THEME}Activity/img/po.png"></label>
					{$ainfo['address']}
				</p>
				<p class='info-line'>
					<label><img src="{$smarty.const.THEME}Activity/img/per.png"></label>
					当前报名人数{$join}人，活动人数上限{$ainfo['limitnum']}人
				</p>
			</div>
			<div class='detail'>
				<div class='pcontent'>
				{$ainfo['detail']|htmlspecialchars_decode|stripslashes}
				</div>
			</div>
			<div class='form'>
				<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
					<p class='bline'>
						<span>我要报名</span>
					</p>
					<p class='line'>
						<label>姓名</label>
						<input id='name' name='name' type='text' value='{$uinfo["uname"]}'>
					</p>
					<p class='line'>
						<label>手机号码</label>
						<input id='phone' name='phone' type='tel' value='{$uinfo["phone_num"]}'>
					</p>
					<p class='line'>
						<label>报名人数</label>
<!-- 						<input id='number' name='number' type='number' value='{$uinfo["carry_num"]}' min=0 max='{$ainfo["carrynum"]}'>
 -->						<select id='number' name='number'>
							{section name=carrynum loop={$ainfo['carrynum']}}
								<option {if $uinfo["carry_num"] eq $smarty.section.carrynum.index}selected{/if} value='{$smarty.section.carrynum.index}'>{$smarty.section.carrynum.index}</option>
							{/section}
						</select>
					</p>
					<p class='qrcode'>
						{if $uinfo['qrcode']}
						<img src="{$smarty.const.HOME}{$uinfo['qrcode']}">
						{/if}
					</p>
					<p id='error'></p>
					<p class='btn_wrap'>
						<button class='btn' type='submit' {if $uinfo['uid'] neq ''}disabled>报名成功{else}>提交报名{/if}</button>
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
	<script type="text/javascript" src='{$smarty.const.ORG}jquery/jquery-2.1.0.min.js'></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 手机号码验证
			jQuery.validator.addMethod("isphone", function(value, element) {
			  	var length = value.length; 
			  	{literal}
			  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
			  	{/literal}
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
						max:{$ainfo["carrynum"]},
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
						max:'最多可携带{$ainfo["carrynum"]}人'
					}
				},
				errorPlacement:function(error,element){
					$('#error').html(error);
				},
				submitHandler:function(){
					$.ajax({
						url:'attend_post.html?uid={$ainfo["uid"]}',
						type:'POST',
						dataType:'json',
						data:{
							'name':$('#name').val(),
							'phone':$('#phone').val(),
							'number':$('#number').val()
						},
						success:function(msg){
							if(msg['code']==200){
								$('.message_box .img').html('<img src="{$smarty.const.HOME}"'+msg['data']+'>');
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
</html>