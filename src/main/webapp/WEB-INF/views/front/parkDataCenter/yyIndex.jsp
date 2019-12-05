<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>弋阳数据中心</title>
<link href="${ctx}/static/css/parkDataCenter/yyDataCenter.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
</head>

<body>
	<div class="data_main">
		<form action="${ctx}/front/parkDataCenter/yyIndex" method="post" id="form">
			<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
			<input type="hidden" id="orgId" name="orgId" value="${orgId}"/>
			<input type="hidden" id="year" name="year" value="${year}"/>
			<input type="hidden" id="month" name="month" value="${month}"/>
			<input type="hidden" id="orderType" name="orderType" value="1"/>
		</form>
		<input type="hidden" id="index" name="index" value="1"/>
		<div class="top-bar">
			<img alt="eight" src="../../static/image/parkDataCenter/LOGO.jpg">
			<div class="local-date">
				<p>2017年7月20号</p>
				<h1>14:20:50</h1>
			</div>
			<div class="dropdownBar">
				<button id="btnYear" class="dropdownButton" type="button">${year}年 <span class="caret"></span>
				</button>
				<ul id="yearMenu" class="dropdownMenu" style="right: 74px;">
					<li><a href="javascript:;" onclick="selectByYear('2017')">2017年</a></li>
					<li><a href="javascript:;" onclick="selectByYear('2016')">2016年</a></li>
				</ul>
				<button id="btnQuarter" class="dropdownButton" type="button">${month}月<span class="caret"></span>
				</button>
				<ul id="quarterMenu" class="dropdownMenu">
					<li><a href="javascript:;" onclick="selectByMonth('2')">2月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('3')">3月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('4')">4月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('5')">5月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('6')">6月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('7')">7月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('8')">8月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('9')">9月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('10')">10月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('11')">11月</a></li>
					<li><a href="javascript:;" onclick="selectByMonth('12')">12月</a></li>
				</ul>
			</div>
		</div>
		<div class="data_content">
			<div style="margin-bottom: 7px;">
				<div class="data_title">园区企业分布情况</div>
			</div>
			<div class="data_contentLeft" style="width: 70%;">
				<div class="clearfix" style="height: 22%; margin-bottom: 7px; margin-left: 30px;">
					<div class="dataBarMagenta" style="cursor: pointer;" onclick="selectByValueType('1')">
						<div class="dataBarTitle">工业增加值</div>
						<div class="dataBarNum">
							<font class="yellowFont24">${distributionData[0].GYZJZ_VALUE}</font>万元
						</div>
						<div class="dataBarIncrease">
							同比增长<font class="yellowFont">${distributionData[0].GYZJZ_PERCENT}%</font>
						</div>
					</div>
					<div class="dataBarLightBlue"  style="cursor: pointer;" onclick="selectByValueType('2')">
						<div class="dataBarTitle">主营业务收入</div>
						<div class="dataBarNum">
							<font class="yellowFont24">${distributionData[0].ZYYWSR_VALUE}</font>万元
						</div>
						<div class="dataBarIncrease">
							同比增长<font class="yellowFont">${distributionData[0].ZYYWSR_PERCENT}%</font>
						</div>
					</div>
					<div class="dataBarDeepBlue" style="cursor: pointer;" onclick="selectByValueType('3')">
						<div class="dataBarTitle">利润总额</div>
						<div class="dataBarNum">
							<font class="yellowFont24">${distributionData[0].LR_VALUE}</font>万元
						</div>
						<div class="dataBarIncrease">
							同比增长<font class="yellowFont">${distributionData[0].LR_PERCENT}%</font>
						</div>
					</div>
					<div class="dataBarDeepGreen">
						<div class="dataBarTitle">工业用电总数</div>
						<div class="dataBarNum">
							<font class="yellowFont24">${distributionData[0].GYYDL_VALUE}</font>万千瓦时
						</div>
						<div class="dataBarIncrease">
							同比增长<font class="yellowFont">
								<c:choose>
									<c:when test="${distributionData[0].GYYDL_PERCENT!=0}">${distributionData[0].GYYDL_PERCENT}%</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</font>
						</div>
					</div>
				</div>
				<div style="height: calc(100% - 22% - 7px); padding-right: 0.6%;">
					<div class="mainContainer">
						<div class="navTitleBar">
							<a class="navTitle" href="#">月度</a> <a class="navTitle box" href="#">累计</a>
						</div>
						<div class="navContentBar">
							<div class="navContent">
								<div class="navContTop">
									<div id="chart_M" style="width: 100%;height: 100%;"></div>
								</div>
								<div class="navContBottom">
									<table id="chartTable_M"></table>
								</div>
							</div>
							<div class="navContent">
								<div class="navContTop">
									<div id="chart" style="width: 100%;height: 100%;"></div>
								</div>
								<div class="navContBottom">
									<table id="chartTable">
										<tr style="text-align: center;">
											<td style="width: 12%;">2017年总量</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="data_contentRight" style="width: 30%;">
				<div class="dataBarTable">
					<div class="dataContTitleBar">
						<span class="dataContTitle">按园区排名</span> 
						<span class="greenFontControl" id="sort">工业增加值（万元）</span>
					</div>
					<table id="sortTable">
						<c:forEach items="${sortData}" var="info">
							<tr>
								<td class="tdNum">${info.sortGrade}</td>
								<td class="tdImg">
									<c:choose>
										<c:when test="${info.sortGrade==1}">
											<img src="${ctx}/static/image/parkDataCenter/one.png" width="12" height="12">
										</c:when>
										<c:when test="${info.sortGrade==2}">
											<img src="${ctx}/static/image/parkDataCenter/two.png" width="12" height="12">
										</c:when>
										<c:when test="${info.sortGrade==3}">
											<img src="${ctx}/static/image/parkDataCenter/three.png" width="12" height="12">
										</c:when>
										<c:otherwise>
											<img src="${ctx}/static/image/parkDataCenter/other.png" width="12" height="12">
										</c:otherwise>
									</c:choose>
								</td>
								<td class="tdEnterprise">${info.name}</td>
								<td class="tdValue"><font class="greenFont">${info.value}</font></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}'"></div>
</body>
<script>
$(function() {
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
	
	var height = $(".dataBarTable").height();
	var tableHeight = height - 24 - 11;
	$(".dataBarTable table").height(tableHeight);
	
	$(".navContentBar>div").hide();
	$(".navTitleBar>a").removeClass("box");
	$(".navContentBar>div:eq(1)").show();
	$(".navTitleBar>a:eq(1)").addClass("box");
	
	$(".navTitleBar a").click(function() {
		var n = $(".navTitleBar a").index(this);
		$(".navTitleBar a").index(this);
		$(".navContentBar>div").hide();
		$(".navTitleBar>a").removeClass("box");
		$(".navContentBar>div:eq(" + n + ")").show();
		$(".navTitleBar>a:eq(" + n + ")").addClass("box");
		selectByIndex(n);
	});
});
</script>		
<script type="text/javascript">
$(function(){
	drawTable(1, 1);
	var myChart = echarts.init(document.getElementById('chart'));
	myChart.setOption(option); 
});

function selectByIndex(index){
	$("#index").val(index);
	var orderType = $("#orderType").val();
	drawChart(orderType, index);
	drawTable(orderType, index);
}

function selectByValueType(orderType){
	$("#orderType").val(orderType);
	var index = $("#index").val();
	
	drawChart(orderType, index);
	drawTable(orderType, index);
	
	$.ajax({
		url:"${ctx}/json/parkDataCenter/jsonIndex",
		type:"post",
		data:$("#form").serialize(),
		success:function(result){
			if(result.success){
				//企业排行
				if(orderType==1){
					$("#sort").text("工业增加值（万元）");
				}else if(orderType==2){
					$("#sort").text("主营业务收入（万元）");
				}else if(orderType==3){
					$("#sort").text("利润总额（万元）");
				}
				
				$("#sortTable").empty();
				var sortData = result.sortData;
				
				for(var i=0;i<sortData.length;i++){
					var info = sortData[i];
					var tr = '<tr>'
                    	+'<td class="tdNum">'+info.sortGrade+'</td>';
                    if(info.sortGrade==1){
                    	tr += '<td class="tdImg"><img src="${ctx}/static/image/parkDataCenter/one.png" width="12" height="12"></td>';
                    }else if(info.sortGrade==2){
                    	tr += '<td class="tdImg"><img src="${ctx}/static/image/parkDataCenter/two.png" width="12" height="12"></td>';
                    }else if(info.sortGrade==3){
                    	tr += '<td class="tdImg"><img src="${ctx}/static/image/parkDataCenter/three.png" width="12" height="12"></td>';
                    }else{
                    	tr += '<td class="tdImg"><img src="${ctx}/static/image/parkDataCenter/other.png" width="12" height="12"></td>';
                    }
                    
                    tr += '<td class="tdEnterprise">'+info.name+'</td>'
                    	+'<td class="tdValue"><font class="greenFont">'+info.value+'</font></td>'
                    	+'</tr>';
                    	
                    $("#sortTable").append(tr);
				}
			}else{
				layerTips("数据加载失败，请刷新重试！");
			}
		},
		error:function(){
			layerTips("数据加载超时，请稍后重试！");
		}
	});
}


function selectByYear(year){
	$("#year").val(year);
	$("#form").submit();
}

function selectByMonth(month){
	$("#month").val(month);
	$("#form").submit();
}

function drawChart(orderType, index){
	if(index==1){
		//chart
		if(orderType==1){
			option.title.text="累计工业增加值总量和增长速度图";
			option.series[0].data=${chartData.gyzjz_value_2017};
			option.series[1].data=${chartData.gyzjz_value_2016};
			option.series[2].data=${chartData.gyzjz_percent_2017};
			option.series[3].data=${chartData.gyzjz_percent_2016};
		}else if(orderType==2){
			option.title.text="累计主营业务收入总量和增长速度图";
			option.series[0].data=${chartData.zyywsr_value_2017};
			option.series[1].data=${chartData.zyywsr_value_2016};
			option.series[2].data=${chartData.zyywsr_percent_2017};
			option.series[3].data=${chartData.zyywsr_percent_2016};
		}else if(orderType==3){
			option.title.text="累计利润总额总量和增长速度图";
			option.series[0].data=${chartData.lr_value_2017};
			option.series[1].data=${chartData.lr_value_2016};
			option.series[2].data=${chartData.lr_percent_2017};
			option.series[3].data=${chartData.lr_percent_2016};
		}
		var myChart = echarts.init(document.getElementById('chart'));
		myChart.setOption(option); 
	}else{
		if(orderType==1){
			option.title.text="月度工业增加值总量和增长速度图";
			option.series[0].data=${chartData_M.gyzjz_value_2017};
			option.series[1].data=${chartData_M.gyzjz_value_2016};
			option.series[2].data=${chartData_M.gyzjz_percent_2017};
			option.series[3].data=${chartData_M.gyzjz_percent_2016};
		}else if(orderType==2){
			option.title.text="月度主营业务收入对比图";
			option.series[0].data=${chartData_M.zyywsr_value_2017};
			option.series[1].data=${chartData_M.zyywsr_value_2016};
			option.series[2].data=${chartData_M.zyywsr_percent_2017};
			option.series[3].data=${chartData_M.zyywsr_percent_2016};
		}else if(orderType==3){
			option.title.text="月度利润总额对比图";
			option.series[0].data=${chartData_M.lr_value_2017};
			option.series[1].data=${chartData_M.lr_value_2016};
			option.series[2].data=${chartData_M.lr_percent_2017};
			option.series[3].data=${chartData_M.lr_percent_2016};
		}
		var myChart_M = echarts.init(document.getElementById('chart_M'));
		myChart_M.setOption(option);
	}
}


function drawTable(orderType, index){
	var value_2017 = "";
	var value_2016 = "";
	
	if(index==1){
		$("#chartTable").empty();
		if(orderType==1){
			value_2017 = ${chartData.gyzjz_value_2017_};
			value_2016 = ${chartData.gyzjz_value_2016};
			percent_2017 = ${chartData.gyzjz_percent_2017_};
			percent_2016 = ${chartData.gyzjz_percent_2016};
		}else if(orderType==2){
			value_2017 = ${chartData.zyywsr_value_2017_};
			value_2016 = ${chartData.zyywsr_value_2016};
			percent_2017 = ${chartData.zyywsr_percent_2017_};
			percent_2016 = ${chartData.zyywsr_percent_2016};
		}else if(orderType==3){
			value_2017 = ${chartData.lr_value_2017_};
			value_2016 = ${chartData.lr_value_2016};
			percent_2017 = ${chartData.lr_percent_2017_};
			percent_2016 = ${chartData.lr_percent_2016};
		}
	}else{
		$("#chartTable_M").empty();
		if(orderType==1){
			value_2017 = ${chartData_M.gyzjz_value_2017_};
			value_2016 = ${chartData_M.gyzjz_value_2016};
			percent_2017 = ${chartData_M.gyzjz_percent_2017_};
			percent_2016 = ${chartData_M.gyzjz_percent_2016};
		}else if(orderType==2){
			value_2017 = ${chartData_M.zyywsr_value_2017_};
			value_2016 = ${chartData_M.zyywsr_value_2016};
			percent_2017 = ${chartData_M.zyywsr_percent_2017_};
			percent_2016 = ${chartData_M.zyywsr_percent_2016};
		}else if(orderType==3){
			value_2017 = ${chartData_M.lr_value_2017_};
			value_2016 = ${chartData_M.lr_value_2016};
			percent_2017 = ${chartData_M.lr_percent_2017_};
			percent_2016 = ${chartData_M.lr_percent_2016};
		}
	}
	
	
	var tr1 = '<tr style="text-align: center;">'
		+'<td style="width: 12%;">2017年总量</td>'
		+'<td>'+value_2017[0]+'</td>'
		+'<td>'+value_2017[1]+'</td>'
		+'<td>'+value_2017[2]+'</td>'
		+'<td>'+value_2017[3]+'</td>'
		+'<td>'+value_2017[4]+'</td>'
		+'<td>'+value_2017[5]+'</td>'
		+'<td>'+value_2017[6]+'</td>'
		+'<td>'+value_2017[7]+'</td>'
		+'<td>'+value_2017[8]+'</td>'
		+'<td>'+value_2017[9]+'</td>'
		+'<td>'+value_2017[10]+'</td>'
		+'</tr>';
	var tr2 = '<tr style="text-align: center;">'
		+'<td style="width: 12%;">2016年总量</td>'
		+'<td>'+value_2016[0]+'</td>'
		+'<td>'+value_2016[1]+'</td>'
		+'<td>'+value_2016[2]+'</td>'
		+'<td>'+value_2016[3]+'</td>'
		+'<td>'+value_2016[4]+'</td>'
		+'<td>'+value_2016[5]+'</td>'
		+'<td>'+value_2016[6]+'</td>'
		+'<td>'+value_2016[7]+'</td>'
		+'<td>'+value_2016[8]+'</td>'
		+'<td>'+value_2016[9]+'</td>'
		+'<td>'+value_2016[10]+'</td>'
		+'</tr>';
	var tr3 = '<tr style="text-align: center;">'
		+'<td style="width: 12%;">2017增速</td>'
		+'<td>'+percent_2017[0]+'</td>'
		+'<td>'+percent_2017[1]+'</td>'
		+'<td>'+percent_2017[2]+'</td>'
		+'<td>'+percent_2017[3]+'</td>'
		+'<td>'+percent_2017[4]+'</td>'
		+'<td>'+percent_2017[5]+'</td>'
		+'<td>'+percent_2017[6]+'</td>'
		+'<td>'+percent_2017[7]+'</td>'
		+'<td>'+percent_2017[8]+'</td>'
		+'<td>'+percent_2017[9]+'</td>'
		+'<td>'+percent_2017[10]+'</td>'
		+'</tr>';
	var tr4 = '<tr style="text-align: center;">'
		+'<td style="width: 12%;">2016增速</td>'
		+'<td>'+percent_2016[0]+'</td>'
		+'<td>'+percent_2016[1]+'</td>'
		+'<td>'+percent_2016[2]+'</td>'
		+'<td>'+percent_2016[3]+'</td>'
		+'<td>'+percent_2016[4]+'</td>'
		+'<td>'+percent_2016[5]+'</td>'
		+'<td>'+percent_2016[6]+'</td>'
		+'<td>'+percent_2016[7]+'</td>'
		+'<td>'+percent_2016[8]+'</td>'
		+'<td>'+percent_2016[9]+'</td>'
		+'<td>'+percent_2016[10]+'</td>'
		+'</tr>';
	if(index==1){		
		$("#chartTable").append(tr1).append(tr2).append(tr3).append(tr4);
	}else{
		$("#chartTable_M").append(tr1).append(tr2).append(tr3).append(tr4);
	}
}



var option = {
		backgroundColor: '#082F56', 
		title : {
	        text: '累计工业增加值总量和增长速度图',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:14
	        },
	        left:'center',
	        top:'2%'
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	    	top:'10%',
	        data:[
					{name:'2017年总量',textStyle:{color:"#FCFF00"}},
					{name:'2016年总量',textStyle:{color:"#FCFF00"}},
					{name:'2017年增速',textStyle:{color:"#FCFF00"}},
					{name:'2016年增速',textStyle:{color:"#FCFF00"}}
				]
	    },
	    grid: {
	    	bottom:10,
	    	left:'5%',
	    	right:'5%',
	        containLabel: true,
	    },
	    xAxis: [
	        {
	            type: 'category',
	            data: ['2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
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
	            name: '总量（万元）',
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
	            name: '增速（%）',
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
	            name:'2017年总量',
	            type:'bar',
	            data:${chartData.gyzjz_value_2017},
	            barWidth:'25%',
	            itemStyle:{
	            	normal:{
	            		color:'#CD0567'
	            	}
	            }
	        },
	        {
	            name:'2016年总量',
	            type:'bar',
	            data:${chartData.gyzjz_value_2016},
	            barWidth:'25%',
	            itemStyle:{
	            	normal:{
	            		color:'#FCFF00'
	            	}
	            }
	        },
	        {
	            name:'2017年增速',
	            type:'line',
	            yAxisIndex: 1,
	            data:${chartData.gyzjz_percent_2017},
	            itemStyle:{
	            	normal:{
	            		color:'#799C0E'
	            	}
	            }
	        },
	        {
	            name:'2016年增速',
	            type:'line',
	            yAxisIndex: 1,
	            data:${chartData.gyzjz_percent_2016},
	            itemStyle:{
	            	normal:{
	            		color:'#11729D'
	            	}
	            }
	        }
	    ]
};

var scrollFunc=function(e){     
    e=e || window.event; 
    if(e.wheelDelta){//IE/Opera/Chrome     
    	var orgAreaId ='${orgAreaId}';
        if(e.wheelDelta>0){ //向上滚动事件 
        	window.location.href="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}";
        }else{   //向下滚动事件 
        	window.location.href="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}";
        }  
    }else if(e.detail){//Firefox   
         if(e.detail<0) {  //向上滚动事件
        	 window.location.href="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}";
         }else{  //向下滚动事件
        	 window.location.href="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}";
         }  
    } //ScrollText(direct);   
}   
/*注册事件*/     
if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome  

</script>
</html>