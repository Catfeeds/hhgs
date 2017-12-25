<?php
	namespace Common\Model;
	use Think\Model;
	class Termsmodel extends BaseModel{
		protected $tableName='term';
		protected $_map=array(
			'termname'		=>'name',
			'termslug'		=>'slug',
			'termparent'	=>'term_group',
			'term_taxonomy'	=>'term_taxonomy'
		);
		// 添加新的分类类目|文章标签
		public function terms_new($taxonomy,$data){
			$data=$this->create($data);
			// 设置添加的分类目录的类别
			$data['term_taxonomy']=$taxonomy;
			$result=$this->addData($data);
			return $result;
		}

		// 无限极分类读取分类类目
		// param 	$term_id 		节点uid
		// param 	&$result  		返回的诗句
		// param 	$level 			分类等级
		// param 	$term_taxonomy 	分类类型(标签，分类)
		public function terms_infinitus($term_id,&$result=array(),$term_taxonomy,$level=0){
			$list=$this->where('term_group=%d and term_taxonomy="%s"',$term_id,$term_taxonomy)->select();
			static $i=0;
			$level=$level+1;
			foreach ($list as $k => $v) {
				$result[$i]=$v;
				$result[$i]['level']=$level;
				$i++;
				// 递归
				$this->terms_infinitus($v['term_id'],$result,$term_taxonomy,$level);
			}
			return $result;
		}
		// 传入id获取分类目录的信息
		public function get_term_byID($map){
			$result=$this->where($map)->find();
			return $result;
		}
		// 获取分类目录信息集合
		public function get_terms($map){
			$result=$this->where($map)->select();
			return $result;
		}
		// 分页获取分类目录的内容
		// @param 查询条件
		// @param 当前页数
		// @param 每页显示的数量
		public function get_terms_page($map,$p,$total=20){
			$result=$this->where($map)->page($p,$total)->select();
			// 分页
			$count=$this->where($map)->count();
			$page=new \Think\Page($count,$total);
			$show=$page->show();
			return array('list'=>$result,'page'=>$show);
		}
		// 传入名字获取是否存在当前tag值
		public function term_name_check($map){
			return $this->where($map)->find();
		}
		// 分类目录|标签修改
		public function terms_edit_post($map,$data){
			$data=$this->create($data);
			$result=$this->editData($map,$data);
			return $result;
		}
		// 分类删除||标签删除
		public function terms_delete($map){
			$result=$this->deleteData($map);
			return $result;
		}
	}
?>