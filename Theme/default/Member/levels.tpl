<!DOCTYPE html>
<html lang='zh'>
<head>
	<title>等级权限</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="{$smarty.const.THEME}Member/css/common.css">
	<style type="text/css">
		.header{
			background-image: url({$smarty.const.THEME}Member/img/lheader.png);
			background-size: cover;
			width: 100%;
			height: 120px;
			padding: 20px 30px;
			display: flex;
		}
		.name{
			margin:5px 0;
			font-weight: 500;
		}
		.line{
			color: #666;
		}
		.header img{
			width: 80px;
			height: 80px;
			border-radius: 50%;
		}
		.flex:nth-of-type(1){
			margin-right: 20px;
		}
	</style>
</head>
<body>
	<div class='container'>
		<div class='header'>
			<div class='flex'>
				<img src="{$info['headimg']}">
			</div>
			<div class='flex'>
				<h2 class='name'>{$info['uname']}</h2>
				<div class='line'>等级：Lv {$info['lv']}</div> 
				<div class='line'>成长值：{$info['level']}</div>
			</div>
		</div>
		<div>
			<img src="{$smarty.const.THEME}Member/img/llevel.png">
		</div>
	</div>
</body>
</html>