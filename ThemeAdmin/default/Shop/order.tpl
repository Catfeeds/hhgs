{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='订单管理'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-paw"></i> 订单管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-paw"></i>订单管理</li>	
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
								<th>订单编号</th>
								<th>用户名称</th>
								<th>联系方式</th>
								<th>购买商品</th>
								<th>订单金额</th>
								<th>订单数量</th>
								<th>下单时间</th>
								<th>收货时间</th>
								<th>备注</th>	
								<th>订单状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $order['list'] as $item}
								<tr>
									<td>{$item['order_id']}</td>
									<td>{$item['uname']}</td>
									<td>{$item['phone_num']}</td>
									<td>{$item['goods_name']}</td>
									<td>{$item['order_money']}</td>
									<td>{$item['order_num']}</td>
									<td>{$item['pay_time']|date_format:'%Y/%m/%d %H:%M'}</td>
									<td>{$item['recieve_time']|date_format:'%Y/%m/%d %H:%M'}</td>
									<td>{$item['order_remarks']}</td>
									<td>{if $item['order_status'] eq 0}未完成{else}已完成{/if}</td>
									<td>
										<button class='btn btn-sm btn-info deal' data-uid='{$item["uid"]}'{if $item['order_status'] eq 1}disabled >已完成{else}>领取{/if}</button>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<div class='text-center'>
						{$order['page']}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('.deal').click(function(){
			that=$(this);
			if(!confirm('是否要核销此订单？'))
				return;
			let uid=$(this).data('uid');
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Shop/order_deal',
				dataType:'json',
				data:{
					'uid':uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('处理成功');
						that.attr('disabled','disabled');
						that.html('已完成');
					}
				}
			});
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
{include file='../tpl/footer.tpl'}