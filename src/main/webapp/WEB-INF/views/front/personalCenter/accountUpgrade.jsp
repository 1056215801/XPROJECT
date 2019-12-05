<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>账号升级</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx }/static/css/personalCenter/accountUpgrade.css" rel="stylesheet"/>
<style type="text/css">
/*防止Bootstrap样式影响laydate组件*/
* {
	-webkit-box-sizing: inherit!important;
	-moz-box-sizing: inherit!important;
	box-sizing: inherit!important;
}
</style>
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
 })
 
function government(accountId){
	 if('${isUpgrade}'==1){
		 tips("您已经是政府用户");
		 return false;
	 }
	 window.location.href = "${ctx}/projectDeclare/upgradeCreate?accountId="+accountId;
 }
</script>
</head>

<body>
<div class="upgrade_main">
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
	
	<div class="upgrade_content">
		<div class="upgrade_contentLeft">
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
						<a href="${ctx }/personalCenter/accountSecurity">账号安全</a>
					</li>
					<li>
						<a href="${ctx }/personalCenter/accountUpgrade" style="color:#000;">账号升级</a>
					</li>
					<%-- <li><a href="${ctx }/personalCenter/parkEdit">园区设置</a></li> --%>
					<li><a href="${ctx }/personalCenter/companyEdit">企业设置</a></li>
				</ul>
			</div>
		</div>
		<div class="upgrade_contentRight">
			<div class="upgrade_cont">
				<div class="upgrade_top">账号升级</div>
				<div style="padding:0 15px 20px;">
					<div class="upgrade_dataTop">
						<img src="${imageInfo.imageUrl }" width="80px" height="80px" class="upgrade_dataTopImg">
						<div class="upgrade_dataTopCont">
							<div class="upgrade_dataTopCase1">
								<div class="upgrade_dataTopCaseLeft">通行证名称：</div>
								<div class="upgrade_dataTopCaseRight">${bindInfo.openId }</div>
								<div class="upgrade_dataTopCaseLeft">昵称：</div>
								<div class="upgrade_dataTopCaseRight">${info.accountNick }</div>
								<div style="clear:both;"></div>
							</div>
							<div class="upgrade_dataTopCase2">
								<div class="upgrade_dataTopCaseLeft">已升级服务：</div>
								<div class="upgrade_dataTopCaseRight">
									<%-- <img src="${ctx}/static/image/personalCenter/sincerity.jpg" width="20px" height="20px" style="vertical-align:middle;"> --%>
									<c:if test="${isUpgrade==1 }">
									<img src="${ctx}/static/image/personalCenter/government.jpg" width="20px" height="20px" style="vertical-align:middle;">
									</c:if>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div style="padding:5px;">
						<div class="upgradeItem">
							<div class="upgradeData">
								<img src="${ctx}/static/image/personalCenter/sincerity.jpg" width="80px" height="80px">
								<div class="upgradeDataCont">
									<div class="upgradeType">诚信企业</div>
									<div class="upgradeDetails">企业的真实性与合法性、个人信息的保护、在线商务行为的诚信</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="upgradeBtn">
								<div class="upgradeBtnVal">申请开通</div>
							</div>
							<div style="clear:both;"></div>
						</div>
						<div class="upgradeItem">
							<div class="upgradeData">
								<img src="${ctx}/static/image/personalCenter/government.jpg" width="80px" height="80px">
								<div class="upgradeDataCont">
									<div class="upgradeType">政府权限</div>
									<div class="upgradeDetails">我是政府部门我要开通申请政府权限，以便发布相关信息</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="upgradeBtn">
								<div class="upgradeBtnVal" onclick="government('${info.accountId }');">申请开通</div>
							</div>
							<div style="clear:both;"></div>
						</div>
						<div class="upgradeItem">
							<div class="upgradeData">
								<img src="${ctx}/static/image/personalCenter/sincerity.jpg" width="80px" height="80px">
								<div class="upgradeDataCont">
									<div class="upgradeType">诚信企业</div>
									<div class="upgradeDetails">企业的真实性与合法性、个人信息的保护、在线商务行为的诚信</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="upgradeBtn">
								<div class="upgradeBtnVal">申请开通</div>
							</div>
							<div style="clear:both;"></div>
						</div>
						<div class="upgradeItem">
							<div class="upgradeData">
								<img src="${ctx}/static/image/personalCenter/government.jpg" width="80px" height="80px">
								<div class="upgradeDataCont">
									<div class="upgradeType">政府权限</div>
									<div class="upgradeDetails">我是政府部门我要开通申请政府权限，以便发布相关信息</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="upgradeBtn">
								<div class="upgradeBtnVal" onclick="government('${info.accountId }');">申请开通</div>
							</div>
							<div style="clear:both;"></div>
						</div>
						
						<div style="clear:both;"></div>
					</div>
				</div>
			</div>	
			<div style="clear:both;"></div>
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
