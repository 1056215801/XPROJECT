<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>内容详情</title>
<link href="${ctx}/static/weixin/css/investigation/surveyDetails.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/iCheck/custom.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/iCheck/icheck.min.js"></script>
</head>
<script>
	$(function(){
		if("${isJoin}"=="yes"){//是否参与过调查
			layer.msg("您已经参与过此项调查");
			setTimeout(function(){location.href="${ctx}/investigation/weixin/detailResultOfWx/${infoBean.id}?re=2";},1000);
		}else if(${infoBean.status eq -1}){//调查是否结束
			layer.msg("调查已结束");
			setTimeout(function(){location.href="${ctx}/investigation/weixin/main";},1000);
		}
		
		/* radio样式 */
		$(".i-checks").iCheck(
        	{checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"}
        )
        
        /* 滚动显示小火箭 */
    	$(window).scroll(
    			function(){
    				if ($(document).scrollTop() > 0) {
    					$('#tbox').show();
    				} else {
    					$('#tbox').hide();
    				}
    			});
	})

	/* 防止用户操作过快 在提交时也判断是否参与过调查 */
 	function submitInfo(){
		if("${isJoin}"=="yes"){
			layer.msg("您已经参与过此项调查");
			setTimeout(function(){location.href="${ctx}/investigation/weixin/detailResultOfWx/${infoBean.id}?re=2";},1000);
		}else{
			$('#inputform').submit();
		}
	}
</script>
<body>
	<div class="details_main">
		<div class="details_content">
			<!-- 问卷概况 -->
			<div class="surveyDataBar">
				<div class="surveyTitle">${infoBean.getInvestigationName()}</div>
				<div class="surveyDataContral">
					<div style="float: left; margin-right: 20px;">发布人：${infoBean.getAccountName()}</div>
					<div style="float: left;">阅读：${browseLogCount}</div>
					<div style="clear: both;"></div>
				</div>
				<img src="${infoBean.extend1}" width="100%" height="200px;" style="display: block; margin: 0 auto;">
				<div class="surveyDataContral">
					<img src="${ctx}/static/weixin/images/activity/time.png" width="15px" height="15px" style="vertical-align: middle;"> <span
						style="vertical-align: middle;"> <fmt:formatDate value="${infoBean.getPublishTime()}" pattern="yyyy-MM-dd HH:mm" /> 至
						<fmt:formatDate value="${infoBean.getEndTime()}" pattern="yyyy-MM-dd HH:mm" />
					</span>
				</div>
				<div style="position: relative; padding: 5px 0;">
					<img src="${ctx}/static/weixin/images/activity/applyname.png" width="15px" height="15px" style="vertical-align: middle;">
					<span class="surveyPop">参与人气<font style="color: #f1921c;">${joinCount}</font>人
					</span>
					<!-- 问卷状态 -->
					<div class="surveyStateYellow">
						<c:choose>
							<c:when test="${infoBean.status eq -1}">
						已结束
					</c:when>
							<c:when test="${infoBean.status eq 0}">
						草稿箱
					</c:when>
							<c:otherwise>
						进行中
					</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="surveyDataBar" style="padding-bottom: 20px;">
				<!-- 问卷题号 -->
				<c:set var="num" value="1" />
				<!-- 调查问卷详情 -->
				<div style="margin-top: 10px;">
					<form action="${ctx}/investigation/weixin/saveInfoOfWx" method="post" name="inputform" id="inputform">
						<input type="hidden" name="formId" value="${infoBean.formId}" /> <input type="hidden" name="id" value="${infoBean.id}" />
						<c:forEach items="${inputList}" var="item" varStatus="k">
							<!-- 单选 -->
							<c:if test="${item.inputType=='radio'}">
								<div class="survey_subject">${num}、${item.inputTitle}（单选）</div>
								<c:set var="num" value="${num+1}" />
								<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
									<div class="i-checks" style="margin: 5px 0 0 20px;">
										<input type="radio" value="${it}" name="radio+${num}" style="margin-right: 5px;" ${j.index==0?'checked':''}> <font
											style="margin-left: 5px;"> ${it} <c:if test="${it=='其他'}">&nbsp;<input type="text"
													name="radio+${num}+_other" value=""
													style="border: 0px; border-bottom: solid 1px; background-color: transparent; outline: none; resize: none;">
											</c:if>
										</font>
									</div>
								</c:forEach>
							</c:if>
							<!-- 多选 -->
							<c:if test="${item.inputType=='checkbox'}">
								<div class="survey_subject">${num}、${item.inputTitle}（多选）</div>
								<c:set var="num" value="${num+1}" />
								<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
									<div class="i-checks" style="margin: 5px 0 0 20px;">
										<input type="checkbox" value="${it}" name="checkbox+${num}" ${j.index==0?'checked':''}> <i></i> <font>
											${it} <c:if test="${it=='其他'}">&nbsp;<input type="text" name="checkbox+${num}+_other" value=""
													style="border: 0px; border-bottom: solid 1px; background-color: transparent; outline: none; resize: none;">
											</c:if>
										</font>
									</div>
								</c:forEach>
							</c:if>
							<!-- 文本框 -->
							<c:if test="${item.inputType=='text'}">
								<div class="survey_subject">${num}、${item.inputTitle}</div>
								<c:set var="num" value="${num+1}" />
								<textarea rows="4" type="text" class="textareContral" name="text+${num}" value="" placeholder="请输入文本"
									style="outline: none; resize: none;"></textarea>
							</c:if>
							<c:if test="${item.inputType=='textarea'}">
								<div class="survey_subject">${num}、${item.inputTitle}</div>
								<c:set var="num" value="${num+1}" />
								<textarea rows="4" type="text" class="textareContral" name="textarea+${num}" value="" placeholder="请输入文本"
									style="outline: none; resize: none;"></textarea>
							</c:if>
						</c:forEach>
					</form>
				</div>
			</div>
			<div style="margin: 7px">
				<input type="button" value="提交" class="buttonContral" onclick="submitInfo();">
			</div>
		</div>

		<!-- 小火箭 -->
		<div id="tbox" onclick="location.href='#top';"></div>
			
		<!-- 返回前页 -->
		<a href="javascript:history.back(-1);"> <img src="${ctx}/static/weixin/images/investigation/return.png" width="40px"
			height="40px" style="position: fixed; top: 3px; right: 5px;">
		</a>
	</div>
</body>
</html>
