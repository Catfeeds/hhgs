<?php
	namespace Admin\Controller;
	use Think\Controller;
	class AwardController extends BaseController{
		function __construct(){
			parent::__construct();
		}

		function index(){
			$data=I('POST.');
			$award=M('w_slnumber');
			if($data){
				$value=array(
					'lnumber'	=>$data['lnumber'],
					'snumber'	=>$data['snumber'],
				);
				$exec=$award->where(array('uid'=>$data['uid']))->save($value);
				if($exec)
					echo message();
				else
					echo message(301,'error','数据提交失败请稍后再试');
			}else{
				$list=$award->field('uid,lnumber,snumber')->order('uid')->select();
				$this->assign('award',$list);
				$this->display();
			}
		}
	}