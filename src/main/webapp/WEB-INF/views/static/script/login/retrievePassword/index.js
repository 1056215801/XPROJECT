$(document).ready(function(){	
	 $("#backBt").click(function(){		 
		 window.location.href = ctx + "/session/page/login/index";
	 });
	//发送短信验证码按钮的点击事件处理
    $("#submitShortMessageCaptchaBt").click(function(){    	
        var username = $('#username').val();      
        if (!mobilePt.test(username)) {
        	alertNew("手机号码格式不正确！",function () {
        		layer.closeAll();
        		$('#username').focus();
        	});
        	return false;
        }
        var submitShortMessageCaptchaUrl = ctx + "/session/json/shortMessageCaptcha";
        $.getJSON(submitShortMessageCaptchaUrl,{mobilePhone: username},function (data) {
        	tips(data.errorMsg);
        	if (data.success) {
        		$('#captchaValue').focus();
        	}
    	});        	
        return false;
    });	

     $("#validateBt").click(function(){    	
         var username = $('#username').val();      
         if (!mobilePt.test(username)) {
         	alertNew("手机号码格式不正确！",function () {
         		layer.closeAll();
         		$('#username').focus();
         	});
         	return false;
         }
         var captchaValue =  $('#captchaValue').val();
         console.debug("captchaValue: " + captchaValue + ",passwdPt: " + passwdPt);
         if (!captchaPt.test(captchaValue)) {
         	alertNew("短信验证码输入错误！",function () {
         		layer.closeAll();
             	$('#captchaValue').focus();            	
         	});
         	return false;
         } 
         var validateUrl = ctx + "/session/json/login/retrievePassword/validate";
         
         $.getJSON(validateUrl,{username: username,captchaValue:captchaValue},function (data) {
         	if (!data.success) {
         		tips(data.errorMsg);
         		$('#captchaValue').focus();
         	} else {
         		$("#mobilePhoneText").html(username);   
         		
         		$(".resetPassword").removeClass("displayNo");
         		$(".confirmPhone").addClass("displayNo");         	
         		
         	}
     	});        	
         return false;
     });     
     

     $("#resetBt").click(function(){  
         var username = $('#username').val();      
         if (!mobilePt.test(username)) {
         	alertNew("手机号码格式不正确！",function () {
         		layer.closeAll();
         		$('#username').focus();
         	});
         	return false;
         }    	 
         var password =  $('#password').val();
         if (!passwdPt.test(password)) {
         	alertNew("密码输入至少6位字符！",function () {
         		layer.closeAll();
             	$('#password').focus();            	
         	});
         	return false;
         }   
         
         var password1 =  $('#password1').val();
         if (password != password1) {
         	alertNew("两次密码输入不一致！",function () {
         		layer.closeAll();
             	$('#password').focus();            	
         	});
         	return false;        	
         }

         var resetUrl = ctx + "/session/json/login/retrievePassword/reset";
         $.getJSON(resetUrl,{username: username,password:password,password1:password1},function (data) {
          	if (!data.success) {
          		tips(data.errorMsg);
          	} else {
             	alertNew("你的密码已成功重置！",function () {
             		layer.closeAll();
             		var loginUrl = ctx + "/session/page/login/index";
             		location.href= loginUrl + "?username=" + username;   	
             	});
             	return false;        	
          		
          	}
      	});  
        return false;
         
     });

    
    $("#retrievePasswordBt").click(function(){
 		$(".resetPassword").addClass("displayNo");
 		$(".confirmPhone").removeClass("displayNo");
 		return false;   
    });
    
    
});