<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发布成功页面</title>
<link href="${ctx}/static/css/investigation/releaseSuccessPage.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/buttons.css" rel="stylesheet"/>
<style>
.tabItem {
	background-color:#f1921c;
	height:40px;
}
.itemClick { background-color:#B76501;}
.button_Contral {
	-moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    border-radius:20px;
	text-align:center;
	font-weight:bold;
}
</style>
<script>
 $(function(){
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(2).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
 })
</script>
</head>

<body>
<div class="success_main">
	<%@ include file="../common/header.jsp"%>
	 
	</div>
	
	<div class="success_content">
		<div>
			<div style="text-align:center; margin:120px 0 150px;;">
				<img src="images/headPortrait.png" width="90px" height="90px" style="vertical-align:middle;">
				<div style="display:inline-block; vertical-align:middle;">恭喜你调查问卷发布成功！</div>
			</div>
			<div style="text-align:center; margin:50px 0;">
				<input type="button" class="button button-raised button-highlight button_Contral" style="width:180px;" value="确认">
			</div>
		</div>
	</div>
	
	 <%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>
