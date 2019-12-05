<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>注册</title>
<%@ include file="../../common/commonPage.jsp"%>
<script src="${ctx}/static/script/pt.js" type="text/javascript"></script>
<script src="${ctx}/static/script/login/register/index.js" type="text/javascript"></script>

<link href="${ctx}/static/css/login/register.css" rel="stylesheet"/>
<link href="${ctx}/static/css/login/buttons.css" rel="stylesheet"/>
 <style type="text/css">
html, body, form {height: 100%;}
.register_main {height: 100%;}
.homePageBar {
	position: relative;
	width: 100%;
	height: calc(100% - 120px);
	background: url(${ctx}/static/image/homePage_yc/bbj2.jpg) no-repeat center center / cover;
}
.yclogo {
	position: absolute;
	top: 31px;
	left: 50%;
	margin-left: -229px;
}
.registerExcess {
	background-color: rgba(255,255,255,0.3);
	padding: 10px 20px 30px;
	position: relative;
    top: 40px;
}

/* .loginModeGray {
	color: #fff;
	border-bottom: 3px solid #ffb72d;
}
.button-raised.button-caution {
	border-color: #ffb72d;
	background: -webkit-gradient(linear, left top, left bottom, from(#ffb72d), to(#e2871b));
	background: linear-gradient(top, #ffb72d, #e2871b);
}
.button-raised.button-caution:hover, .button-raised.button-caution:focus {
	background: -webkit-gradient(linear, left top, left bottom, from(#e2871b), to(#e2871b));
	background: linear-gradient(#e2871b, #e2871b);
} */
</style>
</head>

<body>

		<c:url value="/session/login" var="loginUrl" />  
		<form name="loginForm" id="loginForm" action="${loginUrl}" method="post" >
		    <input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		    <input type="hidden"  name="redirectUrl" value="${sessionScope.redirectUrl}"/>
		    <input type="hidden"  name="authKind" value="1" />
		    <input type="hidden"  name="captchaKind" value="0" />	    
		    <input type="hidden"  name="entranceKind" id="entranceKind" value="0" />
		    <input type="hidden" name="entranceValue" id="entranceValue" value="<c:out value='${sessionScope.entranceId}' default='0' />" />
		    
<div class="register_main">
	<img src="${ctx}/static/image/homePage_yc/bj1.png" width="100%" height="120" style="display: block;">
	<img class="yclogo" src="${ctx}/static/image/homePage_yc/logo1.png" title="宜春公共服务平台">
	<div class="homePageBar">
		<div class="register_content registerExcess">
			
			<div class="registerPage">
				<div class="bottomLine"></div>
				<div style=" position:relative;">
					<div class="loginModeGray">注册新用户</div>
					<div style="float:right; color:#ccc; margin:14px 5px 2px; cursor:pointer;" id="loginBt">去登录</div>
					<div style="clear:both;"></div>
				</div>
				
				<div style="margin-top:10px;">
					<input type="text" placeholder="请输入您注册的手机号" class="input_Contral" id="username" name="username" value="${sessionScope.username}">
					<div class="validateContral">
						<input type="text" placeholder="请输入短信验证码" class="messageValidate" id="captchaValue" name="captchaValue" >
					    <input type="button" value="发送验证码" class="validateBtn" id="submitShortMessageCaptchaBt"  style="margin-left:10px;">					
					    <div style="clear: both;"></div>
					</div>
					
					<input type="password" placeholder="请输入您的新密码" class="input_Contral" id="password" name="password">
					<input type="password" placeholder="请再次输入你的新密码" class="input_Contral" id="password1" name="password1">
				</div>
				<div style="margin:10px 5px; color: #fff;">
					<div style="float:left;"><input type="checkbox" class="checkbox_Contral" id="readCheckbox" name="readCheckbox" value="checked">阅读并同意《江西工业园区微讯企业服务云平台协议》</div>
					<div style="clear:both;"></div>
				</div>
				<input type="button" class="button button-raised button_Contral" style="width:30%;" value="返回" id="backBt">
				<input type="button" class="button button-raised button-caution button_Contral" style="width:60%;" value="确认" id="registerBt">
				
			</div>
	
			<div class="registerSuccess displayNo">
				<div class="successTips">
					<img src="<c:out value='${sessionScope.accountWeixinBean.headImgurl}' default='${ctx}/static/image/login/succeed.jpg' />" width="90" height="90" class="successImg" id="headImgPic">
					<div class="successCont">恭喜你注册成功<br><font style="color:#f14342; font-size:18px;" id="remainTimesTips">3</font>秒后自动跳转到登录页面</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copyright">Copyright Notice © 2016-2020 Park Enterprises 赣ICP备16003961号-1</div>
</div>

		

		</form>
		
</body>
</html>
