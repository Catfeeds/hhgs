{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='标签'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-tags"></i> 标签</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-tags"></i>标签</li>	
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
		<div class='col-md-5'>
			<h4>添加新标签</h4>
			<br>
			<div class='form'>
				<div class='form-group'>
					<label>名称</label>
					<input id='termname' type='text' class='form-control'>
					<div class='help-block'>这将是它在站点上显示的名字。</div>
				</div>
				<div class='form-group'>
					<label>别名</label>
					<input id='termslug' type='text' class='form-control'>
					<div class='help-block'>“别名”是在URL中使用的别称，它可以令URL更美观。通常使用小写，只能包含字母，数字和连字符（-）。</div>
				</div>
				<button id='tag_new' class='btn btn-danger'>添加新标签</button>
			</div>
		</div>
		<div class='col-md-7'>
			<div class='category form-inline'>
				<div class='form-group'>
					<select id='handle_type' class='form-control'>
						<option value='none'>批量操作</option>
						<option value='delete'>删除</option>
					</select>
					<button id='delete_tags' class='btn btn-sm btn-default' data-d='delete_all'>应用</button>
				</div>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>
									<input id='select_all' type='checkbox'>
								</th>
								<th class='th_second'>名称</th>
								<th>别名</th>
							</tr>
						</thead>
						<tbody>
							{foreach $tags as $item}
								<tr>
									<td><input class='checkbox' type='checkbox' data-uid="{$item['term_id']}"></td>
									<td>
										<a href="tags_edit.html?tag_id={$item['term_id']}">{$item['name']}</a>
										<div class='handle'>
											<a href="tags_edit.html?tag_id={$item['term_id']}">编辑</a>
											<span class='grey'>|</span>
											<a class='delete_tag danger' href="javascript:void(0);" data-uid="{$item['term_id']}">删除</a>
											<span class='grey'>|</span>
											<a href="#">查看</a>
										</div>
									</td>
									<td>{$item['slug']}</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<div class='text-right'>
						{$page}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/category.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/terms.js'></script>
<script type="text/javascript">
	$(function(){
		$('#select_all').click(function(){
			var this_check=$(this).prop('checked');
			if(this_check)
				$('.checkbox').prop('checked',true);
			else
				$('.checkbox').prop('checked',false);
			$(':disabled').prop('checked',false);
		});
	});
</script>
{include file='../tpl/footer.tpl'}