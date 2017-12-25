<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>花园小铺</title>
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
		        <div class="swiper-slide">
		        	<img src="{$smarty.const.THEME}Activity/img/WX20171218-094032.png">
		        </div>
		        <div class="swiper-slide">
		        	<img src="{$smarty.const.THEME}Activity/img/WX20171218-101319.png">
		        </div>
		         <div class="swiper-slide">
		        	<img src="{$smarty.const.THEME}Shop/img/WX20171218-160538.png">
		        </div>
		    </div>
		    <!-- 如果需要分页器 -->
		    <div class="swiper-pagination"></div>
		</div>
		<div class='menu'>
			<div class='menu-item'><label><img src="{$smarty.const.THEME}Shop/img/coin.png"></label><span>我的积分</span></div>
			<div class='menu-item'><label><img src="{$smarty.const.THEME}Shop/img/gift.png"></label><span>兑换记录</span></div>
		</div>
		<div class='content-list'>
			<a href="{$smarty.const.HOME}Shop/detail.html">
				<div class='list-item'>
					<div class='img'>
						<img src="{$smarty.const.THEME}Shop/img/WX20171218-171437.png">
					</div>
					<div class='info'>
						<div class='title'>花园无语系列之甜心花茶</div>
						<div class='time'>
							<p>兑换时间</p>
							<p>2017年10月11日-2017年10月21日</p>
						</div>
						<div class='coin'>
							<span class='c1'>500积分</span>
							<span class='c2'>库存：20</span>
						</div>
					</div>
					<div class='btn'>
						<span>马上兑换</span>
					</div>
				</div>
			</a>
			<a href="{$smarty.const.HOME}Shop/detail.html">
				<div class='list-item'>
					<div class='img'>
						<img src="{$smarty.const.THEME}Shop/img/WX20171218-171437.png">
					</div>
					<div class='info'>
						<div class='title'>花园无语系列之甜心花茶</div>
						<div class='time'>
							<p>兑换时间</p>
							<p>2017年10月11日-2017年10月21日</p>
						</div>
						<div class='coin'>
							<span class='c1'>500积分</span>
							<span class='c2'>库存：20</span>
						</div>
					</div>
					<div class='btn'>
						<span>马上兑换</span>
					</div>
				</div>
			</a>
			<a href="{$smarty.const.HOME}Shop/detail.html">
				<div class='list-item'>
					<div class='img'>
						<img src="{$smarty.const.THEME}Shop/img/WX20171218-171437.png">
					</div>
					<div class='info'>
						<div class='title'>花园无语系列之甜心花茶</div>
						<div class='time'>
							<p>兑换时间</p>
							<p>2017年10月11日-2017年10月21日</p>
						</div>
						<div class='coin'>
							<span class='c1'>500积分</span>
							<span class='c2'>库存：20</span>
						</div>
					</div>
					<div class='btn'>
						<span>马上兑换</span>
					</div>
				</div>
			</a>
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src='{$smarty.const.ORG}swiper/swiper-3.4.2.jquery.min.js'></script>
	<script>        
		var mySwiper = new Swiper ('.swiper-container', {
			loop: true,
			// 如果需要分页器
			pagination: '.swiper-pagination',
		})        
	</script>
</body>
</html>