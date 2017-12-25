<?php
	// 函数处理信息返回json数据
	// @param code 返回代码
	// @param msg  返回提示信息
	// @param data 返回数据
	//	200成功,300失败,400错误
	//	success成功，failed失败,error错误 
	function message($code=200,$msg='success',$data=null){
		return json_encode(array('code'=>$code,'msg'=>$msg,'data'=>$data));
	}
	// curl请求
	function http_curl($url){
		// $arrHearders =[
		//     'Accept-Language:zh-CN,zh;q=0.8',
		//     'Connection:keep-alive',
		// ];
		$ch = curl_init();
		// 设置请求 User-Agent， 值是字符串
		// curl_setopt($ch, CURLOPT_USERAGENT, $strUserAgent);
		// 设置请求 HTTP-HEADER 头，值是数组
		// curl_setopt($ch, CURLOPT_HTTPHEADER, $arrHearders);
		// 禁止 SSL 验证
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		// 请求的 URL 地址
		curl_setopt($ch, CURLOPT_URL, $url);
		// curl_getinfo 结果里面增加请求的 Headers 信息
		curl_setopt($ch, CURLINFO_HEADER_OUT, true);
		// cURL 函数执行的最长秒数
		curl_setopt($ch, CURLOPT_TIMEOUT, 300);
		// 在尝试连接时等待的秒数。设置为0，则无限等待
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 120);
		// 执行结果中是否包含响应的 Headers 头信息
		curl_setopt($ch, CURLOPT_HEADER, false);
		// curl_exec 执行的结果不自动打印出来
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		// 执行
		$result = curl_exec($ch);
		// 关闭 curl 
		curl_close($ch);
		return $result;
	}