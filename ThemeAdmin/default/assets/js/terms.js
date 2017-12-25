$(function(){
	// 分类数据添加
	$('#category_new').click(function(){
		var data=categoryPackage();
		if(!data)
			return false;
		// 数据提交操作
		var setting={
            'url':'terms_new',
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
	// 分类数据修改
	$('#category_edit').click(function(){
		var data=categoryPackage();
		if(!data)
			return false;
		// 数据提交操作
		var setting={
            'url':'terms_edit_post',
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
	var categoryPackage=function(){
		var termname=$('#termname').val(),termslug=$('#termslug').val(),termparent=$('#termparent').val(),tag_id=$('#tag_id').val();
		if(termname==''){
			$('.error_report .text-danger').html('名称不能为空');
			$('.error_report').show();
			return false;
		}else if(termslug==''){
			$('.error_report .text-danger').html('别名不能为空');
			$('.error_report').show();
			return false;
		}else if(!CheckChinese(termslug)){
			$('.error_report .text-danger').html('别名中包含中文字符');
			$('.error_report').show();
			return false;
		}
		var data={'termname':termname,'termslug':termslug,'termparent':termparent,'tag_id':tag_id};
		return data;
	}
	// 分类删除
	$('.delete').click(function(){
		if(!confirm('您将永久删除这些项目。\r点击"取消"停止，点击"确定"删除。'))
			return;
		var _this=$(this);
		// 数据提交操作
		var setting={
            'url':'terms_delete',
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
        Ajax.submit({'term_id':$(this).data('uid')});
	});

	// 批量删除
	$('#delete_all').click(function(){
		var type=$('#handle_type').val();
		if(type=='none')
			return false;
		// 删除提醒
		if(!confirm('您将永久删除这些项目。\r请谨慎选择，删除后不可恢复'))
			return;
		// 获取选中项目的集合
		var delete_array=new Array();
		$('.checkbox').each(function(){
			var is_check=$(this).prop('checked');
			if(is_check){
				delete_array.push($(this).data('uid'));
			}
		});
		if(delete_array==''){
			$('.error_report .text-danger').html('您未选择要删除的分类目录数据');
			$('.error_report').show();
			return;
		}
		// 数据提交操作
		var setting={
            'url':'terms_delete_selected',
            'success':function(data){
				if(data['code']=='200'){
					window.location.reload();
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
					setTimeout(function(){
						window.location.reload();
					},2000);
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit({'term_id':delete_array});
	});


	/*---------------------------------------------------*/



	// 添加新的标签
	$('#tag_new').click(function(){
		var data=categoryPackage();
		if(!data)
			return false;
		// 数据提交操作
		var setting={
            'url':'tags_new',
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
	// 标签的删除
	$('.delete_tag,#delete_tags').click(function(){
		if(!confirm('您将永久删除这些项目。\r点击"取消"停止，点击"确定"删除。'))
			return;
		// 判断是否是批量删除
		var data='';
		if($(this).data('d')=='delete_all'){
			var type=$('#handle_type').val();
			if(type=='none')
				return false;
			// 获取选中项目的集合
			var delete_array=new Array();
			$('.checkbox').each(function(){
				var is_check=$(this).prop('checked');
				if(is_check){
					delete_array.push($(this).data('uid'));
				}
			});
			if(delete_array==''){
				$('.error_report .text-danger').html('您未选择要删除的分类目录数据');
				$('.error_report').show();
				return;
			}
			data={'term_id':delete_array};
		}else
			data={'term_id':$(this).data('uid')};
		var _this=$(this);
		// 数据提交操作
		var setting={
            'url':'tags_delete',
            'success':function(data){
				if(data['code']=='200'){
					if(_this.data('d')=='delete_all'){
						window.location.reload();
					}else{
						_this.parent().parent().parent().css('background-color','#ff5454');
						setTimeout(function(){
							_this.parent().parent().parent().hide('1000');
						},1000);
					}
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit(data);
	});
	//标签的修改
	$('#tag_edit').click(function(){
		var data=categoryPackage();
		if(!data)
			return false;
		// 数据提交操作
		var setting={
            'url':'tags_edit_post',
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
});
// 中文字符检测
function CheckChinese(val){     
	var reg =/[\u4E00-\u9FFF]/;
	if(reg.test(val)){     
		return false;  
	}else
		return true;
}