<?php
	namespace Common\Model;
	use Think\Model;
	class GradeModel extends BaseModel{
		protected $tableName='grade';
		// 更新积分和经验值
		function add_sl($uid,$score,$level){
			$count=$this->where(array('u_uid'=>$uid))->count();
			if($count>0){
				$exec=$this->where(array('u_uid'=>$uid))->save(array('level'=>$level,'score'=>$score));
			}else{
				$exec=$this->add(array('u_uid'=>$uid,'level'=>$level,'score'=>$score));
			}
			return $exec;
		}
	}
