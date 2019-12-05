<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>附近商机</title>
<link href="${ctx}/static/weixin/css/supply//enterpriseSearch.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
 <script>
 $(function(){
 	$(".search").click(function(){ 
		var div = $("#dropdown"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
			$(".search").addClass("colorDeep");
		}else{ 
	  		div.slideUp("fast"); 
			$(".search").removeClass("colorDeep");
		} 
	}); 
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
</script>
</head>

<body>
<div class="search_main">
	<div class="search_content">
		<div class="searchBar">
			<div class="search">
				<img src="images/map.png" width="20px;" height="20px;" style="margin:14px 12px;"/>
			</div>
			<input type="text" class="searchInput" onClick="searchResult();" placeholder="请输入搜索关键字"/>
			<div class="message">
				<img src="images/map.png" width="20px;" height="20px;" style="margin:14px 12px;"/>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div id="dropdown">
			<div class="dropdownContent">
				<div class="optionBtn selected">不限</div>
				<div class="optionBtn">食品饮料</div>
				<div class="optionBtn">电机电器</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		
		<div style="margin-top:60px;"></div>
		<div class="search_ent">
			<img src="images/headPortrait.png" width="20px;" height="20px;" style="float:left;">
			<div class="search_entName">江西煌上煌集团食品有限公司</div>
			<div style="clear:both;"></div>
		</div>
		
		<div class="search_operBar">
			<div style="width:30%;" class="search_oper borRight">距离2公里</div>
			<div style="width:54%;" class="search_oper"></div>
			<div style="width:15%;" class="search_oper borLeft">
				<img src="images/headPortrait.png" width="20px;" height="20px;" style="display:block; margin:0 auto;">
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="search_result">你附近共有<font style="color:#F03C3A;">3</font>个食品医疗</div>
		
		<div style="text-align:center;">此处放地图控件</div>
		
	</div>
	
	
	<div class="navigationBar">
		<ul>   
			<li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage"><img src="images/carSource.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">首页</div>
				</a></li>
			<li><a href="supplyDemandDocking.html">
					<div class="navImage"><img src="images/incrementServices.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">供应需求</div>
				</a></li>
			<li><a href="findEnterprise.html">
					<div class="navImage"><img src="images/releaseSupply.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">企业</div>
				</a></li>
			<li><a href="javascript:;" class="viewMore">
					<div class="navImage"><img src="images/more.png" width="20px;" height="20px;"/></div>
					<div class="navTitle">更多服务</div>
				</a></li>
		</ul>
		<div id="viewMore">
			<ul style="margin-top:-90px;"> 
				<!-- <li style="border-bottom:1px solid #E6E6E6;"><a href="myLeaveAMessage.html">我的留言</a></li> -->
				<li style="border-bottom:1px solid #E6E6E6;"><a href="../supply/myCollection">我的收藏</a></li> 
				<li><a href="mySupplyDemand">我的供需</a></li> 
			</ul>
		</div>
	</div>
</div>
</body>
</html>
 