<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 21:12:07
         compiled from "./Theme/default/Shop/detail.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6430137085a3791e05e3b40-59899532%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5b21ee65eed91e99d09d4dd2b59b78ae1f14dba4' => 
    array (
      0 => './Theme/default/Shop/detail.tpl',
      1 => 1514466725,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6430137085a3791e05e3b40-59899532',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3791e05e461',
  'variables' => 
  array (
    'info' => 0,
    'img' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3791e05e461')) {function content_5a3791e05e461($_smarty_tpl) {?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>花园小铺</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @ORG;?>
swiper/swiper-3.4.2.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Shop/css/detail.css">
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
				<?php  $_smarty_tpl->tpl_vars['img'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['img']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['info']->value['thumbnail']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['img']->key => $_smarty_tpl->tpl_vars['img']->value){
$_smarty_tpl->tpl_vars['img']->_loop = true;
?>
					<div class="swiper-slide">
			        	<img src="<?php echo @UPLOAD;?>
goods/<?php echo $_smarty_tpl->tpl_vars['img']->value;?>
">
			        </div>
				<?php } ?>
		    </div>
		    <!-- 如果需要分页器 -->
		    <div class="swiper-pagination"></div>
		</div>
		<div class='title'>
			<p class='line'></p>
			<p class=tname><?php echo $_smarty_tpl->tpl_vars['info']->value['goods_name'];?>
</p>
			<div class='coin'><?php echo sprintf("%d",$_smarty_tpl->tpl_vars['info']->value['goods_price']);?>
活跃值</div>
		</div>		
		<div class='content'>
			<?php echo stripslashes(htmlspecialchars_decode($_smarty_tpl->tpl_vars['info']->value['goods_detail']));?>

		</div>
		<a href="<?php echo @HOME;?>
Shop/order.html?uid=<?php echo $_smarty_tpl->tpl_vars['info']->value['uid'];?>
">
			<div class='bottom'>马上兑换</div>
		</a>
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src='<?php echo @ORG;?>
swiper/swiper-3.4.2.jquery.min.js'></script>
	<script>        
		var mySwiper = new Swiper ('.swiper-container', {
			loop: true,
			autoplay:3000,
			// 如果需要分页器
			pagination: '.swiper-pagination',
		})        
	</script>
</body>
</html><?php }} ?>