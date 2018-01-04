<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>活动</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.ORG}swiper/swiper-3.4.2.min.css">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Activity/css/index.css">
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
			<div class='item' data-status='6L+b6KGM5Lit'>进行中</div>
			<div class='item' data-status='5bey57uT5p2f'>已结束</div>
			<div class='item' data-status='5oiR55qE5rS75Yqo'>我的活动</div>
		</div>
		<div class='list'>
			{foreach $list as $item}
				<a href="{$smarty.const.HOME}Activity/attend.html?uid={$item['uid']}">
					<div class='list-i'>
						<div class='img'>
							<img src="{$smarty.const.UPLOAD}activity/{$item['titleimg']}">
						</div>
						<div class='info'>
							<div class='line'>
							</div>
							<div class='text'>
								<p class='time'>{$item['status']}时间：<span>{$item['date']|date_format:'%Y年%m月%d日'} {$item['time']}</span></p>
								<p class='title'>{$item['name']}</p>
							</div>
							{if $item['ss'] eq 1}
							<div class='btn btn_go'>进行中</div>
							{elseif $item['ss'] eq 2}
							<div class='btn btn_finish'>已结束</div>	
							{elseif  $item['ss'] eq 3}
							<div class='btn btn_finish'>已暂停</div>
							{/if}
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
				autoplay:2000,
				loop: true,
				// 如果需要分页器
				pagination: '.swiper-pagination',
			}); 
			// 页面跳转
			$('.menu .item').click(function(){
				let status=$(this).data('status');
				window.location.href='{$smarty.const.HOME}Activity/index.html?status='+status;
			}); 
			// 时间在转换
			Date.prototype.format = function(fmt) { 
			    var o = { 
			        "M+" : this.getMonth()+1,                 //月份 
			        "d+" : this.getDate(),                    //日 
			        "h+" : this.getHours(),                   //小时 
			        "m+" : this.getMinutes(),                 //分 
			        "s+" : this.getSeconds(),                 //秒 
			        "q+" : Math.floor((this.getMonth()+3)/3), //季度 
			        "S"  : this.getMilliseconds()             //毫秒 
			    }; 
			    if(/(y+)/.test(fmt)) {
			        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
			    }
			    for(var k in o) {
			        if(new RegExp("("+ k +")").test(fmt)){
			            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
			        }
			    }
			    return fmt; 
			}
			// 下拉加载
			var appendData=function(page){
				$.ajax({
					type:'POST',
					dataType:'json',
					data:{
						'p':page
					},
					success:function(msg){
						if(msg['code']==200){
							let data=msg['data'];
							let inner='';
							for(var i=0;i<data.length;i++){
								let join='';
								if(data[i]['ss']==1)
									join='进行中';
								else if(data[i]['ss']==2)
									join='已结束';
								else if(data[i]['ss']==3)
									join='已暂停';
								inner+="<a href='{$smarty.const.HOME}Activity/attend.html?uid="+data[i]['uid']+"'><div class='list-i'><div class='img'><img src='{$smarty.const.UPLOAD}activity/"+data[i]['titleimg']+"'></div><div class='info'><div class='line'></div><div class='text'><p class='time'>时间：<span>"+new Date(data[i]['date']).format("yyyy年MM月dd日")+" "+data[i]['time']+"</span></p><p class='title'>"+data[i]['name']+"</p></div><div class='btn btn_finish'>"+join+"</div></div></div></a>";
							}
							$('.list').append(inner);
						}else
							stop=true;
						
					}
				});
			}			
			var page=1;
			var stop=false;
			$(window).scroll(function(){
				var scrollTop = $(this).scrollTop();    //滚动条距离顶部的高度
				var scrollHeight = $(document).height();   //当前页面的总高度
				var clientHeight = $(this).height();    //当前可视的页面高度
				//距离顶部+当前高度>=文档总高度 即代表滑动到底部 count++;
				 //每次滑动count加1
				if(scrollTop + clientHeight >= scrollHeight){ 
					//调用筛选方法，count为当前分页数
					if(!stop)
						appendData(++page);			
				}else if(scrollTop<=0){ 
					//滚动条距离顶部的高度小于等于0 TODO
				}

				// 分类菜单上移
				if(scrollTop>200){
					$('.category').addClass('cate-top');
				}else{
					$('.category').removeClass('cate-top');
				}
			}); 
		});   
	</script>
</body>
</html>