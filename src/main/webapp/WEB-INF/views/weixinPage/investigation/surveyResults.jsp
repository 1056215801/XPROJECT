<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>调查结果</title>
<link href="${ctx}/static/weixin/css/investigation/surveyResults.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/iCheck/custom.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/iCheck/icheck.min.js"></script>
</head>
<script>
	$(function(){
		/* 返回前页链接 */
		var url = location.search;
		if (url.indexOf("?re=2")!=-1){
			$('#back').attr("href","${ctx}/investigation/weixin/main");
		}else{
			$('#back').attr("href","${ctx}/investigation/weixin/myList");
		}
		
		if(!${empty message}){
			layer.msg('${message}');
		}
		
		/* radio样式 */
		$(".i-checks").iCheck({ 
        	disabledCheckboxClass:"icheckbox_square-green",
         	disabledRadioClass:"iradio_square-green",
        	uncheckedClass:"hideCheckBox"
    	})
    	
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

</script>
<body>
	<div class="results_main">
		<div class="results_content">
			<!-- 问卷概况 -->
			<div class="surveyDataBar">
				<div class="surveyTitle">${infoBean.getInvestigationName()}</div>
				<div class="surveyDataContral">
					<div style="float: left; margin-right: 20px;">发布人：${infoBean.getAccountName()}</div>
					<div style="float: left;">阅读：${totalCount.countBrowse}</div>
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
					<img src="${ctx}/static/weixin/images/activity/applyname.png" width="15px" height="15px" style="vertical-align: middle;margin-right:5px">
					<span class="surveyPop">参与人气<font style="color: #f1921c;">${totalCount.countExampleSum}</font>人
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
			<div class="surveyDataBar" style="padding-bottom: 5px;">
				<!-- 问卷题号 -->
				<c:set var="num" value="1" />
				<!-- 调查问卷详情 -->
				<c:set var="colors" value="${fn:split('#37B0FF,#78CBFF,#B3E2FF,#FF8500,#FFA749,#FFC17E,#39D800,#FF567A', ',')}" />
				<div style="margin-top: 10px;">
					<form action="${ctx}/investigation/weixin/saveInfo" method="post" name="inputform" id="inputform">
						<input type="hidden" name="formId" value="${infoBean.formId}" /> <input type="hidden" name="id" value="${infoBean.id}" />
						<c:forEach items="${lstInput}" var="item" varStatus="k">
							<!-- 文本框 -->
							<c:if test="${item.inputType=='text'}">
								<div class="survey_subject">${num}、${item.inputTitle}</div>
								<c:set var="num" value="${num+1}" />
								<div class="survey_optionBar">
									<div class="survey_option" style="margin-left: 25px;">
										<span>我的填写:${item.value}</span>
									</div>
								</div>
								<div style="text-align: right">
									<font style="color: #37B0FF; font-size: 24px; font-weight: bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
								</div>
							</c:if>
							<c:if test="${item.inputType=='textarea'}">
								<div class="survey_subject">${num}、${item.inputTitle}</div>
								<c:set var="num" value="${num+1}" />
								<div class="survey_optionBar">
									<div class="survey_option" style="margin-left: 25px;">
										<span>我的填写:${item.value}</span>
									</div>
								</div>
								<div style="text-align: right">
									<font style="color: #37B0FF; font-size: 24px; font-weight: bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
								</div>
							</c:if>
							<!-- 单选 -->
							<c:if test="${item.inputType=='radio'}">
								<div class="survey_subject">${num}、${item.inputTitle}（单选）</div>
								<c:set var="num" value="${num+1}" />
								<div class="survey_optionBar">
									<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
										<div class="i-checks survey_option" style="float: left; margin: 5px 0 0 10px;">
											<input type="radio" disabled value="${it}" style="margin-right: 5px;" ${it==item.value?'checked':''}> <font
												style="margin-left: 5px;"> ${it} </font>
										</div>
										<div class="survey_dataStrip survey_option" style="margin: 5px 0 0 10px;">
											<c:set var="key" value="${item.inputId}${it}" />
											<div class="survey_sum">${fn:split(examResultMap[key],'_')[0]}</div>
											<div class="survey_percentageStrip"
												style="width:${fn:split(examResultMap[key],'_')[1]/100*100}px; background-color:${colors[j.index%8]};"></div>
											<div class="survey_percentage">
												<fmt:formatNumber type="number" value="${fn:split(examResultMap[key],'_')[1]}" pattern="0.##" maxFractionDigits="2" />
												%
											</div>
											<div style="clear: both;"></div>
										</div>
										<div style="clear: both;"></div>
									</c:forEach>
								</div>
								<div style="text-align: right">
									<font style="color: #37B0FF; font-size: 24px; font-weight: bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
								</div>
							</c:if>
							<!-- 多选 -->
							<c:if test="${item.inputType=='checkbox'}">
								<div class="survey_subject">${num}、${item.inputTitle}（多选）</div>
								<c:set var="num" value="${num+1}" />
								<div class="survey_optionBar">
									<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
										<div class="i-checks survey_option" style="float: left; margin: 5px 0 0 10px;">
											<input type="checkbox" disabled value="${it}" ${fn:contains(item.value,it)?'checked':''}> <font
												style="margin-left: 5px;"> ${it} </font>
										</div>
										<div class="survey_dataStrip survey_option" style="margin: 5px 0 0 10px;">
											<c:set var="key" value="${item.inputId}${it}" />
											<div class="survey_sum">${fn:split(examResultMap[key],'_')[0]}</div>
											<div class="survey_percentageStrip"
												style="width:${fn:split(examResultMap[key],'_')[1]/100*100}px; background-color:${colors[j.index%8]};"></div>
											<div class="survey_percentage">
												<fmt:formatNumber type="number" value="${fn:split(examResultMap[key],'_')[1]}" pattern="0.##" maxFractionDigits="2" />
												%
											</div>
											<div style="clear: both;"></div>
										</div>
										<div style="clear: both;"></div>
									</c:forEach>
								</div>
								<div style="text-align: right">
									<font style="color: #37B0FF; font-size: 24px; font-weight: bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
								</div>
							</c:if>
						</c:forEach>
					</form>
				</div>
			</div>
			<div style="margin: 7px">
				<input type="button" value="确认" class="buttonContral" onclick="location.href='${ctx}/investigation/weixin/myList';">
			</div>
		</div>
		
		<!-- 小火箭 -->
		<div id="tbox" onclick="location.href='#top';"></div>
		
		<!-- 返回前页 -->
		<a id="back" href="javascript:history.back(-1);"> <img src="${ctx}/static/weixin/images/investigation/return.png" width="40px"
			height="40px" style="position: fixed; top: 3px; right: 5px;">
		</a>
		
	</div>
	
</body>
</html>
