<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>昌丰融合工业园智慧园区平台</title>
    <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/css/cityDataCenter/leaderIndex.css" rel="stylesheet">
  <style>
   .body-bg{
       background-image: url("${ctx}/static/image/cityDataCenter/leaderIndex/cfBackGround.png") !important;
   }
   .content2{
	  	position: absolute;
	    width: 15%;
	    height: 22%;
	    left: 11%;
	    top: 49%;
	    cursor: pointer;
	    -webkit-transform: translate(0,-50%);
	    transform: translate(0,-50%);
   }
   .content1{
	  	position: absolute;
	    width: 15%;
	    height: 22%;
	    right: 8%;
	    top: 49%;
	    cursor: pointer;
	    -webkit-transform: translate(0,-50%);
	    transform: translate(0,-50%);
   }
    .content3{
	  	position: absolute;
	    width: 25%;
	    height: 30%;
	    left: 50%;
	    top: 45%;
	    cursor: pointer;
	    -webkit-transform: translate(-50%,-50%);
	    transform: translate(-50%,-50%);
   }
   
  </style> 
    
</head>
<body class="body-bg">
<div class="homePageBar">
    <div class="homePageContent">
         <div class="content1" onclick="toZHFW()"></div>
         <div class="content2" onclick="toZHGY()"></div>
         <div class="content3" onclick="toGYDSJ()"></div>
        <input type="hidden" id="urlPath" value="${OfficeUrl}"  >
        <div class="toLogin" style="display: none; padding:20px;">
			<div style="font-size: 20px; color: #000; font-weight: bold; text-align: center;">登录系统</div>
			<div class="inputContentBar">  
			<form name="loginForm" id="loginForm" method="post" action="/session/login" >
				 <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
				 <input type="hidden"  id="redirectUrl" value="" />
				<div class="form-group" style="position:relative;">
					<input type="text"  id="username" name="username"  maxlength="20" placeholder="请输入账号" class="form-control">
					<img src="${ctx}/static/image/login/keyboard.png"  class="keyboard">
				</div>
				<div class="form-group" style="position:relative;">
					<input type="password"  id="password" name="password" maxlength="20" placeholder="请输入密码" class="form-control">
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
						<input type="hidden" id="status" value="off">
					    <input type="checkbox" name="remember-me"  id="remember-me" onclick="checkboxOnclick(this)">
						<span class="operContral">自动登录</span>
					</div>
					<%--<div class="operRight"><a href="${ctx}/session/toJxzw" target="_blank" href="javascript:;">从江西政务网登陆</a> 
					 <a href="${ctx}/retrievePassword" href="javascript:;">忘记密码</a>--%>
					</div> 
				</div>
				<button type="button" id="loginBt"  class="btn btn-block btn-success">登&nbsp;&nbsp;录</button>
			</form>
		</div>
    </div>
</div>
<script src="${ctx}/static/script/pt.js" type="text/javascript"></script>	
<script>
var isLogin = '${isLogin}';
    $(function () {
    	if(isLogin=='1'){ 
    		$('#login').show();
    		$('#nologin').hide();
    	}else{ 
    		$('#login').hide();
    		$('#nologin').show();  
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
    			redirectUrl="${ctx}/front/cityDataCenter/cfIndex/8" ;
    		} 
    	    goMain(redirectUrl);
    	    return false;
    	});	
    })
    function toZHGY(){
        layer.load(1, { //加载层
    		  shade: [0.5,'#999']
    	 });
    	if(isLogin=='1'){ 
    		window.location.href = "${ctx}/toXOffice?type=0&path=/login/cfrh";
    	}else{ 
        	window.location.href = "${OfficeUrl}XOffice/login/cfrh"; 
    	}
    }
    function toZHFW(){
	  if(isLogin=='1'){ 
		 window.open("${OfficeUrl}springBoot/site/page/validateUnifiedSSOLogin?userCode="+'${userCode}'+'&url=/site/5700',"_blank");
	  }else{ 
	 	 window.location.href = "${OfficeUrl}springBoot/site/5700";
	  }
    }
    function toGYDSJ(){
    	window.open("${OfficeUrl}XProject/front/cityDataCenter/cfIndex/1","_blank");
    }
 	function toLogin(){
    	var page = '${page}';
    	var orgId = '${orgId}';
    	var spanIndex = '${spanIndex}'
    	var url = "${ctx}/front/cityDataCenter/cfIndex/8";
    	$("#redirectUrl").val(url);
    	if(isLogin=='1'){
    	 /* 	$('#login').hide();
    		$('#nologin').show();  */
    	}else{
    		$('#imageCaptcha').click(); 
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
 String.prototype.replaceAll=function(f,e){//全部替换
	    var reg=new RegExp(f,"g"); //创建正则RegExp对象   
	    return this.replace(reg,e); 
	}
	function logout(){
		 $.post("${ctx}/session/logout", {'ajax': 1}, function (data) {
		        	 $('#nologin').show();
		             $('#login').hide();
		             $('#userName').html('');
		             restoreSession();
			         window.location.reload();
			         logoutOffice();
		     }); 
	}
	function restoreSession(){
		var urlPath=$("#urlPath").val();
		var entranceId=$("#entranceId").val();
		$.post("${ctx}/restoreSession", {'urlPath': urlPath,'entranceId':entranceId}, function (data) {
	 }); 
	}
	function toOffice(path,url){
		$.ajax({
			url : "${ctx}/session/account/isLogin",
			type : "get", 
			async: false,
			dataType : "json",
			success : function(result) {
				if(result.success){
					var url=path.replaceAll("&","%26").replace("?","%3F");
					window.open("${ctx}/toXOffice?type=0&path="+url);
				}else{
					tips('亲，您还没有登录');
				}
			},
			error : function() {
				tips("请求超时，请稍后重试");
			}
		});
	}
	
	function logoutOffice(){
		var urlPath=$("#urlPath").val();
		$.post(urlPath+"XOffice/session/logout",
				function(data){
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
	function checkboxOnclick(checkbox){
		if(checkbox.checked == true){
			$('#status').val("on");
		}else{
			$('#status').val("off");
		}
	}
	function goMain(redirectUrl){
		var param={"entranceKind":0,
				  "authKind":0,
				  "captchaKind":1,
				  "loginType":"",
				  "entranceValue":0,
				  "remember-me":$('#status').val()
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
					   $('#login').show();
					   $('#nologin').hide();
					   window.location.href= redirectUrl;//  刷新首页
				   }else{
					   layer.close(index);
					   $('#imageCaptcha').click(); 
					   layer.msg(data.errorMsg);
				   }
			    },  
				error: function(a,b,c){ 
					layer.close(index);
					 $('#imageCaptcha').click(); 
					layer.msg(a);
				} 
		 });
		
	}  
</script>
</body>
</html>