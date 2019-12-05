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
<script type="text/javascript" src="${ctx}/static/js/dataCenter/organizationCountConfig.js"></script>
<title>主要产品价格</title>
</head>
<body class="gray-bg">
    <%@ include file="header.jsp"%>
    <div class="content fz0">
		<input type="hidden" id="lastYear1" value="">
		<input type="hidden" id="lastMonth1" value="">
		<input type="hidden" id="lastYear2" value="">
		<input type="hidden" id="lastMonth2" value="">
		<input type="hidden" id="lastYear3" value="">
		<input type="hidden" id="lastMonth3" value="">
		<input type="hidden" id="proId" value="">
            <div class="pro-left">
		         <ul class="production" style="position: relative;">
					<li class="first-li" val1="2" val2="index1_code2" val3="主要经济指标">
						<div class="product-type">主要经济指标</div>
					</li>
					<li class="first-li" val1="3" val2="index1_code3" val3="工业用电">
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
					<li class="first-li on" val1="23" val2="index1_code10" val3="产品价格趋势"> 
						<div class="product-type">产品价格趋势</div>
					</li>
				</ul>
	         </div>
	         <div class="pro-right">
	         	<div style="height:100%;padding-top:10px;">
					<div class="blockStyle" style="height: 50%;">
			            <div class="spanStyle" style="width: 50%;">
			                 <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar" style="cursor: pointer;">
						           	<span class="tabCaption">主要产品价格</span>
									<div class="fr selects">
										<div class="select">
											<p><font id="eightYear"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items priceSelect">
												<ul id="eightUl1">
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="eightMonth"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items priceSelect">
												<ul id="eightUl2">
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
			                 	<div class="part-content reusltContent">
			                 		<div class="tab price-table1">
						   				<div class="table-title">
						   					<span class="dib">产品名称</span>
						   					<span class="dib">单位</span>
						   					<span class="dib" style="text-align: right;">平均价格<small>(元)</small></span>
						   					<span class="dib" style="text-align: right;">同比增减</span>
										</div>
										<div class="table-content">
											<table id="industryList" onmouseenter="loopPause()" onmouseleave="loopStart()">
												<tr>
													<td>碳酸锂</td>
													<td>吨</td>
													<td>1000</td>
													<td>0</td>
												</tr>
											</table>
										</div>
			                 		</div>
				         		</div>
				         	 </div>
				         </div>
						<div class="spanStyle" style="width: calc(50% - 10px);">
				             <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar tab-links" style="cursor: pointer;">
						           <span class="on">平均价格每月走势图</span>
									<div class="fr selects">
										<div class="select">
											<p><font id="mYear"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items priceSelect">
												<ul id="mUl">
												</ul>
											</div>
										</div>
									</div>
					            </div>
								<div class="part-content reusltContent">
					         		<div class="eight-map">
				         				<div class="mapContent" id="chart1"></div>
					         			<div class="map-title" id="proName"></div>
				         			</div>
				         	     </div>
				              </div>
				         </div>
					</div>
					<div class="blockStyle" style="height: calc(50% - 10px);">
			     		<div class="spanStyle" style="width: 50%;">
			     		     <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
						            <span class="on">平均价格历年趋势对比</span>
									<div class="fr selects">
										<div class="select">
											<p><font id="yMonth"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items priceSelect">
												<ul id="yUl">
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
								<div class="part-content reusltContent priceChart2">
					         		<div class="eight-map">
				         				<div class="mapContent" id="chart2"></div>
				         			</div>
			         		   </div>
			     		     </div>
			         	</div>
			         	<div class="spanStyle" style="width: calc(50% - 10px);">
			         	      <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar tab-links" id="rateSpan">
						            <span class="on">连续涨价产品</span>
						            <span class="noBorderLeft">连续降价产品</span>
									<div class="fr selects">
										<div class="select">
											<p><font id="rateYear"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items priceSelect">
												<ul id="rateUl1">
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="rateMonth"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items priceSelect">
												<ul id="rateUl2">
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
								<div class="part-content reusltContent">
			                 		<div class="tab price-table2">
						   				<div class="table-title">
						   					<span class="dib">产品名称</span>
						   					<span class="dib" id="t1">近期增幅时段</span>
						   					<span class="dib" id="t2" style="text-align: right;">累计增长幅度</span>
										</div>
										<div class="table-content table-scroll">
											<table id="rateList" style="height: 100%;">
												<tr>
													<td>碳酸锂</td>
													<td>吨</td>
													<td>0</td>
												</tr>
											</table>
										</div>
			                 		</div>
				         	   </div>
			         	     </div>
			         	</div>
					</div>
	         	</div>
		  </div>
     </div>
    
</body>
<%-- <script type="text/javascript" src="${ctx}/static/js/jquery-mousewheel.js"></script> --%>
<script type="text/javascript" src="${ctx}/static/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript">
var isLoading = false;
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
var loop = '';
var num = 0;
var length = 0;
var h1 = 0;
$(function(){
	$(".head>a:eq(1)").addClass("on");
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
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v1 = $(this).attr("val1");
		var v2 = $(this).attr("val2");
		var v3 = $(this).attr("val3");
		if(v1!=''){
			checkRight(v1,'',v2,v3);
		} else { alert("建设中!")}
	});
	getselectYear();
	getList(1);
	
	$("#rateSpan span").on("click",function(){
		$(this).addClass("on").siblings().removeClass("on");
		if($(this).index() == 0) {
			$("#t1").text("近期增幅时段");
			$("#t2").text("累计增长幅度");
		} else if($(this).index() == 1) {
			$("#t1").text("近期降幅时段");
			$("#t2").text("累计降低幅度");
		}
		initTable();
	})
	//表格鼠标滚轮事件
	$("#industryList").on('mousewheel',function(event, delta){
		var dir = delta > 0 ? 'Up' : 'Down';
		if (dir == 'Up') {
			if(num > 0){
				num--;
				$("#industryList").stop().animate({top: "-"+h1*num+"px"});
				$("#industryList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
			}
		} else {
			if(num < length){
				num++;
			} else {
				num = 1;
				$("#industryList").css({top: "0px"})
			}
			$("#industryList").stop().animate({top: "-"+h1*num+"px"});
			$("#industryList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
		}
		$('#proId').val($('#industryList tr.on').attr("val"));
		$('#proName').text($('#industryList tr.on').attr("val2"));
		getMap(0);
		getMap2(0);
	})
});
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    for(var i=y; i>2014;i--){
    	$('#eightUl1').append('<li>'+i+'</li>');
    	$('#mUl').append('<li>'+i+'</li>');
    	$('#rateUl1').append('<li>'+i+'</li>');
    }
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		$(".changeChart span:eq(0)").addClass("on").siblings().removeClass("on");
		if($(this).parent().attr('id')=='eightUl1'){
 			$('#eightYear').text($(this).text());
			getList(0);
		}else if($(this).parents().attr('id')=='eightUl2'){
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			$('#eightMonth').text(month);
			getList(0);
		}else if($(this).parents().attr('id')=='mUl'){
 			$('#mYear').text($(this).text());
			getMap(0);
		}else if($(this).parents().attr('id')=='yUl'){
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
 			$('#yMonth').text(month);
			getMap2(0);
		}else if($(this).parents().attr('id')=='rateUl1'){
 			$('#rateYear').text($(this).text());
 			getTable(0);
		}else if($(this).parents().attr('id')=='rateUl2'){
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
 			$('#rateMonth').text(month);
			getTable(0);
		}
	})
}
function getList(type){
	$.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/productionStatistics",
		type : "post",
		data : {
			"year": $('#eightYear').text(),
			"month": $('#eightMonth').text()
 		},
		dataType : "json",
		success : function(result) {
			if(result.success){
				if(type==1){
					$('#eightYear').text(result.year);
					$('#mYear').text(result.year);
					$('#rateYear').text(result.year);
					$('#eightMonth').text(result.month);
					$('#yMonth').text(result.month);
					$('#rateMonth').text(result.month);
					getTable();//只是为了获取年月，所以只触发一次该方法
				}
				var list = result.list;
				if(list&&list.length>0){
					$('#industryList').empty();
					$('#lastYear1').val($('#eightYear').text());
					$('#lastMonth1').val($('#eightMonth').text());
				    var div = "";
				    if(list.length > 7){
				    	for (var j=0;j<2;j++){
							for (var i=0;i<list.length;i++){
								var info = list[i];
							    div += '<tr onclick="loopChoose(this)" val="'+info.id+'" val2="'+info.productName+'">';
							    div += '<td>'+info.productName+'</td>';
							    div += '<td>'+info.productUnit+'</td>';
							    div += '<td>'+info.salePrice+'</td>';
							    div += '<td>'+info.growthRate+'%</td>';
							    div += '</tr>';
							}
					    }
				    }else{
				    	for (var i=0;i<list.length;i++){
							var info = list[i];
						    div += '<tr onclick="loopChoose(this)" val="'+info.id+'" val2="'+info.productName+'">';
						    div += '<td>'+info.productName+'</td>';
						    div += '<td>'+info.productUnit+'</td>';
						    div += '<td>'+info.salePrice+'</td>';
						    div += '<td>'+info.growthRate+'%</td>';
						    div += '</tr>';
						}
				    }
					$('#industryList').html(div);
					$('#industryList tr:eq(0)').addClass("on");
					$('#proId').val($('#industryList tr.on').attr("val"));
					$('#proName').text($('#industryList tr.on').attr("val2"));
					getMap(type);
					getMap2(type);
					
					h1 = $("#industryList tr").height();
					num = 0;
					length = list.length;
					if(loop != ''){
						loopPause();
						$("#industryList").animate({top: "-"+h1*num+"px"});
						$("#industryList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
					}
					loopStart();
				}else{
					alert($('#eightYear').text()+'年'+$('#eightMonth').text()+"未公布数据");
					$('#eightYear').text($('#lastYear1').val());
					$('#eightMonth').text($('#lastMonth1').val());
				}
			}else{
				tips("数据获取异常");
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function getMap(type){
	var year = type == 1 ? $('#eightYear').text() : $('#mYear').text()
    $.ajax({
		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/productionChart",
		type : "post",
		data : {
			id: $('#proId').val(),
			year: year
 		},
		dataType : "json",
		success : function(result) {
			console.log(result)
			if(result.success){
				loadBar(result.value)
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function getMap2(type){
	var month = type == 1 ? $('#eightMonth').text() : $('#yMonth').text()
    $.ajax({
		url : "${OfficeUrl}XOffice/interface/json/dataProductPrice/averagePrice",
		type : "post",
		data : {
			id: $('#proId').val(),
			month: month
 		},
		dataType : "json",
		success : function(result) {
			if(result.success){
				loadBar2(result.series1,result.series2,result.series3)
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
var tableData = '';
function getTable(){
	var month = $('#rateMonth').text();
	if(Number(month)<10){
		month = '0'+month;
		console.log(month);
	}
	var param = {
			month: month,
			year: $('#rateYear').text()
 		};
	console.log(param);
    $.ajax({
		url : "${OfficeUrl}XOffice/interface/json/dataProductPrice/zjChanPin",
		type : "post",
		data : {
			month: month,
			year: $('#rateYear').text()
 		},
		dataType : "json",
		success : function(result) {
			console.log(result)
			if(result.success){
				tableData = result;
				initTable();
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function initTable() {
    var div = "";
    var ind = $("#rateSpan span.on").index();
    var list = ind == 0 ? tableData.series1 : tableData.series2;
	for (var i=0;i<list.length;i++){
		var info = list[i];
		var date = info.year.split('-');
		var starDateYear = date[0].substring(0,4),
		starDateMonth = date[0].substring(4,6),
		endDateYear = date[1].substring(0,4),
		endDateMonth = date[1].substring(4,6);
		var areaDate = starDateYear + "." + starDateMonth + "-"+ endDateYear + "." + endDateMonth;
	    div += '<tr>';
	    div += '<td>'+info.productName+'</td>';
	    div += '<td>'+areaDate+'</td>';
	    if(info.growthRate == '0.0000%'){
	    	div += '<td style="text-align: right;padding-right: 30px;">'+info.growthRate+'</td>';
	    } else if(ind == 0){
	    	 div += '<td style="text-align: right;padding-right: 30px;">'+info.growthRate+'<img style="width: 10px;" src="${ctx}/static/image/cityDataCenter/jxNew/big-red-up.png" /></td>';
	    } else if(ind == 1){
	    	 div += '<td style="text-align: right;padding-right: 30px;">'+info.growthRate+'<img src="${ctx}/static/image/cityDataCenter/ycFourth/down.png" /></td>';
	    }
	    div += '</tr>';
	}
	if(list.length > 0){
		$("#rateList").html(div);
	} else {
		$("#rateList").html("<div class='noData'>暂无数据</div>");
	}
}
//表格定时滚动
function loopStart(){
	if(length > 7){
		loop = setInterval(function(){
			if(num < length){
				num++;
			} else {
				num = 1;
				$("#industryList").css({top: "0px"})
			}
			$("#industryList").animate({top: "-"+h1*num+"px"});
			$("#industryList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
			$('#proId').val($('#industryList tr.on').attr("val"));
			$('#proName').text($('#industryList tr.on').attr("val2"));
			getMap(0);
			getMap2(0);
		},5000)
	}
}
function loopPause(){
	clearInterval(loop);
}
function loopChoose(e){
	num = $(e).index();
	if(length > 7){
		if(num >= length){
			num = num - length;
			$("#industryList").css({top: "0px"})
		}
		$("#industryList").animate({top: "-"+h1*num+"px"});
	}
	$("#industryList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
	$('#proId').val($('#industryList tr.on').attr("val"));
	$('#proName').text($('#industryList tr.on').attr("val2"));
	getMap(0);
	getMap2(0);
}

function loadBar(d){
	$("#chart1").removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById("chart1"));
	var d1 = d;
	var option = {
	    tooltip: {
	        trigger: 'axis'
	    },
		title: {
			text: "单位：元",
			right: 10,
			textStyle: {
				color: '#00D8FF',
				fontSize: 12
			}
		},
		grid: {
			top: 30,
			left: '1%',
			right: '1%',
			bottom: 0,
			containLabel: true,
		},
		xAxis: [{
			type: 'category',
			axisLine: { //坐标轴轴线相关设置。数学上的x轴
				show: true,
				lineStyle: {
					color: '#233e64'
				},
			},
			axisLabel: { //坐标轴刻度标签的相关设置
				color: '#00DEFF',
				fontSize: 14
			},
			axisTick: { show: false,},
			data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
		}],
		yAxis: [{
			type: 'value',
			splitLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisLabel: {
				color: '#00DEFF',
				fontSize: 14
			},
			axisTick: { show: false}  
		}],
		series: [{
			type: 'line',
			smooth: false, //是否平滑曲线显示
			symbolSize: 4,
			itemStyle: {
				borderColor: '#0af'
			},
			lineStyle: {
				normal: {
					color: {
					    type: 'linear',
					    x: 1,
					    y: 0,
					    x2: 0,
					    y2: 0,
					    colorStops: [{
					        offset: 0, color: '#67F8B3' 
					    }, {
					        offset: 1, color: '#05A6FC' 
					    }],
					    global: false 
					},
					width: 4,
				}
			},
			areaStyle: { //区域填充样式
                normal: {
                 //线性渐变，前4个参数分别是x0,y0,x2,y2(范围0~1);相当于图形包围盒中的百分比。如果最后一个参数是‘true’，则该四个值是绝对像素位置。
                   color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
					   { offset: 0,  color: '#67F8B3'}, 
					   { offset: 0.7,  color: '#05A6FC'}
				   ], false),
				   opacity:0.2,
                   shadowColor: 'rgba(53,142,215, 0.9)', //阴影颜色
                   shadowBlur: 20 //shadowBlur设图形阴影的模糊大小。配合shadowColor,shadowOffsetX/Y, 设置图形的阴影效果。
	             }
	        },
			data: d1
		}]
	};
	if(d1&&d1.length>0){
		chart.setOption(option);
	}else{
		$("#chart1").html("<div class='noData'>暂无数据</div>");
	}
}

function loadBar2(d1,d2,d3) {
	$("#chart2").removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById("chart2"));
	var xd1,iced2,lined3;
	xd1 = d1.unshift('');
	xd1 = d1.push('');
	iced2 = d2.unshift('');
	lined3 = d3.unshift('');
	var option = {
		grid: {
			top: 40,
			left: 0,
			right: 0,
			bottom: 40,
			containLabel: true,
		},
		legend: {
	  	   show: true,
		   type: 'plain',
	  	   data: ['价格', '同比'],
	  	   itemWidth: 12,
	  	   itemHeight: 12,
	  	   bottom: 0,
	  	   left: 'center',
		   textStyle: {
		   		color: '#fff',
		  		fontSize: 12
		   }
		},
	    tooltip: {
	        trigger: 'axis'
	    },
	    xAxis: [{
			type: 'category',
			position: "bottom",
	        boundaryGap: false,
			axisLine: { //坐标轴轴线相关设置。数学上的x轴
				show: true,
				lineStyle: {
					color: '#233e64'
				},
			},
			axisLabel: { //坐标轴刻度标签的相关设置
				color: '#00DEFF',
				fontSize: 14
			},
			splitLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisTick: { show: false,},
            data: d1
        }],
	    yAxis: [{
	    	name: "价格 （元）",
	        nameTextStyle: {
	        	color: '#00DEFF',
	        	fontSize: 14,
	        },
        	nameGap: 20,
			splitLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisLabel: {
				color: '#00DEFF',
				fontSize: 14
			},
			axisTick: { show: false} 
	    }, {
	        type: "value",
	        name: "百分比",
	        nameGap: 20,
	        nameTextStyle: {
	        	color: '#00DEFF',
	        	fontSize: 14
	        },
			splitLine: {
				show: false
			},
			axisLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisLabel: {
				color: '#00DEFF',
				fontSize: 14,
				formatter: '{value} %',
			},
			axisTick: { show: false} 
	    }],
	    color: ['#e54035'],
	    series: [{
	            name: '价格',
	            type: 'pictorialBar',
	            barWidth : '200%',
	            barCategoryGap: '-40%',
	            symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
	            itemStyle: {
	                normal: {
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
	                emphasis: {
	                    opacity: 1
	                }
	            },
	            data: d2,
	        },
	        {
	        	symbol: 'circle',
	            symbolSize: 8,
	            name: "同比",
	            type: "line",
	            yAxisIndex: 1,
	            data: d3,
	            itemStyle: {
	                normal: {
	                	borderWidth: 2,
	                    color: '#00FFFF'
	                }
	            }
	        }
	    ]
	}
	if(d1&&d1.length>0){
		chart.setOption(option);
	}else{
		$("#chart2").html("<div class='noData'>暂无数据</div>");
 	} 
}
</script>
</html>