<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>找车源</title>
<link href="${ctx}/static/weixin/css/logistics/logisticsPlatform.css" rel="stylesheet" />
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
	padding: 8px 0;
	width: 100%;
	margin: 0;
	font-size: 18px;
}
body .layui-layer-bg_gray_two_btn .layui-layer-btn0 {
	background-color: #00A85A;
	color: #FFF;
	text-align: center;
	padding: 8px 0;
	width : 49%;
	margin: 0;
	border-color:#00A85A;
	font-size: 18px;
}
body .layui-layer-bg_gray_two_btn .layui-layer-btn1 {
	background-color: #f4f4f4;
	color: #646464;
	text-align: center;
	padding: 8px 0;
	width : 49%;
	margin: 0;
	font-size: 18px;
}
</style>
<script>
    /* 定义出发地选择功能中 左/右/中  */
	var myScroll_left;
	var myScroll_right;
	var myScroll_middle;
	$(function() {
		$('#tbox').hide();//隐藏小火箭
		$('#getMore').hide();//隐藏加载更多 
		$(".address").click(function() {
			history.go(-1);
// 			var div = $("#dropdown");
// 			if (div.css("display") == "none") {
// 				div.slideDown("fast");
// 				$(".mtop").removeClass("mtop56");
// 				$(".mtop").addClass("mtop126");
// 				$(".address").addClass("colorDeep");
// 			} else {
// 				div.slideUp("fast");
// 				$(".mtop").removeClass("mtop126");
// 				$(".mtop").addClass("mtop56");
// 				$(".address").removeClass("colorDeep");
// 			}
		});
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
		$("#searchOptions .optionBtn").click(function() {
			if ($(this).hasClass("selected")) {
				$(this).removeClass("selected");
			} else {
				var far = $(this).parent().attr("class");
				$("." + far + " .optionBtn:first").removeClass("selected");
				$("." + far + " .optionBtn").each(
						function(index, value) {
							if ($(value).hasClass("selected")) {
								$(value).removeClass("selected");
							}
						});
				$(this).addClass("selected");
			}
		});
		var sourceProvice = "${sourceProvince}";
		var destProvice = "${destProvince}";
		var sourceArea = "${sourceCity}";
		var destArea = "${destCity}";
		var source = "${source}";
		var dest = "${dest}";
		if (sourceProvice != "" && sourceProvice != "不限") {
			$('#srcProvice').text(sourceProvice);
		}
		if (sourceArea != "" && sourceArea != "不限") {
			$('#srcArea').text(sourceArea);
		}
		if (destProvice != "" && destProvice != "不限") {
			$('#destProvice').text(destProvice);
		}
		if (destArea != "" && destArea != "不限") {
			$('#destArea').text(destArea);
		}
		if (source != "") {
			$('.source').val(source);
		}
		if (dest != "") {
			$('.dest').val(dest);
		}
		var totle = "";
		var length = "${MinCarName}";
		var loadName = "${CarLoadName}";
		var typeName = "${TypeName}";
		if (length != "") {
			if (totle == "") {
				totle = length;
			} else {
				totle = totle + "," + length;
			}
		}
		if (loadName != "") {
			if (totle == "") {
				totle = loadName;
			} else {
				totle += "," + loadName;
			}
		}
		if (typeName != "") {
			if (totle == "") {
				totle = typeName;
			} else {
				totle += "," + typeName;
			}
		}
		if (totle != "") {
			$(".searchInput").val(totle);
		}

		$(document).ready(function() {	//tbl切换
			$('#scrollerul').empty();
			var address = ${AddressDict};
			for (var i = 0; i < address.length; i++) {
				if (i == 0) {
					$('#scrollerul').append("<li class=\"active\" style=\"line-height: 52px\" value=\""
							+ address[i].code + "\" onClick=\"addAddressItem1Click(this);\">" + address[i].name + "</li>");
				} else {
					$('#scrollerul').append("<li style=\"line-height: 52px\" value=\""
							+ address[i].code + "\" onClick=\"addAddressItem1Click(this);\">" + address[i].name + "</li>");
				}
			}
			myScroll_left = new IScroll('#scroller',{
				useTransition : true,
				scrollX : false,
				scrollY : true,
				scrollbars : false,
				fadeScrollbars : false,
				preventDefault : false,
				deceleration : 0.08
			});
			getAddressLayout2(address[0].code);
		});
	});

	function addAddressItem1Click(obj) {
		if (!$(obj).hasClass('active')) {
			$(obj).siblings("li").removeClass("active");
			$(obj).addClass("active");
			getAddressLayout2($(obj).attr('value'));
		}
	}

	function addAddressItem2Click(obj) {
		if (!$(obj).hasClass('active')) {
			$(obj).siblings("li").removeClass("active");
			$(obj).addClass("active");
			getAddressLayout3($(obj).attr('value'));
		}
	}

	function addAddressItem3Click(obj) {
		$(obj).siblings("li").removeClass("active");
		$(obj).addClass("active");
		var i = 0;
		$('#scrollerul2 li').each(function (index, data) {
			if ($(data).hasClass("active")) {
				i++;
			}
		});
		if (i == 0) {
			$('#scrollerul2 li:first').addClass("active");
		}
	}

	function getAddressLayout2(code){
		$.post("${ctx}/logistics/getAddressDict", {
			"parent" : code,
		}, function(data) {
			$('#scrollerul2').empty();
			var id;
			$.each(data, function(index, item) {
				if (index == 0) {
					id = item.code;
				}
				$('#scrollerul2').append("<li style=\"line-height: 52px\" value=\""
						+ item.code + "\" onClick=\"addAddressItem2Click(this);\">" + item.name + "</li>");
			});
			getAddressLayout3(id);
		});
	}

	function getAddressLayout3(code) {
		$.post("${ctx}/logistics/getAddressDict", {
			"parent" : code,
		}, function(datas) {
			$('#scrollerul3').empty();
			$.each(datas, function(index, item) {
				if (index == 0) {
					id = item.id;
				}
				$('#scrollerul3').append("<li style=\"line-height: 52px\" value=\""
						+ item.code + "\" onClick=\"addAddressItem3Click(this);\">" + item.name + "</li>");
			});
		});
	}

	function viewDetails(obj) {
		LayerIndex = layer.open({
			type : 1,
			title : false,
			skin : 'layui-layer-bg_gray',
			shadeClose : true,
			shade : [ 0 ],
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#carSourceDetails')
		});	
		var infoa = obj.getAttribute("data");
		var info = jQuery.parseJSON(infoa);
		carDetail(info);
	};

	function carDetail(carInfo) {
		$("#CurPlace").html(carInfo.CurPlace); //出发地
		$("#Name").html(carInfo.Name); //联系人
		$("#Telphone").html(carInfo.Telphone); //联系电话
		$("#PlateNum").html(carInfo.PlateNum); //车牌号
		$("#IsCarAuth").html((carInfo.IsCarAuth == true) ? "车辆" : "未认证"); //认证情况
		$("#IsCarAuthImg").css('display',
				(carInfo.IsCarAuth == true) ? 'block' : 'none');
		$("#CarTypeName").html(
				carInfo.CarTypeName == undefined ? "" : carInfo.CarTypeName);//车型
		$("#CarLoadTypeName").html(
				carInfo.CarLoadTypeName == undefined ? ""
						: carInfo.CarLoadTypeName);//装载类型	
		$("#CarLength").html(
				"长" + carInfo.CarLength + "米 " + "宽" + carInfo.CarWidth + "米");//车长车宽	
		$("#CarLoad").html(carInfo.CarLoad + "吨");//载重		

		$("#ActiveDt").html(carInfo.ActiveDt.split(".")[0].replace("T", " "));//发布时间	
 		$(".isCollectImg").attr('src', $("#" + carInfo.Id).attr('src'));
 		$(".isCollectImg").attr('id', carInfo.Id + "");
 		$(".isCollectImg").attr('data', JSON.stringify(carInfo));
 	
		if($(".isCollectImg").attr('src').indexOf("alreadyCollect")>0){
			$("#isCollect").html("已收藏");
		}else{
			$("#isCollect").html("未收藏");
		}
		$("#matchDetailPhone1").attr('href', "tel:" + carInfo.Telphone);//拨打电话	
		$("#matchDetailPhone2").attr('href', "tel:" + carInfo.Telphone);
	}
	/* 返回货源列表 */
	function backToList() {
		layer.close(LayerIndex);
	}
	function addToCollection(obj) {
		var infoa = obj.getAttribute("data");
		var info = jQuery.parseJSON(infoa);
		collect1(info, "${ctx}");
	};

	function detailCollect(obj) {
		var infoa = obj.getAttribute("data");
		var info = jQuery.parseJSON(infoa);
		collect1(info, "${ctx}");
	};

	function addressLayout(obj) {
		layer.open({
			type : 1,
			title : false,
			skin : 'layui-layer-bg_gray_two_btn',
			shadeClose : true,
			shade : [ 0 ],
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#addressLayout'),
			btn : ['确认选择', '取消'],
			btn1 : function(){
				if (obj == 'src') {
					var src = "";
					var i = 0;
					$(".ot-menu li").each(function(index, data) {
						if ($(data).hasClass('active')) {
							if (src == "") {
								src = $(data).text() + "," + $(data).val();
								$('#srcProvice').text($(data).text());
							} else {
								src = src + "," + $(data).text() + "," + $(data).val();
								if (i == 1) {
									$('#srcArea').text($(data).text());
								}
							}
							i++;
						}
					});
					if (i == 1) {
						src = src + ",不限,-1,不限,-1";
					}
					if (i == 2) {
						src = src + ",不限,-1";
					}
					$('.source').val(src);
				} else {
					var dest = "";
					var i = 0;
					$(".ot-menu li").each(function(index, data) {
						if ($(data).hasClass('active')) {
							if (dest == "") {
								dest = $(data).text() + "," + $(data).val();
								$('#destProvice').text($(data).text());
							} else {
								dest = dest + "," + $(data).text() + "," + $(data).val();
								if (i == 1) {
									$('#destArea').text($(data).text());
								}
							}
							i++;
						}
					});
					if (i == 1) {
						dest = dest + ",不限,-1,不限,-1";
					}
					if (i == 2) {
						dest = dest + ",不限,-1";
					}
					$('.dest').val(dest);
				}
				$('#form1').submit();
				layer.closeAll();
			},
			btn2 : function() {
				$('.source').val("");
				$('#srcProvice').text("点击选择");
				$('#srcArea').text("出发地");
				$('.dest').val("");
				$('#destProvice').text("点击选择");
				$('#destArea').text("到达地");
				$('#form1').submit();
				layer.closeAll();
			}
		});
	}

	function searchOptions() {
		$(".options_1 .optionBtn").each(
				function (index, object) {
					if ($(object).text() == $('.MinCarName').val()) {
						$(".options_1 .optionBtn:first").removeClass('selected');
						$(object).addClass('selected');
					}
				});
		$(".options_2 .optionBtn").each(
				function (index, object) {
					if ($(object).text() == $('.TypeName').val()) {
						$(".options_2 .optionBtn:first").removeClass('selected');
						$(object).addClass('selected');
					}
				});
		$(".options_3 .optionBtn").each(
				function (index, object) {
					if ($(object).text() == $('.CarLoadName').val()) {
						$(".options_3 .optionBtn:first").removeClass('selected');
						$(object).addClass('selected');
					}
				});
		layer.open({
			type : 1,
			title : false,
			skin : 'layui-layer-bg_gray_two_btn',
			shadeClose : true,
			shade : false,
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#searchOptions'),
			btn : ['确认选择', '取消'],
			btn1 : function(){
				var str_show = "";
				$(".options_1 .optionBtn").each(
						function (index, object) {
							if ($(object).hasClass("selected")) {
								if ($(object).text() != $(".options_1 .optionBtn:first").text()) {
									if (str_show == "") {
										str_show = $(object).text();
									} else {
										str_show += "," + $(object).text();
									}
									$(".MinCarName").val($(object).text());
								} else {
									$(".MinCarName").val("");
								}
								$(".MinCarLength").val($(object).attr('value'));
							}
						});
				$(".options_2 .optionBtn").each(
						function (index, object) {
							if ($(object).hasClass("selected")) {
								if ($(object).text() != $(".options_2 .optionBtn:first").text()) {
									if (str_show == "") {
										str_show = $(object).text();
									} else {
										str_show += "," + $(object).text();
									}
									$('.TypeName').val($(object).text());
								} else {
									$('.TypeName').val("");
								}
								$('.TypeCode').val($(object).attr('value'));
							}
						});
				$(".options_3 .optionBtn").each(
						function (index, object) {
							if ($(object).hasClass("selected")) {
								if ($(object).text() != $(".options_3 .optionBtn:first").text()) {
									if (str_show == "") {
										str_show = $(object).text();
									} else {
										str_show += "," + $(object).text();
									}
									$('.CarLoadName').val($(object).text());
								} else {
									$('.CarLoadName').val("");
								}
								$('.CarLoadType').val($(object).attr('value'));
							}
						});
				$(".searchInput").val(str_show);
				$('#form1').submit();
				layer.closeAll();
			},
			btn2 : function() {
				$('.MinCarName').val("");
				$('.CarLoadName').val("");
				$('.TypeName').val("");
				$('.MinCarLength').val("-1");
				$('.TypeCode').val("-1");
				$('.CarLoadType').val("-1");
				layer.closeAll();
			}
		});
	};
	/* 控制加载数据条数*/
	var count = 0;
	$(document).ready(function() {
		if ('${fn:length(platCarInfo)}' <= 10) {
			$('#getmore').hide();
		} else {
			$('#getmore').show();
		}
		for (var i = 0; i < 10; i++) {
			$('#li_' + i).show();
		}
	});
	function getMore() {
		count++;
		var start = count * 10;
		for (var i = start; i < start + 10; i++) {
			$('#li_' + i).show();
		}
		if (start + 10 >= '${fn:length(platCarInfo)}') {
			$('#getmore').hide();
		}
		if(count==50){
			page();
		}
	}
	/* 翻页*/
	function page(){
		if('${totalPage}'>'${Skip}'){
			var Skip = '${Skip}'+1;
			$("#Skip").val(Skip);
			$("#form1").submit();
		} 
	}
	
	/* //获取“全国”处字数，来进行判断"向左"与"居中"
	var div=document.getElementById("div1").value;
    var _div = ""; 
    if(div.length==2){
    	_div = '<div>全国</div>';
    }else{
    	_div = '<div style="display:inline-block; vertical-align:middle; text-align: center; font-weight: bold; width: 30%;">';
    }
    $("#div1").append(_div);  */
</script>
</head>

<body>
	<form action="${ctx}/logisticsInfo/main" name="form1" id="form1"
		method="post">
		<input type='hidden' name='TypeCode' class="TypeCode"></input>
		<input type='hidden' name='CarLoadType' class="CarLoadType"></input>
		<input type='hidden' name='MinCarLength' class="MinCarLength"></input>
		<input type='hidden' name='TypeName' class="TypeName" value='${TypeName}'></input>
		<input type='hidden' name='CarLoadName' class="CarLoadName" value='${CarLoadName}'></input>
		<input type='hidden' name='MinCarName' class="MinCarName" value='${MinCarName}'></input>
		<input type='hidden' name='source' class='source'></input>
		<input type='hidden' name='dest' class='dest'></input>
		<input type='hidden' name='Skip' id='Skip'></input>
	</form>
	<div class="platform_main">
		<div class="platform_content">
			<div class="searchBar">
				<div class="address">
					<img src="${ctx}/static/weixin/images/logistics/map.png" width="20px;"
						height="20px;" style="margin: 15px 12px;" />
				</div>
				<input type="text" onClick="searchOptions();" class="searchInput"
					placeholder="选择车载类型" readonly="true"/>
				<div style="clear: both;"></div>
			</div>
<!-- 			<div id="dropdown"> -->
<!-- 					<div class="addContent" style="margin-top: 8%;"> -->
<!-- 						<div class="addLeft"  onclick="addressLayout('src')" style="margin-top: -5%; text-align: center;"> -->
<!-- 							 <div id="srcArea">出发地</div> -->
<!-- 							<div id="srcProvice">点击选择</div> -->
<!-- 						</div> -->
<!-- 						<div class="addMid" style="margin-top: -5%;"> -->
<%-- 							<img src="${ctx}/static/weixin/images/logistics/interchange.png" --%>
<!-- 								width="40px;" height="40px;" /> -->
<!-- 						</div> -->
<!-- 						<div class="addRight"  onclick="addressLayout('dest')" style="margin-top: -5%; text-align: center;"> -->
<!-- 							 <div id="destArea">到达地</div>  -->
<!-- 							<div id="destProvice">点击选择</div> -->
<!-- 						</div> -->
<!-- 						<div style="clear: both;"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="mtop mtop56"></div>
			<c:forEach items="${platCarInfo}" var="info"  varStatus="status">
				<div id="li_${status.index}" style="display:none;"class="contentBar">
					<a href="javascript:;" data='${info}' onClick="viewDetails(this);" style="text-decoration: none;">
						<div style="border-bottom: 1px solid #F6F6F6;">
							<img src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;" style="display:inline-block; vertical-align:middle;" />
							<div style="display:inline-block; vertical-align:middle; text-align: center; font-weight: bold; width: 40%;">
								<div style="color: #000; font-size: 17px; padding: 10px 0;">
									 <c:choose>
										<c:when test="${fn:length(info.CurPlace)>6}">
											${fn:substring(info.CurPlace,0,6)}...
										</c:when>
										<c:otherwise>
											${info.CurPlace}
										</c:otherwise>
									</c:choose>
								</div>
								<!-- <div style="color:#000;"></div> -->
							</div>

							<!-- <div style="float: left; text-align: center; font-weight: bold;">
								<div style="color: #000; font-size: 17px; padding: 10px 0;">全国</div>
							</div> -->

							<div style="display:inline-block; vertical-align:middle; text-align: center; width: 18%;">
								<div style="font-size: 12px; color: #969696;">${info.CarTypeName}</div>
								<div style="font-size: 0;">
									<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;" />
								</div>
								<div style="font-size: 12px; color: #969696;">${info.CarLoadTypeName}</div>
							</div>
							<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;" style="display:inline-block; vertical-align:middle;" />
							<div style="display:inline-block; vertical-align:middle; text-align: center; font-weight: bold; width: 15%;">
								<div  id="div1"  style="color: #000; font-size: 17px; padding: 10px 0;">
								全国
								</div>
							</div>
						</div>

						<div>
							<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;" style="float: left; margin-top: 7px;border-radius:70px;" />
							<div style="float: left; margin-left: 8px;">
								<div style="font-size: 15px; float: left; margin-top: 5px; margin-bottom: 2px; color: #000;">${info.Name}</div>
								<!-- 以车辆认证来判断 -->
								<c:if test="${info.IsCarAuth == 'true'}">
									<img src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;" style="margin-top: 9px; margin-left: 5px;">
								</c:if>
								<div style="clear: both;"></div>
								<div style="font-size: 13px;">
									<span style="background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;">${info.CarLoad}吨</span>
									<span style="background-color: #F14342; color: #FFFFFF; padding: 1px 3px; border-radius: 2px;">${info.CarLength}*${info.CarWidth}米</span>
								</div>
							</div>

							<!-- <div style="float: left; text-align: center; font-weight: bold;">
								<div style="color: #000; font-size: 17px; padding: 10px 0;"> -->

							<div style="float: right; text-align: center;">
								<div style="font-size: 15px; color: #969696; float: left; margin-top: 5px; margin-bottom: 2px; margin-right: 6px;">${info.StrLocationDt}</div>
								<a href="javascript:void(0);" onClick="addToCollection(this);" data='${info}' style="text-decoration: none">
									<c:choose>
										<c:when test="${info.isCollect}">
											<img id="${info.Id}" class="collected" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin: 10px 0;">
				
										</c:when>
										<c:otherwise>
											<img id="${info.Id}" class="collected" src="${ctx}/static/weixin/images/logistics/notCollected.png" width="20px;" height="20px;" style="margin: 10px 0;">
											
										</c:otherwise>
									</c:choose>
								</a> 
								<a href="tel:${info.Telphone}"> 
									<img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;" height="40px;" style="margin-top: 6px; margin-left: 8px" />
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>

		<div id="carSourceDetails"  class="details_main">
			<div class="fixed_top">
				<img src="${ctx}/static/weixin/images/logistics/carSourceDetails0.png"
					width="15px;" height="15px;" style="margin: 8px 5px 0 10px;" /> <span
					style="position: absolute; top: 8px; color: #FFF;">车源详情</span>
			</div>
			<div style="padding-top: 40px; margin-bottom: 60px;">
				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">当前位置</div>
						<div id="CurPlace" class="details_right">江西宜春丰城市</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupLast">
						<div class="details_left">期望流向</div>
						<div class="details_right">全国</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="details_group">
					<div class="details_groupBefore">
						<div class="details_left">联系人</div>
						<div id="Name" class="details_right">曾国强</div>
						<div style="clear: both;"></div>
					</div>
					<div class="details_groupBefore">
						<div class="details_left">联系电话</div>
						<div id="Telphone" class="details_right">18970008000</div>
						<a id="matchDetailPhone1"> <img
							src="${ctx}/static/weixin/images/logistics/phoned.png" width="20px;"
							height="20px;" style="float: left; margin-left: 5px;" />
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
						<img id="IsCarAuthImg"
							src="${ctx}/static/weixin/images/logistics/carCertification.png"
							width="20px;" height="20px;"
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
				<a href="javascript:backToList();">
					 <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;"
					height="20px;" style="float: left; margin: 12px 10px;" />
				</a> <a id="matchDetailPhone2">
					<div style="float: right; border-left: 1px solid #DCDCDC; padding: 0 10px;">
						<img src="${ctx}/static/weixin/images/logistics/phone.png" width="20px;"
							height="20px;" style="margin: 12px 0;" /> <span
							style="position: relative; bottom: 16px; color: #01A858;">拨打电话</span>
					</div>
				</a>

				<div
					style="float: right; border-left: 1px solid #DCDCDC; padding: 0 10px;">
					<img class="isCollectImg"  onClick="detailCollect(this);"
						src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;"
						height="20px;" style="margin: 12px 0;" />
					<span id="isCollect"
						style="position: relative; bottom: 16px; color: #F04444;">未收藏</span>
				</div>

				<div style="clear: both;"></div>
			</div>
		</div>

		<div id="searchOptions" style="display: none;">
			<div style="font-size: 16px; padding: 6px 10px;">车长</div>
			<div class="options_1" style="background-color: #FFF; padding: 5px 12px;">
				<div class="optionBtn selected" value="-1">车长不限</div>
				<c:forEach items="${CarLengthDictsList}" var="info">
					<div class="optionBtn" value="${info.Code}">${info.Name}</div>
				</c:forEach>
				<div style="clear: both;"></div>
			</div>
			<div style="font-size: 16px; padding: 6px 10px;">车型</div>
			<div class="options_2" style="background-color: #FFF; padding: 5px 12px;">
				<div class="optionBtn selected" value="-1">车型不限</div>
				<c:forEach items="${CarTypeDictsList}" var="info">
					<div class="optionBtn" value="${info.Code}">${info.Name}</div>
				</c:forEach>
				<div style="clear: both;"></div>
			</div>
			<div style="font-size: 16px; padding: 6px 10px;">装载类型</div>
			<div class="options_3" style="background-color: #FFF; padding: 5px 12px;">
				<div class="optionBtn selected" value="-1">装载类型不限</div>
				<c:forEach items="${CarLoadDictsList}" var="info">
					<div class="optionBtn" value="${info.Code}">${info.Name}</div>
				</c:forEach>
				<div style="clear: both;"></div>
			</div>
		</div>

		<div id="addToCollection"
			style="display: none; text-align: center; padding: 20px 0;">
			<div>车源已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--收藏车源</span>”进行查看
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

		<div id="addressLayout"
				style="display: none; text-align: center; padding: 20px 0;">
			<!--菜单-->
			<div class="Menu_box">
				<!---------左侧菜单---------->
				<div id="left_Menu">
					<div class="ot-menu" id="scroller" style="width:100%; height:600px; overflow:auto">
						<ul id="scrollerul" style="overflow:hidden; height:auto; width:100%">
						</ul>
					</div>
				</div>

				<div id="middle_Menu">
					<div class="ot-menu" id="scroller2" style="width:100%; height:100%; overflow:auto">
						<ul id="scrollerul2">
						</ul>
					</div>
				</div>

				<!---------右侧侧菜单---------->
				<div id="right_Menu">
					<div class="ot-menu" id="scroller3" style="width:100%; height:100%; overflow:auto">
						<ul id="scrollerul3">
						</ul>
					</div>
				</div>
			</div>
			<!--菜单end-->
		</div>

		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		<div id="tbox">
			<a id="gotop" href="#top"></a>
		</div>
		
		<div class="navigationBar">
			<ul>
				<!--<li><a href="javascript:;">
					<div class="navImage"><img src="images/carSource.png" width="20" height="20"/></div>
					<div class="navTitle">首页</div>
				</a></li>-->
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
	</div>
	<!--<script src="js/LAreaData1.js"></script>
    <script src="js/LAreaData2.js"></script>
    <script src="js/LArea.js"></script>
    <script>
    var area1 = new LArea();
    area1.init({
        'trigger': '#demo1', //触发选择控件的文本框，同时选择完毕后name属性输出到该位置
        'valueTo': '#value1', //选择完毕后id属性输出到该位置
        'keys': {
            id: 'id',
            name: 'name'
        }, //绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
        'type': 1, //数据源类型
        'data': LAreaData //数据源
    });
    area1.value=[1,13,3];//控制初始位置，注意：该方法并不会影响到input的value
    </script>-->
</body>
</html>
