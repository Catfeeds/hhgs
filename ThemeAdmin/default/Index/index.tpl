{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='首页-概况'}

<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-tachometer"></i> 概况</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="index.html">首页</a></li>
				<li><i class="fa fa-tachometer"></i>概况</li>	  	
			</ol>
		</div>
	</div>
	<div class='row'>
		<!-- 最新页面 -->
		<div class='col-md-7'>
			<div class='panel panel-default'>
				<div class='panel-heading'>页面</div>
				<div class='panel-body'>
					<table class='table'>
						{foreach $pages['list'] as $item}
							<tr>
								<td>
									<a href="{$smarty.const.ADMIN}Pages/page_edit.html?page={$item['page_id']}" title='编辑'>{$item['page_title']}</a>
								</td>
								<td>{$item['user_nickname']}</td>
								<td>{$item['page_time']|date_format:'%Y-%m-%d %H:%M:%S'}</td>	
							</tr>
						{/foreach}
					</table>
					<div class='text-right'>
						<a href="{$smarty.const.ADMIN}Pages/page_list.html">查看更多</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 登录日志 -->
		<div class='col-md-5'>
			<div class='panel panel-default'>
				<div class='panel-heading'>登录日志</div>
				<div class='panel-body'>
					<table class='table'>
					{foreach $logs as $item}
						<tr>
							<td>{$item['name']}</td>
							<td>{$item['login_time']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
							<td>{$item['login_ip']}</td>
						</tr>						
					{/foreach}
					</table>
					<div class='text-right'>
						<a href="{$smarty.const.ADMIN}Log/login_log.html">查看更多</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 最新发布 -->
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-heading'>最新发布</div>
				<div class='panel-body'>
					<table class='table'>
						{foreach $archive['list'] as $item}
							<tr>
								<td>
									<a href='{$smarty.const.ADMIN}Archive/post_edit.html?aid={$item["id"]}'>{$item['post_title']}</a>
								</td>
								<td>{$item['user_nickname']}</td>
								<td>{$item['post_date']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
							</tr>
						{/foreach}
					</table>
					<div class='text-right'>
						<a href="{$smarty.const.ADMIN}Archive/post_list.html">查看更多</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 快捷操作 -->
		<div class='col-md-6'>
			<div class='panel panel-default'>
				<div class='panel-heading'>快捷操作</div>
				<div class='panel-body'>
					<span class="label label-primary">
						<a href="{$smarty.const.ADMIN}Archive/post_new.html">写文章</a>
					</span>
					<span class="label label-success">
						<a href="{$smarty.const.ADMIN}Pages/page_new.html">新建页面</a>
					</span>
					<span class="label label-info">
						<a href="{$smarty.const.ADMIN}User/profile.html">个人信息</a>
					</span>
					<span class="label label-danger">
						<a href="{$smarty.const.ADMIN}Archive/category.html">分类管理</a>
					</span>
					<span class="label label-warning">
						<a href="{$smarty.const.ADMIN}Archive/tags.html">标签管理</a>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/index.css">
{include file='../tpl/footer.tpl'}
