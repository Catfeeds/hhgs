<?php
	namespace Common\Model;
	use Think\Model;
	class ArchiveModel extends BaseModel{
		protected $tableName='post';
		protected $_map=array(
			'post_description'	=>'post_describe',
			'content'			=>'post_content',
			'time'				=>'post_date',
			'thumbnail'			=>'post_thumbnail',
			'sort'				=>'post_seqencing',
			'status'			=>'post_status',
		);
		// 添加文章
		public function post_new($data){
			$data=$this->create($data);
			$result=$this->addData($data);
			return $result;
		}
		// 修改文章
		public function post_edit($map,$data){
			$data=$this->create($data);
			$result=$this->editData($map,$data);
			return $result;
		}
		// 删除文章
		public function post_delete($map,$data){
			$data=$this->create($data);
			return $this->editData($map,$data);

		}
		// 查看文章列表
		// 带有分页		
		// @param map  	查询条件
		// @param p    	查询的页数
		// @param join 	join条件
		// @param sort 	查询sort的排序方式
		// @param field 查选需要返回的结果的集合
		// @param total 每页要显示的数据的条数
		public function posts_list($map,$p,$join='',$sort='',$field='*',$total=20){
			$sort=$sort==''?'post_date DESC':$sort;
			$list=$this->field($field)->join('w_users on w_users.ID=w_post.post_author')->join($join)->where($map)->page($p,$total)->order($sort)->select();
			// 分页
			$count=$this->join('w_users on w_users.ID=w_post.post_author')->join($join)->where($map)->count();
			$page=new \Think\Page($count,$total);
			$show=$page->show();
			return array('list'=>$list,'page'=>$show);
		}
		// 传递文章id查看文章
		public function post_single($map,$field='*',$join=''){
			$result=$this->field($field)->join($join)->where($map)->find();
			return $result;
		}	

		// 获取被编辑文章的原始添加用户的level
		// @param $map 接受的是文章的ID
		public function get_archive_level($map){
			$result=$this->field('w_user_level as level')->join('w_users on w_users.ID=w_post.post_author')->where($map)->find();
			return $result['level'];
		}
		// 数量查询
		public function archive_count($map){
			return $this->join('w_users on w_users.ID=w_post.post_author')->where($map)->count();
		}
	}
?>