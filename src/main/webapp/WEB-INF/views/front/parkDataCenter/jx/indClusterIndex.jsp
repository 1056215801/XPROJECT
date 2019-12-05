<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>进贤-产业集群指标</title>
<link href="${ctx}/static/css/parkDataCenter/yy_bigDataCenter.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/plugins/iCheck/custom.css" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<style>
.data_header {
    height: 80px;
    text-align: center;
    padding-bottom: 18.5px;
    padding-top: 18.5px;
}
.local-date {
    padding: 0 10px;
    display: inline-block;
    vertical-align: middle;
    border-left: 1px solid;
    font-size: 14px;
    color: #75d5ff;
    line-height: 1;
    font-family: "黑体";
}
.local-date h1 {
    font-size: 24px;
}
.local-date p {
    line-height: 1.5;
}
i {
    display: inline-block;
    height: 100%;
    vertical-align: middle;
}
.map-title{
	padding-left: 20px;
	padding-top: 20px;
	color: #198DC0;
}
.map-infos{
	width: 100%;
	margin: 20px auto;
}
.map-info{
	float: left;
	width: 20%;
	height: 62px;
	border-left: 2px solid #0E567D;
}
.map-info:nth-child(1){
	margin-left: 20px;
	margin-right:14%;
}
.map-info:nth-child(2){
	margin-right:14%;
}
.map-info p{
	position:relative;
	margin-left: 15px;
	font-size: 16px;
}

.map-info p span:nth-child(2){
	position: absolute;
    bottom: 8px;
}
.num{
	font-size: 30px;
}
</style>
</head>
<body>
	<div class="data_main">
		<form action="" method="post" id="form">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
			<input type="hidden" id="orgId" name="orgId" value="${orgId}"/> 
			<input type="hidden" id="year" name="year" value="${year}" />
		</form>
		<input type="hidden" id="oldYear" value="${year}"/>
		<div class="data_header">
			<!-- <div style=""> -->
				<img src="${configInfo.imageUrl}" height="42px">
			<!-- </div> -->
			<div class="local-date">
				<p>2017年7月20号</p>
				<h1>14:20:50</h1>
			</div>
			<!-- <div style="color: #6DCCF6;border-left: 1px solid #6DCCF6;margin-top: 8px;padding-left: 15px;height: 60px;" id="dateBar" class="dateBar"></div> -->
			<div style="position: absolute;right: 2%;margin-right: 2%;margin-top: 2%;">
				<button id="btnYear" class="dropdownButton" type="button"><span id="yearText">${year}年</span><span class="caret"></span></button>
				<ul id="yearMenu" class="dropdownMenu">
					<c:if test="${year>=2018}">
						<c:forEach varStatus="k" begin="2018" end ="${year}">
							<li><a href="javascript:;" onclick="selectByYear('${k.index}')">${k.index}年</a></li>
						</c:forEach>
					</c:if>
				    <li><a href="javascript:;" onclick="selectByYear('2017')">2017年</a></li>
					<li><a href="javascript:;" onclick="selectByYear('2016')">2016年</a></li>
					<li><a href="javascript:;" onclick="selectByYear('2015')">2015年</a></li>
				</ul>
			</div>
		</div>
		
		<div class="data_content clearfix" style="height: calc(100% - 80px)">
			<div style="width: 100%; height: 50px;line-height: 50px;float: left;color:;" id="indexCheckBox">
				<div style="background-color: #AFE7FE;width: 3px;height: 20px;float: left;margin-top: 15px;"></div>
				<span style="float: left; margin-left: 10px; font-size: 22px; color: #AFE7FE;">产业集群指标</span>
			</div>
			<div style="width: 100%;height: calc(100% - 50px);float: left;">
				<div style="width: 70%;height: 100%;float: left;">
					<div class="clearfix" style="height:22%; margin-bottom:1%;" id="industryChoice">
						<div id="yl" class="dataBarMagenta3 on" style="display: block; cursor: pointer;">
							<i></i>
							<img src="${ctx}/static/image/medicine.png" height="30">
							<span style="margin-left: 5px; font-size: 16px;">医疗器械产业集群</span>
						</div>
						<div id="gc" class="dataBarNavy3" style="display: block; cursor: pointer;">
							<i></i>
							<img src="${ctx}/static/image/steel.png" height="30">
							<span style="margin-left: 5px; font-size: 16px;">钢结构产业集群</span>
						</div>
					</div>
					
					<div style="height:76%;">
						<div class="dataBar_1">
							<div class="dataBar_1_Left" id="part1" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;" ></div>
							<div class="daraBar_1_Right" id="part2" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
							<div style="clear:both;"></div>
						</div>
						<div class="dataBar_1" style="margin-bottom: 0;">
							<div class="dataBar_1_Left" id="part3" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
							<div class="daraBar_1_Right" id="part4" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
							<div style="clear:both;"></div>
						</div>
					</div>
				</div>
				<div style="width: 30%;height: 100%;float: left;">
					<div class="data_contentLeft" style="width: 98%;height: 100%;margin-left: 2%;">
						<div class="map-wrap" style="background-color: rgba(0, 0, 0, 0.3); width: 100%; height: 100%;">
							<h1 class="map-title">产业集群</h1>
							<div class="map-infos">
								<div class="map-info">
									<p>全省</p>
									<p><span class="num">77</span><span>个</span></p>
								</div>
								<div class="map-info">
									<p>全市</p>
									<p><span class="num">12</span><span>个</span></p>
								</div>
								<div class="map-info">
									<p>进贤</p>
									<p><span class="num">2</span><span>个</span></p>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="map" id="map" style="width: 90%; height:80%; margin:0 auto;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="btn_prev" onclick="window.location.href='${ctx}/front/parkDataCenter/pkEconIndicators?orgId=${orgId}'"></div>
		<div class="btn_next" onclick="window.location.href='${ctx}${configInfo.indexUrl}'"></div>
	</div>
</body>
<script>
$(function(){
	setTime();
	setInterval(setTime,1000)
	$("#btnYear").click(function(){		
   		var div = $("#yearMenu"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
   });
})
function setTime(){
	var date = new Date();
	var localDate = date.getFullYear() + "年" + (date.getMonth()+1) + "月" + date.getDate() + "日";
	var localSec = date.getSeconds();
	if(localSec<10) { localSec = "0"+localSec} else{ localSec = date.getSeconds()};
	var localTime = date.getHours() + ":" + date.getMinutes() + ':' + localSec;
	$(".local-date p").text(localDate);
	$(".local-date h1").text(localTime);
};
</script>
<script>
	$(function(){
		//判断组织id是否有效
		var configInfo = ${configInfo};
		if($.isEmptyObject(configInfo)){
			layer.msg('请填写有效组织ID！', {
				shade: 0.5,
				time:100000000
			});
			return;
		}
		
		/* var pkIndexNum = '${configInfo.pkIndexNum}';
		var pkIndexName = '${configInfo.pkIndexName}';
		var pkIndexCode = '${configInfo.pkIndexCode}'; */
		/*加载echart图形*/
		/* loadData(pkIndexName, pkIndexCode); */
		loadData();
		lodadMap();
		$("#industryChoice>div").on("click",function(){
			$(this).addClass("on").siblings().removeClass("on");
			loadData();
		})
	})
	
	function selectByYear(year){
		$("#yearMenu").slideUp("fast");  
		$("#yearText").text(year+"年");
     	$("#year").val(year);
		loadData();
	}
	
	var data = "";
	function loadData(){
		$.ajax({
			url:"${OfficeUrl}XOffice/interface/json/industryIndicator/jxStatistics",
			type:"post",
			data:{
				"year" : $('#year').val(),
			},
			success:function(result){
				console.log(result)
				if(result.success){
					$("#oldYear").val($("#year").val());
					var yearList = result.yearList.reverse();
					
					if($("#yl").hasClass("on")){
						//主营业务收入-累计
						var chart1 = echarts.init(document.getElementById("part1"));
						var option1 = optionPart2;
						
						option1.title.text="主营业务收入（亿元）";
						option1.series[0].data=result.zyywsrList1;
						option1.series[0].type="bar";
						option1.series[0].itemStyle.normal.color="#ce0867";
						option1.series[1].data=result.zyywsrPercent1;
						option1.series[1].type='line';
						option1.series[1].itemStyle.normal.color="#ce0867";
						
						chart1.setOption(option1);
						
						//利税总额-累计
						var chart2 = echarts.init(document.getElementById("part2"));
						var option2 = optionPart2;
						
						option2.title.text="利税总额（亿元）";
						option2.series[0].data=result.lsList1;
						option2.series[0].type="bar";
						option2.series[0].itemStyle.normal.color="#01c5ff";
						option2.series[1].data=result.lsPercent1;
						option2.series[1].type='line';
						option2.series[1].itemStyle.normal.color="#01c5ff";
						
						chart2.setOption(option2);
						
						//主营业务收入-近期
						var chart3 = echarts.init(document.getElementById("part3"));
						var option3 = optionPart3;
						
						option3.title.text="主营业务收入（亿元）";
						option3.yAxis.data=yearList;
						option3.series[0].data=result.zyywsrCluster1.reverse();
						option3.series[0].type="bar";
						
						chart3.setOption(option3);
						
						//利税总额-近期
						var chart4 = echarts.init(document.getElementById("part4"));
						var option4 = optionPart3;
						
						option4.title.text="利税总额（亿元）";
						option4.yAxis.data=yearList;
						option4.series[0].data=result.lsCLuster1.reverse();
						option4.series[0].type="bar";
						
						chart4.setOption(option4);
					}else if($("#gc").hasClass("on")){
						//主营业务收入-累计
						var chart1 = echarts.init(document.getElementById("part1"));
						var option1 = optionPart2;
						
						option1.title.text="主营业务收入（亿元）";
						option1.series[0].data=result.zyywsrList2;
						option1.series[0].type="bar";
						option1.series[0].itemStyle.normal.color="#ce0867";
						option1.series[1].data=result.zyywsrPercent2;
						option1.series[1].type='line';
						option1.series[1].itemStyle.normal.color="#ce0867";
						
						chart1.setOption(option1);
						
						//利税总额-累计
						var chart2 = echarts.init(document.getElementById("part2"));
						var option2 = optionPart2;
						
						option2.title.text="利税总额（亿元）";
						option2.series[0].data=result.lsList2;
						option2.series[0].type="bar";
						option2.series[0].itemStyle.normal.color="#01c5ff";
						option2.series[1].data=result.lsPercent2;
						option2.series[1].type='line';
						option2.series[1].itemStyle.normal.color="#01c5ff";
						
						chart2.setOption(option2);
						
						//主营业务收入-近期
						var chart3 = echarts.init(document.getElementById("part3"));
						var option3 = optionPart3;
						
						option3.title.text="主营业务收入（亿元）";
						option3.yAxis.data=yearList;
						option3.series[0].data=result.zyywsrCluster2.reverse();
						option3.series[0].type="bar";
						
						chart3.setOption(option3);
						
						//利税总额-近期
						var chart4 = echarts.init(document.getElementById("part4"));
						var option4 = optionPart3;
						
						option4.title.text="利税总额（亿元）";
						option4.yAxis.data=yearList;
						option4.series[0].data=result.lsCLuster2.reverse();
						option4.series[0].type="bar";
						
						chart4.setOption(option4);
					}else{}
					
					
				}else{
					layer.msg(result.errorMsg);
					if(result.errorCode==1){
						$("#yearMenu").slideUp("fast");  
						$("#yearText").text($("#oldYear").val()+"年");
					 	$("#year").val($("#oldYear").val());
					}
				}
			},
			error:function(){
				layer.msg("数据获取异常！");
			}
		});
	}
	
	
	/* var optionPart1 = {
		backgroundColor: '#082F56', 
		title : {
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:14
	        },
	        left:15,
	        top:10
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	    	top:'6%',
	    	right: '5%',
			itemWidth:25,
			itemHeight:12,
	        data:[
				{name:'总量',textStyle:{color:"#FCFF00"}}
			]
	    },
	    grid: {
	    	top:'40%',
	    	bottom:'5%',
	    	heigth:'60%',
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
		            			color:"#fff"
	            			}
	            		}
	            	},
	            	itemStyle:{
	            		normal:{
	            			color:"#799c0c"
	            		}
	            	}
	            },
	            markLine : {
	            	lineStyle:{
		            	normal:{
		            		color:"#FF7F50"
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
	            		color:'#FF7F50'
	            	}
	            }
	        }
	    ]
	}; */
	
	var optionPart2 = {
		backgroundColor: '#082F56', 
		title : {
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:14
	        },
	        left:15,
	        top:10
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	    	top:'6%',
	    	right: '5%',
			itemWidth:25,
			itemHeight:12,
	        data:[
				{name:'总量',textStyle:{color:"#FCFF00"}},
				{name:'同比增量',textStyle:{color:"#FCFF00"}},
			]
	    },
	    grid: {
	    	top:'40%',
	    	bottom:'5%',
	    	heigth:'60%',
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
	            name: '同比增量',
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
		            			color:"#fff"
	            			}
	            		}
	            	},
	            	itemStyle:{
	            		normal:{
	            			color:"#799c0c"
	            		}
	            	}
	            },
	            markLine : {
	            	lineStyle:{
		            	normal:{
		            		color:"#FF7F50"
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
	            		color:'#FF7F50'
	            	}
	            }
	        },
	        {
	            name:'同比增量',
	            type:'line',
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
		            			color:"#fff"
	            			}
	            		}
	            	},
	            	itemStyle:{
	            		normal:{
	            			color:"#799c0c"
	            		}
	            	}
	            },
	            markLine : {
	            	lineStyle:{
		            	normal:{
		            		color:"#FF7F50"
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
	            		color:'#FF7F50'
	            	}
	            }
	        }
	    ]
	};
	
	var optionPart3 = {
		backgroundColor: '#082F56', 
		title : {
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:14
	        },
	        left:15,
	        top:5
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    grid: {
	    	top:'20%',
	    	bottom:'5%',
	    	heigth:'80%',
	    	left:'5%',
	        containLabel: true
	    },
	    xAxis: {
	        type: 'value',
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
	    yAxis: {
	        type: 'category',
	        data: [2017, 2016, 2015],
	        axisLine:{
        		lineStyle:{
        			color:"#5EC9F4"
        		}
        	}
	    },
	    series: [
	        {
	            type: 'bar',
	            data: [0, 0, 0],
	            barWidth:'50%',
	            label:{
	            	normal:{
	            		show:true,
	            		position:'right',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	}
	            },
	            areaStyle: {
	            	normal: {
	            		opacity: 0.2
	            	}
	            },
	            itemStyle:{
	            	normal:{
	            		color:function(params){
	            			var index = params.dataIndex;//表示当前的数据条的索引
	            		    var alternateNumber = 3;//表示按几种颜色交替出现

	            		    var newColor="";//表示最终显示的颜色
	            		    /**
	            		    自定义的颜色池
	            		    如果颜色池长度不够，将无法取得正确的颜色，所以有必要使
	            		    index的最大值小于colorList.length
	            		    */
	            		    var colorList = ['#18fee1','#18ccff','#0090ff','#E87C25','#27727B',
	            		                     '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
	            		                     '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
	            		                    ];
	            		    //当当前的索引值小于交替值的时候 
	            		    if(index < alternateNumber){
	            		        //取出当前索引值对应的colorList的颜色
	            		        newColor = colorList[index];

	            		    }else{
	            		        /**当当前的索引值大于等于交替值的时候*/
	            		        var rowNumber=Math.floor(index/alternateNumber);//表示当前的数据出现在几次
	            		        //通过表达式计算返回正确的colorList索引
	            		        newColor = colorList[index-rowNumber*alternateNumber];
	            		        
	            		    }

	            		    return colorList[index];
	            		}
	            	}
	            }
	        }
	    ]
	};
    /*加载地图*/
    function lodadMap(){
		$.get('${ctx}/static/map/360100.json', function(geojson) {
			echarts.registerMap('南昌', geojson);
			var chart = echarts.init(document.getElementById("map"));
			chart.setOption({
				series: [{
					type: 'map',
					map: '南昌',
					zoom:1,
					itemStyle:{
						normal: {
							areaColor:'#0088FE',
						},
						emphasis: {
							areaColor: '#00D0FF',
							borderWidth: 0
						}
					},
					data:[
						{name:'进贤县', selected:true} // selected:true 默认选中
					]
				}]
			});
		});
	}
	
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/parkDataCenter/pkEconIndicators?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}${configInfo.endUrl}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/parkDataCenter/pkEconIndicators?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}${configInfo.endUrl}";
	         }  
	    }  
	}
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome
</script>
</html>