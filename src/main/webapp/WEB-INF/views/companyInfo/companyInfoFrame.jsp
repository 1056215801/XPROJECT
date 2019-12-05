<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>企业信息</title>
<%@ include file="../common/commonFrames.jsp"%>
</head>
<script type="text/javascript">
	$(function(){
		if("${empty message}"!="true"){
			tips("${message}");
		}
		leftFrameLoad("${ctx}/front/page/companyInfo/parkTree?treeType=${treeType}&parkId=${parkId}&index=${index}");
	})
	var refreshStatus = 1;//开关 控制loadComplete是否执行 0为不执行 1为执行
	function zTreeOnClick(treeNode){
		rightFrameLoad("${ctx}/front/page/companyInfo/companyList?treeType=${treeType}&parkId=${parkId}&orgId="+treeNode.id+"&orgName="+treeNode.name+"&index=${index}");
	}
</script>
</html>