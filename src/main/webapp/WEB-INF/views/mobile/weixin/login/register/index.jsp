<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>注册</title>
    <%@ include file="../../../../common/commonPage_mobile.jsp"%>
    <link href="${ctx}/static/weixin/css/login/login.css" rel="stylesheet"/>
    <script src="${ctx}/static/script/pt.js" type="text/javascript"></script>
    <script src="${ctx}/static/script/mobile/weixin/login/register/index.js" type="text/javascript"></script>
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
      <br>
      <div class="login_main">
        <div class="input_dataBar">
          <div class="input_data">
  		    <div class="input_dataLeft">手机号</div>
            <input type="text" placeholder="" class="inputContral" style="width: 40%;" name="username" id="username" value="${sessionScope.username}" >
            <div class="obtainVerification" style="color:#ccc;"  id="submitShortMessageCaptchaBt">获取验证码</div>
            <div class="obtainVerification" style="color:#f14342; display:none;" id="submitShortMessageCaptchaWaitingTips">60s后重发</div>
          </div>
          <div class="input_data">
            <div class="input_dataLeft">验证码</div>
            <input type="text" placeholder="请输入短信验证码" class="inputContral" id="captchaValue" name="captchaValue">
            <!--  <img src="images/dialTelephone.png" width="15px;" height="15px;" class="imgContral">  -->				  
          </div>
          <div class="input_data">
            <div class="input_dataLeft">设置密码</div>
            <input type="password" placeholder="请输入密码" class="inputContral"  id="password" name="password">
          </div>
          <div class="input_data">
            <div class="input_dataLeft">确认密码</div>
            <input type="password" placeholder="请再次输入密码" class="inputContral"  id="password1" name="password1">
          </div>
        </div>
        <div style="padding:10px 7px;">
          <input type="button" value="注&nbsp;册"  id="registerBt" class="buttonContral_red">
        </div>
      </div>
    </form>	
  </body>
</html>