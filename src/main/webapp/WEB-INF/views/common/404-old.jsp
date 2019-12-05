<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${ctx}/static/css/404/main.css" type="text/css" media="screen, projection" /> <!-- main stylesheet -->
<link rel="stylesheet" href="${ctx}/static/css/404/tipsy.css" type="text/css" media="all" /> <!-- Tipsy implementation -->

<script type="text/javascript" src="${ctx}/static/js/404/custom-scripts.js"></script>
<script type="text/javascript" src="${ctx}/static/js/404/jquery.tipsy.js"></script> <!-- Tipsy -->
<script type="text/javascript">

$(document).ready(function(){
			
	universalPreloader();
						   
});

$(window).load(function(){

	//remove Universal Preloader
	universalPreloaderRemove();
	
	rotate();
    dogRun();
	dogTalk();
	
	//Tipsy implementation
	$('.with-tooltip').tipsy({gravity: $.fn.tipsy.autoNS});
						   
});

</script>


<title>404 - Found a story</title>
 </head>

<body>

<!-- Universal preloader -->
<div id="universal-preloader">
    <div class="preloader">
        <img src="${ctx}/static/image/404/universal-preloader.gif" alt="universal-preloader" class="universal-preloader-preloader" />
    </div>
</div>
<!-- Universal preloader -->

<div id="wrapper">
<!-- 404 graphic -->
	<div class="graphic"></div>
<!-- 404 graphic -->
<!-- Not found text -->
	<div class="not-found-text">
    	<h1 class="not-found-text">页面躲猫猫，找不到了!</h1>
    </div>
<!-- Not found text -->

<!-- search form -->
 
<!-- search form -->

<!-- top menu -->
<div class="top-menu">
	<a href="${ctx}/" class="with-tooltip" title="返回首页">返回首页</a>  
</div>
<!-- top menu -->

<div class="dog-wrapper">
<!-- dog running -->
	<div class="dog"></div>
<!-- dog running -->
	
<!-- dog bubble talking -->
	<div class="dog-bubble">
    	
    </div>
    
    <!-- The dog bubble rotates these -->
    <div class="bubble-options">
    	<p class="dog-bubble">
        	是不是迷路了, 大兄弟? <br> 别担心, 我可是个导航犬!
        </p>
    	<p class="dog-bubble">
        	Go! Go! Go!<br> 我保证不打死管理员。
        </p>
        <p class="dog-bubble">
        	<br />
        	莫着急! 我正在路上!
        </p>
        <p class="dog-bubble">
        	想不想来点饼干？<br /><img style="margin-top:8px" src="${ctx}/static/image/404/cookie.png" alt="cookie" />
        </p>
        <p class="dog-bubble">
        	<br />
        	Delicious ! 好美味!
        </p>
        <p class="dog-bubble">
        	<br />
        	怎么还没到?
        </p>
        <p class="dog-bubble">
        	<br />我是不是在跑圈圈...
        </p>
        <p class="dog-bubble">
        	<br />
            好吧，我也迷路了...
        </p>
        <p class="dog-bubble">
        	管理员你给我出来 <br /><img style="margin-top:8px" src="${ctx}/static/image/404/cat.png" alt="cat" />
        </p>
        <p class="dog-bubble">
        	<br />我找啊找啊找啊找...
        </p>
    </div>
    <!-- The dog bubble rotates these -->
<!-- dog bubble talking -->
</div>

<!-- planet at the bottom -->
	<div class="planet"></div>
<!-- planet at the bottom -->
</div>
 
</body>
</html>
