<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 17:04:49
         compiled from "./ThemeAdmin/default/Shop/goods.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19559964785a40e42c3b2d88-60582119%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f30e9537bfdfcbe1fc6ad908e2f1f7c04ac9eb26' => 
    array (
      0 => './ThemeAdmin/default/Shop/goods.tpl',
      1 => 1514424009,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19559964785a40e42c3b2d88-60582119',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a40e42c3f4cc',
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
<?php if ($_valid && !is_callable('content_5a40e42c3f4cc')) {function content_5a40e42c3f4cc($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/alidata/www/api/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'商品管理'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-puzzle-piece"></i> 商品管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-puzzle-piece"></i>商品管理</li>	
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
			<div style='padding: 5px 0;'>
				<a class='btn btn-info' href="<?php echo @ADMIN;?>
Shop/goods_add.html">添加商品</a>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>商品名称</th>
								<th>库存</th>
								<th>余量</th>
								<th>商品状态</th>
								<th>价格</th>
								<th>用户兑换等级</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
								<tr>
									<td><?php if ($_smarty_tpl->tpl_vars['item']->value['goods_stime']!=''){?><i style='color:#ff5454;'>抢&nbsp;</i><?php }?><?php echo $_smarty_tpl->tpl_vars['item']->value['goods_name'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['goods_num'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['goods_last'];?>
</td>
									<td><?php if ($_smarty_tpl->tpl_vars['item']->value['goods_status']==1){?>上架<?php }else{ ?>下架<?php }?></td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['goods_price'];?>
<?php if ($_smarty_tpl->tpl_vars['item']->value['pay_type']==1){?>积分<?php }else{ ?>￥<?php }?></td>
									<td><i>Lv</i>&nbsp;<b><?php echo $_smarty_tpl->tpl_vars['item']->value['goods_level'];?>
</b></td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['atime'],'%Y-%m-%d');?>
</td>
									<td>
										<a href='<?php echo @ADMIN;?>
Shop/goods_add.html?goods_uid=<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
' class='btn btn-info'>查看详情</a>
										<button class='btn btn-danger delete' data-uid='<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
'>删除商品</button>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
					<div class='text-center'>
						<?php echo $_smarty_tpl->tpl_vars['list']->value['page'];?>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<script type="text/javascript">
	$(function(){
		$('.delete').click(function(){
			let that=$(this);
			if(!confirm('是否删除当前商品？'))
				return;
			let goods_uid=$(this).data('uid');
			$.ajax({
				type:'POST',
				url:'<?php echo @ADMIN;?>
Shop/goods_delete',
				dataType:'json',
				data:{
					'goods_uid':goods_uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('删除成功');
						that.parent().parent().remove();
					}else{
						$('.error_report').show();
						$('.error_report .text-danger').html(msg['data']);
					}
				}
			});
		});
	});
</script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>