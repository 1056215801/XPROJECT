<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>绑定手机号</title>
<%@ include file="../../common/commonPage.jsp"%>

<link href="${ctx}/static/css/login/bind.css" rel="stylesheet"/>
<link href="${ctx}/static/css/login/buttons.css" rel="stylesheet"/>

<script src="${ctx}/static/script/pt.js" type="text/javascript"></script>
<script src="${ctx}/static/script/login/weixin/phoneVerification.js" type="text/javascript"></script>

</head>

<body>

<c:url value="/session/login" var="loginUrl" />
<form name="loginForm" id="loginForm" action="${loginUrl}" method="post" >
  <input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
  <input type="hidden" name="entranceKind" value="0" />
  <%-- 设置表单 entranceValue 登录入口字段，通过Apache虚拟主机方式会自动带入entranceId，默认为0 --%>
  <input type="hidden" name="entranceValue" id="entranceValue" value="<c:out value='${sessionScope.entranceId}' default='0' />" />
  <input type="hidden" name="authKind" value="1" />
  <input type="hidden" name="captchaKind" value="0"/>
  <input type="hidden" name="captchaValue" value="0"/>
  <input type="hidden" name="redirectUrl" value="${sessionScope.redirectUrl}" />
 
  <div class="bind_main">
	<img src="${ctx}/static/image/login/TOP.jpg" width="100%;" height="220px;">
	<div class="bind_content">
		<div class="bindPhone">
			<div class="bottomLine"></div>
			<div style=" position:relative;">
				<div class="loginModeGray">绑定手机号</div>
				<div style="clear:both;"></div>
			</div>
			<div style="background-color:#F0F0F0; padding:5px 7px;">
				该手机号“<font style="color:#f14342;">${sessionScope.username}</font>”已注册，可直接输入密码进行绑定
			</div>
			<div style="margin-top:20px;">
				<input type="text" placeholder="请输入您注册的手机号" readonly="readonly" class="input_Contral" name="username" id="username" value="${sessionScope.username}">
                <input type="password" placeholder="请输入您的密码" class="input_Contral" name="password" id="password">
			</div>
			<input type="button" class="button button-raised button_Contral" style="width:30%;" value="返回" id="backBt">
			<input type="button" class="button button-raised button-caution button_Contral" style="width:60%;" value="绑&nbsp;定" id="bindBt">
		</div>
		
	</div>
	<div class="copyright">Copyright Notice ? 2016-2020 Park Enterprises 赣ICP备16003961号-1</div>
</div>


</form>
</body>
</html>

