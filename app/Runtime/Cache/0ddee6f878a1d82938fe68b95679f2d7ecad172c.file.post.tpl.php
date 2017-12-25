<?php /* Smarty version Smarty-3.1.6, created on 2017-12-19 15:44:34
         compiled from "./ThemeAdmin/default/HomePage/post.tpl" */ ?>
<?php /*%%SmartyHeaderCode:10995788265a38c3625f27d4-02211243%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0ddee6f878a1d82938fe68b95679f2d7ecad172c' => 
    array (
      0 => './ThemeAdmin/default/HomePage/post.tpl',
      1 => 1502436540,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '10995788265a38c3625f27d4-02211243',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'res' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a38c3626725a',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a38c3626725a')) {function content_5a38c3626725a($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'首页幻灯片'), 0);?>

<style type="text/css">
	img{
		max-width: 100%;
	}
	.head_img{
		position: absolute;
		top: 15px;
		right: 18px;
		width: 240px;
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
					<div class='form-horizontal'>
						<input id="uid" type='hidden' value="<?php echo $_smarty_tpl->tpl_vars['res']->value['id'];?>
">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>图片</label>
							<div class='col-xs-12 col-md-8'>
								<button class='btn btn-primary upload'>上传幻灯片</button>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>链接</label>
							<div class='col-xs-12 col-md-8'>
								<input id='link' class='form-control' type='text' value="<?php echo $_smarty_tpl->tpl_vars['res']->value['link'];?>
" >
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>备注</label>
							<div class='col-xs-12 col-md-8'>
								<textarea id='mark' class='form-control' rows="5" style='resize:none;'><?php echo $_smarty_tpl->tpl_vars['res']->value['mark'];?>
</textarea>
								<br>
								<button id='submit' class='btn btn-danger'>提交</button>
							</div>							
						</div>
					</div>
					<div class='head_img'>
						<img src="<?php echo @HOME;?>
<?php echo $_smarty_tpl->tpl_vars['res']->value['img'];?>
" data-url="<?php echo $_smarty_tpl->tpl_vars['res']->value['img'];?>
">
						<div class='help-block'>*图片建议尺寸为1438*701</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/upload.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<script type="text/javascript" src='<?php echo @JS;?>
ajax.js'></script>
<script type="text/javascript" src="<?php echo @THEMEADMIN;?>
assets/js/homepage.js"></script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>