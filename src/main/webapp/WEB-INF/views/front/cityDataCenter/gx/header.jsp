<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxHomePage.css"/>
<style>
.head {
    position: relative;
    height: 90px;
  	background: url(${ctx}/static/image/cityDataCenter/gx/head.png) no-repeat center;
 	-webkit-background-size: cover;
	background-size: cover;
    font-size: 0;
    background-size: 100% 100%;
}
.logo {
    position: absolute;
    left: 1.5%;
    top: 5px;
}
.index-img {
    margin: 10px 30px 0 2.9%;
    width: 28%;
    vertical-align: top;
}
.tab{
}
.head img { cursor: pointer;}
.time {
    position: absolute;
    right: 1.5%;
    top: 50px;
}
.time a { 
    display: block;
    text-align: right;
}
.time font {
    margin-top: 2px;
    vertical-align: middle;
    font-size: 14px;
    color: #fff;
    display: inline-block;
    max-width: 85px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    -webkit-line-clamp: 1;
    margin-left: 5px;
}
.inputContentBar {
	margin-top:31px;
}
.displayNo {
	display: none;
}
.keyboard {
	position:absolute;
	top: 0px;
	right:5px;
	cursor:pointer;
}
.accountName {
  margin-right: 10px;
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
    background: #05579e !important;
    border-color: #05579e !important;
}
.btn-success:hover{
 	 background: #05579e !important;
 	 border-color: #05579e !important;
}
.head-a {
	position: relative;
    margin: 42px 52px 0;
    width: 140px;
    height: 44px;
    display: inline-block;
    color: #fff;
    text-decoration: none;
    font-size: 18px;
    line-height: 44px;
    text-align: center;
    font-weight: bold;
}
.head-a {
	background: url(/XProject/static/image/cityDataCenter/gx/cl1.png) no-repeat center;
    -webkit-background-size: 100% 100%;
    background-size: 100% 100%;
}
.head-a.on {
	color: #FFE42D;
	background: url(/XProject/static/image/cityDataCenter/gx/cl2.png) no-repeat center;
    -webkit-background-size: 100% 100%;
    background-size: 100% 100%;
}
.head-select {
	position: absolute;
    left: 10px;
    top: 24px;
    border: 1px solid;
    border-radius: 3px;
}
.head-select.selects .select {
    margin-left: 0px;
    padding: 0 10px;
}
.head-select .select-items {
    left: 0;
    top: 105%;
}
.tab {
    position: relative;
    display: inline-block;
    height: 90px;
    font-size: 0;
    width: 57.5%;
}
.currentTime{
    position: absolute;
    font-size: 14px;
    bottom: 8px;
    left: 12%;
    vertical-align: middle;
    color: #03E0C2;
    text-decoration: none;
}
.inputContentBar {
	margin-top:31px;
}
.displayNo {
	display: none;
}
.keyboard {
	position:absolute;
	top: 0px;
	right:5px;
	cursor:pointer;
}
.accountName {
  margin-right: 10px;
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
    background: #05579e !important;
    border-color: #05579e !important;
}
.btn-success:hover{
 	 background: #05579e !important;
 	 border-color: #05579e !important;
}
@media screen and (max-width: 1600px){
	.head-a {
		/* margin: 0 5px; */
		margin: 34px 40px 0;
		width: 110px;
		height: 56px;
		line-height: 56px;
		font-size: 16px;
	}
	.head-select { top: 18px;}
}
@media screen and (max-width: 1440px){
	.head-a {
		width: 90px;
		font-size: 14px;
	}
	.time font {
		font-size: 12px;
		-webkit-transform: scale(0.8);
		transform: scale(0.8);
		-webkit-transform-origin: left;
		transform-origin: left;
	}
	.accountName {margin-right: 0px; }
}
@media screen and (max-width: 1366px){
	.head-a {
		width: 80px;
		font-size: 12px;
	}
	.time font {
		font-size: 10px;
		-webkit-transform: scale(0.9);
		transform: scale(0.9);
		-webkit-transform-origin: left;
		transform-origin: left;
	}
	.accountName {margin-right: 0px; }
}

</style>
	<div class="head">
		<%-- <a class="to-province"  href="${ctx}/front/cityDataCenter/gxwIndex/0"><img src="${ctx}/static/image/cityDataCenter/yc/jx.png"></a> --%>
		<img class="index-img" onclick="location.href='/XProject/front/cityDataCenter/gxIndex/1'" src="/XProject/static/image/cityDataCenter/gx/logo.png">
	   <div class="tab">
	      	<a href="${ctx}/front/cityDataCenter/gxIndex/1?companyId=201411131526138080227" class="head-a">首页</a>
      	  	<a href="${ctx}/front/cityDataCenter/gxIndex/2?companyId=201411131526138080227" class="head-a">企业画像</a>
			<a href="${ctx}/front/cityDataCenter/gxIndex/3" class="head-a">运营管理</a>
	   </div>
	   	<a href="javascript:;" class="currentTime"><font id="time"></font></a>
		<div class="time">
			<a href="javascript:;" onclick="toLogin()" id="nologin"><img src="${ctx}/static/image/liData/peo.png"><font>登录</font></a>
			<a href="javascript:;" style="display:none;" id="login"><img src="${ctx}/static/image/liData/peo.png"><font  class="accountName">${accountName}</font><img width="18" src="${ctx}/static/image/liData/logout Data.png"><font onclick="logout()">退出</font></a>
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
	if(isLogin=='1'){ 
		$('#login').show();
		$('#nologin').hide();
	}else{ 
		$('#login').hide();
		$('#nologin').show(); 
		layer.msg('系统检测到您未登录，即将跳转到首页', { //加载层
   		  shade: [0.95,'rgba(0, 4, 59,.95)']
    	});
		return setTimeout(function(){
			window.location.href = "${OfficeUrl}XOffice/login/gx"; 
		}, 1500);
		 
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
			redirectUrl="${ctx}/front/cityDataCenter/gxIndex/1" ;
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
	var url  = "";
	if(page==2){
		var url = "${ctx}/front/cityDataCenter/gxIndex/2?companyId=201411131526138080227";
	}else{
	  url = "${ctx}/front/cityDataCenter/gxIndex/"+page;
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
	$('#redirectUrl').val(url);
	if(isLogin=='1'){ 
		/* if('${cityId}'==360900){
			if('${orgType}'==0||'${orgType}'==1 ||'${orgType}'==2 ||'${orgType}'==4){
				window.location.href = url;
			}else{
				alert('您暂无权限查看二级页面')
			}
		}else{
			if('${governmentKind}'==2){
				window.location.href = url;
			}else{
				alert('您暂无权限查看二级页面')
			}
		} */
		if('${governmentKind}'==2){
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

function toOffice(path,url){
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
