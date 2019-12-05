<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>发布货源-危化</title>
<link href="${ctx}/static/weixin/css/riskLogistics/logisticsService.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<script src="${ctx}/static/weixin/js/jquery.js" type="text/javascript"></script>
<script src="${ctx}/static/weixin/js/layer-v2.4/layer.js" type="text/javascript"></script>
<style>
body .layui-layer-tl_orange .layui-layer-title{background-color:#F55825; color:#fff; border: none;}
body .layui-layer-bg_gray .layui-layer-content{background-color:#ebebeb;}
body .layui-layer-bg_gray .layui-layer-btn0{background-color:#F55825; color:#FFF; text-align:center; padding:5px 0; width:100%; margin:0;}
</style>
<script>
 $(function(){
	$(".moreInfo").click(function(){ 
		var div = $(".release_moreContent"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
			$(".moreInfo").text("收起-");
		}else{ 
	  		div.slideUp("fast"); 
			$(".moreInfo").text("点击填写更多信息+");
		} 
	});
	$("#searchOptions .optionBtn").click(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}else{
			$(this).addClass("selected");
		}
	});
	selectArea();

 });
 function searchOptions(){
 	layer.open({
		type: 1,
		title:false,
		skin: 'layui-layer-bg_gray',
		shadeClose: true,
		shade: [0],
		area:['100%','100%'],
		shift:2,
		closeBtn:0,
		content: $('#searchOptions'),
		btn: '确定选择'
	});
 }; 
 function releaseComplete(){
	
 	if (!$('#beginAreaId').val()) {
 		layer.msg("请选择发货地址");
 		return;
 	}
 	
 	$('#beginContacts').val($('#srcTel').val());
 	if (!$('#beginContacts').val()) {
 		layer.msg("请输入发货人联系电话");
 		return;
 	}
 	
 	$('#beginDetailAddress').val($('#srcDetails').val());
 	if (!$('#beginDetailAddress').val()) {
 		layer.msg("请输入发货详细地址");
 		return;
 	}
 	
 	if (!$('#endAreaId').val()) {
 		layer.msg("请选择收货地址");
 		return;
 	}
 	$('#endContacts').val($('#destTel').val());
 	if (!$('#endContacts').val()) {
 		layer.msg("请输入收货人联系电话");
 		return;
 	}
 	
 	$('#endDetailAddress').val($('#destDetails').val());
 	if (!$('#endDetailAddress').val()) {
 		layer.msg("请输入收货详细地址");
 		return;
 	}
 	
 	$('#goodsName').val($('#goodName').val());
 	if (!$('#goodsName').val()) {
 		layer.msg("请输入货物名称");
 		return;
 	}
 	$('#goodsWeight').val($('#goodWeight').val());
 	if (!$('#goodsWeight').val()) {
 		layer.msg("请输入货物数量");
 		return;
 	}
 	var totalPrice = $('#totalInput input').val();
 	if(totalPrice!="" && (totalPrice<$('#goodsWeight').val()*50 || totalPrice>$('#goodsWeight').val()*1000)){
 		layer.msg("每吨必须大于50小于1000元");
 		return;
 	}
 	
 	$('#totalPrice').val(totalPrice);
 	if (!$('#totalPrice').val() && !$("#totalInput").is(":hidden")) {
 		layer.msg("请填写运费总价");
 		return;
 	}
 	
 	//禁用按钮防止重复发布
	$("#releaseBtn").attr("disabled",true);
 	
 	$.ajax({
 		url : '${ctx}/logistics/zwb/json/saveGoods',
 		data : $('#form1').serialize(),
 		success : function(result) {
 			layer.msg(result.msg);
 			if(result.code==30000 || result.code==20000){
 				setTimeout(function(){goToZwbList();},1000);
 			}else{
 				//启用发布按钮
				$("#releaseBtn").attr("disabled",false);
 			}
 		},
 		error : function() {
 			layer.msg("网络异常");
 			//启用发布按钮
			$("#releaseBtn").attr("disabled",false);
 		},
 	});
 };

 
 
function selectArea() {
	$.ajax({
		url : '${ctx}/logistics/zwb/json/area',
		data : {
			'kind':0,
			'parent':0,
		},
		success : function(data) {
			if (data.code != "1") {
				layer.msg("网络异常");
				return;
			}
			var list = data.value;
			$('#src1').empty();
			$('#dest1').empty();
			$('#src1').append('<option kind=\"-1\">请选择</option>');
			$('#dest1').append('<option kind=\"-1\">请选择</option>');
			for (var i = 0; i < list.length; i++) {
				var item = list[i];
				var _div = "";
				_div += '<option value=\'' + item.ID + '\' parent=\'' + item.PARENT + '\' kind=\'' + item.KIND + '\'>' + item.NAME + '</option>';
				$('#src1').append(_div);
				if(${!empty zwbPublishgoodsLogBean.beginAreaIds[0]}){
					$('#src1').val(${zwbPublishgoodsLogBean.beginAreaIds[0]});
					onChangeAddr($('#src1'));
				}
				$('#dest1').append(_div);
				if(${!empty zwbPublishgoodsLogBean.endAreaIds[0]}){
					$('#dest1').val(${zwbPublishgoodsLogBean.endAreaIds[0]});
					onChangeAddr2($('#dest1'));
				}
			}
		},
	});
}

function onChangeAddr(obj) {
	if ($(obj).find('option:selected').attr('kind') == '0') {
		var kind = Number($(obj).find('option:selected').attr('kind')) + 1;
		$('#beginAreaId').val($(obj).find('option:selected').attr('value'));
		getArea(kind, $(obj).find('option:selected').attr('value'), '#src2');
	} else if ($(obj).find('option:selected').attr('kind') == '1'){
		var kind = Number($(obj).find('option:selected').attr('kind')) + 1;
		$('#beginAreaId').val($(obj).find('option:selected').attr('value'));
		getArea(kind, $(obj).find('option:selected').attr('value'), '#src3');
	} else if ($(obj).find('option:selected').attr('kind') == '-1') {
		$('#src2').prop('disabled', true);
		$('#src2').empty();
		$('#src2').append('<option>请选择</option>');
		$('#src3').prop('disabled', true);
		$('#src3').empty();
		$('#src3').append('<option>请选择</option>');
		$('#src4').prop('disabled', true);
		$('#src4').empty();
		$('#src4').append('<option>请选择</option>');
		$('#beginAreaId').val('');
	} else if (($(obj).find('option:selected').attr('kind') == '2')) {
		var kind = Number($(obj).find('option:selected').attr('kind')) + 1;
		$('#beginAreaId').val($(obj).find('option:selected').attr('value'));
		getArea(kind, $(obj).find('option:selected').attr('value'), '#src4');
	} else {
		$('#beginAreaId').val($(obj).find('option:selected').attr('value'));
	}
}

function onChangeAddr2(obj) {
	if ($(obj).find('option:selected').attr('kind') == '0') {
		var kind = Number($(obj).find('option:selected').attr('kind')) + 1;
		$('#endAreaId').val($(obj).find('option:selected').attr('value'));
		getArea(kind, $(obj).find('option:selected').attr('value'), '#dest2');
	} else if ($(obj).find('option:selected').attr('kind') == '1'){
		var kind = Number($(obj).find('option:selected').attr('kind')) + 1;
		$('#endAreaId').val($(obj).find('option:selected').attr('value'));
		getArea(kind, $(obj).find('option:selected').attr('value'), '#dest3');
	} else if ($(obj).find('option:selected').attr('kind') == '-1') {
		$('#dest2').prop('disabled', true);
		$('#dest2').empty();
		$('#dest2').append('<option>请选择</option>');
		$('#dest3').prop('disabled', true);
		$('#dest3').empty();
		$('#dest3').append('<option>请选择</option>');
		$('#dest4').prop('disabled', true);
		$('#dest4').empty();
		$('#dest4').append('<option>请选择</option>');
		$('#endAreaId').val('');
	} else if (($(obj).find('option:selected').attr('kind') == '2')) {
		var kind = Number($(obj).find('option:selected').attr('kind')) + 1;
		$('#endAreaId').val($(obj).find('option:selected').attr('value'));
		getArea(kind, $(obj).find('option:selected').attr('value'), '#dest4');
	} else {
		$('#endAreaId').val($(obj).find('option:selected').attr('value'));
	}
}

function getArea(kind,parent,obj) {
	$.ajax({
		url : '${ctx}/logistics/zwb/json/area',
		data : {
			'kind':kind,
			'parent':parent,
		},
		success : function(data) {
			if (data.code != "1") {
				layer.msg("网络异常");
				return;
			}
			var list = data.value;
			$(obj).empty();
			if (list.length == 0) {
				$(obj).append('<option>请选择</option>');
				$(obj).prop('disabled', true);
			} else {
				$(obj).prop('disabled', false);
				for (var i = 0; i < list.length; i++) {
					var item = list[i];
					var _div = "";
					_div += '<option value=\'' + item.ID + '\' parent=\'' + item.PARENT + '\' kind=\'' + item.KIND + '\'>' + item.NAME + '</option>';
					$(obj).append(_div);
				}
				
				if (obj.indexOf('src') >= 0) {
					var areaId = 0;
					if (obj.indexOf('2') >= 0) {
						areaId = ${empty zwbPublishgoodsLogBean.beginAreaIds[1]?0:zwbPublishgoodsLogBean.beginAreaIds[1]};					
					} else if(obj.indexOf('3') >= 0) {
						areaId = ${empty zwbPublishgoodsLogBean.beginAreaIds[2]?0:zwbPublishgoodsLogBean.beginAreaIds[2]};
					} else if(obj.indexOf('4') >= 0){
						areaId = ${empty zwbPublishgoodsLogBean.beginAreaIds[3]?0:zwbPublishgoodsLogBean.beginAreaIds[3]};
					}
					existOption(obj,areaId);
					onChangeAddr($(obj));
				} else {
					var areaId = 0;
					if (obj.indexOf('2') >= 0) {
						areaId = ${empty zwbPublishgoodsLogBean.endAreaIds[1]?0:zwbPublishgoodsLogBean.endAreaIds[1]};					
					} else if(obj.indexOf('3') >= 0) {
						areaId = ${empty zwbPublishgoodsLogBean.endAreaIds[2]?0:zwbPublishgoodsLogBean.endAreaIds[2]};
					} else if(obj.indexOf('4') >= 0){
						areaId = ${empty zwbPublishgoodsLogBean.endAreaIds[3]?0:zwbPublishgoodsLogBean.endAreaIds[3]};
					}
					existOption(obj,areaId);
					onChangeAddr2($(obj));
				}
			}
		},
	});
}

//如果是修改货源 添加完节点后选择原来的地址
function existOption(id,value){
	$(id+' option').each(function(index,item){
		 if($(item).val()==value){
			 isExist = true;
			 $(id).val(value);
		 }
	 });
}

function totalInputChange(obj) {
	if ($(obj).find('option:selected').val() == '一口价') {
		$('#totalInput input').val('');
		$('#totalInputLayout').show();
	} else {
		$('#totalInput input').val('');
		$('#totalInputLayout').hide();
	}
}
function onGoodType(obj) {
	$('#goodsTypeId').val($(obj).find('option:selected').attr('value'));
}
function selectSendType(obj){
	$('#sendType').val($(obj).val());
}
</script>
</head>
<body>
<!-- 	'3519,3360,3388,3391' -->
	<form name="form1" id="form1" method="post">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type='hidden' name='goodsId' id="goodsId" value="${zwbPublishgoodsLogBean.goodsId}"></input>
		<input type='hidden' name='beginAreaId' id="beginAreaId" value="${zwbPublishgoodsLogBean.beginAreaId}"></input>
		<input type='hidden' name='beginDetailAddress' id="beginDetailAddress" value="${zwbPublishgoodsLogBean.beginDetailAddress}"></input>
		<input type='hidden' name='beginContacts' id="beginContacts" value="${zwbPublishgoodsLogBean.beginContacts}"></input>
		<input type='hidden' name='endAreaId' id="endAreaId" value="${zwbPublishgoodsLogBean.endAreaId}"></input>
		<input type='hidden' name='endDetailAddress' id="endDetailAddress" value="${zwbPublishgoodsLogBean.endDetailAddress}"></input>
		<input type='hidden' name='endContacts' id="endContacts" value="${zwbPublishgoodsLogBean.endContacts}"></input>
		<input type='hidden' name='totalPrice' id='totalPrice' value="${zwbPublishgoodsLogBean.totalPrice}"></input>
		<input type='hidden' name='goodsTypeId' id='goodsTypeId' value="${empty zwbPublishgoodsLogBean.goodsTypeId?14:zwbPublishgoodsLogBean.goodsTypeId}"></input>
		<input type='hidden' name='goodsName' id='goodsName' value="${zwbPublishgoodsLogBean.goodsName}"></input>
		<input type='hidden' name='goodsWeight' id='goodsWeight' value="${zwbPublishgoodsLogBean.goodsWeight}"></input>
		<input type='hidden' name='sendType' id='sendType' value="${empty zwbPublishgoodsLogBean.sendType?0:zwbPublishgoodsLogBean.sendType}"></input>
	</form>
<div class="logistics_main">
	<div class="fixed_top" style="background-color:#F55825;">
		<img src="${ctx}/static/weixin/images/riskLogistics/createSupply.png" width="20" height="20">
		<span>发布货源</span>
	</div>
	<div class="logistics_content">
		<div style="margin-top:70px;"></div>
		<div class="caption_top">
			<div class="caption_title">基本信息</div>
		</div>
		<div class="releaseCont">
			<table>
				<tr>
					<td colspan="1" rowspan="2" class="release_attribute">发货地</td>
					<td colspan="3" class="release_table78">
						<select style="width:25%;" onChange="onChangeAddr(this);" id="src1">
						</select>
						<select style="width:25%;" disabled="disabled" onChange="onChangeAddr(this);" id="src2">
							<option>请选择</option>
						</select>
						<select style="width:25%;" disabled="disabled" onChange="onChangeAddr(this);" id="src3">
							<option>请选择</option>
						</select>
						<select style="width:25%;" disabled="disabled" onChange="onChangeAddr(this);" id="src4">
							<option>请选择</option>
						</select>
						<font class="redStar" style="float:none; top:2px;">*</font>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="release_table78">
<!-- 						<input type="text" style="width:50%;" placeholder="发货人"/> -->
					</td>
				</tr>
				<tr>
					<td colspan="1" rowspan="2" class="release_attribute">发货人</td>
					<td colspan="3" class="release_table78">
						<input type="text" style="width:70%;" id="srcTel" placeholder="联系电话" value="${zwbPublishgoodsLogBean.beginContacts}"/>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="release_table78">
						<input type="text" style="width:70%;" id="srcDetails" placeholder="详细地址" value="${zwbPublishgoodsLogBean.beginDetailAddress}"/>
					</td>
				</tr>
				<tr>	
					<td colspan="1" rowspan="2" class="release_attribute">目的地</td>
					<td colspan="3" class="release_table78">
						<select style="width:25%;" onChange="onChangeAddr2(this);" id="dest1">
						</select>
						<select style="width:25%;" disabled="disabled" onChange="onChangeAddr2(this);" id="dest2">
							<option>请选择</option>
						</select>
						<select style="width:25%;" disabled="disabled" onChange="onChangeAddr2(this);" id="dest3">
							<option>请选择</option>
						</select>
						<select style="width:25%;" disabled="disabled" onChange="onChangeAddr2(this);" id="dest4">
							<option>请选择</option>
						</select>
						<font class="redStar" style="float:none; top:2px;">*</font>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="release_table78">
<!-- 						<input type="text" style="width:50%;" placeholder="收货人"/> -->
					</td>
				</tr>
				<tr>
					<td colspan="1" rowspan="2" class="release_attribute">收货人</td>
					<td colspan="3" class="release_table78">
						<input type="text" style="width:70%;" id='destTel' placeholder="联系电话" value="${zwbPublishgoodsLogBean.endContacts}"/>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="release_table78">
						<input type="text" style="width:70%;" id='destDetails' placeholder="详细地址" value="${zwbPublishgoodsLogBean.endDetailAddress}"/>
					</td>
				</tr>
				<tr>
					<td colspan="1" class="release_attribute">货物名称</td>
					<td colspan="3" class="release_table78" style="padding-right:10px;">
						<input type="text" style="width:100%;" id='goodName' placeholder="" value="${zwbPublishgoodsLogBean.goodsName}"/>
					</td>
				</tr>
				<tr>
					<td colspan="1" class="release_attribute">货物种类</td>
					<td colspan="3" class="release_table78">
						<select style="width:96%;" onChange="onGoodType(this);">
							<option value='14'>一类（爆炸品）</option>
							<option value='15'>二类（压缩,液化气体）</option>
							<option value='16'>三类（易燃液体）</option>
							<option value='17'>四类（易燃固体，自燃物品和遇湿易燃）</option>
							<option value='18'>五类（氧化剂，有机过氧化物）</option>
							<option value='19'>六类（毒害品，感染类物品）</option>
							<option value='20'>七类（放射性物质）</option>
							<option value='21'>八类（腐蚀品）</option>
							<option value='22'>九类（危险废弃物）</option>
						</select>
						<font class="redStar">*</font>
					</td>
				</tr>
				<tr>
					<td colspan="1" class="release_attribute">货物数量</td>
					<td colspan="3" class="release_table78">
						<input type="text" style="width:30%;" id='goodWeight' value="${zwbPublishgoodsLogBean.goodsWeight}">吨
						<font class="redStar" style="float:none; top:2px;">*</font>
					</td>
				</tr>
			</table>
		</div>
		<div class="caption_top">
			<div class="caption_title">扩展信息</div>
		</div>
		<div class="release_more">
			<div class="moreInfo" style="color:#F55825;">
				点击填写更多信息+
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="release_moreContent">
			<table>
				<tr>
					<td colspan="1" class="release_attribute">竞价方式</td>
					<td colspan="3" class="release_table78">
						<select style="width:50%;" onChange="totalInputChange(this);">
							<option>一口价</option>
							<option ${biddingState eq 1?'selected':''}>竞价</option>
						</select>
					</td>
				</tr>
				<tr id="totalInputLayout" ${biddingState eq 1?'hidden':''}>
					<td colspan="1" class="release_attribute">运费总价</td>
					<td colspan="3" class="release_table78" id="totalInput">
						<input type="text" style="width:80%;" placeholder='每吨必须大于50小于1000元' value="${biddingState eq 1?'':zwbPublishgoodsLogBean.totalPrice}">
<!-- 						<font class="redStar" style="float:none; top:2px;">*</font> -->
					</td>
				</tr>
				<tr>
					<td colspan="1" class="release_attribute">配送方式</td>
					<td colspan="3" class="release_table78">
						<select style="width:50%;" onchange="selectSendType(this);">
							<option value='0' ${zwbPublishgoodsLogBean.sendType eq 0?'selected':''}>零担</option>
							<option value='1' ${zwbPublishgoodsLogBean.sendType eq 1?'selected':''}>整车</option>
						</select>
					</td>
				</tr>
				<!--<tr>
					<td colspan="1" class="release_attribute">装货时间</td>
					<td colspan="3" class="release_table78">
						<select style="width:50%;">
							<option>请选择</option>
						</select>
					</td>
				</tr>-->
<!-- 				<tr> -->
<!-- 					<td colspan="1" class="release_attribute" style="position:relative;top:-35px;">备注</td> -->
<!-- 					<td colspan="3" rowspan="2" class="release_table78"> -->
<!-- 						<textarea type="text" style="width:96%;"></textarea> -->
<!-- 					</td> -->
<!-- 				</tr> -->
			</table>
		</div>
		<div style="margin:10px 5px;">
			<input type="button" id="releaseBtn" class="releaseBtn" style="background-color:#F55825;" value="确认发布" onClick="releaseComplete();">
		</div>
	</div>
	
	<!-- 底部工具栏和发布货源弹窗 -->
		<%@ include file="common/createSupplyLayer.jsp"%>
		<!-- 改变工具栏第2个图标 -->
		<script type="text/javascript">
			img_green(1);
		</script>
</div>

	<form id="zwbList" action="${ctx}/logistics/wanji/weixin/myList" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></input> 
		<input type='hidden' name='isZwb' value="true"></input>
	</form>
	<script type="text/javascript">
		function goToZwbList(){
			$("#zwbList").submit();
		}
	</script>
</body>
</html>