<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit"/>
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<title>江西省工业大数据工业投资</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360000">
		<input type="hidden" id="region" name="region" value="江西省">
		<input type="hidden" id="type" name="type" value="0">
	</form>
	<%@ include file="header.jsp"%>
	<div class="content2 p15 fz0">
		<div class="spanStyle" style="width: 25%;">
			<div class="blockStyle" style="height: 35%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">工业投资</span>
					</div>
					<div class="tabContBar">
						<div class="industryIndexBoxBar">
							<div class="industryIndexBox">
								<div class="industryIndexName">投资总额（亿元）</div>
								<div class="industryIndexValue"><i></i><span id="investTotal">0%</span></div>
							</div>
							<div class="industryIndexBox">
								<div class="industryIndexName">增速</div>
								<div class="industryIndexValue"><i></i><span id="growthRate">0%</span></div>
							</div>
							<div class="industryIndexBox">
								<div class="industryIndexName" id="pm">全国排名</div>
								<div class="industryIndexValue"><i></i><span id="countryRanking">0</span></div>
							</div>
						</div>
						<div style="display: inline-block; vertical-align: middle; width: calc(100% - 150px); height:100%; position: relative;">
							<div id="chart1" style="height: 100%;"></div>
							<div class="progressPieTip" style="top: 50%;">
								<div class="progressValue">0</div>
								<div class="progressUnit">总投资额（亿元）</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(65% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">省三百计划重大项目</span>
					</div>
					<div class="tabContBar">
						<div class="majorProject">
							<div class="majorProjectTitle" id="majorTitle1"></div>
							<div class="majorProjectContent">
								<span class="majorProjectChart">
									<div id="liquidfillChart1" style="height: 100%;"></div>
									<div class="majorProjectChartTip">开工率</div>
								</span>
								<span class="majorProjectCont">
									<div class="majorProjectName">投资进度</div>
									<div class="majorProjectProgress" id="majorProgress1">
										<div></div>
									</div>
									<span class="majorProjectValue" id="majorValue1"></span>
									<div class="majorProjectTotal" id="majorTotal1"></div>
								</span>
							</div>
						</div>
						<div class="majorProject">
							<div class="majorProjectTitle" id="majorTitle2"></div>
							<div class="majorProjectContent">
								<span class="majorProjectChart">
									<div id="liquidfillChart2" style="height: 100%;"></div>
									<div class="majorProjectChartTip">开工率</div>
								</span>
								<span class="majorProjectCont">
									<div class="majorProjectName">投资进度</div>
									<div class="majorProjectProgress" id="majorProgress2">
										<div></div>
									</div>
									<span class="majorProjectValue" id="majorValue2"></span>
									<div class="majorProjectTotal" id="majorTotal2"></div>
								</span>
							</div>
						</div>
						<div class="majorProject">
							<div class="majorProjectTitle" id="majorTitle3"></div>
							<div class="majorProjectContent">
								<span class="majorProjectChart">
									<div id="liquidfillChart3" style="height: 100%;"></div>
									<div class="majorProjectChartTip">开工率</div>
								</span>
								<span class="majorProjectCont">
									<div class="majorProjectName">投资进度</div>
									<div class="majorProjectProgress" id="majorProgress3">
										<div></div>
									</div>
									<span class="majorProjectValue" id="majorValue3"></span>
									<div class="majorProjectTotal" id="majorTotal3"></div>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(50% - 10px);">
			<div class="blockStyle" style="height: 100%;">
				<div class="demoTip">提示：本页面展示为模拟数据!</div>
				<div class="dataBrandBar" style="width: 100%;">
					<div class="dataBrand" style="width: 50%; padding-left: 10%; display: inline-block;">
						<div class="dataBrandName">省调度项目总数</div>
						<div class="dataBrandValue" id="projectCount"></div>
					</div>
					<div class="dataBrand" style="width: 50%; padding-left: 10%; display: inline-block;">
						<div class="dataBrandName">全省动态更新次数</div>
						<div class="dataBrandValue" id="updateCount"></div>
					</div>
				</div>
				<div class="jx-map">
					<div class="main-tabs" style="position: absolute; height: auto; top: 120px; left: 20px; z-index: 999;">
						<span class="on" style="display: block;"><font>全部</font></span>
						<span style="display: block;"><font>亿元以上</font></span>
						<span style="display: block;"><font>技改</font></span>
						<span style="display: block;"><font>新经济新动能</font></span>
					</div>
					<div class="jxMap" id="jxMap" style="padding-top: 100px;"></div>
					<div class="map-areas jx-areas">
						<span>
							<h4>江西省</h4>
						</span>
						<span>
							<h4>宜春市</h4>
						</span>
						<span>
							<h4>宜春市</h4>
						</span>
					</div>
					<div class="jx-total">
						<b id="mapTotal">104</b>个
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(25% - 10px);">
			<div class="blockStyle" style="height: 55%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">国家和省级重点创新项目</span>
					</div>
					<div class="tabContBar">
						<div style="width: 100%; height: 50%; position: relative;">
							<div id="chart2" style="height: 100%;"></div>
							<div class="progressPieTip" style="top: 50%;">
								<div class="progressValue">0</div>
								<div class="progressUnit">总投资额（亿元）</div>
							</div>
						</div>
						<div style="width: 100%; height: 50%; position: relative;">
							<div id="gaugeChart" style="height: 100%;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(45% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">全省工程项目实时动态</span>
					</div>
					<div class="tabContBar">
						<div style="height:100%; overflow:hidden;">
							<div class="projectRealDataBar">
								<div class="projectRealDataBox">
								</div>
								<font class="unPublish" style="display: inline-block;left: calc(50% - 9px);">未公布</font>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts-liquidfill.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head>a:eq(2)").addClass("on");
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		});
		$(".main-tabs span").on("click",function(){  //地图切换
			$(this).addClass("on").siblings().removeClass("on");
			$("#type").val($(this).index());
			getIndustryMap(); //宜春地图
		});
		
		getIndustryMap();
		getIndustryData();
		getRealTimeData();
	})
	var mapData = [];
	function getIndustryMap(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getProIndInnProjectData",
			type : "post",
			data : {
				"type" : $('#type').val()
			},
			success : function(result) {
				console.log(result)
				if (result.success) {
					mapData = [];
					$("#mapTotal").text(result.data[0].projectNum);
					result.data = result.data.slice(1);
		 			for(var i=0;i<result.data.length;i++){
						var info = result.data[i];
						var data = {};
						if(info.spaceId && info.spaceId != '-1') {
							data.name = info.spaceId;
						} else { data.name = info.areaId;}
				    	
						data.value = info.projectNum;
						data.cName = areaInfoMap[data.name];
						mapData[i] = data;
		 			}
					mapData = convertData(mapData);
					//var id = $('#areaId').val() == '' ? '360000' : $('#areaId').val();
		 			$.get('${ctx}/static/map/360000.json', function (chinaJson) {
		 			    echarts.registerMap('jx', chinaJson);
		 			   	jxDemo(360000);
		 			});
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	function jxDemo(type) {
	    var myChart = echarts.init(document.getElementById('jxMap'));
	    var fz2 = 16;
	    var fz = 12;
	    var sz = 10;
	    var ss = 60;
	    if(width <= 1440){
	    	fz = 12;
	    	sz = 6;
	        ss = 50;
	    }
	    if(width <= 1366){
	    	fz = 10;
	        ss = 40;
	    }
	    var option = {
    		tooltip : {
    			trigger : 'item',
    			formatter : '{b}'
    		},
            geo : {
                map : 'jx',
                zoom : 1.2,
                aspectScale : 1,
                label : {
                    show : false
                },
                itemStyle: {
                    borderColor: '#272798',
                    borderWidth: 1,
                    areaColor: '#323EED'
                },
                emphasis: {
                    itemStyle: {
                        areaColor: '#389BB7'
                    },
                    label : { show : false }
                }
            },
            series : [{
                type : 'effectScatter',
                coordinateSystem : 'geo',
                data : mapData,
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
                        show : true,
                        textStyle : {
                            color : '#fff',
                            fontSize: 14
                        },
                        formatter : function(a){
                            return a.value[3];
                        },
                        offset: [0, 15]
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
            },{
                type : 'scatter',
                coordinateSystem : 'geo',
                data : mapData,
                symbol:'pin',
                symbolSize : function(a){
                    return a[2]&&a[2]>1?ss:0;
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
                            color:'#FF6642',
                            fontWeight: 'bold',
                            fontSize: fz2
                        }
                    }
                },
                itemStyle : {
                    normal : {
                        color : '#FFE42D',
                        shadowBlur : 12,
                        shadowColor : '#333',
                    }
                },
                zlevel : 2,
        		tooltip : { show: false}
            },{
                type : 'scatter',
                coordinateSystem : 'geo',
                data : mapData,
                symbol : 'image://../../../static/image/cityDataCenter/jxNew/testTip_03_s.png',
                symbolSize : function(a){
                	var size = nvlStr(a[4]).length;
                    return [size*13,25];
                },
                symbolOffset : [0,-14],
                label : {
                    normal : {
                        formatter : function(a){
                            return nvlStr(a.data.value[4]);
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
	    }
	    myChart.setOption(option);
	    myChart.off('click');
		myChart.on("click",function(params){
			if(params.componentType == 'geo') { 
				if(countyMap[params.name] == "360900"){
					goPage("${ctx}/front/cityDataCenter/gxwIndex/12");
				}else{
					layer.msg(params.name+"工业投资建设中，建议点击宜春市！");
				}
			} else {
				if(params.name == "360900"){
					goPage("${ctx}/front/cityDataCenter/gxwIndex/12");
				}else{
					layer.msg(params.value[3]+"工业投资建设中，建议点击宜春市！");
				}
			}
		})
	};
	//这里是生成series的数据，将经纬度和value值映射起来
    var convertData = function(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = jxMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name : data[i].name,
                    value : geoCoord.concat(data[i].value).concat(data[i].cName)
                });
            }
        }
        return res;
    };
	function getIndustryData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getCompanyPortraitData",
			type : "post",
			data : {
				"fileName" : "proIndInv"
			},
			success : function(result) {
				console.log(result)
				if (result.success) {
					$("#projectCount").empty();
					if(result.data.mainData.totalNum != "" && result.data.mainData.totalNum != undefined){
						$("#projectCount").rollNum({
					    	deVal: result.data.mainData.totalNum,
					    	digit: result.data.mainData.totalNum.toString().length
					    });
					}else{
						$("#projectCount").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
					$("#updateCount").empty();
					if(result.data.mainData.dynamicTotalNum != "" && result.data.mainData.dynamicTotalNum != undefined){
					    $("#updateCount").rollNum({
					    	deVal: result.data.mainData.dynamicTotalNum,
					    	digit: result.data.mainData.dynamicTotalNum.toString().length
					    });
					}else{
						$("#updateCount").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
					
					if(result.data.indInvData.total != "" && result.data.indInvData.total != undefined){
						$("#investTotal").text(result.data.indInvData.total);
					}else{
						$("#investTotal").text("未公布");
					}
					if(result.data.indInvData.totalPro != "" && result.data.indInvData.totalPro != undefined){
						$("#growthRate").text(result.data.indInvData.totalPro+"%");
					}else{
						$("#growthRate").text("未公布");
					}
					if(result.data.indInvData.orderNum != "" && result.data.indInvData.orderNum != undefined){
						$("#countryRanking").text(result.data.indInvData.orderNum);
					}else{
						$("#countryRanking").text("未公布");
					}
					
					if(result.data.indInvData.total != "" && result.data.indInvData.total != undefined && result.data.indInvData.finishTotal != "" && result.data.indInvData.finishTotal != undefined){
						progressPieChart1(result.data.indInvData.total,result.data.indInvData.finishTotal);
						$(".progressPieTip .progressValue").text(result.data.indInvData.total)
						$(".progressPieTip").show();
					}else{
						$("#chart1").html("<font class=\"unPublish\">未公布</font>");
						$(".progressPieTip").hide();
					}
					
					if(result.data.innoProjectData.totalMoney != "" && result.data.innoProjectData.totalMoney != undefined && result.data.innoProjectData.finishMoney != "" && result.data.innoProjectData.finishMoney != undefined){
						progressPieChart2(result.data.innoProjectData.totalMoney,result.data.innoProjectData.finishMoney);
						$(".progressPieTip .progressValue").text(result.data.innoProjectData.totalMoney)
						$(".progressPieTip").show();
					}else{
						$("#chart1").html("<font class=\"unPublish\">未公布</font>");
						$(".progressPieTip").hide();
					}
					
					if(result.data.innoProjectData.startsPro != "" && result.data.innoProjectData.startsPro != undefined){
						var div_ = document.getElementById("gaugeChart");
						div_.removeAttribute("_echarts_instance_");
						var gaugeChart = echarts.init(div_);
						//var gaugeChart = echarts.init(document.getElementById("gaugeChart"));
						
						gaugeOption.series[0].data = [{
				            value: result.data.innoProjectData.startsPro,
				            name: '开工率',
				        }];
						gaugeChart.setOption(gaugeOption);
					}else{
						$("#gaugeChart").html("<font class=\"unPublish\">未公布</font>");
					}
					
					//
					if(result.data.majorProList != "" && result.data.majorProList != undefined){
						var div_ = document.getElementById("liquidfillChart1");
						div_.removeAttribute("_echarts_instance_");
						var liquidfillChart1 = echarts.init(div_);
						//var liquidfillChart1 = echarts.init(document.getElementById("liquidfillChart1"));
						
						$("#majorTitle1").text(result.data.majorProList[0].title);
						$("#majorProgress1>div").css("width",result.data.majorProList[0].plan+"%");
						$("#majorValue1").text(result.data.majorProList[0].plan+"%");
						$("#majorTotal1").text(result.data.majorProList[0].finishMoney+"亿元");
						
						liquidfillOption.series[0].data[0].val = result.data.majorProList[0].startsPro;
						liquidfillChart1.setOption(liquidfillOption);
						
						var div_ = document.getElementById("liquidfillChart2");
						div_.removeAttribute("_echarts_instance_");
						var liquidfillChart2 = echarts.init(div_);
						//var liquidfillChart2 = echarts.init(document.getElementById("liquidfillChart2"));
						
						$("#majorTitle2").text(result.data.majorProList[1].title);
						$("#majorProgress2>div").css("width",result.data.majorProList[1].plan+"%");
						$("#majorValue2").text(result.data.majorProList[1].plan+"%");
						$("#majorTotal2").text(result.data.majorProList[1].finishMoney+"亿元");
						
						liquidfillOption.series[0].data[0].val = result.data.majorProList[1].startsPro;
						liquidfillChart2.setOption(liquidfillOption);
						
						var div_ = document.getElementById("liquidfillChart3");
						div_.removeAttribute("_echarts_instance_");
						var liquidfillChart3 = echarts.init(div_);
						//var liquidfillChart3 = echarts.init(document.getElementById("liquidfillChart3"));
						
						$("#majorTitle3").text(result.data.majorProList[2].title);
						$("#majorProgress3>div").css("width",result.data.majorProList[2].plan+"%");
						$("#majorValue3").text(result.data.majorProList[2].plan+"%");
						$("#majorTotal3").text(result.data.majorProList[2].finishMoney+"亿元");
						
						liquidfillOption.series[0].data[0].val = result.data.majorProList[2].startsPro;
						liquidfillChart3.setOption(liquidfillOption);
					}else{
						
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	function getRealTimeData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getProEnginProjectData",
			type : "post",
			data : {
				"orgId" : "360000",
				"limit" : "10"
			},
			success : function(result) {
				console.log(result)
				if (result.success) {
					$(".projectRealDataBox").empty();
					if(result.data != "" && result.data != undefined){
						for(var j =0 ; j<4 ; j++){
							for(var i=0 ; i<result.data.length ; i++){
								var info = result.data[i];
								var _div = "";
									_div = "<div class=\"projectRealData\">";
									_div+= "	<div class=\"projectRealDataTime\">"+info.CREATE_TIME+"</div>";
									_div+= '	<div class="projectRealDataName">'+info.LOG_DETAIL.split("-param-")[0]+'</div>';
									_div+= "</div>";
								$(".projectRealDataBox").append(_div);
							}
						}
						$(".projectRealDataBar .unPublish").hide();
					}else{
						$(".projectRealDataBar .unPublish").show();
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	function progressPieChart1(total,complete){
		var labelTop = {
		    normal : {
		    	color: '#FFE42D',
		    	label : {
		        	show : false,
		        },
		        labelLine : {
		            show : false
		        }
		    }
		};
		var labelBottom = {
		    normal : {
		        color: '#3A8FFF',
		        label : {
		        	show : false,
		        },
		        labelLine : {
		            show : false
		        }
		    },
		};
		
		var series = [{name:'剩余进度',value:(total-complete).toFixed(2), itemStyle:labelBottom}, {name:'完成进度',value:complete, itemStyle:labelTop}];
		
		var div_ = document.getElementById("chart1");
		div_.removeAttribute("_echarts_instance_");
		var chart1 = echarts.init(div_);
		//var chart1 = echarts.init(document.getElementById('chart1'));
		progressPieOption.series[0].data = series;
		
		chart1.setOption(progressPieOption);
	}
	function progressPieChart2(total,complete){
		var labelTop = {
		    normal : {
		    	color: '#FFE42D',
		    	label : {
		        	show : false,
		        },
		        labelLine : {
		            show : false
		        }
		    }
		};
		var labelBottom = {
		    normal : {
		        color: '#3A8FFF',
		        label : {
		        	show : false,
		        },
		        labelLine : {
		            show : false
		        }
		    },
		};
		
		var series = [{name:'剩余进度',value:(total-complete).toFixed(2), itemStyle:labelBottom}, {name:'完成进度',value:complete, itemStyle:labelTop}];
		
		var div_ = document.getElementById("chart2");
		div_.removeAttribute("_echarts_instance_");
		var chart2 = echarts.init(div_);
		//var chart2 = echarts.init(document.getElementById('chart2'));
		progressPieOption.series[0].data = series;
		progressPieOption.series[0].radius = ['65%', '80%'];
		
		chart2.setOption(progressPieOption);
	}
	//进程环形图配置
	var progressPieOption = {
		tooltip: {
			trigger: 'item'
		},
	    legend: {
	    	show: false,
	    	data:['总投资额', '完成进度'],
	        bottom: '5%',
	        itemWidth: 10,
	        itemHeight: 10,
	        itemGap: 35,
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
	    series: [{
	        type: 'pie',
	        radius : ['55%', '70%'],
	        center: ['50%', '50%'],
	        clockwise: false,
	        startAngle: 100,
	        label: {
	        	formatter: function(params){
	        		if(params.name == "完成进度"){
	        			return "已完成\n" + params.value + "亿元" + "(" + (params.percent).toFixed(0) + "%)";
	        		}else if(params.name == "剩余进度"){
	        			return ""
	        		}else{}
	            	
	            },
	            color: '#fff',
	        },
	        labelLine: {
	        	length: 10,
	        	length2: 10,
			},
	    }] 
	}
	//仪表盘配置
	var gaugeOption = {
	    series: [{
	        type: 'gauge',
	        detail: {
	            formatter: '{value}',
	            fontSize: 30,
	            color: '#FFE42D',
	            fontFamily: 'DIN-Medium'
	        },
	        radius: '80%',
			title: {
				fontSize: 14,
				color: '#fff',
				offsetCenter : [0, '90%']
			},
			pointer: {
				length: '60%',
				width: 4
			},
	        axisLine: {
	            show: true,
	            lineStyle: {
	                width: 12,
	                shadowBlur: 0,
	                color: [
	                    [0.2, '#3A8FFF'],
	                    [0.8, '#FFB73A'],
	                    [1, '#FF342E']
	                ]
	            }
	        },
	        axisTick: {
	        	show: false
	        },
	        splitLine: {
	        	length: 12,
	        	lineStyle: { opacity: .6}
	        },
	        axisLabel: { color: '#3A8FFF'},
	        data: []
	
	    }]
	};
	//水球配置
	var liquidfillOption = {
	    series:[{
	        type: 'liquidFill',
	        data: [{
	        	value: 0.5,
	        	name: '增加值',
	        	phase: Math.PI,
	        	val: ""
	        }, 0.5],
	        color: [{
           		type: 'linear',
           	    x: 0,
           	    y: 0,
           	    x2: 0,
           	    y2: 1,
           	    colorStops: [{
           	        offset: 0, color: '#0539AA' // 0% 处的颜色
           	    }, {
           	        offset: 1, color: '#3DABFF' // 100% 处的颜色
           	    }],
           	    globalCoord: false // 缺省为 false
            },{
           		type: 'linear',
           	    x: 0,
           	    y: 0,
           	    x2: 0,
           	    y2: 1,
           	    colorStops: [{
           	        offset: 0, color: '#3DABFF' // 0% 处的颜色
           	    }, {
           	        offset: 1, color: '#0539AA' // 100% 处的颜色
           	    }],
           	    globalCoord: false // 缺省为 false
            }], //颜色
	        center: ['50%','50%'], //位置
	        outline: {  //边框
	            show: true,
	            borderDistance: 5,
	            itemStyle: {
	                color: '#051442',
	                borderColor: '#044CDE',
	                borderWidth: 3
	            }
	        },
	        phase: 0,
	        period: 3000,
	        waveLength: '100%',
	        animationDurationUpdate: 2000,
	        radius: '85%', //半径
	        backgroundStyle: {
	            color: '#051442'
	        },
	        label: {
	            color: '#f1c851',
	            insideColor: '#f1c851',
	            fontSize: 20,
            	formatter: function(params){
            		return params.data.val + "%";
            	}
	        }
	    }]
	};
</script>
</html>