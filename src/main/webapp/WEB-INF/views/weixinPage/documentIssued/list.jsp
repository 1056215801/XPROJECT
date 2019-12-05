<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>文件下达</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<link href="${ctx}/static/weixin/css/documentIssued/list.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/documentIssued/navigationBar.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/modernizr-custom-v2.7.1.js"></script>
<script src="${ctx}/static/weixin/js/jquery-finger-v0.1.0.js"></script>
<script>
	$(function() {
		getList(1, 1, "");
		$.ajax({
					url : "http://117.21.209.17:8080/OfficeAutomationPlatform/Spring/json/park/notice/cancleTop",
					type : "get",
					data : {
						
					},
					dataType : "jsonp",
					jsonp: "jsonpCallback",
					success : function(data) {
					}
				});
		/* 显示下拉列表 */
		$(".search").click(function() {
			hideAllDropdown();
			if ($("#dropdown").css("display") == "none") {
				$("#dropdown").slideDown("fast");
				$(".search").addClass("colorDeep");
				$(".hidebg").show();
			}
		});

		/* 滚动显示小火箭 */
		$(window).scroll(
				function() {
					if ($(document).scrollTop() + $(window).height() > $(
							document).height() - 1
							&& $('#getMore').length > 0) {
						$(".renovate").attr("onclick","");
						setTimeout(function() {
							getMore();
							$(".renovate").attr("onclick","getMore();");
						}, 1000);
					}
					if ($(document).scrollTop() > 0) {
						$('#tbox').show();
					} else {
						$('#tbox').hide();
					}
				});

		/* 配置轮播图 */
		$('.flicker-example').flicker();
	})

	/* 收起下拉列表 */
	function hideAllDropdown() {
		$(".hidebg").hide();
		$(".search").removeClass("colorDeep");
		$("#dropdown").slideUp("fast");
	}

	//获取调查列表
	function getList(pageNum, type, name, status) {// 134.225.53.139
		var accountId = '${accountId}';
		if (accountId == null || accountId == "") {
			layer.msg("登录后可查看更多文件");
			accountId = "1291";
		}
		$.ajax({
			url : "http://117.21.209.17:8080/OfficeAutomationPlatform/Spring/json/publicinfo/notice/getPageNoticeList",
			type : "get",
		data : {
			'query' : 'all',
			'pubType' : '6',
			"pageNo" : pageNum,
			"pageSize" : '5',
			"title" : name,
			'accountId' : accountId,
			'status' : status,
		},
		dataType : "jsonp",
		success : function(result) {
			if (pageNum == 1) {
				$(".surveyList").empty();
			}
			if (result.errorCode == -1) {
				layer.msg(result.errorMsg);
			} else if (result.errorCode == 2) {
				layer.msg(result.errorMsg);
			} else {
				var list = result.value.resultList;
				if(list.length==0){
					layer.msg("暂无更多数据");
					return;
				}
				
				for (var i = 0; i < list.length; i++) {
					var info = list[i];
					var _div = "";
					_div += "<a href=\"${ctx}/documentIssued/view?id="+info.publicationId+"\" style=\"text-decoration:none;\">";
					_div += "<div class=\"surveyCont\">";
					_div += "<div class=\"surveyDataBar\">";
					_div += "<div class=\"surveyDataTop\">";
					if (info.status == "0") {
						_div += "<span class=\"redRound\"></span>";
					}
					_div += "<span class=\"surveyTitle\">"
							+ info.publicationTitle + "</span>";
					_div += "</div>";
					_div += "<div class=\"surveyDataBottom\">";
					_div += "<div class=\"surveyTime\">"+ info.createTime + "</div>";
					_div += "<div style=\"float:right;\"><img src=\"${ctx}/static/weixin/images/experienceSharing/eye.png\" width=\"15px\" height=\"15px\" style=\"vertical-align:middle;margin-right:8px;\">";
					if (info.viewCount) {
						_div += "<span class=\"surveyPop\">"
							+ info.viewCount + "浏览</span>";
					} else {
						_div += "<span class=\"surveyPop\">"
							+ 0 + "浏览</span>";
					}
					
					_div += "</div>";
					_div += "<div style=\"clear:both;\"></div>";
					_div += "</div>";
					_div += "</div>";
					_div += "</div>";
					_div += "</a>";
					$(".surveyList").append(_div);
				}
				if (list.length == 5) {
					//加载更多
					var moreStr = "";
					moreStr += "<div id=\"getMore\" style=\"margin:0 1.6% 10px;display:none\">";
					moreStr += "<a href=\"javascript:void(0);\" onclick=\"getMore();\" class=\"renovate\" style=\"text-decoration: none;\">";
					moreStr += "<span class=\"renovateTitle\" style=\"color: #120F0F;\">加载更多</span>";
					moreStr += "</a>";
					moreStr += "</div>";
					$(moreStr).appendTo($(".surveyList"));
				}
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("网络异常");
		} 
	});
	}

	//long类型时间转换
	function getTime(time) {
		var date = new Date(time);
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				+ '-';
		D = (date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate())
				+ ' ';
		h = (date.getHours() < 10 ? ('0' + date.getHours()) : date.getHours())
				+ ':';
		m = (date.getMinutes() < 10 ? ('0' + date.getMinutes()) : date
				.getMinutes())
				+ ':';
		s = (date.getSeconds() < 10 ? ('0' + date.getSeconds()) : date
				.getSeconds());
		return (Y + M + D + h + m + s);
	}

	//加载更多数据
	function getMore() {
		var pageNum = Number($("#pageNum").val()) + 1;
		$("#pageNum").val(pageNum);
		$("#getMore").remove();
		var status = Number($("#status").val());
		getList(pageNum, 1, "", status);
	}

	/* 按名称搜索数据 */
	function queryByKey(name) {
		$("#status").val(2);
		$(".project_oper").each(function(index, value) {
			$(value).removeClass("operSelected");
		});
		$("#option1").addClass("operSelected");
		$("#pageNum").val(1);
		getList(1, 1, name, 2);
	}

	function optionBtnClick(item) {
		$(".project_oper").each(function(index, value) {
			$(value).removeClass("operSelected");
		});
		$(item).addClass("operSelected");
		var status = $(item).attr("value");
		$("#status").val(status);
		$("#pageNum").val(1);
		getList(1, 1, "", status);
	}
</script>
</head>

<body>
	<!-- 数据页数 -->
	<input type="hidden" id="pageNum" name="pageNum" value="1">
	<input type="hidden" id="status" name="status" value="2">

	<div class="document_main">
		<div class="document_content">
			<!-- 搜索栏 -->
			<div class="searchBar">
				<!-- <div class="search">
					<img src="${ctx}/static/weixin/images/supply/return.png" class="searchImg"/>
				</div> -->
				<input type="search" class="searchInput"
					onSearch="queryByKey(this.value);" onClick="hideAllDropdown();"
					placeholder="请输入搜索关键字"
					style="margin-left: 4%; vertical-align: middle" />
				<div style="float: right;">
					<img src="${ctx}/static/weixin/images/activity/message.png"
						class="searchImg" style="float: right;" />
				</div>
			</div>

			<!-- 下拉列表 -->
			<!-- <div id="dropdown">
				<div class="dropdownContent">
					<div class="optionBtn selected" onClick="optionBtnClick(this)">不限</div>
					<div class="optionBtn" onClick="optionBtnClick(this)">进行中</div>
					<div class="optionBtn" onClick="optionBtnClick(this)">已结束</div>
				</div>
			</div> -->

			<div style="margin-top: 55px;"></div>

			<div class="project_operBar">
				<div style="width:15%;" id="option1" class="project_oper borRight operSelected" onClick="optionBtnClick(this);" value="2">全部</div>
				<div style="width:15%;" class="project_oper borRight" onClick="optionBtnClick(this);" value="1">已读</div>
				<div style="width:15%;" class="project_oper borRight" onClick="optionBtnClick(this);" value="0">未读</div>
				<div style="clear:both;"></div>
			</div>

			<!-- 列表内容 -->
			<div class="surveyList"></div>
		</div>

		<!-- 小火箭 -->
		<div id="tbox" onclick="location.href='#top';"></div>

		<!-- 底部选项卡 -->
		<%-- <div class="navigationBar">
			<ul>
				<c:set var="tokenLink"
					value="${ctx}/personalCenter/weixin/main,${ctx}/documentIssued/viewList" />
				<c:set var="tokenData" value="shou,investigation_orange" />
				<c:forTokens var="token" varStatus="i" items="首页 文件列表" delims=" ">
					<li><a href="${tokenLink.split(',')[i.index]}"
						class="${i.index eq 3?'viewMore':''}">
							<div>
								<div class="navImage">
									<img
										src="${ctx}/static/weixin/images/investigation/${tokenData.split(',')[i.index]}.png"
										class="navigationImg" />
								</div>
								<div style="margin-top: 4%; margin-bottom: 4%; font-size: 12px">${token}</div>
							</div>
					</a></li>
				</c:forTokens>
			</ul>
		</div> --%>
	</div>
</body>
</html>