<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<title>袁州医药园智慧园区大数据平台</title>
</head>
<style>
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/yzyy/bg2.png) no-repeat center;
    background-size: 100% 100%;
}
.content-industrialInvest{
    height: -webkit-calc(100% - 96px);
    height: calc(100% - 96px);
    position: relative;
    background: url(${ctx}/static/image/cityDataCenter/yzyy/industrialInvest.png) no-repeat center;
    background-size: 100% 100%;
}
</style>
<body class="gray-bg">
 	<%@ include file="header.jsp"%>
 	<div class="content-industrialInvest">
 	
 	</div>
</body>
<script type="text/javascript">
$(function(){
	$(".head .tab>a:eq(2)").addClass("on");
})
</script>