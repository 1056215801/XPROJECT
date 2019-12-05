<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	 <%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>报名列表</title>

<script type="text/javascript">
	
	$(function(){
		var msg = '${message}';
		if(msg!=null&&msg!=""){
			layer.alert(msg);
			msg=null;
		}
	});
	//活动报名
	function eventReg(id){
		$("#activityId").val(id);
		$('#editform').attr("action", "${ctx}/projectactivityenter/save").submit();
	}
	//取消报名
	function cancelReg(id){
		$("#activityId").val(id);
		$('#editform').attr("action", "${ctx}/projectactivityenter/delete").submit();
	}
</script>
</head>

<body class="gray-bg">
	<form action="" method="post" id="editform">
		<input type="hidden" id="activityId" name="activity" value=""/>
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/projectactivityenter/activityList" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=" ">
				 
					<div class=" ">
						
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th data-field="name">活动名称</th>
									<th data-field="status">活动状态</th>
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td>${info.name}</td>
									<td>${info.status==1?"报名中":"已结束"}</td>
									<td>
										<c:if test="${info.status==1}">
											<button class="btn btn-primary btn-sm" type="button" onclick="eventReg('${info.id})">活动报名</button>
											<button class="btn btn-primary btn-sm" type="button" disabled onclick="cancelReg('${info.id}')">取消报名</button>									
										</c:if>
										<c:if test="${info.status==0}">
											活动停止报名
										</c:if>
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
	<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
	<script
		src="${ctx}/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${ctx}/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${ctx}/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script src="${ctx}/static/js/demo/bootstrap-table-demo.min.js"></script>
	 
</body>

</html>
