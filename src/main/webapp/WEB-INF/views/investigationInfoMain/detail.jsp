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
		var end = {
			elem : "#end",
			event : "focus",
			format : "YYYY-MM-DD hh:mm:ss",
			min : laydate.now(),
			max : "2099-06-16 23:59:59",
			istime : true,
			istoday : false,
			start : laydate.now(0, "YYYY-MM-DD hh:mm:ss"), //设置开始时间为当前时间
		};
		laydate(end);

		$("#saveBtn").click(
				function() {
					$("#form").attr("action",
							"${ctx}/investigationInfoMain/save").submit();
				});
		$("#cancelBtn").click(function() {
			window.location.href = "${ctx}/investigationInfoMain/mainList";
		});
	});
</script>
</head>

<body class="gray-bg">
	<input type="hidden" id="requireCode" value="0" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h2>${info.investigationName}</h2>
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
										<c:when test="${info.inputType=='number'}">
											<div class="col-sm-10">
												<input type="text" class="form-control" name="" value=""
													min="${info.minValue}" maxlength="${info.maxValue}" />
											</div>
										</c:when>
										<c:when test="${info.inputType=='textarea'}">
											<div class="col-sm-10">
												<textarea rows="" cols=""></textarea>
											</div>
											
										</c:when>
										<c:when test="${info.inputType=='richtext'}">
											<div class="col-sm-10">
												<input type="text" class="form-control" name="" value="" />
											</div>
										</c:when>
										<c:when test="${info.inputType=='radio'}">
											<div class="col-sm-10">
												<c:forEach items="${fn:split(info.options,'_:')}" var="index">
													<input type="radio" class="" name="" value="" />${index}
												</c:forEach>
											</div>
										</c:when>
										<c:when test="${info.inputType=='checkbox'}">
											<div class="col-sm-10">
												<c:forEach items="${fn:split(info.options,'_:')}" var="index">
													<input type="checkbox" class="" name="" value="" />${index}
												</c:forEach>
											</div>
										</c:when>
										<c:when test="${info.inputType=='line'}">
											<div class="col-sm-10">
												<input type="" class="form-control" name="" value="" />
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
