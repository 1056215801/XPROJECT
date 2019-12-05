<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的货源</title>
<link href="${ctx}/static/weixin/css/logistics/mySupply.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/logistics/sourceDetails.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<style>
body .layui-layer-tl_green .layui-layer-title {
	background-color: #00A85A;
	color: #fff;
	border: none;
}

body .layui-layer-bg_gray .layui-layer-content {
	background-color: #ebebeb;
}

body .layui-layer-bg_gray .layui-layer-btn0 {
	、 background-color: #00A85A;
	color: #FFF;
	text-align: center;
	padding: 5px 0;
	width: 100%;
	margin: 0;
}
</style>
<script>
	$(function() {
		$('#tbox').hide();//隐藏小火箭
		$('#getMore').hide();//隐藏加载更多 
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
	});
	function viewDetails(obj) {
		var infoa = obj.getAttribute("data");
		var info = jQuery.parseJSON(infoa);
		cargoDetail(info);
		ParentLayerIndex = layer.open({
			type : 1,
			shade : [ 0 ],
			skin : 'layui-layer-bg_gray',
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#supplyDetails'),
		});
	};
	/* 货源详情 */
	function cargoDetail(cargo) {
		var LimCarLengthStr = (cargo.LimCarLength1 != -1 ? cargo.LimCarLength1
				+ "米 " : "")
				+ (cargo.LimCarLength2 != -1 ? cargo.LimCarLength2 + "米 " : "")
				+ (cargo.LimCarLength3 != -1 ? cargo.LimCarLength3 + "米 " : "");
		$("#SrcName").html(cargo.SrcName); //出发地
		$("#DestName").html(cargo.DestName);//目的地
		$("#SubTypeName").html(cargo.SubTypeName);//货物类型
		$("#StrCount").html(cargo.StrCount);//数量
		$("#requireStr").html(cargo.requireStr);//需求车型
		$("#LimCarLength").html(LimCarLengthStr);//需求车长
		$("#StrPrice").html(cargo.StrPrice);//运费
		$("#Contact").html(cargo.Contact);//发货人
		$("#Phone").html(cargo.Phone);//联系电话
		$("#IsAuth").html((cargo.IsAuth == true) ? "个人认证" : "未认证");//认证情况
		$("#IsAuthImg").css('display',
				(cargo.IsAuth == true) ? "block" : "none");
		$("#CreateDt").html(cargo.CreateDt.split(".")[0].replace("T", " "));//发布时间
		matchCarList(cargo.Id);
	};
	/* 推荐车源 */
	function matchCarList(id) {
		var carList;
		try {
			carList = ${pushCarsList}
		} catch (e) {
		};
		if (carList == undefined) {
			return;
		}
		carListTmp = carList;
		//没有推荐车源时隐藏标题和滚动条
		//清空推荐货源列表
		$("#mySupplyMatch").empty();

		$("#matchTitle").css('display', carList.length == 0 ? "none" : "block");
		$("#scrollContent").css('overflow',
				carList.length == 0 ? "auto" : "scroll");
		for (var i = 0; i < carList.length; i++) {
			$("#reuseDivTop").css('margin-top', i == 0 ? '0' : '');
			$("#collection_a").attr('value', JSON.stringify(carList[i]));
			$("#collection_a").html("<img id=\""
									+ carList[i].Id
									+ "\" src=\"${ctx}/static/weixin/images/logistics/"
									+ (carList[i].isCollect == true ? "alreadyCollect.png\" "
											: "notCollected.png\" ")
									+ "width=\"20px;\" height=\"20px;\" style=\"margin: 10px 5px;\">");

			$("#CurPlace1").html(
					carList[i].CurPlace.length > 6 ? carList[i].CurPlace
							.substring(0, 5)
							+ "..." : carList[i].CurPlace);//出发地
			$("#CarTypeName").html(
					carList[i].CarTypeName == undefined ? "&nbsp"
							: carList[i].CarTypeName); //车型
			$("#CarLoadTypeName").html(
					carList[i].CarLoadTypeName == undefined ? "&nbsp"
							: carList[i].CarLoadTypeName);//装载类型
			$("#Name").html(carList[i].Name); //姓名						
			$("#IsCarAuth").css('display',
					carList[i].IsCarAuth == true ? 'block' : 'none');//是否车辆认证
			$("#CarLoad").html(carList[i].CarLoad + "吨");//载重
			$("#CarLength").html(
					carList[i].CarLength + "*" + carList[i].CarWidth + "米");//长宽
			$("#StrLocationDt").html(carList[i].StrLocationDt);//发布时间
			$("#reuseData").attr('name', i);
			$("#matchListPhone").attr('href', "tel:" + carList[i].Telphone);

			var divCopy = document.createElement("div");
			divCopy.innerHTML = $("#reuseDiv").html();
			$("#mySupplyMatch").append(divCopy);
		}
		$("#collection_a")
				.html("<img id=\""
						+ 0
						+ "\" src=\"${ctx}/static/weixin/images/logistics/alreadyCollect.png\""
						+ "width=\"20px;\" height=\"20px;\" style=\"margin: 10px 5px;\">");
	}
	/* 推荐车源详情 */
	function viewMatchDetails(i) {
		var info = carListTmp[i.name];
		showMatchDetails(info);
		layerIndex = layer.open({
			type : 1,
			shade : [ 0 ],

			//layer
			skin : 'layui-layer-bg_gray',
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#matchCarsDetail'),

		//layer_mobile
		// 					anim : 'up',
		// 					style : 'position:fixed; left:0; top:0; width:100%; height:100%; background-color: #ebebeb;',
		// 					content : $("#matchCarsDetail").html(),
		});
	};
	function showMatchDetails(carInfo) {
		detailInfo = carInfo;
		$("#MatchCurPlace").html(carInfo.CurPlace);//出发地
		$("#MatchName").html(carInfo.Name);//联系人
		$("#MatchTelphone").html(carInfo.Telphone);//联系电话
		$("#MatchPlateNum").html(carInfo.PlateNum);//车牌号
		$("#MatchIsCarAuth").html((carInfo.IsCarAuth == true) ? "车辆" : "未认证");//认证情况
		$("#MatchIsCarAuthImg").css('display',
				(carInfo.IsCarAuth == true) ? 'block' : 'none');
		$("#MatchCarTypeName").html(
				carInfo.CarTypeName == undefined ? "" : carInfo.CarTypeName);//车型
		$("#MatchCarLoadTypeName").html(
				carInfo.CarLoadTypeName == undefined ? ""
						: carInfo.CarLoadTypeName);//装载类型
		$("#MatchCarLength").html(
				"长" + carInfo.CarLength + "米 " + "宽" + carInfo.CarWidth + "米");//车长车宽
		$("#MatchCarLoad").html(carInfo.CarLoad + "吨");//载重  
		$("#MatchActiveDt").html(
				carInfo.ActiveDt.split(".")[0].replace("T", " "));//发布时间

		$("#collectDetail").attr('value', JSON.stringify(carInfo));
		$("#MatchisCollectImg").attr('src', $("#" + carInfo.Id).attr('src'));
		if ($("#MatchisCollectImg").attr('src').indexOf("alreadyCollect") > 0) {
			$("#MatchisCollect").html("已收藏");
		} else {
			$("#MatchisCollect").html("未收藏");
		}
		$("#matchDetailPhone1").attr('href', "tel:" + carInfo.Telphone);//拨打电话	
		$("#matchDetailPhone2").attr('href', "tel:" + carInfo.Telphone);
	}
	/* 返回货源详情 */
	function colseLayer() {
		layer.close(layerIndex);
	}
	/* 返回货源列表 */
	function backToList() {
		layer.close(ParentLayerIndex);
		//清空推荐货源列表
		$("#mySupplyMatch").empty();
	}
	var count = 0;
	$(document).ready(function() {
		if ('${fn:length(cargoList)}' <= 10) {
			$('#getmore').hide();
		} else {
			$('#getmore').show();
		}
		for (var i = 0; i < 10; i++) {
			$('#li_' + i).show();
		}
	});
	function getMore() {
		var a = ${cargoList};
		count++;
		var start = count * 10;
		for (var i = start; i < start + 10; i++) {
			$('#li_' + i).show();
		}
		if (start + 10 >= '${fn:length(cargoList)}') {
			$('#getmore').hide();
		}
		if (count == 100) {
			page();
		}
	}

	function page() {
		if ('${totalPage}' > '${Skip}') {
			var Skip = '${Skip}' + 1;
			$("#Skip").val(Skip);
		}
	}
	$(document).ready(
			function() {
				$(window)
						.scroll(
								function() {
									//$(document).scrollTop() 获取垂直滚动的距离
									//$(document).scrollLeft() 这是获取水平滚动条的距离
									if ($(document).scrollTop()
											+ $(window).height() > $(document)
											.height() - 1) {
										//alert("滚动条已经到达底部为" + $(document).scrollTop());
										setTimeout(function() {
											getMore();
										}, 1000);
									}
									if ($(document).scrollTop() > 0) {
										$('#tbox').show();
									} else {
										$('#tbox').hide();
									}
								});
			});

	/* 收藏车辆 */
	function addToCollection(obj) {
		var info = JSON.parse($(obj).attr('value'));
		collect1(info, "${ctx}");
	};

	function detailCollect(obj) {
		var info = JSON.parse($(obj).attr('value'));
		collect1(info, "${ctx}");
	};

	//发布货源选择
	function selectReleaseType() {
		layer.open({
			type : 1,
			title : '请选择发布的货源种类',
			skin : 'layui-layer-tl_gray',
			shadeClose : true,
			area : [ '240px', '285px' ],
			content : $('#selectReleaseType'),
			btn : '取消'
		});
	};
</script>
</head>

<body>
	<div id="mySupply" class="mySupply_main">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/logistics/mySupply0.png" width="15px;" height="15px;" style="margin: 7px 5px 0 10px;" /> <span
				style="position: absolute; top: 8px; color: #FFF;">我的货源</span>
		</div>
		<div style="padding-top: 40px;">
			<c:forEach items="${cargoList}" var="info" varStatus="status">
				<div id="li_${status.index}" class="contentBar" style="display: none;">
					<a href="javascript:;" data='${info}' onClick="viewDetails(this);" style="text-decoration: none;"> <img
						src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;"
						style="float: left; margin: 10px 5px;" />
						<div style="border-bottom: 1px solid #f6f6f6;">
							<div style="float: left; text-align: center; font-weight: bold; width: 30%;">
								<div style="color: #000; font-size: 17px; padding: 10px 0;">
									<c:choose>
										<c:when test="${fn:length(info.SrcName)>6}">
											${fn:substring(info.SrcName,0,6)}...
										</c:when>
										<c:otherwise>
								${info.SrcName}
							</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div style="float: left; text-align: center; width: 15%;">
								<div style="font-size: 12px; color: #969696;">${info.StrTypeCode}</div>
								<div style="font-size: 0;">
									<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;" />
								</div>
								<div style="font-size: 12px; color: #969696; margin-top: 3px; height: 22px;">${info.SubTypeName}</div>
							</div>


							<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;"
								style="float: left; margin: 10px 5px;" />
							<div style="float: left; text-align: center; font-weight: bold; width: 30%;">
								<div style="color: #000; font-size: 17px; padding: 10px 0;">

									<c:choose>
										<c:when test="${fn:length(info.DestName)>6}">
								${fn:substring(info.DestName,0,6)}...
							</c:when>
										<c:otherwise>
								${info.DestName}
							</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div style="clear: both;"></div>
						</div>

						<div>
							<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;"
								style="float: left; margin-top: 7px; border-radius: 70px;" />
							<div style="float: left; margin-left: 10px;">
								<div style="font-size: 15px; float: left; margin-top: 5px; margin-bottom: 2px; color: #000;">${info.Contact}</div>

								<!-- 以个人认证来判断 -->
								<%-- <c:if test="${info.IsAuth == 'true'}">
							<img src="${ctx}/static/weixin/images/logistics/authentication.png"
								width="35px;" height="12px;"
								style="margin-top: 9px; margin-left: 5px;" />
							</c:if> --%>

								<!-- 认证图标 -->
								<%-- <img src="${ctx}/static/weixin/images/logistics/authentication.png"
								width="35px;" height="12px;"
								style="margin-top: 9px; margin-left: 5px;" /> --%>

								<div style="clear: both;"></div>
								<div style="font-size: 13px;">
									<span style="background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;">${info.QuantityRange}${info.CountUnit}</span>
									<span style="background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;"> <c:choose>
											<c:when test="${info.LimCarLength1 == '-1.00'&&info.LimCarLength2 == '-1.00'&&info.LimCarLength3 == '-1.00'}">
                        		不限
                        	</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${info.LimCarLength1 }" pattern="#0.0" />
												<c:if test="${info.LimCarLength2!='-1.00'}">
                        			/<fmt:formatNumber value="${info.LimCarLength2 }" pattern="#0.0" />
												</c:if>
												<c:if test="${info.LimCarLength3!='-1.00'}">
                        			/<fmt:formatNumber value="${info.LimCarLength3 }" pattern="#0.0" />
												</c:if>
                        		米
                        	</c:otherwise>
										</c:choose>
									</span>
								</div>
							</div>
							<div style="float: right;">
								<div style="font-size: 12px; color: #969696; float: left; margin-top: 7px; margin-right: 37px;">${info.requireStr}</div>

								<a href="tel:${info.Phone} "> <img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;"
									height="40px;" style="margin-top: 6px;" />
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<div id="addToCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>车源已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--收藏车源</span>”进行查看
			</div>
			<div>
				<span id="seconds1">3</span>秒后自动关闭
			</div>
		</div>
		<div id="cancelCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>收藏已取消</div>
			<div>
				“<span style="color: #FF6707;">收藏的车源已取消</span>”
			</div>
			<div>
				<span id="seconds2">3</span>秒后自动关闭
			</div>
		</div>

		<div id="supplyDetails" class="details_main">
			<div class="fixed_top">
				<img src="${ctx}/static/weixin/images/logistics/carSourceDetails.png" width="20px;" height="20px;"
					style="margin: 3px 5px 0 10px;" /> <span style="position: absolute; top: 8px; color: #FFF;">货源详情</span>
			</div>

			<!-- 推荐车源 -->
			<div id="reuseDiv" hidden>
				<div id="reuseDivTop" class="contentBar">
					<a id="reuseData" href="javascript:;" onClick="viewMatchDetails(this);" style="text-decoration: none;">

						<div style="border-bottom: 1px solid #F4F4F4;">
							<img src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;"
								style="display: inline-block; vertical-align: middle;" />
							<div style="display: inline-block; vertical-align: middle; text-align: center; font-weight: bold; width: 40%;">
								<div id="CurPlace1" style="color: #000; font-size: 17px; padding: 10px 0;">西湖区</div>
							</div>

							<div style="display: inline-block; vertical-align: middle; text-align: center; width: 18%;">
								<div id="CarTypeName" style="font-size: 12px; color: #969696; margin-bottom: 0px;">单桥</div>
								<div style="font-size: 0;">
									<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;" />
								</div>
								<div id="CarLoadTypeName" style="font-size: 12px; color: #969696; margin-top: 0px;">普通</div>
							</div>

							<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;"
								style="display: inline-block; vertical-align: middle;" />
							<div style="display: inline-block; vertical-align: middle; text-align: center; font-weight: bold; width: 15%;">
								<div style="color: #000; font-size: 17px; padding: 10px 0;">全国</div>
							</div>
							<div style="clear: both;"></div>
						</div>

						<div>
							<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;"
								style="float: left; margin-top: 7px; border-radius: 70px;" />
							<div style="float: left; margin-left: 8px;">
								<div id="Name" style="font-size: 15px; float: left; margin-top: 5px; margin-bottom: 2px; color: #000;">肖宏远</div>
								<img id="IsCarAuth" src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;"
									style="margin-top: 9px; margin-left: 5px;" />
								<div style="clear: both;"></div>
								<div style="font-size: 13px;">
									<span id="CarLoad" style="background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;">17.55吨</span> <span
										id="CarLength" style="background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;">6.2*2.4米</span>
								</div>
							</div>
							<div style="float: right;">
								<div id="StrLocationDt" style="font-size: 12px; color: #969696; float: left; margin-top: 7px; margin-right: 3px;">刚刚</div>
								<a id="collection_a" href="javascript:void(0);" onClick="addToCollection(this);" style="text-decoration: none"> </a> <a
									id="matchListPhone"> <img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;" height="40px;"
									style="margin-top: 6px;" />
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>

					</a>
				</div>
			</div>
			<!-- end-->

			<div id="scrollContent" style="width: 100%; position: fixed; top: 40px; bottom: 40px; overflow: scroll">
				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">出发地</div>
						<div id="SrcName" class="details_right">江西南昌</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">目的地</div>
						<div id="DestName" class="details_right">江西萍乡</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">货物类型</div>
						<div id="SubTypeName" class="details_right">普通</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">数量</div>
						<div id="StrCount" class="details_right">6吨</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">需求车型</div>
						<div id="requireStr" class="details_right">不限</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">需求车长</div>
						<div id="LimCarLength" class="details_right">9.6米</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">运费</div>
						<div id="StrPrice" class="details_right">面议</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">发货人</div>
						<div id="Contact" class="details_right">聂晓辉</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">联系电话</div>
						<div id="Phone" class="details_right">18970000000</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore" hidden>
						<div class="details_left">认证情况</div>
						<div id="IsAuth" class="details_right">个人认证</div>
						<img id="IsAuthImg" src="${ctx}/static/weixin/images/logistics/identityAuth.png" width="20px;" height="20px;"
							style="float: left; margin-left: 5px;" />
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">发布时间</div>
						<div id="CreateDt" class="details_right">刚刚</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div id="matchTitle" class="mySupply_top">
					<div class="mySupply_title">推荐车源</div>
				</div>

				<div id="mySupplyMatch" style="margin-bottom: 20px"></div>

			</div>

			<div class="fixed_bottom">
				<a href="javascript:backToList();"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;"
					style="float: left; margin: 12px 10px;" />
				</a>
				<div style="clear: both;"></div>
			</div>
		</div>

		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>

		<div id="tbox">
			<a id="gotop" href="#top"></a>
		</div>
		<!-- 推荐车源详情 -->
		<div id="matchCarsDetail" class="details_main">
			<div class="fixed_top">
				<img src="${ctx}/static/weixin/images/logistics/carSourceDetails.png" width="20px;" height="20px;"
					style="margin: 3px 5px 0 10px;" /> <span style="position: absolute; top: 8px; color: #FFF;">车源详情</span>
			</div>
			<div style="padding-top: 0px; margin-bottom: 60px;">
				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">当前位置</div>
						<div id="MatchCurPlace" class="details_right">江西宜春丰城市</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">期望流向</div>
						<div class="details_right">全国</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">联系人</div>
						<div id="MatchName" class="details_right">曾国强</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">联系电话</div>
						<div id="MatchTelphone" class="details_right">18970008000</div>
						<a id="matchDetailPhone1"> <img src="${ctx}/static/weixin/images/logistics/phoned.png" width="20px;" height="20px;"
							style="float: left; margin-left: 5px;" />
						</a>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">车牌号</div>
						<div id="MatchPlateNum" class="details_right">赣CB0717</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">认证情况</div>
						<div id="MatchIsCarAuth" class="details_right">车辆</div>
						<img id="MatchIsCarAuthImg" src="${ctx}/static/weixin/images/logistics/carCertification.png" width="20px;" height="20px;"
							style="float: left; margin-left: 5px;" />
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">车型</div>
						<div id="MatchCarTypeName" class="details_right">单轿</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">装载类型</div>
						<div id="MatchCarLoadTypeName" class="details_right">普通</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">车长车宽</div>
						<div id="MatchCarLength" class="details_right">长5米 宽2.4米</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">载重</div>
						<div id="MatchCarLoad" class="details_right">15.2吨</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">发布时间</div>
						<div id="MatchActiveDt" class="details_right">2016-02-12 13:32:23</div>
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>
			<div class="fixed_bottom">
				<a href="javascript:colseLayer();"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;"
					style="float: left; margin: 12px 10px;" />
				</a> <a id="matchDetailPhone2">
					<div style="float: right; border-left: 1px solid #DCDCDC; padding: 0 10px;">

						<img src="${ctx}/static/weixin/images/logistics/phone.png" width="20px;" height="20px;" style="margin: 12px 0;" /> <span
							style="position: relative; bottom: 16px; color: #01A858;">拨打电话</span>
					</div>
				</a>
				<div style="float: right; border-left: 1px solid #DCDCDC; padding: 0 10px;">
					<a id="collectDetail" href="javascript:void(0);" onClick="detailCollect(this);" style="text-decoration: none"> <img
						id="MatchisCollectImg" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;"
						style="margin: 12px 0;" />
					</a> <span id="MatchisCollect" style="position: relative; bottom: 16px; color: #F04444;">已收藏</span>

				</div>
				<div style="clear: both;"></div>
			</div>
		</div>

		<div class="navigationBar">
			<ul>
				<!--<li><a href="javascript:;">
					<div class="navImage"><img src="images/carSource.png" width="20" height="20"/></div>
					<div class="navTitle">首页</div>
				</a></li>-->
				<li><a href="${ctx}/auth/page/mobile/weixin/logistics/zwb/weixin/main">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/riskLogistics/carSource.png" width="20" height="20" />
						</div>
						<div class="navTitle">物流服务</div>
				</a></li>
				<li><a href="javascript:;" onClick="selectReleaseType();">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/riskLogistics/releaseSupply.png" width="20" height="20" />
						</div>
						<div class="navTitle">发布货源</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/riskLogistics/mored.png" width="20" height="20" />
						</div>
						<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -137px;">
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logisticsInfo/mySupply">我的货源</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logisticsInfo/myCollection">我的收藏</a></li>
					<li><a href="${ctx}/logisticsInfo/incrementServices">增值服务</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 发布货源选择 -->
	<div id="selectReleaseType" style="display: none;">
		<a href="${ctx}/logisticsInfo/createSupply">
			<div class="releaseType_goods">
				<img src="${ctx}/static/weixin/images/riskLogistics/goods.png" width="43" height="29.3"> <span>货物运输</span>
			</div>
		</a> <a href="${ctx}/logistics/zwb/weixin/edit">
			<div class="releaseType_risk">
				<img src="${ctx}/static/weixin/images/riskLogistics/risk.png" width="43" height="29.3"> <span>危化运输</span>
			</div>
		</a>
	</div>
</body>
</html>
