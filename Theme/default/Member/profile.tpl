<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>个人中心</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Member/css/profile.css">
</head>
<body>
	<div class='container'>
		<!-- 个人信息 -->
		<div class='header'>
			<div class='headimg'>
				<img src="{$info['headimg']}">
				{if $info['is_authen'] eq 1}<p class="vip"><img src="{$smarty.const.THEME}Member/img/vip.png"></p>{/if}
			</div>
			<div class='info'>
				<p class='iname'>{$info['uname']}</p>
				<p class='iauthen'>{if $info['is_authen'] eq 1}花园里认证业主{else}业主未认证{/if}</p>
			</div>
			<div id='clock_in' class='clockin'>
				<!-- <img src="{$smarty.const.THEME}Member/img/clockin.png"> -->
				<div class='flex'><img src="{$smarty.const.THEME}Member/img/coin.png"><span>&nbsp;签到</span></div>
			</div>
		</div>
		<!-- 等级信息 -->
		<div class='levelgrounp'>
			<div class='l-item'>
				<p class='p-info'>{if $info['score'] eq null}0{else} {$info['score']}{/if}</p>
				<p class='p-label'>活跃值</p>
			</div>
			<div class='l-item'>
				<p class='p-info'>
					<i>Lv</i> {if $info['level'] eq null}0{else} {$info['lv']}{/if}
				</p>
				<p  class='p-label'>等级</p>
			</div>
			<div class='l-item'>
				<p class='p-info'>
				{if $info['level'] eq null}0
				{else if $info['level'] gt 500}500+
				{else}{$info['level']}
				{/if}
				</p>
				<p  class='p-label'>成长值</p>
			</div>
		</div>
		<!-- 菜单项目 -->
		<div class='groups'>
			<div class='item'>
				<a href="{$smarty.const.HOME}Member/profile_edit.html">
					<p><img src="{$smarty.const.THEME}Member/img/1.png"></p>
					<p>个人信息</p>
					<p class='more'><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="{$smarty.const.HOME}Member/levels.html">
					<p><img src="{$smarty.const.THEME}Member/img/2.png"></p>
					<p>等级权限</p>
					<p class='more'><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="{$smarty.const.HOME}Member/family.html">
					<p><img src="{$smarty.const.THEME}Member/img/3.png"></p>
					<p>家庭成员</p>
					<p class='more'><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
		</div>
		<div class='groups'>
			<div class='item'>
				<a id='tel' href="javascript:;">
					<p><img src="{$smarty.const.THEME}Member/img/4.png"></p>
					<p>帮助中心</p>
					<p class='more'><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="{$smarty.const.HOME}Member/advice.html">
					<p><img src="{$smarty.const.THEME}Member/img/5.png"></p>
					<p>意见反馈</p>
					<p class='more'><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
		</div>
		<div class='groups'>
			<div class='item'>
				<a href="{$smarty.const.HOME}Recommend/index.html">
					<p><img src="{$smarty.const.THEME}Member/img/gift.png"></p>
					<p>推荐有礼</p>
					<p class='more'><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
		</div>
		<div style="padding: 20px;"></div>
	</div>
	<div id='cover' class='cover'>
		<div class='message_box'>
			<p id='img'></p>
			<div class='content'>
				<h2>客服电话</h2>
				<h1>0371-60908262</h1>
			</div>
			<p class='btn'>
				<button id='close'>取消</button>&nbsp;&nbsp;
				<button ><a href="tel:0371-60908262">呼叫</a></button>
			</p>
		</div>
	</div>
	<div id='cover1' class='cover'>
		<div class='message_box'>
			<div class='close'><img src="{$smarty.const.THEME}Member/img/close.png"></div>
			<div class='content'></div>
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 签到获取积分与经验值
			$('#clock_in .flex').click(function(){
				$.ajax({
					type:'POST',
					url:'{$smarty.const.HOME}Member/clock_in',
					dataType:'json',
					success:function(msg){
						if(msg['code']==200){
							$('#cover1 .content').html('<p>恭喜您,签到成功</p><p>获得了'+msg['data'][1]+'活跃值</p>');							
						}else
							$('#cover1 .content').html('<p>'+msg['data']+'</p>');
						$('#cover1').show();
					}
				});
			});
			$('#tel').click(function(){
				
				$('#cover').slideDown();
			});
			$('#close').click(function(){
				$('#cover').hide();
			});
			$('#cover1 .close').click(function(){
				$('#cover1').hide();
			});

		});
	</script>
</body>
</html>