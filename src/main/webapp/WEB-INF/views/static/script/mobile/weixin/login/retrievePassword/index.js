$(document).ready(function(){	
	 //发送短信验证码按钮的点击事件处理
     $("#submitShortMessageCaptchaBt").click(function(){    	
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
     
     
     $("#validateBt").click(function(){    	
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
         var validateUrl = ctx + "/session/json/mobile/weixin/login/retrievePassword/validate";
         
         $.getJSON(validateUrl,{username: username,captchaValue:captchaValue},function (data) {
         	if (!data.success) {
         		alert(data.errorMsg);
         		$('#captchaValue').focus();
         	} else {       		
         		$("#resetPassword").removeClass("displayNo");
         		$("#confirmPhone").addClass("displayNo");         		
         	}
     	});        	
         return false;
     });     
     

     $("#resetBt").click(function(){  
         var username = $('#username').val();      
         if (!mobilePt.test(username)) {
         	alert("手机号码格式不正确！");
         	$('#username').focus();        
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
         }
         
         var resetUrl = ctx + "/session/json/mobile/weixin/login/retrievePassword/reset";

         $.getJSON(resetUrl,{username: username,password:password,password1:password1},function (data) {
          	if (!data.success) {
          		alert(data.errorMsg);
          	} else {
             	alert("你的密码已成功重置！");
             	if($("#redirectUrl").val()!='' &&  $("#redirectUrl").val()!=null){
             		 location.href= $("#redirectUrl").val() ;
             	}
             	else{
             		 $("#loginForm").submit();
             	}
               
            }
            return false;
      	});           
         
     });

    
     $("#retrievePasswordBt").click(function(){
  		$("#resetPassword").addClass("displayNo");
  		$("#confirmPhone").removeClass("displayNo"); 
  		return false;
     });   
});