<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>产品详情</title>

<link href="${ctx}/static/weixin/css/show/productDetails.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/show/jquery.bxslider.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/jquery.bxslider.js"></script>
<style>
body .layui-layer-tl_green .layui-layer-title {
	background-color: #06B8C2;
	color: #fff;
	border: none;
}

body .layui-layer-bg_gray .layui-layer-content {
	background-color: #ebebeb;
}

body .layui-layer-bg_gray .layui-layer-btn0 {
	background-color: #00A85A;
	color: #FFF;
	text-align: center;
	padding: 5px 0;
	width: 100%;
	margin: 0;
}

.slide_img {
	margin: 5px auto 8px;
}

.slide_name {
	width: 85px;
	margin: 0 auto 20px;
	font-size: 12px;
}
</style>
<script>
	$(function() {
		var type = ${type};
		if(type==2){
			 $('.bottom_operation').hide();
		}
		productId = ${info.id};
		/* 大图轮播 */
		var attList = ${attList};
		var isPager1 = attList.length >= 1;
		var isLoop = attList.length>1;
		$('.slider2').bxSlider({
			minSlides : 1,
			maxSlides : 1,
			slideWidth : $(document).width(),
			slideMargin : 0,
			captions : true,//自动控制 
			auto : isPager1,
			controls : false,//隐藏左右按钮 
			pager : isPager1,
			infiniteLoop : isLoop
		});
		
		/*推荐产品*/
		getSuggestProductList(1, 30);
		
		/* 推荐企业 */
		var b = $(document).width() > 320 ? 120 : 100;
		var popCompany = ${popCompany};
		var isPager2 = popCompany.length >= 3;
		var sliderController = $('.slider1').bxSlider({
			minSlides : 3,
			maxSlides : 3,
			slideWidth : b,
			slideMargin : ($(document).width() - 3 * b) / 2,
			captions : true,//自动控制 
			auto : true,
			controls : false,
			pager : true,
			infiniteLoop : isPager2
		});

		for (var i=0; i<popCompany.length; i++) {
			var item = popCompany[i];
			getAjaxAttr(item.company_img_at);
		}
	})

	/* 产品推荐  */
	suggestPageNum = 0;
	function getSuggestProductList(pageNum, pageSize) {
		$.ajax({
					url : "${ctx}/show/json/main",
					type : "get",
					data : {
						"pageNumber" : pageNum,
						"pageSize" : pageSize,
						"popularity" : "desc"
					},
					dataType : "json",
					success : function(result) {
						var list = result.value;
						var divWidth = document.body.clientWidth*0.49;
						if (result.code == 1 || result.code == 0) {
							suggestPageNum++;
							for (var i = pageSize * (pageNum - 1); i < pageSize
									* (pageNum - 1) + list.length; i++) {
								var info = list[i % pageSize];
								if(info.id!=productId){
									var _proList = '<a href="${ctx}/show/productDetails?id='
										+ info.id
										+ '&type=1" style="text-decoration: none;">'
										+ '<div class="slide"><div class="industry_dataBar" style="width:100%;padding:0 3px;" onclick="productDetail();">'
										+ '<img src="'
										+ info.pic_url
										+ '" width="100%;" height="'+divWidth+'px">'
										+ '<div style="font-size: 12px; font-weight: bold; color: #5e5e5e;height: 36px; overflow: hidden;">';
										if (info.product_name.length <= 19) {
											_proList += '<span style="font-size: 14px;line-height:14px;color:#000;">'
													+ info.product_name + '</span>';
										} else {
											_proList += '<span title="'+info.product_name+'" style="font-size: 14px;line-height:14px;color:#000;">'
													+ info.product_name
															.substring(0, 19)
													+ '...</span>';
										}
										_proList += '</div>'
										+ '<div><div class="industry_price" style="float: left; width: 42%; height: 20px; font-size: 12px; padding: 0; margin-top: 3px; text-align: center;">￥'
										+ info.price
										+ '</div><div style="float: left; margin-top: 3px; font-size: 12px;color:#5e5e5e;">/'+getUnit(info.order_unit)+'</div>'
// 										+ '<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="float: right;padding-right:5px;">'
										+ '<div style="clear: both;"></div></div></div></div></a>';
									$("#suggestProList").append(_proList);
								}
							}

							/* 推荐产品 */
							var a = ($(document).width() - 4) / 2;
						 	$('.slider0').bxSlider({
								pager : false,
								minSlides : 2,
								maxSlides : 2,
								slideWidth : a,
								slideMargin : ($(document).width() - 2 * a),
								captions : true,//自动控制 
								auto : true,
								controls : false,//隐藏左右按钮 
							});

						} else if (result.code == 2) {
							$("#proList").show();
						} else {
							layer.msg("获取数据失败");
						}
						if (result.code != 1) {
							$('#getMore').hide();
						}
					},
					error : function() {
						layer.alert("系统异常");
					}
				});
	}

	$(function() {
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
		$('#orderUnit').html(getUnit(${info.order_unit}));
		$('#storeUnit').html(getUnit(${info.store_unit}));
			
	});

	function collectAction() {
		var status = $("#collectImg").attr("value");
		if (status == "collected") {
			//取消收藏
			$
					.ajax({
						url : "${ctx}/show/json/delFromCollection",
						type : "get",
						data : {
							"productId" : "${info.id}",
						},
						dataType : "json",
						success : function(result) {
							var infoN = jQuery.parseJSON(result);
							if (infoN.success) {
								$('#seconds2').html(3);
								layer.open({
									type : 1,
									title : '提示',
									skin : 'layui-layer-tl_green',
									shadeClose : true,
									area : [ '250px', '150px' ],
									time : '3000',
									content : $('#cancelCollection'),
									success : function() {
										setTimeout(function() {
											$('#seconds2').html(2);
											setTimeout(function() {
												$('#seconds2').html(1);
											}, 1000);
										}, 1000);
									},
								});
								$("#collectImg")
										.attr("src",
												"${ctx}/static/weixin/images/logistics/notCollected.png");
								$("#isCollect").text("未收藏");
								$("#collectImg").attr("value", "notCollect");
							} else {
								layer.alert(infoN.errorMsg);
							}
						}
					});

		} else {
			//添加收藏
			$
					.ajax({
						url : "${ctx}/show/json/addToCollection",
						type : "get",
						data : {
							"productName" : "${info.product_name}",
							"productId" : "${info.id}",
							"type" : "1",
						},
						dataType : "json",
						success : function(result) {
							var infoN = jQuery.parseJSON(result);
							if (infoN.success) {
								$('#seconds1').html(3);
								layer.open({
									type : 1,
									title : '提示',
									skin : 'layui-layer-tl_green',
									shadeClose : true,
									area : [ '250px', '150px' ],
									time : '3000',
									content : $('#addToCollection'),
									success : function() {
										setTimeout(function() {
											$('#seconds1').html(2);
											setTimeout(function() {
												$('#seconds1').html(1);
											}, 1000);
										}, 1000);
									},
								});
								$("#collectImg")
										.attr("src",
												"${ctx}/static/weixin/images/logistics/alreadyCollect.png");
								$("#isCollect").text("已收藏");
								$("#collectImg").attr("value", "collected");
							} else {
								layer.alert(infoN.errorMsg);
							}
						}
					});
		}

	}
	
	/* 单位转换 */
	function getUnit(i){
		var unitMap = ${unitMap};
		return unitMap[i];
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
				if (result != null) {
					if (result[0] && result[0].attachmentUrl) {
						$("." + ids).each(function (index, item) {
							$(item).attr("src", result[0].attachmentUrl);
						});
					} else {
						if (result.value && result.value[0] && result.value[0].attachmentUrl) {
							$("." + ids).each(function (index, item) {
								$(item).attr("src", result.value[0].attachmentUrl);
							});
						} else {
							$("." + ids).each(function (index, item) {
								$(item).attr("src", "${ctx}/static/weixin/images/show/logo.png");
							});
						}
					}
				} else {
					$("." + ids).each(function (index, item) {
						$(item).attr("src", "${ctx}/static/weixin/images/show/logo.png");
					});
				}
			}
		});
	}
</script>
</head>

<body>
	<div class="details_main" style="margin-bottom: 46px;">
		<div class="details_content">
			<div class="slider2" style="height:300px;overflow:hidden;">
				<c:if test="${empty attList}">
					<img class ="img" src="${info.pic_url}" width="100%;"  style="display: block;">
				</c:if>
				<c:forEach items="${attList}" var="info">
					<img class ="img"  src="${info.file_url}" width="100%;"  style="display: block;">
				</c:forEach>
			</div>
			    <script>
				$(function() {
		        var divWidth = document.body.clientWidth*1;
		        $('#img').height(divWidth);})
                </script>
			<div class="details_dataBar_1">
				<div class="details_dataTitle" style="color: #000;">
				${info.product_name}
				<%-- <c:choose>
				<c:when test="${fn:length(info.product_name)>30}">
				${fn:substring(info.product_name,0,30)}...
				</c:when>
				<c:otherwise>
				${info.product_name}
				</c:otherwise>
				</c:choose> --%>
				</div>
				<c:choose>
					<c:when test="${info.price eq '0'|| empty info.price}">
						<div class="details_price">面议</div>
					</c:when>
					<c:otherwise>
						<div class="details_price">￥${info.price}</div>
					</c:otherwise>
				</c:choose>
				
				<div style="clear: both;"></div>
				<div>${info.price_desc}</div>
				<div class="details_dataAttr">起批量</div>
				<div class="details_dataVal" style="width: 27%; margin-left: 5px;">>=${info.order_num}<span id="orderUnit">件</span></div>
				<div class="details_dataAttr">库存</div>
				<div class="details_dataVal" style="width: 27%">${info.store}<span id="storeUnit">件</span></div>
				<div style="clear: both;"></div>
				<div class="details_dataAttr" style="margin-top: 5px;">产品分类</div>
				<div class="details_dataVal" style="margin-top: 5px;">${categoryName eq undefined?"&nbsp;":categoryName}</div>
				<div style="clear: both;"></div>
			</div>
			<div class="details_dataBar_2">
				<div class="details_dataAttr">企业名称</div>
				<%-- <c:choose>
					<c:when test="${info.companyImgAt eq undefined}">
						<img src="${ctx}/static/weixin/images/activity/headPortrait.png" width="15px;" height="15px;"
							style="float: left; padding-top: 2px;">
					</c:when>
					<c:otherwise>
						<img src="${info.companyImgAt}" width="15px;" height="15px;" style="float: left; padding-top: 3px;">
					</c:otherwise>
				</c:choose> --%>
				<div class="details_dataVal">${info.company_name eq undefined?"&nbsp;":info.company_name}</div>
				<div class="details_dataAttr" style="margin-top: 5px;">联系电话</div>
				<div class="details_dataVal" style="margin-top: 5px;">${tel eq undefined?"&nbsp;":tel}</div>
				<div class="details_dataAttr" style="margin-top: 5px;">经营地址</div>
				<div class="details_dataVal" style="margin-top: 5px;">${address eq undefined?"&nbsp;":address}</div>
				<div class="details_dataAttr" style="margin-top: 5px;">园区所在地</div>
 				<div class="details_dataVal" style="margin-top: 5px;">${provinceName eq undefined?"&nbsp;":provinceName}${areaName eq undefined?"&nbsp;":areaName}</div>
				<div style="clear: both;"></div>
			</div>
			<div class="info_top">
				<div class="info_title">产品详情</div>
			</div>
			<div style="width: 96%;padding: 7px 2%; background-color: #fff; left: 0; right: 0; overflow: auto;">${info.description}</div>

			<div class="info_top">
				<div class="info_title">产品推荐</div>
			</div>

			<div id="suggestProList" class="slider0"></div>

			<div class="info_top">
				<div class="info_title">企业推荐</div>
			</div>
			<div class="slider1">
				<c:forEach items="${popCompany}" var="info">
					<a href="${ctx}/show/enterpriseProduct?companyId=${info.company_id}" style="text-decoration: none;">
						<div class="slide" style="text-align: center;">
							<c:choose>
								<c:when test="${info.companyImgAt eq undefined}">
									<img src="${ctx}/static/weixin/images/show/logo.png" width="70px;" height="70px;" class="slide_img ${info.company_img_at}" style ="margin-top:10%;border-radius:70px">
								</c:when>
								<c:otherwise>
									<img src="${info.companyImgAt}" width="70px;" height="70px;" class="slide_img" style ="margin-top:6%">
								</c:otherwise>
							</c:choose>
							<div class="slide_name" style="color: #5e5e5e;line-height:16px;">
							 <c:choose>
										<c:when test="${fn:length(info.company_name)>11}">
											${fn:substring(info.company_name,0,11)}...
										</c:when>
										<c:otherwise>
											${info.company_name}
										</c:otherwise>
							 </c:choose>
							</div>
						</div>
					</a>
				</c:forEach>

				<c:if test="${fn:length(popCompany) < '3'}">
					<c:forEach var="item" begin="${fn:length(popCompany)}" end="2">
						<div class="slide" style="text-align: center; height: 96px;">&nbsp;</div>
					</c:forEach>
				</c:if>

			</div>
		</div>

		<div id="addToCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>产品已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--我的收藏</span>”进行查看
			</div>
			<div>
				<span id="seconds1">3</span>秒后自动关闭
			</div>
		</div>
		<div id="cancelCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>收藏已取消</div>
			<div>
				“<span style="color: #FF6707;">收藏的产品已取消</span>”
			</div>
			<div>
				<span id="seconds2">3</span>秒后自动关闭
			</div>
		</div>
		<div class="fixed_bottom">
			<a href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a>
			
			 
	
			<div class="bottom_operation">
				<a href="javascript:void(0);" onClick="collectAction(this);" data='${info}' style="text-decoration: none"> <c:choose>
					<c:when test="${isCollect==1}">
						<img id="collectImg" class="collected" value="collected" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png"
							width="20px;" height="20px;" style="margin: 10px 0;">
						<span id="isCollect" style="position: relative; bottom: 16px; color: #F04444;">已收藏</span>
					</c:when>
					<c:otherwise>
						<img id="collectImg" class="collected" value="notCollect" src="${ctx}/static/weixin/images/logistics/notCollected.png"
							width="20px;" height="20px;" style="margin: 10px 0;">
						<span id="isCollect" style="position: relative; bottom: 16px; color: #F04444;">未收藏</span>
					</c:otherwise>
					</c:choose>
				</a>
			</div>
			
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>
