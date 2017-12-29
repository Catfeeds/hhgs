<?php /* Smarty version Smarty-3.1.6, created on 2017-12-29 09:30:12
         compiled from "./ThemeAdmin/default/Member/info.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4174456585a3e366f5c7940-56801125%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ae37c94fb6ca87635099f8a14788b6db166c61b0' => 
    array (
      0 => './ThemeAdmin/default/Member/info.tpl',
      1 => 1514470226,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4174456585a3e366f5c7940-56801125',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3e366f6468d',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'info' => 0,
    'flist' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3e366f6468d')) {function content_5a3e366f6468d($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'用户个人信息'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 用户个人信息</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-envira"></i>用户个人信息</li>	
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
				<div class='panel-heading'>个人信息</div>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<tr>
							<td>姓名:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['uname'];?>
</td>
							<td>性别:</td>
							<td><?php if ($_smarty_tpl->tpl_vars['info']->value['sex']==1){?>男<?php }else{ ?>女<?php }?></td>
						</tr>
						<tr>
							<td>身份证号:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['id_card'];?>
</td>
							<td>出生日期:</td>
							<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value['birth'],'%Y-%m-%d');?>
</td>
						</tr>
						<tr>
							<td>电话号码:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['phone_num'];?>
</td>
							<td>婚姻状态:</td>
							<td>
							<?php if ($_smarty_tpl->tpl_vars['info']->value['marital_status']==1){?>单身
							<?php }elseif($_smarty_tpl->tpl_vars['info']->value['marital_status']==2){?>已婚
							<?php }elseif($_smarty_tpl->tpl_vars['info']->value['marital_status']==3){?>恋爱中
							<?php }elseif($_smarty_tpl->tpl_vars['info']->value['marital_status']==4){?>有小孩
							<?php }?>
							</td>
						</tr>
						<tr>
							<td>常住地址:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['address'];?>
</td>
							<td>现住地址:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['residence'];?>
</td>
						</tr>
						<tr>
							<td>所属行业:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['tradename'];?>
</td>
							<td>职业:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['job'];?>
</td>
						</tr>
						<tr>
							<td >兴趣爱好:</td>
							<td colspan="3"><?php echo $_smarty_tpl->tpl_vars['info']->value['hobby'];?>
</td>
						</tr>
						<tr>
							<td>房源信息:</td>
							<td colspan="3"><?php echo $_smarty_tpl->tpl_vars['info']->value['houseinfo'];?>
</td>
						</tr>
						<tr>
							<td>置业动机:</td>
							<td>
								<?php if ($_smarty_tpl->tpl_vars['info']->value['buy_reason']==1){?>自住
								<?php }elseif($_smarty_tpl->tpl_vars['info']->value['buy_reason']==2){?>投资
								<?php }elseif($_smarty_tpl->tpl_vars['info']->value['buy_reason']==3){?>孩子上学
								<?php }elseif($_smarty_tpl->tpl_vars['info']->value['buy_reason']==4){?>其他
								<?php }?>
							</td>
							<td>置业次数:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['buy_times'];?>
</td>
						</tr>
						<tr>
							<td>车辆数量:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['car_amount'];?>
</td>
							<td>汽车品牌</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['car_brand'];?>
</td>
						</tr>
						<tr>
							<td>置业顾问:</td>
							<td><?php echo $_smarty_tpl->tpl_vars['info']->value['pro_consultant'];?>
</td>
							<td>注册时间:</td>
							<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value['rg_time'],'%Y-%m-%d %H:%M:%S');?>
</td>
						</tr>
					</table>
				</div>
			</div>
			<div class='panel panel-default'>
				<div class='panel-heading'>家庭成员</div>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['flist']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
							<tr>
								<td>关系：</td>
								<td colspan="3"><?php echo $_smarty_tpl->tpl_vars['item']->value['relation'];?>
</td>
							</tr>
							<tr>
								<td>姓名：</td>
								<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uname'];?>
</td>
								<td>生日：</td>
								<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['item']->value['birth'],'%Y-%m-%d');?>
</td>
							</tr>
							<tr>
								<td>行业：</td>
								<td><?php echo $_smarty_tpl->tpl_vars['item']->value['tradename'];?>
</td>
								<td>爱好：</td>
								<td><?php echo $_smarty_tpl->tpl_vars['item']->value['hobby'];?>
</td>
							</tr>
						<?php } ?>
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