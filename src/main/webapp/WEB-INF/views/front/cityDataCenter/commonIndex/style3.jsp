<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>${empty WEBSITE_ParkIndexName?'工业园智慧园区平台':WEBSITE_ParkIndexName}</title>
    <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/cityDataCenter/leaderIndex.css" rel="stylesheet">
<style>
   	.body-bg{
       	background-image: url("${ctx}/static/image/cityDataCenter/leaderIndex/jxBackGround.jpg") !important;
   	}
   	.homePageBar { text-align: center;}
   	.homePageBar canvas {
   		position: absolute;
   		top:0;
   		left:0;
    	opacity: .5;
   	}
   	.homePageBar .logo-box {
   		margin: 60px 0;
   		position: relative;
   		display: inline-block;
       	overflow:hidden;
       	z-index: 9;
   	}
   	.logo-box::before {
   		content: "";
	    position: absolute;
	    left: -100%;
	    top: 0;
	    width: 10%;
	    height: 100%;
	    background: linear-gradient(to right,rgba(255,255,255,0) 0,rgba(255,255,255,.1) 50%,rgba(255,255,255,0) 100%);
	    -webkit-transform: skewX(-45deg);
	    transform: skewX(-45deg);
		-webkit-animation: shine 6s 0s infinite;
		animation: shine 6s 0s infinite;
   	}
   	.guang {
   		position: relative;
   		display: inline-block;
       	overflow:hidden;
   	}
   	.homePageContent {
   		top: 10%;
   		height: auto;
   	}
   	.swiper-container { overflow: visible;}
   	.swiper-slide { width: 33.33%;}
   	.swiper-slide img{
   		cursor: pointer;
   	}
   	.swiper-slide .guang {
   		-webkit-transition: .5s;
   		transition: .5s;
   	}
   	.swiper-slide .guang:hover {
   		-webkit-transform: translate(0,-20px) scale(1.1);
	    transform: translate(0,-20px) scale(1.1);
   	}
   	.swiper-container-3d .swiper-slide-shadow-left,
   	.swiper-container-3d .swiper-slide-shadow-right { background-image: none;}
   	
	@-webkit-keyframes shine {
		0% {
		    left: -100%;
		}
		100% {
		    left: 300%;  
		}
	}
	@keyframes shine {
		0% {
		    left: -100%;
		}
		100% {
		    left: 300%;  
		}
	}
</style> 
    
</head>
<body class="body-bg">
<div class="homePageBar" id="holder">
	<div class="logo-box">
		<img src="${WEBSITE_ParkIndexLogo}" alt="logo">
	</div>
    <div class="homePageContent">
         <div class="swiper-container" id="gallery">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="guang">
						<c:if test="${empty WEBSITE_IndexOfficeImage}">
							<img onclick="toZHGY()" src="${ctx}/static/image/cityDataCenter/leaderIndex/gygl_cf.png" alt="轮播图">
						</c:if>
						<c:if test="${!empty WEBSITE_IndexOfficeImage}">
							<img onclick="toZHGY()" src="${WEBSITE_IndexOfficeImage}" alt="轮播图">
						</c:if>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="guang">
						<c:if test="${empty WEBSITE_IndexDataImage}">
							<img onclick="toGYDSJ()" src="${ctx}/static/image/cityDataCenter/leaderIndex/gygl_cf.png" alt="轮播图">
						</c:if>
						<c:if test="${!empty WEBSITE_IndexDataImage}">
							<img onclick="toGYDSJ()" src="${WEBSITE_IndexDataImage}" alt="轮播图">
						</c:if>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="guang">
						<c:if test="${empty WEBSITE_IndexProjectImage}">
							<img onclick="toZHFW()" src="${ctx}/static/image/cityDataCenter/leaderIndex/gygl_cf.png" alt="轮播图">
						</c:if>
						<c:if test="${!empty WEBSITE_IndexProjectImage}">
							<img onclick="toZHFW()" src="${WEBSITE_IndexProjectImage}" alt="轮播图">
						</c:if>
					</div>
				</div>
			</div>
		</div>
    </div>
</div>
<%-- <script src="${ctx}/static/js/dataCenter/polygonizr.min.js" type="text/javascript"></script>	 --%>
<script>
    $(function () {
    })
    //政务
    function toZHGY(){
    	if ("${empty WEBSITE_IndexOfficeUrl}" == "true") {
			window.location.href = "${OfficeUrl}XOffice/login/new/${entranceId}";
		} else {
			window.location.href = "${OfficeUrl}XOffice${WEBSITE_IndexOfficeUrl}";
		}
    }
    //企业服务平台
    function toZHFW(){
    	if ("${empty WEBSITE_IndexProjectUrl}" == "true") {
			window.location.href = "${OfficeUrl}springBoot/site/${entranceId}";
		} else {
			window.location.href = "${OfficeUrl}springBoot${WEBSITE_IndexProjectUrl}";
		}
    }
    //大数据中心
    function toGYDSJ(){
    	if ("${empty WEBSITE_IndexDataUrl}" == "true") {
    		window.open("${OfficeUrl}XProject/front/commonDataCenter/index/${entranceId}", "_blank");
		} else {
			window.open("${OfficeUrl}XProject${WEBSITE_IndexDataUrl}", "_blank");
		}
    }
</script>
</body>
</html>