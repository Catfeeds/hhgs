<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>服务</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Service/css/order.css">
</head>
<body>
	<div class='container'>
		<div class='header'>
			<img src="{$smarty.const.UPLOAD}service/{$sinfo['img']}">
		</div>
		<div class='content'>
			<div class='title'>
				<p class='pt'>{$sinfo['name']}</p>
				<p class='pn'>{$sinfo['intro']}</p>
			</div>
			<div class='number'>本次剩余预约名额:<span>{$sinfo['last_number']}</span>名</div>
			<div class='area'>
				<span>服务区域</span>
				<p>{$sinfo['area']}</p>
			</div>
			<div class='time'>
				<span>上门服务时间</span>
				<p>{$sinfo['stime']|date_format:'%Y年%m月%d日'}至{$sinfo['etime']|date_format:'%Y年%m月%d日'}</p>
			</div>
			<div class='form'>
				<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
					<p class='bline'>
						<span>马上预约</span>
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
						<label>预约日期</label>
						<span class='wrp'><input id='date' name='date' type='date' value=''></span>
					</p>
					<p class='line'>
						<label>预约时间</label>
						<select id='time' name='time'>
							<option value=0>请选择预约时间</option>
							<option value='1'>上午 10:00–12：00</option>
							<option value='2'>下午 15：00—17：00</option>
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
	<div class='tips'></div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
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
					$('.tips').html(error).show();
					setTimeout(function(){
						$('.tips').hide();
					},2000);
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
								$('.tips').html('报名预约成功').show();
								setTimeout(function(){
									$('.tips').hide();
									window.location.href=location.href;
								},2000);								
							}else{
								$('.tips').html(msg['data']).show();
								setTimeout(function(){
									$('.tips').hide();
								},2000);
							}
						}
					});
				}
			});
		});
	</script>
</body>
</html>