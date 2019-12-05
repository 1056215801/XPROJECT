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
<title>锂电大数据中心-锂电装机</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="${orgId}">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
		<input type="hidden" id="mtype" name="mtype" value="">
		<input type="hidden" id="stype" name="stype" value="">
	</form>
	<%@ include file="header.jsp"%>
	<div class="container-fluid content2 container-fluid-new">
		<div class="main">
			<div class="pro-left">
				<ul class="production">
					<li class="first-li" id="">
						<div class="product-type" id="gjcl">关键材料</div>
					</li>
					<li class="first-li" id="">
						<div class="product-type" id="zc">整车</div>
					</li>
					<li class="first-li on" id=""> 
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
				   	<span id="ld" name="title"  data="" class="on">锂电装机量</span>
				   	<span id="cl" name="title"  data="">按材料</span>
				   	<span id="xz" name="title"  data="">按形状</span>
				   	<span id="dx" name="title"  data="">按电池芯供应商</span>
				   	<span id="db" name="title"  data="">按电池包供应商</span>
				   	<span id="cq" name="title"  data="">按车企</span>
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
										<div class="dataDisplayBar">
											<div class="dataDisplay">
												<i></i>
												<div class="verCenter">
													<div class="dataSurvey"><font class="m">8</font>月锂电装机量（MWh）</div>
													<div>
														<span id="ld-byData1" class="dataBrandValue" style="display: inline-block;"></span>
														<span class="dataBrandValue" style="display: inline-block;">
															<ul class="dataNums inrow">
																<li class="dataOne ">
																	<div class="dataBoc">
																		<div class="tt" t="38">
																			<span class="">.</span>
																		</div>
																	</div>
																</li>
															</ul>
														</span>
														<span id="ld-byData2" class="dataBrandValue" style="display: inline-block;"></span>
													</div>
													<div class="dataRatio">
														<span>环比：</span><span class="dataRatioValue" id="ld-byhb">0%</span> 
														<span>同比：</span><span class="dataRatioValue" id="ld-bytb">0%</span>
													</div>
												</div>
											</div>
											<div class="dataDisplay">
												<i></i>
												<div class="verCenter">
													<div class="dataSurvey">1-<font class="m">8</font>月锂电装机量（MWh）</div>
													<div>
														<span id="ld-ljData1" class="dataBrandValue" style="display: inline-block;"></span>
														<span class="dataBrandValue" style="display: inline-block;">
															<ul class="dataNums inrow">
																<li class="dataOne ">
																	<div class="dataBoc">
																		<div class="tt" t="38">
																			<span class="">.</span>
																		</div>
																	</div>
																</li>
															</ul>
														</span>
														<span id="ld-ljData2" class="dataBrandValue" style="display: inline-block;"></span>
													</div>
													<div class="dataRatio"> 
														<span>同比：</span><span class="dataRatioValue" id="ld-ljtb">0%</span>
													</div>
												</div>
											</div>
										</div>
										<div id="ld-chart1" style="height: calc(60% - 100px);"></div>
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年中国新能源汽车市场锂电池装机情况统计</span>
										</div>
										<div class="tabContBar hc40">
											<div id="ld-chart2" style="height: 100%;"></div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="logis-main" style="width: calc(40% - 10px);">
			   				<div class="boxStyle" style="height: 60%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月装机量Top10企业</span>
											<div class="tabMenuBar" data="1">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-ld-11">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">电池芯供应商</span>
													<span class="w30">装机量(MWh)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ld-11-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-ld-12">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">电池芯供应商</span>
													<span class="w30">装机量(MWh)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-ld-12-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="boxStyle" style="height: calc(40% - 10px);">
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
												<span class="tabCaption" style="width: 100%;"><font class="ly">2017</font>年1-<font class="m">8</font>月各电池类型装机量占比（MWh）</span>
											</div>
											<div class="tabContBar">
												<div id="ld-3dPieChart1" style="height: 100%;"></div>
											</div>
										</div>
										<div class="inlineBox">
											<div class="tabCaptionBar">
												<span class="tabCaption" style="width: 100%;"><font class="y">2018</font>年1-<font class="m">8</font>月各电池类型装机量占比（MWh）</span>
											</div>
											<div class="tabContBar">
												<div id="ld-3dPieChart2" style="height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab2">
			   			<div class="logis-main" style="width: 60%;">
			   				<div class="boxStyle" style="height: 100%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月新能源汽车不同材料类型锂电池装机及同比</span>
											<div class="tabMenuBar" data="1">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar hc60">
											<div class="tabCont" id="tab-cl-11">
												<div id="cl-chart1" style="width: 100%; height: calc(100% - 96px - 10px);"></div>
												<div class="chartTableBar">
													<div class="tableTitleBar">
														<div class="tableTitle"><i></i><span class="lyLegend"></span><span class="lyValue"></span></div>
														<div class="tableTitle"><i></i><span class="zyLegend"></span><span class="zyValue"></span></div>
														<div class="tableTitle"><i></i><span class="tbLegend"></span><span class="tbValue"></span></div>
													</div>
													<div class="chartTable">
														<table id="tab-cl-11-table"></table>
													</div>
												</div>
											</div>
											<div class="tabCont" id="tab-cl-12">
												<div id="cl-chart12" style="width: 100%; height: calc(100% - 96px - 10px);"></div>
												<div class="chartTableBar">
													<div class="tableTitleBar">
														<div class="tableTitle"><i></i><span class="lyLegend"></span><span class="lyValue"></span></div>
														<div class="tableTitle"><i></i><span class="zyLegend"></span><span class="zyValue"></span></div>
														<div class="tableTitle"><i></i><span class="tbLegend"></span><span class="tbValue"></span></div>
													</div>
													<div class="chartTable">
														<table id="tab-cl-12-table"></table>
													</div>
												</div>
											</div>
										</div>
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月不同车辆类型中不同材料锂电池装机占比</span>
											<div class="tabMenuBar" data="2">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar hc40">
											<div class="tabCont" id="tab-cl-21">
												<div id="cl-chart2" style="width: 100%; height: 100%;"></div>
											</div>
											<div class="tabCont" id="tab-cl-22">
												<div id="cl-chart22" style="width: 100%; height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="logis-main" style="width: calc(40% - 10px);">
			   				<div class="boxStyle" style="height: 45%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月不同类型车辆不同类型材料锂电池装机量</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c respondControl" id="tab-cl-31">
												<div class="cpjg-bar">
													<span class="w20">车辆类型</span>
													<span class="w15">LFP</span>
													<span class="w15">LMO</span>
													<span class="w15">LTO</span>
													<span class="w15">NCM</span>
													<span class="w20">总计</span>
												</div>
												<div class="cpjg">
													<table id="tab-cl-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c respondControl" id="tab-cl-32">
												<div class="cpjg-bar">
													<span class="w20">车辆类型</span>
													<span class="w15">LFP</span>
													<span class="w15">LMO</span>
													<span class="w15">LTO</span>
													<span class="w15">NCM</span>
													<span class="w20">总计</span>
												</div>
												<div class="cpjg">
													<table id="tab-cl-32-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="boxStyle" style="height: calc(55% - 10px);">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="m">8</font>月不同材料中不同车辆类型锂电池装机占比</span>
										</div>
										<div class="tabContBar">
											<div id="cl-chart3" style="width: 100%; height: 100%;"></div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab3">
			   			<div class="logis-main" style="width: 60%;">
			   				<div class="boxStyle" style="height: 100%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月新能源汽车不同形状类型锂电池装机及同比</span>
											<div class="tabMenuBar" data="1">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar hc60">
											<div class="tabCont" id="tab-xz-11">
												<div id="xz-chart1" style="width: 100%; height: calc(100% - 96px - 10px);"></div>
												<div class="chartTableBar">
													<div class="tableTitleBar">
														<div class="tableTitle"><i></i><span class="lyLegend"></span><span class="lyValue"></span></div>
														<div class="tableTitle"><i></i><span class="zyLegend"></span><span class="zyValue"></span></div>
														<div class="tableTitle"><i></i><span class="tbLegend"></span><span class="tbValue"></span></div>
													</div>
													<div class="chartTable">
														<table id="tab-xz-11-table"></table>
													</div>
												</div>
											</div>
											<div class="tabCont" id="tab-xz-12">
												<div id="xz-chart12" style="width: 100%; height: calc(100% - 96px - 10px);"></div>
												<div class="chartTableBar">
													<div class="tableTitleBar">
														<div class="tableTitle"><i></i><span class="lyLegend"></span><span class="lyValue"></span></div>
														<div class="tableTitle"><i></i><span class="zyLegend"></span><span class="zyValue"></span></div>
														<div class="tableTitle"><i></i><span class="tbLegend"></span><span class="tbValue"></span></div>
													</div>
													<div class="chartTable">
														<table id="tab-xz-12-table"></table>
													</div>
												</div>
											</div>
										</div>
										<div class="tabCaptionBar">
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月不同车辆类型中不同形状锂电池装机占比</span>
											<div class="tabMenuBar" data="2">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar hc40">
											<div class="tabCont" id="tab-xz-21">
												<div id="xz-chart2" style="width: 100%; height: 100%;"></div>
											</div>
											<div class="tabCont" id="tab-xz-22">
												<div id="xz-chart22" style="width: 100%; height: 100%;"></div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="logis-main" style="width: calc(40% - 10px);">
			   				<div class="boxStyle" style="height: 45%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月不同类型车辆不同类型形状锂电池装机量</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c media-1440" id="tab-xz-31">
												<div class="cpjg-bar">
													<span class="w20">车辆类型</span>
													<span class="w20">方形</span>
													<span class="w20">软包</span>
													<span class="w20">圆柱</span>
													<span class="w20">总计</span>
												</div>
												<div class="cpjg">
													<table id="tab-xz-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c media-1440" id="tab-xz-32">
												<div class="cpjg-bar">
													<span class="w20">车辆类型</span>
													<span class="w20">方形</span>
													<span class="w20">软包</span>
													<span class="w20">圆柱</span>
													<span class="w20">总计</span>
												</div>
												<div class="cpjg">
													<table id="tab-xz-32-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
						   <div class="boxStyle" style="height: calc(55% - 10px);">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="m">8</font>月不同形状中不同车辆类型锂电池装机占比</span>
										</div>
										<div class="tabContBar">
											<div id="xz-chart3" style="width: 100%; height: 100%;"></div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   		</div>
			   		<div class="tabContent" id="tab4">
			   			<div class="logis-main" style="width: 70%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月电池芯供应商各材料锂电池装机情况</span>
											<div class="tabMenuBar" data="1">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont" id="tab-dx-11">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart1" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart2" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart3" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
											<div class="tabCont" id="tab-dx-12">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart12" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart22" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart32" style="width: 100%; height: 100%;"></div>
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月电池芯供应商各形状锂电池装机占比</span>
											<div class="tabMenuBar" data="2">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont" id="tab-dx-21">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart4" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart5" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart6" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
											<div class="tabCont" id="tab-dx-22">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart42" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart52" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="dx-chart62" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="logis-main" style="width: calc(30% - 10px);">
			   				<div class="boxStyle" style="height: 100%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月电池芯供应商锂电池装机排名</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-dx-31">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">装机量(MWh)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-dx-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-dx-32">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">装机量(MWh)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-dx-32-table"></table>
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
			   			<div class="logis-main" style="width: 70%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月电池包供应商各材料锂电池装机情况</span>
											<div class="tabMenuBar" data="1">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont" id="tab-db-11">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart1" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart2" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart3" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
											<div class="tabCont" id="tab-db-12">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart12" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart22" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart32" style="width: 100%; height: 100%;"></div>
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月电池包供应商各形状锂电池装机占比</span>
											<div class="tabMenuBar" data="2">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont" id="tab-db-21">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart4" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart5" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart6" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
											<div class="tabCont" id="tab-db-22">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart42" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart52" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="db-chart62" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="logis-main" style="width: calc(30% - 10px);">
			   				<div class="boxStyle" style="height: 100%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月电池包供应商锂电池装机排名</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-db-31">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">装机量(MWh)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-db-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-db-32">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">装机量(MWh)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-db-32-table"></table>
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
			   			<div class="logis-main" style="width: 70%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月车企集团各材料锂电池装机情况</span>
											<div class="tabMenuBar" data="1">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont" id="tab-cq-11">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart1" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart2" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart3" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
											<div class="tabCont" id="tab-cq-12">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart12" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart22" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart32" style="width: 100%; height: 100%;"></div>
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月车企集团各形状锂电池装机占比</span>
											<div class="tabMenuBar" data="2">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont" id="tab-cq-21">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart4" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart5" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart6" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
											<div class="tabCont" id="tab-cq-22">
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart42" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart52" style="width: 100%; height: 100%;"></div>
												</div>
												<div class="inlineBox" style="width: calc(33% - 5px);">
													<div id="cq-chart62" style="width: 100%; height: 100%;"></div>
												</div>
											</div>
										</div>
									</div>
							   <!-- </div> -->
						   </div>
			   			</div>
			   			<div class="logis-main" style="width: calc(30% - 10px);">
			   				<div class="boxStyle" style="height: 100%;">
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
											<span class="tabCaption"><font class="y">2018</font>年<font class="plus">1-</font><font class="m">8</font>月车企集团锂电池装机排名</span>
											<div class="tabMenuBar" data="3">
												<i></i>
												<span class="tabMenu on">当月</span>
												<span class="tabMenu">累计</span>
											</div>
										</div>
										<div class="tabContBar">
											<div class="tabCont cpjg-table talign_c" id="tab-cq-31">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">装机量(MWh)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-cq-31-table"></table>
													<font class="unData" style="display: none;">暂无数据</font>
												</div>
											</div>
											<div class="tabCont cpjg-table talign_c" id="tab-cq-32">
												<div class="cpjg-bar">
													<span class="w10">排名</span>
													<span class="w30">车企集团</span>
													<span class="w30">装机量(MWh)</span>
													<span class="w30">占比</span>
												</div>
												<div class="cpjg">
													<table id="tab-cq-32-table"></table>
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
<script src="${ctx}/static/js/dataCenter/highcharts.js"></script>
<script src="${ctx}/static/js/dataCenter/highcharts-3d.js"></script>
<script>
$(function () {
	getselectYear();
	getInstallMachineData();
	//getBasisMaterialData();
	//getBasisSupplierData();
	
	//判断${mtype}值，跳转tab
	if("${mtype}" != "" && "${mtype}" != undefined){
		if("${mtype}" == 1){
			$("#cl").addClass("on").siblings().removeClass("on");
			$(".tabContent").fadeOut("fast");
			setTimeout(function(){
				$("#tab2").fadeIn("fast");
			},210);
			setTimeout(function(){
				$("#mtype").val(1);
				getBasisMaterialData();
			},300);
		}
	}
	
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
		$(this).addClass("on").siblings().removeClass("on");
		$(".tabContent").fadeOut("fast");
		setTimeout(function(){
			$("#tab"+ind).fadeIn("fast");
		},210);
		//初始化
		setTimeout(function(){
			if(ind == 1){
				getInstallMachineData();
			}else if(ind == 2){
				$("#mtype").val(1);
				getBasisMaterialData();
			}else if(ind == 3){
				$("#mtype").val(2);
				getBasisMaterialData();
			}else if(ind == 4){
				$("#stype").val(1);
				getBasisSupplierData();
			}else if(ind == 5){
				$("#stype").val(2);
				getBasisSupplierData();
			}else if(ind == 6){
				$("#stype").val(3);
				getBasisSupplierData();
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
 			$(".tabCaption .ly").text($(this).text()-1);
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
		
		if($("#ld").hasClass("on")){
			getInstallMachineData();
		}else if($("#cl").hasClass("on")){
			$("#mtype").val(1);
			getBasisMaterialData();
		}else if($("#xz").hasClass("on")){
			$("#mtype").val(2);
			getBasisMaterialData();
		}else if($("#dx").hasClass("on")){
			$("#stype").val(1);
			getBasisSupplierData();
		}else if($("#db").hasClass("on")){
			$("#stype").val(2);
			getBasisSupplierData();
		}else if($("#cq").hasClass("on")){
			$("#stype").val(3);
			getBasisSupplierData();
		}else{}
	})
}
function getInstallMachineData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/battery/installed",
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
	 			$(".tabCaption .ly").text(result.data.year-1);
	 			$(".dataSurvey .m").text(result.data.month);
				$(".tabCaption .m").text(result.data.month);
				
				if(result.data.data != undefined && result.data.data.perData1.per != "" && result.data.data.perData1.per != undefined){
					$("#ld-bytb").text(result.data.data.perData1.per+"%")
				}else{
					$("#ld-bytb").text("0%")
				}
				if(result.data.data != undefined && result.data.data.perData1.ratio != "" && result.data.data.perData1.ratio != undefined){
					$("#ld-byhb").text(result.data.data.perData1.ratio+"%")
				}else{
					$("#ld-byhb").text("0%")
				}
				if(result.data.data != undefined && result.data.data.perData1.grandPer != "" && result.data.data.perData1.grandPer != undefined){
					$("#ld-ljtb").text(result.data.data.perData1.grandPer+"%")
				}else{
					$("#ld-ljtb").text("0%")
				}
				$("#ld-byData1").empty();
				$("#ld-byData2").empty();
				setTimeout(function(){
					if(result.data.data != undefined && result.data.data.perData1.total != "" && result.data.data.perData1.total != undefined){
						var ldData = result.data.data.perData1.total;
						$("#ld-byData1").rollNum({
					    	deVal: ldData.split('.')[0],
					    	digit: ldData.split('.')[0].toString().length
					    });
						$("#ld-byData2").rollNum({
					    	deVal: ldData.split('.')[1],
					    	digit: ldData.split('.')[1].toString().length
					    });
					}else{
						$("#ld-byData1").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
						$("#ld-byData2").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
				},300)
				$("#ld-ljData1").empty();
				$("#ld-ljData2").empty();
				setTimeout(function(){
					if(result.data.data != undefined && result.data.data.perData1.grandTotal != "" && result.data.data.perData1.grandTotal != undefined){
						var ldData = result.data.data.perData1.grandTotal
						$("#ld-ljData1").rollNum({
							deVal: ldData.split('.')[0],
					    	digit: ldData.split('.')[0].toString().length
					    });
						$("#ld-ljData2").rollNum({
					    	deVal: ldData.split('.')[1],
					    	digit: ldData.split('.')[1].toString().length
					    });
					}else{
						$("#ld-ljData1").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
						$("#ld-ljData2").rollNum({
							deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
				},300)
				
				//双饼图数据
				if(result.data.data != undefined && result.data.data.perData1.legend != "" && result.data.data.perData1.legend != undefined){
					var div_ = document.getElementById("ld-chart1");
					div_.removeAttribute("_echarts_instance_");
					var doublePieChart = echarts.init(div_);
					//var doublePieChart = echarts.init(document.getElementById("ld-chart1"));
					doublePieOption.legend.data = result.data.data.perData1.legend;
					doublePieOption.series[0].data = result.data.data.perData1.series;
					doublePieOption.series[1].data = result.data.data.perData1.seriesTotal;
					doublePieChart.setOption(doublePieOption);
				}else{
					$("#ld-chart1").html("<font class=\"unData\">暂无数据</font>");
				}
				
				//双折线柱状图数据
				if(result.data.data != undefined && result.data.data.bardate.legend != "" && result.data.data.bardate.legend != undefined){
					var div_ = document.getElementById("ld-chart2");
					div_.removeAttribute("_echarts_instance_");
					var doubleLineBarChart = echarts.init(div_);
					//var doubleLineBarChart = echarts.init(document.getElementById("ld-chart2"));
					doubleLineBarOption.legend.data = result.data.data.bardate.legend;
					doubleLineBarOption.xAxis.data = result.data.data.bardate.xAxis;
					doubleLineBarOption.series[0].name = result.data.data.bardate.legend[0];
					doubleLineBarOption.series[0].data = result.data.data.bardate.seriesBar1;
					doubleLineBarOption.series[1].name = result.data.data.bardate.legend[1];
					doubleLineBarOption.series[1].data = result.data.data.bardate.seriesBar2;
					doubleLineBarOption.series[2].name = result.data.data.bardate.legend[2];
					doubleLineBarOption.series[2].data = result.data.data.bardate.seriesLine1;
					doubleLineBarOption.series[3].name = result.data.data.bardate.legend[3];
					doubleLineBarOption.series[3].data = result.data.data.bardate.seriesLine2;
					doubleLineBarChart.setOption(doubleLineBarOption);
				}else{
					$("#ld-chart2").html("<font class=\"unData\">暂无数据</font>");
				}
				
				//当月产量排名表格
				$("#tab-ld-11-table").empty();
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
					$("#tab-ld-11-table").append(_div);
					if($("#tab-ld-11-table").height() > $("#tab-ld-11-table").parent().height()){
						$("#tab-ld-11-table").append(_div);
						$("#tab-ld-11-table").addClass('roll');
					};
					$("#tab-ld-11-table").next().hide();
				}else{
					$("#tab-ld-11-table").next().show();
				}
				
				//累计产量排名表格
				$("#tab-ld-12-table").empty();
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
					$("#tab-ld-12-table").append(_div);
					if($("#tab-ld-12-table").height() > $("#tab-ld-12-table").parent().height()){
						$("#tab-ld-12-table").append(_div);
						$("#tab-ld-12-table").addClass('roll');
					};
					$("#tab-ld-12-table").next().hide();
				}else{
					$("#tab-ld-12-table").next().show();
				}
				
				//去年装机量占比数据
				if(result.data.data != undefined && result.data.data.berData2.series != "" && result.data.data.berData2.series){
					var dPieChart = [];
					for(var i=0; i<result.data.data.berData2.series.length; i++){
						var info = result.data.data.berData2.series[i];
						dPieChart.push({"name":info.name,"y":Number(info.value),"sliced":'true',"selected":'true'})
					}
					$("#ld-3dPieChart1").highcharts(highchartOptions);
					$("#ld-3dPieChart1").highcharts().series[0].setData(dPieChart);
				}else{
					$("#ld-3dPieChart1").html("<font class=\"unData\">暂无数据</font>");
				}
				//今年装机量占比数据
				if(result.data.data != undefined && result.data.data.berData2.seriesTotal != "" && result.data.data.berData2.seriesTotal){
					var dPieChart = [];
					for(var i=0; i<result.data.data.berData2.seriesTotal.length; i++){
						var info = result.data.data.berData2.seriesTotal[i];
						dPieChart.push({"name":info.name,"y":Number(info.value),"sliced":'true',"selected":'true'})
					}
					$("#ld-3dPieChart2").highcharts(highchartOptions);
					$("#ld-3dPieChart2").highcharts().series[0].setData(dPieChart);
				}else{
					$("#ld-3dPieChart2").html("<font class=\"unData\">暂无数据</font>");
				}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getBasisMaterialData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/battery/material",
		type : "post",
		data : {
			"year" : $('#year').val(),
			"month" : $('#month').val(),
			"type" : $('#mtype').val()
		},
		success : function(result) {
			console.log(result)
			if (result.success) {
				var tab = $(".tabTitle .on").attr("id");
				
				if(tab != "ld" && tab != "dx" && tab != "db" && tab != "cq"){
					if(tab == "cl"){
						//材料单折柱状图数据
						if(result.data.data != undefined && result.data.data.barData1.legend != "" && result.data.data.barData1.legend != undefined){
							var div_ = document.getElementById("cl-chart1");
							div_.removeAttribute("_echarts_instance_");
							var materialSingleLineBarChart = echarts.init(div_);
							//var materialSingleLineBarChart = echarts.init(document.getElementById("cl-chart1"));
							materialSingleLineBarOption.legend.data = result.data.data.barData1.legend;
							materialSingleLineBarOption.xAxis.data = result.data.data.barData1.xAxis;
							materialSingleLineBarOption.series[0].name = result.data.data.barData1.legend[0];
							materialSingleLineBarOption.series[0].data = result.data.data.barData1.seriesBar1;
							materialSingleLineBarOption.series[1].name = result.data.data.barData1.legend[1];
							materialSingleLineBarOption.series[1].data = result.data.data.barData1.seriesBar2;
							materialSingleLineBarOption.series[2].name = result.data.data.barData1.legend[2];
							materialSingleLineBarOption.series[2].data = result.data.data.barData1.seriesLine;
							materialSingleLineBarChart.setOption(materialSingleLineBarOption);

							$("#tab-cl-11 .lyValue").text(result.data.data.barData1.legend[0])
							$("#tab-cl-11 .zyValue").text(result.data.data.barData1.legend[1])
							$("#tab-cl-11 .tbValue").text(result.data.data.barData1.legend[2])
							
							//对应下方表格
							$("#tab-cl-11-table").empty();
							var info = result.data.data.barData1;
							var _div = "";
							
								_div += "	<tr>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar1[0])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar1[1])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar1[2])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar1[3])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar1[4])+"</td>";
								_div += "		<td class=\"w16 yellowFont\">"+nvlStr(info.seriesBar1[5])+"</td>";
								_div += "	</tr>";
								_div += "	<tr>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar2[0])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar2[1])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar2[2])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar2[3])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesBar2[4])+"</td>";
								_div += "		<td class=\"w16 yellowFont\">"+nvlStr(info.seriesBar2[5])+"</td>";
								_div += "	</tr>";
								_div += "	<tr>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesLine[0])+"%</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesLine[1])+"%</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesLine[2])+"%</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesLine[3])+"%</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesLine[4])+"%</td>";
								_div += "		<td class=\"w16 yellowFont\">"+nvlStr(info.seriesLine[5])+"%</td>";
								_div += "	</tr>";
							
							$("#tab-cl-11-table").append(_div);
						}else{
							$("#cl-chart1").html("<font class=\"unData\">暂无数据</font>");
						}
						if(result.data.data != undefined && result.data.data.barData1.legend != "" && result.data.data.barData1.legend != undefined){
							var div_ = document.getElementById("cl-chart12");
							div_.removeAttribute("_echarts_instance_");
							var materialSingleLineBarChart = echarts.init(div_);
							//var materialSingleLineBarChart = echarts.init(document.getElementById("cl-chart12"));
							materialSingleLineBarOption.legend.data = result.data.data.barData1.legend;
							materialSingleLineBarOption.xAxis.data = result.data.data.barData1.xAxis;
							materialSingleLineBarOption.series[0].name = result.data.data.barData1.legend[0];
							materialSingleLineBarOption.series[0].data = result.data.data.barData1.seriesTotalBar1;
							materialSingleLineBarOption.series[1].name = result.data.data.barData1.legend[1];
							materialSingleLineBarOption.series[1].data = result.data.data.barData1.seriesTotalBar2;
							materialSingleLineBarOption.series[2].name = result.data.data.barData1.legend[2];
							materialSingleLineBarOption.series[2].data = result.data.data.barData1.seriesTotalLine;
							materialSingleLineBarChart.setOption(materialSingleLineBarOption);
							
							$("#tab-cl-12 .lyValue").text(result.data.data.barData1.legend[0])
							$("#tab-cl-12 .zyValue").text(result.data.data.barData1.legend[1])
							$("#tab-cl-12 .tbValue").text(result.data.data.barData1.legend[2])
							
							//对应下方表格
							$("#tab-cl-12-table").empty();
							var info = result.data.data.barData1;
							var _div = "";
							
								_div += "	<tr>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar1[0])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar1[1])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar1[2])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar1[3])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar1[4])+"</td>";
								_div += "		<td class=\"w16 yellowFont\">"+nvlStr(info.seriesTotalBar1[5])+"</td>";
								_div += "	</tr>";
								_div += "	<tr>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar2[0])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar2[1])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar2[2])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar2[3])+"</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalBar2[4])+"</td>";
								_div += "		<td class=\"w16 yellowFont\">"+nvlStr(info.seriesTotalBar2[5])+"</td>";
								_div += "	</tr>";
								_div += "	<tr>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalLine[0])+"%</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalLine[1])+"%</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalLine[2])+"%</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalLine[3])+"%</td>";
								_div += "		<td class=\"w16\">"+nvlStr(info.seriesTotalLine[4])+"%</td>";
								_div += "		<td class=\"w16 yellowFont\">"+nvlStr(info.seriesTotalLine[5])+"%</td>";
								_div += "	</tr>";
							
							$("#tab-cl-12-table").append(_div);
						}else{
							$("#cl-chart12").html("<font class=\"unData\">暂无数据</font>");
						}
						
						//车型材料叠加柱状图数据
						if(result.data.data != undefined && result.data.data.barData2.legend != "" && result.data.data.barData2.legend != undefined){
							var div_ = document.getElementById("cl-chart2");
							div_.removeAttribute("_echarts_instance_");
							var typeMaterialFoldBarChart = echarts.init(div_);
							//var typeMaterialFoldBarChart = echarts.init(document.getElementById("cl-chart2"));
							typeMaterialFoldBarOption.legend.data = result.data.data.barData2.legend;
							typeMaterialFoldBarOption.xAxis.data = result.data.data.barData2.xAxis;
							typeMaterialFoldBarOption.series[0].name = result.data.data.barData2.legend[0];
							typeMaterialFoldBarOption.series[0].data = result.data.data.barData2.series1;
							typeMaterialFoldBarOption.series[1].name = result.data.data.barData2.legend[1];
							typeMaterialFoldBarOption.series[1].data = result.data.data.barData2.series2;
							typeMaterialFoldBarOption.series[2].name = result.data.data.barData2.legend[2];
							typeMaterialFoldBarOption.series[2].data = result.data.data.barData2.series3;
							typeMaterialFoldBarOption.series[3].name = result.data.data.barData2.legend[3];
							typeMaterialFoldBarOption.series[3].data = result.data.data.barData2.series4;
							typeMaterialFoldBarOption.series[4].name = result.data.data.barData2.legend[4];
							typeMaterialFoldBarOption.series[4].data = result.data.data.barData2.series5;
							typeMaterialFoldBarChart.setOption(typeMaterialFoldBarOption);
						}else{
							$("#cl-chart2").html("<font class=\"unData\">暂无数据</font>");
						}
						if(result.data.data != undefined && result.data.data.barData2.legend != "" && result.data.data.barData2.legend != undefined){
							var div_ = document.getElementById("cl-chart22");
							div_.removeAttribute("_echarts_instance_");
							var typeMaterialFoldBarChart = echarts.init(div_);
							//var typeMaterialFoldBarChart = echarts.init(document.getElementById("cl-chart22"));
							typeMaterialFoldBarOption.legend.data = result.data.data.barData2.legend;
							typeMaterialFoldBarOption.xAxis.data = result.data.data.barData2.xAxis;
							typeMaterialFoldBarOption.series[0].name = result.data.data.barData2.legend[0];
							typeMaterialFoldBarOption.series[0].data = result.data.data.barData2.seriesTotal1;
							typeMaterialFoldBarOption.series[1].name = result.data.data.barData2.legend[1];
							typeMaterialFoldBarOption.series[1].data = result.data.data.barData2.seriesTotal2;
							typeMaterialFoldBarOption.series[2].name = result.data.data.barData2.legend[2];
							typeMaterialFoldBarOption.series[2].data = result.data.data.barData2.seriesTotal3;
							typeMaterialFoldBarOption.series[3].name = result.data.data.barData2.legend[3];
							typeMaterialFoldBarOption.series[3].data = result.data.data.barData2.seriesTotal4;
							typeMaterialFoldBarOption.series[4].name = result.data.data.barData2.legend[4];
							typeMaterialFoldBarOption.series[4].data = result.data.data.barData2.seriesTotal5;
							typeMaterialFoldBarChart.setOption(typeMaterialFoldBarOption);
						}else{
							$("#cl-chart22").html("<font class=\"unData\">暂无数据</font>");
						}
						
						//按形状装机量排名
						$("#tab-cl-31-table").empty();
						if(result.data.data != undefined && result.data.data.listData.monthList != "" && result.data.data.listData.monthList){
							var _div = "";
							for(var i=0 ; i<result.data.data.listData.monthList.length ; i++){
								var info = result.data.data.listData.monthList[i];
								_div += "	<tr>";
								_div += "		<td class=\"w20\">"+info.carType+"</td>";
								_div += "		<td class=\"w15\">"+info.valueLFP+"</td>";
								_div += "		<td class=\"w15\">"+info.valueLMO+"</td>";
								_div += "		<td class=\"w15\">"+info.valueLTO+"</td>";
								_div += "		<td class=\"w15\">"+info.valueNCM+"</td>";
								_div += "		<td class=\"w20\">"+info.sum+"</td>";
								_div += "	</tr>";
							}
							$("#tab-cl-31-table").append(_div);
							/* if($("#tab-cl-31-table").height() > $("#tab-cl-31-table").parent().height()){
								$("#tab-cl-31-table").append(_div);
								$("#tab-cl-31-table").addClass('roll');
							}; */
							$("#tab-cl-31-table").next().hide();
						}else{
							$("#tab-cl-31-table").next().show();
						}
						$("#tab-cl-32-table").empty();
						if(result.data.data != undefined && result.data.data.listData.monthTotalList != "" && result.data.data.listData.monthTotalList){
							var _div = "";
							for(var i=0 ; i<result.data.data.listData.monthTotalList.length ; i++){
								var info = result.data.data.listData.monthTotalList[i];
								_div += "	<tr>";
								_div += "		<td class=\"w20\">"+info.carType+"</td>";
								_div += "		<td class=\"w15\">"+info.valueLFP+"</td>";
								_div += "		<td class=\"w15\">"+info.valueLMO+"</td>";
								_div += "		<td class=\"w15\">"+info.valueLTO+"</td>";
								_div += "		<td class=\"w15\">"+info.valueNCM+"</td>";
								_div += "		<td class=\"w20\">"+info.sum+"</td>";
								_div += "	</tr>";
							}
							$("#tab-cl-32-table").append(_div);
							/* if($("#tab-cl-32-table").height() > $("#tab-cl-32-table").parent().height()){
								$("#tab-cl-32-table").append(_div);
								$("#tab-cl-32-table").addClass('roll');
							}; */
							$("#tab-cl-32-table").next().hide();
						}else{
							$("#tab-cl-32-table").next().show();
						}
						
						//材料单折柱状图数据
						if(result.data.data != undefined && result.data.data.barData3.legend != "" && result.data.data.barData3.legend != undefined){
							var div_ = document.getElementById("cl-chart3");
							div_.removeAttribute("_echarts_instance_");
							var materialTypeFoldBarChart = echarts.init(div_);
							//var materialTypeFoldBarChart = echarts.init(document.getElementById("cl-chart3"));
							materialTypeFoldBarOption.legend.data = result.data.data.barData3.legend;
							materialTypeFoldBarOption.xAxis.data = result.data.data.barData3.xAxis;
							materialTypeFoldBarOption.series[0].name = result.data.data.barData3.legend[0];
							materialTypeFoldBarOption.series[0].data = result.data.data.barData3.series1;
							materialTypeFoldBarOption.series[1].name = result.data.data.barData3.legend[1];
							materialTypeFoldBarOption.series[1].data = result.data.data.barData3.series2;
							materialTypeFoldBarOption.series[2].name = result.data.data.barData3.legend[2];
							materialTypeFoldBarOption.series[2].data = result.data.data.barData3.series3;
							materialTypeFoldBarOption.series[3].name = result.data.data.barData3.legend[3];
							materialTypeFoldBarOption.series[3].data = result.data.data.barData3.series4;
							materialTypeFoldBarOption.series[4].name = result.data.data.barData3.legend[4];
							materialTypeFoldBarOption.series[4].data = result.data.data.barData3.series5;
							materialTypeFoldBarChart.setOption(materialTypeFoldBarOption);
						}else{
							$("#cl-chart3").html("<font class=\"unData\">暂无数据</font>");
						}
						
					}else if(tab == "xz"){
						//单折线柱状图数据
						if(result.data.data != undefined && result.data.data.barData1.legend != "" && result.data.data.barData1.legend != undefined){
							var div_ = document.getElementById("xz-chart1");
							div_.removeAttribute("_echarts_instance_");
							var shapeSingleLineBarChart = echarts.init(div_);
							//var shapeSingleLineBarChart = echarts.init(document.getElementById("xz-chart1"));
							shapeSingleLineBarOption.legend.data = result.data.data.barData1.legend;
							shapeSingleLineBarOption.xAxis.data = result.data.data.barData1.xAxis;
							shapeSingleLineBarOption.series[0].name = result.data.data.barData1.legend[0];
							shapeSingleLineBarOption.series[0].data = result.data.data.barData1.seriesBar1;
							shapeSingleLineBarOption.series[1].name = result.data.data.barData1.legend[1];
							shapeSingleLineBarOption.series[1].data = result.data.data.barData1.seriesBar2;
							shapeSingleLineBarOption.series[2].name = result.data.data.barData1.legend[2];
							shapeSingleLineBarOption.series[2].data = result.data.data.barData1.seriesLine;
							shapeSingleLineBarChart.setOption(shapeSingleLineBarOption);
							
							$("#tab-xz-11 .lyValue").text(result.data.data.barData1.legend[0])
							$("#tab-xz-11 .zyValue").text(result.data.data.barData1.legend[1])
							$("#tab-xz-11 .tbValue").text(result.data.data.barData1.legend[2])
							
							//对应下方表格
							$("#tab-xz-11-table").empty();
							var info = result.data.data.barData1;
							var _div = "";
							
								_div += "	<tr>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesBar1[0])+"</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesBar1[1])+"</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesBar1[2])+"</td>";
								_div += "		<td class=\"w25 yellowFont\">"+nvlStr(info.seriesBar1[3])+"</td>";
								_div += "	</tr>";
								_div += "	<tr>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesBar2[0])+"</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesBar2[1])+"</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesBar2[2])+"</td>";
								_div += "		<td class=\"w25 yellowFont\">"+nvlStr(info.seriesBar2[3])+"</td>";
								_div += "	</tr>";
								_div += "	<tr>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesLine[0])+"%</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesLine[1])+"%</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesLine[2])+"%</td>";
								_div += "		<td class=\"w25 yellowFont\">"+nvlStr(info.seriesLine[3])+"%</td>";
								_div += "	</tr>";
							
							$("#tab-xz-11-table").append(_div);
						}else{
							$("#xz-chart1").html("<font class=\"unData\">暂无数据</font>");
						}
						if(result.data.data != undefined && result.data.data.barData1.legend != "" && result.data.data.barData1.legend != undefined){
							var div_ = document.getElementById("xz-chart12");
							div_.removeAttribute("_echarts_instance_");
							var shapeSingleLineBarChart = echarts.init(div_);
							//var shapeSingleLineBarChart = echarts.init(document.getElementById("xz-chart12"));
							shapeSingleLineBarOption.legend.data = result.data.data.barData1.legend;
							shapeSingleLineBarOption.xAxis.data = result.data.data.barData1.xAxis;
							shapeSingleLineBarOption.series[0].name = result.data.data.barData1.legend[0];
							shapeSingleLineBarOption.series[0].data = result.data.data.barData1.seriesTotalBar1;
							shapeSingleLineBarOption.series[1].name = result.data.data.barData1.legend[1];
							shapeSingleLineBarOption.series[1].data = result.data.data.barData1.seriesTotalBar2;
							shapeSingleLineBarOption.series[2].name = result.data.data.barData1.legend[2];
							shapeSingleLineBarOption.series[2].data = result.data.data.barData1.seriesTotalLine;
							shapeSingleLineBarChart.setOption(shapeSingleLineBarOption);
							
							$("#tab-xz-12 .lyValue").text(result.data.data.barData1.legend[0])
							$("#tab-xz-12 .zyValue").text(result.data.data.barData1.legend[1])
							$("#tab-xz-12 .tbValue").text(result.data.data.barData1.legend[2])
							
							//对应下方表格
							$("#tab-xz-12-table").empty();
							var info = result.data.data.barData1;
							var _div = "";
							
								_div += "	<tr>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalBar1[0])+"</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalBar1[1])+"</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalBar1[2])+"</td>";
								_div += "		<td class=\"w25 yellowFont\">"+nvlStr(info.seriesTotalBar1[3])+"</td>";
								_div += "	</tr>";
								_div += "	<tr>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalBar2[0])+"</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalBar2[1])+"</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalBar2[2])+"</td>";
								_div += "		<td class=\"w25 yellowFont\">"+nvlStr(info.seriesTotalBar2[3])+"</td>";
								_div += "	</tr>";
								_div += "	<tr>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalLine[0])+"%</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalLine[1])+"%</td>";
								_div += "		<td class=\"w25\">"+nvlStr(info.seriesTotalLine[2])+"%</td>";
								_div += "		<td class=\"w25 yellowFont\">"+nvlStr(info.seriesTotalLine[3])+"%</td>";
								_div += "	</tr>";
							
							$("#tab-xz-12-table").append(_div);
						}else{
							$("#xz-chart12").html("<font class=\"unData\">暂无数据</font>");
						}
						
						//车型形状叠加柱状图数据
						if(result.data.data != undefined && result.data.data.barData2.legend != "" && result.data.data.barData2.legend != undefined){
							var div_ = document.getElementById("xz-chart2");
							div_.removeAttribute("_echarts_instance_");
							var typeShapeFoldBarChart = echarts.init(div_);
							//var typeShapeFoldBarChart = echarts.init(document.getElementById("xz-chart2"));
							typeShapeFoldBarOption.legend.data = result.data.data.barData2.legend;
							typeShapeFoldBarOption.xAxis.data = result.data.data.barData2.xAxis;
							typeShapeFoldBarOption.series[0].name = result.data.data.barData2.legend[0];
							typeShapeFoldBarOption.series[0].data = result.data.data.barData2.series1;
							typeShapeFoldBarOption.series[1].name = result.data.data.barData2.legend[1];
							typeShapeFoldBarOption.series[1].data = result.data.data.barData2.series2;
							typeShapeFoldBarOption.series[2].name = result.data.data.barData2.legend[2];
							typeShapeFoldBarOption.series[2].data = result.data.data.barData2.series3;
							typeShapeFoldBarChart.setOption(typeShapeFoldBarOption);
						}else{
							$("#xz-chart2").html("<font class=\"unData\">暂无数据</font>");
						}
						if(result.data.data != undefined && result.data.data.barData2.legend != "" && result.data.data.barData2.legend != undefined){
							var div_ = document.getElementById("xz-chart22");
							div_.removeAttribute("_echarts_instance_");
							var typeShapeFoldBarChart = echarts.init(div_);
							//var typeShapeFoldBarChart = echarts.init(document.getElementById("xz-chart22"));
							typeShapeFoldBarOption.legend.data = result.data.data.barData2.legend;
							typeShapeFoldBarOption.xAxis.data = result.data.data.barData2.xAxis;
							typeShapeFoldBarOption.series[0].name = result.data.data.barData2.legend[0];
							typeShapeFoldBarOption.series[0].data = result.data.data.barData2.seriesTotal1;
							typeShapeFoldBarOption.series[1].name = result.data.data.barData2.legend[1];
							typeShapeFoldBarOption.series[1].data = result.data.data.barData2.seriesTotal2;
							typeShapeFoldBarOption.series[2].name = result.data.data.barData2.legend[2];
							typeShapeFoldBarOption.series[2].data = result.data.data.barData2.seriesTotal3;
							typeShapeFoldBarChart.setOption(typeShapeFoldBarOption);
						}else{
							$("#xz-chart22").html("<font class=\"unData\">暂无数据</font>");
						}
						
						//按形状装机量排名
						$("#tab-xz-31-table").empty();
						if(result.data.data != undefined && result.data.data.listData.monthList != "" && result.data.data.listData.monthList){
							var _div = "";
							for(var i=0 ; i<result.data.data.listData.monthList.length ; i++){
								var info = result.data.data.listData.monthList[i];
								_div += "	<tr>";
								_div += "		<td class=\"w20\">"+info.carType+"</td>";
								_div += "		<td class=\"w20\">"+info.square+"</td>";
								_div += "		<td class=\"w20\">"+info.softPackage+"</td>";
								_div += "		<td class=\"w20\">"+info.cylindrical+"</td>";
								_div += "		<td class=\"w20\">"+info.sum+"</td>";
								_div += "	</tr>";
							}
							$("#tab-xz-31-table").append(_div);
							/* if($("#tab-xz-31-table").height() > $("#tab-xz-31-table").parent().height()){
								$("#tab-xz-31-table").append(_div);
								$("#tab-xz-31-table").addClass('roll');
							}; */
							$("#tab-xz-31-table").next().hide();
						}else{
							$("#tab-xz-31-table").next().show();
						}
						$("#tab-xz-32-table").empty();
						if(result.data.data != undefined && result.data.data.listData.monthTotalList != "" && result.data.data.listData.monthTotalList){
							var _div = "";
							for(var i=0 ; i<result.data.data.listData.monthTotalList.length ; i++){
								var info = result.data.data.listData.monthTotalList[i];
								_div += "	<tr>";
								_div += "		<td class=\"w20\">"+info.carType+"</td>";
								_div += "		<td class=\"w20\">"+info.square+"</td>";
								_div += "		<td class=\"w20\">"+info.softPackage+"</td>";
								_div += "		<td class=\"w20\">"+info.cylindrical+"</td>";
								_div += "		<td class=\"w20\">"+info.sum+"</td>";
								_div += "	</tr>";
							}
							$("#tab-xz-32-table").append(_div);
							/* if($("#tab-xz-32-table").height() > $("#tab-xz-32-table").parent().height()){
								$("#tab-xz-32-table").append(_div);
								$("#tab-xz-32-table").addClass('roll');
							}; */
							$("#tab-xz-32-table").next().hide();
						}else{
							$("#tab-xz-32-table").next().show();
						}
						
						//形状车型叠加柱状图数据
						if(result.data.data != undefined && result.data.data.barData3.legend != "" && result.data.data.barData3.legend != undefined){
							var div_ = document.getElementById("xz-chart3");
							div_.removeAttribute("_echarts_instance_");
							var shapeTypeFoldBarChart = echarts.init(div_);
							//var shapeTypeFoldBarChart = echarts.init(document.getElementById("xz-chart3"));
							shapeTypeFoldBarOption.legend.data = result.data.data.barData3.legend;
							shapeTypeFoldBarOption.xAxis.data = result.data.data.barData3.xAxis;
							shapeTypeFoldBarOption.series[0].name = result.data.data.barData3.legend[0];
							shapeTypeFoldBarOption.series[0].data = result.data.data.barData3.series1;
							shapeTypeFoldBarOption.series[1].name = result.data.data.barData3.legend[1];
							shapeTypeFoldBarOption.series[1].data = result.data.data.barData3.series2;
							shapeTypeFoldBarOption.series[2].name = result.data.data.barData3.legend[2];
							shapeTypeFoldBarOption.series[2].data = result.data.data.barData3.series3;
							shapeTypeFoldBarOption.series[3].name = result.data.data.barData3.legend[3];
							shapeTypeFoldBarOption.series[3].data = result.data.data.barData3.series4;
							shapeTypeFoldBarOption.series[4].name = result.data.data.barData3.legend[4];
							shapeTypeFoldBarOption.series[4].data = result.data.data.barData3.series5;
							shapeTypeFoldBarChart.setOption(shapeTypeFoldBarOption);
						}else{
							$("#xz-chart3").html("<font class=\"unData\">暂无数据</font>");
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
function getBasisSupplierData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/battery/supplier",
		type : "post",
		data : {
			"year" : $('#year').val(),
			"month" : $('#month').val(),
			"type" : $('#stype').val()
		},
		success : function(result) {
			console.log(result)
			if (result.success) {
				var tab = $(".tabTitle .on").attr("id");
				
				if(tab != "ld" && tab != "cl" && tab != "xz"){
					//NCM
					if(result.data.data != undefined && result.data.data.perMaterial.monthData.perNCM.legend != "" && result.data.data.perMaterial.monthData.perNCM.legend != undefined){
						var div_ = document.getElementById(tab+"-chart1");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart1"));
						annularPieOption.legend.data = result.data.data.perMaterial.monthData.perNCM.legend;
						annularPieOption.title.text = 'NCM';
						annularPieOption.series[0].name = 'NCM';
						annularPieOption.series[0].data = result.data.data.perMaterial.monthData.perNCM.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart1").html("<font class=\"unData\">暂无数据</font>");
					}
					if(result.data.data != undefined && result.data.data.perMaterial.monthTotalData.perNCM.legend != "" && result.data.data.perMaterial.monthTotalData.perNCM.legend != undefined){
						var div_ = document.getElementById(tab+"-chart12");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart12"));
						annularPieOption.legend.data = result.data.data.perMaterial.monthTotalData.perNCM.legend;
						annularPieOption.title.text = 'NCM';
						annularPieOption.series[0].name = 'NCM';
						annularPieOption.series[0].data = result.data.data.perMaterial.monthTotalData.perNCM.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart12").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//LFP
					if(result.data.data != undefined && result.data.data.perMaterial.monthData.perLFP.legend != "" && result.data.data.perMaterial.monthData.perLFP.legend != undefined){
						var div_ = document.getElementById(tab+"-chart2");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart2"));
						annularPieOption.legend.data = result.data.data.perMaterial.monthData.perLFP.legend;
						annularPieOption.title.text = 'LFP';
						annularPieOption.series[0].name = 'LFP';
						annularPieOption.series[0].data = result.data.data.perMaterial.monthData.perLFP.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart2").html("<font class=\"unData\">暂无数据</font>");
					}
					if(result.data.data != undefined && result.data.data.perMaterial.monthTotalData.perLFP.legend != "" && result.data.data.perMaterial.monthTotalData.perLFP.legend != undefined){
						var div_ = document.getElementById(tab+"-chart22");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart22"));
						annularPieOption.legend.data = result.data.data.perMaterial.monthTotalData.perLFP.legend;
						annularPieOption.title.text = 'LFP';
						annularPieOption.series[0].name = 'LFP';
						annularPieOption.series[0].data = result.data.data.perMaterial.monthTotalData.perLFP.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart22").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//LMO
					if(result.data.data != undefined && result.data.data.perMaterial.monthData.perLMO.legend != "" && result.data.data.perMaterial.monthData.perLMO.legend != undefined){
						var div_ = document.getElementById(tab+"-chart3");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart3"));
						annularPieOption.legend.data = result.data.data.perMaterial.monthData.perLMO.legend;
						annularPieOption.title.text = 'LMO';
						annularPieOption.series[0].name = 'LMO';
						annularPieOption.series[0].data = result.data.data.perMaterial.monthData.perLMO.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart3").html("<font class=\"unData\">暂无数据</font>");
					}
					if(result.data.data != undefined && result.data.data.perMaterial.monthTotalData.perLMO.legend != "" && result.data.data.perMaterial.monthTotalData.perLMO.legend != undefined){
						var div_ = document.getElementById(tab+"-chart32");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart32"));
						annularPieOption.legend.data = result.data.data.perMaterial.monthTotalData.perLMO.legend;
						annularPieOption.title.text = 'LMO';
						annularPieOption.series[0].name = 'LMO';
						annularPieOption.series[0].data = result.data.data.perMaterial.monthTotalData.perLMO.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart32").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//方形
					if(result.data.data != undefined && result.data.data.perShape.monthData.perSquare.legend != "" && result.data.data.perShape.monthData.perSquare.legend != undefined){
						var div_ = document.getElementById(tab+"-chart4");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart4"));
						annularPieOption.legend.data = result.data.data.perShape.monthData.perSquare.legend;
						annularPieOption.title.text = '方形';
						annularPieOption.series[0].name = '方形';
						annularPieOption.series[0].data = result.data.data.perShape.monthData.perSquare.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart4").html("<font class=\"unData\">暂无数据</font>");
					}
					if(result.data.data != undefined && result.data.data.perShape.monthTotalData.perSquare.legend != "" && result.data.data.perShape.monthTotalData.perSquare.legend != undefined){
						var div_ = document.getElementById(tab+"-chart42");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart42"));
						annularPieOption.legend.data = result.data.data.perShape.monthTotalData.perSquare.legend;
						annularPieOption.title.text = '方形';
						annularPieOption.series[0].name = '方形';
						annularPieOption.series[0].data = result.data.data.perShape.monthTotalData.perSquare.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart42").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//软包
					if(result.data.data != undefined && result.data.data.perShape.monthData.perSoftRoll.legend != "" && result.data.data.perShape.monthData.perSoftRoll.legend != undefined){
						var div_ = document.getElementById(tab+"-chart5");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart5"));
						annularPieOption.legend.data = result.data.data.perShape.monthData.perSoftRoll.legend;
						annularPieOption.title.text = '软包';
						annularPieOption.series[0].name = '软包';
						annularPieOption.series[0].data = result.data.data.perShape.monthData.perSoftRoll.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart5").html("<font class=\"unData\">暂无数据</font>");
					}
					if(result.data.data != undefined && result.data.data.perShape.monthTotalData.perSoftRoll.legend != "" && result.data.data.perShape.monthTotalData.perSoftRoll.legend != undefined){
						var div_ = document.getElementById(tab+"-chart52");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart52"));
						annularPieOption.legend.data = result.data.data.perShape.monthTotalData.perSoftRoll.legend;
						annularPieOption.title.text = '软包';
						annularPieOption.series[0].name = '软包';
						annularPieOption.series[0].data = result.data.data.perShape.monthTotalData.perSoftRoll.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart52").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//圆柱
					if(result.data.data != undefined && result.data.data.perShape.monthData.perCircular.legend != "" && result.data.data.perShape.monthData.perCircular.legend != undefined){
						var div_ = document.getElementById(tab+"-chart6");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart6"));
						annularPieOption.legend.data = result.data.data.perShape.monthData.perCircular.legend;
						annularPieOption.title.text = '圆柱';
						annularPieOption.series[0].name = '圆柱';
						annularPieOption.series[0].data = result.data.data.perShape.monthData.perCircular.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart6").html("<font class=\"unData\">暂无数据</font>");
					}
					if(result.data.data != undefined && result.data.data.perShape.monthTotalData.perCircular.legend != "" && result.data.data.perShape.monthTotalData.perCircular.legend != undefined){
						var div_ = document.getElementById(tab+"-chart62");
						div_.removeAttribute("_echarts_instance_");
						var annularPieChart = echarts.init(div_);
						//var annularPieChart = echarts.init(document.getElementById(tab+"-chart62"));
						annularPieOption.legend.data = result.data.data.perShape.monthTotalData.perCircular.legend;
						annularPieOption.title.text = '圆柱';
						annularPieOption.series[0].name = '圆柱';
						annularPieOption.series[0].data = result.data.data.perShape.monthTotalData.perCircular.series;
						annularPieChart.setOption(annularPieOption);
					}else{
						$("#"+tab+"-chart62").html("<font class=\"unData\">暂无数据</font>");
					}
					
					//当月装机排名表格
					$("#tab-"+tab+"-31-table").empty();
					if(result.data.data != undefined && result.data.data.listData.monthData != "" && result.data.data.listData.monthData){
						var _div = "";
						for(var i=0 ; i<result.data.data.listData.monthData.length ; i++){
							var info = result.data.data.listData.monthData[i];
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
					
					//累计装机排名表格
					$("#tab-"+tab+"-32-table").empty();
					if(result.data.data != undefined && result.data.data.listData.monthTotalData != "" && result.data.data.listData.monthTotalData){
						var _div = "";
						for(var i=0 ; i<result.data.data.listData.monthTotalData.length ; i++){
							var info = result.data.data.listData.monthTotalData[i];
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
/* 非空字符串 */
function nvlStr(str){
	if(str == null || str == "" || str == undefined){
		return "";
	}
	return str;
}

//双饼图配置
var doublePieOption = {
	tooltip: {
		show:true,
		formatter:function(param){
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
		name: '锂电装机量（MWh）',
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
		name: '锂电装机量（MWh）',
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

//双折线柱状图配置
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

//3D饼图配置
var highchartOptions={
	chart: {
		//renderTo: 'container',    //指定div放置图 
		type: 'pie',    
		backgroundColor: 'rgba(0,0,0,0)', 
		options3d: {
			enabled: true,	//显示图表是否设置为3D， 我们将其设置为 true
			alpha: 50, 		//图表视图旋转角度
			beta: 0,		//图表视图旋转角度
			// depth: 10,         //图表的合计深度，默认为100
			// viewDistance: 125   //定义图表的浏览长度
		},
	},
	title : {
		text:null
	},
	credits: {
    	enabled:false
	},
	tooltip : {
		headerFormat:'',
		pointFormat: '<span style="color:{point.color}">\u25CF</span>{point.name}: <b>{point.y}</b>'
	},
	colors:['#DC3156','#16B054','#1D54DC','#DCBC35','#B231DC'],
	legend: {
		enabled: false,
		width:'100%',
		itemStyle : {
			fontSize:12,
			color:'#03E0C2'
		},
		itemHoverStyle : {
			color:'#03E0C2'
		},
		symbolRadius: 4,
		symbolPadding: 0,
		itemDistance: 10,
		padding: 0,
		margin: 0,
		itemMarginBottom: -10,
	},
	plotOptions : {
		pie: {
			allowPointSelect: false,
			cursor: 'pointer',
			depth: 15, //饼图厚度
			dataLabels: {
				enabled: true,
				cursor: 'pointer',
				format: '{point.name}<br/><b>{point.percentage:.1f}%</b>',//'<b>{point.percentage:.1f}%</b>',
				distance: 5,//调整标签圆心得距离
				style:{
					color:'#fff',
					fontSize: "10px"
				}
			},
			showInLegend: true
		}
	},  
	series: [{
		type: 'pie',
		name: '占比',
		center: ['50%', '50%'],
		size:'70%',//饼图大小
		startAngle: 340,//开始角度
		//data: data
	}]
};

//材料单折柱状图配置
var materialSingleLineBarOption = {
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
		data: ['2017年8月','2018年8月','同比增长'],
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
		data: ['LFP','LMO','LTO','NCA','NCM','总计'],
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
		max: 6400,
		interval: 800 */
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
		/* min: 0,
		max: 70, //最大值
		interval: 10 //间隔值#35AAE0 */
	}],
	series: [{
		name: '2017年8月',
		type: 'bar',
		barMaxWidth:'40',
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
		data: [4000, 2000, 4000, 6000]
	},{
		name: '2018年8月',
		type: 'bar',
		barGap:'20%',
		barCategoryGap:'10%',
		barMaxWidth:'40',
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
		data: [5000, 2000, 1500, 3900],
	},{
		name: '同比增长',
		type: 'line',
		symbol: 'circle',
		symbolSize: 7,
		yAxisIndex: 1, //索引从0开始
		itemStyle: {
			normal: {
				color: '#FF172D'
			}
		},
		data: [25,16,52,42]
	}],
};

//形状单折柱状图配置
var shapeSingleLineBarOption = {
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
		data: ['2017年8月','2018年8月','同比增长'],
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
		data: ['方形','软包','圆柱','总计'],
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
		max: 6400,
		interval: 800 */
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
		/* min: 0,
		max: 70, //最大值
		interval: 10 //间隔值#35AAE0 */
	}],
	series: [{
		name: '2017年8月',
		type: 'bar',
		barMaxWidth:'40',
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
		data: [4000, 2000, 4000, 6000]
	},{
		name: '2018年8月',
		type: 'bar',
		barGap:'20%',
		barCategoryGap:'10%',
		barMaxWidth:'40',
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
		data: [5000, 2000, 1500, 3900],
	},{
		name: '同比增长',
		type: 'line',
		symbol: 'circle',
		symbolSize: 7,
		yAxisIndex: 1, //索引从0开始
		itemStyle: {
			normal: {
				color: '#FF172D'
			}
		},
		data: [25,16,52,42]
	}],
};

//车型材料叠加柱状图配置
var typeMaterialFoldBarOption = {
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
		left: 'center',
		bottom:'0',
		itemGap:15,	
		itemWidth :11,
		itemHeight:11,
		textStyle: {
			color: '#03E0C2'
		},
		data: ['LFP占比', 'LMO占比', 'LTO占比', 'NCA占比', 'NCM占比'],
	},
	grid: {
		left: '9%',
		right: '8%',
		top:'10%',
		bottom:'20%'
	},
	xAxis: [{
		type: 'category',
		data: ['EV乘用车', 'PHEV乘用车', 'EV客车', 'PHEV客车', 'EV专用车'],
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
		},
		/* min: 0,
		max: 100, //最大值
		interval: 10 //间隔值 */
	}],
	series: [{
		name: 'LFP占比',
		type: 'bar',
		stack:1,
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#1D54DC'
			}
		},
		data: [40, 20, 40,15,10]
	},{
		name: 'LMO占比',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#DCBC35'
			}
		},
		data: [10,10,10,15,10]
	},{
		name: 'LTO占比',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#DC3156'
			}
		},
		data: [10,10,20,15,10]
	},{
		name: 'NCA占比',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#2BA56A'
			}
		},
		data: [10,10,20,15,10]
	},{
		name: 'NCM占比',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#A500D5'
			}
		},
		data: [10,10,20,15,10]
	}],
};

//车型形状叠加柱状图配置
var typeShapeFoldBarOption = {
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
		left: 'center',
		bottom:'0',
		itemGap:15,	
		itemWidth :11,
		itemHeight:11,
		textStyle: {
			color: '#03E0C2'
		},
		data: ['方形占比', '软包占比', '圆柱占比'],
	},
	grid: {
		left: '9%',
		right: '8%',
		top:'10%',
		bottom:'18%'
	},
	xAxis: [{
		type: 'category',
		data: ['EV乘用车', 'PHEV乘用车', 'EV客车', 'PHEV客车', 'EV专用车'],
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
		},
		/* min: 0,
		max: 100, //最大值
		interval: 10 //间隔值 */
	}],
	series: [{
		name: '方形占比',
		type: 'bar',
		stack:1,
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#1D54DC'
			}
		},
		data: [40, 20, 40,15,10]
	},{
		name: '软包占比',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#DCBC35'
			}
		},
		data: [10,10,10,15,10]
	},{
		name: '圆柱占比',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#DC3156'
			}
		},
		data: [10,10,20,15,10]
	}],
};
	
//材料车型叠加柱状图配置
var materialTypeFoldBarOption = {
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
		left: 'center',
		bottom:'0',
		itemGap:15,	
		itemWidth :11,
		itemHeight:11,
		textStyle: {
			color: '#03E0C2'
		},
		data: ['EV乘用车', 'PHEV乘用车', 'EV客车', 'PHEV客车', 'EV专用车'],
	},
	grid: {
		left: '9%',
		right: '8%',
		top:'10%',
		bottom:'18%'
	},
	xAxis: [{
		type: 'category',
		data: ['LFP','LMO','LTO','NCA','NCM','总计'],
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
		},
		/* min: 0,
		max: 100, //最大值
		interval: 10 //间隔值 */
	}],
	series: [{
		name: 'EV乘用车',
		type: 'bar',
		stack:1,
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#1D54DC'
			}
		},
		data: [40, 20, 40]
	},{
		name: 'PHEV乘用车',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#DCBC35'
			}
		},
		data: [10,10,10]
	},{
		name: 'EV客车',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#DC3156'
			}
		},
		data: [10,10,10]
	},{
		name: 'PHEV客车',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#2BA56A'
			}
		},
		data: [10,10,10]
	},{
		name: 'EV专用车',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#A500D5'
			}
		},
		data: [10, 20, 15]
	}],
};
	
//形状车型叠加柱状图配置
var shapeTypeFoldBarOption = {
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
		left: 'center',
		bottom:'0',
		itemGap:15,	
		itemWidth :11,
		itemHeight:11,
		textStyle: {
			color: '#03E0C2'
		},
		data: ['EV乘用车', 'PHEV乘用车', 'EV客车', 'PHEV客车', 'EV专用车'],
	},
	grid: {
		left: '9%',
		right: '8%',
		top:'10%',
		bottom:'20%'
	},
	xAxis: [{
		type: 'category',
		data: ['方形','软包','圆柱'],
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
		},
		/* min: 0,
		max: 100, //最大值
		interval: 10 //间隔值 */
	}],
	series: [{
		name: 'EV乘用车',
		type: 'bar',
		stack:1,
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#1D54DC'
			}
		},
		data: [40, 20, 40]
	},{
		name: 'PHEV乘用车',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#DCBC35'
			}
		},
		data: [10,10,10]
	},{
		name: 'EV客车',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#DC3156'
			}
		},
		data: [10,10,10]
	},{
		name: 'PHEV客车',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#2BA56A'
			}
		},
		data: [10,10,10]
	},{
		name: 'EV专用车',
		type: 'bar',
		barGap:'20%',
		stack:1,
		barCategoryGap:'10%',
		barMaxWidth:'40',
		itemStyle: {
			normal: {
				color: '#A500D5'
			}
		},
		data: [10, 20, 15]
	}],
};
	

//环形图配置
var annularPieOption = {
	tooltip:{
		show:true,
		formatter:function(param){
			var tip='';
			tip+=param.seriesName+'<br/>'+ param.marker + param.name+ ':' + param.value +"("+param.percent+'%)';
			return tip;
		}
	},
	title: {
		text: 'NCM',
		x: 'center',
		y: 'center',
		textStyle: {
			fontWeight: 'normal',
			fontSize: 20,
			color: "#fff",
		}
	},
	textStyle:{
		rich:{
			a:{//另两个字长度的图例与三字的图例对齐
				padding:[0,12,0,0]
			}
		}
	},
	legend: {
		show: false,
		bottom: 0,
		left: 'center',
		align:'left',
		itemWidth :11,
		itemHeight:11,
		// width:350,
		itemGap:15,	
		textStyle:{
			color:'#03E0C2'
		},
		formatter:function(name){
			if(name.length<3){
				return '{a|'+name+'}';
			}
			else{
				return name;
			}
		},
		data: []//['比亚迪', '北汽', '吉利', '上汽', '江淮','','奇瑞','东风','长安','众泰','其他']
	},
	color: ['#9495FF','#FCD44E','#87E1A3','#ACEB76','#9860E7','#E9A574','#88E6E8','#F46680','#48A1FF','#5355D0'],
	series: [{
		name: 'NCM',
		type: 'pie',
		radius: ['40%', '55%'],
		center:['50%','50%'],
		label: {
			align: 'left',
			normal: {
				show: true,
				textStyle: {
					fontSize: 10,
					fontWeight: 'bold',
					color: '#FFFFFF',
					
				},
				formatter:function(param){
					//return param.name+'\n'+param.percent+'%';
					return param.name;
				}
			}
		},
		data:[]
	}]
}
</script>
</html>