<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>账号安全</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx }/static/css/personalCenter/accountSecurity.css" rel="stylesheet"/>
<script>
 $(function(){
	 $(".tabName ul li").each(function(){
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
     });
	 $(".tabItem ul li").each(function(){
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
     });
	 
	 $('#cancelPhone').click(function(){
		 $('#bindingPhone').show();
		 $('#boundPhone').hide();
	 });
	 $('#cancelPassWord').click(function(){
		 $('#setPassWord').show();
		 $('#loginPassword').hide();
	 });
	 
	 $('#bindingPhone').click(function bindingPhone(){
		 $('#bindingPhone').hide();
		 $('#boundPhone').show();
	 });
	 
	 $('#setPassWord').click(function setPassWord(){
		 $('#setPassWord').hide();
		 $('#loginPassword').show();
	 });
	 $('#cancelWeixin').click(function setPassWord(){
		 layer.closeAll();
	 });
	
 });
 function mobilePhoneVer(){
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0.3],
		area:['400px','150px'],
		closeBtn:0,
		content: $('#mobilePhoneVer')
	});
 };
 function removeBound(){
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0.3],
		area:['400px','200px'],
		closeBtn:0,
		content: $('#removeBound')
	});
 };
 
 function removeBinding(accountId){
		$.ajax({
			url:"${ctx}/personalCenter/removeBinding",
			type:'post',
			data:{'accountId':accountId},
			dataType:'json',
			success:function(result){
				if(result==1){
					var _div = '<img src="${ctx}/static/image/personalCenter/headPortrait.png" width="20px" height="20px" class="safe_dataImg">'
							   +'<span class="safe_dataLeft">微信绑定：</span>'
							   +'<span class="safe_dataRight">'
				               +'微信账号用于绑定当前账号信息，当前账号信息只能绑定一个微信账号'
							   +'</span>';
					$('#weixin').html(_div);
					layer.closeAll();
					tips("解绑成功！");
				}else if(result==-1){
					tips("解绑异常!");
				}else{
					tips(result);
				}
			},
			error:function(){
				tips("解绑异常!");
			}
		});
 }
 
  function getIdentifyingCode(){
	  var phoneNum = $('#phoneNumber').val();
	  var phone = /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/;
	  if(phoneNum==null || phoneNum == ""){
		  tips("手机号不能为空!");
		  return;
	  }
	  if(!phone.test(phoneNum)){
			layer.open({
				type: 1,
				title:false,
				shadeClose: true,
				shade: [0.3],
				area:['400px','150px'],
				closeBtn:0,
				content: $('#mobilePhoneVer')
			});
			return;
	  } 
	  $.ajax({
			url:"${ctx}/session/json/shortMessageCaptcha",
			type:'post',
			data:{'mobilePhone':phoneNum},
			dataType:'json',
			success:function(result){
				if(result.success==true){
					tips("发送成功！");
				}else{
					tips("发送失败!");
				}
			},
			error:function(){
				tips("发送异常!");
			}
		});
  }
  
  function bindingMobilePhone(){
	  var phoneNum = $('#phoneNumber').val();
	  var identifyingCode = $('#identifyingCode').val();
	  var accountId = '${info.accountId}';
	  var phone = /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/;
	  if(phoneNum==null || phoneNum == ""){
		  tips("手机号不能为空!");
		  return;
	  }
	  if(identifyingCode==null || identifyingCode == ""){
		  tips("验证码不能为空!");
		  return;
	  }
	   if(!phone.test(phoneNum)){
			layer.open({
				type: 1,
				title:false,
				shadeClose: true,
				shade: [0.3],
				area:['400px','150px'],
				closeBtn:0,
				content: $('#mobilePhoneVer')
			});
			return;
	  } 
	  $.ajax({
			url:"${ctx}/personalCenter/bindingMobilePhone",
			type:'post',
			data:{
				'phoneNum':phoneNum,
				'identifyingCode':identifyingCode,
				"accountId":accountId
			},
			dataType:'json',
			success:function(result){
				if(result==1){
					var _div = '<font style="color:#5e5e5e;">'+phoneNum+'</font>'
					           +'变动账户信息接收验证码，接收资金变动短信通知';
					$('#mobileString').html(_div);
					$('#phoneNumber').val("");
					$('#identifyingCode').val("");
					$('#bindingPhone').show();
					 $('#boundPhone').hide();
					tips("绑定成功！");
				}else if(result==-1){
					tips("绑定异常！");
				}else{
					tips(result);
				}
			},
			error:function(){
				tips("绑定异常!");
			}
		});
	  
  }

  function bindPassWord(){
	  var oldPassWord = $('#oldPassWord').val();
	  var newPassWord = $('#newPassWord').val();
	  var repeatPassWord = $('#repeatPassWord').val();
	  var accountId = '${info.accountId}';
	  if(oldPassWord==null || oldPassWord == ""){
		  tips("旧密码不能为空!");
		  return;
	  }
	  if(newPassWord==null || newPassWord == ""){
		  tips("新密码不能为空!");
		  return;
	  }
	  if(repeatPassWord==null || repeatPassWord == ""){
		  tips("重复密码不能为空!");
		  return;
	  }
	  if(repeatPassWord!=newPassWord){
		  tips("两次密码不一致!");
		  return;
	  }
	  
	  $.ajax({
			url:"${ctx}/personalCenter/updatePassWord",
			type:'post',
			data:{
				'oldPassWord':oldPassWord,
				'newPassWord':newPassWord,
				"accountId":accountId
			},
			dataType:'json',
			success:function(result){
				if(result==1){
					 $('#oldPassWord').val("");
					 $('#newPassWord').val("");
					 $('#repeatPassWord').val("");
					 $('#setPassWord').hide();
					 $('#loginPassword').show();
					tips("密码修改成功！");
				}else{
					tips(result);
				}
			},
			error:function(){
				tips("修改异常!");
			}
		});
  }
 
     var wait=60; 
	 function time() {
		 if (wait == 0) { 
			 $('#getIdentifyingCode').attr({"disabled":false});
			 $('#getIdentifyingCode').val("获取验证码"); 
			 wait = 60; 
			 } else { 
				 $('#getIdentifyingCode').attr({"disabled":true}); 
				 $('#getIdentifyingCode').val("重新发送(" + wait + ")"); 
				 wait--; 
				 setTimeout(function() { time(); },1000); 
					} 
	 }
</script>
</head>

<body>
<div class="safe_main">
	<div class="project_header">
	    <%-- <c:if test="${entranceId==3609009 }"  >
		  <%@ include file="../common/bak/header_yc.jsp"%>
		</c:if>
		<c:if test="${entranceId!=3609009  }"  >
		  <%@ include file="../common/header.jsp"%>
		</c:if> --%>
		
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
	</div>
	<%-- <div class="notice_main">
		<%@ include file="../common/header.jsp"%>
		<div class="tabItem" style="background-color: #3A3D4C;">
			<div style="position: relative; top: 6px; margin-left: 75px;">
				<img src="${ctx}/static/image/personalCenter/personalCenter.png" width="25px" height="25px" style="vertical-align: middle;">
				<span style="vertical-align: middle; color: #fff; font-size: 18px; margin-left: 5px;">个人中心</span>
			</div>
		</div>
	</div> --%>
	
	<div class="safe_content">
		<div class="safe_contentLeft">
			<div class="menuNav">
				<a href="messageNotification.html">
					<img src="${ctx}/static/image/personalCenter/message.jpg" width="24" height="24" style="vertical-align:middle;">
					<span style="vertical-align:middle; margin-left:2px;">消息通知</span>
				</a>
			</div>
			<div class="menuNav">
				<a href="javascript:;">
					<img src="${ctx}/static/image/personalCenter/setUp.jpg" width="24" height="24" style="vertical-align:middle;">
					<span style="vertical-align:middle; margin-left:2px;">设置</span>
				</a>
				<ul>
					<li>
						<a href="${ctx }/personalCenter/personalInfoEdit">个人信息</a>
					</li>
					<li>
						<a href="${ctx }/personalCenter/accountSecurity" style="color:#000;">账号安全</a>
					</li>
					<li>
						<a href="${ctx }/personalCenter/accountUpgrade">账号升级</a>
					</li>
					<%-- <li><a href="${ctx }/personalCenter/parkEdit">园区设置</a></li> --%>
					<li><a href="${ctx }/personalCenter/companyEdit">企业设置</a></li>
				</ul>
			</div>
		</div>
		<div class="safe_contentRight">
			<div class="safe_cont">
				<div class="safe_top">账号安全</div>
				<div style="padding:0 15px 20px;">
					<div class="safe_dataTop">
						<img src="${imageInfo.imageUrl }" width="80px" height="80px" class="safe_dataTopImg">
						<div class="safe_dataTopCont">
							<div class="safe_dataTopCase1">
								<div class="safe_dataTopCaseLeft">通行证名称：</div>
								<div class="safe_dataTopCaseRight">${bindInfo.openId }</div>
								<div class="safe_dataTopCaseLeft">昵称：</div>
								<div class="safe_dataTopCaseRight">${info.accountNick }</div>
								<div style="clear:both;"></div>
							</div>
							<div class="safe_dataTopCase2">
								<div class="safe_dataTopCaseLeft">上次登录时间：</div>
								<div class="safe_dataTopCaseRight"><fmt:formatDate value="${info.loginTime}" pattern="yyyy-MM-dd HH:mm"/></div>
								<div class="safe_dataTopCaseLeft">上次登录IP：</div>
								<div class="safe_dataTopCaseRight">${logInfo.loginIp }</div>
								<div style="clear:both;"></div>
							</div>
						</div>
						<div style="clear:both;"></div>
						<div class="safe_dataTopOper" onclick="logout();window.location.href='/XProject/expShare/main';">退出</div>
					</div>
					<div class="safe_data" style="">
						<img src="${ctx}/static/image/personalCenter/password.jpg" width="20px" height="20px" class="safe_dataImg">
						<span class="safe_dataLeft">登录密码：</span>
						<span class="safe_dataRight">登录用户中心时需要登录的密码</span>
						<div class="loginPasswordOper" id="setPassWord">设置密码</div>
						
						<div class="loginPassword" id="loginPassword"  style="display: none">
							<div class="inputBar">
								<div class="inputLeft">旧密码：</div>
								<input type="password" class="inputRight" id="oldPassWord">
							</div>
							<div class="inputBar">
								<div class="inputLeft">新密码：</div>
								<input type="password" class="inputRight" id="newPassWord">
							</div>
							<div class="inputBar">
								<div class="inputLeft">重复新密码：</div>
								<input type="password" class="inputRight" id="repeatPassWord">
							</div>
							<div class="inputBar">
								<input type="button" value="提交" class="buttonContralRed" onclick="bindPassWord();">
								<input type="button" value="取消" class="buttonContralGray" id="cancelPassWord">
							</div>
						</div>
					</div>
					<div class="safe_data">
						<img src="${ctx}/static/image/personalCenter/mobilePhone.jpg" width="20px" height="20px" class="safe_dataImg">
						<span class="safe_dataLeft">手机绑定：</span>
						<span class="safe_dataRight" id="mobileString">
						<c:if test="${bindInfo.openId!=null}">
							<font style="color:#5e5e5e;">${bindInfo.openId }</font>
							变动账户信息接收验证码，接收资金变动短信通知
						</c:if>
						<c:if test="${bindInfo.openId==null}">
							变动账户信息接收验证码，接收资金变动短信通知
						</c:if>
						</span>
						<div class="boundPhoneOper" id="bindingPhone">绑定手机</div>
						
						<div class="boundPhone" id="boundPhone" style="display: none">
							<div class="inputBar">
								<div class="inputLeft">输入新手机号码：</div>
								<input type="text" class="inputRight"  id="phoneNumber">
							</div>
							<div class="inputBar">
								<div class="inputLeft">新手机验证码：</div>
								<input type="text" class="inputRight" style="width:136px;" id="identifyingCode">
								<input type="button" value="获取验证码" class="verificationCode" onclick="getIdentifyingCode();time();" id="getIdentifyingCode">
							</div>
							<div class="inputBar">
								<input type="button" value="提交" class="buttonContralRed" onclick="bindingMobilePhone();">
								<input type="button" value="取消" class="buttonContralGray" id="cancelPhone">
							</div>
						</div>
					</div>
					<div class="safe_data" id="weixin">
						<img src="${ctx}/static/image/personalCenter/WeChat.jpg" width="20px" height="20px" class="safe_dataImg">
						<span class="safe_dataLeft">微信绑定：</span>
						<c:if test="${weixinInfo==null }">
						<span class="safe_dataRight">
					              微信账号用于绑定当前账号信息，当前账号信息只能绑定一个微信账号
						</span>
						</c:if>
						<c:if test="${weixinInfo!=null }">
						<span class="safe_dataRight">
							已绑定微信账号
							<font style="color:#5e5e5e;">${weixinInfo.nickName }</font>
							信息，当前账号信息只能绑定一个账号
						</span>
						<div class="WeChatBoundOper" onClick="removeBound();">解除微信绑定</div>
						</c:if>
					</div>
					<div class="safe_data">
						<img src="${ctx}/static/image/personalCenter/time.jpg" width="20px" height="20px" class="safe_dataImg">
						<span class="safe_dataLeft">注册时间：</span>
						<span class="safe_dataRight">
							<fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm"/>
						</span>
					</div>
					
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	
	<div id="mobilePhoneVer" style="display:none; text-align:center; margin:30px 0;">
		<img src="${ctx}/static/image/personalCenter/headPortrait.png" width="90px" height="90px" style="vertical-align:middle;">
		<span style="vertical-align:middle; font-weight:bold; margin-left:20px;">请输入有效手机号码</span>
	</div>
	
	<div id="removeBound" style="display:none; text-align:center; margin:50px 0;">
		<div style="font-weight:bold; text-align:center;">确定要解除微信账号“${weixinInfo.nickName }”的绑定？</div>
		<div style="padding:5px 0; text-align:center; margin-top:36px;">
			<input type="button" value="确定" class="buttonContralRed" style="margin:0;" onclick="removeBinding('${info.accountId }');">
			<input type="button" value="取消" class="buttonContralGray" id="cancelWeixin">
		</div>
	</div>
	
    <%-- <c:if test="${entranceId==3609009 }"  >
	  <%@ include file="../common/bak/footer_yc.jsp"%>
	</c:if>
	<c:if test="${entranceId!=3609009  }"  >
	  <%@ include file="../common/footer.jsp"%>
	</c:if> --%>
		
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
</div>
</body>
</html>
