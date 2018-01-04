<style type="text/css">
	.message_cover{
		position: fixed;
		top: 0;
		left: 0;
		background-color: rgba(0,0,0,0.3);
		width: 100%;
		height: 100%;
		display: none;
	}
	.message_box{
		position: relative;
		width: 85%;
		min-height: 160px;
		background-color: #fff;
		margin:80px auto;
		border-radius: 5px;
		padding: 20px ;
		text-align: center;
		color: rgb(207,166,108);
	}
	.message_box img{
		width: 180px;
	}
	.message_box .content{
		min-height: 90px;
		padding: 20px;
		/*font-size: 14px;*/

	}
	.message_box .btns{
		position: absolute;
		left: 50%;
		margin-left: -52px;
		bottom: 20px;
	}
	.message_box .btns button{
		background: -webkit-linear-gradient(left, rgb(207,166,108), rgb(238,210,170));
		padding: 6px 40px;
		color: #fff;
	}
</style>
<div class='message_cover'>
	<div class='message_box'>
		<p id='img'></p>
		<div class='content'></div>
		<p class='btns'>
			<button id='message_close'>确认</button>
		</p>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('#message_close').click(function(){
			$('.message_cover').hide();
		});
	});
</script>