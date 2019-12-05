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
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxwHomePage.css"/>

<link href="${ctx}/static/js/plugins/video/video-js.css" rel="stylesheet">
<title>吉安高新技术开发区大数据平台企业画像</title>
<style>
	/*去除百度地图版权*/
	.anchorBL{
		display:none;
	}
	.BMap_cpyCtrl{
		display:none;
	}
	.drawHeader>img {
        margin-top: 0;
     }
	.drawContent {
	    height: -webkit-calc(100% - 96px);
	    height: calc(100% - 96px);
	    padding: 10px 15px;
   }
 /*   .gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/jgs/jxNew/bg.png) !important;
} */
	#swiperChirld .swiper-slide {text-align: center;}
	#swiperChirld .swiper-slide img {height: 120px;}
	/* 信用等级 */
	.creditGrade {
		position: absolute; 
		right: 10px; 
		top: 0px; 
		color: #03E0C2; 
		font-size: 16px; 
		font-weight: bold; 
		cursor: default;
	}
</style>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360000">
		<input type="hidden" id="region" name="region" value="江西省">
		<input type="hidden" id="companyId" name="companyId" value="${companyId}">
	</form>
	 <%@ include file="header.jsp"%>
	<div class="drawContent">
		<div class="spanStyle" style="width: 27.5%;">
			<div class="blockStyle" style="height: 30%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">经济运行总览</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="jjyxYear"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="jy">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="tabContBar">
						<div class="tabCont">
							<i></i>
							<div class="verCenter">
								<div class="ringItem">
									<img src="${ctx}/static/image/cityDataCenter/jxNew/ringOrange.png">
									<div class="ringMiddle">
										<div class="ringValue" id="cyry-value">120</div>
										<div class="ringUnit" id="cyry-unit">人</div>
									</div>
									<p id="cyry-name">从业人员</p>
								</div>
								<div class="ringItem">
									<img src="${ctx}/static/image/cityDataCenter/jxNew/ringOrange.png">
									<div class="ringMiddle">
										<div class="ringValue" id="zyywsr-value">120</div>
										<div class="ringUnit" id="zyywsr-unit">亿元</div>
									</div>
									<p id="zyywsr-name">主营业务收入</p>
								</div>
								<div class="ringItem">
									<img src="${ctx}/static/image/cityDataCenter/jxNew/ringOrange.png">
									<div class="ringMiddle">
										<div class="ringValue" id="nsze-value">10-20</div>
										<div class="ringUnit" id="nsze-unit">亿元</div>
									</div>
									<p id="nsze-name">纳税总额</p>
								</div>
								<div class="ringItem">
									<img src="${ctx}/static/image/cityDataCenter/jxNew/ringOrange.png">
									<div class="ringMiddle">
										<div class="ringValue" id="lrl-value">37</div>
										<div class="ringUnit" id="lrl-unit">%</div>
									</div>
									<p id="lrl-name">利润率</p>
								</div>
							</div>
						</div>
							
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(35% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">企业单位生产总值能耗情况</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="nhqkYear"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="ny">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="tabContBar">
						<div class="chartBar">
							<div id="chart1" style="height: 100%;"></div>
							<div class="chartUnit">单位：万度/万元</div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(35% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">全员劳动生产率</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="sclYear"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="sy">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="tabContBar">
						<div class="chartBar">
							<div id="chart2" style="height: 100%;"></div>
							<div class="chartUnit">单位：万元/人</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div class="spanStyle" style="width: calc(45% - 10px);">
			<div class="blockStyle" style="height: 70%;">
				<div class="tabCaptionBar">
					<span class="tabCaption" style="width: calc(100% - 147px);cursor: pointer;" onclick="choiceCompany()">
						<div id="companyTitleName" style="display: inline-block; vertical-align: middle;"></div>
						<i class="fa fa-caret-down"></i>
					</span>
				</div>
				<div class="tabContBar">
					<div style="padding: 20px 50px 10px;">
						<div class="inlineBox" style="height: 200px;">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="companyLogo">
									<i></i>
									<img id="logoUrl" src="${ctx}/static/image/cityDataCenter/jxNew/default.png">
								</div>
							</div>
						</div>
						<div class="inlineBox" style="height: 200px;">
							<div id="mapChart" style="height: 100%;"></div>
						</div>
					</div>
					<div class="indexDataBar">
						<i></i>
						<div class="verCenter">
							<div class="ringItem" style="width: 20%;">
								<img src="${ctx}/static/image/cityDataCenter/jxNew/report.png">
								<p>2014年年报</p>
							</div>
							<div class="ringItem" style="width: 20%;">
								<img src="${ctx}/static/image/cityDataCenter/jxNew/report.png">
								<p>2015年年报</p>
							</div>
							<div class="ringItem" style="width: 20%;">
								<img src="${ctx}/static/image/cityDataCenter/jxNew/report.png">
								<p>2016年年报</p>
							</div>
							<div class="ringItem" style="width: 20%;">
								<img src="${ctx}/static/image/cityDataCenter/jxNew/report.png">
								<p>2017年年报</p>
							</div>
							<div class="ringItem" style="width: 20%;">
								<img src="${ctx}/static/image/cityDataCenter/jxNew/report.png">
								<p>2018年年报</p>
							</div>
						</div>
					</div>
					<div class="companyInfoBar">
						<div class="companyInfo">
							<i></i>
							<span class="infoName">公司名称：</span><span class="infoValue" id="companyName"></span>
							<span class="infoName">经营状态：</span><span class="infoValue" id="issueStateName"></span>
						</div>
						<div class="companyInfo">
							<i></i>
							<span class="infoName">法 人：</span><span class="infoValue" id="legalPerson"></span>
							<span class="infoName">企业类型：</span><span class="infoValue" id="companyTypeNameStr"></span>
						</div>
						<div class="companyInfo">
							<i></i>
							<span class="infoName">注册资本：</span><span class="infoValue" id="registeredCapitalStr"></span>
							<span class="infoName">成立时间：</span><span class="infoValue" id="establishDateStr"></span>
						</div>
						<div class="companyInfo">
							<i></i>
							<span class="infoName">组织机构代码：</span><span class="infoValue" id="socialCreditNo"></span>
							<span class="infoName">登记机关：</span><span class="infoValue" id="caName"></span>
						</div>
						<div class="companyInfo">
							<i></i>
							<span class="infoName">联系电话：</span><span class="infoValue" id="contactPhone"></span>
							<span class="infoName">所属产业：</span><span class="infoValue" id="industryTypeParkName"></span>
						</div>
						<div class="companyInfo">
							<i></i>
							<span class="infoName">公司网址：</span><span class="infoValue" id="siteUrl"></span>
							<span class="infoName">企业地址：</span><span class="infoValue" id="operationAddress"></span>
						</div>
						<div class="companyInfo sArea">
							<i></i>
							<span class="infoName" style="vertical-align: text-bottom;">经营范围：</span><span class="infoValue" id="operationScope"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(30% - 10px);">
				<div class="inlineBox">
					<%-- <div class="videoBar" id="video">
						<iframe id="videoIframe" src="https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=ceb5e7d49e3846639a6bc6864e6c444e" frameborder="0" scrolling="auto" style="width:92%; height:100%; overflow:hidden; display: none;"></iframe>
						<img id="noRealTime" src="${ctx}/static/image/cityDataCenter/jxNew/comVideo1.gif" width="92%;" style="padding: 8px;">
					</div> --%>
					<video id="myVideo" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" data-setup='{}' style='width: 100%;height: 100%;'>
			            <source id="source" src="http://testfile.inpark.com.cn:89/mag/hls/ceb5e7d49e3846639a6bc6864e6c444e/0/live.m3u8" type="application/x-mpegURL"></source>
			        </video>
				</div>
				<div class="inlineBox">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div class="tabCaptionBar">
							<span class="tabCaption">企业关联图谱</span>
						</div>
						<div class="tabContBar">
							<div id="graphChart" style="height: 100%;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(27.5% - 10px);">
			<div class="blockStyle" style="height: 35%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">风险指数</span>
						<span class="creditGrade" title="">A 级 (守信企业)</span>
					</div>
					<div class="tabContBar">
						<div id="radarChart" style="height: 100%;"></div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(30% - 10px);">	
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">企业产品</span>
					</div>
					<div class="tabContBar">
						<div class="swiper-container loop-swiper" id="swiper" style="display:block;height: 100%;">
							<div class="swiper-wrapper" id="swiperChirld"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(35% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
				 	<div class="tabCaptionBar">
						<span class="tabCaption">企业知识产权</span>
					</div> 
					<div class="tabContBar">
						<div id="comPower" class="comPowerBar"></div>
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
<script src="https://api.map.baidu.com/api?v=2.0&ak=2b82bdceb647d5f7819514f45c752413"></script>

<script src="${ctx}/static/js/plugins/video/video.js"></script>
<script src="${ctx}/static/js/plugins/video/videojs-contrib-hls.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head .tab>a:eq(1)").addClass("on");
		//切换框
		/* $(".tabCaption span").on("click", function() {
			var ind = $(this).index() + 1;
			var val = $(this).parent().attr('data');
			$(this).addClass("on").siblings().removeClass("on");
			$("#tab-" + val + "-" + ind).siblings().fadeOut("fast");
			setTimeout(function() {
				$("#tab-" + val + "-" + ind).fadeIn("fast");
			}, 200)
		}); */
		
		getselectYear();//设置年份
		getCompanyData1();
		getCompanyData2();
		
		//下拉框点击事件
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
		
		var myVideo = videojs('myVideo', {
	        bigPlayButton: true,
	        textTrackDisplay: false,
	        posterImage: false,
	        errorDisplay: false,
	    })
	    myVideo.play()
	})
	//设置年份及年月点击事件
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
		$("#jjyxYear").text(y);
		$("#nhqkYear").text(y);
		$("#sclYear").text(y);
	    for(var i=y; 2015<i+1;i--){
	    	$('.select #jy').append('<li>'+i+'</li>');
	    	$('.select #ny').append('<li>'+i+'</li>');
	    	$('.select #sy').append('<li>'+i+'</li>');
	    }
	    
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='jy'){
				//修改下拉组件默认值
	 			$('#jjyxYear').text($(this).text());
	 			getCompanyData1(1)
			}else if($(this).parent().attr('id')=='ny'){
				//修改下拉组件默认值
				$('#nhqkYear').text($(this).text());
	 			getCompanyData1(2)
			}else if($(this).parent().attr('id')=='sy'){
				//修改下拉组件默认值
				$('#sclYear').text($(this).text());
	 			getCompanyData1(3)
			}else {}
		})
	}
	function goIndex(index){
		if(index==1){
			window.location.href= '${ctx}/front/cityDataCenter/cfIndex/1';
		}else if(index==2){
			
		}else if(index==3){
			window.location.href= '${ctx}/front/cityDataCenter/cfIndex/3';
		}else if (index==4){
			window.location.href= '${ctx}/front/cityDataCenter/cfIndex/4';
		}else if(index==5){
			window.location.href= '${ctx}/front/cityDataCenter/cfIndex/5';
		}else if (index==6){
			window.location.href= '${ctx}/front/cityDataCenter/cfIndex/6';
		}else if(index==7){
			window.location.href= '${ctx}/front/cityDataCenter/cfIndex/7';
		}
		
	}
	function showWindowHref(){
		let sHref = window.location.href;
		let args = sHref.split('?');
		if(args[0] == sHref){
			return "";
		}
		let arr = args[1].split('&');
		let obj = {};
		for(let i = 0;i< arr.length;i++){
			let arg = arr[i].split('=');
			obj[arg[0]] = arg[1];
		}
		return obj;
	};
	function choiceCompany(){
		layer.open({
			type: 2,
			title: false,
			shadeClose: true,
			shade: 0.3,
			area: ['900px', '675px'],
			content: '${ctx}/front/page/companyInfo/frame?parkId=1245&index=8&treeType=park' //iframe的url
		}); 
	};
	function getCompanyData1(type){
		var year = "";
		if(type == 1){
			year = $('#jjyxYear').text();
		}else if(type == 2){
			year = $('#nhqkYear').text();
		}else if(type == 3){
			year = $('#sclYear').text();
		}else{}
		$.ajax({
			url : '${OfficeUrl}XOffice/interface/json/yuanZhouPharma/getLeftJson',
			type : "post",
			data : {
				"companyId" : $('#companyId').val()
			},
			success : function(result) {
				console.log(result)
				if (result.success) {
					//企业单位生产总值能耗情况数据
					if(type == 2 || type =="" || type == undefined){
						if(result.xAxis1.length != "" && result.xAxis1.length != undefined){
							var div_ = document.getElementById("chart1");
							div_.removeAttribute("_echarts_instance_");
							var orangeLineChart = echarts.init(div_);
							//var orangeLineChart = echarts.init(document.getElementById("chart1"));
							orangeLineOption.xAxis.data = result.xAxis1;
							orangeLineOption.series[0].data = result.series1;
							orangeLineChart.setOption(orangeLineOption);
						}else{
							$("#chart1").html("<font class=\"unData\">暂无数据</font>");
						}
					}
					//全员劳动生产率
					if(type == 3 || type =="" || type == undefined){
						if(result.xAxis2.length != "" && result.xAxis2.length != undefined){
							var div_ = document.getElementById("chart2");
							div_.removeAttribute("_echarts_instance_");
							var blueLineChart = echarts.init(div_);
							//var blueLineChart = echarts.init(document.getElementById("chart2"));
							blueLineOption.legend.data = result.xAxis2;
							blueLineOption.series[0].name = "全员劳动生产率";
							blueLineOption.series[0].data = result.series2;
							blueLineChart.setOption(blueLineOption);
						}else{
							$("#chart2").html("<font class=\"unData\">暂无数据</font>");
						}
					}
					//财务总揽数据
					if(type == 1 || type =="" || type == undefined){
						if(result.data1 != "" && result.data1 != undefined){
							$("#cyry-value").text(result.data1.PJCYRY_VALUE);
							$("#zyywsr-value").text(result.data1.ZYYWSR_VALUE);
							$("#nsze-value").text(result.data1.SJ_VALUE);
							$("#lrl-value").text(result.data1.LR_VALUE);
						}
					}
					//企业关联图谱数据
					/* if(result.data.connDiagram != undefined){ */
						var div_ = document.getElementById("graphChart");
						div_.removeAttribute("_echarts_instance_");
						var graphChart = echarts.init(div_);
						//var graphChart = echarts.init(document.getElementById("graphChart"));
						graphChart.setOption(graphOption);
					/* }else{
						$("#graphChart").html("<font class=\"unData\">暂无数据</font>");
					} */
					//企业风险数据
					if(result.data4.companyRisk != undefined){
						var div_ = document.getElementById("radarChart");
						div_.removeAttribute("_echarts_instance_");
						var radarChart = echarts.init(div_);
						//var radarChart = echarts.init(document.getElementById("radarChart"));
						radarOption.radar.indicator = result.data4.companyRisk.indicator;
						radarOption.series[0].data[0].value = result.data4.companyRisk.value;
						radarChart.setOption(radarOption);
					}else{
						$("#radarChart").html("<font class=\"unData\">暂无数据</font>");
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	function getCompanyData2(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/companyInfo/companyPortrait",
			type : "post",
			data : {
				"companyId" : $('#companyId').val()
			},
			success : function(result) {
				if (result.success) {
					//企业信息数据
					if(result.companyInfo.logoUrl != "" &&  result.companyInfo.logoUrl != undefined){
						$("#logoUrl").attr("src",result.companyInfo.logoUrl);
					}
					if(result.companyInfo.companyName != "" &&  result.companyInfo.companyName != undefined){
						$("#companyTitleName").text(result.companyInfo.companyName);
						$("#companyName").text(result.companyInfo.companyName);
					}
					if(result.companyInfo.issueStateName != "" &&  result.companyInfo.issueStateName != undefined){
						$("#issueStateName").text(result.companyInfo.issueStateName);
					}
					if(result.companyInfo.legalPerson != "" &&  result.companyInfo.legalPerson != undefined){
						$("#legalPerson").text(result.companyInfo.legalPerson);
					}
					if(result.companyInfo.companyTypeNameStr != "" &&  result.companyInfo.companyTypeNameStr != undefined){
						$("#companyTypeNameStr").text(result.companyInfo.companyTypeNameStr);
						$("#companyTypeNameStr").attr("title",result.companyInfo.companyTypeNameStr);
					}
					if(result.companyInfo.registeredCapital != "" &&  result.companyInfo.registeredCapital != undefined && result.companyInfo.currencyName != "" &&  result.companyInfo.currencyName != undefined && result.companyInfo.currencyName != "人民币元"){
						if(result.companyInfo.currencyName == "人民币元"){
							$("#registeredCapitalStr").text(result.companyInfo.registeredCapital+"万人民币");
						}else{
							$("#registeredCapitalStr").text(result.companyInfo.registeredCapital+"万"+result.companyInfo.currencyName);
						}
					}
					if(result.companyInfo.establishDateStr != "" &&  result.companyInfo.establishDateStr != undefined){
						$("#establishDateStr").text(result.companyInfo.establishDateStr);
					}
					if(result.companyInfo.socialCreditNo != "" &&  result.companyInfo.socialCreditNo != undefined){
						$("#socialCreditNo").text(result.companyInfo.socialCreditNo);
					}
					if(result.companyInfo.caName != "" &&  result.companyInfo.caName != undefined){
						$("#caName").text(result.companyInfo.caName);
					}
					if(result.companyInfo.contactPhone != "" &&  result.companyInfo.contactPhone != undefined){
						$("#contactPhone").text(result.companyInfo.contactPhone);
					}
					if(result.companyInfo.industryTypeParkName != "" &&  result.companyInfo.industryTypeParkName != undefined){
						$("#industryTypeParkName").text(result.companyInfo.industryTypeParkName);
					}
					if(result.companyInfo.siteUrl != "" &&  result.companyInfo.siteUrl != undefined){
						$("#siteUrl").text(result.companyInfo.siteUrl);
					}
					if(result.companyInfo.operationAddress != "" &&  result.companyInfo.operationAddress != undefined){
						$("#operationAddress").text(result.companyInfo.operationAddress);
					}
					if(result.companyInfo.operationScope != "" &&  result.companyInfo.operationScope != undefined){
						$("#operationScope").text(result.companyInfo.operationScope);
						$("#operationScope").attr("title",result.companyInfo.operationScope);
					}
					//企业产品数据
					if(result.productList != "" &&  result.productList != undefined){
						for(var i=0;i<result.productList.length;i++){
							var info = result.productList[i];
							var _div = "";
								_div += '<div class="swiper-slide">'
								//_div += '	<div class="">'
								_div += '		<i></i>'
								if(info.picUrl != "" && info.picUrl != undefined){
									_div += '		<img src="'+info.picUrl+'" title="'+info.productName+'">'
								}else{
									_div += '		<img src="${ctx}/static/image/cityDataCenter/jxNew/default.png" title="'+info.productName+'">'
								}
								//_div += '	</div>'
								_div += '</div>'
							$("#swiperChirld").append(_div);
						}
						
						var swiper = new Swiper('#swiper', {
							autoplay:true,
							slidesPerView :3,
						    slidesPerGroup : 1,
						    spaceBetween : 10,
						    observer:true,
						    autoPlay:true,
						});
					}else{
						$("#swiperChirld").html("<font class=\"unData\">暂无数据</font>");
					}
					//企业竞争力数据competitiveMap
					if(result.competitiveMap != "" &&  result.competitiveMap != undefined){
						var map = result.competitiveMap;
						for(var m in map){
							var _div = "";
								_div += '<div class="comPower">'
								_div += '	<i></i>'
								_div += '	<span class="comPowerName">'+m+'</span>'
								_div += '	<div class="comPowerProcess">'
								_div += '		<div style="width:'+map[m]/100*100+'%;"></div>'
								_div += '	</div>'
								_div += '	<span class="comPowerValue">'+map[m]+'</span>'
								_div += '</div>'
								_div += '</div>'
							$("#comPower").append(_div);
						}
					}else{
						$("#comPower").html("<font class=\"unData\">暂无数据</font>");
					}
					//项目申报数据
					$("#tab-4-1-table").empty();
					if(result.projectList != "" &&  result.projectList != undefined){
						var _div = "";
						for(var i=0 ; i<result.projectList.length ; i++){
							var info = result.projectList[i];
							_div += "	<tr>";
							_div += "		<td class=\"w70\" style=\"text-align: left;\">"+info.projectName+"</td>";
							if(info.acquireTime != "" && info.acquireTime != undefined){
								_div += "		<td class=\"w30\" style=\"color: #00FF42\">已获批</td>";
							}else{
								_div += "		<td class=\"w30\" style=\"color: #FFE42D\">申请中</td>";	
							}
							_div += "	</tr>";
						}
						$("#tab-4-1-table").append(_div);
						if($("#tab-4-1-table").height() > $("#tab-4-1-table").parent().height()){
							$("#tab-4-1-table").append(_div);
							$("#tab-4-1-table").addClass('roll');
							$("#tab-4-1-table").css("animation-duration",result.projectList.length*4+"s");
						}else{
							$("#tab-4-1-table").removeClass('roll');
						}
						$("#tab-4-1-table").next().hide();
					}else{
						$("#tab-4-1-table").next().show();
					}
					//企业诉求数据
					$("#tab-4-2-table").empty();
					if(result.appealList != "" &&  result.appealList != undefined){
						var _div = "";
						for(var i=0 ; i<result.appealList.length ; i++){
							var info = result.appealList[i];
							_div += "	<tr>";
							_div += "		<td class=\"w70\" style=\"text-align: left;\">"+info.appealTitle+"</td>";
							if(info.status == 1){
								_div += "		<td class=\"w30\" style=\"color: #00FF42\">已提交</td>";
							}else if(info.status == 2){
								_div += "		<td class=\"w30\" style=\"color: #FFE42D\">处理中</td>";	
							}else if(info.status == 3){
								_div += "		<td class=\"w30\" style=\"color: #FF342E\">已结束</td>";	
							}else{}
							_div += "	</tr>";
						}
						$("#tab-4-2-table").append(_div);
						if($("#tab-4-2-table").height() > $("#tab-4-2-table").parent().height()){
							$("#tab-4-2-table").append(_div);
							$("#tab-4-2-table").addClass('roll');
							$("#tab-4-2-table").css("animation-duration",result.appealList.length*4+"s");
						}else{
							$("#tab-4-2-table").removeClass('roll');
						}
						$("#tab-4-2-table").next().hide();
					}else{
						$("#tab-4-2-table").next().show();
					}
					//企业经纬度显示于百度地图
					if(result.companyInfo.addressLongitude != "" &&  result.companyInfo.addressLongitude != undefined && result.companyInfo.addressLatitude != "" &&  result.companyInfo.addressLatitude != undefined){
						var map = new BMap.Map("mapChart");
						var point = new BMap.Point(result.companyInfo.addressLongitude,result.companyInfo.addressLatitude);
						map.centerAndZoom(point, 15); 
						
						//底层地图替换主题. 模板页可以查看http://lbsyun.baidu.com/custom/list.htm      
						map.setMapStyle({style:'midnight'});
						
						var ringIcon = new BMap.Icon("${ctx}/static/image/cityDataCenter/jxNew/redRing.png", new BMap.Size(110,110));
						var marker3 = new BMap.Marker(point,{icon:ringIcon}); 
						map.addOverlay(marker3);
						
						var pointIcon = new BMap.Icon("${ctx}/static/image/cityDataCenter/jxNew/point.png", new BMap.Size(27,37),{anchor: new BMap.Size(13.5, 37)});
						var marker1 = new BMap.Marker(point,{icon:pointIcon}); 
						map.addOverlay(marker1); 
						var n = -(result.companyInfo.companyName.length*10-8)/2;//计算label水平位移距离
						var label = new BMap.Label("<div style='text-align:center;'>"+result.companyInfo.companyName+"</div>",{offset:new BMap.Size(n,35)});
						marker1.setLabel(label);
						label.setStyle({
							color : "#FFF",
							backgroundColor: "rgba(0,0,0,0)",//文本背景色
							//borderColor:'#0F90D2',//文本框边框色
							fontSize : "12px",
							width : "0px",
							height : "0px",
							border : "none",
							lineHeight : "20px",
							cursor: "pointer"
						});
					}else{
						$("#mapChart").html("<font class=\"unData\">暂无经纬度</font>");
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
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
        	right: 10,
        	left: 40,
        	bottom: 35,
        	top: 35
        },
        tooltip: {
            show:true,
            trigger: 'axis',
        },
        xAxis: {
	        data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
	        boundaryGap: false,
            splitLine: {
                show: true,
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
                color: '#989CB8',
                rotate: 40,
                fontSize: 11,
            }
		},
		yAxis: {
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
				color: '#989CB8',
				fontSize: 11,
				formatter:function(params){
					return params;
				}
			}
        },
		series: [{
			name: '能耗情况',
			type: 'line',
			data: [],
			symbolSize: 0,
			smooth: true,
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
			}
		},]
	};
	//蓝色线型配置
	var blueLineOption = {
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
        	right: 10,
        	left: 40,
        	bottom: 35,
        	top: 35
        },
        tooltip: {
            show:true,
            trigger: 'axis',
        },
        xAxis: {
	        data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
	        boundaryGap: false,
            splitLine: {
                show: true,
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
                color: '#989CB8',
                rotate: 40,
                fontSize: 11,
            }
		},
		yAxis: {
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
				color: '#989CB8',
				fontSize: 11,
				formatter:function(params){
					return params;
				}
			}
        },
		series: [{
			name: '同比',
			type: 'line',
			data: [],
			symbolSize: 0,
			smooth: true,
			color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
				offset: 0,
				color: '#67F8B3'
			}, {
      			offset: 1,
      			color: '#05A6FC'
			}]),
			areaStyle: {
				color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
					offset: 0,
					color: '#67F8B3'
				}, {
	      			offset: 1,
	      			color: '#05A6FC'
				}]),
				opacity: 0.2,
			}
		},]
	};
	//蓝色柱状图配置
	var blueBarOption = {
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
        	right: 10,
        	left: 40,
        	bottom: 35,
        	top: 35
        },
        tooltip: {
            show:true,
            trigger: 'axis',
        },
        xAxis: {
	        data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
            splitLine: {
                show: false,
            },
            axisLine: {
				show: true,
				lineStyle:{
					 color: 'rgba(255,255,255,0.1)'
				}
			},
            axisLabel: {
                color: '#989CB8',
                rotate: 40,
                fontSize: 11,
            }
		},
		yAxis: {
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
				color: '#989CB8',
				fontSize: 11,
				formatter:function(params){
					return params;
				}
			}
        },
		series: [{
			name: '全员劳动生产率',
			type: 'bar',
			data: [],
			color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
				offset: 0,
				color: '#67F8B3'
			}, {
      			offset: 1,
      			color: '#05A6FC'
			}]),
		},]
	};
	//仪表盘配置
	var gaugeOption = {
	    series: [{
	        type: 'gauge',
	        detail: {
	            formatter: '良好',
	            fontSize: 30,
	            fontFamily: 'DIN-Medium'
	        },
	        radius: '90%',
	        title: {
	        	show: false,
				fontSize: 14,
				color: '#fff',
				offsetCenter : [0, '90%']
			},
			pointer: {
				length: '60%',
				width: 4
			},
			itemStyle: {
				color: '#216ED4',
			},
	        axisLine: {
	            show: true,
	            lineStyle: {
	                width: 12,
	                shadowBlur: 0,
	                color: [
	                    [0.4, '#41D753'],
	                    [0.6, '#FFB73A'],
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
	            value: "23",
	            name: '负债收入比',
	        }]
	    }]
	};
	//企业关联图配置
	var graphOption = {
	    tooltip: {
	    	show: false
	    },
	    animationDurationUpdate: 1500,
	    animationEasingUpdate: 'quinticInOut',
	    series : [{
            type: 'graph',
            layout: 'none',
            symbolSize: 50,
            roam: true,
            label: {
                normal: {
                    show: true
                }
            },
            edgeSymbol: ['circle', 'arrow'],
            edgeSymbolSize: [4, 10],
            edgeLabel: {
                normal: {
                    textStyle: {
                        fontSize: 20
                    }
                }
            },
            data: [{
                name: '江西济民可信药业有限公司',
                x: 300,
                y: 300,
                itemStyle: {
                	color: "#FD485E",
                },
                label: {
                	show: true,
                    formatter:function(params){
    					//return '{a|吉安市木林森光电有限公司}';
    					return '江西济民可信\n药业有限公司';
    				},
                },
                symbolSize: [76,76],
            },{
                name: '江西济民可信集团有限公司',
                x: 100,
                y: 350,
                itemStyle: {
                	color: "#3E63FC",
                },
                label: {
                	show: true,
                    formatter:function(params){
    					return '江西济民可信\n集团有限公司';
    				},
                },
                symbolSize: [49,49],
            },{
                name: '李义海',
                x: 70,
                y: 200,
                itemStyle: {
                	color: "#3E63FC",
                },
                symbolSize: [49,49],
            }],
            links: [{
                source: '江西济民可信集团有限公司',
                target: '江西济民可信药业有限公司',
                label: {
                    show: true,
                    formatter: "持股比例：54.17%",
                    fontSize: 14,
                },
                lineStyle: {
                	color: '#3E63FC'
                },
            },{
                source: '李义海',
                target: '江西济民可信药业有限公司',
                label: {
                    show: true,
                    formatter: "持股比例：45.83%",
                    fontSize: 14,
                },
                lineStyle: {
                	color: '#3E63FC'
                },
            }],
            lineStyle: {
                normal: {
                    opacity: 0.9,
                    width: 2,
                    curveness: 0
                }
            }
        }]
	};
	//企业风险配置
	var radarOption = {
	    tooltip: {
	    	confine: true,
	    },
	    radar: {
	        name: {
	            textStyle: {
	                color: '#fff',
	                backgroundColor: '#999',
	                borderRadius: 3,
	                padding: [3, 5]
	           }
	        },
	        axisLine: {
	        	lineStyle: {
	        		color: ['#FFF'],
	        		width: 1,
	        		opacity: 0.2,
	        	},
	        },
	        splitLine: {
	        	show: true,
	        	lineStyle: {
	        		color: ['#03E0C2'],
	        		width: 1,
	        		opacity: 0.2,
	        	},
	        },
	        splitArea: {
	        	show: true,
	        	areaStyle: {
	        		color: ['#989CB8'],
	        		opacity: 0,
	        	},
	        },
	        indicator: [
	           /* {name: '销售（sales）', max: 6500} */
	        ]
	    },
	    series: [{
	        name: '企业风险',
	        type: 'radar',
	        symbol: 'none',
	        lineStyle: {
	        	width: 1,
	        	color: '#FFC14A',
	        },
	        areaStyle: {
	        	color: '#FF9853',
	        	opacity: 0.4,
	        },
	        data : [
	            {
	                value : [],
	                name : '企业风险'
	            }
	        ]
	    }]
	};
</script>
</html>