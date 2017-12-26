<?php /* Smarty version Smarty-3.1.6, created on 2017-12-26 16:51:14
         compiled from "./ThemeAdmin/default/Shop/order.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20489898985a40e429c2c685-42460199%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '770828b541be4792d82970a249bad7e2e7b7ad67' => 
    array (
      0 => './ThemeAdmin/default/Shop/order.tpl',
      1 => 1514278271,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20489898985a40e429c2c685-42460199',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a40e429c7ab9',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'order' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a40e429c7ab9')) {function content_5a40e429c7ab9($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'订单管理'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-paw"></i> 订单管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-paw"></i>订单管理</li>	
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
								<th>订单编号</th>
								<th>用户名称</th>
								<th>联系方式</th>
								<th>购买商品</th>
								<th>订单金额</th>
								<th>订单数量</th>
								<th>下单时间</th>
								<th>收货时间</th>
								<th>备注</th>	
								<th>订单状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['order']->value['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['order_id'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uname'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['phone_num'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['goods_name'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['order_money'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['order_num'];?>
</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['pay_time'],'%Y/%m/%d %H:%M');?>
</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['recieve_time'],'%Y/%m/%d %H:%M');?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['order_remarks'];?>
</td>
									<td><?php if ($_smarty_tpl->tpl_vars['item']->value['order_status']==0){?>未完成<?php }else{ ?>已完成<?php }?></td>
									<td>
										<button class='btn btn-sm btn-info deal' data-uid='<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
'<?php if ($_smarty_tpl->tpl_vars['item']->value['order_status']==1){?>disabled >已完成<?php }else{ ?>>领取<?php }?></button>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
					<div class='text-center'>
						<?php echo $_smarty_tpl->tpl_vars['order']->value['page'];?>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('.deal').click(function(){
			that=$(this);
			if(!confirm('是否要核销此订单？'))
				return;
			let uid=$(this).data('uid');
			$.ajax({
				type:'POST',
				url:'<?php echo @ADMIN;?>
Shop/order_deal',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('处理成功');
						that.attr('disabled','disabled');
						that.html('已完成');
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