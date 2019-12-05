<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>大余县工业园区大数据中心</title>
<link href="${ctx}/static/css/parkDataCenter/yyDataCenter.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<style type="text/css">
.yymain .chan {
    background-image: url(${ctx}/static/image/parkDataCenter/dayu_quIcon_01.png);
}
.yymain .chan.on {
    background-image: url(${ctx}/static/image/parkDataCenter/dayu_quIcon_02.png);
}
</style>
</head>

<body>
	<div class="yymain bluebg">
		<div class="top-bar" style="padding-bottom: 18.5px;padding-top: 18.5px;">
			<img alt="eight" height="42" src="${configInfo.imageUrl}">
			<div class="local-date">
				<p>2017年7月20号</p>
				<h1>14:20:50</h1>
			</div>
		</div>
		<div class="right-items">
			<ul>
				<li class="gui on"></li>
				<li class="chan"></li>
				<li class="qi"></li>
			</ul>
		</div>
		<div class="map-box first">
			<div class="box-left">
				<img src="${ctx}/static/image/parkDataCenter/dayu_map_03.png">
			</div>
			<div class="box-right">
				<div class="box-ltop">
					<img src="${ctx}/static/image/parkDataCenter/dayu_map_04.png">
				</div>
				<div class="box-lbottom">
					<div class="box-bleft"><img src="${ctx}/static/image/parkDataCenter/dayu_map_06.png"></div>
					<div class="box-bright"><img src="${ctx}/static/image/parkDataCenter/dayu_map_07.png"></div>
				</div>
			</div>
			<div class="map-title"><img src="${ctx}/static/image/parkDataCenter/dayu_06.png"></div>
		</div>
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
			$(".map-qi").removeClass("on");
			$(".map-box").addClass("first").removeClass("second");
			$(this).addClass("on").siblings().removeClass("on");
		});
		$(".chan").on("click",function(){
			$(".map-qi").removeClass("on");
			$(".map-box").addClass("second").removeClass("first");
			$(this).addClass("on").siblings().removeClass("on");
		});
		$(".qi").on("click",function(){
			$(".map-box").removeClass("first").removeClass("second");
			$(".map-qi").addClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			$(".map-gui").css({'opacity': "0"});
			$(".map-chan").css({'transform':'scale(0)','opacity':'0'});
		})
		
		loadEchart('${ctx}', '${orgId}', 'bar', null); 
	});
	
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