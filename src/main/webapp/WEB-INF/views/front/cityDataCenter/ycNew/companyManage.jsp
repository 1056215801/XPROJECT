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
<link href="${ctx}/static/css/cityDataCenter/site.css" rel="stylesheet">
<%-- <link href="${ctx}/static/plugins/videojs/video-js.min.css" rel="stylesheet">
<script src="${ctx}/static/plugins/videojs/video.min.js"></script>
<script src="${ctx}/static/plugins/videojs/videojs-contrib-hls.min.js"></script> --%>
<title>宜春工业大数据企业管理</title>
<style>
#video-wrap{
	width: 65%;
    height: 100%;
    margin: auto 5%;
    /* margin-right: 9%; */
	box-sizing: border-box;
	margin-top: -53%;
	margin-bottom: 0px;
	top: 50%;
}
.videos .video{
	margin-bottom: 15%;
	z-index: 1000;
}
</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content p15 fz0">
		<input type="hidden" id="orgId" value="${orgId}" name="orgId">
		<input type="hidden" id="proYear" value="" name="proYear">
		<input type="hidden" id="proMonth" value="" name="proMonth">
		<input type="hidden" id="comYear" value="" name="comYear">
		<div class="eco-row qytj-row">
			<div class="eco-floor h60">
				<div class="boxStyleBg">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit">
						<span onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/9?orgId=3609009')">企业统计</span>
					</div>
					<div class="qytj" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/9?orgId=3609009')">
						<div class="qytj-item">
							<img src="${ctx}/static/image/cityDataCenter/ycNew2/statistic.png">
							<div class="qytj-infor">
								<h1 class="yellowT" id="t1">0</h1>
								<p>企业总数</p>
							</div>
						</div>
						<div class="qytj-item">
							<img src="${ctx}/static/image/cityDataCenter/ycNew2/statistic.png">
							<div class="qytj-infor">
								<h1 class="yellowT" id="t2">0</h1>
								<p>规上企业</p>
							</div>
						</div>
						<div class="qytj-item">
							<img src="${ctx}/static/image/cityDataCenter/ycNew2/statistic.png">
							<div class="qytj-infor">
								<h1 class="yellowT" id="t3">0</h1>
								<p>上市企业</p>
							</div>
						</div>
					</div>
					<div class="qytjs" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/9?orgId=3609009')">
						<ul id="countList">
						</ul>
					</div>
				</div>
			</div>
			<div class="eco-floor h40">
				<div class="boxStyleBg ruguiBox">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit">
						<span>新入规企业</span>
					</div>
					<div class="select-box">
						<div class="selects" >
							<div class="select">
								<p><font id="comFont1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="comUl1">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="xrgqy" id="xrgqy">
						<ul>
							<li class="on">
								<div class="middle-box">
									<p>年报新增</p>
									<p><font class="yellowT" id="xrg0">83</font>个</p>
								</div>
							</li>
							<li>
								<div class="middle-box">
									<p>月度新增</p>
									<p><font class="yellowT" id="xrg1">83</font>个</p>
								</div>
							</li>
							<li>
								<div class="middle-box">
									<p>年度新增</p>
									<p><font class="yellowT" id="xrg2">83</font>个</p>
								</div>
							</li>
							<li>
								<div class="middle-box">
									<p>净增</p>
									<p><font class="yellowT" id="xrg3">83</font>个</p>
								</div>
							</li>
						</ul>
						<div class="chart-xrgqy" id="rgqyBar1"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="eco-row qytj-row2">
			<div class="eco-floor">
				<div class="chart3" id="ycMap"></div>
			</div>
			<div class="eco-floor">
				<div class="boxStyleBg pr">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit" style="cursor: default;">
						<span>企业视频</span>
					</div>
					<div class="videoSearchBar initial">
						<div class="videoSearch">
							<input type="text" value="" placeholder="视频搜索">
							<img src="${ctx}/static/image/cityDataCenter/ycNew2/search.png" width="20">
						</div>
						<div class="videoCancel">取消</div>
						<div class="videoTip">视频搜索</div>
					</div>
					<div class="videos">
						<div class="video" id="video-wrap" style="overflow: hidden">
							<!-- <p id="comp-name">企业实时视频</p> -->
							<div class="video-show" id="video">
								<!-- testfile -->
							  <!-- <iframe id="videoIframe" src="https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=e39f4270900345d8a930cac6e99342b4" frameborder="0"  scrolling="auto" style="  width:106.5%; height:100%;overflow:hidden;"></iframe> -->    
							  <img id="noRealTime" src="${ctx}/static/image/cityDataCenter/jxNew/comVideo1.gif" width="92%;" style="padding: 8px;">
							</div>
						</div>
						<div class="video">
							<div class="swiper-container" id="swipe">
								<div class="swiper-wrapper">
								   <%--  <div class="swiper-slide" title ="宜春万申制药机械有限公司-水切割"  data-url = "https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=060e4af1f58a4065bae7b5a9fdc4063a"><!-- testfile -->
								    	<img src="${ctx}/static/image/cityDataCenter/ycNew2/1.jpg">
								    	<div class="cover-box"><img src="${ctx}/static/image/cityDataCenter/ycNew2/play.png"></div>
								    </div>
								    <div class="swiper-slide" title ="宜春万申制药机械有限公司-激光下料"  data-url = "https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=b53d5c11a47c4244b2925bc53f1fac26"><!-- testfile -->
								    	<img src="${ctx}/static/image/cityDataCenter/ycNew2/2.jpg">
								    	<div class="cover-box"><img src="${ctx}/static/image/cityDataCenter/ycNew2/play.png"></div>
								    </div>
								    <div class="swiper-slide" title ="宜春万申制药机械有限公司-精工区"  data-url = "https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=bdd12f729c344018a6fd3d76d0edc701"><!-- testfile -->
								    	<img src="${ctx}/static/image/cityDataCenter/ycNew2/3.jpg">
								    	<div class="cover-box"><img src="${ctx}/static/image/cityDataCenter/ycNew2/play.png"></div>
								    </div> --%>
								      
								    <div class="swiper-slide" title ="宜春万申制药机械有限公司"  data-url = "https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=ceb5e7d49e3846639a6bc6864e6c444e"><!-- testfile -->
								    	<img src="${ctx}/static/image/cityDataCenter/ycNew2/dd.jpg">
								    	<div class="cover-box"><img src="${ctx}/static/image/cityDataCenter/ycNew2/play.png"></div>
								      </div>
								    
								    <div class="swiper-slide" title ="远东福斯特新能源有限公司-1"  data-url = "https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=2c4b6de507c74b5fa127ccafd9ecd03a"><!-- testfile -->
								    	<img src="${ctx}/static/image/cityDataCenter/ycNew2/bb.jpg">
								    	<div class="cover-box"><img src="${ctx}/static/image/cityDataCenter/ycNew2/play.png"></div>
								    </div>
								    
								    <div class="swiper-slide" title ="远东福斯特新能源有限公司-2"  data-url = "https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=177c6649996b4ef28b72d724101dc479"><!-- testfile -->
								    	<img src="${ctx}/static/image/cityDataCenter/ycNew2/aa.jpg">
								    	<div class="cover-box"><img src="${ctx}/static/image/cityDataCenter/ycNew2/play.png"></div>
								    </div>
								    
								    <div class="swiper-slide" title ="江西融合科技有限责任公司"  data-url = "https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=e39f4270900345d8a930cac6e99342b4"><!-- testfile -->
								    	<img src="${ctx}/static/image/cityDataCenter/ycNew2/cc.jpg">
								    	<div class="cover-box"><img src="${ctx}/static/image/cityDataCenter/ycNew2/play.png"></div>
								    </div>
								     
								</div>
							</div>
						    <div class="swiper-button-prev"></div><!--左箭头-->
						    <div class="swiper-button-next"></div><!--右箭头-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="eco-row qytj-row">
			<div class="eco-floor h55" id="prices">
				<div class="boxStyleBg ">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="tab-links">
						<span class="on">产品价格</span>
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
							<div class="cpjg-bar">
								<span>产品名称</span>
								<span>单位</span>
								<span>平均价格(元)</span>
								<span>同比增减</span>
							</div>
							<div class="cpjg">
								<table id="product">
								</table>
							</div>
						</div>
						<div class="chart-cpjg" id="rgqyBar3"></div>
					</div>
				</div>
			</div>
			<div class="eco-floor h45">
				<div class="boxStyleBg rgqyBarBox">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/19?orgId=3609009')">
						<span>企业创新信息</span>
					</div>
					<div class="wrapper xrgqy" style="height: calc(100% + 15px);">
						<ul class="firstUl">
							<li>
								<div class="middle-box" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/19?orgId=3609009')">
									<p>科创平台</p>
									<p><font class="yellowT" id="cx1">83</font>个</p>
								</div>
							</li>
							<li>
								<div class="middle-box" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/20?orgId=3609009')">
									<p>驰名商标</p>
									<p><font class="yellowT" id="cx2">83</font>个</p>
								</div>
							</li>
							<li>
								<div class="middle-box" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/21?orgId=3609009')">
									<p>院士工作站</p>
									<p><font class="yellowT" id="cx3">83</font>个</p>
								</div>
							</li>
							<li>
								<div class="middle-box" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/22?orgId=3609009')">
									<p>专利</p>
									<p><font class="yellowT" id="cx4">7398</font>个</p>
								</div>
							</li>
						</ul>
					    <div class="tagcloud" id="products">
					      <!-- bo大小 co颜色 -->
					      <a class="b01 co01" href="#">
					      	<div class="middle-box">
					      		<img src="${ctx}/static/image/cityDataCenter/ycNew2/tech1.png">
					      		<p>江西省竹材深加工工程研究中心</p>
					      	</div>
					      </a>
						</div>
						<div class="kc-select">
							<ul>
								<li class="on">
									<div>
										<p>区县分布</p>
									</div>
								</li>
								<li>
									<div>
										<p>平台类型分布</p>
									</div>
								</li>
								</ul>
							</div>
						<div class="chart-cx" id="rgqyBar2"></div>
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
<script src="${ctx}/static/js/dataCenter/ycAnimate.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
	$(function(){
		//播放视频
		//var player = videojs('video-play');
		//player.play();
		var indexnum=0;
		$(".head>a:eq(4)").addClass("on");
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		});
		//视频轮播图
		var mySwiper = new Swiper('#swipe', {
			direction : 'vertical',
			slidesPerView : 3,
			slidesPerGroup : 1,
			spaceBetween : 10,
			navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    }
		})
		$("#xrgqy li").on("mouseenter",function(){
			var ind = $(this).index();
			var type = ind == 0 ? 'yearReportAdd' : ind == 1 ? 'monthAdd' : ind == 2 ? 'yearAdd' : 'yearAllAdd';
			var list = xrgCompany[type].value;
			var x = [],d1 = [];
			for(var i=0;i<list.length;i++){
				x.push(list[i].name);
				d1.push(list[i].value);
			}
			companyBar(x,d1,1);
			$(this).addClass("on").siblings().removeClass("on");
		})
		$(".wrapper .firstUl li").on("mouseenter",function(){
			var ind = $(this).index();
			if(ind < 3){
				// var type = ind == 0 ? 'science' : ind == 1 ? 'trademark' : 'academician';
				if(ind==0){
					var list = cxCompany.project.project;
				}else if (ind==1) {
					var list = cxCompany.trademark.trademark;
				}else{
					var list = cxCompany.academician.academician
				}
				var x = [],d1 = [];
				var data=[];
				if(ind==0){
					$(".kc-select").show();
					if(indexnum==0){
						for(var i=0;i<list.seriesX.length;i++){
							x.push(list.seriesX[i].name);
							d1.push(list.seriesX[i].value);
						}
						companyBar_new(x,d1,2);
					}else{
						for(var i=0;i<list.seriesY.length;i++){
							data.push(list.seriesY[i]);
						}
						companyPie(data);
					}
				}else{
					$(".kc-select").hide();
					for(var i=0;i<list.length;i++){
						x.push(list[i].name);
						d1.push(list[i].value);
					}
					companyBar(x,d1,2);
				}
				
			} else {
				$(".kc-select").hide();
				var data=[];
				var list = cxCompany.patent.patent;
				for(var i=0;i<list.length;i++){
					data.push(list[i]);
				}
				companyPie(data);
			}
			$("#rgqyBar2").stop().fadeIn("fast");
		})
		$(".wrapper").on("mouseleave",function(){
			$("#rgqyBar2").fadeOut("fast");
		 	$(".kc-select").hide();
		})
		$(".kc-select li").on("click",function(){
			var ind = $(this).index();
			// var list = cxCompany['science'].value;
			var list = cxCompany.project.project;
			var x = [],d1 = [];
			var data=[];
			if(ind==0){
				indexnum=0;
				for(var i=0;i<list.seriesX.length;i++){
					x.push(list.seriesX[i].name);
					d1.push(list.seriesX[i].value);
				}
				companyBar_new(x,d1,2);
			}else{
				indexnum=1;
				for(var i=0;i<list.seriesY.length;i++){
					data.push(list.seriesY[i]);
				}
				companyPie(data);
			}
			$("#rgqyBar2").stop().fadeIn("fast");
			$(this).addClass("on").siblings().removeClass("on");
		});
		getselectYear();//年份筛选
		getYcMap(); //宜春地图
		getChartData();//企业统计
		getMapData();//热点分布图
		getTableData();//产品价格
		getNewCompany();//新入规企业
		getCompanyInfor();//企业创新信息
		getCompanyPop();//企业创新信息泡泡数据
		$(".swiper-slide").on("click",function(){
			//player.pause();
			//player.src({src: $(this).attr("data-url"), type: "application/x-mpegURL"});
			//player.play();
			document.getElementById("videoIframe").src = $(this).attr("data-url") ;
		});
		
		var flag = true;
		$(".videoSearchBar .videoSearch img").on("click",function(){
			if(flag){
				if($(".videoSearchBar").hasClass("initial")){
					flag = false;
					$(".videoSearchBar").removeClass("initial");
					$(".videoTip").hide();
				}else{
					flag = true;
					$(".videoSearchBar").addClass("initial");
					setTimeout(function(){
						$(".videoTip").show();
					},300)
				}
			}else{
				var key = $(".videoSearchBar .videoSearch input").val();
				var num = $("#swipe .swiper-wrapper .swiper-slide").length;
				$("#swipe .swiper-wrapper .swiper-slide").removeClass("disNo");
				for(var i=0;i<num;i++){
					var str = $("#swipe .swiper-wrapper .swiper-slide:nth-child("+(i+1)+")").attr("title")
					if(str.indexOf(key) == -1){
						$("#swipe .swiper-wrapper .swiper-slide:nth-child("+(i+1)+")").addClass("disNo")
					}
				}
			}
		});
		$(".videoSearchBar .videoCancel").on("click",function(){
			flag = true;
			$(".videoSearchBar").addClass("initial");
			setTimeout(function(){
				$(".videoTip").show();
			},300)
		});
		$(".videoSearchBar .videoTip").on("click",function(){
			flag = false;
			$(".videoSearchBar").removeClass("initial");
			$(".videoTip").hide();
		});
	});
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>2014;i--){
	    	$('#eightUl1').append('<li>'+i+'</li>');
	    	if(i > 2016){
	    		$('#comUl1').append('<li>'+i+'</li>');
	    	}
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='eightUl1'){
				$('#eightFont1').text($(this).text());
	 			$('#proYear').val($(this).text());
	 			getTableData();
			} else if($(this).parent().attr('id')=='eightUl2'){
	  			$('#eightFont2').text($(this).text());
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'))
				$('#proMonth').val(month);
				$('#xrgqy li:eq(0)').addClass("on").siblings().removeClass("on");
				getTableData();
			} else if($(this).parent().attr('id')=='comUl1'){
				$('#comFont1').text($(this).text());
	 			$('#comYear').val($(this).text());
				$('.wrapper li:eq(0)').addClass("on").siblings().removeClass("on");
	 			getNewCompany();
			}
		})
	}
	//宜春地图
	function getYcMap(data){
	    var data = data;
		$.get('${ctx}/static/map/360900.json', function (chinaJson) {
		    echarts.registerMap('yc', chinaJson);
			ycHotMap(data);
		});
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
					var div2 = '';
					$("#t1").text(left.total);
					$("#t2").text(left.vgs);
					$("#t3").text(left.vss);
					var d2 = [
						{ name: '重点企业', value: left.vzd},
						{ name: '龙头企业', value: left.vlt},
						{ name: '两化融合', value: left.vlh},
						{ name: '专精特新', value: left.vzt},
						{ name: '高新企业', value: left.vgq},
						{ name: '产品数量', value: left.vcp},
					];
					for (var j = 0; j < d2.length; j++){
						var l = (d2[j].value/left.total).toFixed(2)*100 + '%' ;
						div2 += '<li>';
						div2 += '<p>'+d2[j].name+'</p>';
						div2 += '<span><div style="width: '+l+';"></div></span>';
						div2 += '<b>'+d2[j].value+'</b>';
						div2 += '</li>';
					};
					$("#countList").html(div2);
					//getYcMap(result.value.value1);
				}
			},
			error : function(e) {
				alert(e)
			}
		});
	};
	function getMapData(){
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
						list[j].value = list[j].TOTAL;
						for(var i = 0; i < yc3.length; i++){
							if(list[j].SPACEID == yc3[i].name){
								yc3[i].value[2] = list[j].TOTAL;
							}
						}
					}
					$.get('${ctx}/static/map/360900.json', function (chinaJson) {
					    echarts.registerMap('yichun', chinaJson);
					    getYcMap(list);
					});
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	}
	//获取产品价格
	function getTableData(){
		var y = $('#proYear').val() == '' ? undefined : $('#proYear').val();
		var m = $('#proMonth').val() == '' ? undefined : $('#proMonth').val();
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/dataProductPrice/dataYCProductPriceList",
			type : "post",
		 	async: false,
			data : {
				"year": y,
				"month": m
			},
			dataType : "json",
			success : function(result){
				console.log(result)
				if(result.success){
					$('#proYear').val(result.year);
		 			$('#eightFont1').text(result.year);
					$('#proMonth').val(result.month);
					$('#eightFont2').text(result.month+"月");
					var left = result.value;
					var div2 = '';
					for(var i=0;i<2;i++){
						for (var j = 0; j < left.length; j++){
							var rate = left[j].GROWTH_RATE ? left[j].GROWTH_RATE : '/';
							var price = left[j].SALE_PRICE ? left[j].SALE_PRICE : '/';
							var unit = left[j].PRODUCT_UNIT ? left[j].PRODUCT_UNIT : '/';
							div2 += '<tr data="'+left[j].ID+'">';
							div2 += '<td>'+left[j].PRODUCT_NAME+'</td>';
							div2 += '<td>'+unit+'</td>';
							div2 += '<td>'+price+'</td>';
							div2 += '<td>'+rate+'</td>';
							div2 += '</tr>';
						};
					}
					$("#product").html(div2);
					$("#product tr").on("mouseenter",function(){
						var id = $(this).attr('data');
						$(this).addClass("on").siblings().removeClass("on");
						$("#product").addClass("stop");
						$("#rgqyBar3").fadeIn('fast');
						getPrice(id);
					})
					$("#prices").on("mouseleave",function(){
						$("#product tr").removeClass("on");
						$("#product").removeClass("stop");
						$("#rgqyBar3").fadeOut('fast');
					})
				}
			},
			error : function(e) {
				alert(e)
			}
		});
	};
	//获取价格行情
	function getPrice(id){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/dataProductPrice/dataYCProductPriceMonthList",
			type : "post",
		 	async: false,
			data : {
				"productId": id,
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					var x = [],d1 = [];
					for(var i=0;i<result.value.length;i++){
						x.push(result.value[i].YEAR);
						d1.push(result.value[i].SALE_PRICE);
					}
					companyBar(x,d1,3);
				}
			},
			error : function(e) {
				alert(e)
			}
		});
	};
	//获取新入规企业
	var xrgCompany = '';
	function getNewCompany(){
		var y = $('#comYear').val() == '' ? undefined : $('#comYear').val();
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getCompanyNewScale/ycsBigData",
			type : "post",
		 	async: false,
			data : {
				"year": y,
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					xrgCompany = result.value;
					$("#xrg0").text(result.value.yearReportAdd.total);
					$("#xrg1").text(result.value.monthAdd.total);
					$("#xrg2").text(result.value.yearAdd.total);
					$("#xrg3").text(result.value.yearAllAdd.total);
					var x = [],d1 = [];
					for(var i=0;i<result.value.yearReportAdd.value.length;i++){
						x.push(result.value.yearReportAdd.value[i].name);
						d1.push(result.value.yearReportAdd.value[i].value);
					}
					companyBar(x,d1,1);
				}
			},
			error : function(e) {
				alert(e)
			}
		});
	};
	//获取企业创新信息
	var cxCompany = '';
	function getCompanyInfor(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/project/summary/data",
			type : "post",
		 	async: false,
			data : {
				// 'level':1
			},
			dataType : "json",
			success : function(result){
				$("#cx1").text(result.project.total);
				$("#cx2").text(result.trademark.total);
				$("#cx3").text(result.academician.total);
				$("#cx4").text(result.patent.total);
				cxCompany = result;
			},
			error : function(e) {
				alert(e)
			}
		});
	};
	//获取企业创新信息泡泡列表
	function getCompanyPop(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/getCompanyInnovateMaopao/ycsBigData",
			type : "post",
		 	async: false,
			data : {},
			dataType : "json",
			success : function(result){
				if(result.success){
					var div = '';
					for(var i=0;i<10;i++){
						div += '<a class="b01 co01" href="#">';
						div += '<div class="middle-box">';
						div += '<img src="${ctx}/static/image/cityDataCenter/ycNew2/tech3.png">';
						div += '<p>'+result.value.science[i].name+'</p>';
						div += '</div>';
						div += '</a>';
					}
					for(var j=0;j<10;j++){
						div += '<a class="b02 co02" href="#">';
						div += '<div class="middle-box">';
						div += '<img src="${ctx}/static/image/cityDataCenter/ycNew2/tech4.png">';
						div += '<p>'+result.value.trademark[j].name+'</p>';
						div += '</div>';
						div += '</a>';
					}
					for(var n=0;n<10;n++){
						div += '<a class="b02 co04" href="#">';
						div += '<div class="middle-box">';
						div += '<img src="${ctx}/static/image/cityDataCenter/ycNew2/tech2.png">';
						div += '<p>'+result.value.academician[n].name+'院士</p>';
						div += '</div>';
						div += '</a>';
					}
					$("#products").html(div);
					animat();
				}
			},
			error : function(e) {
				alert(e)
			}
		});
	};
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
	websocket.onerror = function (event) {
	    // alert("WebSocket连接发生错误" );
	     console.error("WebSocket连接发生错误:", event);
	};
	
	//连接成功建立的回调方法
	websocket.onopen = function () {
		//alert("WebSocket连接成功");
	}
	
	//接收到消息的回调方法
	websocket.onmessage = function (event) {
	    var json=JSON.parse(event.data); 
	  //  alert(json.data);
	  //  getElectric();
	}
	
	//连接关闭的回调方法
	websocket.onclose = function () {
	//	alert("WebSocket连接关闭");
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
