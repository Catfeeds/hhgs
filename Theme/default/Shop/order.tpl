<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>积分商城</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Shop/css/order.css">
</head>
<body>
	<div class='container'>
		<div class='info'>
			<div class='img'>
				<img src="{$smarty.const.UPLOAD}goods/{$goods_info['thumbnail']}">
			</div>
			<div class='text'>
				<p class='t'>{$goods_info['goods_name']}</p>
				<p class='s'>{$goods_info['goods_intro']}</p>
				<p id='price' class='c'><span><i style='font-style:normal;'>{$goods_info['goods_price']|string_format:"%d"}</i>活跃值</span></p>
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
							{if $goods_info['pay_type'] eq 1}物业中心自取{else}其他{/if}
						</p>
					</div>
				</div>
				<div class='groups'>
					<div class='item'>
						<p>姓名</p>
						<p>
							<input id='name' name="name" type="text" value='{$mem_info["uname"]}'>
						</p>
					</div>
					<div class='item'>
						<p>联系方式</p>
						<p>
							<input id='phone' name="phone" type="tel" value='{$mem_info["phone_num"]}'>
						</p>
					</div>
					<div class='item'>
						<p><textarea id='remarks' name='remarks' rows='4' style='resize:none; width: 100%;font-size: 12px;border:none;' placeholder='点击填写备注信息'></textarea></p>
					</div>
				</div>
				<div class='btn_wrap'>
					<p>订单消耗活跃值：<span id='total'>{$goods_info['goods_price']|string_format:"%d"}</span></p>
					<p><button class='btn' type='submit'>提交订单</button></p>
				</div>
			</form>
		</div>		
	</div>
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
</html>