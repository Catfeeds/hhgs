<?php
	namespace Common\Model;
	use Think\Model;
	class GrowthModel extends BaseModel{
		protected $tableName='growth';

		// 检测某个内容中积分或经验值的增长记录数据
		// param $of获取方式
		// param $type 积分或经验值 
		function growth_count($map){
			$res=$this->where($map)->select();
			return $res;
		} 
	}