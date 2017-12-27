{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='预约管理'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-bell"></i> 预约管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-bell"></i>预约管理</li>	
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
			<div style='padding: 5px 0; display: flex;'>
				<input type="search" id='search_text' class='form-control' placeholder="请输入手机号码或客户名" style='width: 300px;'><button id='search' class='btn btn-primary'>搜索</button>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>客户名</th>
								<th>联系方式</th>
								<th>预约类型</th>
								<th>置业顾问</th>
								<th>预约日期</th>
								<th>验证码</th>
								<th>是否到达</th>
								<th>下单时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list['list'] as $item}
								<tr>
									<td>{$item['name']}</td>
									<td>{$item['phone_num']}</td>
									<td>{if $item['type'] eq 1}在线预约{else}到场预约{/if}</td>
									<td>{$item['cons_name']}</td>
									<td>{$item['date']}&nbsp;{$item['time']}</td>
									<td>{$item['code']}</td>
									<td class='a'>{if $item['is_arrival'] eq 1}<p class='text-success'>已到</p>{else}<p class='text-danger'>未到</p>{/if}</td>
									<td>{$item['atime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>
										<button data-uid='{$item["uid"]}' class='btn btn-sm btn-info arrival' {if $item['is_arrival'] eq 1} disabled='disabled' >已到{else}>签到{/if}</button>
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
<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.arrival').click(function(){
			let uid=$(this).data('uid');
			if(!confirm('是否将此用户设置为已到达状态?'))
				return;
			that=$(this);
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Consultant/order_arrival',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('签到成功');
						that.html('已到');
						that.attr('disabled','disabled');
						that.parent().parent().find('.a').html("<p class='text-success'>已到</p>");
					}else{
						alert(msg['data']);
					}
				}
			});
		});

		$('#search').click(function(){
			let search_text=$('#search_text').val();
			if(search_text)
				window.location.href='{$smarty.const.ADMIN}Consultant/cons_order?words='+search_text;
		});
	});
</script>
{include file='../tpl/footer.tpl'}