<?php
	namespace Home\Controller;
	use Think\Controller;
	class PagesController extends BaseController{
		public function index(){
			$pages=I('GET.pages');
			$model=D('Pages');
			if(!$pages)
				$pages=0;
			$result=$model->get_single_data(array('page_id'=>$pages));
			$this->assign('page',$result);
			$this->display();
		}
	}
?>