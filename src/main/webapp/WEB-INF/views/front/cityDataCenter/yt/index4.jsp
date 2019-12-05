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
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/ytHomePage.css"/>
<title>鹰潭市铜产业大数据中心-创新驱动</title>
</head>
<style>
</style>
<body class="gray-bg cxqd">
	<div class="index">
	   <div class="cxPoint1"></div>
   	   <div class="cxPoint2"></div>
   	   <div class="cxPoint3"></div>
   	   <div class="cxPoint4"></div>
   	   <div class="cxPoint5"></div>
	</div>
    <div class="foot">
    	<div class="links">
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/2" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index1.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/3" class="link link2">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index2.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/4" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index3.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/5" class="link link2">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light2.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index4.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/6" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index5.png">
	    	</a>
    	</div>
    	<a href="${ctx}/front/cityDataCenter/ytIndex/1" class="back-btn"><img alt="" src="${ctx}/static/image/cityDataCenter/yt/back.png"></a>
    </div>
</body>
<script type="text/javascript">
$(function(){
	$(".links .link").on("mouseenter",function(){
		var $ind = $(this).index();
		if($ind!=3){
			$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light2.png");
		}
	});
	$(".links .link").on("mouseleave",function(){
		var $ind = $(this).index();
		if($ind!=3){
			$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light1.png");
		}
	});
})
</script>
</html>
