<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>消息通知</title>
<link href="${ctx}/static/weixin/css/activity/messageNotice.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<style>
body .layui-layer-tl_black .layui-layer-title { background-color:#3D3D3D; color:#fff;}
body .layui-layer-tl_black .layui-layer-btn0 { background-color:#F04444; color:#fff; width:100%; border:0; padding:5px 0; text-align:center; margin:0;}
</style>
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
 function sendNotice(){
 	layer.open({
		type: 1,
		title:'提示',
		skin: 'layui-layer-tl_black',
		shadeClose: true,
		area:['250px','170px'],
		btn: '确定',
		content: $('#sendNotice')
	});
 }
</script>
</head>

<body>
<div class="notice_main">
	<div class="fixed_top">
		<img src="${ctx}/static/weixin/css/activity/images/headPortrait.png" width="20px;" height="20px;">
		<span>消息通知</span>
	</div>
	<div class="notice_content">
		<div style="padding:5px 10px; color:#000;">给所有参与“吃喝玩乐乐惠购”活动的用户发送如下消息：</div>
		<div style="background-color:#fff; padding:0 10px;">
			<div class="titleName">
				<ul>
					<li><a href="javascript:;">活动变更</a></li>
					<li><a href="javascript:;">活动取消</a></li>
				</ul>
				<div style="clear:both;"></div>
			</div>
			<div class="titleItem">
				<div>
					<div class="noticeInput">
						<textarea rows="4" placeholder="亲，你报名参加的[活动标题]活动有变更，变更内容为XXXX"></textarea>
					</div>
				</div>
				<div style="display:none;">
					<div class="noticeInput">
						<textarea rows="4" placeholder="亲，你报名参加的[活动标题]活动已取消"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div style="padding:10px 5px;">
			<input type="button" value="返回" onClick="javascript:history.go(-1);" class="returnBtn">
			<input type="button" value="发送" onClick="sendNotice();" class="sendBtn">
		</div>
	</div>
	
	
	<div id="sendNotice" style="display:none; padding:15px 20px;">
		<div style="font-size:12px;">通知发送后，活动状态将修改为“活动已取消”，确定要发布活动取消通知吗？</div>
	</div>
	
	<div class="navigationBar">
		<ul>   
	<%-- <li><a href="${ctx}/personalCenter/weixin/main">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/personalCenter/shou.png"
						width="20px;" height="20px;" style=" margin-top: 6%"/>
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
