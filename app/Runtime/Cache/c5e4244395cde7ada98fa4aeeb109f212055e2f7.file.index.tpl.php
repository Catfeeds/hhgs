<?php /* Smarty version Smarty-3.1.6, created on 2018-01-05 21:03:30
         compiled from "./ThemeAdmin/default/Recommend/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18897603535a4f72a6502095-31905807%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c5e4244395cde7ada98fa4aeeb109f212055e2f7' => 
    array (
      0 => './ThemeAdmin/default/Recommend/index.tpl',
      1 => 1515157295,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18897603535a4f72a6502095-31905807',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a4f72a655efc',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'list' => 0,
    'v' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a4f72a655efc')) {function content_5a4f72a655efc($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'推荐管理'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-gift"></i> 推荐管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-gift"></i>推荐管理</li>	
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
					<table class="table table-striped table-hover">
						<thead>
							<th>申请人id</th>
							<th>申请人姓名</th>
							<th>申请人联系方式</th>
							<th>推荐人id</th>
							<th>推荐人姓名</th>
							<th>推荐人联系方式</th>
							<th>操作</th>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['v']->value['u_uid'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['v']->value['mname'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['v']->value['mtel'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['v']->value['r_u_uid'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['v']->value['tname'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['v']->value['ttel'];?>
</td>
									<td>
										<?php if ($_smarty_tpl->tpl_vars['v']->value['status']==1){?>
											<button class='btn btn-sm' disabled>已处理</button>
										<?php }else{ ?>
											<button data-uid='<?php echo $_smarty_tpl->tpl_vars['v']->value["uid"];?>
' class='deal btn btn-sm btn-info'>处理</button>
										<?php }?>
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
<script type="text/javascript">
	$(function(){
		$('.deal').click(function(){
			let uid=$(this).data('uid');
			if(!confirm('是否对此条目进行处理？'))
				return;
			$.ajax({
				type:'POST',
				url:'<?php echo @ADMIN;?>
Recommend/deal',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('处理成功');
						window.location.reload();
					}else{
						$('.error_report').show();
						$('.error_report .text-danger').html(msg['data']);
						
						$('html,body').animate({scrollTop: 0}, 500);
						
					}
				}
			});
		});
	});
</script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>