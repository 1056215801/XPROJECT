<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>调查结果</title>
<link href="${ctx}/static/css/investigation/surveyResults.css" rel="stylesheet"/>
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

.survey_optionChoice {
	float:left;
	margin-right:5px;
}
</style>
<script type="text/javascript" src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
<script type="text/javascript" src="${ctx}/static/js/share.js"></script> 
<script>
 $(function(){
	 if($("#isJoin").val() == 'yes'){
		 alreadyParticipate();
	 }
	 
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(2).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
 });
 function alreadyParticipate(){
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0],
		area:['400px','220px'],
		closeBtn:0,
		content: $('#alreadyParticipate')
	});
 };

 function returnPage(type){
	$("#form").attr("action","${ctx}/investigation/main").submit();
}
</script>
</head>

<body>
<div class="results_main">
<form action="" method="get" id="form">
	<input type="hidden" id="type" name="type" value="3">
</form>
	<%@ include file="../common/header.jsp"%> 
	</div>
	
	<div class="results_content">
		<input type="hidden" name="isJoin" id="isJoin" value="${isJoin}"/>
		<div class="results_cont">
			<div class="results_title">${infoBean.investigationName}</div>
			<div class="results_top">
				<div>
					<img src="${ctx}/static/image/activity/time.png" width="15px" height="15px" class="img_contral_t1" style="float:left;">
					<div style="float:left; margin-left:5px;">
						<fmt:formatDate value="${infoBean.publishTime}" pattern="yyyy-MM-dd HH:mm"/>至
						<c:choose>
							<c:when test="${infoBean.endTime==null}">
								-
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${infoBean.endTime}" pattern="yyyy-MM-dd HH:mm"/>	
							</c:otherwise>
						</c:choose>
					</div>
					
					<div style="float:right; margin-left:20px;">阅读：${totalCount.countBrowse}</div>
					<div style="float:right;">发布人：${infoBean.accountName}</div>
					<div style="clear:both;"></div>
				</div>
				<div style="margin-top:5px;">
					<img src="${ctx}/static/image/activity/enterCount.png" width="15px" height="15px" class="img_contral_t4" style="float:left;">
					<div style="float:left; margin-left:5px;">
						参与人气：<font style="color:#f1921c; font-size:16px; font-weight:bold;">${totalCount.countExampleSum}</font>人
					</div>
					
					<div style="float:right; position:relative; top:5px;">
						<span class="font12 span_contral_t-7" style="color:#5e5e5e;">一键分享</span>
						<a title="分享给QQ好友" onclick="shareToQQFriend(event,'调查')" href="javascript:;"><img src="${ctx}/static/image/qq.png" width="25px;" height="25px;" style="margin-left:5px;"></a>
						<a title="分享到微信" onclick="shareToWx(event)" href="javascript:;"><img src="${ctx}/static/image/wx.png" width="25px;" height="25px;" style="margin-left:5px;"></a>
						<a title="分享到微博" onclick="shareToWb(event)" href="javascript:;"><img src="${ctx}/static/image/wb.png" width="25px;" height="25px;" style="margin-left:5px;"></a>
						<a title="复制链接"  id='copyTo'   href="javascript:;"><img src="${ctx}/static/image/cp.png" width="25px;" height="25px;" style="margin-left:5px;"></a>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div style="padding:0 40px;">
				<div style="margin:20px 0;">这里填写调查事项描述</div>
				<c:set var="num" value="1"/>
				<div style="margin-top:10px;">
								<input type="hidden" name="formId" value="${infoBean.formId}"/>
								<c:forEach items="${lstInput}" var="item" varStatus="k">
                            		<!-- 文本框 -->
                            		<c:if test="${item.inputType=='text'}">
                            		 	<div class="survey_subject">${num}、${item.inputTitle}</div>
			                            <c:set var="num" value="${num+1}"/>
			                            <div class="survey_optionBar">
											<div class="survey_option" style="margin-left: 25px;">
												<span>我的填写:${item.value}</span>
											</div>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<!-- 密码框 -->
                            		<c:if test="${item.inputType=='password'}">
                            			<div class="survey_subject">${num}、${item.inputTitle}</div>
			                            <c:set var="num" value="${num+1}"/>
			                            <div class="survey_optionBar">
											<div class="survey_option" style="margin-left: 25px;">
												<span>我的填写:${item.value}</span>
											</div>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<!-- 数值 -->
                            		<c:if test="${item.inputType=='number'}">
                            			<div class="survey_subject">${num}、${item.inputTitle}</div>
			                            <c:set var="num" value="${num+1}"/>
			                            <div class="survey_optionBar">
											<div class="survey_option" style="margin-left: 25px;">
												<span>
													<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${item.value}"/>
												</span>
											</div>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='textarea'}">
                            			<div class="survey_subject">${num}、${item.inputTitle}</div>
			                            <c:set var="num" value="${num+1}"/>
			                            <div class="survey_optionBar">
											<div class="survey_option" style="margin-left: 25px;">
												<span>我的填写:${item.value}</span>
											</div>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='richtext'}">
                            			<div class="survey_subject">${num}、${item.inputTitle}</div>
			                            <c:set var="num" value="${num+1}"/>
			                            <div class="survey_optionBar">
											<div class="survey_option" style="margin-left: 25px;">
												<span>我的填写:${item.value}</span>
											</div>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='radio'}">
                            			<div class="survey_subject">${num}、${item.inputTitle}（单选）</div>
			                            <c:set var="num" value="${num+1}"/>
										<div class="survey_optionBar">
											<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
											<div class="survey_option${it==item.value?'2':''}">
												<c:if test="${it==item.value}">
													<img src="${ctx}/static/image/investigation/select.png" width="20px" height="20px" class="survey_optionChoice">
												</c:if>
												<div style="float:left;">${it}</div>
			                                    <div class="survey_dataStrip">
			                                    	<c:set var="key" value="${item.inputId}${it}" />
													<div class="survey_sum">${fn:split(examResultMap[key],'_')[0]}</div>
													<div class="survey_percentageStrip" style="width:${fn:split(examResultMap[key],'_')[1]/100*240}px; background-color:#37B0FF;"></div>
													<div class="survey_percentage">
														<fmt:formatNumber type="number" value="${fn:split(examResultMap[key],'_')[1]}" pattern="0.##" maxFractionDigits="2"/>%
													</div><!--240px为100%-->
													<div style="clear:both;"></div>
												</div>
												<div style="clear:both;"></div>
											</div>
		                                    </c:forEach>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='checkbox'}">
                            			<div class="survey_subject">${num}、${item.inputTitle}（多选）</div>
			                            <c:set var="num" value="${num+1}"/>
										<div class="survey_optionBar">
											<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
											<div class="survey_option${fn:contains(item.value,it)?'2':''}">
												<c:if test="${fn:contains(item.value,it)}">
													<img src="${ctx}/static/image/investigation/select.png" width="20px" height="20px" class="survey_optionChoice">
												</c:if>
												<div style="float:left;">${it}</div>
			                                    <div class="survey_dataStrip">
			                                    	<c:set var="key" value="${item.inputId}${it}" />
													<div class="survey_sum">${fn:split(examResultMap[key],'_')[0]}</div>
													<div class="survey_percentageStrip" style="width:${fn:split(examResultMap[key],'_')[1]/100*240}px; background-color:#37B0FF;"></div>
													<div class="survey_percentage">
														<fmt:formatNumber type="number" value="${fn:split(examResultMap[key],'_')[1]}" pattern="0.##" maxFractionDigits="2"/>%
													</div><!--240px为100%-->
													<div style="clear:both;"></div>
												</div>
												<div style="clear:both;"></div>
											</div>
		                                    </c:forEach>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='select'}">
                                   	    <div class="survey_subject">${num}、${item.inputTitle}（单选）</div>
			                            <c:set var="num" value="${num+1}"/>
										<div class="survey_optionBar">
											<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
											<div class="survey_option${it==item.value?'2':''}">
												<c:if test="${it==item.value}">
													<img src="${ctx}/static/image/investigation/headPortrait.png" width="20px" height="20px" class="survey_optionChoice">
												</c:if>
												<div style="float:left;">${it}</div>
			                                    <div class="survey_dataStrip">
			                                    	<c:set var="key" value="${item.inputId}${it}" />
													<div class="survey_sum">${fn:split(examResultMap[key],'_')[0]}</div>
													<div class="survey_percentageStrip" style="width:${fn:split(examResultMap[key],'_')[1]/100*240}px; background-color:#37B0FF;"></div>
													<div class="survey_percentage">
														<fmt:formatNumber type="number" value="${fn:split(examResultMap[key],'_')[1]}" pattern="0.##" maxFractionDigits="2"/>%
													</div><!--240px为100%-->
													<div style="clear:both;"></div>
												</div>
											</div>
											<div style="clear:both;"></div>
		                                    </c:forEach>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='selectmore'}">
                                   	    <div class="survey_subject">${num}、${item.inputTitle}（多选）</div>
			                            <c:set var="num" value="${num+1}"/>
										<div class="survey_optionBar">
											<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
											<div class="survey_option${fn:contains(item.value,it)?'2':''}">
												<c:if test="${fn:contains(item.value,it)}">
													<img src="${ctx}/static/image/investigation/headPortrait.png" width="20px" height="20px" class="survey_optionChoice">
												</c:if>
												<div style="float:left;">${it}</div>
			                                    <div class="survey_dataStrip">
			                                    	<c:set var="key" value="${item.inputId}${it}" />
													<div class="survey_sum">${fn:split(examResultMap[key],'_')[0]}</div>
													<div class="survey_percentageStrip" style="width:${fn:split(examResultMap[key],'_')[1]/100*240}px; background-color:#37B0FF;"></div>
													<div class="survey_percentage">
														<fmt:formatNumber type="number" value="${fn:split(examResultMap[key],'_')[1]}" pattern="0.##" maxFractionDigits="2"/>%
													</div><!--240px为100%-->
													<div style="clear:both;"></div>
												</div>
											</div>
											<div style="clear:both;"></div>
		                                    </c:forEach>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='date'}">
                            			<div class="survey_subject">${num}、${item.inputTitle}</div>
			                            <c:set var="num" value="${num+1}"/>
			                            <div class="survey_optionBar">
											<div class="survey_option" style="margin-left: 25px;">
												<span>我的填写:<fmt:formatDate value="${item.value}" pattern="yyyy-MM-dd HH:mm"/></span>
											</div>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='hidden'}">
                            		</c:if> 
                            		<c:if test="${item.inputType=='file'}">
                            			<div class="survey_subject">${num}、${item.inputTitle}</div>
			                            <c:set var="num" value="${num+1}"/>
			                            <div class="survey_optionBar">
											<div class="survey_option" style="margin-left: 25px;">
												 <div id="attList_item${k.index+1}" ></div>
											</div>
										</div>
										<div style="text-align:right">
											<font style="color:#37B0FF; font-size:24px; font-weight:bold;">${item.inputTrue}</font>人作答(${item.examplePrc}%)
										</div>
                            		</c:if>
                            		<c:if test="${item.inputType=='subform'}">
                                      	    <p class="form-control-static" id="subform">请选择需引用的表单</p>
                            		</c:if>
                            		<c:if test="${item.inputType=='line'}">
                                      	   <div style="border-bottom:2px ${item.dataFormat=='dashed'?'dashed':'solid'} #ccc; margin-top:5px;"></div>
                            		</c:if>
                            	</c:forEach>
				
			<div style="text-align:center; margin-top:10px;">
				<input type="button" class="button button-raised button-highlight button_Contral" style="width:180px;" onClick="returnPage('3');" value="确认">
			</div>
		</div>
	</div>	
	</div>
	
	<div id="alreadyParticipate" style="display:none;">
		<div style="font-size:22px; font-weight:bold; text-align:center; margin:75px auto 0; width:242px; color:#FF6060;">你已经参加过此次调查！</div>
		<div style="margin:0 auto; width:242px;">你可以查看当前调查的结果统计，或去参与“江西工业园区微讯”平台其他调查。</div>
	</div>
	
    <%@ include file="../common/footer.jsp"%>
</div>
	<div style="display:none" id="qrcode">     
		<img src='${infoBean.qrCode}'  width="250px;" height="250px;"/>
		<br>&nbsp;&nbsp;打开微信，点击底部的“发现”
		<br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
  	</div>
</body>
</html>
