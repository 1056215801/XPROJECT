<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${ctx}/static/css/cityDataCenter/lowindy.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/cityDataCenter/site.css" rel="stylesheet">
	<title>宜春工业大数据工业投资</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360900">
		<input type="hidden" id="region" name="region" value="宜春市">
		<input type="hidden" id="kind" name="kind" value="1">
	</form>
	<%@ include file="header.jsp"%>
	<div class="mainpage clear-box">
		<div class="projectIndexBar">
			<img src="${ctx}/static/image/cityDataCenter/ycNew2/decorate_left.png">
			<span id="all" class="projectIndex on">所有项目</span>
			<span id="sy" class="projectIndex">十亿以上项目</span>
			<span id="yy" class="projectIndex">亿元以上项目</span>
			<span id="ww" class="projectIndex">500万以上技改项目</span>
			<img src="${ctx}/static/image/cityDataCenter/ycNew2/decorate_right.png">
		</div>
		<div class="logis-main" style="width: 80%; height: 100%; font-size: 0;">
			<div class="logis-main" style="width: 50%; height: calc(50% + 35px);">
				<div id="map" style="width: 100%; height: 100%;"></div>
				<div class="map-areas" style="top: 10px; left: 20px;">
					<span style="cursor: pointer;">
						<h4>宜春市</h4>
					</span>
					<span>
						<h4>宜春市</h4>
					</span>
				</div>
			</div>
			<div class="logis-main" style="width: calc(50% - 10px); height: calc(50% - 35px); margin-left: 10px; margin-top: 70px;">
				<div class="boxStyleBg">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit">
						<span>项目进度一览</span>
					</div>
					<div class="pieChartBar">
						<div class="" id="chart1" style="height: 100%;"></div>
						<div class="rosePieTip">项目数量(个)</br><span id="roseNum">0</span></div>
					</div>
				</div>
			</div>
			
			<div class="boxStyle" style="width: 100%; height: calc(50% - 10px - 35px); margin-top: 10px;">
				<div class="boxStyleBg" style="padding-top: 0;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="pieChartBar" style="display: inline-block; width: 40%;">
						<div class="barTitle">各行业投资占比(亿元)</div>
						<div id="chart2" style="height: 100%; position: relative;"></div>
					</div>
					<div class="pieChartBar" style="display: inline-block; width: 60%;">
						<div class="barTitle">各行业项目数量对比</div>
						<div id="chart3" style="height: 100%; position: relative;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="logis-main" style="width: calc(20% - 10px); height: 100%; margin-left: 10px; font-size: 0;">
			<div class="boxStyle" style="width: 100%; height: calc(50% - 35px); margin-top: 70px; padding: 0px 5% 5%; ">
				<div class="boxStyleBg" style="overflow: hidden;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit">
						<span>项目一览</span>
					</div>
					<div id="projectBrowseBar" class="projectRealDataBar">
						<div id="projectBrowse" class="projectRealDataBox">
							<!-- <div class="projectRealData">
								<span class="projectRealDataName">宜春经开园区XXX项目上报项目上报项目上报</span>
								<span class="projectRealDataTime">11:02</span>
							</div>-->
						</div>
						<font class="unPublish" style="display: inline-block;left: calc(50% - 9px);">未公布</font>
					</div>
				</div>
			</div>
			<div class="boxStyle" style="width: 100%; height: calc(50% - 10px - 35px); margin-top: 10px; padding: 0px 5% 5%; ">
				<div class="boxStyleBg" style="overflow: hidden;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit">
						<span>工程项目实时动态</span>
					</div>
					<div id="projectRealBar" class="projectRealDataBar">
						<div id="projectReal" class="projectRealDataBox">
							<!-- <div class="projectRealData">
								<span class="projectRealDataName">宜春经开园区XXX项目上报项目上报项目上报</span>
								<span class="projectRealDataTime">11:02</span>
							</div>-->
						</div>
						<font class="unPublish" style="display: inline-block;left: calc(50% - 9px);">未公布</font>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="" method="post" id="detailForm">
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	<input type="hidden" id="info" name="info"/>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script>
$(function(){
	$(".head>a:eq(2)").addClass("on");

	getYcMap();
	getRealTimeData();
	
	$(".projectIndexBar>span").on("click",function(){
		$(this).addClass("on").siblings().removeClass("on");
		
		if($("#all").hasClass("on")){
			$('#kind').val("1");
			getRealTimeData();
		}else if($("#sy").hasClass("on")){
			$('#kind').val("2");
			getRealTimeData();
		}else if($("#yy").hasClass("on")){
			$('#kind').val("3");
			getRealTimeData();
		}else if($("#ww").hasClass("on")){
			$('#kind').val("4");
			getRealTimeData();
		}else{}
	})
	$(".map-areas span:eq(0)").on("click",function(){
		$(this).next().removeClass("on");
		$("#orgId").val('360900');
		getRealTimeData();
	});
})
function getRealTimeData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/enginProjectCommonInfo/secondData",
		type : "post",
		data : {
			"orgId" : $('#orgId').val(),
			"valueKind" : $('#kind').val(),
		},
		success : function(result) {
			if (result.success) {
				if(result.data.total != "" && result.data.total != undefined){
					$("#roseNum").text(result.data.total);
				}
				
				if(result.data.barData.legend != "" && result.data.barData.legend != undefined && result.data.barData.barSeries != "" && result.data.barData.barSeries != undefined){
					barChart(result.data.barData.legend,result.data.barData.barSeries);
				}else{
					$("#chart3").html("<font class=\"unPublish\">未公布</font>");
				}
				
				if(result.data.pieData1.legend != "" && result.data.pieData1.legend != undefined && result.data.pieData1.series != "" && result.data.pieData1.series != undefined){
					rosePieChart(result.data.pieData1.legend,result.data.pieData1.series);
					$(".rosePieTip").show();
				}else{
					$("#chart1").html("<font class=\"unPublish\">未公布</font>");
					$(".rosePieTip").hide();
				}
				
				if(result.data.pieData2.legend != "" && result.data.pieData2.legend != undefined && result.data.pieData2.series != "" && result.data.pieData2.series != undefined){
					for(var i=0;i<result.data.pieData2.series.length;i++){
						var info = result.data.pieData2.series[i];
						info.value = (info.value/10000).toFixed(2);
					}
					
					pieChart(result.data.pieData2.legend,result.data.pieData2.series);
				}else{
					$("#chart2").html("<font class=\"unPublish\">未公布</font>");
				}
				
				$("#projectBrowse").empty();
				if(result.data.projectList != "" && result.data.projectList != undefined){
					for(var j =0 ; j<4 ; j++){
						for(var i=0 ; i<result.data.projectList.length ; i++){
							var info = result.data.projectList[i];
							var _div = "";
							var url = "/projectScheduleInfo/view?id="+info.id+"@moduleId=90020170515113146008077000000002@uniqueMark=sign_project_schedule_important@enginName="+info.projectName+"@type=1";
							_div = "<div class=\"projectRealData\" style=\"font-size: 16px;\">";
							_div+= "	<div class=\"projectRealDataTime\">"+info.parkName+"</div>";
							_div+= "	<div class=\"projectRealDataName\" style=\"width: 100%;\" onclick='goDetail(\""+url+"\")'>"+info.projectName+"</div>";
							_div+= "</div>";
							$("#projectBrowse").append(_div);
						}
					}
					$("#projectBrowseBar .unPublish").hide();
				}else{
					//$("#projectBrowse").html("<font class=\"unPublish\">未公布</font>");
					$("#projectBrowseBar .unPublish").show();
				}
				
				$("#projectReal").empty();
				if(result.data.listData != "" && result.data.listData != undefined){
					for(var j =0 ; j<4 ; j++){
						for(var i=0 ; i<result.data.listData.length ; i++){
							var info = result.data.listData[i];
							var title = info.title;
							var uniqueMark = changeStr(title,"uniqueMark",1);
							var enginName = changeStr(title,"enginName",1);
							var enginId = changeStr(title,"enginId",0);
							var moduleId = changeStr(title,"moduleId",0);
							var type = changeStr(title,"type",0);
							var url = "/projectScheduleInfo/view?id="+enginId+"@moduleId="+moduleId+"@uniqueMark="+uniqueMark+"@enginName="+enginName+"@type="+type;
							var _div = "";
							_div = '<div class="projectRealData">';
							_div+= "	<div class=\"projectRealDataTime\">"+info.time+"</div>";
							_div+= '	<div class="projectRealDataName" onclick="goDetail(\''+url+'\')">'+info.title.split("-param-")[0]+'</div>';
							_div+= "</div>";
							$("#projectReal").append(_div);
						}
					}
					$("#projectRealBar .unPublish").hide();
				}else{
					//$("#projectReal").html("<font class=\"unPublish\">未公布</font>");
					$("#projectRealBar .unPublish").show();
				}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
/**
 * type 1:字符串 0:数字
 */
function changeStr(title,str,type){
	var rst = "";
	if(title.indexOf(str)>=0){
		var s = title.substring(title.indexOf(str)+str.length+2+type);
		var splitStr = type==1?'"':',';
		if(s.indexOf(splitStr)>=0){
			var d = s.substring(0,s.indexOf(splitStr));
			rst = d;
		}else{
			splitStr = '}';
			if(s.indexOf(splitStr)>=0){
				var d = s.substring(0,s.indexOf(splitStr));
				rst = d;
			}
		}
	}
	return rst;
}
function goDetail(url){
	if(isLogin=='1'){ 
		if('${cityId}'==360900){
			if('${orgType}'==0||'${orgType}'==1 ||'${orgType}'==2 ||'${orgType}'==4){
				layer.open({
					  id:'cframe',			
					  type: 2,
					  title: false,
					  closeBtn: 1, //不显示关闭按钮
					  shade: [.4],
					  area: ['70%', '80%'],
					  anim: 2,
					  content: ["${ctx}/toXOffice?type=0&replaceFlag=1&path="+encodeURI(url)], //iframe的url，no代表不显示滚动条
					  btn: ['关闭'],
					  yes: function(index, layero){
			        
						  layer.closeAll();
					  },cancel: function(){ 
			            
			        }
				}); 
			}else{
				alert('您暂无权限查看二级页面')
			}
		}else{
			if('${governmentKind}'==2){
				layer.open({
					  id:'cframe',			
					  type: 2,
					  title: false,
					  closeBtn: 1, //不显示关闭按钮
					  shade: [.4],
					  area: ['70%', '80%'],
					  anim: 2,
					  content: ["${ctx}/toXOffice?type=0&replaceFlag=1&path="+encodeURI(url)], //iframe的url，no代表不显示滚动条
					  btn: ['关闭'],
					  yes: function(index, layero){
			        
						  layer.closeAll();
					  },cancel: function(){ 
			            
			        }
				}); 
			}else{
				alert('您暂无权限查看二级页面')
			}
		}
	}else{ 
		goPage("${ctx}/front/cityDataCenter/ycIndex/15?orgId=3609009")
	}
}

//宜春地图
function getYcMap(){
    var data = [ 
		{name : '袁州区', value : "360902"}, 
		{name : '奉新县', value : "360921"}, 
		{name : '万载县', value : "360922"}, 
		{name : '上高县', value : "360923"}, 
		{name : '宜丰县', value : "360924"}, 
		{name : '靖安县', value : "360925"}, 
		{name : '铜鼓县', value : "360926"}, 
		{name : '丰城市', value : "360981"}, 
		{name : '樟树市', value : "360982"}, 
		{name : '高安市', value : "360983"} 
	]
	$.get('${ctx}/static/map/360900.json', function (chinaJson) {
	    echarts.registerMap('yc', chinaJson);
	    mapChart(data);
	});
}

function mapChart(d1) {
	var myChart = echarts.init(document.getElementById('map'));
    var fz = 12;
    var sz = 10;
    var ss = 45;
    if(width <= 1440){
    	fz = 12;
    	sz = 6;
        ss = 40;
    }
    if(width <= 1366){
    	fz = 10;
        ss = 35;
    }
    var option = {
   		tooltip : {
   			trigger : 'item',
   			formatter : '{b}'
   		},
        geo : {
            roam : true,
            map : 'yc',
            zoom : 1.2,
            aspectScale : 1,
            label : {
                show : true,
                textStyle : {
                    color : '#fff',
                    fontSize: fz
                },
            },
            itemStyle: {
                normal: {
                    borderColor: 'rgba(147, 235, 248, 1)',
                    borderWidth: 1,
                    areaColor: {
                        type: 'radial',
                        x: 0.5,
                        y: 0.5,
                        r: 0.8,
                        colorStops: [{
                            offset: 0, 
                            color: 'rgba(147, 235, 248, 0)' // 0% 处的颜色
                        }, {
                            offset: 1, 
                            color: 'rgba(147, 235, 248, .2)' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    },
                    shadowColor: 'rgba(128, 217, 248, 1)',
                    shadowOffsetX: -2,
                    shadowOffsetY: 2,
                    shadowBlur: 10
                },
                emphasis: {
                    areaColor: '#389BB7',
                    borderWidth: 0
                }
            },
            selectedMode: 'single'
        },
        series : [{
			type : 'map',
			geoIndex : 0,
			data : d1
        },{
            type : 'effectScatter',
            coordinateSystem : 'geo',
            data : yc,
            symbolSize : sz,
            showEffectOn : 'render',
            rippleEffect: {
                period: 4,
                scale: 4,
                brushType: 'fill'
            },
            hoverAnimation : true,
            label : {
                normal : {
					formatter : '{b}',
					position : 'right',
                    textStyle:{
                        color:'#fff'
                    }
                }
            },
            itemStyle : {
                normal : {
                    color : '#0de6e6',
                    shadowBlur : 10,
                    shadowColor : '#333'
                }
            },
            zlevel : 1,
    		tooltip : { show: false}
        }]
    }
    myChart.setOption(option);
    
    myChart.on('click', function(param){
    	if(param.seriesIndex == 0){//点击区块
    		//地图左上区域栏控制
    		if($("#orgId").val() == param.data.value){
				$("#orgId").val('360900');
				$(".map-areas span:eq(1)").removeClass("on");
			} else { 
				$("#orgId").val(param.data.value);
				$(".map-areas span:eq(1)").addClass("on").find("h4").text(param.data.name);
			}
    		
    		//实现重复点击，切换回初始
    		var cityName = param.name;
    		if(cityName == $("#region").text()){
	    		$("#region").text("宜春市");
	    		$('#orgId').val("360900");
	    		//getRealTimeData("360900");
	    		getRealTimeData();
	    	}else{
	            $("#region").text(cityName);
	            $('#orgId').val(param.value);
	            getRealTimeData();
	    	}
    	}else if(param.seriesIndex == 1){//点击坐标点
    		$('#orgId').val(param.name);
            getRealTimeData();
    	}else{}
    })
};

function rosePieChart(legend,series){
	var div_ = document.getElementById("chart1");
	div_.removeAttribute("_echarts_instance_");
	var chart1 = echarts.init(div_);
	//var chart1 = echarts.init(document.getElementById('chart1'));
	rosePieOption.legend.data = legend;
	rosePieOption.series[0].data = series;
	
	chart1.setOption(rosePieOption);
}
var rosePieOption = {
	tooltip: {
		trigger: 'item'
	},
    legend: {
    	show: true,
    	data:[],
    	orient: 'vertical',
        right: '5%',
        itemWidth: 10,
        itemHeight: 10,
        itemGap: 10,
   		textStyle: {
            color: "#fff"
        },
    },
   	grid: {
    	top: '20%',
    	left: '0%',
        right: '0%',
        bottom: '0%',
        containLabel: true
    },
    color:['#B848EE','#FF4571','#FFCF53','#4EC971','#2199FF'],
    series: [{
        type: 'pie',
        radius : ['55%', '70%'],
        center: ['40%', '50%'],
        roseType: 'radius',
        label: {
        	formatter: function(params){
            	return (params.percent).toFixed(0)+"%";
            },
        },
        labelLine: {
        	length: 10,
        	length2: 10,
		},
    }] 
};

function pieChart(legend,series){
	var div_ = document.getElementById("chart2");
	div_.removeAttribute("_echarts_instance_");
	var chart2 = echarts.init(div_);
	//var chart2 = echarts.init(document.getElementById('chart2'));
	pieOption.legend.data = legend;
	pieOption.series[0].data = series;
	
	chart2.setOption(pieOption);
}
var pieOption = {
	tooltip: {
		trigger: 'item'
	},
    legend: {
    	show: true,
    	data:[],
    	orient: 'vertical',
    	top: '5%',
        right: '5%',
        itemWidth: 10,
        itemHeight: 10,
        itemGap: 10,
   		textStyle: {
            color: "#fff"
        },
    },
   	grid: {
    	top: '20%',
    	left: '0%',
        right: '0%',
        bottom: '0%',
        containLabel: true
    },
    color:['#FF43CC','#FFA360','#0060B1','#E60012','#FFFF60',
           '#8957A1','#2199FF','#FF4571','#4EC971','#16ffaf',
           '#f06500','#ffbb18','#009812','#b40040','#49d000',
           '#ff2333'],
    series: [{
        type: 'pie',
        radius : ['55%', '70%'],
        center: ['40%', '55%'],
        label: {
        	formatter: function(params){
            	return (params.percent).toFixed(0)+"%";
            },
        },
        labelLine: {
        	length: 10,
        	length2: 10,
		},
    }] 
};

function barChart(legend,barSeries){
	var div_ = document.getElementById("chart3");
	div_.removeAttribute("_echarts_instance_");
	var chart3 = echarts.init(div_);
	//var chart3 = echarts.init(document.getElementById('chart3'));
	barOption.xAxis.data = legend;
	barOption.series[0].data = barSeries;
	
	chart3.setOption(barOption);
}
var barOption = {
    tooltip: {
    	trigger: "axis",
        axisPointer: {
        	type: "shadow",
        },
    },
    legend: {
    	show: false,
    	data: [],
        align: 'right',
        right: 10,
        itemWidth: 10,
        itemHeight: 10,
        itemGap: 35,
        textStyle: {
            color: "#fff"
        },
    },
    grid: {
    	top: '20%',
    	left: '2%',
        right: '2%',
        bottom: '5%',
        containLabel: true
    },
    xAxis: {
        type: 'category',
        data: ["节能环保","新能源","新材料","生物和新医药","航空产业","先进装备制造","新一代信息技术","锂电和电动汽车","绿色食品","其他"],
        axisLine: {
            lineStyle: {
                color: '#57617B'
            }
        },
        splitLine: {
            lineStyle: {
                color: '#57617B'
            }
        },
        axisTick: {
            show: false
        },
        splitArea: {
            show: false
        },
        axisLabel: {
            interval: 0,
            color: '#83ADBA',
            rotate:35
        },
    },
    yAxis: [{
    	type : 'value',
		axisLabel : {
			formatter : '{value}'
		},
		axisLine : {
			show : false,
			lineStyle: {
                color: '#83adba'
            }
		},
		axisTick : {
			show : false
		},
		splitLine: {
            lineStyle: {
                color: '#57617B'
            }
        },
        splitArea: {
            show: false
        },
    }],
    series: [{
        name: '产业项目数量',
        type: "bar",
        barWidth:'20',
        barGap: 1,
        itemStyle: {
            normal: {
            	color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#12AABB'
                }, {
                    offset: 1,
                    color: '#3451B9'
                }]),
                opacity: 1,
            }
        },
        data: ["78","100","35","14","43","38","64","110","30","10"],
    }]
}
</script>
</html>