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
<script src="${ctx}/static/script/login/weixin/phoneInput.js" type="text/javascript"></script>


</head>

<body>

<c:url value="/session/page/login/weixin/phoneVerification" var="phoneVerificationUrl" />


<form name="phoneVerificationForm" id="phoneVerificationForm" action="${phoneVerificationUrl}" method="post" >
  <input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>




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
				请给你的微信账户“<font style="color:#f14342;">${sessionScope.accountWeixinBean.nickName}</font>”绑定手机号码
			</div>
			<div style="margin-top:20px;">
				<input type="text" placeholder="请输入您注册的手机号" class="input_Contral" name="username" id="username" value="${sessionScope.username}">
               
			</div>
			<input type="button" class="button button-raised button_Contral" style="width:30%;" value="返回" id="backBt">
			<input type="button" class="button button-raised button-caution button_Contral" style="width:60%;" value="验&nbsp;证" id="phoneVerificationBt">
		</div>
		
	</div>
	<div class="copyright">Copyright Notice ? 2016-2020 Park Enterprises 赣ICP备16003961号-1</div>
  </div>
</form>
</body>
</html>