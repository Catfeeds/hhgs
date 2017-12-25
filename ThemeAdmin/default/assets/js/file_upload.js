// 需要引入jquery.form.js
// 需要首先加载出模态框
// 上传file标签
// form标签
// 一些特定的css属性
var file=function(filedom){
	$("#"+filedom).ajaxSubmit({
		dataType:  'json',  
		url:'uploadImg',
        beforeSend: function() {    
        },  
        uploadProgress: function(event, position, total, percentComplete) {
        },  
        success: function(data) {        	
        	if(data['code']==200){
                var url='';
                if(data['data']['pic_url']!=''){
                    url='upload/thumbnail/'+data['data']['pic_url'];
                    $('#remove_thumb').show();
                    $('#add_thumb').hide();
                    $('#imgModal').modal('hide')
                }	        	
	        	// 显示图片预览
	        	$('.thumbnail img').attr('src',$('.thumbnail img').data('root')+url);
                $('.thumbnail img').attr('data-src',url);
        	}else
                $('.error_file').html(data['data']['message']);
        },  
        error:function(xhr){     
    		if(typeof(xhr['data']['name'])=='undefined'){
 				$('.error_file').html('请选择要上传的图片');
     		}else if(typeof(xhr['data']['size'])=='undefined'){
     			$('.error_file').html('图片过大');
     		}
        }   
	});
}

$(function(){
	$('.imgUpload').change(function(){
		file('upload');
	});
    $('#add_thumb,.thumbnail img').click(function(){
        $('#imgModal').modal('show');
        $('.error_file').html('');
    });
    // 移除缩略图
    $('#remove_thumb').click(function(){
        $('#add_thumb').show();
        $(this).hide();
        $('.thumbnail img').attr('src','');
    });
});