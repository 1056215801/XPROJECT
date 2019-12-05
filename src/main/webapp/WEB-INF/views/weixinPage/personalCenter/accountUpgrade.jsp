<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>账号升级</title>
<link href="${ctx}/static/weixin/css/personalCenter/personalCenter.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
</head>
<body>
	<div class="per_main">
		<div class="per_content">
			<div class="per_headInfo">
				<c:choose>
					<c:when test="${imageInfo.imageUrl!=null&&imageInfo.imageUrl!=''}">
						<img src="${imageInfo.imageUrl}" width="70px" height="70px" class="per_headImg" style="border-radius: 70px;" />
					</c:when>
					<c:otherwise>
						<img src="${ctx}/static/weixin/images/personalCenter/headPortrait.png" width="70px" height="70px" class="per_headImg" />
					</c:otherwise>
				</c:choose>
				<div style="float: left;">
					<div class="per_headName">${info.accountNick}
						<img src="${ctx}/static/weixin/images/personalCenter/authentication.png" width="30px" height="12px">
					</div>
					<c:if test="${bindInfo.openId!=null}">
						<div class="per_headPhone">${bindInfo.openId}</div>
					</c:if>
					<c:if test="${bindInfo.openId==null}">
						<div class="per_headPhone">暂未绑定手机</div>
					</c:if>
				</div>
				<a href="${ctx}/personalCenter/weixin/personalInfoEdit">
					<div class="per_headOper">编辑></div>
				</a>
				<div style="clear: both;"></div>
			</div>
			<div class="per_operBar">
				<div class="per_operLast">
					<div class="per_operLeft" style="width: 72px;">已升级服务</div>
					<div class="per_operLeftNext">
						<c:if test="${isUpgrade==1 }">
							<img src="${ctx}/static/image/personalCenter/government.jpg" width="20px" height="20px" style="vertical-align: middle;">
						</c:if>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div class="per_operBar">
				<div class="per_operLast">
					<div class="upgradeData">
						<img src="${ctx}/static/image/personalCenter/sincerity.jpg" width="80px" height="80px">
						<div class="upgradeDataCont">
							<div class="upgradeType">诚信企业</div>
							<div class="upgradeDetails">企业的真实性与合法性、个人信息的保护、在线商务行为的诚信</div>
						</div>
						
					</div>
					<div class="upgradeBtn">
						<div class="upgradeBtnVal">申请开通</div>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div class="per_operBar">
				<div class="per_operLast">
					<div class="upgradeData">
						<img src="${ctx}/static/image/personalCenter/government.jpg" width="80px" height="80px">
						<div class="upgradeDataCont">
							<div class="upgradeType">政府权限</div>
							<div class="upgradeDetails">我是政府部门我要开通申请政府权限，以便发布相关信息</div>
						</div>
					</div>
					<div class="upgradeBtn">
						<div class="upgradeBtnVal" onclick="government('${info.accountId }');">申请开通</div>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<div style="padding: 12px 7px;">
			<input type="button" value="返&nbsp;回" onclick="javascript:history.back(-1);" class="buttonContral_white">
		</div>
	</div>
</body>
<script>
$(function(){
	if(${!empty message}){
		layer.msg("${message}");
	}
});

function government(accountId){
	 if('${isUpgrade}'==1){
		 tips("您已经是政府用户");
		 return false;
	 }
	 window.location.href = "${ctx}/projectDeclare/upgradeCreate?accountId="+accountId;
}

</script>
</html>