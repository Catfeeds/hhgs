<?php
	namespace Common\Model;
	use Think\Model;
	class WechatModel extends BaseModel{
		// 微信appid和secret
		// protected $appId='wx219d9ba495ee2030'; //wx55b01e47e4e8326a
		// protected $secret='f6496de7f27ab381f7fa2f8445393d57';//4802609d41ee21705b09bfc67f666dc6
		protected $appId='wx55b01e47e4e8326a';
		protected $secret='4802609d41ee21705b09bfc67f666dc6';
		protected $wechat=null;
		//这里需要一个单例对象
		function __construct(){
			$this->wechat=new \Org\Wechat\Jssdk($this->appId,$this->secret);
		}

		// 获取用户信息
		function get_userInfo($code){
			$info = $this->wechat->getUserInfo($code);
	        return json_decode($info);
		}

		// 发送模板消息
		function send_templeMsg($post){
			$res=$this->wechat->send_templeMsg($post);
			return $res;
		}

		// 获取分享时需要在前台显示的数据
		function get_signPackage(){
			$sign=$this->wechat->GetSignPackage();
	        return $sign;
		}
		function get_appId(){
			return $this->appId;
		}
	}
?>