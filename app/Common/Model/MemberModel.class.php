<?php
	// 会员信息
	namespace Common\Model;
	use Think\Model;
	class MemberModel extends BaseModel{
		protected $tableName='members';
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
		function uselect($map,$field='*',$join=''){
			return $this->field($field)->join($join)->where($map)->select();
		}
		// 单项查询
		function ufind($map,$field='*',$join=''){
			return $this->field($field)->join($join)->where($map)->find();
		}
	}