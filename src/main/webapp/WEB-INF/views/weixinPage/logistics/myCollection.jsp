<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的收藏</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/logistics/myCollection.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/logistics/sourceDetails.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
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
<script>
	$(function() {
		getWJCollectionList(1);
		$('#tbox').hide();//隐藏小火箭
		$('#getMore').hide();//隐藏加载更多 
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
	
	
	var pageNum=1;
	
	function getWJCollectionList(pageNum) {
		$.ajax({
					url : "${ctx}/logistics/wanji/json/collectList",
					type : "get",
					data : {
						"pageNum" : pageNum,
						"pageSize" : 10
					},
					dataType : "json",
					success : function(result) {
						if (result.code == 1) {
							var total=result.jsonValue.total;
							var list = result.value;
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								 var _div = "";
								_div += "<div  class=\'logisticsContentBar\' onclick=\'viewDetails(this,\""+info.collectId+"\");\'>";
								_div += "  <div style=\'border-bottom: 1px solid #F6F6F6;\'>";
								_div += "    <img src=\'${ctx}/static/weixin/images/logistics/currentLocation.png\' width=\'20px;\' height=\'20px;\' style=\'display: inline-block; vertical-align: middle;\' />";
								_div += "    <div style=\'display: inline-block; vertical-align: middle; text-align: center; font-weight: bold; width: 40%;\'>";
								_div += "      <div style=\'color: #000; font-size: 17px; padding: 10px 0;\'>";
								if(info.curPlace.length>6){
									_div += info.curPlace.substring(0,6)+"...";
								}else{
									_div += info.curPlace;
								}
								_div += "      </div>";
								_div += "    </div>";
								_div += "    <div style=\'display: inline-block; vertical-align: middle; text-align: center; width: 18%;\'>";
								_div += "      <div style=\'font-size: 12px; color: #969696;\'>"+(info.carTypeName==undefined?" ":info.carTypeName)+"</div>";
								_div += "      <div style=\'font-size: 0;\'>";
								_div += "        <img src=\'${ctx}/static/weixin/images/logistics/directionLine.png\' width=\'50px;\' height=\'5px;\' /></div>";
								_div += "      <div style=\'font-size: 12px; color: #969696;\'>"+(info.carLoadTypeName==undefined?" ":info.carLoadTypeName)+"</div></div>";
								_div += "    <img src=\'${ctx}/static/weixin/images/logistics/destination.png\' width=\'20px;\' height=\'20px;\' style=\'display: inline-block; vertical-align: middle;\' />";
								_div += "    <div style=\'display: inline-block; vertical-align: middle; text-align: center; font-weight: bold; width: 15%;\'>";
								_div += "      <div id=\'div1\' style=\'color: #000; font-size: 17px; padding: 10px 0;\'>全国</div></div>";
								_div += "  </div>";
								_div += "  <div>";
								if(info.driverAvatar==null||info.driverAvatar==""){					
									_div += "  <img src=\'${ctx}/static/weixin/images/logistics/headPortrait.png\' width=\'45px;\' height=\'45px;\' style=\'float: left; margin-top: 7px; border-radius: 70px;\' />";
								}else{
									_div += "  <img src=\'"+info.driverAvatar+"\' width=\'45px;\' height=\'45px;\' style=\'float: left; margin-top: 7px; border-radius: 70px;\' />";
								}
								_div += "    <div style=\'float: left; margin-left: 8px;\'>";
								_div += "      <div style=\'font-size: 15px; float: left; margin-top: 5px; margin-bottom: 2px; color: #000;\'>"+(info.driverName==undefined?" ":info.driverName)+"</div>";
								if(info.IsCarAuth){
									_div += "        <img src=\'${ctx}/static/weixin/images/logistics/authentication.png\' width=\'35px;\' height=\'12px;\' style=\'margin-top: 9px; margin-left: 5px;\'>";
								}
								_div += "      <div style=\'clear: both;\'></div>";
								_div += "      <div style=\'font-size: 13px;\'>";
								_div += "        <span style=\'background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;\'>"+(info.carLoad==undefined?" ":info.carLoad)+"吨</span>";
								_div += "        <span style=\'background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;\'>"+(info.carLength==undefined?"0":info.carLength)+"*"+(info.carWidth==undefined?"0":info.carWidth)+"米</span></div>";
								_div += "    </div>";
								_div += "    <div style=\'float: right; text-align: center;\'>";
								_div += "      <div style=\'font-size: 15px; color: #969696; float: left; margin-top: 5px; margin-bottom: 2px; margin-right: 6px;\'>";
								_div += getTime(info.activeDate);
								 _div+=   "</div>";
								_div += "      <a id=\'a_"+info.carId+"\' href=\'javascript:void(0);\' onClick=\'event.cancelBubble = true;cancelCollection(this)\' data=\'"+JSON.stringify(info)+"\' style=\'text-decoration: none\'>";
								_div += "        <img id=\'"+info.carId+"\' src=\'${ctx}/static/weixin/images/logistics/alreadyCollect.png\' width=\'20px;\' height=\'20px;\' style=\'margin: 10px 0;\'>";
								_div += "      </a>";
								_div += "      <a href=\'tel:"+info.driverTelphone+"\' onClick=\'event.cancelBubble = true;\'>";
								_div += "        <img src=\'${ctx}/static/weixin/images/logistics/dialTelephone48.png\' width=\'40px;\' height=\'40px;\' style=\'margin-top: 6px; margin-left: 8px\' /></a>";
								_div += "    </div>";
								_div += "    <div style=\'clear: both;\'></div>";
								_div += "  </div>";
								_div += "</div>";
								$(".list").append(_div);
							}
							
							var count= pageNum*10;
							if(total>count){
								$("#getMore").show();
							}else{
								$("#getMore").hide();
							}
							if(list.length==0){
								$("#proList").hide();

							}	
						}else if(result.code==0){
							$("#getMore").hide();
							$("#proList").show();
						}else{
							
							$("#getMore").hide();
							layer.msg(result.msg);
						}

					}
				});

	}
	
	//加载更多
	function getMore() {
		pageNum++;
		getWJCollectionList(pageNum);
	}
	
	function getTime(time) {
		var date = new Date(time);
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				;
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() );
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() );
		/* s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() ); */
		return (M+"月"+D+"日");
	}
	
	//查看车源详情
 	function viewDetails(obj,data) {
		
		window.location.href="${ctx}/logistics/wanji/weixin/carDetail?collectId="+data+"&pageType=1";

	} 
	
	
	function cancelCollection(obj){
		var infoa = $(obj).attr("data");
		var info = jQuery.parseJSON(infoa);
		var id= info.carId;
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
								location.reload();
							}
						});
					
				} else if (result.code ==-2) { 
					layer.msg("请先登录");
				}else{
					layer.msg(result.msg);
				}	
			},
			
		});
	}
	
	
	//万佶和中危宝切换
	 function borClick(btn, index) {
		$(".project_oper").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(btn).addClass("selected");
		if (index == 1) {//中危宝
			$('#getMore').hide();
			window.location.href="${ctx}/logistics/zwb/weixin/collection";

		}

	}


	/* 返回收藏列表 */
	function backToList() {
		layer.close(LayerIndex);
		location.reload();
	}
	

	//发布货源选择
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
</script>
</head>

<body>

	<div id="myCollection" class="myCollection_main">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/logistics/myCollection0.png" width="20" height="20">
			<span>我的收藏</span>
		</div>
		<div style="padding-top: 60px;"></div>
		<div class="project_operBar">
			<div style="width: 15%;" class="project_oper borRight selected" onClick="borClick(this,0);">货物</div>
			<div style="width: 20%;" class="project_oper borRight" onClick="borClick(this,1);">危化</div>
			<div style="clear: both;"></div>
		</div> 
		<div style="margin-top: 10px;"></div>
		<div class=list>
		<div id="proList" style="text-align: center; display: none;">
			<span class="renovateTitle">暂无更多数据</span>
		</div>
		  <%-- <c:if test="${collectionList=='[]'}">
		  	 <div id="proList" style="text-align: center;margin-top:10px;">
				<span class="renovateTitle">暂无数据</span>
			</div> 
		  </c:if>
		  <c:if test="${collectionList!=null&&collectionList!=''}">
		  	<c:forEach items="${collectionList}" var="info" varStatus="status">
				<div id="li_${status.index}" style="display: none;" class="contentBar">
					<a href="javascript:;" data='${info}' onClick="viewDetails(this);" style="text-decoration: none;">
						<div style="border-bottom: 1px solid #f6f6f6;">

							<div width="10px;" height="10px;" style="float: left; margin: 10px 5px; color: #01A863">${info.plateNum}</div>

							<div style="clear: both;"></div>
						</div>

						<div>
							<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;"
								style="float: left; margin-top: 7px; border-radius: 70px;" />
							<div style="float: left; margin-left: 10px;">
								<div style="float: left;">
									<div style="font-size: 15px; float: left; margin-top: 5px; margin-bottom: 2px; color: #000;">${info.name}</div>
									<c:choose>
										<c:when test="${fn:length(info.collectTime)==2}}">
											<div style="font-size: 12px; color: #969696; float: left; margin-top: 7px; margin-right: -80%; padding-left: 20%;">${info.collectTime}</div>
										</c:when>
										<c:when test="${fn:length(info.collectTime)==4}">
											<div style="font-size: 12px; color: #969696; float: left; margin-top: 7px; margin-right: -80%; padding-left: 20%;">${info.collectTime}</div>
										</c:when>
										<c:otherwise>
											<div style="font-size: 12px; color: #969696; float: left; margin-top: 7px; margin-right: -80%; padding-left: 20%;">${info.collectTime}</div>
										</c:otherwise>
									</c:choose>
								</div>
								<!-- 以车辆认证来判断 -->
								<c:if test="${info.isCarauth == '1'}">
									<img src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;"
										style="margin-top: 9px; margin-left: 5px;" />
								</c:if>
								<div style="clear: both;"></div>
								<div style="font-size: 13px;">
									<span style="background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;">${info.carLoad}吨</span> <span
										style="background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;">${info.carLength}*${info.carWidth}米</span>
								</div>

							</div>
							<div style="float: right;">
								<div style="font-size:12px; color:#969696; float:left; margin-top:7px; margin-right:3px;">${info.collectTime}</div>
								<a href="javascript:void(0);" onClick="cancelCollection(this);" data='${info}' style="text-decoration: none"> <img
									src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin: 10px 5px;" />
									<a href="tel:${info.telphone} "> <img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;"
										height="40px;" style="margin-top: 6px; margin-left: 8px" />
								</a>

								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
					</a>
				</div>
			</c:forEach>
		  </c:if> --%>
			
		</div>
		
		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		
		
		<div id="tbox">
			<a id="gotop" href="#top"></a>
		</div>

		<div id="carSourceDetails" class="details_main">
			<div class="fixed_top">
				<img src="${ctx}/static/weixin/images/logistics/carSourceDetails.png" width="20px;" height="20px;"
					style="margin: 3px 5px 0 10px;" /> <span style="position: absolute; top: 8px; color: #FFF;">车源详情</span>
			</div>
			<div style="padding-top: 0px; margin-bottom: 60px;">
				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">联系人</div>
						<div id="Name" class="details_right">曾国强</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">联系电话</div>
						<div id="Telphone" class="details_right">18970008000</div>
						<a id="matchDetailPhone1"> <img src="${ctx}/static/weixin/images/logistics/phoned.png" width="20px;" height="20px;"
							style="float: left; margin-left: 5px;" />
						</a>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">车牌号</div>
						<div id="PlateNum" class="details_right">赣CB0717</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">认证情况</div>
						<div id="IsCarAuth" class="details_right">车辆</div>
						<img id="IsCarAuthImg" src="${ctx}/static/weixin/images/logistics/carCertification.png" width="20px;" height="20px;"
							style="float: left; margin-left: 5px;" />
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">车型</div>
						<div id="CarTypeName" class="details_right">单轿</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">装载类型</div>
						<div id="CarLoadTypeName" class="details_right">普通</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">车长车宽</div>
						<div id="CarLength" class="details_right">长5米 宽2.4米</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">载重</div>
						<div id="CarLoad" class="details_right">15.2吨</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">发布时间</div>
						<div id="ActiveDt" class="details_right">2016-02-12 13:32:23</div>
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>

			<div class="fixed_bottom">
				<a href="javascript:backToList();"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;"
					style="float: left; margin: 12px 10px;" />
				</a> <a id="matchDetailPhone2">
					<div style="float: right; border-left: 1px solid #DCDCDC; padding: 0 10px;">
						<img src="${ctx}/static/weixin/images/logistics/phone.png" width="20px;" height="20px;" style="margin: 12px 0;" /> <span
							style="position: relative; bottom: 16px; color: #01A858;">拨打电话</span>
					</div>
				</a>
				<div style="float: right; border-left: 1px solid #DCDCDC; padding: 0 10px;">
					<a href="javascript:void(0);" onClick="detailCollect();" style="text-decoration: none"> <img id="isCollectImg"
						src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin: 12px 0;" />
					</a> <span id="isCollect" style="position: relative; bottom: 16px; color: #F04444;">已收藏</span>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>

		<div id="addToCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>车源已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--收藏车源</span>”进行查看
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

		<div class="navigationBar">
			<ul>
				<!--<li>
				<a href="javascript:;">
					<div class="navImage"><img src="images/carSource.png" width="20" height="20"/></div>
					<div class="navTitle">首页</div>
				</a>			
			</li>-->
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
							<img src="${ctx}/static/weixin/images/riskLogistics/mored.png" width="20" height="20" />
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
</body>
</html>
