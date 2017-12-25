<!DOCTYPE html>
<html>
<head>
	<title>文章预览-{$result['post_title']}</title>
	<meta charset='utf-8'>
	<style type="text/css">
		body{
			padding: 0;
			margin: 0;
			font-family: -apple-system, "Helvetica Neue", Arial, "PingFang SC", "lucida grande", "lucida sans unicode", lucida, helvetica, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
			color: #9a999e;
			background-color: #F3F3F3;
		}
		.container{
			width:960px;
			margin: 0 auto;
			background-color: #ffffff;
			padding: 15px 20px;
		}
		.describe{
			font-size: 13px;
			border:1px solid #c5c5c5;
			padding: 10px;
			background-color: #fff;
		}
		.date{
			padding: 10px 0;
			font-size: 13px;
		}
	</style>
</head>
<body>
	<div class='container'>
		<div class='title'>
			<h3>{$result['post_title']}</h3>
		</div>
		<div class='date'>{$result['post_date']|date_format:'%Y-%m-%d %H:%M:%S'}</div>
		<div class='describe'>
			{$result['post_describe']}
		</div>
		<div class='body'>
			{$result['post_content']}
		</div>
	</div>
</body>
</html>