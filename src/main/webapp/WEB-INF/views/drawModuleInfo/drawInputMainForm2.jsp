<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>绘制表单相关页面</title>
<!-- 引导标签引用 -->
<link href="${ctx}/static/css/plugins/steps/jquery.steps.drawForm.css" rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<!-- 引用绘制表格的样式 -->
<link href="${ctx}/static/css/autoForm/drawTd.step.css" rel="stylesheet"/>

<script src="${ctx}/static/script/jquery.easyui.min.js"></script>
</head>

<body id="body" onselectstart="return false;" style="overflow:hidden;" onselectstart="return false;" onmouseup="clearMouseDown()">
	<div id="setpForm" class="wizard-big wizard clearfix">
	    <div class="steps clearfix">
			<ul>
				<li class="disabled">
					<a id="setpForm-t-0" href="javascript:void(0);">
						<span class="current-info audible">当前步骤：</span>
						<span class="number">1.</span>控件配置
					</a>
				</li>
				<li class="first current">
					<a id="setpForm-t-1" href="javascript:void(0);">
						<span class="number">2.</span>表格布局绘制
					</a>
				</li>
				<li class="disabled">
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
		    	<div class="divOper clearfix">
		    		&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" class="easyui-numberbox" id="rowNum" value="${moduleInfo.rowNum}" title="请输入行数"
							 data-options="min:1,max:20,precision:0"/>行&nbsp;&nbsp;
					<input type="text" class="easyui-numberbox" id="colNum" value="${moduleInfo.colNum}" 
								title="请输入列数" data-options="min:1,max:20,precision:0"/>列&nbsp;&nbsp;
					<button class="btn btnBlue" id="initTb">初始化表格</button>
					<button class="btn btnBlue" id="mergeBtn">合并</button>
					<button class="btn btnBlue" id="mergeCancelBtn">取消合并</button>
					
					<input type="hidden" id="mouseDownMark" value=""/>
					<input type="hidden" id="beginTd" value="" title="开始"/>
					<input type="hidden" id="endTd" value="" title="结束"/>
					<input type="hidden" id="firstTd" value="" title="第一个"/>
					<input type="hidden" id="lastTd" value="" title="最后一个"/>
						
					<a class="btn btnBlue" href="javascript:void(0);" onclick="submitForm()" style="color:#FFF;">保存</a>
				</div>
				
				<!-- 以下为绘制表格区 -->
				<div class="tbDiv">
			        <div class="ibox-content clearfix">
						<form method="post" class="form-horizontal" action="${ctx}/drawModuleInfo/saveTdInfo" id="form">
							<input type="hidden" name="tableId" value="${moduleInfo.id}"/>
							<input type="hidden" id="rowNum_v" name="rowNum" value=""/>
							<input type="hidden" id="colNum_v" name="colNum" value=""/>
							<input type="hidden" id="moduleId" name="moduleId" value="${moduleInfo.id}">
							<input type="hidden" id="parentId" name="parentId" value="${parentId}">
							
							<input name="pageNum" value="${pageNum}" type="hidden">
							<input name="id" value="${moduleInfo.id}" type="hidden">
							
							<table id="theTable" class="form-group tb" onselectstart="return false;" style="border-collapse:separate;">
								<c:if test="${fn:length(tdList) > 0}">
								<c:forEach begin="1" end="${moduleInfo.rowNum}" step="1" var="r">
									<tr style="height:40px;" id="tr${r}">
									<c:forEach items="${tdList}" var="td">
										<c:if test="${td.rowNum == r}">
											<td style="width:${100/moduleInfo.colNum*td.colspanNum}%;" rowspan="${td.rowspanNum}" colspan="${td.colspanNum}" onselect="return false;" id="${td.tdNo}" onmousemove="changeChecked(this)" onmousedown="changeMouseDown(this)"  onclick="tdck(this)">
					 							<input type="hidden" id="item${td.tdNo}" name="${td.tdNo}" value="${td.rowspanNum}_${td.colspanNum}">
											</td>
										</c:if>
									</c:forEach>
									</tr>
								</c:forEach>
								</c:if>
								
								<c:if test="${fn:length(tdList) == 0}">
									<tr style="height:40px;">
										<td onclick="tdck(this)">案例</td>
										<td onclick="tdck(this)">案例</td>
									</tr>
								</c:if>
							</table>
							<div class="hr-line-dashed"></div>
						</form>
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
				<li class="disabled">
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
var percent = ${100/moduleInfo.colNum};//宽度百分比 全局变量
 $(function(){
	$("#cancelBtn").click(function() {
		window.location.href="${ctx}/drawModuleInfo/main?id="+$("#parentId").val();
		return false;
	});
 });
 
 /*提交表单*/
 function submitForm(){
 	//解绑离开事件
 	window.onbeforeunload = null;
 	$("#rowNum_v").val($("#rowNum").val());
	$("#colNum_v").val($("#colNum").val());
 	$("#form").submit();//提交表单
 	return false;
 }
 
 function nextStep(){
	var isSave = $("#isSave").val();//是否进行保存过
	/* if(isSave == "yes"){
		window.location.href = "${ctx}/drawModuleInfo/toDrawInputMain?stepType=two";
	}else{
		alert("请先执行保存操作！");
	} */
	window.location.href = "${ctx}/drawModuleInfo/toDrawInputMain?stepType=three&parentId="+$("#parentId").val()+"&moduleId="+$("#moduleId").val();
}
 
 function preStep(){
	 window.location.href = "${ctx}/drawModuleInfo/toDrawInputMain?stepType=one&parentId="+$("#parentId").val()+"&moduleId="+$("#moduleId").val();
 }
</script>
<script>
 $(function(){
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
<script type="text/javascript">
	window.onbeforeunload = function(){ return "您确定要退出页面吗？";} 
</script>
</html>