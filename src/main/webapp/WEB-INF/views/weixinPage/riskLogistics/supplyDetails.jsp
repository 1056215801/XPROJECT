<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>货源详情</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/layer-v2.4/layer.js" type="text/javascript"></script>
<script type="text/javascript">

	//删除我的货源
	function deleteZwbGoods(id){
		var confirmIndex = layer.confirm("确定删除吗?",function(index, layero){
			layer.close(confirmIndex);
			$.ajax({
				url : "${ctx}/logistics/zwb/json/delGoods",
				type : "post",
				data : {
					"${_csrf.parameterName}":'${_csrf.token}',
					"goodsId":id
				},
				dataType : "json",
				success : function(result) {
					if(result.code=="40000"){
						layer.msg("删除成功");
						backToList();
					}else{
						layer.msg(result.msg);
					}
				},
				error : function() {
					layer.alert("系统异常");
				}
			});
		});
	}
	
	//修改中危宝货源
	function editZwb(id){
		$("#editGoodsId").val(id);
		$("#zwbEditForm").submit();
	}
</script>
</head>
<body>
	<!-- 编辑货源表单 -->
	<form id="zwbEditForm" action="${ctx}/logistics/zwb/weixin/edit" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> 
		<input type='hidden' name='goodsId' id='editGoodsId'></input>
		<input type='hidden' name='biddingState' value="${biddingState}"></input>
	</form>
	<c:set var="info" value="${zwbPublishgoodsLogBean.goodsInfo[0]}"/>
	<div class="logistics_main">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/riskLogistics/mySupply.png" width="20" height="20"> <span>货源详情</span>
		</div>

		<div class="logistics_content">
			<div style="margin-top: 60px;"></div>
			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">出发地</div>
					<div class="details_right" style="width:70%;">${info.startAreaDetail}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">详细地址</div>
					<div class="details_right" style="width:70%;">${info.startAddressDetail}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">发货电话</div>
					<div class="details_right">${info.phone}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">目的地</div>
					<div class="details_right" style="width:70%;">${info.endAreaDetail}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">详细地址</div>
					<div class="details_right" style="width:70%;">${info.endAddressDetail}</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">收货电话</div>
					<div class="details_right">${info.receiverPhone}</div>
				</div>
			</div>

			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">货物名称</div>
					<div class="details_right">${info.name}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">货物类型</div>
					<div class="details_right" style="width:70%;">${info.supplyTypeName}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">数量</div>
					<div class="details_right" style="width:70%;">${info.weight}吨</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">配送方式</div>
					<div class="details_right" style="width:70%;">${info.sendType}</div>
				</div>
			</div>

			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">运费</div>
					<div class="details_right">
						<c:choose>
							<c:when test="${biddingState eq 1}">竞价</c:when>
							<c:otherwise>${info.bidding}</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">支付方式</div>
					<div class="details_right">${info.payType}</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">创建时间</div>
					<div class="details_right">${info.time}</div>
				</div>
			</div>

<!-- 			<div class="caption_top"> -->
<!-- 				<div class="caption_title">推荐车源</div> -->
<!-- 			</div> -->
<!-- 			<div class="logisticsContentBar"> -->
<!-- 				<div style="border-bottom: 1px solid #F6F6F6;"> -->
<%-- 					<img src="${ctx}/static/weixin/images/riskLogistics/currentLocation.png" width="20" height="20" style="vertical-align: middle;" /> --%>
<!-- 					<div class="logisticsAdd" style="width: 40%;">江西南昌西湖区</div> -->
<!-- 					<div class="logisticsConnect" style="width: 18%;"> -->
<!-- 						<div class="logisticsModels">单桥</div> -->
<!-- 						<div style="font-size: 0;"> -->
<%-- 							<img src="${ctx}/static/weixin/images/riskLogistics/directionLine.png" width="50" height="5" /> --%>
<!-- 						</div> -->
<!-- 						<div class="logisticsVehicleType">普通</div> -->
<!-- 					</div> -->
<%-- 					<img src="${ctx}/static/weixin/images/riskLogistics/destination.png" width="20" height="20" style="vertical-align: middle;" /> --%>
<!-- 					<div class="logisticsAdd" style="width: 15%;">全国</div> -->
<!-- 				</div> -->

<!-- 				<div class="clearfix"> -->
<%-- 					<img src="${ctx}/static/weixin/images/riskLogistics/headPortrait.png" width="45" height="45" class="logisticsHeadPortrait" /> --%>
<!-- 					<div class="logisticsLeftBar"> -->
<!-- 						<div class="clearfix"> -->
<!-- 							<div class="logisticsName">肖宏远</div> -->
<%-- 							<img src="${ctx}/static/weixin/images/riskLogistics/authentication.png" width="35" height="12" class="logisticsAuthent"> --%>
<!-- 						</div> -->
<!-- 						<div style="font-size: 13px;"> -->
<!-- 							<span class="logisticsLabel">17.55吨</span> <span class="logisticsLabel">6.2*2.4米</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="logisticsRight"> -->
<!-- 						<div class="logisticsTime">刚刚</div> -->
<%-- 						<a href="javascript:;" onClick="addToCollection();" style="text-decoration: none;"> <img src="${ctx}/static/weixin/images/riskLogistics/alreadyCollect.png" --%>
<!-- 							width="20" height="20" class="logisticsCollect"> -->
<%-- 						</a> <img src="${ctx}/static/weixin/images/riskLogistics/dialTelephone.png" width="40" height="40" class="logisticsTelephone" /> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>

		<div class="fixed_bottom">
			<a href="javascript:backToList();"> <img src="${ctx}/static/weixin/images/riskLogistics/return.png" width="20px;" height="20px;" class="returnBtn" />
			</a>
			<div class="bottom_operation" onclick="deleteZwbGoods(${info.id})">
				<img src="${ctx}/static/weixin/images/riskLogistics/delete.png" width="20px;" height="20px;" /> <span
					class="spanContral_1" style="color: #F14241;">删除</span>
			</div>
			<div class="bottom_operation" onclick="editZwb(${info.id})">
				<img src="${ctx}/static/weixin/images/riskLogistics/edit.png" width="20px;" height="20px;" /> <span class="spanContral_1" style="color: #00A85A;">修改</span>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
	<form id="zwbList" action="${ctx}/logistics/wanji/weixin/myList" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> 
		<input type='hidden' name='isZwb' value="true"></input>
	</form>
	<script type="text/javascript">
		function backToList(){
			$("#zwbList").submit();
		}
	</script>
</body>
</html>