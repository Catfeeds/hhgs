$(function(){
	$('.del').click(function(){
		var _this=$(this);
		var uid=$(this).data('id');
		if(!confirm('是否删除当前选项?'))
			return false;

		var setting={
            'url':'delete',
            'success':function(data){
            	if(data['code']==200){
            		_this.parent().parent().remove();
            		alert('删除成功');
            	}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit({'id':uid});
	});


	// 图片上传
	// 点击打开modal模态框上传图片
	$('.upload').click(function(){
		// 清空之前上传时数据缓存
		$('.img_preview img').attr('src','');
		$('.error_file').html('');
		$('#imgModal').modal('show');
	});
	
	// 获取上传得到的图片的真实路径
	$('#get_img').click(function(){
		$('#imgModal').modal('hide');
		// 并将路径设置到返回窗口
		var url=$('.img_preview img').attr('src');
		// 返回真实路径
		var true_url=$('.img_preview img').attr('data-url');
		$('.head_img img').attr('src',url);
		$('.head_img img').attr('data-url',true_url);
	});
	// 图片上传操作
	$('.imgUpload').change(function(){
		file('#upload','imgUpload','carousel');
	});

	$('#submit').click(function(){
		var uid=$('#uid').val();
		var img=$('.head_img img').data('url');
		var link=$('#link').val();
		var type=$('#type').val();
		var mark=$('#mark').val();
		if(img==''){
			$('.error_report').show();
			$('.error_report .text-danger').html('图片不能为空');
			return;
		}

		// 数据提交
		var setting={
            'url':'post_data',
            'success':function(data){
            	if(data['code']==200){
            		alert(data['data']);
            		window.location.reload();
            	}else{
            		alert(data['data']);
            	}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit({'uid':uid,'img':img,'link':link,'type':type,'mark':mark});
	});
});