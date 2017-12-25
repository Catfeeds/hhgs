{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='个人信息修改'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-info-circle"></i> 个人信息修改</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-info-circle"></i>个人信息修改</li>
			</ol>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='error_report'>
				错误：
				<span class='text-danger'></span>
			</div>
		</div>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<div class='form-horizontal'>
						<h4>个人信息</h4>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>登录名</label>
							<div class='col-md-6 col-xs-12'>
								<input type='text' class='form-control' value='{$info["user_login"]}' disabled>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>用户昵称</label>
							<div class='col-md-6 col-xs-12'>
								<input id='username' type='text' class='form-control' value='{$info["user_nickname"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>邮箱</label>
							<div class='col-md-6 col-xs-12'>
								<input id='useremail' type='email' class='form-control' value='{$info["user_email"]}'>
							</div>
						</div>
						<button id='profile_submit' class='btn btn-danger'>更新个人信息</button>
						<hr>
						<h4>密码设置</h4>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>原密码</label>
							<div class='col-md-6 col-xs-12'>
								<input id='password' type='text' class='form-control'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>新密码</label>
							<div class='col-md-6 col-xs-12'>
								<input id='newpassword' type='password' class='form-control'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>重复新密码</label>
							<div class='col-md-6 col-xs-12'>
								<input id='pass_repeat' type='password' class='form-control'>
							</div>
						</div>
						<button id='pass_submit' class='btn btn-danger'>更新密码</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/users.js'></script>
{include file='../tpl/footer.tpl'}