<?php
	namespace Common\Model;
	use Think\Model;
	class GradeModel extends BaseModel{
		protected $tableName='grade';
		// 更新积分和经验值
		// In_dec inc积分增加,dec积分减少
		function add_sl($uid,$score,$level,$In_dec='INC'){
			$count=$this->where(array('u_uid'=>$uid))->count();
			if($count>0){
				if($In_dec=='INC'){
					if($level==0)
						$l=1;
					else
						$l=$this->where(array('u_uid'=>$uid))->setInc('level',$level);
					if($score==0)
						$s=1;
					else
						$s=$this->where(array('u_uid'=>$uid))->setInc('score',$score);
				}
				else if($In_dec=='DEC'){
					if($level==0)
						$l=1;
					else
						$l=$this->where(array('u_uid'=>$uid))->setDec('level',$level);
					if($score==0)
						$s=1;
					else
						$s=$this->where(array('u_uid'=>$uid))->setDec('score',$score);
				}
				$exec=$l&&$s;
			}else{
				$exec=$this->add(array('u_uid'=>$uid,'level'=>$level,'score'=>$score));
			}

			return $exec;
		}
	}
