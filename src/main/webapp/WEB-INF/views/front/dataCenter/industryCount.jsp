<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>大数据中心-主要经济指标排名</title>
<link href="${ctx}/static/css/dataCenter/dataCenter.css" rel="stylesheet"/>
<style type="text/css">
.statusTip {
    position: absolute;
    top: 0px;
    left: 0px;
    z-index: 10;
}
</style>
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
	
	var height = $(".dataBar_3_left").height();
	var tableHeight = height-24-11;
	$(".dataBar_3_left table").height(tableHeight);
 })
</script>
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
		<input type="hidden" id="industryType" name="industryType" value="2">
	</form>
	<c:choose>
		<c:when test="${areaInfo.isProvince}">
			<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/dataCenter/energyCount?orgId=${orgId}&linkId=${linkId}">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/dataCenter/organizationCount?orgId=${orgId}&linkId=${linkId}">
		</c:otherwise>
	</c:choose>
<div class="data_main">
	<div class="data_header">
		<img src="${ctx}/static/image/dataCenter/head2.png" width="100%" style="">
		<img src="${ctx}/static/image/dataCenter/LOGO3.png" width="35%" class="data_logo" style="">
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
		<c:if test="${not empty linkId}">			
			<img class="statusTip" src="${ctx}/static/image/cityDataCenter/yc/yc.png" style="width:55px; cursor: pointer;" onclick="window.location.href='https://www.jx968969.com/XProject/front/cityDataCenter/ycFourth/13?orgId=${linkId}'">
		</c:if>
		<div class="data_contentLeft" style="width:40%;" id="map"></div>
		<div class="data_contentRight" style="width:60%;">
			<div class="dataBar_3_left">
				<div class="dataContTitleBar">
					<span class="dataContTitle">按园区排名</span>
					<span class="greenFontControl" id="parkSort">主营业务收入（亿元）</span>
				</div>
				<table id="parkList">
				</table>
			</div>
			<div class="dataBar_3_right">
				<div class="dataContTitleBar">
					<span class="dataContTitle">按产业排名</span>
					<span class="yellowFontControl" id="industrySort">主营业务收入（亿元）</span>
				</div>
				<div id="part1" style="width: 100%;height: 90%"></div>
			</div>
			<div class="dataBar_3_bottom" id="part2"></div>
		</div>
		
		<div style="clear:both;"></div>
	</div>
</div>
<div class="btn_prev" onclick="window.location.href='${ctx}/front/dataCenter/economicCount?orgId=${orgId}&linkId=${linkId}'"></div>
<c:choose>
	<c:when test="${areaInfo.isProvince}">
		<div class="btn_next" onclick="window.location.href='${ctx}/front/dataCenter/energyCount?orgId=${orgId}&linkId=${linkId}'"></div>	
	</c:when>
	<c:otherwise>
		<div class="btn_next" onclick="window.location.href='${ctx}/front/dataCenter/organizationCount?orgId=${orgId}&linkId=${linkId}'"></div>	
	</c:otherwise>
</c:choose>
</body>

<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/industry.js"></script>
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
		loadEchartAndTableList();
		
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
     	loadEchartAndTableList();
	}
	
	/*按季度搜索*/
	function selectByQuarter(quarter){
		$("#quarterMenu").slideUp("fast");
		$("#quarterText").text("第"+(quarter==4?'四':quarter==3?'三':quarter==2?'二':'一')+"季度");
     	$("#quarter").val(quarter);
     	index = 0;
     	$("#areaId").val('${areaInfo.areaId}'); 
		$("#areaName").val('${areaInfo.areaName}');
     	loadEchartAndTableList();
	}
	
	/*加载图表和园区排序列表*/
	var index = 0;
	var mapDataLocal = "";
	function loadEchartAndTableList(){
		$.ajax({
			url:"${ctx}/interface/json/dataCenter/industryCount",
			type:"post",
			data:$("#form").serialize(),
			success:function(result){
				if(result.success){
					//园区排序列表
					loadParkSortTable(result.industryData.parkSort);
					/*地图，只加载一次*/
					if(index==0){						
						mapDataLocal = result.industryData.mapData;
						loadMapEchart(result.industryData.mapData);
						index++;
					}
					//产业柱形图
					loadIndustryEchart();
					//工业产值柱形图
					loadEconomicEchart(result.industryData.ecData);
					
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error:function(){
				layer.msg("数据获取异常！");
			}
		});
	}
	
	/*园区排序列表*/
	function loadParkSortTable(parkSort){
		var industryType = $("#industryType").val();
		if(industryType==1){
			$("#parkSort").text("工业增加值（亿元）")
		}else if(industryType==2){
			$("#parkSort").text("主营业务收入（亿元）")
		}else if(industryType==3){
			$("#parkSort").text("利润总额（亿元）")
		}else if(industryType==4){
			$("#parkSort").text("出口交货值（亿元）")
		}
		
		$("#parkList").empty();
		for(var i=0;i<parkSort.length;i++){
			var _div = '<tr>'
				+' <td class="tdNum">'+(i+1)+'</td>';
			if(i==0){				
				_div += ' <td class="tdImg"><img src="${ctx}/static/image/dataCenter/one.png" width="12" height="12"></td>';
			}else if(i==1){
				_div += ' <td class="tdImg"><img src="${ctx}/static/image/dataCenter/two.png" width="12" height="12"></td>';
			}else if(i==2){
				_div += ' <td class="tdImg"><img src="${ctx}/static/image/dataCenter/three.png" width="12" height="12"></td>';
			}else{
				_div += ' <td class="tdImg"><img src="${ctx}/static/image/dataCenter/other.png" width="12" height="12"></td>';
			}
			
			_div += ' <td class="tdEnterprise">'+parkSort[i].parkName+'</td>'
				+' <td class="tdValue"><font class="greenFont">'+parkSort[i].value+'</font></td>'
				+' </tr>';
			
			$("#parkList").append(_div);
		} 
	}
	
	/*产业柱形图*/
	function loadIndustryEchart(){
		var industryType = $("#industryType").val();
		if(industryType==3){
			$("#industrySort").text("利润总额（亿元）");
		}else{
			$("#industrySort").text("主营业务收入（亿元）");
		}
		
		var areaId = $("#areaId").val();
		var industryType = $("#industryType").val();
		var myChart = echarts.init(document.getElementById('part1'));
		option1.yAxis.data=arrData(getData(areaId, industryType, 1));
		option1.series[0].data=arrData(getData(areaId, industryType, 2));
		myChart.setOption(option1);
	};
	
	var arrData = function (data) {
		var str = data.split(",");
		var arr = new Array();
		for(var i=0;i<str.length;i++){
			arr.push(str[i]);;
		}
		return arr;
	};
	
	/*工业产值柱形图*/
	function loadEconomicEchart(ecData){
		var industryType = $("#industryType").val();
		var title = "";
		
		var myChart = echarts.init(document.getElementById('part2'));
		if(industryType==1){
			title = "工业增加值（亿元）";
			option2.series[0].data = ecData.series.gyzjz.gyzjzValue1;
			option2.series[1].data = ecData.series.gyzjz.gyzjzValue2;
			option2.series[2].data = ecData.series.gyzjz.gyzjzValue0;
		}else if(industryType==2){
			title = "主营业务收入（亿元）";
			option2.series[0].data = ecData.series.zyywsr.zyywsrValue1;
			option2.series[1].data = ecData.series.zyywsr.zyywsrValue2;
			option2.series[2].data = ecData.series.zyywsr.zyywsrValue0;
		}else if(industryType==3){
			title = "利润总额（亿元）";
			option2.series[0].data = ecData.series.lr.lrValue1;
			option2.series[1].data = ecData.series.lr.lrValue2;
			option2.series[2].data = ecData.series.lr.lrValue0;
		}else if(industryType==4){
			title = "出口交货值（亿元）";
			option2.series[0].data = ecData.series.ckjhz.ckjhzValue1;
			option2.series[1].data = ecData.series.ckjhz.ckjhzValue2;
			option2.series[2].data = ecData.series.ckjhz.ckjhzValue0;
		}
		option2.xAxis[0].data = ecData.xAxis;
		option2.title.text=title;
		myChart.setOption(option2);
	};
	
	var mapType = [];
   	var cityMap = {
   		"南昌市": "360100", "景德镇市": "360200", "萍乡市": "360300", "九江市": "360400",
        "新余市": "360500", "鹰潭市": "360600", "赣州市": "360700", "吉安市": "360800",
        "宜春市": "360900", "抚州市": "361000", "上饶市": "361100" 
   	};
	function loadMapEchart(mapData){
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
			optionMap.visualMap.max = mapData.visualMapMax;
			optionMap.series[0].data = mapData.zyywsr;
			optionMap.series[1].data = mapData.lr;
			optionMap.series[2].data = mapData.ckjhz;
			var kind = $("#industryType").val();
			if(kind==2){
 	        	optionMap.legend.selected={'主营业务收入':true,'利润总额':false,'出口交货值':false};
 	        }else if(kind==3){
 	        	optionMap.legend.selected={'主营业务收入':false,'利润总额':true,'出口交货值':false};
 	        }else if(kind==4){
 	        	optionMap.legend.selected={'主营业务收入':false,'利润总额':false,'出口交货值':true};
 	        }
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
			        loadEchartAndTableList();
		        });
		   	}
			
		    myChart.on('legendselectchanged', function (params){
		    	var kindMap = {
		       		"工业增加值": "1",
		            "主营业务收入": "2",
		            "利润总额": "3",
		            "出口交货值": "4"
		       	};
		    	var industryType = kindMap[params.name];
		    	$("#industryType").val(industryType);
		    	
		    	optionMap.visualMap.max = mapDataLocal.visualMapMax;
				optionMap.series[0].data = initMap(mapDataLocal.zyywsr,$("#areaId").val());
				optionMap.series[1].data = initMap(mapDataLocal.lr,$("#areaId").val());
				optionMap.series[2].data = initMap(mapDataLocal.ckjhz,$("#areaId").val());
				var kind = $("#industryType").val();
				if(industryType==2){
	 	        	optionMap.legend.selected={'主营业务收入':true,'利润总额':false,'出口交货值':false};
	 	        }else if(industryType==3){
	 	        	optionMap.legend.selected={'主营业务收入':false,'利润总额':true,'出口交货值':false};
	 	        }else if(industryType==4){
	 	        	optionMap.legend.selected={'主营业务收入':false,'利润总额':false,'出口交货值':true};
	 	        }
				myChart.setOption(optionMap);
		    	
		    	loadEchartAndTableList();
			});
		});
	}
	
	function initMap(arr,areaId){
		var newArr = new Array();
		for(var i=0;i<arr.length;i++){
			var str = new Object();
			var info = arr[i];
			if(cityMap[info.name]==areaId){
				str.name = info.name;
				str.value = info.value;
				str.selected = true;
			}else{
				str.name = info.name;
				str.value = info.value;
			}
			newArr.push(str);
		}
		return newArr;
	}
	
	var option1 = {
		    grid: {
		        containLabel: true
		    },
		    xAxis: {
		        type: 'value',
		        axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	}
		    },
		    yAxis: {
		        type: 'category',
		        data: [],
		        axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	}
		    },
		    series: [
		        {
		            type: 'bar',
		            data: [],
		            barWidth:'50%',
		            label:{
		            	normal:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	},
		            	emphasis:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	}
		            },
		            itemStyle:{
		            	normal:{
		            		color:function(params){
		            			var index = params.dataIndex;//表示当前的数据条的索引
		            		    var alternateNumber = 2;//表示按几种颜色交替出现

		            		    var newColor="";//表示最终显示的颜色
		            		    /**
		            		    自定义的颜色池
		            		    如果颜色池长度不够，将无法取得正确的颜色，所以有必要使
		            		    index的最大值小于colorList.length
		            		    */
		            		    var colorList = ['#5EC9F4','#CD0567','#FCCE10','#E87C25','#27727B',
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

		            		    return newColor;
		            		}
		            	}
		            }
		        }
		    ]
		};
	
	var option2 = {
			backgroundColor: '#082F56', 
			title : {
		        text: '主营业务收入（亿元）',
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:14
		        },
		        left:5,
		        top:5
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:5,
		        data:[
					{name:'国家级',textStyle:{color:"#FCFF00"}},
					{name:'省重点级',textStyle:{color:"#FCFF00"}},
					{name:'一般省级',textStyle:{color:"#FCFF00"}}
				]
		    },
		    grid: {
		    	bottom:'5%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : [],
		        	axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
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
		            name:'国家级',
		            type:'bar',
		            barWidth:'20%',
		            data:[],
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
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ],
		                lineStyle:{
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            }
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#7DFC00'
		            	}
		            }
		        },
		        {
		            name:'省重点级',
		            type:'bar',
		            data:[],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ],
		                lineStyle:{
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            }
		            },
		            itemStyle:{
		            	normal:{
		            		color:'red'
		            	}
		            }
		        },
		        {
		            name:'一般省级',
		            type:'bar',
		            data:[],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ],
		                lineStyle:{
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            }
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#5EC9F4'
		            	}
		            }
		        }
		    ]
		};
	
	var label = {
		normal: {
			show: true
	    },
	    emphasis: {
	        show: true
	    }
	};
		
	var itemStyle = {
	    hoverAnimation:false,
	        normal: {
	            borderColor: '#ccc'
	        },
		    emphasis: {
		       	areaColor: '#A6C5BD',
		       	borderColor: '#FFF',
		        opacity:1
		    }
	};
	
	var optionMap = {
			tooltip : {
	               trigger: 'item',
	        },
	        legend: {
	            orient: 'vertical',
	            y: 'top',
	            x:'left',
	            data:['主营业务收入','利润总额','出口交货值'],
	            selectedMode:'single',
	            selected:{'主营业务收入':true,'利润总额':false,'出口交货值':false},
	            textStyle: {
	                color: '#fff'
	            }
	     	},  
	     	visualMap: {
	     		orient: 'horizontal',
	            min: 0,
	            max: 1000,
	            left:'60%',
	            bottom:'10%',
	            text: ['高','低'],           // 文本，默认为数值文本
	            calculable: true,
	            color:['yellow','orange'],
	            textStyle: {
	                color: '#fff'
	            }
	        },
	        series: [
	            	{	 
	                	name:'主营业务收入',
	                	type: 'map',
	                    mapType:'${areaInfo.areaId}',
	                    roam : false,
	                    zoom : 1.1,
	                    selectedMode: 'single', 
	                    label:label,
		                itemStyle:itemStyle,
		                showLegendSymbol:false,
	                    data:[]
	               	},
	               	{	 
	            	   name:'利润总额',
	            	   type: 'map',
	                   mapType:'${areaInfo.areaId}',
	                   roam : false,
	                   zoom : 1.1,
	                   selectedMode: 'single', 
	                   label:label,
		               itemStyle:itemStyle,
		               showLegendSymbol:false,
	                   data:[]
	              	},
	              	{	 
	            	  name:'出口交货值',
	            	  type:'map',
	                  mapType:'${areaInfo.areaId}',
	                  roam:false,
	                  zoom:1.1,
	                  selectedMode: 'single', 
	                  label:label,
	                  itemStyle:itemStyle,
	                  showLegendSymbol:false,
	                  data:[]
	             	}
	        ]
	   
	};
	
	
	
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    var isProvince ='${areaInfo.isProvince}';
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/dataCenter/economicCount?orgId=${orgId}&linkId=${linkId}";
	        }else{ //向下滚动事件 
	        	if(isProvince=='true'){
	        		window.location.href="${ctx}/front/dataCenter/energyCount?orgId=${orgId}&linkId=${linkId}";
	        	}else{
	        		window.location.href="${ctx}/front/dataCenter/industryCount?orgId=${orgId}&linkId=${linkId}";
	        	}
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/dataCenter/economicCount?orgId=${orgId}&linkId=${linkId}";
	         }else{ //向下滚动事件 
	        	 if(isProvince=='true'){ //向上滚动事件
	        		 window.location.href="${ctx}/front/dataCenter/energyCount?orgId=${orgId}&linkId=${linkId}";
		         }else{
		        	 window.location.href="${ctx}/front/dataCenter/industryCount?orgId=${orgId}&linkId=${linkId}";
		         }
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
</script>

</html>
