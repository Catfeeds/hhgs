{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='用户编辑'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-pencil-square-o"></i> 用户编辑</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-pencil-square-o"></i>用户编辑</li>
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
				<div class='panel-body'>
					<input id='user_id' type='hidden' value='{$smarty.get.id}'>
					<div class='form-horizontal'>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>用户名</label>
							<div class='col-md-6 col-xs-12'>
								<input type='text' class='form-control' value='{$info["user_login"]}' disabled="true">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>用户昵称</label>
							<div class='col-md-6 col-xs-12'>
								<input id='username' type='text' class='form-control' value='{$info["user_nickname"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>电子邮件</label>
							<div class='col-md-6 col-xs-12'>
								<input id='useremail' type='email' class='form-control' value='{$info["user_email"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>角色</label>
							<div class='col-md-6 col-xs-12'>
								<select id='user_role' class='form-control'>
									<option value='general' {if $info['w_user_level'] eq 1}selected="true"{/if}>普通</option>
									<option value='super' {if $info['w_user_level'] eq 9}selected="true"{/if}>管理员</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>状态</label>
							<div class='col-md-6 col-xs-12'>
								<select id='userstatus' class='form-control'>
									<option value='forbidden' {if $info['user_status'] eq 0}selected="true"{/if}>禁用</option>
									<option value='normal' {if $info['user_status'] eq 1}selected="true"{/if}>正常</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>密码重置</label>
							<div class='col-md-6 col-xs-12'>
								<button id='reset_pass' class='btn btn-info'>重置当前用户密码</button>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>注册时间</label>
							<div class='col-md-6 col-xs-12'>
								<span class='text-default'></span>
							</div>
						</div>
						<button id='user_edit' class='btn btn-danger'>更新用户信息</button>
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