<?php
	namespace Home\Controller;
	use Think\Controller;
	class WriteoffController extends Controller{
		function act_hexiao(){
			$act_attend=base64_decode(I('GET.act_attend'));
			$attend=M('w_act_attend');
			$info=$attend->field('w_act_attend.uid,uname,phone_num,carry_num,b_time,name,is_arrival,hexiao')->where(array('w_act_attend.uid'=>$act_attend))->join('w_activity on w_activity.uid=w_act_attend.act_uid')->find();

			if(I('POST.')){
				$hexiao=I('POST.hexiao');
				if($info['hexiao']==$hexiao){
					$exec=$attend->where(array('uid'=>$act_attend))->save(array('is_arrival'=>1,'arrival_time'=>time()));
					if($exec)
						echo message(200,'success','核销成功');
					else
						echo message(302,'error','核销失败');
				}else
					echo message(301,'error','核销密码错误');
			}else{
				$this->assign('info',$info);
				$this->display();
			}
		}
	}