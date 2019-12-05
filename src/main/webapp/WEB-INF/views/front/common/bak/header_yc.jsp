<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<style>
.clearfix:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}
.clearfix{zoom:1} 
img { max-width: 100%;}
img,span {vertical-align:middle;}
.fl {
    float: left;
}
.fr {
    float: right;
}

.homePage_head {
	position: relative;
	width: 100%;
	background: url(${ctx}/static/image/homePage_yc/bj1.png) no-repeat center center / cover;
	font-size: 0;
}
.head-content {
    padding: 10px;
}
.head-user>input {
    padding: 0 5px;
    height: 34px;
    border: 1px solid #ccc;
    width: 250px;
}
.head-user span {
    padding: 0 15px;
    height: 34px;
    line-height: 34px;
    background: #0069D6;
	cursor: pointer;
	-webkit-transition: all .5s 0s;
	transition: all .5s 0s;
}
.head-user span:hover {
    background: rgba(0,105,214,.5);
}
.head-user>.user-opt {
	position: relative;
	margin-left: 50px;
	cursor: pointer;
}
.head-user>.user-opt>img {
    width: 64px;
    height: 64px;
    border-radius: 50%;
}
.head-user>.user-opt::after {
	content: '';
    margin-left: 10px;
    display: inline-block;
    vertical-align: middle;
    color: rgba(0,105,214,.5);
    border-bottom: 4px solid;
    border-left: 4px solid;
    border-right: 4px solid transparent;
    border-top: 4px solid transparent;
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg);
}
.homePage_nav {
    background: #0069D6;
}
.nav-content {
    padding: 0 10px;
    line-height: 50px;
    height: 50px;
}
.nav-content>a {
    position: relative;
    padding: 0 30px;
    font-size: 18px;
    display: inline-block;
    vertical-align: middle;
    color: #fff !important;
	-webkit-transition: all .5s 0s;
	transition: all .5s 0s;
}
.nav-content>a:hover { 
	color: #fff;
    background: #D42700 ;
}
.nav-content>a.on {
    background: #D42700;
	color: #fff;
}
.nav-content>a.act {
    background: #D42700;
	color: #fff;
	opcity: .8;
}
.nav-content>a::before {
	content: "";
    position: absolute;
    top: 15%;
    right: 0px;
    display: block;
    width: 2px;
    background: #3E64A3;
    height: 70%;
    border-right: 1px solid #B3C4E2;
    /* background: url(${ctx}/static/image/homePage_yc/line1.png) no-repeat center center / cover; */
    -webkit-transform: scaleX(.5);
    transform: scaleX(.5);
}
.nav-content>a.industry::after {
	content: "";
    margin-left: 10px;
    display: inline-block;
    width: 8px;
    height: 8px;
    border-left: 2px solid;
    border-bottom: 2px solid;
    opacity: 0.9;
    -webkit-transform: rotate(-45deg) translateY(-3px);
    transform: rotate(-45deg) translateY(-3px);
}
.nav-content>a.on::before {
	display: none;
}
.nav-content span {
    color: #fff;
    cursor: pointer;
	-webkit-transition: all .5s 0s;
	transition: all .5s 0s;
}
.nav-content span:hover { 
	color: #0af;
}
.nav-content font {
    margin: 0 10px;
}
#loginDiv a {
    margin-left: 15px;
    font-size: 16px;
    display: inline-block;
    vertical-align: middle;
    color: #fff;
}
#loginDiv a+a::before {
	content: "/";
    margin-right: 15px;
}
.second-menu {
    position: absolute;
    width: 100%;
    display: none;
    -webkit-transition: none;
    transition: none;
    z-index: 9;
}
.second-menu .menu { padding: 0;}
.second-menu ul {
    padding: 10px;
    width: 60%;
    background: #fff;
    font-size: 0;
}
.second-menu li {
    padding: 10px 0;
    margin-bottom: 20px;
    display: inline-block;
    vertical-align: top;
    width: 50%;
    font-size: 14px;
}
.second-menu .menu div {
    padding-left: 10px;
    margin-bottom: 10px;
    color: #000;
    font-size: 18px;
    border-left: 5px solid;
    line-height: 1;
}
.second-menu a {
    margin-left: 15px;
    margin-top: 10px;
    padding-right: 15px;
    border-right: 1px solid #333;
    display: inline-block;
    -webkit-transition: all .5s 0s;
    transition: all .5s 0s;
}
.second-menu a:hover { color: #f00;}
.second-menu li .on { 
	font-weight: bold;
	color: #f00;
}
.second-menu a:last-child {
    border: none;
}
.dropdown {
	position:absolute;
	top:60px;
}
</style>
<div class="homePage_head">
		<div class="container head-content">
		    <a href="${ctx}/homePage/yc?entranceId=${entranceId}">
			<img class="logo fl" src="${ctx}/static/image/homePage_yc/logo.png" title="宜春公共服务平台"></a>
			<div class="head-user fr">
				<%-- <input class="dib" type="text" placeholder="请输入关键字搜索" id="searchKey">
				<span class="dib"><img src="${ctx}/static/image/homePage_yc/search.png"></span> --%>
				<div id="headimg" class="user-opt dib"  >
					<img id="head_img" src="${ctx}/static/image/homePage_yc/touxiang.png">
					<div id="dropdown" class="dropdown" style="display:none;">
						<ul>
							<li><a href="${ctx}/personalCenter/personalInfoEdit">
								<img src="${ctx }/static/image/personalCenter.png" width="20" height="20" style="vertical-align:middle; margin-right: 5px;">
							个人信息</a></li>
						</ul>  
						<div style="padding:5px 7px;" id="" >
							<input type="button" onclick="logout()" value="退出登录" class="dropdownBtn">
							<input type="hidden" id="entranceId" value="${entranceId}"  >
							<input type="hidden" id="urlPath" value="${urlPath}"  >
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="homePage_nav">
		<div class="container nav-content fz0">
			<a href="${ctx}/homePage/yc">首页</a>
			<a href="javascript:;" class="industry">产业对接</a>
			<a href="${ctx}/experience/list?entranceId=${entranceId}&type=2&city=宜春">工业动态</a>
			<a href="${ctx}/declare/list?entranceId=${entranceId}">项目申报</a>
			<a href="${ctx}/activity/list?entranceId=${entranceId}">活动报名</a>
			<span id="myWork" class="fr" style="display:none" > 
				<img  class="dib" src="${ctx}/static/image/homePage_yc/table.png">
				<font class="dib fz14">我的工作台</font>
			</span>
			<div id="loginDiv" class="fr">
				  <a href="javascript:;" onclick="login()">登录</a>
				  <a href="javascript:;" onclick="register()">注册</a>
			</div>
		</div>
		<div class="second-menu">
			<div class="container menu">
				<ul>
					<li>
						<div class="menu-title">产品市场对接</div>
						<a href="${ctx}/product/list?entranceId=${entranceId}">产品展示</a>
						<a href="${ctx}/industry/list?entranceId=${entranceId}">产业动态</a>
					</li>
					<li>
						<div class="menu-title">产品链对接</div>
						<a href="${urlPath}XWeixin/static/pcHtml/industryMap/parkDistribution.html?areaId=360900&areaName=宜春市&entranceId=3609009" target="_blank" >产业地图</a>
						<a href="${ctx}/helpAsk/allList?entranceId=${entranceId}">帮您问问</a>
						<a href="${ctx}/yc/list?type=1&entranceId=${entranceId}">产业对接月报</a>
					</li>
					<li>
						<div class="menu-title">要素对接</div>
						<a href="${ctx}/supply/list?entranceId=${entranceId}">企业供求</a>
						<a href="${ctx}/logistics/list?entranceId=${entranceId}">物流服务</a>
						<a onclick="getUrl()" href="javascript:;">园区招聘</a>
						<a href="https://www.bjdp2p.com/" target="_blank">金融服务</a>
					</li>
					<li>
						<div class="menu-title">其他对接</div>
						<a href="${ctx}/expert/list?entranceId=${entranceId}">专家服务</a>
						<a href="${ctx}/yc/list?type=5&entranceId=${entranceId}">科研机构</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
<script>
$(function(){
	var isLogin = '${isLogin}'  ;
	if(isLogin=='true'){ //隐藏登陆,显示头像
		showAccount();
	}else{ //显示登录
		$("#loginDiv").show();
		$("#myWork").hide();
		checkLogin();
	}
});
function getUrl(){
	var type = "${entranceId eq '3609009'?'3':'4'}";
	window.location.href= '${ctx}/yc/list?type='+type+'&entranceId=${entranceId}';
}
function showAccount(){
	$("#loginDiv").hide();
	showHead();
	$("#myWork").show();
	//单点到政务
	$("#myWork").click(function(){
		  window.open("${ctx}/toXOffice");
	}); 
	doBind();
}
function checkLogin(){
	$.ajax({
		url : "${ctx}/session/account/isLogin",
		type : "get",
		async: false, 
		dataType : "json",
		success : function(result) {
			if(result.success){
				showAccount();
			}
		},
		error : function() {
			tips("请求超时，请稍后重试");
		}
	});
}
function showHead(){
	$.post("${ctx}/account/headImage", {'ajax': 1}, function (data) {
	             $('#head_img').attr("src",data.headImage);
	             $('#userName').html(data.accountName);
	    });
} 
function logout(){
	 $.post("${ctx}/session/logout", {'ajax': 1}, function (data) {
	        	 $('#loginDiv').show();
	             $('#myWork').hide();
	             $('#dropdown').hide();
	             $('#head_img').attr("src","${ctx}/static/image/homePage_yc/touxiang.png");
	             $('#userName').html('');
	             unBind();
	             restoreSession();
	             var url = window.location.href;
	             if(url.indexOf("isComplete")!=-1){
	            	 if(url.indexOf("product")!=-1){
	            		 window.location.href='${ctx}/product/list?entranceId=${entranceId}'
	            	 }else{
	            		 window.location.href='${ctx}/supply/list?entranceId=${entranceId}'
	            	 }
	             }else if(url.indexOf("personalCenter")!=-1){
	            	 window.location.href='${ctx}/homePage/yc'
	             }else{	            	 
		             window.location.reload();
	             }
	     }); 
}
function doBind(){
	$("#head_img").mouseover(function(){		
   		$("#dropdown").slideDown("fast");
    });
    $("#head_img").mouseout(function(){
   		$("#dropdown").hide();
    });
    $("#dropdown").mouseover(function(){
   		$("#dropdown").show();
    });
    $("#dropdown").mouseout(function(){
   		$("#dropdown").hide();
    });
}
function unBind(){
	 $("#head_img").unbind();
}
function restoreSession(){
	var urlPath=$("#urlPath").val();
	var entranceId=$("#entranceId").val();
	$.post("${ctx}/restoreSession", {'urlPath': urlPath,'entranceId':entranceId}, function (data) {
 }); 
}
String.prototype.replaceAll=function(f,e){//全部替换
    var reg=new RegExp(f,"g"); //创建正则RegExp对象   
    return this.replace(reg,e); 
}
function register(){
	var eId= $('#entranceId').val();
	var r=encodeURI(window.location.href); //  %26代替&，   %3F代替?  replaceAll("&","%26")  
	var url=r.replaceAll("&","%26").replace("?","%3F");
	window.location.href ="${ctx}/session/page/login/register/index?entranceId="+eId+"&redirectUrl="+url ;
}
function login(){
	var eId= $('#entranceId').val();
	var r=encodeURI(window.location.href); //  %26代替&，   %3F代替?  replaceAll("&","%26")  
	var url=r.replaceAll("&","%26").replace("?","%3F");
	window.location.href ="${ctx}/session/page/login/index?entranceId="+eId+"&redirectUrl="+url ;
}
function goOffice(type){
	$.ajax({
		url : "${ctx}/session/account/isLogin",
		type : "get",
		async: false,
		dataType : "json",
		success : function(result) {
			if(result.success){
				window.open("${ctx}/toXOffice?type="+type);
			}else{
				tips('亲，您还没有登录');
			}
		},
		error : function() {
			tips("请求超时，请稍后重试");
		}
	});
}
</script>