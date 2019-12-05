<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="zh_CN">      
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>登录</title>
        <%@ include file="../../common/commonPage.jsp" %>
        <script src="${ctx}/static/script/pt.js" type="text/javascript"></script>
        <script src="${ctx}/static/script/login/weixin/validateQrCode.js" type="text/javascript"></script>
        <link href="${ctx}/static/css/login/login.css" rel="stylesheet" />
        <link href="${ctx}/static/css/login/buttons.css" rel="stylesheet" />
        <link href="${ctx}/static/css/login/SD-tipbox.css" rel="stylesheet" />
        <style>.displayNo {display:none;} .button_Contral { margin:10px 2% 0; text-align:center; border-radius:20px; font-weight:bold; }</style></head>
      
      <body>
        <div class="login_main">
          <img src="${ctx}/static/image/login/TOP.jpg" width="100%;" height="200px;" />
          <div class="login_content">
            <div class="WeChatLoginVia">
              <div class="bottomLine"></div>
              <div style=" position:relative;">
                <div class="loginModeGray">微信登录</div>
                <c:url value="/session/page/login/index" var="indexUrl" />
                <a href="${indexUrl}">
                  <img src="${ctx}/static/image/login/phone.png" class="switchMode" width="22px" height="33px;" style="margin-right:14px;">
                  <div class="SD-tipbox">
                    <div class="cntBox">
                      <p>手机号密码登录</p>
                    </div>
                    <div class="SD-tipbox-direction SD-tipbox-right">
                      <em>&#9670;</em>
                      <span>&#9670;</span></div>
                  </div>
                </a>
                <div style="clear:both;"></div>
              </div>
              <div class="WeChatTips">
                <img class="headPortrait" id="headImgurl" src="${accountWeixinBean.headImgurl}" width="90" height="90" />
                <div class="WeChatName" id="nickName">${accountWeixinBean.nickName}</div>
                <img class="success" src="${ctx}/static/image/login/dialTelephone.png" width="20px;" height="20px;">
                <div class="successTips" style="">微信扫码成功
                  <c:if test="${not empty accountInfoBean}">，
                    <font style="color:#f14342; font-size:18px;" id="remainTimesTips"></br>3</font>秒后自动跳转</c:if>！
                </div>
              </div>
              <c:choose>
                <c:when test="${not empty accountInfoBean}">
                  <%-- 已经微信绑定账号，业务逻辑会倒计时自动三秒跳转！ --%>
                    <script type="text/javascript">
                    	$(document).ready(function() {
                    	  function jump(count) {
                    	    window.setTimeout(function() {
                              count--;
                              if (count > 0) {
                                $('#remainTimesTips').html(count);
                                jump(count);
                              } else {
                                $("#loginForm").submit();
                              }
                            },
                            1000);
                       };
                       //已经微信绑定账号，要倒计时自动登录。
                       jump(3);
                     });
                    </script>
                    <c:url value="/session/login" var="loginUrl" />
                    <form name="loginForm" id="loginForm" action="${loginUrl}" method="post">
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                      <input type="hidden" name="entranceKind" value="0" />
                      <%-- 设置表单 entranceValue 登录入口字段，通过Apache虚拟主机方式会自动带入entranceId，默认为0 --%>
                        <input type="hidden" name="entranceValue" id="entranceValue" value="<c:out value='${sessionScope.entranceId}' default='0' />" />
                        <input type="hidden" name="authKind" value="4" />
                        <input type="hidden" name="username" value="${accountInfoBean.accountCode}" />
                        <input type="hidden" name="password" id="password" value="" />
                        <input type="hidden" name="captchaKind" value="0" />
                        <input type="hidden" name="captchaValue" value="0" />
                        <input type="hidden" name="redirectUrl" value="${sessionScope.redirectUrl}" />
                    </form>
                </c:when>
                <c:otherwise>
                  <c:url value="/session/page/login/weixin/phoneInput" var="phoneInputUrl" />
                  <form name="phoneInputForm" id="phoneInputForm" action="${phoneInputUrl}" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value=" ${_csrf.token}" />
                    <input type="button" class="button button-raised button-caution button_Contral" style="width:60%;float:left" value="绑定账号" id="phoneInputBt">
                  </form>
                  <c:url value="/session/page/login/register/index" var="registerIndexUrl" />
                  <form name="registerIndexForm" id="registerIndexForm" action="${registerIndexUrl}" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value=" ${_csrf.token}" />
                    <input type="button" class="button button-raised button_Contral" style="width:30%;" value="注册" id="registerIndexBt">
                   </form>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="copyright">Copyright Notice © 2016-2020 Park Enterprises 赣ICP备16003961号-1</div></div>
        
        

      </body>
  
  </html>