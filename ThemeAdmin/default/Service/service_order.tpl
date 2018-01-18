{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='服务预约管理'}
<style type="text/css">
	.thumbnail{
		width: 200px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 服务预约管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-plus-square"></i>服务预约管理</li>	
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
								<th>服务名称</th>
								<th>用户id</th>
								<th>用户名称</th>
								<th>用户手机</th>
								<th>预定时间</th>
								<th>地址</th>
								<th>状态</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list as $item}
								<tr>
									<td>{$item['sname']}</td>
									<td>{$item['u_uid']}</td>
									<td>{$item['uname']}</td>
									<td>{$item['phone_num']}</td>
									<td>{$item['order_date']}&nbsp;{if $item['order_ampm'] eq 1}上午{else}下午{/if}</td>
									<td>{$item['address']}</td>
									<td class='status'>{if $item['status'] eq 1}已处理{else}未处理{/if}</td>
									<td>{$item['atime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>
										<button data-uid='{$item["uid"]}' class='btn btn-info btn-sm deal' {if $item['status'] eq 1} disabled>已处理{else}>处理{/if}</button>
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
<script type="text/javascript">
	$(function(){
		$('.deal').click(function(){
			let uid=$(this).data('uid');
			if(!confirm('是否处理当前订单?'))
				return;
			that=$(this);
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Service/order_deal',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('数据提交成功');
						that.parent().parent().find('.status').html('已处理');
						that.html('已处理');
						that.attr('disabled','disabled');
					}else
						alert(msg['data']);
				}
			});
		});
	});
</script>
{include file='../tpl/footer.tpl'}