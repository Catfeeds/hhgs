<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>家庭成员管理</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Member/css/family_mem.css">
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
					<input id='name' name='name' type='text' value='{$info["uname"]}'>
				</p>
				<p class='line'>
					<label>生日</label>
					<span class='wrp'><input id='birth' name='birth' type='date' value='{$info["birth"]|date_format:"%Y-%m-%d"}'></span>
				</p>
				<p class='line'>
					<label>手机号码</label>
					<input id='phone' name='phone' type='tel' value='{$info["phone_num"]}'>
				</p>
				<p class='line'>
					<label>与本人关系</label>
					<select id='relation' name='relation'>
						<option value=0>请选择与本人关系</option>
						{foreach $relation as $r}
							<option value={$r['uid']} {if $info['relation'] eq $r['uid']}selected{/if}>{$r['relation']}</option>
						{/foreach}
					</select>
				</p>
				<p class='line'>
					<label>行业</label>
					<select id='trade' name='trade'>
						<option value=0>请选择您的行业</option>
						{foreach $trade as $t}
							<option {if $info['trade'] eq $t['uid']}selected{/if} value='{$t["uid"]}'>{$t['name']}</option>
						{/foreach}
					</select>
				</p>
				<p class='line'>
					<label>兴趣爱好</label>
					<input id='hobby' name='hobby' type='tel' value='{$info["hobby"]}'>
				</p>
				<p class='btn'>
					<button type='submit'>
						<img src="{$smarty.const.THEME}Member/img/submit.png">
					</button>
				</p>
			</form>
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript">
		// 手机号码验证
		jQuery.validator.addMethod("isphone", function(value, element) {
		  	var length = value.length; 
		  	{literal}
		  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
		  	{/literal}
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
							window.location.href='{$smarty.const.HOME}Member/family.html';
						}else{
							console.log(msg['data']);
						}
					}
				});
			}
		});
	</script>
</body>
</html>