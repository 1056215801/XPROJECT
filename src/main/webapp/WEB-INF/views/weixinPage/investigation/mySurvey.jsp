<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的调查</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<link href="${ctx}/static/weixin/css/investigation/mySurvey.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<script>
	$(function() {
		/* 切换类型 */
		$(".titleName ul li").each(
				function() {
					var index = $(this).index();
					$(".titleName ul li").eq(0).addClass("titleClick");
					$(this).click(
							function() {
								$(this).addClass("titleClick").siblings()
										.removeClass("titleClick");
								$(".titleItem>div").eq(index).stop(true).show()
										.siblings().stop(true).hide();
								$("#listDiv").html("");
								if (index == 0) {//我参与的
									$("#type").val("3");
									getList(1, 3, "", [ -1, 1 ]);
								} else if (index == 1) {//我发布的
									$("#type").val("2");
									getList(1, 2, "", [ -1, 1 ]);
								}
							})
				});
		
		/* 我发布的标识 */
		var url = location.search;
		if (url.indexOf("?se=2") != -1) {
			$(".titleName ul li")[1].click();
		}else{
			getList(1, 3, "", [ -1, 1 ]);
			$("#type").val(3);
		}

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
	});

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
						if (result.code == -1) {
							layer.alert(result.msg);
						} else if (result.code == 2) {
							layer.msg(result.msg);
						} else {
							var list = result.value;
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = "";
								if (type == 2) {//我发布的2
									_div += "<a href=\"${ctx}/investigation/weixin/report/"+info.id+"\" style=\"text-decoration:none;\">";
								} else {
									_div += "<a href=\"${ctx}/investigation/weixin/detailResultOfWx/"+info.id+"\" style=\"text-decoration:none;\">";
								}
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
								_div += "</div></a>";
								$("#listDiv").append(_div);
							}

							if (result.code == 1) {
								//加载更多
								var moreStr = "";
								moreStr += "<div id=\"getMore\" style=\"margin:0 1.6% 10px;\">";
								moreStr += "<a href=\"javascript:void(0);\" onclick=\"getMore();\" class=\"renovate\">";
								moreStr += "<span class=\"renovateTitle\" style=\"color: #120F0F;\">加载更多</span>";
								moreStr += "</a>";
								moreStr += "</div>";
								$(moreStr).appendTo($("#listDiv"));
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
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y + M + D + h + m + s);
	}

	//加载更多数据
	function getMore() {
		$("#getMore").remove();
		var pageNum = Number($("#pageNum").val()) + 1;
		$("#pageNum").val(pageNum);
		getList(pageNum, $("#type").val(), "", [ -1, 1 ]);
	}
</script>
</head>

<body>
	<!-- 数据页数&类型 -->
	<input type="hidden" id="pageNum" name="pageNum" value="1"> 
	<input type="hidden" id="type" name="type">
	
	<div class="mySur_main">
		<div class="mySur_content">
			<!-- 类型选项卡 -->
			<div class="titleSwitch">
				<div class="titleName">
					<ul>
						<li style="border-radius: 15px 0 0 15px;"><a href="javascript:;">我参与的</a></li>
						<li style="border-radius: 0 15px 15px 0;"><a href="javascript:;">我发布的</a></li>
					</ul>
					<div style="clear: both;"></div>
				</div>
			</div>
			<!-- 列表内容 -->
			<div class="titleItem">
				<div id="listDiv"></div>
			</div>
		</div>

		<!-- 小火箭 -->
		<div id="tbox" onclick="location.href='#top';"></div>

		<!-- 底部选项卡 -->
		<div class="navigationBar">
			<ul>
				<c:set var="tokenLink" value="${ctx}/personalCenter/weixin/main,${ctx}/investigation/weixin/main,${ctx}/investigation/weixin/myList,javascript:void(0);"/>
				<c:set var="tokenData" value="shou,investigation,wode_orange,more"/>
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
