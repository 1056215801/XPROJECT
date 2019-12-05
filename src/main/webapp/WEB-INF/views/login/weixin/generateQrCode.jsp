<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>微信扫码</title>
<%@ include file="../../common/commonPage.jsp"%>
<%-- 腾信微信公共平台提供API --%>
<script type="text/javascript" src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>	

<script src="${ctx}/static/script/pt.js" type="text/javascript"></script>
 
<script src="${ctx}/static/script/login/weixin/generateQrCode.js" type="text/javascript"></script>

<link href="${ctx}/static/css/login/login.css" rel="stylesheet"/>
<link href="${ctx}/static/css/login/buttons.css" rel="stylesheet"/>
<link href="${ctx}/static/css/login/SD-tipbox.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript">
 $(function(){     
    //显示微信二维码
    var obj = new WxLogin({
	      id:"QRCodeImgPanel", 
	      appid: "${appId}", 
	      scope: "snsapi_login", 
	      redirect_uri: "${redirectUri}",
	      state: "${state}",
	      style: "black" ,
	      href: "https://wx.jx968969.com/XProject/static/css/login/QRCodeContral.css"
	    });		
    //1.连接必须是https的安全连接，http的不行
	//2.不能填本地的路径,这是一个公网的路径
 });
</script>
</head>

<body>



<div class="login_main">
	<img src="${ctx}/static/image/login/TOP.jpg" width="100%;" height="220px;">
	<div class="login_content">		
		<div class="WeChatLogin">
			<div class="bottomLine"></div>
			<div style=" position:relative;">
				<div class="loginModeRed">微信登录</div>
				<img src="${ctx}/static/image/login/phone.png" class="switchMode" width="22px" height="33px;" style="margin-right:14px;" id="indexBt">
				<div class="SD-tipbox">
					<div class="cntBox">
						<p>手机号密码登录</a>
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
						
			<%--
			  <img src="${ctx}/static/image/login/frozen-water.jpg" width="180px;" height="180px;" class="QRCode_Contral">
			 --%>
			<div class="QRCode_Contral" id="QRCodeImgPanel" style="margin:0 auto;padding-left:40px;height:200px"></div>
			<%-- <div class="QRCodeTips">请使用微信扫描二维码登录</div>  --%>
				
		
		</div>
	</div>
	<div class="copyright">Copyright Notice © 2016-2020 Park Enterprises 赣ICP备16003961号-1</div>
</div>


</body>
</html>
