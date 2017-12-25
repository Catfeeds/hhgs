{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='文章'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-archive"></i> 文章</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-archive"></i>文章</li>	
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
		<div class='col-lg-12'>
			<ul class='ul_menu'>
				<li>
					<a href="{$smarty.const.ADMIN}archive/post_list.html">全部 ({$archive_num['all']})</a>
				</li> |
				<li>
					<a href="{$smarty.const.ADMIN}archive/post_list.html?status=publish">已发布 ({$archive_num['publish']})</a>
				</li> |
				<li>
					<a href="{$smarty.const.ADMIN}archive/post_list.html?status=draft">草稿 ({$archive_num['draft']})</a>
				</li> |
				<li>
					<a href="{$smarty.const.ADMIN}archive/trash.html">回收站 ({$archive_num['del']})</a>
				</li>
			</ul>
		</div>
		<div class='category col-lg-12 form-inline'>
			<div class='form-group'>
				<select id='select_control' class='form-control'>
					<option value=''>批量操作</option>
					<option value='delete'>移至回收站</option>
				</select>
				<button id='delete_all' class='btn btn-sm btn-default'>应用</button>
			</div>
			<div class='form-group'>
				<select id='category' class='form-control' data-url="{$smarty.const.ADMIN}Archive/post_list.html">
					<option value=''>所有分类目录</option>
					{foreach $category as $item}
						<option value='{$item["term_id"]}' data-slug='{$item["slug"]}' {if $smarty.get.cate eq $item['term_id']}selected{/if}>
						{section start=1 name='loop' loop=$item['level']}—{/section}{$item['name']}
						</option>
					{/foreach}	
				</select>
				<button id='apply' class='btn btn-sm btn-default'>筛选</button>
			</div>
		</div>
		<div class='col-lg-12'>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>
									<input id='select_all' type='checkbox'>
								</th>
								<th>标题</th>
								<th>作者</th>
								<th>分类目录</th>
								<th>标签</th>
								<th>日期</th>
								<th><i id='sort_i' class='fa fa-sort-numeric-asc i' title='点击排序' data-sort='{$smarty.get.sort}'></i>排序</th>
							</tr>
						</thead>
						<tbody>
							{foreach $result['list'] as $val}
								<tr>
									<td>
										<input class='checkbox' type='checkbox' data-uid="{$val['id']}">
									</td>
									<td class='td_first'>
										<a class='post_title' href="{$smarty.const.ADMIN}Archive/post_edit.html?aid={$val['id']}">{if $val['post_status'] eq 'draft'}<span class='text-danger'>(草稿)&nbsp;</span>{/if}{$val['post_title']}</a>
										<div class='handle'>
											<a href="{$smarty.const.ADMIN}Archive/post_edit.html?aid={$val['id']}">编辑</a>
											<span class='grey'>|</span>
											<a class='danger delete' href="#" data-uid="{$val['id']}">移至回收站</a>
											<span class='grey'>|</span>
											<a href="{$smarty.const.ADMIN}Archive/post_view.html?aid={$val['id']}" target="_blank">查看</a>
										</div>
									</td>
									<td><a href='{$smarty.const.ADMIN}Archive/post_list.html?author={$val["userid"]}'>{$val['user_nickname']}</a></td>
									<td>
										{foreach $val['category'] as $item}
											<a href="{$smarty.const.ADMIN}Archive/post_list.html?cate={$item['term_id']}">{$item['name']}</a>
										{/foreach}
									</td>
									<td>
										{foreach $val['tags'] as  $item}
											<a href="{$smarty.const.ADMIN}Archive/post_list.html?tag={$item['term_id']}">{$item['name']}</a>
										{/foreach}
									</td>
									<td>
										<div>{$val['post_date']|date_format:'%Y-%m-%d %H:%M:%S'}</div>
									</td>
									<td>{$val['post_seqencing']}</td>
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
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/archive.css">
<!-- 档案操作 -->
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/archive.js'></script>
{include file='../tpl/footer.tpl'}