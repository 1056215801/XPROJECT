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
<title>江西省智慧工业大数据经济运行指标</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content p15 fz0">
		<input type="hidden" id="orgId" value="360000" name="orgId">
		<input type="hidden" id="areaOd" value="1" name="areaOd">
		<input type="hidden" id="areaYear" value="" name="areaYear">
		<input type="hidden" id="parkOd" value="0" name="parkOd">
		<input type="hidden" id="parkYear" value="" name="parkYear">
		<input type="hidden" id="eightYear" value="2017" name="eightYear">
		<input type="hidden" id="eightOd" value="0" name="eightOd">
		<div class="eco-row">
			<div class="eco-floor h60">
				<div class="boxStyleBg bd1">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tab-title">
						<span class="on" onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/5")'>各地市(园区总和)排行榜</span>
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
							<div class="orders orders2" id="areaOrder">
								<span class="on">主营业务收入</span>
								<span>利润</span>
								<span>从业人员</span>
							</div>
							<div class="count-list" id="areaList" onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/5")'>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="eco-floor h40">
				<div class="boxStyleBg bd1">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tab-title">
						<span class="on" style="cursor:default;">产业集群排行榜</span>
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
							<div class="orders orders2" id="parkOrder">
								<span class="on">主营业务收入</span>
								<span>利润</span>
								<span>从业人员</span>
								<span>投产企业</span>
							</div>
							<div class="count-list park-list" id="parkList">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="eco-row eco-row2">
			<div class="boxStyleBg pr bd1">
				<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
				<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
				<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
				<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
				<div class="price-num">
					<span onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/2")'>
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
					<span onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/2")'>
						<div class="middle-box">
							<p>主营业务收入</p>
							<h1 class="bgT"><font class="bigProjectDataNum" id="zzywsr"></font><small>亿元</small></h1>
						</div>
					</span>
					<span onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/2")'>
						<div class="middle-box">
							<p>利润总额</p>
							<h1 class="lgT"><font class="bigProjectDataNum" id="lrze"></font><small>亿元</small></h1>
						</div>
					</span>
					<span onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/14")'>
						<div class="middle-box">
							<p>工业用电总量</p>
							<h1 class="lgT"><font class="bigProjectDataNum" id="gyyd"></font><small>万 kwh</small></h1>
						</div>
					</span>
				</div>
				<div class="yc-map" id="ycEconMap"></div>
				<div class="map-areas econmic-map-areas">
					<span style="cursor: pointer;">
						<h4>江西省</h4>
					</span>
					<span>
						<h4>宜春市</h4>
					</span>
				</div>
				<div class="electric-title"onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/14")'>
					<span class="bgT electric-title-span">重点监测企业：今日累计用电<b class="orangeT" id="ljyd"></b>万 kwh</span>
				</div>
				<div class="electric-chart" id="electricTab0">
					<div class="chart3" id="electricChart"></div>
					<div class="electric-infor" onclick='goPage("${ctx}/front/cityDataCenter/gxwIndex/14")'>
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
			<div class="eco-floor h60">
				<div class="boxStyleBg bd1">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tab-title">
						<span class="on" style="cursor:default;">园区排行榜</span>
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
							<div class="orders" id="eightOrder">
								<span class="on">主营业务收入</span>
								<span>利润总额</span>
								<span>工业增加值增速</span>
								<span>每亩销售产值</span>
								<span>出口交货值</span>
								<span>招商实际到位资金</span>
							</div>
							<div class="count-list park-list h2" id="industryList"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="eco-floor h40">
				<div class="boxStyleBg bd1">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tab-title">
						<span class="on" style="cursor:default;">园区分布情况</span>
					</div>
					<div  class="tabs tab1">
						<div class="tab">
							<div class="chart3" id="chartPie"></div>
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
<script type="text/javascript" src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	$(function(){
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
			$(this).next().slideToggle();
		});
		$(".map-areas span:eq(0)").on("click",function(){
			$(this).next().removeClass("on");
			$("#orgId").val('360000');
			getEconomic();
			getElectric();
			getAllElectric();
			getIndustryOrder();//产业集群排行榜
			getIndustryList(); //园区排行榜
			getPark(); //园区分布
		});
		$(".orders span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			if($(this).parent().attr("id") == 'areaOrder') {
				$("#areaOd").val(ind+1);
				getProcess();
			} else if($(this).parent().attr("id") == 'parkOrder') {
				$("#parkOd").val(ind);
				getIndustryOrder();
			} else if($(this).parent().attr("id") == 'eightOrder') {
				$("#eightOd").val(ind);
				getIndustryList();
			}
		});
		getselectYear();
		getProcess(1);//区县任务进度
		getIndustryOrder(1);//产业集群排行榜
		getYcMap(1); //宜春地图
		getEconomic(); //经济指标
		getElectric(); //用电
		getAllElectric(); //用电
		getIndustryList(1); //园区排行榜
		getPark(); //园区分布
	});
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>y-4;i--){
	    	$('#areaUl').append('<li>'+i+'</li>');
	    	$('#parkUl').append('<li>'+i+'</li>');
	    	$('#eightUl1').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='eightUl1'){
				$('#eightFont1').text($(this).text());
	 			$('#eightYear').val($(this).text());
	 			getIndustryList();
			}else if($(this).parent().attr('id')=='areaUl'){
				$('#areaYear').val($(this).text());
	 			$('#areaFont').text($(this).text());
				getProcess();
			}else if($(this).parent().attr('id')=='parkUl'){
				$('#parkYear').val($(this).text());
	 			$('#parkFont').text($(this).text());
	 			getIndustryOrder();
			}
		})
	}
	//任务进度
	function getProcess(type){
		var param = {
			"year" : $('#areaYear').val(),
			"type": $("#areaOd").val()
		};
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/ycNew/valueData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
		 			var div = '';
		 			if(type == 1){
						$('#areaYear').val(result.year);
			 			$('#areaFont').text(result.year);
		 			}
		 			if(result.valueList.length > 0){
			 			for(var i=0;i<result.valueList.length;i++){
			 				var info = result.valueList[i];
			 				var w = Math.floor(Number(info.value)/Number(result.valueList[0].value)*100);
			 				var unit = param.type == 3 ? '万人' : '亿元';
			 				if(w != '0'){
				 				div += '<div class="count-item">';
				 				div += '<font>'+info.orgName+'</font>';
				 				div += '<span>';
				 				div += '<div style="width: '+w+'%;"></div>';
				 				div += '</span><b class="count-price">'+info.value+'<small>'+unit+'</small></b></div>';
			 				}
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
	//产业集群排行榜
	function getIndustryOrder(type){
		var param = {
			"year" : $('#parkYear').val()==''?undefined:$('#parkYear').val(),
			"areaId": $('#orgId').val()=='360000'?'':$('#orgId').val(),
			"orderType": $("#parkOd").val()
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/provinceDataCenter/industryClusterOrder",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					if(type == 1) {
						$('#parkYear').val(result.year);
			 			$('#parkFont').text(result.year);
					}
		 			var div = '';
		 			if(result.list.length > 0){
		 				var info0 = result.list[0];
		 				var v0 = param.orderType == 0 ? info0.zyywsrValue : param.orderType == 1 ? info0.lsValue : param.orderType == 2 ? info0.pjcyryValue : info0.tcqyValue;
			 			for(var i=0;i<result.list.length;i++){
			 				var info = result.list[i];
			 				var v = param.orderType == 0 ? info.zyywsrValue : param.orderType == 1 ? info.lsValue : param.orderType == 2 ? info.pjcyryValue : info.tcqyValue;
			 				var w = Math.floor(Number(v)/Number(v0)*100);
			 				var unit = param.orderType == 0 || param.orderType == 1 ? '亿元' : param.orderType == 2 ? '人' : '家';
			 				if(w != '0'){
				 				div += '<div class="count-item">';
				 				div += '<b class="count-index">'+(i+1)+'</b>';
				 				div += '<div class="dib"><font>'+info.clusterName+'</font><span>';
				 				div += '<div style="width: '+w+'%;"></div>';
				 				div += '</span></div>';
				 				div += '<b class="count-price">'+v+'<small>'+unit+'</small></b>';
			 					div += '</div>';
			 				}
			 			}
		 			} else {
		 				div += '<p style="padding: 100px;text-align:center;font-size:18px;color:#fff;">暂无数据</p>';
		 			}
		 			$('#parkList').html(div);
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
					if(result.economic.gyzjz_percent){
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
					}
					else {
						$("#gyzjz").text('未公布').next().hide();
						$("#zzywsr").text('未公布').next().hide();
						$("#lrze").text('未公布').next().hide();
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
			{name : '南昌市', value : ["360100",'NANCHANG']}, 
			{name : '景德镇市', value : ["360200",'JINGDEZHEN']}, 
			{name : '萍乡市', value : ["360300",'PINGXIANG']}, 
			{name : '九江市', value : ["360400",'JIUJIANG']}, 
			{name : '新余市', value : ["360500",'XINYU']}, 
			{name : '鹰潭市', value : ["360600",'YINGTAN']}, 
			{name : '赣州市', value : ["360700",'GANZHOU']}, 
			{name : '吉安市', value : ["360800",'JIAN']}, 
			{name : '宜春市', value : ["360900",'YICHUN']}, 
			{name : '抚州市', value : ["361000",'FUZHOU']},
			{name : '上饶市', value : ["361100",'SHANGRAO']} 
		]
		$.get('${ctx}/static/map/360000.json', function (chinaJson) {
		    echarts.registerMap('jx', chinaJson);
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
			"orgId" : $('#orgId').val()
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
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	//园区排行榜
	function getIndustryList(type){
		var param = {
				"year" : $('#eightYear').val()==''?undefined:$('#eightYear').val(),
				"areaId": $('#orgId').val()=='360000'?'':$('#orgId').val(),
				"orderType": $("#eightOd").val()
		};
		$.ajax({
	 		url : "${OfficeUrl}XOffice/interface/json/provinceDataCenter/parkOrder",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				console.log(param,result)
				if(result.success){
					if(type==1){
						$('#eightYear').val(result.year);
						$('#eightFont1').text(result.year);
					}
		 			var div = '';
		 			if(result.list.length > 0){
			 			for(var i=0;i<result.list.length;i++){
			 				var info0 = result.list[0];
			 				var info = result.list[i];
			 				var v,v0,unit;
			 				switch(Number(param.orderType)) {
			 				case 0:
			 					v0 = info0.zyywsrValue;
			 					v = info.zyywsrValue;
			 					unit = '亿元';
			 				  	break;
			 				case 1:
			 					v0 = info0.lrValue;
			 					v = info.lrValue;
			 					unit = '亿元';
				 				break;
			 				case 2:
			 					v = info.gyzjzPercent;
			 					unit = '%';
				 				break;
			 				case 3:
			 					v0 = info0.gyxsczValue;
			 					v = info.gyxsczValue;
			 					unit = '万元';
				 				break;
			 				case 4:
			 					v0 = info0.ckjhzValue;
			 					v = info.ckjhzValue;
			 					unit = '亿元';
				 				break;
			 				case 5:
			 					v0 = info0.zssjdwzjValue;
			 					v = info.zssjdwzjValue;
			 					unit = '亿元';
				 				break;
			 				}
			 				var t = info.parkKind == 0 ? '省级' : info.parkKind == 1 ? '国家' : info.parkKind == 2 ? '省重' : '筹备';
			 				if(v){
				 				if(param.orderType == 2){ var w = v;}
				 				else { var w = Math.floor(Number(v)/Number(v0)*100);}
				 				div += '<div class="count-item">';
				 				div += '<b class="count-index">'+(i+1)+'</b>';
				 				div += '<div class="dib"><font><i>'+t+'</i>'+info.organizationName+'</font><span>';
				 				div += '<div style="width: '+w+'%;"></div>';
				 				div += '</span></div>';
				 				div += '<b class="count-price">'+v+'<small>'+unit+'</small></b>';
			 					div += '</div>';
			 				} else {
			 					div += '<div class="count-item">';
				 				div += '<b class="count-index">'+(i+1)+'</b>';
				 				div += '<div class="dib"><font><i>'+t+'</i>'+info.organizationName+'</font><span>';
				 				div += '</span></div>';
				 				div += '<b class="count-price"><small>暂无数据</small></b>';
			 					div += '</div>';
			 				}
			 			}
		 			} else {
		 				div += '<p style="padding: 100px;text-align:center;font-size:18px;color:#fff;">暂无数据</p>';
		 			}
					$('#industryList').html(div);
				}else{
					tips("数据获取异常");
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	};
	//园区分布情况
	function getPark(){
		var param = {
			"orgId" : $('#orgId').val()
		};
		$.ajax({
			url : "${ctx}/interface/json/dataCenter/parkCount",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					chartPark(result.parkData.pie)
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	};
	function chartPark(d1) {
		var myChart = echarts.init(document.getElementById('chartPie'));
		var option = {
			tooltip: {
				trigger: 'item'
			},
			color: ['#DCC668','#4D5AD7','#D66993','#D60078'],
		    legend: {
		    	show: false,
		    	data: d1.legend,
		        bottom: '5%',
		        itemWidth: 10,
		        itemHeight: 10,
		        itemGap: 35,
		   		textStyle: {
		            color: "#fff"
		        },
		    },
		    series: [{
		        type: 'pie',
		        radius : ['50%', '80%'],
		        center: ['50%', '50%'],
		        label: {
		        	formatter: function(params){
		            	return params.name + '\n' + params.percent+"%("+params.value+"个)";
		            },
		            color: '#fff',
		            fontSize: 14
		        },
		        labelLine: {
		        	length: 10,
		        	length2: 10,
		        	lineStyle : { color: '#fff'}
				},
				data: d1.series
		    }]  
		};
	    myChart.setOption(option);
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
