<?php
	namespace Admin\Controller;
	use Think\Controller;
	class RecommendController extends BaseController{
		function __construct(){
			parent::__construct();
		}
		function index(){
			$p=I('GET.p');
			$rec=M('w_recomment');
			$list=$rec->field('w_recomment.*,w_members.uname as mname,w_members.phone_num as mtel,w.uname as tname,w.phone_num as ttel')->join('w_members on w_members.uid=u_uid')->join('w_members as w on w.uid=w_recomment.r_u_uid')->page($p,50)->order('status')->select();

			$count=$rec->count();
			$page=new \Think\Page($count,50);
			$this->assign('list',array('list'=>$list,'page'=>$page->show()));
			$this->display();
		}

		function deal(){
			$uid=I('POST.uid');
			if($uid){
				$rec=M('w_recomment');
				$exec=$rec->where(array('uid'=>$uid))->save(array('status'=>1));
				if($exec)
					echo message();
				else
					echo message(301,'error','数据提交失败，请稍后再试');
			}
		}
	}