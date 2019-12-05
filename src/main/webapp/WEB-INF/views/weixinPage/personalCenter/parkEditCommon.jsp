<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>常用园区设置</title>
<link href="${ctx}/static/weixin/css/personalCenter/login.css" rel="stylesheet" />
<style type="text/css">
body .layui-layer-btn .layui-layer-btn0 {
	border-color:#f14241;
	background-color:#f14241;
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
	background-color:#f14241;
	border-radius:2px 2px 0 0
}

/* 小火箭 */
#tbox{
	width:50px;
	height: 60px; 
	background:url(/XProject/static/weixin/images/logistics/rocket.png) no-repeat; 
	display:none;
	position:fixed;
	right:10px;
	bottom:50px;
	background-size:50px 50px; 
}
</style>
</head>

<body>
	<!-- 修改常用园区表单 -->
	<form id="changeCommonForm" action="${ctx}/personalCenter/parkSave" method="post">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"></input>
		<input type="hidden" id="parkType" name="parkType" value="2">
		<input type="hidden" id="newParkInfo" name="newParkInfo" >
	</form>
	<div class="login_main">
		<div class="input_dataBar" style="min-height:37px;">
			<div class="input_dataLeft" style="position:absolute;top:13px;left:5px;">常用园区</div>
			<c:forEach items="${commonParkList}" var="item">
		    	<div class="input_data" id="commonPark${item.ORGANIZATION_ID}">
					<div class="input_dataLeft"></div>
					<div class="inputContral" style="width: 60%;">${item.PARK_NAME}</div>
					<div class="delOperation" onclick="deleteCommonPark('${item.ORGANIZATION_ID}');">删除</div>
				</div>
			</c:forEach>
		</div>
		<div class="input_dataBar" style="padding: 0;">
			<div class="screenBar" style="width:100px;position:relative;">
				<img src="${ctx}/static/weixin/images/personalCenter/location.png" width="15" height="15"> 
				<select style="color:#f14241;border:none;outline:none;width:90px;height:35px;position:absolute;left:40px;top:0;" onchange="changeArea(this);">
					<option style="color:black;" value="0">全部</option>
					<c:forEach items="${areaList}" var="item">
				       <option style="color:black;" value="${item.AREA_ID}">${item.AREA_NAME}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<c:forEach items="${areaList}" var="item">
			<div class="areaBar" areaId="${item.AREA_ID}">
				<div class="addBar">${item.AREA_NAME}</div>
				<c:forEach items="${parkList}" var="info">
					<c:if test="${info.AREA_ID eq item.AREA_ID}">
						<div class="input_dataBar" style="margin-top: 0;">
							<div class="input_data">
								<input type="checkbox" str="${info.PARK_NAME}" class="checkBoxCont" style="outline:none;display:${empty info.ORGANIZATION_ID?'none':''}" 
								organizationId="${info.ORGANIZATION_ID}" rootId="${info.ROOT_ID}" parkName="${info.PARK_NAME}"
								onclick="selectCommonPark(this);" />
								<div class="inputContral" style="width: 80%;">${empty info.ORGANIZATION_ID?'暂无可选园区':info.PARK_NAME}</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
		
		<div style="padding: 10px 7px;">
			<input type="button" value="确认修改" class="buttonContral_red" style="outline: none;" onclick="changeDefaultPark();">
		</div>
		<div style="padding: 0px 7px 10px;">
			<input type="button" value="返&nbsp;回" onClick="javascript:history.back(-1);" class="buttonContral_white" style="outline: none;">
		</div>
	</div>
	<div id="tbox" onclick="location.href='#top';"></div>
</body>
<script type="text/javascript">
	$(function(){
		/* 滚动显示小火箭 */
		$(window).scroll(
				function() {
					if ($(document).scrollTop() > 0) {
						$('#tbox').show();
					} else {
						$('#tbox').hide();
					}
				});
	});

	/* 确认修改默认园区 */
	function changeDefaultPark() {
		var newParkInfo = new Array();
		$(".checkBoxCont:checked").each(function(index,item){
			var organizationId = $(item).attr("organizationId");
			var rootId = $(item).attr("rootId");
			var parkName = $(item).attr("parkName");
			var str = organizationId + "-" + rootId + "-" +parkName;
			newParkInfo.push(str);
		});
		$("#newParkInfo").val(newParkInfo);
		$("#changeCommonForm").submit();
	}
	
	//删除常用园区
	function deleteCommonPark(organizationId){
		var confirmIndex = layer.confirm("确定删除吗?",function(index, layero){
			layer.close(confirmIndex);
			$.ajax({
				url : "${ctx}/personalCenter/deleteCommonPark",
				type : "post",
				data : {
					"${_csrf.parameterName}":'${_csrf.token}',
					"organizationId":organizationId
				},
				dataType : "json",
				success : function(result) {
					if(result.code==1){
						$("#commonPark"+organizationId).remove();
						layer.msg("删除成功");
					}else{
						layer.msg(result.msg);
					}
				},
				error : function() {
					layer.msg("系统异常");
				}
			});
		});
	}
	
	//选择常用园区（判断是否已经是常用园区）
	function selectCommonPark(obj){
		var organizationId = $(obj).attr("organizationId");
		var rootId = $(obj).attr("rootId");
		var parkName = $(obj).attr("parkName");
		if($("#commonPark"+organizationId).length>0){
			layer.msg("该园区已设置为常用园区!")
			$(obj).prop("checked",false);
		}
	}
	
	//改变筛选区域
	function changeArea(obj){
		if($(obj).val()==0){
			$(".areaBar").each(function(index,item){
				$(item).show();
			});
		}else{
			var areaId = ""+$(obj).val();
			$(".areaBar").each(function(index,item){
				if(areaId==$(item).attr("areaId")){
					$(item).show();
				}else{
					$(item).hide();
				}
			});
		}
	}
</script>
</html>
