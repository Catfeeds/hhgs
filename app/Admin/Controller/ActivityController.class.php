<?php
	namespace Admin\Controller;
	use Think\Controller;
	class ActivityController extends BaseController{
		private $act=null;
		function __construct(){
			parent::__construct();
			$this->act=D('Activity');
		}
		// 数据列表
		function index(){
			$p=I('GET.p');
			$list=$this->act->field('*,UNIX_TIMESTAMP(concat(date," ",time)) as s,UNIX_TIMESTAMP(concat(edate," ",etime)) as e')->page($p,20)->order('status,edate desc')->select();
			$count=$this->act->count();
			$page=new \Think\Page($count,20);
			$show=$page->show();

			$this->assign('list',array('page'=>$show,'list'=>$list));
			$this->display();
		}
		// 新数据添加
		function act_new(){
			$uid=I('GET.uid');
			$info=$this->act->where(array('uid'=>$uid))->find();
			if($info)
				$this->assign('info',$info);
			$this->display();
		}
		// 数据添加
		function act_new_post(){
			$data=I('POST.');
			if($data){
				$value=array(
					'name'		=>$data['name'],
					'titleimg'	=>str_replace(';', '', $data['images']),
					'date'		=>$data['date'],
					'time'		=>$data['time'],
					'edate'		=>$data['edate'],
					'etime'		=>$data['etime'],
					'address'	=>$data['addr'],
					'limitnum'	=>$data['total'],
					'carrynum'	=>$data['carry'],
					'costtype'	=>$data['costtype'],
					'cost'		=>$data['cost'],
					'isfree'	=>$data['limit'],
					'status'	=>$data['status'],
					'detail'	=>$data['detail'],
					'hexiao'	=>$data['hexiao'],
					'level'		=>$data['level'],
					'score'		=>$data['score'],
					'atime'		=>time()
				);
				// 修改
				$uid=$data['id'];
				if($uid!=''){
					$exec=$this->act->where(array('uid'=>$uid))->save($value);
				}else{ //添加
					$exec=$this->act->add($value);
				}
				if($exec)
					echo message();
				else
					echo message(301,'error','服务器暂时无法提供服务');
			}
		}
		// 活动数据收集
		function attend(){
			$attend=M('w_act_attend');
			$act_uid=I('GET.act_uid');
			$list=$attend->where(array('act_uid'=>$act_uid))->select();
			$this->assign('list',$list);
			$ls=$this->act->field('level,score,ls_update')->where(array('uid'=>$act_uid))->find();
			$this->assign('ls',$ls);
			$this->display();
		}
		// 活动签到
		function clock_in(){
			$uid=I('POST.uid');
			$attend=M('w_act_attend');
			$exec=$attend->where(array('uid'=>$uid))->save(array('is_arrival'=>1,'arrival_time'=>time()));
			if($exec)
				echo message();
			else
				message(301,'error','服务器连接出错,请稍后再试');
		}
		// 更新参加活动后获取到的成长值与活跃值
		// 这个算法写的就像是噩梦一般，
		function update_ls(){
			$act_uid=I('POST.act_uid');
			// 获取该活动的成长活跃值
			$ls=$this->act->field('level,score,ls_update,status')->where(array('uid'=>$act_uid))->find();
			if($ls['status']==0)
				echo message(303,'notice','活动尚未结束，暂时无法更新用户活跃值');
			else if($ls['ls_update']){
				echo message(302,'notice','成长值与活跃值已进行更新,请勿重复提交');
			}else{			
				$data=I('POST.data');
				$no_l=array(); //未变动人员成长值批量增加数组
				$no_s=array(); //未变动人员活跃值批量增加数组
				$no_c=array(); //未变动人员id列表
				$y_c=array(); //已变动人员成长值活跃值列表
				// 归类活跃值变动与未变动的人员数组
				foreach($data['data'] as $v){
					if(($ls['level']==$v[1])&&($ls['score']==$v[2])){
						$no_l[]=array('u_uid'=>$v[0],'type'=>1,'of'=>4,'number'=>$ls['level']);
						$no_s[]=array('u_uid'=>$v[0],'type'=>2,'of'=>4,'number'=>$ls['score']);
						$no_c[]=$v[0];
					}
					else
						$y_c[]=$v;
				}
				// 未变动人员id拼接字符串
				$mem_str=implode(',', $no_c);

				// 开始执行活跃值更新操作
				$grade=D('Grade');
				$growth=D('Growth');
				$grade->startTrans();
				// 活跃值未变化的用户
				$level=$score=$l=$s=true;
				if($no_c){
					$level=$grade->where(array('u_uid'=>array('in',$mem_str)))->setInc('level',$ls['level']);
					$score=$grade->where(array('u_uid'=>array('in',$mem_str)))->setInc('score',$ls['score']);

					// 未变动活跃值增长记录修改 
					$l=$growth->addAll($no_l);
					$s=$growth->addAll($no_s);
				}
				$unchanged=$level&&$score&&$l&&$s;

				// 活跃值被手动修改后的用户
				$changed=true;
				if($y_c){
					foreach ($y_c as $v) {
						$level1=$grade->where(array('u_uid'=>$v[0]))->setInc('level',$v[1]);
						$score1=$grade->where(array('u_uid'=>$v[0]))->setInc('score',$v[2]);
						$l1=$growth->add(array('u_uid'=>$v[0],'type'=>1,'of'=>4,'number'=>$v[1]));
						$s1=$growth->add(array('u_uid'=>$v[0],'type'=>2,'of'=>4,'number'=>$v[2]));
						if(!($level1&&$score1&&$l1&&$s1)){
							$changed=false;
							break;
						}
					}
				}

				// 设置活跃值值已增加的标记
				$update=$this->act->where(array('uid'=>$act_uid))->save(array('ls_update'=>1));
				if($unchanged&&$changed&&$update){
					$grade->commit();
					echo message();
				}else{
					$grade->rollback();
					echo message(301,'error','成长值与活跃值更新失败');
				}
			}
		}
		// 图片上传
		function uploadImg(){
			parent::uploadImg('activity');
		}
		// 对迟到和未签到的报名人员进行短信通知
		function notice_sms(){
			$attend=M('w_act_attend');
			$act_uid=I('POST.uid');
			$act_info=$this->act->field('edate,etime')->where(array('uid'=>$act_uid))->find();
			$end_time=strtotime($act_info['edate'].' '.$act_info['etime']);
			$list=$attend->field('arrival_time,phone_num,is_arrival')->where(array('act_uid'=>$act_uid))->select();
			// 查询出迟到的和未签到的用户的
			$late=array();
			$absent=array();
			foreach ($list as $item) {
				$at=$item['arrival_time'];
				if($item['is_arrival']==0)
					$absent[]=$item['phone_num'];
				elseif($at>$end_time)
					$late[]=$item['phone_num'];
			}
			// 发送短信通知
			$sms=D('Sms');
			$temp_id=0;
			// 迟到
			$sms1=1;
			if($late){
				$phone=implode(',',$late);
				$param1='【花园公社】由于您本次活动迟到，可能会影响参与您接下来的其他活动。';
				$res1=$sms->send_phone_msg($phone,$temp_id,$param1);
				if($res1->returnstatus!='Success')
					$sms1=false;
			}
			// 未签到
			$sms2=1;
			if($absent){
				$phone=implode(',',$absent);
				$param2='【花园公社】由于您本次活动未签到，可能会影响参与您接下来的其他活动。';
				$res2=$sms->send_phone_msg($phone,$temp_id,$param2);
				if($res2->returnstatus!='Success')
					$sms2=false;
			}
			$this->act->startTrans();
			// 设置活动已通知
			$exec=$this->act->where(array('uid'=>$act_uid))->save(array('notice'=>1));
			if($sms1&&$sms2&&$exec){
				$this->act->commit();
				echo message(200,'success','通知成功');
			}
			else{
				$this->act->rollback();
				echo message(301,'failed','服务器数据连接出错,请稍后再试');
			}
		}
	}