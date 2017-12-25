<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>活动签到码核销</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link href="{$smarty.const.ORG}boot/bootstrap.min.css" rel="stylesheet">		
	<style type="text/css">
		.content{
			width: 90%;
			margin:80px auto;
			text-align: center;
		}
	</style>
<body>
	<div class='container'>
		<div class='content'>
			<p>活动名称：<span class='text-info'>{$info['name']}</span></p>
			<p>报名人姓名：<span class='text-info'>{$info['uname']}</span></p>
			<p>手机号码：<span class='text-info'>{$info['phone_num']}</span></p>
			<p>报名时间：<span class='text-info'>{$info['b_time']|date_format:'%Y-%m-%d %H:%M:%S'}</span></p>
			<p>携带人数：<span class='text-info'>{$info['carry_num']}</span></p>
			<p>是否签到：<span class='text-info'>{if $info['is_arrival'] eq 1}是{else}否{/if}</span></p>
			<p><input id='hexiao' class='form-control' type='password' placeholder='请输入此次活动的核销密码'></span></p>
			<br>
			<p>
				<button id='hxbtn' class='btn btn-lg btn-info'>签到码核销</button>
			</p>
		</div>
	</div>
	<script type="text/javascript" src='{$smarty.const.ORG}jquery/jquery-2.1.0.min.js'></script>
	<script type="text/javascript">
		$(function(){
			$('#hxbtn').click(function(){
				let hexiao=$('#hexiao').val();
				if(hexiao==''){
					alert('请输入核销码密码');
				}else{
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'hexiao':hexiao
						},
						success:function(msg){
							if(msg['code']==200){
								alert(msg['data']);
							}else
								alert(msg['data']);
						}
					});
				}
			});
		});
	</script>
</body>
</html>