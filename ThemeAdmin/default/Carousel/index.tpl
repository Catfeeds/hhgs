{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='首页幻灯片'}
<style type="text/css">
	.img{
		width: 120px;
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
					<a href="{$smarty.const.ADMIN}Carousel/post.html" class='btn btn-primary'>添加新的幻灯片</a>
					<div class='help-block text-danger'>请务必保持同类型的幻灯片尺寸一致</div>
					<table  class='table table-striped table-hover'>
						<thead>
							<tr>
								<th>图片</th>
								<th>链接</th>
								<th>类型</th>								
								<th>时间</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $res as $item}
								<tr>
									<td>
										<img class='img' src="{$smarty.const.HOME}{$item['img']}">
									</td>
									<td>{$item['link']}</td>
									<td>
										{if $item['type'] eq 1}活动{else}商城{/if}
									</td>							
									<td>{$item['time']|date_format:'%Y-%m-%d %H:%M'}</td>
									<td>{$item['mark']}</td>
									<td>
										<a href='{$smarty.const.ADMIN}Carousel/post.html?uid={$item["id"]}' class='btn btn-info'>编辑</a>
										<button data-id="{$item['id']}" class='btn btn-danger del'>删除</button>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src="{$smarty.const.THEMEADMIN}assets/js/carousel.js"></script>
{include file='../tpl/footer.tpl'}