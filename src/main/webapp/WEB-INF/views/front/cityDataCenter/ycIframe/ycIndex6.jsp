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
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/noData.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/organizationCountConfig.js"></script>
<style type="text/css">
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
				全市主导产业的经济指标情况 <a class="btn_set" href="javascript:void(0);" onclick="table()"> 
				<img src="${ctx}/static/image/cityDataCenter/yc/tab.png" />&nbsp;<font>报表</font></a>
			</div>
			<div class="economicData-county-content">
				<div class="economicData-pro-tab">
					<div style="width: 100%; height: 13%;" id="index" onclick="selectByIndex()">
						<div name="title" class="echarts-title1" style="margin-left: 0%;" data="zyywsr">主营业务收入</div>
						<div name="title" class="echarts-title" data="gyzjz">工业增加值</div>
						<div name="title" class="echarts-title" data="lr">利润总额</div>
						<div name="title" class="echarts-title" id="ls" data="ls" style="display: none;">利税</div>
					</div>
					<div id="tab1" name="echarts-map" class="echarts-map"></div>
					<div id="tab2" name="echarts-map" class="echarts-map1"></div>
					<div id="tab3" name="echarts-map" class="echarts-map1"></div>
					<div id="tab4" name="echarts-map" class="echarts-map1"></div>
				</div>
				<div class="economicData-pro-pieChart" >
					<span id="pieSpan">
						<font id="pieTitle"  style="color:#b0e7ff;font-size:14px;font-weight:bold;margin-top:10px;margin-left:10px;display:block;"></font>
					</span>
					<div id="pie" style="width: 100%;height: 90%"></div>
				</div>
				<div class="economicData-pro-barChart" id="bar2" style="width: calc(50% - 5px);"></div>
				<div class="economicData-pro-barChart" id="bar3" style="width: calc(50% - 5px);float:right;"></div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/cityDataCenter/index/4?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/cityDataCenter/index/1?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}">
	
</body>
<script type="text/javascript">
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
		$("div[name='title']").click(function() {
			$("div[name='title']").each(function(a, item) {
				if (item.className == 'echarts-title1') {
					item.className = 'echarts-title';
				}
			});
			$(this).removeClass('echarts-title');
			$(this).addClass('echarts-title1');
			$("div[name='title']").each(function(b, item) {
				if (item.className == 'echarts-title1') {
					$("div[name='echarts-map']").each(function(a, item) {
						if (a == b) {
							item.className = 'echarts-map';
						} else {
							item.className = 'echarts-map1';
						}
					});
				}
			});
		});
		
		loadData();
		/*页面定时跳转事件*/
		initScreenSaver();
	});
	
	/*按年份搜索*/
	function selectByYear(year) {
		$("#yearMenu").slideUp("fast");
		$("#yearText").text(year + "年");
		$("#year").val(year);
		initTitle();
		loadData();
	}

	/*按季度搜索*/
	function selectByQuarter(quarter) {
		$("#quarterMenu").slideUp("fast");
		$("#quarterText").text("第" + (quarter == 4 ? '四' : quarter == 3 ? '三' : quarter == 2 ? '二' : '一') + "季度");
		$("#quarter").val(quarter);
		loadData();
	}
	
	/*初始化标签*/
	function initTitle(){
		var year = $("#year").val();
		if(year == 2016 || year == 2015){
			$("#ls").show();
		}else{
			$("#ls").hide();
		}
	}
	
	function selectByIndex(){
		var index = "";
		$("#index div").each(function(){
			if($(this).hasClass("echarts-title1")){
				index = $(this).attr("data");
			}
		});
		var indexs = ["zyywsr", "gyzjz", "lr", "ls"];
		var sort = 0;
		for(var i=0;i<indexs.length;i++){
			if(index==indexs[i]){
				sort = i;
			}
		}
		loadBar1(econData[index].bar1, sort);
		loadBar2(econData[index].bar2, sort);
		loadPie(econData[index].pie, indexs[sort]);
	}
	
	function table(){
		window.location.href="${ctx}/front/cityDataCenter/index/7?orgId=${orgId}";
	}
	
	var econData = "";
	function loadData() {
		var orgId = $("#orgId").val();
		var year = $("#year").val();
		var quarter = $("#quarter").val();
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/yc/sixthPageData",
			type : "post",
			data : {
				"orgId" : orgId,
				"year" : year,
				"quarter" : quarter
			},
			success : function(result) {
				if (result.success) {
					econData = result.sixthPageData;
					var index = "";
					$("#index div").each(function(){
						if($(this).hasClass("echarts-title1")){
							index = $(this).attr("data");
						}
					});
					
					var indexs = ["zyywsr", "gyzjz", "lr", "ls"];
					var sort = 0;
					for(var i=0;i<indexs.length;i++){
						if(index==indexs[i]){
							sort = i;
						}
					}
					
					loadBar1(econData[index].bar1, sort);
					loadBar2(econData[index].bar2, sort);
					loadBar3(econData.compIndData);
					loadPie(econData[index].pie, indexs[sort]);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}

		})
	}
	
	/*三年总量数据对比*/
	function loadBar1(data, sort){
		var unit = ["亿元", "亿元", "亿元", "亿元"];
		var ids = ["tab1", "tab2", "tab3", "tab4"];
		var chart = echarts.init(document.getElementById(ids[sort]));
		if(!$.isEmptyObject(data.bar1Series1)
				||!$.isEmptyObject(data.bar1Series2)
				||!$.isEmptyObject(data.bar1Series3)){
			optionPart1.yAxis[0].name="总量（"+unit[sort]+"）";
			var year = $("#year").val();
			var legend = [];
			var textStyle = {color:"#FCFF00"};
			for(var i=0;i<3;i++){
				var legendIndex = {
					name:(year - i).toString(),
				    textStyle:textStyle
				};
				legend.push(legendIndex);
			}
			optionPart1.legend.data=legend;
			optionPart1.xAxis[0].data=data.xAxis;
			
			optionPart1.series[0].name=(year).toString();
			optionPart1.series[0].data=data.bar1Series1;
			optionPart1.series[1].data=data.bar1Series2;
			optionPart1.series[1].name=(year-1).toString();
			optionPart1.series[2].data=data.bar1Series3;
			optionPart1.series[2].name=(year-2).toString();
			chart.setOption(optionPart1);
		}else{
			chart.setOption(noDataOption);
		}
		
	}
	
	function loadBar2(data, sort){
		var chart = echarts.init(document.getElementById("bar2"));
		if(!$.isEmptyObject(data.bar2Series1)
				||!$.isEmptyObject(data.bar2Series2)){
			var unit = ["亿元", "亿元", "亿元", "亿元"];
			optionPart2.yAxis[0].name="总量（"+unit[sort]+"）";
			optionPart2.xAxis[0].data=data.xAxis;
			optionPart2.series[0].data=data.bar2Series1;
			optionPart2.series[1].data=data.bar2Series2;
			
			/* if(sort==1){				
				optionPart2.legend.selected={'总量':false,'同比增长':true};
			}else{
				optionPart2.legend.selected={'总量':true,'同比增长':false};
			} */
			
			var year = $("#year").val();
			if(year>=2018){
				if(sort==1){			
					optionPart2.legend.data=[
						{name:'同比增长',textStyle:{color:"#FCFF00"}},
					];
					optionPart2.legend.selected={'同比增长':true};
					optionPart2.yAxis[0].name="";
				}else{
					optionPart2.legend.data=[
						{name:'总量',textStyle:{color:"#FCFF00"}},
						{name:'同比增长',textStyle:{color:"#FCFF00"}}
					];
					optionPart2.legend.selected={'总量':true,'同比增长':false};
					optionPart2.yAxis[0].name="总量";
				}
			}
			var quarter = $("#quarter").val();
			var valueName = "";
			switch(sort){
				case 0:
					valueName = "主营";
					break;
				case 1:
					valueName = "工业增加值";
					break;
				case 2:
					valueName = "利润";
					break;
				case 3:
					valueName = "利税";
					break;
			}
			optionPart2.title.text=year+"年"+quarter+"季度各产业"+valueName+"总量及同比增幅（单位：亿元）";
			chart.setOption(optionPart2);
		}else{
			chart.setOption(noDataOption);
		}
	}
	
	function loadBar3(compIndData) {
		var chart = echarts.init(document.getElementById('bar3'));
		if(!$.isEmptyObject(compIndData)){
			//园区折线图
			lineOption.title.text = "宜春市企业所属产业分布情况（单位：个）";
			lineOption.xAxis[0].data = compIndData.xAxis;
			lineOption.xAxis[0].boundaryGap = true;
			var series = [
				{
				//	name : parkLineName[0],
					type : "bar",
					barWidth : '35%',
					lineStyle : lineStyle[0],
					data : compIndData.series,
					markPoint : markPoint[0]
				}
			];
			lineOption.series = series;
			chart.setOption(lineOption);
		}else{
			chart.setOption(noDataOption);
		}
	}
	
	function loadPie(data, value){
		var pieChart = pieChart = echarts.init(document.getElementById('pie'));
		if(!$.isEmptyObject(data.pieSeries)){
			var pieOpion = {
					title: {
						show : true,
						text : '',
						x: '41%',
				        y: '50%',
				        textAlign: "center",
						textStyle : {
							color : '#b0e7ff',
							fontWeight: 'normal',
							fontSize : 18
						},
						subtext : '总量',
						subtextStyle : {
							color : '#b0e7ff',
							fontSize : 16
						}
				    },
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
				        x:'right',
				        orient: 'vertical',
				        padding:[10,10],
				        itemWidth:20,
				        itemHeight:10,
				        data:data.legend,
				        textStyle:{color:'#FFF'}
				    },
			//	    color:['#CD0567','#FCFF00','#799C0E','#11729D'], 
					color:['#01c5ff','#ce0867','#feff02','#ff7f50','#5cc600',
	                     '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
	                    ],
				    series: [
				    	{
				    		type:'pie',
						    center:['42%','54%'],
						    radius:['50%', '70%'],
						    data:data.pieSeries
				   		}
				    ]
			};
			var year = $("#year").val();
			var quarter = $("#quarter").val();
			var valueName = "";
			switch(value){
				case "zyywsr":
					valueName = "主营";
					break;
				case "gyzjz":
					valueName = "工业增加值";
					break;
				case "lr":
					valueName = "利润";
					break;
				case "ls":
					valueName = "利税";
					break;
			}
			$("#pieSpan").show();
			$("#pieTitle").text(year+"年"+quarter+"季度各产业"+valueName+"总量及占比（单位：亿元）");
			
			var total = 0;
			for(var i=0;i<data.pieSeries.length;i++){
				if(data.pieSeries[i].value!=null&&data.pieSeries[i].value!=""){
					total += Number(data.pieSeries[i].value);
				}
			}
			pieOpion.title.text=total;
			pieChart.setOption(pieOpion);
		}else{
			$("#pieSpan").hide();
			var option = {
				backgroundColor: "#082F56", 
				title: {
			        text: "2017年3季度各产业工业增加值增幅",
			        left: "center",
			        top: "5%",
			        textStyle: {
			            color: "#b0e7ff",
						fontSize:16
			        }
			    },
				tooltip: {
			        trigger: "item",
			        formatter: "{b}: {c}%"
				},
				grid: {
			    	bottom:"15%",
			        containLabel: true
			    },
			    legend: {
			        icon: "circle",
			        left:"8%",
			        right:"8%",
			        top:"18%",
			        textStyle: {
			            color: "#fff"
			        },
			        data: []
			    },
			    series: [{
			        type: "pie",
			        radius: [27, 155],
			        avoidLabelOverlap: false,
			        startAngle: 0,
			        center: ["50%", "40%"],
			        roseType: "area",
			        selectedMode: "single",
			        label: {
			            normal: {
			                show: true,
			                formatter: "{c}%"
			            },
			            emphasis: {
			                show: true
			            }
			        },
			        labelLine: {
			            normal: {
			                show: true,
			                smooth: false,
			                length: 10,
			                length2: 5
			            },
			            emphasis: {
			                show: true
			            }
			        },
			        data: []
			    }]
			};
			
			var orgId = $("#orgId").val();
			var year = $("#year").val();
			var quarter = $("#quarter").val();
			$.ajax({
				url:"${ctx}/interface/json/cityDataCenter/yc/percentData",
				type:"post",
				data:{"orgId":orgId,"year":year,"quarter":quarter,"value":value+"_percent"},
				success:function(result){
					var list = result.percentData;
					if(result.success&&list!=null&&list!=""){
						var legend = [];
						var series = [];
						var colorIndex = ["#f845f1","#ad46f3","#5045f6","#4777f5","#44aff0",
							"#45dbf7","#4fc218","#f69846","#ff4343","#f6d54a"];
						for(var i=0;i<list.length;i++){
							legend.push(list[i].name);
							var data = {
				                value: list[i].value,
				                name: list[i].name,
				                itemStyle: {
				                    normal: {
				                        color: colorIndex[i]
				                    }
				                }
			                };
			                series.push(data);
						}
						for(var i=0;i<list.length;i++){
							var data = {
				                value: 0,
				                name: "",
				                itemStyle: {
				                    normal: {
				                        label: {
				                            show: false
				                        },
				                        labelLine: {
				                            show: false
				                        }
				                    }
				                }
				            };
							series.push(data);
						}
						var valueName = "";
						switch(value){
							case "zyywsr":
								valueName = "主营业务收入";
								break;
							case "gyzjz":
								valueName = "工业增加值";
								break;
							case "lr":
								valueName = "利润";
								break;
							case "ls":
								valueName = "利税";
								break;
						}
						option.title.text=year+"年"+quarter+"季度"+valueName+"增幅";
						option.legend.data=legend;
						option.series[0].data=series;
						pieChart.setOption(option);
					}else{
						pieChart.setOption(noDataOption);
					}
				},
				error:function(){
					pieChart.setOption(noDataOption);
				}
			})
			
		}
	}
	/*折线图配置*/
	var lineOption = {
		backgroundColor : '#082F56',
		title : {
			text : '',
			textStyle : {
				color : "#b0e7ff",
				fontSize : 14,
			},
			left : 5,
			top : 5
		},
		tooltip : {
			trigger : 'axis',
			formatter: "{b}: {c}"
		},
		legend : {},
		grid : {
			bottom : '10%',
			left : '3%',
			right : '6%',
			containLabel : true,
		},
		xAxis : [ {
			type : 'category',
			boundaryGap : false,
			data : [],
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
			type : 'value',
			axisLabel : {
				formatter : '{value}'
			},
			axisLine : {
				lineStyle : {
					color : "#5EC9F4"
				}
			},
			splitLine : {
				lineStyle : {
					opacity : 0.2
				}
			}
		} ],
		series : []
	};
	var optionPart1 = {
			backgroundColor: '#082F56', 
			title : {
				text : '',
				textStyle : {
					color : "#b0e7ff",
					fontSize : 14,
				},
				left : 5,
				top : 5
			},
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:'5%',
		    	selected:{'2017':true,'2016':false,'2015':false},
		        data:[
					{name:'2017',textStyle:{color:"#FCFF00"}},
					{name:'2016',textStyle:{color:"#FCFF00"}},
					{name:'2015',textStyle:{color:"#FCFF00"}}
				]
		    },
		    grid: {
		    	bottom:'10%',
		    	width:'90%',
		    	left:'5%',
		    	rigth:'5%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ['有色金属','新型建材','食品医药','智能装备','其他'],
		        	axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	axisLabel :{  
		        	    interval:0,
		        	    rotate:20
		        	} 
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {
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
		    series : [
		        {
		            name:'2017',
		            type:'bar',
		            barWidth:'20%',
		            markPoint : {
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
		                }
		            },
		            itemStyle: {
		            	normal: {
		            		color: '#01c5ff'
		            	}
		            }
		        
		        },
		        {
		            name:'2016',
		            type:'bar',
		            barWidth:'20%',
		            itemStyle: {
		            	normal: {
		            		color: '#ce0867'
		            	}
		            },
		            markPoint : {
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
		                }
		            }
		        },
		        {
		            name:'2015',
		            type:'bar',
		            barWidth:'20%',
		            itemStyle: {
		            	normal: {
		            		color: '#d7504b'
		            	}
		            },
		            markPoint : {
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
		                }
		            }
		        }
		    ]
		};
	var optionPart2 = {
			backgroundColor: '#082F56', 
			title : {
				text : '',
				textStyle : {
					color : "#b0e7ff",
					fontSize : 14,
				},
				left : 5,
				top : 5
			},
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:'12%',
		    	x:'center',
				itemWidth:25,
				itemHeight:12,
				selected:{'总量':true,'同比增长':false},
		        data:[
					{name:'总量',textStyle:{color:"#FCFF00"}},
					{name:'同比增长',textStyle:{color:"#FCFF00"}},
				]
		    },
		    grid: {
		    	top:'25%',
		    	bottom:'10%',
		    	left:'5%',
		    	width:'90%',
		    	rigth:'1%',
		        containLabel: true,
		    },
		    xAxis: [
		        {
		            type: 'category',
		            data: ['1-3月','1-6月','1-9月','1-12月'],
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	axisLabel :{  
		        	    interval:0,
		        	    rotate:20
		        	} 
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            name: '总量',
		            nameTextStyle:{
		            	color: '#5EC9F4'
		            },
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
		            name: '同比增长',
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
		        }
		    ],
		    series: [
		        {
		            name:'总量',
		            type:'bar',
		            data:[0,0,0,0],
		            barWidth:'25%',
		            markPoint : {
		            	symbolSize : 35,
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
		            itemStyle:{
		            	normal:{
		            		color:'#5cc600'
		            	}
		            }
		        },
		        {
		            name:'同比增长',
		            type:'bar',
		            barWidth:'25%',
		            yAxisIndex:1,
		            data:[0,0,0,0],
		            markPoint : {
		            	symbolSize : 35,
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
		            itemStyle:{
		            	normal:{
		            		color:'#FF7F50'
		            	}
		            }
		        }
		    ]
	};
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
</script>
</html>
