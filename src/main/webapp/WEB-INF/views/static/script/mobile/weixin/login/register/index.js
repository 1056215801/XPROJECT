$(document).ready(function(){	
	 //发送短信验证码按钮的点击事件处理
    $("#submitShortMessageCaptchaBt").click(function(){  
    	var url = ctx + "/session/json/mobile/weixin/login/register/check";
    	var param = {
    			"username" : $("#username").val()
    	};
    	$.post(url,param,function(data){
    		if(data.success){
    		       var username = $('#username').val();      
    		       if (!mobilePt.test(username)) {
    		       	alert("手机号码格式不正确！");
    		       	$('#username').focus();
    		           return false;
    		       }
    		       var submitShortMessageCaptchaUrl = ctx + "/session/json/shortMessageCaptcha";
    		       $.getJSON(submitShortMessageCaptchaUrl,{mobilePhone: username},function (data) {
    		       	alert(data.errorMsg);
    		       	if (data.success) {
    		       		jump(60);
    		       		$('#captchaValue').focus();
    		       	}
    		   	});        	
		       return true;
    		}else {
    			alert(data.errorMsg);
    		}
    	})  	
   });

    function jump(count) { 
        window.setTimeout(function(){ 
            count--; 
            if(count > 0) { 
           	 $('#submitShortMessageCaptchaBt').css('display','none');
           	 $('#submitShortMessageCaptchaWaitingTips').css('display','inline-block');
                $('#submitShortMessageCaptchaWaitingTips').html("" + count + "s后重发"); 
                jump(count); 
            } else {     
           	 $('#submitShortMessageCaptchaBt').css('display','inline-block');
           	 $('#submitShortMessageCaptchaWaitingTips').css('display','none');
            } 
        }, 1000); 
    }
    
    $("#username").on("blur",function(){
    	var url = ctx + "/session/json/mobile/weixin/login/register/check";
    	var param = {
    			"username" : $(this).val()
    	};
    	$.post(url,param,function(data){
    		console.log(data)
    		if(data.success){
    			
    		}else {
    			alert(data.errorMsg);
    		}
    	})
    })
    
    $("#registerBt").click(function(){    	
        var username = $('#username').val();      
        if (!mobilePt.test(username)) {
        	alert("手机号码格式不正确！");
        	$('#username').focus();
        	return false;
        }     
        var captchaValue =  $('#captchaValue').val();
        if (!captchaPt.test(captchaValue)) {
        	alert("短信验证码输入错误！");
           	$('#captchaValue').focus();            	
        	return false;
        } 
        var password =  $('#password').val();
        if (!passwdPt.test(password)) {
        	alert("密码输入至少6位字符！");
            $('#password').focus();        	
        	return false;
        }   
        
        var password1 =  $('#password1').val();
        if (password != password1) {
        	alert("两次密码输入不一致！");
        	$('#password').focus();
        	return false;        	
        }
        var registerUrl = ctx + "/session/json/mobile/weixin/login/register/register";
        $.getJSON(registerUrl,{username: username,captchaValue:captchaValue,password:password,password1:password1},function (data) {
        	if (data && data.success) {
        		alert("注册成功！");
         		$("#loginForm").submit(); 
        	} else {
        		alert(data.errorMsg);
        	}        	
    	});        	
        return false;
    });      
});