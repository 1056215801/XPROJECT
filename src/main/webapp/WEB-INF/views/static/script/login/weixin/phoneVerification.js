$(document).ready(function(){	
	 $("#backBt").click(function(){		 
		 window.location.href = ctx + "/session/page/login/weixin/phoneInput";
	 });
	 
    $("#bindBt").click(function(){
    	console.debug("bindBt按钮点击事件执行开始！")
    	//1、输入校验
        var username = $('#username').val(); 
    	console.debug("username: " + username);

        var password =  $('#password').val();
        console.debug("password: " + password);
        //passwdPt 见 pt.js
        if (!passwdPt.test(password)) {
        	alertNew("密码格式不正确，密码至少6位字符！",function () {
        		layer.closeAll();
            	$('#password').focus();            	
        	});
        	return false;
        }
        var bindUrl = ctx + "/session/json/login/weixin/bind";

        //2、提交后台
        $.getJSON(bindUrl, {username: username,password:password}, function(data) {    				
		   tips(data.errorMsg);
     	   if (data && data.success) {
					console.info("引导基于微信方式统一认证");
					$("#loginForm").submit(); 
				}
      });        
      return false;
    });
    console.debug("phoneVerification.js 初始化完毕！")
});


 