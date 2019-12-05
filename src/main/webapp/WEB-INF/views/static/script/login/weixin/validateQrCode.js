$(document).ready(function() {
	$("#registerIndexBt").click(function(){
		console.debug("registerIndexBt按钮点击事件处理开始!");
		$("#registerIndexForm").submit();  
		return false;
	});		 
	
    $("#phoneInputBt").click(function(){
		console.debug("phoneInputBt按钮点击事件处理开始!");
		$("#phoneInputForm").submit();  
		return false;
    });    
});