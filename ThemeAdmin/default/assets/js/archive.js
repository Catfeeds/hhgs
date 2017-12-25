$(function(){
	/*数组功能扩展*/ 
	// 查找
	Array.prototype.getIndex=function(val){
		for(var i=0;i<this.length;i++){
			if(this[i]==val)
				return i;
		}
		return -1;
	}
	// 移除
	Array.prototype.remove=function(val){
		var index=this.getIndex(val);
		if(index!=-1)
			this.splice(index,1);	
	}
	/*时间*/
	// 展开
	$('#date_edit').click(function(){
		$(this).hide();
		$('.datetime').toggle('1000');
	});
	// 收起
	$('.cancel').click(function(){
		$('#date_edit').show();
		$('.datetime').toggle('1000');
		$('#real_time').val('');
		$('#date_str').html('立即发布');
	});

	// 设日期与时间的自动填充
	var i=1;
	while(i<=12){
		$('#month').append('<option value="'+checkTime(i)+'">'+i+'月</option>');
		i++;
	}
	var j=1;
	while(j<=31){
		$('#day').append('<option  value="'+checkTime(j)+'">'+j+'</option>');
		j++;
	}
	// 设置今天的时间
	var reset=$('.datetime').data('reset');
	if(reset=='1'){
		var today=new Date();
		$('#year').val(today.getFullYear());
		$('#month').val(today.getMonth()+1);
		$('#day').val(today.getDate());
		$('#hour').val(checkTime(today.getHours()));
		$('#min').val(checkTime(today.getMinutes()));
		$('#sec').val(checkTime(today.getSeconds()));
	}else{
		var str_time=$('#real_time').val();
		var time=new Date(parseInt(str_time)*1000);
		$('#year').val(time.getFullYear());
		$('#month').val(checkTime(time.getMonth()+1));
		$('#day').val(checkTime(time.getDate()));
		$('#hour').val(checkTime(time.getHours()));
		$('#min').val(checkTime(time.getMinutes()));
		$('#sec').val(checkTime(time.getSeconds()));
	}

	// 更换发布时间后重新设定一下发布时间的值
	$('#set_time').click(function(){
		var y=$('#year').val(),m=$('#month').val(),d=$('#day').val(),h=$('#day').val()!=''?$('#day').val():'00',min=$('#min').val()!=''?$('#min').val():'00',s=$('#sec').val()!=''?$('#sec').val():'00';
		// 判断是否为空
		if(y==''||d==''||isNaN(y)){
			$('.datetime input').addClass('err_b');
			return;
		}
		// 样式处理
		$('.datetime input').removeClass('err_b');
		$('.datetime').hide();
		$('#date_edit').show();
		var date_str=y+'-'+m+'-'+d+' '+h+':'+min+':'+s;
		var cn_date=y+'年'+m+'月'+d+'日 '+h+':'+min+':'+s;
		$('#real_time').val(new Date(date_str).getTime()/1000);
		$('#date_str').html('发布于:'+cn_date);
	});

	/*标签*/
	// 选择tag标签
	// 标签容器
	var tags_list=new Array();
	$('.selected_tag').click(function(){
		var _this=$(this);
		var uid=_this.data('uid'),value=_this.data('value');
		// 不存在则包含
		if(tags_list.indexOf(uid)==-1){
			$('#tags').append('<span class="label label-default reomve_tag" title="点击删除" data-uid="'+uid+'"><i class="fa fa-times-circle"></i>'+value+'</span>');
			tags_list.push(uid);
		}
	});

	// 移除标签
	$('#tags').on('click','.reomve_tag',function(){
		$(this).remove();
		tags_list.remove($(this).data('uid'));
	});
	// 实时动态添加标签
	$('#tag_add').click(function(){
		var tagname=$('#tagname').val();
		// 数据提交操作
		var setting={
            'url':'tags_new',
            'success':function(data){
				if(data['code']=='200'){
					var val=data['data'];
					$('#tags').append('<span class="label label-default reomve_tag" title="点击删除" data-uid="'+val+'"><i class="fa fa-times-circle"></i>'+tagname+'</span>');
					tags_list.push(val);
					$('.tag_err').html('');
				}else{
					$('.tag_err').html(data['data']);
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit({'termname':tagname,'type':'a_add'});
	});

	/*文章*/
	// 文章添加|保存为草稿
	$('#post_new,#draft').click(function(){
		var id=$(this).attr('id');
		var str_status=(id=='post_new')?'publish':'draft';
		var data=getPostData(str_status);
		if(!data)
			return;
		// 数据提交操作
		var setting={
            'url':'post_new_post',
            'success':function(data){
				if(data['code']=='200'){
					// 跳转到修改文章的页面
					window.location.href='post_edit.html?aid='+data['data']['aid'];
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit(data);

	});
	// 文章修改
	$('#post_edit,#edit_draft').click(function(){
		var id=$(this).attr('id');
		var str_status=(id=='post_edit')?'publish':'draft';
		var data=getPostData(str_status);
		// 文章ID
		data['post_id']=$('#post_id').val();
		// 数据提交操作
		var setting={
            'url':'post_edit_post',
            'success':function(data){
				if(data['code']=='200'){
					// 跳转到修改文章的页面
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
	// 获取文章发布与修改中的内容
	var getPostData=function(status){
		var title=$('#post_title').val();
		var description=$('#post_description').val();
		var content=ue.getContent();
		var time=$('#real_time').val();
		var thumbnail=$('.thumbnail img').attr('data-src');
		var cate_arr=new Array();
		$('.category').each(function(){
			var _this=$(this);
			if(_this.prop('checked'))
				cate_arr.push(_this.data('cate'));
		});
		var tags_arr=new Array();
		$('.tags .reomve_tag').each(function(){
			_this=$(this);
			tags_arr.push(_this.data('uid'));
		});
		var sort=$('#sort').val();
		if(title==''){
			$('.error_report').show();
			$('.error_report .text-danger').html('标题不能为空');
			return false;
		}else if(content==''){
			$('.error_report').show();
			$('.error_report .text-danger').html('内容部分不能为空');
			return false;
		}
		var data={'post_title':title,'post_description':description,'content':content,'time':time,'thumbnail':thumbnail,'category':cate_arr,'tags':tags_arr,'sort':sort,'status':status};
		return data;
	}
	// 全选设置
	$('#select_all').click(function(){
		var this_check=$(this).prop('checked');
		if(this_check)
			$('.checkbox').prop('checked',true);
		else
			$('.checkbox').prop('checked',false);
		$(':disabled').prop('checked',false);
	});
	// 删除文章
	$('.delete, #delete_art').click(function(){
		if(!confirm('是否将当前文章移至回收站?'))
			return;
		var uid=$(this).data('uid');
		var _this=$(this);
		// 数据提交操作
		var setting={
            'url':'post_delete',
            'success':function(data){
				if(data['code']=='200'){
					if(_this.attr('id')==''){
						_this.parent().parent().parent().css('background-color','#ff5454');
						setTimeout(function(){
							_this.parent().parent().parent().hide('1000');
						},1000);
					}else
						window.location.href='post_list.html';
				}else{
					$('.error_report .text-danger').html(data['data']);
					$('.error_report').show();
				}
            },
        };
        Ajax.setConfig(setting);
        Ajax.submit({'aid':uid});
	});
	// 批量删除文章
	$('#delete_all').click(function(){
		var control=$('#select_control').val();
		if(control!='delete')
			return;
		var aids=new Array();
		$('.checkbox').each(function(){
			if($(this).prop('checked'))
				aids.push($(this).data('uid'));
		});
		// 数据提交操作
		var setting={
            'url':'post_delete_selected',
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
        Ajax.submit({'aids':aids});
		
	});
	// 文章排序
	$('#sort_i').click(function(){
		var sq=$(this).data('sort');
		if(sq==''){
			sq='asc';
		}else
			sq=(sq=='desc')?'asc':'desc';
		var url=window.location.href;
		if(url.substr(-5)=='.html'){
			window.location.href=url+'?sort='+sq;
		}else
			window.location.href=url+'&sort='+sq;
	});
	// 分类查找应用
	$('#apply').click(function(){
		var cate=$('#category').val();
		var url=$('#category').data('url');
		window.location.href=url+'?cate='+cate;
	});
});
// 检测时间格式在前面加0
var checkTime=function(i){
	if (i<10) 
		i="0" + i;
	return i;
}