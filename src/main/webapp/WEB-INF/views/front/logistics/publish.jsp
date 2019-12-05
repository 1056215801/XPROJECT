<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发布货源</title>
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
<link href="${ctx}/static/css/logistics/logisticsPlatform.css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<style type="text/css">
	.searchable-select-holder {box-shadow:none;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=D78b0dc2cbe084a990e6032784c44adf"></script>
<script>
 $(function(){
	$('.tabItem').children().eq(0).css({'display':'none'});
	$('.tabItem').children().eq(1).css({'display':'block'});
    $(".tabName ul li").each(function(){
		var index=$(this).index();
		$(".tabName ul li").eq(1).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(4).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".releaseName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".releaseName ul li").eq(0).addClass("releaseClick");
		$(this).click(function(){
			$(this).addClass("releaseClick").siblings().removeClass("releaseClick");
			$(".releaseItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
 });
 
</script>

</head>

<body>
<div class="share_main">
	<div class="project_header">
	    <%@ include file="../common/header.jsp"%>
	</div>
	<div class="release_content">
		<div class="releaseName">
			<ul>
				<li><a href="javascript:;">发布货源</a></li>
			</ul>
			<div style="clear:both;"></div>
		</div>
		<div class="releaseItem">
			<div>
				<div class="release_inputBar">
					<!-- <div class="release_input clearfix">
						<a href="javascript:void(0);" class="renovate" >
							<span class="renovateTitle">基础信息</span>
						</a>
					</div> -->
					<div style="padding:7px 5px; margin-bottom:10px; border-bottom: 1px solid #ccc; position: relative;">
						<div style="font-size: 16px; color:#000;">基础信息</div>
					</div>
					<c:choose>
						<c:when test="${type==1}">
							<form action="" id="wanjiForm" method="post">
								<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
								<!-- 发货地址 -->
								<input type="hidden" id="SrcAdCode_H" name="SrcAdCode">
								<input type="hidden" id="SrcProvince_H" name="SrcProvince">
								<input type="hidden" id="SrcCity_H" name="SrcCity">
								<input type="hidden" id="SrcArea_H" name="SrcArea">
								<!-- 收货地址 -->
								<input type="hidden" id="DestAdCode_H" name="DestAdCode">
								<input type="hidden" id="DestProvince_H" name="DestProvince">
								<input type="hidden" id="DestCity_H" name="DestCity">
								<input type="hidden" id="DestArea_H" name="DestArea">
								<!-- 地址距离 -->
								<input type="hidden" id="TotalMileage_H" name="TotalMileage">
								<!-- 主类型及单位 -->
								<input type="hidden" id="TypeCode_H" name="TypeCode">
								<input type="hidden" id="CountUnit_H" name="CountUnit">
								<!-- 子类型 -->
								<input type="hidden" id="SubTypeCode_H" name="SubTypeCode">
								<input type="hidden" id="SubTypeName_H" name="SubTypeName">
								<!-- 车型 -->
								<input type="hidden" id="LimCarTypeCode_H" name="LimCarTypeCode" value="-1">
								<input type="hidden" id="LimCarTypeName_H" name="LimCarTypeName">
								<input type="hidden" id="LimCarLoadTypeCode_H" name="LimCarLoadTypeCode" value="-1">
								<input type="hidden" id="LimCarLoadTypeName_H" name="LimCarLoadTypeName">	
								<!-- 车尺寸 -->
								<input type="hidden" id="LimCarWidth_H" name="LimCarWidth" value="-1">
								<input type="hidden" id="LimCarLength1_H" name="LimCarLength1" value="-1">
								<input type="hidden" id="LimCarLength2_H" name="LimCarLength2" value="-1">
								<input type="hidden" id="LimCarLength3_H" name="LimCarLength3" value="-1">	
								<!-- 报价 -->
								<input type="hidden" id="Price_H" name="Price" value="0">
								<input type="hidden" id="OfferType_H" name="OfferType">	
								<!-- 重发 -->
								<input type="hidden" id="RepeatSum_H" name="RepeatSum" value="0">
								<input type="hidden" id="RepeatInterval_H" name="RepeatInterval" value="0">	
								<div id="wanjiBasic">
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">发货地</span>
										<span style="margin-left: 15px;">
											<select id="srcProvince" class="screenRegion" style="width:25%;" ><option value="0">省份/自治区</option></select> 
											<select id="srcCity" class="screenRegion" style="width:25%;" disabled><option value="0">城市/自治州</option></select>
											<select id="srcTown" class="screenRegion" style="width:25%;" disabled><option value="0">区/县</option></select>
										</span>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">目的地</span>
										<span style="margin-left: 15px;">
											<select id="destProvince" class="screenRegion" style="width:25%;" ><option value="0">省份/自治区</option></select> 
											<select id="destCity" class="screenRegion" style="width:25%;" disabled><option value="0">城市/自治州</option></select>
											<select id="destTown" class="screenRegion" style="width:25%;" disabled><option value="0">区/县</option></select>
										</span>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">主类型</span>
										<div class="searchOptionsRel clearfix" id="TypeCode">
											<div class="searchOptions selected" data="1" onclick="selectTag('TypeCode',this)">重货</div>
											<div class="searchOptions" data="2" onclick="selectTag('TypeCode',this)">泡货</div>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">子类型</span>
										<div class="searchOptionsRel clearfix" id="SubTypeCode">
											<c:forEach items="${wanjiDict.cargoSubTypeDictsList}" var="info" varStatus="status">
												<c:choose>
													<c:when test="${status.index==0}">
														<div class="searchOptions selected" data="${info.Code}" onclick="selectTag('SubTypeCode',this)">${info.Name}</div>
													</c:when>
													<c:otherwise>
														<div class="searchOptions" data="${info.Code}" onclick="selectTag('SubTypeCode',this)">${info.Name}</div>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">车长</span>
										<div class="searchOptionsRel clearfix" id="LimCarLength">
											<c:forEach items="${wanjiDict.CarLengthDictsList}" var="info" varStatus="status">
												<c:choose>
													<c:when test="${status.index==0}">
														<div class="searchOptions selected" data="${info.Code}" onclick="selectLength('LimCarLength',this)">${info.Name}</div>
													</c:when>
													<c:otherwise>
														<div class="searchOptions" data="${info.Code}" onclick="selectLength('LimCarLength',this)">${info.Name}</div>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<!-- <div style="clear:both;"></div> -->
											<div style=" color: #aaa; font-size: 12px;">（最多只能选择三个标签 ）</div> 
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">货物数量</span>
										<input type="text" class="inputBox" style="width:25%;" id="MinCount" name="MinCount" placeholder="请输入最小数量" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)' maxlength="8"/>
										<input type="text" class="inputBox" style="width:25%;" id="MaxCount" name="MaxCount" placeholder="请输入最大数量" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)' maxlength="8"/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">联系人</span>
										<input type="text" class="inputBox" style="width:25%;" id="Contact" name="Contact" placeholder="请输入联系人" value="${accountName}"/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">联系电话</span>
										<input type="text" class="inputBox" style="width:25%;" id="Phone" name="Phone" placeholder="请输入联系电话" value="${accountCode}" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)' maxlength="11"/>
									</div>
								</div>
								<!-- <div class="release_input clearfix">
									<a href="javascript:void(0);" class="renovate" onclick="showExtended('1')">
										<span class="renovateTitle" >扩展信息</span>
									</a>
								</div> -->
								<div style="padding:7px 5px; margin-bottom:10px; border-bottom: 1px solid #ccc; position: relative;">
									<div style="font-size: 16px; color:#000;">扩展信息</div>
									<div id="moreContral" onclick="showExtended('1')" style="position: absolute; right:10px; top:18px; cursor: pointer; font-size: 12px; color:#f14241;">点击填写更多信息 +</div>
								</div>
								<div style="display: none;" id="wanjiExtended">
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">车型</span>
										<div class="searchOptionsRel clearfix" id="LimCarTypeCode">
											<div class="searchOptions selected" data="-1" onclick="selectTag('LimCarTypeCode',this)">不限</div>
											<c:forEach items="${wanjiDict.CarTypeDictsList}" var="info">
												<div class="searchOptions" data="${info.Code}" onclick="selectTag('LimCarTypeCode',this)">${info.Name}</div>
											</c:forEach>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">载型</span>
										<div class="searchOptionsRel clearfix" id="LimCarLoadTypeCode">
											<div class="searchOptions selected" data="-1" onclick="selectTag('LimCarLoadTypeCode',this)">不限</div>
											<c:forEach items="${wanjiDict.CarLoadDictsList}" var="info">
												<div class="searchOptions" data="${info.Code}" onclick="selectTag('LimCarLoadTypeCode',this)">${info.Name}</div>
											</c:forEach>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">报价方式</span> 
										<div class="searchOptionsRel clearfix" id="OfferType">
											<div class="searchOptions selected" data="0" onclick="selectTag('OfferType',this)">无限制</div>
											<div class="searchOptions" data="1" onclick="selectTag('OfferType',this)">元/车</div>
											<div class="searchOptions" data="2" onclick="selectTag('OfferType',this)">元/吨</div>
											<div class="searchOptions" data="3" onclick="selectTag('OfferType',this)">元/方</div>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">数量</span>
										<input type="text" class="inputBox" style="width:25%;" id="CarCount" name="CarCount" value="1" placeholder="请输入所需车数量" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)' maxlength="6"/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">重发间隔</span>
										<div class="searchOptionsRel clearfix" id="RepeatSum">
											<div class="searchOptions selected" data="0" onclick="selectTag('RepeatSum',this)">不重发</div>
											<div class="searchOptions" data="10" onclick="selectTag('RepeatSum',this)">10分钟</div>
											<div class="searchOptions" data="30" onclick="selectTag('RepeatSum',this)">半小时</div>
											<div class="searchOptions" data="60" onclick="selectTag('RepeatSum',this)">一小时</div>
											<div class="searchOptions" data="120" onclick="selectTag('RepeatSum',this)">两小时</div>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">重发次数</span>
										<div class="searchOptionsRel clearfix" id="RepeatInterval">
											<div class="searchOptions selected" data="0" onclick="selectTag('RepeatInterval',this)">不重发</div>
											<div class="searchOptions" data="1" onclick="selectTag('RepeatInterval',this)">1次</div>
											<div class="searchOptions" data="3" onclick="selectTag('RepeatInterval',this)">3次</div>
											<div class="searchOptions" data="5" onclick="selectTag('RepeatInterval',this)">5次</div>
											<div class="searchOptions" data="10" onclick="selectTag('RepeatInterval',this)">10次</div>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">备选电话</span>
										<input type="text" class="inputBox" style="width:81.5%;" id="PhoneBak" name="PhoneBak" placeholder="请输入备选电话，使用|分隔"/>
									</div>
								</div>
							</form>
						</c:when>
						<c:when test="${type==2}">
							<form action="" id="zwbForm" method="post">
								<input type="hidden" id="beginAreaId" name="beginAreaId" value=""/>
								<input type="hidden" id="endAreaId" name="endAreaId" value=""/>
								<input type="hidden" id="goodsTypeId" name="goodsTypeId" value="${zwbPublishgoodsLogBean.goodsTypeId}"/>
								<input type="hidden" id="sendType" name="sendType" value="${zwbPublishgoodsLogBean.sendType}"/>
								<input type="hidden" id="goodsId" name="goodsId" value="${zwbPublishgoodsLogBean.goodsId}"/>
								<div id="zwbBasic">
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">发货地</span>
										<select id="beginArea" class="screenRegion" style="width:15%;" ><option value="-1">地区</option></select>
										<select id="beginProvince" class="screenRegion" style="width:15%;" disabled><option value="-1">省份/自治区</option></select> 
										<select id="beginCity" class="screenRegion" style="width:15%;" disabled><option value="-1">城市/自治州</option></select>
										<select id="beginTown" class="screenRegion" style="width:15%;" disabled><option value="-1">区/县</option></select>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">目的地</span>
										<select id="endArea" class="screenRegion" style="width:15%;" ><option value="-1">地区</option></select> 
										<select id="endProvince" class="screenRegion" style="width:15%;" disabled value="-1"><option>省份/自治区</option></select>
										<select id="endCity" class="screenRegion" style="width:15%;" disabled value="-1"><option>城市/自治州</option></select>
										<select id="endTown" class="screenRegion" style="width:15%;" disabled value="-1"><option>区/县</option></select>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">货源名称</span>
										<input type="text" class="inputBox" style="width:25%;" id="goodsName" name="goodsName" placeholder="请输入货物名称" value="${zwbPublishgoodsLogBean.goodsName}"/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">货源数量</span>
										<input type="text" class="inputBox" style="width:25%;" id="goodsWeight" name="goodsWeight" placeholder="请输入货物数量（单位：吨）" value="${zwbPublishgoodsLogBean.goodsWeight}"  onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)'/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">运费总价</span>
										<input type="text" class="inputBox" style="width:25%;" id="totalPrice" name="totalPrice" placeholder="每吨必须大于50小于1000元" value="${zwbPublishgoodsLogBean.totalPrice}" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)'/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">配送方式</span>
										<div class="searchOptionsRel clearfix" id="sendType_S">
											<div class="searchOptions selected" data="0" onclick="selectTag('sendType_S',this)">零担</div>
											<div class="searchOptions" data="1" onclick="selectTag('sendType_S',this)">整车</div>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">货源类型</span>
										<div class="searchOptionsRel clearfix" id="goodsTypeId_S">
											<div class="searchOptions selected" data="14" onclick="selectTag('goodsTypeId_S',this)">一类（爆炸品）</div>
											<div class="searchOptions" data="15" onclick="selectTag('goodsTypeId_S',this)">二类（压缩,液化气体）</div>
											<div class="searchOptions" data="16" onclick="selectTag('goodsTypeId_S',this)">三类（易燃液体）</div>
											<div class="searchOptions" data="17" onclick="selectTag('goodsTypeId_S',this)">四类（易燃固体，自燃物品和遇湿易燃）	</div>
											<div class="searchOptions" data="18" onclick="selectTag('goodsTypeId_S',this)">五类（氧化剂，有机过氧化物）</div>
											<div class="searchOptions" data="19" onclick="selectTag('goodsTypeId_S',this)">六类（毒害品，感染类物品）</div>
											<div class="searchOptions" data="20" onclick="selectTag('goodsTypeId_S',this)">七类（放射性物质）</div>
											<div class="searchOptions" data="21" onclick="selectTag('goodsTypeId_S',this)">八类（腐蚀品）</div>
											<div class="searchOptions" data="22" onclick="selectTag('goodsTypeId_S',this)">九类（危险废弃物）</div>
											<div style="clear:both;"></div>
										</div>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">*</font>
										<span class="release_attr">发货人</span>
										<input type="text" class="inputBox" style="width:65%;" id="beginContacts" name="beginContacts" placeholder="请输入联系电话" value="${accountCode}" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)' maxlength="11"/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">发货地址</span>
										<input type="text" class="inputBox" style="width:65%;" id="beginDetailAddress" name="beginDetailAddress" placeholder="请输入详细地址" value="${zwbPublishgoodsLogBean.beginDetailAddress}"/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">收货人</span>
										<input type="text" class="inputBox" style="width:65%;" id="endContacts" name="endContacts" placeholder="请输入联系电话" value="${zwbPublishgoodsLogBean.endContacts}" onkeyup='onlyNum(this)' onafterpaste ='onlyNum(this)' maxlength="11"/>
									</div>
									<div class="release_input clearfix">
										<font class="redStar">&nbsp;</font>
										<span class="release_attr">收货地址</span>
										<input type="text" class="inputBox" style="width:65%;" id="endDetailAddress" name="endDetailAddress" placeholder="请输入详细地址" value="${zwbPublishgoodsLogBean.endDetailAddress}"/>
									</div>
								</div>
								
								</div>
							</form>
						</c:when>
					</c:choose>
					
					
					<div style="padding-right:76px;">
						<input type="button" value="发布" onclick="save(this);" class="greenBtnContral">
						<div style="clear:both;"></div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
<script type="text/javascript">
	$(function(){
		var type = '${type}';
		if(type==1){
			//地址字典
			getWanjiArea(-1, 1, 1);
			getWanjiArea(-1, 1, 2);
		}else if(type==2){
			//地址字典
			getZwbArea(0, 1, 1);
			getZwbArea(0, 1, 2);
		}
		
		$("#srcProvince").change(function(){
			getWanjiArea($(this).val(),2,1);
		});
		$("#destProvince").change(function(){
			getWanjiArea($(this).val(),2,2);
		});
		
		$("#srcCity").change(function(){
			getWanjiArea($(this).val(),3,1);
		});
		$("#destCity").change(function(){
			getWanjiArea($(this).val(),3,2);
		}); 
		
		$("#beginArea").change(function(){
			getZwbArea($(this).val(),2,1);
		});
		$("#endArea").change(function(){
			getZwbArea($(this).val(),2,2);
		});
		$("#beginProvince").change(function(){
			getZwbArea($(this).val(),3,1);
		});
		$("#endProvince").change(function(){
			getZwbArea($(this).val(),3,2);
		});
		
		$("#beginCity").change(function(){
			getZwbArea($(this).val(),4,1);
		});
		$("#endCity").change(function(){
			getZwbArea($(this).val(),4,2);
		}); 
		
		$(".optionBtnRel").click(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}else{
				$(this).addClass("selected");
			}
		});
		
		var info = '${zwbPublishgoodsLogBean}';
		if(type==2&&info!=""){
			setTimeout(function(){
				initZwbGoodsInfo();
			},1);
		}
		
	});
	
	function showExtended(type){
		if(type==1){
			if($("#wanjiExtended").css("display")=="none"){
				$("#wanjiExtended").css("display","block");
				$("#moreContral").text("收起 -");
			}else{
				$("#wanjiExtended").css("display","none");
				$("#moreContral").text("点击填写更多信息 +");
			}
		}else if(type==2){
			if($("#zwbExtended").css("display")=="none"){
				$("#zwbExtended").css("display","block");
				$("#moreContral").text("收起 -");
			}else{
				$("#zwbExtended").css("display","none");
				$("#moreContral").text("点击填写更多信息 +");
			}
		}
		
	}

	function selectTag(id, obj){
		$("#"+id+" .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$(obj).addClass("selected");
	}
	
	function selectLength(id, obj){
		var count = 0;
		$("#"+id+" .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				count++;
			}
		});
		if($(obj).hasClass("selected")){
			$(obj).removeClass("selected");
		}else{
			$(obj).addClass("selected");
			
			if(count>=3){
				$(obj).removeClass("selected");
				layer.msg("最多选三个！");
				return;
			}else{
				$(obj).addClass("selected");
			}
		}
	}
	
	function getWanjiArea(parent, areaKind, addKind){
		if(parent==0){
			if(addKind==1){
				if(areaKind==2){
					$("#srcCity").empty();
					$("#srcCity").append('<option value="0">城市/自治州</option>');
					$("#srcCity").attr("disabled","disabled");
					$("#srcTown").empty();
					$("#srcTown").append('<option value="0">区/县</option>');
					$("#srcTown").attr("disabled","disabled");
				}else if(areaKind==3){
					$("#srcTown").empty();
					$("#srcTown").append('<option value="0">区/县</option>');
					$("#srcTown").attr("disabled","disabled");
				}
			}else if(addKind==2){
				if(areaKind==2){
					$("#destCity").empty();
					$("#destCity").append('<option value="0">城市/自治州</option>');
					$("#destCity").attr("disabled","disabled");
					$("#destTown").empty();
					$("#destTown").append('<option value="0">区/县</option>');
					$("#destTown").attr("disabled","disabled");
				}else if(areaKind==3){
					$("#destTown").empty();
					$("#destTown").append('<option value="0">区/县</option>');
					$("#destTown").attr("disabled","disabled");
				}
			}
			return;
		}
		
		if(addKind==1){
			if(areaKind==2){
				$("#srcTown").empty();
				$("#srcTown").append('<option value="0">区/县</option>');
				$("#srcTown").attr("disabled","disabled");
			}
		}else if(addKind==2){
			if(areaKind==2){
				$("#destTown").empty();
				$("#destTown").append('<option value="0">区/县</option>');
				$("#destTown").attr("disabled","disabled");
			}
		}
		
		if(areaKind==2){
			if(addKind==1){
				$("#srcCity").removeAttr("disabled");
			}else if(addKind==2){
				$("#destCity").removeAttr("disabled");
			}
		}else if(areaKind==3){
			if(addKind==1){
				$("#srcTown").removeAttr("disabled");
			}else if(addKind==2){
				$("#destTown").removeAttr("disabled");
			}
		}
		
		$.ajax({
			url:"${ctx}/logistics/wanji/json/getAddress",
			type:"get",
			data:{"parent":parent},
			dataType:"json",
			success:function(result){
				if(areaKind==2){
					if(addKind==1){
						$("#srcCity").empty().append('<option value="0">城市/自治州</option>');
					}else if(addKind==2){
						$("#destCity").empty().append('<option value="0">城市/自治州</option>');
					}
				}else if(areaKind==3){
					if(addKind==1){
						$("#srcTown").empty().append('<option value="0">区/县</option>');
					}else if(addKind==2){
						$("#destTown").empty().append('<option value="0">区/县</option>');
					}
				}
				//'<option value="0">省份/自治区</option>';
				for(var i=0;i<result.length;i++){
					var info = result[i];
					var _div = '<option value="'+info.CODE+'">'+info.NAME+'</option>';
					if(areaKind==1){
						if(addKind==1){
							$("#srcProvince").append(_div);
						}else if(addKind==2){
							$("#destProvince").append(_div);
						}
					}else if(areaKind==2){
						if(addKind==1){
							$("#srcCity").append(_div);
						}else if(addKind==2){
							$("#destCity").append(_div);
						}
					}else{
						if(addKind==1){
							$("#srcTown").append(_div);
						}else if(addKind==2){
							$("#destTown").append(_div);
						}
					}
				}
				
			},
			error:function(){
				layer.msg("地址请求超时，请刷新页面！");
			}
		});	
	}
	
	function getZwbArea(parent, areaKind, addKind){
		if(parent==-1){
			if(addKind==1){
				if(areaKind==2){
					$("#beginProvince").empty();
					$("#beginProvince").append('<option value="-1">省份/自治区</option>');
					$("#beginProvince").attr("disabled","disabled");
					$("#beginCity").empty();
					$("#beginCity").append('<option value="-1">城市/自治州</option>');
					$("#beginCity").attr("disabled","disabled");
					$("#beginTown").empty();
					$("#beginTown").append('<option value="-1">区/县</option>');
					$("#beginTown").attr("disabled","disabled");
				}else if(areaKind==3){
					$("#beginCity").empty();
					$("#beginCity").append('<option value="-1">城市/自治州</option>');
					$("#beginCity").attr("disabled","disabled");
					$("#beginTown").empty();
					$("#beginTown").append('<option value="-1">区/县</option>');
					$("#beginTown").attr("disabled","disabled");
				}else if(areaKind==4){
					$("#beginTown").empty();
					$("#beginTown").append('<option value="-1">区/县</option>');
					$("#beginTown").attr("disabled","disabled");
				}
			}else if(addKind==2){
				if(areaKind==2){
					$("#endProvince").empty();
					$("#endProvince").append('<option value="-1">省份/自治区</option>');
					$("#endProvince").attr("disabled","disabled");
					$("#endCity").empty();
					$("#endCity").append('<option value="-1">城市/自治州</option>');
					$("#endCity").attr("disabled","disabled");
					$("#endTown").empty();
					$("#endTown").append('<option value="-1">区/县</option>');
					$("#endTown").attr("disabled","disabled");
				}else if(areaKind==3){
					$("#endCity").empty();
					$("#endCity").append('<option value="-1">城市/自治州</option>');
					$("#endCity").attr("disabled","disabled");
					$("#endTown").empty();
					$("#endTown").append('<option value="-1">区/县</option>');
					$("#endTown").attr("disabled","disabled");
				}else if(areaKind==4){
					$("#endTown").empty();
					$("#endTown").append('<option value="-1">区/县</option>');
					$("#endTown").attr("disabled","disabled");
				}
			}
			return;
		}
		
		if(addKind==1){
			if(areaKind==2){
				$("#beginCity").empty();
				$("#beginCity").append('<option value="-1">城市/自治州</option>');
				$("#beginCity").attr("disabled","disabled");
				$("#beginTown").empty();
				$("#beginTown").append('<option value="-1">区/县</option>');
				$("#beginTown").attr("disabled","disabled");
			}else if(areaKind==3){
				$("#beginTown").empty();
				$("#beginTown").append('<option value="-1">区/县</option>');
				$("#beginTown").attr("disabled","disabled");
			}
		}else if(addKind==2){
			if(areaKind==2){
				$("#endCity").empty();
				$("#endCity").append('<option value="-1">城市/自治州</option>');
				$("#endCity").attr("disabled","disabled");
				$("#endTown").empty();
				$("#endTown").append('<option value="-1">区/县</option>');
				$("#endTown").attr("disabled","disabled");
			}else if(areaKind==3){
				$("#endTown").empty();
				$("#endTown").append('<option value="-1">区/县</option>');
				$("#endTown").attr("disabled","disabled");
			}
		}
		
		if(areaKind==2){
			if(addKind==1){
				$("#beginProvince").removeAttr("disabled");
			}else if(addKind==2){
				$("#endProvince").removeAttr("disabled");
			}
		}else if(areaKind==3){
			if(addKind==1){
				$("#beginCity").removeAttr("disabled");
			}else if(addKind==2){
				$("#endCity").removeAttr("disabled");
			}
		}else if(areaKind==4){
			if(addKind==1){
				$("#beginTown").removeAttr("disabled");
			}else if(addKind==2){
				$("#endTown").removeAttr("disabled");
			}
		}
		
		var kind = Number(areaKind)-1;
		$.ajax({
			url:"${ctx}/logistics/zwb/json/area",
			type:"get",
			data:{"parent":parent,"kind":kind},
			dataType:"json",
			success:function(result){
				if(areaKind==2){
					if(addKind==1){
						$("#beginProvince").empty().append('<option value="-1">省份/自治区</option>');
					}else if(addKind==2){
						$("#endProvince").empty().append('<option value="-1">省份/自治区</option>');
					}
				}else if(areaKind==3){
					if(addKind==1){
						$("#beginCity").empty().append('<option value="-1">城市/自治州</option>');
					}else if(addKind==2){
						$("#endCity").empty().append('<option value="-1">城市/自治州</option>');
					}
				}else if(areaKind==4){
					if(addKind==1){
						$("#beginTown").empty().append('<option value="-1">区/县</option>');
					}else if(addKind==2){
						$("#endTown").empty().append('<option value="-1">区/县</option>');
					}
				}
				//'<option value="0">省份/自治区</option>';
				var list = result.value;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var _div = '<option value="'+info.ID+'">'+info.NAME+'</option>';
					if(areaKind==1){
						if(addKind==1){
							$("#beginArea").append(_div);
						}else if(addKind==2){
							$("#endArea").append(_div);
						}
					}else if(areaKind==2){
						if(addKind==1){
							$("#beginProvince").append(_div);
						}else if(addKind==2){
							$("#endProvince").append(_div);
						}
					}else if(areaKind==3){
						if(addKind==1){
							$("#beginCity").append(_div);
						}else if(addKind==2){
							$("#endCity").append(_div);
						}
					}else{
						if(addKind==1){
							$("#beginTown").append(_div);
						}else if(addKind==2){
							$("#endTown").append(_div);
						}
					}
				}
				
			},
			error:function(){
				layer.msg("地址请求超时，请刷新页面！");
			}
		});	
	}
	
	//发布
	function save(obj){
		var type = '${type}';
		//$(obj).attr("disabled", "disabled");
		if(type==1){//万佶
			//取值
			//发货地
			var SrcAdCode = 0;
			if(!$("#srcTown").attr("disabled")){
				SrcAdCode = $("#srcTown").val();
				$("#SrcArea_H").val($("#srcTown option:selected").text());
				$("#SrcCity_H").val($("#srcCity option:selected").text());
				$("#SrcProvince_H").val($("#srcProvince option:selected").text());
				if(SrcAdCode==0){
					SrcAdCode = $("#srcCity").val();
					$("#SrcArea_H").val("");
				}
			}else{
				if(!$("#srcCity").attr("disabled")){
					SrcAdCode = $("#srcCity").val();
					$("#SrcCity_H").val($("#srcCity option:selected").text());
					$("#SrcProvince_H").val($("#srcProvince option:selected").text());
					if(SrcAdCode==0){
						SrcAdCode = $("#srcProvince").val();
						$("#SrcCity_H").val("");
					}
				}else{
					SrcAdCode = $("#srcProvince").val();
					$("#SrcProvince_H").val($("#srcProvince option:selected").text());
				}
			}
			$("#SrcAdCode_H").val(SrcAdCode);
			if(SrcAdCode==0){
				$("#SrcProvince_H").val("");
				layer.msg("发货地址不能为空！");
				return;
			}
			
			//收货地
			var DestAdCode = 0;
			if(!$("#destTown").attr("disabled")){
				DestAdCode = $("#destTown").val();
				$("#DestArea_H").val($("#destTown option:selected").text());
				$("#DestCity_H").val($("#destCity option:selected").text());
				$("#DestProvince_H").val($("#destProvince option:selected").text());
				if(DestAdCode==0){
					DestAdCode = $("#destCity").val();
					$("#DestArea_H").val("");
				}
			}else{
				if(!$("#destCity").attr("disabled")){
					DestAdCode = $("#destCity").val();
					$("#DestCity_H").val($("#destCity option:selected").text());
					$("#DestProvince_H").val($("#destProvince option:selected").text());
					if(DestAdCode==0){
						DestAdCode = $("#destProvince").val();
						$("#DestCity_H").val("");
					}
				}else{
					DestAdCode = $("#destProvince").val();
					$("#DestProvince_H").val($("#destProvince option:selected").text());
				}
			}
			$("#DestAdCode_H").val(DestAdCode);
			if(DestAdCode==0){
				$("#DestProvince_H").val("");
				layer.msg("收货地址不能为空！");
				return;
			}
			
			
			//----------------------------------------里程-------------------
			var TotalMileage = 0;
			var code = SrcAdCode + "," + DestAdCode;
			$.ajax({
				url:"${ctx}/json/logistics/distance",
				type:"post",
				data:{"code":code},
				success:function(result){
					var srcLat = null;
					var srcLng = null;
					var destLat = null;
					var destLng = null;
					if(result.code==1){
						var list = result.value;
						for(var i=0;i<list.length;i++){
							var info = list[i];
							if(i==0){
								srcLat = info.LAT;
								sourceLng = info.LNG;
							}else if(i==1){
								destLat = info.LAT;
								destLng = info.LNG;
							}
						}
						TotalMileage = getPointDistance(srcLat, sourceLng, destLat, destLng);
					}	
				}	
				
			});
			
			if(TotalMileage=0){
				TotalMileage = 100;
			}
			
			$("#TotalMileage_H").val(TotalMileage);
			
			//----------------------------------------里程-------------------
			
			//主类型
			var TypeCode = 1;
			var CountUnit = null;
			$("#TypeCode .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					TypeCode = $(this).attr("data");
				}
			});
			$("#TypeCode_H").val(TypeCode);
			if(TypeCode==1){
				CountUnit = "吨";
			}else{
				CountUnit = "方";
			}
			$("#CountUnit_H").val(CountUnit);
			
			//子类型
			var SubTypeCode = null;
			var SubTypeName = null;
			$("#SubTypeCode .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					SubTypeCode = $(this).attr("data");
					SubTypeName = $(this).text();
				}
			});
			$("#SubTypeCode_H").val(SubTypeCode);
			$("#SubTypeName_H").val(SubTypeName);
			
			var CarCount = $("#CarCount").val();
			if(CarCount==null||CarCount==""){
				layer.msg("需求车辆数不能为空！");
				return;
			}
			
			//车型
			var LimCarTypeCode = -1;
			var LimCarTypeName = null;
			var LimCarLoadTypeCode = -1;
			var LimCarLoadTypeName = null;
			$("#LimCarTypeCode .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					LimCarTypeCode = $(this).attr("data");
					LimCarTypeName = $(this).text();
				}
			});
			$("#LimCarTypeCode_H").val(LimCarTypeCode);
			$("#LimCarTypeName_H").val(LimCarTypeName);
			$("#LimCarLoadTypeCode .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					LimCarLoadTypeCode = $(this).attr("data");
					LimCarLoadTypeName = $(this).text();
				}
			});
			$("#LimCarLoadTypeCode_H").val(LimCarLoadTypeCode);
			$("#LimCarLoadTypeName_H").val(LimCarLoadTypeName);
			
			//车长
			var LimCarLength1 = -1;
			var LimCarLength2 = -1;
			var LimCarLength3 = -1;
			var LimCarLength = "";
			var LimCarLengthStr = null;
			$("#LimCarLength .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					LimCarLength += ($(this).attr("data")+",");
				}
			});
			LimCarLengthStr = LimCarLength.split(",");
			if(LimCarLengthStr.length==1){
				LimCarLength1 = LimCarLengthStr[0];
				$("#LimCarLength1_H").val(LimCarLength1);
			}else if(LimCarLengthStr.length==2){
				LimCarLength1 = LimCarLengthStr[0];
				$("#LimCarLength1_H").val(LimCarLength1);
				LimCarLength2 = LimCarLengthStr[1];
				$("#LimCarLength2_H").val(LimCarLength2==""?-1:LimCarLength2);
			}else{
				LimCarLength1 = LimCarLengthStr[0];
				$("#LimCarLength1_H").val(LimCarLength1);
				LimCarLength2 = LimCarLengthStr[1];
				$("#LimCarLength2_H").val(LimCarLength2==""?-1:LimCarLength2);
				LimCarLength3 = LimCarLengthStr[2];
				$("#LimCarLength3_H").val(LimCarLength3==""?-1:LimCarLength3);
			}
			
			//报价
			var OfferType = null;
			$("#OfferType .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					OfferType = $(this).attr("data");
				}
			});
			$("#OfferType_H").val(OfferType);
			
			//联系人
			var Contact = $("#Contact").val();
			if(CarCount==null||CarCount==""){
				layer.msg("联系人不能为空！");
				return;
			}
			var Phone = $("#Phone").val();
			if(Phone==null||Phone==""){
				layer.msg("联系电话不能为空！");
				return;
			}
			
			//重发
			var RepeatSum = 0;
			var RepeatInterval = 0;
			$("#RepeatSum .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					RepeatSum = $(this).attr("data");
				}
			});
			$("#RepeatInterval .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					RepeatInterval = $(this).attr("data");
				}
			});
			if(RepeatSum==0){
				RepeatInterval = 0;
			}
			$("#RepeatSum_H").val(RepeatSum);
			$("#RepeatInterval_H").val(RepeatInterval);
			
			$.ajax({
				url:"${ctx}/logistics/wanji/json/publishCargo",
				type:"post",
				data:$("#wanjiForm").serialize(),
				dataType:"json",
				success:function(result){
					if(result.code==-2){
						layer.msg(result.msg);
					}else if(result.code==4){
						layer.msg(result.msg);
					}else if(result.code==1){
						layer.msg(result.msg);
						setTimeout(function(){
							window.location.reload();
						},1500);
					}else{
						layer.msg(result.msg);
						$(obj).removeAttr("disabled");
					}
				},
				error:function(){
					layer.alert("系统异常，请刷新重试！");
				}
			});
		}else if(type==2){//中危宝
			//取值
			var beginAreaId=null;
			var endAreaId=null;
			var goodsTypeId=null;
			var sendType=null;
			
			if(!$("#beginTown").attr("disabled")){
				beginAreaId = $("#beginTown").val();
				if(beginAreaId==-1){
					beginAreaId = $("#beginCity").val();
					if(beginAreaId==-1){
						beginAreaId = $("#beginProvince").val();
					}
				}
			}else{
				if(!$("#beginCity").attr("disabled")){
					beginAreaId = $("#beginCity").val();
					if(beginAreaId==-1){
						beginAreaId = $("#beginProvince").val();
					}
				}else{
					if(!$("#beginProvince").attr("disabled")){
						beginAreaId = $("#beginProvince").val();
						if(beginAreaId==-1){
							beginAreaId = $("#beginArea").val();
						}
					}else{
						beginAreaId = $("#beginArea").val();
					}
				}
			}
			
			if(!$("#endTown").attr("disabled")){
				endAreaId = $("#endTown").val();
				if(endAreaId==-1){
					endAreaId = $("#endCity").val();
					if(endAreaId==-1){
						endAreaId = $("#endProvince").val();
					}
				}
			}else{
				if(!$("#endCity").attr("disabled")){
					endAreaId = $("#endCity").val();
					if(endAreaId==-1){
						endAreaId = $("#endProvince").val();
					}
				}else{
					if(!$("#endProvince").attr("disabled")){
						endAreaId = $("#endProvince").val();
						if(endAreaId==-1){
							endAreaId = $("#endArea").val();
						}
					}else{
						endAreaId = $("#endArea").val();
					}
				}
			}
			
			$("#beginAreaId").val(beginAreaId);
			$("#endAreaId").val(endAreaId);
			
			$("#goodsTypeId_S .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					goodsTypeId = $(this).attr("data");
				}
			});
			
			$("#sendType_S .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					sendType = $(this).attr("data");
				}
			});
			
			$("#goodsTypeId").val(goodsTypeId);
			$("#sendType").val(sendType);
			
			//校验
			if(beginAreaId==-1){
				layer.msg("发货地址不能为空！");
				return;
			}

			if(endAreaId==-1){
				layer.msg("收货地址不能为空！");
				return;
			}
			
			var goodsName = $("#goodsName").val();
			if(goodsName==null||goodsName==""){
				layer.msg("货源名称不能为空！");
				return;
			}
			
			var goodsWeight = $("#goodsWeight").val();
			if(goodsWeight==null||goodsWeight==""){
				layer.msg("货源数量不能为空！");
				return;
			}
			
			var beginContacts = $("#beginContacts").val();
			if(beginContacts==null||beginContacts==""){
				layer.msg("发货联系人电话不能为空！");
				return;
			}
			$.ajax({
				url:"${ctx}/logistics/zwb/json/saveGoods",
				type:"post",
				data:$("#zwbForm").serialize(),
				dataType:"json",
				success:function(result){
					if(result.code==-2){
						layer.msg(result.msg);
					}else if(result.code==20000||result.code==30000){
						layer.msg(result.msg);
						setTimeout(function(){
							window.location.reload();
						},1500);
					}else if(result.code==20007){
						layer.msg("运费总价不合理,请重新输入(50元 <= 每吨 <= 1000元)");
						$(obj).removeAttr("disabled");
					}else{
						$(obj).removeAttr("disabled");
					}
					
				},
				error:function(){
					layer.alert("系统异常，请刷新重试！");
				}
			});
		}
	}
	
	//获取2地间的距离
	function getPointDistance(sourceLat, sourceLng, destLat, destLng) {
		var map = new BMap.Map("allmap"); //实例化一个地图对象
		var sourceP = bd_encrypt(sourceLat, sourceLng);
		var destP = bd_encrypt(destLat, destLng);
		var sourcePoint = new BMap.Point(sourceP[0], sourceP[1]); //发货地的位置
		var destPoint = new BMap.Point(destP[0], destP[1]); //目的地的位置
		var distance = map.getDistance(sourcePoint, destPoint);
		return (parseFloat(distance) / 1000).toFixed(1);
	}
	
	function bd_encrypt(gg_lat, gg_lon) {
		var x_pi = 3.14159265358979324 * 3000 / 180;
		var x = Number(gg_lon), y = Number(gg_lat);
		var z = Math.sqrt(x * x + y * y) + 0.00002 * Math.sin(y * x_pi);
		var theta = Math.atan2(y, x) + 0.000003 * Math.cos(x * x_pi);
		var bd_lon = z * Math.cos(theta) + 0.0065;
		var bd_lat = z * Math.sin(theta) + 0.006;
		var bd = new Array()

		bd[0] = bd_lon;
		bd[1] = bd_lat;
		return bd;
	}
	
	
	function initZwbGoodsInfo(){
		var sendType = $("#sendType").val();
		var goodsTypeId = $("#goodsTypeId").val();
		var beginAreaIds = '${beginAreaIds}'.split(",");
		var endAreaIds = '${endAreaIds}'.split(",");
		
		$("#sendType_S .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
			if($(this).attr("data")==sendType){
				$(this).addClass("selected");
			}
		});
		$("#goodsTypeId_S .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
			if($(this).attr("data")==goodsTypeId){
				$(this).addClass("selected");
			}
		});
		if(beginAreaIds.length==1){
			getZwbArea(beginAreaIds[0],2,1);
		}else if(beginAreaIds.length==2){
			getZwbArea(beginAreaIds[0],2,1);
			getZwbArea(beginAreaIds[1],3,1);
		}else if(beginAreaIds.length==3){
			getZwbArea(beginAreaIds[0],2,1);
			getZwbArea(beginAreaIds[1],3,1);
			getZwbArea(beginAreaIds[2],4,1);
		}else{
			getZwbArea(beginAreaIds[0],2,1);
			getZwbArea(beginAreaIds[1],3,1);
			getZwbArea(beginAreaIds[2],4,1);
		}
		
		if(endAreaIds.length==1){
			getZwbArea(endAreaIds[0],2,2);
		}else if(endAreaIds.length==2){
			getZwbArea(endAreaIds[0],2,2);
			getZwbArea(endAreaIds[1],3,2);
		}else if(endAreaIds.length==3){
			getZwbArea(endAreaIds[0],2,2);
			getZwbArea(endAreaIds[1],3,2);
			getZwbArea(endAreaIds[2],4,2);
		}else{
			getZwbArea(endAreaIds[0],2,2);
			getZwbArea(endAreaIds[1],3,2);
			getZwbArea(endAreaIds[2],4,2); 
		}
		
		setTimeout(function(){
			if(beginAreaIds.length==1){
				$("#beginArea option").each(function(){
					if($(this).val()==beginAreaIds[0]){
						$(this).attr("selected",true);
					}
				});
			}else if(beginAreaIds.length==2){
				$("#beginArea option").each(function(){
					if($(this).val()==beginAreaIds[0]){
						$(this).attr("selected",true);
					}
				});
				setTimeout(function(){
					
				},1)
				$("#beginProvince option").each(function(){
					if($(this).val()==beginAreaIds[1]){
						
						$(this).attr("selected",true);
					}
				});
			}else if(beginAreaIds.length==3){
				$("#beginArea option").each(function(){
					if($(this).val()==beginAreaIds[0]){
						$(this).attr("selected",true);
					}
				});
				$("#beginProvince option").each(function(){
					if($(this).val()==beginAreaIds[1]){
						$(this).attr("selected",true);
					}
				});
				$("#beginCity option").each(function(){
					if($(this).val()==beginAreaIds[2]){
						$(this).attr("selected",true);
					}
				});
			}else{
				$("#beginArea option").each(function(){
					if($(this).val()==beginAreaIds[0]){
						$(this).attr("selected",true);
					}
				});
				$("#beginProvince option").each(function(){
					if($(this).val()==beginAreaIds[1]){
						$(this).attr("selected",true);
					}
				});
				$("#beginCity option").each(function(){
					if($(this).val()==beginAreaIds[2]){
						$(this).attr("selected",true);
					}
				});
				$("#beginTown option").each(function(){
					if($(this).val()==beginAreaIds[3]){
						$(this).attr("selected",true);
					}
				});
			}
			
			
			if(endAreaIds.length==1){
				$("#endArea option").each(function(){
					if($(this).val()==endAreaIds[0]){
						$(this).attr("selected",true);
					}
				});
			}else if(endAreaIds.length==2){
				$("#endArea option").each(function(){
					if($(this).val()==endAreaIds[0]){
						$(this).attr("selected",true);
					}
				});
				$("#endProvince option").each(function(){
					if($(this).val()==endAreaIds[1]){
						$(this).attr("selected",true);
					}
				});
			}else if(endAreaIds.length==3){
				$("#endArea option").each(function(){
					if($(this).val()==endAreaIds[0]){
						$(this).attr("selected",true);
					}
				});
				$("#endProvince option").each(function(){
					if($(this).val()==endAreaIds[1]){
						$(this).attr("selected",true);
					}
				});
				$("#endCity option").each(function(){
					if($(this).val()==endAreaIds[2]){
						$(this).attr("selected",true);
					}
				});
			}else{
				$("#endArea option").each(function(){
					if($(this).val()==endAreaIds[0]){
						$(this).attr("selected",true);
					}
				});
				$("#endProvince option").each(function(){
					if($(this).val()==endAreaIds[1]){
						$(this).attr("selected",true);
					}
				});
				$("#endCity option").each(function(){
					if($(this).val()==endAreaIds[2]){
						$(this).attr("selected",true);
					}
				});
				$("#endTown option").each(function(){
					if($(this).val()==endAreaIds[3]){
						$(this).attr("selected",true);
					}
				});
			}
		},1000)
				
		
	}
	
</script>
</html>
