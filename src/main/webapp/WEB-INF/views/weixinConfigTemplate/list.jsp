<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>模板列表</title>

<script type="text/javascript">
	function add(url){
		$('#form').attr("action", url).submit();
	}
	
	function edit(id){
		$('#form').attr("action", url).submit();
	}
	
	function view(id){
		$('#form').attr("action", url).submit();
	}
	
	function del(url){
	//	var ids = getSelectedItems();
	//	$('#form').attr("action", url).submit();
	}
	
	$(function(){
		if(msg!=null&&msg!=""){
			var msg = '${message}';
			tips(msg);
		}
	});
</script>
</head>

<body class=" ">
	<form action="" id="form" method="post">
	<input type="hidden" id="bindId" name="bindId" value=""/>
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/weixinConifgTemplate/list" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=" "> <div class=" ">
						<div class="btn-group hidden-xs" id="infoTableToolbars" role="group" style="width:100%;">
						    <button type="button" class="btn btn-outline btn-default" onclick="add('')" title="增加">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
							<button type="button" class="btn btn-outline btn-default" onclick="del()" title="删除">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
						</div> 
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									 
									<th >模板Id</th>
									<th >行业</th>
									<th >模板标题</th>
									<th >内容</th>
									<th >样例</th>
									<th >创建时间</th>
									<th >备注</th>
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									 
									<td>${info.templateMsgId}</td>
									<td>${info.business}</td>
									<td>${info.templateMsgTitle}</td>
									<td>${info.content}</td>
									<td>${info.examples}</td>
									<td><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>${info.remark}</td>
									<td>
										<img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px;height: 22px;cursor: pointer;" onclick="view('${ctx}/weixinConifgTemplate/view','${info.templateId}')"/>
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
		
	</form>

</body>
 
</html>
