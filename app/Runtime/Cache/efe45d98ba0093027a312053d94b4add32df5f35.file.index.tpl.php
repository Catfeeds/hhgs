<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 21:13:07
         compiled from "./Theme/default/Shop/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7958462795a377715e6a722-49896422%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'efe45d98ba0093027a312053d94b4add32df5f35' => 
    array (
      0 => './Theme/default/Shop/index.tpl',
      1 => 1514466779,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7958462795a377715e6a722-49896422',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a377715ec923',
  'variables' => 
  array (
    'list' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a377715ec923')) {function content_5a377715ec923($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/alidata/www/api/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>花园小铺</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @ORG;?>
swiper/swiper-3.4.2.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Shop/css/index.css">
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
		         <div class="swiper-slide">
		        	<img src="<?php echo @THEME;?>
Shop/img/WX20171218-160538.png">
		        </div>
		    </div>
		    <!-- 如果需要分页器 -->
		    <div class="swiper-pagination"></div>
		</div>
		<div class='menu'>
			<div class='menu-item'><a href="<?php echo @HOME;?>
Shop/index.html"><label><img src="<?php echo @THEME;?>
Shop/img/coin.png"></label><span>礼品兑换</span></a></div>
			<div class='menu-item'><a href="<?php echo @HOME;?>
Shop/index.html?t=5YWR5o2i6K6w5b2V"><label><img src="<?php echo @THEME;?>
Shop/img/gift.png"></label><span>兑换记录</span></a></div>
		</div>
		<div class='content-list'>
			<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
				<a href="<?php echo @HOME;?>
Shop/detail.html?uid=<?php echo $_smarty_tpl->tpl_vars['item']->value['uid'];?>
">
					<div class='list-item'>
						<div class='img'>
							<img src="<?php echo @UPLOAD;?>
goods/<?php echo $_smarty_tpl->tpl_vars['item']->value['thumbnail'];?>
">
						</div>
						<div class='info'>
							<div class='title'><?php echo $_smarty_tpl->tpl_vars['item']->value['goods_name'];?>
</div>
							<div class='time'>
								<p>兑换时间</p>
								<?php if ($_smarty_tpl->tpl_vars['item']->value['goods_etime']==null){?>
								<p>无限制</p>
								<?php }else{ ?>
								<p><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['goods_stime'],'%Y年%m月%d日');?>
-<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['goods_etime'],'%Y年%m月%d日');?>
</p>
								<?php }?>
							</div>
							<div class='coin'>
								<span class='c1'><?php echo sprintf('%d',$_smarty_tpl->tpl_vars['item']->value['goods_price']);?>
活跃值</span>
								<span class='c2'>库存：<?php echo $_smarty_tpl->tpl_vars['item']->value['goods_last'];?>
</span>
							</div>
						</div>
						<div class='btn'>
							<span>马上兑换</span>
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
				loop: true,
				autoplay:3000,
				// 如果需要分页器
				pagination: '.swiper-pagination',
			});
		});    
	</script>
</body>
</html><?php }} ?>