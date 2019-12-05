<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>江西省开发区大数据中心</title>
<link href="${ctx}/static/css/dataCenter/dataCenter.css" rel="stylesheet"/>
<script>
 $(function(){
	$("#btnYear").click(function(){		
    	var div = $("#yearMenu"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
	$("#btnQuarter").click(function(){		
    	var div = $("#quarterMenu"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
 });
</script>
<style>
.data_content{
	height: calc(88% - 39px);
    height: -webkit-calc(88% - 39px);
    height: -moz-calc(88% - 39px);
}
.tecSup{
	position: absolute;
	bottom: 0px;
	width: 100%;
	height: 39px;
	line-height: 39px;
	color: #fff;
	text-align: center;
	background-color: #073257;
}
</style>
</head>

<body>
	<form action="" method="post" id="form">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type="hidden" id="areaId" name="areaId" value="${areaInfo.areaId}">
		<input type="hidden" id="areaName" name="areaName" value="${areaInfo.areaName}">
		<input type="hidden" id="year" name="year" value="${searchInfo.year}">
		<input type="hidden" id="quarter" name="quarter" value="${searchInfo.quarter}">
		<input type="hidden" id="isProvince" name="isProvince" value="${areaInfo.isProvince}">
		<input type="hidden" id="provinceId" name="provinceId" value="${provinceId}">
	</form>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/dataCenter/industryCount?orgId=${orgId}">
	<div class="data_main">
		<div class="data_header">
			<img src="${ctx}/static/image/dataCenter/head2.png" width="100%" style="">
			<img src="${ctx}/static/image/dataCenter/LOGO2_FGW.png" width="35%" class="data_logo" style="">
		</div>
		<div class="data_content">
			<div style="margin-bottom:0.5%; text-align:right;">
				<button id="btnYear" class="dropdownButton" type="button" style="margin-right:110px;"><span id="yearText">${searchInfo.year}年</span> <span class="caret"></span></button>
				<ul id="yearMenu" class="dropdownMenu">
					<c:if test="${! empty searchList.yearList}">
						<c:forEach items="${searchList.yearList}" var="info">
							<li><a href="javascript:;" onclick="selectByYear('${info.year}')">${info.year}年</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			
			<div class="data_contentLeft" style="width:32%;">
				<div class="dataBar_2_top" id="gyzjz"></div>
				<div class="dataBar_2_mid" id="zssjdwzj"></div>
				<div class="dataBar_2_btm" id="yqsjkfmj"></div>
			</div>
			
			<div class="data_contentMid" style="width:36%;" id="map"></div>
			
			<div class="data_contentRight" style="width:32%;">
				<div class="dataBar_2_top" id="zyywsr"></div>
				<div class="dataBar_2_mid" id="lr"></div>
				<div class="dataBar_2_btm" id="ckjhz"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="tecSup">技术支持：江西融合科技有限责任公司</div>
	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/dataCenter/organizationCount?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/dataCenter/industryCount?orgId=${orgId}'"></div>
</body>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/economicCountConfig.js"></script>
<script type="text/javascript">
	$(function(){
		/*判断组织id是否有效*/
		var areaInfo = ${areaInfo};
		if($.isEmptyObject(areaInfo)){
			layer.msg('请填写有效组织ID！', {
				shade: 0.5,
				time:100000000
			});
			return;
		}
		 
		/*加载echart图形*/
		loadEchart();
		
		/*页面定时跳转事件*/
		initScreenSaver();
	});
	
	/*按年份搜索*/
	function selectByYear(year){
		$("#yearMenu").slideUp("fast");  
		$("#yearText").text(year+"年");
     	$("#year").val(year);
     	index = 0;
     	$("#areaId").val('${areaInfo.areaId}'); 
		$("#areaName").val('${areaInfo.areaName}');
     	loadEchart();
	}
	
	/*加载图形*/
	var index = 0;
	function loadEchart(){
		$.ajax({
			url:"${ctx}/interface/json/dataCenter/economicCount",
			type:"post",
			data:$("#form").serialize(),
			success:function(result){
				if(result.success){
					/*折线柱形混合图*/
					loadBarAndLineEchart(result.economicData.ecData);
					
					/*地图，只加载一次*/
					if(index==0){						
						loadMapEchart(result.economicData.mapData, result.economicData.visualMap);
						index++;
					}
					
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error:function(){
				layer.msg("数据获取异常！");
			}
		});
	}
	
	/*折线柱形混合图*/
	
	var idIndex = ['gyzjz', 'zyywsr', 'zssjdwzj', 'lr', 'yqsjkfmj', 'ckjhz']
	var titleIndex = [
		'工业增加值', '主营业务收入（单位：亿元）', 
		'招商实际到位资金（单位：亿元）', '利润总额（单位：亿元）', 
		'本月止开发区实际开发面积（单位：平方公里）', '出口交货值（单位：亿元）'
	]
	
	function loadBarAndLineEchart(ecData){
		for(var i=0;i<ecData.length;i++){
			var myChart = echarts.init(document.getElementById(idIndex[i]));
			option.title.text=titleIndex[i];
			var areaStyle = "";
			var barWidth = "";
			if(i==0||i==4){
				option.legend.data = [
					{name:'同比增速',textStyle:{color:"#FCFF00"}}
				]
				option.xAxis[0].boundaryGap = false;
				option.yAxis = yAxisSingle;
				areaStyle = {normal: {}};
			}else{
				option.legend.data = [
					{name:'总量',textStyle:{color:"#FCFF00"}},
					{name:'同比增速',textStyle:{color:"#FCFF00"}}
				]
				option.xAxis[0].boundaryGap = true;
				option.yAxis = yAxisDouble;
				barWidth = "25%";
			}
			
			if(i==3){
				option.xAxis[0].boundaryGap = false;
			}
			
			var series = [];
			for(var j=0;j<ecData[i].length;j++){
				var name = "";
				var type = "";
				var yAxisIndex = 0;
				if(j==0){
					name = "总量";
					type = "bar";
				}else{
					name = "同比增速";
					type = "line";
				}
				
				if(i==0){
					name = "同比增速";
					type = "line";
				}
				
				if(i==0||i==3||i==4){
					type = "line";
				}
				
				if(j==1&&(i!=0&&i!=4)){
					yAxisIndex = 1;
				}
				
				var seriesIndex = {
					name:name,
				    type:type,
				    barWidth:barWidth,
				    yAxisIndex: yAxisIndex,
				    areaStyle: areaStyle,
				    data:ecData[i][j],
				    itemStyle:itemStyle[i][j],
				    markPoint:markPoint[i][j],
				    markLine:markLine[i][j]
				};
				series.push(seriesIndex);
			}
			option.series = series;
			myChart.setOption(option);
		}
	}
	
	var option = {
			backgroundColor: '#082F56', 
			title : {
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:14
		        },
		        left:5,
		        top:5
		    },
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:5,
				right:'2%',
		        data:[]
		    },
		    grid: {
		    	bottom:10,
		        containLabel: true,
		    },
		    xAxis: [
		        {
		            type: 'category',
		            boundaryGap : false,
		            data: ['1-3月','1-6月','1-9月','1-12月'],
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	}
		        }
		    ],
		    yAxis: [],
		    series: []
	};	
	
	
	/*地图*/
	function loadMapEchart(mapData, visualMap){
		
	   	var mapType = [];
	   	var cityMap = {
	   		"南昌市": "360100", "景德镇市": "360200", "萍乡市": "360300", "九江市": "360400",
	        "新余市": "360500", "鹰潭市": "360600", "赣州市": "360700", "吉安市": "360800",
	        "宜春市": "360900", "抚州市": "361000", "上饶市": "361100" 
	   	};
		
	   	for (var city in cityMap) {
	   	    mapType.push(city);
	   	}
	   	
		//JSON 引入示例
	   	var myChart = "";
	   	var areaId = '${areaInfo.areaId}';
	   	var provinceId = '${provinceId}';
	   	
		$.get('${ctx}/static/map/'+areaId+'.json', function (chinaJson) {
		    echarts.registerMap(areaId, chinaJson);
			myChart = echarts.init(document.getElementById('map'));
			if(areaId==360100){
				optionMap.series[0].zoom = 0.9;
			}else if(areaId==360200){
				optionMap.series[0].zoom = 1.0;
			}else if(areaId==360300){
				optionMap.series[0].zoom = 1.1;
			}else if(areaId==360400){
				optionMap.series[0].zoom = 1.0;
			}else if(areaId==360500){
				optionMap.series[0].zoom = 1.0;
			}else if(areaId==360600){
				optionMap.series[0].zoom = 0.9;
			}else if(areaId==360700){
				optionMap.series[0].zoom = 1.0;
			}else if(areaId==360800){
				optionMap.series[0].zoom = 1.0;
			}else if(areaId==360900){
				optionMap.series[0].zoom = 1.0;
			}else if(areaId==361000){
				optionMap.series[0].zoom = 1.0;
			}else if(areaId==361100){
				optionMap.series[0].zoom = 1.0;
			}
			
			optionMap.visualMap.max = visualMap;
			optionMap.series[0].data = mapData;
			
			myChart.setOption(optionMap); 
			if(areaId==provinceId){
				myChart.on('mapselectchanged', function (params){
			        var areaId = "";
			        if(params.selected[params.name]){
			        	areaId = cityMap[params.name]
			        }else{
			        	areaId = provinceId;
			        } 
			        $("#areaId").val(areaId);
			        loadEchart();
			    });
		   	}
		    
		});
	}
	
	var optionMap = {
			title:{
				text:'开发区主要经济指标分布图',
				textStyle:{
					color:'#fff'
				},
				left:'5%',
			},
			tooltip : {
	               trigger: 'item',
	               formatter: function(a){  
	            	   return a.name+":"+a.value;
                   }
	        },
	        visualMap: {
	     		orient: 'horizontal',
	            min: 0,
	            max: 1000,
	            left:'60%',
	            bottom:'5%',
	            text: ['高','低'],           // 文本，默认为数值文本
	            calculable: true,
	            color:['#7dff05','#fcff02'],
	            textStyle: {
	                color: '#fff'
	            }
	        },
            series: [
                {
                	type: 'map',
                    mapType:'${areaInfo.areaId}',
                    roam : false,
                    zoom : 1.1,
                    selectedMode: 'single', 
                    label : {
                        normal: {
                            show: true
                        },
                        emphasis: {
                        	show: true
                        }
                    },
                    itemStyle: {
                        hoverAnimation:false,
                        normal: {
                            borderColor: '#ccc'
                        },
                        emphasis: {
                       	 	areaColor: '#A6C5BD',
                       	 	borderColor: '#FFF',
                            opacity:1
                        }
                    },
                    data:[]
            	}
    		]
	}
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/dataCenter/organizationCount?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/dataCenter/industryCount?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/dataCenter/organizationCount?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/dataCenter/industryCount?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
</script>
</html>
