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
<title>宜春工业大数据首页</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<a class="to-province" href="https://www.jx968969.com/XProject/front/dataCenter/organizationCount?orgId=3600009&linkId=3609009"><img src="${ctx}/static/image/cityDataCenter/yc/jx.png"></a>
	<div class="container-fluid content">
		<input type="hidden" id="eight-year" name="eight-year">
		<input type="hidden" id="eight-month" name="eight-month">
		<input type="hidden" id="ten-year" name="ten-year">
		<input type="hidden" id="ten-month" name="ten-month">
		<input type="hidden" id="investYear" name="investYear">
		<input type="hidden" id="investQuarter" name="investQuarter">
		<input type="hidden" id="helpYear" name="helpYear">
		<input type="hidden" id="helpMonth" name="helpMonth">
		<input type="hidden" id="elecYear" name="elecYear">
		<input type="hidden" id="elecMonth" name="elecMonth">
		<input type="hidden" id="econYear" name="econYear">
		<input type="hidden" id="econQuarter" name="econQuarter">
		<input type="hidden" id="spanIndex" value="0" name="spanIndex">
		<div class="floor">
			<div class="room">
				<div class="room-content">
					<div class="tab-links" id="firstTab">
						<span class="on">主要经济指标</span>
						<span>工业用电</span>
						<div class="fr selects" id="firstTab00">
							<div class="select">
								<p><font id="econFont">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="econUl1"></ul>
								</div>
							</div>
							<div class="select">
								<p><font id="econFont2">二季度</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="econUl2">
										<li data="1">一季度</li>
										<li data="2">二季度</li>
										<li data="3">三季度</li>
										<li data="4">四季度</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="fr selects" id="firstTab01" style="display: none;">
							<div class="select">
								<p><font id="elecFont">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="elecUl1">
									</ul>
								</div>
							</div>
							<div class="select">
								<p><font id="elecFont2">1月</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="elecUl2">
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
					<div  class="tabs">
						<div class="tab" id="firstTab0">
							<div class="three-bar" onclick="goEconomic()" style="cursor: pointer;">
								<div class="span1">
									<div class="center-div">
										<p>工业增加值增幅</p>
										<h1 class="orangeT"><font id="ec1"></font><small class="orangeT">%</small></h1>
									</div>
								</div>
								<div class="span1">
									<div class="center-div">
										<p>主营业务收入</p>
										<h1 class="bgT"><font id="ec2"></font><small class="bgT">亿元</small></h1>
									</div>
								</div>
								<div class="span1">
									<div class="center-div">
										<p>利润总额</p>
										<h1 class="lgT"><font id="ec3"></font><small class="lgT">亿元</small></h1>
									</div>
								</div>
							</div>
							<div class="chart-box1">
								<div class="tab-links">
									<span class="on">工业增加值</span>
								</div>
								<div class="chart0" id="chart0"></div>
							</div>
						</div>
						<div class="tab" id="firstTab1" style="display: none;">
							<div class="electric" onclick="goElectric()" style="cursor: pointer;">
								<div class="el-box">
									<div class="middle-div">
										<span>
											<h3>工业用电总量</h3>
											<h1 class="bgT"><font id="e1"></font><small>万千瓦时</small></h1>
										</span>
										<span>
											<p>同比增长</p>
											<h2 class="bgT"><font id="e2"></font><small>%</small></h2>
										</span>
										<span>
											<p>增幅全省排名</p>
											<h2 class="bgT"><font id="e3"></font><small>名</small></h2>
										</span>
									</div>
								</div>
								<div class="el-box">
									<div class="middle-div">
										<span>
											<h3>制造业用电总量</h3>
											<h1 class="odT"><font id="e4"></font><small>万千瓦时</small></h1>
										</span>
										<span>
											<p>同比增长</p>
											<h2 class="odT"><font id="e5"></font><small>%</small></h2>
										</span>
										<span>
											<p>增幅全省排名</p>
											<h2 class="odT"><font id="e6"></font><small>名</small></h2>
										</span>
									</div>
								</div>
							</div>
							<div class="companys">
								<span>高耗能企业</span>
								<span>重点企业</span>
								<span>专精特新企业</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="room">
				<div class="room-content second-content">
					<div class="tab-links" id="nTab">
						<span class="on">三群两谷一带</span>
					</div>
					<div  class="tabs">
						<div class="tab dai" id="nTab0">
							<div class="two-box">
								<span class="main-box1"><font>三群两谷<br>一带</font></span>
								<span>建材产业群</span>
								<span>纺织鞋革产业群</span>
								<span>机械电子产业群</span>
								<span onclick="goLd()" style="cursor:pointer;">锂电谷<img class="hot" src="${ctx}/static/image/cityDataCenter/ycNew/hot.png"></span>
								<span>医药谷</span>
								<span>有机食品带</span>
								<img class="circle" src="${ctx}/static/image/cityDataCenter/ycNew/little.png">
								<img class="circle circle2" src="${ctx}/static/image/cityDataCenter/ycNew/middle.png">
								<img class="circle circle3" src="${ctx}/static/image/cityDataCenter/ycNew/max.png">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="room">
				<div class="room-content">
					<div class="tab-links" id="mTab">
						<span class="on">宜春地图</span>
						<div class="fr selects">
							<span class="title-font" id="mapTime">2017-12</span>
						</div>
					</div>
					<div  class="tabs">
						<div class="tab" id="mTab0">
							<div class="chart3" id="chart3"></div>
							<div class="map-box">
								<span class="on">区县</span>
								<span>园区</span>
								<span>企业<img class="hot" src="${ctx}/static/image/cityDataCenter/ycNew/hot.png"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="floor">
			<div class="room">
				<div class="room-content">
					<div class="tab-links" id="secondTab">
						<span class="on">工业投资</span>
						<span>项目申报</span>
						<div class="fr selects" id="secondTab00">
							<div class="select">
								<p><font id="investFont">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="investUl1">
										<li data="2018">2018</li>
									</ul>
								</div>
							</div>
							<div class="select">
								<p><font id="investFont2">一季度</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="investUl2">
										<li data="1">一季度</li>
										<li data="2">二季度</li>
									<!-- 	<li data="3">三季度</li>
										<li data="4">四季度</li> -->
									</ul>
								</div>
							</div>
						</div>
						<div class="fr selects" id="secondTab01" style="display: none;">
							<span class="title-font">截至  2017-12</span>
						</div>
					</div>
					<div class="tabs">
						<div class="tab" id="secondTab0">
							<div class="industry">
								<span>
									<h3 class="orangeT">工业投资</h3>
								</span>
								<span>
									<p>增速</p>
									<h2><font id="c1">14</font><small>%</small></h2>
								</span>
								<span>
									<p>全省排名</p>
									<h2 id="c2">14</h2>
								</span>
							</div>
							<div class="industry">
								<span>
									<h3 class="orangeT">亿元以上</h3>
									<h3>工业项目</h3>
								</span>
								<span>
									<p>工业项目</p>
									<h2><font id="c3">14</font><small>个</small></h2>
								</span>
								<span>
									<p>总投资</p>
									<h2><font id="c4">14</font><small>亿元</small></h2>
								</span>
							</div>
							<div class="industry">
								<span>
									<h3 class="orangeT">500 万以上</h3>
									<h3>技改项目</h3>
								</span>
								<span>
									<p>工业项目</p>
									<h2><font id="c5">14</font><small>个</small></h2>
								</span>
								<span>
									<p>总投资</p>
									<h2><font id="c6">14</font><small>亿元</small></h2>
								</span>
							</div>
						</div>
						<div class="tab" id="secondTab1">
							<div class="chart1" id="chart1"></div>
							<div class="infor-box">
								<div class="project">
									<p>总量</p>
									<h1 class="purpleT">120<small class="purpleT">个</small></h1>
								</div>
								<div class="project">
									<p>获批资金</p>
									<h1 class="bgT">2.5<small class="bgT">亿元</small></h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="room">
				<div class="room-content">
					<div class="tab-links" id="thirdTab">
						<span class="on">八大产业</span>
						<span>十大基地</span>
						<div class="fr selects" id="thirdTab00">
							<div class="select">
								<p><font id="eight-font1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="eight-ul1">
									</ul>
								</div>
							</div>
							<div class="select">
								<p><font id="eight-font2">1月</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="eight-ul2">
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
						<div class="fr selects" id="thirdTab01" style="display:none;">
							<div class="select">
								<p><font id="ten-font1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="ten-ul1">
									</ul>
								</div>
							</div>
							<div class="select">
								<p><font id="ten-font2">1月</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="ten-ul2">
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
						<div class="tab" id="thirdTab0">
							<div class="orders" id="eight-orders">
								<span class="on">
									主营业务收入
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
								</span>
								<span>
									工业增加值
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
								</span>
								<span>
									利润总额
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
								</span>
							</div>
							<div class="industry-list" id="industry-list1" onclick="goSeven()">
							</div>
						</div>
						<div class="tab" id="thirdTab1" style="display: none;">
							<div class="orders" id="ten-orders">
								<span class="on">
									主营业务收入
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
								</span>
								<span>
									利润总额
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
								</span>
							</div>
							<div class="industry-list" id="industry-list2" onclick="goTen()">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="room">
				<div class="room-content">
					<div class="tab-links" id="forthTab">
						<span class="on">企业统计</span>
						<span>精准帮扶</span>
						<div class="fr selects" id="forthTab00">
						</div>
						<div class="fr selects" id="forthTab01" style="display: none;">
							<div class="select">
								<p><font id="helpFont1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="helpUl1"></ul>
								</div>
							</div>
							<div class="select">
								<p><font id="helpFont2">1月</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="helpUl2">
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
						<div class="tab" id="forthTab0" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/9?orgId=3609009')">
							<div class="statistic" id="statistic"></div>
							<div class="count-list" id="countList"></div>
						</div>
						<div class="tab" id="forthTab1">
							<div class="help-bar" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/10?orgId=3609009')">
								<span>
									<div class="help-box">
										<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_11.png">
										<div class="help-infor">
											<p>累计问题</p>
											<h1 class="purpleT"><font id="t1"></font><small>个</small></h1>
										</div>
									</div>
								</span>
								<span>
									<div class="help-box">
										<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_13.png">
										<div class="help-infor">
											<p>已解决问题</p>
											<h1 class="greenT"><font id="t2"></font><small>个</small></h1>
										</div>
									</div>
								</span>
							</div>
							<div class="chart2" id="chart2"></div>
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
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script type="text/javascript">
var orderby1 = "ZYYWSR_VALUE DESC";
var orderby2 = "ZYYWSR_VALUE DESC";
var textTitle = "八大产业";
var isHidden = true;  //第二个tab的echart初始化显示，之后要隐藏，但是只有初始化要隐藏
	$(function(){
		$('#thirdTab01').hide();
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		})
		$(".orders span").on("click",function(){
			$(this).addClass("on").siblings().removeClass("on");
				var ind = $(this).index();
				$('#spanIndex').val(ind);
				if(textTitle=="八大产业"){
					if(ind==0){
						orderby1 = "ZYYWSR_VALUE DESC";
					}else if(ind==1){
						orderby1 = "GYZJZ_PERCENT DESC";
					}else if(ind==2){
						orderby1 = "LR_VALUE DESC";
					}
					getIndustryList(0);
				}
				if(textTitle=="十大基地"){
					if(ind==0){
						orderby2 = "ZYYWSR_VALUE DESC";
					}else if(ind==1){
						orderby2 = "LR_VALUE DESC";
					}
					getTenMajotList(0);
				}
			})
		$(".tab-links>span").on("click",function(){
			var ind = $(this).index();
			var p = $(this).parent().attr("id");
			textTitle = $(this).text();
			$(this).addClass("on").siblings().removeClass("on");
			$(this).parent().next().find(".tab").fadeOut("fast");
			$("#"+p+"0"+ind).show().siblings('.selects').hide();
			setTimeout(function(){
				$("#"+p+ind).fadeIn("fast");
			},210);
			if(textTitle=="八大产业"){
				$('#spanIndex').val(0);
				$('#thirdTab01').hide();
				$('#thirdTab00').show();
				orderby1 = "ZYYWSR_VALUE DESC";
				$("#eight-orders span:eq(0)").addClass("on").siblings().removeClass("on");
				getIndustryList(0);
			}
			if(textTitle=="十大基地"){
				$('#spanIndex').val(0);
				$('#thirdTab00').hide();
				$('#thirdTab01').show();
				orderby2 = "ZYYWSR_VALUE DESC";
				$("#ten-orders span:eq(0)").addClass("on").siblings().removeClass("on");
				getTenMajotList(0);
			}
		});
		$(".map-box span").on("click",function(){  //地图切换
			$(this).addClass("on").siblings().removeClass("on");
			var ind = $(this).index() + 1;
			if(ind == 3){ getMap3();}
			else { getYcMap(ind);}
		})
		project(); //项目申报
		getYcMap(1); //宜春地图
		getselectYear();
		getIndustryList(1);
		getTenMajotList(1);
		getEconomic(); //经济指标
		getElectric(); //工业投资
		getInvest(1); //工业投资
		getChartData(); //企业统计
		getHelping(); //精准帮扶
	});
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>2014;i--){
	    	$('#thirdTab00 #eight-ul1').append('<li>'+i+'</li>');
	    	$('#thirdTab01 #ten-ul1').append('<li>'+i+'</li>');
	    	//$('#investUl1').append('<li>'+i+'</li>');
	    	$('#helpUl1').append('<li>'+i+'</li>');
	    	$('#elecUl1').append('<li>'+i+'</li>');
	    	$('#econUl1').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='eight-ul1'){
				$('#eight-font1').text($(this).text());
	 			$('#eight-year').val($(this).text());
	 			getIndustryList(0);
			}else if($(this).parent().attr('id')=='eight-ul2'){
	  			$('#eight-font2').text($(this).text());
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'))
				$('#eight-month').val(month);
	 			getIndustryList(0);
			}else if($(this).parent().attr('id')=='ten-ul1'){
				$('#ten-font1').text($(this).text());
	 			$('#ten-year').val($(this).text());
	 			getTenMajotList(0);
			}else if($(this).parent().attr('id')=='ten-ul2'){
				$('#ten-font2').text($(this).text());
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'))
				$('#ten-month').val(month);
	 			getTenMajotList(0);
			}else if($(this).parent().attr('id')=='helpUl1'){
 				$('#helpYear').val($(this).text());
 				getHelping(); //精准帮扶
			}else if($(this).parent().attr('id')=='helpUl2'){
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'));
				$('#helpMonth').val(month);
 				getHelping(); //精准帮扶
			}else if($(this).parent().attr('id')=='investUl1'){
 				$('#investYear').val($(this).text());
 				getInvest(); //工业投资
			}else if($(this).parent().attr('id')=='investUl2'){
 				$('#investQuarter').val($(this).attr("data"));
 				getInvest(); //工业投资
			}else if($(this).parent().attr('id')=='elecUl1'){
 				$('#elecYear').val($(this).text());
 				getElectric(); //工业用电
			}else if($(this).parent().attr('id')=='elecUl2'){
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'));
				$('#elecMonth').val(month);
				getElectric(); //工业用电
			}else if($(this).parent().attr('id')=='econUl1'){
 				$('#econYear').val($(this).text());
 				getEconomic(); //经济指标
			}else if($(this).parent().attr('id')=='econUl2'){
 				$('#econQuarter').val($(this).attr("data"));
				getEconomic(); //经济指标
			}
		})
	}
	function getChartData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/officeCompanyStatistics/data",
			type : "post",
		 	async: false,
			data : {
				"industryTypeId": '',
				"countyId": ''
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					var left = result.value.value0;
					var div1 = '',div2 = '';
					var d1 = [
						{ name: '企业总数', value: left.total},
						{ name: '规上企业', value: left.vgs},
						{ name: '产品数量', value: left.vcp}
					];
					for (var i = 0; i < d1.length; i++){
						div1 += '<span>';
						div1 += '<img src="${ctx}/static/image/cityDataCenter/ycNew/statistic.png">';
						div1 += '<div class="stac-infor">';
						div1 += '<p><b>'+d1[i].value+'</b>个</p>';
						div1 += '<p>'+d1[i].name+'</p>';
						div1 += '</div>';
						div1 += '</span>';
					};
					$("#statistic").html(div1);
					var d2 = [
						{ name: '重点企业', value: left.vzd},
						{ name: '龙头企业', value: left.vlt},
						{ name: '上市企业', value: left.vss},
						{ name: '两化融合', value: left.vlh},
						{ name: '专精特新', value: left.vzt},
						{ name: '高新企业', value: left.vgq}
					];
					for (var j = 0; j < d2.length; j++){
						var l = (d2[j].value/left.total).toFixed(2)*100 + '%' ;
						div2 += '<div class="count-item">';
						div2 += '<font>'+d2[j].name+'</font>';
						div2 += '<span><div style="width: '+l+';"></div></span>';
						div2 += '<b>'+d2[j].value+'</b>';
						div2 += '</div>';
					};
					$("#countList").html(div2);
				}
			},
			error : function(e) {
				alert(e)
			}
		});
	};
	function getEconomic(type){
		var y = $('#econYear').val() == '' ? undefined : $('#econYear').val();
		var q = $('#econQuarter').val() == '' ? undefined : $('#econQuarter').val();
		var param = {
			"year" : y,
			"quarter" : q,
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/economicData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					$('#econYear').val(result.year);
		 			$('#econFont').text(result.year);
					$('#econQuarter').val(result.quarter);
					var n = Number(result.quarter)-1;
					$('#econFont2').text($("#econUl2 li:eq("+n+")").text());
					var ind = result.quarter - 1;
					if(result.economic.gyzjz.gyzjz_percent_yc && result.economic.gyzjz.gyzjz_percent_yc[ind]){
						$("#ec1").text(result.economic.gyzjz.gyzjz_percent_yc[ind]).next().show();
						$("#ec2").text(((result.economic.zyywsr.zyywsr_value_yc[ind])/10000).toFixed(2)).next().show();
						$("#ec3").text(((result.economic.lr.lr_value_yc[ind])/10000).toFixed(2)).next().show();
					}
					else {
						$("#ec1").text('未公布').next().hide();
						$("#ec2").text('未公布').next().hide();
						$("#ec3").text('未公布').next().hide();
					}
					var d1 = result.economic.gyzjz.gyzjz_percent_jx;
					var d2 = result.economic.gyzjz.gyzjz_percent_yc;
					var m = Math.floor(Math.min.apply(null, d1.concat(d2)));  //取数据中的最小值
					economic(d1,d2,m);
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	};
	function getElectric(type){
		var y = $('#elecYear').val() == '' ? undefined : $('#elecYear').val();
		var m = $('#elecMonth').val() == '' ? undefined : $('#elecMonth').val();
		var param = {
			"year" : y,
			"month" : m,
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/electricData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					if(!type){
						$('#elecYear').val(result.year);
			 			$('#elecFont').text(result.year);
						$('#elecMonth').val(result.month);
						$('#elecFont2').text(result.month+'月');
					}
					$("#e1").text(result.electric.total.value);
					$("#e2").text(result.electric.total.percent);
					$("#e3").text(result.electric.total.order);
					$("#e4").text(result.electric.manufacturing.value);
					$("#e5").text(result.electric.manufacturing.percent);
					$("#e6").text(result.electric.manufacturing.order);
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	function getYcMap(type){
	    var data = [ 
			{name : '袁州区', value : "360902"}, 
			{name : '奉新县', value : "360921"}, 
			{name : '万载县', value : "360922"}, 
			{name : '上高县', value : "360923"}, 
			{name : '宜丰县', value : "360924"}, 
			{name : '靖安县', value : "360925"}, 
			{name : '铜鼓县', value : "360926"}, 
			{name : '丰城市', value : "360981"}, 
			{name : '樟树市', value : "360982"}, 
			{name : '高安市', value : "360983"} 
		]
	    if(type == 2){
	    	data = [ 
				{name : '丰城高新技术产业园区', value : '1226'}, 
				{name : '宜丰工业园区', value : '1229'}, 
				{name : '铜鼓工业园区', value : '1285'}, 
				{name : '宜春经济技术开发区', value : '1224'}, 
				{name : '樟树工业园区', value : '1225'}, 
				{name : '靖安工业园区', value : '1227'}, 
				{name : '万载工业园', value : '1230'}, 
				{name : '宜春袁州工业园区', value : '1284'}, 
				{name : '奉新工业园区', value : '1047'}, 
				{name : '上高工业园区', value : '1113'},
				{name : '高安高新技术产业园区', value : '1228'}
			]
	    }
		var param = {
    		type: type
	    }
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/economicMapData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					var list = result.economic;
					$("#mapTime").text(result.year+'年 '+result.month+'月');
					for(var i = 0; i < data.length; i++){
						for(var j = 0; j < list.length; j++){
							if(data[i].value == list[j].orgId){
								list[j].name = data[i].name;
							}
						}
					}
					$.get('${ctx}/static/map/360900.json', function (chinaJson) {
					    echarts.registerMap('yichun', chinaJson);
						ycMap(param.type,list);
					});
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	};
	function getMap3() {
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/officeCompanyStatisticsDetails/companyTotal",
			type : "post",
		 	async: false,
			data : {},
			dataType : "json",
			success : function(result){
				if(result.success){
					var list = result.list;
					var y = new Date().getFullYear();
					var m = new Date().getMonth() + 1;
					$("#mapTime").text(y+'年 '+m+'月');
					for(var j = 0; j < list.length; j++){
						list[j].name = list[j].SPACENAME;
						for(var i = 0; i < yc3.length; i++){
							if(list[j].SPACEID == yc3[i].name){
								yc3[i].value[2] = list[j].TOTAL;
							}
						}
					}
					$.get('${ctx}/static/map/360900.json', function (chinaJson) {
					    echarts.registerMap('yichun', chinaJson);
						ycMap(3,list);
					});
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	function getInvest(type){
		var y = $('#investYear').val() == '' ? undefined : $('#investYear').val();
		var q = $('#investQuarter').val() == '' ? undefined : $('#investQuarter').val();
		var param = {
			"year" : y,
			"quarter" : q
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getIndInvData/ycsBigData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					$('#investYear').val(result.value.year);
		 			$('#investFont').text(result.value.year);
					$('#investQuarter').val(result.value.quarter);
					var n = Number(result.value.quarter)-1;
					$('#investFont2').text($("#investUl2 li:eq("+n+")").text());
					$("#c1").text(result.value.count1);
					$("#c2").text(result.value.count2);
					$("#c3").text(result.value.count3);
					$("#c4").text(result.value.count4);
					$("#c5").text(result.value.count5);
					$("#c6").text(result.value.count6);
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	function getHelping(){
		var y = $('#helpYear').val() == '' ? undefined : $('#helpYear').val();
		var q = $('#helpMonth').val() == '' ? undefined : $('#helpMonth').val();
		var param = {
			"realType" : 0,  //假数据为0，真数据为1
			"year" : y,
			"month" : q
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/companyAppeal/dataStatistics",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					if(param.realType != 0){
						$('#helpYear').val(result.year);
			 			$('#helpFont').text(result.year);
						$('#helpMonth').val(result.quarter);
						$('#helpFont2').text(result.month+'月');
					}
		 			$('#t1').text(result.total1);
		 			$('#t2').text(result.total2);

					var x = [],y1 = [],y2 = [];
					for(var key in result.map1){
						x.push(key);
						y1.push(result.map1[key]);
					}
					for(var key in result.map2){
						y2.push(result.map2[key]);
					}
					helping(x,y1,y2);
				}
			},
			error : function() {
					//layerTips("校验权限异常");
			}
		});
	};
	function getIndustryList(type){
		$('#industry-list1').empty();
		var param = {
				"areaId": $('#orgId').val()=='3609009'?'360900':"360900",
				"yearCaliber": $('#eight-year').val(),
				"monthCaliber": $('#eight-month').val(),
				"orderby": orderby1,
				"isNewData": type==1?1:0,
		}
		$.ajax({
	 		url : "${OfficeUrl}XOffice/interface/json/pkInTpInOpMnAcLog/dataCenterList",
			type : "post",
			data : {
				"areaId": $('#orgId').val()=='3609009'?'360900':"360900",
				"yearCaliber": $('#eight-year').val(),
				"monthCaliber": $('#eight-month').val(),
				"orderby": orderby1,
				"isNewData": type==1?1:0,
	 	},
			dataType : "json",
			success : function(result) {
				if(result.success){
					if(type==1){
						$('#eight-year').val(result.yearCaliber);
						$('#eight-month').val(result.monthCaliber);
						$('#eight-font1').text(result.yearCaliber);
						$('#eight-font2').text(result.monthCaliber+'月');
					}
					var list = result.value;
					if(list.length>0){
						for (var i=0;i<list.length;i++){
							var info = list[i];
							var index = i+1;
						    var _div = "";
						    if(i==0){
							    _div += '<div class="industry-item">'
						    }else{
							    _div += '<div class="industry-item">'
						    }
						    _div += '<span>'+index+'</span>'
						    _div +=	'<font>'+info.TYPE_NAME+'</font>'
						    _div +=	'<img class="lineImg" src="${ctx}/static/image/cityDataCenter/ycNew/icons_16.png">'
							    if(orderby1=='ZYYWSR_VALUE DESC'){
					    	    	if(info.ZYYWSR_VALUE){
					    	    		  var ZYYWSR_VALUE = info.ZYYWSR_VALUE/10000;
									    _div +=	'<font class="yellowT"><b>'+(ZYYWSR_VALUE!=undefined?ZYYWSR_VALUE.toFixed(2):'0')+'</b>亿元</font>'
					    	    	}else{
										 _div +='<font class="yellowT"><b>未公布</b></font>'
					    	    	}
							    }else if(orderby1=='GYZJZ_PERCENT DESC'){
							    	if(info.GYZJZ_PERCENT){
									    _div +=	'<font class="yellowT"><b>'+(info.GYZJZ_PERCENT?info.GYZJZ_PERCENT:'0')+'</b>%</font>'
							    	}else{
									    _div +=	'<font class="yellowT"><b>未公布</b></font>'
							    	}
							    }else{
							    	 if(info.LR_VALUE){
							    		 var LR_VALUE = info.LR_VALUE/10000;
										  _div +='<font class="yellowT"><b>'+(LR_VALUE!=undefined?LR_VALUE.toFixed(2):'0')+'</b>亿元</font>'
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
	}
	function getTenMajotList(type){
		$('#industry-list2').empty();
		var date = "";
		if( $('#ten-year').val()!=''&&$('#ten-month').val()!==''){
			 date  = $('#ten-year').val()+'-'+$('#ten-month').val();
		}
		$.ajax({
	  		url : "${OfficeUrl}XOffice/interface/json/dataIndustryBaseLog/dataCenterList",
			type : "post", 
			data : {
				"date": date,
				"orderby": orderby2,
	 		},
			dataType : "json",
			success : function(result) {
				if(result.success){
					if(type==1){
						$('#ten-year').val(result.yearCaliber);
						$('#ten-month').val(result.monthCaliber);
						$('#ten-font1').text(result.yearCaliber);
						$('#ten-font2').text(result.monthCaliber+'月');
					}
					var list = result.value;
					if(list.length>0){
			 			for (var i=0;i<list.length;i++){
							var info = list[i];
							var index = i+1;
						    var _div = "";
							_div += '<div class="industry-item">'
						    _div += '<span>'+index+'</span>'
						    _div +=	'<font>'+info.BASE_NAME+'</font>'
						    _div +=	'<img class="lineImg" src="${ctx}/static/image/cityDataCenter/ycNew/icons_16.png">'
							    if(orderby2=='ZYYWSR_VALUE DESC'){
					    	    	if(info.ZYYWSR_VALUE){
					    	    		  var ZYYWSR_VALUE = info.ZYYWSR_VALUE/10000;
									    _div +=	'<font class="yellowT"><b>'+(ZYYWSR_VALUE!=undefined?ZYYWSR_VALUE.toFixed(2):'0')+'</b>亿元</font>'
					    	    	}else{
										 _div +='<font class="yellowT"><b>未公布</b></font>'
					    	    	}
							    }else if(orderby2=='GYZJZ_PERCENT DESC'){
							    	if(info.GYZJZ_PERCENT){
									    _div +=	'<font class="yellowT"><b>'+(info.GYZJZ_PERCENT?info.GYZJZ_PERCENT:'0')+'</b>%</font>'
							    	}else{
									    _div +=	'<font class="yellowT"><b>未公布</b></font>'
							    	}
							    }else{
							    	 if(info.LR_VALUE){
							    		 var LR_VALUE = info.LR_VALUE/10000;
										  _div +='<font class="yellowT"><b>'+(LR_VALUE!=undefined?LR_VALUE.toFixed(2):'0')+'</b>亿元</font>'
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
	function goLd(){
		window.open('${ctx}/front/ldDataCenter/index/1','_blank');
	}
	function goSeven(){
		goPage("${ctx}/front/cityDataCenter/ycFourth/7?orgId=3609009"+'&spanIndex='+$("#spanIndex").val());
	}
	function goTen(){
		goPage("${ctx}/front/cityDataCenter/ycFourth/8?orgId=3609009"+'&spanIndex='+$("#spanIndex").val());
	}
	function goElectric(){
		goPage("${ctx}/front/cityDataCenter/ycFourth/3?orgId=3609009");
	}
	function goEconomic(){
		goPage("${ctx}/front/cityDataCenter/ycFourth/2?orgId=3609009");
	}
</script>
</html>
