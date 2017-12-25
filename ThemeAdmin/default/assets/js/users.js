$(function(){
	// 用户添加
	$('#user_submit').click(function(){
		var data=dataPackage();
		if(!data)
			return false;
		// 数据提交操作
		var setting={
            'url':'user_new_post',
            'success':success,
        };
        Ajax.setConfig(setting);
        Ajax.submit(data);
	});
	var success=function(data){
		if(data['code']=='200'){
			window.location.href='users.html';
		}else{	
			$('.error_report .text-danger').html(data['data']);
			$('.error_report').show();
		}
	}
	// 用户添加数据打包与检测
	var dataPackage=function(){
		var userlogin=$('#userlogin').val(),username=$('#username').val(),useremail=$('#useremail').val(),password=$('#password').val(),user_role=$('#user_role').val(),userstatus=$('#userstatus').val();
		// 数据类型判断
		if(userlogin==''){
			$('.error_report').show();
			$('.error_report .text-danger').html('用户名不能为空');
			return false;
		}else if(!CheckChinese(userlogin)){
			$('.error_report').show();
			$('.error_report .text-danger').html('用户名中不可包含中文字符');
			return false;
		}else if(!CheckMail(useremail)){
			$('.error_report').show();
			$('.error_report .text-danger').html('邮件格式错误');
			return false;
		}else if(password==''){
			$('.error_report').show();
			$('.error_report .text-danger').html('密码不能为空');
			return false;
		}
        var data={'userlogin':userlogin,'username':username,'useremail':useremail,'password':password,'user_role':user_role,'userstatus':userstatus};
        return data;
	}
	// 用户个人信息修改
	$('#profile_submit').click(function(){
		var data=profilePackage();
		if(!data)
			return false;
		// 数据提交操作
		var setting={
            'url':'user_edit_post',
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
	// 个人信息数据打包与检测
	var profilePackage=function(){
		var username=$('#username').val(),useremail=$('#useremail').val();
		if(username==''){
			$('.error_report').show();
			$('.error_report  .text-danger').html('用户昵称不能为空');
			return false;
		}else if(!CheckMail(useremail)){
			$('.error_report').show();
			$('.error_report  .text-danger').html('用户昵称不能为空');
			return false;
		}
		var data={'username':username,'useremail':useremail}
		return data;
	}
	// 用户密码修改
	$('#pass_submit').click(function(){
		var data=passPackage();
		if(!data)
			return false;
		// 数据提交操作
		var setting={
            'url':'user_pass',
            'success':function(data){
            	if(data['code']=='200'){
            		alert(data['data']);
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
	// 密码数据封装与检测
	var passPackage=function(){
		var password=$('#password').val(),newpassword=$('#newpassword').val(),pass_repeat=$('#pass_repeat').val();
		// 数据检测
		if(password==''||newpassword==''){
			$('.error_report').show();
			$('.error_report  .text-danger').html('密码不能为空');
			return false;
		}else if(newpassword!=pass_repeat){
			$('.error_report').show();
			$('.error_report  .text-danger').html('新密码输入不一致');
			return false;
		}
		var data={'password':password,'newpassword':newpassword};
		return data;
	}

	// 用户信息修改2
	$('#user_edit').click(function(){
		var data=userPackage();
		if(!data)
			return false;
		// 数据提交操作
		var setting={
            'url':'su_user_edit',
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
	var userPackage=function(){
		var username=$('#username').val(),useremail=$('#useremail').val(),user_role=$('#user_role').val(),userstatus=$('#userstatus').val(),user_id=$('#user_id').val();
		if(username==''){
			$('.error_report').show();
			$('.error_report  .text-danger').html('用户昵称不能为空');
			return false;
		}else if(!CheckMail(useremail)){
			$('.error_report').show();
			$('.error_report  .text-danger').html('用户昵称不能为空');
			return false;
		}
		var data={'username':username,'useremail':useremail,'user_role':user_role,'userstatus':userstatus,'userid':user_id};
		return data;
	}

	// 密码重置
	$('#reset_pass').click(function(){
		if(confirm('是否将当前用户密码重置为“123456”')){
			var setting={
	            'url':'reset_pass',
	            'success':function(data){
	            	if(data['code']=='200'){
						alert(data['data']);
					}else{
						$('.error_report .text-danger').html(data['data']);
						$('.error_report').show();
					}
	            },
	        };
	        Ajax.setConfig(setting);
	        Ajax.submit({'userid':$('#user_id').val()});
		}
	});
	// 删除用户
	// $('.delete').click(function(){
	// 	if(!confirm('是否要删除当前用户？'))
	// 		return;
	// 	var setting={
	//             'url':'user_delete',
	//             'success':function(data){
	//             	if(data['code']=='200'){
	// 					window.location.reload();
	// 				}else{
	// 					$('.error_report .text-danger').html(data['data']);
	// 					$('.error_report').show();
	// 				}
	//             },
	//         };
	//         Ajax.setConfig(setting);
	//         Ajax.submit({'userid':$(this).data('uid')});
	// });
});
// 中文字符检测
function CheckChinese(val){     
	var reg =/[\u4E00-\u9FFF]/;
	if(reg.test(val)){     
		return false;  
	}else
		return true;
}
// 邮箱验证
function CheckMail(val){
	var reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ;
	if(!reg.test(val)){
		return false;
	}else
		return true;
}