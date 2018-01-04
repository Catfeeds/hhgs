<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>积分商城</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.ORG}swiper/swiper-3.4.2.min.css">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Shop/css/index.css">
</head>
<body>
	<div class='container'>
		<div class='swiper-container header'>
			<div class="swiper-wrapper">
		        {foreach $carousel as $item}
					<div class="swiper-slide">
			        	<a href='{$item["link"]}'>
			        		<img src="{$smarty.const.UPLOAD}carousel/{$item['img']}">
			        	</a>
			        </div>
				{/foreach}
		    </div>
		    <!-- 如果需要分页器 -->
		    <div class="swiper-pagination"></div>
		</div>
		<div class='menu'>
			<div class='menu-item'><a href="{$smarty.const.HOME}Shop/index.html"><label><img src="{$smarty.const.THEME}Shop/img/coin.png"></label><span>礼品兑换</span></a></div>
			<div class='menu-item'><a href="{$smarty.const.HOME}Shop/index.html?t=5YWR5o2i6K6w5b2V"><label><img src="{$smarty.const.THEME}Shop/img/gift.png"></label><span>兑换记录</span></a></div>
		</div>
		<div class='content-list'>
			{foreach $list as $item}
				<a href="{$smarty.const.HOME}Shop/detail.html?uid={$item['uid']}">
					<div class='list-item'>
						<div class='img'>
							<img src="{$smarty.const.UPLOAD}goods/{$item['thumbnail']}">
						</div>
						<div class='info'>
							<div class='title'>{$item['goods_name']}</div>
							<div class='time'>
								<p>兑换时间</p>
								{if $item['goods_etime'] eq null}
								<p>无限制</p>
								{else}
								<p>{$item['goods_stime']|date_format:'%Y年%m月%d日'}-{$item['goods_etime']|date_format:'%Y年%m月%d日'}</p>
								{/if}
							</div>
							<div class='coin'>
								<span class='c1'>{$item['goods_price']|string_format:'%d'}活跃值</span>
								<span class='c2'>库存：{$item['goods_last']}</span>
							</div>
						</div>
						<div class='btn'>
							<span>马上兑换</span>
						</div>
					</div>
				</a>
			{/foreach}
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src='{$smarty.const.ORG}swiper/swiper-3.4.2.jquery.min.js'></script>
	<script>        		
		$(function(){
			var mySwiper = new Swiper ('.swiper-container', {
				loop: true,
				autoplay:3000,
				// 如果需要分页器
				pagination: '.swiper-pagination',
			});
		});    
	</script>
</body>
</html>