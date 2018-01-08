{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='成长值与活跃值设置'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-superpowers"></i> 成长值与活跃值设置</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-superpowers"></i>成长值与活跃值设置</li>	
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
					<div class='form-horizontal'>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>*</label>
							<div class='col-xs-12 col-md-4'>
								成长值
							</div>
							<div class='col-xs-12 col-md-4'>
								活跃值
							</div>
						</div>						
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>个人信息完善</label>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control lnumber' type="number"  placeholder='成长值' value='{$award[0]["lnumber"]}' title='成长值'>
							</div>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control snumber' type="number"  placeholder='活跃值' value='{$award[0]["snumber"]}' title='活跃值'>
							</div>
							<div class='col-xs-12 col-md-3'>
								<button class='btn btn-primary save' data-uid='{$award[0]["uid"]}'>保存</button>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>家庭成员添加</label>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control lnumber' type="number"  placeholder='成长值' value='{$award[1]["lnumber"]}' title='成长值'>
							</div>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control snumber' type="number"  placeholder='活跃值' value='{$award[1]["snumber"]}' title='活跃值'>
							</div>
							<div class='col-xs-12 col-md-3'>
								<button class='btn btn-primary save' data-uid='{$award[1]["uid"]}'>保存</button>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>每日签到</label>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control lnumber' type="number"  placeholder='成长值' value='{$award[2]["lnumber"]}' title='成长值'>
							</div>
							<div class='col-xs-12 col-md-4'>
								<input class='form-control snumber' type="number"  placeholder='活跃值' value='{$award[2]["snumber"]}' title='活跃值'>
							</div>
							<div class='col-xs-12 col-md-3'>
								<button class='btn btn-primary save' data-uid='{$award[2]["uid"]}'>保存</button>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('.save').click(function(){
			let uid=$(this).data('uid');
			let lnumber=$(this).parent().parent().find('.lnumber').val();
			let snumber=$(this).parent().parent().find('.snumber').val();
			$.ajax({
				type:'POST',
				dataType:'json',
				data:{
					'uid':uid,
					'lnumber':lnumber,
					'snumber':snumber,
				},
				success:function(msg){
					if(msg['code']==200){
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
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
{include file='../tpl/footer.tpl'}