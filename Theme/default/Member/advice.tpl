<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>意见反馈</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Member/css/common.css">
	<style type="text/css">
		.btn{
			padding:20px;
		}
		.btn button{
			width: 100%;
			background: transparent;
		}
		.sub_bg{
			background: -webkit-linear-gradient(left, rgb(207,166,108), rgb(238,210,170));
			color: #fff;
			border-radius: 3px;
			padding:7px 0;
		}
		.text{
			padding: 20px;
		}
		.text #text{
			width: 100%;
			border:1px solid rgba(0,0,0,0.1);
			resize:none;
			border-radius: 5px;
			padding: 10px;
		}
	</style>
</head>
<body>
	<div class='container'>
		<div class='content'>
			<div class='text'>
				<textarea rows="8" id='text' placeholder="请输入你的意见或建议，小花将会在第一时间进行评估处理。感谢您的热心反馈哦！"></textarea>
			</div>
			<div class='btn'>
				<button id='submit'>
					<div class='sub_bg'>提交您的意见</div>
				</button>
			</div>
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#submit').click(function(){
				let text=$('#text').val();
				if(text==''){
					alert('感谢您为我们提供宝贵的意见');
				}else{
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'content':text,
						},
						success:function(msg){
							if(msg['code']==200)
								alert('感谢您为我们提供宝贵的意见');
							else
								alert(msg['data']);
						}
					});
				}
				
			});
		});
	</script>
</body>
</html>