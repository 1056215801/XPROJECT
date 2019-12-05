<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>找调查</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<link href="${ctx}/static/weixin/css/investigation/onlineSurvey.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />

<script src="${ctx}/static/weixin/js/modernizr-custom-v2.7.1.js"></script>
<script src="${ctx}/static/weixin/js/jquery-finger-v0.1.0.js"></script>
<link href="${ctx}/static/weixin/css/flickerplate.css" rel="stylesheet">
<script src="${ctx}/static/weixin/js/flickerplate.js"></script>

<script>
	$(function() {
		getList(1, 1, "", [ -1, 1 ]);

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
	function getList(pageNum, type, name, status) {
		$.ajax({
					url : "${ctx}/investigation/json/list",
					type : "get",
					data : {
						"pageNum" : pageNum,
						"type" : type,
						"investigationName" : name,
						"statusArray" : status.toString()
					},
					dataType : "json",
					success : function(result) {
						if (pageNum == 1) {
							$(".surveyList").empty();
						}
						if (result.code == -1) {
							layer.alert(result.msg);
						} else if (result.code == 2) {
							layer.msg(result.msg);
						} else {
							var list = result.value;
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = "";
								_div += "<a href=\"${ctx}/investigation/weixin/createInfoOfWx/"+info.id+"\" style=\"text-decoration:none;\">";
								_div += "<div class=\"surveyCont\">";
								_div += "<div class=\"surveyDataBar\">";
								_div += "<div class=\"surveyDataTop\">";
								_div += "<span class=\"surveyTitle\">"
										+ info.investigationName + "</span>";
								_div += "<div class=\"surveyTime\">"
										+ getTime(info.createTime) + " 至 "
										+ getTime(info.endTime) + "</div>";
								_div += "</div>";
								_div += "<div class=\"surveyDataBottom\">";
								_div += "<img src=\"${ctx}/static/weixin/images/activity/applyname.png\" width=\"15px\" height=\"15px\" style=\"vertical-align:middle;margin-right:8px;\">";
								_div += "<span class=\"surveyPop\">参与人气<font style=\"color:#f1921c;\">"
										+ info.totalCount + "</font>人</span>";
								_div += "<div class=\"surveyStateYellow\">";
								if (info.status == -1) {
									_div += "已结束";
								} else if (info.status == 0) {
									_div += "草稿箱";
								} else {
									_div += "进行中";
								}
								_div += "</div>";
								_div += "</div>";
								_div += "</div>";
								_div += "</div>";
								_div += "</a>";
								$(".surveyList").append(_div);
							}
							if (result.code == 1) {
								//加载更多
								var moreStr = "";
								moreStr += "<div id=\"getMore\" style=\"margin:0 1.6% 10px;\">";
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
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y + M + D + h + m + s);
	}

	//加载更多数据
	function getMore() {
		var pageNum = Number($("#pageNum").val()) + 1;
		$("#pageNum").val(pageNum);
		$("#getMore").remove();
		getList(pageNum, 1, "", [ -1, 1 ]);
	}

	/* 按类型搜索数据 */
	function optionBtnClick(option) {
		$('.optionBtn').each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(option).addClass("selected");
		var str = $(option).text();
		if (str == '不限') {
			getList(1, 1, "", [ -1, 1 ]);
		} else if (str == '进行中') {
			getList(1, 1, "", [ 1 ]);
		} else if (str == '已结束') {
			getList(1, 1, "", [ -1 ]);
		} else {
			getList(1, 1, "", [ 0 ]);
		}
		hideAllDropdown();
	}

	/* 按名称搜索数据 */
	function queryByKey(name) {
		getList(1, 1, name, [ -1, 1 ]);
	}
</script>
</head>

<body>
	<!-- 数据页数 -->
	<input type="hidden" id="pageNum" name="pageNum" value="1">

	<!-- 下拉列表半透明背景 -->
	<div class="hidebg"></div>
	
	<div class="survey_main">
		<div class="survey_content">
			<!-- 搜索栏 -->
			<div class="searchBar">
				<div class="search">
					<img src="${ctx}/static/weixin/images/activity/sort.png" class="searchImg"/>
				</div>
				<input type="search" class="searchInput" onSearch="queryByKey(this.value);" onClick="hideAllDropdown();" placeholder="请输入搜索关键字"
					style="margin-left:5px; vertical-align: middle" />
				<div style="float: right;">
					<img src="${ctx}/static/weixin/images/activity/message.png" class="searchImg" style="float: right;" />
				</div>
			</div>
			
			<!-- 下拉列表 -->
			<div id="dropdown">
				<div class="dropdownContent">
					<div class="optionBtn selected" onClick="optionBtnClick(this)">不限</div>
					<div class="optionBtn" onClick="optionBtnClick(this)">进行中</div>
					<div class="optionBtn" onClick="optionBtnClick(this)">已结束</div>
				</div>
			</div>

			<div style="margin-top: 50px;"></div>
			
			<!-- 轮播图 -->
			<div class="flicker-example" data-block-text="false" style="height: 120px; margin-bottom: 10px;">
				<ul>
					<li style="background-image:url(${ctx}/static/weixin/images/investigation/BAN.jpg); background-size:100% 120px;"></li>
				</ul>
			</div>

			<!-- 列表内容 -->
			<div class="surveyList"></div>
		</div>

		<!-- 小火箭 -->
		<div id="tbox" onclick="location.href='#top';"></div>
		
		<!-- 底部选项卡 -->
		<div class="navigationBar">
			<ul>
				<c:set var="tokenLink" value="${ctx}/personalCenter/weixin/main,${ctx}/investigation/weixin/main,${ctx}/investigation/weixin/myList,javascript:void(0);"/>
				<c:set var="tokenData" value="shou,investigation_orange,wode,more"/>
				<c:forTokens var="token" varStatus="i" items="首页 找调查 我的调查 更多服务" delims=" ">
			    	 <li><a href="${tokenLink.split(',')[i.index]}" class="${i.index eq 3?'viewMore':''}">
						<div>
							<div class="navImage">
								<img src="${ctx}/static/weixin/images/investigation/${tokenData.split(',')[i.index]}.png" class="navigationImg" />
							</div>
							<div class="navTitle">${token}</div>
						</div>
					</a></li>
				</c:forTokens>
			</ul>
		</div>
	</div>
</body>
</html>
