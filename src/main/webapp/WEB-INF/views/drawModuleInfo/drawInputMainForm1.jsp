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
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<!-- 单选框复选框引用 -->
 <link href="${ctx}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/static/js/jquery-ui-1.10.4.min.js"></script>
</head>

<body id="body" onselectstart="return false;" style="overflow:hidden;">
	<input type="hidden" id="currentSort" value="no"/>
	<input type="hidden" id="isSave" value="${isSave}">
	<div id="setpForm" class="wizard-big wizard clearfix">
	    <div class="steps clearfix">
			<ul>
				<li class="first current">
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
		        <div class="survey_main clearfix">
					<div id="surveyLeft" class="survey_contentLeft">
						<div class="survey_contLeftBar">
							<div class="survey_contLeftTitle">基本字段</div>
							<div class="elementDiv clearfix">
								<div class="elementSpan dragsource" xtype="text">单行文本</div>
								<div class="elementSpan dragsource" xtype="textarea">多行文本</div>
								<div class="elementSpan dragsource" xtype="password">密码框</div>
								<div class="elementSpan dragsource" xtype="richtext">富文本</div>
								<div class="elementSpan dragsource" xtype="number">数字</div>
								<div class="elementSpan dragsource" xtype="date">日期时间</div>
								<div class="elementSpan dragsource" xtype="radio">单选按钮组</div>
								<div class="elementSpan dragsource" xtype="checkbox">复选按钮组</div>
								<div class="elementSpan dragsource" xtype="select">下拉框</div>
								<div class="elementSpan dragsource" xtype="selectmore">下拉复选框</div>
								<div class="elementSpan dragsource" xtype="line">分割线</div>
							</div>
							
							<div class="survey_contLeftTitle">增强字段</div>
							<div class="elementDiv clearfix">
								<div class="elementSpan dragsource" xtype="file">附件上传</div>
								<div class="elementSpan dragsource" xtype="hidden">隐藏域</div>
								<div class="elementSpan dragsource" xtype="subform">子表单</div>
							</div>
							
							<div class="survey_contLeftTitle">部门成员字段</div>
							<div class="elementDiv clearfix">
								<div class="elementSpan dragsource" xtype="user">成员单选</div>
								<div class="elementSpan dragsource" xtype="usergroup">成员多选</div>
								<div class="elementSpan dragsource" xtype="dept">部门单选</div>
								<div class="elementSpan dragsource" xtype="deptgroup">部门多选</div>
							</div>
						</div>
					</div>
					
					<div id="surveyCenter" class="survey_contentCenter">
						<div class="survey_contCenterOper">
							<a class="btn btnBlue" href="javascript:void(0);" onclick="preview()" style="color:#FFF;">预览</a>
							<a class="btn btnBlue" href="javascript:void(0);" onclick="submitForm()" style="color:#FFF;">保存</a>
							<a class="btn btnBlue" href="javascript:void(0);" onclick="clearDropDiv()" style="color:#FFF;">清空</a>
						</div>
						<!-- 拖放区域 -->
						<div class="survey_contCenterContent dropSpan">
							<!-- 编辑时,读取控件对应的属性 -->
						</div>
					</div>
					
					<div id="surveyRight" class="survey_contentRight">
						<div class="titleName clearfix">
							<ul>
								<li id="inputLi"><a href="javascript:void(0);">控件属性</a></li>
								<li id="formLi"><a href="javascript:void(0);">表单属性</a></li>
							</ul>
						</div>
						<form name="valueForm" id="valueForm" method="post">
							<input type="hidden" name="formLayout" id="formLayout" value="${moduleInfo.formLayout==null?'h':moduleInfo.formLayout}"/>
							<input type="hidden" name="tagNames" id="tagNames" value="">
							<input type="hidden" id="moduleId" name="moduleId" value="${moduleInfo.id}">
							<input type="hidden" id="parentId" name="parentId" value="${parentId}">
						<div class="titleItem">
							<div id="propDiv" style="display:none;">
								<!-- 属性详情配置面板 -->
							</div>
							<div id="formDiv">
								<div class="survey_contRightBar">
									<div class="survey_contRightTitleBar">
										<span class="survey_contRightTitle">表单名称</span>
									</div>
									<input type="text" class="inputWidth" name="moduleName" id="moduleName" placeholder="请输入表单名称" value="${moduleInfo.moduleName}">
									<div class="splitLine"></div>
								</div>
								
								<div class="survey_contRightBar">
									<div class="survey_contRightTitleBar">
										<span class="survey_contRightTitle">唯一标识(开发人配置,纯字母或加下划线)</span>
									</div>
									<input type="text" class="inputWidth" name="uniqueMark" id="uniqueMark" placeholder="请输入唯一标识" value="${moduleInfo.uniqueMark}">
									<div class="splitLine"></div>
								</div>
								
								<div class="survey_contRightBar">
									<div class="survey_contRightTitleBar">
										<span class="survey_contRightTitle">描述信息</span>
									</div>
									<textarea cols="4" class="inputWidth" name="description" id="description">${moduleInfo.description}</textarea>
									<div class="splitLine"></div>
								</div>
								<div class="survey_contRightBar">
									<div class="survey_contRightTitleBar">
										<span class="survey_contRightTitle">表单布局</span>
									</div>
									<div class="changeModeBar clearfix">
										<div class="modeItem ${moduleInfo.formLayout!='z'?'selected':''}" style="border-radius: 2px 0 0 2px;" xtype="h">横排</div>
										<div class="modeItem ${moduleInfo.formLayout=='z'?'selected':''}" style="border-radius: 0 2px 2px 0;" xtype="z">纵排</div>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
		    </fieldset>
		</div>
		<div class="actions clearfix">
			<ul>
				<li class="disabled">
					<a id="previous" href="javascript:alert('上一步');">上一步</a>
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
<!-- 单选框复选框引用 -->
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/static/js/autoForm/autoForm.js"></script>
<!-- 富文本编辑器引用 -->
<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
<script>
	var ctx = "${ctx}";
	/* 定义全局变量 */
	var divIndex = 1;//属性div
    $(function(){
    	$.ajax({
			url:"${ctx}/drawModuleInfo/json/getInputItems?moduleId="+$("#moduleId").val(),
			type:"post",
			dataType:"json",
			success:function(result){
				var formLayout = $("#formLayout").val();//获取表单布局格式  
				if(result.size > 0){
					divIndex = 1;
					
					for(var k = 0; k < result.inputList.length; k++){
						var obj = result.inputList[k];
						var htmlStr = "<div id=\"item"+divIndex+"\" class=\"ui-draggable ui-draggable-handle elementSpanMove clearfix\" xtype=\""+obj.inputType+"\">";
						htmlStr += getEditInputShowHtml(obj.inputType,obj);//定义变量存放拼装html
						htmlStr += "</div>";
						$(".dropSpan").append(htmlStr);
						/**
						*根据表单布局调整拖拽控件显示
						*/
						if(formLayout == 'z'){//默认为横排效果，z为纵排
							changeLayout(formLayout);
						}
						//创建控件属性面板
						var paneHtml = getEditPropHtml("item"+divIndex,obj.inputType,obj);//根据input类型加载不同的属性
						$("#propDiv").append(paneHtml);
						
						//执行一下 显示单选多选框效果
					 	 $(".i-checks:not(:has(ins))").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
						
						//存储创建标签信息
						var v = $("#tagNames").val();
						v += ";" + "item" + divIndex + "_" + obj.inputType;
						$("#tagNames").val(v);
	
					 	/* //显示控件属性
						showHidePropDiv($("#"+propertyId));//显示属性面板
						changePane("inputLi");//显示控件被点击效果
						changeBgColor($("#"+divId));//选中背景色 */
						
						//绑定单选框/复选框事件
					 	bindClickForBox(obj.inputType,"item"+divIndex);
					 	if(obj.inputType == "richtext"){
							initRichTextEditor("item"+divIndex+"_editor");//初始化富文本控件
						}
					 	divIndex++;
					}
				}
			},error:function(){
				layer.alert("请求超时，请稍后重试");
			},
	 	});
    });
</script>
<script>
    $(document).ready(function(){
    	$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
    });
</script>
<script type="text/javascript">
 $(function(){
	//拖拽js
  	$(".dragsource").disableSelection();
	
	$(".dragsource" ).draggable({
		helper:"clone",
		 /* helper:function(event,ui){
			var xtype = $(this).attr("xtype");
			var str = "<div class=\"elementSpanMove\" xtype=\""+xtype+"\">"+$(this).html()+"</div>";
			return str;
		}, */
		//revert: "invalid",
		cursor: "move",
		appendTo: "body",
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
	     start: function(event, ui) {//开始拖动时
	    	 //设置拖动时半透明
	        $(ui.item).css("opacity","0.6");
	     },
	     update: function( event, ui) {//当用户停止排序且 DOM 位置改变时触发该事件
	    	//排序
	    	 if(divIndex > 1){//过滤第一拖动元素
	    		 if($(ui.item).hasClass("elementSpan")){//判断是左侧拖动元素
	    			 var currentObj = $(ui.item);
					 var currentNum = Number($("#"+currentObj.attr("id")+"_prop_sort").val());
					 var obj = currentObj.next(".elementSpanMove");
					 if(obj.attr("id") != undefined){//表示不是最后一个位置
						//后一个元素的序号
						var num = Number($("#"+obj.attr("id")+"_prop_sort").val());
						$("#currentSort").val(num);
						//$("#"+currentObj.attr("id")+"_prop_sort").val(num);
						while(obj.attr("id") != undefined){
							num += 1;
							$("#"+obj.attr("id")+"_prop_sort").val(num);
							obj = obj.next(".elementSpanMove");
						}
					 }
	    		 }else{//排序元素
					var currentObj = $(ui.item);
					var currentNum = Number($("#"+currentObj.attr("id")+"_prop_sort").val());
					var obj = currentObj.next(".elementSpanMove");
					if(obj.attr("id") == undefined){//下拖
						obj = currentObj.prev(".elementSpanMove");
						num = Number($("#"+obj.attr("id")+"_prop_sort").val());
						$("#"+currentObj.attr("id")+"_prop_sort").val(num);
						while(obj.attr("id") != undefined){
							num -= 1;
							$("#"+obj.attr("id")+"_prop_sort").val(num);
							obj = obj.prev(".elementSpanMove");
						}
					}else{
						//后一个元素的序号
						var num = Number($("#"+obj.attr("id")+"_prop_sort").val());
						if(currentNum < num){//下拖
							obj = currentObj.prev(".elementSpanMove");
							num = Number($("#"+obj.attr("id")+"_prop_sort").val());
							$("#"+currentObj.attr("id")+"_prop_sort").val(num);
							while(obj.attr("id") != undefined){
								num -= 1;
								$("#"+obj.attr("id")+"_prop_sort").val(num);
								obj = obj.prev(".elementSpanMove");
							}
						}else{//上托
							$("#"+currentObj.attr("id")+"_prop_sort").val(num);
							while(obj.attr("id") != undefined){
								num += 1;
								$("#"+obj.attr("id")+"_prop_sort").val(num);
								obj = obj.next(".elementSpanMove");
							}
						}
					}
	    		 }
	    	 }
	     },
	 	 stop:function(event,ui){
	 		$(ui.item).css("opacity","1");
	 		var formLayout = $("#formLayout").val();//获取表单布局格式  h标识横排  z标识纵排
	 		$("td").removeClass("bgcolor");
	 		//根据class类型区分是左边控件栏的控件操作，还是中间拖放区域的排序操作
			if($(ui.item).hasClass("elementSpan")){
				//样式控制
				$(ui.item).addClass("elementSpanMove");
				$(ui.item).removeClass("elementSpan");
				$(ui.item).removeAttr("style");//去除clone复制元素导致的行内样式
				$(ui.item).addClass("clearfix");//解决div height为0的问题
				
				/**
				*显示实际控件样式  拖放后，根据拖动控件类型显示实际控件样式
				*/
				var divId = "item"+divIndex;
				var propertyId = divId+"_prop";
				
				$(ui.item).attr("id",divId);//给div增加ID号
				var xtype = $(ui.item).attr("xtype");
				var htmlStr = getInputShowHtml(xtype);//定义变量存放拼装html
				$(ui.item).html(htmlStr);
				
				/**
				*根据表单布局调整拖拽控件显示
				*/
				if(formLayout == 'z'){//默认为横排效果，z为纵排
					changeLayout(formLayout);
				}
				//获取排序序号
				var currentSort = $("#currentSort").val();
				if(currentSort == "no"){
					currentSort = divIndex;
				}else{
					$("#currentSort").val("no");//用完后恢复原貌
				}
				//创建控件属性面板
				var paneHtml = createProperties(divId,xtype,currentSort);//根据input类型加载不同的属性
				$("#propDiv").append(paneHtml);
				
				//执行一下 显示单选多选框效果
			 	 $(".i-checks:not(:has(ins))").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
				
				//存储创建标签信息
				var v = $("#tagNames").val();
				v += ";" + "item" + divIndex + "_" + xtype;
				$("#tagNames").val(v);

			 	//显示控件属性
				showHidePropDiv($("#"+propertyId));//显示属性面板
				changePane("inputLi");//显示控件被点击效果
				changeBgColor($("#"+divId));//选中背景色
				
				//绑定单选框/复选框事件
			 	bindClickForBox(xtype,divId);
				if(xtype == "richtext"){
					initRichTextEditor(divId+"_editor");//初始化富文本控件
				}
				divIndex++;//自动生成id
			}else{
				changeBgColor($(ui.item));
				var divId = $(ui.item).attr("id");
				showHidePropDiv($("#"+divId+"_prop"));
			}
			$(ui.item).removeClass("dragsource");
	 	}
	});
	
	$("#cancelBtn").click(function() {
		window.location.href="${ctx}/drawModuleInfo/main?id="+$("#parentId").val();
		return false;
	});
 });
    
/**鼠标悬浮 变色*/
 $(document).on("mouseover", ".elementSpanMove",
		function(ev) {
 	if(!$(this).hasClass("clickBg")){
     	$(this).addClass("overBg");
 	}
 });
/* 鼠标离开 变色  */
 $(document).on("mouseout", ".elementSpanMove",
		function(ev) {
 	$(this).removeClass("overBg");
 });
//拖拽后点击事件 变色 
 $(document).on("click", ".elementSpanMove",
		function(ev) {
			changeBgColor($(this));
			var divId = $(this).attr("id");
			showHidePropDiv($("#"+divId+"_prop"));//显示对应属性面板
			changePane("inputLi");//显示面板区域
		}
 );

function preview(){
	var viewDiv = $(".dropSpan").clone();
	$(viewDiv).find(".clickBg").removeClass("clickBg");
	$(viewDiv).find(".overBg").removeClass("overBg");
	var k = 1;
	//去除class 作用：去除div的单击事件
	$(viewDiv).find(".elementSpanMove").removeClass("elementSpanMove").css("width","100%");
	$(viewDiv).find("p.tools").remove();
	layer.open({
        type: 1,//1 表示content直接显示html 2表示发送请求页面
        title: false,
        closeBtn: 1, //显示关闭按钮 0不显示
        shade: [0.5, '#393D49'],//遮盖层
        shadeClose: true,
        area: ['60%', '94%'],
        offset: 'auto',
        shift: 2,
        content: "<br/>"+$(viewDiv).html() //iframe的url，no代表不显示滚动条
    });
}
/*清空拖动区域控件*/
function clearDropDiv(){
	confirm("温馨提示：确定执行清空操作吗？",function(){
		delRichEditor();
		$(".dropSpan").html("");//清空
		divIndex = 1;//恢复初始值
		$("#propDiv").html("");//清空属性
		$("#tagNames").val("");
		changePane("formLi");
		return false;
	},function(){//取消
		return false;
	});
}

/*提交表单*/
function submitForm(){
	//解绑离开事件
	window.onbeforeunload = null;
	var f  =document.getElementById("valueForm");
	f.action = "${ctx}/drawModuleInfo/saveInput";
	
	f.submit();
	return false;
}

function initRichTextEditor(id){
    /* $(".editorsSzc").each(function(){
	   ue = UE.getEditor($(this).attr("id"));
	   ue.addListener("ready", function () {});
    }); */
   ue = UE.getEditor(id);
   ue.addListener("ready", function () {});
}

//清除所有富文本控件 防止出现清空后，富文本无效显示的情况
function delRichEditor(id){
	if(id == undefined){//id不传表示清空所有editor
		$(".editorsSzc").each(function(){
			UE.delEditor($(this).attr("id"));
	    });
	}else{//清除某一指定editor
		UE.delEditor(id);
	}
	return false;
}

function nextStep(){
	var isSave = $("#isSave").val();//是否进行保存过
	/* if(isSave == "yes"){
		window.location.href = "${ctx}/drawModuleInfo/toDrawInputMain?stepType=two";
	}else{
		alert("请先执行保存操作！");
	} */
	window.location.href = "${ctx}/drawModuleInfo/toDrawInputMain?stepType=two&parentId="+$("#parentId").val()+"&moduleId="+$("#moduleId").val();
}
</script>
<script>
window.onbeforeunload = function(){ return "您确定要退出页面吗？";} 
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
<!-- 富文本编辑器引用 -->
<script>
var ue =null ;
$(function() {
	UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
	UE.Editor.prototype.getActionUrl = function(action) {
	    if (action == 'uploadvideo' || action == 'uploadscrawl' || action == 'uploadimage'  ) {
	        return '${ctx}/uploadimage';
	    } else {
	        return this._bkGetActionUrl.call(this, action);
	    }
	}
});   
</script> 
<script>
 $(function(){
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(1).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".changeModeBar .modeItem").click(function(){
		$(".changeModeBar .modeItem").each(function(){
			$(".modeItem").removeClass("selected");
		});
		$(this).addClass("selected")
		
		var xtype = $(this).attr("xtype");
		var formLayout = $("#formLayout").val();//标识当前布局格式 h标识横排 z标识纵排
		if(xtype != formLayout){
			changeLayout(xtype);
			$("#formLayout").val(xtype);
		}
	});
 })
</script>
</html>