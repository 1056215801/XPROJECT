$(document).ready(function(){	
    $("#phoneVerificationBt").click(function(){
        var username = $('#username').val();      
        if (!mobilePt.test(username)) {
        	alert("手机号码格式不正确！");
        	$('#username').focus();
        	return false;
        }

        $("form").submit();
        return true;
    });	    
});