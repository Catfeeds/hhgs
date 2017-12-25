{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='新建页面'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 新建页面</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-plus-square"></i>新建页面</li>	
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
		<div class='col-md-12 margin_30'>
			<input id='title' class='form-control' type='text' placeholder='在此输入标题'>
		</div>
		<div class='col-md-12 margin_30'>
			<script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
		</div>
		<div class='col-md-12'>
			<button id='page_new' class='btn btn-danger'>新建页面</button>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/pages.css">

<!-- ueditor编辑器 -->
<script type="text/javascript" src='{$smarty.const.ORG}editor/ueditor/ueditor.config.js'></script>
<script type="text/javascript" src='{$smarty.const.ORG}editor/ueditor/ueditor.all.min.js'></script>
<script type="text/javascript" src='{$smarty.const.ORG}editor/ueditor/createEditor.js'></script>
<!-- ueditor编辑器 -->

<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/pages.js'></script>
{include file='../tpl/footer.tpl'}