<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/upload.css">
<!-- 图片上传模态框 -->
<div id='imgModal' class="modal fade " tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">选择图片上传</h4>
			</div>
			<div class="modal-body">
				<div>
					<form id="upload" enctype="multipart/form-data"  method='post'>
						<div class='file_hide'>
							<a class='btn btn-primary btn-lg'>请选择要上传的图片<input type="file" class="imgUpload" name="file"/></a>
						</div>
						<div class='help-block text-center'>*最大支持2M图片上传</div>
						<div class='error_file help-block text-center'></div>
					</form>
				</div>
				<div class='img_preview'>
					<img src="">
				</div>
			</div>
			<div class="modal-footer">
				<button id='get_img' type="button" class="btn btn-danger">确认</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript" src='{$smarty.const.ORG}upload/jquery.form.js'></script>
<script type="text/javascript">
	// $(function(){
	// // 点击打开modal模态框上传图片
	// $('.upload').click(function(){
	// 	// 清空之前上传时数据缓存
	// 	$('.img_preview img').attr('src','');
	// 	$('.error_file').html('');
	// 	$('#imgModal').modal('show');
	// });
	
	// // 获取上传得到的图片的真实路径
	// $('#get_img').click(function(){
	// 	$('#imgModal').modal('hide');
	// 	// 并将路径设置到返回窗口
	// 	var url=$('.img_preview img').attr('src');
	// 	// 返回真实路径
	// var true_url=$('.img_preview img').attr('data-url');
	// $('.head_img img').attr('src',url);
	// $('.head_img img').attr('data-url',true_url);
	// });
	// // 图片上传操作
	// $('.imgUpload').change(function(){
	// 	file('#upload','imgUpload','home');
	// });

	// ----------------------以上内容请写入到逻辑操作中------------------------

	// 文件上传处理
	// param @filedom需要绑定的上传元素
	// param @method 上传后的处理方法
	var file=function(filedom,method,path){
		$(filedom).ajaxSubmit({
			dataType: 'json',  
			url:method,
	        beforeSend: function() {    
	        },  
	        uploadProgress: function(event, position, total, percentComplete) {
	        },  
	        success: function(data) {        	
	        	if(data['code']==200){
	                var url='';
	                if(data['data']['pic_url']!=''){
	                    url='upload/'+path+'/'+data['data']['pic_url'];
	                }	        	
		        	// 显示图片预览
		        	$('.img_preview img').attr('src',{$smarty.const.HOME}+url);
		        	$('.img_preview img').attr('data-url',url);
	        	}else
	                $('.error_file').html(data['data']['message']);
	        },  
	        error:function(xhr){   
	        	$('.error_file').html('数据异常');
	    	// 	if(typeof(xhr['data']['name'])=='undefined'){
	 				// $('.error_file').html('请选择要上传的图片');
	     // 		}else if(typeof(xhr['data']['size'])=='undefined'){
	     // 			$('.error_file').html('图片过大');
	     // 		}
	        }   
		});
	}
	// });
</script>