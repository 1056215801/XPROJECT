<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>手机验证</title>
<%@ include file="../../../common/commonPage_mobile.jsp"%>
<link href="${ctx}/static/weixin/css/login/login.css" rel="stylesheet"/>
<script src="${ctx}/static/script/pt.js" type="text/javascript"></script>
<script src="${ctx}/static/script/mobile/weixin/login/phoneVerification.js" type="text/javascript"></script>

</head>

<body>
  <c:url value="/session/login" var="loginUrl" />  
  <form name="loginForm" id="loginForm" action="${loginUrl}" method="post" >
    <input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
    <input type="hidden"  name="redirectUrl" value="${sessionScope.redirectUrl}"/>
    <input type="hidden" name="entranceKind" value="0" />
    <input type="hidden" name="entranceValue" id="entranceValue" value="<c:out value='${sessionScope.entranceId}' default='0' />" />
    <input type="hidden" name="authKind" id="authKind" value="1" />
    <input type="hidden" name="captchaKind" value="0"/>
    <input type="hidden" name="captchaValue" value="0"/>
    <br /> 
	<div class="login_main">
		<div class="input_dataBar">
			<div class="input_data">
				<div class="input_dataLeft">手机号</div>
				<input type="text" placeholder="" value="${sessionScope.username}" class="inputContral" name="username" id="username" readonly="readonly">
			</div>
			<div class="input_data">
				<div class="input_dataLeft">密码</div>
				<input type="password" placeholder="请输入您的登录密码" class="inputContral" name="password" id="password">
			</div>
		</div>
		<div class="retrievePassword">
			<div id="retrievePasswordBt" >忘记密码？</div>
		</div>
		<div style="padding:10px 7px;">
			<input type="button" value="绑&nbsp;定" class="buttonContral_red" id="bindBt">
		</div>
		<div class="login_tips">该手机<font style="color:#f14342;">${sessionScope.username}</font>已注册，可直接输入密码绑定</div>
	</div>
   </form> 	
</body>
</html>
