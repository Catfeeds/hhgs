<?php /* Smarty version Smarty-3.1.6, created on 2017-12-22 16:57:50
         compiled from "./Theme/default/Activity/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17029595805a34eb35622969-86670909%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c81b93d12044a1f4e8cd1f349b5d27f89e84f3d6' => 
    array (
      0 => './Theme/default/Activity/index.tpl',
      1 => 1513933063,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17029595805a34eb35622969-86670909',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a34eb35624b4',
  'variables' => 
  array (
    'list' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a34eb35624b4')) {function content_5a34eb35624b4($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>活动</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @ORG;?>
swiper/swiper-3.4.2.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Activity/css/index.css">
</head>
<body>
	<div class='container'>
		<div class='swiper-container header'>
			<div class="swiper-wrapper">
		        <div class="swiper-slide">
		        	<img src="<?php echo @THEME;?>
Activity/img/WX20171218-094032.png">
		        </div>
		        <div class="swiper-slide">
		        	<img src="<?php echo @THEME;?>
Activity/img/WX20171218-101319.png">
		        </div>
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
			<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
				<a href="<?php echo @HOME;?>
Activity/attend.html?uid=<?php echo $_smarty_tpl->tpl_vars['item']->value['uid'];?>
">
					<div class='list-i'>
						<div class='img'>
							<img src="<?php echo @UPLOAD;?>
activity/<?php echo $_smarty_tpl->tpl_vars['item']->value['titleimg'];?>
">
						</div>
						<div class='info'>
							<div class='line'>
							</div>
							<div class='text'>
								<p class='time'><?php echo $_smarty_tpl->tpl_vars['item']->value['status'];?>
时间：<span><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['date'],'%Y年%m月%d日');?>
 <?php echo $_smarty_tpl->tpl_vars['item']->value['time'];?>
</span></p>
								<p class='title'><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</p>
							</div>
							<?php if ($_smarty_tpl->tpl_vars['item']->value['ss']==1){?>
							<div class='btn btn_go'>进行中</div>
							<?php }elseif($_smarty_tpl->tpl_vars['item']->value['ss']==2){?>
							<div class='btn btn_finish'>已结束</div>	
							<?php }elseif($_smarty_tpl->tpl_vars['item']->value['ss']==3){?>
							<div class='btn btn_finish'>已暂停</div>
							<?php }?>
						</div>
					</div>
				</a>
			<?php } ?>
		</div>
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src='<?php echo @ORG;?>
swiper/swiper-3.4.2.jquery.min.js'></script>
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
				window.location.href='<?php echo @HOME;?>
Activity/index.html?status='+status;
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
								inner+="<a href='<?php echo @HOME;?>
Activity/attend.html?uid="+data[i]['uid']+"'><div class='list-i'><div class='img'><img src='<?php echo @UPLOAD;?>
activity/"+data[i]['titleimg']+"'></div><div class='info'><div class='line'></div><div class='text'><p class='time'>时间：<span>"+new Date(data[i]['date']).format("yyyy年MM月dd日")+" "+data[i]['time']+"</span></p><p class='title'>"+data[i]['name']+"</p></div><div class='btn btn_finish'>"+join+"</div></div></div></a>";
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
</html><?php }} ?>