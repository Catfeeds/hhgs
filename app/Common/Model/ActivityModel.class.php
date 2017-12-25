<?php
	namespace Common\Model;
	use Think\Model;
	class ActivityModel extends BaseModel{
		protected $tableName='activity';
		// 获取我参加的活动
		function get_my_act($map){
			$res=$this->where($map)->select();
			return $res;
		}

	}