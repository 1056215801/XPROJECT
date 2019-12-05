<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>测试列表</title>
 
<script type="text/javascript">
	
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
									<th ><input type="checkbox" /> 全选</th>
									<th >标题</th>
									<th >已参加申报企业数量</th>
									<th>公示结果</th>
									<th>发布日期</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td width="10%"><input type="checkbox" /></td>
									<td width="50%"><a href='${ctx}/projectDeclareInfo/view?declareId=${info.declareId}'
												title='详细' >${info.declareTitle}</a></td>
									<td width="10%"><a href='${ctx}/projectDeclareApply/list?declareId=${info.declareId}'
												title='详细' >${info.applyCount}</a></td>
									<td width="20%">
									<c:if test="${info.declareStatus==2}">
									<c:if test="${info.isPublicity==null}">
									<a href='${ctx}/projectDeclarePublicity/add?declareId=${info.declareId}'
												title='发布公示结果' />发布公示结果
												</c:if>
									<c:if test="${info.isPublicity!=null}">
											 结果已公示
									</c:if>
									</c:if>
									<c:if test="${info.declareStatus!=2}">
									 项目截止后可以发布
									</c:if>
												</td>
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
