{include file='../tpl/header.tpl' username={$username} id={$id} level={$userlevel} title='微信公众号设置'}
<div class='main'>
	<div class='row'>
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-weixin"></i> 微信公众号设置</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="{$smarty.const.ADMIN}">首页</a></li>
				<li><i class="fa fa-weixin"></i>微信公众号设置</li>	
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
						<input id='id' type='hidden' value="{$id}">
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>公众号名称</label>
							<div class='col-md-6 col-xs-12'>
								<input id='w_name1' type='text' class='form-control' value="{$val['name1']}">
							</div>
							<div class='help-block'>请输入你的公众平台用户名</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>公众号帐号</label>
							<div class='col-md-6 col-xs-12'>
								<input id='w_name2' type='text' class='form-control' value="{$val['name2']}">
							</div>
							<div class='help-block'>填写公众号的帐号,一般为英文帐号</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>原始ID</label>
							<div class='col-md-6 col-xs-12'>
								<input id='w_id' type='text' class='form-control' value="{$val['w_id']}">
							</div>
							<div class='help-block'>在给粉丝发送客服消息时,原始ID不能为空。建议您完善该选项</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>公众号类型</label>
							<div class='col-md-6 col-xs-12'>
								<select id='w_type' class='form-control'>
									<option value='1' {if $val['w_type'] eq 1}selected{/if}>普通订阅号</option>
									<option value='2' {if $val['w_type'] eq 2}selected{/if}>普通服务号</option>
									<option value='3' {if $val['w_type'] eq 3}selected{/if}>认证订阅号</option>
									<option value='4' {if $val['w_type'] eq 4}selected{/if}>认证服务号</option>
								</select>
							</div>
							<div class='help-block'>注意：即使公众平台显示为“未认证”, 但只要【公众号设置】/【账号详情】下【认证情况】显示资质审核通过, 即可认定为认证号.</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>APPID</label>
							<div class='col-md-6 col-xs-12'>
								<input id='w_appid' type='text' class='form-control' value="{$val['w_appid']}">
							</div>
							<div class='help-block'>请填写微信公众平台后台的AppId</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>APPSECRET</label>
							<div class='col-md-6 col-xs-12'>
								<input id='w_secret' type='text' class='form-control' value="{$val['w_secret']}">
							</div>
							<div class='help-block'>请填写微信公众平台后台的AppSecret, 只有填写这两项才能管理自定义菜单</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>接口地址</label>
							<div class='col-md-6 col-xs-12'>
								<input id='w_api' type='text' class='form-control' value="{$val['w_api']}">
							</div>
							<div class='help-block'>设置“公众平台接口”配置信息中的接口地址</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>TOKEN</label>
							<div class='col-md-6 col-xs-12'>
								<input id='w_token' type='text' class='form-control' value="{$val['w_token']}">
							</div>
							<div class='help-block'>与公众平台接入设置值一致，必须为英文或者数字，长度为3到32个字符. 请妥善保管, Token 泄露将可能被窃取或篡改平台的操作数据.</div>
						</div>
						<div class='form-group'>
							<label class='col-md-1 col-xs-12'>EncodingAESkey</label>
							<div class='col-md-6 col-xs-12'>
								<input id='w_aeskey' type='text' class='form-control' value="{$val['w_aeskey']}">
							</div>
							<div class='help-block'>与公众平台接入设置值一致，必须为英文或者数字，长度为43个字符. 请妥善保管, EncodingAESKey 泄露将可能被窃取或篡改平台的操作数据.</div>
						</div>
						<button id='we_submit' class='btn btn-danger'>更新</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="{$smarty.const.THEMEADMIN}assets/css/public.css">
<script type="text/javascript" src='{$smarty.const.JS}ajax.js'></script>
<script type="text/javascript" src='{$smarty.const.THEMEADMIN}assets/js/option.js'></script>
{include file='../tpl/footer.tpl'}