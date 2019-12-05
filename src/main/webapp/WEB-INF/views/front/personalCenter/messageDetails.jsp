<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>消息详情</title>
<link href="${ctx }/static/css/personalCenter/messageDetails.css" rel="stylesheet"/>
</head>

<body>
<div class="details_main">
	       <c:if test="${entranceId==3609009 }"  >
			  <%@ include file="../common/bak/header_yc.jsp"%>
			</c:if>
			<c:if test="${entranceId!=3609009  }"  >
			  <%@ include file="../common/header.jsp"%>
			</c:if>
		<div class="tabItem" style="background-color:#3A3D4C;">
			<div style="position:relative; top:6px; margin-left:75px;">
				<img src="${ctx}/static/image/personalCenter/personalCenter.png" width="25px" height="25px" style="vertical-align:middle;">
				<span style="vertical-align:middle; color:#fff; font-size:18px; margin-left:5px;">个人中心</span>
			</div>
			<!--<ul style="display: none;">
				<li><a href="javascript:;">服务</a></li>
				<li><a href="projectApplication.html">项目申报</a></li>
				<li><a href="activityRegistration.html">活动</a></li>
				<li><a href="onlineSurvey.html">在线调查</a></li>
			</ul>
			<ul style="display: none;">
				<li><a href="javascript:;">办公</a></li>
				<li><a href="javascript:;">审计</a></li>
			</ul>-->
		</div> 
	</div>
	
	<div class="details_content">
		<div class="details_contral">
			<div class="details_title">${accountMsgBean.msgTitle }</div>
			<div class="details_cont">
				<div>${accountMsgBean.msgWeb }</div>
				
			<%-- 	<div class="details_imgCase">
					<img src="${ctx}/static/image/personalCenter/banner.jpg" width="800px" height="250px;" style="vertical-align:middle;">
				</div>
			
				<div>1、怎样才能参加新手任务？</div>
				<div>答：新手任务系统面向所有召唤师等级不超过20级的玩家开放，玩家只要达到指定的等级或完成指定的任务，即可参与领取奖励。</div>
				
				<div style="text-align:right;">江西工业园区微讯团队</div>
				<div style="text-align:right;">2016年9月10号</div> --%>
			</div>
			
		</div>
		
	</div>
	
	 <c:if test="${entranceId==3609009 }"  >
		  <%@ include file="../common/bak/footer_yc.jsp"%>
		</c:if>
		<c:if test="${entranceId!=3609009  }"  >
		  <%@ include file="../common/footer.jsp"%>
		</c:if>
</div>
</body>
</html>
