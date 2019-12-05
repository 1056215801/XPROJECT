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
 })
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
<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/dataCenter/organizationCount?orgId=${orgId}">
<div class="data_main">
	<div class="data_header">
		<img src="${ctx}/static/image/dataCenter/head2.png" width="100%" style="">
		<img src="${ctx}/static/image/dataCenter/LOGO2_FGW.png" width="35%" class="data_logo" style="">
	</div>
	<div class="data_content">
		<div style="margin-bottom:0.5%; text-align:right;">
			<button id="btnYear" class="dropdownButton" type="button" style="margin-right:110px;">${year}年 <span class="caret"></span></button>
			<ul id="yearMenu" class="dropdownMenu">
			    <li><a href="javascript:;" onclick="selectByTime('2017')">2017年</a></li>
				<li><a href="javascript:;" onclick="selectByTime('2016')">2016年</a></li>
				<li><a href="javascript:;" onclick="selectByTime('2015')">2015年</a></li>
				<li><a href="javascript:;" onclick="selectByTime('2014')">2014年</a></li>
			</ul>
		</div>
			
		<div class="data_contentLeft" style="width:30%;height:90%" >
			<div style="color:#b0e7ff; top: 7px; text-align:center; font-size: 16px; font-weight: bold;">开发区重点用能企业能耗监测</div>
			<div style="width:100%;height:95%;float: left;" id="map"></div>
		</div>
		<div style="position: absolute; left:19%; bottom:5%; z-index: 100;" >
			<div id="part6" style="width: 150px;height: 150px;"></div>
		</div>
		<div class="data_contentRight" style="width:70%;">
			<div class="clearfix" style="height:8.2%; margin-bottom:1%;">
				<div class="dataBarGreen" style="width:32.9%;">
					<div style="display:table-cell;vertical-align: middle;">纳入监管企业&nbsp;&nbsp;<font class="yellowFont24">${energyData.totalData[0]}</font>&nbsp;&nbsp;户</div>
				</div>
				<div class="dataBarMagenta" style="width:32.9%;">
					<div style="display:table-cell;vertical-align: middle;">能耗消耗五千吨以上&nbsp;&nbsp;<font class="yellowFont24">${energyData.totalData[1]}</font>&nbsp;&nbsp;户</div>
				</div>
				<div class="dataBarNavy" style="width:33%; margin-right: 0;">
					<div style="display:table-cell;vertical-align: middle;">能耗消耗十万吨以上&nbsp;&nbsp;<font class="yellowFont24">${energyData.totalData[2]}</font>&nbsp;&nbsp;户</div>
				</div>
			</div>
			<div style="height:89.8%;">
				<div class="dataBar_4">
					<div class="dataBar_4_Left">
						<div style="color:#b0e7ff; position: absolute; top: 7px; left: 10px; font-size: 13px; font-weight: bold;">规模以上工业能源消费（单位：万吨标准煤）</div>
						<div id="part1" style="width:20%;height:70%;float: left;margin-top: 3%;"></div>
						<div id="part2" style="width:80%;height:96%;float: left;" ></div>
						<div class="dataBar_statisticsLeft">
							<div>
								<span>总量</span>
								<span>${energyData.waterPoloTextData[0]}</span>
							</div>
							<div>
								<img src="${ctx}/static/image/dataCenter/up_green.png" width="20">
								<span class="greenFont">${energyData.waterPoloTextData[1]}%</span>
							</div>
						</div>
					</div>
					<div class="daraBar_4_Right">
						<div style="color:#b0e7ff; position: absolute; top: 7px; left: 10px; font-size: 13px; font-weight: bold;">年耗能10万吨以上企业综合能源消费量<br/>（单位：万吨标准煤）</div>
						<div id="part3" style="width:63.1%;height:80%;margin-top: 15%;"></div>
						<div class="dataBar_statisticsRight">
							<div>总量</div>
							<div>${energyData.waterPoloTextData[2]}</div>
							<div>
								<img src="${ctx}/static/image/dataCenter/up_blue.png" width="20">
								<span class="blueFont">${energyData.waterPoloTextData[3]}%</span>
							</div>
						</div>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="dataBar_4">
					<div class="dataBar_4_Left">
						<div style="color:#b0e7ff; position: absolute; top: 7px; left: 10px; font-size: 13px; font-weight: bold;">六大高耗能行业综合能源消耗量（单位：万吨标准煤）</div>
						<div id="part4" style="width:20%;height:70%;float: left;margin-top: 3%;"></div>
						<div id="part5" style="width:80%;height:96%;float: left;"></div>
						<div class="dataBar_statisticsLeft">
							<div>
								<span>总量</span>
								<span>${energyData.waterPoloTextData[4]}</span>
							</div>
							<div>
								<img src="${ctx}/static/image/dataCenter/up_magenta.png" width="20">
								<span class="magentaFont">${energyData.waterPoloTextData[5]}%</span>
							</div>
						</div>
					</div>
					<div class="daraBar_4_Right" >
						<div style="margin:15px auto 15px; text-align:center; color:#b0e7ff;">${energyData.list.comment}</div>
						<table>
							<tr>
								<td style="padding-left:20px;">
									<div class="whiteSpots"></div>
									<span>${energyData.list.listData[0]}</span>
								</td>
								<td style="color:red; text-align: right; padding-right:20px; font-size: 16px;">${energyData.list.listData[1]}</td>
							</tr>
							<tr>
								<td style="padding-left:20px;">
									<div class="whiteSpots"></div>
									<span>${energyData.list.listData[2]}</span>
								</td>
								<td style="color:red; text-align: right; padding-right:20px; font-size: 16px;">${energyData.list.listData[3]}</td>
							</tr>
							<tr>
								<td style="padding-left:20px;">
									<div class="whiteSpots"></div>
									<span>${energyData.list.listData[4]}</span>
								</td>
								<td style="color:red; text-align: right; padding-right:20px; font-size: 16px;">${energyData.list.listData[5]}</td>
							</tr>
						</table>	
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div class="tecSup">技术支持：江西融合科技有限责任公司</div>
</div>
<div class="btn_prev" onclick="window.location.href='${ctx}/front/dataCenter/industryCount?orgId=${orgId}'"></div>
<div class="btn_next" onclick="window.location.href='${ctx}/front/dataCenter/organizationCount?orgId=${orgId}'"></div>
</body>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts-liquidfill.min.js"></script>
<script type="text/javascript">
 
	var myChart1 = echarts.init(document.getElementById('part1'));
	var optionPart1 = {
			series: [{
		        type: 'liquidFill',
		        data: [0.6, 0.5, 0.4, 0.3],
		        color: ['#379257', '#2AA940', '#4AC23D', '#B5E087'], //颜色
		        center: ['65%', '55%'], //位置
		        outline: {  //边框
		            show: true,
		            borderDistance: 1,
		            itemStyle: {
		                color: '#FFF',
		                borderColor: '#FFF',
		                borderWidth: 1
		            }
		        },
		        radius: '70%', //半径
		        backgroundStyle: {
		            color: '#0E5876'
		        },
		        label: {
		            normal: {
		            	formatter: '',
		                textStyle: {
		                    color: '#fff',
		                    insideColor: 'yellow',
		                    fontSize: 20
		                }
		            }
		        }
		    }]
	};
	
	myChart1.setOption(optionPart1);
	
	var myChart2 = echarts.init(document.getElementById('part2'));
	var optionPart2 = {
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:5,
				right:'2%',
		        data:${energyData.bar1.legend}
		    },
		    grid: {
		    	bottom:'7%',
		    	top:'25%',
		    	width:'90%',
		    	left:'5%',
		        containLabel: true,
		    },
		    xAxis: [
		        {
		            type: 'category',
		            data: ${energyData.bar1.xAxis},
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
		    yAxis: [
		        {
		            type: 'value',
		            name: '总量',
		            axisLabel: {
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
		        },
		        {
		            type: 'value',
		            name: '增速',
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
		            name:'综合能耗',
		            type:'bar',
		            data:${energyData.bar1.series0},
		            barWidth:'40%',
		            markPoint : {
		            	symbolSize:35,
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
			            		color:"#5EC9F4"
			            	},
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            },
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#5EC9F4'
		            	}
		            }
		        },
		        {
		            name:'同比',
		            type:'line',
		            yAxisIndex: 1,
		            data:${energyData.bar1.series1},
		            markPoint : {
		            	symbolSize : 35,
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ],
		                label:{
		            		normal:{
		            			textStyle:{
			            			color:"#fff"
		            			}
		            		}
		            	},
		            	itemStyle:{
		            		normal:{
		            			color:"#799C0E"
		            		}
		            	}
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ],
		                lineStyle:{
			            	normal:{
			            		color:"#799C0E"
			            	},
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            },
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#799C0E'
		            	}
		            }
		        }
		    ]
	};
	
	myChart2.setOption(optionPart2);
</script>
<script type="text/javascript">
	var myChart3 = echarts.init(document.getElementById('part3'));
	var optionPart3 = {
			series: [{
		        type: 'liquidFill',
		        data: [0.6, 0.5, 0.4, 0.3],
		        color: ['#366792', '#2883A6', '#3EC0C1', '#86E2BA'], //颜色
		        center: ['55%', '50%'], //位置
		        outline: {  //边框
		            show: true,
		            borderDistance: 1,
		            itemStyle: {
		                color: '#FFF',
		                borderColor: '#FFF',
		                borderWidth: 1
		            }
		        },
		        radius: '60%', //半径
		        backgroundStyle: {
		            color: '#08294B'
		        },
		        label: {
		            normal: {
		            	formatter: '',
		                textStyle: {
		                    color: '#fff',
		                    insideColor: 'yellow',
		                    fontSize: 20
		                }
		            }
		        }
		    }]
	};	
	
	myChart3.setOption(optionPart3);
</script>
<script type="text/javascript">
	var myChart4 = echarts.init(document.getElementById('part4'));
	var optionPart4 = {
			series: [{
		        type: 'liquidFill',
		        data: [0.6, 0.5, 0.4, 0.3],
		        color: ['#903A6B', '#A52D89', '#B842BD', '#B68BDD'], //颜色
		        center: ['65%', '55%'], //位置
		        outline: {  //边框
		            show: true,
		            borderDistance: 1,
		            itemStyle: {
		                color: '#FFF',
		                borderColor: '#FFF',
		                borderWidth: 1
		            }
		        },
		        radius: '70%', //半径
		        backgroundStyle: {
		            color: '#0A3F62'
		        },
		        label: {
		            normal: {
			        	formatter: '',
		                textStyle: {
		                    color: '#fff',
		                    insideColor: 'yellow',
		                    fontSize: 20
		                }
		            }
		        }
		    }]
	};	

	myChart4.setOption(optionPart4);
	
	var myChart5 = echarts.init(document.getElementById('part5'));
	var optionPart5 = {
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:5,
				right:'2%',
		        data:${energyData.bar2.legend}
		    },
		    grid: {
		    	bottom:'7%',
		    	top:'25%',
		    	width:'90%',
		    	left:'5%',
		        containLabel: true,
		    },
		    xAxis: [
		        {
		            type: 'category',
		            data: ${energyData.bar2.xAxis},
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	axisLabel :{ 
		        		formatter : function(params){
                            var newParamsName = "";
                            var paramsNameNumber = params.length;
                            var provideNumber = 4;
                            var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
                            if (paramsNameNumber > provideNumber) {
                                for (var p = 0; p < rowNumber; p++) {
                                    var tempStr = "";
                                    var start = p * provideNumber;
                                    var end = start + provideNumber;
                                    if (p == rowNumber - 1) {
                                        tempStr = params.substring(start, paramsNameNumber);
                                    } else {
                                        tempStr = params.substring(start, end) + "\n";
                                    }
                                    newParamsName += tempStr;
                                }

                            } else {
                                newParamsName = params;
                            }
                            return newParamsName
                        },
                        fontSize:12,
		        	    interval:0,
		        	    rotate:35
		        	}
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            name: '总量',
		            axisLabel: {
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
		        },
		        {
		            type: 'value',
		            name: '增速',
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
		            name:'综合能耗',
		            type:'bar',
		            data:${energyData.bar2.series0},
		            barWidth:'25%',
		            markPoint : {
		            	symbolSize:35,
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
			            		color:"#5EC9F4"
			            	},
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            },
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#CE0867'
		            	}
		            }
		        },
		        {
		            name:'同比',
		            type:'line',
		            yAxisIndex: 1,
		            data:${energyData.bar2.series1},
		            markPoint : {
		            	symbolSize : 35,
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ],
		                label:{
		            		normal:{
		            			textStyle:{
			            			color:"#fff"
		            			}
		            		}
		            	},
		            	itemStyle:{
		            		normal:{
		            			color:"#799C0E"
		            		}
		            	}
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ],
		                lineStyle:{
			            	normal:{
			            		color:"#799C0E"
			            	},
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            },
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#FCFF00'
		            	}
		            }
		        }
		    ]
	};

	myChart5.setOption(optionPart5);

</script>
<script type="text/javascript">
//	var myChart6 = echarts.init(document.getElementById('part6'));
/* 	var optionPart6 = {
		title:{
			text:'在线率\n${energyData[14]}',
			textStyle:{
				color:'#FFC401',
				fontSize:14,
				label:{
					 position : 'center'
				}
			},
			x: 'center',
            y: 'center'
		},
	    tooltip: {
	        trigger: 'item',
	        formatter: "{b}: {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        data:['在线','不在线'],
	        show:false
	    },
	    color:['#FCFF00','#00A2FF'] , 
	    series: [
	        {	
			    center:['50%','50%'],
	            type:'pie',
	            radius: ['50%', '70%'],
	            label:{
	            	normal:{
	            		show:false
	            	},
	            	emphasis:{
	            		show:false
	            	}
	            },
	            labelLine:{
	            	normal:{
	            		show:false
	            	},
	            	emphasis:{
	            		show:false
	            	}
	            },
	            data:${energyData[13]}
	        }
	    ]
	}; */
	
//	myChart6.setOption(optionPart6);
</script>
<script type="text/javascript" src="${ctx}/static/plugins/echarts/src/esl.js"></script>
<script type="text/javascript">
var geoCoordMap = {
    	'南昌市': [115.854754,28.707192],
        '景德镇市': [117.17936,29.28948],
        '萍乡市': [113.826452,27.696667],
        '九江市': [116.068359,29.614163],
        '新余市': [114.893496,27.893005],
        '鹰潭市': [117.027582,28.317168],
        '赣州市': [114.93029,25.863818],
        '吉安市': [114.967085,27.154901],
        '抚州市': [116.537102,27.634297],
        '上饶市': [117.910652,28.528612],
        '宜春市': [114.819434,28.413542]
    };

var myChart;
/* 
 * 按需加载 
 * 引入echart.js依赖的zrender.js, 再引入echart.js 
 */  
 require.config({  
     packages: [  
         {  
             name: 'zrender',  
             location: '${ctx}/static/plugins/zrender/src', // zrender与echarts在同一级目录  
             main: 'zrender'  
         },  
         {  
             name: 'echarts',  
             location: '${ctx}/static/plugins/echarts/src',  
             main: 'echarts'  
         }  
     ]  
 }); 

/* 
 *按需加载 
 */  
 require(  
      [  
         'echarts',  	
         'echarts/chart/map'  
     ], 
     //渲染ECharts图表  
     function DrawEChart(ec) {
    	  myChart = ec.init(document.getElementById('map'));
		  myChart.setOption(optionMap);
     }
);

 var optionMap = {
		    /* title : {
		        text: '工业园区重点用能企业能耗监测',
		        x:'center',
		        textStyle : {
		            color: '#fff'
		        }
		    }, */
		    tooltip : {
		        trigger: 'item',
		        formatter: '{b}'
		    },
		    color: ['#ff3333', 'orange', 'yellow','lime','aqua'],
		    /* dataRange: {
		        min : 0,
		        max : 100,
		        calculable : true,
		        color: ['#ff3333', 'orange', 'yellow','lime','aqua'],
		        textStyle:{
		            color:'#fff'
		        }
		    },  */
		    series : [
		        {
		            name: '江西省',
		            type: 'map',
	                mapType:'江西',
	                roam : false,
		            /* itemStyle:{
		                normal:{
		                    borderColor:'rgba(100,149,237,1)',
		                    borderWidth:0.5,
		                    areaStyle:{
		                        color: '#1b1b1b'
		                    }
		                }
		            }, */
		            itemStyle: {
	                    normal: {
	                     	color: '#082F56',
	                        borderColor: 'rgba(100,149,237,1)',
	                        label:{
	                        	show:true,
	                        	textStyle:{
	                        		color:'#fff'
	                        	}
	                        }
	                    },
	                    emphasis: {
	                    	areaColor: '#A6C5BD',
	                    	borderColor: '#FFF',
	                        opacity:1,
	                        label:{
	                        	show:true,
	                        	textStyle:{
	                        		color:'#fff'
	                        	}
	                        }
	                    }
	                },
		            data:[],
		            markLine : {
		                smooth:true,
		                symbol: ['none', 'circle'],  
		                symbolSize : 1,
		                itemStyle : {
		                    normal: {
		                        color:'#fff',
		                        borderWidth:1,
		                        borderColor:'rgba(30,144,255,0.5)'
		                    }
		                },
		                data : [
		                    [{name:'南昌市'},{name:'景德镇市'}],
		                    [{name:'南昌市'},{name:'萍乡市'}],
		                    [{name:'南昌市'},{name:'九江市'}],
		                    [{name:'南昌市'},{name:'新余市'}],
		                    [{name:'南昌市'},{name:'鹰潭市'}],
		                    [{name:'南昌市'},{name:'赣州市'}],
		                    [{name:'南昌市'},{name:'吉安市'}],
		                    [{name:'南昌市'},{name:'抚州市'}],
		                    [{name:'南昌市'},{name:'上饶市'}],
		                    [{name:'南昌市'},{name:'宜春市'}],
		                ],
		            },
		            geoCoord: geoCoordMap
		        },
		        {
		        	type: 'map',
	                mapType:'江西',
	                roam : false,
		            data:[],
		            markLine : {
		                smooth:true,
		                effect : {
		                    show: true,
		                    scaleSize: 1,
		                    period: 30,
		                    color: '#fff',
		                    shadowBlur: 10
		                },
		                itemStyle : {
		                    normal: {
		                    	label:{show:false},
		                        borderWidth:1,
		                        lineStyle: {
		                            type: 'solid',
		                            shadowBlur: 10
		                        }
		                    }
		                },
		                data : [
		                    [{name:'南昌市'}, {name:'景德镇市',value:50}],
		                    [{name:'南昌市'}, {name:'萍乡市',value:35}],
		                    [{name:'南昌市'}, {name:'九江市',value:85}],
		                    [{name:'南昌市'}, {name:'新余市',value:35}],
		                    [{name:'南昌市'}, {name:'鹰潭市',value:40}],
		                    [{name:'南昌市'}, {name:'赣州市',value:90}],
		                    [{name:'南昌市'}, {name:'吉安市',value:80}],
		                    [{name:'南昌市'}, {name:'抚州市',value:70}],
		                    [{name:'南昌市'}, {name:'上饶市',value:75}],
		                    [{name:'南昌市'}, {name:'宜春市',value:75}]
		                ]
		            },
		            markPoint : {
		                symbol:'emptyCircle',
		                symbolSize : function (v){
		                    return 5 + v/15
		                },
		                effect : {
		                    show: true,
		                    shadowBlur : 0
		                },
		                itemStyle:{
		                    normal:{
		                        label:{show:false}
		                    },
		                    emphasis: {
		                        label:{show:false,position:'top'}
		                    }
		                },
		                data : [
		                    {name:'景德镇市',value:50},
		                    {name:'萍乡市',value:35},
		                    {name:'九江市',value:85},
		                    {name:'新余市',value:35},
		                    {name:'鹰潭市',value:40},
		                    {name:'赣州市',value:90},
		                    {name:'吉安市',value:80},
		                    {name:'抚州市',value:70},
		                    {name:'上饶市',value:75},
		                    {name:'宜春市',value:75}
		                ]
		            }
		        }
		    ]			                   	
	};

</script>
<script type="text/javascript">
	
	function selectByTime(year){
		window.location.href="${ctx}/front/dataCenter/energyCount?orgId=${orgId}&year="+year;
	}
	
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
		
		/*页面定时跳转事件*/
		initScreenSaver();
		
	});
	
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	    	var isProvince ='${areaInfo.isProvince}';
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/dataCenter/industryCount?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/dataCenter/organizationCount?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/dataCenter/industryCount?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/dataCenter/organizationCount?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
	
</script>
</html>