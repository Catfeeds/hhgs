<?php
	namespace Home\Controller;
	use Think\Controller;
	class MemberController extends BaseController{
		protected $mem=null;
		protected $uid;
		private   $profilecount=13; //信息完善的总字段数量
		private   $memcount=5; //家庭成员添加数量
		function __construct(){
			parent::__construct();
			$this->mem=D('Member');
		}
		// 用户登录
		function login(){
			$data=I('POST.');
			if($data){
				$openid=session('temp_openid');
				$code=session('login_valicode');
				$headimg=session('temp_headimg');
				// 判断验证码是否正确
				if($data['code']==$code){
					// 和业主认证表进行对比进行认证
					$authen=D('Authen');
					$ainfo=$authen->ufind(array('phone_num'=>$data['tel']));
					// 新成员数组
					$new_mem=array(
						'openid'=>$openid,
						'headimg'=>$headimg,
						'uname'	=>$data['name'],
						'phone_num'=>$data['tel'],
						'is_authen'=>0,
						'rg_time'=>time()
					);
					// 若认证信息存在补充认证信息到用户表中并标记为认证业主
					if(($ainfo['phone_num']==$data['tel'])&&($ainfo['name']==$data['name'])){
						$new_mem['uname']=$ainfo['name'];
						$new_mem['birth']=$ainfo['birth'];
						$new_mem['id_card']=$ainfo['id_card'];
						$new_mem['area']=$ainfo['area'];
						$new_mem['houseinfo']=$ainfo['houseinfo'];
						$new_mem['pro_consultant']=$ainfo['consultant'];
						$new_mem['is_authen']=1;
					}

					// 对比新用户手机号码是否存在member表中
					$is_mem=$this->mem->where(array('phone_num'=>$data['tel']))->count();
					if($is_mem)
						// 已经存在
						$uid=$this->mem->usave(array('phone_num'=>$data['tel']),$new_mem);
					else
						$uid=$this->mem->uadd($new_mem);

					// 注册成功设定登录状态成功，并跳转回登录前页面
					if($uid){
						session('jianye_user_uid',$uid);
						// 登录成功跳回之前页面
						$refer=explode('_', I('GET.refer'));
						echo message(200,'success',json_encode($refer));
					}					
				}else{
					echo message('401','notice','验证码错误');
				}
			}else	
				$this->display();
		}
		// 用户个人中心
		function profile(){
			$mem=D('Member');
			
			$info=$mem->ufind(array('w_members.uid'=>$this->uid),'uname,is_authen,headimg,level,score','left join w_grade on w_grade.u_uid=w_members.uid');
			if($info){
				if($info['level']<50)
					$info['lv']=1;
				elseif($info['level']>=50&&$info['level']<100)
					$info['lv']=2;
				elseif($info['level']>=100&&$info['level']<200)
					$info['lv']=3;
				elseif($info['level']>=200&&$info['level']<300)
					$info['lv']=4;
				elseif($info['level']>=300&&$info['level']<500)
					$info['lv']=5;
				elseif($info['level']>=500)
					$info['lv']=6;
				$this->assign('info',$info);
			}
			$this->display();
		}
		// 个人信息编辑
		function profile_edit(){
			$data=I('POST.');
			$mem=D('Member');
			$info=$mem->ufind(array('w_members.uid'=>$this->uid),'w_members.*,w_consultant.name as cons_name','w_consultant on w_consultant.uid=w_members.pro_consultant');
			if($data){
				$value=array(
					'sex'				=>$data['sex'],
					'birth'				=>strtotime($data['birth']),
					'phone_num'			=>$data['phone'],
					'marital_status'	=>$data['marry'],
					'address'			=>$data['addr'],
					'trade'				=>$data['trade'],
					'job'				=>$data['job'],
					'residence'			=>$data['residence'],
					'hobby'				=>$data['hobby'],
					'buy_reason'		=>$data['reason'],
					'buy_times'			=>$data['times'],
					'car_amount'		=>$data['car'],
					'car_brand'			=>$data['carbrand'],
				);
				$mem->startTrans();
				
				// 添加积分和经验值
				// 正待提交的完成度
				$ndegree=$this->array_empty_count($value); //新添加的数据的完整度
				// 数据库中的完成度
				$odegree=$info['degree'];
				$exec2=true;				

				if($ndegree>$odegree){
					// 获取完善单个字段时增加的积分与经验值
					$sl=M('w_slnumber')->where(array('uid'=>1))->find();
					$level=$sl['lnumber']*($ndegree-$odegree)*($this->profilecount);
					$score=$sl['snumber']*($ndegree-$odegree)*($this->profilecount);
					if($ndegree==1)
						$score+=100;
					$exec2=$this->degree_grade(1,$level,$score);
					// 更新完成度
					$value['degree']=$ndegree;
				}


				// 保存成员信息
				$exec1=$mem->usave(array('uid'=>$this->uid),$value);
				//数据提交与结果返回
				$exec=$exec1&&$exec2;
				if($exec){
					$mem->commit();
					echo message();  
				}
				else{
					$mem->rollback();
					echo message(301,'error','服务异常，请稍后再试');
				}
			}else{				
				$this->assign('info',$info);
				// 此处显示完成度
				$completion_degree=$this->array_empty_count($info);
				$this->assign('completion',floor($completion_degree*100));
				// 行业信息显示
				$trade=M('w_trade')->select();
				$this->assign('trade',$trade);
				// 获取完善单个字段时增加的积分与经验值
				$sl=M('w_slnumber')->where(array('uid'=>1))->find();
				$this->assign('score',$sl['snumber']*$this->profilecount);
				$this->display();
			}
		}
		// 家庭成员管理
		function family(){
			$family=M('w_family');
			$mem=D('Member');
			$is_authen=$mem->ufind(array('uid'=>$this->uid),'is_authen');
			// 是业主的话显示添加按钮
			if($is_authen['is_authen']){
				$puid=$this->uid;
				$this->assign('hide',false);
				
			}else{
				$puid_arr=$family->field('p_uid')->where(array('child_uid'=>$this->uid))->find();
				if($puid_arr)
					$puid=$puid_arr['p_uid'];
				else
					$puid=NULL;
				$this->assign('hide',true);
			}
			$info_list=$family->where(array('w_family.p_uid'=>$puid,'is_authen'=>0))->field('w_members.uid,uname,sex,birth,phone_num,headimg,w_relation.relation')->join('join w_members on w_family.child_uid=w_members.uid')->join('join w_relation on w_family.relation=w_relation.uid')->select();
			if($info_list)
				$this->assign('list',$info_list);
			$this->display();
		}
		// 家庭成员编辑
		function family_mem(){
			$data=I('POST.');
			// 编辑时获取到id
			$memid=I('GET.memid');
			$mem=D('Member');
			if($data){
				// 是否为业主信息判断
				$is_authen=$mem->ufind(array('uid'=>$this->uid),'is_authen');
				if($is_authen['is_authen']){
					// 数据封装
					$value=array(
						'uname'			=>$data['name'],
						'phone_num'		=>$data['phone'],
						'sex'			=>$this->mem_sex($data['relation']),
						'birth'			=>strtotime($data['birth']),
						'hobby'			=>$data['hobby'],
						'trade'			=>$data['trade'],						
					);
					// 家庭关系数据操作对象
					$family=M('w_family');
					if($memid){	//修改
						$puid=$family->where(array('child_uid'=>$memid))->find();
						if($puid['p_uid']==$this->uid){
							$mem->startTrans();
							$exec1=$mem->usave(array('uid'=>$memid),$value);
							$exec2=$family->where(array('p_uid'=>$this->uid,'child_uid'=>$memid))->save(array('relation'=>$data['relation'],'a_time'=>time()));
							$exec=$exec1&&$exec2;
							if($exec)
								$mem->commit();
							else
								$mem->rollback();
						}
					}else{	//添加
						$value['rg_time']=time();
						// 判断是否超过5个成员的限制	
						$fnum=$family->where(array('p_uid'=>$this->uid,'is_authen'=>0))->join('w_members on w_family.child_uid=w_members.uid')->count();
						if($fnum<$this->memcount){					
							$mem->startTrans();
							// 添加个人信息与关系
							$exec1=$mem->uadd($value);
							$exec2=$family->add(array('p_uid'=>$this->uid,'child_uid'=>$exec1,'relation'=>$data['relation'],'a_time'=>time()));

							// 添加经验值与积分
							// 家庭成员添加获取积分的次数
							$exec3=1;
							$growth=D('Growth');
							$count=count($growth->growth_count(array('u_uid'=>$this->uid,'of'=>2,'type'=>1))); 
							if($count<$this->memcount){
								// 添加成员时积分与经验的增加值
								$sl=M('w_slnumber')->where(array('uid'=>2))->find();
								$level=$sl['lnumber'];
								// 当添加成员数量与额定的数量相等的时候多加额外的100积分
								$score=($count+1)==$this->profilecount?$sl['snumber']+100:$sl['snumber'];
								$exec3=$this->degree_grade(2,$level,$score);
							}
							$exec=$exec1&$exec2&&$exec3;

							// 数据提交与回滚
							if($exec)
								$mem->commit();
							else
								$mem->rollback();  
						}else{
							echo message(302,'notice','家庭成员添加超出限制');
							return;
						}				
					}

					// 返回数据信息提示
					if($exec)
						echo message();
					else
						echo message(301,'failed','服务器异常');
				}
			}else{
				// 显示
				if(isset($memid)){
					// 判断条件  主用户的家庭成员并且未认证为业主
					$info=$mem->ufind(array('w_members.uid'=>$memid,'w_members.is_authen'=>0,'w_family.p_uid'=>$this->uid),'uname,birth,phone_num,hobby,trade,relation','join w_family on w_family.child_uid=w_members.uid');
					$this->assign('info',$info);
					// 行业信息显示
					$trade=M('w_trade')->select();
					$this->assign('trade',$trade);
				}
				// 显示家庭关系
				$relation=M('w_relation');
				$re=$relation->select();
				$this->assign('relation',$re);
				$this->display();
			}
		}
		// 获取短信验证码
		function get_smscode(){
			$phone=I('POST.tel');
			$sms=D('Sms');
			$temp_id=2090242;
			$code=rand(1000,9999);
			$param=urlencode('#code#').'='.urlencode($code);
			$res=$sms->send_phone_msg($phone,$temp_id,$param);
			if($res->code==0){
				session('login_valicode',$code);
				echo message();
			}else
				echo message('301','error','验证码获取失败');
		}
		// 签到获取积分
		function clock_in(){
			// 检查用户今日是否已经签到
			$growth=D('Growth');
			$is_clock=$growth->where(array('u_uid'=>$this->uid,'of'=>3,'time'=>array('LIKE','%'.date("Y-m-d",time()).'%')))->count('uid');
			if(!$is_clock){
				// 添加成员时积分与经验的增加值
				$sl=M('w_slnumber')->where(array('uid'=>3))->find();
				$level=$sl['lnumber'];
				// 当添加成员数量与额定的数量相等的时候多加额外的100积分
				$score=($count+1)==$this->profilecount?$sl['snumber']+100:$sl['snumber'];
				$growth->startTrans();
				$exec=$this->degree_grade(3,$level,$score);
				if($exec){
					$growth->commit();
					echo message(200,'success',array($level,$score));
				}else{
					$growth->rollback();
					echo message(301,'error','签到服务暂时出错，请稍后再试');
				}
			}else
				echo message(302,'notice','今日签到已完成');
		}
		// 意见建议
		function advice(){
			$data=I('POST.');			
			if($data){
				$advice=M('w_advice');
				$exec=$advice->add(array('u_uid'=>$this->uid,'content'=>$data['content']));
				if($exec)
					echo message();
				else
					echo message(301,'error','服务繁忙，请稍后再试');
			}else
				$this->display();
		}
		function levels(){
			$info=$this->mem->field('w_members.uname,w_grade.level,w_grade.score,headimg')->where(array('w_members.uid'=>$this->uid))->join('w_grade on w_grade.u_uid=w_members.uid')->find();
			// 等级判断
			if($info['level']<50)
				$info['lv']=1;
			elseif($info['level']>=50&&$info['level']<100)
				$info['lv']=2;
			elseif($info['level']>=100&&$info['level']<200)
				$info['lv']=3;
			elseif($info['level']>=200&&$info['level']<300)
				$info['lv']=4;
			elseif($info['level']>=300&&$info['level']<500)
				$info['lv']=5;
			elseif($info['level']>=500)
				$info['lv']=6;
			$this->assign('info',$info);
			$this->display();
		}

		// 判断成员性别
		private function mem_sex($ruid){
			// 新添加用户的性别
			$relation=M('w_relation');
			$re=$relation->where(array('uid'=>$ruid))->find();
			if($re)
				return $re['mark'];
		}
		// 计算个人信息完善度返回已完成的数量百分比,保留四位小数
		private function array_empty_count($ar){
			$count=0;
			foreach ($ar as $key => $value) {
				switch ($key) {
					// case 'uname':						          
					case 'sex':			
					// case 'id_card':
					case 'birth':
					case 'phone_num':
					case 'marital_status':
					case 'address':
					case 'trade':
					case 'job':
					case 'hobby':
					case 'residence':
					case 'buy_reason':
					case 'buy_times':
					case 'car_amount':
					case 'car_brand':
					// case 'pro_consultant':
						if(($value!='')&&($value!='0')){
							$count++;
						}
						break;
					default:
						break;
				}
			}
			return round($count/ $this->profilecount,4);
		}
		// 积分与经验值增加
		// param  $of 积分获取方式
		// param  $level 经验值
		// param  $score 积分值
		private function degree_grade($of,$level,$score){
			$mem=D('Member');
			$is_authen=$mem->ufind(array('uid'=>$this->uid),'is_authen');
			if($is_authen){
					// 执行积分和经验记录的增加
				$growth=D('Growth');
				$exec1=$growth->add(array('u_uid'=>$this->uid,'type'=>2,'of'=>$of,'number'=>$level));
				$exec2=$growth->add(array('u_uid'=>$this->uid,'type'=>1,'of'=>$of,'number'=>$score));
				// 更新总积分与经验值
				$g=D('Grade');
				$grd=$g->where(array('u_uid'=>$this->uid))->find();
				$exec3= $g->add_sl($this->uid,$grd['score']+$score,$grd['level']+$level);
				return $exec1&&$exec2&&$exec3;
			}else
			return false;// 不是认证的业主一律不增加积分			
		}
		
	}