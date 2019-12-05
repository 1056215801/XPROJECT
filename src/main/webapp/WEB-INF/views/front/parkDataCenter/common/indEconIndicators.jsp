<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>产业经济指标</title>
<link href="${ctx}/static/css/parkDataCenter/yy_bigDataCenter.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/plugins/iCheck/custom.css" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<style>
.icheckbox_square-green, .iradio_square-green {
	background: url(${ctx}/static/img/green_0.png) no-repeat;
}

.btn_set {
	padding: 5px;
	display: block;
	height: 25px;
	width: auto;
	border: 1px solid #BAEDFF;
	border-radius: 5px;
	float: left;
	margin-top: 12px;
	line-height: 17px;
	background-color: #3773B2;
	cursor: pointer;
	margin-left: 10px;
}

.btn_set:hover {
	border: 1px solid #6DCCF6;
	background-color: #6DCCF6;
}

.btn_confirm {
	padding: 5px;
	display: block;
	height: 25px;
	width: auto;
	border: 1px solid #BAEDFF;
	border-radius: 5px;
	float: right;
	margin-top: 12px;
	line-height: 17px;
	background-color: #3773B2;
	cursor: pointer;
}

.btn_confirm:hover {
	border: 1px solid #6DCCF6;
	background-color: #6DCCF6;
}

/* .dataBar_4_left {
	width: 100%;height: 100%;
}

.dataBar_3_top, .dataBar_3_btm, .dataBar_3_center {
	height: 33%;
	margin-bottom: 1%;
} */

.echarts-title {
	width: auto;
	border: 1px solid #6FBBDF;
	border-bottom: none;
	padding-top: 1.5%;
	padding-left: 5px;
	padding-right: 5px;
	color: #FFFFFF;
}

.echarts-title1 {
	width: auto;
	border: 1px solid #0071B5;
	border-bottom: none;
	padding-top: 1.5%;
	padding-left: 5px;
	padding-right: 5px;
	font-weight: bold;
	color: #FCFF00;
}
.data_header {
    height: 79px;
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
</style>

<script type="text/javascript">
	/* function fnDate() {
		var oDiv = document.getElementById("dateBar");
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth();
		var data = date.getDate();
		var hours = date.getHours();
		var minute = date.getMinutes();
		var second = date.getSeconds();
		var time = "<span style='font-size:14px;'>" + year + "年"
				+ fnW((month + 1)) + "月" + fnW(data)
				+ "日</span><br /><span style='font-size:26px;'>" + fnW(hours)
				+ ":" + fnW(minute) + ":" + fnW(second) + "</span>";
		oDiv.innerHTML = time;
	} */
	function fnW(str) {
		str > 9 ? num = str : num = "0" + str;
		return num;
	}
	function setTime(){
		var date = new Date();
		var localDate = date.getFullYear() + "年" + (date.getMonth()+1) + "月" + date.getDate() + "日";
		var localSec = date.getSeconds();
		if(localSec<10) { localSec = "0"+localSec} else{ localSec = date.getSeconds()};
		var localTime = date.getHours() + ":" + date.getMinutes() + ':' + localSec;
		$(".local-date p").text(localDate);
		$(".local-date h1").text(localTime);
	};
	$(function() {
		setTime();
		setInterval(setTime,1000)
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
		
	})

	function setNorm() {
		$("#set_btn").hide();
		$("#norm").show();
	}
</script>
</head>

<body>
	<div class="data_main">
		<form action="" method="post" id="form">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			<input type="hidden" id="orgId" name="orgId" value="${orgId}" /> 
			<input type="hidden" id="year" name="year" value="${year}" />
			<input type="hidden" id="indIndexCode" name="indIndexCode" value="${configInfo.indIndexCode}" /> 
			<input type="hidden" id="indIndexName" value="${configInfo.indIndexName}" />
		</form>
		<input type="hidden" id="oldYear" value="${year}" />
		<div class="data_header">
			<%-- <div style="float: left; margin-left: 25%;">
				<img src="${configInfo.imageUrl}" style="margin-top: 3%;" height="42px">
			</div>
			<div style="float: left; color: #6DCCF6; border-left: 1px solid #6DCCF6; margin-top: 8px; padding-left: 15px; height: 60px;" id="dateBar" class="dateBar"></div> --%>
			<!-- <div style=""> -->
				<img src="${configInfo.imageUrl}" height="42px">
			<!-- </div> -->
			<div class="local-date">
				<p>2017年7月20号</p>
				<h1>14:20:50</h1>
			</div>
			
			<div style="position: absolute;right: 2%;margin-right: 2%;margin-top: 2%;">
				<button id="btnYear" class="dropdownButton" type="button">
					<span id="yearText">${year}年</span><span class="caret"></span>
				</button>
				<ul id="yearMenu" class="dropdownMenu">
					<c:if test="${year>=2018}">
						<c:forEach varStatus="k" begin="2018" end ="${year}">
							<%-- <li><a href="javascript:;" onclick="selectByYear('${k.index}')">${k.index}年</a></li> --%>
							<li><a href="javascript:;" onclick="selectByYear('${year-k.index+2018}')">${year-k.index+2018}年</a></li>
						</c:forEach>
					</c:if>
					<li><a href="javascript:;" onclick="selectByYear('2017')">2017年</a></li>
					<li><a href="javascript:;" onclick="selectByYear('2016')">2016年</a></li>
					<li><a href="javascript:;" onclick="selectByYear('2015')">2015年</a></li>
				</ul>
			</div>
		</div>
		<c:choose>
			<c:when test="${typeSize < 5}">
				<div class="data_content">
					<div style="width: 100%; height: 10%; line-height: 50px; float: left;">
						<div style="background-color: #AFE7FE; width: 3px; height: 20px; float: left; margin-top: 15px;"></div>
						<span style="float: left; margin-left: 10px; font-size: 22px; color: #AFE7FE;">产业经济指标</span>
						<div id="norm" style="float: left; margin-left: 10px; font-size: 12px; color: #FFFFFF; height: 95%; width: auto; display: none;"></div>
						<span id="set_btn" class="btn_set" onclick="setNorm();"> 
							<img src="${ctx}/static/img/set.png" style="margin-top: -4px;" />&nbsp;指标设置
						</span>
					</div>

					<div style="width: 100%; height: 88%; float: left;">
						<div style="width: 33.7%; height: 92%; float: right; margin-top: 3.3%;">
							<div class="data_contentLeft" style="width: 98%; height: 100%; margin-left: 2%;">
								<div class="dataBar_3_top" id="part4" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_3_btm" id="part3" style="margin-bottom: 0px; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							</div>
						</div>
						<div style="width: 66.3%; height: 65.4%; float: left;" id="data1"></div>
						<div style="width: 66.3%; height: 35.5%; float: left;">
							<div class="data_contentLeft" style="width: 100%; height: 99.5%; margin-top: 0.5%;">
								<div class="dataBar_4_left" id="part1" style="width: 49.7%; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_4_right" id="part2" style="width: 49.7%; margin-right: 0px; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${typeSize eq 5}">
				<div class="data_content">
					<div style="width: 100%; height: 100%; float: left;">
						<div style="width: 33.7%; height: 68%; float: right;">
							<div class="data_contentLeft" style="width: 98%; height: 100%; margin-left: 2%;">
								<div class="dataBar_3_top" id="part3" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_3_btm" id="part4" style="margin-bottom: 0px; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							</div>
						</div>
						<div style="width: 66.3%; height: 50px; line-height: 50px; float: left;">
							<div style="background-color: #AFE7FE; width: 3px; height: 20px; float: left; margin-top: 15px;"></div>
							<span style="float: left; margin-left: 10px; font-size: 22px; color: #AFE7FE;">产业经济指标</span>
							<div id="norm" style="float: left; margin-left: 10px; font-size: 12px; color: #FFFFFF; height: 95%; width: auto; display: none;"></div>
							<span id="set_btn" class="btn_set" onclick="setNorm();"> 
								<img src="${ctx}/static/img/set.png" style="margin-top: -4px;" />&nbsp;指标设置
							</span>
						</div>
						<div style="width: 66.3%; height: 59.4%; float: left;" id="data1"></div>
						<div style="width: 100%; height: 30.5%; float: left;">
							<div class="data_contentLeft" style="width: 100%; height: 99.5%; margin-top: 0.5%;">
								<div class="dataBar_4_left" id="part1" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_4_mid" id="part2" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_4_right" id="part5" style="margin-right: 0px; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${typeSize eq 6}">
				<div class="data_content">
					<div style="width: 100%; height: 10%; line-height: 50px; float: left;">
						<div style="background-color: #AFE7FE; width: 3px; height: 20px; float: left; margin-top: 15px;"></div>
						<span style="float: left; margin-left: 10px; font-size: 22px; color: #AFE7FE;">产业经济指标</span>
						<div id="norm" style="float: left; margin-left: 10px; font-size: 12px; color: #FFFFFF; height: 95%; width: auto; display: none;"></div>
						<span id="set_btn" class="btn_set" onclick="setNorm();">
							<img src="${ctx}/static/img/set.png" style="margin-top: -4px;" />&nbsp;指标设置
						</span>
					</div>
					<div style="width: 100%; height: 88%; float: left;">
						<div style="width: 33%; height: 100%; float: right;">
							<div class="data_contentLeft"
								style="width: 99%; height: 100%; margin-left: 1%;">
								<div class="dataBar_3_top" id="part4" style="height: 33%;margin-bottom: 1%;-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_3_center" id="part5" style="height: 33%;margin-bottom: 1%;-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_3_btm" id="part6" style="height: 33%;margin-bottom: 1%;margin-bottom: 0px; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							</div>
						</div>
						<div style="width: 33%; height: 100%; float: left;">
							<div class="data_contentLeft" style="width: 99%; height: 100%; margin-right: 1%;">
								<div class="dataBar_3_top" id="part1" style="height: 33%;margin-bottom: 1%;-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_3_center" id="part2" style="height: 33%;margin-bottom: 1%;-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								<div class="dataBar_3_btm" id="part3" style="height: 33%;margin-bottom: 1%;margin-bottom: 0px; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							</div>
						</div>

						<div style="width: 34%; height: 49%; float: left;" id="data1"></div>
						<div style="width: 34%; height: 51%; float: left;">
							<div class="data_contentLeft" style="width: 100%; height: 99%; margin-top: 1%;">
								<div class="dataBar_4_left" id="part7" style="width: 100%;height: 100%;-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>

	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/parkDataCenter/pkEconIndicators?orgId=${orgId}'"></div>
	<div class="btn_next"
		onclick="window.location.href='${ctx}${configInfo.indexUrl}'"></div>
</body>
<script type="text/javascript">
	$(function(){
		/*判断组织id是否有效*/
		var configInfo = ${configInfo};
		if($.isEmptyObject(configInfo)){
			layer.msg('请填写有效组织ID！', {
				shade: 0.5,
				time:100000000
			});
			return;
		}
		
		var indIndexNum = '${configInfo.indIndexNum}';
		var indIndexName = '${configInfo.indIndexName}';
		var indIndexCode = '${configInfo.indIndexCode}';
		/*初始化*/
	//	if(pkIndexNum>4){
			var indIndexNameArr = indIndexName.split(",");
			var span = '<span style="float: left;margin-left: 20px;font-size: 14px;color: #AFE7FE;" id="parkIndex">指标选择：';
			for(var i=0;i<indIndexNameArr.length;i++){
				var value = "";
				for(var j=0;j<industryIndex.length;j++){
					if(industryIndex[j].name==indIndexNameArr[i]){
						value = industryIndex[j].value;
					}
				}
				if(i<4){					
					span += '&nbsp;&nbsp;<input type="checkbox" class="i-checks" value="'+value+'" data="'+indIndexNameArr[i]+'" checked/>&nbsp;&nbsp;'+indIndexNameArr[i];
				}else{
					span += '&nbsp;&nbsp;<input type="checkbox" class="i-checks" value="'+value+'" data="'+indIndexNameArr[i]+'"/>&nbsp;&nbsp;'+indIndexNameArr[i];
				}
			}
			span += '&nbsp;&nbsp;<span class="btn_confirm" onclick="selectByIndIndex()">确认</span>';
			$("#norm").append(span);
				
	//	}
		
		
		/*加载echart图形*/
		loadData(indIndexName, indIndexCode);
		
		$(".i-checks").iCheck({
			checkboxClass : "icheckbox_square-green",
			radioClass : "iradio_square-green"
		});
		
		
	});
	
	function selectByIndIndex(){
		var count = 0;
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				count += 1;
			}
		});
		
		if(count==0){
			layer.msg("必须选择一项展示！");
			return;
		}
		
		if(count==6){
			layer.msg("请不要超过五项！");
			return;
		}
		
		var firstCode = "";
		
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				firstCode = $(this).val();
				return false;
			}
		});
		var indIndexName = "";
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				indIndexName += ($(this).attr("data")+",");
			}
		});
		initTitle(indIndexName.substring(0,indIndexName.length-1));
		loadData1(data.data1, firstCode);
		loadData3(data.data1.xAxis, data.data3, firstCode);
		loadData2(data.data2, firstCode);
		
	}
	
	function selectByIndex(obj){
		$("div[name='title']").each(function(a, item) {
			if (item.className == 'echarts-title1') {
				item.className = 'echarts-title';
			}
		});
		$(obj).removeClass('echarts-title');
		$(obj).addClass('echarts-title1');
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
		
		
		loadData1(data.data1, getFirstCode());
		loadData3(data.data1.xAxis, data.data3, getFirstCode());
		loadData2(data.data2, getFirstCode());
		
	}
	
	function initTitle(indIndexName){
		$("#data1").empty();
		var indIndexNameArr = indIndexName.split(",");
		var div1 = '<div style="width: 100%; height: 13%;">';
		var div2 = '';
		var length = indIndexNameArr.length;
		if(indIndexNameArr.length>4){
			length = 4
		}
		for(var i=0;i<length;i++){
			var value = "";
			for(var j=0;j<industryIndex.length;j++){
				if(industryIndex[j].name==indIndexNameArr[i]){
					value = industryIndex[j].value;
				}
			}
			if(i==0){
				div1 += '<div name="title" onclick="selectByIndex(this)" class="echarts-title1" style="margin-left: -1px;">'+indIndexNameArr[i]+'</div>';
				div2 += '<div id="'+value+'" data="'+value+'" name="echarts-map" class="echarts-map">'+i+'</div>';
			}else{
				div1 += '<div name="title" onclick="selectByIndex(this)" class="echarts-title">'+indIndexNameArr[i]+'</div>';
				div2 += '<div id="'+value+'" data="'+value+'" name="echarts-map" class="echarts-map1">'+i+'</div>';
			}
			
		}
		div1 += '</div>';
		$("#data1").append(div1).append(div2);
	}
	
	function selectByYear(year){
		$("#yearMenu").slideUp("fast");  
		$("#yearText").text(year+"年");
	 	$("#year").val(year);
		loadData();
	}
	
	function getFirstCode(){
		return $(".echarts-map").attr("data");
	}
	
	var data = "";
	function loadData(){
		$.ajax({
			url:"${ctx}/interface/json/dataCenter/indEconIndicators",
			type:"post",
			data:$("#form").serialize(),
			success:function(result){
				var indIndexName = $("#indIndexName").val();
				if(result.success){
					$("#oldYear").val($("#year").val());
					initTitle(indIndexName);
					data = result.indEconData;
					loadData1(data.data1, getFirstCode());
					loadData3(data.data1.xAxis, data.data3, getFirstCode());
					loadData2(data.data2, getFirstCode());
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
	
	function loadData1(data, code){
		var unit = "";
		for(var j=0; j<industryIndex.length; j++){
			if(industryIndex[j].value==code){
				unit = industryIndex[j].unit;
			}
		}
		var chart = echarts.init(document.getElementById(code));
		optionPart3.yAxis[0].name="总量（"+unit+"）";
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
		optionPart3.legend.data=legend;
		optionPart3.xAxis[0].data=data.xAxis;
		var value = code+"_value";
		optionPart3.series[0].name=(year).toString();
		optionPart3.series[0].data=data[value].seriesThis;
		optionPart3.series[1].data=data[value].seriesLast;
		optionPart3.series[1].name=(year-1).toString();
		optionPart3.series[2].data=data[value].seriesBefore;
		optionPart3.series[2].name=(year-2).toString();
		chart.setOption(optionPart3);
	}
	
	function loadData2(data, code){
		var partIndex = ["part1","part2","part3","part4","part5","part6"];
		var typeIndex = ["bar","line","bar","line","bar","bar"];
		var colorIndex = ["#ce0867","#01c5ff","#feff02","#ff7f50"];
	//	var typeList = eval('('+'${typeList}'+')');
		var typeList = ${typeList};
		var isIndPctShow = '${configInfo.isIndPctShow}';
		
		var option = "";
		if(isIndPctShow==1){
			option = optionPart2;
		}else{
			option = optionPart1;
		}
		
		for(var i=0; i<typeList.length; i++){
			var num = '${configInfo.indIndexNum}';
			var unit = "";
			var type = "";
			for(var j=0; j<industryIndex.length; j++){
				if(industryIndex[j].value==code){
					unit = industryIndex[j].unit;
					type = industryIndex[j].type;
				}
			}
			
			var value = code+"_value";
			var percent = code+"_percent";
			
			value = data[value][typeList[i].typeName];
			if(type==2){				
				percent = data[percent][typeList[i].typeName];
			}
			var myChart = echarts.init(document.getElementById(partIndex[i]));
			option.title.text=typeList[i].typeName+"（"+unit+"）";
			option.series[0].data=value;
			option.series[0].type=typeIndex[i];
			option.series[0].itemStyle.normal.color=colorIndex[i];
			var flag = true;
			if(percent!=null&&percent!=''&&percent!='undefined'){
				for(var j=0; j<percent.length; j++){
					if(percent[j]=='undefined'){
						flag = false;
					}
				}
			}
			
			if(isIndPctShow==1&&type==2&&flag==true){
				option.series[1].data=percent;
				option.series[1].type='line';
				option.series[1].itemStyle.normal.color=colorIndex[i];
			}
			
			myChart.setOption(option);
		}
		
	}
	
	function loadData3(xAxis, series, code){
		var value = code+"_value";
		var typeSize = '${typeSize}';
		var pieOpion = {
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
			        data:xAxis,
			        textStyle:{color:'#FFF'}
			    },
			    color:['#CD0567','#FCFF00','#799C0E','#11729D'], 
			    series: [
			    	{
			    		type:'pie',
					    center:['42%','54%'],
					    radius:['50%', '70%'],
					    data:series[value]
			   		}
			    ]
		};
		
		var pieChart = "";
		if(typeSize==6){
			pieChart = echarts.init(document.getElementById('part7'));
		}else{
			pieChart = echarts.init(document.getElementById('part4'));
		}
		pieChart.setOption(pieOpion);
	}
	var industryIndex = [
		{
			name:"投产工业企业数",
			value:"tcgyqygs",
			type:"1",
			unit:"个"
		},
		{
			name:"工业销售产值",
			value:"gyxscz",
			type:"2",
			unit:"万元"
		},
		{
			name:"出口交货值",
			value:"ckjhz",
			type:"2",
			unit:"万元"
		},
		{
			name:"资产总计",
			value:"zczj",
			type:"2",
			unit:"万元"
		},
		{
			name:"主营业务收入",
			value:"zyywsr",
			type:"2",
			unit:"万元"
		},
		{
			name:"利润总额",
			value:"lr",
			type:"2",
			unit:"万元"
		},
		{
			name:"从业人员平均人数",
			value:"csgyschd_cyry",
			type:"2",
			unit:"个"
		},
		{
			name:"工业增加值",
			value:"gyzjz",
			type:"2",
			unit:"万元"
		},
		{
			name:"税金总额",
			value:"sj",
			type:"2",
			unit:"万元"
		},
		{
			name:"利税总额",
			value:"ls",
			type:"2",
			unit:"万元"
		},
		{
			name:"园区实际开发面积",
			value:"yqsjkfmj",
			type:"2",
			unit:"平方公里"
		},
		{
			name:"完成基础设施投入",
			value:"wcjcsstr",
			type:"2",
			unit:"万元"
		},
		{
			name:"招商签约资金",
			value:"zsqyzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"亿元以上项目资金",
			value:"yyysxmzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"千万美元以上项目资金",
			value:"qwmyysxmzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"招商实际到位资金",
			value:"zssjdwzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"省外资金",
			value:"swzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"境外资金",
			value:"jwzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"工业固定资产投资额",
			value:"gygdzctze",
			type:"2",
			unit:"万元"
		},
		{
			name:"在建工业个数",
			value:"zjqygs",
			type:"1",
			unit:"个"
		},
		{
			name:"非工企业，企业数",
			value:"fgqy_qys",
			type:"1",
			unit:"个"
		},
		{
			name:"非工企业，非工营业收入",
			value:"fgqy_fgyesr",
			type:"1",
			unit:"万元"
		},
		{
			name:"工业用电量",
			value:"gyydl",
			type:"1",
			unit:"万度"
		},
		{
			name:"工业总产值",
			value:"gyzcz",
			type:"2",
			unit:"万元"
		},
		{
			name:"主营业务税金及附加",
			value:"zyywsjjfj",
			type:"2",
			unit:"万元"
		},
		{
			name:"应交增值税",
			value:"yjzzs",
			type:"2",
			unit:"万元"
		}
	];
	
	
	var optionPart1 = {
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
	};
	
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
		           // smooth: true,
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
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:5,
		        data:[
					{name:'2017',textStyle:{color:"#FCFF00"}},
					{name:'2016',textStyle:{color:"#FCFF00"}},
					{name:'2015',textStyle:{color:"#FCFF00"}}
				]
		    },
		    grid: {
		    	bottom:'5%',
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
		            data:[0,0,0,0,0],
		            markPoint : {
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
		            		color:function(params){
		            			var index = params.dataIndex;//表示当前的数据条的索引
		            		    var alternateNumber = 5;//表示按几种颜色交替出现

		            		    var newColor="";//表示最终显示的颜色
		            		    /**
		            		    自定义的颜色池
		            		    如果颜色池长度不够，将无法取得正确的颜色，所以有必要使
		            		    index的最大值小于colorList.length
		            		    */
		            		    var colorList = ['#01c5ff','#01c5ff','#01c5ff','#01c5ff','#01c5ff',
		            		                     '#01c5ff','#ce0867','#feff02','#ff7f50','#5cc600',
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
		        },
		        {
		            name:'2016',
		            type:'line',
		            data:[0,0,0,0,0],
		            itemStyle: {
		            	normal: {
		            		color: '#01c5ff'
		            	}
		            }
		        },
		        {
		            name:'2015',
		            type:'line',
		            data:[0,0,0,0,0],
		            itemStyle: {
		            	normal: {
		            		color: '#ffea01'
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
