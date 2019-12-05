<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建/编辑</title>

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
						<h5>绘制表格</h5>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="rowNum" value="${drawTableInfo.rowNum}" 
									placeholder="请输入行数" />行&nbsp;&nbsp;
						<input type="text" id="colNum" value="${drawTableInfo.colNum}" 
									placeholder="请输入列数" />列&nbsp;&nbsp;
						<button class="btn btn-primary" id="initTb">初始化表格</button>
						<button class="btn btn-primary" id="mergeBtn">合并</button>
						<button class="btn btn-primary" id="mergeCancelBtn">取消合并</button>
						
						<input type="hidden" id="mouseDownMark" value=""/>
						<input type="hidden" id="beginTd" value="" title="开始"/>
						<input type="hidden" id="endTd" value="" title="结束"/>
						<input type="hidden" id="firstTd" value="" title="第一个"/>
						<input type="hidden" id="lastTd" value="" title="最后一个"/>
						
						<div class="ibox-tools">
							<button class="btn btn-primary" id="saveBtn">保存</button>
							<a href="javascript:void(0);" class="btn btn-white" id="cancelBtn">取消</a>
							
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
											<td style="width:${100/drawTableInfo.colNum*td.colspanNum}%;" class="dropSpan" rowspan="${td.rowspanNum}" colspan="${td.colspanNum}" onselect="return false;" id="${td.tdNo}" onmousemove="changeChecked(this)" onmousedown="changeMouseDown(this)"  onclick="tdck(this)">
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
  	//初始化单元格
		$("#initTb").click(function(){
			confirm("温馨提示：初始化将会重置所有单元格！是否确定继续？",function(){
				//移除只读属性
				$("#rowNum").removeAttr("readOnly");
				$("#colNum").removeAttr("readOnly");
				
				var row = $("#rowNum").val();
				var col = $("#colNum").val();
				percent = 100/Number(col);
				var str = "";
				for(var i = 1; i <= row; i++){
					str += "<tr id=\"tr"+i+"\" style=\"width:40px;\">"
					for(var j = 1; j <= col; j++){
						str += "<td style=\"width:"+percent+"%;\" class=\"td dropSpan\" onselect=\"return false;\" id=\""+i+"_"+j+"\" onmousemove=\"changeChecked(this)\" onmousedown=\"changeMouseDown(this)\"  onclick=\"tdck(this)\">";
						str += "<input type=\"hidden\" id=\"item"+i+"_"+j+"\" name=\""+i+"_"+j+"\" value=\"1_1\">";
						str += "</td>";
					}
					str += "</tr>"
				}
				$("#theTable").html(str);
				//清楚之前选择td的记忆
				clearAll();
				
				/* $(".dropSpan" ).sortable({
					 connectWith:".dropSpan",
					 placeholder: "ui-state-highspanght",//占位符样式
					 cursor:"move",
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
				return false;
			},function(){//取消
				return false;
			});
		});
		
		//合并
		$("#mergeBtn").click(function(){
			if($("#lastTd").val() == ""){
				tips("请至少选择2个单元格,再合并。");
			}else{
				//将行列数量输入框设为只读
				$("#rowNum").attr("readOnly","readOnly");
				$("#colNum").attr("readOnly","readOnly");
				
				var firstTd = $("#firstTd").val();
				var lastTd = $("#lastTd").val();
				for(var r = Number(firstTd.split("_")[0]);r <= Number(lastTd.split("_")[0]);r++){
					for(var c = Number(firstTd.split("_")[1]);c <= Number(lastTd.split("_")[1]);c++){
						if((r+"_"+c) != firstTd){
							$("#"+r+"_"+c).remove();
						}
					}
				}
				//设置colspan  rowspan
				var row = Number(lastTd.split("_")[0]) - Number(firstTd.split("_")[0]) + 1;
				var col = Number(lastTd.split("_")[1]) - Number(firstTd.split("_")[1]) + 1;
				
				var item_row = $("#item"+firstTd).val();//单元格的存放信息rowspan_colspan格式
				if(row > 1){
					$("#"+firstTd).attr("rowspan",row);
					$("#"+firstTd).css("height",(Number(row)*40)+"px");
					$("#item"+firstTd).val(row+"_"+item_row.split("_")[1]);
				}
				item_row = $("#item"+firstTd).val();//单元格的存放信息rowspan_colspan格式
				if(col > 1){
					$("#"+firstTd).attr("colspan",col);
					$("#"+firstTd).css("width",(percent*Number(col))+"%");
					$("#item"+firstTd).val(item_row.split("_")[0]+"_"+col);
				}
				//清空合并单元格前相关数据
				$("#lastTd").val("");
			}
		});
		//取消合并
		$("#mergeCancelBtn").click(function(){
			var currentTd = $("#firstTd").val();
			if(isMergeTd(currentTd)){
				$("#item"+currentTd).val("1_1");//先将解除合并的隐藏域值恢复
				
				var col = $("#"+currentTd).attr("colspan");
				var row = $("#"+currentTd).attr("rowspan");
				var lastTd = "";//存放最后一个TD的id
				
				//同时跨多行多列
				if((col != undefined && col > 1) && (row != undefined && row > 1)){
					var str = "";
					for(var r = (Number(currentTd.split("_")[0])); r < (Number(currentTd.split("_")[0])+Number(row)); r++){
						if(r > Number(currentTd.split("_")[0])){
							//增加跨行单元格
							str = "";
							str += "<td style=\"width:"+percent+"%;\" class=\"td dropSpan bgcolor\" onselect=\"return false;\" id=\""+r+"_"+currentTd.split("_")[1]+"\" onmousemove=\"changeChecked(this)\" onmousedown=\"changeMouseDown(this)\"  onclick=\"tdck(this)\">";
							str += "<input type=\"hidden\" id=\"item"+r+"_"+currentTd.split("_")[1]+"\" name=\""+r+"_"+currentTd.split("_")[1]+"\" value=\"1_1\">";
							str += "</td>";
							var strTd = getPreLastTd(r+"_"+currentTd.split("_")[1]);//获取当前元素前面的元素
							  if(strTd == ""){//该前面无元素
							  	strTd = getNextFirstTd(r+"_"+currentTd.split("_")[1]);//获取当前元素的后面第一个元素
							  	if(strTd == ""){//既无前面元素，也无后面元素
							  		$("#tr"+r).append(str);
							  	}else{
							  		 $("#"+strTd).before(str);
							  	}
							  }else{
							  	$("#"+strTd).after(str);
							  }
						}
					  	str = "";
						for(var c = (Number(currentTd.split("_")[1])+1); c < (Number(currentTd.split("_")[1])+Number(col)); c++){
							str += "<td style=\"width:"+percent+"%;\" class=\"td dropSpan bgcolor\" onselect=\"return false;\" id=\""+r+"_"+c+"\" onmousemove=\"changeChecked(this)\" onmousedown=\"changeMouseDown(this)\"  onclick=\"tdck(this)\">";
							str += "<input type=\"hidden\" id=\"item"+r+"_"+c+"\" name=\""+r+"_"+c+"\" value=\"1_1\">";
							str += "</td>";
							
							lastTd = r+"_"+c;
						}
						$("#"+r+"_"+currentTd.split("_")[1]).after(str);
					}
					//清除合并格式
					$("#"+currentTd).removeAttr("colspan");
					$("#"+currentTd).removeAttr("rowspan");
					$("#"+currentTd).css("width",percent+"%");
					$("#"+currentTd).css("height","40px");
				}else if(col != undefined && col > 1){//只跨列
					var str = "";
					for(var c = (Number(currentTd.split("_")[1])+1); c < (Number(currentTd.split("_")[1])+Number(col)); c++){
						str += "<td style=\"width:"+percent+"%;\" class=\"td dropSpan bgcolor\" onselect=\"return false;\" id=\""+currentTd.split("_")[0]+"_"+c+"\" onmousemove=\"changeChecked(this)\" onmousedown=\"changeMouseDown(this)\"  onclick=\"tdck(this)\">";
						str += "<input type=\"hidden\" id=\"item"+currentTd.split("_")[0]+"_"+c+"\" name=\""+currentTd.split("_")[0]+"_"+c+"\" value=\"1_1\">";
						str += "</td>";
						lastTd = currentTd.split("_")[0]+"_"+c;
					}
					$("#"+currentTd).after(str);
					$("#"+currentTd).removeAttr("colspan");
					$("#"+currentTd).css("width",percent+"%");
				}else if(row != undefined && row > 1){//只跨行
					var str = "";
					for(var r = (Number(currentTd.split("_")[0])+1); r < (Number(currentTd.split("_")[0])+Number(row)); r++){
						str = "";
						str += "<td style=\"width:"+percent+"%;\" class=\"td dropSpan bgcolor\" onselect=\"return false;\" id=\""+r+"_"+currentTd.split("_")[1]+"\" onmousemove=\"changeChecked(this)\" onmousedown=\"changeMouseDown(this)\" onclick=\"tdck(this)\">";
						str += "<input type=\"hidden\" id=\"item"+r+"_"+currentTd.split("_")[1]+"\" name=\""+r+"_"+currentTd.split("_")[1]+"\" value=\"1_1\">";
						str += "</td>";
						lastTd = r+"_"+currentTd.split("_")[1];
					  
					  	var strTd = getPreLastTd(r+"_"+currentTd.split("_")[1]);//获取当前元素前面的元素
					  	if(strTd == ""){//该前面无元素
					  		strTd = getNextFirstTd(r+"_"+currentTd.split("_")[1]);//获取当前元素的后面第一个元素
					  		if(strTd == ""){//既无前面元素，也无后面元素
					  			$("#tr"+r).append(str);
					  		}else{
					  		 	$("#"+strTd).before(str);
					  		}
					  	}else{
					  		$("#"+strTd).after(str);
					  	}
					}
					$("#"+currentTd).removeAttr("rowspan");
					$("#"+currentTd).css("height","40px");
				}
				$("#lastTd").val(lastTd);//存放最后一个元素
			}else{
				tips("当前选中单元格非合并单元格");
				return false;
			}
		});
  });
 
 //单元格单击事件
 function tdck(obj){
 	//取消所有选中效果
 	clearAll();
 	$(obj).addClass("bgcolor");
 	$("#beginTd").val($(obj).attr("id"));
 	$("#firstTd").val($(obj).attr("id"));
}
 
//鼠标按下事件
function changeMouseDown(obj){
	$("#mouseDownMark").val("yes");
	$("#beginTd").val($(obj).attr("id"));
}
//鼠标松开事件
function clearMouseDown(){
	$("#mouseDownMark").val("");
}
//鼠标移动触发事件
function changeChecked(obj){
	if($("#mouseDownMark").val()=="yes"){
		$(obj).addClass("bgcolor");
		$("#endTd").val($(obj).attr("id"));
		checkTd("#beginTd",obj);
	}
}
//更新td选中状态
function checkTd(ckobj,obj){
	var checedTd = $(ckobj).val();
 	if(checedTd == ""){
		$(obj).addClass("bgcolor");
		$("#beginTd").val(checedTd);
 	}else{//不为空时，则计算勾选区域
 		//计算第一个选择点到第二个选择点覆盖的面积，然后进行选择
		var objId = $(obj).attr("id");
		//获取最左最上面的单元格ID
		var beginTd = checedTd;//默认值
		var endTd = objId;//初始值
		
		//判断第一个单元格、当前单元格是否是否曾合并过
		if(!isMergeTd(beginTd) && !isMergeTd(endTd)){//都未曾合并过
			var minRow = 0;//最小行
			var maxRow = 0;//最大行
			var minCol = 0;//最小列
			var maxCol = 0;//最大列
			
			if(Number(objId.split("_")[1]) < Number(checedTd.split("_")[1])){//对比列 最左边
				beginTd = objId;
				endTd = checedTd;
			}else if(Number(objId.split("_")[1]) == Number(checedTd.split("_")[1])){//对比行 最上面 列相同时，选最上面
				if(Number(objId.split("_")[0]) < Number(checedTd.split("_")[0])){
					beginTd = objId;
					endTd = checedTd;
				}
			}
			//进行对比，获取最小行和最大行 最小列和最大列 从左到右 从上到下
			if(Number(beginTd.split("_")[0]) < Number(endTd.split("_")[0])){//行
				minRow = Number(beginTd.split("_")[0]);
				maxRow = Number(endTd.split("_")[0]);
			}else{
				minRow = Number(endTd.split("_")[0]);
				maxRow = Number(beginTd.split("_")[0]);
			}
			
			if(Number(beginTd.split("_")[1]) < Number(endTd.split("_")[1])){//列
				minCol = Number(beginTd.split("_")[1]);
				maxCol = Number(endTd.split("_")[1]);
			}else{
				minCol = Number(endTd.split("_")[1]);
				maxCol = Number(beginTd.split("_")[1]);
			}
			
			//进行渲染选择单元格
			$("td").removeClass("bgcolor");
			for(var r = minRow; r <= maxRow; r++){
				for(var c = minCol; c <= maxCol; c++){
					$("#"+r+"_"+c).addClass("bgcolor");
					//判断是否包含已合并的单元格
					if(isMergeTd(r+"_"+c)){//1、包含的单元格是否有colspan 和rowspan
						$("#mouseDownMark").val("");
						tips("包含已合并的单元格，请取消合并单元格再选中");
						clearAll();
						return true;
					}
					if($("#"+r+"_"+c).attr("id") == undefined){//2、其中缺失单元格，说明包含合并的
						tips("包含已合并的单元格，请取消合并单元格再选中");
						clearAll();
						return true;
					}
				}
			}
			$("#firstTd").val(minRow+"_"+minCol);
			$("#lastTd").val(maxRow+"_"+maxCol);
		}else{//合并过
			if(beginTd == endTd){
				//取消所有选中效果
				$("td").removeClass("bgcolor");
			 	$(obj).addClass("bgcolor");
			 	$("#beginTd").val($(obj).attr("id"));
			 	$("#firstTd").val($(obj).attr("id"));
			}else{
				clearAll();
				tips("已合并的单元格，请取消合并单元格再选中");
			}
		}
 	}
}

//判断是否是已合并的单元格
function isMergeTd(tdId){
		var result = false;
		if($("#"+tdId).attr("rowspan") != undefined && $("#"+tdId).attr("rowspan") > 1){
			result = true;
		}
		if($("#"+tdId).attr("colspan") != undefined && $("#"+tdId).attr("colspan") > 1){
			result = true;
		}
		return result;
}

//清除所有数据 去除选中、清空所有记录的值
function clearAll(){
	$("td").removeClass("bgcolor");
	$("#beginTd").val("");
	$("#endTd").val("");
	$("#firstTd").val("");
	$("#lastTd").val("");
	$("#mouseDownMark").val("");
}
//获取后面td的第一个
function getNextFirstTd(tdId){
	var nextTd = "";
	for(var c = 1; c < 100; c++){
		if($("#"+tdId.split("_")[0]+"_"+(Number(tdId.split("_")[1])+c)).attr("id") != undefined){
			nextTd = tdId.split("_")[0]+"_"+(Number(tdId.split("_")[1])+c);
			return nextTd;
		}
	}
	return nextTd;
}
//获取前面td的最后一个
function getPreLastTd(tdId){
	var preTd = "";
	for(var c = 1; c < 100; c++){
		if($("#"+tdId.split("_")[0]+"_"+(Number(tdId.split("_")[1])-c)).attr("id") != undefined){
			preTd = tdId.split("_")[0]+"_"+(Number(tdId.split("_")[1])-c);
			return preTd;
		}
	}
	return preTd;
}
  </script>
</body>
</html>
