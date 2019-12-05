<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/style.min.css?v=4.1.0"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/plugins/iCheck/custom.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/plugins/ztree/metroStyle/metroStyle.css" rel="stylesheet">

<link href="${ctx}/static/css/cityDataCenter/yc_bigDataCenter.css" rel="stylesheet" />
<link href="${ctx}/static/css/cityDataCenter/yc_liDianBigDataCenter.css" rel="stylesheet" />

<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/content.min.js?v=1.0.0"></script>

<title>宜春市工业大数据中心</title>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
	<div class="data_main">
		<div class="data_header">
			<img alt="" height="42px" src="${ctx}/static/image/cityDataCenter/logo.png">
			<div class="local-date">
				<p>2018年1月1号</p>
				<h1>00:00:00</h1>
			</div>
			<img class="statusTip" src="${ctx}/static/image/cityDataCenter/yc/jx.png" style="width:55px; cursor: pointer;" onclick="window.location.href='https://test.inpark.com.cn/XProject/front/dataCenter/organizationCount?orgId=3600009&linkId=3609009'">
		</div>
		<div id="wrapper" class="data_content" style="padding:0px 20px 20px 20px;background-color: transparent;height: calc(100% - 79px); height: -moz-calc(100% - 79px); height: -webkit-calc(100% - 79px);">
			<div class="content1" onclick="">
				<div class="btn1" onclick="myClick(1);"></div>
				<div class="btn2" onclick="myClick(2);"></div>
				<div class="btn3" onclick="myClick(0);"></div>
			</div>
		</div>
	</div>
	
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/cityDataCenter/index/6?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/cityDataCenter/index/9?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/cityDataCenter/index/9?orgId=${orgId}">
	
	<script src="${ctx}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${ctx}/static/js/hplus.min.js?v=4.1.0"></script>
	<script src="${ctx}/static/js/contabs.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/plugins/pace/pace.min.js"></script>
	
	<script type="text/javascript">
	$(function() {
		setTime();
		setInterval(setTime, 1000);
		/*页面定时跳转事件*/
		initScreenSaver();
	});
	function setTime() {
		var date = new Date();
		var localDate = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";
		var localSec = date.getSeconds();
		if (localSec < 10) {
			localSec = "0" + localSec;
		} else {
			localSec = date.getSeconds();
		}
		var localTime = date.getHours() + ":" + date.getMinutes() + ':' + localSec;
		$(".local-date p").text(localDate);
		$(".local-date h1").text(localTime);
	};
	function myClick(index){
		if(index == 0){
			tips("暂无数据");
		}
		if(index == 1){
			window.location.href='${ctx}/front/cityDataCenter/index/9?orgId=${orgId}&pId=130000&industryId=130200';
		}
		if(index == 2){
			window.location.href='${ctx}/front/cityDataCenter/index/9?orgId=${orgId}&pId=130000&industryId=130100';
		}
	}
	
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/cityDataCenter/index/6?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/cityDataCenter/index/9?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/cityDataCenter/index/6?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/cityDataCenter/index/9?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
	</script>
</body>