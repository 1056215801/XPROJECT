<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我发布的</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<c:set var="navBar" value="2212" />
<link href="${ctx}/static/weixin/recruitment/css/employmentService.css"
	rel="stylesheet" />
<link href="${ctx}/static/weixin/recruitment/css/navigationBar.css"
	rel="stylesheet" />
<style>
.screenBar .on{
	color:#ff0000
}
</style>
</head>
<body>
	<div class="employment_main" kb-inject="MyViewModel">
		<div class="employment_content">
			<%-- <div class="searchBar clearfix">
				<img src="${ctx}/static/weixin/recruitment/images/search.png" width="28" class="searchBtn"> <input type="search" id="searchKey"
				 	class="searchInput" data-bind="value:searchKey" placeholder="请输入人才关键字" />
			</div>
			<div style="margin-top: 57px;"></div> --%>
			<div class="screenBar clearfix" style="margin-top:0px;" data-bind="foreach:statusList">
				<div style="width:24%" class="screen"
					data-bind="click:$parent.searchAll,css:{'on':$parent.status()==value,'border_right_cb':$index()<3}">
					<span data-bind="text:name">全部</span>
				</div>
			</div>
			</div>
			<div class="my_content" data-bind="foreach:list">
				<div class="my_cont" data-bind="click:$parent.show">
					
					<div class="my_containe">
						<div class="clearfix">
							<div class="my_position" data-bind="text:positionName">测试</div>
							<div class="my_salary" data-bind="text:payName">12-20万</div>
						</div>
						<div class="grayFont_9f" data-bind="text:rootName">江西煌上煌股份有限责任公司</div>
						<div data-bind="html:workAreaName+'&nbsp;|&nbsp;'+workYearName+'&nbsp;|&nbsp;'+diplomaName"></div>
					</div>
				</div>
			</div>
			<div class="my_content" data-bind="visible:list().length==0">
				<div class="my_cont">
					暂无数据
				</div>
			</div>
		</div>
		<%@ include file="navigationBar.jsp"%>
	</div>
	<script src="${ctx}/static/js/recruitment/hcdyIndustry.js?20170412"></script>
	<script src="${ctx}/static/weixin/recruitment/js/business-picker.js"></script>
	<script src="${ctx}/static/weixin/recruitment/js/hcdycity-picker.js?20170424"></script>
	<script>
	var account="${account}";
	</script>
	<script src="${ctx}/static/weixin/recruitment/js/my.js?20170428"></script>

</body>
</html>
