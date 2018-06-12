<?php
	namespace Common\Model;
	use Think\Model;
	class AuthenModel extends BaseModel{
		protected $tableName='autheninfo';
		// 添加新内容
		function uadd($data){
			$id=$this->addData($data);
			return $id;
		}
		// 删除内容
		function udelete($map){
			$exec=$this->deleteData($map);
			return $exec;
		}
		// 保存数据
		function usave($map,$data){
			return $this->where($map)->save($data);
		}
		// 集合查询
		function uselect($map,$field='*'){
			return $this->field($field)->where($map)->select();
		}
		// 单项查询
		function ufind($map,$field='*'){
			return $this->field($field)->where($map)->order('atime desc')->find();
		}
	}