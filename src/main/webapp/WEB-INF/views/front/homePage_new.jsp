<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link href="${ctx}/static/css/homePage/homePage.css" rel="stylesheet"/>
<link href="${ctx}/static/css/homePage/projectFooter.css" rel="stylesheet"/>
</head>
<body>
<div class="homePage_main">
	<div class="homePage_content">
		<img src="${ctx}/static/image/homePage/beijing.jpg" width="100%">
		<div class="homePage_cont">
		<!-- 	<div class="loop-nav">
				<div class="loop-items">
					<div class="loop-item">
					</div>
					<div class="loop-item">
					</div>
					<div class="loop-item">
					</div>
				</div>
			</div> -->
			<div class="homePage_contTop clearfix">
				<div class="homePage_logo">
					<img src="${ctx}/static/image/homePage/logoNew.png">
				</div>
				<div class="homePage_user">
					<img src="${ctx}/static/image/homePage/headPortrait.png" width="50" height="50" class="homePage_uesrHead">
					<span style="display:none">
						<a href="${ctx}/session/page/login/index">登录</a>
						<a href="${ctx}/session/page/register/index">注册</a>
					</span>
				</div>
			</div>
			
			<div class="homePage_contBtm clearfix">
				<div class="homePage_contBtm_left">
					<div class="transparentBar clearfix">
						<div class="affairsLabel">
							<img src="${ctx}/static/image/homePage/affairs.png">
						</div>
						<div class="blueBtn"  onclick="javascript:window.open('${ctx}/expShare/main');">
							<img src="${ctx}/static/image/homePage/experience.png" width="48">
							<div>园区动态</div>
						</div>
						<div class="blueBtn" onclick="javascript:window.open('${ctx}/projectDeclare/main');">
							<img src="${ctx}/static/image/homePage/project.png" width="48">
							<div>项目申报</div>
						</div>
						<%-- <div class="blueBtn" onclick="javascript:;">
							<img src="${ctx}/static/image/homePage/voice.png" width="48">
							<div>企声通道</div>
						</div> --%>
						<div class="blueBtn" onclick="javascript:window.open('http://www.jxciit.gov.cn/Category_1275/Index.aspx', '_blank')">
							<img src="${ctx}/static/image/homePage/voice.png" width="48">
							<div>企声通道</div>
						</div>
						<div class="blueBtn" onclick="javascript:window.open('${ctx}/projectActivity/main');">
							<img src="${ctx}/static/image/homePage/activity.png" width="48">
							<div>活动报名</div>
						</div>
					</div>
				</div>
				
				<div class="homePage_contBtm_right">
					<div class="transparentBar clearfix">
						<div class="matingLabel">
							<img src="${ctx}/static/image/homePage/mating.png">
						</div>
						<div class="redBtn" onclick="javascript:window.open('${ctx}/front/logistics/main');">
							<img src="${ctx}/static/image/homePage/logistics.png" width="40">
							<span>物流服务</span>
						</div>
						<div class="redBtn" onclick="javascript:window.open('${ctx}/front/showProduct/main');">
							<img src="${ctx}/static/image/homePage/product.png" width="40">
							<span>产业对接</span>
						</div>
						<div class="redBtn" onclick="javascript:window.open('${ctx}/showSupply/main');">
							<img src="${ctx}/static/image/homePage/supply.png" width="40">
							<span>供需对接</span>
						</div> 
						<div class="redBtn" onclick="javascript:window.open('https://www.bjdp2p.com/');">
							<img src="${ctx}/static/image/homePage/finance.png" width="40">
							<span>金融服务</span>
						</div>
						<%-- <div class="redBtn" onclick="javascript:window.open('${ctx}/front/recruitment/hcdy/main');">
							<img src="${ctx}/static/image/homePage/recruit.png" width="40">
							<span>人才招聘</span>
						</div> --%>
						<div class="orangeBtn" onclick="javascript:window.open('${ctx}/projectSuggest/main');">
							<img src="${ctx}/static/image/homePage/feedback.png" width="40">
							<span>意见反馈</span>
						</div>
						<div class="lightBlueBtn" onclick="toSWY()">
							<img src="${ctx}/static/image/homePage/intelligence.png" width="40">
							<span>智能制造</span>
						</div>
					</div>
					<div class="clearfix" style="margin-top:7px;">
						<img src="${ctx}/static/image/dataCenterNew.png" width="692.3" style="float:left; margin-right:7px; cursor: pointer;" onclick="javascript:window.open('http://www.jx968969.com/XProject/front/dataCenter/organizationCount?orgId=360000', '_blank')">
						<img src="${ctx}/static/image/homePage/QRcodeImg.jpg" width="100.7" style="float:left;">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="project_footer">
		<div class="copyright">
			<div class="copyrightLeft">
				<div>
					<span>关于我们</span>&nbsp;&nbsp;&nbsp;<span>联系我们</span>&nbsp;&nbsp;&nbsp;<span>法律条款</span>
				</div>
				<div class="font12" style="margin-top:30px;">
					<div>Copyright @ 2016 - 2020 CloudCommunity Inc.All Rights Reserved.Powered by 融合科技</div>
					<div>江西省工业和信息化厅（园区办） 赣ICP备16003961号-1 </div>
				</div>
			</div>
			<div class="copyrightRight">
				<div style="float:left;">
					<div class="font12">
						<div class="alignRight">扫描二维码加入</div>
						<div class="alignRight">微信公众号：江西工业园区微讯</div>
					</div>
					<div class="copyrightTel">
						<img alt="" src="${ctx}/static/image/homePage/hotline.jpg">
					</div>
				</div>
				<img src="${ctx}/static/image/homePage/QRcodeImg.jpg" width="100px" height="100px;" class="QRcodeImg">
				<div style="clear:both;"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<!-- <div class="float-box">
		温馨提示：请江西省内的企业、农民专业合作社、个体工商户于6月30日前报送年报，网址（http://jx.gsxt.gov.cn）。逾期将被列入经营异常名录或标注经营异常状态，直至列入严重违法失信企业名单。
		<a href="javascript:;">关闭</a>
	</div> -->
</div>
<script>
 $(function(){
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(0).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
	$(".header_WeChat").click(function(){		
    	var div = $(".WeChatQRcode"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
	
	/* var sw = $(window).width();
	var sh = $(window).height();
	var w = 250;
	var h = 200;
	var $x = 0,$y = 0;
	if(Math.round(Math.random()*10)>5){
		var x = Math.ceil(Math.random()*3);
	}
	else {
		var x = -Math.ceil(Math.random()*3);
	}
	if(Math.round(Math.random()*10)>5){
		var y = Math.ceil(Math.random()*3);
	}
	else {
		var y = -Math.ceil(Math.random()*3);
	}
	var loop2 = setInterval(loopAct,120);
	$(".float-box").on("mouseover",function(){ clearInterval(loop2);})
	$(".float-box").on("mouseleave",function(){ loop2 = setInterval(loopAct,120);})
	$(".float-box a").on("click",function(){ 
		$(".float-box").hide();
		setTimeout(function(){clearInterval(loop2)},500)
	})
	
	function loopAct(){
		var l = $(".float-box").position().left;
		var t = $(".float-box").position().top;
		if(l + w > sw || l < 0){
			x = -x;
		}
		if(t + h > sh || t < 0){
			y = -y;
		}
		$x += x;
		$y += y;
		$(".float-box").css("left",$x);
		$(".float-box").css("top",$y);
	} */
	var $l = $(".loop-items").position().left;
	var $w = $(".loop-item").width();
	var loop = setInterval(function(){
		$l+=5;
		if($l > $w + 25){
			$(".loop-items").animate({left:'0px'},1,'linear');
			$l = 0;
		}
		else {
			$(".loop-items").animate({left:-$l+'px'},100,'linear');
		}
	},100)
 })
 function toSWY(){
	/* window.open("http://xietong.zhaozhizao.com/", "_blank");
	return; */
	$.ajax({
		url : "${ctx}/session/getSWYUrl",
		type : "post",
		data : {},
		dataType : "json",
		success : function(result) {
			if(result.success){
				window.open(result.SSOUrl, "_blank");
			}else{
				layer.alert(result.errorMsg);
			}
		},
		error : function() {
			layer.alert("系统异常");
		}
	});
 }
</script>
</body>
</html>