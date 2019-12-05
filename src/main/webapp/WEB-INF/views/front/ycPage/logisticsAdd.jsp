<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>货源发布</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<link href="${ctx}/static/css/logistics/logisticsPlatform.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-12">
						<div class="artical-nav"><p>货源发布</p><a href="${ctx}/logistics/list">返回列表 ></a></div>
						<div class="artical-content">
							<div class="releaseItem">
								<form class="release_inputBar" action="" id="wanjiForm" method="post">
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
									<div class="" id="wanjiBasic">
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
								<div style="padding-right:76px;">
									<input type="button" value="发布" onclick="save(this);" class="greenBtnContral">
									<div style="clear:both;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=D78b0dc2cbe084a990e6032784c44adf"></script>
<script type="text/javascript">
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(3)").addClass("on");
		$(".second-menu p:eq(2) a:eq(0)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(0) a:eq(0)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(12)").addClass("on");
	//地址字典
	getWanjiArea(-1, 1, 1);
	getWanjiArea(-1, 1, 2);
	
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
	
	$(".optionBtnRel").click(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}else{
			$(this).addClass("selected");
		}
	});
	
});

function showExtended(type){
	if($("#wanjiExtended").css("display")=="none"){
		$("#wanjiExtended").css("display","block");
		$("#moreContral").text("收起 -");
	}else{
		$("#wanjiExtended").css("display","none");
		$("#moreContral").text("点击填写更多信息 +");
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
//发布
function save(obj){
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
				setTimeout(function(){history.go(-1)},1000)
			}
		},
		error:function(){
			layer.alert("系统异常，请刷新重试！");
		}
	});
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
</script>
</html>
