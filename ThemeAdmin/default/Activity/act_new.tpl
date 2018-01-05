{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='活动编辑'}
<style type="text/css">
	.thumbnail{
		width: 200px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 活动编辑</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-plus-square"></i>活动编辑</li>	
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
						<input id="uid" type='hidden' value="{$info['uid']}">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>活动名称</label>
							<div class='col-xs-12 col-md-11'>
								<input id='name' class='form-control' type="text" name="name" value='{$info["name"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>活动开始日期</label>
							<div class='col-xs-6 col-md-6'>
								<input id='date' class='form-control' type="date" name="date" value="{$info['date']}">
							</div>
							<div class='col-xs-5 col-md-5'>
								<input id='time' class='form-control' type="time" name="time" value="{$info['time']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>活动结束日期</label>
							<div class='col-xs-6 col-md-6'>
								<input id='edate' class='form-control' type="date" name="edate" value="{$info['edate']}">
							</div>
							<div class='col-xs-5 col-md-5'>
								<input id='etime' class='form-control' type="time" name="etime" value="{$info['etime']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>图片</label>
							<div class='col-xs-12 col-md-11' >
								<div style='display:flex;'>
									<div id="filePicker">选择图片</div>&nbsp;&nbsp;<div id='reset' class='webuploader-pick' style='height: 40px;'>删除图片</div>
								</div>
								<div class='help-block'>最佳图片高度为156px</div>
								<div id="fileList" class="uploader-list"></div>
								<input id='images' type="hidden" name="images" value='{$info["titleimg"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>活动地址</label>
							<div class='col-xs-12 col-md-11'>
								<input id='addr' class='form-control' type="text" name="addr" value="{$info['address']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>活动总人数</label>
							<div class='col-xs-12 col-md-11'>
								<input id='total' class='form-control' type="number" name="total" value="{$info['limitnum']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>可携带人数</label>
							<div class='col-xs-12 col-md-11'>
								<input id='carry' class='form-control' type="number" name="carry" max=5 min=0 value="{$info['carrynum']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>报名条件</label>
							<div class='col-xs-12 col-md-11'>
								<div class="radio">
									<label>
										<input type="radio" name="limit" class="limit" value="1" {if $info['isfree'] eq 1}checked{/if}>
										仅业主
									</label>
									&nbsp;&nbsp;&nbsp;
									<label>
										<input type="radio" name="limit" class="limit" value="2" {if $info['isfree'] eq 2 or $info['isfree'] eq null}checked{/if}>
										所有人
									</label>
								</div>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>报名费用</label>
							<div class='col-xs-6 col-md-6'>
								<select id='costtype' name='costtype' class='form-control'>
									<option value=0 {if $info['costtype'] eq 0}selected{/if}>免费</option>
									<option value=1 {if $info['costtype'] eq 1}selected{/if}>积分</option>
<!-- 									<option value=2 {if $info['costtype'] eq 2}selected{/if}>微信支付</option>
 -->								</select>
							</div>
							<div class='col-xs-5 col-md-5'>
								<input id='cost' class='form-control' type="number" name="cost" placeholder='报名费用不为空时填写所需花费' min=0 value="{$info['cost']}">
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>活动状态</label>
							<div class='col-xs-12 col-md-11'>
								<select id='status' name='status' class='form-control'>
									<option value=1 {if $info['status'] eq 1}selected{/if}>进行中</option>
									<option value=2 {if $info['status'] eq 2}selected{/if}>已结束</option>
									<option value=3 {if $info['status'] eq 3}selected{/if}>暂停中</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>核销密码</label>
							<div class='col-xs-12 col-md-11'>
								<input id='hexiao' class='form-control' type="text" name="hexiao" value='{$info["hexiao"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>成长值奖励</label>
							<div class='col-xs-12 col-md-5'>
								<input id='level' class='form-control' type="number" name="level" value='{$info["level"]}'>
							</div>
							<label class='col-md-1 col-xs-12'>活跃值奖励</label>
							<div class='col-xs-12 col-md-5'>
								<input id='score' class='form-control' type="number" name="score" value='{$info["score"]}'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>活动详情</label>
							<div class='col-xs-12 col-md-11'>
								<script id="editor" name='description' type="text/plain" style="width:100%;height:400px;">{$info["detail"]|htmlspecialchars_decode|stripslashes}</script>
							</div>
						</div>
						<div class='form-group'>
							<div class='col-md-11 col-md-offset-1'>
								<button class='btn btn-danger'>提交数据</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
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
        thumbnailWidth = 200 * ratio,
        thumbnailHeight = 100 * ratio,

	    // 初始化Web Uploader
	    uploader = WebUploader.create({

	        // 自动上传。
	        auto: true,

	        // swf文件路径
	        swf:  '{$smarty.const.ORG}webuploader/Uploader.swf',

	        // 文件接收服务端。
	        server: '{$smarty.const.ADMIN}Activity/uploadImg',

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
	    	$('#images').val(JSON.parse(response._raw).data.pic_url+';');
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
		var images=$('#images').val();
		imagesList=images.split(';')
		for(var i=0;i<imagesList.length;i++){
			if(imagesList[i]=='')
				continue;
			let $li = $('<div  class="file-item thumbnail">' +'<img data-url="'+imagesList[i]+'" src="{$smarty.const.UPLOAD}activity/'+imagesList[i]+'">' +'</div>');
			$('#fileList').append($li);
		}
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
				name:'required',
				total:{
					required:true,
					number:true
				},
				carry:{
					required:true,
					number:true
				},
				addr:'required',
				date:'required',
				time:'required',
				edate:'required',
				etime:'required',
				hexiao:{
					required:true,
					minlength:4,
					digits:true
				},
				level:{
					required:true,
					digits:true,
				},
				score:{
					required:true,
					digits:true,
				}

			},
			messages:{
				name:'请输入活动名称',
				total:'请输入活动总人数',
				carry:'请选择可携带人数',
				addr:'请选择活动地址',
				date:'请选择活动开始日期',
				time:'请选择活动开始时间',
				edate:'请选择活动结束日期',
				etime:'请选择活动结束时间',
				hexiao:{
					required:'核销密码不能为空',
					minlength:'核销密码不能少于4位',
					digits:'请输入数字类型的核销码'
				},
				level:{
					required:'请输入成长值奖励',
					digits:'必须为数字',
				},
				score:{
					required:'请输入活跃值奖励',
					digits:'必须为数字',
				}
			},
			submitHandler:function(){
				$.ajax({
					url:'{$smarty.const.ADMIN}Activity/act_new_post',
					type:'POST',
					dataType:'json',
					data:{
						'id':$('#uid').val(),
						'name':$('#name').val(),
						'date':$('#date').val(),
						'time':$('#time').val(),
						'edate':$('#edate').val(),
						'etime':$('#etime').val(),
						'images':$('#images').val(),
						'addr':$('#addr').val(),
						'total':$('#total').val(),
						'carry':$('#carry').val(),
						'limit':$('.limit:checked').val(),
						'costtype':$('#costtype').val(),
						'cost':$('#cost').val(),
						'status':$('#status').val(),
						'hexiao':$('#hexiao').val(),
						'detail':ue.getContent(),
						'level':$('#level').val(),
						'score':$('#score').val()
					},
					success:function(msg){
						if(msg['code']==200){
							alert('信息更新成功');
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
