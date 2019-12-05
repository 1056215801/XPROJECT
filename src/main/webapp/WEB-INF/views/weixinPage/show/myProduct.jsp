<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的产品</title>
<link href="${ctx}/static/weixin/css/show/myProduct.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<script>
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
	})
</script>
<script type="text/javascript">
	$(function() {
		$('#gridView').hide();
		$("#proList").hide();
		$('#tbox').hide();

		/* 异步加载找企业 */
		getmyProduct(1);
	})

	/* 异步我的产品*/
	myProductCount = 0;
	pageNumber = 1;
	function getmyProduct(pageNum) {
		$
				.ajax({
					url : "${ctx}/show/json/myProduct",
					type : "get",
					data : {
						"pageNumber" : pageNum,
						"parkId" : 0
					},
					dataType : "json",
					success : function(result) {
						var list = result.value;
						if (result.code == 1 || result.code == 0) {
							myProductCount += list.length;
							for (var i = 10 * (pageNum - 1); i < 10
									* (pageNum - 1) + list.length; i++) {
								var info = list[i % 10];
								var _divList = '<a href="javascript:void(0)" onclick="view(\''+info.id+'\')" style="text-decoration: none;">'
										+ '<div style="color: #5e5e5e; margin: 0 15px; padding: 10px 0; font-size: 12px; border-bottom: 1px solid #e6e6e6; position: relative;">'
										+ '<img src="'
										+ info.pic_url
										+ '" style="float: left; width: 30%; height:100px; margin-right: 20px;">'
										+ '<div style="float: left; width: 56%;">'
										+ '<div style="font-weight: bold; margin: 4px 0;">'
										+ '<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;"style="color:#000;">'
										+ info.product_name
										+ '</div><div style="font-weight: bold; color: #ccc; margin: 4px 0;">起订量>='
										+ info.order_num
										+ getUnit(info.order_unit)+'</div>'
										+ '<div class="entProduct_price" style="float: left; padding: 1px 5px;">￥'
										+ info.price
										+ '</div>'
										+ '<div style="float: left; padding: 1px 0;">/'+getUnit(info.order_unit)+'</div>'
										+ '</div><div style="clear: both;"></div></div></a>';
										$("#listView").append(_divList);

										var _divGrid = '<a href="${ctx}/show/productDetails?id='
										+ info.id
										+ '" style="text-decoration: none;">'
										+ '<div class="entProduct_dataBar" style="color: #5e5e5e;border-bottom: 1px solid #e6e6e6;">'
										+ '<div style="text-align: center;"><img src="'
										+info.pic_url+'" height="120px;" style="vertical-align: middle;"></div>'
										+ '<div style="font-size: 14px; height:40px; overflow: hidden;color: #000;">';
										if (info.product_name.length <= 19) {
											_divGrid += '<span style="font-size: 14px;line-height:14px;color:#000;">'
													+ info.product_name + '</span>';
										} else {
											_divGrid += '<span title="'+info.product_name+'" style="font-size: 14px;line-height:14px;color:#000;">'
													+ info.product_name
															.substring(0, 19)
													+ '...</span>';
										}
										_divGrid +='</div>'
										+ '<div style="padding-bottom:5px;"><div class="entProduct_price" style="float: left;">￥'
										+ info.price
										+ '</div><div style="float: left;">/'+getUnit(info.order_unit)+'</div>'
										+ '<div style="clear: both;"></div></div></div></a>';
									$("#gridView").append(_divGrid);
							}
							$("#gridView").append(
									'<div style="clear: both;"></div>');
						} else if (result.code == 2) {
							$("#proList").show();
							$('#getMore').hide();
						} else {
							layer.msg("获取数据失败");
						}
						if (result.code == 0 || result.code == 2) {
							$('#getMore').hide();
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
		getmyProduct(pageNumber);
	}

	viewType = 0//0为listView 1为gridView
	function changeViewType() {
		if (myProductCount > 0) {
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
	}

	
	function view(id){
		window.location.href="${ctx}/show/productDetails?id="+id + "&type=2";
	}
	
	/* 单位转换 */
	function getUnit(i){
		var unitMap = ${unitMap};
		return unitMap[i];
	}
</script>
</head>

<body>
	<div class="product_main">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/show/findProducted.png" width="15px;" height="15px;"> <span>我的产品</span>
		</div>
		<div class="product_content">
			<div class="product_operBar">
				<div style="width: 25%; color: #06B8C2;" class="product_oper borRight">已发布</div>
				<div style="width: 57%;" class="product_oper"></div>
				<div style="width: 15%;" class="entProduct_oper borLeft" onclick="changeViewType();">
					<img id="changeView" src="${ctx}/static/weixin/images/show/list.png" width="20px;" height="20px;"
						style="display: block; margin: 0 auto;">
				</div>
				<div style="clear: both;"></div>
			</div>

			<div style="background-color: #fff;">
				<div id="gridView" class="entProduct_cont" style="text-align: center;"></div>
				<div id="listView"></div>
				<div style="text-align: center;line-height: 30;">
					<span id="proList" class="renovateTitle" style="color: #646464;">暂无产品</span>
				</div>
			</div>
			</div>
			
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
			<div id="tbox">
				<a id="gotop" href="#top"></a>
			</div>
		</div>

		<div class="navigationBar">
			<ul>
				<li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/personalCenter/shou.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">首页</div>
				</a></li>
				<li><a href="${ctx}/auth/page/mobile/weixin/show/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/findProduct1.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">找产品</div>
				</a></li>
				<li><a href="${ctx}/show/findEnterprise">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/findEnterprised.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">找企业</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/mored.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -137px;">
<!-- 				<li style="border-bottom: 1px solid #E6E6E6;"><a href="javascript:;">留言处理</a></li> -->
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myCollection">我的收藏</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myProduct">我的产品</a></li>
					<li><a href="javascript:;">企业介绍</a></li>
				</ul>
			</div>
		</div>
	
</body>
</html>
