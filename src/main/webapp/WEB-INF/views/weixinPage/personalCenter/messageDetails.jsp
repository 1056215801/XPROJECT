<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>消息详情</title>
<link href="${ctx}/static/weixin/css/personalCenter/messageDetails.css" rel="stylesheet"/>
</head>
<script type="text/javascript">
/* 初始化 */
$(function(){
	/* $('#tbox').hide(); //隐藏火箭
    $('#proList').hide();
	$('#getMore').hide();//隐藏加载更多 */
	/* 滚动显示小火箭 */
	/* $(window).scroll(
			function() {
				if ($(document).scrollTop()
						+ $(window).height() > $(document)
						.height() - 1
						&& !$('#getMore').is(":hidden")) {
					setTimeout(function() {
						getMore();
					}, 1000);
				}
				if ($(document).scrollTop() > 0) {
					$('#tbox').show();
				} else {
					$('#tbox').hide();
				}
			}); */
	
	//获取form表单过来的详情
	<% String detailsType=request.getParameter("detailsType"); %> 
	if(<%=detailsType%>!=null){
		document.cookie="detailsType="+<%=detailsType%>; 
	}
	var detailsType = document.cookie.split(";")[0].split("=")[1];
	if(detailsType=="messageCenter"){
		$('.details_content').show();
	}
})
</script>
<body>
<div class="details_main">
	<div class="details_content">
		<div class="details_data">
				<a href="javascript:;" onClick="viewDetails();" style="text-decoration:none;">
			<div class="details_cont">${accountMsgBean.msgTitle }</div>
			<!-- <div class="details_time">2016-09-21</div> -->
			</a>
		</div> 
		<div style="padding:15px 20px; font-size:12px;">${accountMsgBean.msgWeb}</div> 	
		<!-- <div style="text-align: center;line-height: 30;">
	    <span id="proList" class="renovateTitle" style ="color: #646464;">暂无消息</span>
	    </div> -->
	    <div style="clear: both;"></div>
	</div>
	
	<!-- <div id="getMore" style="margin: 10px 1.6% 10px;">
   <a href="javascript:void(0);" onclick="getMore();" class="renovate" style="text-decoration:none;";> 
	<span class="renovateTitle" style="color: #120F0F;">加载更多</span>
	</a>
	</div>
	<div id="tbox">
	<a id="gotop" href="#top"></a>
	</div> -->
	
	<div class="fixed_bottom">
		<a href="javascript:history.go(-1);">
		<img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;" class="returnBtn"/>
		</a>
		<div class="bottom_operation" style="display:none;">
			<img src="images/phone.png" width="20px;" height="20px;"/>
			<span class="spanContral_1" style="color:#F14241;">公示结果</span>
		</div>
		<div class="bottom_operation" style="display:none;">
			<span class="spanContral_1 spanContral_2" style="color:#ABABAB;">活动已取消</span>
		</div>
		<div class="bottom_operation" style="display:none;">
			<img src="images/alreadyCollect.png" width="20px;" height="20px;"/>
			<span class="spanContral_1" style="color:#1B8ECD;">申报企业</span>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>
</body>
</html>
