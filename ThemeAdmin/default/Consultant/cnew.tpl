{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='置业顾问添加'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 置业顾问添加</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-plus-square"></i>置业顾问添加</li>	
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
				<div class='panel-heading'>置业顾问信息</div>
				<div class='panel-body'>
					<form id='form' action="" method="post" enctype="multipart/form-data" class='form-horizontal'>
						<input id="uid" type='hidden' value="{$info['uid']}">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>置业顾问姓名</label>
							<div class='col-xs-12 col-md-11'>
								<input id='name' class='form-control' type="text" name="name" value='{$info["name"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>头像认证</label>
							<div class='col-xs-12 col-md-11' >
								<div style='display:flex;'>
									<div id="filePicker">选择图片</div>&nbsp;&nbsp;<div id='reset' class='webuploader-pick' style='height: 40px;'>删除图片</div>
								</div>
								<div id="fileList" class="uploader-list"></div>
								<input id='headimg' type="hidden" name="headimg" value='{$info["headimg"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>置业顾问性别</label>
							<div class='col-xs-12 col-md-11'>
								<div class="radio">
									<label>
										<input type="radio" name="sex" class="sex" value="1" {if $info['sex'] eq 1 or $info['sex'] eq null}checked{/if}>
										男
									</label>
									&nbsp;&nbsp;&nbsp;
									<label>
										<input type="radio" name="sex" class="sex" value="2" {if $info['sex'] eq 2}checked{/if}>
										女
									</label>
								</div>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>出生日期</label>
							<div class='col-xs-12 col-md-11'>
								<input id='birth' class='form-control' type="date" name="birth" value='{$info["birth"]|date_format:"%Y-%m-%d"}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>手机号码</label>
							<div class='col-xs-12 col-md-11'>
								<input id='phone' class='form-control' type="tel" name="phone" value='{$info["phone_num"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>成交数量</label>
							<div class='col-xs-12 col-md-5'>
								<input id='deal' class='form-control' type="number" name="deal" value='{$info["deal"]}'>
							</div>
							<label class='col-md-1 col-xs-12'>关注人数</label>
							<div class='col-xs-12 col-md-5'>
								<input id='fans' class='form-control' type="number" name="fans" value='{$info["fans"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>评价等级</label>
							<div class='col-xs-12 col-md-11'>
								<input id='degree' class='form-control' type="number" name="degree" value='{$info["degree"]}' min=1 max=5 placeholder='最高为5'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'></label>
							<div class='col-xs-12 col-md-11'>
								<button type='submit' class='btn btn-danger'>提交数据</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class='panel panel-default'>
				<div class='panel-heading'>用户评论</div>
				<div class='panel-body'>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<td>评论用户</td>
								<td>评价星级</td>
								<td>评论内容</td>
								<td>评论时间</td>
							</tr>
						</thead>
						<tbody>
							{foreach $comment['list'] as $item}
								<tr>
									<td>{$item['u_uid']}</td>
									<td>{$item['degree']}&nbsp;星</td>
									<td>{$item['content']}</td>
									<td>{$item['atime']|date_format:'%Y-%m-%d %H:%M:%S'}</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<div class='text-center'>
						{$comment['page']}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<!-- 图片上传 -->
<link rel="stylesheet" type="text/css" href="{$smarty.const.ORG}webuploader/webuploader.css">
<style type="text/css">
	.file-item{
		width: 150px;
		height: 150px;
	}
</style>
<script type="text/javascript" src='{$smarty.const.ORG}webuploader/webuploader.min.js'></script>
<script type="text/javascript">
	$(function(){
        $list = $('#fileList'),
        // 优化retina, 在retina下这个值是2
        ratio = window.devicePixelRatio || 1,

        // 缩略图大小
        thumbnailWidth = 100 * ratio,
        thumbnailHeight = 100 * ratio,

	    // 初始化Web Uploader
	    uploader = WebUploader.create({

	        // 自动上传。
	        auto: true,

	        // swf文件路径
	        swf:  '{$smarty.const.ORG}webuploader/Uploader.swf',

	        // 文件接收服务端。
	        server: '{$smarty.const.ADMIN}Consultant/uploadImg',

	        // 选择文件的按钮。可选。
	        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	        pick: {
	        	id:'#filePicker',
	        	multiple:false,
	        },
	        // 限制文件上传数量
	        fileNumLimit:1,
	        // 只允许选择文件，可选。
	        accept: {
	            title: 'Images',
	            extensions: 'gif,jpg,jpeg,bmp,png',
	            mimeTypes: 'image/*'
	        }
	    });

	    // 当有文件添加进来的时候
	    uploader.on( 'fileQueued', function( file ) {
	        var $li = $(
	                '<div id="' + file.id + '" class="file-item thumbnail">' +
	                    '<img>' +
	                    '<div class="info">' + file.name + '</div>' +
	                '</div>'
	                ),
	            $img = $li.find('img');

	        $list.append( $li );

	        // 创建缩略图
	        uploader.makeThumb( file, function( error, src ) {
	            if ( error ) {
	                $img.replaceWith('<span>不能预览</span>');
	                return;
	            }

	            $img.attr( 'src', src );
	        }, thumbnailWidth, thumbnailHeight );
	    });

	    // 文件上传过程中创建进度条实时显示。
	    uploader.on( 'uploadProgress', function( file, percentage ) {
	        var $li = $( '#'+file.id ),
	            $percent = $li.find('.progress span');

	        // 避免重复创建
	        if ( !$percent.length ) {
	            $percent = $('<p class="progress"><span></span></p>')
	                    .appendTo( $li )
	                    .find('span');
	        }

	        $percent.css( 'width', percentage * 100 + '%' );
	    });

	    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
	    uploader.on( 'uploadSuccess', function( file,response ) {
	    	// console.log(response._raw);
	    	// 上传成功添加记录值
	    	$('#headimg').val(JSON.parse(response._raw).data.pic_url+';');
	        $( '#'+file.id ).addClass('upload-state-done');
	    });

	    // 文件上传失败，现实上传出错。
	    uploader.on( 'uploadError', function( file ) {
	        var $li = $( '#'+file.id ),
	            $error = $li.find('div.error');

	        // 避免重复创建
	        if ( !$error.length ) {
	            $error = $('<div class="error"></div>').appendTo( $li );
	        }

	        $error.text('上传失败');
	    });

	    // 完成上传完了，成功或者失败，先删除进度条。
	    uploader.on( 'uploadComplete', function( file ) {
	        $( '#'+file.id ).find('.progress').remove();
	    });
	    $('#reset').click(function(){
	    	console.log('删除图片');
	    	uploader.reset();
	    	$('#images').val('');
	    	$('#fileList').html('');
	    });
	    // 图片列表自动加载
		var images=$('#headimg').val();
		imagesList=images.split(';')
		for(var i=0;i<imagesList.length;i++){
			if(imagesList[i]=='')
				continue;
			let $li = $('<div  class="file-item thumbnail">' +'<img data-url="'+imagesList[i]+'" src="{$smarty.const.UPLOAD}headimg/'+imagesList[i]+'">' +'</div>');
			$('#fileList').append($li);
		}
	});
</script>
<!-- 数据上传 -->
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
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
		$('#form').validate({
			// debug:true,
			rules:{
				name:'required',
				headimg:'required',
				sex:'required',
				birth:'required',
				phone:{
					required:true,
					isphone:true,
				},
				deal:{
					required:true,
					digits:true
				},
				fans:{
					required:true,
					digits:true
				},
				dgree:{
					required:true,
					digits:true,
					min:1,
					max:5,
				},

			},
			messages:{
				name:'姓名不能为空',
				birth:'生日不能为空',
				headimg:'请上传头像信息',
				sex:'请选择性别',
				phone:{
					required:'手机号码不能为空'
				},
				deal:{
					required:'成交数量不能为空',
					digits:'请输入争取的数字类型'
				},
				fans:{
					required:'关注数量不能为空',
					digits:'请输入争取的数字类型'
				},
				degree:{
					required:'评价等级不能为空',
					digits:'请输入争取的数字类型',
					min:'不能小于1',
					max:'不能大于5'
				}
			},
			// errorPlacement:function(error,element){
			// 	$(element).closest('.line').after(error);
			// },
			submitHandler:function(){
				$.ajax({
					type:'POST',
					dataType:'json',
					data:{
						'uid':$('#uid').val(),
						'name':$('#name').val(),
						'birth':$('#birth').val(),
						'sex':$('.sex:checked').val(),
						'headimg':$('#headimg').val(),
						'phone':$('#phone').val(),
						'deal':$('#deal').val(),
						'fans':$('#fans').val(),
						'degree':$('#degree').val(),
					},
					success:function(msg){
						if(msg['code']==200){
							alert('提交成功');
							window.location.reload();
						}else
							$('.error_report').show();
							$('.error_report .text-danger').html(msg['data']);
					}
				});
			},
		});
	})
</script>
{include file='../tpl/footer.tpl'}