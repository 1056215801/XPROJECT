<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	  <%@ include file="../common/commonPage_front.jsp"%>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit"  /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>园区2.0后台管理系统</title>
   
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/static/css/style.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/login.min.css" rel="stylesheet">
   <style type="text/css">
	.signin {
		color:rgba(55,55,55,.95)!important ;
	}
	</style> 
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
</head>

 <body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ 园区2.0后台管理系统 ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>系统管理后台</strong></h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
                    </ul><!-- 
                    <strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong> -->
                </div>
            </div>
            <div class="col-sm-5">
                <form name="dataForm" id="dataForm" method="post" action="${ctx}/admin/main" >
                    <h4 class="no-margins">登录：</h4>
                    <input type="text" id="loginName" name="loginName" class="form-control uname" placeholder="登录名" />
                    <input type="password" id="loginPass" name="loginPass"  class="form-control pword m-b" placeholder="密码" />
                    <input type="text" id="imageCode"  name="imageCode" class="form-control m-b" placeholder="验证码" style="width: 48%;float: left;margin-top: 0;margin-right: 4%;color: #333;" />
                    <img alt="这是图片" src="../session/page/imageCaptcha"  id="imageCaptcha" style = "width: 48%;height: 34px; border:0px;cursor:pointer" title="太丑了，换一张！">
                    <div style="clear: both;"></div>
                    <a href="#">忘记密码了？</a>
                    <input type="button" onclick="checkValue()" value=" 登录 " class="btn btn-success btn-block"></input>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2016 All Rights Reserved. 
            </div>
        </div>
    </div>
</body>
<script>
$(function() {
	 document.getElementById("imageCaptcha").onclick= function(){
		var random = Math.random();
   	    $(this).attr("src","../session/page/imageCaptcha?" + random);  
    };
    var msg="${msg}" ;
    if(msg!=null && msg!='')
    	alert(msg);
    	 
});
function checkValue(){
	var n= $('#loginName').val();
	var p= $('#loginPass').val();
	var m= $('#imageCode').val();
	if(n==''){
		alertNew('登录名不可为空', function(){
			 layer.closeAll();
			 $('#loginName').focus(); 
		}) ;
		return false ;
	}
	if(p==''){
		alertNew('密码不可为空', function(){
			layer.closeAll();
			$('#loginPass').focus();
		}) ; 
		return false ;
	}
	if(m==''){
		alertNew('验证码不可为空', function(){
			layer.closeAll();
			$('#imageCode').focus();
		}) ;
		return false ;
	}
	$('#dataForm').submit();
}
</script>
</html>
