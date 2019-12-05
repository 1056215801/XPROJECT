<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>消息通知</title>

<link href="${ctx }/static/css/personalCenter/messageNotification.css" rel="stylesheet" />
<script>
	$(function() {
		$(".tabName ul li").each(function(){
			var index=$(this).index();
			$(".tabName ul li").eq(0).addClass("nameClick");
			$(this).click(function(){
				$(this).addClass("nameClick").siblings().removeClass("nameClick");
				$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
			});
	    });
		$(".tabItem ul li").each(function(){
			$(this).click(function(){
				$(this).addClass("itemClick").siblings().removeClass("itemClick");
			});
	    });
		$("#setYuanQuNone").click(function(){
			$("#yuanQuSet").style('display','none');
		});
		$('#messageList').empty();

		$
				.ajax({
					url : "${ctx}/personalCenter/json/messageNotification",
					type : "get",
					data : {
						"accountId" : "${accountId}",
						"pageNum" : 1,
						"pageSize" : 10,
					},
					dataType : "json",
					success : function(result) {
						if (result.code == -1) {
							layer.alert(result.msg);
						} else if (result.code == 2) {
							$('#messageList')
									.html(
						 					'<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
							$('#getmoreAllActi').hide();
						} else {
							var list = result.value;
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = '<div class="notice_bar">';
								if (info.createTime > "${date}") {
									_div += '<div class="notice_spot"></div>';
								}
								if (info.status == 0) {
									_div += '<div class="notice_title redFont">'
										  +'<a href="${ctx}/personalCenter/messageView?msgId='+info.msgId+'" style="">'
											+ '<span class="notice_type">['
											+ info.msgSource
											+ ']</span>'
											+ info.msgTitle + '</a></div>'
								} else {
									_div += '<div class="notice_title">'
										  +'<a href="${ctx}/personalCenter/messageView?msgId='+info.msgId+'" >'
											+ '<span class="notice_type">['
											+ info.msgSource + ']</span>'
											+ info.msgTitle + '</a></div>'
								}
								if (info.createTime > "${date}") {
									_div += '<img src="${ctx}/static/image/personalCenter/activitybig.jpg" width="20px" height="10px" style="vertical-align:middle;">';
								}
								_div += '<div class="notice_time">'
										+ getTime(info.createTime) + '</div>'
										+ '</div>';
							$('#messageList').append(_div);
							}
							if (result.code == 0) {
								$('#getmoreAllActi').hide();
							} else if (result.code == 1) {
								$('#getmoreAllActi').show();
							}
						}
					},
					error : function() {
						tips("获取列表异常");
					}
				});
	});

	//long类型时间转换
	function getTime(time) {
		var date = new Date(time);
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				+ '-';
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y + M + D + h + m + s);
	}
	function getmore() {
		var pageNum = Number($("#pageNum").val()) + 1;
		$("#pageNum").val(pageNum);
		$
				.ajax({
					url : "${ctx}/personalCenter/json/messageNotification",
					type : "get",
					data : {
						"accountId" : "${accountId}",
						"pageNum" : pageNum,
						"pageSize" : 10
					},
					dataType : "json",
					success : function(result) {
						var list = result.value;
						for (var i = 0; i < list.length; i++) {
							var info = list[i];
							var _div = '<div class="notice_bar">';
							if (info.status==0) {
								_div += '<div class="notice_spot"></div>';
							}
							
							if (info.status == 0) {
								_div += '<div class="notice_title redFont">'
								        +'<a href="${ctx}/personalCenter/messageView?msgId='+info.msgId+'" style="color:#f24e4d;>'
										+ '<span class="notice_type redFont">['
										+ info.msgSource + ']</span>'
										+ info.msgTitle + '</a></div>';
							} else {
								_div += '<div class="notice_title">'
									+'<a href="${ctx}/personalCenter/messageView?msgId='+info.msgId+'" >'
										+ '<span class="notice_type">['
										+ info.msgSource + ']</span>'
										+ info.msgTitle + '</a></div>';
							}
							if (info.createTime > "${date}") {
								_div += '<img src="${ctx}/static/image/personalCenter/activitybig.jpg" width="20px" height="10px" style="vertical-align:middle;">';
							}
							_div += '<div class="notice_time">'
									+ getTime(info.createTime) + '</div>'
									+ '</div>';
							$('#messageList').append(_div);
						}
						if (result.code == 0) {
							$('#getmoreAllActi').hide();
						} else if (result.code == 1) {
							$('#getmoreAllActi').show();
						}
					},
					error : function() {
						tips("获取列表异常");
					}
				});
	}
</script>
</head>

<body>
	<div class="project_header">
	   <c:if test="${entranceId==3609009 }"  >
		  <%@ include file="../common/bak/header_yc.jsp"%>
		</c:if>
		<c:if test="${entranceId!=3609009  }"  >
		  <%@ include file="../common/header.jsp"%>
		</c:if>
	</div>
	<%-- <div class="notice_main">
		<%@ include file="../common/header.jsp"%>
		<div class="tabItem" style="background-color: #3A3D4C;">
			<div style="position: relative; top: 6px; margin-left: 75px;">
				<img src="${ctx}/static/image/personalCenter/personalCenter.png" width="25px" height="25px" style="vertical-align: middle;">
				<span style="vertical-align: middle; color: #fff; font-size: 18px; margin-left: 5px;">个人中心</span>
			</div>
		</div>
	</div> --%>

	<div class="notice_content">
		<div class="notice_contentLeft">
			<div class="menuNav">
				<a href="messageNotification.html"> 
					<img src="${ctx}/static/image/personalCenter/message.jpg" width="24" height="24" style="vertical-align: middle;">
					<span style="vertical-align: middle; margin-left: 2px; color: #000;">消息通知</span>
				</a>
			</div>
			<div class="menuNav">
				<a href="javascript:;">
					<img src="${ctx}/static/image/personalCenter/setUp.jpg" width="24" height="24" style="vertical-align: middle;"> 
					<span style="vertical-align: middle; margin-left: 2px;">设置</span>
				</a>
				<ul>
					<li><a href="${ctx }/personalCenter/personalInfoEdit">个人信息</a></li>
					<li><a href="${ctx }/personalCenter/accountSecurity">账号安全</a></li>
					<li><a href="${ctx }/personalCenter/accountUpgrade">账号升级</a></li>
					<%-- <li><a href="${ctx }/personalCenter/parkEdit">园区设置</a></li> --%>
					<li><a href="${ctx }/personalCenter/companyEdit">企业设置</a></li>
				</ul>
			</div>
		</div>
		<div class="notice_contentRight">
			<input type="hidden" id="pageNum" value="1" />
			<div class="notice_cont">
				<div class="notice_top">消息通知</div>
				<div style="padding: 0 7px;" id="messageList">
					<%-- <div class="notice_bar">
						<div class="notice_spot"></div>
						<div class="notice_title">
							<a href="messageDetails.html">
							<span class="notice_type">[项目申报]</span>
							江西融合科技有限责任公司已申报项目2016年江西省工信部科技展成果奖申报...
							</a>
						</div>
						<img src="${ctx}/static/image/personalCenter/activitybig.jpg" width="20px" height="10px" style="vertical-align:middle;">
						<div class="notice_time">2016-10-01</div>
					</div>
					<div class="notice_bar">
						<div class="notice_title redFont">
							<span class="notice_type redFont">[活动]</span>
							江西融合科技有限责任公司已申报项目2016年江西省工信部科技展成果奖申报
						</div>
						<div class="notice_time">2016-09-30</div>
					</div>
					<div class="notice_bar">
						<div class="notice_title">
							<span class="notice_type">[项目申报]</span>
							江西融合科技有限责任公司已申报项目2016年江西省工信部科技展成果奖申报
						</div>
						<div class="notice_time">2016-09-29</div>
					</div>
					<div class="notice_bar">
						<div class="notice_title">
							<span class="notice_type">[项目申报]</span>
							江西融合科技有限责任公司已申报项目2016年江西省工信部科技展成果奖申报
						</div>
						<div class="notice_time">2016-09-29</div>
					</div>
					<div class="notice_bar">
						<div class="notice_title">
							<span class="notice_type">[项目申报]</span>
							江西融合科技有限责任公司已申报项目2016年江西省工信部科技展成果奖申报
						</div>
						<div class="notice_time">2016-09-29</div>
					</div> --%>

				</div>
				<div id="getmoreAllActi"
					style="margin: 10px 1.6% 10px; text-align: center;">
					<a href="javascript:;" onClick="getmore();" class="renovate"> <span
						class="renovateTitle">加载更多</span>
					</a>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
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
