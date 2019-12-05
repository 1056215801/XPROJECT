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
<link href="${ctx}/static/css/cityDataCenter/site.css" rel="stylesheet">
<title>宜春工业大数据经济运行指标</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content p15 fz0">
		<input type="hidden" id="orgId" value="${orgId}" name="orgId">
		<input type="hidden" id="areaOd" value="0" name="areaOd">
		<input type="hidden" id="areaYear" value="" name="areaYear">
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
		<div class="eco-row">
			<div class="eco-floor">
				<div class="boxStyleBg" style="padding: 15px 20px;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="tab-links">
						<span class="on" onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/4?orgId=3609009")'>各区县年度任务进度</span>
						<div class="fr selects" >
							<div class="select">
								<p><font id="areaFont">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="areaUl"></ul>
								</div>
							</div>
						</div>
					</div>
					<div  class="tabs">
						<div class="tab">
							<div class="orders" id="areaOrder">
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
							<div class="count-list area-list target-list" id="areaList" onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/4?orgId=3609009")'>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="eco-floor">
				<div class="boxStyleBg" style="padding: 15px 20px;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="tab-links">
						<span class="on" onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/5?orgId=3609009")'>各园区年度任务进度</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="parkFont">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="parkUl"></ul>
								</div>
							</div>
						</div>
					</div>
					<div  class="tabs">
						<div class="tab">
							<div class="orders" id="parkOrder">
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
							<div class="count-list area-list park-list" id="parkList" onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/5?orgId=3609009")'>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="eco-row eco-row2">
			<div class="boxStyleBg pr" style="padding: 15px 20px;">
				<div class="left-top-radius"></div>
				<div class="left-bottom-radius"></div>
				<div class="right-top-radius"></div>
				<div class="right-bottom-radius"></div>
				<div class="top-line"></div>
				<div class="bottom-line"></div>
				<div class="left-line"></div>
				<div class="right-line"></div>
				<div class="price-num">
					<span onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/2?orgId=3609009")'>
						<div class="middle-box">
							<p>工业增加值同比</p>
							<h1 class="orangeT decimalFT">
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
						</div>
					</span>
					<span onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/2?orgId=3609009")'>
						<div class="middle-box">
							<p>主营业务收入</p>
							<h1 class="bgT"><font class="bigProjectDataNum" id="zzywsr"></font><small>亿元</small></h1>
						</div>
					</span>
					<span onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/2?orgId=3609009")'>
						<div class="middle-box">
							<p>利润总额</p>
							<h1 class="lgT"><font class="bigProjectDataNum" id="lrze"></font><small>亿元</small></h1>
						</div>
					</span>
					<span onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/3?orgId=3609009")'>
						<div class="middle-box price-num1">
							<p>工业用电总量</p>
							<h1 class="lgT"><font class="bigProjectDataNum" id="gyyd"></font><small>万 kwh</small></h1>
						</div>
					</span>
				</div>
				<div class="yc-map" id="ycEconMap"></div>
				<div class="map-areas econmic-map-areas">
					<span style="cursor: pointer;">
						<h4>宜春市</h4>
					</span>
					<span>
						<h4>宜春市</h4>
					</span>
				</div>
				<div class="electric-title"onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/14?orgId=3609009")'>
					<span class="bgT electric-title-span">重点监测企业：今日累计用电<b class="orangeT" id="ljyd"></b>万 kwh</span>
				</div>
				<div class="electric-chart" id="electricTab0">
					<div class="chart3" id="electricChart"></div>
					<div class="electric-infor" onclick='goPage("${ctx}/front/cityDataCenter/ycIndex/14?orgId=3609009")'>
						<p id="today">今日最大负荷（<b class="bgT" id="tTime">11:15</b>）</p>
						<h3 class="bgT" id="jrfh"><font id="jrfh1"></font>.<font id="jrfh2"></font> <small>万 kw</small></h3>
						<p id="yesterday">昨日最大负荷（<b class="drT" id="yTime">11:15</b>）</p>
						<h3 class="drT" id="zrfh"><font id="zrfh1"></font>.<font id="zrfh2"></font> <small>万 kw</small></h3>
					</div>
				</div>
				<div class="electric-chart" id="electricTab1">
					<p>暂未录入数据</p>
				</div>
			</div>
		</div>
		<div class="eco-row">
			<div class="eco-floor eco-floor-second">
				<div class="boxStyleBg">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="tab-links">
						<span class="on" onclick="goSeven()">八大产业</span>
						<div class="fr selects" >
							<div class="select">
								<p><font id="eightFont1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="eightUl1">
									</ul>
								</div>
							</div>
							<div class="select">
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
						</div>
					</div>
					<div  class="tabs">
						<div class="tab">
							<div class="orders" id="eightOrder">
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
							<div class="industry-list" id="industry-list1" onclick="goSeven()"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="eco-floor">
				<div class="boxStyleBg" style="padding: 15px 20px;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="tab-links">
						<span class="on" onclick="goTen()">十大基地</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="tenFont1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="tenUl1">
									</ul>
								</div>
							</div>
							<div class="select">
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
					<div  class="tabs">
						<div class="tab">
							<div class="orders" id="tenOrder">
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
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head>a:eq(1)").addClass("on");
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		});
		$(".map-areas span:eq(0)").on("click",function(){
			$(this).next().removeClass("on");
			$("#orgId").val('360900');
			getEconomic();
			getElectric();
			getAllElectric();
		});
		$(".orders span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			if($(this).parent().attr("id") == 'areaOrder') {
				$("#areaOd").val(ind);
				getProcess(0);
			} else if($(this).parent().attr("id") == 'parkOrder') {
				$("#parkOd").val(ind);
				getProcess(1);
			} else if($(this).parent().attr("id") == 'eightOrder') {
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
		getselectYear();
		getProcess(0);//区县任务进度
		getProcess(1);//园区任务进度
		getYcMap(1); //宜春地图
		getEconomic(); //经济指标
		getElectric(); //用电
		getAllElectric(); //用电
		getIndustryList(1); //八大基地
		getTenMajotList(1); //十大产业
	});
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>2014;i--){
	    	$('#areaUl').append('<li>'+i+'</li>');
	    	$('#parkUl').append('<li>'+i+'</li>');
	    	$('#eightUl1').append('<li>'+i+'</li>');
	    	$('#tenUl1').append('<li>'+i+'</li>');
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
				$('#areaYear').val($(this).text());
	 			$('#areaFont').text($(this).text());
				getProcess(0);
			}else if($(this).parent().attr('id')=='parkUl'){
				$('#parkYear').val($(this).text());
	 			$('#parkFont').text($(this).text());
				getProcess(1);
			}
		})
	}
	//任务进度
	function getProcess(type){
		var id = type == 0 ? 'area' : 'park';
		var param = {
			"year" : $('#'+id+'Year').val()==''?undefined:$('#'+id+'Year').val(),
			"areaType": type,
			"dataType": $('#'+id+'Od').val(),
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
		 			if(result.list.length > 0){
			 			for(var i=0;i<result.list.length;i++){
			 				var info = result.list[i];
			 				var v = param.dataType == 0 ? info.zyywsrComplete : info.lrComplete;
			 				var name = param.dataType == 0 ? info.zyywsrValue : info.lrValue;
			 				var w = v ? v : '0';
			 				var n = name ? name : '0.00';
			 				if(w != '0'){
				 				if(param.areaType == 0) {
					 				div += '<div class="count-item">';
					 				div += '<font>'+info.organizationName+'</font>';
					 				div += '<span style="width: calc(100% - 180px);">';
					 				div += '<div style="width: '+w+'%;"></div>';
					 				div += '</span><b>'+n+'<i>亿元</i></b></div>';
				 				} else {
					 				div += '<div class="count-item">';
					 				div += '<b>'+(i+1)+'</b>';
					 				div += '<div class="dib"><font>'+info.organizationName+'</font><span>';
					 				div += '<div style="width: '+w+'%;"></div>';
					 				div += '</span></div></div>';
				 				}
			 				}
			 			}
		 			} else {
		 				div += '<p style="padding: 100px;text-align:center;font-size:18px;color:#fff;">暂无数据</p>';
		 			}
		 			$('#'+id+'List').html(div);
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
			"orgId" : $('#orgId').val()=='3609009'?'360900':$('#orgId').val()
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/economicData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				console.log(result)
				if(result.success){
					var ind = result.quarter - 1;
					if(result.economic.gyzjz_percent){
						$("#gyzjz1").removeClass("fz16").siblings().show();
						$("#zzywsr").removeClass("fz16").next().show();
						$("#lrze").removeClass("fz16").next().show();
						var gy = result.economic.gyzjz_percent.toString();
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
					      	deVal: parseInt(result.economic.zyywsr_value/10000),
					      	digit: parseInt(result.economic.zyywsr_value/10000).toString().length
					    });
						$("#lrze").rollNum({
					      	deVal: parseInt(result.economic.lr_value/10000),
					      	digit: parseInt(result.economic.lr_value/10000).toString().length
					    });
					} else {
						$("#gyzjz1").text('未公布').addClass("fz16").siblings().hide();
						$("#zzywsr").text('未公布').addClass("fz16").next().hide();
						$("#lrze").text('未公布').addClass("fz16").next().hide();
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	};
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
						//设置折线图显示时段
						end = Math.ceil((result.chartData.today.length/result.chartData.xAxis.length)*100) + 1;
						end = end > 100 ? 100 : end < 13 ? 13 : end;
						start = end - 13;
						
						if(result.maxData.today){
							var t1 = result.maxData.today.split(".")[0];
							var t2 = result.maxData.today.split(".")[1];
							$("#jrfh1").rollNum({
						      	deVal: t1,
						      	digit: t1.length
						    });
							$("#jrfh2").rollNum({
						      	deVal: t2,
						      	digit: t2.length
						    });
							$("#tTime").text(result.maxData.todayTime);
						} else { 
							$("#jrfh1").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
							$("#jrfh2").rollNum({
						      	deVal: 0,
						      	digit: 1
						    });
							$("#tTime").text('00:00');
						}
						if(result.maxData.yesterday){
							var y1 = result.maxData.yesterday.split(".")[0];
							var y2 = result.maxData.yesterday.split(".")[1];
							$("#zrfh1").rollNum({
						      	deVal: y1,
						      	digit: y1.length
						    });
							$("#zrfh2").rollNum({
						      	deVal: y2,
						      	digit: y2.length
						    });
							$("#yTime").text(result.maxData.yesterdayTime);
						} else { 
							$("#zrfh1").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
							$("#zrfh2").rollNum({
						      	deVal: 0,
						      	digit: 1
						    });
							$("#yTime").text('00:00');
						}
						$("#ljyd").rollNum({
					      	deVal: result.maxData.powTo.split(".")[0],
					      	digit: result.maxData.powTo.split(".")[0].length
					    });
						elecData = result.chartData;
						elecLine(result.chartData,1);
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
			"month": 3,
			"year": 2019
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/cityDataCenter/yc/electricData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
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
						    var _div = "";
						    if(i==0){
							    _div += '<div class="industry-item">'
						    }else{
							    _div += '<div class="industry-item">'
						    }
						    _div += '<span>'+index+'</span>'
						    _div +=	'<font>'+info.TYPE_NAME+'</font>'
						    _div +=	'<img class="lineImg" src="${ctx}/static/image/cityDataCenter/ycNew/icons_16.png">'
							    if(param.orderby=='ZYYWSR_VALUE DESC'){
					    	    	if(info.ZYYWSR_VALUE){
					    	    		  var ZYYWSR_VALUE = info.ZYYWSR_VALUE/10000;
									    _div +=	'<font class="yellowT"><b>'+(ZYYWSR_VALUE!=undefined?ZYYWSR_VALUE.toFixed(2):'0')+'</b>亿元</font>'
					    	    	}else{
										 _div +='<font class="yellowT"><b>未公布</b></font>'
					    	    	}
							    }else if(param.orderby=='GYZJZ_PERCENT DESC'){
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
						    var _div = "";
							_div += '<div class="industry-item">'
						    _div += '<span>'+index+'</span>'
						    _div +=	'<font>'+info.BASE_NAME+'</font>'
						    _div +=	'<img class="lineImg" src="${ctx}/static/image/cityDataCenter/ycNew/icons_16.png">'
							    if(param.orderby=='ZYYWSR_VALUE DESC'){
					    	    	if(info.ZYYWSR_VALUE){
					    	    		  var ZYYWSR_VALUE = info.ZYYWSR_VALUE/10000;
									    _div +=	'<font class="yellowT"><b>'+(ZYYWSR_VALUE!=undefined?ZYYWSR_VALUE.toFixed(2):'0')+'</b>亿元</font>'
					    	    	}else{
										 _div +='<font class="yellowT"><b>未公布</b></font>'
					    	    	}
							    }else if(param.orderby=='GYZJZ_PERCENT DESC'){
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
		goPage("${ctx}/front/cityDataCenter/ycIndex/7?orgId=3609009"+'&spanIndex='+$("#eightOt").val());
	}
	function goTen(){
		goPage("${ctx}/front/cityDataCenter/ycIndex/8?orgId=3609009"+'&spanIndex='+$("#tenOt").val());
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
