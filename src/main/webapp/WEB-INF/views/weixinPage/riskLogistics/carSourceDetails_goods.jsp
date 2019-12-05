<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>车源详情-货物</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
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
	background-color: #00A85A;
	color: #FFF;
	text-align: center;
	padding: 5px 0;
	width: 100%;
	margin: 0;
}
</style>
<script type="text/javascript">
	$(function() {
		
	});
	
	
	
	function detailCollect() {
		
		
			var info = '${carStr}';
			if(info!=null&&info!=""){
				var infoa = jQuery.parseJSON(info);
				var id=infoa.Id;
				if ($("#" + id).attr('src').indexOf("alreadyCollect") > 0) {
					cancelCollect(infoa, "${ctx}");
				} else {
					collect1(infoa, "${ctx}");
				}
			}else{
				var id='${wanjiCollectLogBean.carId}';
				if ($("#" + id).attr('src').indexOf("alreadyCollect") > 0) {
					
					cancelAction(id);
					
				}else{
					
					addAction(id);
				}
			}
		
 	};
 
 	//收藏列表详情取消
	function cancelAction(id){
 		
		$.ajax({
			url : "${ctx}/logistics/wanji/json/cancelCollect",
			type : "get",
			data : {
				"carId":id,
			},
			success : function(result) {
					if (result.code == 1) {
						$('#seconds2').html(3);
						layer.open({
							type : 1,
							title : '提示',
							skin : 'layui-layer-tl_green',
							shadeClose : true,
							area : [ '250px', '150px' ],
							time : '3000',
							content : $('#cancelCollection'),
							success:function(){
								setTimeout(function(){
									$('#seconds2').html(2);
									setTimeout(function(){$('#seconds2').html(1);},1000);
								},1000);
							},
							end : function (){
								/*location.reload();*/
							}
						});
						$('#' + id).each(function(index, obj) {
							$(obj).attr("src",
									"${ctx}/static/weixin/images/logistics/notCollected.png");
						});
						
						$("#MatchisCollect").empty();
						$("#MatchisCollect").html("未收藏");
				}else if(result.code == -2){
					layer.msg("请先登录");
				} else { 
					layer.alert(result.msg);
				}
			
			},
			error : function() {
				layer.msg("网络连接错误!");
			}
		});
		
 	}
 	function addAction(id){
 		$.ajax({
 			url : "${ctx}/logistics/wanji/json/collectCar",
 			type : "get",
 			data : {
 				"carId":id,
 			
 			},
 			success : function(result) {
 					if (result.code == 1) {
 						$('#seconds1').html(3);
 						layer.open({
 							type : 1,
 							title : '提示',
 							skin : 'layui-layer-tl_green',
 							shadeClose : true,
 							area : [ '250px', '150px' ],
 							time : '3000',
 							content : $('#addToCollection'),
 							success:function(){
 								setTimeout(function(){
 									$('#seconds1').html(2);
 									setTimeout(function(){$('#seconds1').html(1);},1000);
 								},1000);
 							}
 						});
 						$('#' + id).each(function(index, obj) {
 							$(obj).attr("src",
 									"${ctx}/static/weixin/images/logistics/alreadyCollect.png");
 						});
 						
 						$("#MatchisCollect").empty();
 						$("#MatchisCollect").html("已收藏");

 				} else if (result.code==-2) { 
 					layer.msg("请先登录");
 				}else{
 					layer.msg(result.msg);
 				}
 			
 			},
 			error : function() {
 				layer.msg("网络连接错误!");
 			}
 		});
 		
 	}

 	
</script>
</head>
<body>
	<div class="logistics_main">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/riskLogistics/carSourceDetails.png" width="20" height="20"> <span>车源详情</span>
		</div>

		<div class="logistics_content">
			<div style="margin-top: 60px;"></div>
			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">当前位置</div>
					<div class="details_right">${wanjiCollectLogBean.curPlace}</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">期望流向</div>
					<div class="details_right">全国</div>
				</div>
			</div>

			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">联系人</div>
					<div class="details_right">${wanjiCollectLogBean.driverName}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">联系电话</div>
					<div class="details_right">${wanjiCollectLogBean.driverTelphone}</div>
					<a href="tel:${wanjiCollectLogBean.driverTelphone}"> <img src="${ctx}/static/weixin/images/riskLogistics/phoned.png" width="20px;"
						height="20px;" style="float: left; margin-left: 5px;" />
					</a>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">车牌号</div>
					<div class="details_right">${wanjiCollectLogBean.plateNum}</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">认证情况</div>
					<c:choose>
						<c:when test="${info.IsCarAuth}">
							<div class="details_right">车辆</div>
							<img src="${ctx}/static/weixin/images/riskLogistics/carCertification.png" width="20px;" height="20px;"
								style="float: left; margin-left: 5px;" />
						</c:when>
						<c:otherwise>
							<div class="details_right">未认证</div>
						</c:otherwise>
					</c:choose>

				</div>
			</div>

			<div class="details_group">
				<div class="details_groupBefore clearfix">
					<div class="details_left">车型</div>
					<div class="details_right">${wanjiCollectLogBean.carTypeName}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">装载类型</div>
					<div class="details_right">${wanjiCollectLogBean.carLoadTypeName}</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">车长车宽</div>
					<div class="details_right">长${empty wanjiCollectLogBean.carLength?0:wanjiCollectLogBean.carLength}米 宽${empty wanjiCollectLogBean.carWidth?0:wanjiCollectLogBean.carWidth}米</div>
				</div>
				<div class="details_groupBefore clearfix">
					<div class="details_left">载重</div>
					<div class="details_right">${wanjiCollectLogBean.carLoad}吨</div>
				</div>
				<div class="details_groupLast clearfix">
					<div class="details_left">发布时间</div>
					<div class="details_right"><fmt:formatDate value="${wanjiCollectLogBean.activeDate}" pattern="yyyy-MM-dd" /></div>
				</div>
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
		<div id="cancelCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>收藏已取消</div>
			<div>
				“<span style="color: #FF6707;">收藏的车源已取消</span>”
			</div>
			<div>
				<span id="seconds2">3</span>秒后自动关闭
			</div>
		</div>
		<div class="fixed_bottom">

		    <c:choose>
				<c:when test="${pageType==0}">
					<a href="javascript:history.back(-1);"> <img src="${ctx}/static/weixin/images/riskLogistics/return.png" width="20px;"
					height="20px;" class="returnBtn" />
					</a> <a href="tel:${wanjiCollectLogBean.driverTelphone}">
					</c:when>
					<c:otherwise>
						<a href="${ctx}/logistics/wanji/weixin/collectList"> <img src="${ctx}/static/weixin/images/riskLogistics/return.png" width="20px;"
						height="20px;" class="returnBtn" />
						</a> <a href="tel:${wanjiCollectLogBean.driverTelphone}">
					</c:otherwise>
				</c:choose>
				<div class="bottom_operation">
					<img src="${ctx}/static/weixin/images/riskLogistics/phone.png" width="20px;" height="20px;" /> <span class="spanContral_1"
						style="color: #00A85A;">拨打电话</span>
				</div>
			</a>
			<div class="bottom_operation">
				<a href="javascript:void(0);" onClick="detailCollect();">
				 <c:choose>
						<c:when test="${wanjiCollectLogBean.isCollect||wanjiCollectLogBean.collectId!=null}">
							<img  id="${wanjiCollectLogBean.carId}" src="${ctx}/static/weixin/images/riskLogistics/alreadyCollect.png" width="20px;" height="20px;" />
							<span id="MatchisCollect" class="spanContral_1" style="color: #F14241;">已收藏</span>
						</c:when>
						<c:otherwise>
							<img id="${wanjiCollectLogBean.carId}" src="${ctx}/static/weixin/images/riskLogistics/notCollected.png" width="20px;" height="20px;" />
							<span id="MatchisCollect" class="spanContral_1" style="color: #F14241;">未收藏</span>
						</c:otherwise>
					</c:choose>

				</a>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>