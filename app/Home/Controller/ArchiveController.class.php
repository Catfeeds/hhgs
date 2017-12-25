<?php
	namespace Home\Controller;
	use Think\Controller;
	class ArchiveController extends BaseController{
		public function __construct(){
			parent::__construct();
		}

		// 文章显示页面
		public function index(){
			$arc_id=I('GET.uid');
			$model=D('Archive');
			// 显示的是文章
			$field='w_post.*,user_nickname';
			$join='w_users on w_users.ID=w_post.post_author';
			$result=$model->post_single(array('w_post.ID'=>$arc_id,'post_status'=>'publish','post_type_delete'=>'open'),$field,$join);
			// 转换内容
			$result['post_content']=htmlspecialchars_decode($result['post_content']);
			// 转换时间
			$result['post_date']=$this->Bdate_format((int)$result['post_date']);
			$this->assign('archive',$result);
			// 获取分类属性
			$model=D('Relation');
			// 文章的分类
			$selected_cate=$model->get_relations(array('object_id'=>$arc_id,'tag_or_category'=>'category'));
			// 文章的标签
			$selected_tag=$model->get_relations(array('object_id'=>$arc_id,'tag_or_category'=>'tag'),'*','w_term on w_term.term_id=w_term_relationship.term_taxonomy_id');
			$this->assign('selected_cate',$selected_cate);
			$this->assign('selected_tag',$selected_tag);

			$this->display();
		}
	}
?>