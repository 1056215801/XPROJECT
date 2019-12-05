<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>园区设置</title>
<link href="${ctx}/static/css/personalCenter/personalCenter.css" rel="stylesheet" />
<script>
$(function(){
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
})
	$(function(){
		var msg = '${message}';
		if(msg!=""&&msg!=null){
			layer.msg(msg);
		}
	});

	function parkEditDefault() {
		$("#parkType").val(1);
		$("#form").submit();
	}
	function parkEditCommon() {
		$("#parkType").val(2);
		$("#form").submit();
	}
</script>
</head>

<body>
	<form action="${ctx}/personalCenter/parkSelect" id="form" method="get">
		<input type="hidden" id="parkType" name="parkType">
	</form>
	<div class="center_main">
		<div class="project_header">
	    	 <c:if test="${entranceId==3609009 }"  >
			  <%@ include file="../common/bak/header_yc.jsp"%>
			</c:if>
			<c:if test="${entranceId!=3609009  }"  >
			  <%@ include file="../common/header.jsp"%>
			</c:if>
		</div>

		<div class="center_content clearfix">
			<div class="centerContentLeft">
				<div class="menuNav">
					<a href="${ctx }/personalCenter/messageNotification"> <img
						src="${ctx}/static/image/personalCenter/message.jpg" width="24"
						height="24" style="vertical-align: middle;"> <span
						style="vertical-align: middle; margin-left: 2px;">消息通知</span>
					</a>
				</div>
				<div class="menuNav">
					<a href="javascript:;"> <img src="${ctx}/static/image/personalCenter/setUp.jpg" width="24"
						height="24"> <span style="margin-left: 2px;">设置</span>
					</a>
					<ul>
						<li>
							<a href="${ctx }/personalCenter/personalInfoEdit" >个人信息</a>
						</li>
						<li>
							<a href="${ctx }/personalCenter/accountSecurity">账号安全</a>
						</li>
						<li>
							<a href="${ctx }/personalCenter/accountUpgrade">账号升级</a>
						</li>
						<%-- <li><a href="${ctx }/personalCenter/parkEdit" style="color:#000;">园区设置</a></li> --%>
						<li><a href="${ctx }/personalCenter/companyEdit">企业设置</a></li>
					</ul>
				</div>
			</div>
			<div class="centerContentRight">
				<div class="centerContent">
					<div class="centerTop">园区设置</div>
					<div style="padding: 0 15px 20px;">
						<div class="park_dataBar">
							<div class="park_data clearfix">
								<div class="park_dataLeft">默认园区：</div>
								<div style="width: 85%; float: left;">
									<div class="park_dataRight">${defaultPark}</div>
								</div>
							</div>
							<c:if test="${isVisitor==true}">
								<div class="setupOper" onClick="parkEditDefault();">设置</div>
							</c:if>
						</div>
						<c:if test="${isVisitor==true}">
							<div class="park_dataBar">
								<div class="park_data clearfix">
									<div class="park_dataLeft">常用园区：</div>
									<div style="width: 85%; float: left;">
										<c:choose>
											<c:when test="${parkList==null}">
												<div class="park_dataRight">暂未设置常用园区</div>
											</c:when>
											<c:otherwise>
												<c:forEach items="${parkList}" var="parkInfo">
													<div class="park_dataRight" >${parkInfo.park_name}</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="setupOper" onClick="parkEditCommon();">设置</div>
							</div>
						</c:if>

					</div>
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
