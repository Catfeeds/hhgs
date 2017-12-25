<?php
	namespace Admin\Controller;
	use Think\Controller;
	class OptionController extends BaseController{
		public function __construct(){
			parent::__construct();
			if($this->user_level<10){
				echo '没有访问权限';
				redirect(U('/Admin/Index'));
			}
		}

		// 基本信息的显示
		public function site_basic(){
			$model=D('Option');
			$result=$model->get_data(array('option_name'=>'basic_option'));			
			if($result){
				// 反序列化数据
				$val=unserialize($result['option_value']);
				$val['code']=htmlspecialchars_decode($val['code']);
				$this->assign('id',$result['option_id']);
				$this->assign('val',$val);
			}
			$this->display();
		}
		// 微信公众号设置
		public function wechat(){
			$model=D('Option');
			$result=$model->get_data(array('option_name'=>'wechat_info'));			
			if($result){
				// 反序列化数据
				$val=unserialize($result['option_value']);
				$this->assign('id',$result['option_id']);
				$this->assign('val',$val);
			}
			$this->display();
		}
		// 文章设置	
		public function archive_set(){			
			$model=D('Option');
			$result=$model->get_data(array('option_name'=>'date_format'));
			$val=$result['option_value'];
			if($val=='hommization'){
				// 时间格式
				$this->assign('date_format',$val);
			}else{
				$date_format=explode('|',$val);
				// 时间格式
				$this->assign('date_format',$date_format);
			}
			
			// 今日时间
			$this->assign('time',time());

			$this->display();
		}

		/*----------------------------------------------------*/

		// 提交基本设置的修改内容
		public function basic_edit(){
			$data=I('POST.');			
			$option=array(
				'site_name'=>$data['name'],
				'keywords'=>$data['keywords'],
				'describe'=>$data['describe'],
				'record'=>$data['record'],
				'copyright'=>$data['copyright'],
				'code'=>$data['code'],
			);

			$id=$data['o_id'];
			// 序列化数据
			$data=serialize($option);
			// 生成对象提交数据
			$model=D('Option');
			$result=$model->edit_data(array('option_id'=>$id),array('value'=>$data,'time'=>time()));
			if($result)
				echo message(200,'success','更新成功');
			else
				echo message(303,'failed','更新失败');
		}

		// 微信后台信息更新
		public function wechat_edit(){
			$data=I('POST.');
			$option=array(
				'name1'=>$data['name1'],
				'name2'=>$data['name2'],
				'w_id'=>$data['w_id'],
				'w_type'=>$data['w_type'],
				'w_appid'=>$data['w_appid'],
				'w_secret'=>$data['w_secret'],
				'w_api'=>$data['w_api'],
				'w_token'=>$data['w_token'],
				'w_aeskey'=>$data['w_aeskey'],
			);
			$id=$data['id'];
			$data=serialize($option);
			$model=D('Option');
			$result=$model->edit_data(array('option_id'=>$id),array('value'=>$data,'time'=>time()));
			if($result)
				echo message(200,'success','更新成功');
			else
				echo message(303,'failed','更新失败');
		}

		// 时间设置
		public function arc_time(){
			$date_str=I('POST.date_str');
			$model=D('Option');
			$result=$model->edit_data(array('option_name'=>'date_format'),array('value'=>$date_str,'time'=>time()));
			if($result)
				echo message(200,'success','更新成功');
			else
				echo message(303,'failed','更新失败');
		}
	}
?>