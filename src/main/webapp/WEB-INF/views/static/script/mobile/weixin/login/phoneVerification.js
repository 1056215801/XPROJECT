$(document).ready(function(){	
	$("#bindBt").click(function() {
    	console.debug("bindBt按钮点击事件执行开始！")
    	//1、输入校验
        var username = $('#username').val(); 
    	console.debug("username: " + username);

        var password =  $('#password').val();
        console.debug("password: " + password);
        //passwdPt 见 pt.js
        if (!passwdPt.test(password)) {
        	alert("密码格式不正确，密码至少6位字符！");
            $('#password').focus();            	        	
        	return false;
        }
        var bindUrl = ctx + "/session/json/mobile/weixin/login/bind";

        //2、提交后台
        $.getJSON(bindUrl, {username: username,password:password}, function(data) {    				
		   alert(data.errorMsg);
     	   if (data && data.success) {
					console.info("引导基于微信方式统一认证");
					$("#loginForm").submit(); 
				}
      });        
      return false;
      
	});
	
	$("#retrievePasswordBt").click(function(){
	  var retrievePasswdUrl = ctx + "/session/page/mobile/weixin/login/retrievePassword/index";
	  var username = $("#username").val(); 
	  retrievePasswdUrl += "?username=" + username;
	  
	  console.debug("引导到忘记密码页面，pageUrl：" + retrievePasswdUrl);
	  //alert ("pageUrl：" + retrievePasswdUrl);
	  location.href = retrievePasswdUrl;
	  return false;
	}); 	  
	console.debug("phoneVerification.js 执行完毕！")
});