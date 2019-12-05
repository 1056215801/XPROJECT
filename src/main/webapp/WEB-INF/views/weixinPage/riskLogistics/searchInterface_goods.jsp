<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>搜索界面-货物</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
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
</head>
<body>
	<form id="detailsForm" action="${ctx}/logistics/wanji/weixin/carDetail" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> 
		<input type='hidden' name='carStr' id='dataStr'></input>
		<input type='hidden' name='pageType' value='0'></input>
		
	</form>
	<div class="logistics_main">
		<div class="logistics_content">
			<div class="searchResultBar_goods clearfix">
				<a href="javascript:history.back(-1);">
					<div class="searchResult_goods">
						<img src="${ctx}/static/weixin/images/riskLogistics/map.png" width="30" height="30" style="margin: 10px 7px;" />
					</div>
				</a> <span class="searchResultCount"> 一共搜索到&nbsp; <font id="carsCount" style="color: #FCFF00; font-size: 18px;">0</font>
					&nbsp;辆&nbsp;&nbsp;货物运输车源
				</span>
			</div>
			<div style="margin-top: 60px;"></div>
			<div id="wanjiList"></div>
			<c:forEach items="${platCarInfo}" var="info" varStatus="status">
				
			</c:forEach>

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
		
		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		<div id="tbox" onclick="location.href='#top';"></div>

			<div class="navigationBar">
				<ul>
					<li><a href="${ctx}/auth/page/mobile/weixin/logistics/zwb/weixin/main">
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
			</div>

			<!-- 底部工具栏和发布货源弹窗 -->
			<%@ include file="common/createSupplyLayer.jsp"%>
			<!-- 改变工具栏第0个图标 -->
			<script type="text/javascript">img_green(0);</script>
		</div>
		</div>
</body>
<script>
	$(function() {
		getWanjiList(0);
	});
	
	function ityzl_SHOW_LOAD_LAYER(){  
        return layer.msg('努力中...', {icon: 16,shade: [0.5, '#f5f5f5'],scrollbar: false,time:100000}) ;  
    } 
	
	/* 异步加载万佶物流列表 */
	var pageNum = 0;
	function getWanjiList(pageNum){
		var index = null;
		$.ajax({
			url : "${ctx}/logistics/wanji/json/getPlatCar",
			type : "post",
			data : {
				"${_csrf.parameterName}" : '${_csrf.token}',
				"Take" : 10, //pageSize
				"Skip" : 10*pageNum,
				"AdCode" : '${info.adCode}',
				"TargetAdCode" : '${info.targetAdCode}',
				"TypeCode" : '${info.typeCode}',
				"CarLoadType" : '${info.carLoadType}',
				"PlateNum" : '${info.plateNum}'
			},
			dataType : "json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success : function(result) {
				layer.close(index);
				if(result.code==1){
					if(pageNum==0 && result.jsonValue.Total!=null){
						//第一页显示搜索总数
						$("#carsCount").html(result.jsonValue.Total);
					}
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = "";
						_div += "<div  class=\'logisticsContentBar\' onclick=\'viewDetails(this,"+info.Id+");\'>";
						_div += "  <div style=\'border-bottom: 1px solid #F6F6F6;\'>";
						_div += "    <img src=\'${ctx}/static/weixin/images/logistics/currentLocation.png\' width=\'20px;\' height=\'20px;\' style=\'display: inline-block; vertical-align: middle;\' />";
						_div += "    <div style=\'display: inline-block; vertical-align: middle; text-align: center; font-weight: bold; width: 40%;\'>";
						_div += "      <div style=\'color: #000; font-size: 17px; padding: 10px 0;\'>";
						if(info.CurPlace.length>6){
							_div += info.CurPlace.substring(0,6)+"...";
						}else{
							_div += info.CurPlace;
						}
						_div += "      </div>";
						_div += "    </div>";
						_div += "    <div style=\'display: inline-block; vertical-align: middle; text-align: center; width: 18%;\'>";
						_div += "      <div style=\'font-size: 12px; color: #969696;\'>"+(info.CarTypeName==undefined?" ":info.CarTypeName)+"</div>";
						_div += "      <div style=\'font-size: 0;\'>";
						_div += "        <img src=\'${ctx}/static/weixin/images/logistics/directionLine.png\' width=\'50px;\' height=\'5px;\' /></div>";
						_div += "      <div style=\'font-size: 12px; color: #969696;\'>"+(info.CarLoadTypeName==undefined?" ":info.CarLoadTypeName)+"</div></div>";
						_div += "    <img src=\'${ctx}/static/weixin/images/logistics/destination.png\' width=\'20px;\' height=\'20px;\' style=\'display: inline-block; vertical-align: middle;\' />";
						_div += "    <div style=\'display: inline-block; vertical-align: middle; text-align: center; font-weight: bold; width: 15%;\'>";
						_div += "      <div id=\'div1\' style=\'color: #000; font-size: 17px; padding: 10px 0;\'>全国</div></div>";
						_div += "  </div>";
						_div += "  <div>";
						if(info.Avatar==null||info.Avatar==""){
							_div += "        <img src=\'${ctx}/static/weixin/images/logistics/headPortrait.png\' width=\'45px;\' height=\'45px;\' style=\'float: left; margin-top: 7px; border-radius: 70px;\' />";
						}else{
							_div += "        <img src=\'"+info.Avatar+"\' width=\'45px;\' height=\'45px;\' style=\'float: left; margin-top: 7px; border-radius: 70px;\' />";
						}
						_div += "    <div style=\'float: left; margin-left: 8px; width:170px;\'>";
						_div += "      <div style=\'font-size: 15px;width:100px; float: left; margin-top: 5px; margin-bottom: 2px; color: #000;\'>"+(info.Name==undefined?" ":info.Name)+"</div>";
						if(info.IsCarAuth){
							_div += "        <img src=\'${ctx}/static/weixin/images/logistics/authentication.png\' width=\'35px;\' height=\'12px;\' style=\'margin-top: 9px; margin-left: 5px;\'>";
						}
						_div += "      <div style=\'font-size: 15px; color: #969696; float: right; margin-top: 5px; margin-bottom: 2px; margin-right: 6px;\'>"+info.StrLocationDt+"</div>";
						_div += "      <div style=\'clear: both;\'></div>";
						_div += "      <div style=\'font-size: 13px;\'>";
						_div += "        <span style=\'background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;\'>"+(info.CarLoad==undefined?" ":info.CarLoad)+"吨</span>";
						_div += "        <span style=\'background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;\'>"+(info.CarLength==undefined?"0":info.CarLength)+"*"+(info.CarWidth==undefined?"0":info.CarWidth)+"米</span></div>";
						_div += "    </div>";
						_div += "    <div style=\'float: right; text-align: center;\'>";
						_div += "      <a id=\'a_"+info.Id+"\' href=\'javascript:void(0);\' onClick=\'event.cancelBubble = true;addToCollection(this)\' data=\'"+JSON.stringify(info)+"\' style=\'text-decoration: none\'>";
						if(info.isCollect=="true"){
							_div += "            <img id=\'"+info.Id+"\' src=\'${ctx}/static/weixin/images/logistics/alreadyCollect.png\' width=\'20px;\' height=\'20px;\' style=\'margin: 10px 0;\'>";
						}else{
							_div += "            <img id=\'"+info.Id+"\' src=\'${ctx}/static/weixin/images/logistics/notCollected.png\' width=\'20px;\' height=\'20px;\' style=\'margin: 10px 0;\'>";
						}
						_div += "      </a>";
						_div += "      <a href=\'tel:"+info.Telphone+"\' onClick=\'event.cancelBubble = true;\'>";
						_div += "        <img src=\'${ctx}/static/weixin/images/logistics/dialTelephone48.png\' width=\'40px;\' height=\'40px;\' style=\'margin-top: 6px; margin-left: 8px\' /></a>";
						_div += "    </div>";
						_div += "    <div style=\'clear: both;\'></div>";
						_div += "  </div>";
						_div += "</div>";
						$("#wanjiList").append(_div);
					}
					if(list.length<10){
						$("#getMore").hide();
					}else{
						$("#getMore").show();
					}
				}else{
					$("#getMore").hide();
				}
				
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
	}
	//加载更多
	function getMore() {
		pageNum++;
		getWanjiList(pageNum);
	}
	
	function addToCollection(obj) {
		var imgId1;	
		var infoa = $(obj).attr("data");
		var info = jQuery.parseJSON(infoa);
		var id=info.Id;
		if ($("#" + id).attr('src').indexOf("alreadyCollect") > 0) {
			imgId1=info.Id;
			$.ajax({
				url : "${ctx}/logistics/wanji/json/cancelCollect",
				type : "get",
				data : {
					"carId":info.Id,
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
							$('#' + imgId1).each(function(index, obj) {
								$(obj).attr("src",
										"${ctx}/static/weixin/images/logistics/notCollected.png");
							});
						
							
							if (infoa.indexOf('\"isCollect\":\"false\"') >= 1) {
								infoa = infoa.replace('\"isCollect\":\"false\"', '\"isCollect\":\"true\"');
							} else if (infoa.indexOf('\"isCollect\":\"true\"') >= 1) {
								infoa = infoa.replace('\"isCollect\":\"true\"', '\"isCollect\":\"false\"');
							}
							$(obj).attr("data", infoa);
					}else if(result.code==-2){
						layer.msg("请先登录");

					} else { 
						layer.alert(result.msg);
					}
				
				},
				error : function() {
					layer.msg("网络连接错误!");
				}
			});

		}else{
			var IsAuth;
			imgId1 = info.Id;
			if (info.IsAuth) {
				IsAuth = 1;
			} else {
				IsAuth = 0;
			}
			var IsCompany;
			if (info.IsCompany) {
				IsCompany = 1;
			} else {
				IsCompany = 0;
			}
			var IsCarAuth;
			if (info.IsCarAuth) {
				IsCarAuth = 1;
			} else {
				IsCarAuth = 0;
			}
			var Avatar;
			if(info.Avatar==""||info.Avatar==null){
				Avatar="";
			}
			var ActiveDt= info.ActiveDt;
			ActiveDt=ActiveDt.substring(0,10);
			$.ajax({
				url : "${ctx}/logistics/wanji/json/collectCar",
				type : "get",
				data : {
					"carId":info.Id,
					"activeDt":ActiveDt,
					"plateNum" : info.PlateNum,
					"isAuth" : IsAuth,
					"isCompany" : IsCompany,
					"isCarauth" : IsCarAuth,
					"carWidth" : info.CarWidth,
					"carLength" : info.CarLength,
					"carLoad" : info.CarLoad,
					"carLoadTypeName" :info.CarLoadTypeName,
					"carTypeName" : info.CarTypeName,
					"driverAvatar":info.Avatar,
					"driverName":info.Name,
					"driverId":info.DriverId,
					"driverTelphone" : info.Telphone,
					"curPlace":info.CurPlace,
					
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
							$('#' + imgId1).each(function(index, obj) {
								$(obj).attr("src",
										"${ctx}/static/weixin/images/logistics/alreadyCollect.png");
							});
							
						
							if (infoa.indexOf('\"isCollect\":\"false\"') >= 1) {
								infoa = infoa.replace('\"isCollect\":\"false\"', '\"isCollect\":\"true\"');
							} else if (infoa.indexOf('\"isCollect\":\"true\"') >= 1) {
								infoa = infoa.replace('\"isCollect\":\"true\"', '\"isCollect\":\"false\"');
							}
							$(obj).attr("data", infoa);
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
		
		
		
	};

	//查看车源详情
	function viewDetails(obj,data) {
		$("#dataStr").val($("#a_" + data).attr("data"));
		$("#detailsForm").submit();
	}

		
</script>
</html>