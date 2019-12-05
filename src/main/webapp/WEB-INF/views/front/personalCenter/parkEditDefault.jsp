<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>默认园区设置</title>
<link href="${ctx}/static/css/personalCenter/personalCenter.css"
	rel="stylesheet" />
	
<script type="text/javascript">
	var newParkInfo = new Array();
	function parkSave(){
		if('${parkList}'==null||'${parkList}'==""){
			layer.msg("请先设置常用园区！");
			return;
		}
		
		if(newParkInfo==null||newParkInfo==""){
			layer.msg("请选择变更园区！");
			return;
		}
		
		$("#newParkInfo").val(newParkInfo);
		
		$("#form").submit();
	}
	
	function select(obj,organizationId,rootId){
		if($(obj).hasClass("selected")){
			$(obj).removeClass("selected");
			newParkInfo.splice(0,newParkInfo.length);
		}else{
			newParkInfo.splice(0,newParkInfo.length);
			
			$("#commonPark .park_dataRight").each(function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
				}
			});
			
			$(obj).addClass("selected");
			newParkInfo.push(organizationId);
			newParkInfo.push(rootId);
			newParkInfo.push($(obj).text());
		}
	}
	
</script>	
</head>

<body>
	<form action="${ctx}/personalCenter/parkSave" id="form" method="post">
		<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type="hidden" id="parkType" name="parkType" value="1">
		<input type="hidden" id="newParkInfo" name="newParkInfo" >
	</form>
	<div class="center_main">
		<div class="project_header">
		  <c:if test="${entranceId==3609009 }"  >
	  <%@ include file="../common/bak/header_yc.jsp"%>
	</c:if>
	<c:if test="${entranceId!=3609009  }"  >
	  <%@ include file="../common/header.jsp"%>
	</c:if>  
	     
		</div>

		<div class="center_content clearfix">
			<div class="centerContentLeft">
				<div class="menuNav">
					<a href="${ctx}/personalCenter/messageNotification"> <img
						src="${ctx}/static/image/personalCenter/message.jpg" width="24"
						height="24" style="vertical-align: middle;"> <span
						style="vertical-align: middle; margin-left: 2px;">消息通知</span>
					</a>
				</div>
				<div class="menuNav">
					<a href="javascript:;"> <img src="${ctx}/static/image/personalCenter/setUp.jpg" width="24"
						height="24"> <span style="margin-left: 2px;">设置</span>
					</a>
					<ul>
						<li>
							<a href="${ctx }/personalCenter/personalInfoEdit" >个人信息</a>
						</li>
						<li>
							<a href="${ctx }/personalCenter/accountSecurity">账号安全</a>
						</li>
						<li>
							<a href="${ctx }/personalCenter/accountUpgrade">账号升级</a>
						</li>
						<%-- <li><a href="${ctx }/personalCenter/parkEdit" style="color:#000;">园区设置</a></li> --%>
						<li><a href="${ctx }/personalCenter/companyEdit">企业设置</a></li>
					</ul>
				</div>
			</div>
			<div class="centerContentRight">
				<div class="centerContent">
					<div class="centerTop">
						园区设置
						<div class="returnOper" onClick="javascript:history.back(-1);">返回&nbsp;></div>
					</div>
					<div style="padding: 0 15px 20px;">
						<div class="details_title">默认园区设置</div>
						<div style="margin-top: 40px;"></div>
						<div class="details_dataBar">
							<div class="details_data clearfix">
								<div class="details_dataLeft">默认园区：</div>
								<div style="width: 90%; float: left;">
									<div class="park_dataRight">${defaultPark}</div>
									<div class="details_dataPrompt">请从以下园区中选择一个作为默认园区</div>
									<div class="details_dataBtn">
										<input type="button" value="确定" class="buttonContralRed" onclick="parkSave();">
									</div>
								</div>
							</div>
						</div>
						<div class="details_dataBar">
							<div class="details_data clearfix">
								<div class="details_dataLeft">常用园区：</div>
								<div style="width: 90%; float: left;" id="commonPark">
									<c:choose>
											<c:when test="${parkList==null}">
												<div class="park_dataRight">暂未设置常用园区</div>
											</c:when>
											<c:otherwise>
												<c:forEach items="${parkList}" var="parkInfo">
													<div class="park_dataRight" onclick="select(this,'${parkInfo.organization_id}','${parkInfo.root_id }');">${parkInfo.park_name}</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	   <c:if test="${entranceId==3609009 }"  >
		  <%@ include file="../common/bak/footer_yc.jsp"%>
		</c:if>
		<c:if test="${entranceId!=3609009  }"  >
		  <%@ include file="../common/footer.jsp"%>
		</c:if>
	</div>
</body>
</html>
