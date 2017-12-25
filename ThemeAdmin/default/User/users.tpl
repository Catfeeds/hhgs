{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='用户管理'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-users"></i> 用户管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-users"></i>用户管理</li>
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
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>
									<input id='select_all' type='checkbox'>
								</th>
								<th class='th_second'>用户名</th>
								<th>用户昵称</th>
								<th>电子邮件</th>
								<th>角色</th>
								<th>添加时间</th>
								<th>用户状态</th>
							</tr>
						</thead>
						<tbody>
							{foreach $userinfos as $item}
								<tr>
									<td>
										<input class='checkbox' type='checkbox' name='name[]' data-uid='{$item["id"]}'>
									</td>
									<td>
										<a href="{$smarty.const.ADMIN}User/user_edit.html?id={$item['id']}">{$item['user_login']}</a>
										<div class='handle'>
											<a href="{$smarty.const.ADMIN}User/user_edit.html?id={$item['id']}">编辑</a>
											<!-- <span class='grey'>|</span>
											<a class='delete danger' href="javascript:void(0);" data-uid="{$item['id']}">删除</a> -->
										</div>
									</td>
									<td>{$item['user_nickname']}</td>
									<td>
										<a href="mailto:{$item['user_email']}">{$item['user_email']}</a>
									</td>
									<td>
										{if $item['w_user_level'] eq 10}
										<span>超级管理员</span>
										{else if $item['w_user_level'] eq 9}
										<span>管理员</span>
										{else if $item['w_user_level'] eq 1}
										<span>普通</span>
										{/if}
									</td>
									<td>
										{$item['user_registered']|date_format:'%Y-%m-%d %H:%M:%S'}
									</td>
									<td>
										{if $item['user_status'] eq 1}
										<p class='text-success'>正常</p>
										{else}
										<p class='text-danger'>禁用</p>
										{/if}
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
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
		$('#select_all').click(function(){
			var this_check=$(this).prop('checked');
			if(this_check)
				$('.checkbox').prop('checked',true);
			else
				$('.checkbox').prop('checked',false);
		});
	});
</script>
{include file='../tpl/footer.tpl'}