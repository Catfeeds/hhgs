<?php /* Smarty version Smarty-3.1.6, created on 2018-01-05 14:02:18
         compiled from "./ThemeAdmin/default/Activity/attend.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5269940615a3916972608b0-73302088%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '78baed4c8815974ed4d1a173662ea1ae78000d2c' => 
    array (
      0 => './ThemeAdmin/default/Activity/attend.tpl',
      1 => 1515132136,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5269940615a3916972608b0-73302088',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3916972ad06',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'list' => 0,
    'item' => 0,
    'ls' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3916972ad06')) {function content_5a3916972ad06($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'活动数据'), 0);?>

<style type="text/css">
	.growth{
		display: flex;
		display: none;
	}
	.gowth_t,.growth_btn{
		display: none;
	}
	.growth input{
		width: 35px;
		height: 25px;
		margin: 0 2px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 活动数据</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-envira"></i>活动数据</li>	
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
			<div style='padding:10px 0;'>
				<button id='update_ls' class='btn btn-primary'>一键增加参与活动人员积分</button>
				<button id='do_update_ls' class='btn btn-danger growth_btn' data-uid="<?php echo $_GET['act_uid'];?>
">开始执行</button>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>用户id</th>
								<th>参加者</th>
								<th>手机号码</th>
								<th>携带人数</th>
								<th>报名时间</th>
								<th>是否到达</th>
								<th>签到时间</th>
								<th class='gowth_t'>成长值/活跃值</th>
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
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['u_uid'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uname'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['phone_num'];?>
</td>
									<td><p class='text-primary'><?php echo $_smarty_tpl->tpl_vars['item']->value['carry_num'];?>
&nbsp;人</p></td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['b_time'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td>
									<?php if ($_smarty_tpl->tpl_vars['item']->value['is_arrival']==0){?>
									<p class='text-info'>未签到</p>
									<?php }else{ ?>
									<p class='text-success'>已签到</p>
									<?php }?>
									</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['arrival_time'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td class='growth' data-uid="<?php echo $_smarty_tpl->tpl_vars['item']->value['u_uid'];?>
">
										<input class='level' type="text" value='<?php echo $_smarty_tpl->tpl_vars['ls']->value["level"];?>
' min=0>
										<input class='score' type="text" value='<?php echo $_smarty_tpl->tpl_vars['ls']->value["score"];?>
' min=0>
									</td>
									<td>
										<?php if ($_smarty_tpl->tpl_vars['item']->value['is_arrival']==0){?>
										<button class='btn btn-sm btn-primary arrival' data-uid='<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
'>手动签到</button>
										<?php }else{ ?>
											<button class='btn btn-default' disabled>无操作项</button>
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
		$('.arrival').click(function(){
			let uid=$(this).data('uid');
			if(!confirm('是否手动设置当前用户签到？'))
				return false;
			$.ajax({
				type:'POST',
				url:'<?php echo @ADMIN;?>
Activity/clock_in',
				dataType:'json',
				data:{
					'uid':uid
				},
				success:function(msg){
					if(msg['code']==200){
						alert('操作成功');
						window.location.reload();
					}
				}
			});
		});
		$('#update_ls').click(function(){
			$('.growth').show();
			$('.gowth_t').show();
			$('.growth_btn').show();
		});
		$('#do_update_ls').click(function(){
			let act_uid=$(this).data('uid');
			let ls={
				'data':[]
			};
			$('.growth').each(function(){
				let _this=$(this);
				let uid=_this.data('uid');
				let level=_this.find('.level').val();
				let score=_this.find('.score').val();
				ls.data.push(new Array(uid,level,score));
			});
			console.log(ls);
			$.ajax({
				type:'POST',
				url:'<?php echo @ADMIN;?>
Activity/update_ls',
				dataType:'json',
				data:{
					'act_uid':act_uid,
					'data':ls,
				},
				success:function(msg){
					if(msg['code']==200){
						$('.error_report').hide();
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
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>