<?php
return array(
	//'配置项'=>'配置值'
	'URL_MODEL'=>2,
	// 'SHOW_PAGE_TRACE'=> true,
	// 'URL_CASE_INSENSITIVE' => true,   // 默认false 
	'URL_ROUTER_ON'   => true, //开启路由
	'URL_ROUTE_RULES' => array( //定义路由规则
	    
	), 
	// 关闭模版缓存
	'TMPL_CACHE_ON'			=>false,
	/* 数据库设置 */
	'DB_TYPE'               =>  'mysqli',    // 数据库类型
	'DB_HOST'               =>  'localhost', // 服务器地址
	'DB_NAME'               =>  'jianye_garden',      // 数据库名
	'DB_USER'               =>  'root',      // 用户名
	'DB_PWD'                =>  '93be41e8cc',   // 密码
	'DB_PORT'               =>  '3306',      // 端口
	'DB_PREFIX'             =>  '',    		 // 数据库表前缀
	'DB_FIELDTYPE_CHECK'    =>  false,       // 是否进行字段类型检查
	/* 数据库设置 */

	// 模版
	'TMPL_ENGINE_TYPE'		=>	'Smarty',
	// 二级域名绑定指定模块
	// 'APP_SUB_DOMIAN_DEPLOY'	=>	1,
	// 'APP_SUB_DOMAIN_RULES'	=>	array(
	// 								'member.xxxxx.com' =>'xxx/xxx' , 
	// 							),

	/*模块设置*/
	// 允许访问的模块
	'MODULE_ALLOW_LIST'		=>	array('Home','Admin'),
	// 默认访问的模块可以去除掉Home
	'DEFAULT_MODULE'		=>	'Home',
	/*模块设置*/

	/*模版设置*/
	// 设置模版的默认路径
	'VIEW_PATH'				=>'./Theme/',
	// 设置模版主题
	'DEFAULT_THEME'			=>'default',
	// 默认的试图层名称
	// 'DEFAULT_V_LAYER'		=>'Theme',	
	// 模版差异化设置
	'TMPL_LOAD_DEFAULTTHEME'=>true,
	'TMPL_TEMPLATE_SUFFIX'	=>'.tpl',
	/*模版主题设置*/

	/*设置session过期时间*/
	// 'SESSION_OPTIONS'		=>array('name'=>'w_user_login','expire'=>3600*5),
);