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
<%-- <link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/ldHomePage.css"/> --%>
<title>锂电大数据中心-新能源汽车</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="${orgId}">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
		<input type="hidden" id="type" name="type" value="">
	</form>
	<%@ include file="header.jsp"%>
	<div class="container-fluid content2 container-fluid-new">
		<div class="main">
			<div class="pro-left">
				<ul class="production">
					<li class="first-li" id="">
						<div class="product-type" id="gjcl">关键材料</div>
					</li>
					<li class="first-li on" id="">
						<div class="product-type" id="zc">整车</div>
					</li>
					<li class="first-li" id=""> 
						<div class="product-type" id="dc">电池</div>
					</li>
					<li class="first-li" id=""> 
						<div class="product-type" id="dj">电机</div>
					</li>
				</ul>
			</div>
			<div class="pro-right" style="padding: 0; height: 100%;">
			<div class="tabTitleBar">
				<div class="tabTitle">
				   	<span id="ne" name="title"  data="" class="on">新能源车</span>
				   	<span id="ec" name="title"  data="">EV乘用车</span>
				   	<span id="pc" name="title"  data="">PHEV乘用车</span>
				   	<span id="ek" name="title"  data="">EV客车</span>
				   	<span id="pk" name="title"  data="">PHEV客车</span>
				   	<span id="ez" name="title"  data="">EV专用车</span>
			   	</div>
			   	<div class="tabDate">
			   		<div class="selects" style="display: inline-block;">
						<div class="select">
							<p><font id="selectYear"></font><i class="fa fa-caret-down"></i></p>
							<div class="select-items">
								<ul id="sy">
									
								</ul>
							</div>
						</div>
					</div>
					<div class="selects" style="display: inline-block;">
						<div class="select">
							<p><font id="selectMonth">月</font><i class="fa fa-caret-down"></i></p>
							<div class="select-items">
								<ul id="sm">
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
			</div>
			   	<div class="tabContentBar">
			   		<div class="tabContent" id="tab1">
			   			<div class="logis-main" style="width: 60%;">
			   				<div class="boxStyle" style="height: 100%;">
								<!-- <div class="boxStyleBg"> -->
									<!-- <div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="dataDisplayBar">
											<div class="dataDisplay">
												<i></i>
												<div class="verCenter">
													<div class="dataSurvey"><font class="m">8</font>月产量（辆）</div>
													<div id="ne-byData" class="dataBrandValue"></div>
													<div class="dataRatio">
														<span>环比：</span><span class="dataRatioValue" id="ne-byhb">0%</span> 
														<span>同比：</span><span class="dataRatioValue" id="ne-bytb">0%</span>
													</div>
												</div>
											</div>
											<div class="dataDisplay">
												<i></i>
												<div class="verCenter">
													<div class="dataSurvey">1-<font class="m">8</font>月产量（辆）</div>
													<div id="ne-ljData" class="dataBrandValue"></div>
													<div class="dataRatio"> 
														<span>同比：</span><span class="dataRatioValue" id="ne-ljtb">0%</span>
													</div>
												</div>
											</div>
										</div>
										<div id="ne-chart1" style="height: calc(60% - 100px);"></div>
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年新能源汽车月产量及增长情况统计</span>
										</div>
										<div class="tabContBar hc40">
											<div id="ne-chart2" style="height: 100%;"></div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="logis-main" style="width: calc(40% - 10px);">
			   				<div class="boxStyle" style="height: 50%;">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月新能源车产量排名</span>
											<div class="tabMenuBar" data="1">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-ne-11">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ne-11-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-ne-12">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ne-12-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="boxStyle" style="height: calc(50% - 10px);">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年新能源汽车分类别产占比</span>
										</div>
										<div class="tabContBar">
											<div style="width: calc(100% + 18px); height: 100%; overflow: auto;">
												<div id="ne-chart3" style="width: calc(100% - 18px); height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab2">
			   			<div class="boxStyle" style="width: 100%; height: 50%;">
			   				<div class="logis-main">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox" style="width: 300px;">
											<div class="dataDisplayBar ver">
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey"><font class="m">8</font>月产量（辆）</div>
														<div id="ec-byData" class="dataBrandValue"></div>
														<div class="dataRatio">
															<span>环比：</span><span class="dataRatioValue" id="ec-byhb">0%</span> 
															<span>同比：</span><span class="dataRatioValue" id="ec-bytb">0%</span>
														</div>
													</div>
												</div>
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey">1-<font class="m">8</font>月产量（辆）</div>
														<div id="ec-ljData" class="dataBrandValue"></div>
														<div class="dataRatio"> 
															<span>同比：</span><span class="dataRatioValue" id="ec-ljtb">0%</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="inlineBox" style="width: calc(100% - 310px);">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年EV乘用车月产量及增长情况统计</span>
											</div>
											<div class="tabContBar">
												<div id="ec-chart1" style="width: 100%; height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="boxStyle" style="height: calc(50% - 10px);">
			   				<div class="logis-main" style="width: 70%;">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV乘用车装配电芯分形状(WMh)</span>
												<div class="tabMenuBar" data="1">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-ec-11">
													<div id="ec-chart2" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-ec-12">
													<div id="ec-chart22" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV乘用车装配电芯分类型(WMh)</span>
												<div class="tabMenuBar" data="2">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-ec-21">
													<div id="ec-chart3" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-ec-22">
													<div id="ec-chart32" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="logis-main" style="width: calc(30% - 10px);">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV乘用车产量排名</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-ec-31">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ec-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-ec-32">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ec-32-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab3">
			   			<div class="boxStyle" style="width: 100%; height: 50%;">
			   				<div class="logis-main" style="">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox" style="width: 300px;">
											<div class="dataDisplayBar ver">
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey"><font class="m">8</font>月产量（辆）</div>
														<div id="pc-byData" class="dataBrandValue"></div>
														<div class="dataRatio">
															<span>环比：</span><span class="dataRatioValue" id="pc-byhb">0%</span> 
															<span>同比：</span><span class="dataRatioValue" id="pc-bytb">0%</span>
														</div>
													</div>
												</div>
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey">1-<font class="m">8</font>月产量（辆）</div>
														<div id="pc-ljData" class="dataBrandValue"></div>
														<div class="dataRatio"> 
															<span>同比：</span><span class="dataRatioValue" id="pc-ljtb">0%</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="inlineBox" style="width: calc(100% - 310px);">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年PHEV乘用车月产量及增长情况统计</span>
											</div>
											<div class="tabContBar">
												<div id="pc-chart1" style="width: 100%; height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="boxStyle" style="height: calc(50% - 10px);">
			   				<div class="logis-main" style="width: 70%;">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月PHEV乘用车装配电芯分形状(WMh)</span>
												<div class="tabMenuBar" data="1">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-pc-11">
													<div id="pc-chart2" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-pc-12">
													<div id="pc-chart22" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月PHEV乘用车装配电芯分类型(WMh)</span>
												<div class="tabMenuBar" data="2">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-pc-21">
													<div id="pc-chart3" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-pc-22">
													<div id="pc-chart32" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="logis-main" style="width: calc(30% - 10px);">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月PHEV乘用车产量排名</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-pc-31">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-pc-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-pc-32">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-pc-32-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab4">
			   			<div class="boxStyle" style="width: 100%; height: 50%;">
			   				<div class="logis-main">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox" style="width: 300px;">
											<div class="dataDisplayBar ver">
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey"><font class="m">8</font>月产量（辆）</div>
														<div id="ek-byData" class="dataBrandValue"></div>
														<div class="dataRatio">
															<span>环比：</span><span class="dataRatioValue" id="ek-byhb">0%</span> 
															<span>同比：</span><span class="dataRatioValue" id="ek-bytb">0%</span>
														</div>
													</div>
												</div>
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey">1-<font class="m">8</font>月产量（辆）</div>
														<div id="ek-ljData" class="dataBrandValue"></div>
														<div class="dataRatio"> 
															<span>同比：</span><span class="dataRatioValue" id="ek-ljtb">0%</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="inlineBox" style="width: calc(100% - 310px);">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年EV客车月产量及增长情况统计</span>
											</div>
											<div class="tabContBar">
												<div id="ek-chart1" style="width: 100%; height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="boxStyle" style="height: calc(50% - 10px);">
			   				<div class="logis-main" style="width: 70%;">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV客车装配电芯分形状</span>
												<div class="tabMenuBar" data="1">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-ek-11">
													<div id="ek-chart2" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-ek-12">
													<div id="ek-chart22" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV客车装配电芯分类型</span>
												<div class="tabMenuBar" data="2">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-ek-21">
													<div id="ek-chart3" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-ek-22">
													<div id="ek-chart32" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="logis-main" style="width: calc(30% - 10px);">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV客车产量排名</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-ek-31">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ek-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-ek-32">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ek-32-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab5">
			   			<div class="boxStyle" style="width: 100%; height: 50%;">
			   				<div class="logis-main" style="">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox" style="width: 300px;">
											<div class="dataDisplayBar ver">
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey"><font class="m">8</font>月产量（辆）</div>
														<div id="pk-byData" class="dataBrandValue"></div>
														<div class="dataRatio">
															<span>环比：</span><span class="dataRatioValue" id="pk-byhb">0%</span> 
															<span>同比：</span><span class="dataRatioValue" id="pk-bytb">0%</span>
														</div>
													</div>
												</div>
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey">1-<font class="m">8</font>月产量（辆）</div>
														<div id="pk-ljData" class="dataBrandValue"></div>
														<div class="dataRatio"> 
															<span>同比：</span><span class="dataRatioValue" id="pk-ljtb">0%</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="inlineBox" style="width: calc(100% - 310px);">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年PHEV客车月产量及增长情况统计</span>
											</div>
											<div class="tabContBar">
												<div id="pk-chart1" style="width: 100%; height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="boxStyle" style="height: calc(50% - 10px);">
			   				<div class="logis-main" style="width: 70%;">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月PHEV客车装配电芯分形状</span>
												<div class="tabMenuBar" data="1">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-pk-11">
													<div id="pk-chart2" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-pk-12">
													<div id="pk-chart22" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月PHEV客车装配电芯分类型</span>
												<div class="tabMenuBar" data="2">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-pk-21">
													<div id="pk-chart3" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-pk-22">
													<div id="pk-chart32" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="logis-main" style="width: calc(30% - 10px);">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月PHEV客车产量排名</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-pk-31">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-pk-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-pk-32">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-pk-32-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab6">
			   			<div class="boxStyle" style="width: 100%; height: 50%;">
			   				<div class="logis-main" style="">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox" style="width: 300px;">
											<div class="dataDisplayBar ver">
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey"><font class="m">8</font>月产量（辆）</div>
														<div id="ez-byData" class="dataBrandValue"></div>
														<div class="dataRatio">
															<span>环比：</span><span class="dataRatioValue" id="ez-byhb">0%</span> 
															<span>同比：</span><span class="dataRatioValue" id="ez-bytb">0%</span>
														</div>
													</div>
												</div>
												<div class="dataDisplay">
													<i></i>
													<div class="verCenter">
														<div class="dataSurvey">1-<font class="m">8</font>月产量（辆）</div>
														<div id="ez-ljData" class="dataBrandValue"></div>
														<div class="dataRatio"> 
															<span>同比：</span><span class="dataRatioValue" id="ez-ljtb">0%</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="inlineBox" style="width: calc(100% - 310px);">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年EV专用车月产量及增长情况统计</span>
											</div>
											<div class="tabContBar">
												<div id="ez-chart1" style="width: 100%; height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="boxStyle" style="height: calc(50% - 10px);">
			   				<div class="logis-main" style="width: 70%;">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV专用车装配电芯分形状</span>
												<div class="tabMenuBar" data="1">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-ez-11">
													<div id="ez-chart2" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-ez-12">
													<div id="ez-chart22" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV专用车装配电芯分类型</span>
												<div class="tabMenuBar" data="2">
													<i></i>
													<span class="tabMenu on">当月</span>
													<span class="tabMenu">累计</span>
												</div>
											</div>
											<div class="tabContBar">
												<div class="tabCont" id="tab-ez-21">
													<div id="ez-chart3" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="tabCont" id="tab-ez-22">
													<div id="ez-chart32" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="logis-main" style="width: calc(30% - 10px);">
								<!-- <div class="boxStyleBg">
									<div class="left-top-radius"></div>
									<div class="left-bottom-radius"></div>
									<div class="right-top-radius"></div>
									<div class="right-bottom-radius"></div>
									<div class="top-line"></div>
									<div class="bottom-line"></div>
									<div class="left-line"></div>
									<div class="right-line"></div> -->
									<div class="outsideBox">
										<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
										<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
										<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
										<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月EV专用车产量排名</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-ez-31">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ez-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-ez-32">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">产量(辆)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ez-32-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   	</div>
				
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/liData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script>
$(function () {
	getselectYear();
	getTotalVehicleData();
	//getVehicleData();
	
	//左侧菜单栏点击事件
	$(".product-type").on("click",function(){
		$(this).parent().addClass("on").siblings().removeClass("on");
		$(this).parent().siblings().find(".product-item").slideUp();
		$(this).siblings(".product-item").slideDown();
		if($(this).attr("id") == "gjcl"){
			alert('正在建设中！');
		}else if($(this).attr("id") == "zc"){
			window.location.href = "${ctx}/front/cityDataCenter/ycLdIndex/11";
		}else if($(this).attr("id") == "dc"){
			window.location.href = "${ctx}/front/cityDataCenter/ycLdIndex/12";
		}else if($(this).attr("id") == "dj"){
			alert('正在建设中！');
		}else{}
	})
	$(".second-li").on("click",function(){
		$(".second-li").removeClass("on")
		$(this).addClass("on");
	})
	//顶部菜单栏切换事件
	$(".tabTitle>span").on("click",function(){
		var ind = $(this).index()+1;
		$("#type").val(ind-1);
		$(this).addClass("on").siblings().removeClass("on");
		$(".tabContent").fadeOut("fast");
		setTimeout(function(){
			$("#tab"+ind).fadeIn("fast");
		},210);
		//初始化
		setTimeout(function(){
			if(ind == 1){
				getTotalVehicleData();
			}else if(ind == 2 || ind == 3 || ind == 4 || ind == 5 || ind == 6){
				getVehicleData();
			}else{}
		},300)
	})
	//下拉框点击事件
	$(".select p").on("click",function(){
		$(this).next().slideToggle();
	})
	//框格内可切换栏（eg：当月-累计）
	$(".tabMenuBar .tabMenu").on("click",function(){
		var ind = $(this).index();
		var val = $(this).parent().attr('data');
		$(this).addClass("on").siblings().removeClass("on");
		var tab = $(".tabTitle .on").attr("id");
		//console.log(ind,val,tab,"#tab-"+tab+"-"+val+ind)
		$("#tab-"+tab+"-"+val+ind).fadeIn("fast").siblings().fadeOut("fast");
		
		if(ind == 1){
			$(this).parent().prev().find(".plus").css("display","none")
		}else if(ind == 2){
			$(this).parent().prev().find(".plus").css("display","inline-block")
		}else{}
	})
});
//设置年份及年月点击事件
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    for(var i=y; 2015<i+1;i--){
    	$('.select #sy').append('<li>'+i+'</li>');
    }
    
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		if($(this).parent().attr('id')=='sy'){
			//修改下拉组件默认值
 			$('#selectYear').text($(this).text());
			//修改隐藏属性
 			$('#year').val($(this).text());
			
			$(".tabCaption .y").text($(this).text());
		}else if($(this).parent().attr('id')=='sm'){
			//修改下拉组件默认值
			$('#selectMonth').text($(this).text());
			//修改隐藏属性
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			$('#month').val(month);
			
			$(".dataSurvey .m").text(month);
			$(".tabCaption .m").text(month);
		}else{}
		
		if($("#ne").hasClass("on")){
			getTotalVehicleData();
		}else if($("#ec").hasClass("on") || $("#pc").hasClass("on") || $("#ek").hasClass("on") || $("#pk").hasClass("on") || $("#ez").hasClass("on")){
			getVehicleData();
		}
	})
}
function getTotalVehicleData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/energyCar/show",
		type : "post",
		data : {
			"year" : $('#year').val(),
			"month" : $('#month').val(),
		},
		success : function(result) {
			console.log(result)
			if (result.success) {
				$('#selectYear').text(result.data.year);
				$('#year').val(result.data.year);
				$('#selectMonth').text(result.data.month+"月");
				$('#month').val(result.data.month);
				$(".tabCaption .y").text(result.data.year);
				$(".dataSurvey .m").text(result.data.month);
				$(".tabCaption .m").text(result.data.month);
				
				if(result.data.data != undefined && result.data.data.pieData.per != "" && result.data.data.pieData.per != undefined){
					$("#ne-bytb").text(result.data.data.pieData.per+"%")
				}else{
					$("#ne-bytb").text("0%")
				}
				if(result.data.data != undefined && result.data.data.pieData.ratio != "" && result.data.data.pieData.ratio != undefined){
					$("#ne-byhb").text(result.data.data.pieData.ratio+"%")
				}else{
					$("#ne-byhb").text("0%")
				}
				if(result.data.data != undefined && result.data.data.pieData.grandPer != "" && result.data.data.pieData.grandPer != undefined){
					$("#ne-ljtb").text(result.data.data.pieData.grandPer+"%")
				}else{
					$("#ne-ljtb").text("0%")
				}
				$("#ne-byData").empty();
				setTimeout(function(){
					if(result.data.data != undefined && result.data.data.pieData.total != "" && result.data.data.pieData.total != undefined){
						$("#ne-byData").rollNum({
					    	deVal: result.data.data.pieData.total,
					    	digit: result.data.data.pieData.total.toString().length
					    });
					}else{
						$("#ne-byData").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
				},300)
				$("#ne-ljData").empty();
				setTimeout(function(){
					if(result.data.data != undefined && result.data.data.pieData.grandTotal != "" && result.data.data.pieData.grandTotal != undefined){
						$("#ne-ljData").rollNum({
					    	deVal: result.data.data.pieData.grandTotal,
					    	digit: result.data.data.pieData.grandTotal.toString().length
					    });
					}else{
						$("#ne-ljData").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
				},300)
				
				//双饼图数据
				if(result.data.data != undefined && result.data.data.pieData.legend != "" && result.data.data.pieData.legend != undefined){
					var div_ = document.getElementById("ne-chart1");
					div_.removeAttribute("_echarts_instance_");
					var doublePieChart = echarts.init(div_);
					//var doublePieChart = echarts.init(document.getElementById("ne-chart1"));
					doublePieOption.legend.data = result.data.data.pieData.legend;
					doublePieOption.series[0].data = result.data.data.pieData.series;
					doublePieOption.series[1].data = result.data.data.pieData.seriesTotal;
					doublePieChart.setOption(doublePieOption);
				}else{
					$("#ne-chart1").html("<font class=\"unData\">暂无数据</font>");
				}
				
				//双折线柱状图数据
				if(result.data.data != undefined && result.data.data.barData1.legend != "" && result.data.data.barData1.legend != undefined){
					var div_ = document.getElementById("ne-chart2");
					div_.removeAttribute("_echarts_instance_");
					var doubleLineBarChart = echarts.init(div_);
					//var doubleLineBarChart = echarts.init(document.getElementById("ne-chart2"));
					doubleLineBarOption.legend.data = result.data.data.barData1.legend;
					doubleLineBarOption.xAxis.data = result.data.data.barData1.xAxis;
					doubleLineBarOption.series[0].name = result.data.data.barData1.legend[0];
					doubleLineBarOption.series[0].data = result.data.data.barData1.seriesBar1;
					doubleLineBarOption.series[1].name = result.data.data.barData1.legend[1];
					doubleLineBarOption.series[1].data = result.data.data.barData1.seriesBar2;
					doubleLineBarOption.series[2].name = result.data.data.barData1.legend[2];
					doubleLineBarOption.series[2].data = result.data.data.barData1.seriesLine1;
					doubleLineBarOption.series[3].name = result.data.data.barData1.legend[3];
					doubleLineBarOption.series[3].data = result.data.data.barData1.seriesLine2;
					doubleLineBarChart.setOption(doubleLineBarOption);
				}else{
					$("#ne-chart2").html("<font class=\"unData\">暂无数据</font>");
				}
				
				//当月产量排名表格
				$("#tab-ne-11-table").empty();
				if(result.data.data != undefined && result.data.data.listData.monthList != "" && result.data.data.listData.monthList){
					var _div = "";
					for(var i=0 ; i<result.data.data.listData.monthList.length ; i++){
						var info = result.data.data.listData.monthList[i];
						_div += "	<tr>";
						_div += "		<td class=\"w10\">"+info.order+"</td>";
						_div += "		<td class=\"w30\">"+info.group+"</td>";
						_div += "		<td class=\"w30\">"+info.yield+"</td>";
						_div += "		<td class=\"w30\">"+info.proportion+"%</td>";
						_div += "	</tr>";
					}
					$("#tab-ne-11-table").append(_div);
					if($("#tab-ne-11-table").height() > $("#tab-ne-11-table").parent().height()){
						$("#tab-ne-11-table").append(_div);
						$("#tab-ne-11-table").addClass('roll');
					};
					$("#tab-ne-11-table").next().hide();
				}else{
					$("#tab-ne-11-table").next().show();
				}
				
				//累计产量排名表格
				$("#tab-ne-12-table").empty();
				if(result.data.data != undefined && result.data.data.listData.monthTotalList != "" && result.data.data.listData.monthTotalList){
					var _div = "";
					for(var i=0 ; i<result.data.data.listData.monthTotalList.length ; i++){
						var info = result.data.data.listData.monthTotalList[i];
						_div += "	<tr>";
						_div += "		<td class=\"w10\">"+info.order+"</td>";
						_div += "		<td class=\"w30\">"+info.group+"</td>";
						_div += "		<td class=\"w30\">"+info.yield+"</td>";
						_div += "		<td class=\"w30\">"+info.proportion+"%</td>";
						_div += "	</tr>";
					}
					$("#tab-ne-12-table").append(_div);
					if($("#tab-ne-12-table").height() > $("#tab-ne-12-table").parent().height()){
						$("#tab-ne-12-table").append(_div);
						$("#tab-ne-12-table").addClass('roll');
					};
					$("#tab-ne-12-table").next().hide();
				}else{
					$("#tab-ne-12-table").next().show();
				}
				
				//横向柱状图数据
				if(result.data.data != undefined && result.data.data.barData2.legend != "" && result.data.data.barData2.legend != undefined){
					//控制横向柱状图的高度
					var num = result.data.data.barData2.yAxis.length;
					var vheight = (num-0.5)*48;
					$("#ne-chart3").css("height",vheight);
					
					var div_ = document.getElementById("ne-chart3");
					div_.removeAttribute("_echarts_instance_");
					var horizontalFoldBarChart = echarts.init(div_);
					//var horizontalFoldBarChart = echarts.init(document.getElementById("ne-chart3"));
					horizontalFoldBarOption.legend.data = result.data.data.barData2.legend;
					horizontalFoldBarOption.yAxis.data = result.data.data.barData2.yAxis;
					horizontalFoldBarOption.series[0].name = result.data.data.barData2.legend[0];
					horizontalFoldBarOption.series[0].data = result.data.data.barData2.series1;
					horizontalFoldBarOption.series[1].name = result.data.data.barData2.legend[1];
					horizontalFoldBarOption.series[1].data = result.data.data.barData2.series2;
					horizontalFoldBarOption.series[2].name = result.data.data.barData2.legend[2];
					horizontalFoldBarOption.series[2].data = result.data.data.barData2.series3;
					horizontalFoldBarOption.series[3].name = result.data.data.barData2.legend[3];
					horizontalFoldBarOption.series[3].data = result.data.data.barData2.series4;
					horizontalFoldBarOption.series[4].name = result.data.data.barData2.legend[4];
					horizontalFoldBarOption.series[4].data = result.data.data.barData2.series5;
					horizontalFoldBarChart.setOption(horizontalFoldBarOption);
				}else{
					$("#ne-chart3").css("height","100%");
					$("#ne-chart3").html("<font class=\"unData\">暂无数据</font>");
				}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getVehicleData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/carType/show",
		type : "post",
		data : {
			"year" : $('#year').val(),
			"month" : $('#month').val(),
			"type" : $('#type').val()
		},
		success : function(result) {
			console.log(result)
			if (result.success) {
				var tab = $(".tabTitle .on").attr("id");
				
				if(tab != "ne"){
					if(result.data.data != undefined && result.data.data.barData.per != "" && result.data.data.barData.per != undefined){
						$("#"+tab+"-bytb").text(result.data.data.barData.per+"%")
					}else{
						$("#"+tab+"-bytb").text("0%")
					}
					if(result.data.data != undefined && result.data.data.barData.ratio != "" && result.data.data.barData.ratio != undefined){
						$("#"+tab+"-byhb").text(result.data.data.barData.ratio+"%")
					}else{
						$("#"+tab+"-byhb").text("0%")
					}
					if(result.data.data != undefined && result.data.data.barData.grandPer != "" && result.data.data.barData.grandPer != undefined){
						$("#"+tab+"-ljtb").text(result.data.data.barData.grandPer+"%")
					}else{
						$("#"+tab+"-ljtb").text("0%")
					}
					$("#"+tab+"-byData").empty();
					setTimeout(function(){
						if(result.data.data != undefined && result.data.data.barData.total != "" && result.data.data.barData.total != undefined){
							$("#"+tab+"-byData").rollNum({
						    	deVal: result.data.data.barData.total,
						    	digit: result.data.data.barData.total.toString().length
						    });
						}else{
							$("#"+tab+"-byData").rollNum({
						    	deVal: Number(0),
						    	digit: Number(0).toString().length
						    });
						}
					},300)
					$("#"+tab+"-ljData").empty();
					setTimeout(function(){
						if(result.data.data != undefined && result.data.data.barData.grandTotal != "" && result.data.data.barData.grandTotal != undefined){
							$("#"+tab+"-ljData").rollNum({
						    	deVal: result.data.data.barData.grandTotal,
						    	digit: result.data.data.barData.grandTotal.toString().length
						    });
						}else{
							$("#"+tab+"-ljData").rollNum({
						    	deVal: Number(0),
						    	digit: Number(0).toString().length
						    });
						}
					},300)
					
					//双折线柱状图数据
					if(result.data.data != undefined && result.data.data.barData.legend != "" && result.data.data.barData.legend != undefined){
						var div_ = document.getElementById(tab+"-chart1");
						div_.removeAttribute("_echarts_instance_");
						var doubleLineBarChart = echarts.init(div_);
						//var doubleLineBarChart = echarts.init(document.getElementById(tab+"-chart1"));
						doubleLineBarOption.legend.data = result.data.data.barData.legend;
						doubleLineBarOption.xAxis.data = result.data.data.barData.xAxis;
						doubleLineBarOption.series[0].name = result.data.data.barData.legend[0];
						doubleLineBarOption.series[0].data = result.data.data.barData.seriesBar1;
						doubleLineBarOption.series[1].name = result.data.data.barData.legend[1];
						doubleLineBarOption.series[1].data = result.data.data.barData.seriesBar2;
						doubleLineBarOption.series[2].name = result.data.data.barData.legend[2];
						doubleLineBarOption.series[2].data = result.data.data.barData.seriesLine1;
						doubleLineBarOption.series[3].name = result.data.data.barData.legend[3];
						doubleLineBarOption.series[3].data = result.data.data.barData.seriesLine2;
						doubleLineBarChart.setOption(doubleLineBarOption);
					}else{
						$("#"+tab+"-chart1").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//形状饼图数据
					if(result.data.data != undefined && result.data.data.perData.perShape.legend != "" && result.data.data.perData.perShape.legend != undefined){
						var div_ = document.getElementById(tab+"-chart2");
						div_.removeAttribute("_echarts_instance_");
						var shapePieChart = echarts.init(div_);
						//var shapePieChart = echarts.init(document.getElementById(tab+"-chart2"));
						shapePieOption.legend.data = result.data.data.perData.perShape.legend;
						shapePieOption.yAxis.data = result.data.data.perData.perShape.legend;
						shapePieOption.series[0].data = result.data.data.perData.perShape.seriesMonth;
						shapePieOption.series[2].data = result.data.data.perData.perShape.seriesMonth;
						shapePieChart.setOption(shapePieOption);
					}else{
						$("#"+tab+"-chart2").html("<font class=\"unData\">暂无数据</font>");
					}
					if(result.data.data != undefined && result.data.data.perData.perShape.legend != "" && result.data.data.perData.perShape.legend != undefined){
						var div_ = document.getElementById(tab+"-chart22");
						div_.removeAttribute("_echarts_instance_");
						var shapePieChart = echarts.init(div_);
						//var shapePieChart = echarts.init(document.getElementById(tab+"-chart22"));
						shapePieOption.legend.data = result.data.data.perData.perShape.legend;
						shapePieOption.yAxis.data = result.data.data.perData.perShape.legend;
						shapePieOption.series[0].data = result.data.data.perData.perShape.seriesMonthTotal;
						shapePieOption.series[2].data = result.data.data.perData.perShape.seriesMonthTotal;
						shapePieChart.setOption(shapePieOption);
					}else{
						$("#"+tab+"-chart22").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//形状饼图数据
					if(result.data.data != undefined && result.data.data.perData.perType.legend != "" && result.data.data.perData.perType.legend != undefined){
						var div_ = document.getElementById(tab+"-chart3");
						div_.removeAttribute("_echarts_instance_");
						var typePieChart = echarts.init(div_);
						//var typePieChart = echarts.init(document.getElementById(tab+"-chart3"));
						typePieOption.legend.data = result.data.data.perData.perType.legend;
						typePieOption.yAxis.data = result.data.data.perData.perType.legend;
						typePieOption.series[0].data = result.data.data.perData.perType.seriesMonth;
						typePieOption.series[2].data = result.data.data.perData.perType.seriesMonth;
						typePieChart.setOption(typePieOption);
					}else{
						$("#"+tab+"-chart3").html("<font class=\"unData\">暂无数据</font>");
					}
					if(result.data.data != undefined && result.data.data.perData.perType.legend != "" && result.data.data.perData.perType.legend != undefined){
						var div_ = document.getElementById(tab+"-chart32");
						div_.removeAttribute("_echarts_instance_");
						var typePieChart = echarts.init(div_);
						//var typePieChart = echarts.init(document.getElementById(tab+"-chart32"));
						typePieOption.legend.data = result.data.data.perData.perType.legend;
						typePieOption.yAxis.data = result.data.data.perData.perType.legend;
						typePieOption.series[0].data = result.data.data.perData.perType.seriesMonthTotal;
						typePieOption.series[2].data = result.data.data.perData.perType.seriesMonthTotal;
						typePieChart.setOption(typePieOption);
					}else{
						$("#"+tab+"-chart32").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//当月产量排名表格
					$("#tab-"+tab+"-31-table").empty();
					if(result.data.data != undefined && result.data.data.listData.monthList != "" && result.data.data.listData.monthList){
						var _div = "";
						for(var i=0 ; i<result.data.data.listData.monthList.length ; i++){
							var info = result.data.data.listData.monthList[i];
							_div += "	<tr>";
							_div += "		<td class=\"w10\">"+info.order+"</td>";
							_div += "		<td class=\"w30\">"+info.group+"</td>";
							_div += "		<td class=\"w30\">"+info.yield+"</td>";
							_div += "		<td class=\"w30\">"+info.proportion+"%</td>";
							_div += "	</tr>";
						}
						$("#tab-"+tab+"-31-table").append(_div);
						if($("#tab-"+tab+"-31-table").height() > $("#tab-"+tab+"-31-table").parent().height()){
							$("#tab-"+tab+"-31-table").append(_div);
							$("#tab-"+tab+"-31-table").addClass('roll');
						};
						$("#tab-"+tab+"-31-table").next().hide();
					}else{
						$("#tab-"+tab+"-31-table").next().show();
					}
					
					//累计产量排名表格
					$("#tab-"+tab+"-32-table").empty();
					if(result.data.data != undefined && result.data.data.listData.monthTotalList != "" && result.data.data.listData.monthTotalList){
						var _div = "";
						for(var i=0 ; i<result.data.data.listData.monthTotalList.length ; i++){
							var info = result.data.data.listData.monthTotalList[i];
							_div += "	<tr>";
							_div += "		<td class=\"w10\">"+info.order+"</td>";
							_div += "		<td class=\"w30\">"+info.group+"</td>";
							_div += "		<td class=\"w30\">"+info.yield+"</td>";
							_div += "		<td class=\"w30\">"+info.proportion+"%</td>";
							_div += "	</tr>";
						}
						$("#tab-"+tab+"-32-table").append(_div);
						if($("#tab-"+tab+"-32-table").height() > $("#tab-"+tab+"-32-table").parent().height()){
							$("#tab-"+tab+"-32-table").append(_div);
							$("#tab-"+tab+"-32-table").addClass('roll');
						};
						$("#tab-"+tab+"-32-table").next().hide();
					}else{
						$("#tab-"+tab+"-32-table").next().show();
					}
					
				}
				
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}

//双饼图配置
var doublePieOption = {
	tooltip: {
		show:true,
		formatter:function(param){
			console.log(param)
			var tip='';
			tip+=param.seriesName+'<br/>'+ param.marker + param.name+ ':' + param.value +"("+ (param.percent).toFixed(0)+"%)";
			return tip;
		}
	},
	legend: {
		bottom: 10,
		left: 'center',	
		itemGap:15,	
		itemWidth :11,
		itemHeight:11,
		textStyle:{
			color:'#03E0C2'
		},
		data: ['EV乘用车', 'PHEV乘用车', 'EV客车', 'PHEV客车', 'EV专用车']
	},
	color:['#2261FF','#CE39FF','#19CC61','#FF3964','#FFDA3E'],
	series: [{
		name: '产量（辆）',
		type: 'pie',
		startAngle:100,
		radius: '70%',
		center: ['25%', '45%'],
		selectedMode: 'single',
		label:{
			normal:{
				formatter:'{c}',
				fontSize:14,
				color:'#fff'
			}
		},
		labelLine:{
			normal:{
				position:'outer',
				lineStyle: {
	             	color: "#fff"  // 改变标示线的颜色
	          	},
			}
		},
		itemStyle: {
			emphasis: {
				shadowBlur: 10,
				shadowOffsetX: 0,
				shadowColor: 'rgba(0, 0, 0, 0.5)'
			}
		},
		data:[
               {value:100,name: 'EV乘用车'},
               {value:30, name: 'EV客车'},
               {value:10, name: 'PHEV乘用车'},
               {value:20, name: 'EV专用车'},
               {value:40, name: 'PHEV客车'}
           ]
	},{
		name: '产量（辆）',
		type: 'pie',
		startAngle:100,
		radius: '70%',
		center: ['75%', '45%'],
		selectedMode: 'single',
		label:{
			normal:{
				formatter:'{c}',
				fontSize:14,
				color:'#fff'
			}
		},
		labelLine:{
			normal:{
				position:'inter',
				lineStyle: {
	             	color: "#fff"  // 改变标示线的颜色
	          	}
			}
		},
		itemStyle: {
			emphasis: {
				shadowBlur: 10,
				shadowOffsetX: 0,
				shadowColor: 'rgba(0, 0, 0, 0.5)'
			}
		},
		data:[
               {value:100,name: 'EV乘用车'},
               {value:30, name: 'EV客车'},
               {value:10, name: 'PHEV乘用车'},
               {value:20, name: 'EV专用车'},
               {value:40, name: 'PHEV客车'}
           ]
	}]
};

//双折线柱状图
var doubleLineBarOption = {
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
		selectedMode: true,
		data: ['2017年产量(辆)','2018年产量(辆)','2018年环比(%)','2018年同比(%)'],
		left: 'center',
		bottom:'0',
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
		bottom:'20%'
	},
	xAxis: [{
		type: 'category',
		data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
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
			type: 'shadow'
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
		/* min: 0,
		max: 700000,
		interval: 100000 */
	},{
		type: 'value',
		splitLine: {
		show: false
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
		},
		/* min: -100,
		max: 600, //最大值
		interval: 100 //间隔值#35AAE0 */
	}],
	series: [{
		name: '2017年产量(辆)',
		type: 'bar',
		barWidth: 15,
		itemStyle: {
			normal: {
				color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
					offset: 0,
					color: '#12A9BB'
				}, {
					offset:0.5,
					color:'#1B92BA'
				},{
					offset: 1,
					color: '#3352B9'
				}]),
			}
		},
		data: [400000, 200000, 400000, 600000, 180000, 170000, 650000, 160000, 640000,400000, 600000, 180000]
	},{
		name: '2018年产量(辆)',
		type: 'bar',
		barWidth: 15,
		itemStyle: {
			normal: {
				color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
						offset: 0,
						color: '#FFCF53'
					}, {
						offset: 1,
						color: '#FF913E'
					}
				]),
			}
		},
		data: [700000, 200000, 180000, 390000, 180000, 510000, 520000, 320000, 540000,140000, 60000, 130000],
	},{
		name: '2018年环比(%)',
		type: 'line',
		symbol: 'circle',
		symbolSize: 7,
		yAxisIndex: 1, //索引从0开始
		itemStyle: {
			normal: {
				color: '#FF172D'
			}
		},
		data: [200,100,94,400,300,140,250,160,520,420,120,400]
	},{
		name: '2018年同比(%)',
		type: 'line',
		symbol: 'circle',
		symbolSize: 7,
		yAxisIndex: 1, //索引从0开始
		itemStyle: {
			normal: {
				color: '#19cc61'
			}
		},
		data: [250,160,520,420,120,200,100,94,400,300,140,400]
	}],
};

//横向叠加柱状图配置
var horizontalFoldBarOption = {
	color:['#FF8518','#2AA167','#A500D5','#DD1B3B','#0038B6'],
	tooltip: {
		trigger: 'axis',
		axisPointer: {
			type: 'shadow'
		},
		// formatter: '{b} <br />{a0}: {c0}'+'%'+'<br />{a1}: {c1}'+'%'+' <br />{a2}: {c2}'+'%'+' <br />{a3}: {c3}'+'%'+' <br />{a4}: {c4}'+'%'
		formatter : function(params) {
			var tip = params[0].name+'<br/>';
			for (var i = 0; i < params.length; i++) {//这里是自己定义样式， params[i].marker 表示是否显示左边的那个小圆圈
				if (params[i].value != 0) {
					tip = tip + params[i].marker + params[i].seriesName+ ':' + params[i].value + '% <br/>';
				}
			}
			return tip;
		},
	},
	legend: {
		left: 'center',
		top:5,
		itemGap:15,	
		itemWidth :11,
		itemHeight:11,
		data: ['EV乘用车', 'PHEV乘用车', 'EV客车', 'PHEV客车', 'EV专用车'],
		textStyle: {
			color: '#03E0C2'
		}
	},
	grid: {
		left: '15%',
		right: '1%',
		top: '10%',
		bottom:'9%'
	},
	xAxis: {
		type: 'value',
		splitLine: {
			show: true,
			lineStyle: {
				opacity:0.4
			}
		},
		axisTick: {
			show: false
		},
		axisLabel: {
			formatter: '{value}%',
			color: '#83ADBA'
		},
		axisLine: {
			show:false
		},
		/* min: 0,
		max: 100, */
	},
	yAxis: {
		type: 'category',
		splitLine: {
			show: false
		},
		axisTick: {
			show: false
		},
		axisLabel: {
			color: '#83ADBA'
		},
		axisLine: {
			lineStyle: {
				color: 'rgba(238,238,238,0.4)'
			}
		},
		data: ['1月占比', '2月占比', '3月占比', '4月占比', '5月占比', '6月占比', '累计占比']
	},
	series: [{
		name: 'EV乘用车',
		type: 'bar',
		stack: 1,
		barWidth: 25,
		label: {
			normal: {//控制显示，防止label溢出
				formatter:function(param){
					if(param.value>=5){
						return (param.value+'%')
					}else{
						return ''
					}

				},
				show: true,
				position: 'inside'
			}
		},
		data: [20, 10, 25, 25, 20, 10, 10]
	}, {
		name: 'PHEV乘用车',
		type: 'bar',
		stack: 1,
		label: {
			normal: {
				formatter:function(param){
					if(param.value>=5){
						return (param.value+'%')
					}else{
						return ''
					}

				},
				show: true,
				position: 'inside'
			}
		},
		data: [15, 20, 5, 30, 15, 25, 25]
	}, {
		name: 'EV客车',
		type: 'bar',
		stack: 1,
		label: {
			normal: {
				formatter:function(param){
					if(param.value>=5){
						return (param.value+'%')
					}else{
						return ''
					}

				},
				show: true,
				position: 'inside'
			}
		},
		data: [15, 25, 25, 15, 15, 25, 25]
	}, {
		name: 'PHEV客车',
		type: 'bar',
		stack: 1,
		label: {
			normal: {
				formatter:function(param){
					if(param.value>=5){
						return (param.value+'%')
					}else{
						return ''
					}

				},
				show: true,
				position: 'inside'
			}
		},
		data: [25, 25, 30, 25, 30, 20, 37]
	},{
		name: 'EV专用车',
		type: 'bar',
		stack: 1,
		label: {
			normal: {
				formatter:function(param){
					if(param.value>=5){
						return (param.value+'%')
					}else{
						return ''
					}

				},
				show: true,
				position: 'inside'
			}
		},
		data: [25, 20, 15, 5, 20, 20, 3]
	}]
};

//形状饼图配置
var shapePieOption = {
	tooltip: {
		show:true,
		formatter:function(param){
			var tip='';
			if(param.componentSubType=='pie'){
				tip+=param.marker + param.name+ ':' + param.value;
				return tip;
			}
			else{
				tip+=param.name+ ':' + param.value;
				return tip;
			}
		}
	},
	legend: {
		bottom: 0,
		left: 'center',	
		itemWidth :11,
		itemHeight:11,
		itemGap:15,	
		textStyle:{
			color:'#03E0C2'
		},
		data: ['方形','软包','圆柱']
	},
	color:['#CE39FF','#FFDA3E','#FF3964'],
	xAxis: [{
			type: 'value',
			axisLabel: {
				show: false,
				interval: 1,
				textStyle: {
					color: '#fff',
					fontSize: 12
				}
			},
			axisLine: {
				show: false
			},
			axisTick: {
				show: false
			},
			splitLine: {
				show: false
			}

		}
	],
	yAxis:{
		type: 'category',
		data: ['圆柱','软包','方形'],
		inverse: true,
		axisLabel:{
			show:false
		},
		axisTick: {
			show: false
		},
		axisLine: {
			show: false
		},
	},
	grid:{
		left:'60%',
		right:'20%',
		top:'20%',
		bottom:'20%'
	},
	series: [{
		name: 'pie',
		type: 'pie',
		radius: '55%',
		center: ['30%', '45%'],
		selectedMode: 'single',
		
		label:{
			normal:{
				formatter:'{d}'+'%',
				fontSize:12,
				color:'#fff'
			}
		},
		labelLine:{
			normal:{
				position:'outer',
				lineStyle: {
	             	color: "#fff"  // 改变标示线的颜色
	          	},
			}
		},
		itemStyle: {
			emphasis: {
				shadowBlur: 10,
				shadowOffsetX: 0,
				shadowColor: 'rgba(0, 0, 0, 0.5)'
			}
		},
		labelLine: {
        	length: 10,
        	length2: 10,
		},
		data:[
			{value:50, name: '方形'},
			{value:40, name: '软包'},
			{value:10, name: '圆柱'},
		]
	},{
		show: true,
		type: 'bar',
		barGap: '-100%',
		barWidth: '18', //统计条宽度
		itemStyle: {
			normal: {
				barBorderRadius: 200,
				color: 'rgba(22,203,115,0.05)'
			},
		},
		label: {
			normal: {
				show: true,
				//label 的position位置可以是top bottom left,right,也可以是固定值
				//在这里需要上下统一对齐,所以用固定值
				position: [0, '-100%'],
				textStyle:{
					color:'#03E0C2'
				},
				formatter: '{b}'
			}
		},
		data:[0,0,0]
	},{
		type: 'bar',
		barWidth: '8',
		barCategoryGap: '60%',
		itemStyle: {
			normal: {
				barBorderRadius:[10, 10, 10, 10],
				color: new echarts.graphic.LinearGradient(0, 0, 1, 0,[
						{offset: 0, color: '#05A6FC'},
						{offset: 1, color: '#67F8B3'}
					]
				),
				label: {
					show: true,
					position: 'right',
					textStyle: {
						color: '#fff',
						fontSize: '12'
					}
				}
			}
		},
		data:[
			{value:50, name: '方形'},
			{value:40, name: '软包'},
			{value:10, name: '圆柱'},
		]
	}]
};

//类型饼图配置
var typePieOption = {
	tooltip: {
		show:true,
		formatter:function(param){
			var tip='';
			if(param.componentSubType=='pie'){
				tip+=param.marker + param.name+ ':' + param.value;
				return tip;
			}
			else{
				tip+=param.name+ ':' + param.value;
				return tip;
			}
		}
	},
	legend: {
		bottom: 0,
		left: 'center',
		itemGap:15,	
		itemWidth :11,
		itemHeight:11,
		textStyle:{
			color:'#03E0C2'
		},
		data: ['NCM', 'LFP', 'LMO', 'LTO', 'NCA']
	},
	grid:{
		left:'60%',
		right:'12%',
		top:'12%',
		bottom:'12%'
	},
	color:['#2261FF','#CE39FF','#19CC61','#FF3964','#FFDA3E'],
	xAxis: [{
			type: 'value',
			axisLabel: {
				show: false,
				interval: 1,
				textStyle: {
					color: '#fff',
					fontSize: 12
				}
			},
			axisLine: {
				show: false
			},
			axisTick: {
				show: false
			},
			splitLine: {
				show: false
			}

		},{
			show: false,
		}
	],
	yAxis:{
		type: 'category',
		data: ['NCA','LTO','LMO', 'LFP','NCM'],
		inverse: true,
		axisLabel:{
			show:false
		},
		axisTick: {
			show: false
		},
		axisLine: {
			show: false
		},
	},
	series: [{
		name: 'pie',
		type: 'pie',
		radius: '55%',
		center: ['30%', '45%'],
		selectedMode: 'single',
		label:{
			normal:{
				formatter:'{d}'+'%',
				fontSize:12,
				color:'#fff'
			}
		},
		labelLine:{
			normal:{
				position:'outer',
				lineStyle: {
	             	color: "#fff"  // 改变标示线的颜色
	          	},
			}
		},
		itemStyle: {
			emphasis: {
				shadowBlur: 10,
				shadowOffsetX: 0,
				shadowColor: 'rgba(0, 0, 0, 0.5)'
			}
		},
		labelLine: {
        	length: 10,
        	length2: 10,
		},
		data:[
           {value:20, name: 'NCM'},
           {value:10, name: 'LMO'},
           {value:10, name: 'LFP'},
           {value:20, name: 'NCA'},
           {value:40, name: 'LTO'}
       ]
	},{
		show: true,
		type: 'bar',
		xAxisIndex: 1, //代表使用第二个X轴刻度!!!!!!!!!!!!!!!!!!!!!!!!
		barGap: '-100%',
		barWidth: '18', //统计条宽度
		itemStyle: {
			normal: {
				barBorderRadius: 200,
				color: 'rgba(22,203,115,0.05)'
			},
		},
		label: {
			normal: {
				show: true,
				//label 的position位置可以是top bottom left,right,也可以是固定值
				//在这里需要上下统一对齐,所以用固定值
				position: [0, '-100%'],
				textStyle:{
					color:'#03E0C2'
				},
				formatter: '{b}'
			}
		},
		data:[0,0,0,0,0]
	},{
		type: 'bar',
		barWidth: '8',
		barCategoryGap: '60%',
		itemStyle: {
			normal: {
				barBorderRadius:[10, 10, 10, 10],
				color: new echarts.graphic.LinearGradient(0, 0, 1, 0,[
						{offset: 0, color: '#05A6FC'},
						{offset: 1, color: '#67F8B3'}
					]
				),
				label: {
					show: true,
					position: 'right',
					textStyle: {
						color: '#fff',
						fontSize: '12'
					}
				}
			}
		},
		data:[
			{value:20, name: 'NCM'},
			{value:10, name: 'LMO'},
			{value:10, name: 'LFP'},
			{value:20, name: 'NCA'},
			{value:40, name: 'LTO'}
		]
	}]
};
</script>
</html>