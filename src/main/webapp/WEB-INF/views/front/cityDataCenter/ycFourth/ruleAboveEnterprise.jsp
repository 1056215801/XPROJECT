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
<title>宜春工业大数据规上企业</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content fz0">
		<div class="pro-left">
     	     <ul class="production" style="position: relative;">
				<li class="first-li" val1="2" val2="index1_code2" val3="主要经济指标">
					<div class="product-type">主要经济指标</div>
				</li>
				<li class="first-li" val1="3" val2="index1_code3" val3="工业用电">
					<div class="product-type">工业用电</div>
				</li>
				<li class="first-li" val1="4" val2="index1_code4" val3="区县经济指标"> 
					<div class="product-type">区县经济指标</div>
				</li>
				<li class="first-li" val1="5" val2="index1_code5" val3="园区经济指标"> 
					<div class="product-type">园区经济指标</div>
				</li>
				<li class="first-li" val1="7" val2="index1_code6" val3="八大产业"> 
					<div class="product-type">八大产业</div>
				</li>
				<li class="first-li" val1="8" val2="index1_code7" val3="十大基地"> 
					<div class="product-type">十大基地</div>
				</li>
			    <li class="first-li on" val1="26" val2="index1_code8" val3="规上企业"> 
					<div class="product-type">规上企业</div>
				</li>
				<li class="first-li" val1="" > 
					<div class="product-type">企业融资</div>
				</li>
				<li class="first-li" val1="27" val2="index1_code9" val3="规上企业纳税"> 
					<div class="product-type">规上企业纳税</div>
				</li>
				<li class="first-li" val1="23" val2="index1_code10" val3="产品价格趋势"> 
					<div class="product-type">产品价格趋势</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div class="nav-title">
		    	<form action="" method="post" id="form">
					<input type="hidden" id="orgId" name="orgId" value="${orgId}">
					<input type="hidden" id="year" name="year" value="">
					<input type="hidden" id="month" name="month" value="">
					<input type="hidden" id="lastYear" name="lastYear">
					<input type="hidden" id="lastMonth" name="lastMonth">
					<input type="hidden" id="index" name="index" value="1">
				  </form>
			    	<div class="nav">	
						<div class="nav-text">
						    <div class="tab-eightIndustry" id="tab-eightIndustry" style="margin: 0 20px 0 0;">
						    	<span name="title" class="on" data="zyywsr">规上企业指标</span>
							   	<span name="title" data="zyywsr">规上效益对比</span>
							   	<span name="title" >规上创新对比</span>
						    </div>
							<div class="selects" id="forthTab0" style="display: inline-block;">
								<div class="select select1">
									<p><font id="font1">2018</font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul id="nav1">
										</ul>
									</div>
								</div>
							</div>
							<div class="selects" id="forthTab1" style="display:none;">
								<div class="select">
										<p><font id="font2">宜春市</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="nav2">
												<li data="360900">宜春市</li>
												<!-- <li data="360981">丰城市</li>
												<li data="360921">奉新区</li>
												<li data="360983">高安市</li>
												<li data="360925">靖安县</li>
												<li data="360923">上高县</li>
												<li data="360926">铜鼓县</li>
												<li data="360922">万载县</li>
												<li data="360924">宜丰县</li>
												<li data="360902">袁州区</li>
												<li data="360982">樟树市</li> -->
											</ul>
										</div>
									</div>
									<div class="select">
										<p><font id="font3">主营规模</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="nav3">
												<li data="0">主营规模</li>
												<li data="1">亿元以下</li>
												<li data="2">1-5亿</li>
												<li data="3">5-10亿</li>
												<li data="4">10-30亿</li>
												<li data="5">30-50亿</li>
												<li data="6">50亿以上</li>
											</ul>
										</div>
									</div>
									<div class="select ruleSelect">
										<p><font id="font4">所属行业</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="nav4" class="industryListUl">
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div> 
				</div>
			 <div class="changeParent" id="tab1">
				<div class="blockStyle" style="height: 50%;">
					<div class="spanStyle" style="width: 50%;">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar tab-links" style="cursor: pointer;">
					           	<span class="on">企业指标</span>
								<!-- <div class="fr selects">
									<div class="select ruleSelect">
										<p><font id="tab1-map1-font1">宜春市</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab1-map1-ul1">
												<li data="360900">宜春市</li>
												<li data="360981">丰城市</li>
												<li data="360921">奉新区</li>
												<li data="360983">高安市</li>
												<li data="360925">靖安县</li>
												<li data="360923">上高县</li>
												<li data="360926">铜鼓县</li>
												<li data="360922">万载县</li>
												<li data="360924">宜丰县</li>
												<li data="360902">袁州区</li>
												<li data="360982">樟树市</li>
											</ul>
										</div>
									</div>
									<div class="select">
										<p><font id="tab1-map1-font2">主营规模</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab1-map1-ul2">
												<li data="0">主营规模</li>
												<li data="1">亿元以下</li>
												<li data="2">1-5亿</li>
												<li data="3">5-10亿</li>
												<li data="4">10-30亿</li>
												<li data="5">30-50亿</li>
												<li data="6">50亿以上</li>
											</ul>
										</div>
									</div>
								</div> -->
				            </div>
				            <div class="part-content reusltContent ruleGauge">
				         		<div class="eight-map">
			         				<div class="mapContent" id="ruleGauge"></div>
			         			</div>
			         	     </div>
					    </div>
					</div>
					<div class="spanStyle" style="width: calc(50% - 10px);">
			             <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar tab-links" style="cursor: pointer;">
					           <span class="on">指标分布</span>
					           <span class="noBorderLeft" id="resultAys"></span>
					           <div class="fr selects">
									<div class="select ruleSelect">
										<p><font id="tab1-map2-font1">宜春市</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab1-map2-ul1">
												<li data="360900">宜春市</li>
												<li data="360981">丰城市</li>
												<li data="360921">奉新区</li>
												<li data="360983">高安市</li>
												<li data="360925">靖安县</li>
												<li data="360923">上高县</li>
												<li data="360926">铜鼓县</li>
												<li data="360922">万载县</li>
												<li data="360924">宜丰县</li>
												<li data="360902">袁州区</li>
												<li data="360982">樟树市</li>
											</ul>
										</div>
									</div>
									<div class="select ruleSelect">
										<p><font id="tab1-map2-font2">所属行业</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab1-map2-ul2" class="industryListUl">
											</ul>
										</div>
									</div>
								</div>
				            </div>
				            <div class="orders ordersFourth order-rule" id="order-ruleIceberg">
								<span class="on">主营业务收入</span>
								<span>利润总额</span>
								<span>规上企业数量</span>
							</div>
							<div class="part-content reusltContent ruleContent ruleContent1">
				         		 <div class="eight-map">
				         		 	<div class="mapContent" id='ruleIceberg'></div>
				         		 </div> 
			         	     </div>
			              </div>
			         </div>
				</div>
				<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="spanStyle" style="width: 100%;">
		     		     <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">所属行业排行榜及占比</span>
					           <div class="fr selects">
									<div class="select ruleSelect">
										<p><font id="tab1-map3-font1">宜春市</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab1-map3-ul1">
												<li data="360900">宜春市</li>
												<li data="360981">丰城市</li>
												<li data="360921">奉新区</li>
												<li data="360983">高安市</li>
												<li data="360925">靖安县</li>
												<li data="360923">上高县</li>
												<li data="360926">铜鼓县</li>
												<li data="360922">万载县</li>
												<li data="360924">宜丰县</li>
												<li data="360902">袁州区</li>
												<li data="360982">樟树市</li>
											</ul>
										</div>
									</div>
									<div class="select">
										<p><font id="tab1-map3-font2">主营规模</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab1-map3-ul2">
												<li data='0'>主营规模</li>
												<li data='1'>亿元以下</li>
												<li data='2'>1-5亿</li>
												<li data='3'>5-10亿</li>
												<li data='4'>10-30亿</li>
												<li data='5'>30-50亿</li>
												<li data='6'>50亿以上</li>
											</ul>
										</div>
									</div>
								</div>
				            </div>
					            <div class="orders ordersFourth order-rule" id="order-industryRank">
									<span class="on">企业数量</span>
									<span>主营业务收入</span>
									<span>利润总额</span>
								</div>
								<div class="part-content reusltContent part-content-fourth">
				         			<div class="eight-map">
				         				<div class="tab industryRankTap" style="overflow: hidden; height:100%;">
				         					<div class="mapContent industryRank1 count-list area-list" id="industryRank1"></div>
				         				</div>
				         				<div class="mapContent industryRank2" id="industryRank2"></div>
				         			</div>
			         		   </div>
		     		     </div>
		         	</div>
				</div>
			</div>
			<div class="changeParent" id="tab2" style="display:none;">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 50%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar tab-links">
					           	<span class="on attention">主营利润率对比（%）<font>（注：根据各类企业主营规模划分）</font></span>
								<div class="fr selects">
									<div class="select">
										<p><font id="tab2-map1-font1">宜春市</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map1-ul1">
											    <li data="360900">宜春市</li>
												<li data="360981">丰城市</li>
												<li data="360921">奉新区</li>
												<li data="360983">高安市</li>
												<li data="360925">靖安县</li>
												<li data="360923">上高县</li>
												<li data="360926">铜鼓县</li>
												<li data="360922">万载县</li>
												<li data="360924">宜丰县</li>
												<li data="360902">袁州区</li>
												<li data="360982">樟树市</li>
											</ul>
										</div>
									</div>
									<div class="select ruleSelect">
										<p><font id="tab2-map1-font2">所属行业</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map1-ul2" class="industryListUl">
											</ul>
										</div>
									</div>
								</div>
				            </div>
		                 	<div class="part-content reusltContent" style="position: relative;">
				         		 <div class="eight-map" id="tab2-map1">
				         		 
				         		 </div> 
			         		</div>
			         	 </div>
			         </div>
					<div class="spanStyle" style="width: calc(50% - 10px);">
			             <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar tab-links" style="cursor: pointer;">
					           <span class="on">各行业主营利润率对比</span>
					           	<div class="fr selects">
									<div class="select">
										<p><font id="tab2-map2-font1">宜春市</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map2-ul1">
											    <li data="360900">宜春市</li>
												<li data="360981">丰城市</li>
												<li data="360921">奉新区</li>
												<li data="360983">高安市</li>
												<li data="360925">靖安县</li>
												<li data="360923">上高县</li>
												<li data="360926">铜鼓县</li>
												<li data="360922">万载县</li>
												<li data="360924">宜丰县</li>
												<li data="360902">袁州区</li>
												<li data="360982">樟树市</li>
											</ul>
										</div>
									</div>
									<div class="select">
										<p><font id="tab2-map2-font2">主营规模</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map2-ul2">
											 	<li data="0">主营规模</li>
												<li data="1">亿元以下</li>
												<li data="2">1-5亿</li>
												<li data="3">5-10亿</li>
												<li data="4">10-30亿</li>
												<li data="5">30-50亿</li>
												<li data="6">50亿以上</li>
											</ul>
										</div>
									</div>
								</div>
				            </div>
							<div class="part-content reusltContent">
							     <div class="tab" style="overflow: hidden;height: 100%">
								   <div class="count-list area-list" id="tab2-rateList" style="height:100%;margin-top:0;"></div>
								</div>
			         	     </div>
			              </div>
			         </div>
				</div>
				<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="spanStyle" style="width: 50%;">
		     		     <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on attention">企业数量对比<font>（注：根据利润盈亏划分）</font></span>
					           	<div class="fr selects">
									<div class="select">
										<p><font id="tab2-map3-font1">宜春市</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map3-ul1">
												<li data="360900">宜春市</li>
												<li data="360981">丰城市</li>
												<li data="360921">奉新区</li>
												<li data="360983">高安市</li>
												<li data="360925">靖安县</li>
												<li data="360923">上高县</li>
												<li data="360926">铜鼓县</li>
												<li data="360922">万载县</li>
												<li data="360924">宜丰县</li>
												<li data="360902">袁州区</li>
												<li data="360982">樟树市</li>
											</ul>
										</div>
									</div>
									<div class="select">
										<p><font id="tab2-map3-font2">主营规模</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map3-ul2">
												<li data="0">主营规模</li>
												<li data="1">亿元以下</li>
												<li data="2">1-5亿</li>
												<li data="3">5-10亿</li>
												<li data="4">10-30亿</li>
												<li data="5">30-50亿</li>
												<li data="6">50亿以上</li>
											</ul>
										</div>
									</div>
									<div class="select ruleSelect">
										<p><font id="tab2-map3-font3">所属行业</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map3-ul3" class="industryListUl">
											</ul>
										</div>
									</div>
								</div>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map" id="tab2-map3">
			         			</div>
		         		   </div>
		     		     </div>
		         	</div>
		         	<div class="spanStyle" style="width: calc(50% - 10px);">
		         	      <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on attention">企业数量对比<font>（注：根据指标同比划分）</font></span>
					                <div class="fr selects">
									<div class="select">
										<p><font id="tab2-map4-font1">宜春市</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map4-ul1">
												<li data="360900">宜春市</li>
												<li data="360981">丰城市</li>
												<li data="360921">奉新区</li>
												<li data="360983">高安市</li>
												<li data="360925">靖安县</li>
												<li data="360923">上高县</li>
												<li data="360926">铜鼓县</li>
												<li data="360922">万载县</li>
												<li data="360924">宜丰县</li>
												<li data="360902">袁州区</li>
												<li data="360982">樟树市</li>
											</ul>
										</div>
									</div>
									<div class="select">
										<p><font id="tab2-map4-font2">主营规模</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map4-ul2">
											 	<li data="0">主营规模</li>
												<li data="1">亿元以下</li>
												<li data="2">1-5亿</li>
												<li data="3">5-10亿</li>
												<li data="4">10-30亿</li>
												<li data="5">30-50亿</li>
												<li data="6">50亿以上</li>
											</ul>
										</div>
									</div>
									<div class="select ruleSelect">
										<p><font id="tab2-map4-font3">所属行业</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="tab2-map4-ul3" class="industryListUl">
											</ul>
										</div>
									</div>
								</div>
				            </div>
							<div class="part-content reusltContent" style="padding:10px">
								<div class="orders ruleOrders" id="order-qysl" style="display: inline-block;margin-bottom:0">
									<span class="on">
										利润同比
									</span>
									<span>
										主营同比
									</span>
								</div>
				         		<div class="eight-map" style="height:calc(100% - 21px);">
			         				<div  class="mapContent" id="tab2-map4"></div>
				         		</div>
			         	   </div>
		         	     </div>
		         	</div>
				</div>
			</div>
			<div class="changeParent" id="tab3" style="display:none;">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 50%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar" style="cursor: pointer;">
					           <span class="tabCaption">各类型企业规上数量对比</span>
				            </div>
		                 	<div class="part-content reusltContent" style="position: relative;">
		                 		<div class="tab3Total" id="tab3-map3-content1">
		         				    <span>全部规上企业总量</span>
		         				    <p><span id="total1" class="total"></span><span>家</span></p>
			         			 </div>
				   			   <div class="eight-map" id="tab3-map1">
				         		</div>
			         		</div>
			         	 </div>
			         </div>
					<div class="spanStyle" style="width: calc(50% - 10px);">
			             <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar tab-links" style="cursor: pointer;">
					           <span class="on">各类型企业平均指标对比</span>
					           <span class="noBorderLeft" id="resultAys"></span>
				            </div>
							<div class="part-content reusltContent">
				         		 <div class="rueAbMap" id="tab3-map2-s1">
				         		 </div> 
				         		 <div class="rueAbMap" id="tab3-map2-s2">
				         		 </div> 
			         	     </div>
			              </div>
			         </div>
				</div>
				<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="spanStyle" style="width: 50%;">
		     		     <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">各类型企业主营对比</span>
				            </div>
							<div class="part-content reusltContent">
								 <div class="tab3Total" id="tab3-map3-content3">
		         				    <span>全部规上企业主营</span>
		         				    <p><span id="total3" class="total"></span><span>亿元</span></p>
			         			 </div>
			         			<div class="eight-map" id="tab3-map3">
			         			</div>
		         		   </div>
		     		     </div>
		         	</div>
		         	<div class="spanStyle" style="width: calc(50% - 10px);">
		         	      <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">各类型企业利润对比</span>
				            </div>
							<div class="part-content reusltContent" style="padding:10px">
							     <div class="tab3Total" id="tab3-map3-content4">
		         				    <span>全部规上企业利润</span>
		         				    <p><span id="total4" class="total"></span><span>亿元</span></p>
			         			 </div>
				         		<div class="eight-map" id="tab3-map4">
				         		</div>
			         	   </div>
		         	     </div>
		         	</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script src="${ctx}/static/js/dataCenter/highcharts.js"></script>
<script src="${ctx}/static/js/dataCenter/highcharts-3d.js"></script>
<script type="text/javascript">
var orderby=1;
var kind1=0;
var kind2=0;
var year1=2018;
var city1="360900";
var city2="360900";
var city3="360900";
$(function(){
	$(".head>a:eq(1)").addClass("on");
	$("#tab-eightIndustry>span").on("click",function(){
		var ind = $(this).index()+1;
		index = $(this).attr("data");
		$(this).addClass("on").siblings().removeClass("on");
		$("#tab"+ind).fadeIn("fast").siblings('.changeParent').fadeOut("fast");
		$('#index').val(ind);
		if(ind==1){
			$('#forthTab1').css('display','none');
		}else if(ind==2){
			getTab2Map1()//获取第二个tab的map1
			getTab2Map2()//获取第二个tab的map2
			getTab2Map3()//获取第二个tab的map3
			getTab2Map4()//获取第二个tab的map4
			$('#forthTab1').css('display','none');
		}else{
			getTab3Map();
			$('#forthTab1').css('display','inline-block');
		}
	});
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
	$(".orders span").on("click",function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		if($(this).parent().attr("id") == 'order-ruleIceberg') {
			getRuleIceberg(ind)
		}else if($(this).parent().attr("id") == 'order-industryRank') {
			orderby = ind + 1;
			getRankList();
		}else if($(this).parent().attr("id") == 'order-qysl') {
			t2m4Type = ind+1
			getTab2Map4();
		}
	});
	getselectYear();
	getIndustryList();//获取产业类型
	getRuleGauge();//仪表盘;	
	getRuleIceberg(0);//规上冰山图
	getRankList();//所属行业排行榜
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v1 = $(this).attr("val1");
		var v2 = $(this).attr("val2");
		var v3 = $(this).attr("val3");
		if(v1!=''){
			checkRight(v1,'',v2,v3);
		} else { alert("建设中!")}
	});
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		if($(this).parent().attr('id')=='tab1-map1-ul1'){
			$('#tab1-map1-font1').text($(this).text());
			city1 = $(this).attr('data');
			getRuleGauge();
		}else if($(this).parent().attr('id')=='nav1'){
			var index = $('#index').val();
			$('#font1').text($(this).text());
			year1 = $(this).text();
			if(index==1){
				getRuleGauge();
				getRuleIceberg(0);
				getRankList();
			}else if(index==2){
				getTab2Map1()//获取第二个tab的map1
				getTab2Map2()//获取第二个tab的map2
				getTab2Map3()//获取第二个tab的map3
				getTab2Map4()//获取第二个tab的map4
			}else {
				getTab3Map();
			}
		}else if($(this).parent().attr('id')=='tab1-map1-ul2'){
			$('#tab1-map1-font2').text($(this).text());
 			kind1 = $(this).attr('data');
 			getRuleGauge();
		}else if($(this).parent().attr('id')=='tab1-map2-ul1'){
			$('#tab1-map2-font1').text($(this).text());
			city2 = $(this).attr('data');
			getRuleIceberg(0);
		}else if($(this).parent().attr('id')=='tab1-map3-ul1'){
			$('#tab1-map3-font1').text($(this).text());
			city3 = $(this).attr('data');
			getRankList();
		}else if($(this).parent().attr('id')=='tab1-map3-ul2'){
			$('#tab1-map3-font2').text($(this).text());
			kind2 = $(this).attr('data');
			getRankList();
		}else if($(this).parent().attr('id')=='tab2-map1-ul1'){
			$('#tab2-map1-font1').text($(this).text());
			 t2m1OrgId = $(this).attr("data");
			 t2m1OrgType = 2;
            if(t2m1OrgId=='360900'){
            	t2m1OrgType = 1;
            }
            getTab2Map1();
		}else if($(this).parent().attr('id')=='tab2-map1-ul2'){
			$('#tab2-map1-font2').text($(this).text());
			t2m1kind = $(this).attr("data");
            getTab2Map1();
		}else if($(this).parent().attr('id')=='tab2-map2-ul1'){
			$('#tab2-map2-font1').text($(this).text());
			 t2m2OrgId = $(this).attr("data");
			 t2m2OrgType = 2;
            if(t2m2OrgId=='360900'){
            	t2m2OrgType = 1;
            }
            getTab2Map2();
		}else if($(this).parent().attr('id')=='tab2-map2-ul2'){
			$('#tab2-map2-font2').text($(this).text());
			t2m2kind = $(this).attr("data");
            getTab2Map2();
		}else if($(this).parent().attr('id')=='tab2-map3-ul1'){
			$('#tab2-map3-font1').text($(this).text());
			 t2m3OrgId = $(this).attr("data");
			 t2m3OrgType = 2;
            if(t2m3OrgId=='360900'){
            	t2m3OrgType = 1;
            }
            getTab2Map3();
		}else if($(this).parent().attr('id')=='tab2-map3-ul2'){
			$('#tab2-map3-font2').text($(this).text());
			t2m3kind = $(this).attr("data");
            getTab2Map3();
		}else if($(this).parent().attr('id')=='tab2-map4-ul1'){
			$('#tab2-map4-font1').text($(this).text());
			 t2m4OrgId = $(this).attr("data");
			 t2m4OrgType = 2;
            if(t2m4OrgId=='360900'){
            	t2m4OrgType = 1;
            }
            getTab2Map4();
		}else if($(this).parent().attr('id')=='tab2-map4-ul2'){
			$('#tab2-map4-font2').text($(this).text());
			t2m4kind = $(this).attr("data");
            getTab2Map4();
		}else if($(this).parent().attr('id')=='nav2'){
			$('#font2').text($(this).text());
			 t3mOrgId = $(this).attr("data");
			 t3mOrgType = 2;
            if(t3mOrgId=='360900'){
            	t3mOrgType = 1;
            }
            getTab3Map();
		}else if($(this).parent().attr('id')=='nav3'){
			$('#font3').text($(this).text());
			t3mkind = $(this).attr("data");
            getTab3Map();
		}else if($(this).parent().attr('id')=='nav4'){
			$('#font4').text($(this).text());
			t3mtypeId = $(this).attr("data");
            getTab3Map();
			
		}
	});
});
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    /* for(var i=y; i>2014;i--){
    	$('#nav1').append('<li>'+i+'</li>');
    } */
    $('#nav1').append('<li>2018</li>');
}

//获取产业类型
function getIndustryList(){
	$.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/industryList",
		type : "post",
		data : {
			"orgId ": $('#orgId').val()=='3609009'?'360900':"360900",
 		},
		dataType : "json",
		success : function(result){ 
		if(result.success){
			 if(result.list.length>0){
				 $('.industryListUl').append('<li data="0">'+'所属行业'+'</li>');
				 for(var i=0;i<result.list.length;i++){
					 var info = result.list[i];
					$('.industryListUl').append('<li data="'+info.TYPE_ID+'">'+info.TYPE_NAME+'</li>');
				 }
				$(".industryListUl li").on("click",function(){
					$(this).parents('.select-items').slideToggle();
					if($(this).parent().attr('id')=='tab1-map2-ul2'){
						$('#tab1-map2-font2').text($(this).text());
						t1m2typeId = $(this).attr('data');
						getRuleIceberg(0);
					}else if($(this).parent().attr('id')=='tab2-map1-ul2'){
						$('#tab2-map1-font2').text($(this).text());
						t2m1typeId = $(this).attr('data');
						getTab2Map1();
					}else if($(this).parent().attr('id')=='tab2-map3-ul3'){
						$('#tab2-map3-font3').text($(this).text());
						t2m3typeId = $(this).attr('data');
						getTab2Map3();
					}else if($(this).parent().attr('id')=='tab2-map4-ul3'){
						$('#tab2-map4-font3').text($(this).text());
						t2m4typeId = $(this).attr('data');
						getTab2Map4();
					}else if($(this).parent().attr('id')=='nav4'){
						$('#font4').text($(this).text());
						t3mtypeId = $(this).attr('data');
						getTab3Map();
					}
				})
			 }
		}else{
			alert(result.errorMsg);
		}
	},
	error : function() {
		//tips("请求超时，请稍后重试");
	},
   });
}

//仪表盘
function getRuleGauge(kind){
	var orgType1 = 1;
	city1 == "360900"?orgType1=1:orgType1=2;
	var param = {
		"kind": kind1,
		"year": year1,
		"orgType": orgType1,
		"orgId": city1,
	}	
	$.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/summary",
		type : "post",
		data : param,
		dataType : "json",
		success : function(result) {
			console.log(result)
			if(result.success){
				if(result.map.GS_TOTAL == undefined){
					$("#ruleGauge").html("<div class='noData'>暂无数据</div>");
				}else{
					ruleGauge(result.map);
				}
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	})
}
//规上冰山图
var t1m2typeId="";
function getRuleIceberg(type){
	var orgType1 = 1;
	city2 == "360900"?orgType1=1:orgType1=2;
	var param = {
		"year": year1,
		"orgType": orgType1,
		"orgId": city2,
		"typeId":t1m2typeId!='0'?t1m2typeId:''
	}	
	console.log(param)
	$.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/distribution",
		type : "post",
		data : param,
		dataType : "json",
		success : function(result){
			if(result.success){
				function section(s){
					if(s==1){
						return '亿元以下'
					}else if(s==2){
						return '1-5亿'
					}else if(s==3){
						return '5-10亿'
					}else if(s==4){
						return '10-30亿'
					}else if(s==5){
						return '30-50亿'
					}else if(s==6){
						return '50亿以上'
					}
				}
				var xData=[];
				var val=[];
				var name='';
				for(var i=0;i<result.list.length;i++){
					var info = result.list[i]
					xData.push(section(info.KIND));
					if(type == 0){
						val.push((info.ZYYWSR_TOTAL/10000).toFixed(2));
						name = '收入';
						unit = '亿元';
					}else if(type == 1){
						val.push((info.LR_TOTAL/10000).toFixed(2));
						name = '利润总额';
						unit = '亿元';
					}else if(type == 2){
						val.push(info.COMAPNY_TOTAL);
						name = '数量';
						unit = '家';
					}
				}
				if(val.length<2){
					$("#ruleIceberg").html("<div class='noData'>暂无数据</div>");
				}else{
					ruleIceberg(val,xData,name,unit);
				}
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	})
}
//所属行业排行榜及占比
function getRankList(type){
	var orgType1 = 1;
	city3 == "360900"?orgType1=1:orgType1=2;
	$.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/industryShare",
		type : "post",
		data : {
			"areaId": $('#orgId').val()=='3609009'?'360900':"360900",
			"order": orderby,
			"kind": kind2,
			"year": year1,
			"orgType": orgType1,
			"orgId": city3,
 		},
		dataType : "json",
		success : function(result) {
			if(result.success){
				var list = result.list;
				if(list.length>0){
					$('#industryRank1').empty();
					var temps=[];
					var temp;
					var total = 0;
					var unit = "家";
					var tempValue = 0;
					var other = 10;
					for (var i=0;i<list.length;i++){
						var info = list[i];
						var companyTotal = list[0].COMPANY_TOTAL;
						var zyywsrValue = list[0].ZYYWSR_TOTAL;
						var lrValue = list[0].LR_VALUE;
						var index = i+1;
					    var _div = "";
					    if(i==0){
					    	$('#typeName').val(info.TYPE_NAME);
							    _div += '<div class="count-item" onclick="changeMap(this,\''+info.TYPE_NAME+'\')">'
						    }else{
							    _div += '<div class="count-item" onclick="changeMap(this,\''+info.TYPE_NAME+'\')">'
						    }
		 				_div += '<font style="width:135px;">'+index+'.'+info.TYPE_NAME+'</font>';
		 				_div += '<span style="width: calc(100% - 285px);">';
		 				if(orderby==1){
					    	if(info.COMPANY_TOTAL){
					    		_div += '<div style="width: '+(((info.COMPANY_TOTAL?info.COMPANY_TOTAL:'0')/companyTotal)*100*0.9).toFixed(2)+'%;"></div>';
				 				_div += '</span><b style="width:120px;">'+(info.COMPANY_TOTAL?info.COMPANY_TOTAL:'0')+'<i>家</i></b></div>';
					    	}else{
					    		_div += '<div style="width: 0%;"></div>';
				 				_div += '</span><b style="width:80px;">未公布</b></div>';
				 			}
					    	if(i<other){
					    		temp = {
									name: info.TYPE_NAME,
									value: info.COMPANY_TOTAL,
								};
					    	}else{
					    		tempValue = tempValue + Number(info.COMPANY_TOTAL);
					    	}
					    	unit = "家";
					    }else if(orderby==2){
			    	    	if(info.ZYYWSR_TOTAL && zyywsrValue != '0'){
			    	    		_div += '<div style="width: '+(((info.ZYYWSR_TOTAL?info.ZYYWSR_TOTAL:'0')/zyywsrValue)*100*0.9).toFixed(2)+'%;"></div>';
			    	    		var ZYYWSR_TOTAL = info.ZYYWSR_TOTAL/10000;
				 				_div += '</span><b style="width:120px;">'+(ZYYWSR_TOTAL!=undefined?ZYYWSR_TOTAL.toFixed(2):'0')+'<i>亿元</i></b></div>';
			    	    	}else{
			    	    		_div += '<div style="width: 0%;"></div>';
				 				_div += '</span><b style="width:80px;">未公布</b></div>';								 
			    	    	}
			    	    	if(i<other){
			    	    		temp = {
									name: info.TYPE_NAME,
									value: (info.ZYYWSR_TOTAL/10000).toFixed(2),
								};
					    	}else{
					    		tempValue = tempValue + (Number(info.ZYYWSR_TOTAL)/10000);
					    	}
			    	    	console.log(typeof((Number(info.ZYYWSR_TOTAL)/10000)));
			    	    	unit = "亿元";
					    }else{
					    	 if(info.LR_VALUE && lrValue != '0'){
					    		 _div += '<div style="width: '+(((info.LR_VALUE?info.LR_VALUE:'0')/lrValue)*100*0.9).toFixed(2)+'%;"></div>';
					    		 var LR_VALUE = info.LR_VALUE/10000;
					 			_div += '</span><b style="width:120px;">'+(LR_VALUE!=undefined?LR_VALUE.toFixed(2):'0')+'<i>亿元</i></b></div>';
					    	 }else{
					    		 _div += '<div style="width: 0%;"></div>';
					 			_div += '</span><b style="width:80px;">未公布</b></div>';
					 		}
					    	if(i<other){
					    		temp = {
									name: info.TYPE_NAME,
									value: (info.LR_VALUE/10000).toFixed(2),
								};
					    	}else{
					    		tempValue = tempValue + (Number(info.LR_VALUE)/10000);
					    	}
					    	unit = "亿元";
					    }
						$('#industryRank1').append(_div);
						if(i<other){
							temps.push(temp);
						}
						total = total + Number(info.COMPANY_TOTAL);
					}
					temp1 = {
						name: '其它',
						value: orderby == 1?tempValue:tempValue.toFixed(2),
					};
					if(list.length>other){
						temps.push(temp1);
					}
					console.log(temps)
					console.log(total)
										console.log(unit)
					rankPie(temps,total,unit);
				}else{
					$("#industryRank1").html("<div class='noData'>暂无数据</div>");
					$("#industryRank2").html("<div class='noData'>暂无数据</div>");
				};
			}else{
				tips("数据获取异常");
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
var t2m1OrgId=360900;
var t2m1OrgType=1;
var t2m1kind=0;
var t2m1typeId="";
function getTab2Map1(orgId,orgType,kind){
	var param = {
		orgId: t2m1OrgId,
		orgType: t2m1OrgType,
		kind: t2m1kind,
		year: year1,
		typeId: t2m1typeId!='0'?t2m1typeId:''
	}	
	$.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/distribution",
		type : "post",
		data : param,
		dataType : "json",
		success : function(result) {
			function section(s){
				if(s==1){
					return '亿元以下'
				}else if(s==2){
					return '1-5亿'
				}else if(s==3){
					return '5-10亿'
				}else if(s==4){
					return '10-30亿'
				}else if(s==5){
					return '30-50亿'
				}else if(s==6){
					return '50亿以上'
				}
			}
			var xData = [];
			if(result.success){
				var val=[];
				for(var i=0;i<result.list.length;i++){
					var info = result.list[i]
					xData.push(section(info.KIND));
					val.push(info.LR_RATE);
				}
				console.log(val)
				if(val.length<2){
					$("#tab2-map1").html("<div class='noData'>暂无数据</div>");
				}else{
					chartTab2Map1(val,xData,'tab2-map1')
				}
			}else{
				alert(result.errorMsg);
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	})
}
var t2m2OrgId=360900;
var t2m2OrgType=1;
var t2m2kind=0;
function getTab2Map2(){
	var param = {
		orgId: t2m2OrgId,
		order: '4',
		kind: t2m2kind,
		orgType: t2m2OrgType,
		year: year1
	}	
	$.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/industryShare",
		type : "post",
		data : param,
		dataType : "json",
		success : function(result) {
			if(result.success){
				$("#tab2-rateList").html("");
				 var list = result.list;
				 var _div = "";
				  if(list.length>0){
					 for(var i=0;i<list.length;i++){
						 var info = list[i];
						 var index = i+1;
						 var w = i==0? '90' : ((info.LR_RATE/list[0].LR_RATE)*90).toFixed(2);
				    	 _div += '<div class="count-item">';
		 				 _div += '<font>'+index+'.'+info.TYPE_NAME+'</font>';
		 				 _div += '<span>';
		 				 if(info.LR_RATE){
				 			_div += '<div style="width: '+w+'%;"></div>';
			 				_div += '</span><b style="width:85px;">'+info.LR_RATE+'<i>%</i></b></div>';
		 				 }else{
		 					_div += '<div style="width: 0%;"></div>';
			 				_div += '</span><b style="width:80px;">未公布</b></div>';
		 				 }
					 }
					 $('#tab2-rateList').append(_div);
				 }else{
					$("#tab2-rateList").append("<div class='noData'>暂无数据</div>");
				 } 
				
			}else{
				alert(result.errorMsg);
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	})
}
var t2m3OrgId=360900;
var t2m3OrgType=1;
var t2m3kind=0;
var t2m3typeId="";
function getTab2Map3(){
	var param = {
			orgId: t2m3OrgId,
			kind: t2m3kind,
			orgType: t2m3OrgType,
			year: year1,
			typeId:t2m3typeId!='0'?t2m3typeId:''
		}	
	 $.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/profitAndLoss",
		type : "post",
		data : param,
		dataType : "json",
		success : function(result){ 
		if(result.success){
			 var list = result.list;
			 var _div = "";
			 var array = [];
			 for(var i=0;i<list.length;i++){
				 var info = list[i];
				 var temp = {
					name: info.PROFIT=='1'?'盈利':'亏损',
					y: Number(info.COMPANT_TOTAL),
					sliced:'true',
					selected:'true'
				   }
				 array.push(temp);
			 }
			 if(array.length>0){
				 chartTab2PieMap3(array);
			 }else{
					$("#tab2-map3").html("<div class='noData'>暂无数据</div>");
			 }
		}else{
			alert(result.errorMsg);
		}
		
	},
	error : function() {
		//tips("请求超时，请稍后重试");
	},
    });
	
}
var t2m4OrgId=360900;
var t2m4OrgType=1;
var t2m4kind=0;
var selectType=1;
var t2m4Type = 1;
var t2m4typeId="";
function getTab2Map4(){
	var param = {
			orgId: t2m4OrgId,
			kind: t2m4kind,
			orgType: t2m4OrgType,
			year: year1,
			type: t2m4Type,
			typeId:t2m4typeId!='0'?t2m4typeId:''
		}
	  $.ajax({
		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/lifting",
		type : "post",
		data :param,
		dataType : "json",
		success : function(result){ 
		if(result.success){
			 var list = result.list;
			 var _div = "";
			 var array = [];
		     for(var i=0;i<list.length;i++){
				 var info = list[i];
				 var temp = {
					name: info.LIFTING=='1'?'同比上升':'同比下降',
					y: Number(info.COMPANT_TOTAL),
					sliced:'true',
					selected:'true'
				   }
				 array.push(temp);
			 }
		     
		     if(array.length>0){
			     chartTab2PieMap4(array);
			 }else{
				$("#tab2-map4").html("<div class='noData'>暂无数据</div>");
			 }
		}else{
			alert(result.errorMsg);
		}
		
	},
	error : function() {
		//tips("请求超时，请稍后重试");
	},
   });
}
var t3mOrgId=360900;
var t3mOrgType=1;
var t3mkind=0;
var t3mtypeId="";
function getTab3Map(){
	var param = {
			orgId: t3mOrgId,
			kind: t3mkind,
			orgType: t3mOrgType,
			year: year1,
			typeId: t3mtypeId!='0'?t3mtypeId:''
		}
	  $.ajax({
		url : "${OfficeUrl}XOffice/interface/json/officeCompanyIndexes/innovationContrast",
		type : "post",
		data : param,
		dataType : "json",
		success : function(result){ 
		console.log(result)
		if(result.success){
		     var companyTotalJson = result.value.companyTotalJson;
		     var zyywsrTotalJson = result.value.zyywsrTotalJson;
		     var lrTotalJson = result.value.lrTotalJson;
		     var avgJson = result.value.avgJson;
		     /* $('#total1').text(companyTotalJson.company_total);
		     $('#total3').text(zyywsrTotalJson.zyywsr_total);
		     $('#total4').text(lrTotalJson.lr_total); */
		     $('#total1').text(Number(1547));
		     $('#total3').text(Number(3058.4));
		     $('#total4').text(Number(277));
		     /* var array1 = [
		    	 {"name":"高新技术","value":companyTotalJson.high_technology!=undefined?companyTotalJson.high_technology:'0'},
		    	 {"name":"两化融合","value":companyTotalJson.two_integration!=undefined?companyTotalJson.two_integration:'0'},
		    	 {"name":"专精特新","value":companyTotalJson.mastery_enterprise!=undefined?companyTotalJson.mastery_enterprise:'0'},
		     ];
		     var array2 = [
		    	 {"name":"高新技术","value":zyywsrTotalJson.high_technology!=undefined?zyywsrTotalJson.high_technology:'0'},
		    	 {"name":"两化融合","value":zyywsrTotalJson.two_integration!=undefined?zyywsrTotalJson.two_integration:'0'},
		    	 {"name":"专精特新","value":zyywsrTotalJson.mastery_enterprise!=undefined?zyywsrTotalJson.mastery_enterprise:'0'},
		     ];
		     var array3 = [
		    	 {"name":"高新技术","value":lrTotalJson.high_technology!=undefined?lrTotalJson.high_technology:'0'},
		    	 {"name":"两化融合","value":lrTotalJson.two_integration!=undefined?lrTotalJson.two_integration:'0'},
		    	 {"name":"专精特新","value":lrTotalJson.mastery_enterprise!=undefined?lrTotalJson.mastery_enterprise:'0'},
		     ]; */
		     
             /* if(!$.isEmptyObject(companyTotalJson)){
    		     chartTab3GsPie(array1,'tab3-map1',1);
    		     $('#tab3-map3-content1').show();
		     }else{
		 		$("#tab3-map1").html("<div class='noData'>暂无数据</div>");
   		        $('#tab3-map3-content1').hide();
		     } */
             /*  if(!$.isEmptyObject(zyywsrTotalJson)){
     		     chartTab3GsPie(array2,'tab3-map3',2);
     		     $('#tab3-map3-content3').show();
 		     }else{
 		 		$("#tab3-map3").html("<div class='noData'>暂无数据</div>");
    		     $('#tab3-map3-content3').hide();
 		     } */
             /*  if(!$.isEmptyObject(lrTotalJson)){
     		     chartTab3GsPie(array3,'tab3-map4',2);
     		     $('#tab3-map3-content4').show();
		     }else{
			 	$("#tab3-map4").html("<div class='noData'>暂无数据</div>");
    		     $('#tab3-map3-content4').hide();
		     } */
             var legend = ["高新技术","专精特新","两化融合",];
		     var lrArray = [
		    	 avgJson.lrAvg.high_technology!=undefined?avgJson.lrAvg.high_technology:'0',
		    	 avgJson.lrAvg.mastery_enterprise!=undefined?avgJson.lrAvg.mastery_enterprise:'0',
		    	 avgJson.lrAvg.two_integration!=undefined?avgJson.lrAvg.two_integration:'0',
		     ];
		     var zyArray = [
		    	 avgJson.zyywsrAvg.high_technology!=undefined?avgJson.zyywsrAvg.high_technology:'0',
		    	 avgJson.zyywsrAvg.mastery_enterprise!=undefined?avgJson.zyywsrAvg.mastery_enterprise:'0',
		    	 avgJson.zyywsrAvg.two_integration!=undefined?avgJson.zyywsrAvg.two_integration:'0',
		     ];
		     chartTab2Map2(lrArray,legend,'tab3-map2-s2','平均利润（亿元）')
		     chartTab2Map2(zyArray,legend,'tab3-map2-s1','平均主营（亿元）')
		     
		     var ctArray = [
				companyTotalJson.high_technology!=undefined?companyTotalJson.high_technology:'0',
				companyTotalJson.mastery_enterprise!=undefined?companyTotalJson.mastery_enterprise:'0',
				companyTotalJson.two_integration!=undefined?companyTotalJson.two_integration:'0',
		     ]
		     var ctLine = [
				companyTotalJson.high_technology!=undefined?(companyTotalJson.high_technology/1547*100).toFixed(2):'',
				companyTotalJson.mastery_enterprise!=undefined?(companyTotalJson.mastery_enterprise/1547*100).toFixed(2):'',
				companyTotalJson.two_integration!=undefined?(companyTotalJson.two_integration/1547*100).toFixed(2):'',
		     ]
		     var ztArray = [
		    	zyywsrTotalJson.high_technology!=undefined?zyywsrTotalJson.high_technology:'0',
		    	zyywsrTotalJson.mastery_enterprise!=undefined?zyywsrTotalJson.mastery_enterprise:'0',
		    	zyywsrTotalJson.two_integration!=undefined?zyywsrTotalJson.two_integration:'0',
		     ]
		     var ztLine = [
		    	zyywsrTotalJson.high_technology!=undefined?(zyywsrTotalJson.high_technology/3058.4*100).toFixed(2):'0',
		    	zyywsrTotalJson.mastery_enterprise!=undefined?(zyywsrTotalJson.mastery_enterprise/3058.4*100).toFixed(2):'0',
		    	zyywsrTotalJson.two_integration!=undefined?(zyywsrTotalJson.two_integration/3058.4*100).toFixed(2):'0',
		     ]
		     var ltArray = [
		    	lrTotalJson.high_technology!=undefined?lrTotalJson.high_technology:'0',
		    	lrTotalJson.mastery_enterprise!=undefined?lrTotalJson.mastery_enterprise:'0',
		    	lrTotalJson.two_integration!=undefined?lrTotalJson.two_integration:'0',
		     ]
		     var ltLine = [
		    	lrTotalJson.high_technology!=undefined?(lrTotalJson.high_technology/277*100).toFixed(2):'',
		    	lrTotalJson.mastery_enterprise!=undefined?(lrTotalJson.mastery_enterprise/277*100).toFixed(2):'',
		    	lrTotalJson.two_integration!=undefined?(lrTotalJson.two_integration/277*100).toFixed(2):'',
		     ]
		     chartTab3Map1(ctArray,ctLine,legend,'tab3-map1',0);
		     chartTab3Map1(ztArray,ztLine,legend,'tab3-map3',1);
		     chartTab3Map1(ltArray,ltLine,legend,'tab3-map4',2);
		}else{
			alert(result.errorMsg);
		}
		
	},
	error : function() {
		//tips("请求超时，请稍后重试");
	},
 });
}
</script>
</html>