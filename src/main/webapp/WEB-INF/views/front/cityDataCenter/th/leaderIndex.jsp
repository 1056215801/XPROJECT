<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>泰和工业园智慧园区平台</title>
    <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/css/cityDataCenter/leaderIndex.css" rel="stylesheet">
<style>
    .body-bg{
        background-image: url("${ctx}/static/image/cityDataCenter/leaderIndex/th/bg-th.png") !important;
    }
    .homePageBar {
    	min-height: 800px;
   		text-align: center;
    }
    .cf-logo {
   		position: relative;
    	margin-top: 70px;
    }
    .content1{
	  	position: absolute;
	    right: 50%;
	    top: 65%;
	    cursor: pointer;
	    -webkit-transform: translate(-280px,-50%);
	    transform: translate(-280px,-50%);
    }
    .content2{
	  	position: absolute;
	    left: 50%;
	    top: 65%;
	    cursor: pointer;
	    -webkit-transform: translate(270px,-50%);
	    transform: translate(270px,-50%);
    }
    .content3{
	  	position: absolute;
	    left: 50%;
	    top: 55%;
	    cursor: pointer;
	    -webkit-transform: translate(-260px,-50%);
	    transform: translate(-260px,-50%);
   }
    .cfbg {
	   	position: absolute;
	   	top: 0;
	   	bottom: 0;
	   	left: 0;
	   	right: 0;
    }
    .light {
	    position: absolute;
	    top: -35px;
	    left: 25px;
	    -webkit-transform: scale(1.4);
	    transform: scale(1.4);
		-webkit-animation: shine 4s 0s infinite linear;
		animation: shine 4s 0s infinite linear;
    }
    .circle-l {
	    position: absolute;
	    bottom: 35px;
	    left: -35px;
    }
    .circle-r {
	    position: absolute;
	    bottom: 40px;
    	right: -145px;
    }
    .cl {
	    position: absolute;
    	bottom: 4px;
	    left: 35px;
   		-webkit-transform: translate(-100%,25%);
   		transform: translate(-100%,25%);
		-webkit-animation: ltr 3s 0s infinite;
		animation: ltr 3s 0s infinite;
    }
    .cl2 {
	    bottom: -5px;
		-webkit-animation: ltr 3s 0s infinite;
		animation: ltr 3s 0s infinite;
    }
    .cr {
	    position: absolute;
    	bottom: 4px;
	    right: 35px;
   		-webkit-transform: translate(100%,25%);
   		transform: translate(100%,25%);
		-webkit-animation: rtl 3s 0s infinite;
		animation: rtl 3s 0s infinite;
    }
    .cr2 {
	    bottom: -5px;
		-webkit-animation: rtl 3s 0s infinite;
		animation: rtl 3s 0s infinite;
    }
    .cl-box {
	    position: absolute;
	    top: 5px;
	    left: 0;
	    width: -webkit-calc(100% - 26px);
	    width: calc(100% - 26px);
	    height: 100%;
	    overflow: hidden;
    }
    .cl-box2 {
	    top: 20px;
	    width: -webkit-calc(100% - 5px);
	    width: calc(100% - 5px);
    }
    .cr-box {
	    position: absolute;
	    top: 5px;
	    right: 0;
	    width: -webkit-calc(100% - 26px);
	    width: calc(100% - 26px);
	    height: 100%;
	    overflow: hidden;
    }
    .cr-box2 {
	    top: 20px;
	    width: -webkit-calc(100% - 5px);
	    width: calc(100% - 5px);
    }
    .datas {
    	position: absolute;
	    top: 30%;
	    left: 50%;
	    -webkit-transform: scale(1.4);
	    transform: scale(1.4);
    	white-space: nowrap;
    }
    .first1 {
    	position: absolute;
	    left: 5px;
	    top: 25px;
    }
    .first2 {
    	position: absolute;
	    top: 5px;
	    right: 25px;
    }
    .second1,
    .second2 {
    	position: relative;
    	display: inline-block;
    	-webkit-transition: none;
    	transition: none;
    }
    .second1 {
	    margin-left: -65px;
	    margin-right: 50px;
    }
    .s2 {
    	position: absolute;
	    bottom: 25px;
	    right: 10px;
    }
    .s2 img { 
    	margin-bottom: -5px;
    	display: block;
    }
    .s2 img+img { margin-bottom: -12px;}
    .third1 {
    	position: absolute;
	    left: -20px;
	    bottom: 5px;
    }
    .s3 {
	    position: absolute;
	    top: 75px;
	    left: 10px;
    }
    .s3 img { 
	    margin-right: 3px;
	    -webkit-transform-origin: bottom;
	    transform-origin: bottom;
		-webkit-animation: height 1.5s 0s infinite;
		animation: height 1.5s 0s infinite;
    }
    .s3 img:nth-child(2) {
		-webkit-animation: height 2s 0s infinite;
		animation: height 2s 0s infinite;
    }
    .s3 img:nth-child(3) {
    	margin-top: -20px;
		-webkit-animation: height 2.5s 0s infinite;
		animation: height 2.5s 0s infinite;
    }
    .s3 img:nth-child(4) {
    	margin-top: -10px;
		-webkit-animation: height 1s 0s infinite;
		animation: height 1s 0s infinite;
    }
    .s4 {
	    position: absolute;
	    top: 0;
	    left: 0;
    }
    .s5 {
	    position: absolute;
	    bottom: 5px;
	    left: 0;
    }
    .line {
	    position: absolute;
	    bottom: -60px;
	    left: 45%;
		-webkit-animation: shine 4s 0s infinite linear;
		animation: shine 4s 0s infinite linear;
    }
	@keyframes shine {
		0% {
	   		opacity: 1;
		}
		25% {
	   		opacity: .1;
		}
		50% {
	   		opacity: .8;
		}
		75% {
	   		opacity: .1;
		}
		100% {
	   		opacity: 1;
		}
	}
	@keyframes ltr {
		0% {
    		-webkit-transform: translate(-100%,25%);
    		transform: translate(-100%,25%);
		}
		100% {
    		-webkit-transform: translate(100%,-30%);
    		transform: translate(100%,-30%);
		}
	}
	@keyframes rtl {
		0% {
    		-webkit-transform: translate(100%,25%);
    		transform: translate(100%,25%);
		}
		100% {
    		-webkit-transform: translate(-100%,-30%);
    		transform: translate(-100%,-30%);
		}
	}
	@keyframes height {
		0% {
    		-webkit-transform: scaleY(1);
    		transform: scaleY(1);
		}
		50% {
    		-webkit-transform: scaleY(.2);
    		transform: scaleY(.2);
		}
		100% {
    		-webkit-transform: scaleY(1);
    		transform: scaleY(1);
		}
	}
  </style> 
    
</head>
<body class="body-bg">
<div class="homePageBar">
	<!-- <div class="cfbg" id="cfbg"></div> -->
	<img class="cf-logo" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/logo-th.png">
    <div class="content1" onclick="toZHGY()"><!-- 政务服务 -->
		<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/zwpt.png">
		<img class="light" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/light.png">
    </div>
    <div class="content2" onclick="toZHFW()"><!-- 企业服务 -->
		<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/fwpt.png">
		<img class="light" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/light.png">
    </div>
    <div class="content3" onclick="toGYDSJ()"><!-- 大数据 -->
		<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/dsj.png">
		<div class="circle-l">
			<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/l1.png">
			<div class="cl-box">
				<img class="cl" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/c1.png">
			</div>
			<div class="cl-box cl-box2">
				<img class="cl cl2" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/c1.png">
			</div>
		</div>
		<div class="circle-r">
			<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/l2.png">
			<div class="cr-box">
				<img class="cr" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/c2.png">
			</div>
			<div class="cr-box cr-box2">
				<img class="cr cr2" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/c2.png">
			</div>
		</div>
		<div class="datas">
			<img class="first1" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/first1.png">
			<img class="first2" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/first2.png">
			<img class="line" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/line.png">
			<div class="second1">
				<img class="s1" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/second1.png">
				<div class="s2">
					<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/h4.png">
					<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/h1.png">
					<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/h2.png">
					<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/h3.png">
				</div>
				<img class="third1" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/third1.png">
			</div>
			<div class="second2">
				<img class="s1" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/second2.png">
				<img class="s4" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/second3.png">
				<div class="s3">
					<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/s1.png">
					<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/s2.png">
					<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/s3.png">
					<img src="${ctx}/static/image/cityDataCenter/leaderIndex/th/s4.png">
				</div>
				<img class="s5" src="${ctx}/static/image/cityDataCenter/leaderIndex/th/s5.png">
			</div>
		</div>
    </div>
</div>
<script src="${ctx}/static/js/dataCenter/th.js" type="text/javascript"></script>	
<script>
    $(function () {
    	/* particlesJS('cfbg', {
    	  particles: {
    	    color: '#fff',
    	    shape: 'circle', // "circle", "edge" or "triangle"
    	    opacity: .5,
    	    size: 4,
    	    size_random: true,
    	    nb: 50,
    	    line_linked: { //线条
    	      enable_auto: true,
    	      distance: 400,
    	      color: '#00c7e9',
    	      opacity: 1,
    	      width: 1,
    	      condensed_mode: {
    	        enable: false,
    	        rotateX: 600,
    	        rotateY: 600
    	      }
    	    },
    	    anim: {
    	      enable: true,
    	      speed: 1
    	    }
    	  },
    	  interactivity: {
    	    enable: true,
    	    mouse: {
    	      distance: 600
    	    },
    	    detect_on: 'canvas', // "canvas" or "window"
    	    mode: 'grab',
    	    line_linked: {
    	      opacity: .5
    	    },
    	    events: {
    	      onclick: {
    	        enable: true,
    	        mode: 'push', // "push" or "remove"
    	        nb: 4
    	      }
    	    }
    	  },
    	  // Retina Display Support
    	  retina_detect: true
    	}); */
    	$('body').mousemove(function(e) {
            var e = e || window.event;
            var w = $(document).width()/2;
            var h = $(document).height()/2;
            var xx = (e.pageX || e.clientX) - w;
            var yy = (e.pageY || e.clientY) - h;
            var x,y
            x = Math.atan(xx/1000);
            y = Math.atan(yy/1000);

            $(".first1").css({
            	"transform": "translate("+(-x*5)+"px,"+(-y*5)+"px)"
            })
            $(".first2").css({
            	"transform": "translate("+(-x*4)+"px,"+(-y*4)+"px)"
            })
            $(".second1").css({
            	"transform": "translate("+x*6+"px,"+y*6+"px)"
            })
            $(".second2").css({
            	"transform": "translate("+x*3+"px,"+y*3+"px)"
            })
            $(".third1").css({
            	"transform": "translate("+x*8+"px,"+y*8+"px)"
            })
            $(".s5").css({
            	"transform": "translate("+(-x*6)+"px,"+(-y*6)+"px)"
            })
        });
    })
    function toZHGY(){
       	window.location.href = "${OfficeUrl}XOffice/login/th"; 
    }
    function toZHFW(){
 		window.location.href = "${OfficeUrl}springBoot/site/1251";
    }
    function toGYDSJ(){
    	window.open("${OfficeUrl}XProject/front/cityDataCenter/thIndex/1","_blank");
    }
</script>
</body>
</html>