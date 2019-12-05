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
<title>袁州医药园智慧园区大数据平台</title>
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
  height: -webkit-calc(100% - 96px);
  height: calc(100% - 96px);  width:  100%;
  position: relative;
  background: url(${ctx}/static/image/cityDataCenter/yzyy/index11.png) no-repeat center;
  background-size: 100% 100%;
  position: relative;
}
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/yzyy/bg2.png) no-repeat center;
    background-size: 100% 100%;
}
.ul{
    position: absolute;
    top: 18px;
    left: 10px;
}
.ulBtn{
    width: 252px;
    height: 58px;
    cursor: pointer;
}
.twoTab{
    position: absolute;
    width: 260px;
    height: 100px;
    cursor: pointer;
    top: 30px;
    left: 301px;
    font-size: 0;
}
.tabBtn{
    position: relative;
    width: 120px;
    height: 100px;
    cursor: pointer;
    display: inline-block;
}
.tabBtn + .tabBtn{
    margin-left: 20px;
}
</style>
<body class="gray-bg">
 	<%@ include file="header.jsp"%>
 	<!--  <div class="main" style="font-size:0;">
 	     	<div class="left">
 	</div> -->
    <div class="index">
       <div class="ul">
           <div class="ulBtn" id="ulBtn1" val="1"></div>
           <div class="ulBtn" id="ulBtn2" val="2"></div>
           <div class="ulBtn" id="ulBtn3" val="3"></div>
       </div>
       <div class="twoTab">
           <div class="tabBtn" id="tabBtn1" val="1"></div>
           <div class="tabBtn" id="tabBtn2" val="2"></div>
       </div>
   </div>
 	 </div>
</body>
<script type="text/javascript">
$(function(){
 	var tabIndex = '${tabIndex}';
 	var tIndex = 1;
 	var liIndex = 1;
	$(".head .tab>a:eq(1)").addClass("on");
	$(".index .tabBtn").on("click",function(){
		tIndex = $(this).attr('val');
		console.log(tIndex)
 		$('.index').css('background','url(${ctx}/static/image/cityDataCenter/yzyy/index'+liIndex+''+tIndex+'.png) no-repeat center')
		$('.index').css('background-size','100% 100%')

	});
	$(".ul .ulBtn").on("click",function(){
		tIndex = 1;
		liIndex = $(this).attr('val');
 		$('.index').css('background','url(${ctx}/static/image/cityDataCenter/yzyy/index'+liIndex+''+tIndex+'.png) no-repeat center')
		$('.index').css('background-size','100% 100%')
 	});
})
</script>
</html>
