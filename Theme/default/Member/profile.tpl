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
				<p class="vip"><img src="{$smarty.const.THEME}Member/img/vip.png"></p>
			</div>
			<div class='info'>
				<p class='iname'>{$info['uname']}</p>
				<p class='iauthen'>{if $info['is_authen'] eq 1}花园里认证业主{else}业主未认证{/if}</p>
			</div>
			<div id='clock_in' class='clockin'>
				<img src="{$smarty.const.THEME}Member/img/clockin.png">
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
				<p class='p-info'>{if $info['level'] eq null}0{else} {$info['level']}{/if}</p>
				<p  class='p-label'>成长值</p>
			</div>
		</div>
		<!-- 菜单项目 -->
		<div class='groups'>
			<div class='item'>
				<a href="{$smarty.const.HOME}Member/profile_edit.html">
					<p><img src="{$smarty.const.THEME}Member/img/1.png"></p>
					<p>个人信息</p>
					<p><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="#">
					<p><img src="{$smarty.const.THEME}Member/img/2.png"></p>
					<p>等级权限</p>
					<p><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="{$smarty.const.HOME}Member/family.html">
					<p><img src="{$smarty.const.THEME}Member/img/3.png"></p>
					<p>家庭成员</p>
					<p><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
		</div>
		<div class='groups'>
			<div class='item'>
				<a href="#">
					<p><img src="{$smarty.const.THEME}Member/img/4.png"></p>
					<p>帮助中心</p>
					<p><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
			<div class='item'>
				<a href="#">
					<p><img src="{$smarty.const.THEME}Member/img/5.png"></p>
					<p>意见反馈</p>
					<p><img src="{$smarty.const.THEME}Member/img/more.png"></p>
				</a>
			</div>
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 签到获取积分与经验值
			$('#clock_in').click(function(){
				$.ajax({
					type:'POST',
					url:'{$smarty.const.HOME}Member/clock_in',
					dataType:'json',
					success:function(msg){
						if(msg['code']==200){
							alert('签到成功');
						}else
							alert(msg['data']);
					}
				});
			});
		});
	</script>
</body>
</html>