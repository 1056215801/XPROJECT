<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>查看职位</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<c:set var="navBar" value="2212" />
<link href="${ctx}/static/weixin/recruitment/css/employmentService.css"
	rel="stylesheet" />
<link href="${ctx}/static/weixin/recruitment/css/navigationBar.css"
	rel="stylesheet" />
<style>
pre {
	white-space: pre-wrap;
	white-space: -moz-pre-wrap;
	white-space: -pre-wrap;
	white-space: -o-pre-wrap;
}
</style>
</head>
<body>
	<div class="employment_main" kb-inject="MyViewModel">
		<div class="employment_content">
			<div class="titleSwitch">
				<div class="titleName clearfix">
					<ul>
						<li><a href="javascript:;">职位详情</a><span class="span"></span></li>
						<li><a href="javascript:;">已收简历</a><span class="span"></span></li>
					</ul>
				</div>
			</div>
			<div class="titleItem">
				<div data-bind="with: position">
					<div class="company_detailsBar">
						<div>
							<span class="company_position" data-bind="text:positionName">主办会计</span>
							<span class="company_salary" data-bind="text:payName">5-8万</span>
						</div>
						<div class="company_details">
							<img src="${ctx}/static/weixin/recruitment/images/place.png"
								width="17"> <span data-bind="text:workAreaName">南昌市</span>
							<img src="${ctx}/static/weixin/recruitment/images/briefcase.png"
								width="17"> <span data-bind="text:workYearName">3-5年</span>
							<img src="${ctx}/static/weixin/recruitment/images/education.png"
								width="17"> <span data-bind="text:diplomaName">本科</span> <img
								src="${ctx}/static/weixin/recruitment/images/workType.png"
								width="17"> <span data-bind="text:workNatureName">全职</span>
						</div>
						<div class="company_details">
							<!-- <span>阅读:2</span> <span>转发:0</span> -->
							<img src="${ctx}/static/weixin/recruitment/images/time.png"
								width="17"> <span data-bind="text:createTimeName">刚刚</span>
						</div>
					</div>
					<div class="caption_top">
						<div class="caption_title">职位描述</div>
					</div>
					<div class="details_content" style="color: #9f9f9f;">
						<pre data-bind="html:demand">
					</pre>
					</div>
					<div class="caption_top">
						<div class="caption_title">岗位职责</div>
					</div>
					<div class="details_content" style="color: #9f9f9f;"
						data-bind="html:describe">
						<p>一、任职要求：</p>
						<p>1.本科以上学历，财务类专业毕业；</p>
						<p>2.有相关工作经验3年以上，中级职称证优先；</p>
						<p>3.熟练使用财务及办公软件，对金蝶K3、EAS等财务系统有实际操作经验；</p>
						<p>二、岗位职责</p>
						<p>1.负责指导会计人员做好记账、结账和对账工作；</p>
						<p>2.负责合并报表编制及母公司报表编制；</p>
						<p>3.负责往来账款核对；</p>
						<p>4.会计凭证编制及装订，期末结账；</p>
						<p>5.领导交办其他事宜；</p>
					</div>
				</div>
				<div style="display: none;">
					<!-- <div class="screenBar clearfix">
						<div style="width: 18%;" class="screen border_right_cb">
							<span>全部</span>
						</div>
						<div style="width: 27%;" class="screen border_right_cb">
							<span>行业不限</span> <span class="caret"></span>
						</div>
						<div style="width: 27%;" class="screen border_right_cb">
							<span>地点不限</span> <span class="caret"></span>
						</div>
						<div style="width: 27%;" class="screen">
							<span>更多筛选</span> <span class="caret"></span>
						</div>
					</div> -->
					<div class="talent_content" data-bind="foreach:list">
						<div class="talent_cont" data-bind="click:$parent.showResume">
							<div class="talent_headPortrait">
								<img data-bind="attr:{src:head_portrait}" width="70"
									style="border-radius: 50%;">
							</div>
							<div class="talent_containe">
								<div class="clearfix">
									<div class="talent_name" data-bind="text:name">陈永泽</div>
									<div class="talent_view" data-bind="click:$parent.showResume">个人简历</div>
								</div>
								<div>
									<span class="talent_label" data-bind="text:status">销售主管</span>
								</div>
								<div class="clearfix">
									<div class="talent_tip"
										data-bind="html:currentLocation+'&nbsp;|&nbsp;'+workYear+'&nbsp;|&nbsp;'+currentPost"></div>
									<div class="talent_time" data-bind="text:time">2017-03-07</div>
								</div>
							</div>
						</div>
					</div>
					<div class="talent_content" data-bind="if:list().length==0">
						<div class="talent_cont">暂无简历</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="navigationBar.jsp"%>
	</div>

	<script>
		var account = "${account}";
		$(function() {
			$(".titleName ul li").each(
					function() {
						var index = $(this).index();
						$(".titleName ul li").eq(0).addClass("titleClick");
						$(".titleName ul li").eq(0).children(".span").addClass(
								"caret_title");
						$(this).click(
								function() {
									$(this).addClass("titleClick").siblings()
											.removeClass("titleClick");
									$(this).children(".span").addClass(
											"caret_title").parent().siblings()
											.children(".span").removeClass(
													"caret_title");
									$(".titleItem>div").eq(index).stop(true)
											.show().siblings().stop(true)
											.hide();
								})
					});
		})
	</script>
	<script src="${ctx}/static/weixin/recruitment/js/showPosition.js?20170424"></script>
</body>
</html>
