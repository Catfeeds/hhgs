$(function(){
	// 设置项基础信息更新
	$('#site_submit').click(function(){
		var name=$('#name').val(),keywords=$('#keywords').val(),describe=$('#describe').val(),record=$('#record').val(),copyright=$('#copyright').val(),code=$('#code').val();	
		var id=$('#s_id').val();
		var data={'name':name,'keywords':keywords,'describe':describe,'record':record,'copyright':copyright,'code':code,'o_id':id};
		// 数据提交操作
		var setting={
            'url':'basic_edit',
            'success':function(data){
				if(data['code']=='200'){
					window.location.reload();
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit(data);
	});

	// 微信参数更新
	$('#we_submit').click(function(){
		var name1=$('#w_name1').val(),name2=$('#w_name2').val(),w_id=$('#w_id').val(),w_type=$('#w_type').val(),w_appid=$('#w_appid').val(),w_secret=$('#w_secret').val(),w_api=$('#w_api').val(),w_token=$('#w_token').val(),w_aeskey=$('#w_aeskey').val();
		var id=$('#id').val()	
		var data={'name1':name1,'name2':name2,'w_id':w_id,'w_type':w_type,'w_appid':w_appid,'w_secret':w_secret,'w_api':w_api,'w_token':w_token,'w_aeskey':w_aeskey,'id':id};
		// 数据提交操作
		var setting={
            'url':'wechat_edit',
            'success':function(data){
				if(data['code']=='200'){
					window.location.reload();
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit(data);
	});


	// 文章日期显示格式的更新
	$('#arc_save').click(function(){		
		// 人性化时间模式选中则不去判断其余两项
		var date_str='';
		if($('input[name="hommization"]').prop('checked')){
			date_str=$('input[name="hommization"]').val();
		}else{
			var date  = $('input[name="date_radio"]:checked').val();
			var time  = $('input[name="time_radio"]:checked').val();
			if(typeof(date)=='undefined'||typeof(time)=='undefined'){
				$('.error_report .text-danger').html('日期格式和时间格式不能为空');
				$('.error_report').show();	
				return;			
			}else{
				date_str=date+'|'+time;
			}
		}
		// 数据提交
		var setting={
            'url':'arc_time',
            'success':function(data){
				if(data['code']=='200'){
					window.location.reload();
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit({'date_str':date_str});
	});

	// 文章时间设置选择效果图
	$('input[name="hommization"]').click(function(){
		if($(this).prop('checked')){
			$('input[name="date_radio"]').prop('checked',false);
			$('input[name="time_radio"]').prop('checked',false);
		}
	});
	$('input[name="date_radio"],input[name="time_radio"]').click(function(){
		$('input[name="hommization"]').prop('checked',false);
	});
});