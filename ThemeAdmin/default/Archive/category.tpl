{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='分类目录'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-bars"></i> 分类目录</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-bars"></i>分类目录</li>	
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
			<h4>添加新分类目录</h4>
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
				<div class='form-group'>
					<label>父节点</label>
					<select id='termparent' class='form-control'>
						<option value='0'>无</option>
						{foreach $category as $item}
							<option value='{$item["term_id"]}'>
							{section start=1 name='loop' loop=$item['level']}—{/section}{$item['name']}
							</option>
						{/foreach}	
					</select>
				</div>
				<button id='category_new' class='btn btn-danger'>添加新分类目录</button>
			</div>
		</div>
		<div class='col-md-7'>
			<div class='category form-inline'>
				<div class='form-group'>
					<select id='handle_type' class='form-control'>
						<option value='none'>批量操作</option>
						<option value='delete'>删除</option>
					</select>
					<button id='delete_all' class='btn btn-sm btn-default'>应用</button>
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
							{foreach $category as $item}
								<tr>
									<td><input class='checkbox' type='checkbox'  {if $item['term_id'] eq 1}disabled="disabled"{/if} data-uid="{$item['term_id']}"></td>
									<td>
										<a href="category_edit.html?tag_id={$item['term_id']}">{section start=1 name='loop' loop=$item['level']}—{/section}{$item['name']}</a>
										<div class='handle'>
											<a href="category_edit.html?tag_id={$item['term_id']}">编辑</a>
											{if $item['term_id'] neq 1}
											<span class='grey'>|</span>
											<a data-uid="{$item['term_id']}" class='danger delete' href="javascript:void(0);">删除</a>
											{/if}
											<span class='grey'>|</span>
											<a href="#">查看</a>
										</div>
									</td>
									<td>{$item['slug']}</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
			<div class='help-block'>删除一个分类不会删除分类中的文章。然而，仅属于被删除分类的文章将被指定为未分类分类。</div>
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