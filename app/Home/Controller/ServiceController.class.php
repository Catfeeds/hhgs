<?php
	namespace Home\Controller;
	use Think\Controller;
	class ServiceController extends Controller{
		function __construct(){
			parent::__construct();
		}
		function index(){
			$this->display();
		}
		function order(){
			$this->display();
		}
	}