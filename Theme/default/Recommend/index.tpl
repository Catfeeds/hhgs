<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>推荐有礼</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Recommend/css/index.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			<div class='info'>
				<p class='logo'>
					<img src="{$smarty.const.THEME}Recommend/img/logo.png">
				</p>
				<p>1.仅限本项目业主参与；</p>
				<p>2.若合同总金额在70万以内的奖励老业主价值1000元某商场或超市提货卡；</p>
				<p>3.若合同总金额在70万以上的奖励老业主价值2000元谋商场或超市提货卡</p>
				<div class='code'>
					<p id='words'>{$uid}</p>
					<p id='clip-btn'  data-clipboard-action="copy" data-clipboard-target="#words" data-clipboard-text="{$uid}">点击复制我的邀请码</p>
				</div>
			</div>
			<div class='form'>
				<p>
					<input id='code' type="text" name="" placeholder='请输入推荐人邀请码'>
				</p>
				<p>
					<button id='submit'>提交</button>
				</p>
			</div>
		</div>
	</div>
	<div class='tips'>复制成功</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src='{$smarty.const.ORG}clipboard/clipboard.min.js'></script>
	<script type="text/javascript">
		$(function(){
			// clipboard
		  	var clipboard = new Clipboard('#clip-btn');
		  	clipboard.on('success', function(e) {
		    	$('.tips').show();
		    	setTimeout(function(){
		    		$('.tips').hide();
		    	},1000);
		    });
		    clipboard.on('error', function(e) {
		        $('.tips').html('口令复制失败,请尝试长按复制');
			    $('.tips').show();
		    });
		    $('#submit').click(function(){
		    	let code=$('#code').val();
		    	if(code==''){
		    		alert('推荐人邀请码不能为空');
		    	}else{
		    		$.ajax({
		    			type:'POST',
		    			dataType:'json',
		    			url:'{$smarty.const.HOME}Recommend/save_code',
		    			data:{
		    				'code':code,
		    			},
		    			success:function(msg){
		    				if(msg['code']==200){
		    					alert('提交成功，我们的工作人员将会尽快进行审核');
		    				}else{
		    					alert(msg['data']);
		    				}
		    			}
		    		});
		    	}
		    });
		})
	</script>
</body>
</html>