function we_share(wechat){
    //微信配置信息
    wx.config({
        debug:false,
        appId: wechat['appId'],
        timestamp: wechat['timestamp'],
        nonceStr: wechat['nonceStr'],
        signature: wechat['signature'],
        jsApiList: [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo']
    });
    wx.ready(function () {
        //发送给朋友
        wx.onMenuShareAppMessage({
            title: wechat['title'],
            desc: wechat['desc'],
            link: wechat['link'],
            imgUrl: wechat['img'],
            trigger: function (res) {
                // 用户点击操作
            },
            success: function (res) {
               
            },
            cancel: function (res) {
                //取消后动作
            },
            fail: function (res) {
                // 操作失败后
            }
        });
        //分享到朋友圈
        wx.onMenuShareTimeline({
            title: wechat['title'],
            link: wechat['link'],
            imgUrl: wechat['img'],
            trigger: function (res) {
                // alert('用户点击分享到朋友圈');
            },
            success: function (res) {
                
            },
            cancel: function (res) {
                // 取消分享后动作
            },
            fail: function (res) {
                //错误信息，alert(JSON.stringify(res));
            }
        });
    });
}