<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>调查管理列表</title>
<link href="${ctx}/static/css/autoForm/surveyManagementList.css" rel="stylesheet"/>
<!-- <link href="css/iCheck/custom.css" rel="stylesheet"/>
<script src="js/jquery.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body id="body" onselectstart="return false;">
<div class="survey_main clearfix" id="mainDiv">
	<input type="hidden" name="parentId" id="parentId" value="${drawModuleInfo.id}" />
	<div class="survey_contCenterOper" >
		<div class="survey_contLeftTitle">
			<input title="重命名" type="text" name="moduleName" id="moduleName" value="${drawModuleInfo.moduleName}" style="border:0px;border-bottom:dashed 1px black;text-align:center;cursor:pointer;"/>
		</div>
	</div>
	
	<div id="surveyLeft" class="survey_contentLeft">
		<div class="survey_contLeftBar">
			<div class="survey_contCenterOper">
				<a href="javascript:void(0);" class="btn btn-white" id="groupBtn">新建分组</a>
			</div>
			<div style="width:100%;">
				<c:forEach items="${moduleList}" var="module">
					<a href="javascript:void(0);" onclick="toDrawInputMainPage('${module.id}');">${module.moduleName}</a>
					<br/>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div id="surveyCenter" class="survey_contentCenter">
		<div class="hr-line-dashed"></div>
		<div style="float:left;border:1px solid red;width:200px;height:300px;cursor:pointer;" onclick="toDrawInputMainPage()">
			新建表单
		</div>
	</div>
</div>
</body>
<script type="text/javascript"> 
 $(function(){
	var screenHeight = document.documentElement.clientHeight;
	var body = document.getElementById('body');
	body.style.height = screenHeight+"px"; 
	
	//提交返回按钮
	$("#saveBtn").click(function() {
		$("#form").submit();
	});
	
	//新建分组
	$("#groupBtn").click(function() {
		layer.prompt(
		  {
			  title:'请输入分组名称'
		  }
		  ,function(value, index, elem){
			  layer.close(index);
			  
		});
	});
	
	$("#cancelBtn").click(function() {
		window.history.go(-1);
		return false;
	});
 });
 
</script>
<script>
 $(function(){
	var screenWidth = document.documentElement.clientWidth;
	var centerWidth = document.getElementById('surveyCenter');
	if($("#surveyRight").attr("id") == undefined){//20为右边滚动条宽度
		centerWidth.style.width=screenWidth-251-20+"px";
	}else {
		centerWidth.style.width=screenWidth-251-20-301+"px";
	}
 });
 
 function toDrawInputMainPage(moduleId){
	 var parentId = $("#parentId").val();
	 if(moduleId == undefined){
		 moduleId = "";
	 }
	 window.location.href="${ctx}/drawModuleInfo/toDrawInputMain?moduleId="+moduleId+"&parentId="+parentId;
	 return false;
 }
</script>
</html>