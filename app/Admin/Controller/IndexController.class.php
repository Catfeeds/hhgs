<?php
	namespace Admin\Controller;
	use Think\Controller;
	/*
		默认的操作
		用户的登陆、退出
		登录页面和默认页面的显示
		当前登录用户的状态信息
	*/
	class IndexController extends BaseController{

		// 构造函数
		public function __construct(){
			parent::__construct();
		}
		// 后台默认首页
		public function index(){
			// 最新的页面
			$model=D('Pages');
			$pages=$model->get_page_list(1,'user_nickname,page_id,page_title,page_time','w_users on w_users.ID=w_pages.page_author',array('page_status'=>'open','w_user_level'=>array('ELT',$this->user_level)),5);
			$this->assign('pages',$pages);

			// 最新的文章
			$model=D('Archive');
			$field='w_post.ID as id,post_date,post_title,user_nickname,post_status';
			$map=array(
				'post_type_delete'	=>'open',
				'post_status'		=>'publish',
				'post_author'		=>array('ELT',$this->user_login_id),
			);
			$archive=$model->posts_list($map,1,'','post_date desc',$field,5);
			$this->assign('archive',$archive);

			// 登录日志
			$model=D('Log');
			$logs=$model->get_logs(1,'',5);
			$this->assign('logs',$logs['list']);

			$this->display();
		}
		// 登录页面默认显示页
		public function login(){
			$this->display();
		}


		/*逻辑操作*/

		// 后台登录后台提交页面
		public function login_submit(){
			$user_login=I('username');
			$user_pass=I('password');
			$model=D('User');
			$info=$model->get_user_info($user_login);
			if($info!=null){
				// 验证密码
				if($info['user_pass']==md5($user_pass)){
					if($info['user_status']!='1'){
						// 用户禁用
						echo message(400,'user forbidden','您的帐号已被禁用');
					}else{
						//登录成功设置session值
						// 用户主键值
						session(array('expire'=>3600*5));
						session('w_user_login_id',$info['id']);	
						// 登录名						
						session('w_user_login',$info['user_login']);
						// 用户等级						
						session('w_user_level',$info['w_user_level']);
						// 登录成功设置登录日志
						$this->save_login_logs($info);
						echo message(200,'success');
					}
				}else{
					//密码错误 
					echo message(401,'password error','帐号或密码错误');
				}
			}else{
				// 用户不存在
				echo message(402,'user does not exist','登录帐号不存在');
			}
		}
		// 用户退出登录
		public function logout(){
			// 销毁当前用户登录的session
			session_destroy();
			redirect(U('Admin/Index/Login'),1,'<meta charset="utf-8"><div style="font-family:微软雅黑;width:500px;padding:65px 0;line-height:2;margin:200px auto;text-align:center;border:1px solid rgba(0,0,0,.3);border-radius:5px;">操作成功</div>');
		}

		// 登录日志记录
		private function save_login_logs($info){
			$model=D('Log');
			$data=array(
				'id'		=>$info['id'],
				'time'		=>time(),
				'ip'		=>$_SERVER["REMOTE_ADDR"],
				'referer'	=>$_SERVER["HTTP_REFERER"],
			);
			return $model->save_logs($data);
		}
	}
?>