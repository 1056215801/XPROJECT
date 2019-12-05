<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/homePage.css"/>
<style>
	
.head {
    position: relative;
    padding: 10px 0 30px;
    text-align: center;
	background: url(${ctx}/static/image/cityDataCenter/ycNew/bg.png) no-repeat center;
	-webkit-background-size: 100% 100%;
	background-size: 100% 100%;
}
.head img { cursor: pointer;}
.time {
    position: absolute;
    right: 10px;
    top: 50%;
    margin-top: -17px;
}
.time a { margin-left: 15px;}
.time font {
    margin-left: 5px;
    margin-top: 2px;
    vertical-align: middle;
    font-size: 14px;
    color: #fff;
    display: inline-block;
}
.inputContentBar {
	margin-top:31px;
}
.displayNo {
	display: none;
}
.keyboard {
	position:absolute;
	top:0pc;
	right:5px;
	cursor:pointer;
}
.sendCode {
	position:absolute;
	top:0;
	right:0;
	width:90px;
	height:34px;
	cursor:pointer;
	background-color: #EFEFEF;
	text-align: center;
	line-height: 34px;
	border: 1px solid #e5e6e7;
}
.verificationCode {
	position:absolute;
	top:0;
	right:0;
	width:90px;
	height:34px;
	cursor:pointer;
}
.imageCaptcha {
	width: 100%;
	height: 34px; 
	border:0px; 
	cursor:pointer;
}
.btn-success{
    background: #05579e;
    border-color: #05579e;
}
.btn-success:hover{
    background: #05579e;
    border-color: #05579e;
}
</style>
	<div class="head">
		<img class="index-img" onclick="location.href='${ctx}/front/cityDataCenter/ycIndex/1?orgId=3609009'" src="${ctx}/static/image/cityDataCenter/ycNew/logo.png">
		<div class="time">
			<a href="javascript:;"><img src="${ctx}/static/image/liData/time.jpg"><font id="time"></font></a>
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
				<input type="text"  id="username" name="username"  maxlength="20" placeholder="请输入账号" class="form-control">
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
					<input type="checkbox" name="remember-me" checked="checked" value="on">
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
			redirectUrl="${ctx}/front/cityDataCenter/ycIndex/1?orgId=3609009" ;
		} 
	    goMain(redirectUrl);
	    return false;
	});	
});
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
	var orgId = '${orgId}';
	var spanIndex = '${spanIndex}'
	var url;
	if(page==1){
		url = "${ctx}/front/cityDataCenter/ycIndex/1?orgId="+orgId;
	}else if(page==2){
		url = "${ctx}/front/front/cityDataCenter/ycIndex/2?orgId="+orgId;
	}else if(page==3){
		url = "${ctx}/front/cityDataCenter/ycIndex/3?orgId="+orgId;
	}else if (page==4){
		url = "${ctx}/front/cityDataCenter/ycIndex/4?orgId="+orgId;
	}else if (page==5){
		url = "${ctx}/front/cityDataCenter/ycIndex/5?orgId="+orgId;
	}else if (page==6){
		url = "${ctx}/front/cityDataCenter/ycIndex/6?orgId="+orgId;
	}else if (page==7){
		url = "${ctx}/front/cityDataCenter/ycIndex/7?orgId="+orgId+'&spanIndex='+spanIndex;
	}else if (page==8){
		url = "${ctx}/front/cityDataCenter/ycIndex/8?orgId="+orgId+'&spanIndex='+spanIndex;
	}else if (page==9){
		url = "${ctx}/front/cityDataCenter/ycIndex/9?orgId="+orgId;
	}else if (page==10){
		url = "${ctx}/front/cityDataCenter/ycIndex/10?orgId="+orgId;
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
function goPage(url){
	if(isLogin=='1'){ 
		if('${governmentKind}'==3&&'${cityId}'==360900){
			window.location.href = url;
		}else{
			alert('您暂无权限查看二级页面')
		}
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
function goMain(redirectUrl){
	var param={"entranceKind":0,
			  "authKind":0,
			  "captchaKind":1,
			  "loginType":"",
			  "entranceValue":0 
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
