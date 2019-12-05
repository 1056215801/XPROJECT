<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>河东大数据中心</title>
<link href="${ctx}/static/css/parkDataCenter/yyDataCenter.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<style type="text/css">
.yymain {
	background: url(${ctx}/static/image/parkDataCenter/cl_bg.jpg) no-repeat center / cover;
}
.yymain .map-gui {
	background: url(${ctx}/static/image/parkDataCenter/hd_03.png) no-repeat 32% 80% fixed,url(${ctx}/static/image/parkDataCenter/hd_04.png) no-repeat 65% 62% fixed;
	background-size: 16.2%,27%;
	-webkit-background:url(${ctx}/static/image/parkDataCenter/hd_03.png) no-repeat 32% 80% fixed,url(${ctx}/static/image/parkDataCenter/hd_04.png) no-repeat 65% 62% fixed;
}
.yymain .map-gui img {
    bottom: 55%;
}
.yymain .map1 {
	position: absolute;
	left: 0px; 
	width: 100%;
	height: 100%;
	background: url(${ctx}/static/image/parkDataCenter/hd_01.png) no-repeat 32% 80% ,url(${ctx}/static/image/parkDataCenter/hd_02.png) no-repeat 65% 62% ;
	background-size: 16%,27%;
	-webkit-background: url(${ctx}/static/image/parkDataCenter/hd_01.png) no-repeat 32% 80% ,url(${ctx}/static/image/parkDataCenter/hd_02.png) no-repeat 65% 62% ;
	transition: .5s linear;
	-webkit-transition: .5s linear;
}
.map-name{
	position: absolute;
	top: 30%;
	line-height: 25px;
	transition: .5s linear;
	-webkit-transition: .5s linear;
	font-size: 24px;
}
.map-name:first-child{
	width: 170px;
    left: 18%;
}
.map-name:last-child{
    left: 52%;
}
.yymain .map-chan {
	height: 500%;
	position: relative;
	top:-150px;
	background: url(${ctx}/static/image/parkDataCenter/hd_05.png) no-repeat center 0%;
	background-size: 100%;
	-webkit-background: url(${ctx}/static/image/parkDataCenter/hd_05.png) no-repeat center 0%;
}
</style>
</head>

<body>
	<div class="yymain">
	<div class="top-bar" style="padding-bottom: 18.5px;padding-top: 18.5px;">
			<img alt="" height="42px" style="margin-right: 12px;" src="${configInfo.imageUrl}"><!--${configInfo.imageUrl}-->
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
		<div class="map1">
			<span class="map-name">富滩工业园控规土地利用总图</span>
			<span class="map-name">新工业园调区、扩区图</span>
		</div>
		<div class="map-gui on">
		</div>
		<div class="map-chan" id="map_chan">
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
			$(".map-gui").addClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			$(".map1").css({'opacity': "1"});
			$(".map-qi").removeClass("on");
			$(".map-chan").css({'transform':'scale(0)','opacity':'0'});
			$(".map-name").css({'opacity':"1"});
			setTimeout(function(){$(".map-chan").removeClass("on")},500);
			setTimeout(function(){$(".map-chan").removeAttr("style")},600);
		});
		$(".chan").on("click",function(){
			$(".map-chan").addClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			$(".map-qi").removeClass("on");
			$(".map1").css({'opacity': "0"});
			$(".map-gui").css({'opacity': "0"});
			$(".map-name").css({'opacity':"0"});
			$(".map-name").css({'opacity':"0"});
			setTimeout(function(){$(".map-gui").removeClass("on")},500);
			setTimeout(function(){$(".map-gui").removeAttr("style")},1000);
		});
		$(".qi").on("click",function(){
			$(".map-qi").addClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			$(".map1").css({'opacity': "1"});
			$(".map-gui").css({'opacity': "0"});
			$(".map-chan").css({'transform':'scale(0)','opacity':'0'});
			$(".map-name").css({'opacity':"1"});
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
	
	/*map-chan的拖动事件*/
	var map_chan = document.getElementById("map_chan");
        map_chan.onmousedown=function(ev)
        {
            var oEvent = ev; 
            var disX = oEvent.clientX - map_chan.offsetLeft;
            var disY = oEvent.clientY - map_chan.offsetTop;
            document.onmousemove=function (ev)
            {
				map_chan.style.transition="0s";
                oEvent = ev;
                map_chan.style.left = oEvent.clientX -disX+"px";
                map_chan.style.top = oEvent.clientY -disY+"px";
            }
            document.onmouseup=function()
            {
			   map_chan.style.transition=".5s";
			   document.onmousemove=null;
			   document.onmouseup=null;
            }
        }    
</script>
</html>