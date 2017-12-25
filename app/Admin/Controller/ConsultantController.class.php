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
					$value['atime']=time();
					$exec=$this->cons->where(array('uid'=>$uid))->save($value);
				}else
					$exec=$this->cons->add($value);
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

		function uploadImg(){
			parent::uploadImg('headimg');
		}
	}