{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='置业顾问列表'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 置业顾问列表</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-envira"></i>置业顾问列表</li>	
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
								<th>姓名</th>
								<th>性别</th>
								<th>出生日期</th>
								<th>联系电话</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list as $item}
								<tr>
									<td>{$item['name']}</td>
									<td>{if $item['sex'] eq 1}男{else}女{/if}</td>
									<td>{$item['birth']|date_format:'%Y-%m-%d'}</td>
									<td>{$item['phone_num']}</td>
									<td>{$item['atime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>
										<a href="{$smarty.const.ADMIN}Consultant/cnew.html?uid={$item['uid']}">详细信息</a>
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
{include file='../tpl/footer.tpl'}