<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>草稿列表</title>
<%@ include file="../common/commonList.jsp"%>

<script type="text/javascript">
	function edit(url,id){
		window.location.href=url+id;
	}
	function publish(id){
		$.ajax({
			url:"${ctx}/investigationInfoMain/json/save",
			type:"get",
			data:{"id":id},
			dataType:"json",
			success:function(result){
				if(result.code==1){
					layer.msg(result.msg);
					$("#"+id).text("已发布");
					$(".edit"+id).hide();
				}else{					
					layer.alert(result.msg)
				}
			}
		});
	}
	function add(){
		window.location.href="${ctx}/investigationInfoMain/add";
	}
</script>
</head>

<body class="">
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/investigationInfoMain/myList" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=" "> <!-- 
					<h4 class="example-title">列表</h4> -->
					<div class=" ">
						<div class="btn-group hidden-xs" id="infoTableToolbars" role="group">
							<button type="button" class="btn btn-outline btn-default" onclick="add()">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
							
							<button type="button" class="btn btn-outline btn-default" onclick="del()">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
						</div>
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th><input type="checkbox" onclick="checkToAll(this)" /></th>
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
									<td> <input type="checkbox" name="items" value="${info.id}" /></td>
									<td>${info.investigationName}</td>
									<td>${info.accountName}</td>
									<td id="${info.id}">
										<c:choose>
											<c:when test="${info.status==1}">已发布</c:when>
											<c:when test="${info.status==0}">草稿</c:when>
											<c:otherwise>已结束</c:otherwise>
										</c:choose>
									</td>
									<td><fmt:formatDate value="${info.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>
									<c:if test="${info.status==0}">
										<img class="edit${info.id}" alt="" src="${ctx}/static/image/investigation/edit1.png" title="编辑" style="width: 25px;height: 25px;cursor: pointer;" 
											onclick="edit('${ctx}/investigationInfoMain/edit/','${info.id}')" />
										<img class="edit${info.id}" alt="" src="${ctx}/static/image/investigation/edit2.png" title="配置调查项" style="width: 22px;height: 22px;cursor: pointer;" 
											onclick="edit('${ctx}/formTemplate/createInputItemsForNew?id=','${info.formId}')"/>
										
									</c:if>
										<img alt="" src="${ctx}/static/image/activity/search.png" title="预览最终效果" style="width: 22px;height: 22px;cursor: pointer;" 
										onclick="window.location.href='${ctx}/formTemplate/preView?id=${info.id}&formId=${info.formId}&status=${info.status}'"/>
										<img alt="" src="${ctx}/static/image/investigation/publish.png" title="发布" style="width: 22px;height: 22px;cursor: pointer;" 
											onclick="publish('${info.id}')"/>
										<img alt="" src="${ctx}/static/image/investigation/export.png" title="测试导出" style="width: 22px;height: 22px;cursor: pointer;" 
											onclick="edit('${ctx}/investigation/downloadInfoByExcel?id=','${info.id}')" />
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
