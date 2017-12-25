<?php /* Smarty version Smarty-3.1.6, created on 2017-12-22 15:36:57
         compiled from "./ThemeAdmin/default/Activity/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12832496925a38c01c11b676-06702815%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '56ceb7cb08b7c18d2ca35aa10003e9e0635f0bf5' => 
    array (
      0 => './ThemeAdmin/default/Activity/index.tpl',
      1 => 1513928215,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12832496925a38c01c11b676-06702815',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a38c01c16d44',
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
<?php if ($_valid && !is_callable('content_5a38c01c16d44')) {function content_5a38c01c16d44($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'活动管理'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 活动管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-envira"></i>活动管理</li>	
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
								<th>活动名称</th>
								<th>活动状态</th>
								<th>开始时间</th>
								<th>结束时间</th>
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
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</td>
									<td>
										<?php if ($_smarty_tpl->tpl_vars['item']->value['status']==2){?>
										<p class="text-danger">已结束</p>
										<?php }elseif($_smarty_tpl->tpl_vars['item']->value['status']==3){?>
										<p class="text-info">暂停中</p>
										<?php }elseif($_smarty_tpl->tpl_vars['item']->value['e']<time()){?>
										<p class="text-danger">已结束</p>
										<?php }elseif(time()<$_smarty_tpl->tpl_vars['item']->value['e']){?>
										<p class="text-success">进行中</p>
										
										<?php }?>
									</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['date'];?>
&nbsp;&nbsp;<?php echo $_smarty_tpl->tpl_vars['item']->value['time'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['edate'];?>
&nbsp;&nbsp;<?php echo $_smarty_tpl->tpl_vars['item']->value['etime'];?>
</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['atime'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td>
										<a  class='btn btn-primary btn-sm' href="<?php echo @ADMIN;?>
Activity/act_new.html?uid=<?php echo $_smarty_tpl->tpl_vars['item']->value['uid'];?>
">编辑</a>
										<a  class='btn btn-warning btn-sm' href="<?php echo @ADMIN;?>
Activity/attend.html?act_uid=<?php echo $_smarty_tpl->tpl_vars['item']->value['uid'];?>
">数据</a>
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
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>