<?php
	namespace Common\Model;
	use Think\Model;
	class LogModel extends BaseModel{

		protected $tableName='logs';
		protected $_map=array(
			'id'		=>'user_id',
			'time'		=>'login_time',
			'ip'		=>'login_ip',
			'referer'	=>'login_referer',
		);
		// 获取所有的登录日志
		public function get_logs($p=1,$map='',$total=20){
			$result=$this->field('w_logs.*,user_nickname as name')->page($p,$total)->join('w_users on w_users.ID=w_logs.user_id','LEFT')->order('login_time desc')->select();

			$count=$this->count();
			$page=new \Think\Page($count,$total);
			$show=$page->show();
			return array('list'=>$result,'page'=>$show);
		}

		// 登录日志记录
		public function save_logs($data){
			$data=$this->create($data);
			$result=$this->addData($data);
			return $result;
		}
	}
?>