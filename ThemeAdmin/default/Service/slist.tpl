{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='服务管理'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-puzzle-piece"></i> 服务管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-puzzle-piece"></i>服务管理</li>	
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
			<div style='padding:5px 0;'>
				<a class='btn btn-primary' href="{$smarty.const.ADMIN}/Service/service_add.html">添加服务</a>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>服务名称</th>
								<th>名额</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>用户等级</th>
								<th>区域</th>
								<th>服务状态</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list as $item}
								<tr>
									<td>{$item['name']}</td>
									<td>{$item['number']}</td>
									<td>{$item['stime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>{$item['etime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td><i>Lv&nbsp;</i>{$item['level']}</td>
									<td>{$item['area']}</td>
									<td>{if $item['status'] eq 1}<p class='text-success'>进行</p>{else}<p class='text-danger'>暂停</p>{/if}</td>
									<td>{$item['atime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>
										<a href='{$smarty.const.ADMIN}/Service/service_add.html?suid={$item["uid"]}' class='btn btn-info btn-sm'>详细信息</button>
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
{include file='../tpl/footer.tpl'}