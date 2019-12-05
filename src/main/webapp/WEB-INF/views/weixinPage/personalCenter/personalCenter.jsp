<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>个人中心</title>
<link href="${ctx}/static/weixin/css/personalCenter/personalCenter.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<script type="text/javascript">
	//解除绑定
	function removeBinding() {
		var confirmIndex = layer.confirm("<div>退出后需要重新绑定</div>确认是否退出?",
				function(index, layero) {
					layer.close(confirmIndex);
					$.ajax({
						url : "${ctx}/personalCenter/removeBinding",
						type : "post",
						data : {},
						dataType : "json",
						success : function(result) {
							logout();
						},
						error : function() {
							layer.msg("系统异常");
						}
					});
				});
	}

	//退出登录
	function logout() {
		$.ajax({
			url : "${ctx}/session/logout",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result) {
				//关闭微信当前页
				WeixinJSBridge.invoke('closeWindow', {}, function(res) {

				});
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
	}
</script>
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
				<a href="${ctx}/personalCenter/weixin/messageNotification">
					<div class="per_operLast">
						<div class="per_operLeft">消息通知</div>
						<div style="float: right;">
							<img src="${ctx}/static/weixin/images/personalCenter/jiantou.png" width="12px" height="12px">
						</div>
						<div style="clear: both;"></div>
					</div>
				</a>
			</div>
			<div class="per_operBar">
				<a href="${ctx}/personalCenter/weixin/updatePassWord">
					<div class="per_oper">
						<div class="per_operLeft">修改密码</div>
						<div style="float: right;">
							<img src="${ctx}/static/weixin/images/personalCenter/jiantou.png" width="12px" height="12px">
						</div>
						<div style="clear: both;"></div>
					</div>
				</a> <a href="${ctx}/personalCenter/weixin/bindingMobile">
					<div class="per_oper">
						<div class="per_operLeft">手机绑定</div>
						<c:if test="${bindInfo.openId!=null}">
							<div class="per_operRight">重新绑定</div>
						</c:if>
						<c:if test="${bindInfo.openId==null}">
							<div class="per_operRight"></div>
						</c:if>
						<div style="clear: both;"></div>
					</div>
				</a> <a href="${ctx}/personalCenter/accountUpgrade">
					<div class="per_oper">
						<div class="per_operLeft">账号升级</div>
						<div style="float: right;">
							<img src="${ctx}/static/weixin/images/personalCenter/jiantou.png" width="12px" height="12px">
						</div>
						<div style="clear: both;"></div>

					</div>
				</a>
				<div class="per_operLast">
					<div class="per_operLeft">注册时间</div>
					<div class="per_operLeftNext" style="width: 50%;">
						<fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm" />
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div class="per_operBar">
				<%-- <c:choose>
					<c:when test="${isVisitor}">
						<a href="${ctx}/personalCenter/parkEdit">
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0);">
					</c:otherwise>
				</c:choose>
				<div class="per_oper">
					<div class="per_operLeft">默认园区</div>
					<div class="per_operLeftNext" style="width: 50%;">${defaultPark}</div>
					<c:if test="${isVisitor}">
						<div class="per_operRight">设置</div>
					</c:if>
					<div style="clear: both;"></div>
				</div>
				</a> --%>
				<c:choose>
					<c:when test="${isVisitor}">
						<a href="${ctx}/personalCenter/companyEdit">
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0);">
					</c:otherwise>
				</c:choose>
				<div class="per_operLast">
					<div class="per_operLeft">默认企业</div>
					<div class="per_operLeftNext">${defaultCompany}</div>
					<c:if test="${isVisitor}">
						<div class="per_operRight">设置</div>
					</c:if>
					<div style="clear: both;"></div>
				</div>
				</a>
			</div>
			<div class="per_operBar">
				<div class="per_oper" onclick="removeBinding()">
					<div class="per_operLeft">退&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;出</div>
					<div style="clear: both;"></div>
				</div>
			</div>

		</div>

		<!-- 	<div class="navigationBar"> -->
		<!-- 		<ul>    -->
		<!-- 			<li style="width:50%;"> -->
		<%-- 				<a href="${ctx}/personalCenter/weixin/main"> --%>
		<%-- 					<div class="navImage"><img src="${ctx}/static/weixin/images/personalCenter/shou.png" width="20px;" height="20px;"/></div> --%>
		<!-- 					<div class="navTitle">首页</div> -->
		<!-- 				</a> -->
		<!-- 			</li> -->
		<!-- 			<li style="width:50%;"> -->
		<%-- 				<a href="${ctx}/personalCenter/weixin/personalInfoBingding"> --%>
		<%-- 					<div class="navImage"><img src="${ctx}/static/weixin/images/personalCenter/gern1.png" width="20px;" height="20px;"/></div> --%>
		<!-- 					<div class="navTitle">我的</div> -->
		<!-- 				</a> -->
		<!-- 			</li> -->
		<!-- 		</ul> -->
		<!-- 	</div> -->
	</div>
</body>
</html>
