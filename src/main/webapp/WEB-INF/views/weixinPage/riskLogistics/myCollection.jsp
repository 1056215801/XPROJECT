<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的收藏</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
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
		$('#getMore').hide();
		getZWBCollectionList(1);
	});
	//查看车源详情
	function viewDetails(obj) {
		var str = $(obj).attr("data");
		$("#dataStr").val(str);
		$("#detailsForm").submit();
	}
	var pageNum = 1;
	function getZWBCollectionList(pageNum) {
		$
				.ajax({
					url : "${ctx}/logistics/zwb/json/findCar",
					type : "get",
					data : {
						"collectCar" : "1",
						"curPage" : pageNum,
						"pageCount" : 10
					},
					dataType : "json",
					success : function(result) {
						if (result.code == "50000") {
							var list = result.value;
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = "";
								_div += "<div class=\'logisticsContentBar\' data=\'"
										+ JSON.stringify(info)
										+ "\' onclick=\'viewDetails(this);\'>";
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
								_div += "        <div class=\'logisticsName\'>"
										+ info.carTypeName + "</div>";
								_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/authentication.png\' width=\'35\' height=\'12\' class=\'logisticsAuthent\' hidden></div>";
								_div += "      <div style=\'font-size: 13px;\'>";
								_div += "        <span class=\'logisticsLabel\' style=\'background-color: #287EEB;\'>"
										+ info.tonnage + "吨</span>";
								_div += "        <span class=\'logisticsLabel\' style=\'background-color: #287EEB;\'>车长"
										+ info.length + "米</span></div>";
								_div += "    </div>";
								_div += "    <div class=\'logisticsRight\'>";
								_div += "      <div class=\'logisticsTime\'>"
										+ info.timeInfo + "</div>";
								_div += "      <a href=\'javascript:void(0);\' onClick=\"event.cancelBubble = true;cancelCollection(this);\" style=\'text-decoration: none;\' data=\'"
										+ info.id + "\'>";
								if (info.isCollectionCar == "1") {
									_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/alreadyCollect.png\' width=\'20\' height=\'20\' id=\'" + info.id + "\'></a>";
								} else {
									_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/notCollected.png\' width=\'20\' height=\'20\' id=\'" + info.id + "\'></a>";
								}
								_div += "      <a href=\'tel:"+info.tel+"\' onClick=\'event.cancelBubble = true;\'>";
								_div += "      <img src=\'${ctx}/static/weixin/images/riskLogistics/dialTelephone.png\' width=\'40\' height=\'40\' class=\'logisticsTelephone\' /></div></a>";
								_div += "  </div>";
								_div += "</div>";
								$("#list").append(_div);
							}
							
							if(list.length==10){
								$("#getMore").show();
								$("#proList").hide();
							}else{
								$("#getMore").hide();
								$("#proList").show();
							}
						} else {

							layer.msg(result.msg);
						}

					}
				});

	}

	//万佶和中危宝切换
	function borClick(btn, index) {
		
		$('#getMore').hide();
		$(".project_oper").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(btn).addClass("selected");
		if (index == 0) {//万佶

			window.location.href = "${ctx}/logistics/wanji/weixin/collectList";

		}

	}
	//加载更多
	function getMore() {
		pageNum++;
		getZWBCollectionList(pageNum);
	}

	function cancelCollection(obj, e) {
		var infoa = $(obj).attr("data");
		var id=infoa;
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
							end : function (){
								location.reload();
							}
						});
						
					}else if(data.code==-2){
						layer.msg("请先登录")
					}else{
						layer.msg(data.msg);
					}
				},
			});
		
	}
</script>
</head>

<body>
	<form id="detailsForm" action="${ctx}/logistics/zwb/weixin/SearchRisksDetail" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> <input type='hidden' name='dataStr'
			id='dataStr'></input>
	</form>
	<div class="logistics_main">
		<div class="fixed_top" style="background-color: #F55825;">
			<img src="${ctx}/static/weixin/images/logistics/myCollection0.png" width="20" height="20"> <span>我的收藏</span>
		</div>

		<div class="logistics_content">
			<div style="margin-top: 60px;"></div>
			<div class="project_operBar">
				<div style="width: 15%;" class="project_oper borRight " onclick="borClick(this,0);">货物</div>
				<div style="width: 15%;" class="project_oper borRight selected"  onclick="borClick(this,1);">危化</div>
				<div style="clear: both;"></div>
			</div>
			<div style="margin-top: 10px;"></div>
			<div id="list">
				<%-- 	<div class="logisticsContentBar">
			<div style="border-bottom: 1px solid #F6F6F6;">
				<img src="${ctx}/static/weixin/images/riskLogistics/currentLocation.png" width="20" height="20" style=" vertical-align:middle;"/>
				<div class="logisticsAdd" style="width: 40%;">江西南昌西湖区</div>
				<div class="logisticsConnect" style="width: 18%;">
					<div class="logisticsModels">单桥</div>
					<div style="font-size: 0;">
						<img src="${ctx}/static/weixin/images/riskLogistics/directionLine.png" width="50" height="5"/>
					</div>
					<div class="logisticsVehicleType">普通</div>
				</div>
				<img src="${ctx}/static/weixin/images/riskLogistics/destination.png" width="20" height="20" style="vertical-align:middle;"/>
				<div class="logisticsAdd" style="width: 15%;">全国</div>
			</div>

			<div class="clearfix">
				<img src="${ctx}/static/weixin/images/riskLogistics/headPortrait.png" width="45" height="45" class="logisticsHeadPortrait"/>
				<div class="logisticsLeftBar">
					<div class="clearfix">
						<div class="logisticsName">肖宏远</div>
						<img src="${ctx}/static/weixin/images/riskLogistics/authentication.png" width="35" height="12" class="logisticsAuthent">
					</div>
					<div style="font-size: 13px;">
						<span class="logisticsLabel">17.55吨</span>
						<span class="logisticsLabel">6.2*2.4米</span>
					</div>
				</div>
				<div class="logisticsRight">
					<div class="logisticsTime">刚刚</div>
					<a href="javascript:;" onClick="addToCollection();" style="text-decoration:none;">
						<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20" height="20" class="logisticsCollect">
					</a>
					<img src="${ctx}/static/weixin/images/riskLogistics/dialTelephone.png" width="40" height="40" class="logisticsTelephone"/>
				</div>
			</div>
		</div> --%>
			</div>
		</div>
		<div id="proList" style="text-align: center; display: none;">
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
		
		<!-- 底部工具栏和发布货源弹窗 -->
		<%@ include file="common/createSupplyLayer.jsp"%>
		<!-- 改变工具栏第2个图标 -->
		<script type="text/javascript">
			img_green(2);
		</script>
	</div>
</body>
</html>
