$(document).ready(function(){	
	//点击微信登录按钮的事件处理。
	$("#generateQrCodeBt").click(function() {
		var url = ctx + "/session/page/login/weixin/generateQrCode";
		location.href = url;		
		return false;
	});
	
	//点击注册按钮的事件处理。
	$("#registerBt").click(function() {
		var prefix = ctx + "/session/page/login/register/index";
		var username = $('#username').val();
		var url = prefix + "?username=" + username;
		location.href = url;		
		return false;
	});
	//点击找回密码按钮的事件处理。
	$("#retrievePasswordBt").click(function() {
		var prefix = ctx + "/session/page/login/retrievePassword/index";
		var username = $('#username').val();
		var url = prefix + "?username=" + username;
		location.href = url;		
		return false;
	});
	
    $("#loginBt").click(function(){
        var username = $('#username').val();
        //mobilePt 见 pt.js
        if (!mobilePt.test(username)) {
        	//alertNew("手机号码格式不正确！",function () {
        	//	layer.closeAll();
        	//	$('#username').focus();
        	//});
        	//return false;
        }
        var password =  $('#password').val();
        //passwdPt 见 pt.js
        if (!passwdPt.test(password)) {
        	alertNew("密码格式不正确，密码至少6位字符！",function () {
        		layer.closeAll();
            	$('#password').focus();            	
        	});
        	return false;
        }
        $("form").submit();
        return false;
    });	    
});