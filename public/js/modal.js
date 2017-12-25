// js弹窗提示模态框
var modal=function(){
	this.setting={
		'width':'240',
		'height':'90',
		'left':'50%',
		'top':'50%',
		'text':'hello,world',
	}
}
modal.prototype={
	alert:function(text){
		var doc_obj=$('#modal_alert_01');
		if(doc_obj.length<=0)
			this.draw_html(text);
		else{
			doc_obj.css('display','block');
		}
		$('body').on('click','#modal_alert_01 #modal_close',function(){
	        $('#modal_alert_01').css('display','none');
	    });
	},
	draw_html:function(text){
		var html='<div id="modal_alert_01" style="position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.4);"><div style="position:absolute;background:#fff;width:'+this.setting.width+'px;min-height:'+this.setting.height+'px;left:50%;top:50%;margin-left:-'+this.setting.width/2+'px;margin-top:-'+(this.setting.height/2+40)+'px;text-align:center;border-radius:8px;border:1px solid rgba(0,0,0,.5)"><div style="padding:15px;">'+text+'</div><div id="modal_close" style="border-top:1px solid rgba(0,0,0,.2);padding:8px 5px;color:#4a90e2;">好</div></div></div>';
		$('body').append(html);
	}
};
window['modal']=new modal();