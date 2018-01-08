<?php
	namespace Admin\Controller;
	use Think\Controller;
	class ShopController extends BaseController{
		private $goods;
		function __construct(){
			parent::__construct();
			$this->goods=M('w_goods');
		}
		// 商品管理
		function goods(){
			$p=I('GET.p')==''?1:I('GET.p');
			
			$list=$this->goods->field('uid,goods_name,goods_last,goods_num,pay_type,goods_price,goods_level,goods_stime,goods_status,atime')->where(array('goods_delete'=>0))->page($p,20)->order('goods_degree desc,goods_status,uid desc')->select();

			$count=$this->goods->where(array('goods_delete'=>0))->count();
			$page=new \Think\Page($count,20);
			$this->assign('list',array('list'=>$list,'page'=>$page->show()));
			$this->display();
		}
		// 删除商品
		function goods_delete(){
			$uid=I('POST.goods_uid');
			$exec=$this->goods->where(array('uid'=>$uid))->save(array('goods_delete'=>1));
			if($exec)
				echo message();
			else
				echo message(301,'error','商品删除成功');
		}
		// 商品添加
		function goods_add(){
			$data=I('POST.');
			if($data){
				$value=array(
					'goods_name'	=>$data['name'],
					'goods_num'		=>$data['number'],
					'goods_last'	=>$data['last'],
					'pay_type'		=>1,
					'goods_price'	=>$data['price'],
					'goods_img'		=>$data['images']==';'?'':$data['images'],
					'goods_intro'	=>$data['intro'],
					'goods_detail'	=>$data['detail'],
					'goods_level'	=>$data['level'],
					'goods_stime'	=>strtotime($data['sdate']),
					'goods_etime'	=>strtotime($data['edate']),
					'goods_convert'	=>$data['convert'],
					'goods_status'	=>$data['status'],
					'goods_degree'	=>$data['degree'],
					'goods_lock'	=>date('Y-m-d H:i:s',time()),
					'atime'			=>time(),
				);
				if($data['uid']){
					$exec=$this->goods->where(array('uid'=>$data['uid']))->save($value);
				}else{
					$exec=$this->goods->add($value);
				}
				if($exec)
					echo message();
				else
					echo message(301,'error','信息提交失败，请稍后再试');
			}else{
				$goods_uid=I('GET.goods_uid');
				$info=$this->goods->where(array('uid'=>$goods_uid,'goods_delete'=>0))->find();
				$this->assign('goods',$info);
				$this->display();
			}
		}

		// 订单管理
		function order(){
			$p=I('GET.p')==''?1:I('GET.p');
			$order=M('w_goods_order');
			$list=$order->field('w_goods_order.*,w_members.uname,w_goods.goods_name')->join('w_members on w_members.uid=w_goods_order.u_uid')->join('w_goods on w_goods.uid=w_goods_order.goods_id')->page($p,20)->order('order_status,order_money')->select();
			$count=$order->count();
			$page=new \Think\Page($count,20);
			$this->assign('order',array('list'=>$list,'page'=>$page->show()));
			$this->display();
		}
		// 订单处理
		function order_deal(){
			$uid=I('POST.uid');
			if($uid){
				$order=M('w_goods_order');
				$exec=$order->where(array('uid'=>$uid))->save(array('recieve_time'=>time(),'order_status'=>1));
				if($exec)
					echo message();
				else
					echo message(301,'error','信息处理失败，请稍后再试');
			}
		}
		// 图片上传
		function uploadImg(){
			parent::uploadImg('goods');
		}
	}