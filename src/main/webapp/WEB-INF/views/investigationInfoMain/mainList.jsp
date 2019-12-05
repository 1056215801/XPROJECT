<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>全部调查列表</title>

 
<script type="text/javascript">
	function createInfo(id){
		window.location.href = "${ctx}/investigationInfoMain/createInfo?id="+id;
	}
	function count(id){
		window.location.href = "${ctx}/investigationInfoMain/count/"+id;
	}
</script>
</head>

<body class="">
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/investigationInfoMain/mainList" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=" "> <!-- 
					<h4 class="example-title">列表</h4> -->
					<div class=" ">
						<%-- <div class="btn-group hidden-xs" id="infoTableToolbars" role="group">
							<button type="button" class="btn btn-outline btn-default" onclick="add('${ctx}/investigationInfoMain/add')">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
							
							<button type="button" class="btn btn-outline btn-default" onclick="del()">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
						</div> --%>
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th><input type="checkbox" /> 全选</th>
									<th >调查名称</th>
									<th >创建人姓名</th>
									<th >状态</th>
									<th >截止时间</th>
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td><input type="checkbox" /></td>
									<td>${info.investigationName}</td>
									<td>${info.accountName}</td>
									<td>
										<c:choose>
											<c:when test="${info.status==1}">已发布</c:when>
											<c:when test="${info.status==0}">草稿</c:when>
											<c:otherwise>已结束</c:otherwise>
										</c:choose>
									</td>
									<td><fmt:formatDate value="${info.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>
										<img alt="" src="${ctx}/static/image/investigation/attend.png" title="参与调查" style="width: 25px;height: 25px;cursor: pointer;" 
											onclick="createInfo('${info.id}')" />
										<%-- <img alt="" src="${ctx}/static/image/investigation/count.png" title="统计" style="width: 25px;height: 25px;cursor: pointer;" 
											onclick="count('${info.id}')" /> --%>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
				
				<div style="height: 95px; width: 100%;">
					<c:if test="${totalPages>0}">
						<table width="100%" align="left" style="background: #f5f5f5;">
							<tr>
								<td align="left"><span class="pagetip">共检索到${pageTotal}条数据，每页${pageSize}条</span></td>
								<td align="right"><%@ include file="../common/page.jsp"%></td>
							</tr>
						</table>
					</c:if>
				</div>
			</div>
		</div>
		
	</div>
	</form>

</body>
 
</html>
