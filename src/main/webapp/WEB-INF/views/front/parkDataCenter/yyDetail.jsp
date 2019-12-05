<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>弋阳数据中心</title>
<link href="${ctx}/static/css/parkDataCenter/yyDataCenter.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
</head>

<body>
	<div class="yymain">
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/parkDataCenter/parkEconomic?orgId=${orgId}">
		<div class="top-bar">
			<img alt="eight" src="${ctx}/static/image/parkDataCenter/LOGO.jpg">
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
		<div class="map-gui on"><img alt="eight" src="${ctx}/static/image/parkDataCenter/规划2.png"></div>
		<div class="map-chan"></div>
		<div class="map-qi" style="width: 60%;height: 60%;">
			<div class="chart-title">园区企业总数：<span>${chartData.num}</span>个</div>
			<div id="chart" style="width: 100%;height: 100%;"></div>
		</div>
	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/parkDataCenter/industryEconomic?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/parkDataCenter/parkEconomic?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/parkDataCenter/parkEconomic?orgId=${orgId}">
</body>
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
		
		var myChart = echarts.init(document.getElementById('chart'));
		myChart.setOption(option); 
		
		/*页面定时跳转事件*/
		initScreenSaver();
	})
	
	var option = {
			backgroundColor: 'rgba(0, 0, 0, 0.5)', 
			tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		        	type: 'shadow',
		        	 shadowStyle: {
				        	color: 'rgba(40, 40, 80, 0.3)' 
				     }
		        }
		    },
		    grid: {
		    	bottom: '3%',
		        containLabel: true,
		    },
		    xAxis: [
		        {
		            type: 'category',
		            data: ${chartData.xAxis},
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	}
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            name: '企业数（单位：个）',
		            axisLabel: {
		                formatter: '{value} '
		            },
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	splitLine:{
		        		lineStyle:{
		        			opacity:0.2
		        		}
		        	}
		        }
		    ],
		    series: [
		        {
		            name:'总量',
		            type:'bar',
		            data:${chartData.series},
		            barWidth:'30%',
		            markPoint : {
		            	symbolSize : 55,
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ],
		                label:{
		            		normal:{
		            			textStyle:{
			            			color:"#000"
		            			}
		            		}
		            	},
		            	itemStyle:{
		            		normal:{
		            			color:"#FCFF00"
		            		}
		            	}
		            },
		            markLine : {
		            	lineStyle:{
			            	normal:{
			            		color:"#FCFF00"
			            	},
			            	emphasis:{
			            		color:'#FCFF00'
			            	}
			            },
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            },
		            itemStyle:{
		            	normal:{
		            		color:function(params){
		            			var value = params.value;
		            			var color = "";
		            			if(value=='${chartData.max}'){
		            				color='#ff00cd';
		            			}else if(value=='${chartData.min}'){
		            				color='#f5ff00';
		            			}else{
		            				color='#00DEFF';
		            			}
		            		    return color;
		            		}
		            	
		            	}
		            }
		        }
		    ]
	};

	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	    	var orgAreaId ='${orgAreaId}';
	        if(e.wheelDelta>0){ //向上滚动事件 
	        	window.location.href="${ctx}/front/parkDataCenter/industryEconomic?orgId=${orgId}";
	        }else{   //向下滚动事件 
	        	window.location.href="${ctx}/front/parkDataCenter/parkEconomic?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) {  //向上滚动事件
	        	 window.location.href="${ctx}/front/parkDataCenter/industryEconomic?orgId=${orgId}";
	         }else{  //向下滚动事件
	        	 window.location.href="${ctx}/front/parkDataCenter/parkEconomic?orgId=${orgId}";
	         }  
	    } //ScrollText(direct);   
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome  
	
</script>
</html>