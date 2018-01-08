<?php
	namespace Admin\Controller;
	use Think\Controller;
	class ConsultantController extends BaseController{
		private $cons;
		function __construct(){
			parent::__construct();
			$this->cons=M('w_consultant');
		}
		function index(){
			$list=$this->cons->field('uid,name,sex,phone_num,birth,atime')->select();
			$this->assign('list',$list);
			$this->display();
		}
		function cnew(){
			$uid=I('GET.uid');
			$p=I('GET.p');
			$data=I('POST.');
			if($data){
				$uid=$data['uid'];
				$value=array(
					'name'		=>$data['name'],
					'sex'		=>$data['sex'],
					'headimg'	=>$data['headimg'],
					'birth'		=>strtotime($data['birth']),
					'deal'		=>$data['deal'],
					'fans'		=>$data['fans'],
					'degree'	=>$data['degree'],
					'phone_num'	=>$data['phone'],
				);
				if($uid){					
					$exec=$this->cons->where(array('uid'=>$uid))->save($value);
				}else{
					$value['atime']=time();
					$exec=$this->cons->add($value);
				}
				if($exec)
					echo message();
				else
					echo message(301,'error','数据提交出错');

			}else{
				$info=$this->cons->where(array('uid'=>$uid))->find();
				$this->assign('info',$info);
				$comment=$this->get_comment($uid,$p);
				$this->assign('comment',$comment);
				$this->display();
			}
		}
		// 获取评论信息
		function get_comment($cons_uid,$p=1){
			$comment=M('w_cons_comment');
			$list=$comment->where(array('cons_uid'=>$cons_uid))->page($p,20)->select();
			$count=$comment->where(array('cons_uid'=>$cons_uid))->count();
			$page=new \Think\Page($count,20);
			return array(
				'list'	=>$list,
				'page'	=>$page->show()
			);
		}

		// 预约管理
		function cons_order(){
			$p=I('GET.p');
			$search=I('GET.words');
			if($search)
				$map=array(
					'w_cons_order.name'			=>array('like','%'.$search.'%'),
					'w_cons_order.phone_num'	=>array('like','%'.$search.'%'),
					'w_cons_order.code'	=>array('like','%'.$search.'%'),
					'_logic'					=>'or'
				);
			$list=M('w_cons_order')->field('w_cons_order.*,w_consultant.name as cons_name')->where($map)->join('w_consultant on w_consultant.uid=w_cons_order.cons_uid')->page($p,20)->order('type,is_arrival')->select();
			$count=M('w_cons_order')->where($map)->count();
			$page=new \Think\Page($count,20);
			$this->assign('list',array('list'=>$list,'page'=>$page->show()));
			$this->display();
		}
		// 预约管理签到
		function order_arrival(){
			$uid=I('POST.uid');
			$order=M('w_cons_order');
			$exec=$order->where(array('uid'=>$uid))->save(array('is_arrival'=>1));
			if($exec)
				echo message();
			else
				echo message(301,'notice','手动签到失败，请稍后再试');
		}

		function uploadImg(){
			parent::uploadImg('headimg');
		}
	}