<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/ldHomePage.css"/>
	<style>
		.head {
		    position: relative;
		    padding: 15px 0 34px;
		    text-align: center;
		    background: url(${ctx}/static/image/liData/bg2.png) no-repeat center;
		}
		.time {
		    position: absolute;
		    right: 10px;
		    top: 50%;
		    margin-top: -20px;
		}
		.time a { margin-left: 15px;}
		.time font {
		    margin-left: 5px;
		    margin-top: 2px;
		    vertical-align: middle;
		    font-size: 12px;
		    color: #03E0C2;
		    display: inline-block;
		}
		.head img {
		    cursor: pointer;
		}
		.logo {
		    position: absolute;
		    left: 8.5%;
		    top: 12px;
		}
		.btn-success{
		    background: #05579e !important;
		    border-color: #05579e !important;
		}
		.btn-success:hover{
		  	 background: #05579e !important;
		  	 border-color: #05579e !important;
		}
		.goBack-a{
			position: absolute;
		    left: 1.5%;
		    top: 25px;
		    color: #03E0C2;
		    font-size: 14px;
		}
		.goBack-a span{
			cursor: pointer;
		}
		@media screen and (max-width: 1440px){
		.head{
		   padding: 10px 0 19px;
		}
		.time {
			margin-top: -14px;
		}
		.logo {
			top: 5px;
		}
		.goBack-a{
			top: 22px;
		}
		
		}
	</style>
	<div class="head">
		<img class="index-img" onclick="location.href='${ctx}/front/cityDataCenter/ycLdIndex/1'" src="${ctx}/static/image/liData/logo.png">
		<a class="goBack-a" onclick="location.href='${ctx}/front/cityDataCenter/ycLdIndex/1'"><img src="${ctx}/static/image/cityDataCenter/ycNew2/goBack.png" style="margin-right:5px;"><span>返回首页<span></a>
		<img class="logo" src="${ctx}/static/image/cityDataCenter/ycNew2/logo-icon.png" onclick="goIndexPage()">
		<div class="time">
			<a href="javascript:;"><font id="time"></font></a>
			<a href="javascript:;" onclick="toLogin()" id="nologin"><img src="${ctx}/static/image/liData/peo.png"><font>登录</font></a>
			<a href="javascript:;" style="display:none;" id="login"><img src="${ctx}/static/image/liData/peo.png"><font style="margin-right: 10px;">${accountName}</font><img width="18" src="${ctx}/static/image/liData/logout Data.png"><font onclick="logout()">退出</font></a>
		</div>
	</div>
<%-- 	<input type="hidden" id="urlPath" value="${urlPath}"  >
 --%>	<div class="toLogin" style="display: none; padding:20px;">
		<div style="font-size: 20px; color: #000; font-weight: bold; text-align: center;">登录系统</div>
		<div class="inputContentBar">  
		<form name="loginForm" id="loginForm" method="post" action="/session/login" >
			 <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
			 <input type="hidden"  id="redirectUrl" value="" />
			<div class="form-group" style="position:relative;">
				<input type="text"  id="username" name="username" maxlength="20"  placeholder="请输入账号" class="form-control">
				<img src="${ctx}/static/image/login/keyboard.png" class="keyboard">
			</div>
			<div class="form-group" style="position:relative;">
				<input type="password"  id="password" name="password" maxlength="20" placeholder="请输入密码" class="form-control">
				<img src="${ctx}/static/image/login/keyboard.png" class="keyboard">
			</div>
			<div class="form-group" style="position:relative;">
				<input type="text" id="captchaValue" onkeydown="KeyDown(event)" name="captchaValue" placeholder="请输入验证码" class="form-control">
				<div class="verificationCode">
					<c:url value="/session/page/imageCaptcha" var="imageCaptchaUrl"/>
                	<img alt="验证码" src="${imageCaptchaUrl}"  id="imageCaptcha" class="imageCaptcha" title="太丑了，换一张！">
				</div>
			</div>
			<div class="form-group clearfix" style="display:block">
				<div class="operLeft">
					<input type="hidden" id="status" value="off">
					<input type="checkbox" name="remember-me"  id="remember-me" onclick="checkboxOnclick(this)">
					<span class="operContral">自动登录</span>
				</div>
				<%--<div class="operRight"><a href="${ctx}/session/toJxzw" target="_blank" href="javascript:;">从江西政务网登陆</a> 
				 <a href="${ctx}/retrievePassword" href="javascript:;">忘记密码</a>--%>
				</div> 
			</div>
			<button type="button" id="loginBt"  class="btn btn-block btn-success">登&nbsp;&nbsp;录</button>
		</form>
	</div>
<script src="${ctx}/static/script/pt.js" type="text/javascript"></script>	
<script type="text/javascript">
var isLogin = '${isLogin}';
$(function () {	
	if('${page}'==1){
		$('.goBack-a').hide();
		$('.logo').css("left","1.5%");
	}else{
		$('.goBack-a').show();
		$('.logo').css("left","8.5%");
	}
	if(isLogin=='1'){ 
		$('#login').show();
		$('#nologin').hide();
	}else{ 
		$('#login').hide();
		$('#nologin').show();  
	}
	$("#time").text(getNow());
	$("#imageCaptcha").click(function(){
		var random = Math.random();
   	    $(this).attr("src","${imageCaptchaUrl}?" + random);  
	}); 
	
	$("#loginBt").click(function(){
	    var username = $('#username').val();
	    //mobilePt 见 pt.js
	    if (!userCodePt.test(username)) {
	    	layer.msg('账号格式不正确！');
	    	return false;
	    }
	    var password =  $('#password').val();
	    //passwdPt 见 pt.js
	    if (!passwdPt.test(password)) {
	    	layer.msg('密码格式不正确，密码至少6位字符！');
	    	return false;
	    }
	    var captchaValue = $('#captchaValue').val();
	    if (!captchaPt.test(captchaValue)) {
			layer.msg('验证码错误！');
			return false ;  
		}        
	 //   $("form").submit();
	    var redirectUrl=$('#redirectUrl').val(); 
	    if(redirectUrl==null || redirectUrl=='' ){
			redirectUrl="${ctx}/" ;
		} 
	    goMain(redirectUrl);
	    return false;
	});	
});
function goIndexPage(){
	window.location.href='${ctx}/front/cityDataCenter/ycIndex/11?orgId=3609009';
}
function getNow() {
	var date = new Date();
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var day = date.getDay();
	var x = '';
	switch (day) {
		case 0: x="星期天";
		  break;
		case 1: x="星期一";
		  break;
		case 2: x="星期二";
		  break;
		case 3: x="星期三";
		  break;
		case 4: x="星期四";
		  break;
		case 5: x="星期五";
		  break;
		case 6: x="星期六";
		  break;
	}
	return y+'年 '+m+'月 '+d+'日 '+x;
}
function toLogin(){
	var page = '${page}';
	var type = '${type}';
	var typeId = '${typeId}';
	var id = '${id}';
	var url;
	if(page==1){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/1"
	}else if(page==2){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/2";
	}else if(page==3){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/3";
	}else if (page==4){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/4?typeId="+typeId;
	}else if (page==5){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/5?id="+id+'&typeId='+typeId;;
	}else if (page==6){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/6?type="+type;
	}else if(page==7){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/7";
	}else if(page==8){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/8";
	}else if(page==10){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/10";
	}else if(page==11){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/11";
	}else if(page==12){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/12";
	}else if(page==13){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/13";
	}else if(page==14){
		url = "${ctx}/front/cityDataCenter/ycLdIndex/14";
	}
	$("#redirectUrl").val(url);
	if(isLogin=='1'){
	 /* 	$('#login').hide();
		$('#nologin').show();  */
	}else{
		$('#imageCaptcha').click(); 
		layer.open({
	        type: 1,
	        title: false,
	        closeBtn: 1,
	        shade: [0.3],
	        shadeClose: false,
	        area: ['290px', '330px'],
	        content: $(".toLogin")
	    });
	}
}
function toOffice(path){
	$.ajax({
		url : "${ctx}/session/account/isLogin",
		type : "get", 
		async: false,
		dataType : "json",
		success : function(result) {
			if(result.success){
				var url=path.replaceAll("&","%26").replace("?","%3F");
				window.open("${ctx}/toXOffice?type=0&path="+url);
			}else{
				tips('亲，您还没有登录');
			}
		},
		error : function() {
			tips("请求超时，请稍后重试");
		}
	});
}
String.prototype.replaceAll=function(f,e){//全部替换
    var reg=new RegExp(f,"g"); //创建正则RegExp对象   
    return this.replace(reg,e); 
}
function logout(){
	 $.post("${ctx}/session/logout", {'ajax': 1}, function (data) {
	        	 $('#nologin').show();
	             $('#login').hide();
	             $('#userName').html('');
	             restoreSession();
		         window.location.reload();
	     }); 
}
function restoreSession(){
	var urlPath=$("#urlPath").val();
	var entranceId=$("#entranceId").val();
	$.post("${ctx}/restoreSession", {'urlPath': urlPath,'entranceId':entranceId}, function (data) {
 }); 
}
function logoutOffice(){
	var urlPath=$("#urlPath").val();
	$.post(urlPath+"XOffice/session/logout",
			function(data){
 	}); 
}
function KeyDown(event){
	event = event || window.event;
	var keyCode = event.keyCode;
    if (keyCode == 13)
    {
        event.returnValue=false;
        event.cancel = true;
        $("#loginBt").click();
    }
}  
function checkboxOnclick(checkbox){
	if(checkbox.checked == true){
		$('#status').val("on");
	}else{
		$('#status').val("off");
	}
}
function goMain(redirectUrl){
	var param={"entranceKind":0,
			  "authKind":0,
			  "captchaKind":1,
			  "loginType":"",
			  "entranceValue":0,
			  "remember-me":$('#status').val()
		      } ;
	param["username"]= $('#username').val(); 
	param["password"]= $('#password').val(); 
	param["captchaValue"]=$('#captchaValue').val(); 
	var t = new Date().getTime();
	var index= layer.load(0, {shade: false});
	$.ajax({  
		type: "post",
		url: "${ctx}/session/login",
		dataType: "json", 
		data:param,
		success: function(data){
			   if(data.success){
				   $('#login').show();
				   $('#nologin').hide();
				   window.location.href= redirectUrl;//  刷新首页
			   }else{
				   layer.close(index);
				   $('#imageCaptcha').click(); 
				   layer.msg(data.errorMsg);
			   }
		    },  
			error: function(a,b,c){ 
				layer.close(index);
				 $('#imageCaptcha').click(); 
				layer.msg(a);
			} 
	 });
	
}
</script>
</html>
