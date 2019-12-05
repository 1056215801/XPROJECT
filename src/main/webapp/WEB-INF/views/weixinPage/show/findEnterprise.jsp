<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>找企业</title>
<link href="${ctx}/static/weixin/css/show/findEnterprise.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<style type="text/css">
.hidebg {
	position: fixed;
	left: 0px;
	top: 0px;
	background-color: #000;
	width: 100%; /*宽度设置为100%，这样才能使隐藏背景层覆盖原页面*/
	height: 100%;
	filter: alpha(opacity = 60); /*设置透明度为60%*/
	opacity: 0.6; /*非IE浏览器下设置透明度为60%*/
	display: none;
	z-Index: 2;
}
</style>
<script>
	$(function() {
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
					url : "${ctx}/show/json/findEnterprise",
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
								_divList += '<a href="${ctx}/show/enterpriseProduct?companyId='
										+ info.company_id
										+ '" style="text-decoration: none;">'
										+ '<div style="margin:0 15px; padding:10px 0; font-size:12px; border-bottom:1px solid #e6e6e6; position:relative;">';
								if (info.company_img_at == null || info.company_img_at ==undefined) {
									_divList += ('<img id="' + info.company_img_at + '1" src="${ctx}/static/weixin/images/show/logo.png" width="25%;" height="'+divWidth+'px" style="float:left; margin-right:5%;border-radius:70px">');
								} else {
									_divList += ('<img id="' + info.company_img_at + '1" width="25%;" height="'+divWidth+'px" style="float:left; margin-right:5%;border-radius:70px">');
								}


								_divList += '<div style="float:left;width:70%;padding-top:3px;">'
										+ '<div style="font-weight:bold; margin:5px 0; color:#5e5e5e;font-size: 14px;">'
										+ '<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">'
										+ info.company_name
										+ '</div><div style="line-height:15px;"><div style="color:#646464; margin:5px 0;">经营地址：'
										+ ((info.operation_address == null || info.operation_address==undefined) ? '&nbsp;': info.operation_address)
										+ '</div>'
										+ '<div style="color:#646464; margin:5px 0;">经营业务：';
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

								/* var _divGrid = '<a href="${ctx}/show/enterpriseProduct?companyId='
										+ info.company_id
										+ '" style="text-decoration: none;">'
										+ '<div class="entProduct_dataBar" style="color: #5e5e5e; border-bottom: 1px solid #e6e6e6; height:155px;overflow:hidden;">'
										+ '<div style="text-align: center;">';
								if (info.company_img_at == null) {
									_divGrid += ('<img id="' + info.company_img_at + '2" src="${ctx}/static/weixin/images/show/logo.png" height="70px;" width="70px" style="vertical-align: middle;">');
								} else {
									_divGrid += ('<img id="' + info.company_img_at + '2" height="70px;" width="70px" style="vertical-align: middle;">');
								}
								_divGrid += '</div><div style="float: left; width: 100%; padding-top: 3px;font-size:12px;">'
										+ '<div style="font-weight: bold; margin: 5px 0; color: #5e5e5e;text-align:center;font-size:14px;">'
										+ '<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">'
										+ info.company_name
										+ '</div></div><div style="line-height:15px;"><div style="color: #646464; margin: 0 3px;">经营地址：'
										+ info.operation_address
										+ '</div><div style="color: #646464; margin: 0 3px;">'
										+ '经营业务：<span>'
										+ (info.biz_service == undefined ? '&nbsp;'
												: info.biz_service.length <= 5 ? info.biz_service
														: info.biz_service
																.substring(0, 4)
																+ "...")
										+ '</span></div></div>'
										+ '<div style="padding-bottom: 5px;">'
										+ '</div></div></a>';
								$("#gridView").append(_divGrid); */

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
	/*viewType = 0//0为listView 1为gridView
	function changeViewType() {
		if (findEnterpriseCount > 0) {
			$(document).scrollTop(0);//切换试图回到顶部
			if (viewType == 0) {
				$('#listView').hide();
				$('#gridView').show();
				viewType = 1;
				$('#changeView').attr("src",
						"${ctx}/static/weixin/images/show/block.png");
			} else {
				$('#gridView').hide();
				$('#listView').show();
				viewType = 0;
				$('#changeView').attr("src",
						"${ctx}/static/weixin/images/show/list.png");
			} 
		}
	} */

	function searchResult() {
		$("#dropdown").css("display", "none");
		$(".search").removeClass("colorDeep");
		var div = $("#searchOptions");
		if (div.css("display") == "none") {
			div.slideDown("fast");
			$(".hidebg").css("display", "block");
		} else {
			div.slideUp("fast");
			$(".hidebg").css("display", "none");
		}
	}

	/* 点击热搜关键字按钮 */
	function infoBtnClick(){
		queryByKey("");
		$('#searchHotBar').hide();
		$('#topDistance').css("margin-top","50px");
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
	function optionClick(obj, i, id) {
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

	/* 产业带  */
	function industrialBelt() {
		LayerIndex = layer.open({
			type : 1,
			title : false,
			skin : 'layui-layer-bg_gray',
			shade : [ 0 ],
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			zIndex : 1001,
			content : $('#industrialBelt')
		});
		selectType(1);
	}

	/* 产业带类型 */
	selectedType = 0;
	function selectType(i) {
		if (selectedType != 0) {
			$('#sign' + selectedType).css("display", "none");
		} else {
			$('#sign1').css("display", "none");
		}
		$('#sign' + i).css("display", "block");
		selectedType = i;
	}

	/* 产业带地区 */
	selectedDistruct = 0;
	function selectDistruct(i) {
		if (selectedDistruct != 0) {
			$('#distruct' + selectedDistruct).removeClass(
					"industrialBeltDistructed");
			$('#distruct' + selectedDistruct)
					.addClass("industrialBeltDistruct");
		} else {
			$('#distruct1').removeClass("industrialBeltDistructed");
			$('#distruct1').addClass("industrialBeltDistruct");
		}
		$('#distruct' + i).removeClass("industrialBeltDistruct");
		$('#distruct' + i).addClass("industrialBeltDistructed");
		selectedDistruct = i;
	}

	/* 产业带搜索 */
	function industrialBeltSearch(obj) {
		queryByKey(obj.innerHTML);
		$('#seachKeyInput').val(searchKey);
		layer.close(LayerIndex);
	}

	/* 产业带地图 */
	function industrialBeltMap(obj) {
		var str = obj.innerHTML;
		str = str.split("产业带")[0];
		queryByKey(str);
		$('#seachKeyInput').val(searchKey);
		layer.close(LayerIndex);
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
				if (result != null && result!=undefined) {
					if (result[0] != null && result[0].attachmentUrl != null) {
						$('#' + result[0].attachmentId + '1').attr('src', result[0].attachmentUrl + '');
						$('#' + result[0].attachmentId + '2').attr('src', result[0].attachmentUrl + '');
					} else {
						if(result.value!=undefined){
							if (result.value[0] && result.value[0].attachmentUrl) {
								$('#' + result.value[0].attachmentId + '1').attr('src', result.value[0].attachmentUrl + '');
								$('#' + result.value[0].attachmentId + '2').attr('src', result.value[0].attachmentUrl + '');
							}
						}
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
				<div class="search" style="width: 12%;">
					<img src="${ctx}/static/weixin/images/activity/sort.png" width="28px;" height="28px;" style="margin: 10px 6px;"/>
				</div>
				<input id="inputBox" type="search" class="searchInput" onClick="searchResult();" onSearch="queryByKey(this.value);" placeholder="输入关键字搜索" style="margin-left: 3px;"/>
				<div class="home_position">
					<img src="${ctx}/static/weixin/images/personalCenter/map.png" width="15px" height="15px" style="vertical-align:middle;">
					<span class="home_add">全国</span>
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


			<div id="changeViewBar" class="findEnterp_operBar" style="margin-top: 60px;">
				<div style="width: 25%; color: #06B8C2;" class="findEnterp_oper borRight">全国</div>
				<div style="width: 74%;" class="findEnterp_oper"></div>
				<%-- <div style="width: 17%;" class="findEnterp_oper borLeft" onclick="changeViewType();" style="display:none;">
					 <img id="changeView" src="${ctx}/static/weixin/images/show/list.png" width="20px;" height="20px;"
						style="display: none; margin: 0 auto;">
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
							<img src="${ctx}/static/weixin/images/personalCenter/shou.png"
								width="20px;" height="20px;" style=" margin-top: 6%"/>
						</div>
						<div style="margin-top: 8%;font-size: 12px">首页</div>
				</a></li>
				<li><a href="${ctx}/auth/page/mobile/weixin/show/main">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/show/findProduct1.png"
								width="20px;" height="20px;" style=" margin-top: 6%"/>
						</div>
						<div style="margin-top: 8%;font-size: 12px">找产品</div>
				</a></li>
				<li><a href="${ctx}/show/findEnterprise">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/show/findEnterprise.png"
								width="20px;" height="20px;" style=" margin-top: 6%"/>
						</div>
						<div style="margin-top: 8%;font-size: 12px">找企业</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/logistics/more.png"
								width="20px;" height="20px;" style=" margin-top: 6%"/>
						</div>
						<div style="margin-top: 8%;font-size: 12px">更多服务</div>
				</a></li>
			</ul>
				<div id="viewMore">
					<ul style="margin-top: -137px;">
<!-- 						<li style="border-bottom: 1px solid #E6E6E6;"><a href="javascript:;">留言处理</a></li>
 -->						<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myCollection">我的收藏</a></li>
						<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myProduct">我的产品</a></li>
						<li><a href="javascript:;">企业介绍</a></li>
					</ul>
				</div>
			</div>
	</div>

	<!-- 产业带页面 -->
	<div id="industrialBelt" style="display: none;">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/show/findProducted.png" width="20px;" height="20px;"> <span>产品带</span>
		</div>

		<div style="position: fixed; top: 0px; bottom: 0px; overflow: scroll;">
			<div class="info_top" style="margin-top: 65px;">
				<div class="info_title" style="width: 50%; left: 25%;">热门产地源头好货</div>
			</div>

			<div style="width: 100%; height: 95px; background-color: #fff; padding: 10px 0 0 0;">
				<div class="industrialBeltType_btn" onclick="selectType(1);">
					<img src="${ctx}/static/weixin/images/show/food.png" class="industrialBeltType_img">
					<div style="text-align: center; font-weight: bold;">食品饮料</div>
					<div id="sign1" class="industrialBeltSign_up"></div>
				</div>
				<div class="industrialBeltType_btn" onclick="selectType(2);">
					<img src="${ctx}/static/weixin/images/show/clothing.png" class="industrialBeltType_img">
					<div style="text-align: center; font-weight: bold;">服装纺织</div>
					<div id="sign2" class="industrialBeltSign_up"></div>
				</div>
				<div class="industrialBeltType_btn" onclick="selectType(3);">
					<img src="${ctx}/static/weixin/images/show/medicine.png" class="industrialBeltType_img">
					<div style="text-align: center; font-weight: bold;">生物医药</div>
					<div id="sign3" class="industrialBeltSign_up"></div>
				</div>
				<div class="industrialBeltType_btn" onclick="selectType(4);">
					<img src="${ctx}/static/weixin/images/show/electronics.png" class="industrialBeltType_img">
					<div style="text-align: center; font-weight: bold;">电子信息</div>
					<div id="sign4" class="industrialBeltSign_up"></div>
				</div>
			</div>

			<div style="width: 100%; height: 150px; background-color: #ebebeb; margin-top: 10px;">
				<button id="distruct1" class="industrialBeltDistructed" style="margin-left: 2%;" onclick="selectDistruct(1);">
					<div>南昌食品</div>
					<div>产业带</div>
				</button>
				<button id="distruct2" class="industrialBeltDistruct" onclick="selectDistruct(2);">
					<div>泰合食品</div>
					<div>产业带</div>
				</button>
				<button id="distruct3" class="industrialBeltDistruct" onclick="selectDistruct(3);">
					<div>赣州食品</div>
					<div>产业带</div>
				</button>
				<div style="width: 96%; height: 90px; background-color: #fff; margin: 0 2%;">
					<div style="width: 100%; padding-top: 10px;">
						<button class="industrialBeltDetailType" onclick="industrialBeltSearch(this);">果汁</button>
						<button class="industrialBeltDetailType" onclick="industrialBeltSearch(this);">碳酸饮料</button>
						<button class="industrialBeltDetailType" onclick="industrialBeltSearch(this);">卤制</button>
						<button class="industrialBeltDetailType" onclick="industrialBeltSearch(this);">饼干</button>
					</div>
					<div style="width: 100%; padding-top: 10px;">
						<button class="industrialBeltDetailType" onclick="industrialBeltSearch(this);">饮用水</button>
						<button class="industrialBeltDetailType" onclick="industrialBeltSearch(this);">零食</button>
						<button class="industrialBeltDetailType" onclick="industrialBeltSearch(this);">坚果</button>
						<button class="industrialBeltDetailType" onclick="industrialBeltSearch(this);">凉茶</button>
					</div>
				</div>

			</div>

			<div style="width: 100%; height: 95px; background-color: #fff; padding: 10px 0 0 0;">
				<div class="industrialBeltType_btn" style="margin-left: 5%;" onclick="selectType(5);">
					<div id="sign5" class="industrialBeltSign_down"></div>
					<img src="${ctx}/static/weixin/images/show/manufacture.png" class="industrialBeltType_img">
					<div style="text-align: center; font-weight: bold;">机械制造</div>

				</div>
				<div class="industrialBeltType_btn" onclick="selectType(6);">
					<div id="sign6" class="industrialBeltSign_down"></div>
					<img src="${ctx}/static/weixin/images/show/chemical.png" class="industrialBeltType_img">
					<div style="text-align: center; font-weight: bold;">冶炼化工</div>
				</div>
				<div class="industrialBeltType_btn" onclick="selectType(7);">
					<div id="sign7" class="industrialBeltSign_down"></div>
					<img src="${ctx}/static/weixin/images/show/energy.png" class="industrialBeltType_img">
					<div style="text-align: center; font-weight: bold;">新能源</div>
				</div>
				<div class="industrialBeltType_btn" onclick="selectType(8);">
					<div id="sign8" class="industrialBeltSign_down"></div>
					<img src="${ctx}/static/weixin/images/show/material.png" class="industrialBeltType_img">
					<div style="text-align: center; font-weight: bold;">新材料</div>
				</div>
			</div>

			<div class="info_top" style="margin-top: 16px;">
				<div class="info_title" style="width: 30%; left: 35%;">产业带地图</div>
			</div>

			<div style="width: 100%; height: 100px; background-color: #fff; padding: 10px 0 0 0; margin-bottom: 60px;">
				<div style="width: 100%; padding-top: 10px;">
					<button class="industrialBeltMap" onclick="industrialBeltMap(this);">南昌市产业带</button>
					<button class="industrialBeltMap" onclick="industrialBeltMap(this);">永修县产业带</button>
					<button class="industrialBeltMap" onclick="industrialBeltMap(this);">宜春市产业带</button>
				</div>
				<div style="width: 100%; padding-top: 15px;">
					<button class="industrialBeltMap" onclick="industrialBeltMap(this);">抚州市产业带</button>
					<button class="industrialBeltMap" onclick="industrialBeltMap(this);">景德镇市产业带</button>
					<button class="industrialBeltMap" onclick="industrialBeltMap(this);">赣州市产业带</button>
				</div>
			</div>
		</div>
		<div class="navigationBar">
			<ul>
				<li><a href="${ctx}/auth/page/mobile/weixin/show/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/findProduct1.png" width="20px;" height="20px;" />
					</div>
					<div class="navTitle">找产品</div>
				</a></li>
				<li><a href="${ctx}/show/findEnterprise">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/findEnterprise.png" width="20px;" height="20px;" />
					</div>
					<div class="navTitle">找企业</div>
				</a></li>
				<li><a>
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/releaseProducted.png" width="20px;" height="20px;" />
					</div>
					<div class="navTitle">发布产品</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/logistics/more.png" width="20px;" height="20px;" />
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>		
			<div id="viewMore">
				<ul style="margin-top: -137px;">
<!-- 				<li style="border-bottom: 1px solid #E6E6E6;"><a>留言处理</a></li> -->
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myCollection">我的收藏</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myProduct">我的产品</a></li>
					<li><a href="javascript:;">企业介绍</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
