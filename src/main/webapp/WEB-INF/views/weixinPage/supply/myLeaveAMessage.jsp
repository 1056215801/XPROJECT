<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的留言</title>
<link href="${ctx}/static/weixin/css/supply/myLeaveAMessage.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<script>
 $(function(){
 	$(".viewMore").click(function(){ 
		var ul = $("#viewMore ul"); 
		if(ul.css("display")=="none"){ 
			ul.slideDown("fast"); 
		}else{ 
			ul.slideUp("fast"); 
		} 
	}); 
	$("#viewMore ul li a").click(function(){
		$("#viewMore ul").hide(); 
	});
	$(".titleName ul li").each(function(){
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
 })
</script>
</head>

<body>
<div class="message_main">
	<div class="message_content">
		<div class="titleSwitch">
			<div class="titleName">
				<ul>
					<li style="border-radius:15px 0 0 15px;"><a href="javascript:;">我的留言</a></li>
					<li style="border-radius:0 15px 15px 0;"><a href="javascript:;">留言给我</a></li>
				</ul>
				<div style="clear:both;"></div>
			</div>
		</div>
		<div class="titleItem">
			<div>
				<div class="message_operBar">
					<div style="width:20%;" class="message_oper borRight">全部</div>
					<div style="width:20%;" class="message_oper borRight">产品</div>
					<div style="width:20%;" class="message_oper borRight">企业</div>
					<div style="width:39%;" class="message_oper"></div>
					<div style="clear:both;"></div>
				</div>
				<div class="message_cont">
					<div class="message_noticeBar">
						<div class="message_delBar">
							<div class="message_entName">江西江中制药(集团)股份有限责任公司</div>
							<div style="float:right;">X</div>
							<div style="clear:both;"></div>
						</div>
						<div class="message_notice">
							<div class="message_noticeUp">
								<div class="message_time">2016-9-8 18:24:32</div>
								<div style="clear:both;"></div>
								<div class="message_noticeCont">我想与贵公司合作生产食品类产品</div>
							</div>
							<div class="noReply">对方暂未回复</div>
						</div>
					</div>
					<div class="message_noticeBar">
						<div class="message_delBar">
							<div class="message_entName">江西江中制药(集团)股份有限责任公司</div>
							<div style=" float:right;">X</div>
							<div style="clear:both;"></div>
						</div>
						<div class="message_notice">
							<div class="message_noticeUp">
								<div class="message_time">2016-9-8 18:24:32</div>
								<div style="clear:both;"></div>
								<div class="message_noticeCont">我想与贵公司合作生产食品类产品</div>
							</div>
							<div class="message_noticeDown">
								<img src="images/headPortrait.png" width="20px;" height="20px;" class="message_personImg">
								<div class="message_personName">黎明</div>
								<div class="message_time">2016-9-8 18:24:32</div>
								<div style="clear:both;"></div>
								<div class="message_noticeCont">
									<div class="message_reply">回复:</div>
									<div class="message_replyCont">你好！可通过我们公司直接进行采购，客服人员将在24小时内与你联系！</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			<div style="display:none;">
				<div class="message_operBar">
					<div style="width:20%;" class="message_oper borRight">全部</div>
					<div style="width:20%;" class="message_oper borRight">产品</div>
					<div style="width:20%;" class="message_oper borRight">企业</div>
					<div style="width:39%;" class="message_oper"></div>
					<div style="clear:both;"></div>
				</div>
				<div class="message_cont">
					<div class="message_noticeBar">
						<div class="message_delBar">
							<div class="message_entName">江西江中制药(集团)股份有限责任公司</div>
							<div style="float:right;">X</div>
							<div style="clear:both;"></div>
						</div>
						<div class="message_notice">
							<div class="message_noticeUp">
								<img src="images/headPortrait.png" width="20px;" height="20px;" class="message_personImg">
								<div class="message_personName">黎明</div>
								<div class="message_time">2016-9-8 18:24:32</div>
								<div style="clear:both;"></div>
								<div class="message_noticeCont">我想与贵公司合作生产食品类产品</div>
							</div>
							<div class="message_noticeDown">
								<div class="needReply">我来回复</div>
								<img src="images/headPortrait.png" width="20px;" height="20px;" style="float:right;">
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<div class="message_noticeBar">
						<div class="message_delBar">
							<div class="message_entName">江西江中制药(集团)股份有限责任公司</div>
							<div style=" float:right;">X</div>
							<div style="clear:both;"></div>
						</div>
						<div class="message_notice">
							<div class="message_noticeUp">
								<img src="images/headPortrait.png" width="20px;" height="20px;" class="message_personImg">
								<div class="message_personName">阿萨德</div>
								<div class="message_time">2016-9-8 18:24:32</div>
								<div style="clear:both;"></div>
								<div class="message_noticeCont">我想与贵公司合作生产食品类产品</div>
							</div>
							<div class="message_noticeDown">
								<div class="message_noticeCont">
									<div class="message_reply">我的回复:</div>
									<div class="message_replyCont">你好！可通过我们公司直接进行采购，客服人员将在24小时内与你联系！</div>
								</div>
								<div class="message_time">2016-9-8 18:24:32</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
			
	</div>
	
	
	<div class="navigationBar">
		<ul>   
			<li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage"><img src="images/carSource.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">首页</div>
				</a></li>
			<li><a href="supplyDemandDocking.html">
					<div class="navImage"><img src="images/incrementServices.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">供应需求</div>
				</a></li>
			<li><a href="findEnterprise.html">
					<div class="navImage"><img src="images/releaseSupply.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">企业</div>
				</a></li>
			<li><a href="javascript:;" class="viewMore">
					<div class="navImage"><img src="images/more.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">更多服务</div>
				</a></li>
		</ul>
		<div id="viewMore">
			<ul style="margin-top:-90px;"> 
				<!-- <li style="border-bottom:1px solid #E6E6E6;"><a href="myLeaveAMessage.html">我的留言</a></li> -->
				<li style="border-bottom:1px solid #E6E6E6;"><a href="../supply/myCollection">我的收藏</a></li> 
				<li style="border-bottom:1px solid #E6E6E6;"><a href="mySupplyDemand">我的供需</a></li> 
			</ul>
		</div>
	</div>
</div>
</body>
</html>
