<?php /* Smarty version Smarty-3.1.6, created on 2018-01-02 17:43:14
         compiled from "./ThemeAdmin/default/Consultant/cons_order.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13118118125a4300e8652fe7-21899080%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bd50acb307b4f30157e2c95fb0a12415306f7b9d' => 
    array (
      0 => './ThemeAdmin/default/Consultant/cons_order.tpl',
      1 => 1514886172,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13118118125a4300e8652fe7-21899080',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a4300e869b28',
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
<?php if ($_valid && !is_callable('content_5a4300e869b28')) {function content_5a4300e869b28($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'预约管理'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-bell"></i> 预约管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-bell"></i>预约管理</li>	
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
			<div style='padding: 5px 0; display: flex;'>
				<input type="search" id='search_text' class='form-control' placeholder="请输入手机号码、客户名或预约码" style='width: 300px;'><button id='search' class='btn btn-primary'>搜索</button>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>客户id</th>
								<th>客户名</th>
								<th>联系方式</th>
								<th>预约类型</th>
								<th>置业顾问</th>
								<th>预约日期</th>
								<th>预约码</th>
								<th>是否到达</th>
								<th>下单时间</th>
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
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['u_uid'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['phone_num'];?>
</td>
									<td><?php if ($_smarty_tpl->tpl_vars['item']->value['type']==1){?>在线预约<?php }else{ ?>到场预约<?php }?></td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['cons_name'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['date'];?>
&nbsp;<?php echo $_smarty_tpl->tpl_vars['item']->value['time'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['code'];?>
</td>
									<td class='a'><?php if ($_smarty_tpl->tpl_vars['item']->value['is_arrival']==1){?><p class='text-success'>已到</p><?php }else{ ?><p class='text-danger'>未到</p><?php }?></td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['atime'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td>
										<button data-uid='<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
' class='btn btn-sm btn-info arrival' <?php if ($_smarty_tpl->tpl_vars['item']->value['is_arrival']==1){?> disabled='disabled' >已到<?php }else{ ?>>签到<?php }?></button>
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
<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.arrival').click(function(){
			let uid=$(this).data('uid');
			if(!confirm('是否将此用户设置为已到达状态?'))
				return;
			that=$(this);
			$.ajax({
				type:'POST',
				url:'<?php echo @ADMIN;?>
Consultant/order_arrival',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('签到成功');
						that.html('已到');
						that.attr('disabled','disabled');
						that.parent().parent().find('.a').html("<p class='text-success'>已到</p>");
					}else{
						alert(msg['data']);
					}
				}
			});
		});

		$('#search').click(function(){
			let search_text=$('#search_text').val();
			if(search_text)
				window.location.href='<?php echo @ADMIN;?>
Consultant/cons_order?words='+search_text;
		});
	});
</script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>