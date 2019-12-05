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
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxwHomePage.css"/>
<title>进贤医疗器械大数据中心招商引资</title>
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
.index{
margin-top: 10px;
  height: -webkit-calc(100% - 100px);
  height: calc(100% - 100px);  
  width:  100%;
  position: relative;
  background: url(${ctx}/static/image/cityDataCenter/jinx/index6.png) no-repeat center;
  background-size: 100% 100%;
}
.gray-bg {
   	background-image: url(${ctx}/static/image/cityDataCenter/jinx/bg2.png);
    -webkit-background-size: 100%;
    background-size: 100%;
}
.gray-bg .head {
	background-image: url(${ctx}/static/image/cityDataCenter/jinx/head2.png);
}
</style>
<body class="gray-bg">
 	<%@ include file="header.jsp"%>
    <div class="index">
   </div>
</body>
<script type="text/javascript">
$(function(){
    $(".head a:eq(5)").addClass("on");
})
</script>
</html>
