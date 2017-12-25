{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='回收站'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-trash-o"></i> 回收站</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-trash-o"></i>回收站</li>	
			</ol>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class='table table-striped table-hover'>
						<thead>
							<tr>
								<th>标题</th>
								<th>作者</th>
								<th>分类目录</th>
								<th>标签</th>
								<th>日期</th>
							</tr>
						</thead>
						<tbody>
							{foreach $result['list'] as $item}
								<tr>
									<td>
										<a href="{$smarty.const.ADMIN}Archive/post_view.html?aid={$item['id']}" target="_blank">{$item['post_title']}</a>
									</td>
									<td>{$item['user_nickname']}</td>
									<td>
										{foreach $item['category'] as $val}
											<span>{$val['name']}</span>
										{/foreach}
									</td>
									<td>
										{foreach $item['tags'] as  $val}
											<span>{$val['name']}</span>
										{/foreach}
									</td>
									<td>{$item['post_date']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
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
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/archive.css">
{include file='../tpl/footer.tpl'}