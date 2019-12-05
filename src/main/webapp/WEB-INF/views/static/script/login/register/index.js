$(document).ready(function(){	

	 $("#loginBt").click(function(){		 
		 window.location.href = ctx + "/session/page/login/index";
	 });
	 
	 $("#backBt").click(function(){		 
		//  window.location.href = ctx + "/session/page/login/index";
		 history.go(-1);
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
        return true;
    });	


    function jump(count) { 
        window.setTimeout(function(){ 
            count--; 
            if(count > 0) { 
                $('#remainTimesTips').html(count); 
                jump(count); 
            } else {             		
       		 $("#loginForm").submit(); 
            } 
        }, 1000); 
    }
    
    $("#registerBt").click(function(){    	
        var username = $('#username').val();      
        if (!mobilePt.test(username)) {
        	alertNew("手机号码格式不正确！",function () {
        		layer.closeAll();
        		$('#username').focus();
        	});
        	return false;
        }

        var captchaValue =  $('#captchaValue').val();
        if (!captchaPt.test(captchaValue)) {
        	alertNew("短信验证码输入错误！",function () {
        		layer.closeAll();
            	$('#captchaValue').focus();            	
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
            	$('#password1').focus();            	
        	});
        	return false;        	
        }
        
        if (!$('#readCheckbox').prop('checked')) {  
        	tips("请阅读并同意《江西工业园区微讯企业服务云平台协议》！");
        	return false;
        }
        var registerUrl =  ctx + "/session/json/login/register/register";
        $.getJSON(registerUrl,{username: username,captchaValue:captchaValue,password:password,password1:password1},function (data) {
        	if (data && data.success) {        		
        	 	$(".registerSuccess").removeClass("displayNo");
        		$(".registerPage").addClass("displayNo");        		
        		jump(3);
        	} else {
        		alert(data.errorMsg);
        	}        	
    	});        	
        return false;
    });	    
    
});