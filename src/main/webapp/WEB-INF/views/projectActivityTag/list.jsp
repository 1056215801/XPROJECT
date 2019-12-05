<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>标签列表</title>
<style type="text/css">
	.btn{
		padding: 4px 6px;
		margin:10px 0;
	}
</style>
<script type="text/javascript">
	function add(type){
		if(type==1){
			$("#sortGrade").val("");
			$("#tagName").val("");
		}
		$("#type").val(type);
		layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			shade: [0],
			area:['400px','300px'],
			offset:['200px','600px'],
			closeBtn:0,
			content: $('#comment'),
		});
	}
	
	function edit(id){
		$.ajax({
			url:"${ctx}/projectActivityTag/json/detail",
			type:"get",
			data:{"id":id},
			dataType:"json",
			success:function(result){
				if(result.code==1){
					var msg = result.msg.split(","); 
					$("#sortGrade").val(msg[0]);
					$("#tagName").val(msg[1]);
					$("#tagId").val(msg[3]);
					$("#kind option").each(function(){
						$(this).attr("selected","");
						if(Number($(this).val())==Number(msg[2])){
							$(this).attr("selected",true);
						}
					});
					add('2');
				}else{
					layer.alert(result.msg);
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			},
		});
	}
	
	function changeStatus(id,status){
		var statusName = "";
		if(status==0){
			statusName = "确认停用？";
		}else{
			statusName = "确认启用？";
		}
		layer.confirm(statusName,function(){
			$.ajax({
				url:"${ctx}/projectActivityTag/json/changeStatus",
				type:"get",
				data:{"id":id,"status":status},
				dataType:"json",
				success:function(result){
					layer.msg(result.msg);
					if(result.code==1){
						setTimeout(function(){
				 			window.location.href="${ctx}/projectActivityTag/list";
			 			}, 1000);
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				},
			});
		},function(){return;});
	}
	
	function save(){
		alert(type);
		
		var sortGrade = $("#sortGrade").val();
		if(sortGrade==null||sortGrade==""){
			layer.msg("请输入序号");
			return;
		}
		
		var tagName = $("#tagName").val();
		if(tagName==null||tagName==""){
			layer.msg("请输入标签名");
			return;
		}
		
		var kind = $("#kind option:selected").val();
		
		var tagId = $("#tagId").val();
		
		var type = $("#type").val();
	    $.ajax({
			url:"${ctx}/projectActivityTag/json/save",
			type:"post",
			data:{"sortGrade":sortGrade,"tagName":tagName,"type":type,"kind":kind,'${_csrf.parameterName}':'${_csrf.token}',"tagId":tagId},
			dataType:"json",
			success:function(result){
				layer.closeAll();
				layer.msg(result.msg); 
				if(result.code==1){
					setTimeout(function(){
			 			window.location.href="${ctx}/projectActivityTag/list";
		 			}, 1000);
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			},
		}); 
	}
	
	function cancel(){
		layer.closeAll();
	}
</script>
</head>

<body class=" ">
	<form action="" id="form" method="post">
	<input type="hidden" id="activityId" name="activityId" value=""/>
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/projectActivityTag/list" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
	
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=" ">
				<!-- 
					<h4 class="example-title">列表</h4> -->
					<div class=" ">
						<div class="btn-group hidden-xs" id="infoTableToolbars" role="group">
							<button type="button" class="btn btn-outline btn-default" onclick="add('1')">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
						</div>
						<table id="infoTable" data-mobile-responsive="true">
						
							<thead>
								<tr>
									 
									<th data-field="name">排序号</th>
									<th data-field="createUserName">名称</th>
									<th >标签类型</th>
									<th >状态</th>
									<th >创建时间</th>
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td>${info.sortGrade}</td>
									<td>${info.tagName}</td>
									<td>
										<c:choose>
											<c:when test="${info.kind==201}">活动报名</c:when>
											<c:when test="${info.kind==202}">园区动态</c:when>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${info.status==0}">已停用</c:when>
											<c:when test="${info.status==1}">使用中</c:when>
										</c:choose>
									</td>
									<td>
										<fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd"/> 
									</td>
									<td>
									<img alt="" src="${ctx}/static/img/edit.png" title="编辑" style="width: 22px;height: 22px;cursor: pointer;" onclick="edit('${info.tagId}')"/>
									<c:if test="${info.status==1}">
									<img alt="" src="${ctx}/static/img/down.png" title="停用" style="width: 22px;height: 22px;cursor: pointer;" onclick="changeStatus('${info.tagId}','0')"/>
									</c:if>
									<c:if test="${info.status==0}">
									<img alt="" src="${ctx}/static/img/up.png" title="启用" style="width: 22px;height: 22px;cursor: pointer;" onclick="changeStatus('${info.tagId}','1')"/>
									</c:if>
									 <%--    <a href="javascript:;" onclick="edit('${info.tagId}')" title="编辑"  > <i class="fa fa-edit" style="font-size:25px"></i> </a>   
									    <a href="javascript:;" onclick="changeStatus('${info.tagId}','0')" title="停用"  > <span class="fa fa-remove" style="font-size:25px"  ></span> </a>      
									    <a href="javascript:;" onclick="changeStatus('${info.tagId}','1')" title="停用"  > <span class="fa fa-remove" style="font-size:25px"  ></span> </a>  --%>     
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
	<div id="comment" style="display:none; padding:10px 20px;">
		<input type="hidden" id="type">
		<input hidden="hidden" id="tagId" value=""/>
         <div class="col-sm-10">
			<span>序号：</span>
			<input id="sortGrade" name="sortGrade" type="text" class="form-control"/>
		</div>
		<br/>
        <div class="col-sm-10">
			<span>名称：</span>
			<input id="tagName" name="tagName" type="text" class="form-control"/>
		</div>
		<div class="col-sm-10">
			<span>类型：</span>
			<select class="form-control" name="kind" id="kind">
				<option value="201">活动报名
				<option value="202">园区动态
			</select>
		</div>
		<br/>
		<div class="form-group">
			<div class="col-sm-4 col-sm-offset-2">
				<input type="button" class="btn btn-primary" onclick="save()" value="保存"/>
				<input type="button" class="btn btn-white" onclick="cancel()" value="取消">
			</div>
		</div>
	</div>
</body>

</html>
