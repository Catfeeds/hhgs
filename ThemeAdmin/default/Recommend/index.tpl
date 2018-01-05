{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='推荐管理'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-gift"></i> 推荐管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-gift"></i>推荐管理</li>	
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
							<th>申请人id</th>
							<th>申请人姓名</th>
							<th>申请人联系方式</th>
							<th>推荐人id</th>
							<th>推荐人姓名</th>
							<th>推荐人联系方式</th>
							<th>操作</th>
						</thead>
						<tbody>
							{foreach $list['list'] as $v}
								<tr>
									<td>{$v['u_uid']}</td>
									<td>{$v['mname']}</td>
									<td>{$v['mtel']}</td>
									<td>{$v['r_u_uid']}</td>
									<td>{$v['tname']}</td>
									<td>{$v['ttel']}</td>
									<td>
										{if $v['status'] eq 1}
											<button class='btn btn-sm' disabled>已处理</button>
										{else}
											<button data-uid='{$v["uid"]}' class='deal btn btn-sm btn-info'>处理</button>
										{/if}
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
			if(!confirm('是否对此条目进行处理？'))
				return;
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Recommend/deal',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('处理成功');
						window.location.reload();
					}else{
						$('.error_report').show();
						$('.error_report .text-danger').html(msg['data']);
						{literal}
						$('html,body').animate({scrollTop: 0}, 500);
						{/literal}
					}
				}
			});
		});
	});
</script>
{include file='../tpl/footer.tpl'}