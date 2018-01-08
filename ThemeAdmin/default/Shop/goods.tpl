{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='商品管理'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-puzzle-piece"></i> 商品管理</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-puzzle-piece"></i>商品管理</li>	
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
			<div style='padding: 5px 0;'>
				<a class='btn btn-info' href="{$smarty.const.ADMIN}Shop/goods_add.html">添加商品</a>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>商品名称</th>
								<th>库存</th>
								<th>余量</th>
								<th>商品状态</th>
								<th>价格</th>
								<th>用户兑换等级</th>
								<th>添加时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list['list'] as $item}
								<tr>
									<td>{if $item['goods_stime'] neq ''}<i style='color:#ff5454;'>抢&nbsp;</i>{/if}{$item['goods_name']}</td>
									<td>{$item['goods_num']}</td>
									<td>{$item['goods_last']}</td>
									<td>{if $item['goods_status'] eq 1}上架{else}下架{/if}</td>
									<td>{$item['goods_price']}{if $item['pay_type'] eq 1}活跃值{else}￥{/if}</td>
									<td><i>Lv</i>&nbsp;<b>{$item['goods_level']}</b></td>
									<td>{$item['atime']|date_format:'%Y-%m-%d'}</td>
									<td>
										<a href='{$smarty.const.ADMIN}Shop/goods_add.html?goods_uid={$item["uid"]}' class='btn btn-info'>查看详情</a>
										<button class='btn btn-danger delete' data-uid='{$item["uid"]}'>删除商品</button>
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
		$('.delete').click(function(){
			let that=$(this);
			if(!confirm('是否删除当前商品？'))
				return;
			let goods_uid=$(this).data('uid');
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Shop/goods_delete',
				dataType:'json',
				data:{
					'goods_uid':goods_uid,
				},
				success:function(msg){
					if(msg['code']==200){
						alert('删除成功');
						that.parent().parent().remove();
					}else{
						$('.error_report').show();
						$('.error_report .text-danger').html(msg['data']);
					}
				}
			});
		});
	});
</script>
{include file='../tpl/footer.tpl'}