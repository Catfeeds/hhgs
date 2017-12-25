<?php
	namespace Admin\Controller;
	use Think\Controller;
	class LogController extends BaseController{
		public function __construct(){
			parent::__construct();
		}
		// 文章修改日志
		public function arc_log(){
			$param=I('GET.');
			$model=D('Archive');
			// 参数拼装
			$map=array(
				'post_status'		=>'inherit',
				'w_user_level'		=>array('ELT',$this->user_level),
			);	
			$field='w_post.ID as id,post_date,post_title,post_seqencing,user_nickname as modifier,post_status,w_users.ID as userid,post_modified,post_parent';	
			$result=$model->posts_list($map,$param['p'],'','post_modified desc',$field);
			$result['list']=array_map(array(__CLASS__,'call_taxonomy'),$result['list']);
			$this->assign('result',$result);
			$this->display();
		}

		// 登录日志记录
		public function login_log(){
			$p=I('GET.p')==''?1:I('GET.p');
			$model=D('Log');
			$result=$model->get_logs($p);
			$this->assign('result',$result);
			$this->display();
		}

		// 回调函数找出对应的分类信息与标签信息
		private function call_taxonomy($param){			
			if($param){
				$id=$param['ID']!=null?$param['ID']:$param['id'];
				$model=D('Relation');
				$category=$model->get_relations(array('object_id'=>$id,'tag_or_category'=>'category'),'term_id,name,term_taxonomy','join w_term on w_term.term_id=w_term_relationship.term_taxonomy_id');
				if($category)
					$param['category']=$category;	
				// 获取
				$tags=$model->get_relations(array('object_id'=>$id,'tag_or_category'=>'tag'),'term_id,name,term_taxonomy','join w_term on w_term.term_id=w_term_relationship.term_taxonomy_id');
				if($tags)
					$param['tags']=$tags;

				$model=D('Archive');
				$re=$model->post_single(array('w_post.ID'=>$param['post_parent']),'user_nickname','w_users on w_users.ID=w_post.post_author');
				$param['post_author']=$re['user_nickname'];
			}
			return $param;
		}
	}
?>