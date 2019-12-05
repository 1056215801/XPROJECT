<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>查看</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.btn-success {
	background: orange;
}
</style>

<style>
  /* #dropSpan { spanst-style-type: none; margin: 0; padding: 0; width: 60%; }
  span { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.2em; height: 1.5em; width:200px;height:40px;display:block;border:1px solid red;background-color:green;}
  html>body span { height: 1.5em; spanne-height: 1.2em; }
  .ui-state-highspanght { height: 1.5em; spanne-height: 1.2em;width:100%; } */
  
  .tb{
	width:100%;
	margin:0px;
	padding:0px;
	-moz-user-select:none;
	border-top:1px solid #B4B4B4;
	border-left:1px solid #B4B4B4;
	border-spacing:0;
  }
  .td1{
		border-right:1px solid red;
		border-bottom:1px solid red;
		width:200px;
		height:50px;
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
  </style>
  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body class="gray-bg" onselectstart="return false;" onmouseup="clearMouseDown()">
	<input type="hidden" id="requireCode" value="0" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>查看表格</h5>
						<input type="hidden" id="mouseDownMark" value=""/>
						<input type="hidden" id="beginTd" value="" title="开始"/>
						<input type="hidden" id="endTd" value="" title="结束"/>
						<input type="hidden" id="firstTd" value="" title="第一个"/>
						<input type="hidden" id="lastTd" value="" title="最后一个"/>
						
						<div class="ibox-tools">
							<a href="javascript:void(0);" class="btn btn-primary" id="cancelBtn">取消</a>
							
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
							<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#"> <i class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="form_basic.html#">选项1</a></li>
								<li><a href="form_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i></a>
						</div>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal" action="${ctx}/drawTdInfo/save" id="form">
							<input type="hidden" name="tableId" value="${drawTableInfo.id}"/>
							<input type="hidden" id="rowNum_v" name="rowNum" value=""/>
							<input type="hidden" id="colNum_v" name="colNum" value=""/>
							
							<input name="pageNum" value="${pageNum}" type="hidden">
							<input name="id" value="${drawTableInfo.id}" type="hidden">
							
							<div class="hr-line-dashed"></div>
							<table id="theTable" class="form-group tb" onselectstart="return false;" style="border-collapse:separate;">
								<c:if test="${fn:length(tdList) > 0}">
								<c:forEach begin="1" end="${drawTableInfo.rowNum}" step="1" var="r">
									<tr style="height:40px;" id="tr${r}">
									<c:forEach items="${tdList}" var="td">
										<c:if test="${td.rowNum == r}">
											<td style="width:${100/drawTableInfo.colNum*td.colspanNum}%;" class="td dropSpan" rowspan="${td.rowspanNum}" colspan="${td.colspanNum}" onselect="return false;" id="${td.tdNo}" onmousemove="changeChecked(this)" onmousedown="changeMouseDown(this)"  onclick="tdck(this)">
					 							<input type="hidden" id="item${td.tdNo}" name="${td.tdNo}" value="${td.rowspanNum}_${td.colspanNum}">
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
							<div class="hr-line-dashed"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
	<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script>
	<script src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
	<script>
		$(function() {
			//提交返回按钮
			$("#saveBtn").click(function() {
				$("#rowNum_v").val($("#rowNum").val());
				$("#colNum_v").val($("#colNum").val());
				$("#form").submit();
			});

			$("#cancelBtn").click(function() {
				//$("#form").attr("action","${ctx}/drawTableInfo/list").submit();
				window.history.go(-1);
				return false;
			});
		});
	</script>
	
	<script>
	var percent = ${100/drawTableInfo.colNum};//宽度百分比 全局变量
  $(function() {
  	//拖拽js
  	/* $(".dragsource.szc").disableSelection();
		
		$(".dragsource.szc" ).draggable({
			helper:"clone",
			revert: "invalid",
			cursor: "move", 
			connectToSortable:".dropSpan"//拖拽元素，并在放下位置进行占位排序
			//cursorAt: { top: 56, left: 56 }
		});
		
		$(".dropSpan" ).sortable({
			 connectWith:".dropSpan",
			 placeholder: "ui-state-highspanght",//占位符样式
			 over: function(event, ui) {
           $( this ).css("background-color","yellow");
       },
       out: function(event, ui) {
           $( this ).css("background-color","white");
       },
			 stop:function(event,ui){
			 	$( this ).css("background-color","white");
			 	if($(ui.item).hasClass("szc")){
			 		var obj = "<span class=\"ui-state-default\">Item 22323</span>";
					$(ui.item).html($(obj).html());
					//$(ui.item).addClass("ceshi");
					//$(ui.item).removeClass("szc");
			 	}
			 }
		}); */
  	
  	//-----------------------------------我是分割线--------------------------------------
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
</body>
</html>
