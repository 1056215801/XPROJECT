<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>宜春市智慧工业平台</title>
    <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/css/cityDataCenter/leaderIndex.css" rel="stylesheet">
</head>
<body class="body-bg">
<div class="homePageBar">
	  <div class="time">
			<a href="javascript:;" onclick="toLogin()" id="nologin"><img src="${ctx}/static/image/liData/peo.png"><font>登录</font></a>
			<a href="javascript:;" style="display:none;" id="login"><img src="${ctx}/static/image/liData/peo.png"><font>${accountName}</font><img width="18" src="${ctx}/static/image/liData/logout Data.png"><font onclick="logout()">退出</font></a>
			<a href="javascript:;"><img src="${ctx}/static/image/liData/time.jpg"><font id="time"></font></a>
		</div>
    <div class="homePageLogo">
        <img src="${ctx}/static/image/cityDataCenter/leaderIndex/logo.png" width="5%" id="logo">
        <img src="${ctx}/static/image/cityDataCenter/leaderIndex/title.png" width="35%">
    </div>
    <div class="homePageContent">
        <i></i>
        <div class="homePageCont">
            <i></i>
            <img src="${ctx}/static/image/cityDataCenter/leaderIndex/wingLeft.png" id="wingLeft" width="40%">
            <div class="projectLeftBar">
                <div class="leftSphere" onclick="toZHGY()">
                    <img src="${ctx}/static/image/cityDataCenter/leaderIndex/zhgyBar.png" id="zhgyBar">
                    <%-- <img src="${ctx}/static/image/cityDataCenter/leaderIndex/zhgy.png" class="projectName"> --%>
                    <img src="${ctx}/static/image/cityDataCenter/leaderIndex/gygl.png" class="projectName">
                </div>
            </div>
        </div>
        <div class="homePageCont">
            <i></i>
            <div class="projectCenterBar">
                <div class="centerSphere">
                    <img src="${ctx}/static/image/cityDataCenter/leaderIndex/gydsjBar.png" id="gydsjBar">
                    <img src="${ctx}/static/image/cityDataCenter/leaderIndex/gydsj.png" class="projectCName">
                </div>
                <div class="projectMenuBar">
                    <img src="${ctx}/static/image/cityDataCenter/leaderIndex/menuBar.png">
                    <div class="projectMenu">
                        <i></i>
                        <div class="gyProject" onclick="toGYDSJ()">
                            <img src="${ctx}/static/image/cityDataCenter/leaderIndex/gy.png" height="40">
                            <div class="projectTitle">工业大数据</div>
                        </div>
                        <div class="ldProject" onclick="toLDDSJ()">
                            <img src="${ctx}/static/image/cityDataCenter/leaderIndex/ld.png" height="40">
                            <div class="projectTitle">锂电大数据</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        <div class="homePageCont">
            <i></i>
            <div class="projectRightBar">
                <div class="rightSphere" onclick="toZHFW()">
                    <img src="${ctx}/static/image/cityDataCenter/leaderIndex/zhfwBar.png" id="zhfwBar">
                    <%-- <img src="${ctx}/static/image/cityDataCenter/leaderIndex/zhfw.png" class="projectName"> --%>
                    <img src="${ctx}/static/image/cityDataCenter/leaderIndex/qyfw.png" class="projectName">
                </div>
            </div>
            <img src="${ctx}/static/image/cityDataCenter/leaderIndex/wingRight.png" id="wingRight" width="40%">
        </div>
    </div>
    <div class="techSupport">技术支持：江西融合科技有限责任公司</div>
    <div class="guidanceCompany">指导单位：宜春市工业和信息化局</div>
    <div class="codeDownload"><font>下载 “ 宜春工业 ” APP</font><img src="${ctx}/static/image/cityDataCenter/leaderIndex/QRcode.png" width="100"></div>
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
    	$("#time").text(getNow());
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
    			redirectUrl="${ctx}/front/cityDataCenter/ycFourth/13?orgId=3609009" ;
    		} 
    	    goMain(redirectUrl);
    	    return false;
    	});	
        $("#time").text(getNow());
    })
    function toZHGY(){
        layer.load(1, { //加载层
    		  shade: [0.5,'#999']
    	 });
    	if(isLogin=='1'){ 
    		window.location.href = "${ctx}/toXOffice?type=0&path=/login/yc_new";
    	}else{ 
        	window.location.href = "${OfficeUrl}XOffice/login/yc_new"; 
    	}
    }
    function toZHFW(){
     layer.load(1, {//加载层
  		  shade: [0.5,'#999'] 
  	 });
    	window.location.href = "${OfficeUrl}XProject/homePage/yc";
    }
    function toGYDSJ(){
        window.location.href = "${OfficeUrl}XProject/front/cityDataCenter/ycFourth/13?orgId=3609009"
    }
    function toLDDSJ(){
    	var url  = "${OfficeUrl}XProject/front/cityDataCenter/ycLdIndex/1";
    		if(isLogin=='1'){ 
    			if('${cityId}'==360900){
    				if('${orgType}'==0||'${orgType}'==1 ||'${orgType}'==2 ||'${orgType}'==4){//0区域 1政府 2园区 4部门
    				/* 	if('${orgType}'==4&&'${accountName}'=='龙文平'){
    						return alert('暂无权限查看');
    					} */
    					window.location.href = url;
    				}else{
    					alert('暂无权限查看')
    				}
    			}else{
    				if('${governmentKind}'==2){
    					window.location.href = url;
    				}else{
    					alert('暂无权限查看')
    				}
    			}
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
    function getNow() {
        var date = new Date();
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        var day = date.getDay();
        var x = '';
        switch (day) {
            case 0: x="星期天";
                break;
            case 1: x="星期一";
                break;
            case 2: x="星期二";
                break;
            case 3: x="星期三";
                break;
            case 4: x="星期四";
                break;
            case 5: x="星期五";
                break;
            case 6: x="星期六";
                break;
        }
        return y+'年 '+m+'月 '+d+'日 '+x;
    }
 function toLogin(){
    	var page = '${page}';
    	var orgId = '${orgId}';
    	var spanIndex = '${spanIndex}'
    	var url = "${ctx}/front/cityDataCenter/ycFourth/11?orgId=3609009";
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