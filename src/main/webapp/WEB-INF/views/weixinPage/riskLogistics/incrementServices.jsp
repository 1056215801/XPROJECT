<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>增值服务</title>
<link href="${ctx}/static/weixin/css/logistics/incrementServices.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/logistics/sourceDetails.css" rel="stylesheet" />
<style type="text/css">
.fixed_top {
	position:fixed;
	top:0;
	background-color:#00A85A;
	width:100%;
	height:50px;
	z-index:1000;
	font-weight:bold;
}
.fixed_top img {
	margin:15px 5px 0 10px;
}
.fixed_top span {
	position:absolute;
	top:14px;
	font-size:16px;
	color:#FFF;
}
</style>
<script>
	function showIframeInfo(url) {
		$("#iframepage").attr("src", url);
		$("#iframepage")
		.height($(document).height() - $("#bottomBar").height());
		LayerIndex = layer.open({
			type : 1,
			shade : [ 0 ],
			skin : 'layui-layer-bg_gray',
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#iframe'),
		});
	};
	function backToList() {
		layer.close(LayerIndex);
	}

	/**
	 * 身份验证
	 */
	function Authentication() {
		showIframeInfo("http://mid.weixingmap.com/");
	}
	/**
	 * 网上投保
	 */
	function OnlineInsurance() {

	}

	/**
	 * 路阻查询
	 */
	function Resistance() {
		showIframeInfo("http://m.gaosubao.com/");
	}

	/**
	 * 航班查询
	 */
	function Flight() {
		showIframeInfo("http://www.variflight.com/");
	}

	/**
	 * 违章查询
	 */
	function Illegal() {
		showIframeInfo("http://m.weizhang8.cn/");
	}

	/**
	 * 铁路时事查询
	 */
	function Railway() {
		showIframeInfo("http://kuai.nuomi.com/webapp/train/index.html?us=tr_wise_tit&ala_adapt=iphone");
	}
</script>
</head>

<body>
	<div id="incrementServices" class="increment_main">
		<div id="increment">
			<div class="fixed_top" style="padding:0;">
				<img src="${ctx}/static/weixin/images/logistics/incrementServices0.png" width="20px;" height="20px;" style="margin: 15px 5px 0px 10px;" />
				<spanF style="position: absolute;top:14px;color: #FFF;">增值服务</span>
			</div>
			<div style="padding-top: 60px;">
				<div class="increment_top">
					<div class="increment_title">物流增值服务</div>
				</div>
				<div class="increment_content">
					<div class="increment_service">
						<a href="javascript:void(0);" onClick="Authentication();" style="text-decoration: none;"> <img
							src="${ctx}/static/weixin/images/logistics/identityVerification.png" width="60px;" height="60px;" />
						</a>
						<div class="increment_name">身份验证</div>
					</div>
<!-- 					<div class="increment_service"> -->
<!-- 						<a href="javascript:void(0);" onClick="OnlineInsurance();" style="text-decoration: none"> <img -->
<%-- 							src="${ctx}/static/weixin/images/logistics/onlineInsurance.png" width="60px;" height="60px;" /> --%>
<!-- 						</a> -->
<!-- 						<div class="increment_name">网上投保</div> -->
<!-- 					</div> -->
					<div style="clear: both;"></div>
				</div>
				<div class="increment_top">
					<div class="increment_title">物流服务查询</div>
				</div>
				<div class="increment_content">
					<div class="increment_service">
						<a href="javascript:void(0);" onClick="Resistance();" style="text-decoration: none"> <img
							src="${ctx}/static/weixin/images/logistics/resistanceQuery.png" width="60px;" height="60px;" />
						</a>
						<div class="increment_name">路阻查询</div>
					</div>
					<div class="increment_service">
						<a href="javascript:void(0);" onClick="Flight();" style="text-decoration: none"> <img
							src="${ctx}/static/weixin/images/logistics/flightQuery.png" width="60px;" height="60px;" />
						</a>
						<div class="increment_name">航班查询</div>
					</div>
					<div class="increment_service">
						<a href="javascript:void(0);" onClick="Illegal();" style="text-decoration: none"> <img
							src="${ctx}/static/weixin/images/logistics/illegalQuery.png" width="60px;" height="60px;" />
						</a>
						<div class="increment_name">违章查询</div>
					</div>
					<div class="increment_service">
						<a href="javascript:void(0);" onClick="Railway();" style="text-decoration: none"> <img
							src="${ctx}/static/weixin/images/logistics/railwayRealTimeQuery.png" width="60px;" height="60px;" />
						</a>
						<div class="increment_name">铁路查询</div>
					</div>
					<div style="clear: both;"></div>
				</div>

			</div>
		</div>

		<div id="iframe" style="display: none">
			<iframe id="iframepage" src="" frameborder="0" width="100%" overflow="hidden"> </iframe>
			<div id="bottomBar" class="fixed_bottom">
				<a href="javascript:backToList();"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;"
					style="float: left; margin: 12px 10px;" />
				</a>
				<div style="clear: both;"></div>
			</div>
		</div>

		<!-- 底部工具栏和发布货源弹窗 -->
		<%@ include file="common/createSupplyLayer.jsp"%>
		<!-- 改变工具栏第2个图标 -->
		<script type="text/javascript">img_green(2);</script>
	</div>
	
</body>
</html>