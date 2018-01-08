<?php
	namespace Home\Controller;
	use Think\Controller;
	class ActivityController extends BaseController{
		private $act;
		function __construct(){
			parent::__construct();
			$this->act=D('Activity');
		}

		// 活动列表
		function index(){
			// 提取幻灯片
			$carousel=M('carousel')->where(array('type'=>1))->select();
			$this->assign('carousel',$carousel);
			$status=I('GET.status');
			$p=I('POST.p');
			$p=($p!=0)?$p:1;
			if(isset($status)){
				$s=base64_decode(str_replace(' ', '+', $status));	
			}
			if($s=='进行中'||$s==''){
				$map='status<>3 and status<>2 and UNIX_TIMESTAMP(concat(edate," ",etime))>UNIX_TIMESTAMP(now())';
				$list=$this->act->field('uid,titleimg,name,date,time,edate,1 as ss')->where($map)->order('edate desc')->page($p,10)->select();
			}else if($s=='已结束'){
				$map='status=2 or UNIX_TIMESTAMP(concat(edate," ",etime))<UNIX_TIMESTAMP(now())';
				$list=$this->act->field('uid,titleimg,name,date,time,edate,2 as ss')->where($map)->order('edate desc')->page($p,10)->select();
			}else if($s=='我的活动'){
				$map=array('u_uid'=>$this->uid);
				$list=$this->act->field('w_activity.uid,titleimg,name,date,time,edate,etime,status')->where($map)->join('w_act_attend on w_act_attend.act_uid=w_activity.uid','left')->order('atime desc')->page($p,10)->select();
				$list=array_map(array(__CLASS__,'myact'), $list);
			}
			if($p==1){
				$this->assign('list',$list);
				$this->display();
			}else{
				if($list)
					echo message(200,'success',$list);
				else
					echo message(301,'notice',null);
			}	
		}

		// 参加活动
		function attend(){
			$auid=I('GET.uid');
			// 需要显示的信息
			$ainfo=$this->act->where(array('uid'=>$auid))->find();
			$time=$ainfo['edate'].' '.$ainfo['etime'];
			if($ainfo['status']!=2&&$ainfo['status']!=3&&(strtotime($time)>time()))
				$ainfo['ss']=1;
			else
				$ainfo['ss']=0;
			$this->assign('ainfo',$ainfo);
			// 已参加人数
			$attend=M('w_act_attend');
			$join=$attend->where(array('act_uid'=>$auid))->sum('carry_num');
			$join+=$attend->where(array('act_uid'=>$auid))->count();
			$this->assign('join',$join);
			// 是否已经报名过本活动
			$is_join=$attend->field('uid,uname,phone_num,carry_num,qrcode')->where(array('u_uid'=>$this->uid,'act_uid'=>$auid))->find();
			if($is_join){
				$this->assign('uinfo',$is_join);
			}else{
				// 提取个人信息自动填充数据
				$mem=D('Member');
				$uinfo=$mem->field('uname,phone_num,0 as carry_num')->where(array('uid'=>$this->uid))->find();
				$this->assign('uinfo',$uinfo);
			}
			$this->display();
		}
		// 活动报名处理函数
		function attend_post(){
			// 获取报名信息
			$post=I('POST.');
			$auid=I('GET.uid');
			// 获取活动的基本信息
			$ainfo=$this->act->field('uid,edate,etime,limitnum,carrynum,costtype,cost,isfree,status')->where(array('uid'=>$auid))->find();
			// 获取报名信息
			$data=array(
				'act_uid'	=>$ainfo['uid'],
				'u_uid'		=>$this->uid,
				'uname'		=>$post['name'],
				'phone_num'	=>$post['phone'],
				'carry_num'	=>$post['number'],
				'b_time'	=>time(),
			);
			// 判断是否结束或暂停
			$time=$ainfo['edate'].' '.$ainfo['etime'];
			if($ainfo['status']!=2&&$ainfo['status']!=3&&(strtotime($time)>time())){
				// 判断是否已经报名成功
				$attend=M('w_act_attend');
				$join=$attend->where(array('u_uid'=>$this->uid,'act_uid'=>$auid))->find();
				if(!$join){
					// 判断是否超过报名人员限制
					$isfull=$attend->where(array('act_uid'=>$auid))->sum('carry_num');
					$isfull+=$attend->where(array('act_uid'=>$auid))->count();
					if($isfull<$ainfo['limitnum']){
						// 判断家庭成员是否已经有过报名记录
						$family=M('w_family');		
						$parent=$family->field('p_uid')->where(array('child_uid'=>$this->uid))->find();
						$cmem=$family->field('child_uid')->where(sprintf('p_uid=%s or p_uid=%s',$this->uid,($parent['p_uid']==''?0:$parent['p_uid'])))->select();//业主查询自己的成员
						// 合并家庭成员为一维数组
						$members=array();
						foreach ($cmem as $value) {
							$members[]=$value['child_uid'];
						}
						// 查询家庭成员是否报名过此活动
						$mem_join=$attend->where(array('u_uid'=>array('in',implode(',',$members))))->count();
						if($mem_join<=0){
							// 判断是否只能业主报名
							$mem=D('Member');
							$uinfo=$mem->field('is_authen')->where(array('uid'=>$this->uid))->find();
							if($ainfo['isfree']==1){
								$mem->startTrans(); //开启事务处理，同步活跃值扣除与报名成功
								if($uinfo['is_authen']==0){
									echo message(304,'notice','只有认证业主才可以进行报名');	
									return;		
								}
							}
							// 判断是否需要缴费（活跃值或微信）
							$exec1=true;
							if($ainfo['costtype']==1){
								// 活跃值消费对比活跃值值
								$grade=D('Grade');
								$score=$grade->field('score')->where(array('u_uid'=>$this->uid))->find();
								if($score['score']<$ainfo['cost']){
									echo message(306,'notice','活跃值不足');
									return;
								}else{
									// 活跃值减少	并添加减少记录	
									$exec1=$this->degree_grade(4,0,$ainfo['cost'],'DEC');
								}
							}else if($ainfo['costtype']==2){
								// 微信支付
								// 微信支付逻辑暂时不做处理
								$exec1=true;
							}
							// 此处进行报名操作									
							$exec2=$attend->add($data);
							//添加二维码
							$user_link='http://'.$_SERVER['HTTP_HOST'].HOME.'/Writeoff/act_hexiao.html?act_attend='.base64_encode($exec2);
							$exec3=$this->create_qrcode($user_link);
							// 更新二维码信息
							$exec4=$attend->where(array('uid'=>$exec2))->save(array('qrcode'=>$exec3));
							if($exec1&&$exec2&&($exec3!='')&&$exec4){
								$mem->commit();
								echo message(200,'success',$exec3);
							}else{
								echo message(308,'error','未知错误');
							}	
							
						}else
							echo message(305,'notice','您的家庭中已有其他成员报名过该活动');
					}else
						echo message(303,'notice','活动名额已满');					
				}else
					echo message(302,'notice','您已经报名参加过此活动，请不要重复报名');
			}else
				echo message(301,'notice','活动已结束');	
		}
		// 生成二维码
		private function create_qrcode($url){
			$qrcode=D('Qrcode');
			$path='';
			$qrcode->qrcode($url,$path);
			return $path;
		}
		// 检查我参加过的活动的状态信息
		function myact($p){
			if($p){
				$strotime=$p['edate'].' '.$p['etime'];
				$now=date('Y-m-d H:i:s');
				if($p['status']==2)
					$p['ss']=2;
				elseif($p['status']==3)
					$p['ss']=3;
				elseif($strotime<$now)
					$p['ss']=2;
				elseif($strotime>$now)
					$p['ss']=1;
			}
			return $p;
		}
	}