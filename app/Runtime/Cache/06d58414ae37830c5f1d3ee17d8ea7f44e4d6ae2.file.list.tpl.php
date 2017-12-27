<?php /* Smarty version Smarty-3.1.6, created on 2017-12-27 17:13:38
         compiled from "./ThemeAdmin/default/Service/list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5337391685a430dd5960af4-32648791%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '06d58414ae37830c5f1d3ee17d8ea7f44e4d6ae2' => 
    array (
      0 => './ThemeAdmin/default/Service/list.tpl',
      1 => 1514366010,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5337391685a430dd5960af4-32648791',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a430dd59f888',
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
<?php if ($_valid && !is_callable('content_5a430dd59f888')) {function content_5a430dd59f888($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'服务管理'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-puzzle-piece"></i> 服务管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-puzzle-piece"></i>服务管理</li>	
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
			<div style='padding:5px 0;'>
				<a class='btn btn-primary' href="<?php echo @ADMIN;?>
/Service/service_add.html">添加服务</a>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>服务名称</th>
								<th>名额</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>用户等级</th>
								<th>区域</th>
								<th>服务状态</th>
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
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['number'];?>
</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['stime'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['etime'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td><i>Lv&nbsp;</i><?php echo $_smarty_tpl->tpl_vars['item']->value['level'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['item']->value['area'];?>
</td>
									<td><?php if ($_smarty_tpl->tpl_vars['item']->value['status']==1){?><p class='text-success'>进行</p><?php }else{ ?><p class='text-danger'>暂停</p><?php }?></td>
									<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['atime'],'%Y-%m-%d %H:%M:%S');?>
</td>
									<td>
										<a href='<?php echo @ADMIN;?>
/Service/service_add.html?suid=<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
' class='btn btn-info btn-sm'>详细信息</button>
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
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>