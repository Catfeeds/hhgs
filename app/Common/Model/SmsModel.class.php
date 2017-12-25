<?php
	namespace Common\Model;
	use Think\Model;
	// 云片短信接口
	class SmsModel{
		protected $apikey='aec60df54e4075cb35fc7a365839233c';
        //云片发送短信
        function send_phone_msg($phone,$tpl_id,$param){
            //修改为您的apikey(https://www.yunpian.com)登陆官网后获取
            $mobile = urlencode($phone); //请用自己的手机号代替
            $ch = curl_init();

            /* 设置验证方式 */

            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept:text/plain;charset=utf-8', 'Content-Type:application/x-www-form-urlencoded','charset=utf-8'));

            /* 设置返回结果为流 */
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            /* 设置超时时间*/
            curl_setopt($ch, CURLOPT_TIMEOUT, 10);

            /* 设置通信方式 */
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

            // 发送模板短信
            // 需要对value进行编码
            $data=array(
            	'tpl_id'=>$tpl_id,
            	'tpl_value'=>$param,
            	'mobile'=>$mobile,
            	'apikey'=>$this->apikey,
            );
            // tpl_value编码方式
            // urlencode('#name#').'='.urlencode($param['name']).'&'.urlencode('#tel#').'='.urlencode($param['tel']).'&'.urlencode('#num#').'='.urlencode($param['boxs']).'&'.urlencode('#month#').'='.urlencode($param['month'])

            $json_data = $this->tpl_send($ch,$data);
            $array = json_decode($json_data,true);
            curl_close($ch);
            return $array;
        }
        // 发送短信
        private function tpl_send($ch,$data){
            curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v1/sms/tpl_send.json');
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            return curl_exec($ch);
        } 
	}