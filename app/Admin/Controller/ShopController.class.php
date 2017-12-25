<?php
	namespace Admin\Controller;
	use Think\Controller;
	class ShopController extends BaseController{
		function __construct(){
			parent::__construct();
		}
		// 商品管理
		function goods(){
			$this->display();
		}
		// 订单管理
		function order(){
			$this->display();
		}

		// 商品添加
		function goods_add(){
			$this->display();
		}
		// 订单处理
		function order_deal(){
			$this->display();
		}
	}