<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>园区设置</title>
<link href="${ctx}/static/weixin/css/personalCenter/login.css" rel="stylesheet" />
</head>

<body>
	<div class="login_main">
		<!-- 园区设置表单 -->
		<form id="form" action="${ctx}/personalCenter/parkSelect" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> 
			<input type='hidden' name='parkType' id='parkType'></input>
		</form>
		<c:choose>
			<c:when test="${isVisitor}">
				<div class="input_dataBar">
					<div class="input_data">
						<div class="input_dataLeft">默认园区</div>
						<div class="inputContral" style="width: 60%;">${defaultPark}</div>
						<a href="javascript:setDefaultPark();" style="text-decoration: none;">
							<div class="setOperation">设置&nbsp;></div>
						</a>
					</div>
				</div>
				<div class="input_dataBar">
					<c:if test="${empty parkList}">
						<div class="input_data">
							<div class="input_dataLeft">常用园区</div>
							<div class="inputContral" style="width: 60%;">暂未设置常用园区</div>
							<a href="javascript:setCommonPark();" style="text-decoration: none;">
								<div class="setOperation">设置&nbsp;></div>
							</a>
						</div>
					</c:if>
					<c:forEach items="${parkList}" var="item" varStatus="i">
						<c:choose>
							<c:when test="${i.index eq 0}">
								<div class="input_data">
									<div class="input_dataLeft">常用园区</div>
									<div class="inputContral" style="width: 60%;">${item.PARK_NAME}</div>
									<a href="javascript:setCommonPark();" style="text-decoration: none;">
										<div class="setOperation">设置&nbsp;></div>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="input_data">
									<div class="input_dataLeft"></div>
									<div class="inputContral" style="width: 60%;">${item.PARK_NAME}</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<div class="input_dataBar">
					<div class="input_data">
						<div class="input_dataLeft">默认园区</div>
						<div class="inputContral" style="width: 60%;">${defaultPark}</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		
		<a href="${ctx}/auth/page/mobile/weixin/personalInfoBingding">
			<div style="padding: 10px 7px;">
				<input type="button" value="返&nbsp;回" class="buttonContral_white" style="outline: none;">
			</div>
		</a>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var msg = '${message}';
		if(msg!="" && msg!=null){
			layer.msg(msg);
		}
	});

	/* 设置默认园区（如果常用园区为空必须先设置常用园区） */
	function setDefaultPark(){
		if(${empty parkList}){
			layer.msg("请先设置常用园区");
		}else{
			$("#parkType").val(1);
			$("#form").submit();
		}
	}
	
	/* 设置常用园区 */
	function setCommonPark(){
		$("#parkType").val(2);
		$("#form").submit();
	}
</script>
</html>
