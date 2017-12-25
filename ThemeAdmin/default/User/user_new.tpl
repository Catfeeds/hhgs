{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='添加新用户'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-user-plus"></i> 添加新用户</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-user-plus"></i>添加新用户</li>
			</ol>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='error_report'>
				错误：
				<span class='text-danger'>错误提示</span>
			</div>
		</div>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel panel-body'>
					<div class='form-horizontal'>
						<h4>添加新用户</h4>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>用户名</label>
							<div class='col-md-6 col-xs-12'>
								<input id='userlogin' type='text' class='form-control'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>用户昵称</label>
							<div class='col-md-6 col-xs-12'>
								<input id='username' type='text' class='form-control'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>电子邮件</label>
							<div class='col-md-6 col-xs-12'>
								<input id='useremail' type='mail' class='form-control' autocomplete='off'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>角色</label>
							<div class='col-md-6 col-xs-12'>
								<select id='user_role' class='form-control'>
									<option value='general'>普通</option>
									<option value='super'>管理员</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>密码</label>
							<div class='col-md-6 col-xs-12'>
								<input id='textpass' type='text' class='form-control'>
								<input id='password' type='password' class='form-control' autocomplete='off' style='display:none;' readonly="true">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>状态</label>
							<div class='col-md-6 col-xs-12'>
								<select id='userstatus' class='form-control'>
									<option value='forbidden'>禁用</option>
									<option value='normal'>正常</option>
								</select>
							</div>
						</div>
						<button id='user_submit' class='btn btn-danger'>添加用户</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/users.js'></script>
<script type="text/javascript">
	$(function(){
		$('#textpass').on('click focus',function(){
			$(this).hide();
			$('#password').show().attr('readonly',false).focus();
		});
	});
</script>
{include file='../tpl/footer.tpl'}
