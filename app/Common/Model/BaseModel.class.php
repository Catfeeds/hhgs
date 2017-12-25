<?php
	namespace Common\Model;
	use Think\Model;
	class BaseModel extends Model{
		protected $tablePrefix='w_';
		// 添加数据
		protected function addData($data){
			$id=$this->add($data);
			return $id;
		}
		// 修改数据
		protected function editData($map,$data){
			$result=$this->where($map)->save($data);
			return $result;
		}
		// 删除数据
		protected function deleteData($map){
			$result=$this->where($map)->delete();
			return $result;
		}
	}