<?php
	namespace Common\Model;
	use Think\Model;
	class UserModel extends BaseModel{
		protected $tableName='users';
		// 字段映射
		protected $_map=array(
			'userlogin'		=>'user_login',
			'username'		=>'user_nickname',
			'password'		=>'user_pass',
			'useremail'		=>'user_email',
			'userstatus'	=>'user_status',
			'user_role'		=>'w_user_level'
		);
		// 传入用户登录名查询用户信息
		public function get_user_info($user_login){
			$result=$this->where('user_login="%s"',$user_login)->find();
			return $result;
		}
		// 传入用户主键查找用户信息
		public function get_user_by_id($id){
			$result=$this->where('id=%d',$id)->find();
			return $result;
		}
		// 添加新用户
		public function user_new($data){
			$data['user_role']=$data['user_role']=='general'?1:9;
			$data['userstatus']=$data['userstatus']=='forbidden'?0:1;
			$data['user_registered']=time();
			$data['password']=md5($data['password']);
			$result=$this->addData($this->create($data));
			return $result;
		}
		// 个人信息修改
		public function user_edit($map,$data){
			$data=$this->create($data);
			$result=$this->editData($map,$data);
			return $result;
		}
		// 用户密码更改
		public function user_pass($map,$data){
			// 更替数组中的密码串
			$data['password']=md5($data['newpassword']);
			$data=$this->create($data);
			$result=$this->editData($map,$data);
			return $result;
		}

		// 获取所有用户的数据
		public function get_all_users($map){
			$result=$this->where($map)->select();
			return $result;
		}

		// 重置用户密码
		public function reset_pass($map,$data){
			$result=$this->editData($map,$this->create($data));
			return $result;
		}
		// 管理员用户修改下属用户的账户信息
		public function su_user_edit($data){
			$data['user_role']=$data['user_role']=='general'?1:9;
			$data['userstatus']=$data['userstatus']=='forbidden'?0:1;
			$result=$this->editData(array('ID'=>$data['userid']),$this->create($data));
			return $result;
		}
		// // 用户删除(假性删除)
		// public function user_delete($map){
		// 	$data['user_deleted']=1;
		// 	$data['user_status']=0;
		// 	$result=$this->editData($map,$data);
		// 	return $result;
		// }
	}
?>