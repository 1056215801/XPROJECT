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
<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">

<link href="${ctx}/static/js/plugins/video/video-js.css" rel="stylesheet">
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

	/*去除百度地图版权*/
	.anchorBL{
		display:none;
	}
	.BMap_cpyCtrl{
		display:none;
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
		<input type="hidden" id="companyId" value="" name="companyId">
		<div class="spanStyle" style="width: 28%;">
			<div class="blockStyle" style="height: 60%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar cp" onclick="checkRight('9','','index5_code2','企业统计')">
						<span class="tabCaption">企业统计</span>
					</div>
					<div class="tabContBar">
						<div class="qytj" onclick="checkRight('9','','index5_code2','企业统计')">
							<div class="qytj-item">
								<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg1.png">
								<div class="qytj-infor">
									<h1 class="yellowT" id="t1">0</h1>
									<p>企业总数（个）</p>
								</div>
							</div>
							<div class="qytj-item">
								<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg1.png">
								<div class="qytj-infor">
									<h1 class="yellowT" id="t2">0</h1>
									<p>规上企业（个）</p>
								</div>
							</div>
							<div class="qytj-item">
								<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg1.png">
								<div class="qytj-infor">
									<h1 class="yellowT" id="t3">0</h1>
									<p>上市企业（个）</p>
								</div>
							</div>
						</div>
						<div class="qytjs" style="padding-top: 10px;" onclick="checkRight('9','','index5_code2','企业统计')">
							<ul id="countList" class="count-list area-list target-list" style="padding-left: 20px; padding-right: 0; height: 100%;">
							</ul>
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
						<span class="tabCaption">企业入规统计</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="comFont1">2018</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="comUl1">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="tabContBar">
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
		</div>
		<div class="spanStyle" style="width: calc(44% - 10px);">
			<div class="blockStyle" style="height: 70%;">
				<div class="tabCaptionBar">
					<span class="tabCaption cp">
						<div id="companyTitleName" style="display: inline-block; vertical-align: middle;"></div>
						<!-- <i class="fa fa-caret-down"></i> -->
					</span>
				</div>
				<div class="tabContBar">
					<div  class="compManaDiv">
						<div class="inlineBox" style="height: 200px;">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="companyLogo">
									<i></i>
									<img id="logoUrl" src="${ctx}/static/image/cityDataCenter/ycFourth/notLogo.jpg">
								</div>
							</div>
						</div>
						<div class="inlineBox" style="height: 200px;">
							<div id="mapChart" style="height: 100%;"></div>
						</div>
					</div>
					<div class="indexDataBar">
						<div class="indexData">
							<div class="indexName">中国银行信用评级</div>
							<div class="indexValue yf">AAA</div>
						</div>
						<div class="indexData">
							<div class="indexName">园区综合评级</div>
							<div class="indexValue gf" style="font-size: 34px;">优秀</div>
						</div>
						<div class="indexData">
							<div class="indexName">工商信用评级</div>
							<div class="indexValue yf">AAA</div>
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
					<div class="videoBar" id="video">
						<!-- <iframe id="videoIframe" src="https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=ceb5e7d49e3846639a6bc6864e6c444e" frameborder="0" scrolling="auto" style="width:92%; height:100%; overflow:hidden; display: none;"></iframe> -->
						<img id="noRealTime" src="${ctx}/static/image/cityDataCenter/jxNew/comVideo1.gif" width="92%;" style="padding: 8px;">
					</div>
					<!-- <video id="myVideo" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" data-setup='{}' style='width: 100%;height: 100%;'>
			            <source id="source" src="http://testfile.inpark.com.cn:89/mag/hls/ceb5e7d49e3846639a6bc6864e6c444e/0/live.m3u8" type="application/x-mpegURL"></source>
			        </video> -->
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
		<div class="spanStyle" style="width: calc(28% - 10px)">
			<div class="blockStyle" id="prices" style="height: 55%;">
				<div class="outsideBox" style="border: none; padding: 0;">
					<%-- <img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png"> --%>
					<div class="tabCaptionBar">
						<span class="tabCaption" style="width: 64px;">企业列表</span>
						<span class="searchComName">
							<img src="${ctx}/static/image/cityDataCenter/ycFourth/search.png" onclick="searchComName()">
							<input id="searchInput" type="text" value="" placeholder=""/>
						</span>
						<div class="fr selects">
							<div class="select ruleSelect">
								<p><font id="region" data="">宜春市</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="regionUl">
									</ul>
								</div>
							</div>
							<div class="select ruleSelect">
								<p><font id="industry" data="">全部类型</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="industryUl">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="part-content reusltContent">
                 		<div class="tab company-list">
			   				<div class="table-title">
			   					<span class="dib">排序</span>
			   					<span class="dib">企业名称</span>
			   					<span class="dib">所属行业</span>
							</div>
							<div class="table-content">
								<table id="companyList" onmouseenter="loopPause()" onmouseleave="loopStart()">
									<!-- <tr>
										<td>1</td>
										<td>宜春XXXXXX责任有限公司</td>
										<td>化学制品制造业</td>
									</tr> -->
								</table>
							</div>
                 		</div>
	         		</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(45% - 10px)";>
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar cp" onclick="checkRight('19','','index5_code3','企业创新-创新平台')">
						<span class="tabCaption">企业创新信息</span>
					</div>
					<div class="tabContBar">
						<div class="wrapper xrgqy" style="height: calc(100% + 15px);">
							<ul class="firstUl">
								<li>
									<div class="middle-box" onclick="checkRight('19','','index5_code3','企业创新-创新平台')">
										<p>科创平台</p>
										<p><font class="yellowT" id="cx1">83</font>个</p>
									</div>
								</li>
								<li>
									<div class="middle-box" onclick="checkRight('20','','index5_code4','企业创新-驰名商标')">
										<p>驰名商标</p>
										<p><font class="yellowT" id="cx2">83</font>个</p>
									</div>
								</li>
								<li>
									<div class="middle-box" onclick="checkRight('21','','index5_code5','企业创新-院士工作站')">
										<p>院士工作站</p>
										<p><font class="yellowT" id="cx3">83</font>个</p>
									</div>
								</li>
								<li>
									<div class="middle-box" onclick="checkRight('22','','index5_code6','企业创新-专利')">
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
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script src="${ctx}/static/js/dataCenter/ycAnimate.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>

<script type="text/javascript" src="${ctx}/static/js/jquery.mousewheel.min.js"></script>
<script src="https://api.map.baidu.com/api?v=2.0&ak=2b82bdceb647d5f7819514f45c752413"></script>

<script src="${ctx}/static/js/plugins/video/video.js"></script>
<script src="${ctx}/static/js/plugins/video/videojs-contrib-hls.min.js"></script>
<script type="text/javascript">
var loop = '';
var num = 0;
var length = 0;
var h1 = 0;
	$(function(){
		//播放视频
		//var player = videojs('video-play');
		//player.play();
		var indexnum=0;
		$(".head>a:eq(5)").addClass("on");
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
		
		getselectComp();
		getCompanyList();
		getCompanyData1();
		
		//表格鼠标滚轮事件
		$("#companyList").on('mousewheel',function(event, delta){
			var dir = delta > 0 ? 'Up' : 'Down';
			if (dir == 'Up') {
				if(num > 0){
					num--;
					$("#companyList").stop().animate({top: "-"+h1*num+"px"});
					$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
				}
			} else {
				if(num < length){
					num++;
				} else {
					num = 1;
					$("#companyList").css({top: "0px"})
				}
				$("#companyList").stop().animate({top: "-"+h1*num+"px"});
				$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
			}
			$('#companyId').val($('#companyList tr.on').attr("val"));
			getCompanyData2();
		})
		
		var myVideo = videojs('myVideo', {
	        bigPlayButton: true,
	        textTrackDisplay: false,
	        posterImage: false,
	        errorDisplay: false,
	    })
	    myVideo.play()
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
			// $(this).parents('.select-items').slideToggle();
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
				// if($(this).text()=='2019'){
				// 	layer.msg('暂无数据',
				// 	{
				// 		offset:['80%','12%']
				// 	})
				// }else{
					$('#comFont1').text($(this).text());
					$('#comYear').val($(this).text());
					$('.wrapper li:eq(0)').addClass("on").siblings().removeClass("on");
					getNewCompany();
				// }
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
						{ name: '产业龙头企业', value: left.vlt},
						{ name: '两化融合', value: left.vlh},
						{ name: '专精特新', value: left.vzt},
						{ name: '高新企业', value: left.vgq},
						{ name: '产品数量', value: left.vcp},
					];
					for (var j = 0; j < d2.length; j++){
				    	var w = j==0 ? '40' : ((d2[j].value/d2[0].value)*40).toFixed(2);
						/* div2 += '<li>';
						div2 += '<p>'+d2[j].name+'</p>';
						div2 += '<span><div style="width: '+l+';"></div></span>';
						div2 += '<b>'+d2[j].value+'</b>';
						div2 += '</li>'; */
						div2 += '<div class="count-item">';
						div2 +=	'<font>'+d2[j].name+'</font>';
						div2 +=	'<span><div style="width: '+w+'%;"></div></span>';
						div2 +=	'<b>'+d2[j].value+'</b>';
						div2 += '</div>';
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
	
	function getselectComp(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/companyAreaAndIndustry",
			type : "post",
			data : {},
			success : function(result) {
				if (result.success) {
				    for(var i=0; i<result.areaList.length;i++){
				    	var list = result.areaList[i];
				    	$('#regionUl').append('<li data="'+list.areaId+'">'+list.areaName+'</li>');
				    }
					$('#industryUl').append('<li data="">全部类型</li>');
					for(var i=0; i<result.typeList.length;i++){
						var list = result.typeList[i];
				    	$('#industryUl').append('<li data="'+list.typeId+'">'+list.typeName+'</li>');
				    	
				    }
					$(".select li").on("click",function(){
						$(this).parents('.select-items').slideToggle();
						if($(this).parent().attr('id')=='regionUl'){
							if($(this).attr("data") == "360900"){
								$('#region').text($(this).text());
					 			$('#region').attr("data","");
							}else{
								$('#region').text($(this).text());
					 			$('#region').attr("data",$(this).attr("data"));
							}
				 			getCompanyList();
						} else if($(this).parent().attr('id')=='industryUl'){
							$('#industry').text($(this).text());
				 			$('#industry').attr("data",$(this).attr("data"));
				 			getCompanyList();
						} else{}
					})
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	function getCompanyList(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/industryCompanyList",
			type : "post",
			data : {
				"typeId" : $('#industry').attr("data"),
				"spaceId" : $("#region").attr("data"),
				"companyName" : $("#searchInput").val()
			},
			success : function(result) {
				if (result.success) {
					$('#companyList').empty();
				    var div = "";
				    if(result.companyList.length > 8){
				    	for (var j=0;j<2;j++){
				    		for (var i=0;i<result.companyList.length;i++){
								var info = result.companyList[i];
							    div += '<tr onclick="loopChoose(this)" val="'+info.companyId+'">';
							    div += '<td>'+(i+1)+'</td>';
							    div += '<td>'+info.companyName+'</td>';
							    div += '<td>'+info.typeName+'</td>';
							    div += '</tr>';
							}
					    }
				    }else{
				    	for (var i=0;i<result.companyList.length;i++){
							var info = result.companyList[i];
						    div += '<tr onclick="loopChoose(this)" val="'+info.companyId+'">';
						    div += '<td>'+(i+1)+'</td>';
						    div += '<td>'+info.companyName+'</td>';
						    div += '<td>'+info.typeName+'</td>';
						    div += '</tr>';
						}
				    }
					$('#companyList').html(div);
					$('#companyList tr:eq(0)').addClass("on");
					$('#companyId').val($('#companyList tr.on').attr("val"));
					getCompanyData2();
					
					h1 = $("#companyList tr").height();
					num = 0;
					length = result.companyList.length;
					if(loop != ''){
						loopPause();
						$("#companyList").animate({top: "-"+h1*num+"px"});
						$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
					}
					loopStart();
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//表格定时滚动
	function loopStart(){
		if(length > 8){
			loop = setInterval(function(){
				if(num < length){
					num++;
				} else {
					num = 1;
					$("#companyList").css({top: "0px"})
				}
				$("#companyList").animate({top: "-"+h1*num+"px"});
				$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
				$('#companyId').val($('#companyList tr.on').attr("val"));
				getCompanyData2();
			},10000)
		}
	}
	function loopPause(){
		clearInterval(loop);
	}
	function loopChoose(e){
		num = $(e).index();
		if(length > 8){
			if(num >= length){
				num = num - length;
				$("#companyList").css({top: "0px"})
			}
			$("#companyList").animate({top: "-"+h1*num+"px"});
		}
		$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
		$('#companyId').val($('#companyList tr.on').attr("val"));
		getCompanyData2();
	}
	//鼠标点击和键盘回车搜索操作
	function searchComName(){
		getCompanyList();
	}
	$("#searchInput").on('keypress',function(e) {  
        var keycode = e.keyCode;
        if(keycode=='13') {
            e.preventDefault();
            //请求搜索接口
            getCompanyList();
        }  
 	});
	function getCompanyData1(){
		$.ajax({
			url : '${ctx}/static/js/dataCenter/json/compPortMain.json',
			type : "get",
			data : {},
			dataType : "json",
			success : function(result) {
				if (result.success) {
					//企业关联图谱数据
					if(result.data.connDiagram != undefined){
						var div_ = document.getElementById("graphChart");
						div_.removeAttribute("_echarts_instance_");
						var graphChart = echarts.init(div_);
						//var graphChart = echarts.init(document.getElementById("graphChart"));
						graphChart.setOption(graphOption);
					}else{
						$("#graphChart").html("<font class=\"unData\">暂无数据</font>");
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
					}else{
						$("#logoUrl").attr("src","${ctx}/static/image/cityDataCenter/ycFourth/notLogo.jpg");
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
						$("#mapChart").html('<div style=\"width: 100%; height: 100%;\"><img src="${ctx}/static/image/cityDataCenter/ycFourth/notLonlat.jpg" width="100%" height="100%"></div>');
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	
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
                name: '宜春万申制药机械有限公司',
                x: 300,
                y: 300,
                itemStyle: {
                	color: "#FD485E",
                },
                label: {
                	show: true,
                    formatter:function(params){
    					//return '{a|吉安市木林森光电有限公司}';
    					return '宜春万申制药\n机械有限公司';
    				},
               		/* rich: {
               	        a: {
               	        	color: '#FFF',
               	         	width: '50',
               	         	align: 'center',
               	      		verticalAlign: 'center',
               	        }
               	    } */
                },
                symbolSize: [76,76],
            },{
                name: '胡政',
                x: 0,
                y: 200,
                itemStyle: {
                	color: "#3E63FC",
                },
                symbolSize: [49,49],
            },{
                name: '肖佳松',
                x: 50,
                y: 350,
                itemStyle: {
                	color: "#3E63FC",
                },
                symbolSize: [49,49],
            },{
                name: '贺兴源',
                x: 500,
                y: 180,
                itemStyle: {
                	color: "#3E63FC",
                },
                symbolSize: [49,49],
            },{
                name: '李静',
                x: 600,
                y: 400,
                itemStyle: {
                	color: "#3E63FC",
                },
                symbolSize: [49,49],
            }],
            links: [{
                source: '胡政',
                target: '宜春万申制药机械有限公司',
                label: {
                    show: true,
                    formatter: "投资",
                    fontSize: 14,
                },
                lineStyle: {
                	color: '#3E63FC'
                },
            },{
                source: '肖佳松',
                target: '宜春万申制药机械有限公司',
                label: {
                    show: true,
                    formatter: "投资",
                    fontSize: 14,
                },
                lineStyle: {
                	color: '#3E63FC'
                },
            },{
                source: '贺兴源',
                target: '宜春万申制药机械有限公司',
                label: {
                    show: true,
                    formatter: "投资",
                    fontSize: 14,
                },
                lineStyle: {
                	color: '#3E63FC'
                },
            },{
                source: '李静',
                target: '宜春万申制药机械有限公司',
                label: {
                    show: true,
                    formatter: "投资",
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
</script>
</html>
