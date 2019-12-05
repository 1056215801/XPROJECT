<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>常用园区设置</title>
<link href="${ctx}/static/css/personalCenter/personalCenter.css" rel="stylesheet" />
<script type="text/javascript">

	var newParkInfo = new Array();
	function queryByArea(obj,areaId){
		if($(obj).hasClass("selected")){
			$(obj).removeClass("selected");
		}else{
			$("#city .park_dataRight").each(function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
				}
			});
			$(obj).addClass("selected");
		}
		window.location.href="${ctx}/personalCenter/parkSelect?parkType=2&areaId="+areaId;
	}
	
	
	function selectCommonPark(obj,organizationId,rootId,parkName){
		var str = organizationId + "-" + rootId + "-" + parkName;
		if($(obj).hasClass("selected")){
			$(obj).removeClass("selected");
			var i = newParkInfo.length;  
		    while(i--){  
		        if(newParkInfo[i] == str){ 
		        	newParkInfo.splice(i,1); 
		            break;
		        }  
		    }
		}else{
			if(isSelect(parkName)==true){
				layer.msg("该园区已设置为常用园区！");
				return;
			}
			$(obj).addClass("selected");
			newParkInfo.push(str);
		}
	}
	
	function isSelect(parkName){
		var flag = false;
		$("#commonParkList .park_dataRight").each(function(){
			if($(this).text().trim()==parkName){
				flag = true;
			}
		});
		return flag;
	}
	
	
	function deleteCommonPark(obj,organizationId){
		layer.confirm("确认删除常用园区？",function(){
			$.ajax({
				url:"${ctx}/personalCenter/deleteCommonPark",
				type:"get",
				data:{"organizationId":organizationId},
				success:function(result){
					if(result.code==1){
						layer.msg(result.msg);
						$(obj).parent().remove();
						
						if($("#commonParkList .park_dataRight").length==""){
							window.location.reload();
						}
						
					}else{
						layer.alert(result.msg);
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					layer.msg("请求超时，请稍后重试");
				}
			});
		},function(){return;});
	}
	
	function commonParkSave(){
		if(newParkInfo==""||newParkInfo==null){
			layer.msg("请选择需要设置的常用园区！");
			return;
		}
		
		$("#newParkInfo").val(newParkInfo);
		
		$("#form").submit();
	}
</script>
</head>

<body>
	<form action="${ctx}/personalCenter/parkSave" id="form" method="post">
		<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type="hidden" id="parkType" name="parkType" value="2">
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
					<a href="javascript:;"> <img
						src="${ctx}/static/image/personalCenter/setUp.jpg" width="24"
						height="24"> <span style="margin-left: 2px;">设置</span>
					</a>
					<ul>
						<li><a href="${ctx}/personalCenter/personalInfoEdit">个人信息</a>
						</li>
						<li><a href="${ctx}/personalCenter/accountSecurity">账号安全</a>
						</li>
						<li><a href="${ctx}/personalCenter/accountUpgrade">账号升级</a>
						</li>
						<%-- <li><a href="${ctx}/personalCenter/parkEdit"
							style="color: #000;">园区设置</a></li> --%>
						<li><a href="${ctx}/personalCenter/companyEdit">企业设置</a></li>
					</ul>
				</div>
			</div>
			<div class="centerContentRight">
				<div class="centerContent">
					<div class="centerTop">
						园区设置
						<div class="returnOper" onClick="window.location.href='${cxt}/XProject/personalCenter/parkEdit'">返回&nbsp;></div>
					</div>
					<div style="padding: 0 15px 20px;">
						<div class="details_title">常用园区设置</div>
						<div class="details_dataBar">
							<div class="details_data clearfix">
								<div class="details_dataLeft">常用园区：</div>
								<div style="width: 90%; float: left;" id="commonParkList">
									<c:choose>
										<c:when test="${commonParkList==null}">
											<div class="park_dataRight">暂未设置常用园区 </div>
										</c:when>
										<c:otherwise>
											<c:forEach items="${commonParkList}" var="commonParkInfo">
												<div class="park_dataRight">${commonParkInfo.park_name}
												<img src="${ctx}/static/image/personalCenter/delete.png" width="10"
													height="10" class="deleteOper" onclick="deleteCommonPark(this,'${commonParkInfo.organization_id}')">
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<div class="details_dataBtn">
										<input type="button" value="确定" class="buttonContralRed" onclick="commonParkSave()">
									</div>
								</div>
							</div>
						</div>
						<div class="details_dataBar">
							<div class="details_data clearfix" id="city">
								<div class="details_dataLeft">筛选城市：</div>
								<c:choose>
										<c:when test="${areaId==null||areaId==''}">
											<div class="park_dataRight selected" onclick="queryByArea(this,'');">全国</div>
										</c:when>
										<c:otherwise>
											<div class="park_dataRight" onclick="queryByArea(this,'');">全国</div>
										</c:otherwise>
								</c:choose>
								<c:forEach items="${areaList}" var="areaInfo">
									<c:choose>
										<c:when test="${areaInfo.area_id==areaId}">
											<div class="park_dataRight selected" onclick="queryByArea(this,'${areaInfo.area_id}');">${areaInfo.area_name}</div>
										</c:when>
										<c:otherwise>
											<div class="park_dataRight" onclick="queryByArea(this,'${areaInfo.area_id}');">${areaInfo.area_name}</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<div class="details_dataPrompt">（排名不分先后）</div>
							</div>
						</div>
						<div style="margin-top: 20px;"></div>
						<!-- <div class="common_cityBar">
							<div class="common_city">南昌</div>
							<div class="clearfix">
								<div class="park_dataRight selected">江西小蓝经济技术开发区</div>
								<div class="park_dataRight selected">南昌临空经济区</div>
								<div class="park_dataRight">江西昌东工业园区</div>
								<div class="park_dataRight">江西安义工业园区</div>
							</div>
						</div>
						<div class="common_cityBar">
							<div class="common_city">赣州</div>
							<div class="clearfix">
								<div class="park_dataRight">江西瑞金经开区</div>
								<div class="park_dataRight">赣州龙南经开区</div>
								<div class="park_dataRight selected">赣州章贡工业园</div>
							</div>
						</div> -->
						<div class="common_cityBar">
							<c:forEach items="${areaList}" var="areaInfo">
								<c:if test="${areaId!=null&&areaId==areaInfo.area_id}">
									<div class="common_cityBar">
										<div class="common_city">${areaInfo.area_name}</div>
										<div class="clearfix">
											<c:forEach items="${parkList}" var="parkInfo">
												<c:if test="${parkInfo.area_id==areaInfo.area_id&&parkInfo.root_id!=null}">
													<div class="park_dataRight" onclick="selectCommonPark(this,'${parkInfo.organization_id}','${parkInfo.root_id}','${parkInfo.park_name}')">${parkInfo.park_name}</div>
												</c:if>
												<c:if test="${parkInfo.area_id==areaInfo.area_id&&parkInfo.root_id==null}">
													<div class="park_dataRight">暂无可选择园区</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								
								</c:if>
								<c:if test="${areaId==null}">
									<div class="common_cityBar">
										<div class="common_city">${areaInfo.area_name}</div>
										<div class="clearfix">
											<c:forEach items="${parkList}" var="parkInfo">
												<c:if test="${parkInfo.area_id==areaInfo.area_id&&parkInfo.root_id!=null}">
													<div class="park_dataRight" onclick="selectCommonPark(this,'${parkInfo.organization_id}','${parkInfo.root_id}','${parkInfo.park_name}')">${parkInfo.park_name}</div>
												</c:if>
												<c:if test="${parkInfo.area_id==areaInfo.area_id&&parkInfo.root_id==null}">
													<div class="park_dataRight">暂无可选择园区</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</c:if>	
							</c:forEach>
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
