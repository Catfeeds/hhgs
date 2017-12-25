{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='文章日志'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-sticky-note-o"></i> 文章日志</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-sticky-note-o"></i>文章日志</li>	
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
								<th>标题</th>		
								<th>分类目录</th>
								<th>标签</th>
								<th>原作者</th>
								<th>修改人</th>
								<th>添加日期</th>
								<th>编辑日期</th>
							</tr>
						</thead>
						<tbody>
							{foreach $result['list'] as $val}
								<tr>
									<td class='td_first'>
										<a class='post_title' href="#">{$val['post_title']}</a>
									</td>
									
									<td>
										{foreach $val['category'] as $item}
											<a href="#">{$item['name']}</a>
										{/foreach}
									</td>
									<td>
										{foreach $val['tags'] as  $item}
											<a href="#">{$item['name']}</a>
										{/foreach}
									</td>
									<td>
										<a href='#'>{$val['post_author']}</a>
									</td>
									<td>
										<a href='#'>{$val['modifier']}</a>
									</td>
									<td>
										<div>{$val['post_date']|date_format:'%Y-%m-%d %H:%M:%S'}</div>
									</td>
									<td>
										<div>{$val['post_modified']|date_format:'%Y-%m-%d %H:%M:%S'}</div>
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