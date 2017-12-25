<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>家庭成员管理</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Member/css/family.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			{foreach $list as $l}
				<a href="{$smarty.const.HOME}Member/family_mem.html?memid={$l['uid']}">
					<div class='family_mem'>			
						<div class='elm headimg'>
							<img src="{if $l['headimg'] eq null}{$smarty.const.THEME}/Member/img/head-2.gif{else}$l['headimg'{/if}">
						</div>
						<div class='elm info'>
							<p>姓名：<span class='ispan'>{$l['uname']}</span> 性别：{if $l['sex'] eq 1}男{else}女{/if}</p>
							<p>生日：<span class='ispan birth' data-birth="{$l['birth']}">{$l['birth']|date_format:"%m/%d"}</span> 年龄：<span class='age'></span></p>
							<p>手机号码：{$l['phone_num']}</p>
						</div>
						<div class='elm relation'>
							{if $hide eq false}<p class='rbg'>{$l['relation']}</p>{/if}
						</div>
						<p>
							<div class='circle circle_l'></div>
							<div class='circle circle_r'></div>
						</p>				
					</div>
				</a>
			{/foreach}	
			{if $hide eq false}
			<div class='add'>
				<a href="{$smarty.const.HOME}Member/family_mem.html"><img src="{$smarty.const.THEME}Member/img/add.png"></a>
			</div>
			{/if}
			
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		var set_age=function(){
			$('.birth').each(function(){
				let birthstamp=$(this).data('birth')*1000;
				let nowstamp=Date.parse(new Date());
				let age= Math.floor((nowstamp-birthstamp)/1000/(60*60*24*365));
				if(!isNaN(age))
					$(this).parent().parent().find('.age').html(age);
			});
		}
		set_age();
	</script>
</body>
</html>