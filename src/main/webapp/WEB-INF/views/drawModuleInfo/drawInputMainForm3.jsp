<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>绘制表单相关页面</title>
<link href="${ctx}/static/css/autoForm/surveyManagementList.step.css" rel="stylesheet"/>
<!-- 引导标签引用 -->
<link href="${ctx}/static/css/plugins/steps/jquery.steps.drawForm.css" rel="stylesheet">
<!-- 引用绘制表格的样式 -->
<link href="${ctx}/static/css/autoForm/drawTd.step.css" rel="stylesheet"/>
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">

<script src="${ctx}/static/js/jquery-ui-1.10.4.min.js"></script>
</head>

<body id="body" onselectstart="return false;" style="overflow:hidden;">
	<div id="setpForm" class="wizard-big wizard clearfix">
	    <div class="steps clearfix">
			<ul>
				<li class="first disabled">
					<a id="setpForm-t-0" href="javascript:void(0);">
						<span class="current-info audible">当前步骤：</span>
						<span class="number">1.</span>控件配置
					</a>
				</li>
				<li class="disabled">
					<a id="setpForm-t-1" href="javascript:void(0);">
						<span class="number">2.</span>表格布局绘制
					</a>
				</li>
				<li class="first current">
					<a id="setpForm-t-2" href="javascript:void(0);">
						<span class="number">3.</span>控件布局
					</a>
				</li>
				<li class="disabled last">
					<a id="setpForm-t-3" href="javascript:void(0);">
						<span class="number">4.</span>完成
					</a>
				</li>
			</ul>
		</div>
		
		<div class="content clearfix">
		    <h1 id="setpForm-h-0" class="title current">控件配置</h1>
		    <fieldset id="setpForm-p-0" class="body current">
		        <div class="survey_main clearfix">
					<div id="surveyLeft" class="survey_contentLeft">
						<div class="survey_contLeftBar">
							<div class="survey_contLeftTitle">可选已配置字段</div>
							<div class="elementDiv clearfix" id="nowDiv">
								<c:forEach items="${inputList}" var="input" varStatus="k">
									<c:if test="${allTdInput[input.id] != 'yes'}">
										<span class="elementSpan dragsource" id="element${k.index}" inputid="${input.id}">${input.inputTitle}</span>
									</c:if>
								</c:forEach>
							</div>
						</div>
						
						<div class="elementDiv clearfix" id="forResetDiv" style="display:none;">
							<c:forEach items="${inputList}" var="input" varStatus="k">
								<span class="elementSpan dragsource" id="element${k.index}" inputid="${input.id}">${input.inputTitle}</span>
							</c:forEach>
						</div>
					</div>
					
					<div id="surveyCenter" class="survey_contentCenter">
						<div class="divOper">
							<input type="button" class="btn btn-primary" id="saveBtn" value="保存" />
							<input type="button" class="btn btn-white" id="resetBtn" value="重置" />
						</div>
						
						<div class="tbDiv">
			        		<div class="survey_contCenterContent clearfix">
								<form method="post" action="${ctx}/drawModuleInfo/saveTdWithInput" id="form">
									<input type="hidden" id="rowNum_v" name="rowNum" value="${moduleInfo.rowNum}"/>
									<input type="hidden" id="colNum_v" name="colNum" value="${moduleInfo.colNum}"/>
									<input type="hidden" id="moduleId" name="moduleId" value="${moduleInfo.id}">
									<input type="hidden" id="parentId" name="parentId" value="${parentId}">
								
									<table id="theTable" class="form-group tb" onselectstart="return false;" style="border-collapse:separate;">
										<c:if test="${fn:length(tdList) > 0}">
											<c:forEach begin="1" end="${moduleInfo.rowNum}" step="1" var="r">
												<tr style="height:40px;" id="tr${r}">
												<c:forEach items="${tdList}" var="td">
													<c:if test="${td.rowNum == r}">
														<td style="width:${100/moduleInfo.colNum*td.colspanNum}%;" class="dropSpan" rowspan="${td.rowspanNum}" colspan="${td.colspanNum}" onselect="return false;" id="${td.tdNo}" tdid="${td.id}">
															<c:forEach items="${tdInputMap[td.id]}" var="inputId">
																<span class="dropMove" inputid="${inputMap[inputId].id}">${inputMap[inputId].inputTitle}
																	<input type="hidden" name="${td.tdNo}" value="${td.id}_${inputMap[inputId].id}" />
																</span>
															</c:forEach>
														</td>
													</c:if>
												</c:forEach>
												</tr>
											</c:forEach>
										</c:if>
										
										<c:if test="${fn:length(tdList) == 0}">
											<tr style="height:40px;">
												<td class="td dropSpan" onclick="tdck(this)">案例</td>
												<td class="td dropSpan" onclick="tdck(this)">案例</td>
											</tr>
										</c:if>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
		    </fieldset>
		</div>
		<div class="actions clearfix">
			<ul>
				<li>
					<a id="previous" href="javascript:preStep();">上一步</a>
				</li>
				<li>
					<a id="next" href="javascript:nextStep();">下一步</a>
				</li>
				<li>
					<a id="finish" href="javascript:alert('完成');">完成</a>
				</li>
				<li>
					<a id="cancelBtn" href="javascript:void(0);">取消</a>
				</li>
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript"> 
 $(function(){
	 var screenHeight = document.documentElement.clientHeight;
	 var body = document.getElementById('body');
	 body.style.height = screenHeight+"px"; 
	
	//拖拽js
  	$(".dragsource").disableSelection();
	
	$(".dragsource" ).draggable({
		helper:"clone",
		//revert: "invalid",
		cursor: "move",
		appendTo: "body",
		/* start: function(event, ui) {
			$(this).addClass("dropMove");
 			$(this).removeClass("elementSpan");
		},
		cursorAt: { top: 0, left: 5 },*/
		connectToSortable:".dropSpan"//拖拽元素，并在放下位置进行占位排序
	});
	
	$(".dropSpan" ).sortable({
		 connectWith:".dropSpan",
		 placeholder: "placeholderClass",//占位符样式
		 cursor: "move",
		 over: function(event, ui) {
          	$(this).addClass("bgcolor");
	     },
	     out: function(event, ui) {
	        $(this).removeClass("bgcolor");
	     },
	     receive: function( event, ui ) {
	    	 if($(ui.item).hasClass("dropMove")){
		    	 $(ui.item).removeAttr("style");//去除拖动元素导致的行内样式
		    	//获取单元格ID
				var tdid = $(this).attr("tdid");
				//获取单元格ID 外
				var td = $(this).attr("id");
				var inputid = $(ui.item).attr("inputid");
				var str = "<input type=\"hidden\" name=\""+td+"\" value=\""+tdid+"_"+inputid+"\">";
				//先清空原来已有的
				$(ui.item).find("input").remove();
				$(ui.item).append(str);
	    	 }else{
	    		 var elementId = $(ui.item).attr("id");
	    		 //$(ui.item).removeAttr("id");
	    		 $("#"+elementId).draggable("disable");
	    		 $("#"+elementId).addClass("elementSpanDisable");
	    		 $("#"+elementId).removeClass("elementSpan");
	    	 }
	     },
	 	 stop:function(event,ui){
	 		$("td").removeClass("bgcolor");
			$(ui.item).removeAttr("style");//去除拖动元素导致的行内样式
			if($(ui.item).hasClass("elementSpan")){
				$(ui.item).addClass("dropMove");
				$(ui.item).removeClass("elementSpan");
				$(ui.item).addClass("clearfix");//解决div height为0的问题
				
		    	//获取单元格ID
				var tdid = $(this).attr("tdid");
				//获取单元格ID 外
				var td = $(this).attr("id");
				var inputid = $(ui.item).attr("inputid");
				var str = "<input type=\"hidden\" name=\""+td+"\" value=\""+tdid+"_"+inputid+"\">";
				//先清空原来已有的
				$(ui.item).find("input").remove();
				$(ui.item).append(str);
			}
			$(ui.item).removeClass("dragsource");
	 	}
	});
	
	//提交返回按钮
	$("#saveBtn").click(function() {
		$("#form").submit();
	});
	
	//提交返回按钮
	$("#resetBtn").click(function() {
		confirm("温馨提示：此操作将会重置清空单元格里已选控件！是否确定继续？",function(){
			$("#theTable").find("span").remove();
			//重置左边待选控件
			//$("#nowDiv").hide();
			//$("#forResetDiv").show();
			$("#nowDiv").html($("#forResetDiv").html());
			$(".dragsource").draggable({
				helper:"clone",
				//revert: "invalid",
				cursor: "move",
				appendTo: "body",
				/* start: function(event, ui) {
					$(this).addClass("dropMove");
		 			$(this).removeClass("elementSpan");
				},
				cursorAt: { top: 0, left: 5 },*/
				connectToSortable:".dropSpan"//拖拽元素，并在放下位置进行占位排序
			});
			return false;
		},function(){//取消
			return false;
		});
	});

	$("#cancelBtn").click(function() {
		window.location.href="${ctx}/drawModuleInfo/main?id="+$("#parentId").val();
		return false;
	});
 });
 
//单元格单击事件
 function tdck(obj){
 	//取消所有选中效果
 	clearAll();
 	$(obj).addClass("bgcolor");
 }

 //清除所有数据 去除选中、清空所有记录的值
 function clearAll(){
 	$("td").removeClass("bgcolor");
 }
 
 function nextStep(){
	var isSave = $("#isSave").val();//是否进行保存过
	/* if(isSave == "yes"){
		window.location.href = "${ctx}/drawModuleInfo/toDrawInputMain?stepType=two";
	}else{
		alert("请先执行保存操作！");
	} */
	window.location.href = "${ctx}/drawModuleInfo/toDrawInputMain?stepType=four&parentId="+$("#parentId").val()+"&moduleId="+$("#moduleId").val();
}
 
 function preStep(){
	 window.location.href = "${ctx}/drawModuleInfo/toDrawInputMain?stepType=two&parentId="+$("#parentId").val()+"&moduleId="+$("#moduleId").val();
 }
</script>
<script>
 $(function(){
	var screenWidth = document.documentElement.clientWidth;
	var centerWidth = document.getElementById('surveyCenter');
	if($("#surveyRight").attr("id") == undefined){//20为右边滚动条宽度 10为左右两边各5px的margin
		centerWidth.style.width=screenWidth-251-20-10+"px";
	}else {
		centerWidth.style.width=screenWidth-251-20-10-301+"px";
	}
 });
</script>
</html>