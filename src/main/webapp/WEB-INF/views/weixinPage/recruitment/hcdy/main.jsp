<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>人才库</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<c:set var="navBar" value="1222" />
<link href="${ctx}/static/weixin/recruitment/css/employmentService.css"
	rel="stylesheet" />
<link href="${ctx}/static/weixin/recruitment/css/navigationBar.css?20170424"
	rel="stylesheet" />
</head>
<body>
	<div class="employment_main" kb-inject="MainViewModel">
		<div class="employment_content">
			<%-- <div class="searchBar clearfix">
				<img src="${ctx}/static/weixin/recruitment/images/search.png"
					width="28" class="searchBtn"> <input type="search" id="searchKey"
				 	class="searchInput" data-bind="value:searchKey" placeholder="请输入人才关键字">
			</div>
			<div style="margin-top: 50px;"></div> --%>
			<img src="${ctx}/static/weixin/recruitment/images/top.png"
				width="100%">
			<div class="screenBar clearfix">
				<div style="width: 18%;" class="screen border_right_cb"
					data-bind="click:searchAll">
					<span>全部</span>
				</div>
				<div style="width: 27%;white-space: nowrap; overflow: hidden;" class="screen border_right_cb">
					<span id="field_business">行业不限</span> <span class="caret"></span>
				</div>
				<div style="width: 27%;" class="screen border_right_cb">
					<span id="field_city">地点不限</span> <span class="caret"></span>
				</div>
				<div style="width: 27%;" class="screen"
					data-bind="click:openSearchFieldPopup">
					<span>更多筛选</span> <span class="caret"></span>
				</div>
			</div>
			<div class="talent_content" data-bind="foreach:list">
				<div class="talent_cont" data-bind="click:$parent.showResume">
					<div class="talent_headPortrait">
						<img data-bind="attr:{src:head_portrait}"
							style="border-radius: 50%;width:70px;height:70px;">
					</div>
					<div class="talent_containe">
						<div class="clearfix">
							<div class="talent_name" data-bind="text:name">陈永泽</div>
							<div class="talent_view" data-bind="click:$parent.showResume">个人简历</div>
						</div>
						<div>
							<span class="talent_label" data-bind="text:sex,visible:sex!=''"></span>
							<span class="talent_label" data-bind="text:age,visible:age!=''"></span>
						</div>
						<div class="clearfix">
							<div class="talent_tip"
								data-bind="html:location+'&nbsp;|&nbsp;'+work_year+'&nbsp;|&nbsp;'+diploma"></div>
							<div class="talent_time" data-bind="text:update_date">2017-03-07</div>
						</div>
					</div>
				</div>
			</div>
			<div class="talent_content" data-bind="visible:nodata()">
				<div class="talent_cont" style="text-align: center">暂无数据</div>
			</div>
			</div>

		<div id="tbox">
			<a id="gotop" href="#top" style="display: block"></a>
		</div>
		<div class="weui-loadmore">
			<i class="weui-loading"></i> <span class="weui-loadmore__tips">正在加载</span>
		</div>
		<div class="backBtn" onclick="history.go(-1)" style="display: none;"></div>
		<iframe id="login" name="login" style="display:none"></iframe>
		<%@ include file="fieldSearch.jsp"%>

		<%@ include file="navigationBar.jsp"%>
	</div>
	<script src="${ctx}/static/weixin/js/url.min.js"></script>
	<script src="${ctx}/static/js/recruitment/hcdyIndustry.js?20170412"></script>
	<script src="${ctx}/static/weixin/recruitment/js/business-picker.js"></script>
	<script src="${ctx}/static/weixin/recruitment/js/hcdycity-picker.js?20170424"></script>
	<script src="${ctx}/static/weixin/recruitment/js/main.js?20170509"></script>
</body>
</html>
