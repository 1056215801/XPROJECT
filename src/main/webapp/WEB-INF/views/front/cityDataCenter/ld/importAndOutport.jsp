<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<title>锂电大数据中心-进出口</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="${orgId}">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
		<input type="hidden" id="type" name="type" value="${type}">
		<input type="hidden" id="proId" name="proId" value="">
	</form>
	<%@ include file="header.jsp"%>
	<div class="container-fluid content2 container-fluid-new">
		<div class="main">
			<div class="pro-left">
				<ul class="production">
					<li class="first-li on">
						<div class="product-type">出口</div>
					</li>
					<li class="first-li">
						<div class="product-type">进口</div>
					</li>
				</ul>
			</div>
			<div class="pro-right" style="padding: 0; height: 100%;">
				<div class="tabTitleBar">
					<div class="tabTitle titles">
						<div class="title-box" id="tabTitle">
						</div>
				   	</div>
				   	<div class="title-arrow dib">
				   		<i class="fa fa-caret-left"></i>
				   		<i class="fa fa-caret-right on"></i>
				   	</div>
				   	<div class="tabDate">
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
			   	<div class="tabContentBar">
			   		<div class="tabContent" id="tab1">
			   			<div class="boxStyle" style="width: 100%; height: 50%;">
			   				<div class="logis-main">
								<div class="outsideBox">
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
									<div class="dataDisplayBar ver dib">
										<div class="dataDisplay">
											<i></i>
											<div class="verCenter">
												<div class="dataSurvey"><font class="m1">8</font>月产量（吨）</div>
												<div class="dataBrandValue">
													<span id="ec-byData1" class="dataBrandValue dib"></span>
													<span class="dataBrandValue dib">
														<ul class="dataNums inrow">
															<li class="dataOne ">
																<div class="dataBoc">
																	<div class="tt">
																		<span>.</span>
																	</div>
																</div>
															</li>
														</ul>
													</span>
													<span id="ec-byData2" class="dataBrandValue dib"></span>
												</div>
												<div class="dataRatio">
													<span>环比：</span><span class="dataRatioValue" id="d1">15.8%</span> 
													<span>同比：</span><span class="dataRatioValue" id="d2">37.5%</span>
												</div>
											</div>
										</div>
										<div class="dataDisplay">
											<i></i>
											<div class="verCenter">
												<div class="dataSurvey">1-<font class="m1">8</font>月产量（吨）</div>
												<div class="dataBrandValue">
													<span id="ec-ljData1" class="dataBrandValue dib"></span>
													<span class="dataBrandValue dib">
														<ul class="dataNums inrow">
															<li class="dataOne ">
																<div class="dataBoc">
																	<div class="tt" t="38">
																		<span class="">.</span>
																	</div>
																</div>
															</li>
														</ul>
													</span>
													<span id="ec-ljData2" class="dataBrandValue dib"></span>
												</div>
												<div class="dataRatio"> 
													<span>环比：</span><span class="dataRatioValue" id="d3">15.8%</span> 
													<span>同比：</span><span class="dataRatioValue" id="d4">37.5%</span>
												</div>
											</div>
										</div>
									</div>
									<div class="dib" style="width:calc(100% - 300px); height: 100%">
										<div class="tabCaptionBar">
											<span class="tabCaption"><font id="t1">EV乘用车</font>出口量及均价对照表</span>
										</div>
										<div class="world-map">
											<div class="echart-map" id="dzbChart"></div>
										</div>
									</div>
								</div>
						   </div>
			   			</div>
			   			<div class="boxStyle h50">
			   				<div class="logis-main w55">
								<div class="outsideBox">
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
									<div class="tabCaptionBar">
										<span class="tabCaption"><font id="t2">EV乘用车</font>出口数据统计（按产销国）</span>
									</div>
									<div class="tabContBar jck-table">
										<div class="tabCont">
											<div class="cpjg-bar">
												<span class="w14">产销国</span>
												<span class="w14">出口量<font>(吨)</font></span>
												<span class="w14">出口量环比</span>
												<span class="w15">出口量同比</span>
												<span class="w15">出口均价<font>(吨)</font></span>
												<span class="w14">出口均价环比</span>
												<span class="w14">出口均价同比</span>
											</div>
											<div class="cpjg">
												<table id="jckTable">
													<tr>
														<td class="w10">电解钴(≥99.8%/金、赞)</td>
														<td class="w15">吨</td>
														<td class="w15">470000</td>
														<td class="w15">470000</td>
														<td class="w15">470000</td>
														<td class="w15">470000</td>
														<td class="w15">470000</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
						   </div>
						   <div class="logis-main wm45">
								<div class="outsideBox">
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
									<div class="tabCaptionBar">
										<span class="tabCaption" style="width: calc(100% - 160px);"><font id="t3">EV乘用车</font>近五年出口量及增速</span>
										<div class="tabMenuBar" data="3">
											<i></i>
											<span class="tabMenu on">出口量</span>
											<span class="tabMenu">出口金额</span>
										</div>
									</div>
									<div class="tabContBar">
										<div class="tabCont" id="tab-ec-31">
											<div class="echart-map" id="chartBar1"></div>
											<div class="chart-table">
												<table>
													<tr id="tr1">
														<td>出口数量</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td></td>
													</tr>
													<tr id="tr2">
														<td>同比增长</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="tabCont" id="tab-ec-32">
											<div class="echart-map" id="chartBar2"></div>
											<div class="chart-table">
												<table>
													<tr id="tr3">
														<td>出口金额</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td></td>
													</tr>
													<tr id="tr4">
														<td>同比增长</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td>6147.16</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab2" style="display: none;">
			   			<div class="boxStyle" style="width: 100%; height: 100%;">
			   				<div class="logis-main">
								<div class="outsideBox">
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
									<div class="dataDisplayBar" id="noData">暂无数据</div>
								</div>
						   </div>
			   			</div>
			   		</div>
			   	</div>
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/liData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script>
$(function () {
	getselectYear();
	//左侧tab切换
	if('${type}' == 2) { $(".first-li:eq(2)").addClass("on").siblings().removeClass("on");}
	$(".first-li").on("click",function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#type").val(ind+1);
		getproList();
	})
	//下拉框点击事件
	$(".select p").on("click",function(){
		$(this).next().slideToggle();
	})
	
	$(".tabMenuBar .tabMenu").on("click",function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#tab-ec-3"+ind).fadeIn("fast").siblings().fadeOut("fast");
	})
	getproList();
});
var flag = true;
//获取产品列表
function getproList(){
	var param = {
		type: $("#type").val()
	}
	var url = '${OfficeUrl}XOffice/interface/json/importExport/titleJsonList';
	$.ajax({
		url : url,
		type: "post",
		data: param,
		dataType : "json",
		success : function(result) {
			if(result.success){
				var info = result.data;
				$('#selectYear').text(info.year);
				$('#year').val(info.year);
				$('#selectMonth').text(info.month + '月');
				$('#month').val(info.month);
				$('.m1').text(info.month);
				var d = '';
				for(var i = 0; i < info.data.length; i++){
					var infor = info.data[i];
					if(i == 0){ 
						d += '<span class="on" data="'+infor.batteryId+'">'+infor.batteryName+'('+infor.batteryCode+')</span>';
						$("#proId").val(infor.batteryId);
					}
					else {d += '<span data="'+infor.batteryId+'">'+infor.batteryName+'('+infor.batteryCode+')</span>'}
				}
				$("#tabTitle").html(d);
				//菜单栏切换事件
				$(".tabTitle span").on("click",function(){
					$(this).addClass("on").siblings().removeClass("on");
					$("#proId").val($(this).attr('data'));
					getProDetail();
				})
				//产品列表翻页
				if(info.data.length > 5) {
					$(".title-arrow").show();
				} else { $(".title-arrow").hide();}
				$(".title-arrow i").on("click",function(){
					var ind = $(this).index();
					var w = $("#tabTitle").width();
					var w2 = $("#tabTitle span").width();
					var l = $("#tabTitle").position().left;
					if(flag){
						if(ind == 0){
							if(l < 0){
								$("#tabTitle").css("left",l+w2);
								flag = false;
							}
						} else {
							console.log(l/w2 - 5)
							if(l/w2 - 5 > -info.data.length){
								$("#tabTitle").css("left",l-w2);
								flag = false;
							}
						}
						setTimeout(function(){ flag = true;}, 500);
					}
				})
				getProDetail();
			}
		}
	})
}
//获取产品详情
function getProDetail(){
	var param = {
		type: $("#type").val(),
		year: $("#year").val(),
		month : $("#month ").val(),
		batteryId : $("#proId").val()
	}
	var url = '${OfficeUrl}XOffice/interface/json/importExport/jsonData';
	$.ajax({
		url : url,
		type: "post",
		data: param,
		dataType : "json",
		success : function(result) {
			if(result.success){
				if(result.data.data){
					$("#tab2").fadeOut("fast");
					$("#tab1").fadeIn("fast");
					var d = result.data.data;
					//产量
					$("#ec-byData1").empty();
					$("#ec-byData2").empty();
					$("#ec-ljData1").empty();
					$("#ec-ljData2").empty();
					setTimeout(function(){
						var count1 = d.barData1.total;
						$("#ec-byData1").rollNum({
					    	deVal: count1.split('.')[0],
					    	digit: count1.split('.')[0].toString().length
					    });
						$("#ec-byData2").rollNum({
					    	deVal: count1.split('.')[1],
					    	digit: count1.split('.')[1].toString().length
					    });
						var count2 = d.barData1.grandTotal;
						$("#ec-ljData1").rollNum({
					    	deVal: count2.split('.')[0],
					    	digit: count2.split('.')[0].toString().length
					    });
						$("#ec-ljData2").rollNum({
					    	deVal: count2.split('.')[1],
					    	digit: count2.split('.')[1].toString().length
					    });
					},300)
					$("#d1").text(d.barData1.ratio+'%'); //占比数据
					$("#d2").text(d.barData1.per+'%');
					$("#d3").text(d.barData1.grandRatio+'%');
					$("#d4").text(d.barData1.grandPer+'%');
					var t1 = Number($("#year").val()) - 1 + '-' + $("#year").val() + '年' + $("#tabTitle .on").text();
					var t2 = $("#year").val() + '年' + $("#month").val() + '月' + $("#tabTitle .on").text();
					var t3 = '中国' + $("#tabTitle .on").text();
					$("#t1").text(t1);  //标题
					$("#t2").text(t2);
					$("#t3").text(t3);
					//对照表
					chartBar1(d.barData1);
					//数据统计
					var _div = '';
					for (var i = 0; i < d.listData.length; i++) {
						var info = d.listData[i];
						_div += '<tr>';
						_div += '<td class="w14">' + info.countryName + '</td>';
						_div += '<td class="w14">' + info.impValue + '</td>';
						if(Number(info.impRatio) > 0) { _div += '<td class="w14">' + info.impRatio + '%</td>';}
						else { _div += '<td class="w14 greenT">' + info.impRatio + '%</td>';}
						if(Number(info.impYearOn) > 0) { _div += '<td class="w15">' + info.impYearOn + '</td>';}
						else { _div += '<td class="w15 greenT">' + info.impYearOn + '%</td>';}
						_div += '<td class="w15">' + info.impAvgPrice + '%</td>';
						if(Number(info.impAvgPriceRatio) > 0) { _div += '<td class="w14">' + info.impAvgPriceRatio + '%</td>';}
						else { _div += '<td class="w14 greenT">' + info.impAvgPriceRatio + '%</td>';}
						if(Number(info.impAvgPriceYearOn) > 0) { _div += '<td class="w14">' + info.impAvgPriceYearOn + '%</td>';}
						else { _div += '<td class="w14 greenT">' + info.impAvgPriceYearOn + '%</td>';}
						_div += '</tr>';
					}
					$("#jckTable").html(_div);
					if($("#jckTable").height() > $("#jckTable").parent().height()){
						$("#jckTable").append(_div);
						$("#jckTable").addClass('roll');
					};
					//出口量增速
					chartBar2(d.barData2,1);
					chartBar2(d.barData2,2);
					var div1 = '<td>出口数量</td>';
					var div2 = '<td>同比增长</td>';
					var div3 = '<td>出口金额</td>';
					var div4 = '<td>同比增长</td>';
					for(var j=0;j<d.barData2.seriesBar.length;j++){
						var bar = d.barData2;
						div1 += '<td>'+bar.seriesBar[j]+'</td>';
						div2 += '<td>'+bar.seriesLine[j]+'%</td>';
						div3 += '<td>'+bar.seriesMoneyBar[j]+'</td>';
						div4 += '<td>'+bar.seriesMoneyLine[j]+'%</td>';
					}
					div1 += '<td></td>';div2 += '<td></td>';div3 += '<td></td>';div4 += '<td></td>';
					$("#tr1").html(div1);
					$("#tr2").html(div2);
					$("#tr3").html(div3);
					$("#tr4").html(div4);
				} else {
					$("#tab2").fadeIn("fast");
					$("#tab1").fadeOut("fast");
				}
			}
		}
	})
}
function chartBar1(d){
	var chart = echarts.init(document.getElementById('dzbChart'));
	var to = 50;
    if(width <= 1366){
    	to = 10;
    }
	var option = {
		legend: {
	        data: d.legend,
	        textStyle:{
	        	color:  '#03E0C2',
	        	fontSize: 12
	        },
	        bottom: 0,
	        itemGap: 30,
	        itemHeight:10,
	        itemWidth:12
	    },
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            lineStyle: {
	                color: '#57617B'
	            }
	        }
	    },
	    grid: {
	        left: '0',
	        right: '0',
	        bottom: 30,
	        top: to,
	        containLabel: true
	    },
	    xAxis: [{
	        type: 'category',
	        boundaryGap: true,
	        axisLine: {
	            lineStyle: {
	                color: 'rgba(255,255,255,.2)'
	            }
	        },
	        data: d.xAxis,
	        axisTick: {
	            show: false
	        },
	        axisLabel:{
	        	margin: 5,
	        	interval:0,
	            textStyle:{
	            	fontSize:12
	            },
            	color:  'rgba(131,173,186,.8)'
	        }
	    }],
	    yAxis: [{
	        type: 'value',
	        nameTextStyle:{
	        	align: 'left'
	        },
	        axisTick: {
	            show: false
	        },
	        splitNumber : 2,
	        splitLine: {
	        	lineStyle: {
	                color: 'rgba(255,255,255,.2)'
	            }
	        },
	        axisLine: {
	            lineStyle: {
	            	color:  'rgba(131,173,186,.8)'
	            }
	        },
	        axisLabel: {
	            textStyle: {
	                fontSize: 12
	            },
            	color:  'rgba(131,173,186,.8)'
	        }
	    },{
	        type: 'value',
            scale: true,
	        axisLine: {
	            show:false
	        },
	        axisTick: {
	            show: false
	        },
	        splitLine: {
	        	lineStyle: {
	                color: 'rgba(255,255,255,.2)'
	            }
	        },
	        axisLine: {
	            lineStyle: {
	            	color:  'rgba(131,173,186,.8)'
	            }
	        },
	        axisLabel: {
	            textStyle: {
	                fontSize: 12
	            },
            	color:  'rgba(131,173,186,.8)'
	        }
	    }],
	    series: [{
			        name: d.legend[0],
			        type: 'bar',
			        barWidth  : '15',
			        symbolSize: 0,  
			        itemStyle: {
					    normal: {
					        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
					            offset: 0,
					            color: '#12AABB'
					        }, {
					            offset: 1,
					            color: '#3451B9'
					        }]),
					        opacity: 1,
					    }
			        },
			        data: d.seriesBar1,
			    },
			    {
			        name: d.legend[2],
			        type: 'line',
			        symbol: 'circle',  
			        symbolSize: 10,  
			        yAxisIndex: 1,
			        itemStyle: {
			            normal: {
			                color: 'rgb(255, 9, 30)'
			            },
			        },
			        lineStyle: {
			            normal: {
			                color: 'rgb(255, 9, 30)'
			            },
			        },
			        data: d.seriesLine1,
			    },{
			        name: d.legend[1],
			        type: 'bar',
			        barWidth  : '15',
			        symbolSize: 0,  
			        itemStyle: {
			        	normal: {
			            	color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: '#FFD154'
			                }, {
			                    offset: 1,
			                    color: '#FF903E'
			                }]),
			                opacity: 1,
			            }
			        },
			        data: d.seriesBar2,
			    },
			    {
			        name: d.legend[3],
			        type: 'line',
			        barWidth  : '5',
			        yAxisIndex: 1,
			        symbol: 'circle',  
			        symbolSize: 10,  
			        itemStyle: {
			            normal: {
			                color: '#19cc61'
			            },
			        },
			        lineStyle: {
			            normal: {
			                color: '#19cc61'
			            },
			        },
			        data: d.seriesLine2,
			    }
		]
	};
	chart.setOption(option);
 }
function chartBar2(d,type) {
	var chart = type == 1 ? echarts.init(document.getElementById('chartBar1')) : echarts.init(document.getElementById('chartBar2'));
	var bo = 120;
    if(width <= 1600){
    	bo = 80;
    }
	var option = {
		legend: {
	        data: type == 1 ? d.legend : d.legendMoney,
	        textStyle:{
	        	color:  '#03E0C2',
	        	fontSize: 12
	        },
	        top: 0,
	        itemGap: 30,
	        itemHeight:10,
	        itemWidth:12
	    },
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            lineStyle: {
	                color: '#57617B'
	            }
	        }
	    },
	    grid: {
	        left: '12%',
	        right: '8%',
	        bottom: bo,
	        top: 30
	    },
	    xAxis: [{
	        type: 'category',
	        boundaryGap: true,
	        axisLine: {
	            lineStyle: {
	                color: 'rgba(255,255,255,.2)'
	            }
	        },
	        data: type == 1 ? d.xAxis : d.xAxisMoney,
	        axisTick: {
	            show: false
	        },
	        axisLabel:{
	        	margin: 5,
	        	interval:0,
	            textStyle:{
	            	fontSize:12
	            },
            	color:  'rgba(131,173,186,.8)'
	        }
	    }],
	    yAxis: [{
	        type: 'value',
	        nameTextStyle:{
	        	align: 'left'
	        },
	        axisTick: {
	            show: false
	        },
	        splitNumber : 2,
	        splitLine: {
	        	lineStyle: {
	                color: 'rgba(255,255,255,.2)'
	            }
	        },
	        axisLine: {
	            lineStyle: {
	            	color:  'rgba(131,173,186,.8)'
	            }
	        },
	        axisLabel: {
	            textStyle: {
	                fontSize: 12
	            },
            	color:  'rgba(131,173,186,.8)'
	        }
	    },{
	        type: 'value',
            scale: true,
	        axisLine: {
	            show:false
	        },
	        axisTick: {
	            show: false
	        },
	        splitLine: {
	        	lineStyle: {
	                color: 'rgba(255,255,255,.2)'
	            }
	        },
	        axisLine: {
	            lineStyle: {
	            	color:  'rgba(131,173,186,.8)'
	            }
	        },
	        axisLabel: {
	            textStyle: {
	                fontSize: 12
	            },
            	color:  'rgba(131,173,186,.8)'
	        }
	    }],
	    series: [{
	        name: type == 1 ? d.legend[0] : d.legendMoney[0],
	        type: 'bar',
	        barWidth  : '15',
	        symbolSize: 0,  
	        itemStyle: {
			    normal: {
			        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			            offset: 0,
			            color: '#12AABB'
			        }, {
			            offset: 1,
			            color: '#3451B9'
			        }]),
			        opacity: 1,
			    }
	        },
	        data: type == 1 ? d.seriesBar : d.seriesMoneyBar,
	    },
	    {
	        name: type == 1 ? d.legend[1] : d.legendMoney[1],
	        type: 'line',
	        symbol: 'circle',  
	        symbolSize: 10,  
	        yAxisIndex: 1,
	        itemStyle: {
	            normal: {
	                color: 'rgb(255, 9, 30)'
	            },
	        },
	        lineStyle: {
	            normal: {
	                color: 'rgb(255, 9, 30)'
	            },
	        },
	        data: type == 1 ? d.seriesLine : d.seriesMoneyLine,
	    }]
	};
	chart.setOption(option);
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
 			//if($("#ydgk").hasClass("on")){
		}else if($(this).parent().attr('id')=='sm'){
			//修改下拉组件默认值
			$('#selectMonth').text($(this).text());
			//修改隐藏属性
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			$('#month').val(month);
		}
		getProDetail();
	})
}
</script>
</html>