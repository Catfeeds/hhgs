{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='活动数据'}
<style type="text/css">
	.growth{
		display: flex;
		display: none;
	}
	.gowth_t,.growth_btn{
		display: none;
	}
	.growth input{
		width: 35px;
		height: 25px;
		margin: 0 2px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 活动数据</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-envira"></i>活动数据</li>	
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
			<div style='padding:10px 0;'>
				<button id='update_ls' class='btn btn-primary'>一键增加参与活动人员积分</button>
				<button id='do_update_ls' class='btn btn-danger growth_btn' data-uid="{$smarty.get.act_uid}">开始执行</button>
			</div>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>用户id</th>
								<th>参加者</th>
								<th>手机号码</th>
								<th>携带人数</th>
								<th>报名时间</th>
								<th>是否到达</th>
								<th>签到时间</th>
								<th class='gowth_t'>成长值/活跃值</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{foreach $list as $item}
								<tr>
									<td>{$item['u_uid']}</td>
									<td>{$item['uname']}</td>
									<td>{$item['phone_num']}</td>
									<td><p class='text-primary'>{$item['carry_num']}&nbsp;人</p></td>
									<td>{$item['b_time']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td>
									{if $item['is_arrival'] eq 0}
									<p class='text-info'>未签到</p>
									{else}
									<p class='text-success'>已签到</p>
									{/if}
									</td>
									<td>{$item['arrival_time']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
									<td class='growth' data-uid="{$item['u_uid']}">
										<input class='level' type="text" value='{$ls["level"]}' min=0>
										<input class='score' type="text" value='{$ls["score"]}' min=0>
									</td>
									<td>
										{if $item['is_arrival'] eq 0}
										<button class='btn btn-sm btn-primary arrival' data-uid='{$item["uid"]}'>手动签到</button>
										{else}
											<button class='btn btn-default' disabled>无操作项</button>
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
		$('.arrival').click(function(){
			let uid=$(this).data('uid');
			if(!confirm('是否手动设置当前用户签到？'))
				return false;
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Activity/clock_in',
				dataType:'json',
				data:{
					'uid':uid
				},
				success:function(msg){
					if(msg['code']==200){
						alert('操作成功');
						window.location.reload();
					}
				}
			});
		});
		$('#update_ls').click(function(){
			$('.growth').show();
			$('.gowth_t').show();
			$('.growth_btn').show();
		});
		$('#do_update_ls').click(function(){
			let act_uid=$(this).data('uid');
			let ls={
				'data':[]
			};
			let exit=false;
			$('.growth').each(function(){
				let _this=$(this);
				let uid=_this.data('uid');
				let level=_this.find('.level').val();
				let score=_this.find('.score').val();
				if(isNaN(level)||isNaN(score)){
					$('.error_report').show();
					$('.error_report .text-danger').html('成长值或积分值存在非数字类型，请仔细检查后重新执行');
					exit=true;
					return false;
				}	
				ls.data.push(new Array(uid,level,score));		
			});
			if(exit)
				return;
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Activity/update_ls',
				dataType:'json',
				data:{
					'act_uid':act_uid,
					'data':ls,
				},
				success:function(msg){
					if(msg['code']==200){
						$('.error_report').hide();
						alert('更新成功');
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