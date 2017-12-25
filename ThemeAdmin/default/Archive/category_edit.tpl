{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='分类类目编辑'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-pencil-square-o"></i> 分类类目编辑</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-pencil-square-o"></i>分类类目编辑</li>	
			</ol>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='error_report'>
				错误：
				<span class='text-danger'></span>
			</div>
		</div>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<div class='form-horizontal'>
						<input type='hidden' id='tag_id' value='{$smarty.get.tag_id}'>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>名称</label>
							<div class='col-md-6 col-xs-12'>
								<input id='termname' type='text' class='form-control' value='{$term_info["name"]}'>
								<div class='help-block'>这将是它在站点上显示的名字。</div>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12 control-label'>别名</label>
							<div class='col-md-6 col-xs-12'>
								<input id='termslug' type='text' class='form-control' value="{$term_info['slug']}">
								<div class='help-block'>“别名”是在URL中使用的别称，它可以令URL更美观。通常使用小写，只能包含字母，数字和连字符（-）。</div>
							</div>
						</div>
						<div class='form-group'>
							<label  class='col-md-1 col-xs-12 control-label'>父节点</label>
							<div class='col-md-6 col-xs-12'>
								<select id='termparent' class='form-control'>
									<option value='0'>无</option>
									{foreach $category as $item}
										<option value='{$item["term_id"]}'  {if $term_info['term_group'] eq $item['term_id']}selected='true'{/if}>
										{section start=1 name='loop' loop=$item['level']}—{/section}{$item['name']}
										</option>
									{/foreach}
								</select>
							</div>
						</div>
						<button id='category_edit' class='btn btn-danger'>更新</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">

<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/terms.js'></script>
{include file='../tpl/footer.tpl'}