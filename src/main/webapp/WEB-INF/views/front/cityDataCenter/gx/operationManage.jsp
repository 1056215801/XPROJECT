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
<title>南昌国家高新技术产业开发区大数据运营管理</title>
<style>
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/gx/bg2.png) no-repeat center;
    background-size: 100% 100%;
}
</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
    <div class="content fz0">
    	<div class="spanStyle" style="width: 27.5%;">
    		<div class="blockStyle" style="height: 35%;">
    			<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">规模以上工业增加值</span>
						<span class="tabCaptionUnit">（单位：%）</span>
					</div>
					<div class="tabContBar">
						<div id="chart1" style="height: 100%;"></div>
					</div>
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(35% - 10px);">
    			<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">主营业务收入</span>
						<span class="tabCaptionUnit">（单位：亿元）</span>
					</div>
					<div class="tabContBar">
						<div id="chart2" style="height: 100%;"></div>
					</div>
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(30% - 10px);">
    			<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">投资概况</span>
						<span class="tabCaptionUnit">（单位：亿元）</span>
					</div>
					<div class="tabContBar" style="padding-top: 10px;">
						<div style="position: relative; height: 100%; overflow: hidden;">
							<div class="selectBar" id="tzgkOrder">
								<span id="gytz" class="on">工业投资</span>
								<span id="gdzctz">500万及以上固定资产投资</span>
							</div>
							<div id="tzgkChart" style="height: calc(100% - 30px);">
								<div id="chart3" style="height: 100%;"></div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    	<div class="spanStyle" style="width: calc(45% - 10px);">
    		<div class="blockStyle" style="height: 65%;">
    			<div class="price-num fourth-price-num" style="margin-top: 0px;">
					<span>
						<div class="middle-box">
							<p>工业增加值同比</p>
							<h1 class="orangeT decimalFT tot1">
								<font class="bigProjectDataNum" style="margin-right: -5px;" id="gyzjz1"></font>
								<font class="bigProjectDataNum" style="margin-right: -5px;">
									<ul class="dataNums inrow">
										<li class="dataOne ">
											<div class="dataBoc">
												<div class="tt" t="38">
													<span class="">.</span>
												</div>
											</div>
										</li>
									</ul>
								</font>
								<font class="bigProjectDataNum" id="gyzjz2"></font><small>%</small>
							</h1>
							<h1 class="tot tot11" style="display:none">未公布</h1>
						</div>
					</span>
					<span>
						<div class="middle-box">
							<p>主营业务收入（亿元）</p>
							<h1 class="bgT tot2">
								<font class="bigProjectDataNum" style="margin-right: -5px;" id="zzywsr"></font>
								<font class="bigProjectDataNum" style="margin-right: -5px;">
									<ul class="dataNums inrow">
										<li class="dataOne ">
											<div class="dataBoc">
												<div class="tt" t="38">
													<span class="">.</span>
												</div>
											</div>
										</li>
									</ul>
								</font>
								<font class="bigProjectDataNum" id="zzywsr2"></font>
							</h1>
							<h1 class="tot tot21" style="display:none">未公布</h1>
						</div>
					</span>
					<span>
						<div class="middle-box">
							<p>利润总额（亿元）</p>
							<h1 class="lgT tot1">
								<font class="bigProjectDataNum" style="margin-right: -5px; display:none;" id="lrdown">
									<ul class="dataNums inrow">
										<li class="dataOne ">
											<div class="dataBoc">
												<div class="tt" t="38">
													<span class="">-</span>
												</div>
											</div>
										</li>
									</ul>
								</font>
								<font class="bigProjectDataNum" style="margin-right: -5px;" id="lrze1"></font>
								<font class="bigProjectDataNum" style="margin-right: -5px;">
									<ul class="dataNums inrow">
										<li class="dataOne ">
											<div class="dataBoc">
												<div class="tt" t="38">
													<span class="">.</span>
												</div>
											</div>
										</li>
									</ul>
								</font>
								<font class="bigProjectDataNum" id="lrze2"></font>
							</h1>
							<h1 class="tot tot31" style="display:none">未公布</h1>
						</div>
					</span>
					<span>
						<div class="middle-box price-num1">
							<p>工业用电总量（亿 kwh）</p>
							<h1 class="lgT" id="gyydlgT"><font class="bigProjectDataNum" id="gyyd"></font></h1>
						</div>
					</span>
				</div>
				<div style="width: 100%; height: calc(100% - 84px); padding: 20px 60px;">
					<img src="${ctx}/static/image/cityDataCenter/gx/zdcy.png" width="100%" height="100%">
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(35% - 10px);">
    			<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">规模以上工业能耗</span>
						<span class="tabCaptionUnit">（单位：亿元）</span>
					</div>
					<div class="tabContBar">
						<div id="chart4" style="height: 100%;"></div>
					</div>
				</div>
    		</div>
    	</div>
    	<div class="spanStyle" style="width: calc(27.5% - 10px);">
    		<div class="blockStyle" style="height: 35%;">
    			<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">主要经济指标</span>
						<span class="tabCaptionUnit">（单位：亿元）</span>
					</div>
					<div class="tabContBar" style="padding-top: 10px;">
						<div style="position: relative; height: 100%; overflow: hidden;">
							<div class="selectBar" id="zyjjzbOrder">
								<span id="lrze" class="on">利润总额</span>
								<span id="lsze">利税总额</span>
							</div>
							<div id="zyjjzbChart" style="height: calc(100% - 30px);">
								<div id="chart5" style="height: 100%;"></div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(35% - 10px);">
    			<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">企业统计</span>
					</div>
					<div class="tabContBar">
						<div class="tabBox">
							<i></i>
							<div class="tabC">
								<div class="tabT">企业总数</div>
								<div class="tabV" id="qyzs"></div>
							</div>
						</div>
						<div class="tabBox">
							<i></i>
							<div class="tabC">
								<div class="tabT">规上企业</div>
								<div class="tabV" id="gsqy"></div>
							</div>
						</div>
						<div class="tabBox">
							<i></i>
							<div class="tabC">
								<div class="tabT">上市企业</div>
								<div class="tabV" id="ssqy"></div>
							</div>
						</div>
						<div class="tabBox">
							<i></i>
							<div class="tabC">
								<div class="tabT">新三板挂牌</div>
								<div class="tabV" id="xsbgp"></div>
							</div>
						</div>
						<div class="tabBox">
							<i></i>
							<div class="tabC">
								<div class="tabT">高新企业</div>
								<div class="tabV" id="gxqy"></div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(30% - 10px);">
    			<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">重点产业</span>
						<span class="tabCaptionUnit">（单位：亿元）</span>
						<div class="gxLegend" id="legend1">
							<span><i></i>主营业务收入</span>
							<span><i></i>利税</span>
						</div>
					</div>
					<div class="tabContBar" style="">
						<div style="width: -webkit-calc(100% + 18px); width: calc(100% + 18px); height: 100%; overflow-y: scroll;">
							<div id="chart6" style="width: calc(100% - 18px); height: 300px;"></div>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </div>
</body>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head .tab>a:eq(2)").addClass("on");
		
		$('.selectBar span').on("click",function(){
			var index = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			getData1();
		});
		
		$('.gxLegend span').on("click",function(){
			$(this).toggleClass('on');
			if($(this).parent().attr('id')=='legend1'){
				var legend1 = $('#legend1 span:eq(0)');
					legend2 = $('#legend1 span:eq(1)');
				 
				if(legend1.hasClass('on') && legend2.hasClass('on')){
					doubleBarOption.legend.selected = {'主营业务收入': false, '利税': false,}
				}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
					doubleBarOption.legend.selected = {'主营业务收入': true, '利税': false,}
				}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
					doubleBarOption.legend.selected = {'主营业务收入': false, '利税': true,}
				}else if(!legend1.hasClass('on') && !legend2.hasClass('on')){
					doubleBarOption.legend.selected = {'主营业务收入': true, '利税': true,}
				}	
				getData1();
			}
		});
		
		getData1();
		getData2();
	})
	function getData1(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/selectGXQData",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result){
				console.log(result)
				if(result.success){
					if(result.economicData.indexData[0].value != "" && result.economicData.indexData[0].value != undefined){
						if(result.economicData.indexData[0].value == 0){
							$(".tot1").hide();				
							$(".tot11").show();		
						}else{
							$(".tot1").show();				
							$(".tot11").hide();	
						}
						if(result.economicData.indexData[1].value == 0){
							$(".tot2").hide();				
							$(".tot21").show();
						}else{
							$(".tot2").show();				
							$(".tot21").hide();
						}
						if(result.economicData.indexData[2].value == 0){
							$(".tot3").hide();				
							$(".tot31").show();
						}else{
							$(".tot3").show();				
							$(".tot31").hide();
						}
						$("#gyzjz1").removeClass("fz16").siblings().show();
						$("#zzywsr").removeClass("fz16").next().show();
						$("#lrze1").removeClass("fz16").next().show();
						var gy = result.economicData.indexData[0].value.toString();
						var zy = result.economicData.indexData[1].value.toString();
						var lr = result.economicData.indexData[2].value.toString();
						$("#gyzjz1").empty();
						$("#gyzjz2").empty();
						$("#zzywsr").empty();
						$("#zzywsr2").empty();
						$("#lrze1").empty();
						$("#lrze2").empty();
						$("#gyzjz1").rollNum({
					      	deVal: gy.split('.')[0],
					      	digit: gy.split('.')[0].length
					    });
						if(gy.split('.')[1]){
							$("#gyzjz2").rollNum({
						      	deVal: gy.split('.')[1],
						      	digit: gy.split('.')[1].length
						    });
						} else {
							$("#gyzjz2").rollNum({
						      	deVal: 0,
						      	digit: 1
						    });
						}
						$("#zzywsr").rollNum({
					      	deVal: zy.split('.')[0],
					      	digit: zy.split('.')[0].length
					    });
						if(zy.split('.')[1]){
							$("#zzywsr2").rollNum({
						      	deVal: zy.split('.')[1],
						      	digit: zy.split('.')[1].length
						    });
						} else {
							$("#zzywsr2").rollNum({
						      	deVal: 0,
						      	digit: 1
						    });
						}
						if(lr<0){
							$("#lrze1").rollNum({
								deVal: lr.split('.')[0],
						      	digit: lr.split('.')[0].length - 1
						    });
						}else{
							$("#lrze1").rollNum({
								deVal: lr.split('.')[0],
						      	digit: lr.split('.')[0].length
						    });
						}
						if(lr.split('.')[1]){
							$("#lrze2").rollNum({
						      	deVal: lr.split('.')[1],
						      	digit: lr.split('.')[1].length
						    });
						} else {
							$("#lrze2").rollNum({
						      	deVal: 0,
						      	digit: 1
						    });
						};
						if(result.economicData.indexData[2].value < 0){
							$("#lrdown").show();
						}else{
							$("#lrdown").hide();
						}
					}else{
						$("#gyzjz1").text('未公布').addClass("fz16").siblings().hide();
						$("#zzywsr").text('未公布').addClass("fz16").next().hide();
						$("#lrze1").text('未公布').addClass("fz16").next().hide();
					};
					
					$("#gyyd").empty();
					if(result.economicData.indexData[3].value != '' && result.economicData.indexData[3].value != undefined){
						if(JSON.stringify(result.economicData.indexData[3].value) != '{}'){
							$("#gyyd").rollNum({
						      	deVal: result.economicData.indexData[3].value.split(".")[0],
						      	digit: result.economicData.indexData[3].value.split(".")[0].length
						    });
						} else {
							$("#gyyd").rollNum({
						      	deVal: 0,
						      	digit: 1
						    });
						}	
					}else{
						$("#gyyd").text('未公布');
					}
					
					//规模以上工业增加值 
					if(result.economicData.gsgyzjzData != undefined && result.economicData.gsgyzjzData.xAxis.length != "" && result.economicData.gsgyzjzData.xAxis.length != undefined){
						var div_ = document.getElementById("chart1");
						div_.removeAttribute("_echarts_instance_");
						var blueLineChart = echarts.init(div_);
						//var blueLineChart = echarts.init(document.getElementById("chart1"));
						blueLineOption.legend.data = result.economicData.gsgyzjzData.xAxis;
						blueLineOption.xAxis.data = result.economicData.gsgyzjzData.xAxis;
						blueLineOption.series[0].name = "规模以上工业增加值";
						blueLineOption.series[0].data = result.economicData.gsgyzjzData.series;
						blueLineChart.setOption(blueLineOption);
					}
					
					//主营业务收入
					if(result.economicData.zyywsrData != undefined && result.economicData.zyywsrData.xAxis.length != "" && result.economicData.zyywsrData.xAxis.length != undefined){
						var div_ = document.getElementById("chart2");
						div_.removeAttribute("_echarts_instance_");
						var orangeBarChart = echarts.init(div_);
						//var orangeBarChart = echarts.init(document.getElementById("chart2"));
						orangeBarOption.legend.data = result.economicData.zyywsrData.xAxis;
						orangeBarOption.xAxis[0].data = result.economicData.zyywsrData.xAxis;
						orangeBarOption.series[0].name = "主营业务收入";
						orangeBarOption.series[0].data = result.economicData.zyywsrData.series;
						orangeBarChart.setOption(orangeBarOption);
					}

					//投资概况
					if($("#gytz").hasClass("on")){
						if(result.economicData.gzgkData != undefined && result.economicData.gzgkData.gztzData.xAxis.length != "" && result.economicData.gzgkData.gztzData.xAxis.length != undefined){
							var div_ = document.getElementById("chart3");
							div_.removeAttribute("_echarts_instance_");
							var blueBarChart = echarts.init(div_);
							//var blueBarChart = echarts.init(document.getElementById("chart3"));
							blueBarOption.legend.data = result.economicData.gzgkData.gztzData.xAxis;
							blueBarOption.xAxis[0].data = result.economicData.gzgkData.gztzData.xAxis;
							blueBarOption.series[0].name = "投资概况";
							blueBarOption.series[0].data = result.economicData.gzgkData.gztzData.series;
							blueBarChart.setOption(blueBarOption);
						}
					}else if($("#gdzctz").hasClass("on")){
						if(result.economicData.gzgkData != undefined && result.economicData.gzgkData.gdzctzData.xAxis.length != "" && result.economicData.gzgkData.gdzctzData.xAxis.length != undefined){
							var div_ = document.getElementById("chart3");
							div_.removeAttribute("_echarts_instance_");
							var blueBarChart = echarts.init(div_);
							//var blueBarChart = echarts.init(document.getElementById("chart3"));
							blueBarOption.legend.data = result.economicData.gzgkData.gdzctzData.xAxis;
							blueBarOption.xAxis[0].data = result.economicData.gzgkData.gdzctzData.xAxis;
							blueBarOption.series[0].name = "投资概况";
							blueBarOption.series[0].data = result.economicData.gzgkData.gdzctzData.series;
							blueBarChart.setOption(blueBarOption);
						}
					}else{}
					
					
					
					//主要经济指标
					if($("#lrze").hasClass("on")){//iceBergOption
						if(result.economicData.zyjjzbData != undefined && result.economicData.zyjjzbData.lrzeData.xAxis.length != "" && result.economicData.zyjjzbData.lrzeData.xAxis.length != undefined){
							var div_ = document.getElementById("chart5");
							div_.removeAttribute("_echarts_instance_");
							var iceBergChart = echarts.init(div_);
							//var iceBergChart = echarts.init(document.getElementById("chart5"));
							//iceBergOption.legend.data = result.economicData.zyjjzbData.lrzeData.xAxis;
							var xData = result.economicData.zyjjzbData.lrzeData.xAxis;
							xData.unshift('');
							xData.push('');
							iceBergOption.xAxis[0].data = xData;
							iceBergOption.xAxis[1].data = xData;
							iceBergOption.series[0].name = "主要经济指标";
							var yData = result.economicData.zyjjzbData.lrzeData.series;
							yData.unshift('');
							iceBergOption.series[0].data = yData;
							iceBergChart.setOption(iceBergOption);
						}
					}else if($("#lsze").hasClass("on")){
						if(result.economicData.zyjjzbData != undefined && result.economicData.zyjjzbData.lszeData.xAxis.length != "" && result.economicData.zyjjzbData.lszeData.xAxis.length != undefined){
							var div_ = document.getElementById("chart5");
							div_.removeAttribute("_echarts_instance_");
							var iceBergChart = echarts.init(div_);
							//var iceBergChart = echarts.init(document.getElementById("chart5"));
							//iceBergOption.legend.data = result.economicData.zyjjzbData.lszeData.xAxis;
							var xData = result.economicData.zyjjzbData.lszeData.xAxis;
							xData.unshift('');
							xData.push('');
							iceBergOption.xAxis[0].data = xData;
							iceBergOption.xAxis[1].data = xData;
							iceBergOption.series[0].name = "主要经济指标";
							var yData = result.economicData.zyjjzbData.lszeData.series;
							yData.unshift('');
							iceBergOption.series[0].data = yData;
							iceBergChart.setOption(iceBergOption);
						}
					}else{}
					//规模以上工业能耗 
					if(result.economicData.gynhData != undefined && result.economicData.gynhData.xAxis.length != "" && result.economicData.gynhData.xAxis.length != undefined){
						var div_ = document.getElementById("chart4");
						div_.removeAttribute("_echarts_instance_");
						var iceLineChart = echarts.init(div_);
						//var iceLineChart = echarts.init(document.getElementById("chart4"));
						//iceBergOption.legend.data = result.economicData.zyjjzbData.lszeData.xAxis;
						var xData = result.economicData.gynhData.xAxis;
						xData.unshift('');
						xData.push('');
						iceLineOption.xAxis[0].data = xData;
						iceLineOption.xAxis[1].data = xData;
						var yData1 = result.economicData.gynhData.series[0].data;
						yData1.unshift('');
						iceLineOption.series[0].data = yData1;
						var yData2 = result.economicData.gynhData.series[1].data;
						yData2.unshift('');
						iceLineOption.series[1].data = yData2;
						iceLineChart.setOption(iceLineOption);
					}
					//重点产业
					var div_ = document.getElementById("chart6");
					div_.removeAttribute("_echarts_instance_");
					var doubleBarChart = echarts.init(div_);
					//var doubleBarChart = echarts.init(document.getElementById('chart6'));
					doubleBarOption.yAxis[0].data = result.economicData.zdcyData.yAxis;
					doubleBarOption.series[0].data = result.economicData.zdcyData.series.zyywsrData;
					doubleBarOption.series[1].data = result.economicData.zdcyData.series.lrData;
					doubleBarChart.setOption(doubleBarOption);
					
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	function getData2(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/DataKeyCompany/show",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result){
				if(result.success){
					var qyValue = result.data[0].companyStatistics;
					$("#qyzs").text(qyValue[0].value);
					$("#gsqy").text(qyValue[1].value);
					$("#ssqy").text(qyValue[2].value);
					$("#xsbgp").text(qyValue[3].value);
					$("#gxqy").text(qyValue[4].value);
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	
	//蓝色线型配置
	var blueLineOption = {
		legend: {
			show: false,
	    	data: [
	            { name: '同比', icon: 'circle'}
	        ],
	        left: "left",
	        itemWidth: 12,
	        itemHeight: 12,
	        itemGap: 5,
	        textStyle: {
	            color: "#989CB8"
	        },
	    },
        grid: {
        	right: 40,
        	left: 40,
        	bottom: 35,
        	top: 35
        },
        tooltip: {
            show:true,
            trigger: 'axis',
        },
        xAxis: {
	        data: [],
	        boundaryGap: false,
            splitLine: {
                show: false,
                lineStyle: {
                    color: 'rgba(255,255,255,0.1)'
                }
            },
            axisLine: {
				show: true,
				lineStyle:{
					 color: 'rgba(255,255,255,0.1)'
				}
			},
            axisLabel: {
                color: '#009FF1',
                /* rotate: 40, */
                fontSize: 11,
            }
		},
		yAxis: {
			splitLine: {
			    lineStyle: {
			        color: 'rgba(255,255,255,0.1)'
			    }
			},
			axisLine: {
				show: true,
				lineStyle:{
					 color: 'rgba(255,255,255,0.1)'
				}
			},
			axisLabel: {
				color: '#009FF1',
				fontSize: 11,
				formatter:function(params){
					return params+'%';
				}
			}
        },
		series: [{
			name: '同比',
			type: 'line',
			data: [],
			symbolSize: 0,
			smooth: true,
			color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
				offset: 0,
				color: '#67F8B3'
			}, {
      			offset: 1,
      			color: '#05A6FC'
			}]),
			areaStyle: {
				color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
					offset: 0,
					color: '#67F8B3'
				}, {
	      			offset: 1,
	      			color: '#05A6FC'
				}]),
				opacity: 0.2,
			}
		},]
	};
	
	//橙色条形配置
	var orangeBarOption = {
		tooltip: {
			trigger: "axis", //触发为坐标轴内
			axisPointer: {
				type: "cross",
				label: {
					show: false
				},
				crossStyle: {
					color: "#384757"
				}
			}
		},
		legend: {
			show: false,
			selectedMode: true,
			data: [],
			left: 'center',
			top:'12',
			itemGap:15,	
			itemWidth :11,
			itemHeight:11,
			textStyle: {
				color: '#03E0C2'
			}
		},
		grid: {
			left: '9%',
			right: '8%',
			top:'18%',
			bottom:'17%'
		},
		xAxis: [{
			type: 'category',
			data: [],
			splitLine: { //显示分割线 
				show: false
			},
			axisLabel: {
				color: '#009FF1',
				fontSize: 11,
			},
			axisLine: {
				lineStyle: {
					color: 'rgba(238,238,238,0.2)'
				}
			},
			axisTick: {
				show: false
			},
			axisPointer: {
				type: 'shadow',
			}
		}],
		yAxis: [{
			type: 'value',
			splitLine: {
				show: true,
				lineStyle: {
					type: 'solid',
					color: 'rgba(238,238,238,0.2)'
				}
			},
			axisLabel: {
				formatter: '{value}',
				color: '#009FF1',
				fontSize: 11,
			},
			axisLine: {
				lineStyle: {
					color:  'rgba(238,238,238,0.2)'
				}
			},
			axisTick: {
				show: false
			}
		}],
		series: [{
			name: '主营业务收入',
			type: 'bar',
			barMaxWidth:'30',
			itemStyle: {
			normal: {
				color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
					offset: 0,
					color: '#FFD154'
				},{
					offset: 1,
					color: '#FF903E'
				}]),
			}
			},
			data: []
		}],
	};
	
	//蓝色条形配置
	var blueBarOption = {
		tooltip: {
			trigger: "axis", //触发为坐标轴内
			axisPointer: {
				type: "cross",
				label: {
					show: false
				},
				crossStyle: {
					color: "#384757"
				}
			}
		},
		legend: {
			show: false,
			selectedMode: true,
			data: [],
			left: 'center',
			top:'12',
			itemGap:15,	
			itemWidth :11,
			itemHeight:11,
			textStyle: {
				color: '#03E0C2'
			}
		},
		grid: {
			left: '9%',
			right: '8%',
			top:'18%',
			bottom:'17%'
		},
		xAxis: [{
			type: 'category',
			data: [],
			splitLine: { //显示分割线 
				show: false
			},
			axisLabel: {
				color: '#009FF1',
				fontSize: 11,
			},
			axisLine: {
				lineStyle: {
					color: 'rgba(238,238,238,0.2)'
				}
			},
			axisTick: {
				show: false
			},
			axisPointer: {
				type: 'shadow',
			}
		}],
		yAxis: [{
			type: 'value',
			splitLine: {
				show: true,
				lineStyle: {
					type: 'solid',
					color: 'rgba(238,238,238,0.2)'
				}
			},
			axisLabel: {
				formatter: '{value}',
				color: '#009FF1',
				fontSize: 11,
			},
			axisLine: {
				lineStyle: {
					color:  'rgba(238,238,238,0.2)'
				}
			},
			axisTick: {
				show: false
			}
		}],
		series: [{
			name: '投资概况',
			type: 'bar',
			barMaxWidth:'30',
			itemStyle: {
			normal: {
				color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
					offset: 0,
					color: '#67F8B3'
				},{
					offset: 1,
					color: '#05A6FC'
				}]),
			}
			},
			data: []
		}],
	};
	//冰山图配置
	var iceBergOption = {
	  	grid: {
	        left:'2%',
	        right:'2%',
	        top: 20,
	        bottom: 0,
	        containLabel:true
		},
		/* legend: legend, */
		tooltip: {
			show: true,
			trigger: 'axis',
			/* formatter: function(params){
				console.log(params);
	        	return params
			} */
		},
	  	xAxis: [{
	          type: 'category',
	          show: false,
	          data: [],
	          boundaryGap: false,
	          splitLine: {
	            	show: true,
	                lineStyle: {
	                    color: "rgba(255,255,255,0.2)"
	                }
	            },
	            axisTick: {
	          	  show: false,
	            },
	            axisLine: {
	            	lineStyle: {
	                	color: 'rgba(255,255,255,0.2)',
	                }
	            },
	            axisLabel: {
	               color: '#00DEFF',
	            }
	      },{
	          type: 'category',
	          position: "bottom",
	          data: [],
	          boundaryGap: false,
	          splitLine: {
	            	show: true,
	                lineStyle: {
	                    color: "rgba(255,255,255,0.2)"
	                }
	            },
	            axisTick: {
	          	  show: false,
	            },
	            axisLine: {
	            	lineStyle: {
	                	color: 'rgba(255,255,255,0.2)',
	                }
	            },
	            axisLabel: {
	               color: '#00DEFF',
	            }
	      }],
	      yAxis: [{
	    	  type: 'value',
	          nameTextStyle:{
	          	color: '#00DEFF',
	          },
	          name: "",
	          splitLine: {
	            	show: true,
	                lineStyle: {
	                    color: "rgba(255,255,255,0.2)"
	                }
	            },
	            axisTick: {
	          	  show: false,
	            },
	            axisLine: {
	            	lineStyle: {
	                	color: 'rgba(255,255,255,0.2)',
	                }
	            },
	            axisLabel: {
	               color: '#00DEFF',
	            }
	      }],
	      series: [{
	          type: 'pictorialBar',
	          name: "",
	          xAxisIndex: 1,
	          barWidth : '200%',
	          barCategoryGap: '-40%',
	          symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
	          itemStyle: {
	          	color: {
	                  type: 'linear',
	                  x: 0,
	                  y: 0,
	                  x2: 0,
	                  y2: 1,
	                  colorStops: [{
	                      offset: 0, color: 'rgba(255,226,65,1)' 
	                  }, {
	                      offset: 1, color: 'rgba(255,168,65,0.1)'
	                  }],
	                  global: false 
	              },
	              opacity:0.6,
	          },
	          data: [],
		}]
	};
	//冰山折线图配置
	var iceLineOption = {
	  	grid: {
	        left:'2%',
	        right:'2%',
	        top: 30,
	        bottom: 0,
	        containLabel:true
		},
		legend: "",
		tooltip: {
			show: true,
			trigger: 'axis',
			formatter: function(params){
				var par1 = ''; 
	        	var par2 = ''; 
	        	var unit = '',
	        	unit1='';
	        	if(params[0]){
	        		if(params[0].value != undefined && params[0].value!=''){
	        			params[0].seriesName=='增长率'?unit = '%':unit = '亿元';
	        			par1 = params[0].marker + params[0].axisValue + '<br>' + params[0].seriesName + ':' + params[0].value + unit;
	        		}
	        	}
	        	if(params[1]){
	        		if(params[1].value != undefined && params[1].value!=''){
	        			params[1].seriesName=='能耗增加值'?unit1 = '亿元':unit1 = '%';
	        			par2 = '<br>' + params[1].seriesName + ':' + params[1].value + unit1; 
	        		}
	        	}
	        	if(par1 == ''){
	        		par1 = params[0].marker + params[0].axisValue;
	        	}
	        	return par1 + par2
			}
		},
	  	xAxis: [{
	          type: 'category',
	          show: false,
	          data: [],
	          boundaryGap: false,
	          splitLine: {
	            	show: true,
	                lineStyle: {
	                    color: "rgba(255,255,255,0.2)"
	                }
	            },
	            axisTick: {
	          	  show: false,
	            },
	            axisLine: {
	            	lineStyle: {
	                	color: 'rgba(255,255,255,0.2)',
	                }
	            },
	            axisLabel: {
	               color: '#00DEFF',
	            }
	      },{
	          type: 'category',
	          position: "bottom",
	          data: [],
	          boundaryGap: false,
	          splitLine: {
	            	show: true,
	                lineStyle: {
	                    color: "rgba(255,255,255,0.2)"
	                }
	            },
	            axisTick: {
	          	  show: false,
	            },
	            axisLine: {
	            	lineStyle: {
	                	color: 'rgba(255,255,255,0.2)',
	                }
	            },
	            axisLabel: {
	               color: '#00DEFF',
	            }
	      }],
	      yAxis: [{
	    	  type: 'value',
	          nameTextStyle:{
	          	color: '#00DEFF',
	          },
	          name: "",
	          splitLine: {
	            	show: true,
	                lineStyle: {
	                    color: "rgba(255,255,255,0.2)"
	                }
	            },
	            axisTick: {
	          	  show: false,
	            },
	            axisLine: {
	            	lineStyle: {
	                	color: 'rgba(255,255,255,0.2)',
	                }
	            },
	            axisLabel: {
	               color: '#00DEFF',
	            }
	      },{
	    	  type: 'value',
	          nameTextStyle:{
	            	color: '#00DEFF',
	           },
	          name: "",
	          axisLabel: {
	          	show: true,
		        color: "#00DEFF"
	          },
	          axisLine:{
	          	show: false,
	      	},
	      	splitLine: {
	      		show: false,
	          },
	      }],
	      series: [{
	          type: 'pictorialBar',
	          name: "能耗增加值",
	          xAxisIndex: 1,
	          barWidth : '200%',
	          barCategoryGap: '-40%',
	          symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
	          itemStyle: {
	          	color: {
	                  type: 'linear',
	                  x: 0,
	                  y: 0,
	                  x2: 0,
	                  y2: 1,
	                  colorStops: [{
	                      offset: 0, color: 'rgba(255,226,65,1)' 
	                  }, {
	                      offset: 1, color: 'rgba(255,168,65,0.1)'
	                  }],
	                  global: false 
	              },
	              opacity:0.6,
	          },
	          data: [],
	      },{
	      	type: "line",
	      	symbol: 'circle',
	      	symbolSize: 8,
	        name: "增长率",
	        yAxisIndex:1,
	        data: [],
	        itemStyle: {
	          	borderWidth: 2,
	            color: '#00FFFF'
	        }
	      }]
	  };
	
	//竖向双条形图配置
	var doubleBarOption = {
	    tooltip: {
	    	show:true,
	    	trigger: "axis",
	        axisPointer: {
	        	type: "shadow",
	        },
	    },
	    legend: {
	    	show: false,
	    	/* data: [
	            { name: '主营业务收入', icon: 'circle'},
	            { name: '利税', icon: 'circle'}
	        ], */
	        data: ['主营业务收入','利税'],
	        selected: {
	        	'主营业务收入': true,
		  		'利税': true,
		  	}
	    },
	    grid: {
	    	top: '10%',
	    	left: '2%',
	        right: '2%',
	        bottom: '2%',
	        containLabel: true
	    },
	    xAxis: {
	    	type: 'value',
			axisLabel: {
				color:"#989CB8",
				fontSize:11
			},
			axisLine: {
				show: true,
				lineStyle:{
					color:'#989CB8',
					opacity:0.5
				}
			},
			axisTick: {
				show: false,
			},
			splitLine: {
				show: true,
				lineStyle:{
					color:'rgba(152,156,184,0.3)',
					opacity:0.3
				}
			},
	    },
	    yAxis: [{
	    	type : 'category',
	    	data : [],
	    	inverse:true,
			axisLabel: {
				color:"#989CB8",
				fontSize:12
			},
			axisTick: {
				show: false
			},
			axisLine: {
				show: true,
				lineStyle:{
					color:'#989CB8',
					opacity:0.5
				}
			},
			zlevel: 99
	    }],
	    series: [{
	        name: '主营业务收入',
	        type: "bar",
	        barWidth: 10,
	        barCategoryGap: '60%',
	        itemStyle: {
			    normal: {
			    	barBorderRadius:[10, 10, 10, 10],
			        color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
			            offset: 0,
			            color: '#65B5FF'
			        },{
			            offset: 1,
			            color: '#2FFFD1'
			        }]),
			        opacity: 1,
			    },
			    label: {
					show: true,
					position: 'right',
					textStyle: {
						color: '#fff',
						fontSize: 12
					}
				}
	        },
	        data: ["234","23","43","146","76","86","54","35","198","45","26"],
	    },{
	        name: '利税',
	        type: "bar",
	        barWidth: 10,
	        barCategoryGap: '60%',
	        itemStyle: {
	        	normal: {
	        		barBorderRadius:[10, 10, 10, 10],
	            	color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
	                    offset: 0,
	                    color: '#FF903E'
	                }, {
	                    offset: 1,
	                    color: '#FFD154'
	                }]),
	                opacity: 1,
	            },
	            label: {
					show: true,
					position: 'right',
					textStyle: {
						color: '#fff',
						fontSize: 12
					}
				}
	        },
	        data: ["123","23","45","56","34","135","45","76","127","23","53"]
	    },]
	}
</script>
</html>