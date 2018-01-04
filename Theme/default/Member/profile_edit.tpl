<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>个人信息</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Member/css/progress.css">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Member/css/profile_edit.css">
</head>
<body>
	<div class='container'>
		<div class='content'>
			<p class='headimg'>
				<img src="{$info['headimg']}">
			</p>
			<p class='tips'>多多完善信息，会奖励丰富活跃值噢！</p>
			<form id='form' class='form' action="" method="post" enctype="multipart/form-data">
				<p class='line'>
					<label>性别</label>
					<select id='sex' name='sex'>
						<option value=0>请选择性别</option>
						<option value=1 {if $info['sex'] eq 1}selected{/if}>男</option>
						<option value=2 {if $info['sex'] eq 2}selected{/if}>女</option>
					</select>
				</p>
				
				<p class='line'>
					<label>生日</label>
					<span class='wrp'><input id='birth' name='birth' type='date' value='{$info["birth"]|date_format:"%Y-%m-%d"}'></span>
				</p>
				<p class='line'>
					<label>年龄</label>
					<input id='age' name='age' type='number' disabled="">
				</p>
				<p class='line'>
					<label>手机号码</label>
					<input id='phone' name='phone' type='tel' value='{$info["phone_num"]}'>
				</p>
				<p class='line'>
					<label>行业</label>
					<select id='trade' name='trade'>
						<option value=0>请选择您的行业</option>
						{foreach $trade as $t}
							<option {if $info['trade'] eq $t['uid']}selected{/if} value='{$t["uid"]}'>{$t['name']}</option>
						{/foreach}
					</select>
				</p>
				<p class='line'>
					<label>职业</label>
					<input id='job' name='job' type='text' value='{$info["job"]}'>
				</p>
				<p class='line'>
					<label>婚姻状态</label>
					<select id='marry' name='marry'>
						<option value=0>请选择婚姻状态</option>
						<option value=1 {if $info['marital_status'] eq 1}selected{/if}>单身</option>
						<option value=2 {if $info['marital_status'] eq 2}selected{/if}>已婚</option>
						<option value=3 {if $info['marital_status'] eq 3}selected{/if}>恋爱中</option>
						<option value=4 {if $info['marital_status'] eq 4}selected{/if}>有小孩</option>
					</select>
				</p>
				<p class='line'>
					<label>常住地</label>
					<input id='addr' name='addr' type='text' value='{$info["address"]}'>
				</p>
				<p class='line'>
					<label>现住址</label>
					<input id='residence' name='residence' type='text' value='{$info["residence"]}'>
				</p>
				<p class='line'>
					<label>兴趣爱好</label>
					<input id='hobby' name='hobby' type='text' value='{$info["hobby"]}'>
				</p>
			
				<p class='line'>
					<label>置业动机</label>
					<select id='reason' name='reason'>
						<option value=0>请选择置业动机</option>
						<option {if $info['buy_reason'] eq 1}selected{/if} value=1>自住</option>
						<option {if $info['buy_reason'] eq 2}selected{/if} value=2>投资</option>
						<option {if $info['buy_reason'] eq 3}selected{/if} value=3>孩子上学</option>
						<option {if $info['buy_reason'] eq 4}selected{/if} value=4>其他</option>
					</select>
				</p>
				<p class='line'>
					<label>置业次数</label>
					<select id='times' name='times'>
						<option  {if $info['buy_times'] eq 0}selected{/if} value=0>请选择置业次数</option>
						<option  {if $info['buy_times'] eq 1}selected{/if} value=1>1次</option>
						<option  {if $info['buy_times'] eq 2}selected{/if} value=2>2次</option>
						<option  {if $info['buy_times'] eq 3}selected{/if} value=3>3次及以上</option>
					</select>
				</p>
				<p class='line'>
					<label>爱车数量</label>
					<select id='car' name='car'>
						<option value=0>请选择爱车数量</option>
						<option {if $info['car_amount'] eq 1}selected{/if} value=1>无</option>
						<option {if $info['car_amount'] eq 2}selected{/if} value=2>1辆</option>
						<option {if $info['car_amount'] eq 3}selected{/if} value=3>2辆</option>
						<option {if $info['car_amount'] eq 4}selected{/if} value=4>3辆及以上</option>
					</select>
				</p>
				<p class='line'>
					<label>爱车品牌</label>
					<input id='carbrand' name='carbrand' type='text' value='{$info["car_brand"]}'>
				</p>
				<p id='authen' class='line'>
					<label>业主认证</label>
					<input  type='text' readonly value='{if $info["is_authen"] eq 1}已认证{else}未认证{/if}'>
				</p>
				<div class='cover'>
					<div class='box'>
						<p class='close'>
							<img src="{$smarty.const.THEME}Member/img/close.png">
						</p>
						<p class='title'>{if $info['is_authen'] eq 1}恭喜您，业主身份已认证！{else}您花园里业主身份未认证！{/if}</p>
						<p class='text'>{if $info['is_authen'] eq 1}认证信息如下：{/if}</p>
						<div class='authen'>							
							{if $info['is_authen'] eq 1}
							<p class='text'>
								<label>姓名：</label>
								{$info["uname"]}
							</p>
							<p class='text'>
								<label>地块：</label>
								{$info["area"]}
							</p>
							<p class='text'>
								<label>房源：</label>
								{$info["houseinfo"]}
							</p>
							<p class='text'>
								<label>身份证号：</label>
								{$info["id_card"]}
							</p>
							<p class='text'>
								<label>置业顾问：</label>
								{$info['cons_name']}
							</p>	
							{else}
							<p class='text'>
								请联系花园里小花进行认证，谢谢！
							</p>	
							{/if}
						</div>
						<p class='tip'>如有疑问请联系小花：0371-60908262</p>
					</div>
				</div>
				<div class='text-center' style="padding: 8px;">个人信息完成度：</div>
				<div class='progress_w'>
					<div class="progress">
						<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: {$completion}%">							
						</div>
						<div class='pg s'>0</div>
						<div class='pg m'>{$score/2|string_format:'%d'}活跃值</div>
						<div class='pg e'>{$score}</div>
					</div>				
					<div style="line-height: 12px;font-size: 12px;">&nbsp;{$completion}%</div>
				</div>
				<p class='btns'>
					<button type=submit>
						<div class='sub_bg'>更新信息</div>
					</button>
				</p>
			</form>
		</div>
	</div>
	<script src="{$smarty.const.ORG}jquery/jquery-2.1.0.min.js"></script>
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
			var set_age=function(element){
				let birth=element.val();
				birthstamp=Date.parse(new Date(birth));
				let nowstamp=Date.parse(new Date());
				let age= Math.floor((nowstamp-birthstamp)/1000/(60*60*24*365));
				if(!isNaN(age))
					$('#age').val(age);
			}
			let birth=$('#birth').val();
			if(birth)
				set_age($('#birth'));
			$('#form').validate({
				// debug:true,
				rules:{
					phone:'isphone'

				},
				messages:{
					phone:'手机号码格式错误'
				},
				errorPlacement:function(error,element){
					$(element).closest('.line').after(error);
				},
				submitHandler:function(){
					$.ajax({
						type:'POST',
						dataType:'json',
						data:{
							'sex':$('#sex').val(),
							'birth':$('#birth').val(),
							'phone':$('#phone').val(),
							'marry':$('#marry').val(),
							'addr':$('#addr').val(),
							'trade':$('#trade').val(),
							'job':$('#job').val(),
							'residence':$('#residence').val(),
							'hobby':$('#hobby').val(),
							'reason':$('#reason').val(),
							'times':$('#times').val(),
							'car':$('#car').val(),
							'carbrand':$('#carbrand').val(),
						},
						success:function(msg){
							if(msg['code']==200){
								alert('信息更新成功');
								window.location.href=location.href;
							}else{
								alert(msg['data']);
							}
						}
					});
				}
			});
			// 年龄自动生成
			$('#birth').blur(function(){
				set_age($(this));
			});
			$('.close').click(function(){
				$('.cover').hide();
			});
			$('#authen').click(function(){
				$('.cover').show();
			});
			!function animate(){
				$(".charts").each(function(i,item){
					var a=parseInt($(item).attr("w"));
					$(item).animate({
						width: a+"%"
					},1000);
				});
			}();
		});
	</script>
</body>
</html>