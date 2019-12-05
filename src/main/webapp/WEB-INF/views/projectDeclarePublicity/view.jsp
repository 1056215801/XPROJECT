<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>详情</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css"
	rel="stylesheet" type="text/css" />

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
						<h5>公示详情</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
							<a class="close-link"> <i class="fa fa-times"></i></a>
						</div>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal" action="${ctx}/projectDeclarePublicity/save" id="form">
							<input type="hidden" id="atUrlList" name="atUrlList" value="" />
                         	<input type="hidden" id="atIdList" name="atIdList" value="" />
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">公示标题：</label>
								<div class="col-sm-10">
									 ${projectDeclarePublicity.publicityTitle}
								</div>
							</div>
							
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目标题：</label>
								<div class="col-sm-10">
									<a href='${ctx}/projectDeclareInfo/view?declareId='>${declareTitle}</a>
																	
								</div>
							</div>	
														
													
	             <div id="attList" ></div>
	             
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">公示单位：</label>
								<div class="col-sm-10">
									${projectDeclarePublicity.publicityUnit}
								</div>
							</div>			
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">公示时间：</label>
								<div class="col-sm-10">
								<fmt:formatDate value="${projectDeclarePublicity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">附件：</label>
								<div class="col-sm-10" id="getAtts" align="left">
						     	</div>
						     	</div>
						     	
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">公示正文：</label>
								<div class="col-sm-10">									
									 ${projectDeclarePublicity.publicityText}
								</div>
							</div>			

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<!-- <button class="btn btn-white" id="cancelBtn">返回</button>-->
									<input id="cancelBtn" class="btn btn-white" type="button" value="返回" onclick="history.go(-1)"/>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
	<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script>
	<script src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
	<script>
	$(function() {
		var atIdList="${projectDeclarePublicity.atIdList}";
		$.ajax({
			url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
			type:'post',
			data:{'attachmentIdList':atIdList},
			dataType:'json',
			success:function(datas){
				var data = JSON.parse(data);
				for(var i = 0;i<data.attachments.length;i++){
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
			
			//返回按钮
		$("#cancelBtn").click(function() {
			$("#form").attr("action","${ctx}/projectDeclarePublicity/list").submit();
		      return false;
		});
		
	});
	</script>
</body>


</html>
