<?php
	namespace Common\Model;
	use Think\Model;
	class RelationModel extends BaseModel{
		protected $tableName='term_relationship';
		
		// 修改文章和分类的对应关系
		public function relation_edit($map,$data){
			$result=$this->editData($map,$data);
			return $result;
		}

		// 传入类目主键获取此文章的对应的关系
		public function get_relations($map,$field='*',$join=''){
			return $this->field($field)->where($map)->join($join)->select();
		}
		// 添加对应关系
		public function add_relationship($data){
			$result=$this->addData($data);
			return $result;
		}
		// 删除对应关系
		public function delete_relation($map){
			$count=$this->where($map)->count();
			if($count>0)
				return $this->deleteData($map);
			else
				return true;
		}
	}
?>