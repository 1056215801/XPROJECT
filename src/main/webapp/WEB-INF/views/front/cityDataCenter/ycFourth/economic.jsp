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
<title>宜春工业大数据工业运行</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content p15 fz0">
		<input type="hidden" id="orgId" value="${orgId}" name="orgId">
		<input type="hidden" id="areaOd" value="0" name="areaOd">
		<input type="hidden" id="areaYear" value="" name="areaYear">
		<input type="hidden" id="areaMon" value="" name="areaMon">
		<input type="hidden" id="parkOd" value="0" name="parkOd">
		<input type="hidden" id="parkYear" value="" name="parkYear">
		<input type="hidden" id="eightYear" name="eightYear">
		<input type="hidden" id="eightMonth" name="eightMonth">
		<input type="hidden" id="eightOd" value="ZYYWSR_VALUE DESC" name="eightOd">
		<input type="hidden" id="eightOt" value="0" name="eightOt">
		<input type="hidden" id="tenYear" name="tenYear">
		<input type="hidden" id="tenMonth" name="tenMonth">
		<input type="hidden" id="tenOd" value="ZYYWSR_VALUE DESC" name="tenOd">
		<input type="hidden" id="tenOt" value="0" name="tenOt">
		<input type="hidden" id="iceYear" value="" name="iceYear">
		<input type="hidden" id="priceYear" name="priceYear">
		<input type="hidden" id="proId" value="">
		<input type="hidden" id="totalYear" name="totalYear">
		<input type="hidden" id="totalMonth" name="totalMonth">
		<input type="hidden" id="totalMonth2" name="totalMonth2">
		<input type="hidden" id="totalYear2" name="totalYear2">
		<input type="hidden" id="selectType" name="selectType" value="0">
		<div class="spanStyle" style="width: 25%;">
			<div class="blockStyle" style="height: 60%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tab-links tab-links-fourth gradual-change-title" id='areaTarget'>
						<span class="on">区县指标</span>
						<span>园区指标</span>
						<div class="fr selects">
							<div class="select" id="prgYearSelect">
								<p><font id="areaFont"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="areaUl"></ul>
								</div>
							</div>
							<div class="select" id="prgMonthSelect">
								<p><font id="areaMonth"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="areaMonthUl">
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
					<div class="tabs">
						<div class="tab">
							<div class="orders ordersFourth areaTarget" id="areaOrder">
								<span class="on">主营业务收入</span>
								<span>利润总额</span>
								<span id="processGs">规上企业数量</span>
							</div>
							<div class="count-list area-list target-list" id="areaList">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(40% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tab-links tab-links-fourth gradual-change-title">
						<span class="on" onclick="checkRight(26,'','index1_code8','规上企业')" style="width:120px;">规上企业</span>
						<div class="fr selects" >
							<div class="select">
								<p><font id="guishangFont">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="guishangUl"></ul>
									<li>2018</li>
								</div>
							</div>
						</div>
					</div>
					<div class="tabs">
						<div class="tab">
							<div class="select-guishang" id="select-guishang">
								不同主营规模：
								<span class="on">企业数量</span>
								<span>主营总量</span>
								<span>利润总量</span>
							</div>
							<div id="pie-guishang"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(50% - 10px);">
			<div class="blockStyle" style="height: 50px;">
				<div class="outsideBox currentlyTotalBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="currentlyTotal"><span>截至目前，宜春市工业大数据平台共接入数据</span><span id="totalNum"></span><span>条</span></div>
				</div>
				<div class="fr selects totalDate">
					<div class="select">
						<p><font id="totalFont"></font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="totalUl"></ul>
						</div>
					</div>
					<div class="select">
						<p><font id="totalFont2"></font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="totalUl2">
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
			<div class="blockStyle" style="height: calc(65% - 60px);">
				<div class="price-num fourth-price-num" style="margin-top: 0px;">
					<span onclick='checkRight("2","","index1_code2","主要经济指标")'>
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
					<span onclick='checkRight("2","","index1_code2","主要经济指标")'>
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
					<span onclick='checkRight("2","","index1_code2","主要经济指标")'>
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
								<font class="bigProjectDataNum" style="margin-right: -5px;" id="lrze"></font>
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
					<span onclick='checkRight("3","","index1_code3","工业用电")'>
						<div class="middle-box price-num1">
							<p>工业用电总量（万 kwh）</p>
							<h1 class="lgT" id="gyydlgT"><font class="bigProjectDataNum" id="gyyd"></font></h1>
						</div>
					</span>
				</div>
				<div class="yc-map" id="ycEconMap" style="height: 82%;"></div>
				<div class="map-areas econmic-map-areas">
					<span style="cursor: pointer;">
						<h4>宜春市</h4>
					</span>
					<span>
						<h4>宜春市</h4>
					</span>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(35% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="electric-title electric-title-fourth gradual-change-title">
						<span class="bgT electric-title-span" onclick='checkRight("27","","index1_code9","规上企业纳税")'>规上企业纳税（单位：亿元）</span>
						<div class="fr selects" >
							<div class="select">
								<p><font id="iceFont"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="iceUl"></ul>
								</div>
							</div>
						</div>
						<span class="noBorderLeft  legend changeLegend legend_new" id="changeChart1">
         					<font class="chirld-legend on"><span></span>累计</font>
         					<font class="chirld-legend"><span></span>本月</font>
				         </span>
						<!-- <div class="iceBergLegend" id="iceBergLegend">
							<span><i></i>累计</span>
							<span><i></i>本月</span>
						</div> -->
					</div>
					<div class="electric-subheading" style=" font-size:14px; " id="electric-subheading">
						<span>规上企业总数：<b>356 家</b></span>
						<span>规上企业纳税总额：<b>431 亿元</b></span>
					</div>
					<div class="electric-chart electric-chart-fourth" id="electricTab0">
						<div class="chart3" id="icebergChart"></div>
					</div>
					<div class="electric-chart" id="electricTab1">
						<p>暂未录入数据</p>
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(25% - 10px);">
			<div class="blockStyle" style="height: 50%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tab-links tab-links-fourth gradual-change-title" id="select-industry">
						<span class="on">八大产业</span>
						<span>十大基地</span>
						<div class="fr selects" >
							<div class="select" id="select-eight-year1">
								<p><font id="eightFont1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="eightUl1">
									</ul>
								</div>
							</div>
							<div class="select" id="select-eight-year2">
								<p><font id="eightFont2">1月</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
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
							<div class="select" id="select-ten-year1" style="display:none;">
								<p><font id="tenFont1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="tenUl1">
									</ul>
								</div>
							</div>
							<div class="select" id="select-ten-year2" style="display:none;">
								<p><font id="tenFont2">1月</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="tenUl2">
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
					<div class="tabs">
						<div class="tab" id="eight-fourth">
							<div class="orders ordersFourth" id="eightOrder">
								<span class="on">主营业务收入</span>
								<span>工业增加值</span>
								<span>利润总额</span>
							</div>
							<div class="count-list area-list target-list eightIndustry-list" id="industry-list1" onclick="goSeven()"></div>
						</div>
						<div class="tab" id="ten-fourth" style="display:none;">
							<div class="orders ordersFourth" id="tenOrder">
								<span class="on">主营业务收入</span>
								<span>利润总额</span>
							</div>
							<div class="count-list area-list target-list eightIndustry-list" id="industry-list2" onclick="goTen()"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(50% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="electric-title electric-title-fourth gradual-change-title">
						<span class="bgT electric-title-span" onclick='checkRight("23","","index1_code10","主要产品价格")'>主要产品价格</span>
						<div class="fr selects" >
							<div class="select">
								<p><font id="priceFont"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="priceUl"></ul>
								</div>
							</div>
						</div>
					</div>
					<div class="tabs tabsTable">
						<div class="priceTableTitle"><span>产品名称</span><span>单位</span><span>平均价格(元)</span><span>同比增减</span></div>
						<div class="priceTable">
							<table id='priceTable' onmouseenter="loopPause()" onmouseleave="loopStart()"></table>
						</div>	
						<div class='priceUnit'><span><i id='proName'></i>平均价格走势图</span><b>单位 元</b></div>
						<div class="averageLine" id="averageLine"></div>
					</div>
			  </div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script src="${ctx}/static/js/dataCenter/map/coordMap.js"></script>
<script type="text/javascript">
var loop = '';
var num = 0;
var length = 0;
var h1 = 0;
var trHeight = 32;
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	$(function(){
		//分辨率过低提示
		if(width<1440&&(sessionStorage.isgood==0 ||sessionStorage.isgood == null||sessionStorage.isgood==undefined)){
			   layer.confirm('您的电脑分辨率过低，为了保证最优的展现效果建议您更换为1920x1080（或1600x900、1440X900）分辨率。'+'\n'+'<a target="blank" href="https://jingyan.baidu.com/article/3ea5148904ad9c52e61bbac2.html">如何设置分辨率?</a>', {
             btn: ['确定','取消'], title:"提示" , btn1:function(index){
          	   sessionStorage.isgood = 1 ;
          	   layer.close(index);
             }, btn2: function (index) {
          	   sessionStorage.isgood = 0 ;
          	   layer.close(index);
             },cancel: function(){ 
          	   sessionStorage.isgood = 0 ;
             }
	       });
		}
		
		$(".head>a:eq(1)").addClass("on");
		$(".select p").on("click",function(){
			if($(this).next().css("display")!='block'){
				$(".select p").next().slideUp();
			}
			$(this).next().slideToggle();
		});
		$(document).click(function(event){
			if(!$(".select p").is(event.target) && $(".select p").has(event.target).length === 0){
				$('.select-items').slideUp();
			}
		});
		$(".map-areas span:eq(0)").on("click",function(){
			$(this).next().removeClass("on");
			$("#orgId").val('360900');
			getEconomic();
			getElectric();
		});
		$(".orders span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			if($(this).parent().attr("id") == 'areaOrder') {
				$("#areaOd").val(ind);
				if($('#processGs').hasClass('on')){
					getProcessGs();//规上企业数量
					$('#prgYearSelect').hide();
					$('#prgMonthSelect').hide();
				}else{
					$('#prgYearSelect').show();
					$('#prgMonthSelect').show();
					if($("#areaTarget span:eq(0)").hasClass('on')){
						getProcess(0);
					}else{
						getProcess(1);
					}
				}
			}else if($(this).parent().attr("id") == 'eightOrder') {
				var o = ind == 0 ? 'ZYYWSR_VALUE DESC' : ind == 1 ? 'GYZJZ_PERCENT DESC' : 'LR_VALUE DESC';
				$("#eightOd").val(o);
				$("#eightOt").val(ind);
				getIndustryList(0);
			} else if($(this).parent().attr("id") == 'tenOrder') {
				var o = ind == 0 ? 'ZYYWSR_VALUE DESC' : 'LR_VALUE DESC';
				$("#tenOd").val(o);
				$("#tenOt").val(ind);
				getTenMajotList(0);
			}
		});
		$('.select-guishang span').on("click",function(){
			var index = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			getGsPie(index);
		});
		$('#areaTarget span').on("click",function(){
			var index = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$(".areaTarget span:eq(0)").addClass('on').siblings().removeClass('on');
			$('#areaOd').val('0');
			getProcess(index);
			$('#prgYearSelect').show();
			$('#prgMonthSelect').show();
			if($("#areaTarget span:eq(0)").hasClass('on')){
				$('#processGs').show();
			}else{
				$('#processGs').hide();
			}
		});
		$('#select-industry span').on("click",function(){
			var index = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			if($('#select-industry span:eq(0)').hasClass('on')){
				$('#eight-fourth').show();
				$('#ten-fourth').hide();
				$('#select-eight-year1').show();
				$('#select-eight-year2').show();
				$('#select-ten-year1').hide();
				$('#select-ten-year2').hide();
			}else{
				$('#ten-fourth').show();
				$('#eight-fourth').hide();
				$('#select-ten-year1').show();
				$('#select-ten-year2').show();
				$('#select-eight-year1').hide();
				$('#select-eight-year2').hide();
			}
		});
	/* 	$('#iceBergLegend span').on("click",function(){
			$(this).toggleClass('on');
			var legend1 = $('#iceBergLegend span:eq(0)'),
			legend2 = $('#iceBergLegend span:eq(1)');
			if(legend1.hasClass('on') && legend2.hasClass('on')){//都显示
				getIceBerg(3);
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){//绿色
				getIceBerg(0);
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){//黄色
				getIceBerg(1);
			}else if(!legend1.hasClass('on') && !legend2.hasClass('on')){//都不显示
				getIceBerg(2);
			}	
		}); */
		$(".changeLegend font").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$('#selectType').val(ind);
			getIceBerg();
		})
		//表格鼠标滚轮事件
		$("#priceTable").on('mousewheel',function(event, delta){
			var dir = delta > 0 ? 'Up' : 'Down';
			if (dir == 'Up') {
				if(num > 0){
					num--;
					$("#priceTable").stop().animate({top: "-"+h1*num+"px"});
					$("#priceTable tr:eq("+num+")").addClass("on").siblings().removeClass("on");
				}
			} else {
				if(num < length){
					num++;
				} else {
					num = 1;
					$("#priceTable").css({top: "0px"})
				}
				$("#priceTable").stop().animate({top: "-"+h1*num+"px"});
				$("#priceTable tr:eq("+num+")").addClass("on").siblings().removeClass("on");
			}
			$('#proId').val($('#priceTable tr.on').attr("val"));
			$('#proName').text($('#priceTable tr.on').attr("val2"));
			getAverageLine()
		});
		getselectYear();
		getYcTotalNum();
		getProcess(0);//区县任务进度
		getYcMap(1); //宜春地图
		getEconomic(); //经济指标
		getElectric(); //用电
		//getAllElectric(); //用电
		getIndustryList(1); //八大基地
		getTenMajotList(1); //十大产业
		getGsPie();//规上企业饼图
		getIceBerg();//冰山图
		getPriceTable();//产品价格
		getAverageLine();//产品平均价格
	});
	//表格定时滚动
	function loopStart(){
		if(length > 3){
			loop = setInterval(function(){
				if(num < length){
					num++;
				} else {
					num = 1;
					$("#priceTable").css({top: "0px"})
				}
				$("#priceTable").animate({top: "-"+h1*num+"px"});
				$("#priceTable tr:eq("+num+")").addClass("on").siblings().removeClass("on");
				$('#proId').val($('#priceTable tr.on').attr("val"));
				$('#proName').text($('#priceTable tr.on').attr("val2"));
				getAverageLine();
			},5000)
		}
	} 
	function loopPause(){
		clearInterval(loop);
	}
	function loopChoose(e){
		num = $(e).index();
		if(num >= length){
			num = num - length;
			$("#priceTable").css({top: "0px"})
		}
		$("#priceTable").animate({top: "-"+h1*num+"px"});
		$("#priceTable tr:eq("+num+")").addClass("on").siblings().removeClass("on");
		$('#proId').val($('#priceTable tr.on').attr("val"));
		$('#proName').text($('#priceTable tr.on').attr("val2"));
		getAverageLine();
	}
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>2014;i--){
	    	$('#areaUl').append('<li>'+i+'</li>');
	    	$('#eightUl1').append('<li>'+i+'</li>');
	    	$('#tenUl1').append('<li>'+i+'</li>');
	    	$('#iceUl').append('<li>'+i+'</li>');
	    	$('#priceUl').append('<li>'+i+'</li>');
	    	$('#totalUl').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='eightUl1'){
				$('#eightFont1').text($(this).text());
	 			$('#eightYear').val($(this).text());
	 			getIndustryList(0);
			}else if($(this).parent().attr('id')=='eightUl2'){
	  			$('#eightFont2').text($(this).text());
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'))
				$('#eightMonth').val(month);
	 			getIndustryList(0);
			}else if($(this).parent().attr('id')=='tenUl1'){
				$('#tenFont1').text($(this).text());
	 			$('#tenYear').val($(this).text());
	 			getTenMajotList(0);
			}else if($(this).parent().attr('id')=='tenUl2'){
				$('#tenFont2').text($(this).text());
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'))
				$('#tenMonth').val(month);
	 			getTenMajotList(0);
			}else if($(this).parent().attr('id')=='areaUl'){
	 			if($('#processGs').hasClass('on')){
	 				getProcessGs();
	 			}else{
	 				$('#areaYear').val($(this).text());
		 			$('#areaFont').text($(this).text());
		 			$("#areaTarget span:eq(0)").hasClass('on') ? getProcess(0) : getProcess(1);
	 			}
			}else if($(this).parent().attr('id')=='areaMonthUl'){	
				if($('#processGs').hasClass('on')){
	 				getProcessGs();
	 			}else{
	 				var month = $(this).text()
					month = month.substring(0,month.lastIndexOf('月'))
	 				$('#areaMon').val(month);
		 			$('#areaMonth').text($(this).text());
		 			$("#areaTarget span:eq(0)").hasClass('on') ? getProcess(0) : getProcess(1);
	 			}
			}else if($(this).parent().attr('id')=='iceUl'){
				$('#iceYear').val($(this).text());
	 			$('#iceFont').text($(this).text());
	 			getIceBerg();
			}else if($(this).parent().attr('id')=='priceUl'){
				$('#priceFont').text($(this).text());
	 			$('#priceYear').val($(this).text());
	 			getPriceTable();
	 			getAverageLine();
			}else if($(this).parent().attr('id')=='totalUl'){
				$('#totalFont').text($(this).text());
	 			$('#totalYear').val($(this).text());
	 			getEconomic();
	 			//getAllElectric();
			}else if($(this).parent().attr('id')=='totalUl2'){
				$('#totalFont2').text($(this).text());
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'))
				$('#totalMonth').val(month);
				getEconomic();
				//getAllElectric();
			}
		})
	}
	function getYcTotalNum(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/dataProductPrice/queryTotal",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result){
				if(result.success){
					$('#totalNum').text(result.total);
					if(result.maxTotal == '0'){
						result.maxTotal = result.total;
					}
					$('#totalNum').each(function(){
				        $(this).prop('Counter',result.total).animate({
				            Counter: result.maxTotal
				        },{
				            duration: result.seconds*1000*3,
				            easing: 'linear',//swing
				            step: function (now){
				                $(this).text(Math.ceil(now));
				            }
				        });
				    });
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	//任务进度
	function getProcess(type){
		//var id = type == 0 ? 'area' : 'park';
		var param = {
			"year" : $('#areaYear').val()==''?undefined:$('#areaYear').val(),
		    "month" : $('#areaMon').val()==''?undefined:$('#areaMon').val(),
			"areaType": type,
			"dataType": $('#areaOd').val(),
			"sortType": 0
		};
		$.ajax({
 			url : "${OfficeUrl}XOffice/interface/json/eiTargetLog/statistics",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
		 			var div = '';
		 			$('#areaFont').text(result.year);
		 			$('#areaMonth').text(result.month+'月');
		 			if(result.list.length > 0){
			 			for(var i=0;i<result.list.length;i++){
			 				var info = result.list[i];
			 				var v = param.dataType == 0 ? info.zyywsrComplete : info.lrComplete;
			 				var name = param.dataType == 0 ? info.zyywsrValue : info.lrValue;
			 				var n = name ? name : '';
			 				var w = v ? v : '0';
			 				/* if(w != '0'){ */
				 				if(type == 0) {
					 				div += '<div class="count-item" onclick=\'checkRight("4","","index1_code4","区县经济指标")\'>';
					 				div += '<font>'+info.organizationName+'</font>';
					 				div += '<span>';
					 				if(name){
					 					div += '<div style="width: '+w+'%;"></div>';
						 				div += '</span><b>'+n+'<i>亿元</i></b></div>';
					 				}else{
					 					div += '<div style="width: 0%;"></div>';
						 				div += '</span><b>未公布</b></div>';
					 				}
				 				} else {
					 				div += '<div class="count-item" onclick=\'checkRight("5","","index1_code5","园区经济指标")\'>';
					 				div += '<font>'+info.organizationName+'</font>';
					 				div += '<span>';
					 				if(name){
					 					div += '<div style="width: '+w+'%;"></div>';
						 				div += '</span><b>'+n+'<i>亿元</i></b></div>';
					 				}else{
					 					div += '<div style="width: 0%;"></div>';
						 				div += '</span><b>未公布</b></div>';
					 				}
				 				}
			 				/* } */
			 			}
		 			} else {
		 				div += '<p style="padding: 100px;text-align:center;font-size:18px;color:#fff;">暂无数据</p>';
		 			}
		 			$('#areaList').html(div);
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	};
	//规上企业数量
	function getProcessGs(){
		var param = {
			"orgId" : $('#orgId').val()=='3609009'?'360900':$('#orgId').val()
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/officeCompanyStatisticsDetails/companyTotal",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
		 			var div = '';
		 			if(result.list.length > 0){
			 			for(var i=0;i<result.list.length;i++){
			 				var info = result.list[i]
			 				var gsTotal = result.list[0].GSTOTAL;
					 		div += '<div class="count-item" onclick=\'checkRight("26","","index1_code8","规上企业")\'>';
					 		div += '<font>'+info.SPACENAME+'</font>';
					 		div += '<span>';
					 		div += '<div style="width: '+(((info.GSTOTAL?info.GSTOTAL:'0')/gsTotal)*100*0.9).toFixed(2)+'%;"></div>';
					 		div += '</span><b>'+info.GSTOTAL+'<i>家</i></b></div>';
			 			}
		 			} else {
		 				div += '<p style="padding: 100px;text-align:center;font-size:18px;color:#fff;">暂无数据</p>';
		 			}
		 			$('#areaList').html(div);
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	};
	//经济指标
	function getEconomic(){
		var param = {
			"orgId" : $('#orgId').val()=='3609009'?'360900':$('#orgId').val(),
			"year" : $('#totalYear').val(),
			"month" : $('#totalMonth').val(),
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/economicData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					$('#totalMonth2').val(result.month);
					$('#totalYear2').val(result.year);
					$('#totalFont').text(result.year);
					$('#totalFont2').text(result.month+'月');
					getAllElectric();
					var ind = result.quarter - 1;
					if(result.economic.gyzjz_percent){
						if(result.economic.gyzjz_percent==0){
							$(".tot1").hide();				
							$(".tot11").show();		
						}else{
							$(".tot1").show();				
							$(".tot11").hide();	
						}
						if(result.economic.zyywsr_value==0){
							$(".tot2").hide();				
							$(".tot21").show();
						}else{
							$(".tot2").show();				
							$(".tot21").hide();
						}
						if(result.economic.lr_value==0){
							$(".tot3").hide();				
							$(".tot31").show();
						}else{
							$(".tot3").show();				
							$(".tot31").hide();
						}
						$("#gyzjz1").removeClass("fz16").siblings().show();
						$("#zzywsr").removeClass("fz16").next().show();
						$("#lrze").removeClass("fz16").next().show();
						var gy = result.economic.gyzjz_percent.toString();
						var zy = (result.economic.zyywsr_value/10000).toFixed(2);
						var lr = (result.economic.lr_value/10000).toFixed(2);
						$("#gyzjz1").empty();
						$("#gyzjz2").empty();
						$("#zzywsr").empty();
						$("#zzywsr2").empty();
						$("#lrze").empty();
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
							$("#lrze").rollNum({
								deVal: lr.split('.')[0],
						      	digit: lr.split('.')[0].length - 1
						    });
						}else{
							$("#lrze").rollNum({
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
						if(result.economic.lr_value < 0){
							$("#lrdown").show();
						}else{
							$("#lrdown").hide();
						}
					} else {
						$("#gyzjz1").text('未公布').addClass("fz16").siblings().hide();
						$("#zzywsr").text('未公布').addClass("fz16").next().hide();
						$("#lrze").text('未公布').addClass("fz16").next().hide();
					};
					
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	};
	//规上饼图
	function getGsPie(gsType){
		var type;
		$('.select-guishang span:eq(2)').hasClass('on')?type = 2:type = 1;
		var param = {
			"areaId" : $('#orgId').val()=='3609009'?'360900':$('#orgId').val(),
			"type": type,
			"yearCaliber": 2018,
			"monthCaliber": 12
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/officeCompanyDetails/standard",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				function section(s){
					if(s==1){
						return '亿元以下'
					}else if(s==2){
						return '1-5亿'
					}else if(s==3){
						return '5-10亿'
					}else if(s==4){
						return '10-30亿'
					}else if(s==5){
						return '30-50亿'
					}else if(s==6){
						return '50亿以上'
					}
				}
				var temps=[],
				temps2=[],
				temps3=[];
				if(result.success){
					if(type == 1){
						for(var i=0;i<result.list.length;i++){
							var temp = {
								name: section(result.list[i].GRADE),
								value: result.list[i].COMPANY_TOTAL,
							};
							temps.push(temp);
							var temp2 = {
								name: section(result.list[i].GRADE),
								value: result.list[i].ZYYWSR_TOTAL,	
							};
							temps2.push(temp2);
						}
						gsPie(result,temps,0);
						if(gsType==0){
							gsPie(result,temps,0);
						}else if(gsType==1){
							gsPie(result,temps2,1);
						}
					}else{
						for(var i=0;i<result.list.length;i++){
							var temp3 = {
								name: section(result.list[i].GRADE),
								value: result.list[i].LR_TOTAL,	
							};
							temps3.push(temp3);
						}
						if(gsType==2){
							gsPie(result,temps3,1);
						}
					}
				}
			}
		})
	}
	//宜春地图
	function getYcMap(){
	    var data = [ 
			{name : '袁州区', value : ["360902",'YUANZHOU']}, 
			{name : '奉新县', value : ["360921",'FENGXIN']}, 
			{name : '万载县', value : ["360922",'WANZAI']}, 
			{name : '上高县', value : ["360923",'SHANGGAO']}, 
			{name : '宜丰县', value : ["360924",'YIFENG']}, 
			{name : '靖安县', value : ["360925",'JINGAN']}, 
			{name : '铜鼓县', value : ["360926",'TONGGU']}, 
			{name : '丰城市', value : ["360981",'FENGCHENG']}, 
			{name : '樟树市', value : ["360982",'ZHANGSHU']}, 
			{name : '高安市', value : ["360983",'GAOAN']} 
		]
		$.get('${ctx}/static/map/360900.json', function (chinaJson) {
		    echarts.registerMap('yc', chinaJson);
			yc3dMap(data);
		});
	}
	//冰山图
	function getIceBerg(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/compTaxStatistics",
			type : "post",
		 	async: false,
			data : {
				year: $('#iceYear').val(),
				type: $('#selectType').val()
			},
			dataType : "json",
			success : function(result){
				console.log(result);
				var iceData = result.value; 
				if(result.success){
					$('#iceFont').text(result.year);
					if(iceData.count){
						$('#electric-subheading span:eq(0)').find('b').text(iceData.count+' 家');
					}
					if(iceData.totalTax){
						$('#electric-subheading span:eq(1)').find('b').text(iceData.totalTax+' 亿元');
					}
					iceberg(iceData,2);
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		})
	} 
	//刷新
	var start = 0;
	var end = 13;
	//用电折线图
	var elecData = '';
	function getElectric(){
		var param = {
			"orgId" : $('#orgId').val()=='3609009'?'360900':$('#orgId').val()
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electric/meterCurveData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					if(JSON.stringify(result.chartData) == '{}') {
						$("#electricTab0").hide();
						$("#electricTab1").show();
					} else {
						$("#electricTab1").hide();
						$("#electricTab0").show();
						
						elecData = result.chartData;
						//iceberg(result.chartData,1);
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	function getAllElectric(){
		var param = { 
			"orgId" : $('#orgId').val()=='3609009'?'360900':$('#orgId').val(),
			"year" : $('#totalYear2').val(),
			"month" : $('#totalMonth2').val(),
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/electricData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					$("#gyyd").empty();
					if(result.electric.total!=undefined && result.electric.total!=''){
						if(JSON.stringify(result.electric) != '{}'){
							$("#gyyd").rollNum({
						      	deVal: result.electric.total.value.split(".")[0],
						      	digit: result.electric.total.value.split(".")[0].length
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
					
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	//八大基地
	function getIndustryList(type){
		$('#industry-list1').empty();
		var param = {
				"areaId": $('#orgId').val()=='3609009'?'360900':"360900",
				"yearCaliber": $('#eightYear').val(),
				"monthCaliber": $('#eightMonth').val(),
				"orderby": $("#eightOd").val(),
				"isNewData": type==1?1:0,
		};
		$.ajax({
	 		url : "${OfficeUrl}XOffice/interface/json/pkInTpInOpMnAcLog/dataCenterList",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					if(type==1){
						$('#eightYear').val(result.yearCaliber);
						$('#eightMonth').val(result.monthCaliber);
						$('#eightFont1').text(result.yearCaliber);
						$('#eightFont2').text(result.monthCaliber+'月');
					}
					var list = result.value;
					if(list.length>0){
						for (var i=0;i<list.length;i++){
							var info = list[i];
							var index = i+1;
							var zyywsrValue = list[0].ZYYWSR_VALUE;
							var lrValue = list[0].LR_VALUE
						    var _div = "";
						    if(i==0){
							    _div += '<div class="count-item">'
						    }else{
							    _div += '<div class="count-item">'
						    }
						    _div +=	'<font>'+info.TYPE_NAME+'</font>'
							    if(param.orderby=='ZYYWSR_VALUE DESC'){
					    	    	if(info.ZYYWSR_VALUE){
									    _div +=	'<span><div style="width: '+(((info.ZYYWSR_VALUE?info.ZYYWSR_VALUE:'0')/zyywsrValue)*100*0.9).toFixed(2)+'%;"></div></span>'
									    var ZYYWSR_VALUE = info.ZYYWSR_VALUE/10000;
									    _div +=	'<b>'+(ZYYWSR_VALUE!=undefined?ZYYWSR_VALUE.toFixed(2):'0')+'<i>亿元</i></b>'
					    	    	}else{
										 _div +='<font class="yellowT"><b>未公布</b></font>'
					    	    	}
							    }else if(param.orderby=='GYZJZ_PERCENT DESC'){
							    	if(info.GYZJZ_PERCENT){
									    _div +=	'<span><div style="width: '+(info.GYZJZ_PERCENT?info.GYZJZ_PERCENT:'0')+'%;"></div></span>'
									    _div +=	'<b>'+(info.GYZJZ_PERCENT?info.GYZJZ_PERCENT:'0')+'<i>%</i></b>'
							    	}else{
									    _div +=	'<font class="yellowT"><b>未公布</b></font>'
							    	}
							    }else{
							    	 if(info.LR_VALUE){
										  _div +=	'<span><div style="width: '+(((info.LR_VALUE?info.LR_VALUE:'0')/lrValue)*100*0.9).toFixed(2)+'%;"></div></span>'
										  var LR_VALUE = info.LR_VALUE/10000;
										  _div +=	'<b>'+(LR_VALUE!=undefined?LR_VALUE.toFixed(2):'0')+'<i>亿元</i></b>'
							    	 }else{
							    		 _div +='<font class="yellowT"><b>未公布</b></font>' 
							    	 }
							    }
						    _div += '</div>'
							$('#industry-list1').append(_div);
						}

					}else{
						var _div = "<div id='noData'>暂无数据</div>";
						$('#industry-list1').append(_div);
					}
				}else{
					tips("数据获取异常");
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	};
	//十大产业
	function getTenMajotList(type){
		$('#industry-list2').empty();
		var date = "";
		if( $('#tenYear').val()!=''&&$('#tenMonth').val()!==''){
			 date  = $('#tenYear').val()+'-'+$('#tenMonth').val();
		}
		var param = {
			"date": date,
			"orderby": $("#tenOd").val()
 		}
		$.ajax({
	  		url : "${OfficeUrl}XOffice/interface/json/dataIndustryBaseLog/dataCenterList",
			type : "post", 
			data : param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					if(type==1){
						$('#tenYear').val(result.yearCaliber);
						$('#tenMonth').val(result.monthCaliber);
						$('#tenFont1').text(result.yearCaliber);
						$('#tenFont2').text(result.monthCaliber+'月');
					}
					var list = result.value;
					if(list.length>0){
			 			for (var i=0;i<list.length;i++){
							var info = list[i];
							var index = i+1;
							var zyywsrValue = list[0].ZYYWSR_VALUE;
							var lrValue = list[0].LR_VALUE
						    var _div = "";
						    if(i==0){
							    _div += '<div class="count-item">'
						    }else{
							    _div += '<div class="count-item">'
						    }
						    _div +=	'<font>'+info.BASE_NAME+'</font>'
							    if(param.orderby=='ZYYWSR_VALUE DESC'){
					    	    	if(info.ZYYWSR_VALUE){
									    _div +=	'<span><div style="width: '+(((info.ZYYWSR_VALUE?info.ZYYWSR_VALUE:'0')/zyywsrValue)*100*0.9).toFixed(2)+'%;"></div></span>'
									    var ZYYWSR_VALUE = info.ZYYWSR_VALUE/10000;
									    _div +=	'<b>'+(ZYYWSR_VALUE!=undefined?ZYYWSR_VALUE.toFixed(2):'0')+'<i>亿元</i></b>'
					    	    	}else{
										 _div +='<font class="yellowT"><b>未公布</b></font>'
					    	    	}
							    }else{
							    	 if(info.LR_VALUE){
										  _div +=	'<span><div style="width: '+(((info.LR_VALUE?info.LR_VALUE:'0')/lrValue)*100*0.9).toFixed(2)+'%;"></div></span>'
										  var LR_VALUE = info.LR_VALUE/10000;
										  _div +=	'<b>'+(LR_VALUE!=undefined?LR_VALUE.toFixed(2):'0')+'<i>亿元</i></b>'
							    	 }else{
							    		 _div +='<font class="yellowT"><b>未公布</b></font>' 
							    	 }
							    }
						    _div += '</div>'
							$('#industry-list2').append(_div);
						} 

					}else{
						var _div = "<div id='noData'>暂无数据</div>";
						$('#industry-list2').append(_div);
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
	//产品价格
	function getPriceTable(){
		$.ajax({
	  		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/productionStatistics",
			type : "post", 
			data : {
				year : $('#priceYear').val()
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					$('#priceFont').text(result.year);
					if(result.list.length>0){
						var _table='';
						for (var j=0;j<2;j++){
				 			for (var i=0;i<result.list.length;i++){
								var info = result.list[i];
								var index = i+1;
								_table += "<tr title='"+info.compName+"' onclick='loopChoose(this)' val='"+info.id+"' val2='"+info.productName+"' class="+ (index%2!=0? 'price-tr-sing' : '') +">";
								_table += "<td>"+ info.productName +"</td><td>"+ info.productUnit +"</td><td>"+ info.salePrice +"</td><td>"+ info.growthRate +"%</td>";
								_table += "</tr>";
							}
						}
			 			$('#priceTable').html(_table);
			 			$('#priceTable tr:eq(0)').addClass("on");
			 			$('#proId').val($('#priceTable tr.on').attr("val"));
						$('#proName').text($('#priceTable tr.on').attr("val2"));
						getAverageLine();
			 			h1 = $("#priceTable tr").height();
						num = 0;
						length = result.list.length;
						if(loop != ''){
							loopPause();
							$("#priceTable").animate({top: "-"+h1*num+"px"});
							$("#priceTable tr:eq("+num+")").addClass("on").siblings().removeClass("on");
						}
						loopStart();
					};
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		})
	}
	function getAverageLine(){
		var param = {
			id: $('#proId').val(),	
		}
		$.ajax({
	  		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/productionChart",
			type : "post", 
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					averageLine(result.value);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		})
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
	//页面跳转
	function goSeven(){
		checkRight(7,$("#eightOt").val(),'index1_code6','八大产业')
	}
	function goTen(){
		checkRight(8,$("#tenOt").val(),'index1_code7','十大基地')
	}
	//实时刷新
	var websocket = null;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
	    websocket = new WebSocket("${wsPath}");
	}
	else {
	    alert('当前浏览器 Not support websocket')
	}
	
	//连接发生错误的回调方法
	websocket.onerror = function () {
	    //setMessageInnerHTML("WebSocket连接发生错误");
	};
	
	//连接成功建立的回调方法
	websocket.onopen = function () {
	   // setMessageInnerHTML("WebSocket连接成功");
	}
	
	//接收到消息的回调方法
	websocket.onmessage = function (event) {
	   // setMessageInnerHTML(event.data);
	    //自己方法
	    getElectric();
	}
	
	//连接关闭的回调方法
	websocket.onclose = function () {
	   // setMessageInnerHTML("WebSocket连接关闭");
	}
	
	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function () {
	    closeWebSocket();
	}
	
	//关闭WebSocket连接
	function closeWebSocket() {
	    websocket.close();
	}
</script>
</html>
