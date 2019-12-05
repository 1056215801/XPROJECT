<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>绘制表单相关页面</title>
<link href="${ctx}/static/css/autoForm/surveyManagementList.css" rel="stylesheet"/>
<!-- 引导标签引用 -->
<script src="${ctx}/static/js/plugins/staps/jquery.steps.min.js"></script>
<script src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

<link href="${ctx}/static/css/plugins/steps/jquery.steps.drawForm.css" rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">

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

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body id="body" onselectstart="return false;" style="overflow:hidden;">
	<div id="setpForm" class="wizard-big">
	    <h1>控件配置</h1>
	    <fieldset>
	        <div class="survey_main clearfix">
				<div id="surveyLeft" class="survey_contentLeft">
					<div class="survey_contLeftBar">
						<div class="survey_contLeftTitle">基本字段</div>
						<div class="elementDiv clearfix">
							<span class="elementSpan dragsource szc" xtype="text">单行文本</span>
							<span class="elementSpan dragsource szc" xtype="textarea">多行文本</span>
							<span class="elementSpan dragsource szc" xtype="password">密码框</span>
							<span class="elementSpan dragsource szc" xtype="richtext">富文本</span>
							<span class="elementSpan dragsource szc" xtype="number">数字</span>
							<span class="elementSpan dragsource szc" xtype="date">日期时间</span>
							<span class="elementSpan dragsource szc" xtype="radio">单选按钮组</span>
							<span class="elementSpan dragsource szc" xtype="checkbox">复选按钮组</span>
							<span class="elementSpan dragsource szc" xtype="select">下拉框</span>
							<span class="elementSpan dragsource szc" xtype="selectmore">下拉复选框</span>
							<span class="elementSpan dragsource szc" xtype="line">分割线</span>
						</div>
						<div class="survey_contLeftTitle">增强字段</div>
						<div class="elementDiv clearfix">
							<span class="elementSpan" xtype="file">附件上传</span>
							<span class="elementSpan" xtype="hidden">隐藏域</span>
							<span class="elementSpan" xtype="subform">子表单</span>
						</div>
					</div>
				</div>
				
				<div id="surveyCenter" class="survey_contentCenter">
					<div class="survey_contCenterOper">
						<input type="button" class="btn btnBlue" id="previewBtn" value="预览" />
						<input type="button" class="btn btn-primary" id="saveBtn" value="保存" />
						<input type="button" class="btn btnBlue" id="clearBtn" value="清空" />
					</div>
					
					<form method="post" action="${ctx}/drawTdInfo/saveTdWithInput" id="form">
						<div class="survey_contCenterContent">
							<span class="elementSpanMove">复选按钮组</span>
							<span class="elementSpanMove">下拉框</span>
							<span class="elementSpanMove">下拉复选框</span>
							<span class="elementSpanMove">分割线</span>
						</div>
					</form>
					
				</div>
				
				<div id="surveyRight" class="survey_contentRight">
					<div class="titleName clearfix">
						<ul>
							<li><a href="javascript:;">控件属性</a></li>
							<li><a href="javascript:;">表单属性</a></li>
						</ul>
					</div>
					<div class="titleItem">
						<div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">标题</span>
									<div class="titleTip">单选按钮组</div>
								</div>
								<input type="text" class="inputWidth" placeholder="单选按钮组">
								<div class="splitLine"></div>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">描述信息</span>
								</div>
								<textarea cols="4" class="inputWidth"></textarea>
								<div class="splitLine"></div>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">校验</span>
								</div>
								<div class="i-checks" style="margin:5px 0 0 20px;">
									<input type="checkbox" value="" name="Q4" style="margin-right:5px;">
									<span style="margin-left:5px;">必填</span>
								</div>
								<div class="splitLine"></div>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">排序</span>
								</div>
								<input type="text" class="inputWidth" placeholder="" value="1">
								<div class="splitLine"></div>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">类型</span>
								</div>
								<select class="inputWidth">
									<option>年-月-日 时:分:秒</option>
									<option>年-月-日 时:分</option>
									<option>年-月-日</option>
									<option>年-月</option>
									<option>时:分:秒</option>
									<option>时:分</option>
								</select>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">格式</span>
								</div>
								<select class="inputWidth">
									<option>无</option>
									<option>邮箱</option>
									<option>手机号码</option>
									<option>固定电话</option>
									<option>邮政编码</option>
								</select>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">格式</span>
								</div>
								<select class="inputWidth">
									<option>无</option>
									<option>邮箱</option>
									<option>手机号码</option>
									<option>固定电话</option>
									<option>邮政编码</option>
								</select>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">格式</span>
								</div>
								<select class="inputWidth">
									<option>无</option>
									<option>邮箱</option>
									<option>手机号码</option>
									<option>固定电话</option>
									<option>邮政编码</option>
								</select>
							</div><div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">格式</span>
								</div>
								<select class="inputWidth">
									<option>无</option>
									<option>邮箱</option>
									<option>手机号码</option>
									<option>固定电话</option>
									<option>邮政编码</option>
								</select>
							</div><div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">格式</span>
								</div>
								<select class="inputWidth">
									<option>无</option>
									<option>邮箱</option>
									<option>手机号码</option>
									<option>固定电话</option>
									<option>邮政编码</option>
								</select>
							</div><div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">格式</span>
								</div>
								<select class="inputWidth">
									<option>无</option>
									<option>邮箱</option>
									<option>手机号码</option>
									<option>固定电话</option>
									<option>邮政编码</option>
								</select>
							</div>
							
						</div>
						<div style="display:none;">
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">表单名称</span>
								</div>
								<input type="text" class="inputWidth" placeholder="这是一个测试的调查">
								<div class="splitLine"></div>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">描述信息</span>
								</div>
								<textarea cols="4" class="inputWidth"></textarea>
								<div class="splitLine"></div>
							</div>
							<div class="survey_contRightBar">
								<div class="survey_contRightTitleBar">
									<span class="survey_contRightTitle">表单布局</span>
								</div>
								<div class="changeModeBar clearfix">
									<div class="modeItem selected" style="border-radius: 2px 0 0 2px;">横排</div>
									<div class="modeItem" style="border-radius: 0 2px 2px 0;">纵排</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
	    </fieldset>
	    
	    <h1>表格布局绘制</h1>
	    <fieldset>
	        <h2>表格布局绘制</h2>
	        <div class="row">
	            <div class="col-sm-6">
	                <div class="form-group">
	                    <label>姓名 *</label>
	                    <input id="name" name="name" type="text" class="form-control required">
	                </div>
	            </div>
	            <div class="col-sm-6">
	                <div class="form-group">
	                    <label>Email *</label>
	                    <input id="email" name="email" type="text" class="form-control required email">
	                </div>
	                <div class="form-group">
	                    <label>地址 *</label>
	                    <input id="address" name="address" type="text" class="form-control">
	                </div>
	            </div>
	        </div>
	    </fieldset>
	
	    <h1>控件布局</h1>
	    <fieldset>
	        <div class="survey_main clearfix" id="mainDiv">
				<div id="surveyLeft" class="survey_contentLeft">
					<div class="survey_contLeftBar">
						<div class="survey_contLeftTitle">可选已配置字段</div>
						<div class="elementDiv clearfix" id="nowDiv">
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
	    </fieldset>
	
	    <h1>完成</h1>
	    <fieldset>
	        <h2>条款</h2>
	        <input id="acceptTerms" name="acceptTerms" type="checkbox" class="required">
	        <label for="acceptTerms">我同意注册条款</label>
	    </fieldset>
	</div>
</body>
<script type="text/javascript"> 
 $(function(){
	/* var screenHeight = document.documentElement.clientHeight; */
	/* var body = document.getElementById('body'); */
	/* body.style.height = screenHeight+"px";  */
	
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
	if($("#surveyRight").attr("id") == undefined){//20为右边滚动条宽度 10为左右两边各5px的margin
		centerWidth.style.width=screenWidth-251-20-10+"px";
	}else {
		centerWidth.style.width=screenWidth-251-20-10-301+"px";
	}
	
	//$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
 });
</script>
<script>
    //$(document).ready(function(){$("#setpForm").steps({bodyTag:"fieldset",onStepChanging:function(event,currentIndex,newIndex){if(currentIndex>newIndex){return true}if(newIndex===3&&Number($("#age").val())<18){return false}var form=$(this);if(currentIndex<newIndex){$(".body:eq("+newIndex+") label.error",form).remove();$(".body:eq("+newIndex+") .error",form).removeClass("error")}form.validate().settings.ignore=":disabled,:hidden";return form.valid()},onStepChanged:function(event,currentIndex,priorIndex){if(currentIndex===2&&Number($("#age").val())>=18){$(this).steps("next")}if(currentIndex===2&&priorIndex===3){$(this).steps("previous")}},onFinishing:function(event,currentIndex){var form=$(this);form.validate().settings.ignore=":disabled";return form.valid()},onFinished:function(event,currentIndex){var form=$(this);form.submit()}}).validate({errorPlacement:function(error,element){element.before(error)},rules:{confirm:{equalTo:"#password"}}})});
	$(document).ready(function(){
		$("#setpForm").steps({
			bodyTag:"fieldset",
			onStepChanging:function(event,currentIndex,newIndex){
				if(currentIndex>newIndex){return true}
				if(newIndex===3&&Number($("#age").val())<18){return false}
				var form=$(this);
				if(currentIndex<newIndex){
					$(".body:eq("+newIndex+") label.error",form).remove();
					$(".body:eq("+newIndex+") .error",form).removeClass("error");
				}
				form.validate().settings.ignore=":disabled,:hidden";
				return form.valid();
			},
			onStepChanged:function(event,currentIndex,priorIndex){
				if(currentIndex===2&&Number($("#age").val())>=18){
					$(this).steps("next");
				}
				if(currentIndex===2&&priorIndex===3){
					$(this).steps("previous");
				}
			},
			onFinishing:function(event,currentIndex){
				var form=$(this);
				form.validate().settings.ignore=":disabled";
				return form.valid();
			},
			onFinished:function(event,currentIndex){
				var form=$(this);form.submit();
			}
		}).validate({
			errorPlacement:function(error,element){
				element.before(error);
			},rules:{
				confirm:{equalTo:"#password"}
			}
		});
	});
</script>
<script>
 $(function(){
	//$(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"})});
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
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
	});
 })
</script>
</html>