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
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxwHomePage.css"/>
<title>江西省工业大数据主要经济指标</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="${orgId}">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
	</form>
	<%@ include file="header.jsp"%>
	<div class="nav-title">
    	<div class="nav">
			<div class="nav-text">
				<div class="nav-titleName" onclick="toZyjjzb()">
					<img src="${ctx}/static/image/cityDataCenter/ycNew/economicIndex.png">
					<font>主要经济指标</font>
				</div>
				<div class="selects" style="display: inline-block;">
					<div class="select">
						<p><font id="selectYear"></font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="sy">
								
							</ul>
						</div>
					</div>
				</div>
				<div class="selects" style="display: inline-block;">
					<div class="select">
						<p><font id="selectMonth">月</font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="sm">
								<li>1月</li>
								<li>2月</li>
								<li>3月</li>
								<li>4月</li>
								<li>5月</li>
								<li>6月</li>
								<li>7月</li>
								<li>8月</li>
								<li>9月</li>
								<li>10月</li>
								<li>11月</li>
								<li>12月</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		    <%-- <div class="return" onclick="location.href='${ctx}/front/cityDataCenter/gxwIndex/1?orgId=3609009'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div> --%>
		</div> 
    </div>
    <div class="dataDisplayBar">
    	<div id="gyzjz" class="dataDisplay">
    		<div class="dataMain">
    			<div class="dataTitle">工业增加值</div>
    			<div class="dataValue orangeT"><font id="gyzjzValue">0</font><span id="gyzjzValueUnit">亿元</span></div>
    		</div>
    		<div class="dataSecond">
    			<div class="dataTitle">同比增长</div>
    			<div class="dataValue orangeT"><font id="gyzjzGrowth">0</font><span id="gyzjzGrowthUnit">%</span></div>
    		</div>
    		<div class="dataSecond">
    			<div class="dataTitle">增幅全国排名</div>
    			<div class="dataValue orangeT"><font id="gyzjzRanking">0</font><span id="gyzjzRankingUnit">名</span></div>
    		</div>
    	</div>
    	<div id="zyywsr" class="dataDisplay">
    		<div class="dataMain">
    			<div class="dataTitle">主营业务收入</div>
    			<div class="dataValue lgT"><font id="zyywsrValue">0</font><span id="zyywsrValueUnit">亿元</span></div>
    		</div>
    		<div class="dataSecond">
    			<div class="dataTitle">同比增长</div>
    			<div class="dataValue lgT"><font id="zyywsrGrowth">0</font><span id="zyywsrGrowthUnit">%</span></div>
    		</div>
    		<div class="dataSecond">
    			<div class="dataTitle">增幅全国排名</div>
    			<div class="dataValue lgT"><font id="zyywsrRanking">0</font><span id="zyywsrRankingUnit">名</span></div>
    		</div>
    	</div>
    	<div id="lr" class="dataDisplay">
    		<div class="dataMain">
    			<div class="dataTitle">利润总额</div>
    			<div class="dataValue blueT"><font id="lrValue">0</font><span id="lrValueUnit">亿元</span></div>
    		</div>
    		<div class="dataSecond">
    			<div class="dataTitle">同比增长</div>
    			<div class="dataValue blueT"><font id="lrGrowth">0</font><span id="lrGrowthUnit">%</span></div>
    		</div>
    		<div class="dataSecond">
    			<div class="dataTitle">增幅全国排名</div>
    			<div class="dataValue blueT"><font id="lrRanking">0</font><span id="lrRankingUnit">名</span></div>
    		</div>
    	</div>
    </div>
	<div class="container-fluid main-content">
		<div class="module">
			<div class="module-left">
				<div class="module-content">
					<div class="cityDataListBar">
						<div class="cityDataHeader">
							<div class="cityDataBox">按市排名</div>
							<div class="cityDataBox" id="cityDataType">工业增加值</div>
							<div class="cityDataBox">同比增长</div>
						</div>
						<div id="cityDataList" class="cityDataList"></div>
					</div>
				</div>
			</div>
			<div class="module-rightBar">
				<div class="module-right">
					<div class="module-content">
						<div class="tab-links" id="SecondTab" style="display: inline-block;position: absolute; top: 20px; left: 20px; z-index: 10;">
							<span id="gyzjzCTab" class="on">工业增加值增长速度（%）-全国对比</span>
							<span id="gyzjzRTab">工业增加值增长速度（%）-近两年对比</span>
						</div>
						<div class="tabs" style="padding-top: 0; height: 100%;">
							<div class="tab" id="SecondTab0">
								<div class="" id="chart4" style="height: 100%;"></div>
							</div>
							<div class="tab" id="SecondTab1" style="display: none;">
								<div class="" id="chart1" style="height: 100%;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="module-right">
					<div class="module-content">
						<div class="tab-links" id="firstTab" style="display: inline-block;position: absolute; top: 20px; left: 20px; z-index: 10;">
							<span id="zyywsrTab" class="on">主营业务收入完成情况</span>
							<span id="lrTab">利润总额完成情况</span>
						</div>
						<div class="tabs" style="padding-top: 0; height: 100%;">
							<div class="tab" id="firstTab0">
								<div class="" id="chart2" style="height: 100%;"></div>
							</div>
							<div class="tab" id="firstTab1" style="display: none;">
								<div class="" id="chart3" style="height: 100%;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript">
var gyzjzOrder_country={'list2017':[6,6,6,6,6,5,4,6,5,5,5],'list2018':[7,5,6,6,6,5,6,7,7,7]}
var zyywsrOrder_country={'list2017':[14,11,9,8,6,5,5,9,9,21,19],'list2018':[4,2,5,4,6,5,7,6,9,10]}
var lrOrder_country={'list2017':[20,18,19,17,13,11,11,14,16,21,21],'list2018':[8,8,6,5,9,11,12,13,13,14]}
$(function(){
	$(".head>a:eq(1)").addClass("on");
	//初始化
	getselectYear();
	getDefaultDate();
	
	getDataDisplay();
	getCityRanking("gyzjz");
	
	$(".select p").on("click",function(){
		$(this).next().slideToggle();
	})
	
	$(".tab-links>span").on("click",function(){
		var ind = $(this).index();
		var p = $(this).parent().attr("id");
		$(this).addClass("on").siblings().removeClass("on");
		$(this).parent().next().find(".tab").fadeOut("fast");
		if(ind == 1){ $("#"+p+"00").show().siblings().hide();}
		else { $("#"+p+"00").hide().siblings().show();}
		setTimeout(function(){
			$("#"+p+ind).fadeIn("fast");
		},210);
		
		//初始化
		setTimeout(function(){
			getDataDisplay();
		},300)
	})
	
	$(".dataDisplayBar .dataDisplay").on("click",function(){
		if($(this).attr("id") == "gyzjz"){
			$("#cityDataType").text("工业增加值");
		}else if($(this).attr("id") == "lr"){
			$("#cityDataType").text("利润总额");
		}else if($(this).attr("id") == "zyywsr"){
			$("#cityDataType").text("主营业务收入");
		}else{}
		getCityRanking($(this).attr("id"));
	})
});
function toZyjjzb(){
	getDefaultDate();
	setTimeout(function(){
		getDataDisplay();
		getCityRanking("gyzjz");
	},300)
}
//设置年份及年月点击事件
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    for(var i=y; i>y-4;i--){
    	$('.select #sy').append('<li>'+i+'</li>');
    }
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		if($(this).parent().attr('id')=='sy'){
			//修改下拉组件默认值
			
 			$('#selectYear').text($(this).text());
			//修改隐藏属性
 			$('#year').val($(this).text());
			
 			getDataDisplay();
			 $("#cityDataType").text("工业增加值");
 			getCityRanking("gyzjz");
		}else if($(this).parent().attr('id')=='sm'){
			//修改下拉组件默认值
			$('#selectMonth').text($(this).text());
			//修改隐藏属性
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			$('#month').val(month);
			
			getDataDisplay();
			$("#cityDataType").text("工业增加值");
			getCityRanking("gyzjz");
		}else{}
	})
}
function getDefaultDate(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/get/selectDefDate",
		type : "post",
		async:false, 
		data : {
			"index":1,
			"orgId":360000
		},
		success : function(result) {
			if (result.success) {
				$('#selectYear').text(result.date.year);
				$('#selectMonth').text(result.date.month+"月");
				$('#year').val(result.date.year);
				$('#month').val(result.date.month);
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getDataDisplay(){
	$.ajax({
		url : "${ctx}/interface/json/cityDataCenter/ycNew/firstPageData",
		type : "post",
		async:false, 
		data : {
			"orgId" : '360000',
			"year" : $('#year').val(),
			"month" : $('#month').val(),
		},
		success : function(result) {
			if (result.success) {
				var info = result.value.econData;
				var countryPercentOrder='';
				var zyywsrOrder="";
				var lrOrder="";
				// console.log(info);
				if(info.gyzjz != undefined && info.gyzjz.value != "" && info.gyzjz.value != undefined && info.gyzjz.value != "0.00"){
					$("#gyzjzValue").text(info.gyzjz.value);
					$("#gyzjzValueUnit").show();
				}else{
					$("#gyzjzValue").text("未公布");
					$("#gyzjzValueUnit").hide();
				}
				if(info.gyzjz != undefined && info.gyzjz.percent != "" && info.gyzjz.percent != undefined){
					$("#gyzjzGrowth").text(info.gyzjz.percent);
					$("#gyzjzGrowthUnit").show();
				}else{
					$("#gyzjzGrowth").text("未公布");
					$("#gyzjzGrowthUnit").hide();
				}
				// if(info.gyzjz != undefined && info.gyzjz.percentOrder != "" && info.gyzjz.percentOrder != undefined){
				// 	$("#gyzjzRanking").text(info.gyzjz.percentOrder);
				// 	$("#gyzjzRankingUnit").show();
				// }
				if($('#year').val()==2017){
					var mon=$('#month').val()-2;
					countryPercentOrder=gyzjzOrder_country.list2017[mon];
				}else if ($('#year').val()==2018) {
					var mon=$('#month').val()-2;
					countryPercentOrder=gyzjzOrder_country.list2018[mon];
				}else{
					countryPercentOrder='';
				}
				if($('#year').val()==2017){
					var mon=$('#month').val()-2;
					zyywsrOrder=zyywsrOrder_country.list2017[mon];
				}else if ($('#year').val()==2018) {
					var mon=$('#month').val()-2;
					zyywsrOrder=zyywsrOrder_country.list2018[mon];
				}else{
					zyywsrOrder='';
				}
				if($('#year').val()==2017){
					var mon=$('#month').val()-2;
					lrOrder=lrOrder_country.list2017[mon];
				}else if ($('#year').val()==2018) {
					var mon=$('#month').val()-2;
					lrOrder=lrOrder_country.list2018[mon];
				}else{
					lrOrder='';
				}
				if(countryPercentOrder != "" && countryPercentOrder != undefined){
					$("#gyzjzRanking").text(countryPercentOrder);
					$("#gyzjzRankingUnit").show();
				}else{
					$("#gyzjzRanking").text("未公布");
					$("#gyzjzRankingUnit").hide();
				}
				
				if(info.lr != undefined && info.lr.value != "" && info.lr.value != undefined && info.lr.value != "0.00"){
					$("#lrValue").text(info.lr.value);
					$("#lrValueUnit").show();
				}else{
					$("#lrValue").text("未公布");
					$("#lrValueUnit").hide();
				}
				if(info.lr != undefined && info.lr.percent != "" && info.lr.percent != undefined){
					$("#lrGrowth").text(info.lr.percent);
					$("#lrGrowthUnit").show();
				}else{
					$("#lrGrowth").text("未公布");
					$("#lrGrowthUnit").hide();
				}
				// if(info.lr != undefined && info.lr.percentOrder != "" && info.lr.percentOrder != undefined){
				// 	$("#lrRanking").text(info.lr.percentOrder);
				// 	$("#lrRankingUnit").show();
				// }else{
				if(lrOrder != "" && lrOrder != undefined){
					$("#lrRanking").text(lrOrder);
					$("#lrRankingUnit").show();
				}else{
					$("#lrRanking").text("未公布");
					$("#lrRankingUnit").hide();
				}
				
				if(info.zyywsr != undefined && info.zyywsr.value != "" && info.zyywsr.value != undefined && info.zyywsr.value != "0.00"){
					$("#zyywsrValue").text(info.zyywsr.value);
					$("#zyywsrValueUnit").show();
				}else{
					$("#zyywsrValue").text("未公布");
					$("#zyywsrValueUnit").hide();
				}
				if(info.zyywsr != undefined && info.zyywsr.percent != "" && info.zyywsr.percent != undefined){
					$("#zyywsrGrowth").text(info.zyywsr.percent);
					$("#zyywsrGrowthUnit").show();
				}else{
					$("#zyywsrGrowth").text("未公布");
					$("#zyywsrGrowthUnit").hide();
				}
				// if(info.zyywsr != undefined && info.zyywsr.percentOrder != "" && info.zyywsr.percentOrder != undefined){
				// 	$("#zyywsrRanking").text(info.zyywsr.percentOrder);
				// 	$("#zyywsrRankingUnit").show();
				// }else{
				if(zyywsrOrder != "" && zyywsrOrder != undefined){
					$("#zyywsrRanking").text(zyywsrOrder);
					$("#zyywsrRankingUnit").show();
				}else{	
					$("#zyywsrRanking").text("未公布");
					$("#zyywsrRankingUnit").hide();
				}
				
				if($("#gyzjzCTab").hasClass("on")){
					// console.log(result.value.chart);
					barOption.legend.data = ["全国","江西省"];
					barOption.series[0].name = "全国";
					if($('#year').val()==2018){
						barOption.series[0].data = [7.2,6.8,6.9,6.9,6.7,6.6,6.5,6.4,6.4,6.3];
					}else if($('#year').val()==2017){
						barOption.series[0].data = [6.3,6.8,6.7,6.7,6.9,6.8,6.7,6.7,6.7,6.6,6.6];
					}else{
						barOption.series[0].data = [];
					}
					barOption.series[1].name = "江西省";
					barOption.series[1].data = result.value.chart.gyzjz_jx.percent;
					gyzjzChart();
				}else if($("#gyzjzRTab").hasClass("on")){
					barOption.legend.data = [$('#year').val(),($('#year').val()-1).toString()];
					barOption.series[0].name = $('#year').val();
					barOption.series[0].data = result.value.chart.gyzjz.percent;
					barOption.series[1].name = $('#year').val()-1;
					barOption.series[1].data = result.value.chart.gyzjz_last.percent;
					gyzjzChart();
				}else{}
				
				if($("#zyywsrTab").hasClass("on")){
					lineOption.series[0].data = result.value.chart.zyywsr.value;
					lineOption.series[1].data = result.value.chart.zyywsr.percent;
					zyywsrChart();
				}else if($("#lrTab").hasClass("on")){
					lineOption.series[0].data = result.value.chart.lr.value;
					lineOption.series[1].data = result.value.chart.lr.percent;
					lrChart();
				}else{}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getCityRanking(type){
	$.ajax({
		url : "${ctx}/interface/json/cityDataCenter/yc/sort",
		type : "post",
		async:false, 
		data : {
			"orgId" : '360000',
			"year" : $('#year').val(),
			"month" : $('#month').val(),
			"orderType" : type,
			"orderKind" : 2
		},
		success : function(result) {
			if (result.success) {
				$('#cityDataList').empty();
				var list = result.sortData;
				if(list.length>0){
		 			for (var i=0;i<list.length;i++){
						var info = list[i];
						var index = i+1;
					    var _div = "";
					    	
					    	_div += '<div class="cityDataItem">'
							_div += '	<div class="cityDataBox">'
						    _div += '		<span>'+index+'</span>'
						    _div +=	'		<font>'+info.name+'</font>'
						    _div += '	</div>'
						    _div += '	<div class="cityDataBox">'
						    if(info.value != undefined && info.value != "" && info.value != "0.00"){
						    	_div +=	'		<font class="yellowT">'+info.value+'</font>'
						    }else{
						    	_div +=	'		<font class="yellowT">未公布</font>'
						    }
						    _div += '	</div>'
					    	_div += '	<div class="cityDataBox">'
					    	if(info.percent != undefined && info.percent != ""){
					    		
					    		_div +=	'		<font class="whiteT">'+(info.percent==999999?'增亏':info.percent==-999999?'亏损':info.percent==-999998?'扭亏':info.percent==-999997?'减亏':info.percent)+'%</font>'
					    	}else{
					    		_div +=	'		<font class="whiteT">未公布</font>'
					    	}
						    _div += '	</div>'
						    _div += '</div>'
						$('#cityDataList').append(_div);
					} 

				}else{
					var _div = "<div id='noData'>暂无数据</div>";
					$('#cityDataList').append(_div);
				}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}

function gyzjzChart(){   //工业增加值增长速度
	if($("#gyzjzCTab").hasClass("on")){
		var chart1 = echarts.init(document.getElementById('chart4'));
	}else if($("#gyzjzRTab").hasClass("on")){
		var chart1 = echarts.init(document.getElementById('chart1'));
	}else{}
	
	chart1.setOption(barOption);
}
	// var 
	var barOption = {
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            type: 'shadow'
			},
	    },
	    legend: {
	        data: ['2018', '2017'],
	        align: 'right',
	        right: 10,
	        textStyle: {
	            color: "#fff"
	        },
	        itemWidth: 10,
	        itemHeight: 10,
	        itemGap: 35
	    },
	    grid: {
	    	top: '20%',
	    	left: '0%',
	        right: '0%',
	        bottom: '0%',
	        containLabel: true
	    },
	    xAxis: [{
	        type: 'category',
	        data: ['1-2月','1-3月','1-4月','1-5月','1-6月','1-7月','1-8月','1-9月','1-10月','1-11月 ','1-12月 '],
	        axisLine: {
	            lineStyle: {
	            	color: '#57617B'
	            }
	        },
	        axisTick: {
	            show: false,
	        },
	        axisLabel: {
	            show: true,
	            textStyle: {
	                color: "#00c7ff",
	            }
	        },
	    }],
	    yAxis: [{
	        type: 'value',
	        scale: true,
	        axisLabel: {
	            formatter: '{value}'
	        },
	        axisLine: {
	        	show : false,
				lineStyle: {
	                color: '#83adba'
	            }
	        },
	        axisTick: {
	            show: false,
	        },
	        splitLine: {
	            lineStyle: {
	            	color: '#57617B'
	            }
	        }
	    }],
	    series: [{
	        /* name: '2018',
	        type: 'bar',
	        data: [9.4, 9.6, 9.5, 9.5, 9.6, 9.7, 9.5, 9.5, 9.7, 9.6, 9.5],
	        barWidth: 10,
	        barGap: 1,
	        itemStyle: {
	            normal: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                    offset: 0,
	                    color: '#00da9c'
	                }, {
	                    offset: 1,
	                    color: '#007a55'
	                }]),
	                opacity: 1,
	            }
	        } */
	    
		    name: "2018",
	        type: "line",
	        symbolSize:10,
	        itemStyle: {
	            normal: {
	                color: "#df2229",
	            }
			},
	        data: [],
	    },{
	        /* name: '2017',
	        type: 'bar',
	        data: [9.6, 9.4, 9.6, 9.6, 9.4, 9.4, 9.4, 9.6, 9.8, 9.4, 9.5],
	        barWidth: 10,
	        barGap: 1,
	        itemStyle: {
	            normal: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                    offset: 0,
	                    color: '#c4e300'
	                }, {
	                    offset: 1,
	                    color: '#728400'
	                }]),
	                opacity: 1,
	            }
	        } */
		    name: "2018",
	        type: "line",
	        symbolSize:10,
	        itemStyle: {
	            normal: {
	                color: "#3F9BE4",
	            }
	        },
	        data: [],
	    }]
	};
function zyywsrChart() {  //主营业务收入完成情况
	var chart2 = echarts.init(document.getElementById('chart2'));
	chart2.setOption(lineOption);
}
function lrChart(){   //利润总额完成情况
	var chart3 = echarts.init(document.getElementById('chart3'));
	chart3.setOption(lineOption);
}
	var lineOption = {
	    tooltip: {
	        trigger: "axis",
	        axisPointer: {
	        	type: "shadow",
	            /* textStyle: {
	                color: "#fff"
	            } */
			},
			formatter:'{b}<br />'
			+'<span style=\"display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#3F9BE4;\"></span>'
			+'{a0}: {c0}亿元<br />'
			+'<span style=\"display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#df2229;\"></span>'
			+'{a1}: {c1}%'
	    },
	    grid: {
	    	top: '20%',
	    	left: '0%',
	        right: '0%',
	        bottom: '0%',
	        containLabel: true
	    },
	    legend: {
	        data: ['主营业务收入', '增长率'],
	        align: 'right',
	        right: 10,
	        textStyle: {
	            color: "#fff"
	        },
	        itemWidth: 10,
	        itemHeight: 10,
	        itemGap: 35
	    },
	    /* calculable: true, */
	    xAxis: [{
	        type: "category",
	        data: ['1-2月','1-3月','1-4月','1-5月','1-6月','1-7月','1-8月','1-9月','1-10月','1-11月 ','1-12月 '],
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

	        },
	    }],
	    yAxis: [{
	        type: "value",
	        axisLabel: {
	            formatter: '{value}'
	        },
	        axisLine: {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        splitLine: {
	            lineStyle: {
	            	color: '#57617B',
	                opacity:0
	            }
	        },
	        axisTick: {
	            show: false
	        },
	        axisLabel: {
	            interval: 0,

	        },
	        splitArea: {
	            show: false
	        },

	    },{
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}%'
	        },
	        axisLine: {
	            lineStyle: {
	                color: '#83adba'
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
	    }],
	    series: [{
	        name: "主营业务收入",
	        type: "bar",
	        stack: "总量",
	        barMaxWidth: 15,
	        barGap: "10%",
	        itemStyle: {
	        	normal: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                    offset: 0,
	                    color: '#2FA7E1'
	                }, {
	                    offset: 1,
	                    color: '#70E4F0'
	                }]),
	                opacity: 1,
	            }
	        },
	        data: [],
	    },{
	        name: "增长率",
	        type: "line",
	        yAxisIndex: 1,
	        symbolSize:10,
	        itemStyle: {
	            normal: {
	                color: "#df2229",
	            }
	        },
	        data: []
	    },]
	}
</script>
</html>