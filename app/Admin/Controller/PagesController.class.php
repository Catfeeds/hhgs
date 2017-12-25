<?php
	namespace Admin\Controller;
	use Think\Controller;
	class PagesController extends BaseController{
		public function __construct(){
			parent::__construct();
		}
		// 页面列表
		public function page_list(){
			$p=I('GET.p');
			$model=D('Pages');
			$result=$model->get_page_list($p,'user_nickname,page_id,page_title,page_time','w_users on w_users.ID=w_pages.page_author');
			$this->assign('result',$result);

			// 服务器地址
			$this->assign('server',$_SERVER['SERVER_NAME'].HOME);
			$this->display();
		}
		// 页面添加
		public function page_new(){	
			$this->display();
		}
		// 页面修改
		public function page_edit(){
			$page=I('GET.page');
			$model=D('Pages');
			$result=$model->get_single_data(array('page_id'=>$page,'page_status'=>'open'));
			$result['page_content']=htmlspecialchars_decode($result['page_content']);
			$this->assign('result',$result);
			$this->display();
		}
		// 新建页面的查看浏览
		public function page_view(){
			$page_id=I('GET.page');
			$model=D('Pages');
			$result=$model->get_single_data(array('page_id'=>$page_id,'page_status'=>'open'));
			$result['page_content']=htmlspecialchars_decode($result['page_content']);
			$this->assign('result',$result);
			$this->display();
		}

		/*逻辑代码*/

		// 页面添加
		public function page_new_post(){
			$data=I('POST.');
			$data['time']=time();
			$data['author']=$this->user_login_id;
			$model=D('Pages');
			$result=$model->page_new($data);
			if($result)
				echo message(200,'success',$result);
			else
				echo message(303,'failed','新建页面失败');
		}
		// 页面修改
		public function page_edit_post(){
			$data=I('POST.');
			$data['time']=time();
			$data['author']=$this->user_login_id;
			$model=D('Pages');
			$result=$model->page_edit(array('page_id'=>$data['page_id']),$data);
			if($result)
				echo message(200,'success','页面内容更新成功');
			else
				echo message(303,'failed','页面更新失败');
		}
		// 页面删除
		public function page_delete(){
			$page_id=I('POST.page_id');
			$model=D('Pages');
			$result=$model->page_delete(array('page_id'=>$page_id),array('status'=>'closed'));
			if($result)
				echo message(200,'success','删除成功');
			else
				echo message(303,'failed','删除出错');
		}

	}
?>