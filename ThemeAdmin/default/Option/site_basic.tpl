{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='基本参数设置'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-asterisk"></i> 基本参数设置</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-asterisk"></i>基本参数设置</li>	
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
					<div class='form-horizontal'>
						<input id='s_id' type='hidden' value="{$id}"> 
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>网站名称</label>
							<div class='col-md-6 col-xs-12'>
								<input id='name' type='text' class='form-control' value="{$val['site_name']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>关键词(keywords)</label>
							<div class='col-md-6 col-xs-12'>
								<input id='keywords' type='text' class='form-control' value="{$val['keywords']}">
							</div>
							<div class='help-block'>多个关键词请用英文逗号‘,’隔开</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>描述(desciption)</label>
							<div class='col-md-6 col-xs-12'>
								<textarea id='describe' class='form-control' rows="5" style='resize:none;'>{$val['describe']}</textarea>
							</div>	
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>备案号</label>
							<div class='col-md-6 col-xs-12'>
								<input id='record' type='text' class='form-control' value="{$val['record']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>底部版权信息</label>
							<div class='col-md-6 col-xs-12'>
								<input id='copyright' type='text' class='form-control' value="{$val['copyright']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>统计代码</label>
							<div class='col-md-6 col-xs-12'>
								<textarea id='code' class='form-control' rows='5' style='resize:none;'>{$val['code']}</textarea>
							</div>
							<div class='help-block'>目前仅支持第三方的统计代码</div>
						</div>
						<button id='site_submit' class='btn btn-danger'>更新</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/option.js'></script>
{include file='../tpl/footer.tpl'}