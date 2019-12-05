<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目查看</title>

 
<script type="text/javascript">
	function apply(id){
		window.location.href="${ctx}/projectDeclareApply/operationCreate?declareId="+id;
	}
	function add(){
		window.location.href="${ctx}/projectDeclareInfo/operationAdd";
	}
	function edit(id){
		window.location.href="${ctx}/projectDeclareInfo/operationEdit?declareId="+id;
	}
	
	
	
	function view(id){
		window.open("${ctx}/projectDeclare/view?declareId="+id);
	}
	
	function search(){
		var title = $('#declareTitle').val();
		window.location.href="${ctx}/projectDeclareInfo/operationList?declareTitle="+title;
	}
	function publicity(id){
		window.location.href="${ctx}/projectDeclarePublicity/operationAdd?declareId="+id;
	}
	function list(id){
		window.location.href="${ctx}/projectDeclareApply/operationList?declareId="+id;
	}
	function del(url){
		var str = "";
		jQuery("input[name='ids']:checkbox:checked").each(function() {
			str += jQuery(this).val() + ",";
		})
		if (str == "") {
			alert("请选择要操作的对象!");
			return;
		} else {
			str = str.substr(0, str.length - 1);
		}
		confirm("确认要删除吗?",function(){
			
			$
			.ajax({
				url : "${ctx}/projectDeclareInfo/operationDel",
				type : "post",
				data :{
					"declareIdStr":str,
					'${_csrf.parameterName}':'${_csrf.token}'
				 			},
				dataType : "json",
				success : function(result) {
					window.location.href="${ctx}/projectDeclareInfo/operationList";
					if(result==1){
					       tips("删除成功！");
					}
				},
				error : function() {
					tips("删除异常！");
				}
			});
			
	    },function(){return;});
		return false;
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
							<button type="button" class="btn btn-outline btn-default" onclick="add()">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
							
							<button type="button" class="btn btn-outline btn-default" onclick="del()">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
							
						</div>
						<div style="float: right; margin-top: 10px; width:30%;">
							<div class="input-group m-b">
                                <input type="text" class="form-control" id="declareTitle" value="${title}">
                             	<span class="input-group-btn">
                                    <button type="button" class="btn btn-primary" onclick="search()">搜索</button>
								</span>
                            </div>
						</div>
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th><input type="checkbox" /> 全选</th>
									<th>标题</th>
									<th>发布日期</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td width="10%"><input type="checkbox" name="ids" value="${info.declareId }"/></td>
									<td width="60%">
												<c:choose>
												<c:when test="${info.endDate==-1}">
												(申报已截止)
												</c:when>
												<c:when test="${info.endDate==null}">
												(${info.declareRemark })
												</c:when>
												 <c:otherwise>  
												 (距离截止还有${info.endDate}天)
												 </c:otherwise>
												</c:choose>
												${info.declareTitle}</a></td>
									<td width="10%"><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd"/></td>
									<td width="20%">
									<img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px;height: 22px;cursor: pointer;" onclick="view('${info.declareId}')"/>
									<img alt="" src="${ctx}/static/img/apply.png" title="申报" style="width: 22px;height: 22px;cursor: pointer;" onclick="apply('${info.declareId}')"/>
									<img alt="" src="${ctx}/static/img/publicity.png" title="发布公示" style="width: 22px;height: 22px;cursor: pointer;" onclick="publicity('${info.declareId}')"/>
									<img alt="" src="${ctx}/static/img/list.png" title="申报列表" style="width: 22px;height: 22px;cursor: pointer;" onclick="list('${info.declareId}')"/>
									<img alt="" src="${ctx}/static/img/edit.png" title="编辑" style="width: 22px;height: 22px;cursor: pointer;" onclick="edit('${info.declareId}')"/>
									
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
