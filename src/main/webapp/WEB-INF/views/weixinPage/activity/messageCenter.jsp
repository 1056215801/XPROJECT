<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>消息中心</title>
<link href="${ctx}/static/weixin/css/activity/css/messageCenter.css" rel="stylesheet"/>
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
 })
 function viewDetails(){
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0],
		area:['100%','100%'],
		shift:2,
		closeBtn:0,
		content: $('#messageDetails')
	});
 };
</script>
</head>

<body>
<div class="message_main">
	<div class="fixed_top">
		<img src="images/headPortrait.png" width="20px;" height="20px;">
		<span>消息中心</span>
	</div>
	<div class="message_content">
		<div class="message_data">
			<div class="message_cont">
				<img src="images/new2.jpg" width="20px;" height="10px;">
				恭喜你成功注册“江西工业园区微讯”网站，你可以领取新人礼包
			</div>
			<div class="message_time">2016-09-10</div>
		</div>
		<div class="message_data">
			<a href="javascript:;" onClick="viewDetails();" style="text-decoration:none;">
			<div class="message_cont">
				你参与的《CC+差旅出行上线了！9月8号放大招！》已结束，请查看结果
			</div>
			<div class="message_time">2016-09-21</div>
			</a>
		</div>
	</div>
	
	<div id="messageDetails" style="display:none;">
		<div class="fixed_top">
			<img src="images/headPortrait.png" width="20px;" height="20px;">
			<span>消息中心</span>
		</div>
		
		<div class="details_content">
			<div class="details_data">
				<a href="javascript:;" onClick="viewDetails();" style="text-decoration:none;">
				<div class="details_cont">
					你参与的《CC+差旅出行上线了！9月8号放大招！》已结束，请查看结果
				</div>
				<div class="details_time">2016-09-21</div>
				</a>
			</div>
			<div style="padding:15px 20px; font-size:12px;">
				<p>1、活动内容</p>
				<p>（1）快乐游戏，参与有奖：月饼DIY、猜灯谜、投壶游戏等活动与游戏设置，欢乐迎中秋，让你嗨个够，现场还有嫦娥妹妹派送礼品哦！</p>
				<p>（2）天安云谷园区商家产品展示与分享，优惠不断，惊喜多多，期待你的参与！</p>
				<p>（3）CC+话题分享：将活动中任何一个环节以图文的形式分享至CC+活动参与页面，截止9月20日12:00获赞最多的前十名可获得分享人气大奖！</p>
				<br>
				<p>2、奖品详情</p>
				<p>（1）游戏奖品：精美礼品300份，现场领取。</p>
				<p>（2）CC+分享人气奖（上门派送）</p>
				<p>&nbsp;&nbsp;一等奖1名：云谷乐居一房一厅3个月免租使用权；</p>
				<p>&nbsp;&nbsp;二等奖3名：云谷四季椰子鸡音乐餐厅298元情侣套餐券1张；</p>
				<p>&nbsp;&nbsp;三等奖6名：纵横影院电影券2张/星巴克咖啡券2张。</p>
			</div>
		</div>
		
		<div class="fixed_bottom">
			<a href="messageCenter.html">
			<img src="images/return.png" width="20px;" height="20px;" class="returnBtn"/>
			</a>
			<!--<div class="bottom_operation">
				<img src="images/phone.png" width="20px;" height="20px;"/>
				<span class="spanContral_1" style="color:#F14241;">我要报名</span>
			</div>
			<div class="bottom_operation" style="display:none;">
				<span class="spanContral_1 spanContral_2" style="color:#ABABAB;">活动已取消</span>
			</div>
			<div class="bottom_operation">
				<img src="images/alreadyCollect.png" width="20px;" height="20px;"/>
				<span class="spanContral_1" style="color:#636363;">评论留言</span>
			</div>-->
			<div style="clear:both;"></div>
		</div>
	</div>
	
	<div class="navigationBar">
		<ul>   
		<%-- <li><a href="${ctx}/personalCenter/weixin/main">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/personalCenter/shou.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
				</div>
				<div class="navTitle" style="margin-top: 8%;font-size: 12px">首页</div>
			</a></li> --%>
			<li><a href="${ctx}/auth/page/mobile/weixin/projectActivity/weixin/activityMain">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/activity/findactivityed.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
				</div>
				<div class="navTitle">找活动</div>
			</a></li>
			<li><a href="${ctx}/projectActivity/weixin/activityCreate">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/activity/publicactivity.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
				</div>
				<div class="navTitle">发布活动</div>
			</a></li>
			<li><a href="javascript:;" class="viewMore">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/logistics/more.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
				</div>
				<div class="navTitle">更多服务</div>
			</a></li>
		</ul>
		<div id="viewMore">
			<ul style="margin-top:-90px;">
				<li><a href="messageCenter.html">消息中心</a></li> 
			</ul>
		</div>
	</div>
</div>
</body>
</html>
