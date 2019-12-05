<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>首页</title>
<link href="${ctx}/static/weixin/css/personalCenter/homepage.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<script>
$(function() {
	getNotice();
});
function getNotice(){
	$.ajax({
		url : "${ctx}/personalCenter/json/messageNotification",
		type : "get",
		data : $('#getNoticeForm').serialize(),
		dataType : "json",
		success : function(result) {
			var list = result.value;
			var div = "";
			 if(result.code == 1||result.code == 0){
		 		for (var i = 0; i < list.length; i++) {
		 			var info = list[i];
		 			div += '<a href="javascript:;"><font style="color:#F14342;margin-left: 3px">['+info.msgSource+']</font>'+info.msgTitle+'</a>';
		 		}
		 		$("#div2").html(div);

			}else if(result.code == 2){
				//暂无数据
			}else{
				layer.msg("获取数据失败");

			}
		},
		error : function() {
			layer.msg("系统异常");
		}
	});
}

var s,s2,s3,timer;
function init(){
s=getid("div1");
s2=getid("div2");
s3=getid("div3");
s3.innerHTML=s2.innerHTML;
timer=setInterval(mar,30)
}
function mar(){
if(s2.offsetWidth<=s.scrollLeft){
s.scrollLeft-=s2.offsetWidth;
}else{s.scrollLeft++;}
}
function getid(id){
return document.getElementById(id);
}
window.onload=init;
function getToLogistics(){
	window.location.href="${ctx}/auth/page/mobile/weixin/logistics/wanji/weixin/main";

}
function getToShow(){
	window.location.href="${ctx}/auth/page/mobile/weixin/show/main";
}
function getToSupply(){
	window.location.href="${ctx}/auth/page/mobile/weixin/supply/main";
}
function getToProject(){
	window.location.href="${ctx}/auth/page/mobile/weixin/projectDeclare/weixin/main";
}
function getToActivity(){
	window.location.href="${ctx}/auth/page/mobile/weixin/projectActivity/weixin/activityMain";
}
function getToDeclare(){
	window.location.href="${ctx}/investigation/weixin/main";
}
</script>
</head>

<body>
<form id="getNoticeForm">
	<input type='hidden' name='pageNum' id='pageNum' value='1'></input>
	<input type='hidden' name='pageSize' value='2'></input>
</form>

<div class="home_main">
	<div class="home_content">
		<img src="${ctx}/static/weixin/images/personalCenter/tou.jpg"  width="100%;">
		<div class="home_position">
			<img src="${ctx}/static/weixin/images/personalCenter/map.png" width="15px" height="15px" style="vertical-align:middle;">
			<span class="home_add">南昌市</span>
		</div>
		<div class="carousel_text">
			<img src="${ctx}/static/weixin/images/personalCenter/gonggao.png" width="15px" height="15px;" style="vertical-align:middle; float: left; margin: 8px 8px;">
			<div class="carousel_bodier" id="div1" onMouseOver="clearInterval(timer)" onMouseOut="timer=setInterval(mar,30)">
				<span class="carousel_content" id="div2"> 
<!-- 					<a href="javascript:;"><font style="color:#F14342;">[车源]</font>XX公司发布寻求南昌至广州的货车</a> -->
<!-- 					<a href="javascript:;"><font style="color:#F14342;">[活动]</font>XX公司发注册有礼活动</a> -->
				</span>
				<span class="carousel_content" id="div3"></span>
			</div>
		</div>
		
		<div class="home_operBar">
			<div style="padding:8px 8px;">
				<div class="home_operTitle">服务</div>
			</div>
			<div>
				<div class="home_oper">
					<img onClick="getToLogistics();" src="${ctx}/static/weixin/images/personalCenter/wl.png" width="60px" height="60px" style="display:block;">
					<div class="home_operName" style="line-height: 2;">找车发货</div>
				</div>
				<div class="home_oper">
					<img onClick="getToShow();" src="${ctx}/static/weixin/images/personalCenter/cy.png" width="60px" height="60px" style="display:block;">
					<div class="home_operName" style="line-height: 2;">产业对接</div>
				</div>
				<div class="home_oper">
					<img onClick="getToSupply();" src="${ctx}/static/weixin/images/personalCenter/gongxu.png" width="60px" height="60px" style="display:block;">
					<div class="home_operName" style="line-height: 2;">要素共享</div>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		<div class="home_dataBar">
			<div style="padding:8px 7px;">
				<div class="home_dataTitle">活动</div>
			</div>
			<div>
			<div style=" overflow-y:auto;height:240px;">
				<div class="home_data" onClick="getToProject();">
					<img src="${ctx}/static/weixin/images/personalCenter/xiangm.png" width="40px" height="40px" style="float:left; margin-right:10px;">
					<div style="float:left;">
						<div class="home_dataName">项目申报</div>
						<div class="home_dataDescribe">发布的项目申报</div>
					</div>
					<div class="home_dataVal" style="float:right;">
						<font style="color:#F14342; font-size:20px;">${projectDeclareCount}</font>个
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="home_data" onClick="getToActivity();">
					<img src="${ctx}/static/weixin/images/personalCenter/huod.png" width="40px" height="40px" style="float:left; margin-right:10px;">
					<div style="float:left;">
						<div class="home_dataName">活动报名</div>
						<div class="home_dataDescribe">发布的活动报名</div>
					</div>
					<div class="home_dataVal" style="float:right;">
						<font style="color:#F14342; font-size:20px;">${activityCount}</font>个
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="home_data" onClick="getToDeclare();">
					<img src="${ctx}/static/weixin/images/personalCenter/diaoc.png" width="40px" height="40px" style="float:left; margin-right:10px;">
					<div style="float:left;">
						<div class="home_dataName">在线调查</div>
						<div class="home_dataDescribe">发布的在线调查</div>
					</div>
					<div class="home_dataVal" style="float:right;">
						<font style="color:#F14342; font-size:20px;">${investigationCount}</font>个
					</div>
					<div style="clear:both;"></div>
				</div>
			 </div>
			</div>
		</div>
		
	</div>
	
	<div class="navigationBar">
		<ul>   
			<li style="width:50%;">
				<a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage"><img src="${ctx}/static/weixin/images/personalCenter/shou1.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">首页</div>
				</a>
			</li>
			<li style="width:50%;">

				<a href="${ctx}/auth/page/mobile/weixin/personalInfoBingding">
					<div class="navImage"><img src="${ctx}/static/weixin/images/personalCenter/geren.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">我的</div>
				</a>
			</li>
		</ul>
	</div>
</div>
</body>
</html>
