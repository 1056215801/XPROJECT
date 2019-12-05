<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>宜春市工业大数据中心</title>
<link href="${ctx}/static/css/cityDataCenter/yc_bigDataCenter.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/plugins/iCheck/custom.css" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/noData.js"></script>
<style>
.icheckbox_square-green, .iradio_square-green {
	background: url(${ctx}/static/img/green_0.png) no-repeat;
}

.btn_confirm {
	padding: 5px;
	height: 25px;
	width: auto;
	border: 1px solid #BAEDFF;
	border-radius: 5px;
	margin-top: 12px;
	line-height: 17px;
	background-color: #3773B2;
	cursor: pointer;
}

.btn_confirm:hover {
	border: 1px solid #6DCCF6;
	background-color: #6DCCF6;
}
.statusTip {
    position: absolute;
    top: 0px;
    left: 0px;
    z-index: 10;
}

</style>

</head>
<body>
	<div class="data_main">
		<form action="" method="post" id="form">
			<input type="hidden" id="orgId" name="orgId" value="${orgId}">
			<input type="hidden" id="parkId" name="parkId" value="">
			<input type="hidden" id="parkName" name="parkName" value="">
			<input type="hidden" id="year" name="year" value="${searchInfo.year}">
			<input type="hidden" id="quarter" name="quarter" value="${searchInfo.quarter}">
		</form>
		<div class="data_header">
			<img alt="" height="42px" src="${ctx}/static/image/cityDataCenter/yc/ycs-logo.png">
			<div class="local-date">
				<p>2018年1月1号</p>
				<h1>00:00:00</h1>
			</div>
			<div class="btnSelect">
				<button id="btnYear" class="dropdownButton" type="button">
					<span id="yearText">${searchInfo.year}年</span><span class="caret"></span>
				</button>
				<ul id="yearMenu" class="dropdownMenu">
					<c:if test="${! empty searchList.yearList}">
						<c:forEach items="${searchList.yearList}" var="info">
							<li><a href="javascript:;" onclick="selectByYear('${info.year}')">${info.year}年</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<div class="btnSelect" style="margin-right: 0%;">
				<button id="btnmonth" class="dropdownButton" type="button">
					<span id="monthText">${searchInfo.month}月</span>
					<span class="caret"></span>
				</button>
				<ul id="monthMenu" class="dropdownMenu">
					<c:if test="${! empty searchList.monthList}">
						<c:forEach items="${searchList.monthList}" var="info">
							<li><a href="javascript:;" onclick="selectByMonth('${info.month}')">${info.month}月</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<img class="statusTip" src="${ctx}/static/image/cityDataCenter/yc/jx.png" style="width:55px; cursor: pointer;" onclick="window.location.href='https://test.inpark.com.cn/XProject/front/dataCenter/organizationCount?orgId=3600009&linkId=3609009'">
		</div>
		<div class="data_content">
			<div class="economicData-county-title">
				全市各园区主要经济指标 <a class="btn_set" href="javascript:void(0);" onclick="table()">
				<img src="${ctx}/static/image/cityDataCenter/yc/tab.png" />&nbsp;<font>报表</font></a>
				<span style="color: #C4EFF8; font-size: 14px; height: 95%; width: auto;" id="parkIndex">
					选择指标： &nbsp;&nbsp;<input type="checkbox" class="i-checks" id="gyzjz" value="gyzjz" data="工业增加值（亿元）"/>&nbsp;&nbsp;工业增加值
					&nbsp;&nbsp;<input type="checkbox" class="i-checks" value="zyywsr" data="主营业务收入（亿元）" checked/>&nbsp;&nbsp;主营业务收入
					&nbsp;&nbsp;<input type="checkbox" class="i-checks" value="lr" data="利润总额（亿元）" checked/>&nbsp;&nbsp;利润总额
					<!-- &nbsp;&nbsp;<input type="checkbox" class="i-checks" value="gyydl" data="工业用电（万度）" />&nbsp;&nbsp;工业用电 -->
					&nbsp;&nbsp;<input type="checkbox" class="i-checks" id="csgyschd_cyry" value="csgyschd_cyry" data="平均从业人数（人）" />&nbsp;&nbsp;平均从业人数
					&nbsp;&nbsp;<!-- <span class="btn_confirm" onclick="selectByIndIndex()">确认</span> -->
				</span>

			</div>
			<div class="economicData-county-content">
				<div class="economicData-county-map" id="map"></div>
				<div class="economicData-county-chart1" id="bar1"></div>
				<div class="economicData-county-chart2" id="bar2"></div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/cityDataCenter/index/1?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/cityDataCenter/index/6?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/cityDataCenter/index/6?orgId=${orgId}">
	
</body>
<script>
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

	$(function() {
		setTime();
		setInterval(setTime, 1000);
		$("#btnYear").click(function() {
			var div = $("#yearMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		$("#btnQuarter").click(function() {
			var div = $("#quarterMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		$(".i-checks").iCheck({
			checkboxClass : "icheckbox_square-green",
			radioClass : "iradio_square-green"
		});
		
		/*经济运行数据*/
		loadData();
		/* 宜春市地图 */
		loadMap();
		/*页面定时跳转事件*/
		initScreenSaver();
		
		$("#gyzjz").on('ifChecked', function(event){
			var year = $("#year").val();
			if(year==2018){
				layer.msg("工业增加值暂未公布！");
			}
		});
		$("#csgyschd_cyry").on('ifChecked', function(event){
			var year = $("#year").val();
			if(year==2018){
				layer.msg("平均从业人数暂未公布！");
			}
		});
		
		$(".i-checks").on('ifChecked', function(event){
			var count = 0;
			$(".i-checks").each(function(){
				if($(this).is(':checked')){
					count ++;
				}
			})
			if(count==2){
				selectByIndIndex();
			}
			
		});
		
		$(".i-checks").on('ifUnchecked', function(event){
			var count = 0;
			$(".i-checks").each(function(){
				if($(this).is(':checked')){
					count ++;
				}
			})
			if(count==2){
				selectByIndIndex();
			}
		});
		
	})
	
	/*按年份搜索*/
	function selectByYear(year) {
		$("#yearMenu").slideUp("fast");
		$("#yearText").text(year + "年");
		$("#year").val(year);
		loadData();
	}

	/*按季度搜索*/
	function selectByQuarter(quarter) {
		$("#quarterMenu").slideUp("fast");
		$("#quarterText").text("第" + (quarter == 4 ? '四' : quarter == 3 ? '三' : quarter == 2 ? '二' : '一') + "季度");
		$("#quarter").val(quarter);
		loadData();
	}

	function selectByIndIndex(){
		var count = 0;
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				count += 1;
			}
		});
		
		if(count!=2){
			layer.msg("请选择两项进行展示！");
			return;
		}
		
		loadbar(econData);
	}
	
	function table(){
		window.location.href="${ctx}/front/cityDataCenter/index/5?orgId=${orgId}";
	}
	
	var econData = "";
	function loadData() {
		var orgId = $("#orgId").val();
		var parkId = $("#parkId").val();
		var year = $("#year").val();
		var quarter = $("#quarter").val();
		
		
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/yc/fourthPageData",
			type : "post",
			data : {
				"orgId" : orgId,
				"parkId" : parkId,
				"year" : year,
				"quarter" : quarter
			},
			success : function(result) {
				if (result.success) {
					econData = result.fourthPageData
					loadbar(econData);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}

		})
	}

	function loadbar(econData){
		var parkIndex = new Array();
		var parkIndexName = new Array();
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				parkIndex.push($(this).val());
				parkIndexName.push($(this).attr("data"));
			}
		});
		var bar1 = echarts.init(document.getElementById('bar1'));
		option.xAxis[0].data = econData.xAxis;
		var parkId = $("#parkId").val();
		var parkName = $("#parkName").val();
		if(parkId!=null&&parkId!=""){
			option.title.text=parkName+parkIndexName[0];
			option.xAxis[0].axisLabel.rotate=0;
		}else{
			option.xAxis[0].axisLabel.rotate=20;
			option.title.text = parkIndexName[0];
		}
		
		if(!$.isEmptyObject(econData[parkIndex[0]])){
			option.series[0].data = econData[parkIndex[0]].bar;
			option.series[1].data = econData[parkIndex[0]].line;
			bar1.setOption(option);
		}else{
			bar1.setOption(noDataOption);
		}
		
		if(parkId!=null&&parkId!=""){
			option.title.text=parkName+parkIndexName[1];
		}else{
			option.title.text = parkIndexName[1];
		}
		
		var bar2 = echarts.init(document.getElementById('bar2'));
		if(!$.isEmptyObject(econData[parkIndex[0]])){
			option.series[0].data = econData[parkIndex[1]].bar;
			option.series[1].data = econData[parkIndex[1]].line;
			bar2.setOption(option);
		}else{
			bar2.setOption(noDataOption);
		}
	}

	function loadMap() {
		var mapType = [];
		var cityMap = {
			"丰城高新技术产业园区" : "1226",
			"宜丰工业园区" : "1229",
			"铜鼓工业园区" : "1285",
			"宜春经济技术开发区" : "1224",
			"樟树工业园区" : "1225",
			"靖安工业园区" : "1227",
			"万载工业园" : "1230",
			"宜春袁州工业园区" : "1284",
			"奉新工业园区" : "1047",
			"上高工业园区" : "1113",
			"高安高新技术产业园区" : "1228"
		};

		for ( var city in cityMap) {
			mapType.push(city);
		}
		var geoCoordMap = {
			"丰城高新技术产业园区" : [115.74159,28.217616],
			"宜丰工业园区" : [114.854201,28.359521],
			"铜鼓工业园区" : [114.483175,28.623062],
			"宜春经济技术开发区" : [114.41185,27.873058],
			"樟树工业园区" : [115.489769,28.070988],
			"靖安工业园区" : [115.388088,28.880529],
			"万载工业园" : [114.50881,28.129731],
			"宜春袁州工业园区" : [114.328447,27.932489],
			"奉新工业园区" : [115.419849,28.680469],
			"上高工业园区" : [114.962862,28.258878],
			"高安高新技术产业园区" : [115.443779,28.470796]
		}
		var data = [ 
			{name : '丰城高新技术产业园区', value : 1226}, 
			{name : '宜丰工业园区', value : 1229}, 
			{name : '铜鼓工业园区', value : 1285}, 
			{name : '宜春经济技术开发区', value : 1224}, 
			{name : '樟树工业园区', value : 1225}, 
			{name : '靖安工业园区', value : 1227}, 
			{name : '万载工业园', value : 1230}, 
			{name : '宜春袁州工业园区', value : 1284}, 
			{name : '奉新工业园区', value : 1047}, 
			{name : '上高工业园区', value : 1113},
			{name : '高安高新技术产业园区', value : 1228}
		]
		//这里是生成series的数据，将经纬度和value值映射起来
		var convertData = function(data) {
			var res = [];
			if (data != null && data != "") {
				for (var i = 0; i < data.length; i++) {
					var geoCoord = geoCoordMap[data[i].name];
					if (geoCoord) {
						if(data[i].value==$("#parkId").val()){
							res.push({
								name : data[i].name,
								value : geoCoord.concat(data[i].value),
								itemStyle: {
					                normal: {
					                 	color: '#FCFF00',
					                    label:{
					                    	show:true,
					                    	textStyle:{
					                    		color:'#FCFF00',
					                    		fontSize:14,
					                    		fontWeight:'bold'
					                    	}
					                    }
					                }
					            }
							});
						}else{
							res.push({
								name : data[i].name,
								value : geoCoord.concat(data[i].value)
							});
						}
						
					}
				}
			}
			return res;
		};

		$.get('${ctx}/static/map/360900.json', function(chinaJson) {
			echarts.registerMap('360900', chinaJson);
			var mapChart = echarts.init(document.getElementById('map'));
			mapOption.series[1].data=convertData(data);
			mapChart.setOption(mapOption);
			
			mapChart.on('click', function (params) {
				var parkName = params.data.name
				var flag=false;
		        for(var i= 0;i<mapType.length;i++){
		        	if(parkName==mapType[i]){
		        		flag=true;
		        		break;
		        	}
		        }
		        if(cityMap[parkName]==null||cityMap[parkName]==""){
		        	return;
		        }
		        
		        if(cityMap[parkName]==$("#parkId").val()){
		        	 window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
		        }else{
		        	$("#parkId").val(cityMap[parkName]);
			        $("#parkName").val(parkName);
			        if(flag){
			        	loadData(cityMap[parkName]);
			        	loadMap();
				    } 
		        }
		        
		           
		    });

		});
			
	}

	/*折线图配置*/
	var option = {
		backgroundColor : '#082F56',
		title : {
			text : '',
			textStyle : {
				color : "#b0e7ff",
				fontSize : 16,
			},
			left : '2%',
			top : '5%'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			top: '7%',
			right:'45%',
			inactiveColor:'#FFF',
	        data:[
				{name:'总量',textStyle:{color:"#FCFF00"}},
				{name:'同比',textStyle:{color:"#FCFF00"}}
			]
		},
		grid : {
			bottom : '15%',
			top : '35%',
			left: '5%',
			right: '5%',
			containLabel : true,
		},
		xAxis : [ {
			type : 'category',
			boundaryGap : true,
			axisLine : {
				lineStyle : {
					color : "#5EC9F4"
				}
			},
			axisLabel :{  
        	    interval:0,
        	    rotate:20
        	} 
		} ],
		yAxis : [ {
	        type: 'value',
	        name: '总量',
	        scale: true,
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
	    },
	    {
	        type: 'value',
	        name: '同比',
	        scale: true,
	        axisLabel: {
	            formatter: '{value} %'
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
	    }],
		series : [
			{
				name : '总量',
				type : 'bar',
				barWidth : '35%',
				yAxisIndex: 0,
				markPoint : {
	            	symbolSize:40,
	            	itemStyle:{
	            		normal:{
	            			color:"#CD0567"
	            		}
	            	},
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'} 
	                ]
	            }
			},
			{
				name : '同比',
				type : 'line',
				yAxisIndex: 1,
				lineStyle:{
	            	normal:{
	            		color:"#CD0567"
	            	}
	            },
				markPoint : {
					symbolSize:40,
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
		            		color:'#FCFF00'
		            	}
	                }
	            }
			}
		]
	};
	
	/*地图配置*/
	var mapOption = {
		tooltip : {
			trigger : 'item',
			formatter : '{b}'
		},
		geo : {
			show : true,
			map : '360900',
			zoom : 1.1,
			label : {
				normal : {
					show : false,
				},
				emphasis : {
					show : false,
				}
			},
			roam : false,
			itemStyle : {
				hoverAnimation : false,
				normal : {
					color : '#0A3A6A',
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
			type : 'map',
			geoIndex : 0
		},
		{
			type : 'effectScatter',
			coordinateSystem : 'geo',
			symbolSize : function(val) {
				return 10;
			},
			showEffectOn : 'render',
			rippleEffect : {
				scale : 5,
				brushType : 'stroke'
			},
			label : {
				normal : {
					formatter : '{b}',
					position : 'right',
					show : true,
					color : '#fff'
				}
			},
			itemStyle: {
                normal: {
                 	color: '#05C3F9',
                    borderColor: 'rgba(100,149,237,1)',
                    label:{
                    	show:true,
                    	textStyle:{
                    		color:'#fff',
                    		fontSize:12
                    	}
                    }
                },
                emphasis: {
                	areaColor: '#A6C5BD',
                	borderColor: '#fff',
                    opacity:1,
                    label:{
                    	show:true,
                    	textStyle:{
                    		color:'#fff'
                    	}
                    }
                }
            },
			zlevel : 1
		}]
	};
	
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/cityDataCenter/index/6?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/cityDataCenter/index/6?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
</script>
</html>
