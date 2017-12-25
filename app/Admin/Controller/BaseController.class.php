<?php
	namespace Admin\Controller;
	use Think\Controller;
	class BaseController extends Controller{
		protected $user_level=0;
		
		// 继承构造函数
		public function __construct(){
			parent::__construct();
			// 登陆后
			if(session('w_user_login')!=''){
				$this->user_level=session('w_user_level');
				$this->user_login_id=session('w_user_login_id');
				$this->user_status=$this->get_user_status($this->user_login_id);
				// 使用中的用户状态检测(是否被禁用)
				if($this->user_login_id!=''&&$this->user_status!=1&&strtolower(ACTION_NAME)!='login'){
					session_destroy();
					redirect(U('Admin/Index/Login'),1,'<meta charset="utf-8"><div style="font-family:微软雅黑;width:500px;padding:65px 0;line-height:2;margin:200px auto;text-align:center;border:1px solid rgba(0,0,0,.3);border-radius:5px;">您的账户已被禁用</div>');
				}else{
					// 将用户变量注册到页面中去
					$this->assign('id',$this->user_login_id);//主键
					$this->assign('username',session('w_user_login'));//登录名
					$this->assign('userlevel',$this->user_level);//用户等级
				}
			}else
				$this->redirect_self(U('Admin/Index/Login'));
		}

		// 页面未登录跳转
		protected function redirect_self($redirect_url){	
			switch (strtolower(ACTION_NAME)) {
				case 'login':
				case 'login_submit':
				case 'login_out':
					break;				
				default:
					redirect($redirect_url,3,'<meta charset="utf-8"><div style="font-family:微软雅黑;width:500px;padding:65px 0;line-height:2;margin:200px auto;text-align:center;border:1px solid rgba(0,0,0,.3);border-radius:5px;">您尚未登录，正在为您跳转到登录页面······<br><small>页面未跳转，</small><a href="'.$redirect_url.'"><small>请点击这里</small></a></div>');
					break;
			}
		}
		// 获取用户状态
		protected function get_user_status($id){
			$model=D('User');
			$info=$model->get_user_by_id($id);
			if($info)
				return $info['user_status'];
			else
				return false;
		}
		// 图片上传
		// 上传目录自定义
        protected function uploadImg($path='thumbnail'){
        	// 实例化上传类   
            $upload = new \Think\Upload();
            // 设置附件上传大小
            $upload->maxSize   =2097152 ;
            // 设置附件上传类型     
            $upload->exts      =array('jpg', 'gif', 'png', 'jpeg');
            
            // 上传根路径
            $upload->rootPath   =$_SERVER['DOCUMENT_ROOT'].HOME.'/upload/'.$path.'/';
            if(!is_dir($upload->rootPath)){
            	mkdir($upload->rootPath);
            }
            // 设置附件上传目录
            $upload->savePath  	=''; 
            // 上传文件     
            $info   			=$upload->upload();   
            $status=true; 
            if(!$info) {
                // 上传错误提示错误信息        
                $message=$upload->getError();   
                $status=false; 
            }else{
                $message='上传成功';
            }
            $echo_arr = array(  
                'name'=>$info['file']['name'],
                'pic_url'=>$info['file']['savepath'].$info['file']['savename'],  
                'size'=>$info['file']['size'] ,
                'message'=>$message,
            );  
            if($status)
            	echo message(200,'success',$echo_arr);
        	else
        		echo message(408,'errors',$echo_arr);
        }
	}
?>