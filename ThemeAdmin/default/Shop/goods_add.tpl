{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='商品编辑'}
<style type="text/css">
	.thumbnail{
		width: 120px;
		height: 120px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 商品编辑</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-plus-square"></i>商品编辑</li>	
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
				<div class='panel-body'>
					<form id='form' action="" method="post" enctype="multipart/form-data" class='form-horizontal'>
						<input id="goods_uid" type='hidden' value="{$goods['uid']}">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>商品名称</label>					
							<div class='col-xs-12 col-md-11' >
								<input id='gname' class='form-control' type="text" name="gname" value='{$goods["goods_name"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>商品介绍</label>							
							<div class='col-xs-12 col-md-11' >
								<input id='intro' class='form-control' type="text" name="intro" value='{$goods["goods_intro"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>库存</label>							
							<div class='col-xs-12 col-md-11' >
								<input id='number' class='form-control' type="number" name="number" value='{$goods["goods_num"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>余量</label>							
							<div class='col-xs-12 col-md-11' >
								<input id='last' class='form-control' type="number" name="last" value='{$goods["goods_last"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>价格</label>							
							<div class='col-xs-12 col-md-11' >
								<input id='price' class='form-control' type="number" name="price" value='{$goods["goods_price"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>用户兑换等级</label>							
							<div class='col-xs-12 col-md-11' >
								<select id='level' name='level' class='form-control'>
									<option value=1 {if $goods["goods_level"] eq 1}selected{/if}>lv 1</option>
									<option value=2 {if $goods["goods_level"] eq 2}selected{/if}>lv 2</option>
									<option value=3 {if $goods["goods_level"] eq 3}selected{/if}>lv 3</option>
									<option value=4 {if $goods["goods_level"] eq 4}selected{/if}>lv 4</option>
									<option value=5 {if $goods["goods_level"] eq 5}selected{/if}>lv 5</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>抢购开始时间</label>							
							<div class='col-xs-12 col-md-5' >
								<input id='sdate' class='form-control' type="text" name="sdate" readonly="" value='{$goods["goods_stime"]|date_format:"%Y-%m-%d %H:%M"}'>
							</div>
							<label class='col-md-1 col-xs-12'>抢购结束时间</label>							
							<div class='col-xs-12 col-md-5' >
								<input id='edate' class='form-control' type="text" name="edate" readonly="" value='{$goods["goods_etime"]|date_format:"%Y-%m-%d %H:%M"}'>
							</div>
							<div class='col-xs-11 col-xs-offset-1 help-block'>抢购商品请填写开始与结束时间</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>兑换数量/人</label>							
							<div class='col-xs-12 col-md-11' >
								<input id='convert' class='form-control' type="number" name="convert" value='{if $goods["goods_convert"] neq null}{$goods["goods_convert"]}{else}1{/if}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>商品状态</label>
							<div class='col-xs-12 col-md-11'>
								<div class="radio">
									<label>
										<input type="radio" name="status" class="status" value="1" {if $goods['goods_status'] eq 1 or $goods['goods_status'] eq null}checked{/if}>
										上架
									</label>
									&nbsp;&nbsp;&nbsp;
									<label>
										<input type="radio" name="status" class="status" value="2" {if $goods['goods_status'] eq 2}checked{/if}>
										下架
									</label>
								</div>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>商品权重</label>							
							<div class='col-xs-12 col-md-11' >
								<input id='degree' class='form-control' type="number" name="degree" max=100 value='{if $goods["goods_degree"] neq null}{$goods["goods_degree"]}{else}1{/if}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>图片</label>
							<div class='col-xs-12 col-md-11' >
								<div style='display:flex;'>
									<div id="filePicker">选择图片</div>
								</div>
								<div id="fileList" class="uploader-list"></div>
								<input id='images' type="hidden" name="images" value='{$goods["goods_img"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>商品详情</label>
							<div class='col-xs-12 col-md-11'>
								<script id="editor" name='description' type="text/plain" style="width:100%;height:400px;">{$goods["goods_detail"]|htmlspecialchars_decode|stripslashes}</script>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'></label>
							<div class='col-xs-12 col-md-11'>
								<button class='btn btn-danger'>保存商品</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
{include file='../tpl/footer.tpl'}
<!-- 图片上传 -->
<link rel="stylesheet" type="text/css" href="{$smarty.const.ORG}webuploader/webuploader.css">
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
	        server: '{$smarty.const.ADMIN}Shop/uploadImg',

	        // 选择文件的按钮。可选。
	        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	        pick: {
	        	id:'#filePicker',
	        	// multiple:false,
	        },
	        // 限制文件上传数量
	        // fileNumLimit:1,
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
	    	let imglist=$('#images').val();
	    	$('#images').val(imglist+JSON.parse(response._raw).data.pic_url+';');
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
	    // 图片列表自动加载
		var images=$('#images').val();
		imagesList=images.split(';')
		for(var i=0;i<imagesList.length;i++){
			if(imagesList[i]=='')
				continue;
			let $li = $('<div  class="file-item thumbnail">' +'<img data-url="'+imagesList[i]+'" src="{$smarty.const.UPLOAD}goods/'+imagesList[i]+'">' +'</div>');
			$('#fileList').append($li);
		}
		//点击删除图片列表 
		$('#fileList').on('click','.file-item',function(){
			if(!confirm('是否清除当前图片？'))
				return;
			$(this).parent().remove();
			let imglist=$('#images').val();
	    	$('#images').val(imglist.replace($(this).find('img').data('url'),''));
		});
	});
</script>
<!-- ueditor编辑器 -->
<script type="text/javascript" src='{$smarty.const.ORG}editor/ueditor/ueditor.config.js'></script>
<script type="text/javascript" src='{$smarty.const.ORG}editor/ueditor/ueditor.all.min.js'></script>
<script type="text/javascript">
	// 富文本编辑器
	var ue = UE.getEditor('editor', {
	    toolbars: [
	        [ 'source','undo','bold', 'italic', 'strikethrough','fontsize',  'forecolor','horizontal',  'blockquote','insertorderedlist',  'insertunorderedlist','indent','justifyleft','justifyright','justifycenter','justifyjustify','imagecenter','lineheight', 'simpleupload', 'insertimage','spechars','autotypeset','removeformat']
	    ],
	    autoHeightEnabled: true,
	    autoFloatEnabled: true,
	    elementPathEnabled:false,
	    wordCount:false,
	});
</script>
<!-- 数据上传 -->
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#form').validate({
			// debug:true,
			rules:{
				gname:'required',
				number:{
					required:true,
					digits:true,
				},
				last:{
					required:true,
					digits:true,
				},
				price:{
					required:true,
					number:true
				},
				level:'required',
				convert:{
					required:true,
					digits:true,
				},
				status:'required',
				degree:{
					digits:true
				},
			},
			messages:{
				gname:'商品名称不能为空',
				number:{
					required:'请输入库存数量',
					digits:'库存数量必须为整数',
				},
				last:{
					required:'请输入库存余量',
					digits:'库存余量必须为整数',
				},
				price:{
					required:'请输入商品价格',
					number:'商品价格必须为数字类型'
				},
				level:'请选择用户兑换等级',
				convert:{
					required:'每人的兑换数量不能为空',
					digits:'请输入整数类型的兑换数量'
				},
				status:'请选择商品状态',
				degree:{
					digits:'商品权重必须为整数'
				},
			},
			submitHandler:function(){
				$.ajax({
					url:'{$smarty.const.ADMIN}Shop/goods_add',
					type:'POST',
					dataType:'json',
					data:{
						'uid':$('#goods_uid').val(),
						'name':$('#gname').val(),
						'intro':$('#intro').val(),
						'number':$('#number').val(),
						'last':$('#last').val(),
						'price':$('#price').val(),
						'level':$('#level').val(),
						'sdate':$('#sdate').val(),
						'edate':$('#edate').val(),
						'convert':$('#convert').val(),
						'status':$('.status:checked').val(),
						'degree':$('#degree').val(),
						'images':$('#images').val(),
						'detail':ue.getContent(),
					},
					success:function(msg){
						if(msg['code']==200){
							alert('商品信息更新成功');
							window.location.href=location.href;
						}else{
							$('.error_report').show();
							$('.error_report .text-danger').html(msg['data']);
							{literal}
							$('html,body').animate({scrollTop: 0}, 500);
							{/literal}
						}
					}
				});
			}
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="{$smarty.const.ORG}datetimePicker/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src='{$smarty.const.ORG}datetimePicker/bootstrap-datetimepicker.min.js'></script>
<script type="text/javascript">
	$('#sdate,#edate').datetimepicker({
	    format: 'yyyy-mm-dd hh:ii',
	    autoclose:true,
	});
</script>