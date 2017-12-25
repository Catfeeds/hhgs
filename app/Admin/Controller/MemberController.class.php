<?php
	namespace Admin\Controller;
	use Think\Controller;
	class MemberController extends BaseController{
		private $mem;
		function __construct(){
			parent::__construct();
			$this->mem=D('Member');
		}
		// 用户列表
		function index(){
			$p=I('GET.p');
			if(!$p)
				$p=1;
			// 此处把添加的家庭成员也归类到了已注册未认证的家属里面去了
			$list=$this->mem->field('w_members.uid,uname,w_members.sex,w_members.birth,w_members.phone_num,houseinfo,is_authen,pro_consultant,rg_time,w_consultant.name as consname')->join('w_consultant on w_consultant.uid=w_members.pro_consultant','left')->page($p,20)->order('is_authen desc')->select();
			$count=$this->mem->count();
			$page=new \Think\Page($count,20);
			$this->assign('list',array('list'=>$list,'page'=>$page->show()));
			$this->display();
		}
		// 用户个人信息
		function info(){
			$uid=I('GET.uid');
			// 查询个人信息
			$info=$this->mem->field('w_members.*,w_trade.name as tradename')->where(array('w_members.uid'=>$uid))->join('w_trade on w_trade.uid=w_members.trade')->find();
			$this->assign('info',$info);
			// 查询家庭成员信息
			$family=M('w_family');
			$flist=$family->field('uname,birth,hobby,phone_num,w_relation.relation as relation,w_trade.name as tradename')->where(array('p_uid'=>$uid))->join('w_members on w_members.uid=w_family.child_uid','left')->join('w_trade on w_trade.uid=w_members.trade','left')->join('w_relation on w_relation.uid=w_family.relation')->select();
			$this->assign('flist',$flist);
			$this->display();
		}
		// 后台导入业主信息列表
		function h_list(){
			$p=I('GET.p');
			$authen=M('w_autheninfo');
			$list=$authen->field('w_autheninfo.*,w_consultant.name as cons_name')->page($p,20)->join('w_consultant on w_consultant.uid=w_autheninfo.consultant')->order('atime desc')->select();
			$count=$authen->count();
			$page=new \Think\Page($count,20);
			$this->assign('list',array('list'=>$list,'page'=>$page->show()));
			$this->display();
		}
		// 后台添加业主信息
		function h_new(){
			$data=I('POST.');
			$authen=M('w_autheninfo');
			if($data){
				$value=array(
					'name'		=>$data['name'],
					'idcard'	=>$data['idcard'],
					'phone_num'	=>$data['phone'],
					'area'		=>$data['area'],
					'houseinfo'	=>$data['houseinfo'],
					'consultant'=>$data['consultant'],
					'atime'		=>time(),
				);
				$mem=D('Member');
				$none_reg=$mem->field('uid')->where(array('phone_num'=>$value['phone_num']))->find();
				// 检测用户注册列表中是否包含已注册未认证的用户
				$flag=true;
				if($data['uid']){
					$exec=$authen->where(array('uid'=>$data['uid']))->save($value);
				}else{
					$mem->startTrans();
					if($none_reg){
						$uid=$none_reg['uid'];
						$flag=$mem->where(array('uid'=>$uid))->save(array('is_authen'=>1));
					}
					$exec=$authen->add($value);
				}
				

				
				if($flag&&$exec){
					$mem->commit();
					echo message();
				}else{
					$mem->rollback();
					echo message(301,'error','数据提交错误');
				}
			}else{
				$uid=I('GET.uid');
				$info=$authen->where(array('uid'=>$uid))->find();
				$this->assign('info',$info);
				$consultant=M('w_consultant');
				$cons=$consultant->field('uid,name')->select();
				$this->assign('consultant',$cons);
				$this->display();
			}
			
		}
	}