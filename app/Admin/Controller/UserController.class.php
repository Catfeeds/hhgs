<?php
	namespace Admin\Controller;
	use Think\Ccontroller;
	class UserController extends BaseController{
		public function __construct(){
			parent::__construct();
		}
		// 默认显示页面
		public function index(){
			$this->display();
		}
		// 个人信息页面
		public function profile(){
			$model=D('User');
			$login_id=$this->user_login_id;
			$result=$model->get_user_by_id($login_id);
			$this->assign('info',$result);
			$this->display();
		}
		// 添加新用户
		public function user_new(){
			$this->display();
		}
		// 用户列表
		// 权限已设定为查看低于自身权限的角色
		public function users(){
			$model=D('User');
			$result=$model->get_all_users(array('w_user_level'=>array('LT',$this->user_level)));
			$this->assign('userinfos',$result);
			$this->display();
		}
		// 管理员修改所属用户信息页面
		// 用户编辑页面需要查看权限
		public function user_edit(){
			$id=I('GET.id');
			$model=D('User');
			$result=$model->get_user_by_id($id);
			if($result){
				// 检查当前登录用户是否有修改权限
				if($this->user_level>$result['w_user_level']){
					$this->assign('info',$result);
				}else
					$this->assign('info','对当前用户无修改权限');
			}
			$this->display();	
		}

		/*数据操作逻辑*/
		// 用户添加
		public function user_new_post(){
			if($this->user_level){
				$data=I('POST.');
				$model=D('User');
				// 添加前的用户存在检测
				$exist=$model->get_user_info($data['userlogin']);
				if($exist){
					echo message('405','exist','当前添加的用户登录名已存在');
				}else{
					// 添加
					$result=$model->user_new($data);
					if($result)
						echo message('200','success','添加新用户成功');
					else
						echo message('301','failed','添加新用户失败');
				}
			}else{
				echo message('403','forbidden','禁止访问');
			}
		}

		// 个人信息修改
		// 个人信息修改无需判断用户权限
		public function user_edit_post(){
			$data=I('POST.');
			$model=D('User');
			$result=$model->user_edit(array('ID'=>$this->user_login_id),$data);
			if($result)
				echo message(200,'success','更新成功');
			else
				echo message(301,'failed','更新失败');
		}

		// 用户密码修改
		public function user_pass(){
			$data=I('POST.');
			$model=D('User');
			// 用户原密码检测
			$pass_info=$model->get_user_by_id($this->user_login_id);
			if($pass_info['user_pass']!=md5($data['password'])){
				echo message(406,'passerror','原密码输入错误');
			}else{
				// 用户密码更新
				$result=$model->user_pass(array('ID'=>$this->user_login_id),$data);
				if($result)
					echo message(200,'success','密码更新成功');
				else
					echo message(301,'failed','密码更新失败');
			}
		}

		// 管理员修改所属用户信息
		public function su_user_edit(){
			$data=I('POST.');
			$model=D('User');
			$info=$model->get_user_by_id($data['userid']);
			if($info){
				// 检查当前登录用户是否有修改权限
				if($this->user_level>$info['w_user_level']){
					$result=$model->su_user_edit($data);
					if($result)
						echo message(200,'success','更新成功');
					else
						echo message(301,'failed','更新失败');
				}else
					echo message('403','no permission','对当前用户无修改权限');
			}
		}

		// 重置用户的密码
		public function reset_pass(){
			$id=I('POST.userid');
			$model=D('User');
			$info=$model->get_user_by_id($id);
			if($info){
				// 检查当前登录用户是否有修改权限
				if($this->user_level>$info['w_user_level']){
					$data['password']=md5('123456');
					$result=$model->reset_pass(array('ID'=>$id),$data);
					if($result)
						echo message(200,'success','密码重置成功');
					else
						echo message(301,'failed','密码重置失败');
				}
			}else
				echo message('403','no permission','对当前用户无修改权限');
		}
		// 用户删除(假性删除)
		// public function user_delete(){
		// 	$id=I('POST.userid');
		// 	$model=D('User');
		// 	$info=$model->get_user_by_id($id);
		// 	if($info){
		// 		// 检查当前登录用户是否有修改权限
		// 		if($this->user_level>$info['w_user_level']){
		// 			$result=$model->user_delete(array('ID'=>$id));
		// 			if($result)
		// 				echo message(200,'success','删除成功');
		// 			else
		// 				echo message(301,'failed','删除失败');
		// 		}else
		// 			echo message('403','no permission','对当前用户无修改权限');
		// 	}
		// }
	}
?>