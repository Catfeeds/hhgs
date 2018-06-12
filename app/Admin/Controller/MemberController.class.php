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

		// 业主信息批量导入-上传预览excel文件
		function batch_import(){
			// 实例化上传类   
            $upload 			= new \Think\Upload();
            // 设置附件上传大小
            $upload->maxSize   	=1024*1024*5 ;
            // 设置附件上传类型     
            $upload->exts      	=array('xls', 'xlsx');
            
            // 上传根路径
            $upload->rootPath   =$_SERVER['DOCUMENT_ROOT'].HOME.'/upload/excel/';
            if(!is_dir($upload->rootPath)){
            	mkdir($upload->rootPath);
            }
            // 设置附件上传目录
            $upload->savePath  	=''; 
            // 上传文件     
            $info   			=$upload->upload();   
            $status=true; 
            if(!$info) {
                // 上传错误提示错误信息        
                $message=$upload->getError();   
                $status=false; 
            }else{
            	// 上传成功后读取excel文件内容
                $path=$upload->rootPath.$info['file']['savepath'].$info['file']['savename'];
                $exceldata=$this->excel($path);
            }
            // 提示信息
            $msg = array(  
                'name'=>$info['file']['name'],
                'path'=>$info['file']['savepath'].$info['file']['savename'],  
                'size'=>$info['file']['size'] ,
                'message'=>$exceldata,
            );  
            if($status)
            	echo message(200,'success',$msg);
        	else
        		echo message(408,'errors',$msg);
		}

		// 批量业主信息导入到数据库中
		function do_db_import(){
			$filename=I('POST.filename');
			if(!$filename)
				return;
			// 上传数据
			$path=$_SERVER['DOCUMENT_ROOT'].HOME.'/upload/excel/'.$filename;
			$exceldata=$this->excel($path);
		   // 开启事务写入到数据库中去
            $authen=M('w_autheninfo');              
            $authen->startTrans();
            $d1=$authen->addAll($exceldata,array(),1);
            if($d1){
            	$authen->commit();
            	unlink($path);
            	echo message();
            }
            else{
            	$authen->rollback();
            	echo message(301,'error','数据提交失败，请稍后再试');
            }
		}

		// 匹配未认证业主信息，认证业主
		function do_match_yezhu(){
			$list=array();
			$un_authen=$this->mem->field('uid,uname,phone_num')->where(array('is_authen'=>0))->select();
			if($un_authen){
				$authen=M('w_autheninfo'); 
				 //循环注册未认证的业主信息， 
				foreach ($un_authen as $value) {
					// 比对认证信息表
					$ainfo=$authen->field('uid,name,birth,idcard,area,houseinfo,consultant')->where(array('phone_num'=>$value['phone_num']))->find();
					if(!$ainfo)
						continue;
					// 符合认证条件更新用户的信息
					$data=array(
						'uname'				=>$ainfo['name'],
						'birth' 			=>$ainfo['birth'],
						'id_card'			=>$ainfo['idcard'],
						'area'				=>$ainfo['area'],
						'houseinfo'			=>$ainfo['houseinfo'],
						'pro_consultant'	=>$ainfo['consultant'],
						'is_authen'			=>1,
					);
					$exec=$this->mem->where(array('uid'=>$value['uid']))->save($data);
					if($exec){
						$list[]=$value;
					}
				}
				if($list)
					echo message(200,'success',$list);
				else
					echo message(301,'notice','暂无数据可进行匹配');
			}else
				echo message(302,'notice','暂无数据可进行匹配');
		}

		// 读取excel内容
		private function excel($filename){
			vendor('PHPExcel.PHPExcel.IOFactory');
			// $file= $_SERVER['DOCUMENT_ROOT'].HOME.'upload/excel/a.xlsx';
			$file=$filename;
			$fileType=\PHPExcel_IOFactory::identify($file);//获取文件类型
			$reader=\PHPExcel_IOFactory::createReader($fileType);//获取文件读取的对象
			$sheetName='Sheet1';
			$reader->setLoadSheetsOnly($sheetName);//加载指定的sheet
			$objExcel=$reader->load($file);
			$rows=array();//行数据集合
			// $sheets=array();
			foreach ($objExcel->getWorksheetIterator() as $sheet) {//读取sheet
				foreach($sheet->getRowIterator() as $row){//读取行数据
					if($row->getRowIndex()<2)//略过第一行数据
						continue;
					$row_array=array();
					$index=array('name','area','houseinfo','phone_num','idcard','birth','consultant');
					$i=0;				
					foreach($row->getCellIterator() as $cell){
						// 先判断下数据类型是否为数字，然后将科学计数转换为text
						// array_push($row_array, $cell->getValue());
						$row_array[$index[$i]]=$cell->getValue();
						$row_array['atime']=time();
						$i++;			
					}
					if($row_array['name']==null)
						continue;
					array_push($rows, $row_array);
				}
				// array_push($sheets, $rows);
			}
			return $rows;
		}
	}