<?php

// 应用入口文件

// 检测PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',false);

// 定义应用目录
define('APP_PATH','./app/');

// 定义一些系统需要用到的常量
define('IMG','/jianye_garden/public/img/');
define('JS','/jianye_garden/public/js/');
define('CSS','/jianye_garden/public/css/');
define('UPLOAD','/jianye_garden/upload/');
// 前台与后台具体后台路径
define('HOME','/jianye_garden/');
define('ADMIN','/jianye_garden/Admin/');
define('THEME','/jianye_garden/Theme/default/');
define('THEMEADMIN','/jianye_garden/ThemeAdmin/default/');
// JS第三方类库包内容
define('ORG','/jianye_garden/public/ext/');

// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';