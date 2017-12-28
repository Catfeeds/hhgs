<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 15:04:52
         compiled from "./ThemeAdmin/default/Carousel/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14935235855a40e6e90094b0-89018547%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '527f34ea66766046d50a37057b57b41bc475d739' => 
    array (
      0 => './ThemeAdmin/default/Carousel/index.tpl',
      1 => 1514444690,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14935235855a40e6e90094b0-89018547',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a40e6e90b02c',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'res' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a40e6e90b02c')) {function content_5a40e6e90b02c($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/alidata/www/api/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'首页幻灯片'), 0);?>

<style type="text/css">
	.img{
		width: 120px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 首页幻灯片</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-envira"></i>首页幻灯片</li>	
			</ol>
		</div>
		<div class='col-md-12'>
			<div class='error_report'>
				错误：
				<span class='text-danger'></span>
			</div>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-body'>			
					<a href="<?php echo @ADMIN;?>
Carousel/post.html" class='btn btn-primary'>添加新的幻灯片</a>
					<table  class='table table-striped table-hover'>
						<thead>
							<tr>
								<th>图片</th>
								<th>链接</th>
								<th>类型</th>								
								<th>时间</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['res']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td>
										<img class='img' src="<?php echo @HOME;?>
<?php echo $_smarty_tpl->tpl_vars['item']->value['img'];?>
">
									</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['link'];?>
</td>
									<td>
										<?php if ($_smarty_tpl->tpl_vars['item']->value['type']==1){?>活动<?php }else{ ?>商城<?php }?>
									</td>							
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['time'],'%Y-%m-%d %H:%M');?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['mark'];?>
</td>
									<td>
										<a href='<?php echo @ADMIN;?>
Carousel/post.html?uid=<?php echo $_smarty_tpl->tpl_vars['item']->value["id"];?>
' class='btn btn-info'>编辑</a>
										<button data-id="<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
" class='btn btn-danger del'>删除</button>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<script type="text/javascript" src='<?php echo @JS;?>
ajax.js'></script>
<script type="text/javascript" src="<?php echo @THEMEADMIN;?>
assets/js/carousel.js"></script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>