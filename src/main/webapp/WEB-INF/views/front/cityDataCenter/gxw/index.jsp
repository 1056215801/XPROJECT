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
<title>江西省工业大数据首页</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content p15 fz0">
		<input type="hidden" id="orgId" value="360000" name="orgId">
		<input type="hidden" id="areaId" value="" name="areaId">
		<input type="hidden" id="spaceId" value="" name="spaceId">
		<input type="hidden" id="spaceName" value="" name="spaceName">
		<input type="hidden" id="mapType" value="" name="mapType">
		<input type="hidden" id="mapKind" value="0" name="mapKind">
		<input type="hidden" id="areaYear" value="" name="areaYear">
		<input type="hidden" id="parkYear" value="" name="parkYear">
		<input type="hidden" id="eightYear" value="" name="eightYear">
		<div class="main-eco">
			<div class='jjzb-item dib' onclick='location.href="${ctx}/front/cityDataCenter/gxwIndex/1"'>
				<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
				<div class="jjzb-num">
					<p>工业增加值增速</p>
					<div class="jjzb-b">
						<span><font id="gyzjz1">9</font>.<font id="gyzjz2">12</font>%</span>
						<img src="${ctx}/static/image/cityDataCenter/jxNew/small-red-up.png">
					</div>
				</div>
			</div>
			<div class='jjzb-item dib' onclick='location.href="${ctx}/front/cityDataCenter/gxwIndex/1"'>
				<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
				<div class="jjzb-num">
					<p>主营业务收入（万元）</p>
					<div class="jjzb-b">
						<span><font id="zyywsr1">9</font>.<font id="zyywsr2">12</font></span>
						<img src="${ctx}/static/image/cityDataCenter/jxNew/small-red-up.png">
					</div>
				</div>
			</div>
			<div class='jjzb-item dib' onclick='location.href="${ctx}/front/cityDataCenter/gxwIndex/1"'>
				<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
				<div class="jjzb-num">
					<p>利润总额（万元）</p>
					<div class="jjzb-b">
						<span><font id="lrze1">9</font>.<font id="lrze2">12</font></span>
						<img src="${ctx}/static/image/cityDataCenter/jxNew/small-red-up.png">
					</div>
				</div>
			</div>
			<div class='jjzb-item dib' onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/14")'>
				<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
				<div class="jjzb-num">
					<p>工业用电（亿KWh）</p>
					<div class="jjzb-b">
						<span><font id="gyyd1">9</font>.<font id="gyyd2">12</font></span>
						<img src="${ctx}/static/image/cityDataCenter/jxNew/small-red-up.png">
					</div>
				</div>
			</div>
			<div class='jjzb-item dib' onclick='location.href="${ctx}/front/cityDataCenter/gxwIndex/9"'>
				<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
				<div class="jjzb-num">
					<p>规模以上工业企业（家）</p>
					<div class="jjzb-b">
						<span><font id="gsqy">9</font></span>
					</div>
				</div>
			</div>
		</div>
		<div class="index-content">
			<div class="eco-row">
				<div class="eco-floor h40">
					<div class="boxStyleBg bd1">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div class="tab-title">
							<span class="on" onclick='location.href="${ctx}/front/cityDataCenter/gxwIndex/12"'>工业投资</span>
							<div class="fr selects" >
								<div class="select">
									<p><font id="areaFont">2018</font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul id="areaUl"></ul>
									</div>
								</div>
							</div>
						</div>
						<div class="tabs tab1">
							<div class="tab">
								<div class="main-gytz">
									<div class="gytz-total">
										<font>投资总额：</font>
										<font class="bigProjectDataNum" id="tzze">20285</font>
										<font class="blueT">亿元</font>
									</div>
									<div class="gytz-circle">
										<div class="circle-item">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/ring-orange.png">
											<div class="circle-middle">
												<h3 id="gytz1">2839</h3>
												<p class="blueT">项</p>
											</div>
											<p>亿元以上项目</p>
										</div>
										<div class="circle-item">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/ring-orange.png">
											<div class="circle-middle">
												<h3 id="gytz2">2839</h3>
												<p class="blueT">亿元</p>
											</div>
											<p>投资完成额</p>
										</div>
										<div class="circle-item">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/ring-orange.png">
											<div class="circle-middle">
												<h3 id="gytz3">2839</h3>
												<p class="blueT">%</p>
											</div>
											<p>增长</p>
										</div>
										<div class="circle-item">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/ring-orange.png">
											<div class="circle-middle">
												<h3 id="gytz4">2839</h3>
												<p class="blueT">&nbsp;</p>
											</div>
											<p>全国排名</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="eco-floor h60">
					<div class="boxStyleBg bd1">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div class="tab-title">
							<span class="on" onclick='location.href="${ctx}/front/cityDataCenter/gxwIndex/20"'>绿色发展</span>
							<div class="fr selects">
								<div class="select">
									<p><font id="parkFont">2018</font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul id="parkUl"></ul>
									</div>
								</div>
							</div>
						</div>
						<div  class="tabs tab1">
							<div class="tab">
								<div class="lsfz">
									<div class="gytz-total">
										<div class="lsfz-chart" id="chart0"></div>
										<img class="dib" src="${ctx}/static/image/cityDataCenter/jxNew/green-down.png">
									</div>
									<div class="lsfz-list">
										<div class="lsfz-item">
											<img class="dib" src="${ctx}/static/image/cityDataCenter/jxNew/lsyq.png">
											<div class="dib">
												<p><font class="blueT">[国]</font>绿色示范园区</p>
												<h3><font id="lsfz1" class="yellowT">1</font>个</h3>
											</div>
										</div>
										<div class="lsfz-item">
											<img class="dib" src="${ctx}/static/image/cityDataCenter/jxNew/lssf.png">
											<div class="dib">
												<p><font class="blueT">[国]</font>绿色示范企业</p>
												<h3><font id="lsfz2" class="yellowT">1</font>户</h3>
											</div>
										</div>
										<div class="lsfz-item">
											<img class="dib" src="${ctx}/static/image/cityDataCenter/jxNew/zdjnjg.png">
											<div class="dib">
												<p>重点节能技改项目</p>
												<h3><font id="lsfz3" class="yellowT">1</font>个</h3>
											</div>
										</div>
										<div class="lsfz-item">
											<img class="dib" src="${ctx}/static/image/cityDataCenter/jxNew/zdjc.png">
											<div class="dib">
												<p><font class="blueT">[国]</font>重大节能监察企业</p>
												<h3><font id="lsfz4" class="yellowT">1</font>户</h3>
											</div>
										</div>
										<div class="lsfz-item">
											<img class="dib" src="${ctx}/static/image/cityDataCenter/jxNew/ghn.png">
											<div class="dib">
												<p>高耗能企业专项监察</p>
												<h3><font id="lsfz5" class="yellowT">1</font>户</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="eco-row eco-row2">
				<div class="boxStyleBg pr">
					<div class="jx-map">
						<div class="main-tabs">
							<span class="on"><font>开发区</font></span>
							<span><font>重点企业</font></span>
							<span><font>产业集群</font></span>
						</div>
						<div class="jxMap" id="ycEconMap"></div>
						<div class="jxMap bd-map" id="planeMap"></div>
						<div class="company-search">
							<div class="search-box">
								<input type="text" placeholder="请输入企业名称" id="companyName" value="">
								<button onclick="getCompanyInfo(1)">搜索</button>
							</div>
							<div class="scroll-box">
								<div class="search-companys" id="companys">
									<!-- <div class="search-item">公司1</div> -->
								</div>
							</div>
						</div>
						<div class="map-items">
							<span class="on" data="">全部</span>
							<span data="100">过百亿</span>
							<span data="300">过300亿</span>
							<span data="500">过500亿</span>
							<span data="1000">过千亿</span>
						</div>
						<div class="map-areas jx-areas">
							<span>
								<h4>江西省</h4>
							</span>
							<span>
								<h4>宜春市</h4>
							</span>
							<span>
								<h4>宜春市</h4>
							</span>
						</div>
						<div class="jx-total">
							<b id="mapTotal">104</b>个
						</div>
					</div>
				</div>
			</div>
			<div class="eco-row">
				<div class="eco-floor h65">
					<div class="boxStyleBg bd1">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div class="tab-title">
							<span class="on" onclick='location.href="${ctx}/front/cityDataCenter/gxwIndex/19"'>产业创新</span>
							<div class="fr selects" >
								<div class="select">
									<p><font id="eightFont1">2018</font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul id="eightUl1">
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div  class="tabs tab1">
							<div class="tab">
								<div class="yc-map">
									<div class="cpcx-chart" id="chart1"></div>
									<div class="count-list park-list cpcx-list" id="cycxList1">
									</div>
								</div>
								<div class="yc-map" id="cycxList2">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="eco-floor h35">
					<div class="boxStyleBg bd1">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div class="tab-title">
							<span class="on" onclick='location.href="${ctx}/front/cityDataCenter/gxwIndex/16"'>企业服务</span>
						</div>
						<div  class="tabs tab1">
							<div class="tab" id="qyfwList">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="industry-box" id="layer">
			<div class="lay-title" id="industry0">产业集群1</div>
			<div class="lay-content">
				<div class="dib full-w">
					<span class="lay-label">所属行业</span>
					<span class="lay-text" id="industry1">呵呵哒</span>
				</div>
				<div class="dib">
					<span class="lay-label">上年度从业人员</span>
					<span class="lay-text" id="industry2">呵呵哒</span>
				</div>
				<div class="dib">
					<span class="lay-label">上年度投产企业个数</span>
					<span class="lay-text" id="industry3">呵呵哒</span>
				</div>
				<div class="dib">
					<span class="lay-label">上年度主营业务收入</span>
					<span class="lay-text" id="industry4">呵呵哒</span>
				</div>
				<div class="dib">
					<span class="lay-label">同比增长</span>
					<span class="lay-text redT" id="industry5">呵呵哒</span>
				</div>
				<div class="dib">
					<span class="lay-label">上年度利税</span>
					<span class="lay-text" id="industry6">呵呵哒</span>
				</div>
				<div class="dib">
					<span class="lay-label">同比增长</span>
					<span class="lay-text redT" id="industry7">呵呵哒</span>
				</div>
				<div class="dib full-w">
					<span class="lay-label">文字描述</span>
					<span class="lay-text" id="industry8">呵呵哒</span>
				</div>
			</div>
		</div>
	</div>
	<div id="mouseLayer" class="mouseLayer">
		<img class="layerImg" src="${ctx}/static/image/cityDataCenter/jxNew/close.png" onclick="closeMouseLayer()">
		<div id="mouseLayerList"></div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-liquidfill.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>

<link href="${ctx}/static/plugins/leaflet/leaflet.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/static/plugins/Leaflet.markercluster/MarkerCluster.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/plugins/Leaflet.markercluster/MarkerCluster.Default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/static/plugins/leaflet/leaflet.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/Leaflet.markercluster/leaflet.markercluster.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/leaflet/proj4/proj4.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/leaflet/proj4leaflet/proj4leaflet.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/leaflet/LayerData.js"></script>

<script type="text/javascript" src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
var map; //实例化一个地图对象
var markerClusterGroup;
var myIcon = L.icon({
	iconUrl : '${ctx}/static/image/cityDataCenter/jxNew/icon01-16.png',
	iconSize : [ 16, 16 ]
});
	$(function(){
		$(".head>a:eq(0)").addClass("on");
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		});
		$(".map-areas span:eq(0)").on("click",function(){
			$(this).next().removeClass("on");
			$("#planeMap").hide();
			$(".company-search").hide();
			$("#companyName").val('');
			$("#areaId").val('');
			getMapData(); //宜春地图
		});
		$(".map-areas span:eq(1)").on("click",function(){
			$(this).next().removeClass("on");
			$("#planeMap").hide();
			$("#companyName").val('');
			$(".company-search").hide();
		});
		$(".map-items span").on("click",function(){  //地图切换
			$(this).addClass("on").siblings().removeClass("on");
			$("#mapType").val($(this).attr("data"));
			getMapData(); //宜春地图
		});
		$(".main-tabs span").on("click",function(){  //地图切换
			$(".map-areas span:eq(2)").removeClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			$("#planeMap").hide();
			$(".company-search").hide();
			$("#companyName").val('');
			$("#mapKind").val($(this).index());
			getMapData(); //宜春地图
		});
		getEconomic(); //经济指标
		getAllElectric(); //累计用电
		getChartData(); //规上企业
		getInvest(1); //工业投资
		getGreen(1); //绿色发展
		getCreate(1); //产业创新
		getServece(); //企业服务
		getMapData(); //宜春地图
		
	});
	function mapInit(id,name){
		if($("#planeMap").hasClass("leaflet-container")){
			
		}else { //初始化
			var initPoint = L.latLng(28.385984, 117.507963);
			map = initMap(planeMap);
			map.setView(initPoint, 12);
			markerClusterGroup = L.markerClusterGroup();
			markerClusterGroup.addTo(map);
		}
		$("#spaceId").val(name);
		$("#spaceName").val(id);
		getCompanyInfo(0);
	}
	//年份筛选
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>y-4;i--){
	    	$('#helpUl1').append('<li>'+i+'</li>');
	    	$('#elecUl1').append('<li>'+i+'</li>');
	    	$('#econUl1').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='eightUl1'){
				$('#eightFont').text($(this).text());
	 			$('#eightYear').val($(this).text());
			}
		})
	}
	//经济指标
	function getEconomic(){
		var param = {
			orgId : $('#orgId').val()
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/economicData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					var gy = result.economic.gyzjz_percent.toString();
					var sr = parseInt(result.economic.zyywsr_value/10000).toString();
					var lr = parseInt(result.economic.lr_value/10000).toString();
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
					$("#zyywsr1").rollNum({
				      	deVal: sr.split('.')[0],
				      	digit: sr.split('.')[0].length
				    });
					if(gy.split('.')[1]){
						$("#zyywsr2").rollNum({
					      	deVal: sr.split('.')[1],
					      	digit: sr.split('.')[1].length
					    });
					} else {
						$("#zyywsr2").rollNum({
					      	deVal: 0,
					      	digit: 1
					    });
					}
					$("#lrze1").rollNum({
				      	deVal: lr.split('.')[0],
				      	digit: lr.split('.')[0].length
				    });
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
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	};
	//累计用电
	function getAllElectric(){
		var param = { "orgId" : $('#orgId').val()}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/electricData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					if(JSON.stringify(result.electric) != '{}'){
						var t = (Number(result.electric.total.value)/10000).toFixed(2).toString();
						$("#gyyd1").rollNum({
					      	deVal: t.split(".")[0],
					      	digit: t.split(".")[0].length
					    });
						$("#gyyd2").rollNum({
					      	deVal: t.split(".")[1],
					      	digit: t.split(".")[1].length
					    });
					} else {
						$("#gyyd1").rollNum({
					      	deVal: 0,
					      	digit: 1
					    });
						$("#gyyd2").rollNum({
					      	deVal: 0,
					      	digit: 1
					    });
					}
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	//规上企业
	function getChartData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/officeCompanyStatistics/data",
			type : "post",
		 	async: false,
			data : {
				"industryTypeId": '',
				"countyId": '360000',
				"orgType":1
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					var left = result.value.value0;
					$("#gsqy").rollNum({
				      	deVal: left.vgs,
				      	digit: left.vgs.length
				    });
				}
			},
			error : function(e) {
				alert(e)
			}
		});
	};
	//工业投资
	function getInvest(type){
		var param = { "orgId" : $('#orgId').val()}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getProIndInvData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
		 			if(type == 1){
						$('#areaYear').val(result.data.year);
			 			$('#areaFont').text(result.data.year);
		 			}
					$("#tzze").rollNum({
				      	deVal: result.data.total,
				      	digit: result.data.total.length
				    });
					$("#gytz1").text(result.data.BMPNum);
					$("#gytz2").text(result.data.invComp);
					$("#gytz3").text(result.data.grandPer);
					$("#gytz4").text(result.data.orderNum);
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	//绿色发展
	function getGreen(type){
		var param = { "orgId" : $('#orgId').val()}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getProGreenDevData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
		 			if(type == 1){
						$('#parkYear').val(result.data.year);
			 			$('#parkFont').text(result.data.year);
		 			}
					$("#lsfz1").text(result.data.greenParkNum);
					$("#lsfz2").text(result.data.greenCompanyNum);
					$("#lsfz3").text(result.data.zdjgProNum);
					$("#lsfz4").text(result.data.zdjnjcCompanyNum);
					$("#lsfz5").text(result.data.ghnjcCompanyNum);
		 			chart0(result.data.unitEnergyCon);
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	//江西地图
    var mapData = [];
    function getMapData(){
    	$("#mouseLayer").hide();
    	var kind = $("#mapKind").val();
   		var param = {
			"provinceId": $('#orgId').val(),
			"areaId": $('#areaId').val(),
			"zyywsrValue": $('#mapType').val(),
			"level": 2
		}
   		var url = ''
    	if(kind == 0){
    		url = '${OfficeUrl}XWeixin/interface/json/parkInfo/count'
    	} else if(kind == 1){
    		url = '${OfficeUrl}XWeixin/interface/json/companyInfo/count'
    	} else {
    		url = '${OfficeUrl}XWeixin/interface/json/industryClusterInfo/count'
    	}
		$.ajax({
			url : url,
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					mapData = [];
					$("#mapTotal").text(result.total);
		 			for(var i=0;i<result.list.length;i++){
						var info = result.list[i];
						var data = {};
						if(info.spaceId && info.spaceId != '-1') {
							data.name = info.spaceId;
						} else { data.name = info.areaId;}
				    	if(kind == 0){
   							data.parkName = info.parkName;
   							data.parkId = info.parkId;
				    	} else if(kind == 1){
   							data.parkName = info.companyName;
   							data.parkId = info.companyId;
				    	} else {
   							data.parkName = info.clusterName;
   							data.parkId = info.clusterId;
				    	}
						data.value = info.countNum;
						data.cName = areaInfoMap[data.name];
						mapData[i] = data;
		 			}
					mapData = convertData(mapData);
					var id = $('#areaId').val() == '' ? '360000' : $('#areaId').val();
		 			$.get('${ctx}/static/map/'+id+'.json', function (chinaJson) {
		 			    echarts.registerMap('yc', chinaJson);
		 			   	yc2dMap(id);
		 			});
				}
			}
		})
    }
    //地图重新定位
	function reDirection(la,lo) {
    	if(!isNull(la) && !isNull(lo)){
    		var point = new L.latLng(la,lo);
    		map.flyTo(point, 16);
    	} else {
			layer.msg('该企业未录入经纬度！');
		}
    }
    //地图企业列表
	function getCompanyInfo(type) {
    	var param = {
			"spaceName" : $("#spaceName").val(),
			"spaceId" : $("#spaceId").val(),
			"companyName": $("#companyName").val(),
			"areaId" : $("#areaId").val(),
			"typeId" : '',
			"level":2
    	}
		$.ajax({
			url : "${OfficeUrl}XWeixin/interface/json/companyInfo/list",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				console.log(param,result)
				if (result.success) {
					var list = result.list;
					var lastPoint = '';
					var div = '';
					//清除所有聚合(指向清除markers时，必须放在清空marker数组数据之前)
					markerClusterGroup.clearLayers();
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						if (!isNull(info.addressLongitude) && !isNull(info.addressLatitude)) {//企业是否有经纬度信息
							showCompanyLocation(info.companyId,nvlStr(info.companyName),info.addressLongitude,info.addressLatitude);
							lastPoint = new L.latLng(info.addressLatitude,info.addressLongitude);
						}
						if($("#companyName").val() != ''){
							div += '<div class="search-item" onclick="reDirection(\''+info.addressLatitude+'\',\''+info.addressLongitude+'\')">'+info.companyName+'</div>'
						}
					}
					$("#companys").html(div);
					if(type == 0){//判断是否跳转坐标，0为跳转，1为不跳转
						if (lastPoint != '') {
							map.flyTo(lastPoint, 16);
						} else {
							layer.msg('暂无已录入经纬度的企业！');
						}
					}
				}else{
					layer.msg("系统异常，请联系管理员！");
				}
			},
			error : function() {
				layer.msg("系统异常，请联系管理员！");
			}
		});
	}
	function showCompanyLocation(id, companyName, longitude, latitude) {
		if (longitude != '' && latitude != '') {
			var point = new L.latLng(latitude, longitude);

			var marker = new L.marker(point, {
				icon : myIcon
			});//创建标注    
			
			marker.bindTooltip(companyName, {
				permanent : true,
				interactive : true,
				direction : 'top',
				offset : L.point(0, -5)
			});
			marker.addTo(markerClusterGroup);
			marker.on({
				click : function(e) {
					window.open("${ctx}/front/cityDataCenter/gxwIndex/22?companyId="+id);
					if(isLogin == 1){
					} else {
						
					}
				}
			});
		}
	}
    //这里是生成series的数据，将经纬度和value值映射起来
    var convertData = function(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = jxMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name : data[i].name,
                    value : geoCoord.concat(data[i].value).concat(data[i].cName).concat(data[i].parkName).concat(data[i].parkId)
                });
            }
        }
        return res;
    };
	//产业集群
    function getIndustry(id){
		var param = { "clusterId" : id}
		$.ajax({
			url : "${OfficeUrl}XWeixin/interface/json/industryClusterInfo/detail",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					var d = result.value;
					var d1 = d.clusterIndicatorYearLogBean;
					$("#industry0").text(d.clusterName);
					$("#industry1").text(nvlStr2(d.typeName));
					!isNull(d1.pjcyryValue) ? $("#industry2").text(d1.pjcyryValue + '人') : $("#industry2").text('暂无');
					!isNull(d1.tcqyValue) ? $("#industry3").text(d1.tcqyValue + '家') : $("#industry3").text('暂无');
					!isNull(d1.zyywsrValue) ? $("#industry4").text(d1.zyywsrValue + ' 亿元') : $("#industry4").text('暂无');
					!isNull(d1.zyywsrPercent) ? $("#industry5").text(d1.zyywsrPercent + '%') : $("#industry5").text('暂无');
					!isNull(d1.lsValue) ? $("#industry6").text(d1.lsValue + ' 亿元') : $("#industry6").text('暂无');
					!isNull(d1.lsPercent) ? $("#industry7").text(d1.lsPercent + '%') : $("#industry7").text('暂无');
					$("#industry8").text(nvlStr2(d.clusterDescription));
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
    }
	//产业创新
	function getCreate(type){
		var param = { "orgId" : $('#orgId').val()}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getProIndInnData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
		 			if(type == 1){
						$('#eightYear').val(result.data.year);
			 			$('#eightFont').text(result.data.year);
		 			}
		 			chart1(result.data.devIndex);
		 			var div1 = '';
		 			for(var i=0;i<result.data.indList.length;i++){
		 				var info = result.data.indList[i];
		 				div1 += '<div class="count-item">';
		 				div1 += '<div class="dib"><font>'+info.indName+'</font><span>';
		 				div1 += '<div style="width: '+info.indPer+'%;"></div>';
		 				div1 += '</span></div>';
		 				div1 += '<b class="count-price">'+info.indPer+'<small>%</small></b>';
	 					div1 += '</div>';
		 			}
		 			var div2 = '';
		 			for(var j=0;j<result.data.indViewList.length;j++){
		 				var info2 = result.data.indViewList[j];
		 				div2 += '<div class="lsfz-item cpcx-item">';
		 				div2 += '<div class="dib">';
		 				div2 += '<p><font class="blueT">'+info2.indfalg+'</font>'+info2.indName+'</p>';
		 				div2 += '<h3><font class="yellowT">'+info2.indPer+'</font>'+info2.indUnit+'</h3>';
	 					div2 += '</div></div>';
		 			}
					$('#cycxList1').html(div1);
					$('#cycxList2').html(div2);
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	//企业服务
	function getServece(){
		var param = { "orgId" : $('#orgId').val()}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getProCompSerData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
		 			var div1 = '';
		 			for(var i=0;i<result.data.list.length;i++){
		 				var info = result.data.list[i];
		 				var img = i == 1 || i == 4 ? 'orange' : 'blue';
		 				div1 += '<div class="qyfw-item">';
		 				div1 += '<img src="/XProject/static/image/cityDataCenter/jxNew/semicircle-'+img+'.png">';
		 				div1 += '<h3>'+info.serviceTotal+'</h3>';
		 				div1 += '<p>'+info.serviceName+'('+info.serviceUnit+')</p>';
	 					div1 += '</div>';
		 			}
					$('#qyfwList').html(div1);
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	//水球
	function chart0(d1){
		var chart = echarts.init(document.getElementById('chart0'));
	    var fz2 = 16;
	    if(width <= 1600){
	    	fz2 = 14;
	    }
		var option = {
				title: {
					text: '单位增加值能耗:',
					textStyle: { fontSize: fz2,color: '#fff'},
					top: 'center'
				},
			    series: [{
			        type: 'liquidFill',
			        data: [{
			        	value: 0.5,
			        	name: '增加值',
			        	phase: Math.PI,
			        	val: d1
			        }, 0.5],
			        color: [{
	            		type: 'linear',
	            	    x: 0,
	            	    y: 0,
	            	    x2: 0,
	            	    y2: 1,
	            	    colorStops: [{
	            	        offset: 0, color: '#0539AA' // 0% 处的颜色
	            	    }, {
	            	        offset: 1, color: '#3DABFF' // 100% 处的颜色
	            	    }],
	            	    globalCoord: false // 缺省为 false
		            },{
	            		type: 'linear',
	            	    x: 0,
	            	    y: 0,
	            	    x2: 0,
	            	    y2: 1,
	            	    colorStops: [{
	            	        offset: 0, color: '#3DABFF' // 0% 处的颜色
	            	    }, {
	            	        offset: 1, color: '#0539AA' // 100% 处的颜色
	            	    }],
	            	    globalCoord: false // 缺省为 false
		            }], //颜色
			        center: ['50%','50%'], //位置
			        outline: {  //边框
			            show: true,
			            borderDistance: 5,
			            itemStyle: {
			                color: '#051442',
			                borderColor: '#044CDE',
			                borderWidth: 3
			            }
			        },
			        phase: 0,
			        period: 3000,
			        waveLength: '100%',
			        animationDurationUpdate: 2000,
			        radius: '85%', //半径
			        backgroundStyle: {
			            color: '#051442'
			        },
			        label: {
			            color: '#f1c851',
			            insideColor: '#f1c851',
			            fontSize: 26,
		            	formatter: function(params){
		            		return params.data.val + "%";
		            	}
			        }
			    }]
			};
		chart.setOption(option);
	}
	//仪表盘
	function chart1(d1){
		var chart = echarts.init(document.getElementById('chart1'));
		var option = {
			    color: ["#3A8FFF", "#FFB73A", "#FF342E"],
			    series: [{
			        type: 'gauge',
			        detail: {
			            formatter: '{value}',
			            fontSize: 30,
			            color: '#FFE42D',
			            fontFamily: 'DIN-Medium'
			        },
			        radius: '90%',
					title: {
						fontSize: 14,
						color: '#fff',
						offsetCenter : [0, '90%']
					},
					pointer: {
						length: '60%',
						width: 4
					},
			        axisLine: {
			            show: true,
			            lineStyle: {
			                width: 12,
			                shadowBlur: 0,
			                color: [
			                    [0.2, '#3A8FFF'],
			                    [0.8, '#FFB73A'],
			                    [1, '#FF342E']
			                ]
			            }
			        },
			        axisTick: {
			        	show: false
			        },
			        splitLine: {
			        	length: 12,
			        	lineStyle: { opacity: .6}
			        },
			        axisLabel: { color: '#3A8FFF'},
			        data: [{
			            value: d1,
			            name: '两化融合发展指数',
			        }]

			    }]
			};
		chart.setOption(option);
	}
	
	function getMousePos() {
		var e = window.event || arguments.callee.caller.arguments[0];
		if(e.event != "" && e.event != undefined){//arguments.callee.caller.arguments[0]
			return {'x':e.event.event.clientX,'y':e.event.event.clientY}
		}else{
			return {'x':e.clientX,'y':e.clientY}
		}
	}
	function getParkPointList(areaId,spaceId){
		$.ajax({
			url : "${OfficeUrl}XWeixin/interface/json/parkInfo/list",
			type : "post",
			async: false,
			data : {
				"provinceId":"360000",
				"areaId":areaId,
				"spaceId":spaceId,
				"pageNum":1,
				"pageSize":10,
				"level":2
			},
			dataType : "json",
			success : function(result){
				console.log(result)
				if(result.success){
					$("#mouseLayerList").empty();
					for(var i=0;i<result.list.length;i++){
						var info = result.list[i];
						if(info.parkId != "" && info.parkId != undefined){
							var _div = "";
								_div += "<div class=\"listDetail\" onclick=\"openParkListDetail("+info.parkId+")\">"
								_div += "	<div>"+info.parkName+"</div>"
								_div += "</div>"
							$("#mouseLayerList").append(_div);
						}
					}
				}
			},
			error : function(e) {
				console.log("失败")
			}
		});
	}
	function openParkListDetail(parkId){
		window.open("${ctx}/front/cityDataCenter/gxwIndex/7?parkId="+parkId)
	}
	function getIndustryPointList(areaId,spaceId){
		$.ajax({
			url : "${OfficeUrl}XWeixin/interface/json/industryClusterInfo/list",
			type : "post",
			async: false,
			data : {
				"provinceId":"360000",
				"areaId":areaId,
				"spaceId":spaceId,
				"pageNum":1,
				"pageSize":10,
			},
			dataType : "json",
			success : function(result){
				console.log(result)
				if(result.success){
					$("#mouseLayerList").empty();
					for(var i=0;i<result.list.length;i++){
						var info = result.list[i];
						if(info.clusterId != "" && info.clusterId != undefined){
							var _div = "";
								_div += "<div class=\"listDetail\" onclick=\"openIndustryListDetail("+info.clusterId+")\">"
								_div += "	<div>"+info.clusterName+"</div>"
								_div += "</div>"
							$("#mouseLayerList").append(_div);
						}
					}
				}
			},
			error : function(e) {
				console.log("失败")
			}
		});
	}
	function openIndustryListDetail(clusterId){
		getIndustry(clusterId)
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  area: ['500px', '400px'],
			  skin: 'layui-layer-nobg', //没有背景色
			  shadeClose: true,
			  content: $('#layer')
		});
	}
	function closeMouseLayer(){
		$("#mouseLayer").hide();
	}
</script>
</html>
