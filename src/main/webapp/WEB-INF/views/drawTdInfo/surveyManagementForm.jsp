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
<style>
  .ui-state-highspanght {
	  	width: 108px;
		float:left;
		font-size:12px;
		text-align:center;
	    margin: 2px;
		padding:5px 0;
		background-color: #F9F9F9;
	    border: 1px dashed #ccc;
		color: #337ab7;
		cursor:pointer;
		text-overflow: ellipsis;
	    white-space: nowrap;
	    height:30px;
    }
  
 .tb{
	width:100%;
	margin:0px;
	padding:0px;
	-moz-user-select:none;
	border-top:1px solid #B4B4B4;
	border-left:1px solid #B4B4B4;
	border-spacing:0;
  }
  .bgcolor{
	background-color:#FFFAF0;
  }
  
  #theTable td{
    /* width:120px; */
    /* height:40px; */
    border-bottom:1px solid #B4B4B4;
    border-right:1px solid #B4B4B4;
    /* padding:10px 30px; */
  }
  tr{
  	height:40px;
  }
  
  .placeholderClass{
  	display:block;
	width: 99%;
	height:30px;
	font-size:12px;
	text-align:center;
    margin: 2px;
	padding:5px 0;
	background-color: #F9F9F9;
    border: 1px dashed #ccc;
	color: #337ab7;
	cursor:pointer;
	text-overflow: ellipsis;
    white-space: nowrap;
  }
</style>

<script src="${ctx}/static/js/jquery-ui-1.10.4.min.js"></script>
</head>

<body id="body" onselectstart="return false;">
<div class="survey_main clearfix" id="mainDiv">
	<div id="surveyLeft" class="survey_contentLeft">
		<div class="survey_contLeftBar">
			<div class="survey_contLeftTitle">可选已配置字段</div>
			<div class="elementDiv clearfix" id="nowDiv">
				<!-- <span class="elementSpan dragsource szc">单行文本</span>
				<span class="elementSpan dragsource szc"">多行文本</span>
				<span class="elementSpan dragsource szc"">密码框</span>
				<span class="elementSpan dragsource szc"">富文本</span>
				<span class="elementSpan dragsource szc"">数字</span>
				<span class="elementSpan dragsource szc"">日期时间</span>
				<span class="elementSpan dragsource szc"">单选按钮组</span>
				<span class="elementSpan dragsource szc"">复选按钮组</span>
				<span class="elementSpan dragsource szc"">下拉框</span>
				<span class="elementSpan dragsource szc"">下拉复选框</span>
				<span class="elementSpan dragsource szc"">分割线</span> -->
				<c:forEach items="${inputList}" var="input">
					<c:if test="${allTdInput[input.id] != 'yes'}">
						<span class="elementSpan dragsource szc" inputid="${input.id}">${input.inputTitle}</span>
					</c:if>
				</c:forEach>
			</div>
			<div class="elementDiv clearfix" id="forResetDiv" style="display:none;">
				<c:forEach items="${inputList}" var="input">
					<span class="elementSpan dragsource szc" inputid="${input.id}">${input.inputTitle}</span>
				</c:forEach>
			</div>
			<!-- <div class="survey_contLeftTitle">增强字段</div>
				<div class="clearfix elementDiv">
				<span  class="elementSpan dragsource szc"">文件上传</span>
			</div> -->
		</div>
	</div>
	
	<div id="surveyCenter" class="survey_contentCenter">
		<div class="survey_contCenterOper">
			<input type="button" class="btn btn-primary" id="saveBtn" value="保存" />
			<input type="button" class="btn btn-white" id="resetBtn" value="重置" />
			<a href="javascript:void(0);" class="btn btn-white" id="cancelBtn">取消</a>
		</div>
		<div class="hr-line-dashed"></div>
		<form method="post" action="${ctx}/drawTdInfo/saveTdWithInput" id="form">
			<input type="hidden" name="tableId" value="${drawTableInfo.id}"/>
			<input type="hidden" id="rowNum_v" name="rowNum" value="${drawTableInfo.rowNum}"/>
			<input type="hidden" id="colNum_v" name="colNum" value="${drawTableInfo.colNum}"/>
							
		<table id="theTable" class="form-group tb" onselectstart="return false;" style="border-collapse:separate;">
			<c:if test="${fn:length(tdList) > 0}">
				<c:forEach begin="1" end="${drawTableInfo.rowNum}" step="1" var="r">
					<tr style="height:40px;" id="tr${r}">
					<c:forEach items="${tdList}" var="td">
						<c:if test="${td.rowNum == r}">
							<td style="width:${100/drawTableInfo.colNum*td.colspanNum}%;" class="dropSpan" rowspan="${td.rowspanNum}" colspan="${td.colspanNum}" onselect="return false;" id="${td.tdNo}" tdid="${td.id}">
								<c:forEach items="${tdInputMap[td.id]}" var="inputId">
									<span class="elementSpanMove dragsource szc" inputid="${inputMap[inputId].id}">${inputMap[inputId].inputTitle}
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
</body>
<script type="text/javascript"> 
 $(function(){
	var screenHeight = document.documentElement.clientHeight;
	var body = document.getElementById('body');
	body.style.height = screenHeight+"px"; 
	
	//拖拽js
  	$(".dragsource.szc").disableSelection();
	
	$(".dragsource.szc" ).draggable({
		helper:"original",
		revert: "invalid",
		cursor: "move",
		appendTo: "body",
		/* start: function(event, ui) {
			$(this).addClass("elementSpanMove");
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
	 	 stop:function(event,ui){
	 		$("td").removeClass("bgcolor");
	 		//alert($(ui.item).html());
			if($(ui.item).hasClass("elementSpan")){
				$(ui.item).addClass("elementSpanMove");
				$(ui.item).removeClass("elementSpan");
				$(ui.item).removeAttr("style");//去除clone复制元素导致的行内样式
				$(ui.item).addClass("clearfix");//解决div height为0的问题
			}
			$(ui.item).removeClass("dragsource");
			$(ui.item).removeClass("szc");
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
			$(".dragsource.szc" ).draggable({
				helper:"original",
				revert: "invalid",
				cursor: "move",
				appendTo: "body",
				/* start: function(event, ui) {
					$(this).addClass("elementSpanMove");
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
		//$("#form").attr("action","${ctx}/drawTableInfo/list").submit();
		window.history.go(-1);
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
</script>
</html>