<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>找产品</title>
<link href="${ctx}/static/weixin/css/show/industryDocking.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/show/jquery.bxslider.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/jquery.bxslider.js"></script>
<script src="${ctx}/static/script/jquery.lazyload.min.js"></script>
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

.hidebg {
	position: absolute;
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
    var date1=new Date();
	var pageNumber = 1;
	var search_id = "";

	$(function() {
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
			pager : true,
			infiniteLoop : isPager
		});

		for (var i=0; i<popCompany.length; i++) {
			var item = popCompany[i];
			getAjaxAttr(item.company_img_at);
		}
		
		//var index =0;
		//var timer = setInterval(function(){
		//	index = (index == 2) ? 0 : index + 1;     
		//	$(".asd").hide().eq(index).show();    
		//}, 3000);

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

		$('#tbox').hide();
		/* 异步加载找产品 */
		
		getproductList(1, "");
	})

	function searchResult() {
		$("#dropdown").css("display", "none");
		$(".hidebg").css("display", "none");
		$(".search").removeClass("colorDeep");
		var div = $("#searchOptions");
		if (div.css("display") == "none") {
			div.slideDown("fast");
			$(".hidebg").show();
		} else {
			div.slideUp("fast");
		}
	}

	/* 关键字搜索 */
	function queryByKey(key) {
		if ($(".searchInput").val() == "") {
			$("#searchOptions").slideUp("fast");
			return;
		}
		location.href = "${ctx}/show/main?isSearch=" + $(".searchInput").val();
	}

	function searchOptionClick(obj) {
		$(".optionBtn").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(obj).addClass("selected");
		$("#dropdown").slideUp("fast");
		$(".search").removeClass("colorDeep");
		$(".hidebg").css("display", "none");
		$(".searchInput").val($(obj).text());
		queryByKey($(obj).text());
	}

	function optionClick(obj) {
		$(".optionBtn").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(obj).addClass("selected");
		$("#dropdown").slideUp("fast");
		$(".search").removeClass("colorDeep");
		$(".hidebg").css("display", "none");
		pageNumber = 1;
		$('.industry_cont').empty();
		if ($(obj).attr("value") == null || $(obj).attr("value") == "") {
			search_id = "";
			getproductList(1, search_id);
		} else {
			search_id = $(obj).attr("value");
			getproductList(1, search_id, "1");
		}
	}

	var count = 0;
	$(document).ready(function() {
		if ('${fn:length(productList)}' <= 10) {
			$('#getmore').hide();
		} else {
			$('#getmore').show();
		}
		/* for (var i = 0; i < 10; i++) {
			$('#li_' + i).show();
		} */
	});

	//收藏
	function collectAction(producName, productId) {
		//取消收藏
		var status = $('#' + productId).attr("value");
		if (status == 1) {
			$.ajax({
						url : "${ctx}/show/json/delFromCollection",
						type : "get",
						data : {
							"productId" : productId,
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
								$('#' + productId)
										.attr("src",
												"${ctx}/static/weixin/images/logistics/notCollected.png");
								$('#' + productId).attr("value", "0");

							} else {
								layer.alert(infoN.errorMsg);
							}
						}
					});
			//添加收藏	
		} else {
			$
					.ajax({
						url : "${ctx}/show/json/addToCollection",
						type : "get",
						data : {
							"productName" : producName,
							"productId" : productId,
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
								$('#' + productId)
										.attr("src",
												"${ctx}/static/weixin/images/logistics/alreadyCollect.png");
								$('#' + productId).attr("value", "1");

							} else {
								layer.alert(infoN.errorMsg);
							}
						}
					});

		}

	}
    //异步加载找产品列表
	function getproductList(pageNum, id, isSearch) {
		$('#rebivateTip').hide();
		$.ajax({
					url : "${ctx}/show/json/main",
					type : "get",
					data : {
						"pageNumber" : pageNum,
						"parkId" : '${info.company_id}',
						"popularity" : "desc",
						"id" : id,
						"isSearch" : isSearch,
					},
					dataType : "json",
					success : function(result) {
						var date1=new Date();  //开始时间
						if (result.code == -1) {
							layer.alert((result.msg == null || result.msg == "") ? "网络连接错误"
											: result.msg);
						} else if (result.code == 2) {
							if ($('#rebivateTip').length > 0) {
								$('#rebivateTip').show();
								$("#getMore").hide();
							} else {
								$(".industry_cont")
										.append(
												'<span id="rebivateTip" class="renovateTitle" style = "line-height:23;color: #646464;margin-top: -27%;">暂无更多信息</span>');
								$("#getMore").hide();
							}
						} else {
							var list = result.value;
							var collect = result.jsonValue;
							var divWidth = document.body.clientWidth*0.48;
							for (var i = 10 * (pageNum - 1); i < 10
									* (pageNum - 1) + list.length; i++) {
								var info = list[i % 10];
								var _div = '<div class="industry_dataBar" onclick="view(\''
										+ info.id
										+ '\')" style="color: #5e5e5e;border-bottom: 1px solid #f6f6f6;position: relative;">';
								if (info.pic_url == null) {
									_div += '<img  src="${ctx}/static/weixin/images/show/advertise.png" width="100%;" height="'+divWidth+'px"/>';
								} else {
									_div += '<img  class="lazy" data-original="'
											+ info.pic_url
											+ '" width="100%;" height="'+divWidth+'px"/>';
								}
								_div += '<div style="text-align:left;font-size: 12px;height:40px;overflow: hidden; color: #5e5e5e;margin-bottom: 5px;">';

								if (info.product_name.length <= 19) {
									_div += '<span style="font-size: 14px;line-height:14px;color:#000;">'
											+ info.product_name + '</span>';
								} else {
									_div += '<span title="'+info.product_name+'" style="font-size: 14px;line-height:14px;color:#000;">'
											+ info.product_name
													.substring(0, 19)
											+ '...</span>';
								}

								_div += '</div><div style="margin-bottom: 5px;"><div class="industry_price" style="float: left;">￥'
										+ info.price
										+ '</div><div style="float: left;color:#5e5e5e;">/'+getUnit(info.order_unit)+'</div>';
								var id = info.id;
								if (collect[id] == 1) {
									_div += '<img id='
											+ info.id
											+ ' class="isCollectImg" value="1" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="float: right;margin-right: 5px;"onclick="event.cancelBubble = true;collectAction(\''
											+ info.product_name + '\',\''
											+ info.id + '\');">';
								} else {
									_div += '<img id='
											+ info.id
											+ ' class="isCollectImg" value="0" src="${ctx}/static/weixin/images/logistics/notCollected.png" width="20px;" height="20px;" style="float: right;margin-right: 5px;" onclick="event.cancelBubble = true;collectAction(\''
											+ info.product_name + '\',\''
											+ info.id + '\');">';
								}

								_div += '<div style="clear: both;"></div>';
								$(".industry_cont").append(_div);
							}
							$(".industry_cont").append(
									'<div style="clear:both;"></div>');
							if (result.code == 1) {
								$("#getMore").show();
							} else {
								$("#getMore").hide();
							}
						}
						//懒加载
						$(".lazy").lazyload({ 
							  placeholder : "${ctx}/static/image/loading.gif",
					                 effect: "fadeIn"
					          }); 
						var date2=new Date();    //结束时间
						var date3=date2.getTime()-date1.getTime();  //时间差的毫秒数
						alert(date3);	
					},
					error : function() {
						layer.alert("系统异常");
					}
				});
	}
	//产品详情
	function view(id) {
		window.location.href = "${ctx}/show/productDetails?id=" + id +"&type=1";
	}
	//下拉查看更多
	function getMore() {
		pageNumber++;
		getproductList(pageNumber, "");
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
	<form action="${ctx}/show/main" name="form" id="form" method="post">
		<input type="hidden" name="isSearch" class="isSearch" value="isSearch"></input>
		<input type="hidden" name="pageNumber" class="pageNumber" value="1"></input>
	</form>
	<div class="hidebg"></div>
	<div class="industry_main">
		<div class="industry_content">
			<div class="searchBar">
				<div class="search" style="width: 12%;">
					<img src="${ctx}/static/weixin/images/activity/sort.png" width="28px;" height="28px;" style="margin: 10px 6px;" />
				</div>
				<input type="search" class="searchInput" onsearch="queryByKey(this.value);" onClick="searchResult();" placeholder="输入关键字搜索"/>
				<input type="button" value="产业带" class="searchBtn"/>
				<div class="message" style="width: 12%;">
					<img src="${ctx}/static/weixin/images/logistics/comments.png" width="28px;" height="28px;" style="margin: 10px 4px;" />
				</div>
				<div style="clear: both;"></div>
			</div>
			<style>
			.searchInput {
				width:50%;
				padding:7px 0;
				margin-left: 1%;
				position:relative;
				top:8px;
				text-indent:1em;
				line-height: normal;
				line-height: 22px\9;
				outline:none;
				border-radius:20px;
				border:0;
			}
			.searchBtn {
				width:20%;
				background-color:#FF8927;
				color:#fff;
				padding:3px 0;
				margin-left: 2%;
				position:relative;
				top: 9px;
				text-align: center;
				outline:none;
				border-radius:20px;
				border:0;
			}
			</style>

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
					<div class="optionBtn selected" onClick="optionClick(this)">不限</div>
					<c:forEach items="${allRoot}" var="info">
						<div class="optionBtn" onClick="optionClick(this)" value="${info.id}">${info.name}</div>
					</c:forEach>
				</div>
			</div>

			<div style="margin-top: 70px;"></div>
			<div class="info_top">
				<div class="info_title">商铺推荐</div>
			</div>
			 <div class="slider1" style="text-align: center;max-height:138px;overflow:hidden;background-color:#fff;">
				<c:forEach items="${popCompany}" var="info">
					<div class="slide" style="float:left;width:100px;margin-right:6px;">
						<a  href="${ctx}/show/enterpriseProduct?companyId=${info.company_id}" style="text-decoration: none;"> 
							<img src="${ctx}/static/weixin/images/show/logo.png" width="70px;" height="70px;" class="slide_img ${info.company_img_at}" style ="margin-top:6%;border-radius:70px;">
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
						</a>
					</div>
				</c:forEach>

				<c:if test="${fn:length(popCompany) < '3'}">
					<c:forEach var="item" begin="${fn:length(popCompany)}" end="2">
						<div class="slide" style="text-align: center; height: 96px;">&nbsp;</div>
					</c:forEach>
				</c:if>
			</div> 
			<div class="info_top">
				<div class="info_title">热销商品</div>
			</div>
			<div class="industry_cont" style="text-align: center"></div>
		</div>
		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		<div id="tbox">
			<a id="gotop" href="#top"></a>
		</div>

		<div id="addToCollection"
			style="display: none; text-align: center; padding: 20px 0;">
			<div>产品已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--我的收藏</span>”进行查看
			</div>
			<div>
				<span id="seconds1">3</span>秒后自动关闭
			</div>
		</div>
		<div id="cancelCollection"
			style="display: none; text-align: center; padding: 20px 0;">
			<div>收藏已取消</div>
			<div>
				“<span style="color: #FF6707;">收藏的产品已取消</span>”
			</div>
			<div>
				<span id="seconds2">3</span>秒后自动关闭
			</div>
		</div>
		<div class="navigationBar">
			<ul>
				<li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/personalCenter/shou.png"
							width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">首页</div>
				</a></li>
				<li><a href="${ctx}/show/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/findProduct.png"
							width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">找产品</div>
				</a></li>
				<li><a href="${ctx}/show/findEnterprise">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/findEnterprised.png"
							width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">找企业</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/logistics/more.png"
							width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -137px;">
					<!-- <li style="border-bottom: 1px solid #E6E6E6;"><a href="javascript:;">留言处理</a></li>-->					
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myCollection">我的收藏</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myProduct">我的产品</a></li>
					<li><a href="javascript:;">企业介绍</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
