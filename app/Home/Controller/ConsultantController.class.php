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
				$mem->startTrans();
				// 第一次选择置业顾问更新个人信息数据
				$exec1=true;
				if($info['pro_consultant']==''){
					$exec1=$mem->where(array('uid'=>$this->uid))->save(array('pro_consultant'=>$data['consultant']));
				}
				// 添加置业顾问预约
				$cons_order=M('w_cons_order');
				$data['atime']=time();
				$data['u_uid']=$this->uid;
				$data['code']=rand(1,999999);
				$exec2=$cons_order->add($data);
				if($exec1&&$exec2){
					$mem->commit();
					echo message();
				}else{
					$mem->rollback();
					echo message(301,'error','数据提交出错，请稍后再试');
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
			if($count1>0&&$count2<1)
				$p['comment']=1;
			else
				$p['comment']=2;
			return $p;

		}
	}