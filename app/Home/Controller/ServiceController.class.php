<?php
	namespace Home\Controller;
	use Think\Controller;
	class ServiceController extends BaseController{
		private $service;
		function __construct(){
			parent::__construct();
			$this->service=M('w_service');
		}
		// 服务列表
		function index(){
			$list=$this->service->where(array('status'=>1,'stime'=>array('lt',date('Y-m-d'),time()),'etime'=>array('gt',date('Y-m-d',time()))))->select();
			$this->assign('list',$list);
			$this->display();
		}
		function order(){
			$uid=I('GET.uid');
			$post=I('POST.');
			$sinfo=$this->service->where(array('uid'=>$uid))->find();
			$uinfo=D('Member')->field('w_members.uid,uname,phone_num,level,score')->where(array('w_members.uid'=>$this->uid))->join('w_grade on w_grade.u_uid=w_members.uid','left')->find();
			if($post){
				// 状态判断
				if($sinfo['status']==1){
					// 剩余名额判断
					if($sinfo['last_number']>0){
						// 时间判断
						if(strtotime($sinfo['stime'])<=time()){
							if(strtotime($sinfo['etime'])>=time()){
								// 用户等级判断
								$ulevel=$this->get_level($uinfo['level']);
								if($ulevel>=$sinfo['level']){
									// 支付积分判断
									if($uinfo['score']>=$sinfo['cost']){
										// 乐观锁
										$lock=$this->service->field('slock')->where(array('uid'=>$uid))->find();
										if($sinfo['slock']==$lock['slock']){
											// 开启事务处理
											$this->service->startTrans();
											// 更新服务剩余名额
											$dec_num=$this->service->where(array('uid'=>$uid))->setDec('last_number',1);
											// 更新乐观锁
											$l=$this->service->where(array('uid'=>$uid))->save(array('slock'=>date('Y-m-d H:i:s'),time()));											
											// 添加服务记录
											$sorder=M('w_service_order')->add(array('u_uid'=>$this->uid,'service_uid'=>$uid,'uname'=>$post['name'],'phone_num'=>$post['phone_num'],'order_date'=>$post['date'],'order_ampm'=>$post['time'],'address'=>$post['address'],'atime'=>time()));		
											// 更新积分
											$grade=M('w_grade')->where(array('u_uid'=>$this->uid))->setDec('score',$sinfo['cost']);
											// 更新积分记录
											$growth=M('w_growth')->add(array('u_uid'=>$this->uid,'type'=>1,'of'=>6,'number'=>$sinfo['cost'],'inc_dec'=>2));
											if($dec_num&&$l&&$sorder&&$grade&&$growth){
												$this->service->commit();
												echo message();
											}
											else{
												$this->service->rollback();
												echo message(308,'error','服务预约提交失败，请稍后再试');
											}
										}else
											echo message(307,'notice','系统繁忙请稍后再试');										
									}else		
										echo message(306,'notice','积分不足，无法预约此服务');
								}else
									echo message(305,'notice','用户等级不足Lv'.$sinfo['level'].'，无法预约此服务');
							}else
								echo message(304,'notice','该服务已结束');							
						}else
							echo message(303,'notice','该服务未开始');					
					}else
						echo message(301,'notice','服务名额不足');
				}else
					echo message(302,'notice','服务已关闭');				
			}else{
				$this->assign('sinfo',$sinfo);
				$this->assign('uinfo',$uinfo);
				$this->display();
			}
		}

		// 从成长值计算用户的等级
		private function get_level($level){
			switch ($level) {
				case $level>0&&$level<49:
					$lv=1;
					break;
				case $level>49&&$level<99:
					$lv=2;
					break;
				case $level>99&&$level<199:
					$lv=3;
					break;
				case $level>199&&$level<299:
					$lv=4;
					break;
				case $level>299&&$level<499:
					$lv=5;
					break;
				case $level>49:
					$lv=6;
					break;
				default:
					$lv=0;
					break;
			}
			return $lv;
		}
	}