<!-- 发改委 -->
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../common/commonPage_front.jsp"%>
<link href="${ctx}/static/css/login/header-fgw.css" rel="stylesheet"/>
	<div class="homePage_head">
		<div class="container head-content">
		    <a href="${urlPath}XOffice/login/fgw">
			<img class="logo" src="${ctx}/static/image/homePage_yc/logo_fgw.png" title="江西省智慧工业云平台"></a>
			 <ul class="fr">
				<li><a target="_blank" href="${urlPath}XOffice/login/fgw"><h3>首页</h3><p>HOME PAGE</p></a></li>
				<li><a href="${ctx}/industry/list?entranceId=${entranceId}"><h3>资讯</h3><p>INFORMATION</p></a></li>
				<li><a href="javascript:;" onclick="goOffice('3')"><h3>应用</h3><p>APPLICATION</p></a></li>
				<li><a target="_blank" href="${ctx}/front/dataCenter/organizationCount?orgId=${entranceId}" target="_blank"><h3>大数据</h3><p>BIG DATA</p></a></li>
				<li><a target="_blank" href="${ctx}/"><h3>云市场</h3><p>CLOUD MALL</p></a></li>
				<li><a  href="${ctx}/helpAsk/allList?entranceId=${entranceId}"><h3>问问</h3><p>ASK</p></a></li>
			</ul>
		</div>
	</div>
	<div class="homePage_nav">
		<div class="container nav-content fz0">
			<div class="row">
				<div class="col-md-4">
					<div class="source-room" href="javascript:;">
						<img src="${ctx}/static/image/homePage_yc/menu-source.png"><font>服务资源库</font>
						<div class="second-menu">
							<ul>
								<li>
									<div class="menu-title"><img src="${ctx}/static/image/homePage_yc/menu-source.png"><font>政务服务</font></div>
									<a target="_blank" href="http://www.jxzwfww.gov.cn/jxzw/grbs/getGrbsIndex.do?webId=1">个人办事</a>
									<a target="_blank" href="http://www.jxzwfww.gov.cn/jxzw/frbs/getFrbsIndex.do?webId=1">法人办事</a>
									<a target="_blank" href="http://www.jxzwfww.gov.cn/jxzw/xzsp/gotoIndex.do?webId=1">行政审批</a>
									<a target="_blank" href="http://www.jxzwfww.gov.cn/jxzw/ggfw/getGgfwIndex.do?webId=1">公共服务</a>
									<a target="_blank" href="http://www.jxzwfww.gov.cn/jxzw/xzql/gotoxzqlIndex.do?webId=1">阳光政务</a>
								</li>
								<li>
									<div class="menu-title"><img src="${ctx}/static/image/homePage_yc/menu-source.png"><font>开发区服务</font></div>
									<a  href="${ctx}/experience/list?entranceId=${entranceId}">开发区动态</a>
<!-- 									<a onclick="layer.msg('建设中！')" href="javascript:void(0)">公文办理</a>
 -->									<a  href="${ctx}/yc/list?type=1&entranceId=${entranceId}">产业对接月报</a>
									<a target="_blank" href="${urlPath}XWeixin/static/pcHtml/industryMap/parkDistribution.html">产业地图</a>
									<a href="${ctx}/yc/list?type=2&entranceId=${entranceId}">产业招聘月报</a>
								</li>
								<li>
									<div class="menu-title"><img src="${ctx}/static/image/homePage_yc/menu-source.png"><font>企业服务</font></div>
									<a  href="${ctx}/product/list?entranceId=${entranceId}">产品展示</a>
									<a  href="${ctx}/supply/list?entranceId=${entranceId}" >企业供需</a>
									<a  href="${ctx}/yc/list?type=4&entranceId=${entranceId}">用工服务</a>
									<a  href="${ctx}/logistics/list?entranceId=${entranceId}">物流服务</a>
									<a  href="${ctx}/organ/list?entranceId=${entranceId}">服务机构</a>
						            <a  href="${ctx}/jrService/list?entranceId=${entranceId}">金融服务</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="head-input">
						<input type="text" placeholder="请输入关键字">
						<span onclick="layer.msg('建设中！')">搜索</span>
					</div>
				</div>
				<div class="col-md-4">
					<div class="head-workspace"> 
						<div id="loginDiv" class="dib"> 
 							 <!--  <a href="javascript:;" onclick="login()">登录</a>
 							  <a href="javascript:;" onclick="register()">注册</a> -->
 							   <a href="javascript:;" onclick="toJxzw('')">登录</a>
							   <a href="javascript:;" onclick="toJxzw('')">注册</a>
  						</div>
						<div class="head-user dib">
							<div id="headimg" class="user-opt dib"  >
								<img id="head_img" src="${ctx}/static/image/homePage_yc/touxiang.png">
								<div id="dropdown" class="dropdown" style="display:none;">
								  <ul>
										<li><a id="userName" href="javascript:;"> ${accountName}</a></li>
									</ul>  
									<div style="padding:5px 7px;" id="" >
										<input type="button" onclick="logout()" value="退出登录" class="dropdownBtn">
										<input type="hidden" id="entranceId" value="${entranceId}"  >
										<input type="hidden" id="urlPath" value="${urlPath}"  >
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--  <div class="homePage_nav" style="text-align: center;">
	      <img src="${ctx}/static/image/homePage_yc/daohang.jpg">
	</div> 
	<div class="toLogin" style="display: none; padding:20px;">
		<div style="font-size: 20px; color: #000; font-weight: bold; text-align: center;">登录系统</div>
		<div class="inputContentBar">  
		<form name="loginForm" id="loginForm" method="post" action="/session/login" >
			 <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
			 <input type="hidden"  id="redirectUrl" value="" />
			<div class="form-group" style="position:relative;">
				<input type="text"  id="username" name="username"   placeholder="请输入账号" class="form-control">
				<img src="${ctx}/static/image/login/keyboard.png" class="keyboard">
			</div>
			<div class="form-group" style="position:relative;">
				<input type="password"  id="password" name="password" placeholder="请输入密码" class="form-control">
				<img src="${ctx}/static/image/login/keyboard.png" class="keyboard">
			</div>
			<div class="form-group" style="position:relative;">
				<input type="text" id="captchaValue" onkeydown="KeyDown(event)" name="captchaValue" placeholder="请输入验证码" class="form-control">
				<div class="verificationCode">
					<c:url value="/session/page/imageCaptcha" var="imageCaptchaUrl"/>
                	<img alt="验证码" src="${imageCaptchaUrl}"  id="imageCaptcha" class="imageCaptcha" title="太丑了，换一张！">
				</div>
			</div>
			<div class="form-group clearfix" style="display:block">
				<div class="operLeft">
					<input type="checkbox" name="remember-me" checked="checked" value="on">
					<span class="operContral">自动登录</span>
				</div>
				<div class="operRight"> <a href="${ctx}/retrievePassword" href="javascript:;">忘记密码</a></div>
			</div>
			<button type="button" id="loginBt"  class="btn btn-block btn-success">登&nbsp;&nbsp;录</button>
		</form>
		</div>
	</div> --%>
<script src="${ctx}/static/script/pt.js" type="text/javascript"></script>	
<script>
var clientId='${clientId}'  ;
$(function(){
	var isLogin = '${isLogin}'  ;
	if(isLogin=='true'){ //隐藏登陆,显示头像
		showAccount();
	}else{ //显示登录
		
		$("#loginDiv").show();
		checkLogin();
	}
	$("#imageCaptcha").click(function(){
		var random = Math.random();
   	    $(this).attr("src","${imageCaptchaUrl}?" + random);  
	}); 
	
	$("#loginBt").click(function(){
	    var username = $('#username').val();
	    //mobilePt 见 pt.js
	    if (!userCodePt.test(username)) {
	    	layer.msg('账号格式不正确！');
	    	return false;
	    }
	    var password =  $('#password').val();
	    //passwdPt 见 pt.js
	    if (!passwdPt.test(password)) {
	    	layer.msg('密码格式不正确，密码至少6位字符！');
	    	return false;
	    }
	    var captchaValue = $('#captchaValue').val();
	    if (!captchaPt.test(captchaValue)) {
			layer.msg('验证码错误！');
			return false ;  
		}        
	 //   $("form").submit();
	    var redirectUrl=$('#redirectUrl').val(); 
	    if(redirectUrl==null || redirectUrl=='' ){
			redirectUrl="${ctx}/?isyc=1" ;
		} 
	    goMain(redirectUrl);
	    return false;
	});	
});
function getHeaderImg(redirectUrl){
	$.ajax({  
		type: "post",
		url: "${ctx}/account/loginSuccess", 
		dataType: "json", 
		async: false,
		success: function(data){
			   if(data.success){
				   if(redirectUrl=='${ctx}/login/fgw'){ 
					   window.location.href= redirectUrl;//  刷新首页
			       }else{
			    	   if(redirectUrl.indexOf('/admin')>0){
			    		  window.location.href= redirectUrl;//刷新本页
			    	   }else{
			    		   location.reload(); 
			    		   window.open(redirectUrl); //打开新页
			    	   }
			       }
				       
			   }else{
				   layer.msg(data.errorMsg);
			   }
		    },  
			error: function(a,b,c){ 
				layer.msg(a);
			} 
	 });
}
function goMain(redirectUrl){
	var param={"entranceKind":0,
			  "authKind":0,
			  "captchaKind":1,
			  "loginType":"",
			  "entranceValue":0 
		      } ;
	param["username"]= $('#username').val(); 
	param["password"]= $('#password').val(); 
	param["captchaValue"]=$('#captchaValue').val(); 
	var t = new Date().getTime();
	var index= layer.load(0, {shade: false});
	$.ajax({  
		type: "post",
		url: "${ctx}/session/login",
		dataType: "json", 
		data:param,
		success: function(data){
			   if(data.success){
                   getHeaderImg(redirectUrl);				    
			   }else{
				   layer.close(index);
				   layer.msg(data.errorMsg);
			   }
		    },  
			error: function(a,b,c){ 
				layer.close(index);
				layer.msg(a);
			} 
	 });
}
function KeyDown(event){
	event = event || window.event;
	var keyCode = event.keyCode;
    if (keyCode == 13)
    {
        event.returnValue=false;
        event.cancel = true;
        $("#loginBt").click();
    }
}  

function showAccount(){
	$("#loginDiv").hide();
	showHead();
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
	             $('#dropdown').hide();
	             $('#head_img').attr("src","${ctx}/static/image/homePage_yc/touxiang.png");
	             $('#userName').html('');
	             unBind();
	             restoreSession();
	             logoutJxzw();
	             logoutOffice();
	             var url = window.location.href;
	             if(url.indexOf("admin/application")!=-1){
	            	 if(url.indexOf("product")!=-1){
	            		 window.location.href='${ctx}/product/list?entranceId=${entranceId}';
	            	 }else if(url.indexOf("supply")!=-1){
	            		 window.location.href='${ctx}/supply/list?entranceId=${entranceId}';
	            	 }else{
	            		 window.location.href='${ctx}/login/fgw'	 ;           		 
	            	 }
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
function toLogin(url){
	$("#redirectUrl").val(url);
	var isLogin = '${isLogin}'  ;
	if(isLogin=='true'){
		getHeaderImg(url);		
	}else{
		layer.open({
	        type: 1,
	        title: false,
	        closeBtn: 1,
	        shade: [0.3],
	        shadeClose: false,
	        area: ['290px', '330px'],
	        content: $(".toLogin")
	    });
	}
}
function toJxzw(){
	//https://login.jxzwfww.gov.cn/auth2/authorize.do?client_id=<client_id>&redirect_uri=<redirect_uri>
	var url = window.location.href;
	var path= url.substring(url.indexOf("XProject/")+8);
	var redirect_uri= '${urlPath}'+'XOffice/session/toProject?path='+path; 
	window.location.href= 'https://login.jxzwfww.gov.cn/auth2/authorize.do?client_id='+clientId+'&redirect_uri='+redirect_uri;
}
function logoutJxzw(){
	   $.ajax({  
		    type:'get',
			url: "https://login.jxzwfww.gov.cn/auth2/informLogOut.do?client_id="+clientId, 
			dataType:'jsonp',
			processData: false, 
			success: function(data){}
	   });
}
function logoutOffice(){
	var urlPath=$("#urlPath").val();
	var entranceId=$("#entranceId").val();
	$.post(urlPath+"XOffice/session/logout",
			function(data){
 	}); 
}
</script>