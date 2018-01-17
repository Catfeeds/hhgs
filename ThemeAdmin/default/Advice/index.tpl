{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='客户意见与建议'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-bell-o"></i> 客户意见与建议</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-bell-o"></i>客户意见与建议</li>	
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
								<th>用户名称</th>
								<th>意见建议</th>
								<th>评论时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list['list'] as $item}
								<tr>
									<td>{$item['uname']}</td>
									<td>{$item['content']}</td>
									<td>{$item['atime']}</td>
									<td>
										<button data-uid='{$item["uid"]}' class='del btn btn-info btn-sm'>删除</button>
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
<script type="text/javascript">
	$(function(){
		$('.del').click(function(){
			if(!confirm('是否删除该条建议？'))
				return;
			let uid=$(this).data('uid');
			let _this=$(this);
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Advice/delete',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert(msg['data']);
						_this.parent().parent().remove();
					}else
						alert(msg['data']);
				}

			});
		});
	});
</script>
{include file='../tpl/footer.tpl'}