<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<%@ include file="header.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/companyPortraitSecond.css"/>
<link href="${ctx}/static/css/cityDataCenter/yzyyHomePage.css" rel="stylesheet">
<title>吉安高新技术开发区大数据平台-诊断建议</title>
<style>
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/yzyy/bg2.png) no-repeat center;
    background-size: 100% 100%;
}
</style>
</head>
<body class="gray-bg">

 	<div class="content fz0" style="padding:15px 15px 15px 0">
		 <div class="back" onclick="goindex(8)">
		    <img src="${ctx}/static/image/cityDataCenter/ycNew2/return.png">
		    <span>返回</span>
		</div>
		<div class="pro-left">
			<div class="clearfix"></div>
         	<ul class="production" style="position: relative;">
				<li class="first-li" val="9">
					<div class="product-type">运行指数</div>
				</li>
				<li class="first-li" val="10">
					<div class="product-type">创新指数</div>
				</li>
				<li class="first-li" val="11"> 
					<div class="product-type">风险指数</div>
				</li>
				<li class="first-li" val="12"> 
					<div class="product-type">投资分析</div>
				</li>
				<li class="first-li on" val="13"> 
					<div class="product-type">诊断建议</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div class="fz0" style="padding-bottom: 10px;">
		    	<div class="fl selects">
		    		<div class="select pd0"  style="cursor: pointer;">
		    			<img src="${ctx}/static/image/cityDataCenter/yzyy/qylogo.png">
		    			<span style="display: inline-block;padding-top: 14px; font-size: 16px; font-weight: bold;">江西济民可信药业有限公司</span>
		    		</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="changeParent" id="div1" style="height: calc(100% - 45px);padding-top: 0">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 33.33%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="inlineBox" style="width: calc(40% - 5px);">
								<i></i>
			            		<div class="verCenter">
			            			<div class="circleIndexBar size120 redC">
			            				<div class="circleBack1"></div>
			            				<div class="circleBack2"></div>
			            				<div class="circle"></div>
			            				<div class="circleIndex">
			            					<div class="circleIndexValue">5</div>
			            					<div class="circleIndexName">指标异常</div>
			            				</div>
			            			</div>
			            		</div>
							</div>
							<div class="inlineBox" style="width: calc(60% - 5px);">
								<div class="timeAxisBar">
									<div class="axis"></div>
									<div class="timeAxisLayer">
										<i></i>
				            			<div class="verCenter">
											<div class="timeAxis redStyle">
												<span class="timePointBox">
													<div class="timePointO">
														<div class="timePointI"></div>
													</div>
												</span>
												<span class="timeDataBar">
													<div class="timeDate">2019-05</div>
													<div class="timeData">产值指标与实际推算差异较大</div>
												</span>
											</div>
											<div class="timeAxis redStyle">
												<span class="timePointBox">
													<div class="timePointO">
														<div class="timePointI"></div>
													</div>
												</span>
												<span class="timeDataBar">
													<div class="timeDate">2019-04</div>
													<div class="timeData">负债率偏高</div>
												</span>
											</div>
											<div class="timeAxis redStyle">
												<span class="timePointBox">
													<div class="timePointO">
														<div class="timePointI"></div>
													</div>
												</span>
												<span class="timeDataBar">
													<div class="timeDate">2019-02</div>
													<div class="timeData">用工人数下降较大</div>
												</span>
											</div>
											<div class="timeAxis redStyle">
												<span class="timePointBox">
													<div class="timePointO">
														<div class="timePointI"></div>
													</div>
												</span>
												<span class="timeDataBar">
													<div class="timeDate">2019-01</div>
													<div class="timeData">用工人数下降较大</div>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
		                </div>
			         </div>
					<div class="spanStyle" style="width: calc(33.33% - 10px);">
			             <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="inlineBox" style="width: calc(40% - 5px);">
								<i></i>
			            		<div class="verCenter">
			            			<div class="circleIndexBar size120 greenC">
			            				<div class="circleBack1"></div>
			            				<div class="circleBack2"></div>
			            				<div class="circle"></div>
			            				<div class="circleIndex">
			            					<div class="circleIndexValue">3</div>
			            					<div class="circleIndexName">符合申报项目</div>
			            				</div>
			            			</div>
			            		</div>
							</div>
							<div class="inlineBox" style="width: calc(60% - 5px);">
								<div class="timeAxisBar">
									<div class="axis"></div>
									<div class="timeAxisLayer">
										<i></i>
				            			<div class="verCenter">
											<div class="timeAxis greenStyle">
												<span class="timePointBox">
													<div class="timePointO">
														<div class="timePointI"></div>
													</div>
												</span>
												<span class="timeDataBar">
													<div class="timeDate">2019-05</div>
													<div class="timeData">“一企一技“技术成果产业化项目</div>
												</span>
											</div>
											<div class="timeAxis greenStyle">
												<span class="timePointBox">
													<div class="timePointO">
														<div class="timePointI"></div>
													</div>
												</span>
												<span class="timeDataBar">
													<div class="timeDate">2019-04</div>
													<div class="timeData">工业企业重点技术改造项目</div>
												</span>
											</div>
											<div class="timeAxis greenStyle">
												<span class="timePointBox">
													<div class="timePointO">
														<div class="timePointI"></div>
													</div>
												</span>
												<span class="timeDataBar">
													<div class="timeDate">2019-02</div>
													<div class="timeData">信息安全试点示范企业</div>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						 </div>	
					 </div>
					 <div class="spanStyle" style="width: calc(33.33% - 10px);">
			             <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="inlineBox" style="width: 100%;text-align: center;">
			            		<div style="display: inline-block;position: relative;top:33%;width: 46.3%;overflow: hidden;">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/consultationLine.png">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/arrow.png" class="cArrow cArr1">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/arrow.png" class="cArrow cArr2">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/arrow.png" class="cArrow cArr3">
			            		</div>
			            		<div class="circleIndexBar size90 blueC" style="position: absolute;top:10%;left:50%;margin-left: -45px;width: 90px;">
		            				<div class="circleBack1"></div>
		            				<div class="circleBack2"></div>
		            				<div class="circle"></div>
		            				<div class="circleIndex">
		            					<div class="circleIndexValue">3</div>
		            					<div class="circleIndexName">已有资质</div>
		            				</div>
		            			</div>
		            			<div class="circleIndexBar size90 blueC" style="position: absolute;bottom:10%;left:18%;width: 90px;">
		            				<div class="circleBack1"></div>
		            				<div class="circleBack2"></div>
		            				<div class="circle"></div>
		            				<div class="circleIndex">
		            					<div class="circleIndexValue">3</div>
		            					<div class="circleIndexName">建议新资质</div>
		            				</div>
		            			</div>
		            			<div class="circleIndexBar size90 blueC" style="position: absolute;bottom:10%;right:18%;width: 90px;">
		            				<div class="circleBack1"></div>
		            				<div class="circleBack2"></div>
		            				<div class="circle"></div>
		            				<div class="circleIndex">
		            					<div class="circleIndexValue">2</div>
		            					<div class="circleIndexName">咨询公司</div>
		            				</div>
		            			</div>
							</div>
						 </div>	
			         </div>
       			</div>
		     	<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="spanStyle" style="width: 33.33%;">
						<div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabContBar" style="height: 100%;">
								<div class="tabCont">
									<div class="zdjy-box">
										<div class="icons">
											<img src="${ctx}/static/image/cityDataCenter/yzyy/zdjy1.png">
											<span>
												<p>安全隐患</p>
												<font class="red" id="aqyh"></font>
											</span>
										</div>
										<div class="icons">
											<img src="${ctx}/static/image/cityDataCenter/yzyy/zdjy2.png">
											<span>
												<p>安全员</p>
												<font class="green" id="aqy"></font>
											</span>
										</div>
										<div class="icons">
											<img src="${ctx}/static/image/cityDataCenter/yzyy/zdjy3.png">
											<span>
												<p>安全证照</p>
												<font class="green" id="aqzz"></font>
											</span>
										</div>
									</div>
									<div id="chart1" style="height: 70%;"></div>
								</div>
							</div>
		     		    </div>
		         	</div>
		         	<div class="spanStyle" style="width: calc(33.33% - 10px);">
		         	    <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabContBar" style="height: 100%">
								<div class="verCenter" style="margin-top: 7%;">
			            			<div class="circleIndexBar size120 redC">
			            				<div class="circleBack1"></div>
			            				<div class="circleBack2"></div>
			            				<div class="circle"></div>
			            				<div class="circleIndex">
			            					<div class="circleIndexValue">1</div>
			            					<div class="circleIndexName">环保预警</div>
			            				</div>
			            			</div>
			            		</div>
								<div class="tabCont p39" style="height: calc(90% - 120px);">
									<div class="verCenter">
										<div class="ringItem">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/ringBlue.png">
											<div class="ringMiddle">
												<div class="ringValue redfont" id="zysrdj-value">1</div>
											</div>
											<p id="zysrdj-name">废水</p>
										</div>
										<div class="ringItem">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/ringBlue.png">
											<div class="ringMiddle">
												<div class="ringValue" id="nsqj-value">0</div>
											</div>
											<p id="nsqj-name">废气</p>
										</div>
										<div class="ringItem">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/ringBlue.png">
											<div class="ringMiddle ringFont">
												<div class="ringValue" id="">达标</div>
											</div>
											<p id="xsjll-name">固废</p>
										</div>
									</div>
								</div>
							</div>
						</div>	
					 </div>
					 <div class="spanStyle" style="width: calc(33.33% - 10px);">
		         	    <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabContBar" style="height: 100%;">
								<div class="tabCont">
									<div class="zdjy-box">
										<div class="icons">
											<img src="${ctx}/static/image/cityDataCenter/yzyy/zdjy4.png">
											<span>
												<p>企业诉求</p>
												<font class="yellow" id="qysq"></font>
											</span>
										</div>
										<div class="icons">
											<img src="${ctx}/static/image/cityDataCenter/yzyy/zdjy5.png">
											<span>
												<p>走访次数</p>
												<font class="yellow" id="zfcs"></font>
											</span>
										</div>
										<div class="icons">
											<img src="${ctx}/static/image/cityDataCenter/yzyy/zdjy6.png">
											<span>
												<p>建议挂点部门</p>
												<font class="yellow" style="font-size:16px;font-weight:bold;">金融服务办</font>
											</span>
										</div>
									</div>
									<div id="chart2" style="height: 70%;"></div>
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
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/yzyyData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
var historyData = "";
$(function(){
	var tabIndex = '${tabIndex}';
	$(".head .tab>a:eq(4)").addClass("on");
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v = $(this).attr("val")
		if(v!=''){
			window.location.href = "${ctx}/front/cityDataCenter/jianIndex/"+v;
		} else { alert("建设中!")}
	});
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
	rollNums();
	getIce1();
	getIce2();
})
function rollNums(){
	var aqyh = '5';
	var aqy = '2';
	var aqzz = '5';
	var qysq = '5';
	var zfcs = '15';
	$("#aqyh").rollNum({
		deVal: aqyh.split('.')[0],
		digit: aqyh.split('.')[0].length
	});
	$("#aqy").rollNum({
		deVal: aqy.split('.')[0],
		digit: aqy.split('.')[0].length
	});
	$("#aqzz").rollNum({
		deVal: aqzz.split('.')[0],
		digit: aqzz.split('.')[0].length
	});
	$("#qysq").rollNum({
		deVal: qysq.split('.')[0],
		digit: qysq.split('.')[0].length
	});
	$("#zfcs").rollNum({
		deVal: zfcs.split('.')[0],
		digit: zfcs.split('.')[0].length
	});
}
var color=''
function getIce1(){
	var array=['',8,5,3,''];
	var xData =['','安全排查','存在隐患','正在整改',''];
	color= [{
	                    offset: 0, color: 'rgba(59,209,255,1)' 
	                }, {
	                    offset: 1, color: 'rgba(59,209,255,0.1)'
	                }]
	var div_ = document.getElementById("chart1");
	icechart(div_,color,array,xData)

}
function getIce2(){
	var array=['',8,5,3,''];
	var xData =['','融资','用工','办证',''];
	color= [{
	                    offset: 0, color: 'rgba(255,226,65,1)' 
	                }, {
	                    offset: 1, color: 'rgba(255,168,65,0.1)'
	                }]
	
	var div_ = document.getElementById("chart2");
	icechart(div_,color,array,xData)

}
function icechart(div_,color,data,xData){
	var iceChart = echarts.init(div_);
	var iceOption = {
			grid: {
				left:17,
				right:22,
				top: 15,
				bottom: 20,
				containLabel:true
			},
		tooltip: {
				show:true,
				trigger: 'axis',
			},
			xAxis: {
				type: 'category',
				position: "bottom",
				data: xData,
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
				},
			},
			yAxis: {
				show: true,
				name: '',
				splitLine: {
					lineStyle: {
						color: "rgba(255,255,255,0.2)"
					}
				},
				axisTick: {
					show: false
				},
				axisLine: {
					show: true,
					lineStyle: {
						color: "rgba(255,255,255,0.2)"
					}
				},
				axisLabel: {
					show: true,
					color: '#00DEFF'
				}
			},
			series: [{
				type: 'pictorialBar',
				name: '数量',
				barCategoryGap: '-20%',
				symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
				data: [],
				itemStyle: {
					color: {
						type: 'linear',
						x: 0,
						y: 0,
						x2: 0,
						y2: 1,
						colorStops: color,
						global: false 
					},
					opacity:0.6,
				},
			},]
	};
	iceOption.series[0].data = data;
	iceChart.setOption(iceOption);
}
function goindex(num){
		if($("#companyId").val()!="" && $("#companyId").val() != undefined){
			window.location.href='${ctx}/front/cityDataCenter/jianIndex/'+num+'?companyId='+$("#companyId").val()
		}else{
			window.location.href='${ctx}/front/cityDataCenter/jianIndex/'+num+'?companyId=90020180314182240800039000001686'
		}
	}
</script>
</html>
