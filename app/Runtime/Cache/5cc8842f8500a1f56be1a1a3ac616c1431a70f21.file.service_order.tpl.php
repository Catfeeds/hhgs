<?php /* Smarty version Smarty-3.1.6, created on 2017-12-27 18:51:01
         compiled from "./ThemeAdmin/default/Service/service_order.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7142449315a434d3744daf3-23888480%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5cc8842f8500a1f56be1a1a3ac616c1431a70f21' => 
    array (
      0 => './ThemeAdmin/default/Service/service_order.tpl',
      1 => 1514371860,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7142449315a434d3744daf3-23888480',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a434d374c9f4',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'list' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a434d374c9f4')) {function content_5a434d374c9f4($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'服务预约管理'), 0);?>

<style type="text/css">
	.thumbnail{
		width: 200px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 服务预约管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-plus-square"></i>服务预约管理</li>	
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
							<tr>
								<th>服务名称</th>
								<th>用户名称</th>
								<th>用户手机</th>
								<th>预定时间</th>
								<th>地址</th>
								<th>状态</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['sname'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uname'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['phone_num'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['order_date'];?>
&nbsp;<?php if ($_smarty_tpl->tpl_vars['item']->value['order_ampm']==1){?>上午<?php }else{ ?>下午<?php }?></td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['address'];?>
</td>
									<td class='status'><?php if ($_smarty_tpl->tpl_vars['item']->value['status']==1){?>已处理<?php }else{ ?>未处理<?php }?></td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['atime'];?>
</td>
									<td>
										<button data-uid='<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
' class='btn btn-info btn-sm deal' <?php if ($_smarty_tpl->tpl_vars['item']->value['status']==1){?> disabled>已处理<?php }else{ ?>>处理<?php }?></button>
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
			if(!confirm('是否处理当前订单?'))
				return;
			that=$(this);
			$.ajax({
				type:'POST',
				url:'<?php echo @ADMIN;?>
Service/order_deal',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('数据提交成功');
						that.parent().parent().find('.status').html('已处理');
						that.html('已处理');
						that.attr('disabled','disabled');
					}else
						alert(msg['data']);
				}
			});
		});
	});
</script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>