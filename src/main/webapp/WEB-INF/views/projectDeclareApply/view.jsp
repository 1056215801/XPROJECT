<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="../common/commonPage.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
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
						<h5>申报详细</h5>
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
							<label class="col-sm-2 control-label">企业</label>
								<div class="col-sm-10">
										企业1
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">申报人</label>
								<div class="col-sm-10">
										张三
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">申报人联系方式</label>
								<div class="col-sm-10">
										138123456789
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
										${projectDeclareApply.remark }
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">附件</label>
								<div class="col-sm-10" id="getAtts" align="left">
						     	</div>
						     	</div>
						     	<div class="hr-line-dashed"></div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
						<input id="cancelBtn" class="btn btn-white" type="button" value="返回" onclick="history.go(-1)"/>
						     	</div>
						     	
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
			var atIdList="${projectDeclareApply.atIdList}";
			$.ajax({
				url:"${ctx}/login/json/attachment/selectListByAttachmentIdList",
				type:'post',
				data:{'attachmentIdList':atIdList},
				dataType:'json',
				success:function(data1){
					var data=JSON.parse(data1);
					for(var i = 0;i<data.length;i++){
						if(i==data.length){
							$('#getAtts').append(
									 "<a href='"+data[i].attachmentUrl+"' target='_blank'>"+data[i].remoteName+"</a>"
									);
							}else{
								$('#getAtts').append(
										 "<a href='"+data[i].attachmentUrl+"' target='_blank'>"+data[i].remoteName+"</a><br/>"
										);
								
							}
						}
				},
				error:function(){
					alert("访问后台异常!");
				}
			});
	
		});
	</script>
</body>



</html>
