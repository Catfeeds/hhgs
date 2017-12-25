{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='所有页面'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-list-alt"></i> 所有页面</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-list-alt"></i>所有页面</li>	
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
								<th>页面标题</th>
								<th>页面连接</th>
								<th>创建时间</th>
								<th>创建人</th>
							</tr>
						</thead>
						<tbody>
							{foreach $result['list'] as $item}
								<tr>
									<td>
										<a href="{$smarty.const.ADMIN}Pages/page_edit.html?page={$item['page_id']}">{$item['page_title']}</a>
										<div class='handle'>
											<a href="{$smarty.const.ADMIN}Pages/page_edit.html?page={$item['page_id']}">编辑</a>
											<span class='grey'>|</span>
											<a class='danger delete' href="javascript:void(0);" data-uid="{$item['page_id']}">删除</a>
											<span class='grey'>|</span>
											<a href="{$smarty.const.ADMIN}Pages/page_view.html?page={$item['page_id']}" target="_blank">查看</a>
										</div>
									</td>
									<td><a href="http://{$server}pages/index/page/{$item['page_id']}" target="_blank">http://{$server}pages/index/page/{$item['page_id']}</a></td>
									<td>{$item['page_time']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>{$item['user_nickname']}</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<div class='text-center'>{$result['page']}</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/pages.js'></script>
{include file='../tpl/footer.tpl'}