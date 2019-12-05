<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>举报列表</title>
 <style type="text/css">
	.btn{
		padding: 4px 6px;
		margin:10px 0;
	}
</style>
<script type="text/javascript">
	function audit(id){
		$("#complainId").val(id);
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
	
	function save(){
		var complainId = $("#complainId").val();
		var responseContent = $("#responseContent").val();
		if(responseContent==null||responseContent==""){
			layer.msg("处理内容不能为空");
			return;
		}
		if(responseContent.length>100){
			layer.msg("处理内容不能超过100字");
			return;
		}
		$.ajax({
			url:"${ctx}/projectActivityComplain/json/audit",
			type:"post",
			data:{"complainId":complainId,"responseContent":responseContent,'${_csrf.parameterName}':'${_csrf.token}'},
			dataType:"json",
			success:function(result){
				if(result.code==1){
					layer.msg(result.msg);	
				}else{
					layer.alert(result.msg);
				}
				
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
		
	}
	
	function cancel(){
		layer.closeAll();
	}
</script>
</head>

<body class=" ">
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/projectActivityComplain/list" method="post">
		  <input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class="example-wrap"> <!-- 
					<h4 class="example-title">列表</h4> -->
					<div class="example">
						
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th >活动名称</th>
									<th >活动状态</th>
									<th >举报人</th>
									<th >举报时间</th>
									<th >举报内容</th>
									<th >处理转态</th>
									<th >处理内容</th>
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td>${info.activityName}</td>
									<td>
										<c:if test="${info.status==1}">报名中</c:if>
										<c:if test="${info.status==0}">已结束</c:if>
									</td>
									<td>${info.submitUser}</td>
									<td>
										<fmt:formatDate value="${info.submitTime}" pattern="yyyy-MM-dd HH:mm"/>
									</td>
									<td>
										<c:choose>
											<c:when test="${fn:length(info.submitContent)>15}">
												<span title="${info.submitContent}">
													<a href="javascript:void(0)" title="${info.submitContent}">${fn:substring(info.submitContent,0,18)}...</a>
												</span>
											</c:when>
											<c:otherwise><a href="javascript:void(0)" title="${info.submitContent}"">${info.submitContent}</a>&nbsp;</c:otherwise>
										</c:choose>
									</td>
									<td>${info.responseRst==1?"已处理":"未处理"}</td>
									<td>
										<c:choose>
											<c:when test="${fn:length(info.responseContent)>15}">
												<span title="${info.responseContent}">
													<a href="javascript:void(0)" title="${info.responseContent}">${fn:substring(info.responseContent,0,18)}...</a>
												</span>
											</c:when>
											<c:otherwise><a href="javascript:void(0)" title="${info.responseContent}">${info.responseContent}</a>&nbsp;</c:otherwise>
										</c:choose>
									</td>
									<td>
										<img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px;height: 22px;cursor: pointer;" onclick="window.open('${ctx}/projectActivity/details/${info.activityId}')"/>
										<img alt="" src="${ctx}/static/img/edit.png" title="审核" style="width: 25px;height: 25px;cursor: pointer;" onclick="audit('${info.complainId}')" />
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
		<input type="hidden" id="complainId">
         <div class="col-sm-10">
			<span>审核内容：</span>
			<div style="margin-top:5px;">
				<textarea rows="4" style="width:100%;height: 150px;" id="responseContent" ></textarea>
				<span>（字数100以内）</span>
			</div>
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
