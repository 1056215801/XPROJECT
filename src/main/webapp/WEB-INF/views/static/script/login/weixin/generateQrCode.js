$(document).ready(function(){	
	//点击微信登录按钮的事件处理。
	$("#indexBt").click(function() {
		var url = ctx + "/session/page/login/index";
		location.href = url;		
		return false;
	});
});
