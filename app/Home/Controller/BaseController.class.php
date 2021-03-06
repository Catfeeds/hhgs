<?php
	namespace Home\Controller;
	use Think\Controller;
	class BaseController extends Controller{
		// 无需进行跳转的页面
		protected $unlimit=array('login','get_smscode');
		protected $we_model=null;
		protected $uid='';
		public function __construct(){
			parent::__construct();
			$this->uid=session('jianye_user_uid');

			// 查询下是否存在当前session中的用户
			$mem=D('Member');
			$is_reg=$mem->where(array('uid'=>$this->uid))->count();
			if($is_reg<=0)
				session('jianye_user_uid',null);

			$openid=session('temp_openid');
			// 微信相关操作model
			$this->we_model=D('Wechat');
			if(!($this->uid||$openid))
				$this->wechat_request();
			else if($openid)
				$this->is_bindInfo($openid);

		}

		// 将所有有需要的页面现在只能在微信中打开并且需要获得微信的授权
		private function wechat_request($scope='snsapi_userinfo'){
			$code=I('GET.code');
			$uid=$this->uid;			
			if($code){
				$user_info=$this->we_model->get_userInfo($code);
				if(!$user_info->errcode){
					$this->is_bindInfo($user_info->openid,$user_info->headimgurl);
				}else{
					$this->we_oauth($scope);	
				}
			}else if(!$uid){
				$this->we_oauth($scope);		
			}			
		}
		// 微信OAuth2.0认证授权跳转链接
		private function we_oauth($scope){
			$user_link='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			redirect(sprintf('https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=%s&state=STATE#wechat_redirect',$this->we_model->get_appId(),urlencode($user_link),$scope));	
		}
		// 查看是否已绑定手机号码
		private function is_bindInfo($openid,$headimg=''){
			$mem=D('Member');
			$info=$mem->ufind(array('openid'=>$openid),'uid,openid,uname,phone_num');
			if($info['phone_num']&&$info['uname'])
				session('jianye_user_uid',$info['uid']);
			else{
				session('temp_openid',$openid);
				session('temp_headimg',$headimg);
				if(!in_array(ACTION_NAME, $this->unlimit)){
					$user_link=CONTROLLER_NAME.'_'.ACTION_NAME;
					redirect(U('Member/login?refer='.$user_link));
				}
			}
		}

		// 时间格式转换
		public function Bdate_format($date){
			$model=D('Option');
			$result=$model->get_data(array('option_name'=>'date_format'));
			$date_type=$result['option_value'];
			$return_date='';
			if($date_type=='hommization'){
				//这里输出的是人性化的时间格式的转换结果 
				 $object=new \Org\Util\Date();
				 $return_date=$object->timeDiff($date);
			}else{
				$date_array=explode('|',$date_type);
				$return_date=date($date_array[0].' '.$date_array[1],$date);
			}
			return $return_date;
		}

		// 积分与经验值增加
		// param  $of 积分获取方式
		// param  $level 经验值
		// param  $score 积分值
		// param  $INC_DEC 积分值是增加还是减少
		function degree_grade($of,$level,$score,$INC_DEC='INC'){
			// 执行积分和经验记录的增加
			if($INC_DEC=='INC')
				$inc_dec=1;
			else
				$inc_dec=2;
			$growth=D('Growth');
			$l=$growth->add(array('u_uid'=>$this->uid,'type'=>2,'of'=>$of,'number'=>$level,'inc_dec'=>$inc_dec));
			$s=$growth->add(array('u_uid'=>$this->uid,'type'=>1,'of'=>$of,'number'=>$score,'inc_dec'=>$inc_dec));

			// 更新总积分与经验值
			$grade=D('Grade');
			$g=$grade->add_sl($this->uid,$score,$level,$INC_DEC);
			
			return $l&&$s&&$g;		
		}
	}
?>