{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='业主信息导入'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 业主信息导入</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-plus-square"></i>业主信息导入</li>	
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
				<div class='panel-heading'>批量导入</div>
				<div class='panel-body'>
					<div style='padding: 10px 0;display: flex;'>
						<form id="upload" enctype="multipart/form-data"  method='post'>
							<input id='file' class='form-control' type="file" name="file" style='width:400px;' accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
						</form>
						<p style='padding-left: 10px;'><button id='do_exel' class='btn btn-primary'>开始上传</button></p>
						<p style='padding-left: 10px;'><button id='do_match' class='btn btn-primary'>匹配未认证业主</button></p>
					</div>
					<p class=' text-danger'>
					批量导入业主信息注意事项：<br>
					1、身份证与手机号码必须为文本格式不能使用科学计数的方式；<br>
					2、置业顾问需要填写对应的id编号不可直接使用顾问姓名<br>
					3、业主生日应按照：2017-01-01的格式填写并格式化为文本方式<br>
					4、文件格式必须为*.xls或*.xlsx且文件大小不能超过5M<br>
					5、sheet数量最多为一个<br>
					6、每次导入不要超过500条数据
					</p>
					<p><a href='{$smarty.const.THEMEADMIN}Member/业主信息模板.xlsx'>excel模板下载</a></p>
				</div>
			</div>
			<div class='panel panel-default'>
				<div class='panel-heading'>单个导入</div>
				<div class='panel-body'>
					<form id='form' action="" method="post" enctype="multipart/form-data" class='form-horizontal'>
						<input id="uid" type='hidden' value="{$info['uid']}">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>业主姓名</label>
							<div class='col-xs-12 col-md-11'>
								<input id='name' class='form-control' type="text" name="name" value='{$info["name"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>业主身份证号</label>
							<div class='col-xs-12 col-md-11'>
								<input id='idcard' class='form-control' type="text" name="idcard" value='{$info["idcard"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>手机号码</label>
							<div class='col-xs-12 col-md-11'>
								<input id='phone' class='form-control' type="text" name="phone" value='{$info["phone_num"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>地块</label>
							<div class='col-xs-12 col-md-11'>
								<input id='area' class='form-control' type="text" name="area" value='{$info["area"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>房源信息</label>
							<div class='col-xs-12 col-md-11'>
								<input id='houseinfo' class='form-control' type="text" name="houseinfo" value='{$info["houseinfo"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>置业顾问</label>
							<div class='col-xs-12 col-md-11'>
								<select id='consultant' class='form-control' name="consultant">
									<option value=0>请选择置业顾问</option>
									{foreach $consultant as $item}
									<option {if $info['consultant'] eq $item['uid']}selected{/if} value='{$item["uid"]}'>{$item['name']}</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'></label>
							<div class='col-xs-12 col-md-11'>
								<button type='submit' class='btn btn-danger'>提交信息</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Large modal -->
<div id='modal' class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content" style='max-height: 600px;overflow: scroll;'>
    	<div class='modal-header'>数据上传检测</div>
      	<div class='modal-body'>
      		<input id='filename' type="hidden" name="">
      		<style type="text/css">
      			#exceldata td{
      				height: auto;
      			}
      		</style>
      		<table class='table table-striped'>
      			<thead>
      				<tr>
      					<th>姓名</th>
      					<th>地块</th>
      					<th>房源</th>
      					<th>联系方式</th>
      					<th>身份证号</th>
      					<th>生日</th>
      					<th>置业顾问</th>
      				</tr>
      			</thead>
      			<tbody id='exceldata'>
      				
      			</tbody>
      		</table>
      		<p class='text-center text-danger'>导入前请严格确认数据无误</p>
      		<div class='text-center'>
      			<button id='real_exec' class='btn btn-info'>现在导入</button>
      		</div>
      </div>
    </div>
  </div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src='{$smarty.const.JS}card.js'></script>
<script type="text/javascript">
	$(function(){
		// 手机号码验证
		jQuery.validator.addMethod("isphone", function(value, element) {
		  	var length = value.length; 
		  	{literal}
		  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
		  	{/literal}
		  	return this.optional(element) || (length == 11 && mobile.test(value)); 
		}, "手机号码格式错误"); 
		// 身份证验证
		jQuery.validator.addMethod("isIdCardNo", function(value, element) { 
			return this.optional(element) || idCardNoUtil.checkIdCardNo(value); 
		}, "请正确输入您的身份证号码"); 
		$('#form').validate({
			// debug:true,
			rules:{
				name:'required',
				idcard:{
					required:true,
					isIdCardNo:true,
				},
				phone:{
					required:true,
					isphone:true,
				},
				area:'required',
				houseinfo:'required',
				consultant:{
					required:true,
					min:1
				},
			},
			messages:{
				name:'业主姓名不能为空',
				idcard:{
					isIdCardNo:'请输入正确的身份证号码',
					required:'身份证号码不能为空'
				},
				phone:{
					required:'手机号码不能为空',
					isphone:'手机号码格式错误'
				},
				area:'请填写区块',
				houseinfo:'请填写房源信息',
				consultant:{
					reuqired:'请选择置业顾问',
					min:'请选择置业顾问',
				}
			},
			submitHandler:function(){
				$.ajax({
					type:'POST',
					dataType:'json',
					data:{
						'uid':$('#uid').val(),
						'name':$('#name').val(),
						'idcard':$('#idcard').val(),
						'phone':$('#phone').val(),
						'area':$('#area').val(),
						'houseinfo':$('#houseinfo').val(),
						'consultant':$('#consultant').val(),
					},
					success:function(msg){
						if(msg['code']==200){
							alert('提交成功');
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
			},
		});
	});
</script>
<!-- 上传excel文件并将业主信息导入到数据库中去 -->
<script type="text/javascript" src='{$smarty.const.ORG}upload/jquery.form.js'></script>
<script type="text/javascript">
	$(function(){
		$('#do_exel').click(function(){
			$('#upload').ajaxSubmit({
				dataType: 'json',  
				url:'{$smarty.const.ADMIN}Member/batch_import',
		        beforeSend: function() {  
		        	$('#do_exel').html('上传中···');
		        	$('#do_exel').attr('disabled','disabled');
		        },  
		        uploadProgress: function(event, position, total, percentComplete) {
		        },  
		        success: function(msg) { 
		        	$('#do_exel').html('开始上传');
		        	$('#do_exel').removeAttr('disabled');
		        	if(msg['code']==200){
		        		let html='';
		        		let data=msg['data']['message'];
		        		for(var i=0;i<data.length;i++){
		        			html+='<tr><td>'+data[i]['name']+'</td><td>'+data[i]['area']+'</td><td>'+data[i]['houseinfo']+'</td><td>'+data[i]['phone_num']+'</td><td>'+data[i]['idcard']+'</td><td>'+data[i]['birth']+'</td><td>'+data[i]['consultant']+'</td></tr>';
		        		}
		        		$('#filename').val(msg['data']['path']);
		        		$('#exceldata').html(html);
		        		$('#modal').modal('show');
		        	}
		        }
		    });
		});
		$('#real_exec').click(function(){
			if(!confirm('确认数据无误后开始进行上传操作'))
				return;
			let filename=$('#filename').val();
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Member/do_db_import',
				dataType:'json',
				data:{
					'filename':filename,
				},
				beforeSend:function(){
					$('#real_exec').html('上传中···');
					$('#real_exec').attr('disabled','disabled');
				},
				success:function(msg){
					if(msg['code']==200){
						alert('上传成功');
						$('#real_exec').html('现在导入');
						$('#real_exec').removeAttr('disabled');
						$('#modal').modal('hide');
					}
				}
			});
		});

		$('#do_match').click(function(){
			if(!confirm('是否需要重新更新已注册且并未匹配为业主的用户的信息？'))
				return;
			$.ajax({
				type:'POST',
				url:'{$smarty.const.ADMIN}Member/do_match_yezhu',
				dataType:'json',
				data:{

				},
				success:function(msg){
					if(msg['code']==200){
						let data=msg['data'];
						let list='';
						for(let i=0;i<data.length;i++){
							list+=data[i]['uid']+'----'+data[i]['uname']+'\r\n';
						}
						alert('更新用户列表\r\n'+list);
					}else{
						alert(msg['data']);
					}
				}
			})
		});
	});
</script>
{include file='../tpl/footer.tpl'}