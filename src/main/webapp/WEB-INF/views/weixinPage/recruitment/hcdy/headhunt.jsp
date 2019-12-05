<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>人才经纪人</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<c:set var="navBar" value="2122" />
<link href="${ctx}/static/weixin/recruitment/css/employmentService.css"
	rel="stylesheet" />
<link href="${ctx}/static/weixin/recruitment/css/navigationBar.css"
	rel="stylesheet" />
</head>
<body>
	<div class="employment_main" kb-inject="HeadhuntViewModel">
		<div class="employment_content">
			<%-- <div class="searchBar clearfix">
				<img src="${ctx}/static/weixin/recruitment/images/search.png"
					width="28" class="searchBtn"><input type="search" id="searchKey"
				 	class="searchInput" data-bind="value:searchKey" placeholder="请输入关键字">
			</div>
			<div style="margin-top: 57px;"></div> --%>
			<div class="screenBar clearfix" style="margin-top:0px;">
				<div style="width: 20%;" class="screen border_right_cb"
					data-bind="click:searchAll">
					<span>全部</span>
				</div>
				<div style="width: 50%;white-space: nowrap; overflow: hidden;" class="screen border_right_cb">
					<span id="field_business">服务项目</span> <span class="caret"></span>
				</div>
				<!-- <div style="width: 27%;" class="screen border_right_cb">
					<span id="field_city">所在地</span> <span class="caret"></span>
				</div> -->
				<div style="width: 28%;" class="screen">
					<span id="searchField_workYear">工作经验</span> <span class="caret"></span>
				</div>
			</div>
			<div class="broker_content" data-bind="foreach:list">
				<div class="broker_cont" data-bind="click:$parent.showResume">
					<div class="broker_headPortrait">

						<img data-bind="attr:{src:head_portrait}"
							style="border-radius: 50%;width:70px;height:70px;">

					</div>
					<div class="broker_containe">
						<div class="clearfix">
							<div class="broker_name" data-bind="text:name">陈永泽</div>
							<!-- <div class="broker_grade">Lv1.</div> -->
							<div class="broker_evaluate" data-bind="text:praise_rate+'%'">100%</div>
							<div class="broker_evaluateTitle">好评率</div>
						</div>
						<div>
							<span class="grayFont_9f">已接受&nbsp;<font
								class="orangeFont" data-bind="text:entrust_count">27</font>&nbsp;份简历委托
							</span>
						</div>
						<!-- <div class="broker_tip">南昌市&nbsp;|&nbsp;3-5年&nbsp;|&nbsp;高级人才经纪人</div> -->
						<div class="broker_tip" data-bind="text:work_year"></div>
					</div>
				</div>
			</div>
			<div class="broker_content" data-bind="visible:nodata()">
				<div class="broker_cont" style="text-align: center">暂无数据</div>
			</div>
		</div>
		
		<div id="tbox">
			<a id="gotop" href="#top" style="display: block"></a>
		</div>
		<div class="weui-loadmore">
			<i class="weui-loading"></i> <span class="weui-loadmore__tips">正在加载</span>
		</div>
		
<!-- 		<div id="searchField" class="weui-popup__container popup-bottom">
			<div class="weui-popup__overlay"></div>
			<div class="weui-popup__modal">
				<div class="toolbar">
					<div class="toolbar-inner">
						<a href="javascript:;" class="picker-button"
							data-bind="click:closeFieldSearch">完成</a>
						<h1 class="title">更多筛选</h1>
					</div>
				</div>
				<div class="employment_content" style="margin-top: 50px;">

					<div class="field_search_title">工作经验</div>
					<div class="field_search_content">
						ko foreach:workYear
						<div class="optionBtn"
							data-bind="text:name,css:{selected:$parent.searchField_workYear()==code},click:$parent.workYearSelected">普通</div>
						/ko
						<div style="clear: both;"></div>
					</div>
				</div>

			</div>
		</div> -->
		<%@ include file="navigationBar.jsp"%>
		<script src="${ctx}/static/js/recruitment/hcdyIndustry.js?20170412"></script>
		<script src="${ctx}/static/weixin/recruitment/js/business-picker.js"></script>
		<script src="${ctx}/static/weixin/recruitment/js/hcdycity-picker.js"></script>
		<script src="${ctx}/static/weixin/recruitment/js/headhunt.js?20170428"></script>
	</div>
</body>
</html>
