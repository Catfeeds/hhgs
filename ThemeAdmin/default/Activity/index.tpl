{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='活动管理'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 活动管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-envira"></i>活动管理</li>	
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
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>活动名称</th>
								<th>活动状态</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list['list'] as $item}
								<tr>
									<td>{$item['name']}</td>
									<td>
										{if $item['status'] eq 2 }
										<p class="text-danger">已结束</p>
										{elseif $item['status'] eq 3}
										<p class="text-info">暂停中</p>
										{elseif $item['e'] lt $smarty.now}
										<p class="text-danger">已结束</p>
										{elseif $smarty.now lt $item['e']}
										<p class="text-success">进行中</p>
										
										{/if}
									</td>
									<td>{$item['date']}&nbsp;&nbsp;{$item['time']}</td>
									<td>{$item['edate']}&nbsp;&nbsp;{$item['etime']}</td>
									<td>{$item['atime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>
										{if $item['notice'] eq 0}
										<button data-uid="{$item['uid']}" class='notice btn btn-sm btn-success' title='短信通知未签到和迟到的用户'>通知</button>
										{/if}
										<a  class='btn btn-primary btn-sm' href="{$smarty.const.ADMIN}Activity/act_new.html?uid={$item['uid']}">编辑</a>
										<a  class='btn btn-warning btn-sm' href="{$smarty.const.ADMIN}Activity/attend.html?act_uid={$item['uid']}">数据</a>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<div class='text-center'>
						{$list['page']}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
{include file='../tpl/footer.tpl'}
<script type="text/javascript">
	$(function(){
		$('.notice').click(function(){
			if(!confirm('是否对迟到和未签到的用户进行短信通知？'))
				return;
			let uid=$(this).data('uid');
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Activity/notice_sms',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert(msg['data']);
						location.reload();
					}
					else
						alert(mesg['data']);
				}
			});
		});
	});
</script>