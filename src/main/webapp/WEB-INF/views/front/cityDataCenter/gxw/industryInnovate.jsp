<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit"/>
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<title>江西省工业大数据产业创新</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360000">
		<!-- <input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value=""> -->
		<input type="hidden" id="region" name="region" value="江西省">
	</form>
	<%@ include file="header.jsp"%>
	<div class="content2 p15 fz0">
		<div class="spanStyle" style="width: 30%;">
			<div class="blockStyle" style="height: 60%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">工业增加值 - 同比增长</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="selectYear">2018</font><i class="fa fa-caret-down"></i></p>
								<!-- <div class="select-items">
									<ul id="sy"></ul>
								</div> -->
							</div>
						</div>
					</div>
					<div class="tabContBar hc60">
						<div id="growthRateChart" style="height: 100%;"></div>
					</div>
					<div class="tabCaptionBar">
						<span class="tabCaption">工业增加值 - 工业比重</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="">2018</font><i class="fa fa-caret-down"></i></p>
								<!-- <div class="select-items">
									<ul id=""></ul>
								</div> -->
							</div>
						</div>
					</div>
					<div class="tabContBar hc40">
						<div class="proportionBar">
							<div class="proportion">
								<img src="${ctx}/static/image/cityDataCenter/jxNew/gapcircle-orange.png">
								<div class="proportionInfo">
									<h1 class="yellowT">16.9%</h1>
									<p><span>1.8</span> <img src="${ctx}/static/image/cityDataCenter/jxNew/small-red-up.png" width="7"></p>
								</div>
								<div class="proportionName">战略性新兴产业</div>
							</div>
							<div class="proportion">
								<img src="${ctx}/static/image/cityDataCenter/jxNew/gapcircle-orange.png">
								<div class="proportionInfo">
									<h1 class="yellowT">33.4%</h1>
									<p><span>2.2</span> <img src="${ctx}/static/image/cityDataCenter/jxNew/small-red-up.png" width="7"></p>
								</div>
								<div class="proportionName">高新技术产业</div>
							</div>
							<div class="proportion">
								<img src="${ctx}/static/image/cityDataCenter/jxNew/gapcircle-orange.png">
								<div class="proportionInfo">
									<h1 class="yellowT">25.8%</h1>
									<p><span>0.7</span> <img src="${ctx}/static/image/cityDataCenter/jxNew/small-red-up.png" width="7"></p>
								</div>
								<div class="proportionName">装备制造业增加值</div>
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
					<div class="tabCaptionBar">
						<span class="tabCaption">智能制造试点示范</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="">2018</font><i class="fa fa-caret-down"></i></p>
								<!-- <div class="select-items">
									<ul id=""></ul>
								</div> -->
							</div>
						</div>
					</div>
					<div class="tabContBar">
						<div class="orders" id="sdsf">
							<span id="gjjxm" class="on">国家级项目(3个)</span>
							<span id="sjxm">省级项目(40个)</span>
							<span id="sjjd">省级基地(4个)</span>
						</div>
						<div class="tabCont cpjg-table respondControl" id="">
							<!-- <div class="table-head">
								<span class="w10"></span>
							</div> -->
							<div class="table-body">
								<table id="demonstrateTable"></table>
								<font class="unData" style="display: none;">暂无数据</font>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(40% - 10px);">
			<div class="blockStyle" style="height: 65%;">
				<div class="dataBrandBar">
					<div class="dataBrand">
						<div class="dataBrandName">产业创新服务综合体(个)</div>
						<div class="dataBrandValue" id="serviceSynthesis"></div>
					</div>
					<div class="dataBrand">
						<div class="dataBrandName">重点工业产业集群(个)</div>
						<div class="dataBrandValue" id="industryColony"></div>
					</div>
					<div class="dataBrand">
						<div class="dataBrandName">战略性新兴产业聚集区(个)</div>
						<div class="dataBrandValue" id="industryGather"></div>
					</div>
					<!-- <div class="dataBrand" style="margin-top: 30px;">
						<div class="dataBrandName">企业技术中心(个)</div>
						<div class="dataBrandValue" id="technologyCenter"></div>
					</div>
					<div class="dataBrand">
						<div class="dataBrandName">新产品(个)</div>
						<div class="dataBrandValue" id="newProduct"></div>
					</div> -->
				</div>
				<div id="map" style="width: 80%; height: 100%;"></div>
				<div class="map-areas" style="top: 40px;left: 20px;">
					<span style="cursor: pointer;">
						<h4>江西省</h4>
					</span>
					<span>
						<h4>江西省</h4>
					</span>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(35% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">创新成果</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="">2018</font><i class="fa fa-caret-down"></i></p>
								<!-- <div class="select-items">
									<ul id=""></ul>
								</div> -->
							</div>
						</div>
					</div>
					<div class="tabContBar">
						<div class="orders" id="cxcg">
							<span id="gbx" class="on">国家级标准化与新模式应用(4个)</span>
							<span id="scc">省重点产业创新项目(15个)</span>
						</div>
						<div class="tabCont cpjg-table respondControl" id="">
							<!-- <div class="table-head">
								<span class="w10"></span>
							</div> -->
							<div class="table-body">
								<table id="resultTable"></table>
								<font class="unData" style="display: none;">暂无数据</font>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(30% - 10px);">
			<div class="blockStyle" style="height: 45%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">智能制造推进</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="">2018</font><i class="fa fa-caret-down"></i></p>
								<!-- <div class="select-items">
									<ul id=""></ul>
								</div> -->
							</div>
						</div>
					</div>
					<div class="advanceListBar">
						<div class="swiper-container loop-swiper" id="swiper" style="display:block;height: 100%;">
							<div class="swiper-wrapper" id="swiperChirld">
								<div class="swiper-slide">
									<a target="_blank" href="javascript:;">
										<div class="advanceList">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/yyznzb.png">
											<div class="advanceContBar">
												<div class="advanceCont">
													<div class="advanceContName">应用智能装备(套)</div>
													<div class="advanceContValue">10572</div>
												</div>
												<div class="advanceCont">
													<div class="advanceContName">同比去年新增(套)</div>
													<div class="advanceContValue">3947</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="swiper-slide">
									<a target="_blank" href="javascript:;">
										<div class="advanceList">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/szhcj.png">
											<div class="advanceContBar">
												<div class="advanceCont">
													<div class="advanceContName">数字化车间+智能工厂(个)</div>
													<div class="advanceContValue">749</div>
												</div>
												<div class="advanceCont">
													<div class="advanceContName">同比去年新增(个)</div>
													<div class="advanceContValue">268</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(55% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">传统产业优化升级（1+8）</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="">2018</font><i class="fa fa-caret-down"></i></p>
								<!-- <div class="select-items">
									<ul id=""></ul>
								</div> -->
							</div>
						</div>
					</div>
					<div class="tabContBar">
						<div class="tabCont cpjg-table talign_c respondControl" id="">
							<div class="table-head">
								<span class="w10">序号</span>
								<span class="w30">试点类别</span>
								<span class="w30">申报单位</span>
								<span class="w30">试点产业</span>
							</div>
							<div class="table-body">
								<table id="upgradeTable"></table>
								<font class="unData" style="display: none;">暂无数据</font>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head>a:eq(3)").addClass("on");
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		});
		$(".map-areas span:eq(0)").on("click",function(){
			$(this).next().removeClass("on");
			$("#orgId").val('360000');
			getMapData();
		});
		$(".orders span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			if($(this).parent().attr("id") == 'sdsf') {
				getsdsfData();
			} else if($(this).parent().attr("id") == 'cxcg') {
				getcxcgData();
			} else {}
		});
		
		var swiper = new Swiper('#swiper', {
			autoplay:true,
			slidesPerView :2,
		    slidesPerGroup : 1,
		    spaceBetween : 10,
		    observer:true,
		    autoPlay:true,
		});
		
		getselectYear();
		getJxMap();
		getMapData();
		getgrowthRateData();
		getUpgradeTable();
		getsdsfData();
		getcxcgData();
	});
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>y-4;i--){
	    	//$('#sy').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			/* if($(this).parent().attr('id')=='sy'){
				
			} */
		})
	}
	//工业增加值-同比增长数据
	function getgrowthRateData(){
		var div_ = document.getElementById("growthRateChart");
		div_.removeAttribute("_echarts_instance_");
		var growthRateChart = echarts.init(div_);
		//var growthRateChart = echarts.init(document.getElementById("growthRateChart"));
		growthRateChart.setOption(growthRateOption);
	}
	//智能制造试点示范数据
	function getsdsfData(){
		$.ajax({
			url : '${ctx}/static/json/demonstrate.json',
			type : "get",
			data : {},
			dataType : "json",
			success : function(result) {
				console.log(result)
				if(result.success){
					var listData = "";
					if($("#gjjxm").hasClass("on")){
						listData = result.countryList;
					}else if($("#sjxm").hasClass("on")){
						listData = result.provinceList;
					}else if($("#sjjd").hasClass("on")){
						listData = result.proBaseList;
					}else{}
					
					$("#demonstrateTable").empty();
					if(listData != "" && listData != undefined){
						var _div = "";
						for(var i=0 ; i<listData.length ; i++){
							var info = listData[i];
							_div += "	<tr>";
							_div += "		<td class=\"\"><span class=\"yellowPoint\"></span><span class=\"dataLimit\">"+info.content+"</span></td>";
							_div += "	</tr>";
						}
						$("#demonstrateTable").append(_div);
						if($("#demonstrateTable").height() > $("#demonstrateTable").parent().height()){
							$("#demonstrateTable").append(_div);
							$("#demonstrateTable").addClass('roll');
							console.log(listData.length)
							$("#demonstrateTable").css("animation-duration",listData.length*4+"s");
						}else{
							$("#demonstrateTable").removeClass('roll');
						}
						$("#demonstrateTable").next().hide();
					}else{
						$("#demonstrateTable").next().show();
					}
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error : function() {
				layer.msg("系统异常，请联系管理员！");
			}
		});
	}
	//创新成果数据
	function getcxcgData(){
		$.ajax({
			url : '${ctx}/static/json/innovationResult.json',
			type : "get",
			data : {},
			dataType : "json",
			success : function(result) {
				console.log(result)
				if(result.success){
					var listData = "";
					if($("#gbx").hasClass("on")){
						listData = result.countryList;
					}else if($("#scc").hasClass("on")){
						listData = result.provinceList;
					}else{}
					
					$("#resultTable").empty();
					if(listData != "" && listData != undefined){
						var _div = "";
						for(var i=0 ; i<listData.length ; i++){
							var info = listData[i];
							_div += "	<tr>";
							_div += "		<td class=\"\"><span class=\"yellowPoint\"></span><span class=\"dataLimit\">"+info.content+"</span></td>";
							_div += "	</tr>";
						}
						$("#resultTable").append(_div);
						if($("#resultTable").height() > $("#resultTable").parent().height()){
							$("#resultTable").append(_div);
							$("#resultTable").addClass('roll');
							$("#resultTable").css("animation-duration",listData.length*4+"s");
						}else{
							$("#resultTable").removeClass('roll');
						}
						$("#resultTable").next().hide();
					}else{
						$("#resultTable").next().show();
					}
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error : function() {
				layer.msg("系统异常，请联系管理员！");
			}
		});
	}
	//传统产业优化升级数据
	function getUpgradeTable(){
		$.ajax({
			url : '${ctx}/static/json/upgradeTable.json',
			type : "get",
			data : {},
			dataType : "json",
			success : function(result) {
				console.log(result)
				if(result.success){
					$("#upgradeTable").empty();
					if(result.list != "" && result.list != undefined){
						var _div = "";
						for(var i=0 ; i<result.list.length ; i++){
							var info = result.list[i];
							_div += "	<tr>";
							_div += "		<td class=\"w10\">"+info.index+"</td>";
							_div += "		<td class=\"w30\">"+info.type+"</td>";
							_div += "		<td class=\"w30\">"+info.company+"</td>";
							_div += "		<td class=\"w30\">"+info.industry+"</td>";
							_div += "	</tr>";
						}
						$("#upgradeTable").append(_div);
						/* if($("#upgradeTable").height() > $("#upgradeTable").parent().height()){
							$("#upgradeTable").append(_div);
							$("#upgradeTable").addClass('roll');
						}; */
						$("#upgradeTable").next().hide();
					}else{
						$("#upgradeTable").next().show();
					}
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error : function() {
				layer.msg("系统异常，请联系管理员！");
			}
		});
	}
	//获取省市数据个数
	function getMapData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getProIndInnViewData",
			type : "post",
		 	data : {
				"orgId" : $('#orgId').val()
			},
			dataType : "json",
			success : function(result){
				console.log(result)
				if(result.success){
					$("#serviceSynthesis").empty();
					if(result.data != undefined && result.data.serviceNum != "" && result.data.serviceNum != undefined){
						$("#serviceSynthesis").rollNum({
					    	deVal: result.data.serviceNum,
					    	digit: result.data.serviceNum.toString().length
					    });
					}else{
						$("#serviceSynthesis").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
					$("#industryColony").empty();
					if(result.data != undefined && result.data.indCNum != "" && result.data.indCNum != undefined){
						$("#industryColony").rollNum({
					    	deVal: result.data.indCNum,
					    	digit: result.data.indCNum.toString().length
					    });
					}else{
						$("#industryColony").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
					$("#industryGather").empty();
					if(result.data != undefined && result.data.indCAreaNum != "" && result.data.indCAreaNum != undefined){
						$("#industryGather").rollNum({
					    	deVal: result.data.indCAreaNum,
					    	digit: result.data.indCAreaNum.toString().length
					    });
					}else{
						$("#industryGather").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
					$("#technologyCenter").empty();
					if(result.data != undefined && result.data.companyTecNum != "" && result.data.companyTecNum != undefined){
						$("#technologyCenter").rollNum({
					    	deVal: result.data.companyTecNum,
					    	digit: result.data.companyTecNum.toString().length
					    });
					}else{
						$("#technologyCenter").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
					$("#newProduct").empty();
					if(result.data != undefined && result.data.newProductNum != "" && result.data.newProductNum != undefined){
						$("#newProduct").rollNum({
					    	deVal: result.data.newProductNum,
					    	digit: result.data.newProductNum.toString().length
					    });
					}else{
						$("#newProduct").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	//江西省地图
	function getJxMap(){
	    var data = [ 
			{name: "南昌市", value: "360100"},
			{name: "景德镇市", value: "360200"},
			{name: "萍乡市", value: "360300"},
			{name: "九江市", value: "360400"},
			{name: "新余市", value: "360500"},
			{name: "鹰潭市", value: "360600"},
			{name: "赣州市", value: "360700"},
			{name: "吉安市", value: "360800"},
			{name: "宜春市", value: "360900"},
			{name: "抚州市", value: "361000"},
			{name: "上饶市", value: "361100"}
		]
		$.get('${ctx}/static/map/360000.json', function (chinaJson) {
		    echarts.registerMap('jx', chinaJson);
		    mapChart(data);
		});
	}
	function mapChart(d1) {
		var myChart = echarts.init(document.getElementById('map'));
	    var fz = 12;
	    var sz = 10;
	    var ss = 45;
	    if(width <= 1440){
	    	fz = 12;
	    	sz = 6;
	        ss = 40;
	    }
	    if(width <= 1366){
	    	fz = 10;
	        ss = 35;
	    }
	    var option = {
	   		tooltip : {
	   			trigger : 'item',
	   			formatter : '{b}'
	   		},
	        geo : {
	        	map : 'jx',
                zoom : 1.2,
                aspectScale : 1,
	            label : {
	            	show : false
	            },
	            itemStyle: {
	            	borderColor: '#272798',
                    borderWidth: 1,
                    areaColor: '#323EED'
	            },
                emphasis: {
                	itemStyle: {
                        areaColor: '#389BB7'
                    },
                    label : { show : false }
                },
	            selectedMode: 'single'
			},
			series : [{
				type : 'map',
	   			geoIndex : 0,
	   			data : d1
			},{
	            type: 'effectScatter',
	            coordinateSystem: 'geo',
	            data: jx,
	            symbolSize: sz,
	            showEffectOn: 'render',
	            rippleEffect: {
	                period: 4,
	                scale: 4,
	                brushType: 'fill'
	            },
	            hoverAnimation: true,
	            label: {
	            	normal : {
                        show : true,
                        textStyle : {
                            color : '#fff',
                            fontSize: 14
                        },
                        formatter : function(a){
                            return a.name;
                        },
                        offset: [0, 15]
                    }
	            },
	            itemStyle: {
	                normal: {
	                	color : '#0de6e6',
                        shadowBlur : 10,
                        shadowColor : '#333'
	                },
	            },
	            zlevel: 1
	        }]
	    }
	    myChart.setOption(option);
	    myChart.on('click', function(param){
	    	if(param.seriesIndex == 0){//点击区块
	    		//地图左上区域栏控制
	    		if($("#orgId").val() == param.data.value){
					$("#orgId").val('360000');
					$(".map-areas span:eq(1)").removeClass("on");
				} else { 
					$("#orgId").val(param.data.value);
					$(".map-areas span:eq(1)").addClass("on").find("h4").text(param.data.name);
				}
	    		
	    		//实现重复点击，切换回初始
	    		var cityName = param.name;
	    		if(cityName == $("#region").text()){
		    		$("#region").text("江西省");
		    		$('#orgId').val("360000");
		    		getMapData();
		    	}else{
		            $("#region").text(cityName);
		            $('#orgId').val(param.value);
		            getMapData();
		    	}
	    	}else if(param.seriesIndex == 1){//点击坐标点
	    		$('#orgId').val(param.name);
	    		getMapData();
	    	}else{}
	    })
	};
	
	
	//工业增加值-同比增长配置
	var growthRateOption = {
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
			data: ['同比增长'],
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
			data: ['战略性新兴产业','高新技术产业','装备制造业增加值'],
			splitLine: { //显示分割线 
				show: false
			},
			axisLabel: {
				color: '#83ADBA'
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
				formatter: '{value}%',
				color: '#83ADBA'
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
			name: '同比增长',
			type: 'bar',
			barMaxWidth:'50',
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
			data: [11.5,11.9,15.4]
		}],
	};
</script>
</html>