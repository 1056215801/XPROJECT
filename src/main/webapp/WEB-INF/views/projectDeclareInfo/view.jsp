<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>项目详情</title>

<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<style type="text/css">
.btn-success {
	background: orange;
}
</style>
</head>

<body class="gray-bg">
	<input type="hidden" id="requireCode" value="0" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>项目详细</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal"
							action="${ctx}/projectDeclareInfo/save" id="form">
							<input type="hidden" id="atUrlList" name="atUrlList" value="" />
                         	<input type="hidden" id="atIdList" name="atIdList" value="" />
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-10">
										<h1 align="center">${projectDeclareInfo.declareTitle}</h1>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10">
										<h3 align="center">单位1&nbsp;&nbsp;
										<fmt:formatDate value="${projectDeclareInfo.createTime}" pattern="yyyy年MM月dd日"/>&nbsp;&nbsp;
										${projectDeclareInfo.declareBatch}</h3>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10">
									<h3 align="center">${projectDeclareInfo.declareGrade}</h3>								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10" align="center">
									${projectDeclareInfo.declareText}
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">附件</label>
								<div class="col-sm-10" id="getAtts" align="left">
						     	</div>
						     	</div>
						     	<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">时间节点</label>
								<div class="col-sm-10">
									<table id="tab" border="0" align="center" width="100%"
										class="editTable">
										<tr id="headId">
											<td>到期时间</td>
											<td></span>节点名称</td>
											<td>截止时间</td>
											<td></span>备注</td>
										</tr>
										<c:forEach items="${nodeList}" var="node">
										<tr>
											<td>
											<c:choose>
											<c:when test="${node.remainDay==0}">
											今天
											</c:when>
											<c:when test="${node.remainDay==1}">
											明天
											</c:when>
											<c:when test="${node.remainDay==2}">
											后天
											</c:when>
											<c:when test="${node.remainDay==null}">
											无
											</c:when>
											<c:otherwise>
											${node.remainDay}天
											</c:otherwise>
											</c:choose>
											</td>
											<td>${node.nodeName}</td>
											<td><fmt:formatDate value="${node.endTime}" pattern="yyyy年MM月dd日"/></td>
											<td>${node.remark}</td>
										</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<c:if test="${allowApply==1 }">
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
							<c:if test="${projectDeclareInfo.applyOnline==1 }">
							<c:if test="${notApply==1}">
									 <button type="button" class="btn btn-block btn-outline btn-danger" id="apply" disabled="disabled">在线申报</button>
							</c:if>
							<c:if test="${notApply!=1}">
									 <button type="button" class="btn btn-block btn-outline btn-danger" id="apply">在线申报</button>
							</c:if>
							</c:if>
							<c:if test="${projectDeclareInfo.applyOnline==0}">
									 <button type="button" class="btn btn-block btn-outline btn-danger" id="apply" disabled="disabled">在线申报</button>
							</c:if>
								</div>
								<input id="cancelBtn" class="btn btn-white" type="button" value="返回" onclick="history.go(-1)"/>
							</div>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	 
	<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
	<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js"
		charset="utf-8"></script>
    <script>
		$(function() {
			var atIdList="${projectDeclareInfo.atIdList}";
			$.ajax({
				url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
				type:'post',
				data:{'attachmentIdList':atIdList},
				dataType:'json',
				success:function(datas){
					var data = JSON.parse(datas);
					for(var i = 0;i<data.length;i++){
						if(i==data.attachments.length){
							$('#getAtts').append(
									 "<a href='"+data.attachments[i].attachmentUrl+"' target='_blank'>"+data.attachments[i].remoteName+"</a>"
									);
							}else{
								$('#getAtts').append(
										 "<a href='"+data.attachments[i].attachmentUrl+"' target='_blank'>"+data.attachments[i].remoteName+"</a><br/>"
										);
								
							}
						}
				},
				error:function(){
					alert("访问后台异常!");
				}
			});
			$('#apply').click(function(){
				window.location.href="${ctx}/projectDeclareApply/add?declareId=${projectDeclareInfo.declareId}";
			});
			
				var msg = '${message}';
				if(msg!=null&&msg!=""){
					tips(msg);
					msg=null;
				}
			
		});
	</script>
</body>



</html>
