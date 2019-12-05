<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>宜春市工业大数据中心</title>
<link href="${ctx}/static/css/cityDataCenter/yc_bigDataCenter_iframe.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/organizationCountConfig.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts-liquidfill.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/noData.js"></script>
<style type="text/css">
.back-OR-UpArrow-icon {
	background:  no-repeat 5px 5px #CD0567;
}

.back-LB1-UpArrow-icon {
	background:  no-repeat 5px 5px #0793D1;
}
.chart_min_box1, .chart_min_box2 {
	float: right;
    height: calc(50% - 4px);
    height: -moz-calc(50% - 4px);
    height: -webkit-calc(50% - 4px);
    margin-left: 5px;
    width: calc(70% - 5px);
    width: -moz-calc(70% - 5px);
    width: -webkit-calc(70% - 5px);
}
.chart-bar {
    margin-left: 8px;
    width: calc(100% - 8px);
    width: -moz-calc(100% - 8px);
    width: -webkit-calc(100% - 8px);
}

.dataBar_3_left {
    float: left;
    background-color: rgba(0,0,0,0.3);
    width: calc(30% - 5px);
    width: -moz-calc(30% - 5px);
    width: -webkit-calc(30% - 5px);
    /* margin-right: 1%;
    margin-bottom: 1%; */
    height: 100%;
   /*  height: calc(100% - 4px);
    height: -moz-calc(100% - 4px);
    height: -webkit-calc(100% - 4px); */
}
.dataContTitleBar {
    position: relative;
    padding: 5px 15px;
    background: url(../../../static/image/dataCenter/transparent.png) repeat-x;
}
.dataContTitle {
    font-size: 16px;
}
.greenFontControl {
    color: #1f5d91;
    position: absolute;
    right: 5px;
    top: 7px;
}
.dataBar_3_left table tr td {
    white-space: nowrap;
    vertical-align: middle;
}
.tdNum {
    width: 10%;
    padding-left: 15px!important;
    text-align: center;
    filter: alpha(opacity=50);
    -moz-opacity: 0.5;
    -khtml-opacity: 0.5;
    opacity: 0.5;
}
.tdImg {
    width: 5%;
}
.tdEnterprise {
    width: 25%;
}
.tdValue {
    width: 30%;
    padding-right: 15px!important;
    text-align: right;
}
.tdValue1 {
    text-align: left;
    padding-left:4px;
}
.greenFont {
    color: #1f5d91;
}
.dataBar_3_left table {
    width: 100%;
    font-size: 12px;
}
</style>
</head>
<body>
	<div class="data_main">
		<form action="" method="post" id="form">
			<input type="hidden" id="orgId" name="orgId" value="${orgId}">
			<input type="hidden" id="areaId" name="areaId" value="${areaId}">
			<input type="hidden" id="areaName" name="areaName" value="${areaName}">
			<input type="hidden" id="year" name="year" value="${searchInfo.year}">
			<input type="hidden" id="month" name="month" value="${searchInfo.month}">
		</form>
		<div class="data_header">
			<div style="color: #000;font-size: 20px;margin-left: 10px;">
				大数据中心
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
		</div>
		<div class="data_content" style="margin-top: 2%;">
			<div class="dataIncrease_box">
				<div class="increase_county_box1">
					<div class="addValCounty-Growth backColor-MGreen" style="cursor: pointer;" onclick="loadSortData('gyzjz', '1')">
						<div class="addValCounty-Growth-title">工业增加值</div>
						<div class="addValCounty-Growth-val color-yellow">
							<font class="addValCounty-Growth-val-num" id="gyzjz_value"></font><span id="gyzjz_unit">亿元</span>
						</div>
					</div>
					<div class="anAddValCounty backColor-MGreen" style="cursor: pointer;" onclick="loadSortData('gyzjz', '2')">
						<div class="anAddValCounty-title">同比增长</div>
						<div class="anAddValCounty-val color-yellow">
							<font class="color-yellow" id="gyzjz_percent"></font>
						</div>
					</div>
					<div class="sortCounty-pro backColor-MGreen" style="cursor: pointer;" onclick="loadSortData('gyzjz', '2')">
						<div class="sortCounty-pro-title">增幅全市排名</div>
						<div class="sortCounty-pro-val color-yellow">
							<font class="sortCounty-pro-val-num" id="gyzjz_percent_order"></font>名
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="increase_county_box2">
					<div class="addValCounty-Growth backColor-ORed" style="cursor: pointer;" onclick="loadSortData('zyywsr', '1')">
						<div class="addValCounty-Growth-title">主营业务收入</div>
						<div class="addValCounty-Growth-val color-yellow">
							<font class="addValCounty-Growth-val-num" id="zyywsr_value"></font><span id="zyywsr_unit">亿元</span>
						</div>
					</div>
					<div class="anAddValCounty-sortPro back-OR-UpArrow-icon" style="cursor: pointer;" onclick="loadSortData('zyywsr', '2')">
						<div class="anAddValCounty-sortPro-title">同比增长</div>
						<div class="anAddValCounty-sortPro-val color-yellow">
							<font class="color-yellow" id="zyywsr_percent"></font>
						</div>
						<div class="proAddTitle">全省增长</div>
						<div class="proAddVal color-yellow">
							<font class="color-yellow" id="p_zyywsr"></font>
						</div>
					</div>
					<div class="sortCounty-pro2 backColor-ORed" style="cursor: pointer;" onclick="loadSortData('zyywsr', '2')">
						<div class="sortCounty-pro2-title">增幅全市排名</div>
						<div class="sortCounty-pro-val color-yellow">
							<font class="sortCounty-pro-val-num" id="zyywsr_percent_order"></font>名
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="increase_county_box3">
					<div class="addValCounty-Growth backColor-LBlue1" style="cursor: pointer;" onclick="loadSortData('lr', '1')">
						<div class="addValCounty-Growth-title">利润总额</div>
						<div class="addValCounty-Growth-val color-yellow">
							<font class="addValCounty-Growth-val-num" id="lr_value"></font><span id="lr_unit">亿元</span>
						</div>
					</div>
					<div class="anAddValCounty-sortPro back-LB1-UpArrow-icon" style="cursor: pointer;" onclick="loadSortData('lr', '2')">
						<div class="anAddValCounty-sortPro-title">同比增长</div>
						<div class="anAddValCounty-sortPro-val color-yellow">
							<font class="color-yellow" id="lr_percent"></font>
						</div>
						<div class="proAddTitle">全省增长</div>
						<div class="proAddVal color-yellow">
							<font class="color-yellow" id="p_lr"></font>
						</div>
					</div>
					<div class="sortCounty-pro2 backColor-LBlue1" style="cursor: pointer;" onclick="loadSortData('lr', '2')">
						<div class="sortCounty-pro2-title">增幅全市排名</div>
						<div class="sortCounty-pro-val color-yellow">
							<font class="sortCounty-pro-val-num" id="lr_percent_order"></font>名
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="increase_county_box4">
					<div class="addValCounty-Growth backColor-DCyan">
						<div class="addValCounty-Growth-title">工业投资</div>
						<div class="addValCounty-Growth-val color-yellow">
							<font class="addValCounty-Growth-val-num" id="gygdzctze_value"></font><span id="gygdzctze_unit">亿元</span>
						</div>
					</div>
					<div class="anAddValCounty backColor-DCyan">
						<div class="anAddValCounty-title">同比增长</div>
						<div class="anAddValCounty-val color-yellow">
							<font class="color-yellow" id="gygdzctze_percent"></font>
						</div>
					</div>
					<div class="sortCounty-pro backColor-DCyan">
						<div class="sortCounty-pro-title">增幅全市排名</div>
						<div class="sortCounty-pro-val color-yellow">
							<font class="sortCounty-pro-val-num" id="gygdzctze_percent_order"></font>名
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="increase_county_box5">
					<div class="addValCounty-Growth backColor-YBrown">
						<div class="addValCounty-Growth-title">工业用电</div>
						<div class="addValCounty-Growth-val color-yellow">
							<font class="addValCounty-Growth-val-num" id="gyydl_value"></font><span id="gygdzctze_unit">万千瓦时</span>
						</div>
					</div>
					<div class="anAddValCounty backColor-YBrown">
						<div class="anAddValCounty-title">同比增长</div>
						<div class="anAddValCounty-val color-yellow">
							<font class="color-yellow" id="gyydl_percent"></font>
						</div>
					</div>
					<div class="sortCounty-pro backColor-YBrown">
						<div class="sortCounty-pro-title">增幅全市排名</div>
						<div class="sortCounty-pro-val color-yellow">
							<font class="sortCounty-pro-val-num" id="gyydl_percent_order"></font>名
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="dataChart_box">
				<div class="chart_box1">
					<div class="chart-view">
						<div class="chart-title" style="font-size: 22px;">
							<font id="area"> </font>&nbsp;&nbsp;
						</div>
						<div class="chart-map" id="map"></div>
						<div style="position: absolute; bottom:5%; left:25%; z-index: 1;" id="backBtn">
							<a href="javascript:window.location.href='${ctx}/front/cityDataCenter/indexIframe/1?orgId=${orgId}'" style="cursor: pointer;color: #000;text-decoration: underline;" >宜春市</a>
						</div>
					</div>
				</div>
				<div class="chart_box2">
					<div class="dataBar_3_left" id="sortListdiv" style="background-color:#fff;color: #000;">
						<div class="dataContTitleBar">
							<span class="dataContTitle" style="display:block;float:left;width:30%;">按市排名</span>
							<span id="sortName" class="dataContTitle" style="display:block;float:left;width:52%;text-align: center;">工业增加值</span>
							<span class="greenFontControl">同比增长</span>
							<div class="clear"></div>
						</div>
						<table class="table table-striped table-hover" id="sortList" style="height: 380px;">
						</table>
					</div>
					<div class="chart_min_box1">
						<div class="chart-bar" id="bar1"></div>
						<div class="clear"></div>
					</div>
					<div class="chart_min_box2">
						<div class="chart-bar" id="bar2"></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#btnYear").click(function() {
			var div = $("#yearMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		$("#btnmonth").click(function() {
			var div = $("#monthMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		loadData();
		loadSortData('gyzjz', 2);
		$("#sortList").height($("#sortListdiv").outerHeight(true)-35);
	})
	
	function loadSortData(orderType, orderKind){
		var year = $("#year").val();
		var month = $("#month").val();
		
		var sortName = "";
		if(orderType=="gyzjz"){
			sortName = "工业增加值";
		}else if(orderType=="zyywsr"){
			sortName = "主营业务收入";
		}else if(orderType=="lr"){
			sortName = "利润总额";
		}
		
		$("#sortName").text(sortName);
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/yc/sort",
			type : "post",
			data : {
				"orgId" : "360900",
				"year" : year,
				"month" : month,
				"orderType" : orderType,
				"orderKind" : orderKind
			},
			success : function(result) {
				if (result.success) {
					$("#sortList").empty();
					for(var i=0;i<result.sortData.length;i++){
						var info = result.sortData[i];
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
						
						_div += ' <td class="tdEnterprise">'+info.name+'</td>'
							+' <td class="tdValue1" style="text-align: center;"><font class="greenFont">'+(info.value==''?'未公布':(info.value+"&nbsp;亿元"))+'</font></td>'
							+' <td class="tdValue"><font class="greenFont">'+(info.percent==''?'':(info.percent+"%"))+'</font></td>'
							+' </tr>';
						
						$("#sortList").append(_div);
					} 
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}

		})
	}
	
	
	function loadData() {
		var orgId = $("#orgId").val();
		var areaId = $("#areaId").val();
		var year = $("#year").val();
		var month = $("#month").val();
		
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/yc/secondPageData",
			type : "post",
			data : {
				"orgId" : orgId,
				"areaId" : areaId,
				"year" : year,
				"month" : month
			},
			success : function(result) {
				if (result.success) {
					/* 经济运行数据 */
					loadData1(result.secondPageData.econData);
					/* 宜春市地图 */
					loadData2();
					/* 全市用电 */
					loadData3(result.secondPageData.gyydlAreaData);
					/* 县用电 */
					loadData4(result.secondPageData.gyydlSpaceData);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}

		});
	}
	/*按年份搜索*/
	function selectByYear(year) {
		$("#yearMenu").slideUp("fast");
		$("#yearText").text(year + "年");
		$("#year").val(year);
		loadData();
		loadSortData("gyzjz", 2)
	}

	/*按月搜索*/
	function selectByMonth(month) {
		$("#monthMenu").slideUp("fast");
		$("#monthText").text(month + "月");
		$("#month").val(month);
		loadData();
		loadSortData("gyzjz", 2)
	}
	
	function loadData1(econData) {
	 	var index = [ "gyzjz", "zyywsr", "lr", "gygdzctze", "gyydl"];
		if (!$.isEmptyObject(econData)) {
			$("#p_zyywsr").text(econData.p_zyywsr + "%");
			$("#p_lr").text(econData.p_lr + "%");
			for (var i = 0; i < index.length; i++) {
				var value = econData[index[i]]
				if(value.value!=""&&value.value>0){					
					$("#" + index[i] + "_value").text(value.value);
				}else{
					$("#" + index[i] + "_value").text("未公布");
					$("#" + index[i] + "_unit").hide();
				}
				
				if(value.percent!=""&&value.percent>0){
					$("#" + index[i] + "_percent").text(value.percent + "%");
				}else{
					$("#" + index[i] + "_percent").text("");
				}
				
				$("#" + index[i] + "_percent_order").text(value.percentOrder);
			}
		} else {
			for (var i = 0; i < index.length; i++) {
				var value = econData[index[i]]
				$("#" + index[i] + "_value").text("");
				$("#" + index[i] + "_percent").text("");
				$("#" + index[i] + "_target").text("");
				$("#" + index[i] + "_sys_target").text("");
				$("#" + index[i] + "_value_order").text("");
				$("#" + index[i] + "_percent_order").text("");
			}
		} 

	}
	var count = 0;
	function loadData2(mapData) {
		var mapType = [];
		var cityMap = {
			"袁州区" : "360902",
			"奉新县" : "360921",
			"万载县" : "360922",
			"上高县" : "360923",
			"宜丰县" : "360924",
			"靖安县" : "360925",
			"铜鼓县" : "360926",
			"丰城市" : "360981",
			"樟树市" : "360982",
			"高安市" : "360983"
		};

		for ( var city in cityMap) {
			mapType.push(city);
		}
		var geoCoordMap = {
			'袁州区' : [ 114.38, 27.8 ],
			'奉新县' : [ 115.38, 28.7 ],
			'万载县' : [ 114.43, 28.12 ],
			'上高县' : [ 114.92, 28.23 ],
			'宜丰县' : [ 114.78, 28.38 ],
			'靖安县' : [ 115.35, 28.87 ],
			'铜鼓县' : [ 114.37, 28.53 ],
			'丰城市' : [ 115.78, 28.2 ],
			'樟树市' : [ 115.53, 28.07 ],
			'高安市' : [ 115.37, 28.42 ]
		}
		var data = [ 
			{name : '袁州区', value : 0}, 
			{name : '奉新县', value : 0}, 
			{name : '万载县', value : 0}, 
			{name : '上高县', value : 0}, 
			{name : '宜丰县', value : 0}, 
			{name : '靖安县', value : 0}, 
			{name : '铜鼓县', value : 0}, 
			{name : '丰城市', value : 0}, 
			{name : '樟树市', value : 0}, 
			{name : '高安市', value : 0} 
		]
		
		//这里是生成series的数据，将经纬度和value值映射起来
		var convertData = function(data) {
			var res = [];
			if (data != null && data != "") {
				for (var i = 0; i < data.length; i++) {
					var geoCoord = geoCoordMap[data[i].name];
					if (geoCoord) {
						res.push({
							name : data[i].name,
							value : geoCoord.concat(data[i].value)
						});
					}
				}
			}
			return res;
		};
		var mapChart = ""
		$.get('${ctx}/static/map/360900.json', function(chinaJson) {
			if(count==0){
				echarts.registerMap('360900', chinaJson);
				var mapChart = echarts.init(document.getElementById('map'));
				
				var newData = new Array();
				var areaId = $("#areaId").val();
				
				$("#area").text(getAreaNameByAreaId(areaId)+"主要经济指标");
				
				for(var i=0;i<data.length;i++){
					var info = data[i];
					if(cityMap[info.name]==areaId){
						newData.push({
							name:info.name,
							value:info.value,
							selected:true
						});
					}else{
						newData.push({
							name:info.name,
							value:info.value,
							selected:false
						});
					}
				}
				
				mapOption.series[0].data = convertData(data);
				mapOption.series[1].data = newData;
				mapOption.series[2].data = convertData(data);
				
				mapChart.setOption(mapOption);
				count ++ ;
				
				mapChart.on('mapselectchanged', function (param){
					var cityName = param.name;
					var flag = false;
					for (var i = 0; i < mapType.length; i++) {
						if (cityName == mapType[i]) {
							flag = true;
							break;
						}
					}
					if (flag) {
						$("#areaId").val(cityMap[cityName]);
						$("#areaName").val(cityName);
						$("#area").text(cityName+"主要经济指标");
						loadData();
					}
		        });
			}
			
		});
	}


	function loadData3(gyydlAreaData) {
		var chart = echarts.init(document.getElementById('bar1'));
		if(!$.isEmptyObject(gyydlAreaData)){
			barOption.title.text = "宜春市各市县区用电情况（单位：万千瓦时）";
			var lineName = ["总量","同比增长"];
			var lineLegend = {
					top:5,
					right:'2%',
					selected:{'总量':true,'同比增长':false},
			        data:[
						{name:'总量'},
						{name:'同比增长'}
					]
			};
			var itemStyle = [{
            	normal: {
            		color: '#c23430'
            	}
            },{
            	normal: {
            		color: '#4c93f6'
            	}
            },{
            	normal: {
            		color: '#e4aa0d'
            	}
            }];
			barOption.legend = lineLegend;
			barOption.xAxis[0].data = gyydlAreaData.xAxis;
			barOption.xAxis[0].boundaryGap = true;
			var series = [];
			for (var i = 0; i < gyydlAreaData.series.length; i++) {
				var seriesIndex = {
					name : lineName[i],
					type : "bar",
					barWidth : '25%',
					yAxisIndex : i,
					lineStyle : lineStyle[i],
					data : gyydlAreaData.series[i],
					markPoint : markPoint[0],
					itemStyle : itemStyle[i]
				};
				series.push(seriesIndex);
				
			}
			barOption.series = series;
			chart.setOption(barOption);
		}else{
			chart.setOption(noDataOption);
		}
	}

	
	function loadData4(gyydlSpaceData) {
		var chart = echarts.init(document.getElementById('bar2'));
		if (!$.isEmptyObject(gyydlSpaceData)) {
			var areaId =$("#areaId").val();
			barOption.title.text = getAreaNameByAreaId(areaId)+"用电情况（单位：万千瓦时）";
			var lineName = ["总量", "同比增长"];
			var lineLegend = {
					top:5,
					right:'2%',
					selected:{'总量':true,'同比增长':false},
			        data:[
						{name:'总量'},
						{name:'同比增长'}
					]
			};
			var itemStyle = [{
            	normal: {
            		color: '#c23430'
            	}
            },{
            	normal: {
            		color: '#4c93f6'
            	}
            },{
            	normal: {
            		color: '#e4aa0d'
            	}
            }];
			barOption.legend = lineLegend;
			barOption.xAxis[0].data = gyydlSpaceData.xAxis;
			barOption.xAxis[0].boundaryGap = true;
			var series = [];
			for (var i = 0; i < gyydlSpaceData.series.length; i++) {
				var seriesIndex = {
					name : lineName[i],
					type : 'bar',
					barWidth : '35%',
					yAxisIndex : i,
					lineStyle : lineStyle[i],
					data : gyydlSpaceData.series[i],
					markPoint : markPoint[0],
					itemStyle : itemStyle[i]
				};
				series.push(seriesIndex);
				
			}
			barOption.series = series;
			chart.setOption(barOption);
			
		}else{
			chart.setOption(noDataOption);
		}
	}
	
	
	function getAreaNameByAreaId(areaId){
		var cityArr = [
			{name:"袁州区",value:"360902"},
			{name:"奉新县",value:"360921"},
			{name:"万载县",value:"360922"},
			{name:"上高县",value:"360923"},
			{name:"宜丰县",value:"360924"},
			{name:"靖安县",value:"360925"},
			{name:"铜鼓县",value:"360926"},
			{name:"丰城市",value:"360981"},
			{name:"樟树市",value:"360982"},
			{name:"高安市",value:"360983"}
		];
		var areaName = "";
		for(var i=0;i<10;i++){
			if(cityArr[i].value==areaId){
				areaName = cityArr[i].name;
				break;
			}
		}
		return areaName;
	}
	
	/*折线图配置*/
	var barOption = {
			backgroundColor : '#fff',
			title : {
				text : '',
				textStyle : {
					color : "#0793D1",
					fontSize : 14,
				},
				left : 5,
				top : 5
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {},
			grid : {
				bottom : '5%',
				left : '4%',
				width : '95%',
				right : '5%',
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
		        name: '同比增长（%）',
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
		    } ],
			series : []
		};
	
	/*地图配置*/
	var mapOption = {
		tooltip : {
			trigger : 'item',
			formatter : '{b}'
		},
		visualMap : {
			show : false,
			left : 'left',
			top : 'bottom',
			text : [ '高', '低' ], // 文本，默认为数值文本
			calculable : true,
			seriesIndex : [ 1 ],
			inRange : {
				color : [ 'rgb(247,218,0)']
			}
		},
		geo : {
			show : true,
			map : '360900',
			zoom : 1.25,
			selectedMode: 'single', 
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
			type : 'scatter',
			coordinateSystem : 'geo',
			data : [],
		}, {
			/* type : 'map',
			geoIndex : 0,
			data : [] */
        	type: 'map',
            mapType:'360900',
            roam : false,
            zoom : 1.25,
            selectedMode: 'single', 
            label : {
				normal : {
					show : false,
				},
				emphasis : {
					show : false,
				}
			},
			itemStyle:{
            	hoverAnimation:false,
    	        normal: {
    	            borderColor: '#FFF'
    	        },
    		    emphasis: {
    		       	areaColor: '#A6C5BD',
    		       	borderColor: '#FFF',
    		        opacity:1
    		    }
            },
            showLegendSymbol:false,
            data:[]
		}, {
			type : 'effectScatter',
			coordinateSystem : 'geo',
			data : [],
			symbolSize : function(val) {
				return 10;
			},
			showEffectOn : 'render',
			rippleEffect : {
				scale : 5,
				brushType : 'stroke'
			},
			hoverAnimation : true,
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
                	color: '#FD7610',
                    borderColor: '#FD7610',
                    label:{
                    	show:true,
                    	textStyle:{
                    		color:'#000'
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
                    		color:'#000'
                    	}
                    }
                }
            },
			zlevel : 1
		} ]
	};
	var markPoint = [
		{
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
            }
        }
	];	
</script>
</html>
