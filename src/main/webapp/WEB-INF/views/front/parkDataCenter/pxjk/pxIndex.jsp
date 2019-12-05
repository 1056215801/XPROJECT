<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>萍乡数据中心</title>
<link href="${ctx}/static/css/parkDataCenter/yyDataCenter.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<style type="text/css">
.yymain {
	background: url(${ctx}/static/image/parkDataCenter/cl_bg.jpg) no-repeat center / cover;
}
.yymain .map-gui {
	background: url(${ctx}/static/image/parkDataCenter/px_01.png) no-repeat center 120px fixed;
	background-size: 52%;
	-webkit-background: url(${ctx}/static/image/parkDataCenter/px_01.png) no-repeat center 120px fixed;
}
.yymain .map-gui img {
    bottom: 55%;
}
.yymain .map1 {
	position: absolute;
	left: 0px; 
	width: 100%;
	height: 100%;
	background: url(${ctx}/static/image/parkDataCenter/px_02.png) no-repeat center 120px;
	background-size: 52%;
	-webkit-background: url(${ctx}/static/image/parkDataCenter/px_02.png) no-repeat center 120px;
}

/* .yymain .map-chan {
	background: url(${ctx}/static/image/parkDataCenter/cl_04.png) no-repeat center 80% ;
	background-size: 45%;
	-webkit-background: url(${ctx}/static/image/parkDataCenter/cl_04.png) no-repeat center 80% ;
} */
</style>
</head>

<body>
	<div class="yymain">
	<div class="top-bar" style="padding-bottom: 18.5px;padding-top: 18.5px;">
			<img alt="" height="42px" src="${configInfo.imageUrl}">
			<div class="local-date">
				<p>2017年7月20号</p>
				<h1>14:20:50</h1>
			</div>
		</div>
		<div class="right-items">
			<ul>
				<li class="gui on"></li>
				<!-- <li class="chan"></li> -->
				<li class="qi"></li>
			</ul>
		</div>
		<div class="map1"><%-- <img src="${ctx}/static/image/parkDataCenter/cl_01.png"> --%></div>
		<div class="map-gui on"><img alt="eight" src="${ctx}/static/image/parkDataCenter/px_03.png"></div>
		<!-- <div class="map-chan"></div> -->
		<div class="map-qi" style="width: 60%;height: 60%; background: rgba(0, 0, 0, 0.498039);">
			<div class="chart-title">园区相关产业企业总数：<span id="total">0</span>个</div>
			<div id="chart" style="width: 100%;height: 100%;"></div>
		</div>
	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/parkDataCenter/indEconIndicators?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/parkDataCenter/pkEconIndicators?orgId=${orgId}'"></div>
</body>
<script type="text/javascript" src="${ctx}/static/js/parkDataCenter/compCount.js"></script>
<script>
	$(function(){
		setTime();
		function setTime(){
			var date = new Date();
			var localDate = date.getFullYear() + "年" + (date.getMonth()+1) + "月" + date.getDate() + "日";
			var localSec = date.getSeconds();
			if(localSec<10) { localSec = "0"+localSec} else{ localSec = date.getSeconds()};
			var localTime = date.getHours() + ":" + date.getMinutes() + ':' + localSec;
			$(".local-date p").text(localDate);
			$(".local-date h1").text(localTime);
		};
		setInterval(setTime,1000)
		$(".gui").on("click",function(){
			$(".map-gui").addClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			$(".map-qi").removeClass("on");
			$(".map-chan").css({'transform':'scale(0)','opacity':'0'});
			setTimeout(function(){$(".map-chan").removeClass("on")},500);
			setTimeout(function(){$(".map-chan").removeAttr("style")},600);
		});
		$(".chan").on("click",function(){
			$(".map-chan").addClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			$(".map-qi").removeClass("on");
			$(".map-gui").css({'opacity': "0"});
			setTimeout(function(){$(".map-gui").removeClass("on")},500);
			setTimeout(function(){$(".map-gui").removeAttr("style")},1000);
		});
		$(".qi").on("click",function(){
			$(".map-qi").addClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			$(".map-gui").css({'opacity': "0"});
			$(".map-chan").css({'transform':'scale(0)','opacity':'0'});
			setTimeout(function(){
				$(".map-chan").removeClass("on");
				$(".map-gui").removeClass("on")
				},500);
			setTimeout(function(){$(".map-chan").removeAttr("style")},600);
			setTimeout(function(){$(".map-gui").removeAttr("style")},1000);
		})
		
		loadEchart('${ctx}', '${orgId}', 'bar', null); 
	})
	
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/parkDataCenter/indEconIndicators?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/parkDataCenter/pkEconIndicators?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/parkDataCenter/indEconIndicators?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/parkDataCenter/pkEconIndicators?orgId=${orgId}";
	         }  
	    }  
	} 
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome  
	
</script>
</html>