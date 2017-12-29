<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>积分商城</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.ORG}swiper/swiper-3.4.2.min.css">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Shop/css/detail.css">
	<style type="text/css">
		.swiper-slide{
			max-height: 200px;
		}
	</style>
</head>
<body>
	<div class='container'>
		<div class='swiper-container header'>
			<div class="swiper-wrapper">
				{foreach $info['thumbnail'] as $img}
					<div class="swiper-slide">
			        	<img src="{$smarty.const.UPLOAD}goods/{$img}">
			        </div>
				{/foreach}
		    </div>
		    <!-- 如果需要分页器 -->
		    <div class="swiper-pagination"></div>
		</div>
		<div class='title'>
			<p class='line'></p>
			<p class=tname>{$info['goods_name']}</p>
			<div class='coin'>{$info['goods_price']|string_format:"%d"}活跃值</div>
		</div>		
		<div class='content'>
			{$info['goods_detail']|htmlspecialchars_decode|stripslashes}
		</div>
		<a href="{$smarty.const.HOME}Shop/order.html?uid={$info['uid']}">
			<div class='bottom'>马上兑换</div>
		</a>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src='{$smarty.const.ORG}swiper/swiper-3.4.2.jquery.min.js'></script>
	<script>        
		var mySwiper = new Swiper ('.swiper-container', {
			loop: true,
			autoplay:3000,
			// 如果需要分页器
			pagination: '.swiper-pagination',
		})        
	</script>
</body>
</html>