<?php
	namespace Common\Model;
	use Think\Model;
	class QrcodeModel{
		protected $qrcode;
		function __construct(){
			Vendor('PHPQrcode.phpqrcode');
			$this->qrcode=new \QRcode();
		}
		// 生成二维码
		// param $url_name  二维码链接
		// param $url 		二维码相对路径
		// param $size  	二维码尺寸
		// param $level 	容错级别
		function qrcode($url_name,&$url='',$size=12,$level='H'){
			// 保存路径
			$qr_path=date('Ymd',time());	
			$file_dir='upload/qrcode/'.$qr_path;
			if(!is_dir($file_dir)){
				mkdir($file_dir);
			}
			$file_dir.='/'.date('YmdHis',time()).rand(100,999).'.png';
			$this->qrcode->png($url_name,$file_dir,$level,$size, 2);
			//已经生成的原始二维码图中添加二维码
			$logo = false;//'upload/qrcode/qr_logo.jpg';	
			if ($logo !== FALSE) { 
				$QR = imagecreatefromstring(file_get_contents($file_dir)); 
				$logo = imagecreatefromstring(file_get_contents($logo)); 

				$QR_width = imagesx($QR);//二维码图片宽度 
				$QR_height = imagesy($QR);//二维码图片高度 
				$logo_width = imagesx($logo);//logo图片宽度 
				$logo_height = imagesy($logo);//logo图片高度 

				$logo_qr_width = $QR_width / 4; 
				$scale = $logo_width/$logo_qr_width; 
				$logo_qr_height = $logo_height/$scale; 
				$from_width = ($QR_width - $logo_qr_width) / 2; 
				 //重新组合图片并调整大小 
				imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width, 
				$logo_qr_height, $logo_width, $logo_height);
				//输出图片-替换原图片 
				if(file_exists($file_dir)){
					unlink($file_dir);
				}
				imagepng($QR, $file_dir); 
				imagedestroy($QR);
			} 
			$url=$file_dir;
			
		}
	}