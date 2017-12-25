{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='用户登录'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-sign-in"></i> 用户登录</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-sign-in"></i>用户登录</li>	
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
					<table class='table table-striped table-hover'>
						<thead>
							<tr>
								<th>登录用户ID</th>
								<th>用户昵称</th>
								<th>登录时间</th>
								<th>登录IP</th>
								<th>登录来源</th>
							</tr>
						</thead>
						<tbody>
							{foreach $result['list'] as $item}
								<tr>
									<td>{$item['user_id']}</td>
									<td>{$item['name']}</td>
									<td>{$item['login_time']|date_format:'%Y-%m-%d %H-%M-%S'}</td>
									<td>{$item['login_ip']}</td>
									<td>
										<a target="_blank" href="{$item['login_referer']}">{$item['login_referer']}</a>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<div class='text-center'>
						{$result['page']}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
{include file='../tpl/footer.tpl'}