{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='编辑'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-pencil-square-o"></i> 编辑文章</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-pencil-square-o"></i>编辑文章</li>	
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
		<div class='col-md-9'>
			<input id='post_id' type='hidden' value="{$smarty.get.aid}">
			<div class='row'>
				<div class='col-md-12 margin_30'>
					<input id='post_title' class='form-control' type='text' placeholder='在此输入标题' value='{$result["post_title"]}'>
				</div>
				<div class='col-md-12 margin_30'>
					<textarea id='post_description' class='form-control' rows='3' placeholder='在此输入内容描述' style='resize:none;'>{$result["post_describe"]}</textarea>
				</div>
				<div class='col-md-12'>
					<script id="editor" type="text/plain" style="width:100%;height:500px;">{$result['post_content']|htmlspecialchars_decode|stripslashes}</script>
				</div>
			</div>
		</div>
		<div class='col-md-3'>
			<!-- 发布 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">发布</h3>
				</div>
				<div class="panel-body">
					<ul class="list-group">
						<li class="list-group-item">
							<button id='edit_draft' class='btn btn-default'>保存草稿</button>
						</li>
						<li class="list-group-item">
							<i class='fa fa-bell-o'></i>状态：<b>修改</b>
							<!-- <a href="#">编辑</a> -->
						</li>
						<li class="list-group-item">
							<i class='fa fa-clock-o'></i><b id='date_str'>立即发布</b>
							<a id='date_edit' href="javascript:void(0);">编辑</a>
							<div class='datetime' data-reset='0'>
								<input id='real_time' type='hidden' value='{$result["post_date"]}'>
								<input id='year' class='y_text' type='text'>-
								<select id='month'></select>-
								<select id='day'></select>@
								<input id='hour' class='s_text' type='text'> :
								<input id='min' class='s_text' type='text'> :
								<input id='sec' class='s_text' type='text'>
								<p class='d_p'>
									<button id='set_time' class='btn btn-sm btn-default'>确定</button>&nbsp;
									<a href="javascript:void(0);" class='cancel'>取消</a>
								</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="panel-footer text-right">
					<a id='delete_art' data-uid='{$smarty.get.aid}' href='javascript:void(0);'>移至回收站</a>
					<button id='post_edit' class='btn btn-danger'>更新</button>
				</div>
			</div>
			<!-- 缩略图 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">缩略图</h3>
				</div>
				<div class="panel-body">
					<div class='thumbnail'>
						<img data-src="{$result['post_thumbnail']}" data-root='{$smarty.const.HOME}' src="{$smarty.const.HOME}{$result['post_thumbnail']}">
					</div>
					<div class='img_edit help-block'>点击图片来修改或更新</div>
					<a id='add_thumb' href="javascript:void(0);">上传缩略图</a>
					<a id='remove_thumb' class='display_hide' href="javascript:void(0);" >移除缩略图</a>
					<div class='help-block'>
						<small>最大上传文件大小：2 MB</small>
					</div>
				</div>
			</div>
			<!-- 分类目录 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">分类目录</h3>
				</div>
				<div class="panel-body">
					{foreach $category as $item}
						{foreach $selected_cate as $j}
							{if $item['term_id'] eq $j['term_taxonomy_id']}
								{assign var='checked' value='checked'}
								{break}
							{else}
								{assign var='checked' value=''}
							{/if}
						{/foreach}
						<div class="checkbox">
						    <label>
						    	{section start=1 name='loop' loop=$item['level']}&nbsp;&nbsp;&nbsp;&nbsp;{/section}
						     	<input class='category' data-cate="{$item['term_id']}" type="checkbox" {$checked}>{$item['name']}
						    </label>
						</div>
					{/foreach}
				</div>
			</div>
			<!-- 标签 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">标签</h3>
				</div>
				<div class="panel-body">
					<div class='form-inline'>
						<div class="form-group">
							<input id='tagname' type="text" class="form-control" placeholder="标签">
							<button id='tag_add' class='btn btn-default'>添加</button>
						</div>
						<div class='help-block tag_err'>
							<small></small>
						</div>
					</div>
					<div id='tags' class='tags'>
						{foreach $selected_tag as $item}
							<span class="label label-default reomve_tag" title="点击删除" data-uid="{$item['term_taxonomy_id']}"><i class="fa fa-times-circle"></i>{$item['name']}</span>
						{/foreach}
					</div>
					<div>
						<a href="javascript:void(0);" data-toggle="modal" data-target="#tagModal">从已有标签中选择</a>
					</div>
					<div class='tags'>
						<a href="tags.html">标签管理</a>
					</div>			
				</div>
			</div>
			<!-- 排序 -->
			<div class='panel panel-default'>
				<div class="panel-heading">
					<h3 class="panel-title">排序</h3>
				</div>
				<div class="panel-body">
					<div class='form-group'>
						<i class='fa fa-sort-numeric-asc i'></i>排序
						<input id='sort' type='number' class='control' value='{$result["post_seqencing"]}'>
						<div class='help-block'>
							<small>数值越大排序越靠前</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 图片上传模态框 -->
<div id='imgModal' class="modal fade " tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">选择缩略图</h4>
			</div>
			<div class="modal-body">
				<div>
					<form id="upload" enctype="multipart/form-data"  method='post'>
						<div class='file_hide'>
							<a class='btn btn-primary btn-lg'>请选择要上传的图片<input type="file" class="imgUpload" name="file"/></a>
						</div>
						<div class='error_file help-block text-center'></div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 标签选择 -->
<div id='tagModal' class="modal fade " tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">标签选择</h4>
			</div>
			<div class="modal-body">
				<div class='help-block'>点击标签可直接选中</div>
				<div class='tag_list'>
					{foreach $tags as $item}
						<span data-uid='{$item["term_id"]}' data-value="{$item['name']}" class='label label-primary selected_tag' title='点击选择'><i class="fa fa-plus-square" aria-hidden="true"></i>{$item['name']}</span>
					{/foreach}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/archive.css">
<!-- ueditor编辑器 -->
<script type="text/javascript" src='{$smarty.const.ORG}editor/ueditor/ueditor.config.js'></script>
<script type="text/javascript" src='{$smarty.const.ORG}editor/ueditor/ueditor.all.min.js'></script>
<script type="text/javascript" src='{$smarty.const.ORG}editor/ueditor/createEditor.js'></script>
<!-- ueditor编辑器 -->
<!-- jquery.form上传插件 -->
<script type="text/javascript" src='{$smarty.const.ORG}upload/jquery.form.js'></script>
<!-- 档案操作 -->
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/archive.js'></script>
<!-- 文件上传 -->
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/file_upload.js'></script>
<script type="text/javascript">
	// $(window).bind('beforeunload',function(){
	// 	return '确定离开此页面吗？';
	// });
</script>
{include file='../tpl/footer.tpl'}