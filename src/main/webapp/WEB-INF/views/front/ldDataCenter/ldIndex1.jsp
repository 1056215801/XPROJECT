<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/homePage.css"/>
<title>锂电大数据首页</title>
<style>
.clickClass{
	cursor: pointer;
}
.material {
	display: inline-block;
	vertical-align: middle;
	width: 40%;
	height: 100%;
}
.material .count-item+.count-item {
    margin-top: 14px;
}
.material .count-item {
	height: 100%;
}
.material .count-item>div {
	height: 20%;
}
.material .count-item>div>font {
	display: inline-block;
	vertical-align: middle;
    width: 35px;
    text-align: left;
    font-size: 14px;
    color: #fff;
    opacity: 1;
}
.material .count-item>div>span {
	display: inline-block;
	margin: 0;
    width: -webkit-calc(100% - 85px);
    width: calc(100% - 85px);
    height: 12px;
}
.material .count-item>div>span>div { 
	height: 100%;
	border-radius: 8px;
	background: linear-gradient(to right, #05A6FC, #67F8B3);
}
.material .count-item>div>b {
	display: inline-block;
	vertical-align: middle;
    width: 50px;
    font-size: 14px;
    color: #fff;
    padding-left: 5px;
    text-align: left;
}

.installTable {
	width: 100%;
	height: calc(100% - 35px);
	height: -webkit-calc(100% - 35px);
}
.installTable tr td {
	border: 1px solid #0de6e6;
	color: #fff;
	text-align: center;
	vertical-align: middle;
}

.installBox {
	display: inline-block;
	vertical-align: middle;
	width: calc(50% - 22px);
	height: 100%;
	margin: 0 10px;
	background-color: rgba(0,0,0,0.3);
	text-align: center;
}
.installName {
	font-size: 14px;
	font-weight: bold;
	height: 30%;
}
.installValue {
	font-size: 20px;
	font-weight: bold;
	color: #fff;
	height: 40%;
}
.installValue font {
	font-size: 14px;
	font-weight: normal;
}
.installRatio {
	font-size: 14px;
	color: #fff;
	height: 30%;
}
i {
    display: inline-block;
    height: 100%;
    vertical-align: middle;
}
.blueFont {color:#05A6FC;}
.orangeFont {color:#0de6e6;}
.greenFont {color:#1be605;}
.lightBlueFont {color:#67F8B3;}
</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="container-fluid content">
		<div class="row upper">
			<div class="col-xs-4">
				<div class="column" id="column1">
					<div class="tab-title">
						<span class="on">中国氢氧化锂（HS28252010）</span>
						<font onclick="chartjinkou()">进口量</font><font>&nbsp;|&nbsp;</font><font onclick="chartchukou()">出口量</font>
					</div>
					<div class="tab">
						<div class="process" id="holi">
						</div>
						<div class="process" id="jinkou" style="text-align: center;color:#0de6e6;margin-top: 15%;">
							建设中
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="column">
					<div class="tab-title hangye-title">
						<span class="on">全国锂产品价格行情(指导价)</span>
						<font onclick="location.href='${ctx}/front/ldDataCenter/index/3?type=0'">今日更新 &gt;</font>
					</div>
					<div class="tab">
						<div class="tab-bar upper-bar">
							<div class="tab-title tab-title2">
								<span id="liName" onclick="$('.select-div').slideToggle();">电池级碳酸锂(Li2CO3:99.5%)</span>
								<input type="hidden" id="productId" value="">
								<div class="select-div" id="selectDiv">
									<p>电池级碳酸锂(Li2CO3:99.5%)</p>
									<p>电池级碳酸锂(Li2CO3:99%)</p>
									<p>电池级碳酸锂(Li2CO3:98%)</p>
								</div>
								<font style="color:#fff;" id="priceUnit">单位：万元/吨</font>
							</div>
							<div class="tab price-tab">
								<p id="productPrice"><font class="redT weight">9.3</font><font class="weight">8.8-9.5</font class="weight"><font>0</font></p>
								<p><font>今日价格</font><font>最低/最高价</font><font>涨跌幅</font></p>
							</div>
						</div>
						<div class="tab-bar down-bar" id="products">
							<a href="javascript:;" data-value="1">碳酸锂</a>
							<a href="javascript:;" data-value="2">氢氧化锂</a>
							<a href="javascript:;" data-value="4">金属锂</a>
							<a href="javascript:;" data-value="49">电解钴</a>
							<a href="javascript:;" data-value="14">硫酸钴</a>
							<a href="javascript:;" data-value="53">氯化钴</a>
							<a href="javascript:;" data-value="18">四氧化三钴</a>
							<a href="javascript:;" data-value="54">氧化钴</a>
							<a href="javascript:;" data-value="51">钴粉</a>
							<a href="javascript:;" data-value="10">三元前驱体</a>
							<a href="javascript:;" data-value="12">三元材料</a>
							<a href="javascript:;" data-value="9">磷酸铁锂</a>
							<a href="javascript:;" data-value="10">钴酸锂</a>
							<a href="javascript:;" data-value="11">锰酸锂</a>
							<a href="javascript:;" data-value="15">硫酸镍</a>
							<a href="javascript:;" data-value="5">电解镍</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="column">
					<div class="tab-title hangye-title">
						<span class="on">宜春锂电行业经济指标</span>
					</div>
					<div class="tab">
						<div class="tab-bar">
							<div class="dib infor-box" style="position: relative;">
								<div class="middle-pic">
									<p>上月累计电量</p>
									<h2>26036</h2>
									<p class="wanqian">万千瓦时</p>
								</div>
							</div>
							<div class="dib chart1">
								<div class="chart-title">
									<span>宜春锂电产品价格行情(8月)</span>
								</div>
								<div class="chart-content">
									<div class="chart-item" onclick="toLink(1)"><img src="${ctx}/static/image/liData/cell_03.png"><font class="dib">1860电池</font><span class="unit-font">298.7元/个</span></div>
									<div class="chart-item" onclick="toLink(2)"><img src="${ctx}/static/image/liData/cell_06.png"><font class="dib">负极材料</font><span class="unit-font">2.1万元/吨</span></div>
								</div>
							</div>
						</div>
						<div class="tab-bar">
							<div class="dib chart1" onclick="toLink(6)">
								<div class="chart-title">
									<span><b class="greenT">主营业务收入</b>(近一年)</span>
									<font class="fr unit-font">单位：亿元</font>
								</div>
								<div class="chart-content" id="map1"></div>
							</div>
							<div class="dib infor-box" onclick="toLink(7)" style="position: relative;">
							     <div class="middle-pic">
									<p class="orangeT">工业投资项目</p>
									<h2>230<small>个</small></h2>
									<p class="wanqian">&nbsp;</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row bottom">
			<div class="col-xs-4">
				<div class="column column-top">
					<div class="tab-title" id="followTab">
						<span class="on">装机情况（MWh）</span>
						<span >关键材料</span>
						<font>2018年10月</font>
					</div>
					<div class="tab">
						<div class="process" id="followTab0" style="font-size: 0;">
							<div class="process" id="install" style="display: inline-block; vertical-align: middle; width: 60%; height: 100%;"></div>
							<div class="material">
								<div class="count-item">
									<div><i></i><font>NCM</font><span><div style="width: 67.6%;"></div></span><b>4140.0</b></div>
									<div><i></i><font>LFP</font><span><div style="width: 30.7%;"></div></span><b>1884.3</b></div>
									<div><i></i><font>LMO</font><span><div style="width: 0.9%;"></div></span><b>52.4</b></div>
									<div><i></i><font>LTO</font><span><div style="width: 0.7%;"></div></span><b>44.1</b></div>
									<div><i></i><font>NCA</font><span><div style="width: 0.1%;"></div></span><b>7.7</b></div>
								</div>
							</div>
						</div>
						<div class="process" id="followTab1" style="display: none;">
							<div style="width: 100%;height: 35px;color:#fff;line-height: 35px;text-align: center;">2018年上半年中国锂电池四大材料出货量</div>
							<table class="installTable">
								<tr>
									<td>正极材料</td>
									<td>负极材料</td>
									<td>电解液</td>
									<td>隔膜</td>
								</tr>
								<tr>
									<td>11.2万吨</td>
									<td>7.7万吨</td>
									<td>5.6万吨</td>
									<td>7.6亿平方米</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="column column-bottom">
					<div class="tab-title" id="followOnTab">
						<span class="on">中国锂电装机量</span>
						<span >中国新能源汽车产量</span>
						<font>2018年10月</font>
					</div>
					<div class="tab">
						<div class="process" id="followOnTab0">
							<div class="installBox">
								<div class="installName blueFont"><i></i><span>本月装机量</span></div>
								<div class="installValue"><i></i><span>6.13</span><font>GWh</font></div>
								<div class="installRatio"><i></i><span>同比：</span><span class="blueFont">82.90%</span></div>
							</div>
							<div class="installBox">
								<div class="installName orangeFont"><i></i><span>累计装机量</span></div>
								<div class="installValue"><i></i><span>35.64<font>GWh</font></div>
								<div class="installRatio"><i></i><span>同比：</span><span class="orangeFont">90.15%</span></div>
							</div>
						</div>
						<div class="process" id="followOnTab1" style="display: none;">
							<div class="installBox">
								<div class="installName greenFont"><i></i><span>本月新能源汽车产量</span></div>
								<div class="installValue"><i></i><span>139875</span><font>辆</font></div>
								<div class="installRatio"><i></i><span>同比：</span><span class="greenFont">56.09%</span></div>
							</div>
							<div class="installBox">
								<div class="installName lightBlueFont"><i></i><span>累计新能源汽车产量</span></div>
								<div class="installValue"><i></i><span>823317</span><font>辆</font></div>
								<div class="installRatio"><i></i><span>同比：</span><span class="lightBlueFont">41.17%</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="column">
					<div class="tab-title" id="processTab">
						<span class="on">锂电产业链</span>
						<span>宜春锂电产业链</span>
						<span>重点锂电企业分布</span>
					</div>
					<div class="tab process-tab" style="overflow: hidden;">
						<div class="process" id="processTab0">
							<div class="process-bar">
								<span><font>原材料</font></span>
							</div>
							<div class="process-bar">
								<span><font>电池材料及电芯</font></span>
							</div>
							<div class="process-bar">
								<span><font>应用</font></span>
							</div>
							<div class="process-pic">
								<div class="floor first">
									<div class="inner-floor">
										<span class="w100 clickClass" onclick="location.href='${ctx}/front/ldDataCenter/index/2?type=1'"><font>锂矿石</font></span>
										<div class="alignCenter"></div>
										<div class="line-box line-box1">
											<div class="line line1"></div>
											<div class="line line2"></div>
											<div class="line line3"></div>
											<div class="line line4"></div>
											<div class="line line5"></div>
											<div class="line line6"></div>
											<div class="line line7"></div>
											<div class="line line8"></div>
											<div class="line line9"></div>
											<div class="point point1"></div>
											<div class="point point2"></div>
										</div>
									</div>
									<div class="inner-floor">
										<span class="w100"><font>锂云母精矿</font></span>
										<div class="alignCenter"></div>
									</div>
									<div class="inner-floor">
										<span class="w40"><font>氢氧化锂</font></span>
										<span class="w50"><font>碳酸锂</font></span>
										<div class="alignCenter"></div>
									</div>
								</div>
								<div class="floor second">
									<div class="inner-floor">
										<span><font>正极</font></span>
										<span><font>负极</font></span>
										<span><font>隔膜</font></span>
										<span class="w1"><font>电解液</font></span>
										<div class="alignCenter"></div>
										<div class="line-box line-box2">
											<div class="line line1"></div>
											<div class="line line2"></div>
											<div class="line line3"></div>
											<div class="line line4"></div>
											<div class="line line5"></div>
											<div class="line line6"></div>
											<div class="line line7"></div>
											<div class="line line8"></div>
											<div class="line line9"></div>
											<div class="line line10"></div>
											
											<div class="point point1"></div>
											<div class="point point2"></div>
											<div class="point point3"></div>
											<div class="point point4"></div>
											<div class="point point5"></div>
											<div class="point point6"></div>
										</div>
									</div>
									<div class="dib" style="width: 65%;height: 67%;">
										<div class="inner-floor" style="height: 50%;">
											<span class="w100 clickClass" style="padding-left: 20%;"><font>电芯制造与pack封装</font></span>
											<div class="alignCenter"></div>
										</div>
										<div class="inner-floor" style="height: 50%;">
											<span class="w100 clickClass" style="padding-left: 20%;"><font>动力、消费、储能电池</font></span>
											<div class="alignCenter"></div>
										</div>
									</div>
									<div class="dib " style="width: 35%;height: 67%;">
										<span class="w100"><font>锂电设备配套</font></span>
										<div class="alignCenter"></div>
									</div>
								</div>
								<div class="floor third">
									<span class="w100 clickClass"><font>新能源车、3C数码、工业储能</font></span>
									<div class="alignCenter"></div>
								</div>
							</div>
						</div>
						<div class="process pro2" id="processTab1" style="display: none;">
							<div class="process-item">
								<div class="pro-item_left dib blueBg">原材料</div>
								<div class="pro-item_right dib">
									<div class="tab-title4 blueT">
										<span>原材料</span>
									</div>
									<div class="tab price-tab price-tab2" onclick="window.open('${ctx}/front/ldDataCenter/index/8')">
										<p><font><b>3</b>个</font><font><b>15</b>亿元</font><font><b>65</b></font></p>
										<p><font>企业数量</font><font>2016年产值</font><font>竞争力</font></p>
									</div>
								</div>
							</div>
							<div class="process-item">
								<div class="pro-item_left dib greenBg"><font class="dib">电池材料及电芯</font></div>
								<div class="pro-item_right dib">
									<div class="tab-title4 tab-title5">
										<span class="on">正极</span>
										<span>负极</span>
										<span>隔膜</span>
										<span>电解液</span>
										<span>电芯</span>
									</div>
									<div class="tab price-tab price-tab2" onclick="window.open('${ctx}/front/ldDataCenter/index/8')">
										<p><font><b>3</b>个</font><font><b>15</b>亿元</font><font><b>65</b></font></p>
										<p><font>企业数量</font><font>2016年产值</font><font>竞争力</font></p>
									</div>
								</div>
							</div>
							<div class="process-item">
								<div class="pro-item_left dib orangeBg">应用</div>
								<div class="pro-item_right dib">
									<div class="tab-title4 orangeT">
										<span>新能源汽车制造</span>
									</div>
									<div class="tab price-tab price-tab2" onclick="window.open('${ctx}/front/ldDataCenter/index/8')">
										<p><font><b>3</b>个</font><font><b>15</b>亿元</font><font><b>65</b></font></p>
										<p><font>企业数量</font><font>2016年产值</font><font>竞争力</font></p>
									</div>
								</div>
							</div>
						</div>
						<div class="process" id="processTab2" style="display:block;height: 100%;overflow: hidden;">
							<div class="map-item" style="top: 20px;" id="selectMap">
								<p class="on">上游</p>
								<p>中游</p>
								<p>下游</p>
							</div>
							<div class="echart-map" id="map2"></div>
							<div class="companys">
								<div class="company-box" id="companyBox">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="column column-top">
				 	<div class="tab-title tab-title-science">
					    <span class="on">锂电专家</span>
						<span>科研机构</span>
						<span>产业峰会</span>
						<font href="javascript:;" onclick="goIndex6()">更多 &gt;</font>
					</div>
					<div class="tab process-tab">
						<div class="expert-list" id="science-1">
						   <div class="swiper-container loop-swiper" id="swiper1" style="display:block;height: 100%;">
							    <div class="swiper-wrapper" id="swiper1Chirld">
								 </div>
							 </div>
						</div>
						<div class="science-list expert-list" id="science-2" style="display:block;height: 100%;">
							<div class="swiper-container loop-swiper" id="swiper2">
							    <div class="swiper-wrapper" id="swiper2Chirld">
								 </div>
							 </div>
						</div>
						<div class="science-list" id="science-3" style="display:block;height: 100%;">
							<div class="swiper-container loop-swiper" id="swiper3">
						    <div class="swiper-wrapper" id="swiper3Chirld">
							 </div>
						  <div class="swiper-pagination"></div>
						</div>
						</div>
					</div>
				</div>
				<div class="column column-bottom">
				     <input type="hidden" id="kindId" value=""/>
				     <input type="hidden" id="type" value="0"/>
				     <input type="hidden" id="type1" value="0"/>
					<div class="tab-title tab-title-trends">
						<font href="javascript:;" onclick="goIndex4()">更多 &gt;</font>
	 				</div>
					<div class="tab process-tab trends-tab">
					    <div class="trends" id="trends-0">
					    </div>
					    <div class="trends" id="trends-1" style="display: none;">
					    </div>
					    <div class="trends" id="trends-2" style="display: none;">
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/map/china.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/liData.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/liAnimate.js"></script>

<script type="text/javascript">
var type1 = 1;
var type2 = 1;
	$(function () {	
		//getLiTotal();
		getCompany();
		getLiProduct("碳酸锂");
		var h1 = $('.process-bar:eq(0)').height() / 2;
		var h2 = $('.process-bar:eq(1)').height() / 6;
		var h3 = $('.process-bar:eq(2)').height();
		var lineHeight1 = h1 + h2 + 35;
		$(".line-box1").height(lineHeight1);
		$(".line-box2").height((h2 * 6)+h3-30);
		$(".tab-title-science span").on("click", function() {
			var $ind = $(this).index() + 1;
			type1 = $ind;
			$('#type1').val($ind-1);
			$(this).addClass("on").siblings().removeClass("on");
			$("#science-" + $ind).siblings().fadeOut("fast");
			setTimeout(function() {
				$("#science-" + $ind).fadeIn("fast");
			}, 200) 
		})
		$("#numberTab span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$("#firstTab"+ind).siblings().fadeOut('fast');
			setTimeout(function(){ $("#firstTab"+ind).fadeIn('fast');},190)
		});
		$("#processTab span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$("#processTab"+ind).siblings().fadeOut('fast');
			setTimeout(function(){ $("#processTab"+ind).fadeIn('fast');$("#selectMap p").eq(0).trigger("click");},210)
		});
		$("#followTab span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$("#followTab"+ind).siblings().fadeOut('fast');
			setTimeout(function(){ $("#followTab"+ind).fadeIn('fast');},210)
		});
		$("#followOnTab span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$("#followOnTab"+ind).siblings().fadeOut('fast');
			setTimeout(function(){ $("#followOnTab"+ind).fadeIn('fast');},210)
		});
		$(".tab-title5 span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
		});
	 	$("#hoverTitle").on("mouseover",function(){
			$(".tab-cover").fadeIn('fast');
			$(this).find("span").addClass("active");
		})
		$("#column1").on("mouseleave",function(){
			$(".tab-cover").fadeOut('fast');
			$('#hoverTitle span').removeClass("active");
		}) 
		$("#selectMap p").on("click",function(){
			var ind = $(this).index();
			console.log(ind+"=======");
			$(this).addClass("on").siblings().removeClass("on");
			if(ind == 0){ getCompany()}
			if(ind == 1){
				$.get('${ctx}/static/map/360000.json', function (chinaJson) {
				    echarts.registerMap('jiangxi', chinaJson);
				    getCompany('360000')
				});
				//getCompany('360000');
			}
			if(ind == 2){
				$.get('${ctx}/static/map/360900.json', function (chinaJson) {
				    echarts.registerMap('yichun', chinaJson);
				    getCompany('360900')
				});
				//getCompany('360900');
			}
		});
		$("#products a").on("mouseenter",function(){
			var name = $(this).text();
			getLiProduct(name);
		})
		$("#products a").on("click",function(){
			var id = $(this).text();
			window.open("${ctx}/front/ldDataCenter/index/3?type=1&typeName="+id)
		})
		getLiNewsType();
		getLiScienceType();
		getAssistExpertInfoList(1,9);
		getIndustrialImage(1,2);
		getMoney();
		getLogos();
		chartholi();
		installPieChart();
	});
	function chartjinkou(){
		$("#holi").hide();
		$("#jinkou").show();
	}
	function chartchukou(){
		$("#jinkou").hide();
		$("#holi").show();
	}
	function installPieChart(){
		var pieLegend = ["NCM","LFP","LMO","LTO","NCA"];
		var pieSeries = [
			{name: "NCM",value: "4140.0"},
			{name: "LFP",value: "1884.3"},
			{name: "LMO",value: "52.4"},
			{name: "LTO",value: "44.1"},
			{name: "NCA",value: "7.7"}
		]
		
		var div_ = document.getElementById("install");
		div_.removeAttribute("_echarts_instance_");
		var chart = echarts.init(div_);
		//var chart = echarts.init(document.getElementById('install'));
		pieOption.legend.data = pieLegend;
		pieOption.series[0].data = pieSeries;
		
		chart.setOption(pieOption);
	}
	var pieOption = {
		tooltip: {
			trigger: 'item',
	        formatter: "{d}%"
		},
	    legend: {
	    	show: true,
	    	data:[],
	    	orient: 'vertical',
	    	top: '5%',
	        left: '0',
	        itemWidth: 10,
	        itemHeight: 10,
	        itemGap: 10,
	   		textStyle: {
	            color: "#fff"
	        },
	    },
	   	grid: {
	    	top: '20%',
	    	left: '0%',
	        right: '0%',
	        bottom: '0%',
	        containLabel: true
	    },
	    color:['#FF43CC','#FFA360','#0060B1','#E60012','#FFFF60',
	        '#8957A1','#2199FF','#FF4571','#4EC971'],
	    series: [{
	        type: 'pie',
	        radius : '70%',
	        center: ['60%', '55%'],
	        /* label: {
	        	formatter: function(params){
	        		console.log(params);
	            	return (params.percent).toFixed(1)+"%";
	            },
	        }, */
	        itemStyle:{
	        	  normal : {
			             label:{
			            	 textStyle:{
			            		 fontSize:8
					         }
			             },
	            	  borderWidth:3,
			          borderColor:'rgba(26, 54, 93,0.9)',
		            },
	        },
	        labelLine: {
	        	length: 10,
	        	length2: 10,
			},
	    }] 
	};
	function chartholi(){
		$("#jinkou").hide();
		$("#holi").show();
		var chart = echarts.init(document.getElementById('holi'));
		var option = {
			legend: {
		        data:['17年出口量','17年出口均价','18年出口量','18年出口均价'],
		        textStyle:{
		        	color:'#0cfcfa',
		        	fontSize:8
		        },
		        padding:[1,0.2],
		        bottom:2,
		        itemGap:0.1,
		        itemHeight:6,
		        itemWidth:10
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
		        bottom: '12%',
		        top:'18%',
		        containLabel: true
		    },
		    xAxis: [{
		        type: 'category',
		        boundaryGap: true,
		        axisLine: {
		            lineStyle: {
		                color: '#0cfcfa'
		            }
		        },
		        data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月'],//, '9月', '10月', '11月', '12月'],
		        axisTick: {
		            show: false
		        },
		        axisLabel:{
		        	margin: 5,
		        	interval:0,
		            textStyle:{
		            	fontSize:12,
		            	color:  'rgba(12,252,250,.5)'
		            }
		        }
		    }],
		    yAxis: [{
		        type: 'value',
		        name:'吨      ',
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
		                color: '#0cfcfa'
		            }
		        },
		        axisLabel: {
		            textStyle: {
		                fontSize: 12,
		            	color:  'rgba(12,252,250,.5)'
		            }
		        }
		    },{
		        type: 'value',
		        name:'美元/吨',
	            scale: true,
	            min:0,
	            max:20000,
		        axisLine: {
		            show:false
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
		                color: '#0cfcfa'
		            }
		        },
		        axisLabel: {
		            textStyle: {
		                fontSize: 10,
		            	color:  'rgba(12,252,250,.5)'
		            }
		        },
	            boundaryGap: [3, 3]
		    }
		    
		    ],
		    series: [{
				        name: '17年出口量',
				        type: 'bar',
				        barWidth  : '5',
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
				        data: ['1223.38','598.75','2156.79','1977.34','1612.26','1118.44','1627.82','1723.7']//,'2101.21','1668.34','2228.57','1346.87'],
				    },
				    {
				        name: '17年出口均价',
				        type: 'line',
				        barWidth  : '5',
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
				        data: ['13282.61','13121.52','12521.33','11944.72','11044.69','11944.72','12821.33','12163.06']//,'11296.7','10764.84','11332.38','11905.87'],
				    },{
				        name: '18年出口量',
				        type: 'bar',
				        barWidth  : '5',
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
				        data: ['1240.36','747.31','4244.07','2222','2222','2222','2222','2394.95']//,'2397.176','2222','2222','2222'],
				    },
				    {
				        name: '18年出口均价',
				        type: 'line',
				        barWidth  : '5',
				        yAxisIndex: 1,
				        symbolSize: 10,  
				        itemStyle: {
				            normal: {
				                color: 'rgb(255, 255, 0)'
				            },
				        },
				        lineStyle: {
				            normal: {
				                color: 'rgb(255, 255, 0)'
				            },
				        },
				        data: ['13183.67','13000','13000','13000','13000','13000','13000','13282.61']//,'15488.17','15000','15000','15000'],
				    }
			]
		};
		/* if(width < 1100) {
			option.yAxis[0].splitNumber = 1;
		} */
		chart.setOption(option);
		var axisData = new Array('1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月');
		var data4 = new Array('1223.38','598.75','2156.79','1977.34','1612.26','1118.44','1627.82','1723.7','2101.21','1668.34','2228.57','1346.87')
		var data5 = new Array('13282.61','13121.52','12521.33','11944.72','11044.69','11944.72','12821.33','12163.06','11296.7','10764.84','11332.38','11905.87');
		var data6 = new Array('1240.36','747.31','4244.07','3000','2500','2400','2300','2394.95','2397.176','','','');
		var data7 = new Array('13183.67','13000','12000','13000','14000','13000','14000','13282.61','15488.17','','','');
		var count = 9;
		setInterval(function (){
		    var data0 = option.series[0].data;
		    var data1 = option.series[1].data;
		    var data2 = option.series[2].data;
		    var data3 = option.series[3].data;
		    data0.shift();
		    data0.push(data4[count-1]);
		    data1.shift();
		    data1.push(data5[count-1]);
		    data2.shift();
		    data2.push(data6[count-1]);
		    data3.shift();
		    data3.push(data7[count-1]);

		    option.xAxis[0].data.shift();
		    option.xAxis[0].data.push(axisData[count-1]);
		    if (count == 12) {
				count = 1;
			}else{
		    	count = count+1;
			}
		   chart.setOption(option);
		}, 2000);
	 }
	function goIndex6(){
		var type = $('#type1').val();
		window.location.href=("${ctx}/front/ldDataCenter/index/6?type="+type)
	}
	function goIndex4(){
		var type = $('#type').val();
		window.location.href="${ctx}/front/ldDataCenter/index/4?type="+type;
	}
	function getMoney() {
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/pkInTpInOpMnAcLog/pkInTpInOpMnAcLogList?areaId=360900",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result) {
				if(result.success){
					chart1(result.value);	
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	};
	function getLogos() {
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liCompInfo/getLogoList",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result) {
				if(result.success){
					console.log(result)
					var val = result.value;
					var _div = '';
					for(var i = 0;i < 2;i++){
						for(var j = 0;j < val.length;j++){
							_div += '<a href="javascript:;" onclick="toMap(\''+val[j].id+'\',6)"><img src="'+val[j].logoUrl+'"></a>';
						}
					}
					$("#companyBox").html(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getLiProduct(name){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liProductIndicators/list",
			type : "post",
			data : {
				"goodsName": name,
			    "showType": 1,
			},
			dataType : "json",
			success : function(result) {
				if(result.success){
					var _div = '';
					for(var i=0;i<result.list.length;i++){
						var info = result.list[i];
						if(i==0){ 
							var text = "";
							if(info.indicatorsParam){
								text = info.goodsName+'('+info.indicatorsParam+')';
						    }else {
								text = info.goodsName;
							}
							$("#liName").text(text);
							searchProduct('',info.id,text);
						}
						if(info.indicatorsParam){ 
							_div += '<p onclick="searchProduct(this,\''+ info.id +'\')">'+info.goodsName+'('+info.indicatorsParam+')</p>'
						} else {
							_div += '<p onclick="searchProduct(this,\''+ info.id +'\')">'+info.goodsName+'</p>'
						}
					}
					$("#selectDiv").html(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getIndustrialImage(pageNum,pageSize){
		 $('.artical-box').empty();
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liIndustrySummit/list",
			type : "post",
			data : {
				"pageNum": pageNum,
			    "pageSize": pageSize,
			    "status": '1'
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					 _div += '<div class="swiper-slide">'
					 _div += '<a target="_blank" href="'+info.url+'" style="width: 100%; height: 100%;">'
					 _div += '<img src="'+info.imageUrl+'" title="'+info.title+'">'
					 _div += '</a>'
					 _div += '</div>'
				    $('#swiper3Chirld').append(_div);
				} 
				var swiper3 = new Swiper('#swiper3', {
					autoplay:true,
				    observer:true,
				    spaceBetween : 10,
				    pagination: {
				        el: '.swiper-pagination',
					    clickable :true,
				    },
			 });
				$('#science-3').hide();
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
				    $('#swiper3Chirld').append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function openImgUrl(url){
 		window.open(url,"_blank");
 	}
	function searchProduct(e,id,text){
		if(e==''){
			$("#liName").text(text);
		}else{
			$("#liName").text($(e).text());
		}
		$('.select-div').slideUp();
		var param = {
				"indicatorsId": id,
				//"belongDate": '2018-08-09',
				"orderByClause": 'm.BELONG_DATE DESC',
			    "dateType": 0
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liProductMarket/list",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				console.log(result)
				if(result.success){
					if(result.value.length > 0){
						var info = result.value[0];
						if(info.priceUnit=='元/吨'){
							var avgPrice = info.avgPrice/10000;
							var minPrice = info.minPrice/10000;
							var maxPrice = info.maxPrice/10000;
							$('#priceUnit').text('单位：万元/吨');
							$("#productPrice font:eq(0)").text(avgPrice);
							$("#productPrice font:eq(1)").text(minPrice + '-' + maxPrice);
						}else{
							$('#priceUnit').text('单位：'+info.priceUnit);
							$("#productPrice font:eq(0)").text(info.avgPrice);
							$("#productPrice font:eq(1)").text(info.minPrice + '-' + info.maxPrice);
						}
						$("#productPrice font:eq(2)").text(info.riseFall);
					} else {
						$("#productPrice font:eq(0)").text('-');
						$("#productPrice font:eq(1)").text('-');
						$("#productPrice font:eq(2)").text('-');
					}
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getLiScienceType(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/serviceInstitutionInfo/kindList",
			type : "post",
			data : {
				"kindName": "锂电",
			    "type": '1',
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.kindList;
				if(infoList.length>0){
					for(var i=0;i<infoList.length;i++){
						var list = infoList[i];
						if(list.kindName=="锂电"){
							$('#kindId').val(list.kindId);
							$('#kindName').val(list.kindName);
							break;
						}
					}
					getLiScienceList(1,9);
				}else{
					$('#science-2').hide();
					var _div = "<div id='noData'>暂无数据</div>";
					$("#swiper2Chirld").append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getLiNewsType(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liNewsType/list",
			type : "post",
			data : {
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
			 	for(var i=0;i<3;i++){
					var info = infoList[i];
					var _div = "";
					getliNewsInfoListById(1,5,info.id,i);
					if(i==0){
						_div += '<span class="on" onclick="selectByKey(this,'+info.id+','+i+');">'+info.typeName+'</span>'
					}else{
						_div += '<span onclick="selectByKey(this,'+info.id+','+i+')">'+info.typeName+'</span>'
					}
					$('.tab-title-trends').append(_div);
				} 
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getliNewsInfoListById(pageNum,pageSize,id,type){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liNewsInfo/list",
			type : "post",
			data : {
				"status": '1',
				"typeIds": id,
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				"status": '1'
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					var t = formatCSTDate(info.createTime,"yyyy-MM-dd");
					_div += '<a target="_blank" href="${ctx}/front/ldDataCenter/index/5?id='+info.id+'" class="trends-a">'
					_div +=	'<font>'+info.title+'</font>'
					_div += '<span>'+t+'</span>'
				    _div +='</a>'
				    if(type==0){
				    	$('#trends-0').append(_div);
				    }else if(type==1){
				    	$('#trends-1').append(_div);
				    }else{
				    	$('#trends-2').append(_div);
				    }
				}
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
					   if(type==0){
					    	$('#trends-0').append(_div);
					    }else if(type==1){
					    	$('#trends-1').append(_div);
					    }else{
					    	$('#trends-2').append(_div);
					    }
				}
				
				
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		});
	}
	function selectByKey(obj,id,type){
		$('#type').val(type);
		$(".tab-title-trends span").removeClass("on");
		$(obj).addClass("on");
		  if(type==0){
		    	$('#trends-0').show();
		    	$('#trends-1').hide();
		    	$('#trends-2').hide();
		    }else if(type==1){
		    	$('#trends-1').show();
		    	$('#trends-0').hide();
		    	$('#trends-2').hide();
		    }else{
		    	$('#trends-2').show();
		    	$('#trends-0').hide();
		    	$('#trends-1').hide();
		    }
		
	}
	function getLiScienceList(pageNum,pageSize) {
		if($('#kindId').val()==''||$('#kindId').val()==undefined){
			var _div = "<div id='noData'>暂无数据</div>";
			$("#science-2").append(_div);
			return;
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/serviceInstitutionInfo/list", 
			type : "post",
			data : {	
				"pageNum" : pageNum,
				"pageSize" : pageSize,
  			 	"serviceKindId" : $('#kindId').val(),
  			 	"type": '1',
 			 	"orderByClause" : "create_time desc",
 			},
			dataType : "json",
			success : function(result) {
			 	var infoList = result.value;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					 _div += '<div class="swiper-slide">'
					_div += '<a class="dib" target="_blank" href="${ctx}/yc/detail?type=5&entranceId=${entranceId}&id='+info.id+'">'
					_div += '<div class="middle-pic">'
					if(info.logoUrl){
						_div +=	 '<div class="expert-pic" style="background-image:url('+info.logoUrl+')">'
					}else{
						_div +=	'<div class="expert-pic" style="background-image:url(${ctx}/static/image/homePage_yc/kyjg1.png)">'
					}
					_div += '</div>'
				    _div += '<div class="expert-infor">'
				    _div += '<h3><strong class="institution-strong">'+info.institutionName+'</strong></h3>'
				  /*   if(info.researchDirection){
					    _div += '<p>'+info.researchDirection+'</p>'
				    }else{
					    _div += '<p class="no-p"></p>'
				    } */
				    _div += '</div>'
					_div += '</div>'
				    _div +=	'</a>'
					_div += '</div>'
					$("#swiper2Chirld").append(_div);
				} 
				var swiper2 = new Swiper('#swiper2', {
					autoplay:true,
				    slidesPerView: 3,
				    slidesPerColumn :1,
				    spaceBetween : 10,
				    observer:true,
				 });
				$('#science-2').hide();
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
					$("#swiper2Chirld").append(_div);
				}
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getAssistExpertInfoList(pageNum,pageSize) {
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/assistExpertInfo/list",
			type : "post",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize,
  			 	"typeId" : "90020180925100647002193000000001",
 			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					 _div += '<div class="swiper-slide">'
					_div += ' <a class="dib" target="_blank" href="${ctx}/expert/detail/'+info.expertId+'?entranceId=3609009">'
					_div += '<div class="middle-pic">'
					if(info.imageUrl){
						_div +=	 '<div class="expert-pic" style="background-image:url('+info.imageUrl+')">'
					}else{
						_div +=	 '<div class="expert-pic" style="background-image:url(${ctx}/static/image/homePage_yc/headPortrait.png)">'
					}
					_div += '</div>'
					_div +=  '<div class="expert-infor">'
					_div +=	  '<h3><strong>'+info.expertName+'</strong></h3>'
					_div += '<p>'+(info.typeName==undefined?'':info.typeName)+'</p>'
					_div += '</div>'
					_div += '</div>'
					_div += '</a>'
					_div += '</div>'
					$("#swiper1Chirld").append(_div);
				}
				var swiper1 = new Swiper('#swiper1', {
					autoplay:true,
					slidesPerView :3,
				    slidesPerGroup : 1,
				    spaceBetween : 10,
				    observer:true,
				 });
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
					$("#swiper1Chirld").append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getCompany(areaId) {
		console.log("==999===");
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liCompInfo/list",
			type : "post",
			data : {
				compPrId: areaId == '360000' || areaId == '360900' ? '360000' : '',
				compAreaId: areaId == '360900' ? areaId : ''
			},
			dataType : "json",
			success : function(result) {
				var mapData = [];
				clearArr(); //清除之前加载数据，否则会叠加
				if(areaId == '360000'){
					mapData = jx;
					for(var i=0;i<result.value.length;i++){
						var val = result.value[i];
						for(var j=0;j<mapData.length;j++) {
							if(val.compAreaId == mapData[j].name){
								mapData[j].value[2] += 1;
							}
						}
					}
					console.log(mapData);
					console.log("==888===");
					//chart2('jiangxi',mapData);
					chart2('china',mapData);
				}
				else if(areaId == '360900'){
					mapData = yc;
					for(var i=0;i<result.value.length;i++){
						var val = result.value[i];
						for(var j=0;j<mapData.length;j++) {
							if(val.compSpaceId == mapData[j].name){
								mapData[j].value[2] += 1;
							}
						}
					}
					console.log(mapData);
					console.log("==777===");
					//chart2('yichun',mapData);
					chart2('china',mapData);
				} else {
					mapData = zg;
					for(var i=0;i<result.value.length;i++){
						var val = result.value[i];
						for(var j=0;j<mapData.length;j++) {
							if(val.compPrId == mapData[j].name){
								mapData[j].value[2] += 1;
							}
						}
					}
					console.log(mapData);
					console.log("==666===");
					chart2('china',mapData);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		})
	}
	function getMap(areaId) {
		var file = areaId + '.json';
		$.get('${ctx}/static/map/'+file, function (chinaJson) {
	        echarts.registerMap(areaId, chinaJson);
	        optionMap.geo.map = areaId;
	        var myChart = echarts.init(document.getElementById('map2'));
	        myChart.setOption(optionMap);
		});
	}
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format) {
		return formatDate(new Date(strDate), format);
	}
	// 格式化日期,
	function formatDate(date, format) {
		var paddNum = function(num) {
			num += "";
			return num.replace(/^(\d)$/, "0$1");
		}
		// 指定格式字符
		var cfg = {
			yyyy : date.getFullYear(), // 年 : 4位
			yy : date.getFullYear().toString().substring(2),// 年 : 2位
			M : date.getMonth() + 1, // 月 : 如果1位的时候不补0
			MM : paddNum(date.getMonth() + 1), // 月 : 如果1位的时候补0
			d : date.getDate(), // 日 : 如果1位的时候不补0
			dd : paddNum(date.getDate()),// 日 : 如果1位的时候补0
			hh : paddNum(date.getHours()), // 时
			mm : paddNum(date.getMinutes()), // 分
			ss : paddNum(date.getSeconds())
		// 秒
		}
		format || (format = "yyyy-MM-dd hh:mm:ss");
		return format.replace(/([a-z])(\1)*/ig, function(m) {
			return cfg[m];
		});
	}
	function getLiTotal() {
		var url = '${OfficeUrl}XOffice/interface/json/liStorageVolume/list';
		$.ajax({
			url : url,
			type:"post",
			data:{
				yearCaliber: '2017'
			},
			dataType : "json",
			success : function(result) {
				var world = 0;
				var china = 0;
				var yc = 0;
				for(var i = 0; i < result.value.length; i++){
					if(result.value[i].zoneName == '合计(大约)'){
						if(result.value[i].type == 0){
							world = parseInt(result.value[i].liWeight);
						} else { china = parseInt(result.value[i].liWeight);}
					}
					if(result.value[i].zoneName == '江西宜春'){
						yc = parseInt(result.value[i].liWeight);
					}
				}
				chart0(world,china,yc);
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		});
	}
	function toLink(type){
		if(type == 1) { window.open("https://p4psearch.1688.com/p4p114/p4psearch/offer2.htm?spm=a312h.2018_new_sem.dh_001.2.30b37032R3BqDV&keywords=1860%E9%94%82%E7%94%B5%E6%B1%A0&cosite=baidujj&location=landing_t4&trackid=8856883915965976784496&keywordid=95224439757&format=normal&sortType=&descendOrder=&province=&city=&priceStart=&priceEnd=&dis=&provinceValue=%E6%89%80%E5%9C%A8%E5%9C%B0%E5%8C%BA")}
		else if(type == 2) { window.open("https://p4psearch.1688.com/p4p114/p4psearch/offer2.htm?spm=a312h.2018_new_sem.dh_001.2.30b37032R3BqDV&keywords=%E8%B4%9F%E6%9E%81%E6%9D%90%E6%96%99&cosite=baidujj&location=landing_t4&trackid=8856883915965976784496&keywordid=95224439757&format=normal&sortType=&descendOrder=&province=&city=&priceStart=&priceEnd=&dis=&provinceValue=%E6%89%80%E5%9C%A8%E5%9C%B0%E5%8C%BA")}
		else if(type == 6) { toOffice('/oneApplication?menuId=90020180525085042800043000000002&subMenuId=90020180702103843800045000000001&isCheckFlag=1');}
		else if(type == 7) { toOffice('/oneApplication?menuId=90020170411145757801119000000011');}
		else { window.open("${ctx}/front/ldDataCenter/index/7?type="+type);}
	}
	function toMap(id,type){
		window.open("${ctx}/front/ldDataCenter/index/7?type="+type+"&typeId="+id)
	}
	function clearArr(){
		for(var i=0;i<jx.length;i++){
			jx[i].value[2] = 0;
		}
		for(var j=0;j<yc.length;j++){
			yc[j].value[2] = 0;
		}
		for(var k=0;k<zg.length;k++){
			zg[k].value[2] = 0;
		}
	}
</script>
</html>
