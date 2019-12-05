<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/ytHomePage.css"/>
<title>鹰潭市铜产业大数据中心</title>
<style>
</style>	
</head>
<body class="gray-bg sy">
	<div class="index">
		<div class="ytMapCenter">
	   		<div class="yt-map" id='ytMap'></div>
		</div>
   		<div class="ytMapLabel">
   			<img class="item1" alt="" src="${ctx}/static/image/cityDataCenter/yt/item1.png">
   			<img class="item2" alt="" src="${ctx}/static/image/cityDataCenter/yt/item2.png">
   			<img class="item3" alt="" src="${ctx}/static/image/cityDataCenter/yt/item3.png">
   		</div>
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
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index4.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/6" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index5.png">
	    	</a>
    	</div>
    </div>
</body>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript">
$(function(){
	getYtMap();
	$(".links .link").on("mouseenter",function(){
		$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light2.png");
	});
	$(".links .link").on("mouseleave",function(){
		$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light1.png");
	});
})
function getYtMap(){
	$.get('${ctx}/static/map/360600.json', function (chinaJson) {
		echarts.registerMap('yingtan', chinaJson);
		console.log(chinaJson)
		ytMap()
	});
    function ytMap (){
    	var ytData = [ 
    		{name : '贵溪市', value : ['360681','GUIXI']}, 
    		{name : '余江县', value : ['360603','YUJIANG']},
    		{name : '月湖区', value : ['360602','YUEHU']},
    	]
    	var eSdata = [
    		['117.075594', '28.281906'],
    		['117.225594', '28.151906'],
    		['117.045594', '28.001906'],
    	]
		var chart = echarts.init(document.getElementById('ytMap'));
		var option = {
	        geo: {
	           show: true,
	           map: 'yingtan',
	           aspectScale: 0.6,
	           center: ['116.935594', '28.221906'],
	           zoom: 1.3,
	           label: {
	               normal: {
	                   show: false
	               },
	               emphasis: {
	                   show: false,
	               }
	           },
	           itemStyle: {
	        	   opacity: 0,
	           } 
		    },
			series : [{
	            name: 'light',
	            type: 'scatter',
	            coordinateSystem: 'geo',
	            data: ytData,
	            symbolSize: 5,
	            label: {
	                normal: {
	                    formatter: '{b}',
	                    position: 'right',
	                    show: true
	                }
	            },
	            itemStyle: {
	                normal: {
	                    color: '#F4E925'
	                }
	            }
		     },{
		            type: 'map',
		            map: 'yingtan',
		            geoIndex: 0,
		            aspectScale: 0.75, //长宽比
		            showLegendSymbol: false, // 存在legend时显示
		            label: {
		                normal: {
		                    show: false
		                },
		                emphasis: {
		                    show: false,
		                    textStyle: {
		                        color: '#fff'
		                    }
		                }
		            },
		            roam: true,
		            itemStyle: {
		                normal: {
		                    areaColor: '#031525',
		                    borderColor: '#FFFFFF',
		                },
		                emphasis: {
		                    areaColor: '#2B91B7'
		                }
		            },
		            animation: false,
		            data: ytData
		        },{
		            name: 'Top 5',
		            type: 'effectScatter',
		            coordinateSystem: 'geo',
		            data: eSdata,
		            symbolSize: 13,
		            showEffectOn: 'render',
		            rippleEffect: {
		            	scale: 4,
		                brushType: 'stroke'
		            },
		            itemStyle: {
		                normal: {
		                    color: '#FFF100',
		                    shadowBlur: 10,
		                    shadowColor: '#05C3F9'
		                }
		            },
		            zlevel: 1
		    }] 
		 };
		chart.setOption(option);
    }
}



</script>
</html>
