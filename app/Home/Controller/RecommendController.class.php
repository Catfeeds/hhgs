<?php
	namespace Home\Controller;
	use Think\Controller;
	class RecommendController extends BaseController{
		function __construct(){
			parent::__construct();
		}
		function index(){
			$this->assign('uid',base64_encode($this->uid));
			$this->display();
		}
		function save_code(){
			$code=I('POST.code');
			$code=str_replace(' ', '+', $code);		
			if($code){
				$rec=M('w_recomment');
				$exec=$rec->add(array('u_uid'=>$this->uid,'r_u_uid'=>base64_decode($code),'atime'=>time()));
				if($exec)
					echo message();
				else
					echo message(301,'error','数据提交失败，请稍后再试');
			}
		}
	}