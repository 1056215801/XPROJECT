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
  <script src="${ctx}/static/script/mobile/weixin/login/index.js" type="text/javascript"></script>

</head>

<body>
  <c:url value="/session/page/mobile/weixin/login/phoneVerification" var="phoneVerificationUrl" />
		
  <form name="phoneVerificationForm" id="phoneVerificationForm" action="${phoneVerificationUrl}" method="post" >
    <br> 
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden"  name="redirectUrl" value="${sessionScope.redirectUrl}"/>
    <input type="hidden" name="entranceId" id="entranceId" value="<c:out value='${sessionScope.entranceId}' default='0' />" />
	<div class="login_main">
		<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
			  <div style="margin-top:20px;color:red; text-indent:2em">
			    ${SPRING_SECURITY_LAST_EXCEPTION.message}
			  </div>			
		</c:if>
		<div class="input_dataBar">
			<div class="input_data">
				<div class="input_dataLeft">手机号</div>
				<input type="text" placeholder="请输入手机号" class="inputContral" id="username" name="username" value="${sessionScope.username}">
			</div>
		</div>
		<div style="padding:10px 7px;">
			<input type="button" value="下一步" class="buttonContral_red" id="phoneVerificationBt">
		</div>
	</div> 

  </form>
</body>
</html>
