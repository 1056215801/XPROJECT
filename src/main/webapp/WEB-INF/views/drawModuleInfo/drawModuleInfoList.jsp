<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>模块列表</title>
<%@ include file="../common/commonList.jsp"%>
<script type="text/javascript">
	$(function(){
		var msg = '${message}';
		if(msg!=null&&msg!=""){
			layer.alert(msg);
			msg=null;
		}
	});
	
	function add(url){
		$('#form').attr("action", url).submit();
	}
	
	function edit(url,activityId){
		$("#activityId").val(activityId);
		$('#form').attr("action", url).submit();
	}
	
	function view(url,activityId){
		$("#activityId").val(activityId);
		$('#form').attr("action", url).submit();
	}
	
	function del(url){
		batchDelete(url,'items',$("#listform"));
	}
	
	function toDrawModulePage(id){
		window.location.href="${ctx}/drawModuleInfo/main?id="+id;
		return false;
	}
</script>
</head>

<body class="">
	<form action="" id="form" method="post">
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/drawModuleInfo/list" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=" ">
					<div class=" ">
						<div class="btn-group hidden-xs" id="infoTableToolbars" role="group">
							<button type="button" class="btn btn-outline btn-default" onclick="add('${ctx}/drawModuleInfo/add')">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
							
							<button type="button" class="btn btn-outline btn-default" onclick="del('${ctx}/drawModuleInfo/delete')">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
						</div>
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th width="10%"><input type="checkbox" onclick="checkToAll(this)" /></th>
									<th width="20%">模块名称</th>
									<th width="20%">模块标记</th>
									<th width="20%">创建时间</th>
									<th width="30%">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="obj">
								<tr>
									<td> <input type="checkbox" name="items" value="${obj.id}" /></td>
									<td><a href="${ctx}/drawModuleInfo/edit/${obj.id}">${obj.moduleName}</a></td>
									<td>${obj.uniqueMark}</td>
									<td><fmt:formatDate value="${obj.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>
										<img alt="" src="${ctx}/static/img/detail.png" title="编辑模块" style="width: 22px;height: 22px;cursor: pointer;" onclick="toDrawModulePage('${obj.id}')"/>
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
								<td align="right"><%@ include file="../common/page.jsp" %></td>
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
