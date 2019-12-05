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
<title>鹰潭市铜产业大数据中心-产业在线</title>
<style>
</style>	
</head>
<body class="gray-bg cyzx">
	<div class="cyzxImg">
		<img alt="" src="${ctx}/static/image/cityDataCenter/yt/GIF.gif">
	</div>
	<div class="index">
		<div class="cyzxTag">
			<a href='${ctx}/front/cityDataCenter/ytIndex/6'></a>
			<a href='${ctx}/front/cityDataCenter/ytIndex/7'></a>
		</div>
		<div class="ytMapCenter">
	   		<div class="yt-map" id='ytMap'></div>
		</div>
   		<div class="ytMapLabel">
   			<img alt="" src="${ctx}/static/image/cityDataCenter/yt/index5_label1.png">
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
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light2.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index5.png">
	    	</a>
    	</div>
    	<a href="${ctx}/front/cityDataCenter/ytIndex/1" class="back-btn"><img alt="" src="${ctx}/static/image/cityDataCenter/yt/back.png"></a>
    </div>
</body>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript">
$(function(){
	getYtMap();
	$(".links .link").on("mouseenter",function(){
		var $ind = $(this).index();
		if($ind!=4){
			$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light2.png");
			$(this).find('.light').css("transition","none");
		}
	});
	$(".links .link").on("mouseleave",function(){
		var $ind = $(this).index();
		if($ind!=4){
			$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light1.png");
			$(this).find('.light').css("transition","none");
		}
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
    		['117.384552', '27.978105'],
    		['117.254552', '27.941105'],
    		['117.263652', '27.971105'],
    		['117.384552', '28.078105'],
    		['117.214552', '27.991105'],
    		['117.084552', '28.001105'],
    		['117.184552', '28.191105'],
    		['117.154552', '28.101105'],
    		['117.164552', '28.151105'],
    		['117.114552', '28.151105'],
    		['117.114552', '28.171105'],
    		['117.004552', '28.211105'],
    		['116.954552', '28.251105'],
    		['117.004552', '28.291105'],
    		['117.094552', '28.281105'],
    		['117.004552', '28.428105']
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
		            name: 'es5',
		            type: 'effectScatter',
		            coordinateSystem: 'geo',
		            data: eSdata,
		            symbolSize: [10,15],
		            showEffectOn: 'render',
		            rippleEffect: {
		            	scale: 3.5,
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
		    },{
	            name: 'es6',
	            type: 'effectScatter',
	            coordinateSystem: 'geo',
	            data: [['117.184552', '28.308105']],
	            symbolSize: [10,15],
	            showEffectOn: 'render',
	            rippleEffect: {
	            	scale: 3,
	                brushType: 'stroke'
	            },
	            itemStyle: {
	                normal: {
	                    opacity: 0.5,
	                	color: '#00FFFC',
	                    shadowBlur: 10,
	                    shadowColor: '#05C3F9'
	                }
	            },
	            zlevel: 2
	     },{
	            name: 'es7',
	            type: 'scatter',
	            coordinateSystem: 'geo',
	            data: eSdata,
	            symbolSize: [12,52],
	            symbol: 'image://${ctx}/static/image/cityDataCenter/yt/s1.png',
	            symbolRotate: 90,
	            zlevel: 3,
	            symbolOffset: ['-30px', '0px'],
	            animation: false
	     },{
	            name: 'es7',
	            type: 'scatter',
	            coordinateSystem: 'geo',
	            data: [['117.184552', '28.308105']],
	            symbolSize: [12,52],
	            symbol: 'image://${ctx}/static/image/cityDataCenter/yt/s2.png',
	            symbolRotate: 90,
	            zlevel: 4,
	            symbolOffset: ['-30px', '0px'],
	            animation: false
	     }] 
		 };
		chart.setOption(option);
    }
}



</script>
</html>
