<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>大数据中心</title>
<link href="${ctx}/static/css/dataCenter/dataCenter.css" rel="stylesheet"/>

</head>

<body>
<div class="data_main">
	<div class="data_header">
		<img src="${ctx}/static/image/dataCenter/head2.png" width="100%">
		<img src="${ctx}/static/image/dataCenter/LOGO2.png" width="35%" class="dataLogo">
		<div class="data_weather">
			<div class="weather"> 
		        <iframe src="http://m.weather.com.cn/m/pn3/weather.htm?id=101240101T " width="190" height="20" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no"></iframe>
		    </div>
		</div>
	</div>
	<div class="data_content">
		<div class="dropdownBar">
			<button id="btnYear" class="dropdownButton" type="button">2016年 <span class="caret"></span></button>
			<ul id="yearMenu" class="dropdownMenu">
				<li><a href="javascript:;">选项1</a></li>
				<li><a href="javascript:;">选项2</a></li>
				<li><a href="javascript:;">选项3</a></li>
				<li><a href="javascript:;">选项4</a></li>
			</ul>
			<button id="btnQuarter" class="dropdownButton" type="button">第三季度 <span class="caret"></span></button>
			<ul id="quarterMenu" class="dropdownMenu" style="right:12px;">
				<li><a href="javascript:;">选项1</a></li>
				<li><a href="javascript:;">选项2</a></li>
				<li><a href="javascript:;">选项3</a></li>
				<li><a href="javascript:;">选项4</a></li>
			</ul>
		</div>
		
		<div class="data_contentLeft" style="width:40%;">这里是地图！</div>
		
		<div class="data_contentRight" style="width:60%;">
			<div class="dataBarTop clearfix" style="height:16%;">
				<!--<div class="dataBarGreen" style="width:24.5%;">
					<div class="dataBarTitle">落户企业</div>
					<div class="dataBarNum"><font class="yellowFont24">104</font></div>
				</div>
				<div class="dataBarMagenta" style="width:24.5%;">
					<div class="dataBarTitle">工业增加值</div>
					<div class="dataBarNum"><font class="yellowFont24">4253.46</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont">9.4%</font></div>
				</div>
				<div class="dataBarNavy" style="width:24.5%;">
					<div class="dataBarTitle">主营业务收入</div>
					<div class="dataBarNum"><font class="yellowFont24">18330.76</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont">8.3%</font></div>
				</div>
				<div class="dataBarNavy" style="width:24.5%;">
					<div class="dataBarTitle">利税总额</div>
					<div class="dataBarNum"><font class="yellowFont24">1956.72</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont">10.5%</font></div>
				</div>-->
				<div class="dataBarBotton" style="width:24.55%;">
					<div class="dataBarName">工业增加值</div>
				</div>
				<div class="dataBarBotton" style="width:24.55%;">
					<div class="dataBarName">主营业务收入</div>
				</div>
				<div class="dataBarBotton" style="width:24.55%;">
					<div class="dataBarName">利税总额</div>
				</div>
				<div class="dataBarBotton" style="width:24.55%; margin-right:0;">
					<div class="dataBarName">工业用电</div>
				</div>
			</div>
			<div class="dataBarBottom" style="height:82%;">
				<div class="dataBar_2">这是第一个框</div>
				<div class="dataBar_2">这是第二个框</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>	
<script src="js/jquery.js"></script>
<script>
 $(function(){
	$("#btnYear").click(function(){		
    	var div = $("#yearMenu"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
	$("#btnQuarter").click(function(){		
    	var div = $("#quarterMenu"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
 })
</script>	
</body>
</html>
