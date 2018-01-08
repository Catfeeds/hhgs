{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='首页幻灯片'}
<style type="text/css">
	img{
		max-width: 100%;
	}
	.head_img{
		position: absolute;
		top: 15px;
		right: 18px;
		width: 240px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 首页幻灯片</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-envira"></i>首页幻灯片</li>	
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
						<input id="uid" type='hidden' value="{$res['id']}">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>图片</label>
							<div class='col-xs-12 col-md-8'>
								<button class='btn btn-primary upload'>上传幻灯片</button>
								<div class='help-block text-danger'>请务必保持同类型的幻灯片尺寸一致</div>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>链接</label>
							<div class='col-xs-12 col-md-8'>
								<input id='link' class='form-control' type='text' value="{$res['link']}" >
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>类型</label>
							<div class='col-xs-12 col-md-8'>
								<select id='type' class='form-control'>
									<option value=1 {if $res['type'] eq 1}selected{/if}>活动</option>
									<option value=2 {if $res['type'] eq 2}selected{/if}>商城</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>备注</label>
							<div class='col-xs-12 col-md-8'>
								<textarea id='mark' class='form-control' rows="5" style='resize:none;'>{$res['mark']}</textarea>
								<br>
								<button id='submit' class='btn btn-danger'>提交</button>
							</div>							
						</div>
					</div>
					<div class='head_img'>
						<img src="{$smarty.const.HOME}{$res['img']}" data-url="{$res['img']}">
						<div class='help-block'><!-- *图片建议尺寸为1438*701 --></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
{include file='../tpl/upload.tpl'}
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src="{$smarty.const.THEMEADMIN}assets/js/carousel.js"></script>
{include file='../tpl/footer.tpl'}