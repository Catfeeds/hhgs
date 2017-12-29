<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>服务</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Service/css/index.css">
</head>
<body>
	<div class='container'>
		<div class='list'>
			{foreach $list as $item}
				<a href="{$smarty.const.HOME}Service/order.html?uid={$item['uid']}">
					<div class='item'>
						<img src="{$smarty.const.UPLOAD}service/{$item['img']}">
						<div class='icon'>
							{if $item['status'] eq 1}
								<img src="{$smarty.const.THEME}Service/img/open.png">
							{else}
								<img src="{$smarty.const.THEME}Service/img/close.png">
							{/if}
						</div>
					</div>
				</a>
			{/foreach}
		</div>
		<div class='more'>
			<img src="{$smarty.const.THEME}Service/img/more.png">
			<p>更多服务陆续更新中!</p>
		</div>
	</div>
</body>
</html>