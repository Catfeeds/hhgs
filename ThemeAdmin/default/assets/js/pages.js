$(function(){
	// 添加新的页面
	$('#page_new').click(function(){
		var data=getData();
		// 数据提交操作
		var setting={
            'url':'page_new_post',
            'success':function(data){
				if(data['code']=='200'){
					window.location.href='page_edit.html?page='+data['data'];
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit(data);
	});
	// 页面内容修改
	$('#page_edit').click(function(){
		var data=getData();
		// 数据提交操作
		var setting={
            'url':'page_edit_post',
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
	// 数据封装
	var getData=function(){
		var title=$('#title').val(),content=ue.getContent();
		var page_id=$('#page_id').val();
		var data={'title':title,'content':content,'page_id':page_id};
		return data;
	}


	// 页面数据删除
	$('.delete').click(function(){
		if(!confirm('是否删除当前数据'))
			return;
		var _this=$(this);
		var page_id=$(this).data('uid');
		// 数据提交操作
		var setting={
            'url':'page_delete',
            'success':function(data){
				if(data['code']=='200'){
					_this.parent().parent().parent().css('background-color','#ff5454');
					setTimeout(function(){
						_this.parent().parent().parent().hide('1000');
					},1000);
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit({'page_id':page_id});
	});
});