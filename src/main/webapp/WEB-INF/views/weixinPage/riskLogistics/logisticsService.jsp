<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>物流服务</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/url.min.js"></script>
<script src="${ctx}/static/weixin/js/layer-v2.4/layer.js" type="text/javascript"></script>
<script>
	$(function() {

		var back = Url.queryString("isBack");
		if(back == 'true') {
			$(".backBtn").show();
		}
		$('input[readonly]').on('focus', function() {
		    $(this).trigger('blur');
		});
		$("#goods1 a").each(function(index,item){
			if($(item).text().length>20){
				$(item).text($(item).text().substring(0,20)+"...");
			}
		});
		$("#risk1 a").each(function(index,item){
			if($(item).text().length>20){
				$(item).text($(item).text().substring(0,20)+"...");
			}
		});
		$(".titleName ul li").each(
				function() {//页面内容切换控制
					var index = $(this).index();
					$(".titleName ul li").eq(0).addClass("titleClick");
					$(this).click(
							function() {
								$(this).addClass("titleClick").siblings()
										.removeClass("titleClick");
								$(".titleItem>div").eq(index).stop(true).show()
										.siblings().stop(true).hide();
							})
				});
		
		var typeIndex = "";
		if(document.cookie.indexOf("searchType")!=-1){
			typeIndex = document.cookie.split("searchType=")[1].split(";")[0];
		}
		if(typeIndex==1){
			$(".titleName ul li").eq(1).click();
		}
		
		//弹出地址选择器
		getGoodsCities(leftCities0, -1, 1, 0);//获取普通物流地址
		getRisksCities(leftCities2, 0, 0, 2);//获取中危宝物流地址
		getTotalCountZwb();
		
	});

	//地址选择器
	function addressLayout(typeId) {//typeId 0为普通当前位置 1为普通目的地 2为危险当前位置 3为危险目的地
		var layerContent = $('#addressLayout' + typeId);
		var addressContent = $("#addressStr" + typeId);
		layer.open({
			type : 1,
			title : false,
			skin : 'layui-layer-bg_gray_two_btn',
			shadeClose : true,
			shade : [ 0 ],
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : layerContent,
			btn : [ '确认选择', '取消' ],
			btn1 : function() {
				var address = "";
				var codeStr = "";
				if (typeId == "0") {
					address = (province0 + city0 + county0).split("不限")[0];
// 					codeStr = province0+","+province_code0+","+city0+","+city_code0+","+county0+","+county_code0;
					codeStr = county_code0!=-2?county_code0:city_code0!=-2?city_code0:province_code0;
					$(".source").val(codeStr);
				} else if(typeId == "1"){
					address = (province1 + city1 + county1).split("不限")[0];
// 					codeStr = province1+","+province_code1+","+city1+","+city_code1+","+county1+","+county_code1;
					codeStr = county_code1!=-2?county_code1:city_code1!=-2?city_code1:province_code1;
					$(".dest").val(codeStr);
				} else if(typeId == "2"){
					address = (province2 + city2 + county2).split("不限")[0];
				} else{
					address = (province3 + city3 + county3).split("不限")[0];
				}
				$(addressContent).val(address);
				layer.closeAll();
			},
			btn2 : function() {
				layer.closeAll();
			},
		});
	}

	//异步获取货物城市字典
	province0 = "不限";
	city0 = "不限";
	county0 = "不限";
	province_code0 = "-2";
	city_code0 = "-2";
	county_code0 = "-2";
	leftCities0 = null;
	middleCities0 = null;
	rightCities0 = null;

	province1 = "不限";
	city1 = "不限";
	county1 = "不限";
	province_code1 = "-2";
	city_code1 = "-2";
	county_code1 = "-2";
	leftCities1 = null;
	middleCities1 = null;
	rightCities1 = null;
	
	function getGoodsCities(cityList, parent, index, typeId) {
		if (cityList == null) {//不刷新页面只调用一次
			$.ajax({
				url : "${ctx}/logistics/wanji/json/getAddress",
				type : "get",
				data : {
					"parent" : parent,
				},
				dataType : "json",
				success : function(result) {
					cityList = result;
					showCities(cityList, index, typeId);
					if (typeId == 0 && index == 1) {
						leftCities0 = leftCities1 = result;
						showCities(leftCities1, 1, 1);
					}
				},
				error : function() {
					layer.msg("系统异常");
				}
			});
		}
	}

	//显示城市字典1级
	function showCities(cityList, index, typeId) {
		$('#scrollerul' + typeId + index).empty();
		$('#scrollerul' + typeId + index)
				.append(
						"<li class=\"active\" style=\"line-height: 52px\" value=\"-2\" onClick=\"addAddressClick(this,"
								+ index + "," + typeId + ");\">不限</li>");
		for (var i = 0; i < cityList.length; i++) {
			$('#scrollerul' + typeId + index).append(
					"<li style=\"line-height: 52px\" value=\""
							+ cityList[i].CODE
							+ "\" onClick=\"addAddressClick(this," + index
							+ "," + typeId +");\">" + cityList[i].NAME
							+ "</li>");
		}
		if (index == 1 || index == 2) {
			$('#scrollerul' + typeId + index + ' li:first-child').click();
		}
		if (index == 2) {
			if(typeId == "0"){
				county0 = "不限";
			}else{
				county1 = "不限";
			}
		}
	}

	//获取下级城市字典
	function addAddressClick(obj, index, typeId, code) {
		if (index == 1) {
			if (typeId == 0) {
				getGoodsCities(middleCities0, $(obj).val(), 2, typeId);
				province0 = $(obj).text();
				province_code0 = $(obj).val();
			} else {
				getGoodsCities(middleCities1, $(obj).val(), 2, typeId);
				province1 = $(obj).text();
				province_code1 = $(obj).val();
			}
		} else if (index == 2) {
			if (typeId == 0) {
				getGoodsCities(rightCities0, $(obj).val(), 3, typeId);
				city0 = $(obj).text();
				city_code0 = $(obj).val();
			} else {
				getGoodsCities(rightCities1, $(obj).val(), 3, typeId);
				city1 = $(obj).text();
				city_code1 = $(obj).val();
			}
		} else {
			if (typeId == 0) {
				county0 = $(obj).text();
				county_code0 = $(obj).val();
			} else {
				county1 = $(obj).text();
				county_code1 = $(obj).val();
			}
		}
		$("#scrollerul" + typeId + index + " li").each(function(index, item) {
			$(item).removeClass("active");
		});
		$(obj).addClass("active");
	}
	
	//异步获取中危宝城市字典
	province2 = "";
	city2 = "";
	county2 = "不限";
	leftCities2 = null;
	middleCities2 = null;
	rightCities2 = null;

	province3 = "";
	city3 = "";
	county3 = "不限";
	leftCities3 = null;
	middleCities3 = null;
	rightCities3 = null;
	function getRisksCities(cityList, parent, index, typeId){
		if (cityList == null) {//不刷新页面只调用一次
			$.ajax({
				url : "${ctx}/logistics/zwb/json/area",
				type : "get",
				data : {
					"parent" : parent,
					"kind" : index
				},
				dataType : "json",
				success : function(result) {
					if(index==0){
						var rootList = result.value;
						for(var i=0;i<rootList.length;i++){
							var parentId = rootList[i].ID;
							getRisksCities(cityList,parentId,1,typeId);
						}
					}else{
						cityList = result;
						showRisksCities(cityList, index, typeId);
						if(index==1 && typeId==2){
							leftCities3 = result;
							showRisksCities(leftCities3, index, 3);
						}
					}									
				},
				error : function() {
					layer.msg("系统异常");
				}
			});
		}
	}
	
	//显示中危宝城市字典1级
	function showRisksCities(cities, index, typeId) {
		if(index!=1){
			$('#scrollerul' + typeId + index).empty();
			$('#scrollerul' + typeId + index).append(
					"<li class=\"active\" style=\"line-height: 52px\" value=\"-2\" onClick=\"addAddressClickRisk(this,"
							+ index + "," + typeId + ");\">不限</li>");
		}
		var cityList = cities.value;
		if(cityList!=null){
			for (var i = 0; i < cityList.length; i++) {
				$('#scrollerul' + typeId + index).append(
						"<li style=\"line-height: 52px\" value=\""
								+ cityList[i].ID
								+ "\" onClick=\"addAddressClickRisk(this," + index
								+ "," + typeId + "," + cityList[i].ID + ");\">" + cityList[i].NAME
								+ "</li>");
			}
			if (index == 1 || index == 2) {
				$('#scrollerul' + typeId + index + ' li:first-child').click();
			}
			if (index == 2) {
				if(typeId == "2"){
					county2 = "不限";
				}else{
					county3 = "不限";
				}
			}
		}
	}
	
	//获取中危宝下级城市字典
	function addAddressClickRisk(obj, index, typeId, code) {
		if (index == 1) {
			if (typeId == 2) {
				getRisksCities(middleCities2, $(obj).val(), 2, typeId);
				province2 = $(obj).text();
			} else {
				getRisksCities(middleCities3, $(obj).val(), 2, typeId);
				province3 = $(obj).text();
			}
		} else if (index == 2) {
			if (typeId == 2) {
				getRisksCities(rightCities2, $(obj).val(), 3, typeId);
				city2 = $(obj).text();
			} else {
				getRisksCities(rightCities3, $(obj).val(), 3, typeId);
				city3 = $(obj).text();
			}
		} else {
			if (typeId == 2) {
				county2 = $(obj).text();
			} else {
				county3 = $(obj).text();
			}
		}
		$("#scrollerul" + typeId + index + " li").each(function(index, item) {
			$(item).removeClass("active");
		});
		$(obj).addClass("active");
		if (typeId == 2) {
			$(".beginAreaId").val(code);
		} else {
			$(".endAreaId").val(code);
		}
	}
	
	//普通物流搜索-车型
	function CarTypeSelect_good(obj){
		$(".TypeCode").val($(obj).val())
	}
	
	//普通物流搜索-装载类型
	function SendTypeSelect_good(obj){
		$(".CarLoadType").val($(obj).val())
	}
	
	//搜索普通物流
	function searchGoods() {
		$(".PlateNum").val($("#goodsPlateNum").val());
		$("#form1").submit();
	}

	//搜索中危宝物流
	function searchRisks() {
		$("#form2").submit();
	}

	//清除搜索条件
	function clearSearch(type) {
		if(type==0){
			//清空表单
			$(".source").val("");
			$(".dest").val("");
			$(".PlateNum").val("");
			$(".TypeCode").val("");
			$(".CarLoadType").val("");
			
			//清空input
			$("#addressStr0").val("");
			$("#addressStr1").val("");
			$("#goodsPlateNum").val("");
			
			//清空select
			 $("#goodTable select").each(function(index,item){
				 $(item).prop('selectedIndex', 0);
			 });
			
			province0 = "不限";
			city0 = "不限";
			county0 = "不限";
			province_code0 = "-2";
			city_code0 = "-2";
			county_code0 = "-2";
			leftCities0 = null;
			middleCities0 = null;
			rightCities0 = null;

			province1 = "不限";
			city1 = "不限";
			county1 = "不限";
			province_code1 = "-2";
			city_code1 = "-2";
			county_code1 = "-2";
			leftCities1 = null;
			middleCities1 = null;
			rightCities1 = null;
		}
		else if(type==1){
			//清空表单
			$(".carTypeId").val("");
			$(".goodsWeightStart").val("");
			$(".goodsWeightEnd").val("");
			$(".sendType").val("");
			$(".linesFlag").val("");
			$(".totalPriceStart").val("");
			$(".totalPriceEnd").val("");
			$(".biddingState").val("");
			
			//清空select
			 $("#riskTable select").each(function(index,item){
				 $(item).prop('selectedIndex', 0);
			 });
			
			//清空input
			$("#addressStr2").val("");
			$("#addressStr3").val("");
		}
	}
	
	//中危宝搜索-车型
	function CarTypeSelect_risk(obj){
		$(".carTypeId").val($(obj).val())
	}
	//中危宝搜索-剩余重量
	function GoodsWeightSelect_risk(obj){
		var i = $(obj).val();
		$(".goodsWeightStart").val(i=="2"?"1":i=="3"?"5":i=="4"?"10":i=="5"?"20":"");
		$(".goodsWeightEnd").val(i=="1"?"1":i=="2"?"5":i=="3"?"10":i=="4"?"20":"");
		
	}
	//中危宝搜索-运输方式
	function SendTypeSelect_risk(obj){
		$(".sendType").val($(obj).val())
	}
	//中危宝搜索-路线类型 接口没提供这个字段搜索 先隐藏
	function LinesFlagSelect_risk(obj){
		$(".linesFlag").val($(obj).val())
	}
	//中危宝搜索-运价
	function TotalPriceSelect_risk(obj){
		var i = $(obj).val();
		$(".totalPriceStart").val(i=="1"?"1":i=="2"?"5000":i=="3"?"10000":i=="4"?"15000":"");
		$(".totalPriceEnd").val(i=="1"?"5000":i=="2"?"10000":i=="3"?"15000":"");
		$(".biddingState").val(i=="0"?"1":"");
	}
	
	//异步获取中危宝车源总数
	function getTotalCountZwb(){
		$.ajax({
			url : "${ctx}/logistics/zwb/json/findCar",
			type : "get",
			data : {},
			dataType : "json",
			success : function(result) {
				$("#totalCount").text(result.jsonValue.totalCount);
			},
			error : function() {
				layer.msg("系统异常");
				$("#totalCount").text("0");
			}
		});
	}
	
	//改变货物类型
	function changeSearchType(type){
		document.cookie="searchType="+type; 
	}
</script>
</head>
<body>
	<!-- 普通物流表单 -->
	<form id="form1" action="${ctx}/logistics/wanji/weixin/findCar" name="form1" method="get">
<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input>  --%>
		<input type='hidden' name='AdCode' class='source'></input> 
		<input type="hidden" name="TargetAdCode" class='dest'></input> 
		<input type='hidden' name='TypeCode' class='TypeCode'></input> 
		<input type="hidden" name="CarLoadType" class='CarLoadType'></input> 
		<input type="hidden" name="PlateNum" class="PlateNum"></input>
	</form>
	
	<!-- 中危宝物流表单 -->
	<form id="form2" action="${ctx}/logistics/zwb/weixin/SearchRisks" name="form2" method="get">
<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input>  --%>
		<input type='hidden' name='beginAreaId' class='beginAreaId'></input> 
		<input type="hidden" name="endAreaId" class='endAreaId'></input> 
		
		<input type='hidden' name='carTypeId' class='carTypeId'></input> 
		<input type='hidden' name='goodsWeightStart' class='goodsWeightStart'></input> 
		<input type='hidden' name='goodsWeightEnd' class='goodsWeightEnd'></input>
		<input type='hidden' name='sendType' class='sendType'></input>  
		<input type='hidden' name='totalPriceStart' class='totalPriceStart'></input> 
		<input type='hidden' name='totalPriceEnd' class='totalPriceEnd'></input>
		<input type='hidden' name='biddingState' class='biddingState'></input>
	</form>

	<div class="logistics_main">
		<div class="logistics_content">
			<div class="titleName clearfix">
				<ul>
					<li><a href="javascript:changeSearchType(0);">货物运输</a></li>
					<li><a href="javascript:changeSearchType(1);">危化运输</a></li>
					<li><a href="javascript:;">钢材运输</a></li>
				</ul>
			</div>
			<div class="titleItem">
				<div>
					<div>
						<div class="headDisplay clearfix">
							<img src="${ctx}/static/weixin/images/riskLogistics/goods.png"> <span><font>${total}</font>辆车源</span>
						</div>
						<div class="shell">
							<div id="ink_con1">
								<a href="javascript:;" target="_blank">139******47委托了43.33吨货物正在询价</a>
								<a href="javascript:;" target="_blank">189******21了发布了 一条物流信息</a>
								<a href="javascript:;" target="_blank">昆山到南通每个月有10万吨稳定的玻璃运输和回程车</a>
								<a href="javascript:;" target="_blank">顺兴物流 珍惜所托，承载信任！</a>
								<a href="javascript:;" target="_blank">1秒前  陈** 发布了 一条货源信息</a>
								<a href="javascript:;" target="_blank">13323713858 竞价了 张**的货源</a>
								<a href="javascript:;" target="_blank">139******47承运了弋阳县*******公司的邮包13.00吨</a>
								<a href="javascript:;" target="_blank">速雁速运 价格真实，诚信保障！</a>
								<a href="javascript:;" target="_blank">昆山到成都每个月有10万吨稳定的玻璃运输和回程车</a>
								<a href="javascript:;" target="_blank">1秒前 18938841920 抢了 一条货源</a>
								<a href="javascript:;" target="_blank">李现周：本人有七米江淮卡车两辆</a>
								<a href="javascript:;" target="_blank">北京-石家庄 高栏车 9.6米+150吨吴德勇 18682467476</a>
								<a href="javascript:;" target="_blank">昆山华宏 安全快捷，高效实惠！</a>
								<a href="javascript:;" target="_blank">十堰市到杭州市20吨货物 刘超 186******70</a>
								<a href="javascript:;" target="_blank">186******85委托了 56.76吨货物</a>
								<a href="javascript:;" target="_blank">远成快运 专注最后一公里</a>
								<a href="javascript:;" target="_blank">5秒前 昆明******公司发布了一条物流专线</a>
								<a href="javascript:;" target="_blank">3分钟前 王**  发布了 一条车源信息</a>
								<a href="javascript:;" target="_blank">135******32委托 16.85吨货物已经成交</a>
								<a href="javascript:;" target="_blank">供应链金融服务促进物流企业繁荣</a>
								<a href="javascript:;" target="_blank">刘**承运了赣州*****公司的货物21.00吨</a>
								<a href="javascript:;" target="_blank">查岗->天津有货11吨奶粉，有车谈价</a>
								<a href="javascript:;" target="_blank">河南正阳->海南澄迈,有重货,求6.8-9.6米车,价高急走</a>
								<a href="javascript:;" target="_blank">石家装27吨重货，求半挂车，钱**，151******65</a>
								<a href="javascript:;" target="_blank">吉安****公司发布了一条货源信息</a>
								<a href="javascript:;" target="_blank">江西宜春樟树->陕西安康,有12吨货,求8米高栏车</a>
								<a href="javascript:;" target="_blank">1秒前 何承清 发布了 一条车源信息</a>
								<a href="javascript:;" target="_blank">急需司机从河南省平顶山到江西赣州安远县，张**</a>
								<a href="javascript:;" target="_blank">互联网物流企业的5种模式与发展前景</a>
								<a href="javascript:;" target="_blank">10秒前 上海**物流有限公司 发布了一条物流专线</a>
								<a href="javascript:;" target="_blank">李**承运了张**的货物15.23吨</a>
								<a href="javascript:;" target="_blank">深圳--广西南宁求12.5*13.5*17.5集装箱车</a>
								<a href="javascript:;" target="_blank">远洋****公司发布包头-天津重货,每吨230元,半挂货源</a>
								<a href="javascript:;" target="_blank">凯安******公司求9.6厢式车，需两个司机</a>
								<a href="javascript:;" target="_blank">17小时前 189******36 发布了 一条车辆信息 </a>
								<a href="javascript:;" target="_blank">四方货运，规范，诚信，快捷，方便！</a>
								<a href="javascript:;" target="_blank">河南郑州管城回程车：豫GB59** 25吨，9.6米</a>
								<a href="javascript:;" target="_blank">银川至安徽巢湖，有货汽配摩配，求整车配货5吨4立方米</a>
								<a href="javascript:;" target="_blank">春辉物流，你开快运店，我帮运营！</a>
								<a href="javascript:;" target="_blank">升通快运，网布全球，升通必达！</a>
								<a href="javascript:;" target="_blank">[山东泰安--浙江义乌]货源，整车，26吨</a>
								<a href="javascript:;" target="_blank">3秒前 天津市**货运有限公司 发布了一条物流专线</a>
								<a href="javascript:;" target="_blank">安捷快运，海量客源，不愁接单！</a>
								<a href="javascript:;" target="_blank">浙江湖州--吴兴浙江 温州回程车 皖KE28**</a>
							</div>
						</div>
						<script>
						var c1,_=Function;
						with(o1=document.getElementById("ink_con1")){ innerHTML+=innerHTML; onmouseover=_("c1=1"); onmouseout=_("c1=0");}
						(F1=_("if(#%20||!c1)#++,#%=o1.scrollHeight>>1;setTimeout(F1,#%20?10:1500);".replace(/#/g,"o1.scrollTop")))();
						</script>
						
						<div class="caption_top">
							<div class="caption_title">查找车源</div>
						</div>
						<div class="lookupCont">
							<table id="goodTable">
								<tr>
									<td colspan="1" class="release_attribute">当前位置</td>
									<td colspan="3" class="release_table78">
									<input style="width: 96%;" onselectstart="return false;" id="addressStr0" placeholder="请选择出发地" readonly="readonly" onclick="addressLayout(0);"/>
											</td>
								</tr>
								<tr>
									<td colspan="1" class="release_attribute">期望流向</td>
									<td colspan="3" class="release_table78">
									<input style="width: 96%;" id="addressStr1" placeholder="请选择目的地" readonly="readonly" onclick="addressLayout(1);"/></td>
								</tr>
								<tr>
									<td colspan="1" class="release_attribute">车型</td>
									<td colspan="3" class="release_table78"><select style="width: 50%;" onchange="CarTypeSelect_good(this);">
											<option value="-1">—— 不限 ——</option>
											<c:forEach items="${CarTypeDictsList}" var="info">
												<option value="${info.Code}">${info.Name}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td colspan="1" class="release_attribute">装载类型</td>
									<td colspan="3" class="release_table78"><select style="width: 96%;" onchange="SendTypeSelect_good(this);">
											<option value="-1">————— 不限 —————</option>
											<c:forEach items="${CarLoadDictsList}" var="info">
												<option value="${info.Code}">${info.Name}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td colspan="1" class="release_attribute">车牌号</td>
									<td colspan="3" class="release_table78" style="padding-right: 10px;">
									<input type="text" id="goodsPlateNum" style="width: 100%; outline: none;" placeholder="" /></td>
								</tr>
							</table>
							<div class="lookupBtnBar clearfix">
								<div class="lookupBrnWhite" onclick="clearSearch(0);">一键清除</div>
								<div class="lookupBrnGreen" onclick="searchGoods();">搜索</div>
							</div>
						</div>
					</div>
				</div>


				<!-- risk -->
				<div style="display: none;">
					<div>
						<div class="headDisplay clearfix" style="background-color: #F55825;">
							<img src="${ctx}/static/weixin/images/riskLogistics/risk.png" width="64.5" height="44"> <span><font id="totalCount">0</font>辆车源</span>
						</div>
						<div class="shell">
							<div id="ink_con2">
								<a href="javascript:;" target="_blank">139******47委托了43.33吨货物正在询价</a>
								<a href="javascript:;" target="_blank">189******21了发布了 一条物流信息</a>
								<a href="javascript:;" target="_blank">昆山到南通每个月有10万吨稳定的玻璃运输和回程车</a>
								<a href="javascript:;" target="_blank">顺兴物流 珍惜所托，承载信任！</a>
								<a href="javascript:;" target="_blank">1秒前  陈** 发布了 一条货源信息</a>
								<a href="javascript:;" target="_blank">13323713858 竞价了 张**的货源</a>
								<a href="javascript:;" target="_blank">139******47承运了弋阳县*******公司的邮包13.00吨</a>
								<a href="javascript:;" target="_blank">速雁速运 价格真实，诚信保障！</a>
								<a href="javascript:;" target="_blank">昆山到成都每个月有10万吨稳定的玻璃运输和回程车</a>
								<a href="javascript:;" target="_blank">1秒前 18938841920 抢了 一条货源</a>
								<a href="javascript:;" target="_blank">李现周：本人有七米江淮卡车两辆</a>
								<a href="javascript:;" target="_blank">北京-石家庄 高栏车 9.6米+150吨吴德勇 18682467476</a>
								<a href="javascript:;" target="_blank">昆山华宏 安全快捷，高效实惠！</a>
								<a href="javascript:;" target="_blank">十堰市到杭州市20吨货物 刘超 186******70</a>
								<a href="javascript:;" target="_blank">186******85委托了 56.76吨货物</a>
								<a href="javascript:;" target="_blank">远成快运 专注最后一公里</a>
								<a href="javascript:;" target="_blank">5秒前 昆明******公司发布了一条物流专线</a>
								<a href="javascript:;" target="_blank">3分钟前 王**  发布了 一条车源信息</a>
								<a href="javascript:;" target="_blank">135******32委托 16.85吨货物已经成交</a>
								<a href="javascript:;" target="_blank">供应链金融服务促进物流企业繁荣</a>
								<a href="javascript:;" target="_blank">刘**承运了赣州*****公司的货物21.00吨</a>
								<a href="javascript:;" target="_blank">查岗->天津有货11吨奶粉，有车谈价</a>
								<a href="javascript:;" target="_blank">河南正阳->海南澄迈,有重货,求6.8-9.6米车,价高急走</a>
								<a href="javascript:;" target="_blank">石家装27吨重货，求半挂车，钱**，151******65</a>
								<a href="javascript:;" target="_blank">吉安****公司发布了一条货源信息</a>
								<a href="javascript:;" target="_blank">江西宜春樟树->陕西安康,有12吨货,求8米高栏车</a>
								<a href="javascript:;" target="_blank">1秒前 何承清 发布了 一条车源信息</a>
								<a href="javascript:;" target="_blank">急需司机从河南省平顶山到江西赣州安远县，张**</a>
								<a href="javascript:;" target="_blank">互联网物流企业的5种模式与发展前景</a>
								<a href="javascript:;" target="_blank">10秒前 上海**物流有限公司 发布了一条物流专线</a>
								<a href="javascript:;" target="_blank">李**承运了张**的货物15.23吨</a>
								<a href="javascript:;" target="_blank">深圳--广西南宁求12.5*13.5*17.5集装箱车</a>
								<a href="javascript:;" target="_blank">远洋****公司发布包头-天津重货,每吨230元,半挂货源</a>
								<a href="javascript:;" target="_blank">凯安******公司求9.6厢式车，需两个司机</a>
								<a href="javascript:;" target="_blank">17小时前 189******36 发布了 一条车辆信息 </a>
								<a href="javascript:;" target="_blank">四方货运，规范，诚信，快捷，方便！</a>
								<a href="javascript:;" target="_blank">河南郑州管城回程车：豫GB59** 25吨，9.6米</a>
								<a href="javascript:;" target="_blank">银川至安徽巢湖，有货汽配摩配，求整车配货5吨4立方米</a>
								<a href="javascript:;" target="_blank">春辉物流，你开快运店，我帮运营！</a>
								<a href="javascript:;" target="_blank">升通快运，网布全球，升通必达！</a>
								<a href="javascript:;" target="_blank">[山东泰安--浙江义乌]货源，整车，26吨</a>
								<a href="javascript:;" target="_blank">3秒前 天津市**货运有限公司 发布了一条物流专线</a>
								<a href="javascript:;" target="_blank">安捷快运，海量客源，不愁接单！</a>
								<a href="javascript:;" target="_blank">浙江湖州--吴兴浙江 温州回程车 皖KE28**</a>
							</div>
						</div>
						<script>
						var c2,_=Function;
						with(o2=document.getElementById("ink_con2")){ innerHTML+=innerHTML; onmouseover=_("c2=1"); onmouseout=_("c2=0");}
						(F2=_("if(#%20||!c2)#++,#%=o2.scrollHeight>>1;setTimeout(F2,#%20?10:1500);".replace(/#/g,"o2.scrollTop")))();
						</script>
						
						<div class="caption_top">
							<div class="caption_title">查找车源</div>
						</div>
						<div class="lookupCont">
							<table id="riskTable">
								<tr>
									<td colspan="1" class="release_attribute">当前位置</td>
									<td colspan="3" class="release_table78">
									<input style="width: 96%;" id="addressStr2" placeholder="请选择出发地" readonly="readonly" onclick="addressLayout(2);"/></td>
								</tr>
								<tr>
									<td colspan="1" class="release_attribute">期望流向</td>
									<td colspan="3" class="release_table78">
									<input style="width: 96%;" id="addressStr3" placeholder="请选择目的地" readonly="readonly" onclick="addressLayout(3);"/></td>
								</tr>
								<tr>
									<td colspan="1" class="release_attribute">车型</td>
									<td colspan="3" class="release_table78">
									<select style="width: 55%;" onchange="CarTypeSelect_risk(this);">
											<option>—— 不限 ——</option>
											<option value="25">铝合金罐车</option>
											<option value="26">不锈钢罐车</option>
											<option value="27">压力罐车</option>
											<option value="28">铁罐车</option>
											<option value="29">仓栏危化品车</option>
											<option value="30">集装箱危化品车</option>
											<option value="69">不锈钢保温罐车</option>
											<option value="70">碳钢罐车</option>
											<option value="71">铝罐车</option>
											<option value="72">玻璃钢罐车</option>
											<option value="73">高栏车</option>
											<option value="74">平板车</option>
											<option value="75">厢式车</option>
											<option value="76">其它</option>
									</select></td>
								</tr>
								<tr>
									<td colspan="1" class="release_attribute">剩余重量</td>
									<td colspan="3" class="release_table78">
									<select style="width: 55%;" onchange="GoodsWeightSelect_risk(this);">
											<option>—— 不限 ——</option>
											<option value="1">1吨以下</option>
											<option value="2">1-5吨</option>
											<option value="3">5-10吨</option>
											<option value="4">10-20吨</option>
											<option value="5">20吨以上</option>
									</select></td>
								</tr>
								<tr>
									<td colspan="1" class="release_attribute">运输方式</td>
									<td colspan="3" class="release_table78">
									<select style="width: 40%;" onchange="SendTypeSelect_risk(this);">
											<option>— 不限 —</option>
											<option value="0">零担</option>
											<option value="1">整车</option>
									</select></td>
								</tr>
								<!-- 接口没提供这个字段搜索 先隐藏 -->
<!-- 								<tr> -->
<!-- 									<td colspan="1" class="release_attribute">路线类型</td> -->
<!-- 									<td colspan="3" class="release_table78"> -->
<!-- 									<select style="width: 40%;" onchange="LinesFlagSelect_risk(this);"> -->
<!-- 											<option>— 不限 —</option> -->
<!-- 											<option value="1">去程</option> -->
<!-- 											<option value="2">返程</option> -->
<!-- 											<option value="3">专程</option> -->
<!-- 									</select></td> -->
<!-- 								</tr> -->
								<tr>
									<td colspan="1" class="release_attribute">运价</td>
									<td colspan="3" class="release_table78">
									<select style="width: 96%;" onchange="TotalPriceSelect_risk(this);">
											<option>————— 不限 —————</option>
											<option value="0">面议</option>
											<option value="1">5000元以下</option>
											<option value="2">5000-10000元</option>
											<option value="3">10000-15000元</option>
											<option value="4">15000元以上</option>
									</select></td>
								</tr>
							</table>
							<div class="lookupBtnBar clearfix">
								<div class="lookupBrnWhite" onclick="clearSearch(1);">一键清除</div>
								<div class="lookupBrnOrange" onclick="searchRisks();">搜索</div>
							</div>
						</div>
					</div>
				</div>

				<div style="display: none;">
					<img src="${ctx}/static/weixin/images/riskLogistics/building.png" width="100" height="158" style="display: block; margin: 140px auto;">
				</div>
			</div>
		</div>


		<!-- 底部工具栏和发布货源弹窗 -->
		<%@ include file="common/createSupplyLayer.jsp"%>
		<!-- 改变工具栏第0个图标 -->
		<script type="text/javascript">img_green(0);</script>
	</div>

	<!-- 普通货物出发地 -->
	<div id="addressLayout0" style="display: none; text-align: center; padding: 20px 0;">
		<!--菜单-->
		<div class="Menu_box">
			<!---------左侧菜单---------->
			<div id="left_Menu">
				<div class="ot-menu" id="scroller" style="width: 100%; height: 600px; overflow: auto">
					<ul id="scrollerul01" style="overflow: hidden; height: auto; width: 100%">
					</ul>
				</div>
			</div>

			<div id="middle_Menu">
				<div class="ot-menu" id="scroller2" style="width: 100%; height: 100%; overflow: auto">
					<ul id="scrollerul02">
					</ul>
				</div>
			</div>

			<!---------右侧侧菜单---------->
			<div id="right_Menu">
				<div class="ot-menu" id="scroller3" style="width: 100%; height: 100%; overflow: auto">
					<ul id="scrollerul03">
					</ul>
				</div>
			</div>
		</div>
		<!--菜单end-->
	</div>

	<!-- 普通货物目的地 -->
	<div id="addressLayout1" style="display: none; text-align: center; padding: 20px 0;">
		<!--菜单-->
		<div class="Menu_box">
			<!---------左侧菜单---------->
			<div id="left_Menu">
				<div class="ot-menu" id="scroller" style="width: 100%; height: 600px; overflow: auto">
					<ul id="scrollerul11" style="overflow: hidden; height: auto; width: 100%">
					</ul>
				</div>
			</div>

			<div id="middle_Menu">
				<div class="ot-menu" id="scroller2" style="width: 100%; height: 100%; overflow: auto">
					<ul id="scrollerul12">
					</ul>
				</div>
			</div>

			<!---------右侧侧菜单---------->
			<div id="right_Menu">
				<div class="ot-menu" id="scroller3" style="width: 100%; height: 100%; overflow: auto">
					<ul id="scrollerul13">
					</ul>
				</div>
			</div>
		</div>
		<!--菜单end-->
	</div>
	
	<!-- 危险货物出发地 -->
	<div id="addressLayout2" style="display: none; text-align: center; padding: 20px 0;">
		<!--菜单-->
		<div class="Menu_box">
			<!---------左侧菜单---------->
			<div id="left_Menu">
				<div class="ot-menu" id="scroller" style="width: 100%; height: 600px; overflow: auto">
					<ul id="scrollerul21" style="overflow: hidden; height: auto; width: 100%">
						<li class="active" style="line-height: 52px" value="-2" onClick="addAddressClickRisk(this,1,2);">不限</li>
					</ul>
				</div>
			</div>

			<div id="middle_Menu">
				<div class="ot-menu" id="scroller2" style="width: 100%; height: 100%; overflow: auto">
					<ul id="scrollerul22">
					</ul>
				</div>
			</div>

			<!---------右侧侧菜单---------->
			<div id="right_Menu">
				<div class="ot-menu" id="scroller3" style="width: 100%; height: 100%; overflow: auto">
					<ul id="scrollerul23">
					</ul>
				</div>
			</div>
		</div>
		<!--菜单end-->
	</div>

	<!-- 危险货物目的地 -->
	<div id="addressLayout3" style="display: none; text-align: center; padding: 20px 0;">
		<!--菜单-->
		<div class="Menu_box">
			<!---------左侧菜单---------->
			<div id="left_Menu">
				<div class="ot-menu" id="scroller" style="width: 100%; height: 600px; overflow: auto">
					<ul id="scrollerul31" style="overflow: hidden; height: auto; width: 100%">
						<li class="active" style="line-height: 52px" value="-2" onClick="addAddressClickRisk(this,1,3);">不限</li>
					</ul>
				</div>
			</div>

			<div id="middle_Menu">
				<div class="ot-menu" id="scroller2" style="width: 100%; height: 100%; overflow: auto">
					<ul id="scrollerul32">
					</ul>
				</div>
			</div>

			<!---------右侧侧菜单---------->
			<div id="right_Menu">
				<div class="ot-menu" id="scroller3" style="width: 100%; height: 100%; overflow: auto">
					<ul id="scrollerul33">
					</ul>
				</div>
			</div>
		</div>
		<!--菜单end-->
	</div>
	<div class="backBtn" onclick="history.go(-1)" style="display: none;"></div>
	
	
</body>
</html>