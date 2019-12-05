<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="cn">
<%@ include file="../../../common/commonPage_mobile.jsp"%>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit"  /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>账号登录</title>
<link rel="stylesheet" href="${ctx}/static/weui/lib/weui.min.css">
<link rel="stylesheet" href="${ctx}/static/weui/css/jquery-weui.css">
<link rel="stylesheet" href="${ctx}/static/weui/demos/css/demos.css">
<link href="${ctx}/static/css/bootstrap.min14ed.css" rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css" rel="stylesheet">

<link href="${ctx}/static/css/weixin/login.css" rel="stylesheet"/>

</head>
<body>
<div>
    <div class="login_header"><img  style="border-radius:50%;" src="${ctx}/static/image/activity/headPortrait.png" width="90"></div>
     	 <c:url value="/session/login" var="loginUrl" />
    <form name="dataForm" id="dataForm" method="post" action="${loginUrl}" >					      
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" name="entranceKind" value="0" />
    <input type="hidden" name="entranceValue" id="entranceValue" value="<c:out value='${sessionScope.entranceId}' default='0' />" />    
    <input type="hidden"  name="redirectUrl" value="${sessionScope.redirectUrl}"/>
	<input type="hidden" name="authKind" value="0" />
	<input type="hidden" name="captchaKind" value="1"/>
	<input type="hidden" name="loginType" value="wx"/>
     <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
            <div class="weui-cell__bd right">
                <input class="weui-input" type="text" id="username" name="username" value=""  placeholder="请输入用户名">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
            <div class="weui-cell__bd right">
                <input class="weui-input" type="password"  id="password" name="password" value=""  placeholder="请输入密码">
            </div>
        </div>
        <!-- <div class="weui-cell weui-cell_vcode"> -->
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">验证码</label></div>
            <div class="weui-cell__bd right">
                <input class="weui-input" type="tel" id="captchaValue" onkeydown="KeyDown(event)" name="captchaValue"  placeholder="请输入验证码">
            </div>
            <div class="weui-cell__ft">
                <c:url value="/session/page/imageCaptcha" var="imageCaptchaUrl"/>
                <img class="weui-vcode-img right Myimg" style="height: 40px;" src="${imageCaptchaUrl}"  id="imageCaptcha" class="imageCaptcha"   >
            </div>
        </div>
    </div>
    </form>
    <div class="login_operBar clearfix">
    <!--     <div class="login_operLeft"><input type="checkbox"><span>两周内自动登录</span></div> -->
        <div class="login_operRight" onclick="changeUrls('/XProject/session/page/mobile/weixin/login/retrievePassword/index?redirectUrl=','/XWeixin/login')">
        <span>忘记密码？</span></div>
    </div>
    <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
						  <div style="color:red;">&nbsp;&nbsp;&nbsp;
						    ${SPRING_SECURITY_LAST_EXCEPTION.message}
						  </div>			
						</c:if>
    <div class="" style="padding: 7px 15px;">
        <a href="javascript:;" id="logbtn" onclick="checkValue()"   class="weui-btn weui-btn-success">登录</a>
        <a onclick="changeUrls('/XProject/session/page/login/register/index?redirectUrl=','/XWeixin/login')"
         href="javascript:;" class="weui-btn weui-btn-white">注册新用户</a>
        <a href="javascript:history.back(-1);" class="weui-btn weui-btn-white">返回上一页</a>
        <!-- <a href="javascript:history.back(-1);" class="weui-btn weui-btn-white">切换账户</a> -->  
    </div>
</div>
<script>
function KeyDown(event){
	event = event || window.event;
	var keyCode = event.keyCode;
    if (keyCode == 13)
    {
        event.returnValue=false;
        event.cancel = true;
        $("#logbtn").click();
    }
}
function checkValue(){
	var n= $('#username').val();
	var p= $('#password').val();
	var m= $('#captchaValue').val();
	if(n==''){
		alert('登录名不可为空', function(){
			 layer.closeAll();
			 $('#username').focus(); 
		}) ;
		return false ;
	}
	if(p==''){
		alert('密码不可为空', function(){
			layer.closeAll();
			$('#password').focus();
		}) ; 
		return false ;
	}
	if(m==''){
		/* alertNew('验证码不可为空', function(){
			layer.closeAll();
			$('#imageCode').focus();
		}) ;
		return false ; */
	}
	$('#dataForm').submit();
}	 
function changeUrls(link,suffix){
	var href = location.href;
	var www1 = "http://www.jx968969.com";
	var www2 = "https://www.jx968969.com";
	var test1 = "http://test.jx968969.com";
	var test2 = "http://test.jx968969.com";
	var local = "http://localhost:8080";
	if(href.indexOf(www1) == 0 || href.indexOf(www2) == 0) {
		if(suffix!='')
			location.href = www1 + link +www1+suffix;
		else
			location.href = www1 + link ;
	}
	else if(href.indexOf(test1) == 0 || href.indexOf(test2) == 0) {
		if(suffix!='')
			location.href = test1 + link+test1+suffix;
		else
			location.href = test1 + link;
	}
	else if(href.indexOf(local) == 0){
		if(suffix!='')
			location.href = local + link+local+suffix;
		else
			location.href = local + link;
	}
}

$(function() {
	document.getElementById("imageCaptcha").onclick= function(){
	var random = Math.random();
	    $(this).attr("src","${imageCaptchaUrl}?" + random);  
	};
}) ;
</script>
</body>
</html>