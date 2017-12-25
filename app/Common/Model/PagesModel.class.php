<?php
	namespace Common\Model;
	use Think\Model;
	class PagesModel extends BaseModel{
		protected $tableName='pages';
		protected $_map=array(
			'title'		=>'page_title',
			'content'	=>'page_content',
			'time'		=>'page_time',	
			'status'	=>'page_status',
			'author'	=>'page_author',
		);
		
		// 新建页面
		public function page_new($data){
			$data=$this->create($data);
			return $this->addData($data);
		}

		// 修改页面
		public function page_edit($map,$data){
			$data=$this->create($data);
			return $this->editData($map,$data);
		}

		// 获取单条数据
		public function get_single_data($map){
			$result=$this->where($map)->find();
			return $result;
		}
		// 获取全部的数据并分页显示
		public function get_page_list($p=1,$field,$join,$map=array('page_status'=>'open'),$total=20){
			$result=$this->field($field)->join($join)->where($map)->page($p,$total)->order('page_time desc')->select();
			$count=$this->where($map)->count();
			$page=new \Think\Page($count,$total);
			$show=$page->show();
			return array('list'=>$result,'page'=>$show);
		}

		// 页面数据伪删除
		public function page_delete($map,$data){
			$data=$this->create($data);
			return $this->editData($map,$data);
		}
	}
?>