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
				if(isset($uid)){
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
			$p=I('GET.p');
			$act_uid=I('GET.act_uid');
			$list=$attend->where(array('act_uid'=>$act_uid))->page($p,20)->select();

			$count=$attend->where(array('act_uid'=>$act_uid))->count();
			$page=new \Think\Page($count,20);
			$show=$page->show();
			$this->assign('list',array('page'=>$show,'list'=>$list));
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
		function update_ls(){
			$act_uid=I('POST.act_uid');
			// 获取该活动的成长活跃值
			$ls=$this->act->field('level,score,ls_update')->where(array('uid'=>$act_uid))->find();
			if($ls['ls_update']){
				echo message(302,'notice','成长值与活跃值已进行更新,请勿重复提交');
			}else{
				// 获取参加此活动的所有人的名单
				$attend=M('w_act_attend');
				$list=$attend->field('u_uid')->where(array('act_uid'=>$act_uid,'is_arrival'=>1))->select();
				$mem_list=array();
				foreach ($list as $value) {
					array_push($mem_list, $value['u_uid']);
				}
				$mem_str=implode(',', $mem_list);
				$grade=M('w_grade');
				$grade->startTrans();
				// 设置活跃值与成长值
				$level=$grade->where(array('u_uid'=>array('in',$mem_str)))->setInc('level',$ls['level']);
				$score=$grade->where(array('u_uid'=>array('in',$mem_str)))->setInc('score',$ls['score']);
				// 设置积分值已增加的记录
				$update=$this->act->where(array('uid'=>$act_uid))->save(array('ls_update'=>1));
				if($level&&$score&&$update){
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
	}