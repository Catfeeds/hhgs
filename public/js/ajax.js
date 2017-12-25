/*
ajax方法封装
张小超
2016-12-19
verion 1.0.0
*/
var ajax_submit=function(setting){
	this.setting={
		'type':'POST',
		'url':window.location.href,
		'callback_url':window.location.href,
		'dataType':'json',
		'load':null,
		'success':null,
	};
}
ajax_submit.prototype={
	submit:function(datas){
		var self=this;
		$.ajax({
			type:this.setting.type,
			url:this.setting.url,
			dataType:this.setting.dataType,
			data:datas,
			beforeSend:function(data){
				if(self.setting.load!=null)
					self.setting.load();
				else
					self.load(data);
			},
			success:function(data){
				if(self.setting.success!=null){
					self.setting.success(data);
				}
				else
					self.success(data);
			},
			error:function(data){

			}
		});
	},
	// beforeSend function
	load:function(){
		console.log('loading······');
	},
	// 提示
	success:function(param){
		if(param['code']==200){
			alert('操作成功');
			window.location.href=this.setting.callback_url;
		}
	},
	setConfig:function(setting){
		$.extend(this.setting,setting);
	}
}
window['Ajax']=new ajax_submit();
