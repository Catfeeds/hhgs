<?php /* Smarty version Smarty-3.1.6, created on 2017-12-27 18:10:46
         compiled from "./ThemeAdmin/default/Service/service_add.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13129059795a433b633b52d5-52100252%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'dd4d5dc3d5f187db5566a7570e031a4ea2a083a5' => 
    array (
      0 => './ThemeAdmin/default/Service/service_add.tpl',
      1 => 1514369439,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13129059795a433b633b52d5-52100252',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5a433b6343017',
  'variables' => 
  array (
    'username' => 0,
    'id' => 0,
    'userlevel' => 0,
    'info' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a433b6343017')) {function content_5a433b6343017($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Applications/MAMP/htdocs/jianye_garden/ThinkPHP/Library/Vendor/Smarty/plugins/modifier.date_format.php';
?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['userlevel']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->getSubTemplate ('../tpl/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('username'=>$_tmp1,'id'=>$_tmp2,'level'=>$_tmp3,'title'=>'服务编辑'), 0);?>

<style type="text/css">
	.thumbnail{
		width: 200px;
	}
</style>
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-plus-square"></i> 服务编辑</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="<?php echo @ADMIN;?>
">首页</a></li>
				<li><i class="fa fa-plus-square"></i>服务编辑</li>	
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
						<input id="uid" type='hidden' value="<?php echo $_smarty_tpl->tpl_vars['info']->value['uid'];?>
">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>服务名称</label>
							<div class='col-xs-12 col-md-11'>
								<input id='name' class='form-control' type="text" name="name" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["name"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>服务简介</label>
							<div class='col-xs-12 col-md-11'>
								<input id='intro' class='form-control' type="text" name="intro" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["intro"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>图片</label>
							<div class='col-xs-12 col-md-11' >
								<div style='display:flex;'>
									<div id="filePicker">选择图片</div>&nbsp;&nbsp;<div id='reset' class='webuploader-pick' style='height: 40px;'>删除图片</div>
								</div>
								<div id="fileList" class="uploader-list"></div>
								<input id='images' type="hidden" name="images" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["img"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>服务区域</label>
							<div class='col-xs-12 col-md-11'>
								<input id='area' class='form-control' type="text" name="area" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["area"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>名额</label>
							<div class='col-xs-12 col-md-11'>
								<input id='num' class='form-control' type="number" name="num" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["number"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>剩余名额</label>
							<div class='col-xs-12 col-md-11'>
								<input id='last_num' class='form-control' type="number" name="last_num" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["last_number"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>开始时间</label>
							<div class='col-xs-12 col-md-11'>
								<input id='stime' class='form-control' type="date" name="stime" value='<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value["stime"],"%Y-%m-%d");?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>结束时间</label>
							<div class='col-xs-12 col-md-11'>
								<input id='etime' class='form-control' type="date" name="etime" value='<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['info']->value["etime"],"%Y-%m-%d");?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>支付方式</label>
							<div class='col-xs-12 col-md-11'>
								<select id='pay_way' name='pay_way' class='form-control'>
									<option value=1 <?php if ($_smarty_tpl->tpl_vars['info']->value['pay_way']==1){?>selected<?php }?>>积分</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>支付金额</label>
							<div class='col-xs-12 col-md-11'>
								<input id='cost' class='form-control' type="number" name="cost" value='<?php echo sprintf("%d",$_smarty_tpl->tpl_vars['info']->value["cost"]);?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>服务状态</label>
							<div class='col-xs-12 col-md-11'>
								<div class="radio">
									<label>
										<input type="radio" name="status" class="status" value="1" <?php if ($_smarty_tpl->tpl_vars['info']->value['status']==1){?>checked<?php }?>>
										开启
									</label>
									&nbsp;&nbsp;&nbsp;
									<label>
										<input type="radio" name="status" class="status" value="0" <?php if ($_smarty_tpl->tpl_vars['info']->value['status']==0||$_smarty_tpl->tpl_vars['info']->value['status']==null){?>checked<?php }?>>
										关闭
									</label>
								</div>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>可获得积分</label>
							<div class='col-xs-12 col-md-11'>
								<input id='score' class='form-control' type="number" name="score" value='<?php echo $_smarty_tpl->tpl_vars['info']->value["score"];?>
'>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>预订服务等级</label>
							<div class='col-xs-12 col-md-11'>
								<select id='level' name='level' class='form-control'>
									<option value=1 <?php if ($_smarty_tpl->tpl_vars['info']->value['level']==1){?>selected<?php }?>>Lv 1</option>
									<option value=2 <?php if ($_smarty_tpl->tpl_vars['info']->value['level']==2){?>selected<?php }?>>Lv 2</option>
									<option value=3 <?php if ($_smarty_tpl->tpl_vars['info']->value['level']==3){?>selected<?php }?>>Lv 3</option>
									<option value=4 <?php if ($_smarty_tpl->tpl_vars['info']->value['level']==4){?>selected<?php }?>>Lv 4</option>
									<option value=5 <?php if ($_smarty_tpl->tpl_vars['info']->value['level']==5){?>selected<?php }?>>Lv 5</option>
									<option value=6 <?php if ($_smarty_tpl->tpl_vars['info']->value['level']==6){?>selected<?php }?>>Lv 6</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>服务详情</label>
							<div class='col-xs-12 col-md-11'>
								<script id="editor" name='description' type="text/plain" style="width:100%;height:400px;"><?php echo stripslashes(htmlspecialchars_decode($_smarty_tpl->tpl_vars['info']->value["detail"]));?>
</script>
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
<link rel="stylesheet" type="text/css" href="<?php echo @THEMEADMIN;?>
assets/css/public.css">
<!-- 图片上传 -->
<link rel="stylesheet" type="text/css" href="<?php echo @ORG;?>
webuploader/webuploader.css">
<script type="text/javascript" src='<?php echo @ORG;?>
webuploader/webuploader.min.js'></script>
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
	        swf:  '<?php echo @ORG;?>
webuploader/Uploader.swf',

	        // 文件接收服务端。
	        server: '<?php echo @ADMIN;?>
Service/uploadImg',

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
			let $li = $('<div  class="file-item thumbnail">' +'<img data-url="'+imagesList[i]+'" src="<?php echo @UPLOAD;?>
Service/'+imagesList[i]+'">' +'</div>');
			$('#fileList').append($li);
		}
	});
</script>
<!-- ueditor编辑器 -->
<script type="text/javascript" src='<?php echo @ORG;?>
editor/ueditor/ueditor.config.js'></script>
<script type="text/javascript" src='<?php echo @ORG;?>
editor/ueditor/ueditor.all.min.js'></script>
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
				intro:'required',
				images:'required',
				area:'required',
				stime:'required',
				etime:'required',
				pay_way:'required',
				num:{
					required:true,
					digits:true,
				},
				last_num:{
					required:true,
					digits:true,
				},
				cost:{
					required:true,
					digits:true,
				},
				status:'required',
				score:{
					required:true,
					digits:true,
				},
				level:'required',
			},
			messages:{
				name:'服务名称不能为空',
				intro:'请填写服务简介',
				images:'请选择横幅图片',
				area:'请选择服务地区',
				stime:'请选择服务开始时间',
				etime:'请选择服务结束时间',
				pay_way:'请选择支付方式',
				num:{
					required:'名额不能为空',
					digits:'名额必须为整数类型',
				},
				last_num:{
					required:'剩余名额不能为空',
					digits:'剩余名额必须为整数类型',
				},
				cost:{
					required:'请填写需支付金额',
					digits:'支付金额必须为整数类型',
				},
				status:'请选择服务状态',
				score:{
					required:'请填写可获取积分',
					digits:'可获取积分必须为整数类型',
				},
				level:'required',
			},
			submitHandler:function(){
				$.ajax({
					type:'POST',
					dataType:'json',
					data:{
						'uid':$('#uid').val(),
						'name':$('#name').val(),
						'intro':$('#intro').val(),
						'images':$('#images').val(),
						'area':$('#area').val(),
						'stime':$('#stime').val(),
						'etime':$('#etime').val(),
						'pay_way':$('#pay_way').val(),
						'cost':$('#cost').val(),
						'status':$('.status:checked').val(),
						'score':$('#score').val(),
						'level':$('#level').val(),
						'detail':ue.getContent(),
						'num':$('#num').val(),
						'last_num':$('#last_num').val()
					},
					success:function(msg){
						if(msg['code']==200){
							alert('提交成功');
							window.location.reload();
						}else{
							$('.error_report').show();
							$('.error_report .text-danger').html(msg['data']);
						}
					}
				});
			},
		}); 
	});
</script>
<?php echo $_smarty_tpl->getSubTemplate ('../tpl/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>