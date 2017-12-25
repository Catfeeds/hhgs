{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='文章设置'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-gear"></i> 文章设置</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-gear"></i>文章设置</li>	
			</ol>
		</div>
		<div class='col-md-12'>
			<div class='error_report'>
				错误：
				<span class='text-danger'></span>
			</div>
		</div>
	</div>
	<div class='row'>
		<div class='col-md-12'>
			<div class='panel panel-default'>
				<div class='panel-body'>
					<div class='form-horizontal'>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>日期格式</label>
							<div class='col-md-11 col-xs-12'>
								<label>
									<span class='date_text'><input type='radio' name='date_radio' value='Y年m月d日' {if $date_format[0] eq 'Y年m月d日'}checked{/if}> {$time|date_format:'%Y年%m月%d日'}</span>
									<code>Y年m月d日</code>
								</label><br><br>
								<label>
									<span class='date_text'><input type='radio' name='date_radio' value='Y-m-d' {if $date_format[0] eq 'Y-m-d'}checked{/if}> {$time|date_format:'%Y-%m-%d'}</span>
									<code>Y-m-d</code>
								</label><br><br>
								<label>
									<span class='date_text'><input type='radio' name='date_radio' value='m/d/Y' {if $date_format[0] eq 'm/d/Y'}checked{/if}> {$time|date_format:'%m/%d/%Y'}</span>
									<code>m/d/Y</code>
								</label><br><br>
								<label>
									<span class='date_text'><input type='radio' name='date_radio' value='d/m/Y' {if $date_format[0] eq 'd/m/Y'}checked{/if}> {$time|date_format:'%d/%m/%Y'}</span>
									<code>d/m/Y</code>
								</label>
							</div>
						</div>
						<br>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>时间格式</label>
							<div class='col-md-11 col-xs-12'>
								<label>
									<span class='date_text'><input type='radio' name='time_radio' value='A h:i' {if $date_format[1] eq 'A h:i'}checked{/if}> {$time|date_format:'%p %I:%M'}</span>
									<code>A h:i</code>
								</label><br><br>
								<label>
									<span class='date_text'><input type='radio' name='time_radio' value='h:i A' {if $date_format[1] eq 'h:i A'}checked{/if}> {$time|date_format:'%I:%M %p'}</span>
									<code>h:i A</code>
								</label><br><br>
								<label>
									<span class='date_text'><input type='radio' name='time_radio' value='H:i' {if $date_format[1] eq 'H:i'}checked{/if}> {$time|date_format:'%H:%M'}</span>
									<code>H:i</code>
								</label><br><br>
								<label>
									<span class='date_text'><input type='radio' name='time_radio' value='H:i:s' {if $date_format[1] eq 'H:i:s'}checked{/if}> {$time|date_format:'%H:%M:%S'}</span>
									<code>H:i:s</code>
								</label><br><br>
							</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>特殊格式</label>
							<div class='col-md-11 col-xs-12'>
								<label>
									<span class='date_text'>
										<input type='radio' name='hommization' value='hommization' {if $date_format eq 'hommization'}checked{/if}>
										人性化显示
									</span>
								</label><br><br>
							</div>
						</div>
						<button id='arc_save' class='btn btn-danger'>保存更改</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/archive.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/option.js'></script>
{include file='../tpl/footer.tpl'}