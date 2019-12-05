<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/style.min.css?v=4.1.0"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/plugins/zturn/css/public.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/plugins/zturn/css/index.css"/>
<style type="text/css">
.industryLogo {
	width: 100%;
	text-align: center;
	height: 80px;
	line-height: 80px;
}

.data_main {
	background:
		url("${ctx}/static/image/cityDataCenter/industry/industryBg.jpg")
		no-repeat;
	background-size: 100% 100%;
	height: 100%;
	width: 100%;
}

.footerBox {
	width: 100%;
	height: 120px;
	position: absolute;
	bottom: 0px;
}

.industryCon {
	width: 100%;
	height: calc(100% - 200px);
	height: -webkit-calc(100% - 200px);
	height: -moz-calc(100% - 200px);
}

.menu {
	height: 120px;
	float: left;
	text-align: center;
	color: #fff;
	font-size: 20px;
	padding: 20px 0px;
	cursor: pointer;
}

.poster-item img {
	cursor: pointer;
}

.menu:HOVER {
	background-color: #103b5a;
}

.menu1 {
	width: 16%;
	border-top: 15px solid #E64554;
	background-color: #016CBA;
}

.menu2 {
	width: 21%;
	border-top: 15px solid #0DA9A6;
	background-color: #3489C9;
}

.menu3 {
	width: 21%;
	border-top: 15px solid #25BFDC;
	background-color: #016CBA;
}

.menu4 {
	width: 21%;
	border-top: 15px solid #FAAD45;
	background-color: #3489C9;
}

.menu5 {
	width: 21%;
	border-top: 15px solid #D7CA10;
	background-color: #016CBA;
}
</style>
<script type="text/javascript" src="${ctx}/static/plugins/zturn/js/zturn.js"></script>
<title>宜春行业大数据中心</title>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden;">
	<div class="data_main">
		<div class="industryLogo"> 
			<img src="${ctx}/static/image/cityDataCenter/industry/industryLogo.png" height="56px"/>
		</div>
		<div class="industryCon">
			
			<div class="container">
				<div class="pictureSlider poster-main">
					<ul id="zturn" class="poster-list">
					    <c:choose>
								<c:when test="${type eq 1}">
									<li class="poster-item zturn-item">
										<img src="${ctx}/static/image/cityDataCenter/industry/industryZYY.jpg" width="100%">
									</li>
									<li class="poster-item  zturn-item" >
										<img src="${ctx}/static/image/cityDataCenter/industry/industryLD.jpg" width="100%">
									</li>
									<li class="poster-item zturn-item">
										<img src="${ctx}/static/image/cityDataCenter/industry/industryJZTC.jpg" width="100%">
									</li>
			
								</c:when>
								<c:otherwise>
									<li class="poster-item  zturn-item" >
										<img src="${ctx}/static/image/cityDataCenter/industry/industryLD.jpg" width="100%">
									</li>
									<li class="poster-item zturn-item">
										<img src="${ctx}/static/image/cityDataCenter/industry/industryJZTC.jpg" width="100%">
									</li>
			
									<li class="poster-item zturn-item">
										<img src="${ctx}/static/image/cityDataCenter/industry/industryZYY.jpg" width="100%">
									</li>
								</c:otherwise>
							</c:choose>

					</ul>
				</div>
			</div>
			
		</div>
		<div class="footerBox">
			<div class="menu1 menu" onclick="cut(1)">
				<img src="${ctx}/static/image/cityDataCenter/industry/icon1.png"><br />
				资讯
			</div>
			<div class="menu2 menu" onclick="cut(2)">
				<img src="${ctx}/static/image/cityDataCenter/industry/icon2.png"><br />
				价格行情
			</div>
			<div class="menu3 menu" onclick="cut(3)">
				<img src="${ctx}/static/image/cityDataCenter/industry/icon3.png"><br />
				数据中心
			</div>
			<div class="menu4 menu" onclick="cut(4)">
				<img src="${ctx}/static/image/cityDataCenter/industry/icon4.png"><br />
				研究报告
			</div>
			<div class="menu5 menu" onclick="cut(5)">
				<img src="${ctx}/static/image/cityDataCenter/industry/icon5.png"><br />
				企业分布
			</div>
			<div class="clear"></div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function() {
		console.log('${type}')
		var aa=new zturn({
			id:"zturn",
			opacity:0.9,
			width:400,
			Awidth:524,
			scale:0.9,
			auto:false
		})
	});
	function cut(index){
		if(index == 1){
			tips("建设中。。。");
		}
		if(index == 2){
			window.open("${ctx}/front/cityDataCenter/ldIndex/1");
		}
		if(index == 3){
			tips("建设中。。。");
		}
		if(index == 4){
			tips("建设中。。。");
		}
		if(index == 5){
			tips("建设中。。。");
		}
	}
	</script>
</body>