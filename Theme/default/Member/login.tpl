<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>花园里花园公社</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Member/css/login.css">
</head>
<body>
	<div class='container'>
		<div class='logo'>
			<img src="{$smarty.const.THEME}Member/img/logo.png">
		</div>
		<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
			<p class='form-line'>
				<input id='name' name='name' type='text' placeholder='姓名'>
			</p>		
			<p class='form-line'>
				<input id='tel' name='tel' type='tel' placeholder="手机号">
			</p>
			<div class='form-line'>
				<input id='code' name="valicode" type="number" placeholder="验证码" >
				<div class='getcode'>获取验证码</div>
			</div>
			<p class='form-line'>
				<label class='read'>
					<input id='alread' type='radio' name='read'>我已阅读并遵守<a id='read' href="javascript:;">《花园公约》</a>
				</label>
			</p>
			<p class='ajax_error'></p>
			<p class='form-line' style='padding-top:40px;'>
				<button type='submit'>
					<div class='sub_bg'>提交信息</div>
				</button>
			</p>
		</form>
	</div>
	<div class='cover'>
		<div class='read_frame'>
			<div class='content'>
				<h2>花园公约</h2>
				<img src="{$smarty.const.THEME}Member/img/huayuan.jpeg">
			</div>
			<button class='close_btn'>我已阅读</button>
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$(function(){
			jQuery.validator.addMethod("isphone", function(value, element) {
			  	var length = value.length; 
			  	{literal}
			  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
			  	{/literal}
			  	return this.optional(element) || (length == 11 && mobile.test(value)); 
			}, "手机号码格式错误"); 
			$('#form').validate({
				rules:{
					name:{
						required:true,
					},
				 	tel:{
				 		required:true,
				 		isphone:true
				 	},
				 	valicode:{
				 		required:true,
				 		digits:true,
				 	},
				 	read:{
				 		required:true
				 	}
				},
				messages:{
					name:'姓名不能为空',
					tel:{
						required:'请输入您的电话号码',
						isMobile:'手机号码格式错误'
					},
					valicode:{
						required:'请输入验证码',
						digits:'验证码格式错误'
					},
					read:{
						required:'注册前请阅读《花园公约》'
					}
				},
				submitHandler:function(form){
					$.ajax({
						url:'',
						type:'post',
						dataType:'json',
						data:{
							'name':$('#name').val(),
							'tel':$('#tel').val(),
							'code':$('#code').val()
						},
						success:function(msg){
							if(msg['code']==200){
								let refer=JSON.parse(msg['data']);	
								window.location.href='{$smarty.const.HOME}'+refer[0]+'/'+refer[1];
							}else if(msg['code']==401){
								$('.ajax_error').html('验证码输入错误');
							}else
								$('.ajax_error').html(msg['data']);
						}
					});
				}
			});
			// 获取验证码
			var disable=0;
			var inter=60;
			$('.getcode').click(function(){
				var boolean = $("#form").validate().element($("#tel"));
				if(!boolean)return;
				let tel=$('#tel').val();
				let that=$(this);				
				if(tel&&!disable){
					$.ajax({
						type:'post',
						url:'{$smarty.const.HOME}Member/get_smscode',
						dataType:'json',
						data:{
							tel:tel
						},
						success:function(msg){
							if(msg['code']==200){
								let interval=setInterval(function(){
									;
									console.log('创建');
									if((inter--)>0){
										that.html(inter+'秒后获取');
										disable=1;
									}
									else{
										that.html('获取验证码');
										disable=0;
										inter=60;
										clearInterval(interval);
									}
								},1000);
							}
							else
								console.log(msg);
						}
					});
				}
			});
			$('#code').focus(function(){
				$('.ajax_error').html('');
			});
			$('#read').click(function(){

			});
			$('#read').click(function(){
				$('.cover').slideDown();
			});
			
			$('.close_btn').click(function(){
				$('.cover').hide();
				$('#alread').attr('checked',true);
			});
		});
	</script>
</body>
</html>