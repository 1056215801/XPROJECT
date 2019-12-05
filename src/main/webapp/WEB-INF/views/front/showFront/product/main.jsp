<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>产业对接-首页</title>
<link href="${ctx}/static/css/product/industryDocking.css" rel="stylesheet" />
<link href="${ctx}/static/css/projectHeader2.css" rel="stylesheet" />
<link href="${ctx}/static/css/projectFooter.css" rel="stylesheet" />

<link rel="stylesheet" href="${ctx}/static/js/plugins/nivo-slider/themes/default/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${ctx}/static/js/plugins/nivo-slider/themes/light/light.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${ctx}/static/js/plugins/nivo-slider/themes/dark/dark.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${ctx}/static/js/plugins/nivo-slider/themes/bar/bar.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${ctx}/static/js/plugins/nivo-slider/nivo-slider.css" type="text/css" media="screen" />
<link href="${ctx}/static/css/projectDeclare/buttons.css" rel="stylesheet" />

<!--<link rel="stylesheet" href="./nivo-slider/style.css" type="text/css" media="screen" />-->
<style>
.slider-wrapper {
	margin: 0 auto;
	width: 100%;
}

.nivoSlider {
	margin-bottom: 0 !important;
	box-shadow: none !important;
}

.nivo-controlNav {
	display: none;
}

.nivo-caption {
	text-align: center;
	background-color: #efefef;
	padding: 0;
}
.buttonBar {
	padding:5px 0;
	text-align:center;
}
.buttonImg {
	position:relative;
	top:-2px;
	margin-right:10px;
}
.buttonContral {
	width:95%;
	border-radius:7px;
	height:70px!important;
	color:#f14241!important;
	font-size:26px!important;
	font-weight:bold!important;
	padding:10px 0!important;
}


.select2-container .select2-choice {
    border-radius: 4px;
    border: 1px solid #e1e1e1;
    background-color: #fff;
    background-image: linear-gradient(to top, #fff 0%, #fff 50%);
}
.select2-drop-active {
    border: 1px solid #e1e1e1;
}
.select2-container .select2-choice .select2-arrow {
    border-left: 0px solid #aaa;
    border-radius: 0 4px 4px 0;
    background-image: linear-gradient(to top, #fff 0%, #fff 60%);
} 
.productDisplayPrice {
    float: left;
    background-color: #FFF;
    color: #F14240;
    padding: 0 4px 0 2px;
    margin-right: 2px;
}
</style>
</head>

<body>
	<div class="industry_main">
		<div class="project_header">
			<%@ include file="../../common/header.jsp"%>
		</div>
		<div class="industry_content">
			<input type="hidden" id="pageNum" name="pageNum" value="1">
			<input type="hidden" id="industryId" name="industryId" value="">
			<input type="hidden" id="orderType" name="orderType" value="0">
			
		
			<!-- 导航菜单栏  -->
			<div class="yHeader">
				<div class="yNavIndex">
					<div class="pullDown">
						<h2 class="pullDownTitle">产业分类</h2>
						<ul class="pullDownList">
							<c:forEach items="${industryList.parentList}" var="info" varStatus="i">
								<c:if test="${i.index<10}">
									<li onclick="selectByIndustryId('${info.typeId}','${info.typeName}')">
										<i class="listi${i.index+1 }"></i> <a href="javascript:void(0)">${info.typeName}</a>
										<span></span>
									</li>
								</c:if>
								<c:if test="${i.index>=10}">
									<li onclick="selectByIndustryId('${info.typeId}','${info.typeName}')" style="display: none;">
										<i class="listi${i.index+1 }"></i> <a href="javascript:void(0)">${info.typeName}</a>
										<span></span>
									</li>
								</c:if>
							</c:forEach>
							<div class="pullDownListMore">
								<span class="caret_red_down"></span>
							</div>
						</ul>
						<!-- 下拉详细列表具体分类 -->
						<%-- <div class="yMenuListCon">
							<c:forEach items="${industryList.parentList}" var="parent" varStatus="i">
								<div class="yMenuListConin">
									<div class="yMenuLCinList">
										<h3>
											<a href="" class="yListName">
											<div style="display: inline-block; width: 7px; height: 7px; background-color: #000; margin-right: 5px;"></div>${parent.typeName}</a>
										</h3>
										<p>
											<c:forEach items="${industryList.childList}" var="child">
												<c:if test="${child.parentId==parent.typeId }">
													<a href="#industryCont"
														onclick="selectByIndustryId('${child.typeId}','${info.typeName}')">${child.typeName }</a>
												</c:if>
											</c:forEach>
										</p>
									</div>
								</div>
							</c:forEach>
						</div> --%>
						<!-- 下拉详细列表具体分类 -->
					</div>
				</div>
			</div>
			<!-- 导航菜单栏  -->

			<div id="wrapper">
				<div class="slider-wrapper theme-default">
					<div id="slider" class="nivoSlider">
						<img src="${ctx}/static/image/product/CarouselFigure1.jpg" /> 
						<img src="${ctx}/static/image/product/CarouselFigure2.jpg" />
					</div>
				</div>
			</div>

			<div id="industryCont" class="industry_cont clearfix">
				<div class="industry_contLeft">
					<div class="titleName clearfix">
						<ul>
							<li><a href="javascript:;">全部产品</a></li>
							<li style="display: none"><a href="javascript:;">我发布的</a></li>
						</ul>
						<div class="searchBar">
							<input type="text" id="searchKey" name="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;"/>
							<img src="${ctx}/static/image/product/sea.png" width="15" onclick="search()">
						</div>
					</div>
					<div class="titleItem">
						<div>
							<div class="productScreenBar clearfix">
							
								<div class="screenMode" id="all">综合</div>
								<div class="sortOrder" id="popularityButton">人气<span id="popularityPic"></span></div>
								<div class="sortOrder" id="priceButton">价格<span id="pricePic"></span></div>
								
								<div class="MOQScreen">
									<span>起订</span>
									<input type="text" id="orderNumMin" name="orderNumMin" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)' maxlength="8"> 
									<span>-</span>
									<input type="text" id="orderNumMax" name="orderNumMax" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)' maxlength="8">
								</div>
								
								<div class="selectBar">
									<select id="loc_province" style="width: 120px;margin-left: 10px; top: 2px;"></select> 
									<select id="loc_city" style="width: 120px; margin-left: 10px; top: 2px;"></select> 
									<input type="hidden" id="provinceName" name="provinceName" value="">
									<input type="hidden" id="areaName" name="areaName" value="">
								
									<div class="areaSearchBtn" onclick="search()" style="float: right; margin-right: 7%;">搜索</div>
								</div>
								
								
							</div>
							
							<div class="dividingLine"></div>
							
							<div style="overflow: hidden;">
								<div id="industryBar" style="display: none; float: left; background-color: #ffeded; border: 1px solid #f14241; color: #f14241; padding: 3px 7px; font-size: 12px;">
									<span id="industryName"></span> 
									<img src="${ctx}/static/image/product/x.png" style="cursor: pointer;border-radius: 50%" onclick="deleteIndustryId()">
								</div>
							</div>
							
							<div class="productDisplayBar clearfix" id="productList"></div>
							<div id="moreList" style="margin: 10px 0; background-color: #f7f7f7;" onclick="getMore()">
								<a href="javascript:void(0);" class="renovate"><span
									class="renovateTitle">加载更多</span>
								</a>
							</div>
							
						</div>

						<div style="display: none;">此处为我发布的区域</div>
					</div>
				</div>

				<div class="industry_contRight">
					<div class="buttonBar">
						<button class="button button-raised buttonContral" onClick="publish()">
							<img src="${ctx}/static/image/logistics/goods.png" width="30" height="30" class="buttonImg">发布产品
						</button> 
					</div> 
					<div class="productSideBar">
						<div class="productSideTop">
							<div class="productSideTopTitle">热门企业推荐</div>
						</div>
						<div class="enterpriseRecommendBar">
							<c:if test="${companyList==null || companyList==''}">
								<div style="width: 100%; text-align: center; padding: 100px 0;">
									<span class="renovateTitle">暂无更多信息</span>
								</div>
							</c:if>
							<c:if test="${companyList!=null && companyList!=''}">
								<c:forEach items="${companyList}" var="info">
									<a href="javascript:;">
										<div class="enterpriseRecommend" title="${info.companyName}">
											<c:choose>
												<c:when test="${empty info.logoUrl}">
													<img src="${ctx}/static/weixin/images/show/logo.png" width="100%" heigth="80px" style="border-radius: 50%;">
												</c:when>
												<c:otherwise>
													<img class="downloadImg" id="${info.companyId}" src="${info.logoUrl}"
														width="100%" height="80px" style="border-radius: 50%;">
												</c:otherwise>
											</c:choose>
											<div style="font-size: 12px; height: 35px; margin-top: 5px;">
												<c:choose>
													<c:when test="${fn:length(info.companyName)>13}">
														${info.companyName.substring(0,13)}...
													</c:when>
													<c:otherwise>
														${info.companyName}
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</a>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="productSideBar">
						<div class="productSideTop">
							<div class="productSideTopTitle">热门产品推荐</div>
						</div>
						<div class="productRecommendBar" id="popProduct">
							<c:forEach items="${pushProductList}" var="info" varStatus="i">
								<c:if test="${i.index < 3}">
									<div class="productRecommend clearfix">
										<div onclick="view('${info.id}')">
											<c:choose>
												<c:when test="${empty info.picUrl}">
													<img src="${ctx}/static/weixin/image/product/defaultImage.png" width="110" height="110" style="float: left;" />
												</c:when>
												<c:otherwise>
													<img src="${info.picUrl}" width="110" height="110" style="float: left;" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="productRecommendName" style="font-size: 16px;overflow: hidden;" title="${info.productName}">
										<c:choose>
											<c:when test="${fn:length(info.productName)>10}">
												${info.productName.substring(0,10)}...
											</c:when>
											<c:otherwise>
												${info.productName}
											</c:otherwise>
										</c:choose>
										</div>
										<c:choose>
											<c:when test="${info.orderNum>0}">
												<div class="MOQNum" style="margin-top: 8px;">起订量>=${info.orderNum}${info.orderUnitName}</div>
											</c:when>
											<c:otherwise>
												<div class="MOQNum" style="margin-top: 8px;">起订量（面议）</div>
											</c:otherwise>
										</c:choose>
										<div class="clearfix" style="position:relative; margin-top:15px; margin-left:120px;">
											<c:choose>
												<c:when test="${info.price == ''|| info.price == undefined || info.price == null || info.price == 0}">
													<div class="productDisplayPrice" style="font-size:16px;">价格面议</div>
												</c:when>
												<c:otherwise><div class="productDisplayPrice">￥<span style="font-size:18px;margin-top: -5px;display: inline-flex;"><fmt:formatNumber value="${info.price}" pattern="#.##" minFractionDigits="0" /></span></div></c:otherwise>
											</c:choose>
											<div class="productDisplayUnit">/${info.unitName}</div>
											<div onclick="collect(this, 1, '${info.id}', '${info.productName}')" data="${info.isCollect}">
												<c:if test="${info.isCollect==0}">
													<img src="${ctx}/static/weixin/images/logistics/notCollected.png" width="20" height="20" style="float:right; cursor:pointer; z-index: 1000">
												</c:if>
												<c:if test="${info.isCollect==1}">
													<img src="${ctx}/static/image/product/alreadyCollect.png" width="20" height="20" style="float:right; cursor:pointer; z-index: 1000">
												</c:if>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../../common/footer.jsp"%>
	<%@ include file="../collectAndMessage.jsp"%>
	</div>
	<script type="text/javascript" src="${ctx}/static/plugins/select2/js/area.js"></script>
	<script type="text/javascript" src="${ctx}/static/plugins/select2/js/location.js"></script>
	<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2.js"></script>
	<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2_locale_zh-CN.js"></script>
	<link href="${ctx}/static/plugins/select2/css/select2.css" rel="stylesheet" />
	<script>
		$(function() {
			$('.tabItem').children().eq(0).css({'display' : 'none'});
			$('.tabItem').children().eq(1).css({'display' : 'block'});
			$(".tabName ul li").each(function() {//页面头部模块切换控制
				var index = $(this).index();
				$(".tabName ul li").eq(1).addClass("nameClick");
				$(this).click(function() {
					$(this).addClass("nameClick").siblings().removeClass("nameClick");
					$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
				})
			});	
			$(".tabItem ul li").each(function() {
				$(".tabItem ul li").eq(5).addClass("itemClick");
				$(this).click(function() {
					$(this).addClass("itemClick").siblings().removeClass("itemClick");
				})
			});
			$(".header_WeChat").click(function() {
				var div = $(".WeChatQRcode");
				if (div.css("display") == "none") {
					div.slideDown("fast");
				} else {
					div.slideUp("fast");
				}
			});
			$(".titleName ul li").each(function() {//页面内容切换控制
				var index = $(this).index();
				$(".titleName ul li").eq(0).addClass("titleClick");
				$(this).click(function() {
					$(this).addClass("titleClick").siblings().removeClass("titleClick");
					$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
				})
			});
		});
	</script>

	<script type="text/javascript" src="${ctx}/static/js/plugins/nivo-slider/jquery.nivo.slider.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
			$('#slider').nivoSlider();
		});
	</script>
	<script>
		$(function() {
			// 导航左侧栏js效果 start
			$(".pullDownList li").hover(function() {
				$(".yMenuListCon").fadeIn();
				var index = $(this).index(".pullDownList li");
				if (!($(this).hasClass("menulihover") || $(this).hasClass("menuliselected"))) {
					$($(".yBannerList")[index]).css("display", "block").siblings().css("display", "none");
					$($(".yBannerList")[index]).removeClass("ybannerExposure");
					setTimeout(function() {
						$($(".yBannerList")[index]).addClass("ybannerExposure");
					}, 60)
				} else {
					
				}
				$(this).addClass("menulihover").siblings().removeClass("menulihover");
				$(this).addClass("menuliselected").siblings().removeClass("menuliselected");
				$($(".yMenuListConin")[index]).fadeIn().siblings().fadeOut();
			}, function() {});
			
			$(".pullDown").mouseleave(function() {
				$(".yMenuListCon").fadeOut();
				$(".yMenuListConin").fadeOut();
				$(".pullDownList li").removeClass("menulihover");
			})
			// 导航左侧栏js效果  end
			
			$(".pullDownListMore").click(function() {
				var num = $(".pullDownList").children("li").length;
				var h = index;
				var sh = (h-20)/10;
				$(".pullDownList li").each(function(i, val) {
					if (i > 9) {
						if ($(this).css("display") == "none") {
							$(this).css("display", "block");
							$(".pullDownListMore span").removeClass("caret_red_down");
							$(".pullDownListMore span").addClass("caret_red_up");
							$(".pullDownList").height(sh*num+20+"px");
						} else { 
							$(this).css("display", "none");
							$(".pullDownListMore span").removeClass("caret_red_up");
							$(".pullDownListMore span").addClass("caret_red_down");
							$(".pullDownList").height(h+"px");
						}
					}
				});
			});
			
			var height = Math.round($(window).width() * 480 / 1379);
			var pad = (((height - 35 - 23) * 0.1 - 24.4) * 0.5).toFixed(1);
			$(".pullDownList li").css("padding", pad + "px 11px");
			$(".pullDownList").css("height", height - 35 - 6 + "px");
			var index = $(".pullDownList").height();
			$(".yMenuListCon").css("height", height - 35 - 6 + "px");
			$(".yMenuListConin").css("height", height - 35 - 6 + "px");
		});
	</script>
	<script type="text/javascript">
		$(function() {
			getList(1);
			
			var $companyWidth = $('#companyWidth>img').width();
			
			$('#companyWidth>img').css({
				'height' : $companyWidth
			});

			$('#popularityButton').click(function() {
				$('#pricePic').removeClass();
				if ($('#orderType').val() == 0) {
					$('#orderType').val(1);
					$('#popularityPic').attr("class","caret_red_down");
				} else if ($('#orderType').val() == 1) {
					$('#orderType').val(2);
					$('#popularityPic').attr("class","caret_red_up");
				} else {
					$('#orderType').val(1);
					$('#popularityPic').attr("class","caret_red_down");
				}
				
				$('#productList').empty();
				getList(1);
			});
			
			$('#priceButton').click(function() {
				$('#popularityPic').removeClass();
				if ($('#orderType').val() == 0) {
					$('#orderType').val(3);
					$('#pricePic').attr("class", "caret_red_down");
				} else if ($('#orderType').val() == 3) {
					$('#orderType').val(4);
					$('#pricePic').attr("class", "caret_red_up");
				} else {
					$('#orderType').val(3);
					$('#pricePic').attr("class", "caret_red_down");
				}
				
				$('#productList').empty();
				getList(1);
			});

		});

		function getList(pageNum) {
			$('#moreList').hide();
			
			if ($('#loc_province').val() != "") {
				$("#provinceName").val($('#loc_province').select2('data').text);
			} else {
				$("#provinceName").val("");
			}
			if ($('#loc_city').val() != "") {
				$("#areaName").val($('#loc_city').select2('data').text);
			} else {
				$("#areaName").val("");
			}
			
			var pageSize = 8;
			$('#pageNum').val(pageNum);
			$.ajax({
				url : "${ctx}/interface/json/showProduct/searchList",
				type : "post",
				data : {
					'${_csrf.parameterName}':'${_csrf.token}',
					"pageNum" : pageNum,
					"pageSize" : pageSize,
					"searchKey" : $("#searchKey").val(),
					"industryId" : $("#industryId").val(),
					"orderType" : $("#orderType").val(),
					"orderNumMin" : $("#orderNumMin").val(),
					"orderNumMax" : $("#orderNumMax").val(),
					"provinceName" : $("#provinceName").val(),
					"areaName" : $("#areaName").val()
				},
				dataType : "json",
				success : function(result) {
					if (result.success) {
						var list = result.productList;
						var total = result.total;
						if(pageNum==1&&total==0){
							$('#productList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						}else{
							if(pageNum*pageSize<total){
								$('#moreList').show();
							}
							
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var text = info.productName;

								if (text != "" && text != null && text.length > 11) {
									text = text.substring(0, 10) + "...";
								}

								var _div = '<div class="productDisplay"  >';
								_div += '<div onclick="view(\''+ info.id+ '\')" id="divWidth">';
								if(info.picUrl==null||info.picUrl==""){
									_div += '<img src="${ctx}/static/weixin/image/product/defaultImage.png" width="100%" >';
								}else{
									_div += '<img src="'+ info.picUrl+ '" width="100%" >';
								}
								_div += '</div>';
								_div += '<div class="productDisplayName" style="height:41px;line-height:41px;font-family:\'Microsoft YaHei\';font-size: 16px; overflow:hidden;">'+ text+ '</div>';
								_div += '<div class="clearfix" style="padding:5px;height: 31px;">';
								
								if (info.price == ""|| info.price == undefined || info.price == null || info.price == 0) {
									_div += '<div class="productDisplayPrice" style="font-size:16px;">价格面议</div>';
								} else {
									var price = parseFloat(info.price).toString();
									_div += '<div class="productDisplayPrice">￥<span style="font-size:18px;margin-top: -5px;display: inline-flex;">'+ price+ '</span></div>';
									_div += '<div class="productDisplayUnit">/'+ info.unitName + '</div>';
								}
								_div += '<div onclick="collect(this, 1, \''+ info.id+ '\', \''+ info.productName+ '\')" data="'+ info.isCollect+ '">';
								if (info.isCollect == 0) {
									_div += '<img src="${ctx}/static/weixin/images/logistics/notCollected.png" width="20" height="20" style="float:right; cursor:pointer;">';
								} else {
									_div += '<img src="${ctx}/static/image/product/alreadyCollect.png" width="20" height="20" style="float:right; cursor:pointer;">';
								}
								_div += '</div>';
								
								$('#productList').append(_div);

							}
							
							var $divWidth = $('#divWidth>img').width();
							
							$('#divWidth>img').css({
								'height' : $divWidth
							});
							
						}
						
					} else {
						layer.msg("获取数据异常");
					}
				}
			});
		}
		
		function search(){
			$('#productList').empty();
			getList(1);
		}
		
		function selectByIndustryId(industryId, industryName) {
			$("#industryBar").css('display', 'block');
			$("#industryName").text(industryName);
			$("#industryId").val(industryId);
			$('#productList').empty();
			getList(1);
		}
		
		function getMore(){
			var pageNum = Number($("#pageNum").val()) + 1;
			getList(pageNum);
		}
		
		function deleteIndustryId(){
			$("#industryBar").css('display', 'none');
			$("#industryId").val("");
			$('#productList').empty();
			getList(1);
		}
		
		function view(id) {
			window.location.href = "${ctx}/front/showProduct/view?id=" + id;
		}
		
		function publish(){
			window.location.href = "${ctx}/login/page/show/validate?type=1";
		}
		
		$(function(){
			var isComplete = '${isComplete}';
			if(isComplete=='true'&&isComplete!=''&&isComplete!=null){
				layer.open({
					  id:'cframe',			
					  type: 2,
					  title: false,
					  closeBtn: 1, //不显示关闭按钮
					  shade: [.4],
					  area: ['1000px', '700px'],
					  anim: 2,
					  content: ['${ctx}/login/page/show/validateLogin?type=1'], //iframe的url，no代表不显示滚动条
					  btn: ['关闭'],
					  yes: function(index, layero){
						  layer.closeAll();
					  },cancel: function(){ 
						  
			          }
				}); 
			}else if(isComplete=='false'&&isComplete!=''&&isComplete!=null){
				layer.confirm('请完善企业信息！', {
					btn: ['确定', '再想想'], btn1:function(){
						window.location.href = "${ctx}/personalCenter/companyEdit?url=3";
		            }, btn2: function () {
		                
		            },cancel: function(){ 
		            	
		            }
		        });
			}
			
		});
		
		function getNumber(){
			return 1;
		}
	</script>
</body>
</html>