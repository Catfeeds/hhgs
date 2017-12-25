{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='业主信息列表(导入)'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 业主信息列表（导入）</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-envira"></i>业主信息列表（导入）</li>	
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
								<th>身份证</th>
								<th>手机号码</th>
								<th>地块</th>
								<th>房源信息</th>
								<th>置业顾问</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list['list'] as $item}
								<tr>
									<td>{$item['name']}</td>
									<td>{$item['idcard']}</td>
									<td>{$item['phone_num']}</td>
									<td>{$item['area']}</td>
									<td>{$item['houseinfo']}</td>
									<td>{$item['cons_name']}</td>
									<td>{$item['atime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>
										<a href="{$smarty.const.ADMIN}Member/h_new.html?uid={$item['uid']}">查看详情</a>
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