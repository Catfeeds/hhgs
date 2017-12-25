{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='用户个人信息'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-envira"></i> 用户个人信息</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-envira"></i>用户个人信息</li>	
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
				<div class='panel-heading'>个人信息</div>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<tr>
							<td>姓名:</td>
							<td>{$info['uname']}</td>
							<td>性别:</td>
							<td>{if $info['sex'] eq 1}男{else}女{/if}</td>
						</tr>
						<tr>
							<td>身份证号:</td>
							<td>{$info['id_card']}</td>
							<td>出生日期:</td>
							<td>{$info['birth']|date_format:'%Y-%m-%d'}</td>
						</tr>
						<tr>
							<td>电话号码:</td>
							<td>{$info['phone_num']}</td>
							<td>婚姻状态:</td>
							<td>
							{if $info['marital_status'] eq 1}单身
							{else if $info['marital_status'] eq 2}已婚
							{else if $info['marital_status'] eq 3}恋爱中
							{else if $info['marital_status'] eq 4}有小孩
							{/if}
							</td>
						</tr>
						<tr>
							<td>常住地址:</td>
							<td>{$info['address']}</td>
							<td>现住地址:</td>
							<td>{$info['residence']}</td>
						</tr>
						<tr>
							<td>所属行业:</td>
							<td>{$info['tradename']}</td>
							<td>职业:</td>
							<td>{$info['job']}</td>
						</tr>
						<tr>
							<td >兴趣爱好:</td>
							<td colspan="3">{$info['hobby']}</td>
						</tr>
						<tr>
							<td>房源信息:</td>
							<td colspan="3">{$info['houseinfo']}</td>
						</tr>
						<tr>
							<td>置业动机:</td>
							<td>
								{if $info['buy_reason'] eq 1}自住
								{elseif $info['buy_reason'] eq 2}投资
								{elseif $info['buy_reason'] eq 3}孩子上学
								{elseif $info['buy_reason'] eq 4}其他
								{/if}
							</td>
							<td>置业次数:</td>
							<td>{$info['buy_times']}</td>
						</tr>
						<tr>
							<td>车辆数量:</td>
							<td>{$info['car_amount']}</td>
							<td>汽车品牌</td>
							<td>{$info['car_brand']}</td>
						</tr>
						<tr>
							<td>置业顾问:</td>
							<td>{$info['pro_consultant']}</td>
							<td>注册时间:</td>
							<td>{$info['rg_time']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
						</tr>
					</table>
				</div>
			</div>
			<div class='panel panel-default'>
				<div class='panel-heading'>家庭成员</div>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						{foreach $flist as $item}
							<tr>
								<td>关系：</td>
								<td colspan="3">{$item['relation']}</td>
							</tr>
							<tr>
								<td>姓名：</td>
								<td>{$item['uname']}</td>
								<td>生日：</td>
								<td>{$item['birth']|date_format:'%Y-%m-%d'}</td>
							</tr>
							<tr>
								<td>行业：</td>
								<td>{$item['tradename']}</td>
								<td>爱好：</td>
								<td>{$item['hobby']}</td>
							</tr>
						{/foreach}
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
{include file='../tpl/footer.tpl'}