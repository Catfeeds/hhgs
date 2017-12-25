<!DOCTYPE html>
<html>
<head>
	<title></title>
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
			width:1170px;
			margin: 0 auto;
			background-color: #ffffff;
			padding: 15px 20px;
		}
	</style>
</head>
<body>
	<div class='container'>
		{$result['page_content']}
	</div>
</body>
</html>