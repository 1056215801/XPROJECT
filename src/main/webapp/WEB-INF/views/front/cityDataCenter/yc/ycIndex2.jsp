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
    color: #7DFC00;
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
    color: #7DFC00;
}
.dataBar_3_left table {
    width: 100%;
    font-size: 12px;
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
			<input type="hidden" id="areaId" name="areaId" value="${areaId}">
			<input type="hidden" id="areaName" name="areaName" value="${areaName}">
			<input type="hidden" id="year" name="year" value="${searchInfo.year}">
			<input type="hidden" id="month" name="month" value="${searchInfo.month}">
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
							<font class="sortCounty-pro-val-num" id="gyzjz_percent_order"></font>&nbsp;<font id="gyzjz_order_unit">名</font>
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
							<font class="sortCounty-pro-val-num" id="zyywsr_percent_order"></font>&nbsp;<font id="zyywsr_order_unit">名</font>
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
							<font class="sortCounty-pro-val-num" id="lr_percent_order"></font>&nbsp;<font id="lr_order_unit">名</font>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="increase_county_box4">
					<div class="addValCounty-Growth backColor-DCyan">
						<div class="addValCounty-Growth-title">工业投资</div>
						<div class="addValCounty-Growth-val color-yellow">
							<font class="addValCounty-Growth-val-num" id="gytz_value"></font><span id="gytz_unit">亿元</span>
						</div>
					</div>
					<div class="anAddValCounty backColor-DCyan">
						<div class="anAddValCounty-title">同比增长</div>
						<div class="anAddValCounty-val color-yellow">
							<font class="color-yellow" id="gytz_percent"></font>
						</div>
					</div>
					<div class="sortCounty-pro backColor-DCyan">
						<div class="sortCounty-pro-title">增幅全市排名</div>
						<div class="sortCounty-pro-val color-yellow">
							<font class="sortCounty-pro-val-num" id="gytz_percent_order"></font>&nbsp;<font id="gytz_order_unit">名</font>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="increase_county_box5">
					<div class="addValCounty-Growth backColor-YBrown">
						<div class="addValCounty-Growth-title">工业用电</div>
						<div class="addValCounty-Growth-val color-yellow">
							<font class="addValCounty-Growth-val-num" id="gyydl_value"></font><span id="gyydl_unit">万千瓦时</span>
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
							<font class="sortCounty-pro-val-num" id="gyydl_percent_order"></font>&nbsp;<font id="gyydl_order_unit">名</font>
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
							<a href="javascript:void(0)" onclick="toYc()" style="cursor: pointer;color: yellow;text-decoration: underline;" >宜春市</a>
						</div>
					</div>
				</div>
				<div class="chart_box2">
					<div class="dataBar_3_left">
						<div class="dataContTitleBar">
							<span class="dataContTitle" style="display:block;float:left;width:30%;">按市排名</span>
							<span id="sortName" class="dataContTitle" style="display:block;float:left;width:52%;text-align: center;">工业增加值</span>
							<span class="greenFontControl">同比增长</span>
							<div class="clear"></div>
						</div>
						<table id="sortList" style="height: 380px;">
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
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/cityDataCenter/index/9?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/cityDataCenter/index/4?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}">
	
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
		$("#btnmonth").click(function() {
			var div = $("#monthMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});

		loadData();
		/*页面定时跳转事件*/
		initScreenSaver();
		
		loadSortData('gyzjz', 2);
	})
	/*按年份搜索*/
	function selectByYear(year) {
		$("#yearMenu").slideUp("fast");
		$("#yearText").text(year + "年");
		$("#year").val(year);
		loadData();
		loadSortData("gyzjz", 2);
	}

	/*按月搜索*/
	function selectByMonth(month) {
		$("#monthMenu").slideUp("fast");
		$("#monthText").text(month + "月");
		$("#month").val(month);
		loadData();
		loadSortData("gyzjz", 2)
	}
	
	function toYc(){
		var year = $("#year").val();
		var month = $("#month").val();
		window.location.href='${ctx}/front/cityDataCenter/index/1?orgId=${orgId}&year='+year+'&month='+month;
	}
	
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
						
						var percent = info.percent;
						if(percent==999999){
							percent = '增亏';
						}else if(percent==-999999){
							percent = '亏损';
						}else if(percent==-999998){
							percent = '扭亏';
						}else if(percent==-999997){
							percent = '减亏';
						}else{
							percent = (info.percent==''?'':(info.percent+"%"));
						}
						
						_div += ' <td class="tdEnterprise">'+info.name+'</td>'
							+' <td class="tdValue1" style="text-align: center;"><font class="greenFont">'+(info.value==''?'未公布':(info.value+"&nbsp;亿元"))+'</font></td>'
							+' <td class="tdValue"><font class="greenFont">'+percent+'</font></td>'
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

	function loadData1(econData) {
	 	var index = [ "gyzjz", "zyywsr", "lr", "gytz", "gyydl"];
	 	if (!$.isEmptyObject(econData)) {
			$("#p_zyywsr").text(econData.p_zyywsr == undefined?'未公布':(econData.p_zyywsr + '%') );
			$("#p_lr").text(econData.p_lr == undefined?'未公布':(econData.p_lr + '%'));
			for (var i = 0; i < index.length; i++) {
				var value = econData[index[i]];
				if(value!=undefined){
					if(value.value!=undefined && value.value!=""){					
						$("#" + index[i] + "_value").text(value.value);
						$("#" + index[i] + "_unit").show();
					}else{
						$("#" + index[i] + "_value").text("未公布");
						$("#" + index[i] + "_unit").hide();
					}
					
					if(value.percent!=undefined){
						var percent = value.percent;
						if(percent==999999){
							percent = '增亏';
						}else if(percent==-999999){
							percent = '亏损';
						}else if(percent==-999998){
							percent = '扭亏';
						}else if(percent==-999997){
							percent = '减亏';
						}else{
							percent = (value.percent==''?'':(value.percent+"%"));
						}
						$("#" + index[i] + "_percent").text(percent);
					}else{
						$("#" + index[i] + "_percent").html("<font style='font-size:12px;'>未公布</font>");
					}
					
					if(value.percentOrder!=undefined && value.percentOrder!=""){
						$("#" + index[i] + "_percent_order").text(value.percentOrder);
						$("#" + index[i] + "_order_unit").show();
					}else{
						$("#" + index[i] + "_percent_order").html("<font style='font-size:12px;'>未公布</font>");
						$("#" + index[i] + "_order_unit").hide();
					}
				}else{
					$("#" + index[i] + "_value").text("未公布");
					$("#" + index[i] + "_unit").hide();
					
					$("#" + index[i] + "_percent").html("<font style='font-size:12px;'>未公布</font>");
					
					$("#" + index[i] + "_percent_order").html("<font style='font-size:12px;'>未公布</font>");
					$("#" + index[i] + "_order_unit").hide();
				}
			}
		} else {
			for (var i = 0; i < index.length; i++) {
				$("#" + index[i] + "_value").text("未公布");
				$("#" + index[i] + "_unit").hide();
				
				$("#" + index[i] + "_percent").html("<font style='font-size:12px;'>未公布</font>");
				
				$("#" + index[i] + "_percent_order").html("<font style='font-size:12px;'>未公布</font>");
				$("#" + index[i] + "_order_unit").hide();
				
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
						{name:'总量',textStyle:{color:"#FCFF00"}},
						{name:'同比增长',textStyle:{color:"#FCFF00"}}
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
					markPoint : markPoint[i],
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
						{name:'总量',textStyle:{color:"#FCFF00"}},
						{name:'同比增长',textStyle:{color:"#FCFF00"}}
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
					markPoint : markPoint[i],
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
				color : [ '#0A3A6A', '#302b63', '#24243e' ]
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
                 	color: '#05C3F9',
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
			zlevel : 1
		} ]
	};
	
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/cityDataCenter/index/9?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/cityDataCenter/index/9?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
</script>
</html>
