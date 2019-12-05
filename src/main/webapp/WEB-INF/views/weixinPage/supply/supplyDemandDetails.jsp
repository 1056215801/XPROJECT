<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>供需详情</title>
<link href="${ctx}/static/weixin/css/supply/supplyDemandDetails.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/supply/jquery.bxslider.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/jquery.bxslider.js"></script>
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<style>
body .layui-layer-tl_green .layui-layer-title {
	background-color: #FDC006;
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
		var type=${type};
		if(type==2){
			$('.bottom_operation').hide();
		}
		/*推荐供需*/
			getSuggestProductList(1, 30);
		/* 推荐企业 */
		var b = $(document).width() > 320 ? 120 : 100;
		var popCompany = ${popCompany};
		var isPager = popCompany.length >= 3;
		$('.slider1').bxSlider({
			minSlides : 3,
			maxSlides : 3,
			slideWidth : b,
			slideMargin : ($(document).width() - 3 * b) / 2,
			captions : true,//自动控制 
			auto : true,
			controls : false,
			pager : isPager
		});
	})

	/* 供需推荐  */
	suggestPageNum = 0;
	function getSuggestProductList(pageNum, pageSize) {
		$
				.ajax({
					url : "${ctx}/supply/json/main",
					type : "get",
					data : {
						"pageNumber" : pageNum,
						"pageSize" : pageSize,
						"popularity" : "desc"
					},
					dataType : "json",
					success : function(result) {
						var list = result.value;
						var address = result.jsonValue1;
						var divWidth = document.body.clientWidth*0.495;
						if (result.code == 1 || result.code == 0) {
							suggestPageNum++;
							for (var i = pageSize * (pageNum - 1); i < pageSize
									* (pageNum - 1) + list.length; i++) {
								var info = list[i % pageSize];
								if ('${info.id}' == info.id) {
									continue;
								}
								var _proList = '<a href="${ctx}/supply/productDetails?id='
										+ info.id
										+ '&type=1" style="text-decoration: none;">'
										+ '<div class="slide"><div class="industry_dataBar" style="width:100%;padding:0 3px;" onclick="productDetail();">'
										+ '<img src="'
										+ info.pic_url
										+ '" width="100%;" height="'+divWidth+'px">'
										+ '<div style="font-size: 12px; font-weight: bold; color: #5e5e5e;height: 36px; overflow: hidden;text-align:left">';
										if (info.product_name.length <= 19) {
											_proList += '<span>'
											+ info.product_name + '</span>';
								        } else {
								        	_proList += '<span title="'+info.product_name+'">'
											+ info.product_name
													.substring(0, 20)
											+ '...</span>';
								        }
										_proList+='</div>'
										+ '<div><div class="industry_price" style="float: left; width: 42%; height: 20px; font-size: 12px; padding: 0; margin-top: 3px; text-align: center;">';
										var id=info.id;
										if(address[id]==undefined || address[id]=='null null'){
											_proList+='暂无地址';
										}else{
											_proList+=address[id];
										}
										_proList+= '</div><div style="clear: both;"></div></div></div></a>';
								$("#suggestProList").append(_proList);
							}

							/* 推荐产品 */
							var a = ($(document).width() - 4) / 2;
							sliderController = $('.slider0').bxSlider({
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
</script>
</head>

<body>
	<div class="details_main">
		<div class="details_content">
			<img class=img  src="${info.pic_url}" width="100%;"  style="display: block;">
			   <script>
				$(function() {
		        var divWidth = document.body.clientWidth*1;
		        $('#img').height(divWidth);})
                </script>
			<div class="details_dataBar_1">
				<div class="details_data">
					<c:choose>
						<c:when test="${info.type eq 1}">
							<img src="${ctx}/static/weixin/images/supply/give.png" width="20px;" height="20px;">
						</c:when>
						<c:otherwise>
							<img src="${ctx}/static/weixin/images/supply/need.png" width="20px;" height="20px;">
						</c:otherwise>
					</c:choose>

					<div class="details_dataTitle" style="margin-left:7px; width:88%;">${info.product_name}</div>
				</div>
				<div class="details_dataAttr">类别</div>
				<div class="details_dataVal">${categoryName}</div>
				<div class="details_add">
				<c:choose>
				   <c:when test="${address eq undefined || address eq 'null null' }">
					暂无地址
					</c:when>
					<c:otherwise>
					${address}
					</c:otherwise>
				</c:choose>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div class="details_dataBar_2">
				<div class="details_dataAttr">企业名称</div>
				<div class="details_dataVal">${info.company_name}</div>
				<div class="details_dataAttr">联系人</div>
				<div class="details_dataVal">${info.contact_name}</div>
				<div class="details_dataAttr">联系电话</div>
				<div class="details_dataVal">${info.contact_phone}</div>
				<div style="clear: both;"></div>
			</div>
			<div class="info_top">
				<div class="info_title">供需详情</div>
			</div>
			<div style="width: 96%; padding: 7px 2%; background-color: #fff; left: 0; right: 0; overflow: auto;">${info.description}</div>

			<div class="info_top">
				<div class="info_title">供需推荐</div>
			</div>

			<div id="suggestProList" class="slider0"></div>

<!-- 			<div class="industry_cont"> -->
<!-- 				<div class="industry_dataBar"> -->
<!-- 					<img src="images/field.jpg" width="100%;" height="150px;"> -->
<!-- 					<div style="font-size: 12px; color: #5e5e5e;">江中猴菇饼干15天装720g猴头菇饼干苏醒代餐曲奇饼...</div> -->
<!-- 					<div> -->
<!-- 						<div class="industry_price" style="float: left;">江西&nbsp;南昌</div> -->
<!-- 						<img src="images/notCollected.png" width="20px;" height="20px;" style="float: right;"> -->
<!-- 						<div style="clear: both;"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div style="clear: both;"></div> -->
<!-- 			</div> -->

<!--			<div class="info_top">
				<div class="info_title">企业推荐</div>
			</div>  -->

<!--			<div class="slider1">
				<c:forEach items="${popCompany}" var="info">
					<a href="${ctx}/supply/enterpriseSupplyDemand?companyId=${info.company_id}" style="text-decoration: none;">
						<div class="slide" style="text-align: center;">
							<c:choose>
								<c:when test="${info.companyImgAt eq undefined}">
									<img src="${ctx}/static/weixin/images/show/logo.png" width="70px;" height="70px;" class="slide_img">
								</c:when>
								<c:otherwise>
									<img src="${info.companyImgAt}" width="70px;" height="70px;" class="slide_img">
								</c:otherwise>
							</c:choose>
							<div class="slide_name" style="color: #5e5e5e;">${info.company_name}</div>
						</div>
					</a>
				</c:forEach>

				<c:if test="${fn:length(popCompany) < '3'}">
					<c:forEach var="item" begin="${fn:length(popCompany)}" end="2">
						<div class="slide" style="text-align: center; height: 96px;">&nbsp;</div>
					</c:forEach>
				</c:if>
			</div> -->
		</div>
		
		<div id="addToCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>供需已收藏</div>
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
				“<span style="color: #FF6707;">收藏的供需已取消</span>”
			</div>
			<div>
				<span id="seconds2">3</span>秒后自动关闭
			</div>
		</div>

		<div class="fixed_bottom">
			<a href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a>
			<a href="tel:${info.contact_phone}">
			<div class="bottom_operation">
				<img src="${ctx}/static/weixin/images/logistics/phone.png" width="20px;" height="20px;" /> <span class="spanContral_1"
					style="color: #00A452;">拨打电话</span>
			</div>
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
			<div class="bottom_operation">
				<img src="${ctx}/static/weixin/images/logistics/comments.png" width="20px;" height="20px;" />
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>
