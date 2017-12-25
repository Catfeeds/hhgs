<?php
	namespace Admin\Controller;
	use Think\Controller;
	class ArchiveController extends BaseController{
		// 当前文章的编辑者的level
		public function __construct(){
			parent::__construct();
			date_default_timezone_set('prc');
		}
		// 发布新文章
		public function post_new(){
			$model=D('Terms');
			// 无限极分类获取分类数据
			$categorys=$model->terms_infinitus(0,$result,'category');
			$this->assign('category',$categorys);

			// 获取标签列表
			$tags=$model->get_terms(array('term_taxonomy'=>'post_tag'));
			$this->assign('tags',$tags);

			$this->display();
		}
		// 文章列表
		public function post_list(){
			// 查询条件
			$param=I('GET.');
			// 一些默认的参数的设置

			// 需要显示的数据
			// $field='w_post.ID as id,post_date,post_content,post_title,post_describe,post_thumbnail,post_seqencing,user_nickname,post_status,w_users.ID as userid';
			$field='w_post.ID as id,post_date,post_title,post_seqencing,user_nickname,post_status,w_users.ID as userid';
			// 参数拼装
			$map=array(
				'post_type_delete'	=>$param['type']==''?'open':$param['type'],
				'w_user_level'		=>array('ELT',$this->user_level),
			);
			// 排序----order参数
			if($param['sort']=='')
				$sort='';
			else
				$sort=$param['sort']=='asc'?'post_seqencing asc':'post_seqencing desc';
			//作者
			if($param['author']!='')
				$map['post_author']=$param['author'];
			// 分类
			$join='';
			if($param['cate']!=''){
				$join='w_term_relationship on w_term_relationship.object_id=w_post.ID';
				$map['term_taxonomy_id']=$param['cate'];
				$map['tag_or_category']='category';
			}
			// 标签
			if($param['tag']!=''){
				$join='w_term_relationship on w_term_relationship.object_id=w_post.ID';
				$map['term_taxonomy_id']=$param['tag'];
				$map['tag_or_category']='tag';
			}

			// 文章的状态查询
			if($param['status']=='')
				$map['post_status']=array('NEQ','inherit');
			else if($param['status']=='draft')
				$map['post_status']=$param['status'];
			else if($param['status']=='publish')
				$map['post_status']='publish';
			else
				$map['post_status']='';


			// 查询对象
			$model=D('Archive');			
			$result=$model->posts_list($map,$param['p'],$join,$sort,$field);
			$result['list']=array_map(array(__CLASS__,'call_taxonomy'),$result['list']);			
			$this->assign('result',$result);


			// 查询发布的文章的数量
			$this->assign('archive_num',$this->get_tax_num($model));


			// 无限极分类获取分类数据
			$terms_model=D('Terms');
			$terms=$terms_model->terms_infinitus(0,$terms,'category');
			$this->assign('category',$terms);

			$this->display();
		}

		// 文章修改
		public function post_edit(){
			$aid=I('GET.aid');


			/*获取文章的基本信息*/
			$model=D('Archive');
			$result=$model->post_single(array('w_post.ID'=>$aid,'post_status'=>array('NEQ','inherit')),'w_post.*,w_user_level','w_users on w_users.ID=w_post.post_author');
			$result['post_content']=htmlspecialchars_decode($result['post_content']);
			// 权限控制
			$this_level=$result['w_user_level'];
			if($this_level<=$this->user_level)
				$this->assign('result',$result);
			/*获取文章的基本信息*/


			/*获取文章的所属分类和标签*/
			$model=D('Relation');
			// 文章的分类
			$selected_cate=$model->get_relations(array('object_id'=>$aid,'tag_or_category'=>'category'));
			// 文章的标签
			$selected_tag=$model->get_relations(array('object_id'=>$aid,'tag_or_category'=>'tag'),'*','w_term on w_term.term_id=w_term_relationship.term_taxonomy_id');
			$this->assign('selected_cate',$selected_cate);
			$this->assign('selected_tag',$selected_tag);
			/*获取文章的所属分类和标签*/


			/*文章中分类与标签需要显示的要选择的内容*/
			// 选项内容
			$model=D('Terms');
			// 无限极分类获取分类数据
			$categorys=$model->terms_infinitus(0,$r,'category');
			$this->assign('category',$categorys);

			// 获取所有标签列表
			$tags=$model->get_terms(array('term_taxonomy'=>'post_tag'));
			$this->assign('tags',$tags);
			/*文章中分类与标签需要显示的要选择的内容*/

			$this->display();
		}

		// 分类管理
		public function category(){
			$model=D('Terms');
			// 无限极分类获取分类数据
			$result=$model->terms_infinitus(0,$result,'category');
			$this->assign('category',$result);
			$this->display();
		}
		// 分类目录修改
		public function category_edit(){
			$model=D('Terms');
			// 无限极分类获取分类数据
			$result=$model->terms_infinitus(0,$result,'category');
			// 传入term_id获取分类数据
			$term_id=I('GET.tag_id');
			$term_info=$model->get_term_byID(array('term_id'=>$term_id,'term_taxonomy'=>'category'));
			$this->assign('term_info',$term_info);
			$this->assign('category',$result);
			$this->display();
		}

		// 标签管理
		public function tags(){
			$p=I('GET.p')!=''?$p:1;
			$model=D('Terms');
			
			$result=$model->get_terms_page(array('term_taxonomy'=>'post_tag'),$p,20);
			$this->assign('tags',$result['list']);
			$this->assign('page',$result['page']);
			$this->display();
		}

		// 标签修改
		public function tags_edit(){
			$model=D('Terms');		
			// 传入term_id获取分类数据
			$term_id=I('GET.tag_id');
			$term_info=$model->get_term_byID(array('term_id'=>$term_id,'term_taxonomy'=>'post_tag'));
			$this->assign('term_info',$term_info);
			$this->display();
		}
		
		// 回收站
		public function trash(){
			$p=I('GET.p');
			$field='w_post.ID as id,post_date,post_content,post_title,post_describe,post_thumbnail,post_seqencing,user_nickname,post_status,w_users.ID as userid';
			// 查询对象
			$model=D('Archive');			
			$result=$model->posts_list(
				array(
					'post_type_delete'=>'closed',
					'w_user_level'=>array('ELT',$this->user_level),
				),
				$p,
				'',
				'',
				$field
			);
			$result['list']=array_map(array(__CLASS__,'call_taxonomy'),$result['list']);			
			$this->assign('result',$result);
			$this->display();
		}

		// 文章预览
		public function post_view(){
			if($this->user_login_id=='')
				return;
			$aid=I('GET.aid');
			$model=D('Archive');
			$result=$model->post_single(array('w_post.ID'=>$aid));
			$result['post_content']=htmlspecialchars_decode($result['post_content']);
			$this->assign('result',$result);
			$this->display();
		}





		/*数据逻辑操作*/
		
		// 分类类目添加
		// 添加去重操作
		public function terms_new(){
			$data=I('POST.');
			$model=D('Terms');
			// 检测是否存在相同的别名
			$is_exist=$model->term_name_check(array('slug'=>$data['termslug'],'term_taxonomy'=>'category'));
			if($is_exist)
				echo message(404,'category exists','分类目录别名已存在');
			else{
				$result=$model->terms_new('category',$data);
				if($result)
					echo message(200,'success','新分类目录添加成功');
				else
					echo message(301,'failed','分类目录添加失败');
			}
		}
		// 文章标签添加
		// 已添加去重检测
		public function tags_new(){
			$data=I('POST.');
			$model=D('Terms');
			$is_exist=$model->term_name_check(array('slug'=>$data['termslug'],'term_taxonomy'=>'post_tag'));
			if($is_exist)
				echo message(404,'tags exists','标签别名已存在');
			else{
				$result=$model->terms_new('post_tag',$data);
				if($result){
					// 用于文章编辑过程中对于标签的实时添加的返回结果
					if($data['type']=='a_add')
						echo message(200,'success',$result);
					else
						echo message(200,'success','新标签添加成功');
				}
				else
					echo message(301,'failed','标签添加失败');
			}
		}

		// 删除分类类目|标签
		public function terms_delete(){
			$term_id=I('POST.term_id');
			$result=$this->t_delete($term_id);
			if($result)
				echo message(200,'success','删除节点成功');
			else
				echo message(301,'failed','删除分类类目失败');
		}
		// 标签的删除
		public function tags_delete(){
			// 获取所有
			$tags_id=I('POST.term_id');
			$model=D('Terms');
			// 删除
			if(is_array($tags_id)){
				$flag=true;
				$model->startTrans();
				for($i=0;$i<count($tags_id);$i++){
					$result=$model->terms_delete(array('term_id'=>$tags_id[$i]));
					if(!$result){
						$flag=false;
						break;
					}
				}
				if($flag)
					$model->commit();
				else
					$model->rollback();
			}else
				$result=$model->terms_delete(array('term_id'=>$tags_id));
			//输出结果 检测与返回
			if($flag||$result)
				echo message(200,'success','标签删除成功');
			else
				echo message(301,'failed','标签删除失败');
		}

		// 删除多选的分类目录菜单
		public function terms_delete_selected(){
			$term_ids=I('POST.term_id');
			$counter=0;
			for($i=0;$i<count($term_ids);$i++){
				$result=$this->t_delete($term_ids[$i]);
				if(!$result)
					break;
				$counter++;
			}
			if($counter==count($term_ids))
				echo message(200,'success','删除成功');
			else
				echo message(405,'part success','部分分类目录删除成功');
		}
		// 独立出来的分类目录删除的操作
		private function t_delete($term_id){
			// 默认分类不可进行删除
			if($term_id==1){
				echo message(403,'can not deleted','默认分类不能删除');
			}else{
				// 完成后输出内容
				$model=D('Terms');

				// 获取要删除的类目的节点信息
				$parentNode=$model->get_term_byID(array('term_id'=>$term_id));

				// 开启事务
				$model->startTrans();				
				// step1若此分类下有子节点将子节点的父节点设置为此节点的parent
				$node=$model->get_terms(array('term_group'=>$term_id));
				if($node){	
					$data['term_group']=$parentNode['term_group'];
					$removeNode=$model->terms_edit_post(array('term_group'=>$term_id),$data);
				}else
					$removeNode=true;

				// step2删除分类目录
				$deleted=$model->terms_delete(array('term_id'=>$term_id));

				// step3设置此分类下的文章的归属为默认
				$model=D('Relation');
				// 先判断是否有文章
				$exist=$model->get_relations(array('term_taxonomy_id'=>$parentNode['term_id']));
				if($exist){
					// 将所属分类下的文章的分类还原为默认分类
					$d['term_taxonomy_id']=1;
					$reset_taxonoy=$model->relation_edit(array('term_taxonomy_id'=>$parentNode['term_id']),$d);
				}else
					$reset_taxonoy=true;
				// 事务提交处理
				if($deleted&&$removeNode&&$reset_taxonoy){
					$model->commit();
					return true;
				}
				else{
					$model->rollback();
					return false;
				}
			}
		}


		// 编辑分类目录
		public function terms_edit_post(){
			$data=I('POST.');
			$model=D('Terms');
			// 检测是否存在相同的别名
			$is_exist=$model->term_name_check(array('slug'=>$data['termslug'],'term_taxonomy'=>'category'));
			if($is_exist)
				echo message(404,'category exists','分类目录别名已存在');
			else{
				$result=$model->terms_edit_post(array('term_taxonomy'=>'category','term_id'=>$data['tag_id']),$data);
				if($result)
					echo message(200,'success','更新成功');
				else
					echo message(301,'failed','更新失败');
			}
		}

		// 编辑标签
		public function tags_edit_post(){
			$data=I('POST.');
			$model=D('Terms');
			$is_exist=$model->term_name_check(array('slug'=>$data['termslug'],'term_id'=>array('NEQ',$data['tag_id']),'term_taxonomy'=>'post_tag'));
			if($is_exist)
				echo message(404,'tags exists','标签名称已存在');
			else{
				$result=$model->terms_edit_post(array('term_taxonomy'=>'post_tag','term_id'=>$data['tag_id']),$data);
				if($result)
					echo message(200,'success','更新成功');
				else
					echo message(301,'failed','更新失败');
			}
		}
		// 缩略图上传
		public function uploadImg(){
			parent::uploadImg();
		}

		// 文章添加
		public function post_new_post(){
			$data=I('POST.');
			// 前台数据的再次确认判断
			if($data['post_title']=='')
				echo message(409,'none title','标题不能为空');
			else if($data['content']=='')
				echo message(408,'none content','内容不能为空');
			else{
				$model=D('Archive');
				$data=$this->post_filter($data);
				// 开启事务处理
				$model->startTrans();
				//文章添加
				$post=$model->post_new($data);
				// 重新创建relationship的对象
				$model=D('Relation');
				// 标签添加到relationship				
				$tag_flag=true;
				foreach($data['tags'] as $val) { 
					$re=array(
						'object_id'			=>$post,
						'term_taxonomy_id'	=>$val,
						'tag_or_category'	=>'tag'
					);
					$tag_flag=$model->add_relationship($re);
					if(!$tag_flag)
						break;
				}
				// 分类添加到relationship
				$cate_flag=true;
				foreach($data['category'] as $val) { 
					$re=array(
						'object_id'			=>$post,
						'term_taxonomy_id'	=>$val,
						'tag_or_category'	=>'category'
					);
					$cate_flag=$model->add_relationship($re);
					if(!$cate_flag)
						break;
				}
				// 事务提交或回滚
				if($post&&$tag_flag&&$cate_flag){
					$model->commit();
					echo message(200,'success',array('aid'=>$post,'tips'=>'文章发布成功'));
				}else{
					$model->rollback();
					echo message(301,'failed','文章发布失败');
				}
			}
		}
		// 文章修改
		public function post_edit_post(){
			$data=I('POST.');			
			$id=$data['post_id'];
			// 获取修改权限
			$model=D('Archive');
			// 当前文章的撰写者的等级
			$this_level=$model->get_archive_level(array('w_post.ID'=>$id));
			// 获取当前文章内容用于插入到记录里面去
			$old_art=$model->post_single(array('ID'=>$id));
			// 权限的检测
			if($this_level=$this->user_level){
				// 前台数据的再次确认判断
				if($data['post_title']=='')
					echo message(409,'none title','标题不能为空');
				else if($data['content']=='')
					echo message(408,'none content','内容不能为空');
				else{
					// 开启事务
					$model->startTrans();

					
					// 文章本身的修改update
						//过滤数据
					$data=$this->post_filter($data);
						// 文章修改时间
					$data['post_modified']=time();
					$result=$model->post_edit(array('ID'=>$id),$data);


					// 添加修改的历史记录
					$old_art['post_status']='inherit';
					$old_art['post_parent']=$id;
					$old_art['post_modified']=time();
					$record=$model->post_new($old_art);


					// 删除旧的标签和分类
					$model=D('Relation');
					$new_cate=$data['category'];
						//删除旧的数据-删除的数据包括分类与标签
					$del=$model->delete_relation(array('object_id'=>$id));

					// 插入新的数据	标签和分类数据					
						// 标签的变更
					$tag_flag=true;
					foreach($data['tags'] as $val) { 
						$re=array(
							'object_id'			=>$id,
							'term_taxonomy_id'	=>$val,
							'tag_or_category'	=>'tag'
						);
						$tag_flag=$model->add_relationship($re);
						if(!$tag_flag)
							break;
					}
						// 分类栏目的变更
					$cate_flag=true;
					foreach($data['category'] as $val) { 
						$re=array(
							'object_id'			=>$id,
							'term_taxonomy_id'	=>$val,
							'tag_or_category'	=>'category'
						);
						$cate_flag=$model->add_relationship($re);
						if(!$cate_flag)
							break;
					}


					
					// 事务的提交
					if($result&&$del&&$tag_flag&&$cate_flag&&$record){
						$model->commit();
						echo message(200,'success','更新成功');
					}else{
						$model->rollback();
						echo message(303,'failed','更新失败');
					}
				}
			}else
				echo message('407','no permossion','当前账户没有对此文章的修改权限');
		}
		// 文章内容的批量删除
		public function post_delete_selected(){
			$aids=I('POST.aids');
			$model=D('Archive');
			$model->startTrans();
			foreach ($aids as $val) {
				$art=$model->post_single(array('w_post.ID'=>$val),'w_user_level','w_users on w_post.post_author=w_users.ID');
				if($art['w_user_level']<=$this->user_level){
					$result=$model->post_delete(array('ID'=>$val),array('post_type_delete'=>'closed','post_modified'=>time()));
					if(!$result)
						break;
				}else{
					$result='error';
					break;
				}
			}
			if($result){
				$model->commit();
				echo message(200,'success','移除成功');
			}else{
				$model->rollback();
				if($result=='error')
					echo message(304,'failed','没有移除权限');
				else
					echo message(303,'failed','移除失败');
			}	
		}
		// 文章删除
		public function post_delete(){
			$aid=I('POST.aid');
			$model=D('Archive');
			$art=$model->post_single(array('w_post.ID'=>$aid),'w_user_level','w_users on w_post.post_author=w_users.ID');
			if($art['w_user_level']<=$this->user_level){
				$result=$model->post_delete(array('ID'=>$aid),array('post_type_delete'=>'closed','post_modified'=>time()));
				if($result)
					echo message(200,'success','移除成功');
				else
					echo message(303,'failed','移除失败');
			}else
				echo message(404,'no permission','无权限进行操作');
			
		}

		// 文章提交数据过滤器
		private function post_filter(&$data,$sub_index=100){
			// 防呆处理
			// 分类为空设置分类为默认
			if(count($data['category'])<1){
				$data['category']=array('1');
			}
			// 描述内容为空提取描述内容
			if($data['post_description']==''){
				$data['post_description']=mb_substr(strip_tags(htmlspecialchars_decode($data['content'])),0,$sub_index,'UTF-8');
			}
			// 排序
			if(empty($data['sort'])||$data['sort']=='')
				$data['sort']=0;

			// 时间
			if($data['time']=='')
				$data['time']=time();
			// 消除富文本编辑器的转义符号-‘/’
			if(get_magic_quotes_gpc())
				$data['content']=stripslashes($data['content']);
			// 发布人||修改人
			$data['post_author']=$this->user_login_id;
			return $data;
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
			}
			return $param;
		}
		// 查询函数-分类目录中数量的查询
		private function get_tax_num($model){
			$publish=$model->archive_count(array('post_type_delete'=>'open','post_status'=>'publish','w_user_level'=>array('ELT',$this->user_level),));
			$draft=$model->archive_count(array('post_type_delete'=>'open','post_status'=>'draft','w_user_level'=>array('ELT',$this->user_level),));
			$del=$model->archive_count(array('post_type_delete'=>'closed','w_user_level'=>array('ELT',$this->user_level),));
			return array(
				'publish'=>$publish,
				'draft'=>$draft,
				'all'=>$publish+$draft,
				'del'=>$del,
			);
		}
	}
?>