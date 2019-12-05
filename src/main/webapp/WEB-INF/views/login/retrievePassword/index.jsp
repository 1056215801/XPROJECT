<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>找回密码</title>
<%@ include file="../../common/commonPage.jsp"%>
<script src="${ctx}/static/script/pt.js" type="text/javascript"></script>
<script src="${ctx}/static/script/login/retrievePassword/index.js" type="text/javascript"></script>

<link href="${ctx}/static/css/login/retrievePassword.css" rel="stylesheet"/>
<link href="${ctx}/static/css/login/buttons.css" rel="stylesheet"/>

</head>

<body>
<div class="retrieve_main">
	<img src="${ctx}/static/image/login/TOP.jpg" width="100%;" height="220px;">
	<div class="retrieve_content">
		<div class="confirmPhone">
			<div class="bottomLine"></div>
			<div style=" position:relative;">
				<div class="loginModeGray">找回密码</div>
				<div style="clear:both;"></div>
			</div>
			<div style="margin-top:20px;">
				<input type="text" placeholder="请输入您注册的手机号" class="input_Contral" id="username" name="username" value="${sessionScope.username}">
				<div class="validateContral">
					<input type="text" placeholder="请输入短信验证码" class="messageValidate" id="captchaValue" name="captchaValue">
					<input type="button" value="发送验证码" class="validateBtn" id="submitShortMessageCaptchaBt" style="margin-left:10px;">
					<div style="clear:both;"></div>
				</div>
			</div>
			<input type="button" class="button button-raised button_Contral" style="width:30%;" value="返回" id="backBt" >
			<input type="button" class="button button-raised button-caution button_Contral" style="width:60%;" value="下一步" id="validateBt">
		</div>
		
		<div class="resetPassword displayNo">
			<div class="bottomLine"></div>
			<div style=" position:relative;">
				<div class="loginModeGray">找回密码</div>
				<div style="clear:both;"></div>
			</div>
			<div style="background-color:#F0F0F0; padding:5px 7px;">
				请给你的手机账户“<font style="color:#f14342;"id="mobilePhoneText"></font>”重新设置登录密码
			</div>
			<div style="margin-top:20px;">
			    <input type="hidden" id="state">
				<input type="password" placeholder="请输入您的新密码" class="input_Contral" id="password" name="password">
				<input type="password" placeholder="请再次输入你的新密码" class="input_Contral" id="password1" name="password1">
			</div>
			<input type="button" class="button button-raised button_Contral"  style="width:30%;" value="返回" id="retrievePasswordBt">
			<input type="button" class="button button-raised button-caution button_Contral" style="width:60%;" value="确认" id="resetBt">
		</div>
	</div>
	<div class="copyright">Copyright Notice © 2016-2020 Park Enterprises 赣ICP备16003961号-1</div>
</div>
</body>
</html>
