<?php
	namespace Admin\Controller;
	use Think\Controller;
	class ServiceController extends BaseController{
		private $service;
		function __construct(){
			parent::__construct();
			$this->service=M('w_service');
		}
		function slist(){
			$list=$this->service->field('uid,name,level,area,stime,etime,atime,status,number,last_number')->select();
			$this->assign('list',$list);
			$this->display();
		}
		function service_add(){
			$suid=I('GET.suid');
			$data=I('POST.');
			
			if($data){
				$value=array(
					'name'		=>$data['name'],
					'intro'		=>$data['intro'],
					'img'		=>str_replace(';', '', $data['images']),
					'area'		=>$data['area'],
					'stime'		=>$data['stime'],
					'etime'		=>$data['etime'],
					'pay_way'	=>$data['pay_way'],
					'cost'		=>$data['cost'],
					'number'	=>$data['num'],
					'last_number'=>$data['last_num'],
					'status'	=>$data['status'],
					'score'		=>$data['score'],
					'level'		=>$data['level'],
					'detail'	=>$data['detail'],
					'atime'		=>time(),
				);
				if($data['uid']){
					$exec=$this->service->where(array('uid'=>$data['uid']))->save($value);
				}else{
					$exec=$this->service->add($value);
				}
				if($exec)
					echo message();
				else
					echo message(301,'error','数据提交失败，请稍后再试');
			}else{
				$info=$this->service->where(array('uid'=>$suid))->find();
				$this->assign('info',$info);
				$this->display();
			}
		}
		function service_order(){
			$s_order=M('w_service_order');
			$list=$s_order->field('w_service_order.*,w_service.name as sname')->order('status')->join('w_service on w_service.uid=w_service_order.service_uid')->select();
			$this->assign('list',$list);
			$this->display();
		}

		function order_deal(){
			$suid=I('POST.uid');
			$s_order=M('w_service_order');
			$exec=$s_order->where(array('uid'=>$suid))->save(array('status'=>1));
			if($exec)
				echo message();
			else
				echo message(301,'error','数据提交失败，请稍后再试');
		}

		// 图片上传
		function uploadImg(){
			parent::uploadImg('service');
		}
	}