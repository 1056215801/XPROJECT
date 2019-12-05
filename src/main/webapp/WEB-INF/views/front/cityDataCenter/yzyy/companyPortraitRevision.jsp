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
<title>袁州医药园智慧园区大数据平台企业画像</title>
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
	
	#swiperChirld .swiper-slide {text-align: center;}
	#swiperChirld .swiper-slide img {width: 100%;}
	
	.gray-bg {
		background: url(${ctx}/static/image/cityDataCenter/yzyy/bg2.png) no-repeat center;
		-webkit-background-size: cover;
		background-size: cover;
	}
	
	/* 风险指数-信用等级 */
	.creditGrade {
		position: absolute; 
		right: 10px; 
		top: 0px; 
		color: #03E0C2; 
		font-size: 16px; 
		font-weight: bold; 
		cursor: default;
	}
	/* 企业关联图-更多 */
	.moreDiagram {
		display: none;
		position: absolute; 
		right: 10px; 
		top: 0px; 
		color: #00D9FF; 
		font-size: 14px; 
		font-weight: bold;
		cursor: pointer;
	}
	.comPower {
		width: 97%;
		height: 16.66%;
		cursor: pointer;
	}
	
	.video-js .vjs-tech {position: relative !important;}
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
						<span class="tabCaption" style="cursor: pointer;" onclick="goindex(9)">
							经济运行总览
						</span>
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
								<div class="ringItem">
									<img src="${ctx}/static/image/cityDataCenter/jxNew/ringOrange.png">
									<div class="ringMiddle">
										<div class="ringValue" id="cyry-value">120</div>
										<div class="ringUnit" id="cyry-unit">人</div>
									</div>
									<p id="cyry-name">从业人员</p>
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
						<span class="tabCaption" style="cursor: pointer;" onclick="goindex(9)">企业单位生产总值能耗情况</span>
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
						<span class="tabCaption" style="cursor: pointer;" onclick="goindex(9)">全员劳动生产率</span>
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
					<span class="tabCaption" style="width: calc(100% - 147px); cursor: pointer;" onclick="choiceCompany()">
						<div id="companyTitleName" style="display: inline-block; vertical-align: middle;"></div>
						<i class="fa fa-caret-down"></i>
					</span>
					<div class="fr selects" style="cursor: pointer;">
						<div class="select" onclick="getCompanyReport()">
							<img src="${ctx}/static/image/cityDataCenter/xyjc.png" width="16">
							<span>企业信用决策报告</span>
						</div>
					</div>
				</div>
				<div class="tabContBar">
					<div style="padding: 10px 30px;">
						<div class="inlineBox logoBox">
							<div class="outsideBox" onclick="companyGSInfo()" style="cursor: pointer;">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="companyLogo">
									<i></i>
									<img id="logoUrl" src="${ctx}/static/image/cityDataCenter/jxNew/default.png">
									<div class="shade"></div>
								</div>
								<div class="gsSign"><img src="${ctx}/static/image/cityDataCenter/gsxx.png"></div>
							</div>
						</div>
						<div class="inlineBox mapBox">
							<div id="mapChart" style="height: 100%;"></div>
						</div>
					</div>
					<div class="indexDataBar">
						<i></i>
						<div class="verCenter">
							<div class="ringItem" style="width: 25%;">
								<img id="ssqy" src="${ctx}/static/image/cityDataCenter/ssqy.png" width="120" style="opacity: 0.3;">
							</div>
							<div class="ringItem" style="width: 25%;">
								<img id="lhrh" src="${ctx}/static/image/cityDataCenter/lhrh.png" width="120" style="opacity: 0.3;">
							</div>
							<div class="ringItem" style="width: 25%;">
								<img id="gxjs" src="${ctx}/static/image/cityDataCenter/gxjs.png" width="120" style="opacity: 0.3;">
							</div>
							<div class="ringItem" style="width: 25%;">
								<img id="zjtx" src="${ctx}/static/image/cityDataCenter/zjtx.png" width="120" style="opacity: 0.3;">
							</div>
						</div>
					</div>
					<div class="businessInfoBar">
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">企业税务信用</div>
										<div class="businessValue" id="qyswxy">A</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">进出口信用</div>
										<div class="businessValue" id="jckxy">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">对外投资</div>
										<div class="businessValue" id="dwtz">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">控股企业</div>
										<div class="businessValue" id="jdkgqy">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">行政许可</div>
										<div class="businessValue" id="xzxk">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">法律诉讼</div>
										<div class="businessValue" id="flss">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">招标股</div>
										<div class="businessValue" id="zbg">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">融资信息</div>
										<div class="businessValue" id="rzxx">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">地块公示</div>
										<div class="businessValue" id="dkgs">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">购地信息</div>
										<div class="businessValue" id="gdxx">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">土地转让</div>
										<div class="businessValue" id="tdzr">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">抽查检查</div>
										<div class="businessValue" id="ccjc">0</div>
									</div>
								</div>
							</div>
						</div>
						<%-- <div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">债券信息</div>
										<div class="businessValue" id="zqxx">0</div>
									</div>
								</div>
							</div>
						</div> --%>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="companyJYInfo(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">新闻舆情</div>
										<div class="businessValue" id="xwyq">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="getqynb(this)">
									<i></i>
									<div class="verCenter">
										<div class="businessName">企业年报</div>
										<div class="businessValue" id="qynb">0</div>
									</div>
								</div>
							</div>
						</div>
						<div class="businessInfo">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="businessBox" onclick="getMoreInfo()">
									<i></i>
									<div class="verCenter">
										<div class="businessMore">更多 ></div>
									</div>
								</div>
							</div>
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
							<span class="tabCaption unScreen" data="3">
								<span class="on">企业产品</span>
								<span>用工招聘</span>
							</span>
						</div>
						<div class="tabContBar">
							<div class="tabCont" id="tab-3-1">
								<div class="swiper-container loop-swiper" id="swiper" style="display:block;height: 100%;">
									<div class="swiper-wrapper" id="swiperChirld"></div>
								</div>
							</div>
							<div class="tabCont" id="tab-3-2">
								<div class="recruit">
									<div class="recruit-box">
										<ul id="recruit">
										</ul>
									</div>
								</div>
							</div>
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
						<span class="tabCaption"style="cursor: pointer;" onclick="goindex(11)">风险指数</span>
						<!-- <span class="creditGrade" title="">A 级 (守信企业)</span> -->
					</div>
					<div class="tabContBar">
						<div id="radarChart" style="height: 100%; padding-top: 10px;"></div>
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
						<span class="tabCaption">企业关联图谱</span>
						<span class="moreDiagram" onclick="openCompanyGLInfo()">更多</span>
					</div>
					<div class="tabContBar">
						<div id="graphChart" style="height: 100%;"></div>
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
						<span class="tabCaption"style="cursor: pointer;" onclick="goindex(10)">企业知识产权</span>
					</div> 
					<div class="tabContBar">
						<div id="comPower" class="comPowerBar" style="margin-top: 7px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="companyGSInfo" class="infoBox gs"></div>
	<div id="companyJYInfo" class="infoBox jy"></div>
	<div id="companyFXInfo" class="infoBox fx"></div>
	<div id="companyGLInfo" class="infoBox gl"></div>
	<div id="companyCQInfo" class="infoBox jy"></div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="https://api.map.baidu.com/api?v=2.0&ak=2b82bdceb647d5f7819514f45c752413"></script>

<script src="${ctx}/static/js/plugins/video/video.js"></script>
<script src="${ctx}/static/js/plugins/video/videojs-contrib-hls.min.js"></script>
<script type="text/javascript">
	var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	$(function(){
		$(".head .tab>a:eq(4)").addClass("on");
		//切换框
		$(".tabCaption span").on("click", function() {
			var ind = $(this).index() + 1;
			var val = $(this).parent().attr('data');
			$(this).addClass("on").siblings().removeClass("on");
			$("#tab-" + val + "-" + ind).siblings().fadeOut("fast");
			setTimeout(function() {
				$("#tab-" + val + "-" + ind).fadeIn("fast");
			}, 200)
		});
		
		$(".businessInfoBar .businessInfo .businessBox").on("click", function() {
			$(".businessInfoBar .businessInfo .businessBox").removeClass("on");
			$(this).addClass("on");
		});
		
		getselectYear();//设置年份
		getCompanyData1();
		getCompanyTag();//获取企业标签
		getCompanyManage();//获取企业经营数据
		getCompanyDiagram();//获取企业关联图谱数据
		getCompanyRisk();//获取风险指数数据
		getCompanyData2();
		getComPowerInfo();//获取企业知识产权数据
		getRecruitInfo();
		
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
			content: '${ctx}/front/page/companyInfo/frame?parkId=32914188&index=8&treeType=park' //iframe的url
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
				"companyId" : $('#companyId').val(),
				"year" : year
			},
			success : function(result){
				if(result.success){
					//初始化年份
					if(year == ""){
						$('#jjyxYear').text(result.year);
						$('#nhqkYear').text(result.year);
						$('#sclYear').text(result.year);
					}
					if(type == 1){
						$('#jjyxYear').text(result.year);
					}else if(type == 2){
						$('#nhqkYear').text(result.year);
					}else if(type == 3){
						$('#sclYear').text(result.year);
					}else{}
					
					//企业单位生产总值能耗情况数据
					if(type == 2 || type =="" || type == undefined){
						if(result.xAxis1.length != "" && result.xAxis1.length != undefined){
							var array = [];
							array.push(result.series1[2]);
							array.push(result.series1[5]);
							array.push(result.series1[8]);
							array.push(result.series1[11]);
							
							var div_ = document.getElementById("chart1");
							div_.removeAttribute("_echarts_instance_");
							var orangeLineChart = echarts.init(div_);
							//var orangeLineChart = echarts.init(document.getElementById("chart1"));
							//orangeLineOption.xAxis.data = result.xAxis1;
							//orangeLineOption.series[0].data = result.series1;
							orangeLineOption.series[0].data = array;
							orangeLineChart.setOption(orangeLineOption);
						}else{
							$("#chart1").html("<font class=\"unData\">暂无数据</font>");
						}
					}
					
					//全员劳动生产率
					if(type == 3 || type =="" || type == undefined){
						if(result.xAxis2.length != "" && result.xAxis2.length != undefined){
							var array = [];
							array.push(result.series2[2]);
							array.push(result.series2[5]);
							array.push(result.series2[8]);
							array.push(result.series2[11]);
							
							var div_ = document.getElementById("chart2");
							div_.removeAttribute("_echarts_instance_");
							var blueLineChart = echarts.init(div_);
							//var blueLineChart = echarts.init(document.getElementById("chart2"));
							//barOption.legend.data = result.xAxis2;
							//barOption.series[0].name = "全员劳动生产率";
							//barOption.series[0].data = result.series2
							blueBarOption.series[0].data = array;
							blueLineChart.setOption(blueBarOption);
						}else{
							$("#chart2").html("<font class=\"unData\">暂无数据</font>");
						}
					}
					//经济运行总揽
					if(type == 1 || type =="" || type == undefined){
						if(result.data1 != "" && result.data1 != undefined){
							$("#cyry-value").text(result.data1.PJCYRY_VALUE);
							$("#zyywsr-value").text(result.data1.ZYYWSR_VALUE);
							$("#nsze-value").text(result.data1.SJ_VALUE);
							$("#lrl-value").text(result.data1.LR_VALUE);
						}
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//获取企业信息决策报告
	function getCompanyReport(){
		$.ajax({
			url : "${ctx}/interface/json/companyDetail/reportPreview/"+$('#companyId').val(),
			type : "get",
			data : {},
			success : function(result) {
				if (result.Success) {
					window.open(result.Data.Uri);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//获取企业标签
	function getCompanyTag(){
		$.ajax({
			url : '${OfficeUrl}XOffice/interface/json/officeCompanyInfo/detail',
			type : "post",
			data : {
				"companyId" : $('#companyId').val()
			},
			success : function(result){
				if(result.success){
					var tag = result.extendInfo;
					//上市企业
					if(tag.quotedCompany == 1){
						$("#ssqy").css("opacity","1");
					}else{
						$("#ssqy").css("opacity","0.3");
					}
					//两化融合
					if(tag.twoIntegration == 1){
						$("#lhrh").css("opacity","1");
					}else{
						$("#lhrh").css("opacity","0.3");
					}
					//高新技术
					if(tag.highTechnology == 1){
						$("#gxjs").css("opacity","1");
					}else{
						$("#gxjs").css("opacity","0.3");
					}
					//专精特新
					if(tag.masteryEnterprise == 1){
						$("#zjtx").css("opacity","1");
					}else{
						$("#zjtx").css("opacity","0.3");
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//获取企业经营数据
	function getCompanyManage(){
		$.ajax({
			url : "${ctx}/interface/json/companyDetail/first",
			type : "post",
			data : {
				"companyId" : $('#companyId').val()
			},
			success : function(result){
				console.log(result)
				if(result.success){
					if(result.data != "" && result.data != undefined){
						$("#qyswxy").text(result.data['企业税务信用']);
						$("#jckxy").text(result.data['进出口信用']);
						$("#dwtz").text(result.data['对外投资']);
						$("#jdkgqy").text(result.data['控股企业']);
						$("#xzxk").text(result.data['行政许可']);
						$("#flss").text(result.data['法律诉讼']);
						$("#zbg").text(result.data['招标股']);
						$("#rzxx").text(result.data['融资信息']);
						$("#dkgs").text(result.data['地块公示']);
						$("#gdxx").text(result.data['购地信息']);
						$("#tdzr").text(result.data['土地转让']);
						$("#ccjc").text(result.data['抽查检查']);
						//$("#zqxx").text(result.data['债券信息']);
						$("#xwyq").text(result.data['新闻舆情']);
						$("#qynb").text(result.data['企业年报']);
						
						var arr1 = [['企业税务信用','qyswxy'],['进出口信用','jckxy'],['对外投资','dwtz'],['控股企业','kgqy'],['行政许可','xzxk'],['法律诉讼','flss'],['招标股','ztb'],['融资信息','rzxx'],['地块公示','dkgs'],['购地信息','gdxx'],['土地转让','tdzr'],['抽查检查','ccjc'],['新闻舆情','xwyq'],['企业年报','qynb']];
						var arr2 = [result.data['企业税务信用'],result.data['进出口信用'],result.data['对外投资'],
									result.data['控股企业'],result.data['行政许可'],result.data['法律诉讼'],
									result.data['招标股'],result.data['融资信息'],result.data['地块公示'],
									result.data['购地信息'],result.data['土地转让'],result.data['抽查检查'],
									result.data['新闻舆情'],result.data['企业年报']];
						for(var a in arr1){
							if(arr2[a] != "0" && arr2[a] != "" && arr2[a] != undefined){
								
							}else{
								$("#"+arr1[a][1]).parent().parent().parent().parent().css("display","none")
							}
						}
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//企业经营信息
	function companyJYInfo(e){
		var jyName = $(e).find(".businessName").text();
		var jyNameId = $(e).find(".businessValue").attr("id");
		var jyValue = $(e).find(".businessValue").text();
		$.ajax({
			url : "${ctx}/interface/json/companyDetail/second",
			type : "post",
			data : {
				"companyId" : $('#companyId').val(),
				"kind" : jyName
			},
			success : function(result){
				if(result.success){
					if(jyName=='企业税务信用'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">企业税务信用</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>评价年度</td>";
						div += "			<td>纳税人识别号</td>";
						div += "			<td>纳税信用等级</td>";
						div += "			<td>评价单位</td>";
						div += "			<td>是否正常纳税</td>";
						div += "			<td>是否欠税</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.企业税务信用 != "" && result.data.企业税务信用 != undefined) {
							for (var i = 0; i < result.data.企业税务信用.length; i++) {
								var info = result.data.企业税务信用[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.评价年度) + "</td>";
								div += "		<td>" + nvlStr(info.纳税人识别号) + "</td>";
								div += "		<td>" + nvlStr(info.纳税信用等级) + "</td>";
								div += "		<td>" + nvlStr(info.评价单位) + "</td>";
								div += "		<td>" + nvlStr(info.是否正常纳税) + "</td>";
								div += "		<td>" + nvlStr(info.是否欠税) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"7\">暂无企业税务信用信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='进出口信用'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">进出口信用</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>注册海关</td>";
						div += "			<td>经营类别</td>";
						div += "			<td>注册日期</td>";
						div += "			<td>信用等级</td>";
						div += "			<td>认定日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.进出口信用 != "" && result.data.进出口信用 != undefined) {
							for (var i = 0; i < result.data.进出口信用.length; i++) {
								var info = result.data.进出口信用[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.注册海关) + "</td>";
								div += "		<td>" + nvlStr(info.经营类别) + "</td>";
								div += "		<td>" + nvlStr(info.注册日期) + "</td>";
								div += "		<td>" + nvlStr(info.信用等级) + "</td>";
								div += "		<td>" + nvlStr(info.认定日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"6\">暂无进出口信用信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='对外投资'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">对外投资</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>被投资企业名称</td>";
						div += "			<td>被投资法定代表人</td>";
						div += "			<td>注册资本</td>";
						div += "			<td>出资比例</td>";
						div += "			<td>成立日期</td>";
						div += "			<td>状态</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.对外投资 != "" && result.data.对外投资 != undefined) {
							for (var i = 0; i < result.data.对外投资.length; i++) {
								var info = result.data.对外投资[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.被投资企业名称) + "</td>";
								div += "		<td>" + nvlStr(info.被投资法定代表人) + "</td>";
								div += "		<td>" + nvlStr(info.注册资本) + "</td>";
								div += "		<td>" + nvlStr(info.出资比例) + "</td>";
								div += "		<td>" + nvlStr(info.成立日期) + "</td>";
								div += "		<td>" + nvlStr(info.状态) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"7\">暂无对外投资信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='控股企业'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">控股企业</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>控股企业名称</td>";
						div += "			<td>投资比例</td>";
						div += "			<td>投资链</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.控股企业 != "" && result.data.控股企业 != undefined) {
							for (var i = 0; i < result.data.控股企业.length; i++) {
								var info = result.data.控股企业[i];
								var tzl=JSON.parse(nvlStr(info.投资链));
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.控股企业名称) + "</td>";
								div += "		<td>" + nvlStr(info.投资比例) + "</td>";
								div += "		<td style='text-align: left;padding: 21px 10px;'>"
								div += "		<p>占比约" + nvlStr(info.投资比例) + "</p>";
								div += "		<p>";
								div +="			<span>" + $("#companyTitleName").text() + "</span>";
								for(var m=0;m<tzl[0].length;m++){
									div +="			<span class='percentTotal'>" + tzl[0][m].PercentTotal + "</span>";
									div +="			<span>" + tzl[0][m].Name + "</span>";
								}
								div +="			</p>";
								div += "		</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"4\">暂无控股企业信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='行政许可'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">数据来源：工商局</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>许可文件名称</td>";
						div += "			<td>有效日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.行政许可工商 != "" && result.data.行政许可工商 != undefined) {
							for (var i = 0; i < result.data.行政许可工商.length; i++) {
								var info = result.data.行政许可工商[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.许可文件名称) + "</td>";
								div += "		<td>" + nvlStr(info.有效日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"3\">暂无行政许可（工商局）信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"

						div += "</table>";
						div += "<div class=\"infoLabel\">数据来源：信用中国</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>项目名称</td>";
						div += "			<td>案号</td>";
						div += "			<td>地域</td>";
						div += "			<td>决定日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.行政许可信用中国 != "" && result.data.行政许可信用中国 != undefined) {
							for (var i = 0; i < result.data.行政许可信用中国.length; i++) {
								var info = result.data.行政许可信用中国[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.项目名称) + "</td>";
								div += "		<td>" + nvlStr(info.案号) + "</td>";
								div += "		<td>" + nvlStr(info.地域) + "</td>";
								div += "		<td>" + nvlStr(info.决定日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无行政许可（信用中国）信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='法律诉讼'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">被执行人信息</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>案号</td>";
						div += "			<td>执行法院</td>";
						div += "			<td>执行标的</td>";
						div += "			<td>立案时间</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.法律诉讼被执行人信息 != "" && result.data.法律诉讼被执行人信息 != undefined) {
							for (var i = 0; i < result.data.法律诉讼被执行人信息.length; i++) {
								var info = result.data.法律诉讼被执行人信息[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.案号) + "</td>";
								div += "		<td>" + nvlStr(info.执行法院) + "</td>";
								div += "		<td>" + nvlStr(info.执行标地) + "</td>";
								div += "		<td>" + nvlStr(info.立案时间) + "</td>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无被执行人信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";

						div += "<div class=\"infoLabel\">失信被执行人</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>案件编号</td>";
						div += "			<td>被执行人的履行情况</td>";
						div += "			<td>法律生效文书确定的义务</td>";
						div += "			<td>执行法院</td>";
						div += "			<td>做出执行依据单位</td>";
						div += "			<td>发布时间</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.法律诉失信被执行人 != "" && result.data.法律诉失信被执行人 != undefined) {
							for (var i = 0; i < result.data.法律诉失信被执行人.length; i++) {
								var info = result.data.法律诉失信被执行人[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.案件编号) + "</td>";
								div += "		<td>" + nvlStr(info.被执行人的履行情况) + "</td>";
								div += "		<td>" + nvlStr(info.法律生效文书确定的义务) + "</td>";
								div += "		<td>" + nvlStr(info.执行法院) + "</td>";
								div += "		<td>" + nvlStr(info.作出执行依据单位) + "</td>";
								div += "		<td>" + nvlStr(info.发布时间) + "</td>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"7\">暂无失信被执行人，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";

						div += "<div class=\"infoLabel\">裁判文书</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>判决案号</td>";
						div += "			<td>标题</td>";
						div += "			<td>判决结果</td>";
						div += "			<td>发表日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.法律诉讼裁判文书 != "" && result.data.法律诉讼裁判文书 != undefined) {
							for (var i = 0; i < result.data.法律诉讼裁判文书.length; i++) {
								var info = result.data.法律诉讼裁判文书[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.判决案号) + "</td>";
								div += "		<td>" + nvlStr(info.标题) + "</td>";
								div += "		<td>" + nvlStr(info.判决结果) + "</td>";
								div += "		<td>" + nvlStr(info.发表日期) + "</td>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无裁判文书信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";

						div += "<div class=\"infoLabel\">法院公告</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>公告类型</td>";
						div += "			<td>公告人</td>";
						div += "			<td>当事人</td>";
						div += "			<td>刊登日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.法律诉讼法院公告 != "" && result.data.法律诉讼法院公告 != undefined) {
							for (var i = 0; i < result.data.法律诉讼法院公告.length; i++) {
								var info = result.data.法律诉讼法院公告[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.公告类型) + "</td>";
								div += "		<td>" + nvlStr(info.公告人) + "</td>";
								div += "		<td>" + nvlStr(info.当事人) + "</td>";
								div += "		<td>" + nvlStr(info.刊登日期) + "</td>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无法院公告信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";

						div += "<div class=\"infoLabel\">开庭公告</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>开庭日期</td>";
						div += "			<td>案由</td>";
						div += "			<td>公诉人/原告/上诉人/申请人</td>";
						div += "			<td>被告人/被告/被上诉人/被申请人</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.法律诉讼开庭公告 != "" && result.data.法律诉讼开庭公告 != undefined) {
							for (var i = 0; i < result.data.法律诉讼开庭公告.length; i++) {
								var info = result.data.法律诉讼开庭公告[i];
								var yg=JSON.parse(nvlStr(info.公诉人原告上诉人申请人));
								var bg=JSON.parse(nvlStr(info.被告人被告被上诉人被申请人));
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.开庭日期) + "</td>";
								div += "		<td>" + nvlStr(info.案由) + "</td>";
								div += "		<td>"
								for(var m=0;m<yg.length;m++){
									if(yg.length>1 && m!=yg.length-1){
										div +="			<span>" + yg[m].Name + "/</span>";
									}else{
										div +="			<span>" + yg[m].Name + " </span>";
									}
								}
								div += "		</td>";
								div += "		<td>"
								for(var n=0;n<bg.length;n++){
									div +="			<span>" + bg[n].Name + " </span>";
								}
								div += "		</td>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无开庭公告信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";

						div += "<div class=\"infoLabel\">司法拍卖</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>名称</td>";
						div += "			<td>起拍价</td>";
						div += "			<td>拍卖时间</td>";
						div += "			<td>委托法院</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.法律诉讼司法拍卖 != "" && result.data.法律诉讼司法拍卖 != undefined) {
							for (var i = 0; i < result.data.法律诉讼司法拍卖.length; i++) {
								var info = result.data.法律诉讼司法拍卖[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.名称) + "</td>";
								div += "		<td>" + nvlStr(info.起拍价) + "</td>";
								div += "		<td>" + nvlStr(info.拍卖时间) + "</td>";
								div += "		<td>" + nvlStr(info.委托法院) + "</td>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无司法拍卖信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";

						div += "<div class=\"infoLabel\">司法协助</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>被执行人</td>";
						div += "			<td>股权数额</td>";
						div += "			<td>执行通知文号</td>";
						div += "			<td>类型状态</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.法律诉讼司法协助 != "" && result.data.法律诉讼司法协助 != undefined) {
							for (var i = 0; i < result.data.法律诉讼司法协助.length; i++) {
								var info = result.data.法律诉讼司法协助[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.被执行人) + "</td>";
								div += "		<td>" + nvlStr(info.股权数额) + "</td>";
								div += "		<td>" + nvlStr(info.执行通知文号) + "</td>";
								div += "		<td>" + nvlStr(info.类型状态) + "</td>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无司法协助信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";

						div += "<div class=\"infoLabel\">送达公告</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>公告名称</td>";
						div += "			<td>法院名称</td>";
						div += "			<td>发布日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.法律诉讼送达公告 != "" && result.data.法律诉讼送达公告 != undefined) {
							for (var i = 0; i < result.data.法律诉讼送达公告.length; i++) {
								var info = result.data.法律诉讼送达公告[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.公告名称) + "</td>";
								div += "		<td>" + nvlStr(info.法院名称) + "</td>";
								div += "		<td>" + nvlStr(info.发布日期) + "</td>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"4\">暂无送达公告信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";

						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='招标股'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">招标股</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>名称</td>";
						div += "			<td>所在地区</td>";
						div += "			<td>类型</td>";
						div += "			<td>发布日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.招标股 != "" && result.data.招标股 != undefined) {
							for (var i = 0; i < result.data.招标股.length; i++) {
								var info = result.data.招标股[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.名称) + "</td>";
								div += "		<td>" + nvlStr(info.所在地区) + "</td>";
								div += "		<td>" + nvlStr(info.类型) + "</td>";
								div += "		<td>" + nvlStr(info.发布日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无招标股信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='融资信息'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">融资信息</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>日期</td>";
						div += "			<td>产品名称</td>";
						div += "			<td>融资轮次</td>";
						div += "			<td>金额</td>";
						div += "			<td>投资方</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.融资信息 != "" && result.data.融资信息 != undefined) {
							for (var i = 0; i < result.data.融资信息.length; i++) {
								var info = result.data.融资信息[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.日期) + "</td>";
								div += "		<td>" + nvlStr(info.产品名称) + "</td>";
								div += "		<td>" + nvlStr(info.融资轮次) + "</td>";
								div += "		<td>" + nvlStr(info.金额) + "</td>";
								div += "		<td>" + nvlStr(info.投资方) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"6\">暂无融资信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='地块公示'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">地块公示</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>地块位置</td>";
						div += "			<td>发布机关</td>";
						div += "			<td>行政区</td>";
						div += "			<td>发布日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.地块公示 != "" && result.data.地块公示 != undefined) {
							for (var i = 0; i < result.data.地块公示.length; i++) {
								var info = result.data.地块公示[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.地块位置) + "</td>";
								div += "		<td>" + nvlStr(info.发布机关) + "</td>";
								div += "		<td>" + nvlStr(info.行政区) + "</td>";
								div += "		<td>" + nvlStr(info.发布日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无地块公示信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='购地信息'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">购地信息</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>项目位置</td>";
						div += "			<td>土地用途</td>";
						div += "			<td>面积（公顷）</td>";
						div += "			<td>行政区</td>";
						div += "			<td>供地方式</td>";
						div += "			<td>合同签订日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.购地信息 != "" && result.data.购地信息 != undefined) {
							var l='面积（公顷）'
							for (var i = 0; i < result.data.购地信息.length; i++) {
								var info = result.data.购地信息[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.项目位置) + "</td>";
								div += "		<td>" + nvlStr(info.土地用途) + "</td>";
								div += "		<td>" + nvlStr(info.面积) + "</td>";
								div += "		<td>" + nvlStr(info.行政区) + "</td>";
								div += "		<td>" + nvlStr(info.供地方式) + "</td>";
								div += "		<td>" + nvlStr(info.合同签订日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"7\">暂无购地信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='土地转让'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">土地转让</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>土地坐落</td>";
						div += "			<td>行政区</td>";
						div += "			<td>原土地使用权人</td>";
						div += "			<td>现有土地使用权人</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.土地转让 != "" && result.data.土地转让 != undefined) {
							for (var i = 0; i < result.data.土地转让.length; i++) {
								var info = result.data.土地转让[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.土地坐落) + "</td>";
								div += "		<td>" + nvlStr(info.行政区) + "</td>";
								div += "		<td>" + nvlStr(info.原土地使用权人) + "</td>";
								div += "		<td>" + nvlStr(info.现有土地使用权人) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无土地转让信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='抽查检查'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">抽查检查</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>检查实施机关</td>";
						div += "			<td>类型</td>";
						div += "			<td>日期</td>";
						div += "			<td class='w50'>结果</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.抽查检查 != "" && result.data.抽查检查 != undefined) {
							for (var i = 0; i < result.data.抽查检查.length; i++) {
								var info = result.data.抽查检查[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.检查实施机关) + "</td>";
								div += "		<td>" + nvlStr(info.类型) + "</td>";
								div += "		<td>" + nvlStr(info.日期) + "</td>";
								div += "		<td>" + nvlStr(info.结果) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无抽查检查信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='债券信息'){
						$(".companyJYInfo").empty();
						var div = "";
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + jyName + "（"+jyValue+"）</span>";
						div += "</div>";

						div += "<div class=\"infoLabel\">债券信息</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>债券简称</td>";
						div += "			<td>债券代码</td>";
						div += "			<td>债券类型</td>";
						div += "			<td>发行日期</td>";
						div += "			<td>上市日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.data.债券信息 != "" && result.data.债券信息 != undefined) {
							for (var i = 0; i < result.data.债券信息.length; i++) {
								var info = result.data.债券信息[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.债券简称) + "</td>";
								div += "		<td>" + nvlStr(info.债券代码) + "</td>";
								div += "		<td>" + nvlStr(info.债券类型) + "</td>";
								div += "		<td>" + nvlStr(info.发行日期) + "</td>";
								div += "		<td>" + nvlStr(info.上市日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"6\">暂无债券信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyJYInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyJYInfo();
					}else if(jyName=='新闻舆情'){
						$(".companyJYInfo").empty();
						if (result.data.新闻舆情 != "" && result.data.新闻舆情 != undefined) {
							var div = "";
							div += "<div class=\"infoTitle\">";
							div += "	<span>" + jyName + "（"+jyValue+"）</span>";
							div += "</div>";

							div += "<div class=\"infoLabel\">新闻舆情</div>";
							for (var i = 0; i < result.data.新闻舆情.length; i++) {
								var info = result.data.新闻舆情[i];
								div += "	<div class='news-box'>";
								div += "		<p class='news-title'><a href='" + info.新闻url + "' target=\"_blank\">" + info.新闻标题+ "</a></p>";
								div += "		<p>"
								div +="				<span class='news-source'>来源：" + info.新闻来源 + "</span>"
								div +="				<span class='news-time'>发布时间：" + info.新闻发布时间 + "</span>"
								div += "		</p>";
								div += "	</div>";
							}
							$('#companyJYInfo').html(div);
							//弹出layer框并添加自定义关闭按钮
							openCompanyJYInfo();
						}else{
							layer.msg("暂无数据")
						}
					}
					
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
		return false;
	}
	//企业经营信息(企业年报)
	function getqynb(e){
		var jyName = $(e).find(".businessName").text();
		var jyValue = $(e).find(".businessValue").text();
		$.ajax({
			url : "${ctx}/interface/json/companyDetail/annualReport/"+$('#companyId').val(),
			type : "get",
			data : {},
			success : function(result){
				if(result.Success){
					$(".companyJYInfo").empty();
					var div = "";
					div += "<div class=\"infoTitle\">";
					div += "	<span>" + jyName + "（"+jyValue+"）</span>";
					div += "</div>";

					div += "<div class=\"infoLabel\">年报年份</div>";
					div += "<table class=\"infoTable\">";
					div += "	<tbody>";
					if (result.年报年份 != "" && result.年报年份 != undefined) {
						let length="";
						if(result.年报年份.length<3){
							length=result.年报年份.length
						}else{
							length=3;
						}
						div += "	<tr>";
						div += "		<td></td>";
						for (var i = 0; i < length; i++) {
							var info = result.年报年份[i];
							div += "		<td>" + nvlStr(info.年份) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>发布日期</td>";
						for (var j = 0; j < length; j++) {
							var info = result.年报年份[j];
							div += "		<td>" + nvlStr(info.发布日期) + "</td>";
						}
						div += "	</tr>";
					} else {
						div += "	<tr>";
						div += "		<td colspan=\"5\">暂无年报年份信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
						div += "	</tr>";
					}
					div += "	</tbody>"
					div += "</table>";

					div += "<div class=\"infoLabel\">企业资产状况信息</div>";
					div += "<table class=\"infoTable\">";
					div += "	<tbody>";
					if (result.企业资产状况信息 != "" && result.企业资产状况信息 != undefined) {
						let length="";
						if(result.企业资产状况信息.length<3){
							length=result.企业资产状况信息.length
						}else{
							length=3;
						}
						div += "	<tr>";
						div += "		<td></td>";
						for (let i = 0; i < length; i++) {
							var info = result.企业资产状况信息[i];
							div += "		<td>" + nvlStr(info.年份) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>资产总额</td>";
						for (let j = 0; j < length; j++) {
							var info = result.企业资产状况信息[j];
							div += "		<td>" + nvlStr(info.资产总额) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>营业总收入中主营业务收入</td>";
						for (let j = 0; j < length; j++) {
							var info = result.企业资产状况信息[j];
							div += "		<td>" + nvlStr(info.营业总收入中主营业务收入) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>所有者权益合计</td>";
						for (let j = 0; j < length; j++) {
							var info = result.企业资产状况信息[j];
							div += "		<td>" + nvlStr(info.所有者权益合计) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>净利润</td>";
						for (let j = 0; j < length; j++) {
							var info = result.企业资产状况信息[j];
							div += "		<td>" + nvlStr(info.净利润) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>营业总收入</td>";
						for (let j = 0; j < length; j++) {
							var info = result.企业资产状况信息[j];
							div += "		<td>" + nvlStr(info.营业总收入) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>纳税总额</td>";
						for (let j = 0; j < length; j++) {
							var info = result.企业资产状况信息[j];
							div += "		<td>" + nvlStr(info.纳税总额) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>利润总额</td>";
						for (let j = 0; j < length; j++) {
							var info = result.企业资产状况信息[j];
							div += "		<td>" + nvlStr(info.利润总额) + "</td>";
						}
						div += "	</tr>";
						div += "	<tr>";
						div += "		<td class='tbale_head'>负债总额</td>";
						for (let j = 0; j < length; j++) {
							var info = result.企业资产状况信息[j];
							div += "		<td>" + nvlStr(info.负债总额) + "</td>";
						}
						div += "	</tr>";
					} else {
						div += "	<tr>";
						div += "		<td colspan=\"5\">暂无企业税务信用信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
						div += "	</tr>";
					}
					div += "	</tbody>"
					div += "</table>";

					div += "<div class=\"infoLabel\">社保信息</div>";
					div += "<table class=\"infoTable\">";
					div += "	<tbody>";
					div += "	<tr>";
					div += "		<td rowspan=\"3\">详细信息请下载企业信用决策报告</td>";
					div += "	</tr>";
					div += "	</tbody>"
					div += "</table>";

					div += "<div class=\"infoLabel\">单位缴费基数</div>";
					div += "<table class=\"infoTable\">";
					div += "	<tbody>";
					div += "	<tr>";
					div += "		<td rowspan=\"3\">详细信息请下载企业信用决策报告</td>";
					div += "	</tr>";
					div += "	</tbody>"
					div += "</table>";

					div += "<div class=\"infoLabel\">年度报告</div>";
					div += "<table class=\"infoTable\">";
					div += "	<thead>";
					div += "		<tr>";
					div += "			<td>发起人</td>";
					div += "			<td>认缴金额</td>";
					div += "			<td>认缴出资时间</td>";
					div += "			<td>认缴方式</td>";
					div += "			<td>实缴金额</td>";
					div += "			<td>实缴出资时间</td>";
					div += "			<td>实缴方式</td>";
					div += "		</tr>";
					div += "	</thead>";
					div += "	<tbody>";
					if (result.年度报告 != "" && result.年度报告 != undefined) {
						let length="";
						if(result.年度报告.length<3){
							length=result.年度报告.length
						}else{
							length=3;
						}
						for (var i = 0; i < length; i++) {
							div += "<tr><td colspan=\"7\" style='text-align:left;padding-left: 10px;'>"+ nvlStr(result.年度报告[i][0].年份)+"</td></tr>";
							for(var j=0;j<result.年度报告[i].length;j++){
								var info = result.年度报告[i][j] ;
								div += "	<tr>";
								div += "		<td>" + nvlStr(info.发起人) + "</td>";
								div += "		<td>" + nvlStr(info.认缴金额) + "</td>";
								div += "		<td>" + nvlStr(info.认缴出资时间) + "</td>";
								div += "		<td>" + nvlStr(info.认缴方式) + "</td>";
								div += "		<td>" + nvlStr(info.实缴金额) + "</td>";
								div += "		<td>" + nvlStr(info.实缴出资时间) + "</td>";
								div += "		<td>" + nvlStr(info.实缴方式) + "</td>";
								div += "	</tr>";
							}
						}
					} else {
						div += "	<tr>";
						div += "		<td colspan=\"7\">暂无年度报告信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
						div += "	</tr>";
					}
					div += "	</tbody>"
					div += "</table>";

					$('#companyJYInfo').html(div);
					//弹出layer框并添加自定义关闭按钮
					openCompanyJYInfo();
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
		return false;
	}
	function getMoreInfo(){
		$(".businessInfoBar .businessInfo").css("display","inline-block");
		$(".businessMore").parent().parent().parent().parent().css("display","none");
		return false;
	}
	//获取企业关联图谱数据
	function getCompanyDiagram(){
		$.ajax({
			url : "${ctx}/interface/json/companyDetail/association/"+$('#companyId').val(),
			type : "get",
			data : {},
			success : function(result){
				if(result.Success){
					//企业关联图谱数据
					if(result.Size != "" && result.Size != undefined && result.Size > 0){
						$(".companyGLInfo").empty();
						var div = "";
							div += "<div class=\"infoTitle\">";
							div += "	<span>股东信息</span>";
							div += "</div>";
							
							div += "<table class=\"infoTable\">";
							div += "	<thead>";
							div += "		<tr>";
							div += "			<td class=\"w40px\">序号</td>";
							div += "			<td>股东（发起人）</td>";
							div += "			<td>持股比例</td>";
							div += "			<td>认缴出资额（万元）</td>";
							div += "			<td>认缴出资时间</td>";
							div += "		</tr>";
							div += "	</thead>";
							div += "	<tbody>";
							if(result.Data != "" && result.Data != undefined){
								for(var i=0;i<result.Data.length;i++){
									var info = result.Data[i];
									div += "	<tr>";
									div += "		<td>"+(i+1)+"</td>";
									div += "		<td>"+nvlStr(info.投资人)+"</td>";
									div += "		<td>"+nvlStr(info.出资比例)+"</td>";
									div += "		<td>"+nvlStr(info.认缴出资额)+"</td>";
									div += "		<td>"+nvlStr(info.认缴出资时间)+"</td>";
									div += "	</tr>";
								}
							}else{
								div += "	<tr>";
								div += "		<td colspan=\"5\">暂无被执行人信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
								div += "	</tr>";
							}
							div += "	</tbody>"
							div += "</table>";
							
						$('#companyGLInfo').html(div);
						//弹出企业关联图更多框并添加自定义关闭按钮
						//openCompanyGLInfo();
						
						var div_ = document.getElementById("graphChart");
						div_.removeAttribute("_echarts_instance_");
						var graphChart = echarts.init(div_);
						//var graphChart = echarts.init(document.getElementById("graphChart"));
						var pointList = [{x:300,y:300},{x:0,y:200},{x:50,y:350},{x:550,y:180},{x:600,y:450},{x:700,y:320}];
						var dataDiagram = [];
						var linksDiagram = [];
						var fData = {};
						fData.name = lineFeed(result.Name);
						fData.x = pointList[0].x;
						fData.y = pointList[0].y;
						fData.itemStyle = {color: "#FD485E"};
						fData.symbolSize = [76,76];
						fData.label = {fontSize: 11};
						dataDiagram.push(fData)
						
						if(result.Size > 6){
							result.Size = 5;
							result.Data = result.Data.slice(0,5);
							$(".moreDiagram").show();
						}
						
						for(var i=0;i<result.Size;i++){
							var oData = {};
							var oLink = {};
							var info = result.Data[i];
							oData.name = lineFeed(result.Data[i].投资人);
							oData.x = pointList[i+1].x;
							oData.y = pointList[i+1].y;
							if(result.Data[i].投资人类型 == 0){//自然人
								oData.itemStyle = {color: "#3E63FC"};
								oData.symbolSize = [49,49];
								oData.label = {fontSize: 10};
							}else if(result.Data[i].投资人类型 == 1){//非自然人
								oData.itemStyle = {color: "#FD485E"};
								oData.symbolSize = [70,70];
								oData.label = {fontSize: 10};
							}else{}
							dataDiagram.push(oData);
							
							oLink.source = lineFeed(result.Data[i].投资人);
							oLink.target = lineFeed(result.Name);
							oLink.label = {show: true,formatter: result.Data[i].出资比例,fontSize: 14,color: '#fff'};
							oLink.lineStyle = {color: '#3E63FC'};
							linksDiagram.push(oLink);
						}
						
			            graphOption.series[0].data = dataDiagram;
			            graphOption.series[0].links = linksDiagram;
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
	//换行操作
	function lineFeed(name){
		var labelName = "";
		if(name.length>18){
			labelName = name.substring(0,6)+'\n'+name.substring(6,12)+'\n'+name.substring(12,18)+'\n'+name.substring(18);
		}else if(name.length<19 && name.length>12){
			labelName = name.substring(0,6)+'\n'+name.substring(6,12)+'\n'+name.substring(12)
		}else if(name.length<13 && name.length>6){
			labelName = name.substring(0,6)+'\n'+name.substring(6)
		}else if(name.length<7){
			labelName = name
		}
		return labelName;
	}
	//弹出企业关联图更多框并添加自定义关闭按钮
	function openCompanyGLInfo(){
		closeLayer();
		layer.open({
			type: 1,
			area: '900px',
			offset: '146px',
			title: false,
			closeBtn: 0,
			content: $('#companyGLInfo')
		});
		
		//添加自定义关闭按钮
		var $div = '<img src=\"${ctx}/static/image/cityDataCenter/close.png\" width=\"30\" class=\"closeBtn\" onclick="closeLayer()">';
		$('.layui-layer').prepend($div); //将新创建的div节点插入到nav容器的内容顶部
	}
	//获取风险指数数据
	var indicatorSource = [];
	var valueSource = [];
	function getCompanyRisk(){
		$.ajax({
			url : "${ctx}/interface/json/companyDetail/riskCount/"+$('#companyId').val(),
			type : "get",
			data : {},
			success : function(result){
				if(result.Success){
					//风险指数数据
					if(result.Data.companyRisk != undefined){
						var div_ = document.getElementById("radarChart");
						div_.removeAttribute("_echarts_instance_");
						var radarChart = echarts.init(div_);
						//var radarChart = echarts.init(document.getElementById("radarChart"));
						radarOption.radar.indicator = result.Data.companyRisk.indicator;
						//获取初始数组数据，用于拼接tooltip
						indicatorSource = Object.assign([], result.Data.companyRisk.indicator);
						valueSource = Object.assign([], result.Data.companyRisk.value);
						//将超过10条的数据改为10条，防止超出雷达图
						for(var i=0;i<result.Data.companyRisk.value.length;i++){
							var num = result.Data.companyRisk.value[i];
							if(num>10){result.Data.companyRisk.value[i] = 10;}
						} 
						radarOption.series[0].data[0].value = result.Data.companyRisk.value;
						radarChart.setOption(radarOption);
						radarChart.on('click',function(params){
							if(params.name == '失信风险'){//90020180314182252800039000001752
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">被执行人信息</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>案号</td>";
												div += "			<td>执行法院</td>";
												div += "			<td>执行标的</td>";
												div += "			<td>立案时间</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.被执行人信息 != "" && result.Data.被执行人信息 != undefined){
													for(var i=0;i<result.Data.被执行人信息.length;i++){
														var info = result.Data.被执行人信息[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.案号)+"</td>";
														div += "		<td>"+nvlStr(info.执行法院)+"</td>";
														div += "		<td>"+nvlStr(info.执行标的)+"</td>";
														div += "		<td>"+nvlStr(info.立案时间)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"5\">暂无被执行人信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
												div += "<div class=\"infoLabel\">失信被执行人</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>案件编号</td>";
												div += "			<td>被执行人的履行情况</td>";
												div += "			<td class=\"w35\">法律生效文书确定的义务</td>";
												div += "			<td>执行法院</td>";
												div += "			<td>作出执行依据单位</td>";
												div += "			<td>发布时间</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.失信被执行人 != "" && result.Data.失信被执行人 != undefined){
												for(var i=0;i<result.Data.失信被执行人.length;i++){
													var info = result.Data.失信被执行人[i];
													div += "	<tr>";
													div += "		<td>"+(i+1)+"</td>";
													div += "		<td>"+nvlStr(info.案件编号)+"</td>";
													div += "		<td>"+nvlStr(info.被执行人的履行情况)+"</td>";
													if(info.法律生效文书确定的义务.length > 50){
														var title = info.法律生效文书确定的义务.replace(/\s*/g,"");
														div += "		<td title="+title+">"+info.法律生效文书确定的义务.substring(0,50)+"…</td>";
													}else{
														div += "		<td>"+nvlStr(info.法律生效文书确定的义务)+"</td>";
													}
													div += "		<td>"+nvlStr(info.执行法院)+"</td>";
													div += "		<td>"+nvlStr(info.作出执行依据单位)+"</td>";
													div += "		<td>"+nvlStr(info.发布时间)+"</td>";
													div += "	</tr>";
												}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"7\">暂无失信被执行人信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
											
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '行政处罚'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">数据来源：工商局</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td class=\"w20\">书文号</td>";
												div += "			<td>违法行为类型</td>";
												div += "			<td class=\"w30\">行政处罚内容</td>";
												div += "			<td class=\"w20\">处罚决定机关</td>";
												div += "			<td>处罚决定时间</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.工商局 != "" && result.Data.工商局 != undefined){
													for(var i=0;i<result.Data.工商局.length;i++){
														var info = result.Data.工商局[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.书文号)+"</td>";
														div += "		<td>"+nvlStr(info.违法行为类型)+"</td>";
														div += "		<td>"+nvlStr(info.行政处罚内容)+"</td>";
														div += "		<td>"+nvlStr(info.处罚决定机关)+"</td>";
														div += "		<td>"+nvlStr(info.处罚决定时间)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"6\">暂无行政处罚(工商局)信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
												div += "<div class=\"infoLabel\">数据来源：信用中国</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>案号</td>";
												div += "			<td>处罚名称</td>";
												div += "			<td>处罚机关</td>";
												div += "			<td>决定时间</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.信用中国 != "" && result.Data.信用中国 != undefined){
												for(var i=0;i<result.Data.信用中国.length;i++){
													var info = result.Data.信用中国[i];
													div += "	<tr>";
													div += "		<td>"+(i+1)+"</td>";
													div += "		<td>"+nvlStr(info.案号)+"</td>";
													div += "		<td>"+nvlStr(info.处罚名称)+"</td>";
													div += "		<td>"+nvlStr(info.处罚机关)+"</td>";
													div += "		<td>"+nvlStr(info.决定时间)+"</td>";
													div += "	</tr>";
												}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"5\">暂无失信被执行人信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
											
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '股权出质'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">股权出质信息</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>登记编号</td>";
												div += "			<td>质权人</td>";
												div += "			<td>出质人</td>";
												div += "			<td>出质股权数</td>";
												div += "			<td class=\"w40px\">状态</td>";
												div += "			<td>批准日期</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.股权出质 != "" && result.Data.股权出质 != undefined){
													for(var i=0;i<result.Data.股权出质.length;i++){
														var info = result.Data.股权出质[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.登记编号)+"</td>";
														div += "		<td>"+nvlStr(info.质权人)+"</td>";
														div += "		<td>"+nvlStr(info.出质人)+"</td>";
														div += "		<td>"+nvlStr(info.出质股权数)+"</td>";
														div += "		<td>"+nvlStr(info.状态)+"</td>";
														div += "		<td>"+nvlStr(info.批准日期)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"7\">暂无股权出质信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '抵押风险'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">动产抵押登记信息</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>登记编号</td>";
												div += "			<td>登记时间</td>";
												div += "			<td>公示时间</td>";
												div += "			<td>登记机关</td>";
												div += "			<td>被担保债权数额</td>";
												div += "			<td>状态</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.动产抵押 != "" && result.Data.动产抵押 != undefined){
													for(var i=0;i<result.Data.动产抵押.length;i++){
														var info = result.Data.动产抵押[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.登记编号)+"</td>";
														div += "		<td>"+nvlStr(info.登记时间)+"</td>";
														div += "		<td>"+nvlStr(info.公示时间)+"</td>";
														div += "		<td>"+nvlStr(info.登记机关)+"</td>";
														div += "		<td>"+nvlStr(info.被担保债权数额)+"</td>";
														div += "		<td>"+nvlStr(info.状态)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"7\">暂无动产抵押登记信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
												div += "<div class=\"infoLabel\">土地抵押</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>土地坐落</td>";
												div += "			<td>起止时间</td>";
												div += "			<td>行政区</td>";
												div += "			<td>抵押面积(公顷)</td>";
												div += "			<td>抵押土地用途</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.土地抵押 != "" && result.Data.土地抵押 != undefined){
												for(var i=0;i<result.Data.土地抵押.length;i++){
													var info = result.Data.土地抵押[i];
													div += "	<tr>";
													div += "		<td>"+(i+1)+"</td>";
													div += "		<td>"+nvlStr(info.土地坐落)+"</td>";
													div += "		<td>"+nvlStr(info.土地抵押起始时间)+"-"+nvlStr(info.土地抵押结束时间)+"</td>";
													div += "		<td>"+nvlStr(info.行政区)+"</td>";
													div += "		<td>"+nvlStr(info.抵押面积)+"</td>";
													div += "		<td>"+nvlStr(info.抵押土地用途)+"</td>";
													div += "	</tr>";
												}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"6\">暂无土地抵押信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
											
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '公示催告'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">公示催告</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>票号</td>";
												div += "			<td>票据类型</td>";
												div += "			<td>申请人</td>";
												div += "			<td>票面金额</td>";
												div += "			<td>公告日期</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.公示催告 != "" && result.Data.公示催告 != undefined){
													for(var i=0;i<result.Data.公示催告.length;i++){
														var info = result.Data.公示催告[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.票号)+"</td>";
														div += "		<td>"+nvlStr(info.票据类型)+"</td>";
														div += "		<td>"+nvlStr(info.申请人)+"</td>";
														div += "		<td>"+nvlStr(info.票面金额)+"</td>";
														div += "		<td>"+nvlStr(info.公告日期)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"6\">暂无公示催告信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '环保处罚'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">环保处罚</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>决定书文号</td>";
												div += "			<td>违法类型</td>";
												div += "			<td>处罚日期</td>";
												div += "			<td>处罚单位</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.环保处罚 != "" && result.Data.环保处罚 != undefined){
													for (var i=0;i<result.Data.环保处罚.length;i++){
														var info = result.Data.环保处罚[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.决定书文号)+"</td>";
														div += "		<td>"+nvlStr(info.违法类型)+"</td>";
														div += "		<td>"+nvlStr(info.处罚日期)+"</td>";
														div += "		<td>"+nvlStr(info.处罚单位)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"5\">暂无环保处罚信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '税收风险'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">税收违法</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>发布时间</td>";
												div += "			<td>所属税务机关</td>";
												div += "			<td>案件性质</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.税收违法 != "" && result.Data.税收违法 != undefined){
													for(var i=0;i<result.Data.税收违法.length;i++){
														var info = result.Data.税收违法[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.发布时间)+"</td>";
														div += "		<td>"+nvlStr(info.所属税务机关)+"</td>";
														div += "		<td>"+nvlStr(info.案件性质)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"4\">暂无税收违法信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
												div += "<div class=\"infoLabel\">欠税公告</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>欠税税种</td>";
												div += "			<td>欠税余额</td>";
												div += "			<td>当前新发生欠税</td>";
												div += "			<td>发布单位</td>";
												div += "			<td>发布日期</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.欠税公告 != "" && result.Data.欠税公告 != undefined){
												for(var i=0;i<result.Data.欠税公告.length;i++){
													var info = result.Data.欠税公告[i];
													div += "	<tr>";
													div += "		<td>"+(i+1)+"</td>";
													div += "		<td>"+nvlStr(info.欠税税种)+"</td>";
													div += "		<td>"+nvlStr(info.欠税余额)+"</td>";
													div += "		<td>"+nvlStr(info.当前新发生欠税)+"</td>";
													div += "		<td>"+nvlStr(info.发布单位)+"</td>";
													div += "		<td>"+nvlStr(info.发布日期)+"</td>";
													div += "	</tr>";
												}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"6\">暂无欠税公告信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
											
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '严重违法'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">严重违法</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>列入严重违法原因</td>";
												div += "			<td>列入日期</td>";
												div += "			<td>移出严重违法原因</td>";
												div += "			<td>移出日期</td>";
												div += "			<td>作出决定机关</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.严重违法 != "" && result.Data.严重违法 != undefined){
													for(var i=0;i<result.Data.严重违法.length;i++){
														var info = result.Data.严重违法[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.列入严重违法原因)+"</td>";
														div += "		<td>"+nvlStr(info.列入日期)+"</td>";
														div += "		<td>"+nvlStr(info.移出严重违法原因)+"</td>";
														div += "		<td>"+nvlStr(info.移出日期)+"</td>";
														div += "		<td>"+nvlStr(info.作出决定机关)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"6\">暂无严重违法信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '简易注销'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">简易注销</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td>登记机关</td>";
												div += "			<td>公告期</td>";
												div += "			<td>异议申请人</td>";
												div += "			<td>异议时间</td>";
												div += "			<td>异议内容</td>";
												div += "			<td>简易注销结果</td>";
												div += "			<td>公告申请日期</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.简易注销 != "" && result.Data.简易注销 != undefined){
													for(var i=0;i<result.Data.简易注销.length;i++){
														var info = result.Data.简易注销[i];
														div += "	<tr>";
														div += "		<td>"+nvlStr(info.登记机关)+"</td>";
														div += "		<td>"+nvlStr(info.公告期)+"</td>";
														div += "		<td>"+nvlStr(info.异议申请人)+"</td>";
														div += "		<td>"+nvlStr(info.异议时间)+"</td>";
														div += "		<td>"+nvlStr(info.异议内容)+"</td>";
														div += "		<td>"+nvlStr(info.简易注销结果)+"</td>";
														div += "		<td>"+nvlStr(info.公告申请日期)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"7\">暂无简易注销信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '经营异常'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">经营异常</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>列入经营异常原因</td>";
												div += "			<td>列入日期</td>";
												div += "			<td>移除经营异常原因</td>";
												div += "			<td>移出日期</td>";
												div += "			<td>作出决定机关</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.经营异常 != "" && result.Data.经营异常 != undefined){
													for(var i=0;i<result.Data.经营异常.length;i++){
														var info = result.Data.经营异常[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.列入经营异常原因)+"</td>";
														div += "		<td>"+nvlStr(info.列入日期)+"</td>";
														div += "		<td>"+nvlStr(info.移除经营异常原因)+"</td>";
														div += "		<td>"+nvlStr(info.移出日期)+"</td>";
														div += "		<td>"+nvlStr(info.做出决定机关)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"6\">暂无经营异常信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else if(params.name == '清算信息'){
								$.ajax({
									url : "${ctx}/interface/json/companyDetail/riskDetail/"+$('#companyId').val()+"/"+params.name,
									type : "get",
									data : {},
									success : function(result){
										if(result.Success){
											$(".companyFXInfo").empty();
											var div = "";
												div += "<div class=\"infoTitle\">";
												div += "	<span>"+params.name+"（"+result.Total+"）</span>";
												div += "</div>";
												
												div += "<div class=\"infoLabel\">清算信息</div>";
												div += "<table class=\"infoTable\">";
												div += "	<thead>";
												div += "		<tr>";
												div += "			<td class=\"w40px\">序号</td>";
												div += "			<td>清算组负责人</td>";
												div += "			<td>清算组成员</td>";
												div += "		</tr>";
												div += "	</thead>";
												div += "	<tbody>";
												if(result.Data.清算信息 != "" && result.Data.清算信息 != undefined){
													for(var i=0;i<result.Data.清算信息.length;i++){
														var info = result.Data.清算信息[i];
														div += "	<tr>";
														div += "		<td>"+(i+1)+"</td>";
														div += "		<td>"+nvlStr(info.清算组负责人)+"</td>";
														div += "		<td>"+nvlStr(info.清算组成员)+"</td>";
														div += "	</tr>";
													}
												}else{
													div += "	<tr>";
													div += "		<td colspan=\"3\">暂无清算信息信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
													div += "	</tr>";
												}
												div += "	</tbody>"
												div += "</table>";
												
											$('#companyFXInfo').html(div);
											//弹出layer框并添加自定义关闭按钮
											openCompanyFXInfo();
										}
									},
									error : function() {
										layer.msg("数据获取异常！");
									}
								})
							}else{}
						})
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
	//弹出风险指标详情框并添加自定义关闭按钮
	function openCompanyFXInfo(){
		closeLayer();
		layer.open({
			type: 1,
			area: '900px',
			offset: '146px',
			title: false,
			closeBtn: 0,
			content: $('#companyFXInfo')
		});
		
		//添加自定义关闭按钮
		var $div = '<img src=\"${ctx}/static/image/cityDataCenter/close.png\" width=\"30\" class=\"closeBtn\" onclick="closeLayer()">';
		$('.layui-layer').prepend($div); //将新创建的div节点插入到nav容器的内容顶部
	}
	function openCompanyJYInfo(){
		closeLayer();
		layer.open({
			type: 1,
			area: '900px',
			offset: '146px',
			title: false,
			closeBtn: 0,
			content: $('#companyJYInfo')
		});
		
		//添加自定义关闭按钮
		var $div = '<img src=\"${ctx}/static/image/cityDataCenter/close.png\" width=\"30\" class=\"closeBtn\" onclick="closeLayer()">';
		$('.layui-layer').prepend($div); //将新创建的div节点插入到nav容器的内容顶部
	}
	function openCompanyCQInfo(){
		closeLayer();
		layer.open({
			type: 1,
			area: '900px',
			offset: '146px',
			title: false,
			closeBtn: 0,
			content: $('#companyCQInfo')
		});
		
		//添加自定义关闭按钮
		var $div = '<img src=\"${ctx}/static/image/cityDataCenter/close.png\" width=\"30\" class=\"closeBtn\" onclick="closeLayer()">';
		$('.layui-layer').prepend($div); //将新创建的div节点插入到nav容器的内容顶部
	}
	//自定义关闭按钮
	function closeLayer(){
		layer.closeAll();
	}
	/* 非空字符串 */
	function nvlStr(str){
		if(str==null || str==undefined){
			return "";
		}
		return str;
	}
	//企业工商信息
	function companyGSInfo(){
		$.ajax({
			url:"${ctx}/interface/json/companyDetail/gsBaseDetail/"+$('#companyId').val(),
			type:"get",
			data:{},
			success : function(result){
				if(result.Success){
					var data=result.Data;
					var people=data.主要人员
					var detail=data.企业工商信息详情
					var contactinfo=data.联系信息
					var otherinfo=data.附加信息
					var div="";
					div+='<div class="tabCaptionBar">'
					div+='<span class="tabCaption unScreen" data="5">'
					div+='<span class="on">工商注册</span>'
					div+='<span>主要人员</span>'
					div+='<span>联系信息</span>'
					div+='<span>公司简介</span>'
					div+='</span>'
					div+='</div>'
					div+='<div class="tabConBar">'
					div+='<div id="tab-5-1" class="tabCont on">'
					if(detail!="" && detail!=undefined){
						div+='<div class="companyInfo">'
						div+='<span class="infoName">公司名称：</span><span class="infoValue" id="companyName">'+nvlStr(detail.企业名称)+'</span>'
						div+='<span class="infoName">工商注册号：</span><span class="infoValue" id="issueStateName">'+nvlStr(detail.工商注册号)+'</span>'
						div+='<span class="infoName" style="white-space: inherit;">统一社会信用代码：</span><span class="infoValue" id="companyName">'+nvlStr(detail.统一社会信用代码)+'</span>'
						div+='<span class="infoName">法定代表人：</span><span class="infoValue" id="issueStateName">'+nvlStr(detail.法定代表人)+'</span>'
						div+='<span class="infoName">组织机构代码：</span><span class="infoValue" id="companyName">'+nvlStr(detail.组织机构代码)+'</span>'
						div+='<span class="infoName">注册资本：</span><span class="infoValue" id="issueStateName">'+nvlStr(detail.注册资本)+'</span>'
						div+='<span class="infoName">所属行业：</span><span class="infoValue" id="issueStateName">'+nvlStr(detail.所属行业)+'</span>'
						
						if(detail.企业类型 == 0){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">公司</span>';
						}else if(detail.企业类型 == 1){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">社会组织</span>';
						}else if(detail.企业类型 == 2){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName"></span>';
						}else if(detail.企业类型 == 3){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">香港公司</span>';
						}else if(detail.企业类型 == 4){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">政府机构</span>';
						}else if(detail.企业类型 == 5){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">台湾公司</span>';
						}else if(detail.企业类型 == 6){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">基金会</span>';
						}else if(detail.企业类型 == 7){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">医院</span>';
						}else if(detail.企业类型 == 8){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">海外公司</span>';
						}else if(detail.企业类型 == 9){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">律师事务所</span>';
						}else if(detail.企业类型 == 10){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">学校</span>';
						}else if(detail.企业类型 == -1){
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName">其他</span>';
						}else{
							div+='<span class="infoName">企业类型：</span><span class="infoValue" id="issueStateName"></span>';
						}
						
						div+='<span class="infoName">经营状态：</span><span class="infoValue" id="issueStateName">'+nvlStr(detail.经营状态)+'</span>'
						if(nvlStr(detail.成立日期)!=""){
							detail.成立日期=detail.成立日期.substring(0,10)
						}
						div+='<span class="infoName">成立日期：</span><span class="infoValue" id="issueStateName">'+nvlStr(detail.成立日期)+'</span>'
						if(nvlStr(detail.核准日期)!=""){
							detail.核准日期=detail.核准日期.substring(0,10)
						}
						div+='<span class="infoName">核准日期：</span><span class="infoValue" id="companyName">'+nvlStr(detail.核准日期)+'</span>';
						if(nvlStr(detail.营业期限始)!="" && nvlStr(detail.营业期限至)!=""){
							detail.营业期限始=detail.营业期限始.substring(0,10)
							detail.营业期限至=detail.营业期限至.substring(0,10)
							div+='<span class="infoName">营业期限：</span><span class="infoValue" id="issueStateName">'+detail.营业期限始+' 至 '+detail.营业期限至+'</span>';
						}else if(nvlStr(detail.营业期限始)!=""){
							detail.营业期限始=detail.营业期限始.substring(0,10)
							div+='<span class="infoName">营业期限：</span><span class="infoValue" id="issueStateName">'+detail.营业期限始+' 至今</span>';
						}else{
							div+='<span class="infoName">营业期限：</span><span class="infoValue" id="issueStateName"></span>';
						}
						div+='<span class="infoName">登记机关：</span><span class="infoValue" id="companyName">'+nvlStr(detail.登记机关)+'</span>';
						div+='<span class="infoName">注册地址：</span><span class="infoValue" id="issueStateName">'+nvlStr(detail.注册地址)+'</span>';
						div+='<span class="infoName">经营范围：</span><span class="infoValue" id="companyName" style="width: calc(100% - 150px);">'+nvlStr(detail.经营范围)+'</span>';
						div+='</div>';
						div+='</div>';
					}else{
						div+='<div class="companyInfo" style="height:200px;">';
						div+='<font class="unData">暂无数据</font>';
						div+='</div>';
					}
					div+='<div id="tab-5-2" class="tabCont">';
					div += '<div class="infoName title">主要人员</div>';
					div += '<table class="infoTable">';
					div += '<thead>';
					div += '<tr>';
					div += '<td>序号</td>';
					div += '<td>姓名</td>';
					div += '<td>职务</td>';
					div += '<td>关联企业数量</td>';
					div += '</tr>';
					div += '</thead>';
					div += '<tbody>';
					if(people != "" && people != undefined){
						for (var i=0;i<people.length;i++){
							var info = people[i];
							div += '<tr>';
							div += '<td>'+(i+1)+'</td>';
							div += '<td>'+nvlStr(info.姓名)+'</td>';
							div += '<td>'+nvlStr(info.职务)+'</td>';
							div += '<td>'+nvlStr(info.关联企业数量)+'</td>';
							div += '</tr>';
						}
					}else{
						div += "	<tr>";
						div += "		<td colspan=\"4\">暂无主要人员相关信息</td>";
						div += "	</tr>";
					}
					div += '</tbody>';
					div += '</table>';
					div+='</div>';
					div+='<div id="tab-5-3" class="tabCont">';
					if(contactinfo != "" && contactinfo != undefined){
						div+='<div class="companyInfo">';
						div+='<span class="infoName">电话：</span><span class="infoValue" id="companyName">'+nvlStr(contactinfo.电话)+'</span>';
						div+='<span class="infoName">邮箱：</span><span class="infoValue" id="issueStateName">'+nvlStr(contactinfo.邮箱)+'</span>';
						div+='<span class="infoName">网址：</span><span class="infoValue" id="companyName">'+nvlStr(contactinfo.网址)+'</span>';
						div+='<span class="infoName">注册地址：</span><span class="infoValue" id="companyName">'+nvlStr(detail.注册地址)+'</span>';
						div+='</div>';
						div+='</div>';
					}else{
						div+='<div class="companyInfo" style="height:200px;">';
						div+='<font class="unData">暂无数据</font>';
						div+='</div>';
						div+='</div>';
					}
					div+='<div id="tab-5-4" class="tabCont">';
					if(otherinfo.公司简介!="" && otherinfo.公司简介!=undefined){
						div+='<div class="infoName title">公司简介</div>';
						div+='<div class="text">'+ nvlStr(otherinfo.公司简介)+'</div>';
						div+='</div>';
					}else{
						div+='<div class="companyInfo" style="height:200px;">';
						div+='<font class="unData">暂无数据</font>';
						div+='</div>';
						div+='</div>';
					}
					div+='</div>'
					$("#companyGSInfo").empty();
					$("#companyGSInfo").html(div)
					closeLayer();
					layer.open({
						type: 1,
						area: '900px',
						offset: '146px',
						title: false,
						closeBtn: 0,
						content: $('#companyGSInfo')
					});
					//添加自定义关闭按钮
					var $div = '<img src=\"${ctx}/static/image/cityDataCenter/close.png\" width=\"30\" class=\"closeBtn\"onclick="closeLayer()">';
					$('.layui-layer').prepend($div); //将新创建的div节点插入到nav容器的内容顶部
					$("#companyGSInfo .tabCaption").on("click", "span",function() {
						var ind = $(this).index() + 1;
						var val = $(this).parent().attr('data');
						$(this).addClass("on").siblings().removeClass("on");
						$("#tab-" + val + "-" + ind).siblings().fadeOut("fast");
						setTimeout(function() {
							$("#tab-" + val + "-" + ind).fadeIn("fast");
						}, 200)
					});
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//获取企业知识产权数据
	function getComPowerInfo(){
		$.ajax({
			url : "${ctx}/interface/json/companyDetail/equityCount/"+$('#companyId').val(),
			type : "get",
			data : {
			},
			success : function(result){
				if(result.Data.competitiveMap != "" && result.Data.competitiveMap != undefined){
					var map = result.Data.competitiveMap;
					for(var m in map){
						var _div = "";
						_div += '<div class="comPower kpr">';
						_div += '	<i></i>';
						//_div += '	<span class="comPowerName">'+m+'</span>';
						//_div += '	<div class="comPowerProcess">';
						//_div += '		<div style="width:'+map[m]/100*100+'%;"></div>';
						//_div += '	</div>';
						//_div += '	<span class="comPowerValue">'+map[m]+'</span>';
						_div += '	<div class="propertyRightBar">';
						_div += '		<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg1.png">';
						_div += '		<div class="propertyRightName">'+m+'</div>';
						_div += '		<div class="propertyRightValue">'+map[m]+'</div>';
						_div += '	</div>';
						_div += '</div>';
						$("#comPower").append(_div);
					}
					$("#comPower").on("click",".comPower",function(){
						var ind = $(this).index()
						getEquityDetail(ind);
					})
				}else{
					$("#comPower").html("<font class=\"unData\">暂无数据</font>");
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//获取单类知识产权详情
	function getEquityDetail(index){
		var type=["软件著作","证书资质","商标","作品著作","网站域名","专利"]
		$.ajax({
			url : "${ctx}/interface/json/companyDetail/equityDetail/"+$("#companyId").val()+"/"+type[index],
			type : "get",
		 	async: false,
			data : {},
			dataType : "json",
			success : function(result){
				if(result.Success){
					$(".companyCQInfo").empty();
					var div = "";
					if(type[index]=="软件著作"){
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + type[index] + "（"+result.Data.软件著作.length+"）</span>";
						div += "</div>";
						
						div += "<div class=\"infoLabel\">软件著作</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>软件名称</td>";
						div += "			<td>版本号</td>";
						div += "			<td>登记号</td>";
						div += "			<td>登记批准日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.Data.软件著作 != "" && result.Data.软件著作 != undefined) {
							for (var i = 0; i < result.Data.软件著作.length; i++) {
								var info = result.Data.软件著作[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.软件名称) + "</td>";
								div += "		<td>" + nvlStr(info.版本号) + "</td>";
								div += "		<td>" + nvlStr(info.登记号) + "</td>";
								div += "		<td>" + nvlStr(info.登记批准日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无软件著作信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyCQInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyCQInfo();
					}else if(type[index]=="证书资质"){
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + type[index] + "（"+result.Data.证书资质.length+"）</span>";
						div += "</div>";
						
						div += "<div class=\"infoLabel\">证书资质</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>证书编号</td>";
						div += "			<td class=\"w25\">名称</td>";
						div += "			<td>类型</td>";
						div += "			<td>发证日期</td>";
						div += "			<td>截止日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.Data.证书资质 != "" && result.Data.证书资质 != undefined) {
							for (var i = 0; i < result.Data.证书资质.length; i++) {
								var info = result.Data.证书资质[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.证书编号) + "</td>";
								div += "		<td>" + nvlStr(info.名称) + "</td>";
								div += "		<td>" + nvlStr(info.类型) + "</td>";
								div += "		<td>" + nvlStr(info.发证日期) + "</td>";
								div += "		<td>" + nvlStr(info.截止日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"6\">暂无证书资质信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyCQInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyCQInfo();
					}else if(type[index]=="商标"){
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + type[index] + "（"+result.Data.商标.length+"）</span>";
						div += "</div>";
						
						div += "<div class=\"infoLabel\">商标</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>商标</td>";
						div += "			<td>注册号</td>";
						div += "			<td>状态</td>";
						div += "			<td>申请时间</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.Data.商标 != "" && result.Data.商标 != undefined) {
							for (var i = 0; i < result.Data.商标.length; i++) {
								var info = result.Data.商标[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td><img src=" + nvlStr(info.商标) +" width=\"150\"></td>";
								div += "		<td>" + nvlStr(info.注册号) + "</td>";
								div += "		<td>" + nvlStr(info.状态) + "</td>";
								div += "		<td>" + nvlStr(info.申请时间) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无证书资质信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyCQInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyCQInfo();
					}else if(type[index]=="作品著作"){
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + type[index] + "（"+result.Data.作品著作.length+"）</span>";
						div += "</div>";
						
						div += "<div class=\"infoLabel\">作品著作</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td class=\"w25\">作品名称</td>";
						div += "			<td>登记号</td>";
						div += "			<td>登记日期</td>";
						div += "			<td class=\"w50px\">类型</td>";
						div += "			<td>首次发表日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.Data.作品著作 != "" && result.Data.作品著作 != undefined) {
							for (var i = 0; i < result.Data.作品著作.length; i++) {
								var info = result.Data.作品著作[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.作品名称) + "</td>";
								div += "		<td>" + nvlStr(info.登记号) + "</td>";
								div += "		<td>" + nvlStr(info.登记日期) + "</td>";
								div += "		<td>" + nvlStr(info.类型) + "</td>";
								div += "		<td>" + nvlStr(info.首次发表日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"6\">暂无证书资质信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyCQInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyCQInfo();
					}else if(type[index]=="网站域名"){
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + type[index] + "（"+result.Data.网站域名.length+"）</span>";
						div += "</div>";
						
						div += "<div class=\"infoLabel\">证书资质</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>域名</td>";
						div += "			<td>网站名称</td>";
						div += "			<td>备案号</td>";
						div += "			<td>审核时间</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.Data.网站域名 != "" && result.Data.网站域名 != undefined) {
							for (var i = 0; i < result.Data.网站域名.length; i++) {
								var info = result.Data.网站域名[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td>" + nvlStr(info.域名) + "</td>";
								div += "		<td>" + nvlStr(info.网站名称) + "</td>";
								div += "		<td>" + nvlStr(info.备案号) + "</td>";
								div += "		<td>" + nvlStr(info.审核时间) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"5\">暂无网站域名信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyCQInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyCQInfo();
					}else if(type[index]=="专利"){
						div += "<div class=\"infoTitle\">";
						div += "	<span>" + type[index] + "（"+result.Data.专利.length+"）</span>";
						div += "</div>";
						
						div += "<div class=\"infoLabel\">专利</div>";
						div += "<table class=\"infoTable\">";
						div += "	<thead>";
						div += "		<tr>";
						div += "			<td class=\"w40px\">序号</td>";
						div += "			<td>标题</td>";
						div += "			<td>专利类型</td>";
						div += "			<td>授权公布日期</td>";
						div += "			<td>法律状态</td>";
						div += "			<td>申请号</td>";
						div += "			<td>申请日期</td>";
						div += "		</tr>";
						div += "	</thead>";
						div += "	<tbody>";
						if (result.Data.专利 != "" && result.Data.专利 != undefined) {
							for (var i = 0; i < result.Data.专利.length; i++) {
								var info = result.Data.专利[i];
								div += "	<tr>";
								div += "		<td>" + (i + 1) + "</td>";
								div += "		<td class=\"w20\">" + nvlStr(info.标题) + "</td>";
								div += "		<td class=\"w10\">" + nvlStr(info.专利类型) + "</td>";
								div += "		<td>" + nvlStr(info.授权公布日期) + "</td>";
								div += "		<td class=\"w20\">" + nvlStr(info.法律状态) + "</td>";
								div += "		<td>" + nvlStr(info.申请号) + "</td>";
								div += "		<td>" + nvlStr(info.申请日期) + "</td>";
								div += "	</tr>";
							}
						} else {
							div += "	<tr>";
							div += "		<td colspan=\"7\">暂无专利信息，不排除存在时间相对滞后或工商未公示的情况，仅供客户参考</td>";
							div += "	</tr>";
						}
						div += "	</tbody>"
						div += "</table>";
						$('#companyCQInfo').html(div);
						//弹出layer框并添加自定义关闭按钮
						openCompanyCQInfo();
					}
					
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	//用工招聘信息
	function getRecruitInfo(){
		var param = {
			"companyId" : $('#companyId').val(),//90020170915104247002126000000695,
			"pageNum":'1',
			"pageSize":'10',
			"tdsourcetag":'s_pctim_aiomsg'
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/recruitInfo/recruitInfoList",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					var div = '';
					if(result.infoList.length < 1){
						$("#recruit").html("<font class=\"unData\">暂无数据</font>");
					}else{
						for(var j=0;j<2;j++){
							for(var i = 0; i < result.infoList.length; i++){
								var info = result.infoList[i];
								div += '<li>';
								div += '<p>';
								div += '<span class="recruit-title">' + info.recruitTitle + '（共'+ info.recruitNumber +'人）</span>'
								div += '<span>'+info.recruitTime+'</span>'+'<div class="clearfix"></div></p>';
								var detail="";
								detail=getRecruitDetail(info.recruitId)
								div += '<span class="recruit-content">'+ detail + '</span>';
								div += '</li>';
							}
						}
						if(result.infoList.length > 3){
							$("#recruit").addClass("roll");
							$("#recruit").html(div);
						}else{
							$("#recruit").removeClass("roll");
							$("#recruit").html(div);
						}
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	//获取用工详情
	function getRecruitDetail(recruitId){
		var detail=""
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/recruitInfo/recruitDetail",
			type : "post",
		 	async: false,
			data : {
				recruitId:recruitId
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					detail=result.recruitInfo.recruitDetail
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
		return detail;
	}
	function getCompanyData2(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/companyInfo/companyPortrait",
			type : "post",
			data : {
				"companyId" : $('#companyId').val()
			},
			success : function(result){
				if(result.success){
					//企业信息数据
					if(result.companyInfo.logoUrl != "" &&  result.companyInfo.logoUrl != undefined){
						$("#logoUrl").attr("src",result.companyInfo.logoUrl);
					}
					if(result.companyInfo.companyName != "" &&  result.companyInfo.companyName != undefined){
						$("#companyTitleName").text(result.companyInfo.companyName);
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
	        //data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
	        data: ["1-3月","1-6月","1-9月","1-12月"],
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
	        //data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
	        data: ["1-3月","1-6月","1-9月","1-12月"],
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
	        //data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
	        data: ["1-3月","1-6月","1-9月","1-12月"],
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
			barWidth:'20',
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
            top: 40,
            bottom: 38,
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
	//风险指数配置
	var fz = 13;
	if(width <= 1600){
		fz = 10;
	}
	var radarOption = {
	    tooltip: {
	    	confine: true,
	    	textStyle: {
	    		fontSize: fz,
	    	},
	    	formatter:function(params){
				var text = "";
				for(var i=0;i<indicatorSource.length;i++){
					text += indicatorSource[i].name+":"+valueSource[i]+"</br>";
				}
				return text;
			},
	    },
	    radar: {
	    	triggerEvent: true,
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
	        name: '风险指数',
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
	                name : '风险指数'
	            }
	        ]
	    }]
	};
	function goindex(num){
		window.location.href='${ctx}/front/cityDataCenter/yzyyIndex/'+num+'?companyId='+$("#companyId").val()
	}
</script>
</html>