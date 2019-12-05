<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>大数据中心-园区与企业分析</title>
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
<div class="data_main">
	<form action="" method="post" id="form">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type="hidden" id="areaId" name="areaId" value="${areaInfo.areaId}">
		<input type="hidden" id="areaName" name="areaName" value="${areaInfo.areaName}">
		<input type="hidden" id="year" name="year" value="${searchInfo.year}">
		<input type="hidden" id="quarter" name="quarter" value="${searchInfo.quarter}">
		<input type="hidden" id="isProvince" name="isProvince" value="${areaInfo.isProvince}">
		<input type="hidden" id="provinceId" name="provinceId" value="${provinceId}">
	</form>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/dataCenter/economicCount?orgId=${orgId}">
	<div class="data_header">
		<img src="${ctx}/static/image/dataCenter/head2.png" width="100%" />
		<img src="${ctx}/static/image/dataCenter/LOGO2_FGW.png" width="35%" class="data_logo" />
	</div>
	<div class="data_content">
		<div style="margin-bottom:0.5%; text-align:right;">
			<button id="btnYear" class="dropdownButton" type="button"><span id="yearText">${searchInfo.year}年</span> <span class="caret"></span></button>
			<ul id="yearMenu" class="dropdownMenu">
				<c:if test="${! empty searchList.yearList}">
					<c:forEach items="${searchList.yearList}" var="info">
						<li><a href="javascript:;" onclick="selectByYear('${info.year}')">${info.year}年</a></li>
					</c:forEach>
				</c:if>
			</ul>
			<button id="btnQuarter" class="dropdownButton" type="button">
				<span id="quarterText">第${searchInfo.quarter==4?'四':searchInfo.quarter==3?'三':searchInfo.quarter==2?'二':'一'}季度</span>
				<span class="caret"></span>
			</button>
			<ul id="quarterMenu" class="dropdownMenu" style="right:12px;">
				<c:if test="${! empty searchList.quarterList}">
					<c:forEach items="${searchList.quarterList}" var="info">
						<li><a href="javascript:;" onclick="selectByQuarter('${info.quarter}')">第${info.quarter==4?'四':info.quarter==3?'三':info.quarter==2?'二':'一'}季度</a></li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
		
		<!-- 地图 -->
		<div class="data_contentLeft" style="width:30%;" id="map"></div>
		<div style="position: absolute; left:25%; bottom:8%; z-index: 100;display: none;" id="backBtn">
			<a href="javascript:selectByAreaId('360000','江西省')" style="cursor: pointer;color: yellow" >江西省</a>
		</div>
		
		<div class="data_contentRight" style="width:70%;">
			<div class="clearfix" style="height:22%; margin-bottom:1%;">
				<div class="dataBarGreen">
					<div class="dataBarTitle">开发区总数</div>
					<div class="dataBarNum"><font class="yellowFont24" id="parkNum">-</font></div>
					<div class="dataBarIncrease"></div>
				</div>
				<div class="dataBarMagenta">
					<%-- <div class="dataBarTitle">工业增加值</div>
					<div class="dataBarNum"><font class="yellowFont24">${ecData[1]}</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont">${ecData[2]}%</font></div> --%>
					<div class="dataBarTitle">工业增加值</div>
					<div class="dataBarNum" style="height: 64%;font-size: 14px;">同比增长&nbsp;&nbsp;<font class="yellowFont" style="font-size: 26px;" id="gyzjz_percent">-</font></div>
					<div class="dataBarIncrease" style="height: 1%"></div>
				</div>
				<div class="dataBarNavy">
					<div class="dataBarTitle">主营业务收入</div>
					<div class="dataBarNum"><font class="yellowFont24" id="zyywsr_value">-</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont" id="zyywsr_percent">-</font></div>
				</div>
				<div class="dataBarNavy" style="margin-right:0;">
					<div class="dataBarTitle">利润总额</div>
					<div class="dataBarNum"><font class="yellowFont24" id="lr_value">-</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont" id="lr_percent">-</font></div>
				</div>
			</div>
			<div style="height:76%;">
				<div class="dataBar_1">
					<div class="dataBar_1_Left" id="part1"></div>
					<div class="daraBar_1_Right" id="part2"></div>
					<div style="clear:both;"></div>
				</div>
				<div class="dataBar_1">
					<div class="dataBar_1_Left" id="part3"></div>
					<div class="daraBar_1_Right" id="part4"></div>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div class="tecSup">技术支持：江西融合科技有限责任公司</div>
</div>
<c:choose>
	<c:when test="${areaInfo.isProvince}">
		<div class="btn_prev" onclick="window.location.href='${ctx}/front/dataCenter/energyCount?orgId=${orgId}'"></div>	
	</c:when>
	<c:otherwise>
		<div class="btn_prev" onclick="window.location.href='${ctx}/front/dataCenter/industryCount?orgId=${orgId}'"></div>	
	</c:otherwise>
</c:choose>
<div class="btn_next" onclick="window.location.href='${ctx}/front/dataCenter/economicCount?orgId=${orgId}'"></div>
</body>

<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/coordMap.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/organizationCountConfig.js"></script>

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
     	loadEchart();
	}
	
	/*按季度搜索*/
	function selectByQuarter(quarter){
		$("#quarterMenu").slideUp("fast");
		$("#quarterText").text("第"+(quarter==4?'四':quarter==3?'三':quarter==2?'二':'一')+"季度");
     	$("#quarter").val(quarter);
     	loadEchart();
	}
	
	/*按地市搜索*/
	function selectByAreaId(areaId, areaName){
		$("#areaId").val(areaId); 
		$("#areaName").val(areaName);
		loadEchart();
	}
	
	/*加载图形*/
	function loadEchart(){
		$.ajax({
			url:"${ctx}/interface/json/dataCenter/organizationCount",
			type:"post",
			data:$("#form").serialize(),
			success:function(result){
				if(result.success){
					//园区
					loadParkEchart(result.parkData);
					//地图
					loadMap(result.mapData);
					//企业
					loadCompEchart(result.compAndEcData.compData);
					//经济指标
					loadEcData(result.compAndEcData.ecData);
					
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error:function(){
				layer.msg("数据获取异常！");
			}
		});
	}
	
	/*加载园区相关*/
	function loadParkEchart(parkData){
		var areaName = $("#areaName").val();
		//园区折线图
		var myChart1 = echarts.init(document.getElementById('part1'));
		lineOption.title.text=areaName+"开发区数量（单位：个）";
		lineOption.legend = parkLineLegend;
		lineOption.xAxis[0].data = parkData.line.xAxis;
		lineOption.xAxis[0].boundaryGap = false;
		var series = [];
		for(var i=0;i<parkData.line.series.length;i++){
			var seriesIndex = {
				name:parkLineName[i],
		        type:'line',
		        lineStyle:lineStyle[i],
		        data:parkData.line.series[i],
		        markPoint:markPoint[i],
		        markLine:markLine[i]
			};
			series.push(seriesIndex);
		}
		lineOption.series = series;
		myChart1.setOption(lineOption);
		
		//园区饼图
		var myChart2 = echarts.init(document.getElementById('part2'));
		
		var legend = [];
		var textStyle = {color:'#FFF'};
		for(var i=0;i<parkData.pie.legend.length;i++){
			var legendIndex = {
				name:parkData.pie.legend[i].name,
			    textStyle:textStyle
			};
			legend.push(legendIndex);
		}
		
		pieOption.legend.data=legend;
		pieOption.series[0]= {
		    type:'pie',
		    center:['42%','54%'],
		    radius:['50%', '70%'],
		    data:parkData.pie.series
		};
		myChart2.setOption(pieOption);
		
		//园区总数
		$("#parkNum").text(parkData.parkTotla);
	}
	
	/*加载企业相关*/
	function loadCompEchart(compData){
		var areaName = $("#areaName").val();
		//企业折线图
		var myChart3 = echarts.init(document.getElementById('part3'));
		lineOption.title.text=areaName+"开发区投产企业数量（单位：个）";
		lineOption.legend = compLineLegend;
		lineOption.xAxis[0].data = compData.line.xAxis;
		lineOption.xAxis[0].boundaryGap = true;
		var series = [];
		for(var i=0;i<compData.line.series.length;i++){
			var type = "bar";
			if(i>0){
				type = "line";
			}
			var seriesIndex = {
				name:compLineName[i],
		        type:type,
		        barWidth:'35%',
		        lineStyle:lineStyle[i],
		        data:compData.line.series[i],
		        markPoint:markPoint[i],
		        markLine:markLine[i]
			};
			series.push(seriesIndex);
		}
		lineOption.series = series;
		myChart3.setOption(lineOption);
		
		//企业饼图
		var myChart4 = echarts.init(document.getElementById('part4'));
		pieOption.legend.data=compData.pie.legend;
		pieOption.series[0]= {
		    type:'pie',
		    center:['45%','54%'],
	        radius: ['50%', '70%'],
		    data:compData.pie.series
		};
		myChart4.setOption(pieOption);
	}
	
	/*加载经济指标相关*/
	function loadEcData(ecData){
		if(ecData.gyzjz_percent!='-'){
			$("#gyzjz_percent").text(ecData.gyzjz_percent+"%");
		}
		if(ecData.gyzjz_percent!='-'){
			$("#zyywsr_value").text(ecData.zyywsr_value);
		}
		if(ecData.gyzjz_percent!='-'){
			$("#zyywsr_percent").text(ecData.zyywsr_percent+"%");
		}
		if(ecData.gyzjz_percent!='-'){
			$("#lr_value").text(ecData.lr_value);
		}
		if(ecData.gyzjz_percent!='-'){
			$("#lr_percent").text(ecData.lr_percent+"%");
		}
	}
	
	/*加载地图相关*/
	function loadMap(mapData){
		var mapType = [];
	   	var cityMap = {
	   		"南昌市": "360100","景德镇市": "360200","萍乡市": "360300",
	   		"九江市": "360400","新余市": "360500","鹰潭市": "360600",
	        "赣州市": "360700","吉安市": "360800","宜春市": "360900",
	        "抚州市": "361000","上饶市": "361100"
	   	};
		
	   	for (var city in cityMap) {
	   	    mapType.push(city);
	   	}
	   	var geoCoordMap1 = {
	   	        '赣州市':[114.940278,25.85097],
	   	        '吉安市':[114.986373,27.111699],
	   	        '上饶市':[117.971185,28.44442],
	   	        '九江市':[115.992811,29.712034],
	   	        '抚州市':[116.358351,27.98385],
	   	        '宜春市':[114.809907,28.398954],
	   	        '南昌市':[115.892151,28.676493],
	   	        '景德镇市':[117.214664,29.29256],
	   	        '萍乡市':[113.852186,27.622946],
	   	        '鹰潭市':[117.033838,28.238638],
	   	        '新余市':[114.930835,27.810834],
	   	}
	   	
	  	//这里是生成series的数据，将经纬度和value值映射起来
		var convertData = function (data) {
		    var res = [];
		    if(data!=null&&data!=""){
		    	for (var i = 0; i < data.length; i++) {
			        var geoCoord = geoCoordMap1[data[i].name];
			        if (geoCoord) {
			            res.push({
			                name: data[i].name,
			                value: geoCoord.concat(data[i].value)
			            });
			        }
			    }
		    }
		    return res;
		};
		
		var convertData2 = function (data) {
		    var res = [];
		    if(data!=null&&data!=""){
		    	for (var i = 0; i < data.length; i++) {
			        var geoCoord = geoCoordMap[data[i].name];
			        if (geoCoord) {
			            res.push({
			                name: data[i].name,
			                value: geoCoord.concat(data[i].value)
			            });
			        }
			    }
		    }
		    return res;
		};
		var data = mapData.data2;
		
		var data1 = convertData2(mapData.data1); 
		var data2 = convertData2(mapData.data2); 
		var data3 = convertData2(mapData.data3); 
	    
		var max = 20, min = 0;
	    var maxSize4Pin = 70, minSize4Pin = 20;
		
		var myChart = "";
		var areaId = $("#areaId").val();
		var isProvince = $("#isProvince").val();
		$.get('${ctx}/static/map/'+areaId+'.json', function (chinaJson) {
			echarts.registerMap(areaId, chinaJson);
			myChart = echarts.init(document.getElementById('map'));
			
			if(areaId==360000){
				var mapOption = {
				        tooltip: {
				            trigger: 'item',
				            formatter: function (params) {
				              if(typeof(params.value)[2] == "undefined"){
				              	return params.name + ' : ' + params.value;
				              }else{
				              	return params.name + ' : ' + params.value[2];
				              }
				            }
				        },
				        visualMap: {
				            show: false,
				            min: 0,
				            max: 20,
				            left: 'left',
				            top: 'bottom',
				            text: ['高', '低'], // 文本，默认为数值文本
				            calculable: true,
				            seriesIndex: [1],
				            inRange: {
				                 //color: ['#3B5077', '#031525'] // 蓝黑
				                color: ['#0f0c29', '#302b63', '#24243e'] // 黑紫黑
				            }
				        },
				        geo: {
				            show: true,
				            map: areaId,
				            zoom: 1.15,
				            label: {
				                normal: {
				                    show: false
				                },
				                emphasis: {
				                    show: false,
				                }
				            },
				            roam: false,
				            itemStyle: {
				                normal: {
				                    areaColor: '#031525',
				                    borderColor: '#3B5077',
				                },
				                emphasis: {
				                    areaColor: '#2B91B7',
				                }
				            }
				        },
				        series : [
				            {
				                  type: 'scatter',
				                  coordinateSystem: 'geo',
				                  data: convertData(data),
				                  symbolSize: function (val) {
				                      return val[2] * 2;
				                  },
				                  label: {
				                      normal: {
				                          formatter: '{b}',
				                          position: 'right',
				                          show: true
				                      },
				                      emphasis: {
				                          show: true
				                      }
				                  },
				                  itemStyle: {
				                      normal: {
				                          color: '#05C3F9'
				                      }
				                  }
				              },
				              {
				                  type: 'map',
				                  map: areaId,
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
				                  roam: false,
				                  itemStyle: {
				                      normal: {
				                          areaColor: '#031525',
				                          borderColor: '#3B5077',
				                      },
				                      emphasis: {
				                          areaColor: '#2B91B7'
				                      }
				                  },
				                  animation: false,
				                  data: data
				              },
				              {
				                  type: 'scatter',
				                  coordinateSystem: 'geo',
				                  symbol: 'pin',
				                  symbolSize: function (val) {
				                      var a = (maxSize4Pin - minSize4Pin) / (max - min);
				                      var b = minSize4Pin - a*min;
				                      b = maxSize4Pin - a*max;
				                      return a*val[2]+b;
				                  },
				                  label: {
				                      normal: {
				                          show: true,
				                          textStyle: {
				                              color: '#fff',
				                              fontSize: 9,
				                          }
				                      }
				                  },
				                  itemStyle: {
				                      normal: {
				                          color: '#F62157', //标志颜色
				                      }
				                  },
				                  zlevel: 6,
				                  data: convertData(data),
				              },
				              {
				                  type: 'effectScatter',
				                  coordinateSystem: 'geo',
				                  data: convertData(data.sort(function (a, b) {
				                      return b.value - a.value;
				                  }).slice(0, 5)),
				                  symbolSize: function (val) {
				                      return val[2] * 2;
				                  },
				                  showEffectOn: 'render',
				                  rippleEffect: {
				                      brushType: 'stroke'
				                  },
				                  hoverAnimation: true,
				                  label: {
				                      normal: {
				                          formatter: '{b}',
				                          position: 'right',
				                          show: true
				                      }
				                  },
				                  itemStyle: {
				                      normal: {
				                          color: '#05C3F9',
				                          shadowBlur: 10,
				                          shadowColor: '#05C3F9'
				                      }
				                  },
				                  zlevel: 1
				              },
				               
				          ]
				    };	
				myChart.setOption(mapOption); 
			}else{
				mapOption2.geo.map=areaId;
				mapOption2.series[0].data = data1;
				mapOption2.series[1].data = data2;
				mapOption2.series[2].data = data3;
				myChart.setOption(mapOption2); 
			}
			
		   	if(isProvince=='true'&&areaId!=360000){
		   		$("#backBtn").show();
		   	}else{
		   		$("#backBtn").hide();
		   	}
		    myChart.on('click', function (param) {
		        //mt 就是点击地图获取该位置的城市名称
		        var cityName = param.name;
		        var flag=false;
		        for(var i= 0;i<mapType.length;i++){
		        	if(cityName==mapType[i]){
		        		flag=true;
		        		break;
		        	}
		        }
		        if(flag){
			     	$("#areaId").val(cityMap[cityName]);
			     	$("#areaName").val(cityName);
			     	loadEchart();
		        }
		        
		     });
		});
		
	}
	
	/*折线图配置*/
	var lineOption = {
			backgroundColor: '#082F56', 
			title : {
		        text: '',
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:14,
		        },
		        left:5,
		        top:5
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {},
		    grid: {
		    	bottom:20,
		        containLabel: true,
		    },
		    xAxis : [
		        {
		            type : 'category',
		          	boundaryGap : false,
		            data : [],
		        	axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	axisLabel :{  
		        	    interval:0,
		        	    rotate:35
		        	} 
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {
		                formatter: '{value}'
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
		    series : []
		};

	/*饼图配置*/
	var pieOption = {
			backgroundColor: '#082F56', 
			tooltip: {
			        trigger: 'item',
			        formatter: "{b}: {c} ({d}%)"
			},
			grid: {
		    	bottom:'5%',
		        containLabel: true
		    },
		    legend: {
		        orient: 'vertical',
		        x:'right',
		        padding:[10,10],
		        itemWidth:20,
		        itemHeight:10,
		        data:[]
		    },
		    color:['#CD0567','#FCFF00','#799C0E','#11729D'], 
		    series: []    
		};
	
	/*地图配置*/
	var mapOption2 = {
            tooltip : {
                trigger : 'item',
                formatter : function(a) {
                    return "";
                },
                show:true,
                alwaysShowContent: true,
                enterable: true,
                backgroundColor:'rgba(255,255,255,0.7)',
                borderColor: '#019ADD',
                borderWidth: 2,
                padding: [5,10],
                textStyle: {
                    color: '#000'
                }
            },
            //地图坐标系必备的配置，具体的含义可以参考api
            geo : {
                roam : false,
                map : '360000',
                zoom : 1.2,
                selectedMode : 'single',
                label : {
                    normal : {
                        show : true,
                        textStyle : {
                            color : '#fff'
                        }
                    },
                    emphasis : {
                        show : true
                    }
                },
                itemStyle : {
                    hoverAnimation : false,
                    normal : {
                        color : '#082F56',
                        borderColor : '#FFF'
                    },
                    emphasis : {
                        areaColor : '#A6C5BD',
                        borderColor : '#FFF',
                        opacity : 1
                    }
                }
            },
            series : [ {
                type : 'effectScatter',
                coordinateSystem : 'geo',
                data : [],
                symbol:'circle',
                symbolSize : 5,
                showEffectOn : 'render',
                rippleEffect : {
                    scale : 10,
                    brushType : 'stroke'
                },
                hoverAnimation : true,
                label : {
                    normal : {
                        formatter : function(a){
                            return "";
                        },
                        show : true,
                        position:'inside',
                        offset : [0 ,-20],
                        textStyle:{
                            color:'#fff'
                        }
                    }
                },
                itemStyle : {
                    normal : {
                        color : '#f4e925',
                        shadowBlur : 10,
                        shadowColor : '#333'
                    }
                },
                zlevel : 1
            },
            {
                type : 'scatter',
                coordinateSystem : 'geo',
                data : [],
                symbol:'pin',
                symbolSize : 45,
                rippleEffect : {
                    scale : 10,
                    brushType : 'stroke'
                },
                hoverAnimation : true,
                label : {
                    normal : {
                        formatter : function(a){
                            return a.value[2];
                        },
                        show : true,
                        position: 'inside',
                        textStyle:{
                            color:'#fff'
                        }
                    }
                },
                itemStyle : {
                    normal : {
                        color : '#0af',
                        shadowBlur : 10,
                        shadowColor : '#333'
                    }
                },
                zlevel : 2
            },
            {
                type : 'scatter',
                coordinateSystem : 'geo',
                data : [],
                symbol : 'image://${ctx}/static/image/dataCenter/testTip_03_s.png',
                symbolSize : [135, 25],
                symbolOffset : [0,-10],
                label : {
                    normal : {
                        formatter : function(a){
                            return a.value[2];
                        },
                        show : true,
                        position: 'inside',
                        offset: [0,-6],
                        textStyle:{
                            color:'#000'
                        }
                    }
                },
                zlevel : 3
            }]
        };
	
		
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	    	var isProvince ='${areaInfo.isProvince}';
	        if(e.wheelDelta>0){
	        	if(isProvince=='true'){ //向上滚动事件
	        		window.location.href="${ctx}/front/dataCenter/energyCount?orgId=${orgId}";
	        	}else{
	        		window.location.href="${ctx}/front/dataCenter/industryCount?orgId=${orgId}";
	        	}
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/dataCenter/economicCount?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	             if(isProvince=='true'){
	            	 window.location.href="${ctx}/front/dataCenter/energyCount?orgId=${orgId}";
		         }else{
		        	 window.location.href="${ctx}/front/dataCenter/industryCount?orgId=${orgId}";
		         }
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/dataCenter/economicCount?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
	
</script>

</html>
