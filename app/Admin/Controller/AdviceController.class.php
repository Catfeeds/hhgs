<?php
	namespace Admin\Controller;
	use Think\Controller;
	class AdviceController extends BaseController{
		function __construct(){
			parent::__construct();
		}
		function index(){
			$p=I('GET.p');
			$advice=M('w_advice');
			$list=$advice->field('w_advice.*,w_members.uname')->page($p,20)->join('w_members on w_members.uid=w_advice.u_uid')->order('atime desc')->select();

			$count=$advice->count();
			$page=new \Think\Page($count,20);
			$this->assign('list',array('list'=>$list,'page'=>$page->show()));
			$this->display();
		}
	}