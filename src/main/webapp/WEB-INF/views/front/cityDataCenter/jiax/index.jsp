<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxwHomePage.css"/>
<title>昌丰融合智慧园区大数据决策平台</title>
</head>
<style>
html,body {
	height: 100%;
	width:  100%;
	margin: 0;
	font-size: 0;
}
.layui-layer-btn .layui-layer-btn0{
    font-size: 14px;
}
.gray-bg {
	background: url(${ctx}/static/image/cityDataCenter/jiax/jx_index1.jpg) no-repeat center;
	background-size: 100% 100%;
}
.index {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 7%;
	text-align: center;
}
.index a {
	display: inline-block;
	height: 100%;
    width: 8%;
}
.index a:nth-child(1) {
    float: left;
    width: 7%;
}
.index a:nth-child(4) {
    width: 33%;
}
.index a:nth-child(2) {
	margin-left: -8%;
}
</style>
<body class="gray-bg">
    <div class="index">
    	<a href="${ctx}/front/cityDataCenter/jiaxIndex/5"></a>
    	<a href="${ctx}/front/cityDataCenter/jiaxIndex/1"></a>
    	<a href="${ctx}/front/cityDataCenter/jiaxIndex/2"></a>
    	<a href="${ctx}/front/cityDataCenter/jiaxIndex/1"></a>
    	<a href="${ctx}/front/cityDataCenter/jiaxIndex/3"></a>
    	<a href="${ctx}/front/cityDataCenter/jiaxIndex/4"></a>
    </div>
</body>
</html>
