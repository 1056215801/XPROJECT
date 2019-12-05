<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>企业</title>
<link href="${ctx}/static/weixin/css/supply/findEnterprise.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />

<script>
	/* 初始化 */
	$(function() {
		/* 类别菜单 */
		$(".search").click(function() {
			$("#searchOptions").css("display", "none");
			var div = $("#dropdown");
			if (div.css("display") == "none") {
				div.slideDown("fast");
				$(".search").addClass("colorDeep");
				$(".hidebg").css("display", "block");
			} else {
				div.slideUp("fast");
				$(".search").removeClass("colorDeep");
				$(".hidebg").css("display", "none");
			}
		});
		
		/* 更多服务 */
		$(".viewMore").click(function() {
			var ul = $("#viewMore ul");
			if (ul.css("display") == "none") {
				ul.slideDown("fast");
			} else {
				ul.slideUp("fast");
			}
		});
		$("#viewMore ul li a").click(function() {
			$("#viewMore ul").hide();
		});

		$('#gridView').hide();
		$("#proList").hide();
		$('#tbox').hide();
		$('#searchHotBar').hide();
		
		/* 异步加载找企业 */
		getfindEnterprise(1, "");
		
	})

	typeId = "";//企业类型
	searchKey = "";//搜索关键字
	/* 异步加载找企业*/
	findEnterpriseCount = 0;
	pageNumber = 1;
	function getfindEnterprise(pageNum) {
		$.ajax({
					url : "${ctx}/supply/json/findEnterprise",
					type : "get",
					data : {
						"pageNumber" : pageNum,
						"searchKey" : searchKey,
						"categoryId" : typeId
					},
					dataType : "json",
					success : function(result) {
						var list = result.value;
						var divwidth = document.body.clientWidth;
						var divWidth = (divwidth-30)*0.25;
						if (result.code == 1 || result.code == 0) {
							findEnterpriseCount += list.length;
							for (var i = 10 * (pageNum - 1); i < 10
									* (pageNum - 1) + list.length; i++) {
								var info = list[i % 10];
								var _divList = "";

								_divList += '<a href="${ctx}/supply/enterpriseSupplyDemand?companyId='
										+ info.company_id
										+ '" style="text-decoration: none;">'
										+ '<div style="margin:0 15px; padding:10px 0; font-size:12px; border-bottom:1px solid #e6e6e6; position:relative;">';

								if (info.company_img_at == null) {
									_divList += '<img id="' + info.company_img_at + '1" src="${ctx}/static/weixin/images/show/logo.png" width="25%;" height="'+divWidth+'px" style="float:left; margin-right:5%;border-radius:70px">';
								} else {
									_divList += '<img id="' + info.company_img_at + '1" width="25%;" height="'+divWidth+'px" style="float:left; margin-right:5%;border-radius:70px">';
								}
								

								_divList += '<div style="float:left;width:70%;padding-top:3px;">'
										+ '<div style="font-weight:bold;margin:5px 0;color:#5e5e5e;font-size:14px;">'
										+ '<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">'
										+ info.company_name
										+ '</div><div style="line-height:15px;"><div style="color:#646464; margin:5px 0;">经营地址：'
										+ (info.province_name == undefined ? '&nbsp;'
												: info.province_name)
										+ (info.area_name == undefined ? '&nbsp;'
												: info.area_name)
										+ (info.space_name == undefined ? '&nbsp;'
												: info.space_name)
										+ '</div>'
										+ '<div style="color:#646464; margin:5px 0;">经营范围：';
								if (info.biz_service == undefined) {
									_divList += '<span>' + "&nbsp;" + '</span>';
								} else if (info.biz_service.length <= 5) {
									_divList += '<span>' + info.biz_service
											+ '</span>';
								} else {
									_divList += '<span title="'+info.biz_service+'">'
											+ info.biz_service.substring(0, 4)
											+ '...</span>';
								}
								_divList += '</div></div></div><div style="clear: both;"></div></a></div>';
								$("#listView").append(_divList);

								var _divGrid = '<a href="${ctx}/supply/enterpriseSupplyDemand?companyId='
										+ info.company_id
										+ '" style="text-decoration: none;">'
										+ '<div class="entProduct_dataBar" style="color: #5e5e5e; border-bottom: 1px solid #f6f6f6; height:170px;overflow:hidden;">'
										+ '<div style="text-align: center;">';

								if (info.company_img_at == null) {
									_divGrid += '<img id="' + info.company_img_at + '2" src="${ctx}/static/weixin/images/show/logo.png" height="70px;" style="vertical-align: middle;">';
								} else {
									_divGrid += '<img id="' + info.company_img_at + '2" height="70px;" style="vertical-align: middle;">';
								}

								_divGrid += '</div><div style="float: left; width: 100%; padding-top: 3px;font-size:12px;">'
										+ '<div style="font-weight: bold; margin: 5px 0; color: #5e5e5e;text-align:center;font-size:14px;">'
										+ '<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">'
										+ info.company_name
										+ '</div></div><div style="line-height:15px;"><div style="color: color:#646464; margin: 0 3px;">经营地址：'
										+ (info.province_name == undefined ? '&nbsp;'
												: info.province_name)
										+ (info.area_name == undefined ? '&nbsp;'
												: info.area_name)
										+ (info.space_name == undefined ? '&nbsp;'
												: info.space_name)
										+ '</div><div style="color: color:#646464; margin: 0 3px;">'
										+ '经营范围：<span>'
										+ (info.biz_service == undefined ? '&nbsp;'
												: info.biz_service.length <= 5 ? info.biz_service
														: info.biz_service
																.substring(0, 4)
																+ "...")
										+ '</span></div></div>'
										+ '<div style="padding-bottom: 5px;">'
										+ '</div></div></a>';
								$("#gridView").append(_divGrid);

								getAjaxAttr(info.company_img_at);
							}
							$("#proList").hide();
						} else if (result.code == 2) {
							$("#proList").show();
						} else {
							$("#proList").hide();
							layer.msg("获取数据失败");
						}
						if (result.code != 1) {
							$('#getMore').hide();
						} else {
							$('#getMore').show();
						}
					},
					error : function() {
						layer.alert("系统异常");
					}
				});
	}
	/* 加载更多 */
	function getMore() {
		pageNumber++;
		getfindEnterprise(pageNumber);
	}

	/* gridView视图切换先注释 */
	/* viewType = 0//0为listView 1为gridView
	function changeViewType() {
		if (findEnterpriseCount > 0) {
			$(document).scrollTop(0);//切换试图回到顶部
			if (viewType == 0) {
				$('#listView').hide();
				$('#gridView').show();
				viewType = 1;
				$('#changeView').attr("src",
						"${ctx}/static/weixin/images/show/list.png");
			} else {
				$('#gridView').hide();
				$('#listView').show();
				viewType = 0;
				$('#changeView').attr("src","${ctx}/static/weixin/images/show/block.png");
			}
		}
	} */
	
	function searchResult() {
		$("#dropdown").css("display", "none");
		$(".hidebg").css("display", "none");
		$(".search").removeClass("colorDeep");
		var div = $("#searchOptions");
		if (div.css("display") == "none") {
			div.slideDown("fast");
		} else {
			div.slideUp("fast");
		}
	}
	
	/* 点击热搜关键字按钮 */
	function infoBtnClick(){
		$("#searchHotBar").hide();
		$("#topDistance").css("margin-top","50px");
		queryByKey("");
		$("#inputBox").val("");
	}

	/* 搜索热搜关键字 */
	function searchOptionClick(obj) {
		$(".optionBtn").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(obj).addClass("selected");
		$("#dropdown").slideUp("fast");
		$(".search").removeClass("colorDeep");
		$(".hidebg").css("display", "none");
		$(".searchInput").val($(obj).text());
		$("#searchHot").html($(obj).text());
		$("#searchHotBar").show();
		$("#topDistance").css("margin-top","100px");
		queryByKey($(obj).text());
	}
	
	/* 企业类别按钮点击 */
	function optionClick(obj, i,id) {
		$(".optionBtn").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(obj).addClass("selected");
		findEnterpriseCount = 0;
		pageNumber = 1;
		$("#listView").empty();
		$("#gridView").empty();
		$('#getMore').hide();
		if (i == 1) {
			typeId = "";
		} else {
			typeId = id;
		}
		searchKey = $('#inputBox').val();
		getfindEnterprise(1);
		
		$("#dropdown").slideUp("fast");
		$(".search").removeClass("colorDeep");
		$(".hidebg").css("display", "none");
	}

	/* 关键字搜索 */
	function queryByKey(key) {
		$("#searchOptions").slideUp("fast");
		$("#listView").empty();
		$("#gridView").empty();
		$('#getMore').hide();
		findEnterpriseCount = 0;
		pageNumber = 1;
		searchKey = key;
		getfindEnterprise(1);
		if(key!="" && key!=null){
			$("#searchHot").html(key);
			$("#searchHotBar").show();
			$("#topDistance").css("margin-top","100px");
		}
		$(".hidebg").css("display", "none");
	}

	function getAjaxAttr(ids) {
		if (ids == null) {
			return;
		}
		var url = "${ctx}/ajaxGetAtts";
		if ('${parkId}' == '0') {
			url = "${ctx}/show/json/ajaxGetAtts";
		}
		$.ajax({
			url : url,
			type : "get",
			data : {
				"attIds" : ids,
			},
			dataType : "json",
			success : function(result) {
				if (result && result[0]) {
					if (result[0].attachmentUrl != null && result[0].attachmentUrl) {
						$('#' + ids + '1').attr('src', result[0].attachmentUrl + '');
						$('#' + ids + '2').attr('src', result[0].attachmentUrl + '');
					}
				} else {
					if (result && result.value && result.value[0] && result.value[0].attachmentUrl) {
						$('#' + ids + '1').attr('src', result.value[0].attachmentUrl + '');
						$('#' + ids + '2').attr('src', result.value[0].attachmentUrl + '');
					}
				}
			}
		});
	}
</script>
</head>

<body>
	<div class="hidebg"></div>
	<div class="findEnterp_main">
		<div class="findEnterp_content">
			<div class="searchBar">
				<div class="search">
					<img src="${ctx}/static/weixin/images/activity/sort.png" width="28px;" height="28px;" style="margin: 14px 12px;margin-top:10px;" />
				</div>
				<input id="inputBox" type="search" class="searchInput" onClick="searchResult();" onSearch="queryByKey(this.value);"
					placeholder="请输入搜索关键字" style="margin-left: 5px;height:30px; line-height:30px;vertical-align:middle;outline:none;"/>
				<div class="message">
					<img src="${ctx}/static/weixin/images/logistics/comments.png" width="28px;" height="28px;" style="margin: 14px 12px;margin-top:10px;" />
				</div>
				<div style="clear: both;"></div>
			</div>
			
			<div id="searchOptions">
				<div style="font-size: 16px; padding: 6px 10px;">关键字</div>
				<div class="options_1" style="background-color: #FFF; padding: 5px 12px;">
					<c:forEach items="${keys}" var="info">
						<div class="optionBtn" onClick="searchOptionClick(this)" value="${info.keys}">${info.keys}</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
			
			<div id="dropdown">
				<div class="dropdownContent">
					<div id="typeAll" class="optionBtn selected" onclick="optionClick(this,1)">不限</div>
					<c:forEach items="${rootNodes}" var="info">
						<div class="optionBtn" onclick="optionClick(this,2,'${info.industry_id}')">${info.industry_name}</div>
					</c:forEach>	
				</div>
			</div>
			
			<div id="topDistance" style="margin-top: 50px;"></div>
			<div id="searchHotBar" class="info_top">
				<div class="infoBtn" onclick="infoBtnClick();" style="position:relative"><span id="searchHot">螺旋</span>
				<img src="/XProject/static/weixin/images/show/close.png" width="10px;" height="10px;" style="position:absolute;top:-5px;right:-5px;"></div>
			</div>

			<div style="margin-top: 60px;"></div>
			<div class="findEnterp_operBar">
				<div style="width: 20%; color: #FDC006;font-weight:bold;" class="findEnterp_oper borRight">全国</div>
				<div style="width: 64%;" class="findEnterp_oper"></div>
				<%-- <div style="width: 15%;" class="findEnterp_oper borLeft" onclick="changeViewType();">
					<img id="changeView" src="${ctx}/static/weixin/images/show/block.png" width="20px;" height="20px;"
						style="display: block; margin: 0 auto;">
				</div> --%>
				<div style="clear: both;"></div>
			</div>

			<div style="background-color: #fff;">
				<div class="entProduct_cont">
					<div id="gridView"></div>
					<div style="clear: both;"></div>
				</div>
				<div id="listView"></div>
				<div style="text-align: center;">
					<span id="proList" class="renovateTitle">暂无企业</span>
				</div>
			</div>
		</div>

		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		<div id="tbox">
			<a id="gotop" href="#top"></a>
		</div>

		<div class="navigationBar">
			<ul>
				<li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/supply/homepage.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">首页</div>
				</a></li>
				<li><a href="${ctx}/auth/page/mobile/weixin/supply/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/supply/demandSupply.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">供应需求</div>
				</a></li>
				<li><a href="${ctx}/supply/findEnterprise">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/supply/findEnterprise_yellow.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">企业</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/logistics/more.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -95px;">
					<!-- <li style="border-bottom:1px solid #E6E6E6;"><a href="myLeaveAMessage.html">我的留言</a></li> -->
					<li style="border-bottom:1px solid #E6E6E6;"><a href="${ctx}/supply/myCollection">我的收藏</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/supply/mySupplyDemand">我的供需</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
