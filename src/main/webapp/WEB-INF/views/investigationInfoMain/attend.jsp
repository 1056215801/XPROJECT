<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>调查表详细</title>
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
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript">
	$(function() {
		$("#saveBtn").click(function() {
			window.history.go(-1);
		});
		$("#cancelBtn").click(function() {
			window.history.go(-1);
		});
	});
	
	function saveRadio(id,value){
		$("#"+id).hide();
		$.post("${ctx}/formInputProinst/json/valueSave",{"id":id,"value":value},
				function(result){
			if(result.code==1){
				
			}else{
				layer.msg(result.msg);
			}
		},"json");
	}
	
	function saveRadio2(id,obj){
		var value = $(obj).val();
		
		$.post("${ctx}/formInputProinst/json/valueSave",{"id":id,"value":value},
				function(result){
			if(result.code==1){
				
			}else{
				layer.msg(result.msg);
			}
		},"json");
	}
	function saveTextarea(id,obj){
		var value = $(obj).val();
		$.post("${ctx}/formInputProinst/json/valueSave",{"id":id,"value":value},
				function(result){
			if(result.code==1){
				
			}else{
				layer.msg(result.msg);
			}
		},"json");
	}
	
	function other(id){
		$("#"+id).val("").show();
	}
</script>
</head>

<body class="gray-bg">
	<input type="hidden" id="requireCode" value="0" />
	<form action="" id="listform"></form>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h2>${investigationInfoMain.investigationName}</h2>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal" action="" id="form">
							<c:forEach items="${list}" var="info">
								<div class="hr-line-dashed"></div>
								<div class="form-group">
								<label class="col-sm-2 control-label">${info.inputTitle}</label>
									<c:choose>
										<c:when test="${info.inputType=='text'}">
											<div class="col-sm-10">
												<input type="text" class="form-control" name="" value="" />
											</div>
										</c:when>
										<c:when test="${info.inputType=='textarea'}">
											<div class="col-sm-10">
												<textarea onblur="saveTextarea('${info.id}',this)">${info.inputValue}</textarea>
											</div>
											
										</c:when>
										<c:when test="${info.inputType=='radio'}">
											<div class="col-sm-10">
												<c:forEach items="${info.options}" var="index">
													<c:choose>
														<c:when test="${index=='其他'}">
															<br/>
															<input type="radio" name="${info.id}" value="${index}" onclick="other('${info.id}')"/>${index}
															<input id="${info.id}" type="text" onblur="saveRadio2('${info.id}',this)" hidden="">
															<br/>
														</c:when>
														<c:otherwise>
															<input type="radio" name="${info.id}" value="${index}" ${info.inputValue==index?"checked":""} onclick="saveRadio('${info.id}','${index}')"/>${index}
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</div>
										</c:when>
										<c:when test="${info.inputType=='checkbox'}">
											<div class="col-sm-10">
												<c:forEach items="${info.options}" var="index">
													<c:choose>
														<c:when test="${index=='其他'}">
															<br/>
															<input type="checkbox" name="${info.id}" value="${index}" onclick="other('${info.id}')"/>${index}
															<input id="${info.id}" type="text" onblur="saveRadio2('${info.id}',this)" hidden="">
															<br/>
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="${info.id}" value="${index}" ${info.inputValue==index?"checked":""} onclick="saveRadio('${info.id}','${index}')"/>${index}
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</div>
										</c:when>
									</c:choose>
								</div>
							</c:forEach>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" id="saveBtn">保存</button>
									<c:if
										test="${investigationInfoMain.id!=null&&investigationInfoMain.id!=''}">
										<button class="btn btn-white" id="cancelBtn">取消</button>
									</c:if>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
