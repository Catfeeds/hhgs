<?php
	namespace Home\Controller;
	use Think\Controller;
	class ShopCOntroller extends Controller{
		function __construct(){
			parent::__construct();
		}
		function index(){
			$this->display();
		}
		function detail(){
			$this->display();
		}
	}