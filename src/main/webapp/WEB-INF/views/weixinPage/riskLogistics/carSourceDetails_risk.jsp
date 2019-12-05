<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>车源详情-危化</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<style>
body .layui-layer-tl_green .layui-layer-title {
	background-color: #F55825;
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
<script type="text/javascript">
$(function(){
});
function detailCollect(){
	var id=${info.id};
	if ($("#detailImg").attr('src').indexOf("alreadyCollect") > 0) {
		 $.ajax({
				url : "${ctx}/logistics/zwb/json/cancelCollect",
				data : {
					"carSourceId":id,
				},
				success : function (data) {
					if (data.code == 50013) {
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
						$("#detailImg").attr('src', '${ctx}/static/weixin/images/logistics/notCollected.png');

					}else if(data.code==-2){
						layer.msg("请先登录")
					}else{
						layer.msg(data.msg);
					}
				},
			});
	}else{
		$.ajax({
			url : "${ctx}/logistics/zwb/json/collectCar",
			data : {
				"carSourceId":id,
			},
			success : function (data) {
				if (data.code == 50005) {
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
					
					$("#detailImg").attr('src', '${ctx}/static/weixin/images/logistics/alreadyCollect.png');
				}else if(data.code==-2){
					layer.msg("请先登录")
				}else{
					layer.msg(data.msg);
				}
			},
		});
		
	}
	
	
}
</script>
</head>
<body>
	<div class="logistics_main">
		<div class="fixed_top" style="background-color: #F55825;">
			<img src="${ctx}/static/weixin/images/riskLogistics/carSourceDetails.png" width="20" height="20"> <span>车源详情</span>
		</div>

		<div class="logistics_content">
			<div style="margin-top: 60px;"></div>
			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">当前位置</div>
					<div class="details_right" style="width:70%;">${info.startAddressDetail}</div>
				</div>
				<div class="details_groupLast clearfix" >
					<div class="details_left">期望流向</div>
					<div class="details_right" style="width:70%;">${info.endAddressDetail}</div>
				</div>
			</div>

			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">车型</div>
					<div class="details_right">${info.carTypeName}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">核载吨位</div>
					<div class="details_right">${info.tonnage}吨</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">车长</div>
					<div class="details_right">长${info.length}米</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">载重</div>
					<div class="details_right">${info.surplustonnage}吨</div>
				</div>
			</div>

			<div class="details_group">
<!-- 				<div class="details_groupBefore clearfix"> -->
<!-- 					<div class="details_left">联系人</div> -->
<%-- 					<div class="details_right">${info.contact}</div> --%>
<!-- 				</div> -->
				<div class="details_groupBefore clearfix">
					<div class="details_left">联系电话</div>
					<div class="details_right">${info.tel}</div>
					<a href="tel:${info.tel}">
					<img src="${ctx}/static/weixin/images/riskLogistics/phoned.png" width="20px;" height="20px;" style="float: left; margin-left: 5px;" />
					</a>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">运价</div>
			 		<c:choose>
						<c:when test="${info.price eq 0}">
	
							<div class="details_right">面议</div>
						</c:when>
						<c:otherwise>
							<div class="details_right">${info.price}元</div>
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">配送方试</div>
					<div class="details_right">${info.sendType}</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">发车时间</div>
					<div class="details_right">${info.loadingTime}</div>
				</div>
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
		<div id="addToCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>车源已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--我的收藏</span>”进行查看
			</div>
			<div>
				<span id="seconds1">3</span>秒后自动关闭
			</div>
		</div>
		<div class="fixed_bottom">
			<a href="javascript:history.back(-1);"> <img src="${ctx}/static/weixin/images/riskLogistics/return.png" width="20px;" height="20px;" class="returnBtn" />
			</a>
			<a href="tel:${info.tel}">
			<div class="bottom_operation">
				<img src="${ctx}/static/weixin/images/riskLogistics/phone.png" width="20px;" height="20px;" /> <span class="spanContral_1" style="color: #F14241;">拨打电话</span>
			</div>
			</a>
			<div class="bottom_operation">
				<a href="javascript:void(0);" onClick="detailCollect();">
					<c:choose>
						<c:when test="${info.isCollectionCar eq 1}">
							<img id="detailImg" src="${ctx}/static/weixin/images/riskLogistics/alreadyCollect.png" width="20px;" height="20px;" /> <span
						class="spanContral_1" style="color: #F14241;">已收藏</span>
						</c:when>
						<c:otherwise>
							<img id="detailImg" src="${ctx}/static/weixin/images/riskLogistics/notCollected.png" width="20px;" height="20px;" /> <span
						class="spanContral_1" style="color: #F14241;">未收藏</span>
						</c:otherwise>
					</c:choose>
				</a>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>