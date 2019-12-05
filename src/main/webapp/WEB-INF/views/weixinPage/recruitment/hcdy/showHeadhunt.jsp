<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>查看人才经纪人信息</title>
<%@ include file="../../../common/commonPage_mobile.jsp"%>
<c:set var="navBar" value="2122" />
<link href="${ctx}/static/weixin/recruitment/css/employmentService.css"
	rel="stylesheet" />
<link href="${ctx}/static/weixin/recruitment/css/navigationBar.css"
	rel="stylesheet" />
</head>
<body>
	<div class="employment_main">
		<div class="employment_content" style="background-color: #fff">
			<iframe id="myIFrame" src="${url}" style="width: 100%;"
				frameborder="0"></iframe>
		</div>
		<%@ include file="navigationBar.jsp"%>
	</div>

	<script>
		$(function() {
			var winHeight = 500;
			//获取窗口高度 
			if (window.innerHeight) {
				winHeight = window.innerHeight;
			} else if ((document.body) && (document.body.clientHeight)) {
				winHeight = document.body.clientHeight;
			}
			$('#myIFrame').css('height', winHeight - 70);
		});
	</script>
</body>
</html>
