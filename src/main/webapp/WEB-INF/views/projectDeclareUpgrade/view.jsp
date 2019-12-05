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
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
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
						<h5>详细</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal"
							action="${ctx}/projectDeclareInfo/save" id="form">
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">申请人名称</label>
								<div class="col-sm-10" align="center">
										${projectDeclareUpgrade.accountName}
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">企业名称</label>
								<div class="col-sm-10" align="center">
										${projectDeclareUpgrade.companyName}
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">单位位置</label>
								<div class="col-sm-10" align="center">
										${projectDeclareUpgrade.companyProvince}&nbsp;
										${projectDeclareUpgrade.companyCity}&nbsp;
										${projectDeclareUpgrade.companyCounty}
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">身份证号</label>
								<div class="col-sm-10" align="center">
									${projectDeclareUpgrade.idcardNum}							
									</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-10" align="center">
									${projectDeclareUpgrade.telephone}
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">组织信用代码</label>
								<div class="col-sm-10" align="center">
									<img alt="" src="${projectDeclareUpgrade.companyCodeImage}">   
								</div>
						     	</div>
						     	<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">授权书</label>
								<div class="col-sm-10" align="center">
									<img alt="" src="${projectDeclareUpgrade.certificateImage}">   
								</div>
						     	</div>
						     	<div class="hr-line-dashed"></div>
							<div class="form-group">
							<label class="col-sm-2 control-label">身份证</label>
								<div class="col-sm-10" align="center">
									<img alt="" src="${projectDeclareUpgrade.idcardFront}">   
									<img alt="" src="${projectDeclareUpgrade.idcardBack}">   
								</div>
						     	</div>
						     	<div class="hr-line-dashed"></div>
						     	<div class="form-group">
							<label class="col-sm-2 control-label">操作</label>
								<div class="col-sm-10" align="center">
									<a href="javaScript:;" onclick="audited('1');">通过</a>
									<a href="javaScript:;" onclick="audited('0');">不通过</a>
									<a href="javaScript:history.go(-1);">返回</a>
								</div>
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
function audited(type){
	
	 $.ajax({
			url:"${ctx}/projectDeclareUpgrade/audit",
			type:"get",
			data:{
					"type":type,
					"ids":'${projectDeclareUpgrade.upgradeId}'
				 },
			dataType:"json",
			success:function(result){
				tips(result);
				window.location.href="${ctx}/projectDeclareUpgrade/list";
			},
			error:function(){
				tips("审核失败！");
				},
			});
    
}
	</script>
</body>



</html>
