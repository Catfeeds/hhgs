<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 15:50:13
         compiled from "./ThemeAdmin/default/Award/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8636117935a406607ebadc7-00793855%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '808d144176b792b5f72d5bf162ff39db13708228' => 
    array (
      0 => './ThemeAdmin/default/Award/index.tpl',
      1 => 1514424007,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8636117935a406607ebadc7-00793855',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a406607ef2f3',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'award' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a406607ef2f3')) {function content_5a406607ef2f3($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'成长值与活跃值设置'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-superpowers"></i> 成长值与活跃值设置</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-superpowers"></i>成长值与活跃值设置</li>	
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
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>个人信息完善</label>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control lnumber' type="number"  placeholder='成长值' value='<?php echo $_smarty_tpl->tpl_vars['award']->value[0]["lnumber"];?>
' title='成长值'>
							</div>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control snumber' type="number"  placeholder='活跃值' value='<?php echo $_smarty_tpl->tpl_vars['award']->value[0]["snumber"];?>
' title='活跃值'>
							</div>
							<div class='col-xs-12 col-md-3'>
								<button class='btn btn-primary save' data-uid='<?php echo $_smarty_tpl->tpl_vars['award']->value[0]["uid"];?>
'>保存</button>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>家庭成员添加</label>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control lnumber' type="number"  placeholder='成长值' value='<?php echo $_smarty_tpl->tpl_vars['award']->value[1]["lnumber"];?>
' title='成长值'>
							</div>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control snumber' type="number"  placeholder='活跃值' value='<?php echo $_smarty_tpl->tpl_vars['award']->value[1]["snumber"];?>
' title='活跃值'>
							</div>
							<div class='col-xs-12 col-md-3'>
								<button class='btn btn-primary save' data-uid='<?php echo $_smarty_tpl->tpl_vars['award']->value[1]["uid"];?>
'>保存</button>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>每日签到</label>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control lnumber' type="number"  placeholder='成长值' value='<?php echo $_smarty_tpl->tpl_vars['award']->value[2]["lnumber"];?>
' title='成长值'>
							</div>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control snumber' type="number"  placeholder='活跃值' value='<?php echo $_smarty_tpl->tpl_vars['award']->value[2]["snumber"];?>
' title='活跃值'>
							</div>
							<div class='col-xs-12 col-md-3'>
								<button class='btn btn-primary save' data-uid='<?php echo $_smarty_tpl->tpl_vars['award']->value[2]["uid"];?>
'>保存</button>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('.save').click(function(){
			let uid=$(this).data('uid');
			let lnumber=$(this).parent().parent().find('.lnumber').val();
			let snumber=$(this).parent().parent().find('.snumber').val();
			$.ajax({
				type:'POST',
				dataType:'json',
				data:{
					'uid':uid,
					'lnumber':lnumber,
					'snumber':snumber,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('更新成功');
					}else{
						$('.error_report').show();
						$('.error_report .text-danger').html(msg['data']);
					}
				}
			});
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>