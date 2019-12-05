<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonList.jsp"%>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>申报列表</title>

<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link
	href="${ctx}/static/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/static/css/page.css" type="text/css" rel="stylesheet" />
 
<script type="text/javascript">
	function add(url){
		$('#form').attr("action", url).submit();
	}	
	function edit(url,publicityId){
		$("#publicityId").val(publicityId);
		$('#form').attr("action", url).submit();
	}
	
	function view(url,publicityId){
		$("#publicityId").val(publicityId);
		$('#form').attr("action", url).submit();
	}
	
	function del(url){
		var ids = getIds();
		$("#publicityId").val(ids);
		$('#form').attr("action", url).submit();
	}
	
	
	$(function(){
		var msg = '${message}';
		if(msg!=null&&msg!=""){
			tips(msg);
			msg=null;
		}
	});
</script>
</head>

<body class="gray-bg">
	<form action="" id="form" method="post">
	<input type="hidden" id="publicityId" name="publicityId" value=""/>
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/projectDeclarePublicity/list" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class="example-wrap">
					<h4 class="example-title">列表</h4>
					
					<!--  <div class="example">
						<div class="btn-group hidden-xs" id="exampleToolbar" role="group">
							<button type="button" class="btn btn-outline btn-default" onclick="add('${ctx}/projectDeclarePublicity/add')">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
							
							<button type="button" class="btn btn-outline btn-default" onclick="del('${ctx}/projectDeclarePublicity/delete')">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
						</div>-->
						
						<table id="exampleTableToolbar" data-mobile-responsive="true">
							<thead>
								<tr>
									<!--  <th><input type="checkbox" /> 全选</th>-->
									<th>公示标题</th>
									<th >公示时间</th>									
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<!--<td><input type="checkbox" /></td>-->
									<td>${info.publicityTitle}</td>
									<td><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>									
									<td>
										<!--<img alt="" src="${ctx}/static/img/edit.png" title="编辑" style="width: 25px;height: 25px;cursor: pointer;" onclick="edit('${ctx}/projectDeclarePublicity/edit','${info.publicityId}')" />-->
										<img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px;height: 22px;cursor: pointer;" onclick="view('${ctx}/projectDeclarePublicity/view','${info.publicityId}')"/>
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
