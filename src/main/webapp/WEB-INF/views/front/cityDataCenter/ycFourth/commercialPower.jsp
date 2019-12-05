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
<title>工业用电</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="${orgId}">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
	</form>
	<%@ include file="header.jsp"%>
	<div class="content fz0">
		<div class="pro-left">
 	        <ul class="production" style="position: relative;">
				<li class="first-li" val1="2" val2="index1_code2" val3="主要经济指标">
					<div class="product-type">主要经济指标</div>
				</li>
				<li class="first-li on" val1="3" val2="index1_code3" val3="工业用电">
					<div class="product-type">工业用电</div>
				</li>
				<li class="first-li" val1="4" val2="index1_code4" val3="区县经济指标"> 
					<div class="product-type">区县经济指标</div>
				</li>
				<li class="first-li" val1="5" val2="index1_code5" val3="园区经济指标"> 
					<div class="product-type">园区经济指标</div>
				</li>
				<li class="first-li" val1="7" val2="index1_code6" val3="八大产业"> 
					<div class="product-type">八大产业</div>
				</li>
				<li class="first-li" val1="8" val2="index1_code7" val3="十大基地"> 
					<div class="product-type">十大基地</div>
				</li>
			    <li class="first-li" val1="26" val2="index1_code8" val3="规上企业"> 
					<div class="product-type">规上企业</div>
				</li>
				<li class="first-li" val1="" > 
					<div class="product-type">企业融资</div>
				</li>
				<li class="first-li" val1="27" val2="index1_code9" val3="规上企业纳税"> 
					<div class="product-type">规上企业纳税</div>
				</li>
				<li class="first-li" val1="23" val2="index1_code10" val3="产品价格趋势"> 
					<div class="product-type">产品价格趋势</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div class="nav-title">
		    	<div class="nav">
					<div class="nav-text">
						<div class="nav-titleName" onclick="toYdgk()">
							<img src="${ctx}/static/image/cityDataCenter/ycNew/barIcon.png">
							<font>工业用电</font>
						</div>
						<div class="tab-eightIndustry" id="index" onclick="">
						   	<span id="ydgk" name="title"  data="" class="on">用电概况</span>
						   	<span id="ycsgxq" name="title"  data="">宜春市各县区</span>
						   	<span id="jxsgsqs" name="title"  data="">江西省各设区市</span>
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
				</div> 
		    </div>
			<div class="cxtabs on">
				<div class="content-tab" id="tab1">
					<div class="blockStyle" style="height: 55%;">
						<div class="state_header">
							<img src="${ctx}/static/image/cityDataCenter/ycNew/point.png" height="21">
							<div class="selects" style="display: inline-block; vertical-align: middle;">
								<div class="select" style="font-size: 18px;">
									<p>宜春市</p><!-- <i class="fa fa-caret-down"></i> -->
									<!-- <ul>
										<li></li>
									</ul> -->
								</div>
							</div>
							<div class="stateScreenBar">
								<div id="statisticalMethod" class="stateScreen">
									<span id="lj" class="on">累计</span>
									<span id="by">本月</span>
								</div>
								<div id="industryType" class="stateScreen">
									<span id="gy" class="on">工业</span>
									<span id="zzy">制造业</span>
								</div>
							</div>
						</div>
						<div class="spanStyle" style="width: 20%; height: calc(100% - 48px);">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="electricDataFlex">
									<div class="electricDataMain">
										<div>
											<div class="electricTitle"><span id="ydType" class="purpleT">工业用电</span>&nbsp;-&nbsp;<span id="ydStatistics">本月</span></div>
											<div class="electricValue purpleT"><font id="ydCount">0</font>万千瓦时</div>
											<!-- <div class="electricValue">未公布</div> -->
										</div>
									</div>
									<div class="electricData">
										<div>
											<div class="electricTitle">同比增长</div>
											<div class="electricValue orangeT"><font id="ydGrowth">0</font>%</div>
										</div>
									</div>
									<div class="electricData">
										<div>
											<div class="electricTitle">增幅全省排名</div>
											<div class="electricValue blueT"><font id="ydRanking">0</font>名</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="spanStyle" style="width: calc(80% - 10px); height: calc(100% - 48px);">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tab-links" style="display: inline-block; position: absolute; top: 12px; left: 15px; z-index: 10;">
									<span class="on">宜春市<font id="ydYear">2018</font>年<font id="ydBarType">工业用电</font>情况(单位：万千瓦时)</span>
								</div>
								<div class="" id="chart1" style="height: 100%;"></div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(45% - 10px);">
						<div id="piePicture" class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tab-links">
									<span class="on">宜春<font id="ydPieStatistics">本月</font>用电占比统计(单位：万千瓦时)</span>
								</div>
								<div class="pieTitle">
									<span><font>工业用电</font></span>
									<span><font>农业用电</font></span>
									<span><font>三产用电</font></span>
									<span><font>建筑业用电</font></span>
									<span><font>居民用电</font></span>
								</div>
								<div class="" id="chart2" style="height: calc(100% - 24px);"></div>
							</div>
						</div>
						<div id="ratioPicture" class="spanStyle" style="display: none;">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tab-links">
									<span class="on">宜春制造业占工业用电比统计</span>
								</div>
								<div class="ratio-table">
									<table>
										<tbody id="ratioTable"></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content-tab" id="tab2" style="display: none;">
					<div class="spanStyle">
						<div class="ydDataTableBar">
							<div class="stateScreenBar">
								<div id="" class="stateScreen">
									<span id="cityLj" class="on">累计</span>
									<span id="cityBy">本月</span>
								</div>
								<div id="" class="stateScreen">
									<span id="cityGy" class="on">工业</span>
									<span id="cityZzy">制造业</span>
								</div>
							</div>
							<div class="ydDataTable">
								<div class="tableTitle">
									<font id="cityYdYear"></font>年<font id="cityYdMonth"></font>月全市各县（市、区）<font id="cityYdType">工业用电</font>情况
									<div class="unitTip">单位：万千瓦时</div>
								</div>
								<div style="width: 100%; height: 370px; line-height: 370px; text-align: center;" id="chart3"></div>
								<div id="cityYdTable" class="ratio-table" style="width: 100%;">
									<table class="" style="float: left; width: 94%;">
										<thead id="cityYdThead"></thead>
										<tbody id="cityYdTbody"></tbody>
									</table>
									<table id="cityRatioTable" class="" style="display: none; float: left; width: 94%;">
										<!-- <thead id="cityRatioThead"></thead> -->
										<tbody id="cityRatioTbody"></tbody>
									</table>
									<div style="clear: both;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content-tab" id="tab3" style="display: none;">
					<div class="spanStyle">
						<div class="ydDataTableBar">
							<div class="stateScreenBar">
								<div id="" class="stateScreen">
									<span id="proLj" class="on">累计</span>
									<span id="proBy">本月</span>
								</div>
								<div id="" class="stateScreen">
									<span id="proGy" class="on">工业</span>
									<span id="proZzy">制造业</span>
								</div>
							</div>
							<div class="ydDataTable">
								<div class="tableTitle">
									<font id="proYdYear"></font>年<font id="proYdMonth"></font>月全省各设区市<font id="proYdType">工业用电</font>情况
									<div class="unitTip">单位：万千瓦时</div>
								</div>
								<div style="width: 100%; height: 370px; line-height: 370px; text-align: center;" id="chart4"></div>
								<div id="proYdTable" class="ratio-table" style="width: 100%;">
									<table class="" style="float: left; width: 94%;">
										<thead id="proYdThead"></thead>
										<tbody id="proYdTbody"></tbody>
									</table>
									<table id="proRatioTable" class="" style="display: none; float: left; width: 94%;">
										<!-- <thead id="proRatioThead"></thead> -->
										<tbody id="proRatioTbody"></tbody>
									</table>
									<div style="clear: both;"></div>
								</div>
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
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript">
var barData = '';//条形图数据
var pieData = '';//饼图数据
var cityBarData = '';//市级条形图数据
var proBarData = '';//省级条形图数据
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
$(function(){
	$(".head>a:eq(1)").addClass("on");
	//初始化
	getselectYear();
	getDefaultDate(360900,1);

	getBarData();
	getPieData();
	//getRatioData();
	
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v1 = $(this).attr("val1");
		var v2 = $(this).attr("val2");
		var v3 = $(this).attr("val3");
		if(v1!=''){
			checkRight(v1,'',v2,v3);
		} else { alert("建设中!")}
	});
	//下拉框点击事件
	$(document).click(function(event){
		if(!$(".select p").is(event.target) && $(".select p").has(event.target).length === 0){
			$('.select-items').slideUp();
		}
	});
	$(".select p").on("click",function(){
		if($(this).next().css("display")!='block'){
			$(".select p").next().slideUp();
		}
		$(this).next().slideToggle();
	})
	//菜单栏切换事件
	$("#index>span").on("click",function(){
		var ind = $(this).index()+1;
		$(this).addClass("on").siblings().removeClass("on");
		$(".content-tab").fadeOut("fast");
		setTimeout(function(){
			$("#tab"+ind).fadeIn("fast");
		},210);
		//初始化
		if(ind == 1){
			getDefaultDate(360900,1);
			setTimeout(function(){
				getBarData();
				judgePieorRatio();
			},300)
		}else if(ind == 2){
			getDefaultDate(360900,1);
			setTimeout(function(){
				getCityBarData();
			},300)
		}else if(ind == 3){
			getDefaultDate(360000,0);
			setTimeout(function(){
				getProRatioData();
			},300)
		}else{}
	})
	//模块切换事件
	$(".stateScreen>span").on("click",function(){
		$(this).addClass("on").siblings().removeClass("on");
		
		if($("#ydgk").hasClass("on")){
			setTimeout(function(){
				getBarData();
				judgePieorRatio();
			},300)
		}else if($("#ycsgxq").hasClass("on")){
			setTimeout(function(){
				getCityBarData();
			},300)
		}else if($("#jxsgsqs").hasClass("on")){
			setTimeout(function(){
				getProRatioData();
			},300)
		}else{}
	})
});
//跳转用电概况
function toYdgk(){
	$("#ydgk").addClass("on").siblings().removeClass("on");
	$(".content-tab").fadeOut("fast");
	setTimeout(function(){
		$("#tab1").fadeIn("fast");
	},210);
	getDefaultDate(360900,1);
	setTimeout(function(){
		getBarData();
		judgePieorRatio();
	},300)
}
//设置年份及年月点击事件
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    for(var i=y; 2015<i+1;i--){
    	$('.select #sy').append('<li>'+i+'</li>');
    }
    
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		if($(this).parent().attr('id')=='sy'){
			//修改下拉组件默认值
 			$('#selectYear').text($(this).text());
			//修改隐藏属性
 			$('#year').val($(this).text());
			//修改标题年份及调用查询数据方法
 			if($("#ydgk").hasClass("on")){
	 			$("#ydYear").text($(this).text());
 				setTimeout(function(){
 					getBarData();
 					judgePieorRatio();
 				},300)
 			}else if($("#ycsgxq").hasClass("on")){
 				$("#cityYdYear").text($(this).text());
 				setTimeout(function(){
 					getCityBarData();
 				},300)
 			}else if($("#jxsgsqs").hasClass("on")){
 				$("#proYdYear").text($(this).text());
 				setTimeout(function(){
 					getProRatioData();
 				},300)
 			}else{}
		}else if($(this).parent().attr('id')=='sm'){
			//修改下拉组件默认值
			$('#selectMonth').text($(this).text());
			//修改隐藏属性
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			$('#month').val(month);
			//修改标题月份及调用查询数据方法
			if($("#ydgk").hasClass("on")){
				setTimeout(function(){
					getBarData();
					judgePieorRatio();
				},300)
			}else if($("#ycsgxq").hasClass("on")){
				$('#cityYdMonth').text(month);
				setTimeout(function(){
					getCityBarData();
				},300)
			}else if($("#jxsgsqs").hasClass("on")){
				$('#proYdMonth').text(month);
				setTimeout(function(){
					getProRatioData();
				},300)
			}else{}
		}else{}
	})
}
//获取最近有数据的年月
function getDefaultDate(orgId,kind){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/eleManagement/defYearAndMonth",
		type : "post",
		async:false, 
		data : {
			"orgId" : orgId,
			"kind" : kind
		},
		success : function(result) {
			if (result.success) {
				$('#selectYear').text(result.value.year);
				$('#selectMonth').text(result.value.month+"月");
				$('#year').val(result.value.year);
				$('#month').val(result.value.month);
				//初始化标题年份月份
				if($("#ydgk").hasClass("on")){
					$("#ydYear").text(result.value.year);
				}else if($("#ycsgxq").hasClass("on")){
					$("#cityYdYear").text(result.value.year);
					$('#cityYdMonth').text(result.value.month);
				}else if($("#jxsgsqs").hasClass("on")){
					$("#proYdYear").text(result.value.year);
					$('#proYdMonth').text(result.value.month);
				}else{}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
//根据状态判断饼图与表格的呈现
function judgePieorRatio(){
	if($("#by").hasClass("on")){
		if($("#gy").hasClass("on")){
			$("#piePicture").show();
			$("#ratioPicture").hide();
			getPieData();
		}else if($("#zzy").hasClass("on")){
			$("#piePicture").hide();
			$("#ratioPicture").show();
			getRatioData();
		}else{}
	}else if($("#lj").hasClass("on")){
		if($("#gy").hasClass("on")){
			$("#piePicture").show();
			$("#ratioPicture").hide();
			getPieData();
		}else if($("#zzy").hasClass("on")){
			$("#piePicture").hide();
			$("#ratioPicture").show();
			getRatioData();
		}else{}
	}
}
//根据状态判断需要显示的值
function judgeElectricData(result){
	var info = result.value.list[$('#month').val()-1];
	if(info != undefined && info != ""){
		$("#ydCount").parent().removeClass("notPublish");
		$("#ydCount").removeClass("fz0");
		$("#ydCount").parent().removeClass("fz0");
		$("#ydGrowth").parent().removeClass("notPublish");
		$("#ydGrowth").removeClass("fz0");
		$("#ydGrowth").parent().removeClass("fz0");
		$("#ydRanking").parent().removeClass("notPublish");
		$("#ydRanking").removeClass("fz0");
		$("#ydRanking").parent().removeClass("fz0");
		$(".pieTitle").show();
		
		if($("#by").hasClass("on")){
			if($("#gy").hasClass("on")){
				$("#ydCount").text(info.US_GYYDL_VALUE1);
				$("#ydGrowth").text(info.US_GYYDL_PERCENT1);
				$("#ydRanking").text(info.US_GYYDL_ORDER1);
			}else if($("#zzy").hasClass("on")){
				$("#ydCount").text(info.US_GYYDL_VALUE2);
				$("#ydGrowth").text(info.US_GYYDL_PERCENT2);
				$("#ydRanking").text(info.US_GYYDL_ORDER2);
			}else{}
		}else if($("#lj").hasClass("on")){
			if($("#gy").hasClass("on")){
				$("#ydCount").text(info.AC_GYYDL_VALUE1);
				$("#ydGrowth").text(info.AC_GYYDL_PERCENT1);
				$("#ydRanking").text(info.AC_GYYDL_ORDER1);
			}else if($("#zzy").hasClass("on")){
				$("#ydCount").text(info.AC_GYYDL_VALUE2);
				$("#ydGrowth").text(info.AC_GYYDL_PERCENT2);
				$("#ydRanking").text(info.AC_GYYDL_ORDER2);
			}else{}
		}else{}
	}else{
		$("#ydCount").parent().addClass("notPublish");
		$("#ydCount").addClass("fz0");
		$("#ydCount").parent().addClass("fz0");
		$("#ydGrowth").parent().addClass("notPublish");
		$("#ydGrowth").addClass("fz0");
		$("#ydGrowth").parent().addClass("fz0");
		$("#ydRanking").parent().addClass("notPublish");
		$("#ydRanking").addClass("fz0");
		$("#ydRanking").parent().addClass("fz0");
		$(".pieTitle").hide();
	}
}
//获取条形图数据
function getBarData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/eleManagement/jsonList",
		type : "post",
		data : {
			"orgId" : $('#orgId').val()=='3609009'?'360900':"360900",
			"year" : $('#year').val(),
			"month" : 12,//$('#month').val(),
			"type" : 4
		},
		success : function(result) {
			if (result.success) {
				barData = result.value.list;
				barChart();
				//修改页面显示标识
				if($("#by").hasClass("on")){
					$("#ydStatistics").text("本月");
					$("#ydPieStatistics").text("本月");
					
					if($("#gy").hasClass("on")){
						$("#ydType").text("工业用电");
						$("#ydBarType").text("工业用电");
					}else if($("#zzy").hasClass("on")){
						$("#ydType").text("制造业用电");
						$("#ydBarType").text("制造业用电");
					}else{}
				}else if($("#lj").hasClass("on")){
					$("#ydStatistics").text("累计");
					$("#ydPieStatistics").text("累计");
					
					if($("#gy").hasClass("on")){
						$("#ydType").text("工业用电");
						$("#ydBarType").text("工业用电");
					}else if($("#zzy").hasClass("on")){
						$("#ydType").text("制造业用电");
						$("#ydBarType").text("制造业用电");
					}else{}
				}else{}
				
				judgeElectricData(result);
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
//获取饼状图数据
function getPieData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/eleManagement/jsonList",
		type : "post",
		data : {
			"orgId" : $('#orgId').val()=='3609009'?'360900':"360900",
			"year" :  $('#year').val(),
			"month" : $('#month').val(),
			"type" : 2
		},
		success : function(result) {
			if (result.success) {
				pieData = result.value.list;
				if($("#by").hasClass("on")){
					pieChart(1);
				}else if($("#lj").hasClass("on")){
					pieChart(2);
				}else{}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
//获取表格数据
function getRatioData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/eleManagement/jsonList",
		type : "post",
		data : {
			"orgId" : $('#orgId').val()=='3609009'?'360900':"360900",
			"year" : $('#year').val(),
			"month" : 12,//$('#month').val(),
			"type" : 4
		},
		success : function(result) {
			if (result.success) {
				barData = result.value.list;
				if(barData != null && barData !='' && barData != '[]'){
					var _div = '<tr><th>宜春市</th><th>1月</th><th>2月</th><th>3月</th><th>4月</th><th>5月</th><th>6月</th><th>7月</th><th>8月</th><th>9月</th><th>10月</th><th>11月</th><th>12月</th></tr>';
						_div += '<tr>';
							_div += '<td>占比</td>';
						for(var i=0;i<12;i++){
							var info = barData[i];
							if(info != undefined && info != ""){
								if($("#by").hasClass("on")){
									if(info.US_GYYDL_VALUE1 != undefined && info.US_GYYDL_VALUE1 != ""){
										_div += '<td>'+ ((info.US_GYYDL_VALUE2/info.US_GYYDL_VALUE1)*100).toFixed(2) +'%</td>';
									}else{
										_div += '<td>未公布</td>';
									}
								}else if($("#lj").hasClass("on")){
									if(info.US_GYYDL_VALUE1 != undefined && info.US_GYYDL_VALUE1 != ""){
										_div += '<td>'+ ((info.AC_GYYDL_VALUE2/info.AC_GYYDL_VALUE1)*100).toFixed(2) +'%</td>';
									}else{
										_div += '<td>未公布</td>';
									}
								}else{}
							}else{
								_div += '<td>未公布</td>';
							}
						}
						_div += '</tr>';
						/* _div += '<tr>';
							_div += '<td>占比全省排名 </td>';
						for(var i=0;i<12;i++){
							var info = barData[i];
							if(info != undefined && info != ""){
								if(info.US_GYYDL_VALUE_ORDER2 != undefined && info.US_GYYDL_VALUE_ORDER2 != ""){
									_div += '<td>'+ info.US_GYYDL_VALUE_ORDER2 +'</td>';
								}else{
									_div += '<td>未公布</td>';
								}
							}else{
								_div += '<td>未公布</td>';
							}
						}
						_div += '</tr>'; */
					$("#ratioTable").html(_div);
				}else{
					$("#ratioTable").html("<font style='font-size: 48px; color: #D5D5D5;'>未公布</font>");
					return;
				}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
//获取市级条形图数据
function getCityBarData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/eleManagement/jsonList",
		type : "post",
		data : {
			"orgId" : "360900",
			"year" : $('#year').val(),
			"month" : $('#month').val(),
			"type" : 3
		},
		success : function(result) {
			if (result.success) {
				cityBarData = result.value.list;
				if($("#cityBy").hasClass("on")){
					cityBarChart(1);
				}else if($("#cityLj").hasClass("on")){
					cityBarChart(2);
				}else{}
				
				if($("#cityGy").hasClass("on")){
					$("#cityYdType").text("工业用电");
				}else if($("#cityZzy").hasClass("on")){
					$("#cityYdType").text("制造业用电");
				}else{}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
//获取省级条形图数据
function getProRatioData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/eleManagement/jsonList",
		type : "post",
		data : {
			"orgId" : "360000",
			"year" : $('#year').val(),
			"month" : $('#month').val(),
			"type" : 1
		},
		success : function(result) {
			if (result.success) {
				proBarData = result.value.list;
				if($("#proBy").hasClass("on")){
					proBarChart(1);
				}else if($("#proLj").hasClass("on")){
					proBarChart(2);
				}else{}
				
				if($("#proGy").hasClass("on")){
					$("#proYdType").text("工业用电");
				}else if($("#proZzy").hasClass("on")){
					$("#proYdType").text("制造业用电");
				}else{}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}


function barChart(){   //用电情况
	if(barData != null && barData !='' && barData != '[]'){
		
	}else{
		$("#chart1").html("<font style='font-size: 48px; color: #D5D5D5;'>未公布</font>");
		return;
	}
	
	var thisMonth = [];//本月或累计
	var lastMonth = [];//去年同期
	var growthRate = [];//增长率
	var xAxisData = [];//x轴呈现
	var legendData = [];//图例数据
	var series1Name = "";//数据第一条名称
	
	if($("#by").hasClass("on")){
		if($("#gy").hasClass("on")){
			for(var i=0;i<barData.length;i++){
				var info = barData[i];
				thisMonth.push(info.US_GYYDL_VALUE1);
				lastMonth.push(info.USLY_GYYDL_VALUE1);
				growthRate.push(info.US_GYYDL_PERCENT1);
			}
		}else if($("#zzy").hasClass("on")){
			for(var i=0;i<barData.length;i++){
				var info = barData[i];
				thisMonth.push(info.US_GYYDL_VALUE2);
				lastMonth.push(info.USLY_GYYDL_VALUE2);
				growthRate.push(info.US_GYYDL_PERCENT2);
			}
		}else{}
	}else if($("#lj").hasClass("on")){
		if($("#gy").hasClass("on")){
			for(var i=0;i<barData.length;i++){
				var info = barData[i];
				thisMonth.push(info.AC_GYYDL_VALUE1);
				lastMonth.push(info.ACLY_GYYDL_VALUE1);
				growthRate.push(info.AC_GYYDL_PERCENT1);
			}
		}else if($("#zzy").hasClass("on")){
			for(var i=0;i<barData.length;i++){
				var info = barData[i];
				thisMonth.push(info.AC_GYYDL_VALUE2);
				lastMonth.push(info.ACLY_GYYDL_VALUE2);
				growthRate.push(info.AC_GYYDL_PERCENT2);
			}
		}else{}
	}
	
	if($("#by").hasClass("on")){
		legendData = ['本月', '去年同期', '增长率'];
		series1Name = "本月";
		xAxisData = ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月 ','12月 '];
	}else if($("#lj").hasClass("on")){
		legendData = ['累计', '去年同期', '增长率'];
		series1Name = "累计";
		xAxisData = ['1月','1-2月','1-3月','1-4月','1-5月','1-6月','1-7月','1-8月','1-9月','1-10月','1-11月 ','1-12月 '];
	}
	
	var chart1 = echarts.init(document.getElementById('chart1'));
	var barOption = {
	    tooltip: {
	    	trigger: "axis",
	        axisPointer: {
	        	type: "shadow",
	        },
	    },
	    legend: {
	    	data: legendData,
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
	    xAxis: {
	        type: 'category',
	        data: xAxisData,
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
	    },
	    yAxis: [{
	    	type : 'value',
			axisLabel : {
				formatter : '{value}'
			},
			axisLine : {
				show : false,
				lineStyle: {
	                color: '#83adba'
	            }
			},
			axisTick : {
				show : false
			},
			splitLine: {
	            lineStyle: {
	                color: '#57617B',
	                opacity:0
	            }
	        },
	        splitArea: {
	            show: false
	        },
	    },{
	    	type : 'value',
			axisLabel : {
				formatter : '{value}%'
			},
			axisLine : {
				show : false,
				lineStyle: {
	                color: '#83adba'
	            }
			},
			axisTick : {
				show : false
			},
	        splitLine: {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        splitArea: {
	            show: false
	        },
	    }],
	    series: [{
	        name: series1Name,
	        type: "bar",
	        barWidth: 10,
	        barGap: 1,
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
	        data: thisMonth
	    },{
	        name: "去年同期",
	        type: "bar",
	        barWidth: 10,
	        barGap: 1,
	        itemStyle: {
	            normal: {
	            	color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                    offset: 0,
	                    color: '#89D91B'
	                }, {
	                    offset: 1,
	                    color: '#CEF054'
	                }]),
	                opacity: 1,
	            }
	        },
	        data: lastMonth
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
	        data: growthRate
	    },]
	}
	chart1.setOption(barOption);
}
function pieChart(type){
	if(pieData != null && pieData !='' && pieData != '[]'){
		
	}else{
		$("#chart2").html("<font style='font-size: 48px; color: #D5D5D5;'>未公布</font>");
		return;
	}
	
	var gyydl_value_us = '';
	var gyydl_value_ac = ''; 
	var gyydl_gy_value_us = '';
	var gyydl_gy_value_ac = '';
	var gyydl_ny_value_us = '';
	var gyydl_ny_value_ac = '';
	var gyydl_sc_value_us = '';
	var gyydl_sc_value_ac = '';
	var gyydl_jz_value_us = '';
	var gyydl_jz_value_ac = '';
	var gyydl_jm_value_us = '';
	var gyydl_jm_value_ac = '';
	
	var tsfs = 40;
	if(width<=1600){
		tsfs = 35;
	}
	
	var value = [gyydl_value_us, gyydl_value_ac,
		gyydl_gy_value_us, gyydl_gy_value_ac, 
		gyydl_ny_value_us, gyydl_ny_value_ac, 
		gyydl_sc_value_us, gyydl_sc_value_ac,
		gyydl_jz_value_us, gyydl_jz_value_ac,
		gyydl_jm_value_us, gyydl_jm_value_ac];
	
	var fields = ['gyydl_value_us', 'gyydl_value_ac', 
		'gyydl_gy_value_us', 'gyydl_gy_value_ac',
		'gyydl_ny_value_us', 'gyydl_ny_value_ac',
		'gyydl_sc_value_us', 'gyydl_sc_value_ac',
		'gyydl_jz_value_us', 'gyydl_jz_value_ac',
		'gyydl_jm_value_us', 'gyydl_jm_value_ac'] 
	
	for(var i=0;i<pieData.length;i++){
		var info = pieData[i];
		if(info.organization_name=='宜春市'){
			continue;
		}
		for(var j=0;j<fields.length;j++){
			if(!isNaN(info[fields[j]])){
				value[j] = Number(value[j]) + Number(info[fields[j]]);
			}
		}
	}
	
	var xAxis = ['总量', '工业用电', '农业用电', '第三产业用电', '建筑业用电','居民生活用电'];
	
	/* var label_us = {
		show:false,
		normal: {
            formatter: function(params){
            	var percent = params.data.value*100/Number(value[0]);
            	return percent.toFixed(1) + '%';
            },
            position: 'center',
            textStyle: {
                fontSize: 28
            }
        }
    };
	
	var label_ac = {
		show:false,
		normal: {
            formatter: function(params){
            	var percent = params.data.value*100/Number(value[1]);
            	return percent.toFixed(1) + '%';
            },
            position: 'center',
            textStyle: {
                fontSize: 28
            }
        }
    }; */
	
	/* var label1 = {
		normal: {
            formatter: '\n\n工业用电',
            position: 'center',
            textStyle: {
                fontSize: 18,
                color: '#000'
            }
        }
    }; 
    
	var label2 = {
        normal: {
            formatter: '\n\n农业用电',
            position: 'center',
            textStyle: {
                fontSize: 18,
                color: '#000'
            }
        }
    }; 
	
	var label3 = {
        normal: {
            formatter: '\n\n第三产业\n用电',
            position: 'center',
            textStyle: {
                fontSize: 18,
                color: '#000'
            }
        }
    }; 
	
	var label4 = {
            normal: {
                formatter: '\n\n建筑业用电',
                position: 'center',
                textStyle: {
                    fontSize: 18,
	                color: '#000'
                }
            }
        }; 
	
	var label5 = {
        normal: {
            formatter: '\n\n居民生活\n用电',
            position: 'center',
            textStyle: {
                fontSize: 18,
                color: '#000'
            }
        }
    };  */
	
	var labelTop = {
	    normal : {
	    	color: '#002e73',
	        label : {
	            show : false,
	        },
	        labelLine : {
	            show : false
	        }
	    }
	};
	var labelBottom_us = {
	    normal : {
	        color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                    offset: 0, color: '#0095ee' // 0% 处的颜色
                }, {
                    offset: 1, color: '#002e73' // 100% 处的颜色
                }],
                globalCoord: false // 缺省为 false
            },
	        label : {
	        	formatter: function(params){
	            	var percent = params.data.value*100/Number(value[0]);
	            	return percent.toFixed(1) + '%';
	            },
            	fontSize: '30',
	            position: 'center',
	            show : true,
	            position : 'center',
	            textStyle: {
	            	fontSize: '40',
	            	color: '#39aee0',
	            }
	        },
	        labelLine : {
	            show : false
	        }
	    },
	    emphasis: {
	        color: '#0689FF'
	    }
	};
	var labelBottom_ac = {
	    normal : {
	        color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                    offset: 0, color: '#0095ee' // 0% 处的颜色
                }, {
                    offset: 1, color: '#002e73' // 100% 处的颜色
                }],
                globalCoord: false // 缺省为 false
            },
	        label : {
	        	formatter: function(params){
	            	var percent = params.data.value*100/Number(value[1]);
	            	return percent.toFixed(1) + '%';
	            },
	            position: 'center',
	            show : true,
	            position : 'center',
	            textStyle: {
	            	fontSize: tsfs,
	            	color: '#39aee0',
	            }
	        },
	        labelLine : {
	            show : false
	        }
	    },
	    emphasis: {
	        color: '#0689FF'
	    }
	};
	
	var seriesUs1 = [{name:'工业用电',value:value[2].toFixed(0), itemStyle:labelBottom_us}, {name:'总量',value:(value[0] - value[2]).toFixed(0), itemStyle:labelTop}];
	var seriesUs2 = [{name:'农业用电',value:value[4].toFixed(0), itemStyle:labelBottom_us}, {name:'总量',value:(value[0] - value[4]).toFixed(0), itemStyle:labelTop}];
	var seriesUs3 = [{name:'第三产业用电',value:value[6].toFixed(0), itemStyle:labelBottom_us}, {name:'总量',value:(value[0] - value[6]).toFixed(0), itemStyle:labelTop}];
	var seriesUs4 = [{name:'建筑业用电',value:value[8].toFixed(0), itemStyle:labelBottom_us}, {name:'总量',value:(value[0] - value[8]).toFixed(0), itemStyle:labelTop}];
	var seriesUs5 = [{name:'居民生活用电',value:value[10].toFixed(0), itemStyle:labelBottom_us}, {name:'总量',value:(value[0] - value[10]).toFixed(0), itemStyle:labelTop}];
	
	var seriesAc1 = [{name:'工业用电',value:value[3].toFixed(0), itemStyle:labelBottom_ac}, {name:'总量',value:(value[1] - value[3]).toFixed(0), itemStyle:labelTop}];
	var seriesAc2 = [{name:'农业用电',value:value[5].toFixed(0), itemStyle:labelBottom_ac}, {name:'总量',value:(value[1] - value[5]).toFixed(0), itemStyle:labelTop}];
	var seriesAc3 = [{name:'第三产业用电',value:value[7].toFixed(0), itemStyle:labelBottom_ac}, {name:'总量',value:(value[1] - value[7]).toFixed(0), itemStyle:labelTop}];
	var seriesAc4 = [{name:'建筑业用电',value:value[9].toFixed(0), itemStyle:labelBottom_ac}, {name:'总量',value:(value[1] - value[9]).toFixed(0), itemStyle:labelTop}];
	var seriesAc5 = [{name:'居民生活用电',value:value[11].toFixed(0), itemStyle:labelBottom_ac}, {name:'总量',value:(value[1] - value[11]).toFixed(0), itemStyle:labelTop}];
	
	setTimeout(function(){
		var chart2 = null;
		var series = [];
		if(type==1){//本月
			chart2 = echarts.init(document.getElementById('chart2'));
			pieOption.series[0].data = seriesUs1;
			pieOption.series[1].data = seriesUs2;
			pieOption.series[2].data = seriesUs3;
			pieOption.series[3].data = seriesUs4;
			pieOption.series[4].data = seriesUs5;
		}else{//累计
			chart2 = echarts.init(document.getElementById('chart2'));
			pieOption.series[0].data = seriesAc1;
			pieOption.series[1].data = seriesAc2;
			pieOption.series[2].data = seriesAc3;
			pieOption.series[3].data = seriesAc4;
			pieOption.series[4].data = seriesAc5;
		}
		chart2.setOption(pieOption);
	}, 200);
}

var pieOption = {
	tooltip: {
		trigger: 'item'
	},
    legend: {
    	show: false,
        orient: 'horizontal',
        bottom: '15%',
        itemWidth:35,
		itemHeight:15,
		itemGap: 60,
   		data:['总量', '工业用电', '农业用电', '第三产业用电', '建筑业用电', '居民生活用电']
    },
    //color: ['#38ACFF','#D8D8D8','#51CD13','#4896EB','#e03e70','#FA9217'],
    series: [{
        type: 'pie',
        radius : ['55%', '70%'],
        center: ['10%', '45%'],
    },{
        type: 'pie',
        radius : ['55%', '70%'],
        center: ['30%', '45%'],
    },{
        type: 'pie',
        radius : ['55%', '70%'],
        center: ['50%', '45%'],
    },{
        type: 'pie',
        radius : ['55%', '70%'],
        center: ['70%', '45%'],
    },{
        type: 'pie',
        radius : ['55%', '70%'],
        center: ['90%', '45%'],
    }]  
};

function cityBarChart(type){
	if (cityBarData != null && cityBarData != '' && cityBarData != '[]') {
		$("#cityYdTable").show();
	} else {
		$("#cityYdTable").hide();
		$("#chart3").html("<font style='font-size: 48px; color: #D5D5D5;'>未公布</font>");
		return;
	}

	var xAxis = [];
	var seriesUs1 = [];
	var seriesUs2 = [];
	var seriesUs3 = [];
	var seriesUs4 = [];

	var seriesAc1 = [];
	var seriesAc2 = [];
	var seriesAc3 = [];
	var seriesAc4 = [];
	
	if($("#cityBy").hasClass("on")){
		cityBarOption.legend.data = ['本月', '去年同期', '增长率'];
		cityBarOption.series[0].name = "本月";
	}else if($("#cityLj").hasClass("on")){
		cityBarOption.legend.data = ['累计', '去年同期', '增长率'];
		cityBarOption.series[0].name = "累计";
	}else{}

	for(var i = 0; i < cityBarData.length; i++){
		var info = cityBarData[i];

		if (info.organization_name == '宜春市'
				|| info.organization_name == '其中：丰电'){
			continue;
		}
		xAxis.push(info.organization_name);
		if($("#cityGy").hasClass("on")){
			seriesUs1.push(info.gyydl_gy_value_us);
			seriesUs2.push(info.gyydl_gy_value_us_last);
			seriesUs4.push(info.gyydl_gy_percent_us);
			seriesUs3.push(info.gyydl_gy_order_us);
			seriesAc1.push(info.gyydl_gy_value_ac);
			seriesAc2.push(info.gyydl_gy_value_ac_last);
			seriesAc4.push(info.gyydl_gy_percent_ac);
			seriesAc3.push(info.gyydl_gy_order_ac);
		}else if($("#cityZzy").hasClass("on")){
			seriesUs1.push(info.gyydl_zz_value_us);
			seriesUs2.push(info.gyydl_zz_value_us_last);
			seriesUs4.push(info.gyydl_zz_percent_us);
			seriesUs3.push(info.gyydl_zz_order_us);
			seriesAc1.push(info.gyydl_zz_value_ac);
			seriesAc2.push(info.gyydl_zz_value_ac_last);
			seriesAc4.push(info.gyydl_zz_percent_ac);
			seriesAc3.push(info.gyydl_zz_order_ac);
		}else{}
	}

	var seriesUs = [ seriesUs1, seriesUs2, seriesUs4, seriesUs3 ];
	var seriesAc = [ seriesAc1, seriesAc2, seriesAc4, seriesAc3 ];

	if(type == 1){
		var chart = echarts.init(document.getElementById('chart3'));
		cityBarOption.xAxis[0].data = xAxis;
		cityBarOption.series[0].data = seriesUs1;
		cityBarOption.series[1].data = seriesUs2;
		cityBarOption.series[2].data = seriesUs4;
		chart.setOption(cityBarOption);

		$("#cityYdThead").empty();
		$("#cityYdTbody").empty();

		var tr = '<tr><th width="8.4%" style="background-color:transparent!important;">&nbsp;</th>';
		for (var m = 0; m < xAxis.length; m++) {
			tr += '<th width="8.3%" >' + xAxis[m] + '</th>';
		}
		$("#cityYdThead").append(tr + '</tr>');

		for (var j = 0; j < 4; j++) {
			var tr = '<tr>';
			if (j == 0) {
				tr += '<td>本月</td>';
			}
			if (j == 1) {
				tr += '<td>去年同期</td>';
			}
			if (j == 2) {
				tr += '<td>增速%</td>';
			}
			if (j == 3) {
				tr += '<td>排名</td>';
			}
			for (var m = 0; m < seriesUs[j].length; m++) {
				tr += '<td>' + seriesUs[j][m] + '</td>';
			}
			$("#cityYdTbody").append(tr + '</tr>');
		}
	}else{
		var chart = echarts.init(document.getElementById('chart3'));
		cityBarOption.xAxis[0].data = xAxis;
		cityBarOption.series[0].data = seriesAc1;
		cityBarOption.series[1].data = seriesAc2;
		cityBarOption.series[2].data = seriesAc4;
		chart.setOption(cityBarOption);

		$("#cityYdThead").empty();
		$("#cityYdTbody").empty();

		var tr = '<tr><th width="8.4%" style="background-color:transparent!important;">&nbsp;</th>';
		for (var m = 0; m < xAxis.length; m++) {
			tr += '<th width="8.3%">' + xAxis[m] + '</th>';
		}
		$("#cityYdThead").append(tr + '</tr>');
		
		for (var j = 0; j < 4; j++) {
			var tr = '<tr>';
			if (j == 0) {
				tr += '<td>累计</td>';
			}
			if (j == 1) {
				tr += '<td>去年同期</td>';
			}
			if (j == 2) {
				tr += '<td>增速%</td>';
			}
			if (j == 3) {
				tr += '<td>排名</td>';
			}
			for (var m = 0; m < seriesAc[j].length; m++) {
				tr += '<td>' + seriesAc[j][m] + '</td>';
			}
			$("#cityYdTbody").append(tr + '</tr>');
		}
	}

	if($("#cityGy").hasClass("on")){
		$("#cityRatioTable").hide()
	}else if($("#cityZzy").hasClass("on")){
		$("#cityRatioTable").show()
		
		var seriesRatioUs1 = [];
		var seriesRatioUs2 = [];
	
		var seriesRatioAc1 = [];
		var seriesRatioAc2 = [];
	
		for(var i = 0; i < cityBarData.length; i++){
			var info = cityBarData[i];
	
			if (info.organization_name == '宜春市'
					|| info.organization_name == '其中：丰电') {
				continue;
			}
	
			//xAxis.push(info.organization_name);
			seriesRatioUs1.push(info.gyydl_gy_value_us);
			seriesRatioUs2.push(info.gyydl_zz_value_us);
	
			seriesRatioAc1.push(info.gyydl_gy_value_ac);
			seriesRatioAc2.push(info.gyydl_zz_value_ac);
		}
	
		var seriesRatioUs = [ seriesRatioUs1, seriesRatioUs2 ];
		var seriesRatioAc = [ seriesRatioAc1, seriesRatioAc2 ];
	
		if(type == 1){
			$("#cityRatioThead").empty();
			$("#cityRatioTbody").empty();
	
			var tr = '<tr><th width="8.4%" style="background-color:transparent!important;">&nbsp;</th>';
			for (var m = 0; m < xAxis.length; m++) {
				tr += '<th width="8.3%">' + xAxis[m] + '</th>';
			}
			$("#cityRatioThead").append(tr + '</tr>');
	
			var tr1 = '<tr><td>本月占比</td>';
			var percentArr = [];
			for(var m=0; m<seriesRatioUs[0].length; m++){
				var percent = seriesRatioUs[1][m]*100/seriesRatioUs[0][m];
				if(percent!=null&&percent!=undefined&&percent!=''&&!isNaN(percent)){
					percent = percent.toFixed(1);
				}else{
					percent = '';
				}
				percentArr.push(Number(percent));
				if(percent!=''){				
					percent = Number(percent).toFixed(1)+'%';
				}
				tr1 += '<td>'+percent+'</td>';
			}
			$("#cityRatioTbody").append(tr1+'</tr>');
			
			var arr = new Array();
			for(var i = 0; i < percentArr.length; i++){
				arr.push(percentArr[i]);
			}
			
			percentArr.sort(sortNum);
			
			var sort = 0;
			var map = new Map();
		    for(var i = 0; i < percentArr.length; i++){
		    	if(i>0 && percentArr[i]==percentArr[i-1]){
		    		
		    	}else{
		    		if(i>sort){
		    			sort = i;
		    		}
			    	sort ++ ;		    			
		    	}
		    	map.set(Number(percentArr[i]), sort);
		    }
			
			var tr2 = '<tr><td>排名</td>';
			for(var m=0; m<arr.length; m++){
				tr2 += '<td>'+map.get(arr[m])+'</td>';
			}
			$("#cityRatioTbody").append(tr2+'</tr>');
		}else{
			$("#cityRatioThead").empty();
			$("#cityRatioTbody").empty();
	
			var tr = '<tr><th width="8.4%" style="background-color:transparent!important;">&nbsp;</th>';
			for (var m = 0; m < xAxis.length; m++) {
				tr += '<th width="8.3%">' + xAxis[m] + '</th>';
			}
			$("#cityRatioThead").append(tr + '</tr>');
	
			var tr1 = '<tr><td>本月占比</td>';
			var percentArr = [];
			for(var m=0; m<seriesRatioAc[0].length; m++){
				var percent = seriesRatioAc[1][m]*100/seriesRatioAc[0][m];
				if(percent!=null&&percent!=undefined&&percent!=''&&!isNaN(percent)){
					percent = percent.toFixed(1);
				}else{
					percent = '';
				}
				percentArr.push(Number(percent));
				if(percent!=''){				
					percent = Number(percent).toFixed(1)+'%';
				}
				tr1 += '<td>'+percent+'</td>';
			}
			$("#cityRatioTbody").append(tr1+'</tr>');
			
			var arr = new Array();
			for(var i = 0; i < percentArr.length; i++){
				arr.push(percentArr[i]);
			}
			
			percentArr.sort(sortNum);
			
			var sort = 0;
			var map = new Map();
		    for(var i = 0; i < percentArr.length; i++){
		    	if(i>0 && percentArr[i]==percentArr[i-1]){
		    		
		    	}else{
		    		if(i>sort){
		    			sort = i;
		    		}
			    	sort ++ ;		    			
		    	}
		    	map.set(Number(percentArr[i]), sort);
		    }
			
			var tr2 = '<tr><td>排名</td>';
			for(var m=0; m<arr.length; m++){
				tr2 += '<td>'+map.get(arr[m])+'</td>';
			}
			$("#cityRatioTbody").append(tr2+'</tr>');
		}
	}else{}
}
var cityBarOption = {
	title : {
		text : '',
		x : 'center',
		textStyle : {
			color : "#666",
			fontSize : 16
		}
	},
	tooltip : {
		trigger : 'axis'
	},
	legend : {
		data: ['本月', '去年同期', '增长率'],
		top : '5%',
		x : 'center',
		textStyle : {
			fontSize : 14,
			color: "#fff"
		},
		itemWidth : 35,
		itemHeight : 15,
		itemGap : 50,
	},
	grid : {
		top : '20%',
		bottom : '-3%',
		left : '5%',
		right : '5%',
		containLabel : true,
	},
	xAxis : [{
		type : 'category',
		boundaryGap : true,
		show : false,
		data : [],
		axisLine : {
			show : false
		},
		axisTick : {
			show : false
		},
		axisLabel : {
			interval : 0,
			rotate : 0
		}
	}],
	yAxis : [{
		type : 'value',
		axisLabel : {
			formatter : '{value}'
		},
		axisLine : {
			show : false,
			lineStyle: {
                color: '#83adba'
            }
		},
		axisTick : {
			show : false
		},
		splitLine: {
            lineStyle: {
                color: '#57617B',
                opacity:0
            }
        },
        splitArea: {
            show: false
        },
	},{
		type : 'value',
		axisLabel : {
			formatter : '{value}%'
		},
		axisLine : {
			show : false,
			lineStyle: {
                color: '#83adba'
            }
		},
		axisTick : {
			show : false
		},
        splitLine: {
            lineStyle: {
                color: '#57617B'
            }
        },
        splitArea: {
            show: false
        },
	}],
	series : [{
		name: "本月",
        type: "bar",
        barWidth: 10,
        yAxisIndex : 0,
        barGap: 1,
        data: [],
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
        label : {
			normal : {
				show : true,
				position : 'top'
			}
		}
	},{
		name: "去年同期",
        type: "bar",
        barWidth: 10,
        yAxisIndex : 0,
        data: [],
        barGap: 1,
        itemStyle: {
            normal: {
            	color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#89D91B'
                }, {
                    offset: 1,
                    color: '#CEF054'
                }]),
                opacity: 1,
            }
        },
        label : {
			normal : {
				show : true,
				position : 'top'
			}
		}
	},{
		name: "增长率",
        type: "line",
        yAxisIndex: 1,
        symbolSize:10,
        data: [],
        itemStyle: {
            normal: {
                color: "#df2229",
            }
        },
        label : {
			normal : {
				show : true,
				position : 'top'
			}
		}
	}]
};

function proBarChart(type){
	if(proBarData != null && proBarData != '[]' && proBarData != ''){
		if(proBarData.length == 1 && proBarData[0].organization_name == '全省'){
			$("#proYdTable").hide();
			$("#chart4").html("<font style='font-size: 48px; color: #D5D5D5;'>未公布</font>");
			return;
		}else{
			$("#proYdTable").show();
		}
	}else{
		$("#proYdTable").hide();
		$("#chart4").html("<font style='font-size: 48px; color: #D5D5D5;'>未公布</font>");
		return;
	}
	
	var xAxis = [];
	var seriesUs1 = [];
	var seriesUs2 = [];
	var seriesUs3 = [];
	var seriesUs4 = [];
	
	var seriesAc1 = [];
	var seriesAc2 = [];
	var seriesAc3 = [];
	var seriesAc4 = [];
	
	if($("#proBy").hasClass("on")){
		proBarOption.legend.data = ['本月', '去年同期', '增长率'];
		proBarOption.series[0].name = "本月";
	}else if($("#proLj").hasClass("on")){
		proBarOption.legend.data = ['累计', '去年同期', '增长率'];
		proBarOption.series[0].name = "累计";
	}else{}
	
	for(var i=0;i<proBarData.length;i++){
		var info = proBarData[i];
		if(info.organization_name=='全省'){
			continue;
		}
		xAxis.push(info.organization_name);
		if($("#proGy").hasClass("on")){
			seriesUs1.push(info.gyydl_value_by);
			seriesUs2.push(info.gyydl_value_by_last);
			seriesUs4.push(info.gyydl_percent_by);
			seriesUs3.push(info.gyydl_order_by);
			seriesAc1.push(info.gyydl_value);
			seriesAc2.push(info.gyydl_value_last);
			seriesAc4.push(info.gyydl_percent);
			seriesAc3.push(info.gyydl_order);
		}else if($("#proZzy").hasClass("on")){
			seriesUs1.push(info.gyydl_zc_value_by);
			seriesUs2.push(info.gyydl_zc_value_by_last);
			seriesUs4.push(info.gyydl_zc_percent_by);
			seriesUs3.push(info.gyydl_zc_order_by);
			seriesAc1.push(info.gyydl_zc_value);
			seriesAc2.push(info.gyydl_zc_value_last);
			seriesAc4.push(info.gyydl_zc_percent);
			seriesAc3.push(info.gyydl_zc_order);
		}else{}
	}
	
	var seriesUs = [seriesUs1, seriesUs2, seriesUs4, seriesUs3];
	var seriesAc = [seriesAc1, seriesAc2, seriesAc4, seriesAc3];
	
	if(type==1){
		var chart = echarts.init(document.getElementById('chart4'));
		proBarOption.xAxis[0].data=xAxis;
		proBarOption.series[0].data=seriesUs1;
		proBarOption.series[1].data=seriesUs2;
		proBarOption.series[2].data=seriesUs4;
		chart.setOption(proBarOption);
		
		$("#proYdThead").empty();
		$("#proYdTbody").empty();
		
		var tr = '<tr><th width="8.4%" style="background-color:transparent!important;">&nbsp;</th>';
		for(var m=0; m<xAxis.length; m++){
			tr += '<th width="8.3%">'+xAxis[m]+'</th>';
		}
		$("#proYdThead").append(tr+'</tr>');
		
		for(var j=0;j<4;j++){
			var tr = '<tr>';
			if(j==0){tr += '<td>本月</td>';}
			if(j==1){tr += '<td>去年同期</td>';}
			if(j==2){tr += '<td>增速%</td>';}
			if(j==3){tr += '<td>排名</td>';}
			for(var m=0; m<seriesUs[j].length; m++){
				tr += '<td>'+seriesUs[j][m]+'</td>';
			}
			$("#proYdTbody").append(tr+'</tr>');
		}
	}else{
		var chart = echarts.init(document.getElementById('chart4'));
		proBarOption.xAxis[0].data=xAxis;
		proBarOption.series[0].data=seriesAc1;
		proBarOption.series[1].data=seriesAc2;
		proBarOption.series[2].data=seriesAc4;
		chart.setOption(proBarOption);
		
		$("#proYdThead").empty();
		$("#proYdTbody").empty();
		
		var tr = '<tr><th width="8.4%" style="background-color:transparent!important;">&nbsp;</th>';
		for(var m=0; m<xAxis.length; m++){
			tr += '<th width="8.3%">'+xAxis[m]+'</th>';
		}
		$("#proYdThead").append(tr+'</tr>');
		
		for(var j=0;j<4;j++){
			var tr = '<tr>';
			if(j==0){tr += '<td>累计</td>';}
			if(j==1){tr += '<td>去年同期</td>';}
			if(j==2){tr += '<td>增速%</td>';}
			if(j==3){tr += '<td>排名</td>';}
			for(var m=0; m<seriesAc[j].length; m++){
				tr += '<td>'+seriesAc[j][m]+'</td>';
			}
			$("#proYdTbody").append(tr+'</tr>');
		}
	}
	
	if($("#proGy").hasClass("on")){
		$("#proRatioTable").hide();
	}else if($("#proZzy").hasClass("on")){
		$("#proRatioTable").show();
		
		var seriesRatioUs1 = [];
		var seriesRatioUs2 = [];
		
		var seriesRatioAc1 = [];
		var seriesRatioAc2 = [];
		
		for(var i=0;i<proBarData.length;i++){
			var info = proBarData[i];
			if(info.organization_name=='全省'){
				continue;
			}
			//xAxis.push(info.organization_name);
			seriesRatioUs1.push(info.gyydl_value_by);
			seriesRatioUs2.push(info.gyydl_zc_value_by);
			
			seriesRatioAc1.push(info.gyydl_value);
			seriesRatioAc2.push(info.gyydl_zc_value);
		}
		
		var seriesRatioUs = [seriesRatioUs1, seriesRatioUs2];
		var seriesRatioAc = [seriesRatioAc1, seriesRatioAc2];
		
		if(type==1){
			$("#proRatioThead").empty();
			$("#proRatioTbody").empty();
			
			var tr = '<tr><th width="8.4%" style="background-color:transparent!important;">&nbsp;</th>';
			for(var m=0; m<xAxis.length; m++){
				tr += '<th width="8.3%">'+xAxis[m]+'</th>';
			}
			$("#proRatioThead").append(tr+'</tr>');
			
			var tr1 = '<tr><td>本月占比</td>';
			var percentArr = [];
			for(var m=0; m<seriesRatioUs[0].length; m++){
				var percent = seriesRatioUs[1][m]*100/seriesRatioUs[0][m];
				if(percent!=null&&percent!=undefined&&percent!=''&&!isNaN(percent)){
					percent = percent.toFixed(1);
				}else{
					percent = '';
				}
				percentArr.push(Number(percent));
				if(percent!=''){				
					percent = Number(percent).toFixed(1)+'%';
				}
				if(m%2==0){
					tr1 += '<td>'+percent+'</td>';
				}else{
					tr1 += '<td class="bg2">'+percent+'</td>';
				}
			}
			$("#proRatioTbody").append(tr1+'</tr>');
			
			var arr = new Array();
			for(var i = 0; i < percentArr.length; i++){
				arr.push(percentArr[i]);
			}
			
			percentArr.sort(sortNum);
			
			var sort = 0;
			var map = new Map();
		    for(var i = 0; i < percentArr.length; i++){
		    	if(i>0 && percentArr[i]==percentArr[i-1]){
		    		
		    	}else{
		    		if(i>sort){
		    			sort = i;
		    		}
			    	sort ++ ;		    			
		    	}
		    	map.set(Number(percentArr[i]), sort);
		    }
			
			var tr2 = '<tr><td>排名</td>';
			for(var m=0; m<arr.length; m++){
				if(m%2==0){
					tr2 += '<td>'+map.get(arr[m])+'</td>';
				}else{
					tr2 += '<td class="bg2">'+map.get(arr[m])+'</td>';
				}
			}
			$("#proRatioTbody").append(tr2+'</tr>');
		}else{
			$("#proRatioThead").empty();
			$("#proRatioTbody").empty();
			
			var tr = '<tr><th width="8.4%" style="background-color:transparent!important;">&nbsp;</th>';
			for(var m=0; m<xAxis.length; m++){
				tr += '<th width="8.3%">'+xAxis[m]+'</th>';
			}
			$("#proRatioThead").append(tr+'</tr>');
			
			
			var tr1 = '<tr><td>本月占比</td>';
			var percentArr = [];
			for(var m=0; m<seriesRatioAc[0].length; m++){
				var percent = seriesRatioAc[1][m]*100/seriesRatioAc[0][m];
				if(percent!=null&&percent!=undefined&&percent!=''&&!isNaN(percent)){
					percent = percent.toFixed(1);
				}else{
					percent = '';
				}
				percentArr.push(Number(percent));
				if(percent!=''){				
					percent = Number(percent).toFixed(1)+'%';
				}
				if(m%2==0){
					tr1 += '<td>'+percent+'</td>';
				}else{
					tr1 += '<td class="bg2">'+percent+'</td>';
				}
			}
			$("#proRatioTbody").append(tr1+'</tr>');

			var arr = new Array();
			for(var i = 0; i < percentArr.length; i++){
				arr.push(percentArr[i]);
			}
			
			percentArr.sort(sortNum);
			
			var sort = 0;
			var map = new Map();
		    for(var i = 0; i < percentArr.length; i++){
		    	if(i>0 && percentArr[i]==percentArr[i-1]){
		    		
		    	}else{
		    		if(i>sort){
		    			sort = i;
		    		}
			    	sort ++ ;		    			
		    	}
		    	map.set(Number(percentArr[i]), sort);
		    }
			
			var tr2 = '<tr><td>排名</td>';
			for(var m=0; m<arr.length; m++){
				if(m%2==0){
					tr2 += '<td>'+map.get(arr[m])+'</td>';
				}else{
					tr2 += '<td class="bg2">'+map.get(arr[m])+'</td>';
				}
			}
			$("#proRatioTbody").append(tr2+'</tr>');
		}
	}else{}
}
var proBarOption = {
	title : {
		text : '',
		x:'center',
		textStyle : {
			color : "#666",
			fontSize : 16
		}
	},
	tooltip : {
		trigger : 'axis'
	},
	legend : {
		data: ['本月', '去年同期', '增长率'],
		top : '5%',
		x : 'center',
		textStyle : {
			fontSize : 14,
			color: "#fff"
		},
		itemWidth : 35,
		itemHeight : 15,
		itemGap : 50,
    },
	grid : {
		top:'20%',
		bottom:'-3%',
		left:'5%',
		right:'5%',
		containLabel : true,
	},
	xAxis : [ {
		type : 'category',
		boundaryGap : true,
		show: false,
		data : [],
		axisLine : {
			show:false
		},
		axisTick : {
			show:false
		},
		axisLabel :{  
       	    interval:0,
       	    rotate:0
       	}
	} ],
	yAxis : [{
		type : 'value',
		axisLabel : {
			formatter : '{value}'
		},
		axisLine : {
			show : false,
			lineStyle: {
                color: '#83adba'
            }
		},
		axisTick : {
			show : false
		},
		splitLine: {
            lineStyle: {
                color: '#57617B',
                opacity:0
            }
        },
        splitArea: {
            show: false
        },
    },{
    	type : 'value',
		axisLabel : {
			formatter : '{value}%'
		},
		axisLine : {
			show : false,
			lineStyle: {
                color: '#83adba'
            }
		},
		axisTick : {
			show : false
		},
        splitLine: {
            lineStyle: {
                color: '#57617B'
            }
        },
        splitArea: {
            show: false
        },
    }],
	series : [{
		name: "本月",
        type: "bar",
        barWidth: 10,
        yAxisIndex : 0,
        barGap: 1,
        data: [],
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
        label : {
			normal : {
				show : true,
				position : 'top'
			}
		}
	},{
		name: "去年同期",
        type: "bar",
        barWidth: 10,
        yAxisIndex : 0,
        data: [],
        barGap: 1,
        itemStyle: {
            normal: {
            	color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#89D91B'
                }, {
                    offset: 1,
                    color: '#CEF054'
                }]),
                opacity: 1,
            }
        },
        label : {
			normal : {
				show : true,
				position : 'top'
			}
		}
	},{
		name: "增长率",
        type: "line",
        yAxisIndex: 1,
        symbolSize:10,
        data: [],
        itemStyle: {
            normal: {
                color: "#df2229",
            }
        },
        label : {
			normal : {
				show : true,
				position : 'top'
			}
		}
	}]
};
function sortNum(a,b){
	return b-a;
}
</script>
</html>