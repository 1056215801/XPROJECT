<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>发布货源</title>
<link href="${ctx}/static/weixin/css/logistics/releaseSupply.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/layer.js" type="text/javascript"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=D78b0dc2cbe084a990e6032784c44adf"></script>
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

body .layui-layer-btn .layui-layer-btn0 {
	border-color:#00A85A;
	background-color:#00A85A;
	color:#fff
}
body .layui-layer-title {
	padding:0 80px 0 20px;
	height:42px;
	line-height:42px;
	border-bottom:1px solid #eee;
	font-size:14px;
	color:#fff;
	overflow:hidden;
	background-color:#00A85A;
	border-radius:2px 2px 0 0
}
</style>
<script>
	var startCode1, startCode2, startCode3, destCode1, destCode2, destCode3;
	$(function() {
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
		$(".moreInfo").click(function() {
			var div = $(".release_moreContent");
			if (div.css("display") == "none") {
				div.slideDown("fast");
				$(".moreInfo").text("收起-");
			} else {
				div.slideUp("fast");
				$(".moreInfo").text("点击填写更多信息+");
			}
		});
		$("#searchOptions .optionBtn").click(
				function() {
					if ($(this).hasClass("selected")) {
						$(this).removeClass("selected");
					} else {
						if ($(this).text() == $(
								"#searchOptions .optionBtn:first").text()) {
							$("#searchOptions .optionBtn").each(
									function(index, value) {
										$(value).removeClass("selected");
									});
						} else {
							$("#searchOptions .optionBtn:first").removeClass(
									"selected");
						}
						$(this).addClass("selected");
					}
				});
		
		getRootDic();
		
	});

	//获取省级字典
	function getRootDic(){
		$.ajax({
			url : "${ctx}/logistics/wanji/json/getAddress",
			type : "get",
			data : {
				"parent" : "-1",
			},
			dataType : "json",
			success : function(result) {
				if(result!=null &&result.length>0){
					for(var i=0;i<result.length;i++){
						var info = result[i];
						var _div = "<option value=\'"+info.CODE+"\' LAT=\'"+info.LAT+"\' LNG=\'"+info.LNG+"\'>"+info.NAME+"</option>";
						$(".start1").append(_div);
						$(".dest1").append(_div);
					}
				}
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
	}
	
	
	var layerIndex;
	function searchOptions() {
		layerIndex = layer.open({
			type : 1,
			title : false,
			skin : 'layui-layer-bg_gray',
			shadeClose : true,
			shade : [ 0 ],
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#searchOptions'),
			btn : [ '确定选择' ],
			yes : function() {
				var count = 0;
				var str = "";
				var code = "";
				$("#searchOptions .optionBtn").each(function(index, value) {
					if ($(value).hasClass("selected")) {
						count++;
						if (str == "") {
							str = $(value).text();
							code = $(value).attr('value');
						} else {
							str += ("," + $(value).text());
							code += ("," + $(value).attr('value'));
						}
					}
				});
				if (count >= 1 && count <= 3) {
					if (str == $("#searchOptions .optionBtn:first").text()) {
						$(".limCarLengthName").val("不限");//不限车长
						$(".limCarLength1").val("-1");
						$(".limCarLength2").val("-1");
						$(".limCarLength3").val("-1");
					} else {
						$(".limCarLengthName").val(str);
						var codeArr = code.split(",");
						for(var i=0;i<codeArr.length;i++){
							$(".limCarLength"+(i+1)).val(codeArr[i]);
						}
					}
					//添加数据成功，关闭弹出窗之前，刷新列表页面的数据
					parent.layer.close(layerIndex);
				} else {
					if (count < 1) {
						layer.msg("请选择车长");
					} else {
						layer.msg("最多只能选择3项");
					}
				}
			},
		});
	};

	function releaseComplete() {
		$('.s1').val($(".start1 option:selected").text());
		$('.s2').val($(".start2 option:selected").text());
		$('.s3').val($(".start3 option:selected").text());
		$('.d1').val($(".dest1 option:selected").text());
		$('.d2').val($(".dest2 option:selected").text());
		$('.d3').val($(".dest3 option:selected").text());
		
		$(".subTypeName").val($(".subTypeCode option:selected").text());
				
		var value = $('.s1').val();
		if (value == "选择省" || value =="") {
			layer.msg("发货地不能为空");
			return;
		}
		value = $('.d1').val();
		if (value == "选择省" || value =="") {
			layer.msg("目的地不能为空");
			return;
		}
		
		value = $('.limCarLengthName').val();
		if (value == "") {
			layer.msg("车长要求不能为空");
			return;
		}
		
		if ($('.minCount').val() == "" || $('.maxCount').val() == "") {
			layer.msg("货物数量不能为空");
			return;
		}

		if ($('.publisherName').val() == "") {
			$('.publisherName').focus();
			layer.msg("联系人不能为空");
			return;
		}
		if ($('.publisherPhone').val() == "") {
			$('.publisherPhone').focus();
			layer.msg("联系电话不能为空");
			return;
		}
		/* $.post("${ctx}/logistics/publishCargo", $('#form1').serialize(),
				function(data) {
					alert(data);//弹出ajax请求后的回调结果
				}); */
		
		//禁用按钮防止重复发布
		$("#releaseBtn").attr("disabled",true);
				
		//异步发布货源
		$.ajax({
			url : "${ctx}/logistics/wanji/json/publishCargo",
			type : "post",
			data : $("#form1").serialize(),
			dataType : "json",
			success : function(result) {
				layer.msg(result.msg);
				if(result.code==1){
					setTimeout(function() {
						window.location.href="${ctx}/logistics/wanji/weixin/myList";
					}, 1000);
				}else{
					if(result.code==4){
						layer.msg(result.msg);
					}
					//启用发布按钮
					$("#releaseBtn").attr("disabled",false);
				}
			},
			error : function() {
				layer.msg("系统异常");
				//启用发布按钮
				$("#releaseBtn").attr("disabled",false);
			}
		});
		
	};

	function onChange(obj) {
		$('#repeat').empty();
		if (obj.value == "不重发") {
			$('#repeat').append("<option value=0>----</option>");
		} else {
			$('#repeat').append("<option value=1>1次</option>");
			$('#repeat').append("<option value=3>3次</option>");
			$('#repeat').append("<option value=5>5次</option>");
			$('#repeat').append("<option value=10>10次</option>");
		}
	}

	function onChangeAddr(obj) {
		if (obj.getAttribute("class") == "start1") {
			if (obj.value == "选择省") {
				$('.start2').prop('disabled', true);
				$('.start3').prop('disabled', true);
				$('.start2').empty();
				$('.start2').append("<option>选择市</option>");
				$('.start3').empty();
				$('.start3').append("<option>选择区</option>");
				// 默认表单提交 设置为空
			} else {
				$('.start2').prop('disabled', false);
				$.post("${ctx}/logistics/wanji/json/getAddress", {
					"parent" : $('.start1').val(),
				}, function(data) {
					$('.start2').empty();
					$.each(data, function(index, item) {
						$('.start2').append(
								"<option value=\"" + item.CODE + "\" LAT=\'"+item.LAT+"\' LNG=\'"+item.LNG+"\'>"
										+ item.NAME + "</option>");
					});
					calPointDistance();
					
					$.post("${ctx}/logistics/wanji/json/getAddress", {
						"parent" : $('.start2').val(),
					}, function(data) {
						$('.start3').prop('disabled', false);
						$('.start3').empty();
						$.each(data, function(index, item) {
							$('.start3').append(
									"<option value=\"" + item.CODE + "\" LAT=\'"+item.LAT+"\' LNG=\'"+item.LNG+"\'>"
											+ item.NAME + "</option>");
						});
						calPointDistance();
						
					});
				});
			}
		} else if (obj.getAttribute("class") == "start2") {
			$('.start3').prop('disabled', false);
			$.post("${ctx}/logistics/wanji/json/getAddress", {
				"parent" : $('.start2').val(),
			}, function(data) {
				$('.start3').empty();
				$.each(data, function(index, item) {
					$('.start3').append(
							"<option value=\"" + item.CODE + "\" LAT=\'"+item.LAT+"\' LNG=\'"+item.LNG+"\'>" + item.NAME
									+ "</option>");
				});
				calPointDistance();
				
			});
		} else if (obj.getAttribute("class") == "start3") {
			calPointDistance();
		} else if (obj.getAttribute("class") == "dest1") {
			if (obj.value == "选择省") {
				$('.dest2').prop('disabled', true);
				$('.dest3').prop('disabled', true);
				$('.dest2').empty();
				$('.dest2').append("<option>选择市</option>");
				$('.dest3').empty();
				$('.dest3').append("<option>选择区</option>");
				// 默认表单提交 设置为空
			} else {
				$('.dest2').prop('disabled', false);
				$.post("${ctx}/logistics/wanji/json/getAddress", {
					"parent" : $('.dest1').val(),
				}, function(data) {
					$('.dest2').empty();
					$.each(data, function(index, item) {
						$('.dest2').append(
								"<option value=\"" + item.CODE + "\" LAT=\'"+item.LAT+"\' LNG=\'"+item.LNG+"\'>"
										+ item.NAME + "</option>");
					});
					calPointDistance();
					
					$.post("${ctx}/logistics/wanji/json/getAddress", {
						"parent" : $('.dest2').val(),
					}, function(data) {
						$('.dest3').prop('disabled', false);
						$('.dest3').empty();
						$.each(data, function(index, item) {
							$('.dest3').append(
									"<option value=\"" + item.CODE + "\" LAT=\'"+item.LAT+"\' LNG=\'"+item.LNG+"\'>"
											+ item.NAME + "</option>");
						});
						calPointDistance();
					});
				});
			}
		} else if (obj.getAttribute("class") == "dest2") {
			$('.dest3').prop('disabled', false);
			$.post("${ctx}/logistics/wanji/json/getAddress", {
				"parent" : $('.dest2').val(),
			}, function(data) {
				$('.dest3').empty();
				$.each(data, function(index, item) {
					$('.dest3').append(
							"<option value=\"" + item.CODE + "\" LAT=\'"+item.LAT+"\' LNG=\'"+item.LNG+"\'>" + item.NAME
									+ "</option>");
				});
					calPointDistance();
			});
		} else if (obj.getAttribute("class") == "dest3") {
			calPointDistance();
		}
	}

	function setSelectName(nameInput, selectName) {
		$("." + nameInput).val($("." + selectName+" option:selected").text());
	}
	
	var sourceLat;
	var sourceLng;
	var destLat;
	var destLng;
	//获取发货地和目的地的值
	function LoadSourceAndDestAddress() {
		srcName = "";
		destName = "";
		if ($(".start1").val() != "-1") {
			srcName += $(".start1").val();
		} else {
			srcName = "0-0-0";
		}
		if ($(".dest1").val() != "-1") {
			destName += $(".dest1").val();
		} else {
			destName = "0-0-0";
		}
		if ($(".start2").val() != "-2" && $(".start2").val() != null) {
			srcName += "-" + $(".start2").val();
		}
		if ($(".start3").val() != "-3" && $(".start3").val() != null) {
			srcName += "-" + $(".start3").val();
		}
		if ($(".dest2").val() != "-2" && $(".dest2").val() != null) {
			destName += "-" + $(".dest2").val();
		}
		if ($(".dest3").val() != "-3" && $(".dest3").val() != null) {
			destName += "-" + $(".dest3").val();
		}
		
		var array1 = srcName.replace(/选择./,"").split("-");
		var array2 = destName.replace(/选择./,"").split("-")
		
		$("#SrcAdCode").val(array1[array1.length-1]);
		sourceLat = $(".start"+array1.length+" option:selected").attr("LAT");
		sourceLng = $(".start"+array1.length+" option:selected").attr("LNG");
		$("#DestAdCode").val(array2[array2.length-1]);
		destLat = $(".dest"+array1.length+" option:selected").attr("LAT");
		destLng = $(".dest"+array1.length+" option:selected").attr("LNG");
	}

	function calPointDistance() {
		LoadSourceAndDestAddress(); //获取发货地和目的地的值
		
		var distance = getPointDistance(sourceLat, sourceLng, destLat, destLng);
		$(".totalMileage").val(distance);
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
	<div id="valueAddedServices" class="release_main">
		<div class="fixed_top" style="height:50px;padding:0;">
			<img src="${ctx}/static/weixin/images/logistics/createSupply0.png"
				width="20px;" height="20px;" style="margin: 15px 5px 0 10px;" /> <span
				style="position: absolute; top: 14px; color: #FFF;">发布货源</span>
		</div>
		<form name="form1" id="form1" method="post">
			<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
			<input type='hidden' name='LimCarTypeName' class="limCarTypeName" value='${CarTypeDictsList[0].Name}'></input> 
			<input type='hidden' name='LimCarLoadTypeName' class="limCarLoadTypeName" value='${CarLoadDictsList[0].Name}'></input> 
			<input type='hidden' name='SubTypeName' class="subTypeName"></input>
			<input type='hidden' name='TotalMileage' class='totalMileage'></input>
			<input type='hidden' name='LimCarLength1' class="limCarLength1" value="-1">
			<input type='hidden' name='LimCarLength2' class="limCarLength2" value="-1">
			<input type='hidden' name='LimCarLength3' class="limCarLength3" value="-1">
			
			<input type='hidden' name='SrcAdCode' id='SrcAdCode'>
			<input type='hidden' name='DestAdCode' id='DestAdCode'>
			
			<input class="s1" type='hidden' name="SrcProvince"></input>
			<input class="s2" type='hidden' name="SrcCity"></input>
			<input class="s3" type='hidden' name="SrcArea"></input>
			
			<input class="d1" type='hidden' name="DestProvince"></input>
			<input class="d2" type='hidden' name="DestCity"></input>
			<input class="d3" type='hidden' name="DestArea"></input>
			
			<div style="padding-top: 40px;">
				<div class="release_top">
					<div class="release_title">基本信息</div>
				</div>
				<div class="release_content">
					<table>
						<tr>
							<td colspan="1" class="release_attribute">发货地</td>
							<td colspan="1" class="release_table28"><select
								class="start1" onchange="onChangeAddr(this)" style="border-color:#b0b0b0">
									<option>选择省</option>
							</select> <select disabled="disabled" class="start2"
								onchange="onChangeAddr(this)"style="border-color:#b0b0b0">
									<option>选择市</option>
							</select> <select disabled="disabled" class="start3"
								onchange="onChangeAddr(this)" style="border-color:#b0b0b0">
									<option>选择区</option>
							</select> <font class="redStar">*</font></td>
							<td colspan="1" class="release_attribute">目的地</td>
							<td colspan="1" class="release_table28"> <select
								class="dest1" onchange="onChangeAddr(this)"style="border-color:#b0b0b0">
									<option>选择省</option>
							</select> <select disabled="disabled" class="dest2"
								onchange="onChangeAddr(this)" style="border-color:#b0b0b0">
									<option>选择市</option>
							</select> <select disabled="disabled" class="dest3"
								onchange="onChangeAddr(this)" style="border-color:#b0b0b0">
									<option>选择区</option>
							</select> <font class="redStar">*</font></td>
						</tr>
						<tr>
							<td colspan="1" class="release_attribute">车长要求</td>
							<td colspan="3" class="release_table78"
								style="width: 100%;">
							<input
								onClick="searchOptions();" class="limCarLengthName"
								placeholder="最多选三项" style="width: 95%;border-color:#b0b0b0"> <font
								class="redStar">*</font></td>
						</tr>
						<tr>
							<td colspan="1" class="release_attribute">货物类型</td>
							<td colspan="1" class="release_table28" style="border-color:#b0b0b0"><select
								name="TypeCode" style="border-color:#b0b0b0">
									<option value="1">重货</option>
									<option value="2">泡货</option>
							</select></td>
							<td colspan="2" class="release_table50" style="padding-left: 0;border-color:#b0b0b0">
								<select style="width: 95%;border-color:#b0b0b0" name="SubTypeCode"
								class="subTypeCode"
								onchange="setSelectName('subTypeName', 'subTypeCode')">
									<c:forEach items="${cargoSubTypeDictsList}" var="info">
										<option value=${info.Code}>${info.Name}</option>
									</c:forEach>
							</select> <font class="redStar">*</font>
							</td>
						</tr>
						<tr>
							<td colspan="1" class="release_attribute">货物数量</td>
							<td colspan="3" class="release_table78"><input
								class="minCount" name="MinCount" type="text" placeholder="最小值"
								style="width: 29%;border-color:#b0b0b0"
								onkeyup="this.value=this.value.replace(/\D/g,'')"
								onafterpaste="this.value=this.value.replace(/\D/g,'')">
								<input class="maxCount" name="MaxCount" type="text"
								placeholder="最大值" style="width: 29%; margin-left: 4px;border-color:#b0b0b0"
								onkeyup="this.value=this.value.replace(/\D/g,'')"
								onafterpaste="this.value=this.value.replace(/\D/g,'')">
								<select style="width: 29%; margin-left: 5px;border-color:#b0b0b0" name="CountUnit">
									<option value="吨">吨</option>
									<option value="方">方</option>
							</select> <font class="redStar">*</font></td>
						</tr>
						<tr>
							<td colspan="1" class="release_attribute">联系人</td>
							<td colspan="3" class="release_table50"><input
								class="publisherName" name="Contact" type="text"
								style="width: 50%;border-color:#b0b0b0" value="${accountName}"> <font
								class="redStar" style="float: none; top: 2px;">*</font></td>
						</tr>
						<tr>
							<td colspan="1" class="release_attribute">联系电话</td>
							<td colspan="3" class="release_table78"><input
								class="publisherPhone" name="Phone" type="text"
								style="width: 78%;border-color:#b0b0b0" value="${accountCode}"> <font
								class="redStar" style="float: none; top: 2px;">*</font></td>
						</tr>
					</table>
				</div>
				<div class="release_top">
					<div class="release_title">扩展信息</div>
				</div>
				<div class="release_more">
					<div class="moreInfo"
						style="float: right; color: #05A95C; font-size: 14px; padding: 10px 0;">
						点击填写更多信息+</div>
					<div style="clear: both;"></div>
				</div>
				<div class="release_moreContent">
					<table>
						<tr>
							<td colspan="1" class="release_attribute">自动重发</td>
							<td colspan="2" class="release_table78">
							<select
								name="RepeatInterval" onchange="onChange(this);"
								style="width: 47%;border-color:#b0b0b0">
									<option value=0>不重发</option>
									<option value=10>10分钟</option>
									<option value=30>半小时</option>
									<option value=60>一小时</option>
									<option value=120>两小时</option>
							</select> <select name="RepeatSum" id="repeat"
								style="width: 47%; margin-left: 3px;border-color:#b0b0b0">
									<option value=0>----</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="1" class="release_attribute">报价方式</td>
							<td colspan="2" class="release_table78"><select
								name="OfferType" style="width: 47%;border-color:#b0b0b0">
									<option value=0>无限制</option>
									<option value=1>元/吨</option>
									<option value=2>元/车</option>
									<option value=3>元/方</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="1" class="release_attribute">车型要求</td>
							<td colspan="2" class="release_table78"><select
								class="limCarTypeCode" name="LimCarTypeCode" style="width: 47%;border-color:#b0b0b0"
								onchange="setSelectName('limCarTypeName', 'limCarTypeCode')">
									<c:forEach items="${CarTypeDictsList}" var="info">
										<option value=${info.Code}>${info.Name}</option>
									</c:forEach>
							</select> <select name="LimCarLoadTypeCode" class="limCarLoadTypeCode"
								style="width: 47%; margin-left: 3px;border-color:#b0b0b0"
								onchange="setSelectName('limCarLoadTypeName', 'limCarLoadTypeCode')">
									<c:forEach items="${CarLoadDictsList}" var="info">
										<option value=${info.Code}>${info.Name}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td colspan="1" class="release_attribute">车辆数量</td>
							<td colspan="2" class="release_table78"><input
								name="CarCount" type="text" style="width: 55%;border-color:#b0b0b0" value="1"
								onkeyup="this.value=this.value.replace(/\D/g,'')"
								onafterpaste="this.value=this.value.replace(/\D/g,'')">&nbsp;辆
								<input type='hidden' name='RequireCode' value="1"></input></td>
						</tr>
						<!-- <tr type="hide">
							<td colspan="1" class="release_attribute">车辆要求</td>
							<td colspan="2" class="release_table78">
								<div class="optionBtn select" value="1">超长</div>
								<div class="optionBtn" value="2">超宽</div>
								<div class="optionBtn" value="4">超高</div>
								<div class="optionBtn" value="8">超重</div>
								<div class="optionBtn" value="16">包来回</div>
							</td>
						</tr> -->
						<tr>
							<td colspan="1" class="release_attribute">备用电话</td>
							<td colspan="2" class="release_table78"><input
								name="PhoneBak" type="text" style="width: 85%;border-color:#b0b0b0"
								placeholder="[备选联系电话]可存多个号码，使用|分隔" /></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td colspan="1" class="release_attribute" -->
<!-- 								style="position: relative; top: -35px;">备注</td> -->
<!-- 							<td colspan="2" rowspan="2" class="release_table78"><textarea -->
<!-- 									 type="text" style="width: 96%;border-color:#b0b0b0"></textarea></td> -->
<!-- 						</tr> -->
					</table>
				</div>
				<div style="margin: 10px 5px;">
					<input type="button" class="inputBtn" value="确认发布" id="releaseBtn"
						onClick="releaseComplete();">
				</div>
			</div>



			<div id="searchOptions" style="display: none;">
				<div style="font-size: 16px; padding: 6px 10px;">车长</div>
				<div style="background-color: #FFF; padding: 5px 12px;">
					<div class="optionBtn selected">车长不限</div>
					<c:forEach items="${CarLengthDictsList}" var="info">
						<div class="optionBtn" value=${info.Code}>${info.Name}</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
		</form>

		<div id="releaseComplete"
			style="display: none; text-align: center; padding: 20px 0; font-size: 14px;">
			<div>货源已发布</div>
			<div>
				请到“<span style="color: #FF6707;">我的货源</span>”进行查看
			</div>
			<div><span id="seconds">5</span>秒后自动关闭</div>
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
		</div>

		<div class="navigationBar">
			<ul>
				<li><a href="${ctx}/auth/page/mobile/weixin/logistics/wanji/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/riskLogistics/carSource.png" width="20" height="20" />
					</div>
					<div class="navTitle">物流服务</div>
				</a></li>
				<li><a href="javascript:;" onClick="selectReleaseType();">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/logistics/releaseSupplyed.png" width="20" height="20" />
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
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logistics/wanji/weixin/myList">我的货源</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logistics/wanji/weixin/collectList">我的收藏</a></li>
					<li><a href="${ctx}/logistics/wanji/weixin/incrementServices">增值服务</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
