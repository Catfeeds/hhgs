<?php
	namespace Admin\Controller;
	use Think\Controller;
	class CarouselController extends BaseController{
		private $model;
		public function __construct(){
			parent::__construct();
			$this->model=M('carousel');
		}
		public function index(){
			$res=$this->model->select();
			$this->assign('res',$res);
			$this->display();
		}

		public function delete(){
			$uid=I('POST.id');
			$res=$this->model->where(array('id'=>$uid))->delete();
			if($res)
				echo message(200,'success');
			else
				echo message(301,'failed');
		}

		public function post(){
			$uid=I('GET.uid');
			$res=$this->model->where(array('id'=>$uid))->find();
			$this->assign('res',$res);
			$this->display();
		}

		public function post_data(){
			$data=I('POST.');
			$data['time']=time();
			if($data['uid']!=''){
				$res=$this->model->where(array('id'=>$data['uid']))->save($data);
			}else{
				$res=$this->model->add($data);
			}
			if($res)
				echo message(200,'success','提交成功');
			else
				echo message(301,'failed','提交失败');

		}

		// 图片上传处理逻辑
		public function  imgUpload(){
			parent::uploadImg('carousel');
		}
	}
?>