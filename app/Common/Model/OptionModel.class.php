<?php
	namespace Common\Model;
	use Think\Model;
	class OptionModel extends BaseModel{
		protected $tableName='options';
		protected $_map=array(
			'value'		=>'option_value',
		);
		// 获取数据
		public function get_data($map){
			return $this->where($map)->find();
		}

		// 添加数据
		public function add_data($data){
			$data=$this->create($data);
			return $this->add($data);
		}

		// 修改数据
		public function edit_data($map,$data){
			$data=$this->create($data);
			$result=$this->where($map)->save($data);
			return $result;
		}
		// 不做数据删除的操作

	}
?>