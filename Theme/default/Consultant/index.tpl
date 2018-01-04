<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>置业顾问</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Consultant/css/index.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			{foreach $list as $item}
				<div class='item' data-uid="{$item['uid']}">
					<div class='img'>
						<img src="{$smarty.const.UPLOAD}headimg/{$item['headimg']}">
					</div>
					<div class='info'>
						<p class='name'>{$item['name']}</p>
						<p class='stars'>
							<span class='starimg' style='width: {12*$item["degree"]}px'>
							</span>	
							<span>{$item['degree']|string_format:'%.1f'}</span>
							<span class='pj {if $item["comment"] eq 1}pj_can{else}pj_cant{/if}'>评价</span>
						</p>
						<p class='infop'>年龄：<span>{(($smarty.now-$item['birth'])/3600/24/365)|string_format:'%d'}</span>&nbsp;&nbsp;性别：<span>{if $item['sex'] eq 1}男{else}女{/if}</span></p>
						<p class='infop'>
							成交：<span>{$item['deal']}</span>套&nbsp;&nbsp;关注人数：<span>{$item['fans']}</span>
						</p>
					</div>
					<div class='btn yuyue'>预约</div>
				</div>
			{/foreach}
		</div>
	</div>
	<div class='cover'>
		<div class='box'>
			<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
				<input id='cons_uid' type="hidden" name="cons_uid">
				<p class='line'>
					<label>姓名</label>
					<input id='name' name='name' type='text' value='{$info["uname"]}'>
				</p>
				<p class='line'>
					<label>手机号码</label>
					<input id='phone' name='phone' type='tel' value='{$info["phone_num"]}'>
				</p>
				<p class='line'>
					<label>预约方式</label>
					<select id='type' name='type'>
						<option value=1 {if $info['type'] eq 1}selected{/if}>在线预约</option>
						<option value=2 {if $info['type'] eq 2}selected{/if}>到场预约</option>
					</select>
				</p>
				<p class='line'>
					<label>预约日期</label>
					<span class='wrp'><input id='date' name='date' type='date' value='{$info["date"]|date_format:"%Y-%m-%d"}'></span>
				</p>
				<p class='line'>
					<label>预约时间</label>
					<span class='wrp'><input id='time' name='time' type='time' value='{$info["time"]|date_format:"%Y-%m-%d"}'></span>
				</p>
				<p id='error'></p>
				<p style='padding: 15px 0;'>
					<button type='submit' class='btn btn-submit'>确定预约</button>
				</p>
			</form>		
		</div>
		<p class='close'>
			<img src="{$smarty.const.THEME}Consultant/img/close.png">
		</p>
	</div>
	<div class='cover_comment'>
		<div class='box'>
			<input id='comm_uid' type="hidden">
			<div id="star">
				<span>请对置业顾问进行评价</span>
				<ul>
					<li><a href="javascript:;">1</a></li>
					<li><a href="javascript:;">2</a></li>
					<li><a href="javascript:;">3</a></li>
					<li><a href="javascript:;">4</a></li>
					<li><a href="javascript:;">5</a></li>
				</ul>
				<span></span>
				<p></p>
			</div>
			<div class='text' style='padding-top: 10px;'>
				<textarea id='comment' rows="5" style='width: 100%;resize:none;border:1px solid rgba(130,130,130,0.2);padding: 3px;' placeholder="请留下您对本顾问的建议/意见，以便我们为您提供更好的服务！！！"></textarea>
			</div>
			<div style='padding-top: 10px;'>
				<button id='com_sub' class='btn btn-submit'>提交您的评论</button>
			</div>
		</div>
		<p class='close'>
			<img src="{$smarty.const.THEME}Consultant/img/close.png">
		</p>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src='{$smarty.const.THEME}Consultant/js/stars.js'></script>
	<script type="text/javascript">
		$(function(){
			$('.yuyue').click(function(){
				let uid=$(this).parent().data('uid');
				$('#cons_uid').val(uid);
				$('.cover').slideDown();
			});
			// 手机号码验证
			jQuery.validator.addMethod("isphone", function(value, element) {
			  	var length = value.length; 
			  	{literal}
			  	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
			  	{/literal}
			  	return this.optional(element) || (length == 11 && mobile.test(value)); 
			}, "手机号码格式错误"); 
			$('#form').validate({
				// debug:true,
				rules:{
					name:'required',
					phone:{
						required:true,
						isphone:true,
					},
					date:'required',
					time:'required',
				},
				messages:{
					name:'姓名不能为空',
					phone:'手机号码格式错误',
					date:'请选择预约日期',
					time:'请选择预约时间'
				},
				errorPlacement:function(error,element){
					$('#error').html(error);
				},
				submitHandler:function(){
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'cons_uid':$('#cons_uid').val(),
							'name':$('#name').val(),
							'date':$('#date').val(),
							'time':$('#time').val(),
							'phone_num':$('#phone').val(),
							'type':$('#type').val(),
						},
						success:function(msg){
							if(msg['code']==200){
								$('.message_cover .content').html('<p style="letter-spacing:8px;font-size:25px;font-weight:500;">'+msg['data']+'</p><p style="font-size:18px;padding:15px 0 25px;font-weight:500;">预约成功</p>');
								$('.message_cover').show();			
							}else{
								$('.message_cover .content').html('<p>'+msg['data']+'</p><p style="font-size:18px;font-weight:500;padding:15px;">预约失败</p>');
								$('.message_cover').show();
							}
							$('.cover').hide();
						}
					});
				}
			});
			$('.close img').click(function(){
				$('#cons_uid').val('');
				$(this).parent().parent().hide();
			});
			// 点开评论框
			$('.pj_can').click(function(){
				let comm_uid=$(this).parent().parent().parent().data('uid');
				$('#comm_uid').val(comm_uid);
				$('.cover_comment').slideDown();
			});
			$('.pj_cant').click(function(){
				alert('暂时无法评论此顾问');
			});
			// 提交评论
			$('#com_sub').click(function(){
				let cons_uid=$('#comm_uid').val();
				let score=$('#score').data('value');
				let comment=$('#comment').val();
				if(typeof(score)=='undefined'){
					alert('请为此置业顾问设定星级');
					return;
				}
				$.ajax({
					type:'POST',
					dataType:'json',
					url:'{$smarty.const.HOME}Consultant/comment_submit',
					data:{
						'cons_uid':cons_uid,
						'score':score,
						'comment':comment
					},
					success:function(msg){
						if(msg['code']==200){
							$('.message_cover .content').html('<p style="font-size:18px;font-weight:500;padding:15px;">评论成功</p>');
							$('.message_cover').show();
						}else{
							$('.message_cover .content').html('<p style="font-size:18px;font-weight:500;padding:15px;">'+msg['data']+'</p>');
							$('.message_cover').show();
						}
						$('.cover_comment').hide();
					}
				});
			});
			$('#type').change(function(){
				let vl=$(this).val();
				if(vl==1){
					$('#date').parent().parent().show();
					$('#time').parent().parent().show();
				}else{
					$('#date').parent().parent().hide();
					$('#time').parent().parent().hide();
				}
			});
		});
	</script>
	<!-- 提示信息框 -->
	{include file='../tpl/message.tpl'}
</body>