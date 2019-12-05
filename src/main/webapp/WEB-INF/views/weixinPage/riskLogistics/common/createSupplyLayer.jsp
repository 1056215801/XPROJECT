<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script>
	//更多服务
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
	});

	//发布货源选择弹窗
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
	
	function img_green(i){//选择不同的选项卡
		$(".navigationBar img").eq(i).attr("src","${ctx}/static/weixin/images/riskLogistics/"
				+(i==0?"carSourced":i==1?"releaseSupplyed":"mored")+".png")
	}
</script>

<!-- 底部工具栏:配合img_green()方法改变第0-2个图标为绿色图标 -->
<div class="navigationBar">
	<ul>
		<li><a href="${ctx}/auth/page/mobile/weixin/logistics/wanji/weixin/main">
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
					<img src="${ctx}/static/weixin/images/riskLogistics/more.png" width="20" height="20" />
				</div>
				<div class="navTitle">更多服务</div>
		</a></li>
	</ul>
	<div id="viewMore">
		<ul style="margin-top: -137px;">
			<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logistics/wanji/weixin/myList">我的货源</a></li>
			<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logistics/wanji/weixin/collectList">我的收藏</a></li>
			<li><a href="${ctx}/logistics/wanji/weixin/incrementServices">增值服务</a></li>
		</ul>
	</div>
</div>

<!-- 发布货源选择 -->
<div id="selectReleaseType" style="display: none;">
	<a href="${ctx}/logistics/wanji/weixin/create">
		<div class="releaseType_goods">
			<img src="${ctx}/static/weixin/images/riskLogistics/goods.png" width="43" height="29.3"> <span>货物运输</span>
		</div>
	</a> <a href="${ctx}/logistics/zwb/weixin/edit">
		<div class="releaseType_risk">
			<img src="${ctx}/static/weixin/images/riskLogistics/risk.png" width="43" height="29.3"> <span>危化运输</span>
		</div>
	</a>
</div>