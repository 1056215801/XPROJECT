<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>搜索界面-危化</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
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
<script>
	$(function() {
		getCarList(1);
	});

	//异步获取车源列表
	var page = 1;
	function getCarList(pageNum) {
		$.ajax({
					url : "${ctx}/logistics/zwb/json/findCar",
					type : "post",
					data : {
						"curPage" : pageNum,
						"pageCount" : 10,
						"carTypeId" : '${zwbSourceSearchBean.carTypeId}',
						"goodsWeightStart":'${zwbSourceSearchBean.goodsWeightStart}',
						"goodsWeightEnd":'${zwbSourceSearchBean.goodsWeightEnd}',
						"sendType":'${zwbSourceSearchBean.sendType}',
						"totalPriceStart":'${zwbSourceSearchBean.totalPriceStart}',
						"totalPriceEnd":'${zwbSourceSearchBean.totalPriceEnd}',
						"biddingState":'${zwbSourceSearchBean.biddingState}',
						"beginAreaId":'${zwbSourceSearchBean.beginAreaId}',
						"endAreaId":'${zwbSourceSearchBean.endAreaId}',
						"${_csrf.parameterName}":'${_csrf.token}'
					},
					dataType : "json",
					success : function(result) {
						$("#totalCount").text(result.jsonValue.totalCount);
						if (result.code == 50000) {
							var list = result.value;
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = "";
								_div += "<div class=\'logisticsContentBar\' data=\'"+JSON.stringify(info)+"\' onclick=\'viewDetails(this);\'>";
								_div += "  <div style=\'border-bottom: 1px solid #F6F6F6;\'>";
								_div += "    <img src=\'${ctx}/static/weixin/images/riskLogistics/currentLocation.png\' width=\'20\' height=\'20\' style=\'vertical-align: middle;\' />";
								_div += "    <div class=\'logisticsAdd\' style=\'width: 35%;\'>"
										+ info.beginAreaName + "</div>";
								_div += "    <div class=\'logisticsConnect\' style=\'width: 18%;\'>";
								_div += "      <div class=\'logisticsModels\'>"
										+ info.linesFlag + "</div>";
								_div += "      <div style=\'font-size: 0;\'>";
								_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/directionLine.png\' width=\'50\' height=\'5\' /></div>";
								_div += "      <div class=\'logisticsVehicleType\'>"
										+ info.sendType + "</div></div>";
								_div += "    <img src=\'${ctx}/static/weixin/images/riskLogistics/destination.png\' width=\'20\' height=\'20\' style=\'vertical-align: middle;\' />";
								_div += "    <div class=\'logisticsAdd\' style=\'width: 25%;\'>"
										+ info.endAreaName + "</div></div>";
								_div += "  <div class=\'clearfix\'>";
								_div += "    <img src=\'https://www.zwb56.com"+info.carTypeIcon+"\' width=\'45\' height=\'45\' class=\'logisticsHeadPortrait\' />";
								_div += "    <div class=\'logisticsLeftBar\'>";
								_div += "      <div class=\'clearfix\'>";
								_div += "        <div class=\'logisticsName\'>"+info.carTypeName+"</div>";
								_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/authentication.png\' width=\'35\' height=\'12\' class=\'logisticsAuthent\' hidden></div>";
								_div += "      <div style=\'font-size: 13px;\'>";
								_div += "        <span class=\'logisticsLabel\' style=\'background-color: #287EEB;\'>"+info.tonnage+"吨</span>";
								_div += "        <span class=\'logisticsLabel\' style=\'background-color: #287EEB;\'>车长"+info.length+"米</span></div>";
								_div += "    </div>";
								_div += "    <div class=\'logisticsRight\'>";
								_div += "      <div class=\'logisticsTime\'>"
										+ info.timeInfo + "</div>";
								_div += "<a id=\'a_" +info.id+"\' href=\'javascript:void(0);\' onClick=\"event.cancelBubble = true;addToCollection(this);\" style=\'text-decoration: none;\' data=\'" + JSON.stringify(info) + "\'>";
								if(info.isCollectionCar=="1"){
									_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/alreadyCollect.png\' width=\'20\' height=\'20\' id=\'" + info.id + "\'></a>";
								}else{
									_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/notCollected.png\' width=\'20\' height=\'20\' id=\'" + info.id + "\'></a>";
								}
								_div += "      <a href=\'tel:"+info.tel+"\' onClick=\'event.cancelBubble = true;\'>";
								_div += "      <img src=\'${ctx}/static/weixin/images/riskLogistics/dialTelephone.png\' width=\'40\' height=\'40\' class=\'logisticsTelephone\' /></div></a>";
								_div += "  </div>";
								_div += "</div>";
								$("#logisticsList").append(_div);
							}
							if(list.length==10){
								$("#getMore").show();
								$("#proList").hide();
							}else{
								$("#getMore").hide();
								$("#proList").show();
							}
						}
					},
					error : function() {
						layer.alert("系统异常");
					}
				});
	}
	
	//加载更多
	function getMore(){
		page++;
		getCarList(page);
	}
	
	//查看车源详情
	function viewDetails(obj) {
		var data = $(obj).attr("data");
		var dataOB = jQuery.parseJSON(data);
		$("#dataStr").val($('#a_' + dataOB.id).attr("data"));
		$("#detailsForm").submit();
	}

	function addToCollection(obj, e) {	
		var infoa = $(obj).attr("data");
		var info = jQuery.parseJSON(infoa);
		var id=info.id;
		//取消收藏操作
	 if ($("#"+id).attr('src').indexOf("alreadyCollect") > 0) {
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
						$("#" + id)
						.attr('src',
							'${ctx}/static/weixin/images/logistics/notCollected.png');
						//改变页面收藏状态，同步到详情
						 if (infoa.indexOf('\"isCollectionCar\":0') >= 1) {
								infoa = infoa.replace('\"isCollectionCar\":0', '\"isCollectionCar\":1');
					 		} else if (infoa.indexOf('\"isCollectionCar\":1') >= 1) {
								infoa = infoa.replace('\"isCollectionCar\":1', '\"isCollectionCar\":0');
							}
						 $(obj).attr("data", infoa);
					}else if(data.code==-2){
						layer.msg("请先登录")
					}else{
						layer.msg(data.msg);
					}
				},
			});
	}else{
		//增加收藏操作
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
					$("#" + id)
					.attr('src',
						'${ctx}/static/weixin/images/logistics/alreadyCollect.png');
					//改变页面收藏状态，同步到详情
					 if (infoa.indexOf('\"isCollectionCar\":0') >= 1) {
							infoa = infoa.replace('\"isCollectionCar\":0', '\"isCollectionCar\":1');
				 		} else if (infoa.indexOf('\"isCollectionCar\":1') >= 1) {
							infoa = infoa.replace('\"isCollectionCar\":1', '\"isCollectionCar\":0');
						}
					 $(obj).attr("data", infoa);
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
	<form id="detailsForm" action="${ctx}/logistics/zwb/weixin/SearchRisksDetail" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> <input type='hidden' name='dataStr'
			id='dataStr'></input>
	</form>

	<div class="logistics_main">
		<div class="logistics_content">
			<div class="searchResultBar_risk clearfix">
				<a href="javascript:history.back(-1);">
					<div class="searchResult_risk">
						<img src="${ctx}/static/weixin/images/riskLogistics/map.png" width="30" height="30" style="margin: 10px 7px;" />
					</div>
				</a> <span class="searchResultCount"> 一共搜索到&nbsp; <font id="totalCount" style="color: #FCFF00; font-size: 18px;">0</font>
					&nbsp;辆&nbsp;&nbsp;货物运输车源
				</span>
			</div>
			<div style="margin-top: 60px;"></div>
			<div id="logisticsList"></div>
		</div>

		<div id="proList" style="text-align: center;display:none;">
			<span class="renovateTitle">暂无更多数据</span>
		</div>
		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		<div id="tbox" onclick="location.href='#top';"></div>

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
		<div class="navigationBar">
			<ul>
				<li><a href="main">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/riskLogistics/carSourced.png" width="20" height="20" />
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
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logisticsInfo/mySupply">我的货源</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logisticsInfo/myCollection">我的收藏</a></li>
					<li><a href="${ctx}/logisticsInfo/incrementServices">增值服务</a></li>
				</ul>
			</div>
			</a>
		</div>

		
		<!-- 底部工具栏和发布货源弹窗 -->
		<%@ include file="common/createSupplyLayer.jsp"%>
		<!-- 改变工具栏第0个图标 -->
		<script type="text/javascript">img_green(0);</script>

	</div>

</body>
</html>