<?php
	namespace Home\Controller;
	use Think\Controller;
	class ShopController extends Controller{
		private $goods;
		function __construct(){
			parent::__construct();
			// 这里的session获取是可以进行删除的
			// session('jianye_user_uid',00000001);
			$this->uid=session('jianye_user_uid');	
			$this->goods=M('w_goods');
		}
		function index(){
			$list=$this->goods->field('uid,goods_name,goods_last,goods_img,goods_stime,goods_etime,goods_price')->where(array('goods_delete'=>0,'goods_status'=>1,'goods_etime'=>array(array('gt',time()),'','or')))->order('goods_degree desc')->select();
			$list=array_map(array(__CLASS__,'get_thumbnail'), $list);
			$this->assign('list',$list);
			$this->display();
		}
		function detail(){
			$uid=I('GET.uid');
			$info=$this->goods->field('uid,goods_name,goods_detail,goods_price,goods_img')->where(array('uid'=>$uid,'goods_delete'=>0,'goods_status'=>1,'goods_etime'=>array(array('gt',time()),'','or')))->find();
			$img_list=explode(';',$info['goods_img']);
			$info['thumbnail']=array_shift($img_list);
			$this->assign('info',$info);
			$this->display();
		}
		function order(){
			$uid=I('GET.uid');
			$post=I('POST.');
			// 获取商品信息
			$goods_info=$this->goods->field('uid,goods_name,goods_intro,pay_type,goods_price,goods_img,goods_last,goods_level,goods_stime,goods_etime,goods_convert,goods_status,goods_delete,goods_lock')->where(array('uid'=>$uid))->find();
			// 提取缩略图
			$img_list=explode(';',$goods_info['goods_img']);
			$goods_info['thumbnail']=$img_list[0];
			// 用户信息
			$mem_info=D('Member')->field('w_members.uid,uname,phone_num,level,score')->where(array('w_members.uid'=>$this->uid))->join('w_grade on w_grade.u_uid=w_members.uid','left')->find();
			// ,'goods_delete'=>0,'goods_status'=>1,'goods_etime'=>array(array('gt',time()),'','or')
			// 商品自身不能兑换状态判断
			if($goods_info['goods_delete']==1)
				$msg='您兑换的商品不存在';				
			else if($goods_info['goods_status']==2)
				$msg='您兑换的商品已下架';
			else if(($goods_info['goods_etime']<time())&&$goods_info['goods_etime']!='')
				$msg='商品限时兑换已结束';
			// 提示信息输出
			if($msg){
				if($post)
					echo message(301,'notice',$msg);
				else
					redirect(U('Home/Shop/index'),1,$this->unotice($msg.'，返回列表中'));
			}
			if($post){
				// 库存判断
				if($goods_info['goods_last']>0){
					// 等级判断
					$ulevel=$this->get_level($mem_info['level']);
					if($goods_info['goods_level']<=$ulevel){
						// 兑换数量判断
						$order=M('w_goods_order');
						$sum=$order->where(array('u_uid'=>$this->uid,'goods_uid'=>$goods_info['uid']))->sum('order_num');
						$last=$goods_info['goods_convert']-$sum-$post['number'];
						if($last>=0){
							// 积分判断
							$cost=$post['number']*$goods_info['goods_price'];
							if($mem_info['score']>=$cost){
								// 乐观锁判断数据是否已被更新
								// 查询最新的乐观锁数值
								$lock=$this->goods->field('goods_lock')->where(array('uid'=>$uid))->find();
								if($goods_info['goods_lock']==$lock['goods_lock']){
									$order->startTrans();
									// 成功的话插入订单表
									$order_data=array(
										'u_uid'			=>$this->uid,
										'order_id'		=>date('YmdHis',time()).rand(1,99),
										'goods_id'		=>$goods_info['uid'],
										'order_money'	=>$cost,
										'order_num'		=>$post['number'],
										'pay_time'		=>time(),
										'uname'			=>$post['name'],
										'phone_num'		=>$post['phone_num'],
										'order_remarks'	=>$post['remarks'],
									);
									$exec1=$order->add($order_data);
									// 更新积分
									$grade=M('w_grade')->where(array('u_uid'=>$this->uid))->setDec('score',$cost);
									// 更新积分记录
									$growth=M('w_growth')->add(array('u_uid'=>$this->uid,'type'=>1,'of'=>5,'number'=>$cost,'inc_dec'=>2));
									// 减少库存更新乐观锁
									$g=$this->goods->where(array('uid'=>$goods_info['uid']))->setInc('goods_last',$post['number']);
									$l=$gl=$this->goods->where(array('uid'=>$goods_info['uid']))->save(array('goods_lock',date('Y-m-d H:i:s',time())));
									if($exec1&&$grade&&$growth&&$g&&$l){
										$order->commit();
										echo message(200,'success','兑换成功');
									}else{
										$order->rollback();
										echo message(307,'error','兑换失败，请稍后再试');
									}
								}else
									echo message(306,'notice','系统繁忙请稍后再试'); 
							}else
								echo message(305,'notice','积分不足，您最多可兑换'.floor($mem_info['score']/$goods_info['goods_price']).'个此商品');							
						}else
							echo message(303,'notice','此商品您已兑换过'.$sum.'次，还剩'.($goods_info['goods_convert']-$sum).'次兑换机会');					
					}else
						echo message(302,'notice','您的等级不足，无法兑换此商品');
				}else
					echo message(304,'notice','库存不足');	

			}else{
				$this->assign('goods_info',$goods_info);
				$this->assign('mem_info',$mem_info);
				$this->display();
			}	
		}

		// 从成长值计算用户的等级
		private function get_level($level){
			switch ($level) {
				case $level>0&&$level<49:
					$lv=1;
					break;
				case $level>49&&$level<99:
					$lv=2;
					break;
				case $level>99&&$level<199:
					$lv=3;
					break;
				case $level>199&&$level<299:
					$lv=4;
					break;
				case $level>299&&$level<499:
					$lv=5;
					break;
				case $level>49:
					$lv=6;
					break;
				default:
					$lv=0;
					break;
			}
			return $lv;
		}
		// 错误提示信息跳转回列表
		private function unotice($msg){
			$notice=sprintf('<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0"><div style="font-family:微软雅黑;width:100%%;padding:65px 0;line-height:2;margin:200px auto;text-align:center;">%s</div>',$msg);
			return $notice;
		}
		// 将图片列表的首张图片作为缩略图提取
		private function get_thumbnail($p){
			if($p){
				$img_list=$p['goods_img'];
				$img_arr=explode(';', $img_list);
				$thumbnail='';
				foreach ($img_arr as  $value) {
					if($value!='')
						$thumbnail=$value;
				}
				$p['thumbnail']=$thumbnail;
			}
			return $p;
		}
	}