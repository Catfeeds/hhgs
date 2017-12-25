{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='注册用户信息'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 注册用户信息</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-envira"></i>注册用户信息</li>	
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
								<th>用户名称</th>
								<th>性别</th>
								<th>手机号码</th>
								<th>出生日期</th>
								<th>业主认证</th>
								<th>房源信息</th>
								<th>置业顾问</th>
								<th>注册时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list['list'] as $item}
								<tr>
									<td>{$item['uname']}</td>
									<td>{if $item['sex'] eq 1}男{else}女{/if}</td>
									<td>{$item['phone_num']}</td>
									<td>{$item['birth']|date_format:'%Y-%m-%d'}</td>
									<td>{if $item['is_authen'] eq 1}<p class='text-success'>已认证</p>{else}<p class='text-danger'>未认证</p>{/if}</td>
									<td>{$item['houseinfo']}</td>
									<td>{$item['consname']}</td>
									<td>{$item['rg_time']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>
										<a class='btn btn-primary' href='{$smarty.const.ADMIN}Member/info.html?uid={$item["uid"]}'>查看详细</a>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<div class='text-center'>
						{$list['page']}						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
{include file='../tpl/footer.tpl'}