<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>默认园区设置</title>
<link href="${ctx}/static/weixin/css/personalCenter/login.css" rel="stylesheet" />
</head>
<body>
	<!-- 修改默认园区表单 -->
	<form id="changeDefaultForm" action="${ctx}/personalCenter/parkSave" method="post">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"></input>
		<input type="hidden" id="parkType" name="parkType" value="1">
		<input type="hidden" id="newParkInfo" name="newParkInfo" >
	</form>
	<div class="login_main">
		<div class="input_dataBar">
			<div class="input_data">
				<div class="input_dataLeft">默认园区</div>
				<div class="inputContral" style="width: 60%;">${defaultPark}</div>
			</div>
		</div>
		<div class="input_dataBar">
			<c:forEach items="${parkList}" var="item">
				<div class="input_data">
					<input type="checkbox" class="checkBoxCont" ${item.PARK_NAME==defaultPark?'checked':''} 
					style="outline: none;" organizationId="${item.ORGANIZATION_ID}" 
					rootId="${item.ROOT_ID}" parkName="${item.PARK_NAME}"/>
					<div class="inputContral" style="width: 60%;">${item.PARK_NAME}</div>
				</div>
			</c:forEach>
		</div>
		<div style="padding: 10px 7px;">
			<input type="button" value="确认修改" class="buttonContral_red" style="outline: none;" onclick="changeDefaultPark();">
		</div>
		<div style="padding: 0px 7px 10px;">
			<input type="button" value="返&nbsp;回" onClick="javascript:history.back(-1);" class="buttonContral_white" style="outline: none;">
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		//多选变单选
		var tmpInput = $(".input_dataBar input:checked");
		$(".input_dataBar input").each(function(index, item) {
			$(item).click(function() {
				if($(item).is(":checked")){
					$(tmpInput).removeAttr("checked");
					tmpInput = $(item);
				}else{
					$(item).prop("checked",true);
				}
			});
		});
	});
	
	/* 确认修改默认园区 */
	function changeDefaultPark() {
		//赋值给表单
		var newParkInfo = new Array();
		var checkedInput = $(".input_dataBar input:checked");
		newParkInfo.push($(checkedInput).attr("organizationId"));
		newParkInfo.push($(checkedInput).attr("rootId"));
		newParkInfo.push($(checkedInput).attr("parkName"));
		$("#newParkInfo").val(newParkInfo);
		$("#changeDefaultForm").submit();
	}
</script>
</html>
