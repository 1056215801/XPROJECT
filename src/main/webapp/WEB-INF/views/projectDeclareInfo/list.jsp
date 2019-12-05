<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目查看</title>

 
<script type="text/javascript">
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
		var ids = getIds();
		$("#activityId").val(ids);
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

<body class=" ">
	<form action="" id="form" method="post">
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/projectDeclareInfo/mylist" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=" ">
					 
					<div class=" ">
						<div class="btn-group hidden-xs" id="infoTableToolbars" role="group">
							<button type="button" class="btn btn-outline btn-default" onclick="add('${ctx}/projectDeclareInfo/add')">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
							
							<button type="button" class="btn btn-outline btn-default" onclick="del()">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
						</div>
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th><input type="checkbox" /> 全选</th>
									<th>标题</th>
									<th>发布日期</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td width="10%"><input type="checkbox" /></td>
									<td width="80%"><a href='${ctx}/projectDeclareInfo/view?declareId=${info.declareId}&allowApply=1'
												title='详细' >(${info.endDate})${info.declareTitle}</a></td>
									<td width="10%"><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd"/></td>
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
