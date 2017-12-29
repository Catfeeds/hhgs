<?php /* Smarty version Smarty-3.1.6, created on 2017-12-29 16:12:51
         compiled from "./Theme/default/Member/family.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14307513935a30dbb24534a3-39485798%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bfd13ecf5f3c53b443d06d292471a2f49c03d87c' => 
    array (
      0 => './Theme/default/Member/family.tpl',
      1 => 1514470208,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14307513935a30dbb24534a3-39485798',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a30dbb2457d8',
  'variables' => 
  array (
    'list' => 0,
    'l' => 0,
    'hide' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a30dbb2457d8')) {function content_5a30dbb2457d8($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html lang='zh'>
<head>
	<title>家庭成员管理</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<?php echo @THEME;?>
Member/css/family.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			<?php if ($_smarty_tpl->tpl_vars['list']->value==null){?>
				<p style='padding: 80px 15px 10px;text-align: center;'>暂无家庭成员，若您为业主请自行添加家庭成员信息</p>
			<?php }else{ ?>
				<?php  $_smarty_tpl->tpl_vars['l'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['l']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['l']->key => $_smarty_tpl->tpl_vars['l']->value){
$_smarty_tpl->tpl_vars['l']->_loop = true;
?>
					<a href="<?php echo @HOME;?>
Member/family_mem.html?memid=<?php echo $_smarty_tpl->tpl_vars['l']->value['uid'];?>
">
						<div class='family_mem'>			
							<div class='elm headimg'>
								<img src="<?php if ($_smarty_tpl->tpl_vars['l']->value['headimg']==null){?><?php echo @THEME;?>
/Member/img/head-2.gif<?php }else{ ?>$l['headimg'<?php }?>">
							</div>
							<div class='elm info'>
								<p>姓名：<span class='ispan'><?php echo $_smarty_tpl->tpl_vars['l']->value['uname'];?>
</span> 性别：<?php if ($_smarty_tpl->tpl_vars['l']->value['sex']==1){?>男<?php }else{ ?>女<?php }?></p>
								<p>生日：<span class='ispan birth' data-birth="<?php echo $_smarty_tpl->tpl_vars['l']->value['birth'];?>
"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['l']->value['birth'],"%m/%d");?>
</span> 年龄：<span class='age'></span></p>
								<p>手机号码：<?php echo $_smarty_tpl->tpl_vars['l']->value['phone_num'];?>
</p>
							</div>
							<div class='elm relation'>
								<?php if ($_smarty_tpl->tpl_vars['hide']->value==false){?><p class='rbg'><?php echo $_smarty_tpl->tpl_vars['l']->value['relation'];?>
</p><?php }?>
							</div>
							<p>
								<div class='circle circle_l'></div>
								<div class='circle circle_r'></div>
							</p>				
						</div>
					</a>
				<?php } ?>
			<?php }?>	
			<?php if ($_smarty_tpl->tpl_vars['hide']->value==false){?>
			<div class='add'>
				<a href="<?php echo @HOME;?>
Member/family_mem.html"><img src="<?php echo @THEME;?>
Member/img/add.png"></a>
			</div>
			<?php }?>
			
		</div>
	</div>
	<script src="<?php echo @ORG;?>
jquery/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		var set_age=function(){
			$('.birth').each(function(){
				let birthstamp=$(this).data('birth')*1000;
				let nowstamp=Date.parse(new Date());
				let age= Math.floor((nowstamp-birthstamp)/1000/(60*60*24*365));
				if(!isNaN(age))
					$(this).parent().parent().find('.age').html(age);
			});
		}
		set_age();
	</script>
</body>
</html><?php }} ?>