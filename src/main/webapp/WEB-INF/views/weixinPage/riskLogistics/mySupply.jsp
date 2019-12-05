<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的货源</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/riskLogistics/mySupply.css" rel="stylesheet" />
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
<script type="text/javascript">

	function ityzl_SHOW_LOAD_LAYER(){  
	    return layer.msg('努力中...', {icon: 16,shade: [0.5, '#f5f5f5'],scrollbar: false,time:100000}) ;  
	} 

	//万佶物流同步加载列表显示
	var count = 0;
	$(function() {
		getZwbList(1);
		getWjList();
		
		$("#mySupplyMatch .contentBar").eq(0).css("margin-top","0");
		
		if(${isZwb eq true}){
			$(".project_operBar div").eq(1).click();
		}
	})
	
	//异步获取万佶货源列表
	function getWjList(){
		$.ajax({
			url : "${ctx}/logistics/wanji/json/myList",
			type : "post",
			data : {},
			dataType : "json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success : function(result) {
				layer.close(index);
				if(result.code==1){
					var list = result.jsonValue.Cargoes;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = "";
						_div += "<div class=\'contentBar\' data=\'"+JSON.stringify(info)+"\' onClick=\'viewDetails(this,"+info.Id+");\'>";
						_div += "  <img src=\'${ctx}/static/weixin/images/logistics/currentLocation.png\' width=\'20px;\' height=\'20px;\' style=\'float: left; margin: 10px 5px;\' />";
						_div += "  <div style=\'border-bottom: 1px solid #f6f6f6;\'>";
						_div += "    <div style=\'float: left; text-align: center; font-weight: bold; width: 30%;\'>";
						_div += "      <div style=\'color: #000; font-size: 17px; padding: 10px 0;\'>";
						var srcArr = info.SrcName.split("-");
						var srcStr = srcArr[0]+srcArr[1];
						if(srcStr.length > 5){
							_div += srcStr.substring(0,4) + "...";
						}else{
							_div += srcStr;
						}
						_div += "      </div>";
						_div += "    </div>";
						_div += "    <div style=\'float: left; text-align: center; width: 15%;\'>";
						_div += "      <div style=\'font-size: 12px; color: #969696;\'>"+info.StrTypeCode+"</div>";
						_div += "      <div style=\'font-size: 0;\'>";
						_div += "        <img src=\'${ctx}/static/weixin/images/logistics/directionLine.png\' width=\'50px;\' height=\'5px;\' /></div>";
						_div += "      <div style=\'font-size: 12px; color: #969696; margin-top: 3px; height: 22px;\'>"+info.SubTypeName+"</div></div>";
						_div += "    <img src=\'${ctx}/static/weixin/images/logistics/destination.png\' width=\'20px;\' height=\'20px;\' style=\'float: left; margin: 10px 5px;\' />";
						_div += "    <div style=\'float: left; text-align: center; font-weight: bold; width: 30%;\'>";
						_div += "      <div style=\'color: #000; font-size: 17px; padding: 10px 0;\'>";
						var destArr = info.DestName.split("-");
						var destStr = destArr[0]+destArr[1];
						if(destStr.length > 5){
							_div += destStr.substring(0,4) + "...";
						}else{
							_div += destStr;
						}
						_div += "      </div>";
						_div += "    </div>";
						_div += "    <div style=\'clear: both;\'></div>";
						_div += "  </div>";
						_div += "  <div>";
						_div += "    <img src=\'${ctx}/static/weixin/images/logistics/headPortrait.png\' width=\'45px;\' height=\'45px;\' style=\'float: left; margin-top: 7px; border-radius: 70px;\' />";
						_div += "    <div style=\'float: left; margin-left: 10px;width:60%;\'>";
						_div += "      <div style=\'font-size: 15px; float: left;width:60%; margin-top: 5px; margin-bottom: 2px; color: #000;\'>"+info.Contact+"</div>";
						_div += "      <div style=\'font-size: 12px; color: #969696; float: right;width:40%;text-align:right; margin-top: 7px; margin-right: 0px;\'>"+info.StrPrice+"</div>";
						_div += "      <div style=\'clear: both;\'></div>";
						_div += "      <div style=\'font-size: 13px;\'>";
						_div += "        <span style=\'background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;\'>"+info.QuantityRange+info.CountUnit+"</span>";
						_div += "        <span style=\'background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;\'>";
						if(info.LimCarLength1 == "-1.00" && info.LimCarLength2 == "-1.00" && info.LimCarLength3 == "-1.00"){
							_div += "不限";
						}else{
							_div += (info.LimCarLength1!="-1.00"?info.LimCarLength1+" ":"") +(info.LimCarLength2!="-1.00"?info.LimCarLength2+" ":"")+(info.LimCarLength3!="-1.00"?info.LimCarLength3:"")+"米";
						}
						_div += "        </span>";
						_div += "      </div>";
						_div += "    </div>";
						_div += "    <div style=\'float: right;\'>";
						
						_div += "      <a href=\'tel:"+info.Phone+"\' onclick=\'event.cancelBubble = true;\'>";
						_div += "        <img src=\'${ctx}/static/weixin/images/logistics/dialTelephone48.png\' width=\'40px;\' height=\'40px;\' style=\'margin-top: 6px;\' /></a>";
						_div += "    </div>";
						_div += "    <div style=\'clear: both;\'></div>";
						_div += "  </div>";
						_div += "</div>";
						$("#logisticsList0").append(_div);
					}
					if(list.length==0){
						var _tip = "";
						_tip += "<div style=\'text-align: center;\'>";
						_tip += "<span id=\'proList\' class=\'renovateTitle\' style=\'margin-top:13px;\'>暂无更多数据</span>";
						_tip += "</div>";
						$("#logisticsList0").append(_tip);
					}
				}else{
					if(result.code==4){
						layer.msg(result.msg);
					}
					var _tip = "";
					_tip += "<div style=\'text-align: center;\'>";
					_tip += "<span id=\'proList\' class=\'renovateTitle\' style=\'margin-top:13px;\'>暂无更多数据</span>";
					_tip += "</div>";
					$("#logisticsList0").append(_tip);
				}
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
	}
	
	function addToCollection(obj) {
		var infoa = $(obj).attr("data");
		var info = jQuery.parseJSON(infoa);
		var id=info.Id;
		if ($("#" + id).attr('src').indexOf("alreadyCollect") > 0) {
			cancelCollect(info, "${ctx}");

		}else{
			collect1(info, "${ctx}");
		}
		if (infoa.indexOf('\"isCollect\":\"false\"') >= 1) {
			infoa = infoa.replace('\"isCollect\":\"false\"', '\"isCollect\":\"true\"');
		} else if (infoa.indexOf('\"isCollect\":\"true\"') >= 1) {
			infoa = infoa.replace('\"isCollect\":\"true\"', '\"isCollect\":\"false\"');
		}
		$(obj).attr("data", infoa);
 	};

	//查看推荐车源详情
	function viewMatchDetails(obj,data){
		$("#dataStr").val($("#a_" + data).attr("data"));
 		$("#detailsForm").submit();
 	}
	function page() {
		if ('${totalPage}' > '${Skip}') {
			var Skip = '${Skip}' + 1;
			$("#Skip").val(Skip);
		}
	}
	
	//万佶物流货源详情
	function viewDetails(obj,id) {
		getPushCar(id);
		var infoa = obj.getAttribute("data");
		var info = jQuery.parseJSON(infoa);
		cargoDetail(info);
		ParentLayerIndex = layer.open({
			type : 1,
			shade : [ 0 ],
			skin : 'layui-layer-bg_gray',
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#supplyDetails'),
		});
	};
	function cargoDetail(cargo) {
		if(cargo.LimCarLength1==-1 && cargo.LimCarLength2==-1 && cargo.LimCarLength3==-1){
			var LimCarLengthStr = "不限";
		}else{
			var LimCarLengthStr = (cargo.LimCarLength1 != -1 ? cargo.LimCarLength1
					+ "米 " : "")
					+ (cargo.LimCarLength2 != -1 ? cargo.LimCarLength2 + "米 " : "")
					+ (cargo.LimCarLength3 != -1 ? cargo.LimCarLength3 + "米 " : "");
		}
		$("#SrcName").html(cargo.SrcName); //出发地
		$("#DestName").html(cargo.DestName);//目的地
		$("#SubTypeName").html(cargo.StrTypeCode);//货物类型
		$("#StrCount").html(cargo.StrCount);//数量
		$("#requireStr").html(cargo.LimCarLoadTypeName);//需求车型
		$("#LimCarLength").html(LimCarLengthStr);//需求车长
		$("#StrPrice").html(cargo.StrPrice);//运费
		$("#Contact").html(cargo.Contact);//发货人
		$("#Phone").html(cargo.Phone);//联系电话
		$("#IsAuth").html((cargo.IsAuth == true) ? "个人认证" : "未认证");//认证情况
		$("#IsAuthImg").css('display',
				(cargo.IsAuth == true) ? "block" : "none");
		$("#CreateDt").html(cargo.CreateDt.split(".")[0].replace("T", " "));//发布时间
	};
	
	/* 返回货源列表 */
	function backToList() {
		layer.close(ParentLayerIndex);
	}
	
	//切换列表类型
	function borClick(obj, index) {
		$(".project_operBar .borRight").eq(index).removeClass("selected");
		$(obj).addClass("selected");
		$("#logisticsList"+index).hide();
		$("#logisticsList"+(1-index)).show();
		$(".fixed_top").css("background-color",index==0?"#F55825":"#00A85A");
	}
	
	
	//异步获取中危宝货源列表
	pageNum = 1;
	function getZwbList(pageNum){
		$.ajax({
			url : "${ctx}/logistics/zwb/json/findGoods",
			type : "post",
			data : {
				"${_csrf.parameterName}":'${_csrf.token}',
				"curPage" : pageNum,
				"pageCount" : 10
			},
			dataType : "json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success : function(result) {
				layer.close(index);
				if(result.code=="70000"){
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = "";
						_div += "<div class=\'logisticsDelOper clearfix\'>";
						_div += "  <a href=\'javascript:editZwb("+info.id+","+info.biddingId+");\' style=\'float: left; text-decoration: underline;\'>修改</a>";
						_div += "  <div style=\'float: right;\' onclick=\'deleteZwbGoods("+info.id+");\'>X</div></div>";
						_div += "<div class=\'logisticsContentBar\' style=\'margin-top: 0;\' onclick=\'viewZwbDetails("+info.id+","+info.biddingId+");\'>";
						_div += "  <div style=\'border-bottom: 1px solid #F6F6F6;\'>";
						_div += "    <img src=\'${ctx}/static/weixin/images/riskLogistics/currentLocation.png\' width=\'20\' height=\'20\' style=\'vertical-align: middle;\' />";
						_div += "    <div class=\'logisticsAdd\' style=\'width: 30%;\'>"+info.startArea+"</div>";
						_div += "    <div class=\'logisticsConnect\' style=\'width: 18%;\'>";
						_div += "      <div class=\'logisticsModels\'>"+info.bidding+"</div>";
						_div += "      <div style=\'font-size: 0;\'>";
						_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/directionLine.png\' width=\'50\' height=\'5\' /></div>";
						_div += "      <div class=\'logisticsVehicleType\'>"+info.sendType+"</div></div>";
						_div += "    <img src=\'${ctx}/static/weixin/images/riskLogistics/destination.png\' width=\'20\' height=\'20\' style=\'vertical-align: middle;\' />";
						_div += "    <div class=\'logisticsAdd\' style=\'width: 25%;\'>"+info.endArea+"</div></div>";
						_div += "  <div class=\'clearfix\'>";
						_div += "    <img src=\'https://www.zwb56.com"+info.supplyTypeIcon+"\' width=\'45\' height=\'45\' class=\'logisticsHeadPortrait\' />";
						_div += "    <div class=\'logisticsLeftBar\'>";
						_div += "      <div class=\'clearfix\'>";
						_div += "        <div class=\'logisticsName\'>"+info.name+"</div>";
						_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/authentication.png\' width=\'35\' height=\'12\' class=\'logisticsAuthent\' hidden></div>";
						_div += "      <div style=\'font-size: 13px;\'>";
						_div += "        <span class=\'logisticsLabel\'>"+info.weight+"吨</span>";
						_div += "        <span class=\'logisticsLabel\'>"+info.statusName+"</span></div>";
						_div += "    </div>";
						_div += "    <div class=\'logisticsRight\'>";
						_div += "      <div class=\'logisticsTime\'>"+info.timeInfo+"</div>";
						_div += "      <a href=\'javascript:;\' onClick=\'Collection();\' style=\'text-decoration: none;\'>";
						_div += "        <img src=\'${ctx}/static/weixin/images/riskLogistics/alreadyCollect.png\' width=\'20\' height=\'20\' class=\'logisticsCollect\' hidden></a>";
						_div += "      <img src=\'${ctx}/static/weixin/images/riskLogistics/dialTelephone.png\' width=\'40\' height=\'40\' class=\'logisticsTelephone\' hidden/></div>";
						_div += "  </div>";
						_div += "</div>";
						$("#zwbCargoList").append(_div);
					}
					if(list.length<10){
						$('#getMore1').hide();
					}else{
						$('#getMore1').show();
					}
					if(pageNum==1 && list.length==0){
						$("#proList1").show();
					}
				}else{
					$("#proList1").show();
					$('#getMore1').hide();
				}
			},
			error : function() {
				layer.alert("系统异常");
			}
		});
	}
	
	//中危宝加载更多
	function getMore1(){
		pageNum++;
		getZwbList(pageNum);
	}
	
	//中危宝货源详情
	function viewZwbDetails(id,biddingId){
		$("#goodsId").val(id);
		$("#biddingState").val(biddingId);
		$("#zwbDetailForm").submit();
	}
	
	//删除中危宝货源
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
						$("#zwbCargoList").empty();
						pageNum = 1;
						getZwbList(1);
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
	function editZwb(id,biddingId){
		$("#editGoodsId").val(id);
		$("#editBiddingState").val(biddingId);
		$("#zwbEditForm").submit();
	}
</script>
</head>
<body>
	<!-- 推荐车源表单 -->
	<form id="detailsForm" action="${ctx}/logistics/wanji/weixin/carDetail" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> 
		<input type='hidden' name='carStr' id='dataStr'></input>
		<input type='hidden' name='pageType' value="0"></input>
	</form>
	
	<!-- 货源详情表单 -->
	<form id="zwbDetailForm" action="${ctx}/logistics/zwb/weixin/goodsDetail" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> 
		<input type='hidden' name='goodsId' id='goodsId'></input>
		<input type='hidden' name='biddingState' id='biddingState'></input>
	</form>
	
	<!-- 编辑货源表单 -->
	<form id="zwbEditForm" action="${ctx}/logistics/zwb/weixin/edit" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> 
		<input type='hidden' name='goodsId' id='editGoodsId'></input>
		<input type='hidden' name='biddingState' id='editBiddingState'></input>
	</form>
	
	<div class="logistics_main">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/riskLogistics/mySupply.png" width="20" height="20" style="margin: 15px 5px 0px 10px;">
			<span>我的货源</span>
		</div>
		<!-- 列表切换 -->
		<div style="padding-top: 60px;">
			<div class="project_operBar">
				<div style="width: 15%;" class="project_oper borRight selected" onClick="borClick(this,1);">货物</div>
				<div style="width: 15%;" class="project_oper borRight" onClick="borClick(this,0);">危化</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		
		<!-- 万佶列表 -->
		<div id="logisticsList0" >
		</div>
		<!-- 万佶详情弹窗 -->
		<div id="supplyDetails" class="details_main">
			<div class="fixed_top">
				<img src="${ctx}/static/weixin/images/logistics/carSourceDetails.png" width="20px;" height="20px;"
					style="margin: 15px 5px 0 10px;" /> <span style="position: absolute; top: 14px; color: #FFF;">货源详情</span>
			</div>

			<div id="scrollContent" style="width: 100%; position: fixed; top: 50px; bottom: 40px; overflow: scroll">
				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">出发地</div>
						<div id="SrcName" class="details_right">江西南昌</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">目的地</div>
						<div id="DestName" class="details_right">江西萍乡</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">货物类型</div>
						<div id="SubTypeName" class="details_right">普通</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">数量</div>
						<div id="StrCount" class="details_right">6吨</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">需求车型</div>
						<div id="requireStr" class="details_right">不限</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">需求车长</div>
						<div id="LimCarLength" class="details_right">9.6米</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">运费</div>
						<div id="StrPrice" class="details_right">面议</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">发货人</div>
						<div id="Contact" class="details_right">聂晓辉</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">联系电话</div>
						<div id="Phone" class="details_right">18970000000</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore" hidden>
						<div class="details_left">认证情况</div>
						<div id="IsAuth" class="details_right">个人认证</div>
						<img id="IsAuthImg" src="${ctx}/static/weixin/images/logistics/identityAuth.png" width="20px;" height="20px;"
							style="float: left; margin-left: 5px;" />
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">发布时间</div>
						<div id="CreateDt" class="details_right">刚刚</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div id="matchTitle" class="mySupply_top">
					<div class="mySupply_title">推荐车源</div>
				</div>

				<div id="mySupplyMatch" style="margin-bottom: 20px">
					
				</div>
				<script type="text/javascript">
					function getPushCar(id){
						$("#mySupplyMatch").empty();
						$.ajax({
							url : "${ctx}/logistics/wanji/json/pushCar",
							type : "post",
							data : {
								"${_csrf.parameterName}" : '${_csrf.token}',
								"goodsId" : id
							},
							dataType : "json",
							success : function(result) {
								if(result.code==1){
									if(pageNum==0 && result.jsonValue.Total!=null){
										//第一页显示搜索总数
										$("#carsCount").html(result.jsonValue.Total);
									}
									var list = result.value;
									
									for(var i=0;i<list.length;i++){
										var info = list[i];
										var _div = "";
										_div += "<div  class=\'logisticsContentBar\' onclick=\'viewMatchDetails(this,"+info.Id+");\'>";
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
										$("#mySupplyMatch").append(_div);
									}
								}
							},
							error : function() {
								layer.msg("获取推荐车源异常！");
							}
						});
					}
				</script>
			</div>

			<div class="fixed_bottom">
				<a href="javascript:backToList();"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;"
					style="float: left; margin: 12px 10px;" />
				</a>
				<div style="clear: both;"></div>
			</div>
		</div>

		<!-- 中危宝列表 -->
		<div id="logisticsList1" class="logistics_content" style="display:none;">
			<div style="margin-top: 10px;"></div>
			<div id="zwbCargoList"></div>
			<div id="getMore1" style="margin: 10px 1.6% 10px;">
				<a href="javascript:void(0);" onclick="getMore();" class="renovate" style="text-decoration: none;";> <span
					class="renovateTitle" style="color: #120F0F;">加载更多</span>
				</a>
			</div>
			<div style="text-align: center;">
				<span id="proList1" class="renovateTitle" style="display:none;">暂无更多数据</span>
			</div>
		</div>

		<div id="tbox" onclick="location.href='#top';"></div>
		<!-- 底部工具栏和发布货源弹窗 -->
		<%@ include file="common/createSupplyLayer.jsp"%>
		<!-- 改变工具栏第2个图标 -->
		<script type="text/javascript">
			img_green(2);
		</script>
	</div>
		<div id="addToCollection"
			style="display: none; text-align: center; padding: 20px 0;">
			<div>车源已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--我的收藏</span>”进行查看
			</div>
			<div><span id="seconds1">3</span>秒后自动关闭</div>
		</div>
		<div id="cancelCollection"
			style="display: none; text-align: center; padding: 20px 0;">
			<div>收藏已取消</div>
			<div>
				“<span style="color: #FF6707;">收藏的车源已取消</span>”
			</div>
			<div><span id="seconds2">3</span>秒后自动关闭</div>
		</div>
</body>
</html>