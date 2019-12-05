<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>企业详情</title>
<link href="${ctx}/static/weixin/css/personalCenter/login.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
<style type="text/css">
.limitW{
	width:70%;
}
</style>
</head>
<body>
<div class="logistics_main">
		<div class="logistics_content">
			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">企业名称</div>
					<div class="details_right limitW">${companyInfoBean.companyName}</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">信用代码</div>
					<div class="details_right limitW">${companyInfoBean.socialCreditNo}</div>
				</div>
			</div>

			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">所在地区</div>
					<div class="details_right limitW">${companyInfoBean.provinceName}${companyInfoBean.areaName}${companyInfoBean.spaceName}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">详细地址</div>
					<div class="details_right limitW">${companyInfoBean.positionAddress}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">主营业务</div>
					<div class="details_right limitW">${companyInfoBean.operationMain}</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">企业网址</div>
					<div class="details_right limitW">${companyInfoBean.siteUrl}</div>
				</div>
			</div>
			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">企业简介</div>
				</div>
				<div class="details_groupLast clearfix">
					<textarea id="companyProfile" style="width:100%;resize:none;border:none;">${companyInfoBean.companyDescription}</textarea>
				</div>
			</div>
		</div>
		<div class="fixed_bottom">
			<a href="javascript:history.back(-1);"> <img src="${ctx}/static/weixin/images/riskLogistics/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a> 
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#companyProfile").height($("#companyProfile")[0].scrollHeight);
})
</script>
</html>