<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>
<%@ include file="../common/commonPage.jsp"%>
<script src="${ctx}/static/script/pt.js" type="text/javascript"></script> 
<script src="${ctx}/static/script/login/index.js" type="text/javascript"></script>

<link href="${ctx}/static/css/login/login.css" rel="stylesheet"/>
<link href="${ctx}/static/css/login/buttons.css" rel="stylesheet"/>
<link href="${ctx}/static/css/login/SD-tipbox.css" rel="stylesheet"/>
<style type="text/css">
html, body, form {height: 100%;}
.login_main {height: 100%;}
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
.loginExcess {
	background-color: rgba(255,255,255,0.3);
	padding: 10px 20px 30px;
	position: relative;
    top: 40px;
}

/* .loginModeRed {
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
<script type="text/javascript">
 function KeyDown(event){
	event = event || window.event;
	var keyCode = event.keyCode;
    if (keyCode == 13){
         event.returnValue=false;
         event.cancel = true;
        $("#loginBt").click();
    }
}
</script>
</head>
<body>
<c:url value="/session/login" var="loginUrl" />		
<form name="loginForm" id="loginForm" action="${loginUrl}" method="post" >

<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
<input type="hidden"  name="redirectUrl" value="<c:out value='${sessionScope.redirectUrl}' escapeXml='true'/>" />

<input type="hidden" name="entranceKind" value="0" />
<%-- 设置表单 entranceValue 登录入口字段sessionScope.entranceId，通过Apache虚拟主机方式会自动带入entranceId，默认为0 --%>
<input type="hidden" name="entranceValue" id="entranceValue" value="0" />


<input type="hidden" name="authKind" value="0" />

<input type="hidden" name="captchaKind" value="0"/>
<input type="hidden" name="captchaValue" value="0"/>


<div class="login_main">
	<img src="${ctx}/static/image/homePage_yc/bj1.png" width="100%" height="120" style="display: block;">
	<img class="yclogo" src="${ctx}/static/image/homePage_yc/logo.png" title="宜春公共服务平台">
	<div class="homePageBar">
		<div class="login_content loginExcess">
			<div class="phoneLogin">
				<div class="bottomLine"></div>
				<div style=" position:relative;">
					<div class="loginModeRed">手机登录</div>
					 <!--  微信图标
					 <img src="${ctx}/static/image/login/WeChat.png" class="switchMode" width="36px" height="30px" id="generateQrCodeBt">
					 -->  
					 <div class="SD-tipbox" style="display:none">
						<div class="cntBox">
							<p>微信扫码登录</a>
						</div>
						<div class="SD-tipbox-direction SD-tipbox-right"><em>&#9670;</em><span>&#9670;</span></div>
					</div>
					<div style="clear:both;"></div>
				</div>
	
	
				<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
				  <div style="margin-top:20px;color:red; text-indent:2em">
				    ${SPRING_SECURITY_LAST_EXCEPTION.message}
				  </div>			
				</c:if>
			
				
				<div style="margin-top:20px;">
					<input type="text" placeholder="请输入您的手机号" class="input_Contral" name=username id="username" maxlength="20" value="${sessionScope.username}">
					<input type="password" placeholder="请输入您的密码" class="input_Contral" name="password" id="password" maxlength="20" onkeydown="KeyDown(event)">
				</div>
				<div style="margin:10px 5px; color: #fff;">
					<div style="float:left;"><input type="checkbox" class="checkbox_Contral">记住账号</div>
					<div style="float:right; cursor:pointer;" id="registerBt">新用户注册</div>
					<div style="float:right; cursor:pointer; margin-right:7px;" id="retrievePasswordBt">忘记密码？</div>
					<div style="clear:both;"></div>
				</div>
				<input type="button" id="loginBt" class="button button-raised button-caution button_Contral" style="width:96%;" value="登&nbsp;&nbsp;录">
			</div>
		</div>
	</div>
	<div class="copyright">Copyright Notice © 2016-2020 Park Enterprises 赣ICP备16003961号-1</div>
</div>
</form>

</body>
</html>
