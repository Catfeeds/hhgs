<?php /* Smarty version Smarty-3.1.6, created on 2017-12-28 23:03:27
         compiled from "./ThemeAdmin/default/Member/h_new.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20172540755a3f65336c0605-54183763%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '29cd47ed40b1e299f8053ad7e6187c48fcab4662' => 
    array (
      0 => './ThemeAdmin/default/Member/h_new.tpl',
      1 => 1514473397,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20172540755a3f65336c0605-54183763',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a3f653376dab',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'info' => 0,
    'consultant' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a3f653376dab')) {function content_5a3f653376dab($_smarty_tpl) {?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'业主信息导入'), 0);?>

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 业主信息导入</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-plus-square"></i>业主信息导入</li>	
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
					<form id='form' action="" method="post" enctype="multipart/form-data" class='form-horizontal'>
						<input id="uid" type='hidden' value="<?php echo $_smarty_tpl->tpl_vars['info']->value['uid'];?>
">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>业主姓名</label>
							<div class='col-xs-12 col-md-11'>
								<input id='name' class='form-control' type="text" name="name" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["name"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>业主身份证号</label>
							<div class='col-xs-12 col-md-11'>
								<input id='idcard' class='form-control' type="text" name="idcard" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["idcard"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>手机号码</label>
							<div class='col-xs-12 col-md-11'>
								<input id='phone' class='form-control' type="text" name="phone" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["phone_num"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>地块</label>
							<div class='col-xs-12 col-md-11'>
								<input id='area' class='form-control' type="text" name="area" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["area"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>房源信息</label>
							<div class='col-xs-12 col-md-11'>
								<input id='houseinfo' class='form-control' type="text" name="houseinfo" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["houseinfo"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>置业顾问</label>
							<div class='col-xs-12 col-md-11'>
								<select id='consultant' class='form-control' name="consultant">
									<option value=0>请选择置业顾问</option>
									<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['consultant']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
									<option <?php if ($_smarty_tpl->tpl_vars['info']->value['consultant']==$_smarty_tpl->tpl_vars['item']->value['uid']){?>selected<?php }?> value='<?php echo $_smarty_tpl->tpl_vars['item']->value["uid"];?>
'><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'></label>
							<div class='col-xs-12 col-md-11'>
								<button type='submit' class='btn btn-danger'>提交信息</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src='<?php echo @JS;?>
card.js'></script>
<script type="text/javascript">
	$(function(){
		// 手机号码验证
		jQuery.validator.addMethod("isphone", function(value, element) {
		  	var length = value.length; 
		  	
		  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
		  	
		  	return this.optional(element) || (length == 11 && mobile.test(value)); 
		}, "手机号码格式错误"); 
		// 身份证验证
		jQuery.validator.addMethod("isIdCardNo", function(value, element) { 
			return this.optional(element) || idCardNoUtil.checkIdCardNo(value); 
		}, "请正确输入您的身份证号码"); 
		$('#form').validate({
			// debug:true,
			rules:{
				name:'required',
				idcard:{
					required:true,
					isIdCardNo:true,
				},
				phone:{
					required:true,
					isphone:true,
				},
				area:'required',
				houseinfo:'required',
				consultant:{
					required:true,
					min:1
				},
			},
			messages:{
				name:'业主姓名不能为空',
				idcard:{
					isIdCardNo:'请输入正确的身份证号码',
					required:'身份证号码不能为空'
				},
				phone:{
					required:'手机号码不能为空',
					isphone:'手机号码格式错误'
				},
				area:'请填写区块',
				houseinfo:'请填写房源信息',
				consultant:{
					reuqired:'请选择置业顾问',
					min:'请选择置业顾问',
				}
			},
			submitHandler:function(){
				$.ajax({
					type:'POST',
					dataType:'json',
					data:{
						'uid':$('#uid').val(),
						'name':$('#name').val(),
						'idcard':$('#idcard').val(),
						'phone':$('#phone').val(),
						'area':$('#area').val(),
						'houseinfo':$('#houseinfo').val(),
						'consultant':$('#consultant').val(),
					},
					success:function(msg){
						if(msg['code']==200){
							alert('提交成功');
							window.location.reload();
						}else{
							$('.error_report').show();
							$('.error_report .text-danger').html(msg['data']);
						}
					}
				});
			},
		});
	});
</script>
<!-- 上传excel文件并将业主信息导入到数据库中去 -->
<script type="text/javascript" src='<?php echo @ORG;?>
upload/jquery.form.js'></script>
<script type="text/javascript">
	$(function(){

	});
</script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>