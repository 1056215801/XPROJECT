$(document).ready(function(){	
	 $("#backBt").click(function(){		 
		 window.location.href = ctx + "/session/page/login/index";
	 });
	$("#phoneVerificationBt").click(function(){
    	console.debug("validateBt按钮点击事件执行开始！")
        var username = $('#username').val();
        //mobilePt 见 pt.js
        if (!mobilePt.test(username)) {
        	alertNew("手机号码格式不正确！",function () {
        		layer.closeAll();
        		$('#username').focus();
        	});
        	return false;
        }
        $("#phoneVerificationForm").submit();
        return true;
    });
    console.debug("phoneInput.js 初始化完毕！")
});