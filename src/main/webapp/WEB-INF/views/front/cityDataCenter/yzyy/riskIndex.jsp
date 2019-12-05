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
<%@ include file="header.jsp"%>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/companyPortraitSecond.css"/>
<title>袁州医药园智慧园区大数据平台-风险指数</title>
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
         	<ul class="production" style="position: relative;">
				<li class="first-li" val="9">
					<div class="product-type">运行指数</div>
				</li>
				<li class="first-li" val="10">
					<div class="product-type">创新指数</div>
				</li>
				<li class="first-li on" val="11"> 
					<div class="product-type">风险指数</div>
				</li>
				<li class="first-li" val="12"> 
					<div class="product-type">投资分析</div>
				</li>
				<li class="first-li" val="13"> 
					<div class="product-type">诊断建议</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div class="nav-title fz0" style="padding-bottom: 10px;">
					<div class="fl selects">
						<div class="select pd0"  style="cursor: pointer;">
			    			<img src="${ctx}/static/image/cityDataCenter/yzyy/qylogo.png">
			    			<span style="display: inline-block;padding-top: 14px; font-size: 16px; font-weight: bold;">江西济民可信药业有限公司</span>
			    		</div>
					</div>
					<div class="clearfix"></div>
			</div>
			<div class="changeParent" id="div1" style="height: calc( 100% - 45px);">
				<div class="blockStyle" style="height: 58%;">
		            <div class="spanStyle">
		            	<div class="inlineBox" style="width: calc(30% - 5px);">
		            		<i></i>
		            		<div class="verCenter">
		            			<div class="shieldIndexBar">
		            				<img src="${ctx}/static/image/cityDataCenter/yzyy/shieldBack.png" class="shieldBack1" width="">
		            				<img src="${ctx}/static/image/cityDataCenter/yzyy/shieldBack.png" class="shieldBack2" width="">
		            				<img src="${ctx}/static/image/cityDataCenter/yzyy/shield.png" class="shield" width="">
		            				<div class="shieldIndex">
		            					<div class="shieldIndexValue" id="shieldIndex"></div>
		            					<div class="shieldIndexName">风险指数</div>
		            				</div>
		            			</div>
		            		</div>
		            	</div>
						<div class="inlineBox" style="width: calc(70% - 5px);">
							<div class="businessInfoBar">
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">失信执行人</div>
												<div class="businessValue" id="sxzxr">1</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">经营异常</div>
												<div class="businessValue" id="jyyc">3</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">严重违法</div>
												<div class="businessValue" id="yzwf">2</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">抵押风险</div>
												<div class="businessValue" id="dyfx">3</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">行政处罚</div>
												<div class="businessValue" id="xzcf">5</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">税收风险</div>
												<div class="businessValue" id="ssfx">0</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">失信信息</div>
												<div class="businessValue" id="sxxx">3</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">环保处罚</div>
												<div class="businessValue" id="hbcf">1</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">清算信息</div>
												<div class="businessValue" id="qsxx">1</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">简易注销</div>
												<div class="businessValue" id="jyzx">0</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">公示催告</div>
												<div class="businessValue" id="gscg">1</div>
											</div>
										</div>
									</div>
								</div>
								<div class="businessInfo">
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
										<div class="businessBox" onclick="companyJYInfo(this)">
											<i></i>
											<div class="verCenter">
												<div class="businessName">股权出席</div>
												<div class="businessValue" id="gqcx">2</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
       			</div>
		     	<div class="blockStyle" style="height: calc(42% - 10px);">
		     		<div class="spanStyle" style="width: 68%;">
						<div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">各类风险事件发生年份趋势</span>
				            </div>
							<div class="part-content reusltContent" style="padding:0;">
			         			<div class="eight-map">
			         				<div class="mapContent" id="chart1">
			         				</div>
			         			</div>
		         		   </div>
		     		    </div>
		         	</div>
		         	<div class="spanStyle" style="width: calc(32% - 10px);">
		         	    <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">风险信息清单</span>
				            </div>
							<div class="part-content reusltContent" style="padding:0;">
			         			<div class="tab fxList">
									<div class="table-title">
										<span class="dib">风险类型</span>
										<span class="dib">发生时间</span>
									</div>
									<div class="table-content table-scroll">
										<table id="fxList" style="height: 100%;">
											<tbody>
												<tr>
													<td>失信被执行人</td>
													<td >2016-07-07</td>
												</tr>
												<tr>
													<td>经营异常</td>
													<td >2018-06-26</td>
												</tr>
												<tr>
													<td>环保处罚</td>
													<td >2017-12-05</td>
												</tr>
												<tr>
													<td>股权出质</td>
													<td >2017-05-20</td>
												</tr>
												<tr>
													<td>行政处罚</td>
													<td >2017-05-12</td>
												</tr>
												<tr>
													<td>股权出质</td>
													<td >2017-04-20</td>
												</tr>
											</tbody>
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
			window.location.href = "${ctx}/front/cityDataCenter/yzyyIndex/"+v;
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
	$(".businessInfoBar .businessInfo .businessBox").on("click", function() {
		if($(this).hasClass("on")){
			$(".businessInfoBar .businessInfo .businessBox").removeClass("on");
		}else{
			$(".businessInfoBar .businessInfo .businessBox").removeClass("on");
			$(this).addClass("on");
		}
	});
	rollNums();
	orangeChart();
})
	function orangeChart(){
		var array=[4,6,3,7,6,2,3];
		var div_ = document.getElementById("chart1");
		var orangeLineChart = echarts.init(div_);
		orangeLineOption.series[0].data = array;
		orangeLineChart.setOption(orangeLineOption);
	}
	//橙色线型配置
	var orangeLineOption = {
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
        	right: 25,
        	left: 40,
        	bottom: 30,
        	top: 25
        },
        tooltip: {
            show:true,
            trigger: 'axis',
        },
        xAxis: {
	        //data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			data: ["2013","2014","2015","2016","2017","2018","2019"],
			type: 'category',
	        // boundaryGap: true,
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
                // rotate: 40,
                fontSize: 14,
            }
		},
		yAxis: {
			interval:2,
			max:10,
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
				fontSize: 14,
				formatter:function(params){
					return params;
				}
			}
        },
		series: [{
			name: '风险事件',
			type: 'line',
			data: [],
			symbolSize: 0,
			/* smooth: true, */
			color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
				offset: 0,
				color: '#FFD154'
			}, {
				offset: 1,
				color: '#FF903E'
			}]),
			areaStyle: {
				color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
					offset: 0,
					color: '#FFD154'
				}, {
					offset: 1,
					color: '#FF903E'
				}]),
				opacity: 0.2,
			},
			lineStyle: {
				width: 4,
			}
		},]
	};
	//数字滚动
	function rollNums(){
		var si = '21'
		$("#shieldIndex").rollNum({
			deVal: si.split('.')[0],
			digit: si.split('.')[0].length
		});
		var sxzxr = '1'
		var jyyc = '3'
		var yzwf = '2'
		var dyfx = '3'
		var xzcf = '5'
		var ssfx = '0'
		var sxxx = '3'
		var hbcf = '1'
		var qsxx = '1'
		var jyzx = '0'
		var gscg = '1'
		var gqcx = '2'
		$("#sxzxr").rollNum({
			deVal: sxzxr.split('.')[0],
			digit: sxzxr.split('.')[0].length
		});
		$("#jyyc").rollNum({
			deVal: jyyc.split('.')[0],
			digit: jyyc.split('.')[0].length
		});
		$("#yzwf").rollNum({
			deVal: yzwf.split('.')[0],
			digit: yzwf.split('.')[0].length
		});
		$("#dyfx").rollNum({
			deVal: dyfx.split('.')[0],
			digit: dyfx.split('.')[0].length
		});
		$("#xzcf").rollNum({
			deVal: xzcf.split('.')[0],
			digit: xzcf.split('.')[0].length
		});
		$("#ssfx").rollNum({
			deVal: ssfx.split('.')[0],
			digit: ssfx.split('.')[0].length
		});
		$("#sxxx").rollNum({
			deVal: sxxx.split('.')[0],
			digit: sxxx.split('.')[0].length
		});
		$("#hbcf").rollNum({
			deVal: hbcf.split('.')[0],
			digit: hbcf.split('.')[0].length
		});
		$("#qsxx").rollNum({
			deVal: qsxx.split('.')[0],
			digit: qsxx.split('.')[0].length
		});
		$("#jyzx").rollNum({
			deVal: jyzx.split('.')[0],
			digit: jyzx.split('.')[0].length
		});
		$("#gscg").rollNum({
			deVal: gscg.split('.')[0],
			digit: gscg.split('.')[0].length
		});
		$("#gqcx").rollNum({
			deVal: gqcx.split('.')[0],
			digit: gqcx.split('.')[0].length
		});
	}
	function goindex(num){
		if($("#companyId").val()!="" && $("#companyId").val() != undefined){
			window.location.href='${ctx}/front/cityDataCenter/yzyyIndex/'+num+'?companyId='+$("#companyId").val()
		}else{
			window.location.href='${ctx}/front/cityDataCenter/yzyyIndex/'+num+'?companyId=90020180314182240800039000001686'
		}
	}
</script>
</html>
