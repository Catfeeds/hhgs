<?php
	namespace Home\Controller;
	use Think\Controller;
	class ConsultantController extends BaseController{
		function __construct(){
			parent::__construct();
		}

		function index(){
			$data=I('POST.');
			// 提取客户个人信息
			$mem=D('Member');
			$info=$mem->field('uname,phone_num,pro_consultant')->where(array('uid'=>$this->uid))->find();
			if($data){
				// 判断是否存在一周内未赴约的预约
				$a=M('w_cons_order')->where(array('u_uid'=>$this->uid,'is_arrival'=>0,'atime'=>array('gt',time()-3600*24*7)))->count();
				if($a>0){
					echo message('302','notice','您已经进行过预约，请查看您的短信记录');
				}else{
					// 获取置业顾问信息
					$consultant=M('w_consultant');
					$cons_info=$consultant->field('name,phone_num')->where(array('uid'=>$data['cons_uid']))->find();

					$mem->startTrans();
					// 第一次选择置业顾问更新个人信息数据
					$exec1=true;
					if($info['pro_consultant']==''){
						$exec1=$mem->where(array('uid'=>$this->uid))->save(array('pro_consultant'=>$data['cons_uid']));
					}
					// 添加置业顾问预约
					$cons_order=M('w_cons_order');
					$data['atime']=time();
					$data['u_uid']=$this->uid;
					$data['code']=rand(1,999999);
					$exec2=$cons_order->add($data);
					if($exec1&&$exec2){
						$mem->commit();
						// 双方收到短信提示信息
						// $pa1=urlencode('#code#').'='.urlencode($data['code']).'&'.urlencode('#name#').'='.urlencode($cons_info['name']);
						$pa1='【花园公社】预约成功，您的预约码为'.$data['code'].',置业顾问是'.$cons_info['name'].'，请凭预约码与手机号现场核销';
						$this->sent_sms(2132774,$data['phone_num'],$pa1); // 客户
						// $pa2=urlencode('#code#').'='.urlencode($data['code']).'&'.urlencode('#time#').'='.urlencode($data['date'].' '.$data['time']);
						$pa2='【花园公社】有客户对您进行了预约，预约号码为'.$data['code'].',预约时间为'.$data['date'].' '.$data['time'];
						$this->sent_sms(2132776,$cons_info['phone_num'],$pa2); // 置业顾问
						echo message(200,'success',$data['code']);
					}else{
						$mem->rollback();
						echo message(301,'error','数据提交出错，请稍后再试');
					}
				}

			}else{
				$cons=M('w_consultant');
				$list=$cons->order('level desc')->select();
				$list=array_map(array(__CLASS__,'comment_decide'),$list);
				$this->assign('list',$list);
				$this->assign('info',$info);				
				$this->display();
			}
		}

		// 保存用户提交的评论内容
		function comment_submit(){
			$data=I('POST.');
			if($data){
				$value=array(
					'cons_uid'		=>$data['cons_uid'],
					'u_uid'			=>$this->uid,
					'degree'		=>$data['score'],
					'content'		=>$data['comment'],
					'atime'			=>time(),
				);
				$comment=M('w_cons_comment');
				$exec=$comment->add($value);
				if($exec)
					echo message();
				else
					echo message(301,'error','评论信息提交失败，请稍后再试');
			}
		}

		// 是否可以加载评论按钮
		private function comment_decide($p){
			$cons_uid=$p['uid'];
			$order=M('w_cons_order');
			// 评论条件 1、有过预约并且到达了现场；2、并未评论过此置业顾问
			$count1=$order->where(array('cons_uid'=>$cons_uid,'u_uid'=>$this->uid,'is_arrival'=>1))->count();

			$comment=M('w_cons_comment');
			$count2=$comment->where(array('u_uid'=>$this->uid,'cons_uid'=>$cons_uid))->count();
			$p['headimg']=str_replace(';', '', $p['headimg']);
			if($count1>0&&$count2<1)
				$p['comment']=1;
			else
				$p['comment']=2;
			return $p;

		}
		// 发送短信息
		private function sent_sms($temp_id,$phone,$param){
			$sms=D('Sms');
			$res=$sms->send_phone_msg($phone,$temp_id,$param);
			if($res->returnstatus=='Success'){
				return true;
			}else
				return false;
		}
	}