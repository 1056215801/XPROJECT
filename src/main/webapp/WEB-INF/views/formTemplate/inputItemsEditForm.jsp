<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>编辑录入项</title>

 <link rel="shortcut icon" href="favicon.ico"> 
 <link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
 <link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
 <link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
 <link href="${ctx}/static/css/plugins/summernote/summernote.css" rel="stylesheet">
 <link href="${ctx}/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
 <link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
 <!-- 单选框复选框引用 -->
 <link href="${ctx}/static/css/plugins/iCheck/custom.css" rel="stylesheet">

 <style>
     .droppable-active{background-color:#ffe!important}.tools a{cursor:pointer;font-size:80%}.form-body .col-md-6,.form-body .col-md-12{min-height:400px}.draggable{cursor:move}
 	
 	input[type="number"]{-moz-appearance:textfield;}
 	
 	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button{
	    -webkit-appearance: none !important;
	    margin: 0; 
	}
 </style>

<style type="text/css">
	.btn-success {
		background: orange;
	}
</style>
</head>
<body class="gray-bg" style="overflow:hidden;">
    <div class="wrapper wrapper-content">
        <div class="row">
        	<div class="ibox-title">
                <h5>表单-创建元素 【<font color="blue">当前表单：${formTemplate.formName}</font>】</h5>
                <div class="ibox-tools">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="form_editors.html#" title="切换表单">
                        <i class="fa fa-wrench">切换表单</i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    	<c:forEach items="${templateList}" var="template">
                    		<c:if test="${template.id!=formTemplate.id}">
	                        	<li><a href="javascript:void(0);" onclick="toConfigInputItemsPage('${template.id}')">${template.formName}</a></li>
	                        </c:if>
                    	</c:forEach>
                    </ul>
                    <a class="close-link" href="javascript:void(0);" onclick="preview()" title="预览效果">
                        <i class="fa btn btn-white">预览</i>
                    </a>
                    
                    <a class="" href="javascript:void(0);" onclick="submitForm()" title="提交">
                        <i class="fa btn btn-primary">提交</i>
                    </a>
                    <a class="close-link" href="javascript:window.history.go(-1);" title="取消">
                        <i class="fa btn btn-white">取消</i>
                    </a>
                </div>
            </div>
                    
            <div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>元素</h5>
                    </div>
                    <div class="ibox-content" style="height:520px;overflow-y:auto;overflow-x:hidden;">
                        <div class="alert alert-info">
                            拖拽左侧的表单元素到右侧区域，即可生成相应的HTML代码，表单代码，轻松搞定！
                        </div>
                        <form role="form" class="form-horizontal m-t">
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">文本框：</label>
                                <div class="col-sm-9">
                                    <input type="text" name="" class="form-control" placeholder="请输入文本">
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">密码框：</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" name="password" placeholder="请输入密码">
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">数值：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="number" placeholder="请输入数值">
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">多行文本：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" name="webk" placeholder="请输入文本"></textarea>
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">富文本编辑器：</label>
                                <div class="col-sm-9">
                                    <script id="editors" type="text/plain"></script>
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            
                             <div class="form-group draggable szc">
                             	<label class="col-sm-3 control-label">单选按钮组：</label>
                             	<div class="col-sm-9">
	                             	<div class="radio i-checks">
	                                     <label id="lab1"><input type="radio" value="选项1" name="rdobox"> <i></i> <font>选项1</font></label>
	                                     <label id="lab2"><input type="radio" value="选项2" name="rdobox"> <i></i> <font>选项2</font></label>
	                                     <label id="lab3"><input type="radio" value="选项3" name="rdobox"> <i></i> <font>选项3</font></label>
	                                 </div>
	                                 <span class="help-block m-b-none"></span>
	                            </div>
                             </div>
                             
                             <div class="form-group draggable szc">
                             	<label class="col-sm-3 control-label">复选按钮组：</label>
                             	<div class="col-sm-9">
	                             	<div class="checkbox i-checks">
	                                     <label id="lab1"><input type="checkbox" value="选项1" name="ckbox"> <i></i> <font>选项1</font></label>
	                                     <label id="lab2"><input type="checkbox" value="选项2" name="ckbox"> <i></i> <font>选项2</font></label>
	                                     <label id="lab3"><input type="checkbox" value="选项3" name="ckbox"> <i></i> <font>选项3</font></label>
	                                 </div>
	                                 <span class="help-block m-b-none"></span>
	                            </div>
                             </div>
                                    
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">下拉列表：</label>
                                <div class="col-sm-9">
                                    <select class="form-control" name="slt">
                                        <option id="opt1">选项1</option>
                                        <option id="opt2">选项2</option>
                                        <option id="opt3">选项3</option>
                                    </select>
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">下拉复选列表：</label>
                                <div class="col-sm-9">
                                     <select class="form-control" multiple="">
                                         <option id="opt1">选项1</option>
                                         <option id="opt2">选项2</option>
                                         <option id="opt3">选项3</option>
                                     </select>
                                     <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">日期时间：</label>
                                <div class="col-sm-9">
                                	  <input class="form-control layer-date laydate-icon" placeholder="单击选择时间" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                	  <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">隐藏域：</label>
                                <div class="col-sm-9">
                                	  <input type="hidden" name="hidden" />
                                </div>
                            </div>
                            
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">文件上传：</label>
                                <div class="col-sm-9">
                                    <input type="file" name="">
                                    <span class="help-block m-b-none"></span>
                                </div>
                            </div>
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">子表单：</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static" id="subform">请选择需引用的表单</p>
                                </div>
                            </div>
                            <div class="form-group draggable szc">
                                <label class="col-sm-3 control-label">分割线：</label>
                                <div class="col-sm-9">
                                   <span class="help-block m-b-none"></span>
                                   <div class="hr-line-dashed" id="line"></div>
                                </div>
                            </div>
                        </form>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>拖拽左侧表单元素到此区域</h5>
                        <div class="ibox-tools">
                            请选择显示的列数：
                            <select id="n-columns">
                                <option value="1">显示1列</option>
                                <option value="2">显示2列</option>
                            </select>
                        </div>
                    </div>

                    <div class="ibox-content" style="height:520px;overflow-y:auto;overflow-x:hidden;">
                        <div class="row form-body form-horizontal m-t" id="tzDiv">
                            <div class="col-md-12 droppable sortable">
                            	<!-- 拖拽区域 -->
                            	<c:forEach items="${inputList}" var="item" varStatus="k">
                           			 <div class="form-group draggable ui-draggable dropped" style="position:static;" id="item${k.index+1}">
		                                <c:if test="${item.inputType!='line'}">
		                                <label class="col-sm-3 control-label">${item.inputTitle}：</label>
		                                <div class="col-sm-9">
		                                </c:if>
		                                <c:if test="${item.inputType=='line'}">
		                                <div class="col-sm-12">
		                                </c:if>
                            		<!-- 文本框 -->
                            		<c:if test="${item.inputType=='text'}">
		                                    <input type="text" name="${item.filedName}" value="${item.defaultValue}" class="form-control" placeholder="请输入${item.dataFormat=='email'?'邮箱格式':item.dataFormat=='phone'?'手机号码格式':item.dataFormat=='tel'?'固定电话格式':item.dataFormat=='code'?'邮政编码格式':''}文本">
                            		</c:if>
                            		<!-- 密码框 -->
                            		<c:if test="${item.inputType=='password'}">
		                                    <input type="password" class="form-control" name="${item.filedName}" value="${item.defaultValue}" placeholder="请输入密码">
                            		</c:if>
                            		<!-- 数值 -->
                            		<c:if test="${item.inputType=='number'}">
	                                      <input type="text" class="form-control" name="number" placeholder="请输入数值" value="<fmt:formatNumber minFractionDigits="${item.precision}" maxFractionDigits="${item.precision}" value='${item.defaultValue==null?0:item.defaultValue}'/>">
                            		</c:if>
                            		<c:if test="${item.inputType=='textarea'}">
                                      	  <textarea class="form-control" name="${item.filedName}" placeholder="请输入文本">${item.defaultValue}</textarea>
                            		</c:if>
                            		<c:if test="${item.inputType=='richtext'}">
                                      	  <script id="editors${k.index+1}" type="text/plain" class="editorsSzc"></script>
                            		</c:if>
                            		<c:if test="${item.inputType=='radio'}">
                                      	  <div class="radio i-checks">
                                      	  	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
                                      	  	 	<c:if test="${item.dataFormat=='shupai'}"><br/></c:if>
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="radio" value="${it}" name="rdobox"  ${fn:contains(item.defaultValue,it)?'checked':''}> <i></i> 
		                                     <font>
		                                     ${it}
		                                     <c:if test="${it=='其他'}">&nbsp;<input type="text" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></c:if>
		                                     </font>
		                                     </label>
		                                    </c:forEach>
		                                 </div>
                            		</c:if>
                            		<c:if test="${item.inputType=='checkbox'}">
                                      	  <div class="checkbox i-checks">
                                      	  	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
                                      	  		<c:if test="${item.dataFormat=='shupai'}"><br/></c:if>
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="checkbox" value="${it}" name="ckbox" ${fn:contains(item.defaultValue,it)?'checked':''}> <i></i> 
											 <font>
		                                     ${it}
		                                     <c:if test="${it=='其他'}">&nbsp;<input type="text" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></c:if>
		                                     </font>
											</label>
		                                     </c:forEach>
		                                 </div>
                            		</c:if>
                            		<c:if test="${item.inputType=='select'}">
                                      	   <select class="form-control" name="slt">
                                      	   		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                        	<option id="item${k.index+1}_opt${j.index+1}" ${fn:contains(item.defaultValue,it)?'selected':''}>${it}</option>
		                                        </c:forEach>
		                                    </select>
                            		</c:if>
                            		<c:if test="${item.inputType=='selectmore'}">
                                      	   <select class="form-control" multiple="">
	                                         <c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                        	<option id="item${k.index+1}_opt${j.index+1}" ${fn:contains(item.defaultValue,it)?'selected':''}>${it}</option>
		                                        </c:forEach>
	                                       </select>
                            		</c:if>
                            		<c:if test="${item.inputType=='date'}">
                                      	   <input class="form-control layer-date laydate-icon" placeholder="单击选择时间" onclick="laydate({istime: true, format: '${item.dataFormat=='ymdhms'?'YYYY-MM-DD hh:mm:ss':item.dataFormat=='ymdhm'?'YYYY-MM-DD hh:mm':item.dataFormat=='ymd'?'YYYY-MM-DD':item.dataFormat=='ym'?'YYYY-MM':'YYYY-MM-DD hh:mm:ss'}'})">
                            		</c:if>
                            		<c:if test="${item.inputType=='hidden'}">
                                      	    <input type="hidden" name="hidden"/>
                            		</c:if> 
                            		<c:if test="${item.inputType=='file'}">
                                      	    <input type="file" name="">
                            		</c:if>
                            		<c:if test="${item.inputType=='subform'}">
                                      	    <p class="form-control-static" id="subform">请选择需引用的表单</p>
                            		</c:if>
                            		<c:if test="${item.inputType=='line'}">
                            			   <span class="help-block m-b-none">${item.promptMsg}</span>
                                      	   <div class="hr-line-${item.dataFormat=='dashed'?'dashed':'solid'}" id="line"></div>
                            		</c:if>
                            		<c:if test="${item.inputType!='line'}">
                            				<span class="help-block m-b-none">${item.promptMsg}</span>
                            		</c:if>
		                            	</div>
                            			<p class="tools col-sm-12 col-sm-offset-3"><a class="remove-link" onclick="removeLink('item${k.index+1}','${item.inputType}')">移除</a></p>
		                            </div>
                            	</c:forEach>
                            </div>
                            <div class="col-md-6 droppable sortable" style="display: none;">
                            </div>
                            <div class="col-md-6 droppable sortable" style="display: none;">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-warning" data-clipboard-text="testing" id="copy-to-clipboard">复制代码</button>
                    </div>
                </div>
            </div>
            
            <div class="col-sm-2">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>属性</h5>
                    </div>
					<form name="valueForm" id="valueForm">
					<input type="hidden" name="tagNames" id="tagNames" value="${tagNames}">
					<input type="hidden" name="templateId" id="templateId" value="${formTemplate.id}">
					<input type="hidden" name="maxIndex" id="maxIndex">
                    <div class="ibox-content" style="height:520px;overflow-y:auto;overflow-x:hidden;" id="propDiv">
                    	<!-- 属性层代码 -->
                    	<c:forEach items="${inputList}" var="item" varStatus="k">
                    		<div class="form-body" id="item${k.index+1}_prop" style="display:none;">
                    		<c:if test="${item.inputType=='text'}">
                   				标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				        		格式：<br/>
				                <select name="item${k.index+1}_prop_format" id="item${k.index+1}_prop_format" onchange="updateValue('txtFormat','item${k.index+1}')">
				                <option value="">无</option>
				                <option value="email" ${item.dataFormat=='email'?'selected':''}>邮箱</option>
				                <option value="phone" ${item.dataFormat=='phone'?'selected':''}>手机号码</option>
			                    <option value="tel" ${item.dataFormat=='tel'?'selected':''}>固定电话</option>
			                    <option value="code" ${item.dataFormat=='code'?'selected':''}>邮政编码</option>
				                </select><br/>
				                默认值：<br/><input type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')"><br/>
                    		</c:if>
                    		<c:if test="${item.inputType=='password'}">
                    			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                默认值：<br/><input type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')"><br/>
                       		</c:if>
                       		<!-- 数值 -->
                       		<c:if test="${item.inputType=='number'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                最小值：<br/><input type="number" name="item${k.index+1}_prop_min" value="${item.minValue}"><br/>
                    			最大值：<br/><input type="number" name="item${k.index+1}_prop_max" value="${item.maxValue}"><br/>
                    			小数点后几位：<br/><input type="number" name="item${k.index+1}_prop_pre" id="item${k.index+1}_prop_pre" value="${item.precision}" onblur="updateValue('precision','item${k.index+1}')"><br/>
				                默认值：<br/><input type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('precision','item${k.index+1}')"><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='textarea'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                默认值：<br/><input type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('areadfValue','item${k.index+1}')"><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='richtext'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                默认值：<br/><input type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('richdfValue','item${k.index+1}')"><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='radio'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                排列格式：<br/>
				                <select id="item${k.index+1}_prop_format" name="item${k.index+1}_prop_format" onchange="updateValue('checkFormat','item${k.index+1}')">
				                <option value="hengpai" ${item.dataFormat=='hengpai'?'selected':''}>横排</option>
				                <option value="shupai" ${item.dataFormat=='shupai'?'selected':''}>竖排</option>
				                </select><br/>
				                选项：<br/>
				        		<div id="item${k.index+1}_prop_rdoItemDiv">
					        		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
						        		<span id="item${k.index+1}_prop_rdoItem${j.index+1}_span">
						        			<input type="radio" name="item${k.index+1}_prop_rdo" value="${j.index+1}" onclick="updateValue('isCheckRdo','item${k.index+1}_${j.index+1}')" ${fn:contains(item.defaultValue,it)?'checked':''}>&nbsp;<input type="text" style="width:120px;" name="item${k.index+1}_prop_rdoItem${j.index+1}" value="${it}" id="item${k.index+1}_prop_rdoItem${j.index+1}" onblur="updateValue('rdoTitle','item${k.index+1}_${j.index+1}')">
						        			<c:if test="${j.index>0}">
						        				&nbsp;<a href="javascript:void(0);" onclick="removeItem('item${k.index+1}','item${k.index+1}_prop_rdoItem${j.index+1}_span','${j.index+1}','radio')" title="移除">×</a>
						        			</c:if>
						        		<br/></span>
					        		</c:forEach>
				        		</div>
				        		<a href="javascript:void(0);" onclick="addItem('item${k.index+1}','radio')">增加选项</a>&nbsp;&nbsp;
				        		<a href="javascript:void(0);" onclick="addItem('item${k.index+1}','rdoOther')">其他(自定义)</a><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='checkbox'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                排列格式：<br/>
				                <select id="item${k.index+1}_prop_format" name="item${k.index+1}_prop_format" onchange="updateValue('checkFormat','item${k.index+1}')">
				                <option value="hengpai" ${item.dataFormat=='hengpai'?'selected':''}>横排</option>
				                <option value="shupai" ${item.dataFormat=='shupai'?'selected':''}>竖排</option>
				                </select><br/>
				                选项：<br/>
				        		<div id="item${k.index+1}_prop_ckbItemDiv">
					        		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
						        		<span id="item${k.index+1}_prop_ckbItem${j.index+1}_span">
						        			<input type="checkbox" id="item${k.index+1}_prop_ckb${j.index+1}" name="item${k.index+1}_prop_ckb" value="${j.index+1}" onclick="updateValue('isCheckCkb','item${k.index+1}_${j.index+1}')" ${fn:contains(item.defaultValue,it)?'checked':''}>&nbsp;<input type="text" style="width:120px;" name="item${k.index+1}_prop_ckbItem${j.index+1}" value="${it}" id="item${k.index+1}_prop_ckbItem${j.index+1}" onblur="updateValue('ckbTitle','item${k.index+1}_${j.index+1}')">
						        			<c:if test="${j.index>0}">
						        				&nbsp;<a href="javascript:void(0);" onclick="removeItem('item${k.index+1}','item${k.index+1}_prop_ckbItem${j.index+1}_span','${j.index+1}','checkbox')" title="移除">×</a>
						        			</c:if>
						        		<br/></span>
					        		</c:forEach>
				        		</div>
				        		<a href="javascript:void(0);" onclick="addItem('item${k.index+1}','checkbox')">增加选项</a>&nbsp;&nbsp;
				        		<a href="javascript:void(0);" onclick="addItem('item${k.index+1}','cbxOther')">其他(自定义)</a><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='select'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                选项：<br/>
				        		<div id="item${k.index+1}_prop_slcItemDiv">
				        		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
					        		<span id="item${k.index+1}_prop_slcItem${j.index+1}_span">
					        			<input type="radio" name="item${k.index+1}_prop_slc" value="${j.index+1}" onclick="updateValue('isCheckSlc','item${k.index+1}_${j.index+1}')" ${fn:contains(item.defaultValue,it)?'checked':''}>&nbsp;<input type="text" style="width:120px;" name="item${k.index+1}_prop_slcItem${j.index+1}" value="${it}" id="item${k.index+1}_prop_slcItem${j.index+1}" onblur="updateValue('slcTitle','item${k.index+1}_${j.index+1}')">
					        			<c:if test="${j.index>0}">
					        				&nbsp;<a href="javascript:void(0);" onclick="removeItem('item${k.index+1}','item${k.index+1}_prop_slcItem${j.index+1}_span','${j.index+1}','select')" title="移除">×</a>
					        			</c:if>
					        		<br/></span>
				        		</c:forEach>
				        		</div>
				        		<a href="javascript:void(0);" onclick="addItem('item${k.index+1}','select')">增加选项</a><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='selectmore'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                选项：<br/>
				        		<div id="item${k.index+1}_prop_slmItemDiv">
				        		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
					        		<span id="item${k.index+1}_prop_slmItem${j.index+1}_span">
					        			<input type="checkbox" id="item${k.index+1}_prop_slm${j.index+1}" name="item${k.index+1}_prop_slm" value="${j.index+1}" onclick="updateValue('isCheckSlm','item${k.index+1}_${j.index+1}')" ${fn:contains(item.defaultValue,it)?'checked':''}>&nbsp;<input type="text" style="width:120px;" name="item${k.index+1}_prop_slmItem${j.index+1}" value="${it}" id="item${k.index+1}_prop_slmItem${j.index+1}" onblur="updateValue('slmTitle','item${k.index+1}_${j.index+1}')">
					        		<c:if test="${j.index>0}">
				        				&nbsp;<a href="javascript:void(0);" onclick="removeItem('item${k.index+1}','item${k.index+1}_prop_slmItem${j.index+1}_span','${j.index+1}','selectMore')" title="移除">×</a>
				        			</c:if>
					        		<br/></span>
				        		</c:forEach>
				        		</div>
				        		<a href="javascript:void(0);" onclick="addItem('item${k.index+1}','selectMore')">增加选项</a><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='date'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                类型：<br/>
				                <select id="item${k.index+1}_prop_format" name="item${k.index+1}_prop_format" onchange="updateValue('dateFormat','item${k.index+1}')">
				                <option value="ymdhms" ${item.dataFormat=='ymdhms'?'selected':''}>年-月-日 时:分:秒</option>
				                <option value="ymdhm" ${item.dataFormat=='ymdhm'?'selected':''}>年-月-日 时:分</option>
				                <option value="ymd" ${item.dataFormat=='ymd'?'selected':''}>年-月-日</option>
								<option value="ym" ${item.dataFormat=='ym'?'selected':''}>年-月</option>
				                <!-- 
				                <option value="hms">时:分:秒</option>
				                <option value="hm">时:分</option>
				                 -->
				                </select><br/>
				                默认值：<br/><input type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')"><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='hidden'}">
                       			字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
				                默认值：<br/><input type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')"><br/>
                       		</c:if> 
                       		<c:if test="${item.inputType=='file'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='subform'}">
                       			标题：<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名：<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
                       			选择模板：<br/><input type="text" name="item${k.index+1}_prop_subform" value="待开发中..."><br/>
                       		</c:if>
                       		<c:if test="${item.inputType=='line'}">
                       			<!-- 
                       			标题:<br/><input type="text" name="item${k.index+1}_prop_title" value="${item.inputTitle}" id="item${k.index+1}_prop_title" onblur="updateValue('title','item${k.index+1}')"><br/>
				                字段名:<br/><input type="text" name="item${k.index+1}_prop_filedName" value="${item.filedName}"><br/>
                       			 -->
                       			类型：<br/>
				                <select id="item${k.index+1}_prop_format" name="item${k.index+1}_prop_format" onchange="updateValue('lineType','item${k.index+1}')">
				                <option value="dashed" ${item.dataFormat=='dashed'?'selected':''}>虚线</option>
				                <option value="solid" ${item.dataFormat=='solid'?'selected':''}>实线</option>
				                </select><br/>
                       		</c:if>
                       		说明文字：<br/><input type="text" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" value="${item.promptMsg}" onblur="updateValue('des','item${k.index+1}')"><br/>
				        	<c:if test="${item.inputType!='line'}">
				        	校验：<br/>&nbsp;&nbsp;<input type="checkbox" value="1" name="item${k.index+1}_prop_check" ${item.checkType==1?'checked':''}>必填<br/>
				            权限：<br/>&nbsp;&nbsp;<input type="checkbox" value="show" name="item${k.index+1}_prop_show" ${fn:contains(item.funcPermission,'show')?'checked':''}>可见<br/>
				            &nbsp;&nbsp;<input type="checkbox" value="edit" name="item${k.index+1}_prop_edit" ${fn:contains(item.funcPermission,'edit')?'checked':''}>编辑<br/>
				            </c:if>
				            排序：<br/><input type="text" readOnly name="item${k.index+1}_prop_sort" id="item${k.index+1}_prop_sort" value="${item.sortGrade}">
                   		</div>
                   		</c:forEach>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
	<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/static/js/jquery-ui-1.10.4.min.js"></script>
    <script src="${ctx}/static/js/plugins/beautifyhtml/beautifyhtml.js"></script>
    <!-- 富文本编辑器引用 -->
    <script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
	 <!-- 单选框复选框引用 -->
	 <script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	 <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
    </script>
    <!-- 元素拖拽引用 -->
    <script>
        //$(document).ready(function(){setup_draggable();$("#n-columns").on("change",function(){var v=$(this).val();if(v==="1"){var $col=$(".form-body .col-md-12").toggle(true);$(".form-body .col-md-6 .draggable").each(function(i,el){$(this).remove().appendTo($col)});$(".form-body .col-md-6").toggle(false)}else{var $col=$(".form-body .col-md-6").toggle(true);$(".form-body .col-md-12 .draggable").each(function(i,el){$(this).remove().appendTo(i%2?$col[1]:$col[0])});$(".form-body .col-md-12").toggle(false)}});$("#copy-to-clipboard").on("click",function(){var $copy=$(".form-body").clone().appendTo(document.body);$copy.find(".tools, :hidden").remove();$.each(["draggable","droppable","sortable","dropped","ui-sortable","ui-draggable","ui-droppable","form-body"],function(i,c){$copy.find("."+c).removeClass(c).removeAttr("style")});var html=html_beautify($copy.html());$copy.remove();$modal=get_modal(html).modal("show");$modal.find(".btn").remove();$modal.find(".modal-title").html("复制HTML代码");$modal.find(":input:first").select().focus();return false})});var setup_draggable=function(){$(".draggable").draggable({appendTo:"body",helper:"clone"});$(".droppable").droppable({accept:".draggable",helper:"clone",hoverClass:"droppable-active",drop:function(event,ui){$(".empty-form").remove();var $orig=$(ui.draggable);if(!$(ui.draggable).hasClass("dropped")){var $el=$orig.clone().addClass("dropped").css({"position":"static","left":null,"right":null}).appendTo(this);var id=$orig.find(":input").attr("id");if(id){id=id.split("-").slice(0,-1).join("-")+"-"+(parseInt(id.split("-").slice(-1)[0])+1);$orig.find(":input").attr("id",id);$orig.find("label").attr("for",id)}$('<p class="tools col-sm-12 col-sm-offset-3">						<a class="edit-link">编辑HTML<a> | 						<a class="remove-link">移除</a></p>').appendTo($el)}else{if($(this)[0]!=$orig.parent()[0]){var $el=$orig.clone().css({"position":"static","left":null,"right":null}).appendTo(this);$orig.remove()}}}}).sortable()};var get_modal=function(content){var modal=$('<div class="modal" style="overflow: auto;" tabindex="-1">	<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a><h4 class="modal-title">编辑HTML</h4></div><div class="modal-body ui-front">	<textarea class="form-control" 	style="min-height: 200px; margin-bottom: 10px;font-family: Monaco, Fixed">'+content+'</textarea><button class="btn btn-success">更新HTML</button></div>				</div></div></div>').appendTo(document.body);return modal};$(document).on("click",".edit-link",function(ev){var $el=$(this).parent().parent();var $el_copy=$el.clone();var $edit_btn=$el_copy.find(".edit-link").parent().remove();var $modal=get_modal(html_beautify($el_copy.html())).modal("show");$modal.find(":input:first").focus();$modal.find(".btn-success").click(function(ev2){var html=$modal.find("textarea").val();if(!html){$el.remove()}else{$el.html(html);$edit_btn.appendTo($el)}$modal.modal("hide");return false})});$(document).on("click",".remove-link",function(ev){$(this).parent().parent().remove()});
        var i = ${size};//属性div
        var rdoIndex = ${rdoIndex<4?4:rdoIndex};//单选项
        var ckbIndex = ${ckbIndex<4?4:ckbIndex};//复选项
        var slcIndex = ${slcIndex<4?4:slcIndex};//下拉选项
        var slmIndex = ${slmIndex<4?4:slmIndex};//下拉复选项
        $(document).ready(function() {
			setup_draggable();
			$("#n-columns").on("change",
			function() {
				var v = $(this).val();
				if (v === "1") {
					var $col = $(".form-body .col-md-12").toggle(true);
					$(".form-body .col-md-6 .draggable").each(function(i, el) {
						$(this).remove().appendTo($col)
					});
					$(".form-body .col-md-6").toggle(false)
				} else {
					var $col = $(".form-body .col-md-6").toggle(true);
					$(".form-body .col-md-12 .draggable").each(function(i, el) {
						$(this).remove().appendTo(i % 2 ? $col[1] : $col[0])
					});
					$(".form-body .col-md-12").toggle(false)
				}
			});
			$("#copy-to-clipboard").on("click",
			function() {
				var $copy = $(".form-body").clone().appendTo(document.body);
				$copy.find(".tools, :hidden").remove();
				$.each(["draggable", "droppable", "sortable", "dropped", "ui-sortable", "ui-draggable", "ui-droppable", "form-body"],
				function(i, c) {
					$copy.find("." + c).removeClass(c).removeAttr("style")
				});
				var html = html_beautify($copy.html());
				$copy.remove();
				$modal = get_modal(html).modal("show");
				$modal.find(".btn").remove();
				$modal.find(".modal-title").html("复制HTML代码");
				$modal.find(":input:first").select().focus();
				return false
			})
		});
		var setup_draggable = function() {
			$(".draggable.szc").draggable({
				appendTo: "body",
				helper: "clone"
			});
			$(".droppable").droppable({
				accept: ".draggable",
				helper: "clone",
				hoverClass: "droppable-active",
				drop: function(event, ui) {
					$(".empty-form").remove();
					var $orig = $(ui.draggable);
					if (!$orig.hasClass("dropped")) {
						var $el = $orig.clone().attr("id","item"+i).addClass("dropped").css({
							"position": "static",
							"left": null,
							"right": null
						}).appendTo(this);
						//单选按钮组
						$el.find("label#lab1").attr("id","item"+i+"_lab1");
						$el.find("label#lab2").attr("id","item"+i+"_lab2");
						$el.find("label#lab3").attr("id","item"+i+"_lab3");
						//下拉列表
						$el.find("option#opt1").attr("id","item"+i+"_opt1");
						$el.find("option#opt2").attr("id","item"+i+"_opt2");
						$el.find("option#opt3").attr("id","item"+i+"_opt3");
						//富文本框
						$el.find("div#editors").attr("id","editors"+i);
						
						//创建相应的属性
						var type = $orig.find("input").attr("type");
						if (type == undefined) {
							var c = $orig.find("#editors").attr("class");
							var area = $orig.find("textarea").attr("class");
							var slc = $orig.find("select").attr("class");
							var date = $orig.find("input").hasClass("layer-date");
							var subform = $orig.find("#subform").attr("class");
							var line = $orig.find("#line").attr("class");
							if(c != undefined){//判断 富文本
								type = "richtext";
							}else if(area != undefined){
								type = "textarea";
							}else if(slc != undefined){
								if($orig.find("select").attr("multiple") != undefined){
									type = "selectmore";
								}else{
									type = "select";
								}
							}else if(date != undefined && date != false){
								type = "date";
							}else if(subform != undefined){
								type = "subform";
							}else if(line != undefined){
								type = "line";
							}else{
								type = "none";
							}
						}else{
							if(type == 'text' && $orig.find("input").attr("name") == 'number'){
								type = "number";
							}
						}
						//根据input类型加载不同的属性
						createProperties("item"+i,type);
						/**
						var id = $orig.find(":input").attr("id");
						if (id) {
							id = id.split("-").slice(0, -1).join("-") + "-" + (parseInt(id.split("-").slice( - 1)[0]) + 1);
							$orig.find(":input").attr("id", id);
							$orig.find("label").attr("for", id)
						}
						$('<p class="tools col-sm-12 col-sm-offset-3"><a class="edit-link">编辑HTML<a> | <a class="remove-link">移除</a></p>').appendTo($el);
						*/
						$('<p class="tools col-sm-12 col-sm-offset-3"><a class="remove-link" onclick="removeLink(\''+'item'+i+'\',\''+type+'\')">移除</a></p>').appendTo($el);
						i++;//自动生成id
					} else {
						if ($(this)[0] != $orig.parent()[0]) {
							var $el = $orig.clone().css({
								"position": "static",
								"left": null,
								"right": null
							}).appendTo(this);
							$orig.remove()
						}
					}
				}
			}).sortable({update:function(event,ui){
				//判断是往上拖还是往下拖
				//当前拖动元素
				var currentObj = $(ui.item);
				var currentNum = Number($("#"+currentObj.attr("id")+"_prop_sort").val());
				var obj = currentObj.next(".form-group.dropped");
				if(obj.attr("id") == undefined){//下拖
					obj = currentObj.prev(".form-group.dropped");
					num = Number($("#"+obj.attr("id")+"_prop_sort").val());
					$("#"+currentObj.attr("id")+"_prop_sort").val(num);
					while(obj.attr("id") != undefined){
						num -= 1;
						$("#"+obj.attr("id")+"_prop_sort").val(num);
						obj = obj.prev(".form-group.dropped");
					}
				}else{
					//后一个元素的序号
					var num = Number($("#"+obj.attr("id")+"_prop_sort").val());
					if(currentNum < num){//下拖
						obj = currentObj.prev(".form-group.dropped");
						num = Number($("#"+obj.attr("id")+"_prop_sort").val());
						$("#"+currentObj.attr("id")+"_prop_sort").val(num);
						while(obj.attr("id") != undefined){
							num -= 1;
							$("#"+obj.attr("id")+"_prop_sort").val(num);
							obj = obj.prev(".form-group.dropped");
						}
					}else{//上托
						$("#"+currentObj.attr("id")+"_prop_sort").val(num);
						while(obj.attr("id") != undefined){
							num += 1;
							$("#"+obj.attr("id")+"_prop_sort").val(num);
							obj = obj.next(".form-group.dropped");
						}
					}
				}
				//当年拖动的元素高亮并显示属性
				changeBgColor(currentObj);
       			var divId = currentObj.attr("id");
       			showHidePropDiv($("#"+divId+"_prop"));
			}});
		};
		var get_modal = function(content) {
			var modal = $('<div class="modal" style="overflow: auto;" tabindex="-1">	<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a><h4 class="modal-title">编辑HTML</h4></div><div class="modal-body ui-front">	<textarea class="form-control" 	style="min-height: 200px; margin-bottom: 10px;font-family: Monaco, Fixed">' + content + '</textarea><button class="btn btn-success">更新HTML</button></div>				</div></div></div>').appendTo(document.body);
			return modal
		};
		$(document).on("click", ".edit-link",
		function(ev) {
			var $el = $(this).parent().parent();
			var $el_copy = $el.clone();
			var $edit_btn = $el_copy.find(".edit-link").parent().remove();
			var $modal = get_modal(html_beautify($el_copy.html())).modal("show");
			$modal.find(":input:first").focus();
			$modal.find(".btn-success").click(function(ev2) {
				var html = $modal.find("textarea").val();
				if (!html) {
					$el.remove()
				} else {
					$el.html(html);
					$edit_btn.appendTo($el)
				}
				$modal.modal("hide");
				return false
			})
		});
		/**
		$(document).on("click", ".remove-link",
		function(ev) {
			//先移除相对应的属性DIV
			var divId = $(this).parent().parent().attr("id");
			$("#"+divId+"_prop").remove();
			//再移除元素
			$(this).parent().parent().remove()
			
			//移除创建标签信息
        	var v = $("#tagNames").val();
			var tag = ";" + divId + "_" + type;
        	v = v.replace(tag,"");
        	$("#tagNames").val(v);
		});
		*/
        
        // 拖拽后点击事件 变色 
        $(document).on("click", ".form-group.dropped",
       		function(ev) {
       			changeBgColor($(this));
       			var divId = $(this).attr("id");
       			showHidePropDiv($("#"+divId+"_prop"));
       		}
        );
        
        function createProperties(id,type){
        	var propertyId = id + "_prop";//创建属性div 的id名
        	//var str = '<div class="form-body" style="display:none;" id="'+propertyId+'">标题:<br/><input type="text" name="s" id="s"><br/>字段名:<br/><input type="text" name="ss" id="ss"><br/>格式：<br/><select  id="aa"><option></option><option>格式1</option><option>格式2</option></select><br/>默认值:<br/><input type="text" name="ss" id="ss"><br/>校验:<br/>&nbsp;&nbsp;<input type="checkbox" name="ck" id="ck">必填<br/>权限:<br/>&nbsp;&nbsp;<input type="checkbox" name="ck" id="ck">可见<br/>&nbsp;&nbsp;<input type="checkbox" name="ck" id="ck">编辑<br/>排序:<br/><input type="text" name="ss" id="ss"></div>';
        	var str = '<div class="form-body" id="'+propertyId+'" style="display:none;">';
        	//根据type封装不同的属性div
        	if(type == 'text'){//文本框
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="文本框" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '格式：<br/>';
                str += '<select name="'+propertyId+'_format" id="'+propertyId+'_format" onchange="updateValue(\'txtFormat\',\''+id+'\')">';
                str += '<option value="">无</option>';
                str += '<option value="email">邮箱</option>';
                str += '<option value="phone">手机号码</option>';
                   str += '<option value="tel">固定电话</option>';
                   str += '<option value="code">邮政编码</option>';
                str += '</select><br/>';
                str += '默认值:<br/><input type="text" name="'+propertyId+'_default" id="'+propertyId+'_default" onblur="updateValue(\'dfValue\',\''+id+'\')"><br/>';
        	}else if(type == 'password'){//密码输入框
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="密码框" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '默认值:<br/><input type="text" name="'+propertyId+'_default" id="'+propertyId+'_default" onblur="updateValue(\'dfValue\',\''+id+'\')"><br/>';
        	}else if(type == 'number'){//数值
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="数值" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
                str += '最小值:<br/><input type="number" name="'+propertyId+'_min"><br/>';
                str += '最大值:<br/><input type="number" name="'+propertyId+'_max"><br/>';
                str += '小数点后几位:<br/><input type="number" name="'+propertyId+'_pre" id="'+propertyId+'_pre" onblur="updateValue(\'precision\',\''+id+'\')"><br/>';
                str += '默认值:<br/><input type="number" name="'+propertyId+'_default" id="'+propertyId+'_default" onblur="updateValue(\'precision\',\''+id+'\')"><br/>';
        	}else if(type == 'textarea'){//多行文本
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="多行文本" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '默认值:<br/><input type="text" name="'+propertyId+'_default" id="'+propertyId+'_default" onblur="updateValue(\'areadfValue\',\''+id+'\')"><br/>';
        	}else if(type == 'richtext'){//富文本
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="富文本编辑器" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '默认值:<br/><input type="text" name="'+propertyId+'_default" id="'+propertyId+'_default" onblur="updateValue(\'richvalue\',\''+id+'\')"><br/>';
        	}else if(type == 'radio'){//单选按钮组
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="单选按钮组" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
                str += '排列格式：<br/>';
                str += '<select id="'+propertyId+'_format" name="'+propertyId+'_format" onchange="updateValue(\'checkFormat\',\''+id+'\')">';
                str += '<option value="hengpai">横排</option>';
                str += '<option value="shupai">竖排</option>';
                str += '</select><br/>';
                str += '选项：<br/>';
        		str += '<div id="'+propertyId+'_rdoItemDiv">';
        		str += '<span id="'+propertyId+'_rdoItem1_span"><input type="radio" name="'+propertyId+'_rdo" value="1" onclick="updateValue(\'isCheckRdo\',\''+id+'_1\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_rdoItem1" value="选项1" id="'+propertyId+'_rdoItem1" onblur="updateValue(\'rdoTitle\',\''+id+'_1\')"><br/></span>';
        		str += '<span id="'+propertyId+'_rdoItem2_span"><input type="radio" name="'+propertyId+'_rdo" value="2" onclick="updateValue(\'isCheckRdo\',\''+id+'_2\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_rdoItem2" value="选项2" id="'+propertyId+'_rdoItem2" onblur="updateValue(\'rdoTitle\',\''+id+'_2\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_rdoItem2_span\',\'2\',\'radio\')" title="移除">×</a><br/></span>';
        		str += '<span id="'+propertyId+'_rdoItem3_span"><input type="radio" name="'+propertyId+'_rdo" value="3" onclick="updateValue(\'isCheckRdo\',\''+id+'_3\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_rdoItem3" value="选项3" id="'+propertyId+'_rdoItem3" onblur="updateValue(\'rdoTitle\',\''+id+'_3\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_rdoItem3_span\',\'3\',\'radio\')" title="移除">×</a><br/></span>';
        		str += '</div>';
        		str += '<a href="javascript:void(0);" onclick="addItem(\''+id+'\',\'radio\')">增加选项</a>&nbsp;&nbsp;';
        		str += '<a href="javascript:void(0);" onclick="addItem(\''+id+'\',\'rdoOther\')">其他(自定义)</a><br/>';
        	}else if(type == 'checkbox'){//复选框
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="复选按钮组" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
                str += '排列格式：<br/>';
                str += '<select id="'+propertyId+'_format" name="'+propertyId+'_format" onchange="updateValue(\'checkFormat\',\''+id+'\')">';
                str += '<option value="hengpai">横排</option>';
                str += '<option value="shupai">竖排</option>';
                str += '</select><br/>';
                str += '选项：<br/>';
        		str += '<div id="'+propertyId+'_ckbItemDiv">';
        		str += '<span id="'+propertyId+'_ckbItem1_span"><input type="checkbox" id="'+propertyId+'_ckb1" name="'+propertyId+'_ckb" value="1" onclick="updateValue(\'isCheckCkb\',\''+id+'_1\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_ckbItem1" value="选项1" id="'+propertyId+'_ckbItem1" onblur="updateValue(\'ckbTitle\',\''+id+'_1\')"><br/></span>';
        		str += '<span id="'+propertyId+'_ckbItem2_span"><input type="checkbox" id="'+propertyId+'_ckb2" name="'+propertyId+'_ckb" value="2" onclick="updateValue(\'isCheckCkb\',\''+id+'_2\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_ckbItem2" value="选项2" id="'+propertyId+'_ckbItem2" onblur="updateValue(\'ckbTitle\',\''+id+'_2\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_ckbItem2_span\',\'2\',\'checkbox\')" title="移除">×</a><br/></span>';
        		str += '<span id="'+propertyId+'_ckbItem3_span"><input type="checkbox" id="'+propertyId+'_ckb3" name="'+propertyId+'_ckb" value="3" onclick="updateValue(\'isCheckCkb\',\''+id+'_3\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_ckbItem3" value="选项3" id="'+propertyId+'_ckbItem3" onblur="updateValue(\'ckbTitle\',\''+id+'_3\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_ckbItem3_span\',\'3\',\'checkbox\')" title="移除">×</a><br/></span>';
        		str += '</div>';
        		str += '<a href="javascript:void(0);" onclick="addItem(\''+id+'\',\'checkbox\')">增加选项</a>&nbsp;&nbsp;';
        		str += '<a href="javascript:void(0);" onclick="addItem(\''+id+'\',\'cbxOther\')">其他(自定义)</a><br/>';
        	}else if(type == 'select'){//下拉列表
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="下拉列表" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '选项：<br/>';
        		str += '<div id="'+propertyId+'_slcItemDiv">';
        		str += '<span id="'+propertyId+'_slcItem1_span"><input type="radio" name="'+propertyId+'_slc" value="1" onclick="updateValue(\'isCheckSlc\',\''+id+'_1\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_slcItem1" value="选项1" id="'+propertyId+'_slcItem1" onblur="updateValue(\'slcTitle\',\''+id+'_1\')"><br/></span>';
        		str += '<span id="'+propertyId+'_slcItem2_span"><input type="radio" name="'+propertyId+'_slc" value="2" onclick="updateValue(\'isCheckSlc\',\''+id+'_2\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_slcItem2" value="选项2" id="'+propertyId+'_slcItem2" onblur="updateValue(\'slcTitle\',\''+id+'_2\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_slcItem2_span\',\'2\',\'select\')" title="移除">×</a><br/></span>';
        		str += '<span id="'+propertyId+'_slcItem3_span"><input type="radio" name="'+propertyId+'_slc" value="3" onclick="updateValue(\'isCheckSlc\',\''+id+'_3\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_slcItem3" value="选项3" id="'+propertyId+'_slcItem3" onblur="updateValue(\'slcTitle\',\''+id+'_3\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_slcItem3_span\',\'3\',\'select\')" title="移除">×</a><br/></span>';
        		str += '</div>';
        		str += '<a href="javascript:void(0);" onclick="addItem(\''+id+'\',\'select\')">增加选项</a><br/>';
        	}else if(type == 'selectmore'){//下拉复选列表
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="下拉复选列表" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '选项：<br/>';
        		str += '<div id="'+propertyId+'_slmItemDiv">';
        		str += '<span id="'+propertyId+'_slmItem1_span"><input type="checkbox" id="'+propertyId+'_slm1" name="'+propertyId+'_slm" value="1" onclick="updateValue(\'isCheckSlm\',\''+id+'_1\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_slmItem1" value="选项1" id="'+propertyId+'_slmItem1" onblur="updateValue(\'slmTitle\',\''+id+'_1\')"><br/></span>';
        		str += '<span id="'+propertyId+'_slmItem2_span"><input type="checkbox" id="'+propertyId+'_slm2" name="'+propertyId+'_slm" value="2" onclick="updateValue(\'isCheckSlm\',\''+id+'_2\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_slmItem2" value="选项2" id="'+propertyId+'_slmItem2" onblur="updateValue(\'slmTitle\',\''+id+'_2\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_slmItem2_span\',\'2\',\'selectMore\')" title="移除">×</a><br/></span>';
        		str += '<span id="'+propertyId+'_slmItem3_span"><input type="checkbox" id="'+propertyId+'_slm3" name="'+propertyId+'_slm" value="3" onclick="updateValue(\'isCheckSlm\',\''+id+'_3\')">&nbsp;<input type="text" style="width:120px;" name="'+propertyId+'_slmItem3" value="选项3" id="'+propertyId+'_slmItem3" onblur="updateValue(\'slmTitle\',\''+id+'_3\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_slmItem3_span\',\'3\',\'selectMore\')" title="移除">×</a><br/></span>';
        		str += '</div>';
        		str += '<a href="javascript:void(0);" onclick="addItem(\''+id+'\',\'selectMore\')">增加选项</a><br/>';
        	}else if(type == 'date'){//日期时间
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="日期时间" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '类型：<br/>';
                str += '<select id="'+propertyId+'_format" name="'+propertyId+'_format" onchange="updateValue(\'dateFormat\',\''+id+'\')">';
                str += '<option value="ymdhms">年-月-日 时:分:秒</option>';
                str += '<option value="ymdhm">年-月-日 时:分</option>';
                str += '<option value="ymd">年-月-日</option>';
                str += '<option value="ym">年-月</option>';
                //str += '<option value="hms">时:分:秒</option>';
                //str += '<option value="hm">时:分</option>';
                str += '</select><br/>';
        		str += '默认值:<br/><input type="text" name="'+propertyId+'_default" id="'+propertyId+'_default" onblur="updateValue(\'dfValue\',\''+id+'\')"><br/>';
        	}else if(type == 'hidden'){//隐藏域
        		//str += '标题:<br/><input type="text" name="'+propertyId+'_title"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '默认值:<br/><input type="text" name="'+propertyId+'_default" id="'+propertyId+'_default" onblur="updateValue(\'dfValue\',\''+id+'\')"><br/>';
        	}else if(type == 'file'){//文本域
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="文件上传" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        	}else if(type == 'subform'){//子表单
        		str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="子表单" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
        		str += '选择模板表单:<br/><input type="text" name="'+propertyId+'_form" value="待开发"><br/>';
        	}else if(type == 'line'){//分隔符
        		//str += '标题:<br/><input type="text" name="'+propertyId+'_title" value="分隔线" id="'+propertyId+'_title" onblur="updateValue(\'title\',\''+id+'\')"><br/>';
                //str += '字段名:<br/><input type="text" name="'+propertyId+'_filedName"><br/>';
                str += '类型：<br/>';
                str += '<select id="'+propertyId+'_format" name="'+propertyId+'_format" onchange="updateValue(\'lineType\',\''+id+'\')">';
                str += '<option value="dashed">虚线</option>';
                str += '<option value="solid">实线</option>';
                str += '</select><br/>';
                $("#"+id+" label").remove();
                $("#"+id+" div.col-sm-9").attr("class","col-sm-12");
        	}
        	str += '说明文字:<br/><input type="text" name="'+propertyId+'_des" id="'+propertyId+'_des" onblur="updateValue(\'des\',\''+id+'\')"><br/>';
        	if(type != 'line'){
	        	str += '校验:<br/>&nbsp;&nbsp;<input type="checkbox" value="1" name="'+propertyId+'_check">必填<br/>';
	            str += '权限:<br/>&nbsp;&nbsp;<input type="checkbox" value="show" name="'+propertyId+'_show" checked>可见<br/>';
	            str += '&nbsp;&nbsp;<input type="checkbox" value="edit" name="'+propertyId+'_edit" checked>编辑<br/>';
        	}
            str += '排序:<br/><input type="text" readOnly name="'+propertyId+'_sort" id="'+propertyId+'_sort" value="'+(i)+'"></div>';
            
        	$(str).appendTo($("#propDiv"));
        	
        	//存储创建标签信息
        	var v = $("#tagNames").val();
        	v += ";" + id + "_" + type;
        	$("#tagNames").val(v);
        		
        	showHidePropDiv($("#"+propertyId));
        	changeBgColor($("#"+id));
        }
        
        //选中div 背景色加亮
        function changeBgColor(obj){
        	//选中背景色加深操作
        	$(".form-group.dropped").each(function() {//清空所有拖拽过来的元素背景色
   				$(this).css("background-color", "");
   			});
        	$(obj).css("background-color", "#CEF4FD");//给选中的元素增加背景色加深
        }
        //选中div显示所属属性div，并隐藏其他
        function showHidePropDiv(obj){
        	$("#propDiv .form-body").each(function(){//隐藏所有的存放属性的div
   				$(this).hide();
   			});
        	$(obj).show();//显示选中的元素 所关联的属性div
        }
        
        function removeLink(id,type){
        	//先移除相对应的属性DIV
			$("#"+id+"_prop").remove();
			//再移除元素
			$("#"+id).remove();
			
			//移除创建标签信息
        	var v = $("#tagNames").val();
			var tag = ";" + id + "_" + type;
        	v = v.replace(tag,"");
        	$("#tagNames").val(v);
        }
        
        function updateValue(type,id){
        	if(type=='title'){
	        	$("#"+id+" label.control-label").html($("#"+id+"_prop_title").val()+"：");
        	}else if(type=='txtFormat'){
        		var v = $("#"+id+"_prop_format").val();
        		if(v == 'email'){
        			$("#"+id+" input.form-control").attr("placeholder","请输入邮箱格式文本");
        		}else if(v == 'phone'){
        			$("#"+id+" input.form-control").attr("placeholder","请输入手机号码格式文本");
        		}else if(v == 'tel'){
        			$("#"+id+" input.form-control").attr("placeholder","请输入固定电话格式文本");
        		}else if(v == 'code'){
        			$("#"+id+" input.form-control").attr("placeholder","请输入邮编格式文本");
        		}else{
        			$("#"+id+" input.form-control").attr("placeholder","请输入文本");
        		}
        	}else if(type=='precision'){
        		var pre = $("#"+id+"_prop_pre").val();
        		var df = $("#"+id+"_prop_default").val();
        		if(pre == ''){
        			pre = 0;
        		}
        		if(df == ''){
        			df = 0;
        		}
        		$("#"+id+" input.form-control").val(Number(df).toFixed(pre));
        	}else if(type=='dfValue'){//默认值
        		$("#"+id+" input.form-control").val($("#"+id+"_prop_default").val());
        	}else if(type=='areadfValue'){//多行文本默认值
        		$("#"+id+" textarea.form-control").val($("#"+id+"_prop_default").val());
        	}else if(type=='rdoTitle'){//选项名称 --单选按钮组
        		var array = id.split("_");
        		$("#"+array[0]+"_lab"+array[1]+" font").html($("#"+array[0]+"_prop_rdoItem"+array[1]).val());
        	}else if(type=='isCheckRdo'){//选中事件 -单选按钮组
        		var array = id.split("_");
        		//重置所有单选选项勾选状态
        		$("#"+array[0]+" .iradio_square-green").each(function(){
        			$(this).attr("class","iradio_square-green");
        		});
        		//关联勾选状态
        		$("#"+array[0]+"_lab"+array[1]+" .iradio_square-green").attr("class","iradio_square-green checked");
        	}else if(type=='ckbTitle'){//选项名称 -复选按钮组
        		var array = id.split("_");
        		$("#"+array[0]+"_lab"+array[1]+" font").html($("#"+array[0]+"_prop_ckbItem"+array[1]).val());
        	}else if(type=='isCheckCkb'){//选中事件 -复选按钮组
        		var array = id.split("_");
        		//重置所有单选选项勾选状态
        		if($("#"+array[0]+"_prop_ckb"+array[1]).is(':checked')){
	        		//关联勾选状态
	        		$("#"+array[0]+"_lab"+array[1]+" .icheckbox_square-green").attr("class","icheckbox_square-green checked");
        		}else{
        			$("#"+array[0]+"_lab"+array[1]+" .icheckbox_square-green").attr("class","icheckbox_square-green");
        		}
        	}else if(type=='slcTitle'){//选项名称 -下拉列表选项
        		var array = id.split("_");
        		$("#"+array[0]+"_opt"+array[1]+"").html($("#"+array[0]+"_prop_slcItem"+array[1]).val());
        	}else if(type=='isCheckSlc'){//选中事件 -下拉列表选项
        		var array = id.split("_");
        		//重置所有选项选中状态
        		$("#"+array[0]+" option").removeAttr('selected');
        		//关联勾选状态
        		$("#"+array[0]+"_opt"+array[1]).attr('selected',true);
        		$("#"+array[0]+"_opt"+array[1]).prop('selected',true);
        	}else if(type=='slmTitle'){//选项名称 -下拉复选列表选项
        		var array = id.split("_");
        		$("#"+array[0]+"_opt"+array[1]+"").html($("#"+array[0]+"_prop_slmItem"+array[1]).val());
        	}else if(type=='isCheckSlm'){//选中事件 -下拉复选列表选项
        		var array = id.split("_");
        		//重置所有选项选中状态
        		if($("#"+array[0]+"_prop_slm"+array[1]).is(':checked')){
	        		$("#"+array[0]+"_opt"+array[1]).attr('selected',true);
	        		$("#"+array[0]+"_opt"+array[1]).prop('selected',true);
        		}else{
	        		//关联勾选状态
        			$("#"+array[0]+"_opt"+array[1]).removeAttr('selected');
        		}
        	}else if(type=='dateFormat'){
        		var dateFormat = $("#"+id+"_prop_format").val();
        		if(dateFormat == 'ymdhms'){
        			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})");
        		}else if(dateFormat == 'ymdhm'){
        			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: true, format: 'YYYY-MM-DD hh:mm'})");
        		}else if(dateFormat == 'ymd'){
        			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: false, format: 'YYYY-MM-DD'})");
        		}else if(dateFormat == 'ym'){
        			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: false, format: 'YYYY-MM'})");
        		}else if(dateFormat == 'hms'){
        			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: true, format: 'hh:mm:ss'})");
        		}else if(dateFormat == 'hm'){
        			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: true, format: 'hh:mm'})");
        		}
        	}else if(type=='des'){//说明文字
        		var desContent = $("#"+id+"_prop_des").val();
        		$("#"+id+" span.help-block.m-b-none").html(desContent);
        	}else if(type=='lineType'){//分割线类型
        		var lineType = $("#"+id+"_prop_format").val();
        		if(lineType == 'dashed'){
        			$("#"+id+" div#line").attr("class","hr-line-dashed");
        		}else if(lineType == 'solid'){
        			$("#"+id+" div#line").attr("class","hr-line-solid");
        		}
        	}else if(type == 'checkFormat'){
        		var rdoFormat = $("#"+id+"_prop_format").val();
        		$("#"+id+" label").each(function(){
        			if(rdoFormat == "shupai"){
	        			if($(this).attr("id") != undefined){
	        				$(this).before("<br/>");
	        			}
        			}else if(rdoFormat == "hengpai"){
        				$("#"+id).find("br").remove();
        			}
        		});
        	}
        }
       
     //增加选项
     function addItem(id,type){
    	 if(type=="radio"){
	    	 var propertyId = id + "_prop";
	    	 var str = '<span id="'+propertyId+'_rdoItem'+rdoIndex+'_span"><input type="radio" name="'+propertyId+'_rdo" value="'+rdoIndex+'" onclick="updateValue(\'isCheckRdo\',\''+id+'_'+rdoIndex+'\')">&nbsp;<input style="width:120px;" type="text" name="'+propertyId+'_rdoItem'+rdoIndex+'" value="选项" id="'+propertyId+'_rdoItem'+rdoIndex+'" onblur="updateValue(\'rdoTitle\',\''+id+'_'+rdoIndex+'\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_rdoItem'+rdoIndex+'_span\',\''+rdoIndex+'\',\'radio\')" title="移除">×</a><br/></span>';
	    	 $(str).appendTo($("#"+propertyId+"_rdoItemDiv"));
	    	 //根据选择排列格式
    		 var format = $("#"+propertyId+"_format").val();
			 if(format == "shupai"){
				 str = "<br/>";		 
			 }else{
				 str = "";//初始化
			 }
	    	 str += '<label id="'+id+'_lab'+rdoIndex+'"><div style="position: relative;" class="iradio_square-green">';
	    	 str += '<input style="position: absolute; opacity: 0;" type="radio" value="选项" name="rdobox">';
	    	 str += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	    	 str += '<i></i> <font>选项</font></label>';
	    	 $(str).appendTo($("#"+id+" div.radio.i-checks"));
	    	 rdoIndex++;
    	 }else if(type=="rdoOther"){//单选按钮组 其他可输入
    		 var propertyId = id + "_prop";
	    	 var str = '<span id="'+propertyId+'_rdoItem'+rdoIndex+'_span"><input type="radio" name="'+propertyId+'_rdo" value="'+rdoIndex+'" onclick="updateValue(\'isCheckRdo\',\''+id+'_'+rdoIndex+'\')">&nbsp;<input style="width:120px;" type="text" name="'+propertyId+'_rdoItem'+rdoIndex+'" value="其他" readOnly id="'+propertyId+'_rdoItem'+rdoIndex+'" onblur="updateValue(\'rdoTitle\',\''+id+'_'+rdoIndex+'\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_rdoItem'+rdoIndex+'_span\',\''+rdoIndex+'\',\'radio\')" title="移除">×</a><br/></span>';
	    	 $(str).appendTo($("#"+propertyId+"_rdoItemDiv"));
	    	//根据选择排列格式
    		 var format = $("#"+propertyId+"_format").val();
			 if(format == "shupai"){
				 str = "<br/>";		 
			 }else{
				 str = "";//初始化
			 }
	    	 str += '<label id="'+id+'_lab'+rdoIndex+'"><div style="position: relative;" class="iradio_square-green">';
	    	 str += '<input style="position: absolute; opacity: 0;" type="radio" value="其他" name="rdobox">';
	    	 str += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	    	 str += '<i></i> <font>其他</font>&nbsp;<input type="text" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></label>';
	    	 $(str).appendTo($("#"+id+" div.radio.i-checks"));
	    	 rdoIndex++;
    	 }else if(type=="checkbox"){
	    	 var propertyId = id + "_prop";
	    	 var str = '<span id="'+propertyId+'_ckbItem'+ckbIndex+'_span"><input type="checkbox" id="'+propertyId+'_ckb'+ckbIndex+'" name="'+propertyId+'_ckb" value="'+ckbIndex+'" onclick="updateValue(\'isCheckCkb\',\''+id+'_'+ckbIndex+'\')">&nbsp;<input style="width:120px;" type="text" name="'+propertyId+'_ckbItem'+ckbIndex+'" value="选项" id="'+propertyId+'_ckbItem'+ckbIndex+'" onblur="updateValue(\'ckbTitle\',\''+id+'_'+ckbIndex+'\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_ckbItem'+ckbIndex+'_span\',\''+ckbIndex+'\',\'checkbox\')" title="移除">×</a><br/></span>';
	    	 $(str).appendTo($("#"+propertyId+"_ckbItemDiv"));
	    	//根据选择排列格式
    		 var format = $("#"+propertyId+"_format").val();
			 if(format == "shupai"){
				 str = "<br/>";		 
			 }else{
				 str = "";//初始化
			 }
	    	 str += '<label id="'+id+'_lab'+ckbIndex+'"><div style="position: relative;" class="icheckbox_square-green">';
	    	 str += '<input style="position: absolute; opacity: 0;" value="选项" name="ckbox" type="checkbox">';
	    	 str += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	    	 str += '<i></i> <font>选项</font></label>';
	    	 $(str).appendTo($("#"+id+" div.checkbox.i-checks"));
	    	 ckbIndex++;
    	 }else if(type=="cbxOther"){
	    	 var propertyId = id + "_prop";
	    	 var str = '<span id="'+propertyId+'_ckbItem'+ckbIndex+'_span"><input type="checkbox" id="'+propertyId+'_ckb'+ckbIndex+'" name="'+propertyId+'_ckb" value="'+ckbIndex+'" onclick="updateValue(\'isCheckCkb\',\''+id+'_'+ckbIndex+'\')">&nbsp;<input style="width:120px;" type="text" name="'+propertyId+'_ckbItem'+ckbIndex+'" value="其他" id="'+propertyId+'_ckbItem'+ckbIndex+'" readOnly onblur="updateValue(\'ckbTitle\',\''+id+'_'+ckbIndex+'\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_ckbItem'+ckbIndex+'_span\',\''+ckbIndex+'\',\'checkbox\')" title="移除">×</a><br/></span>';
	    	 $(str).appendTo($("#"+propertyId+"_ckbItemDiv"));
	    	//根据选择排列格式
    		 var format = $("#"+propertyId+"_format").val();
			 if(format == "shupai"){
				 str = "<br/>";		 
			 }else{
				 str = "";//初始化
			 }
	    	 str += '<label id="'+id+'_lab'+ckbIndex+'"><div style="position: relative;" class="icheckbox_square-green">';
	    	 str += '<input style="position: absolute; opacity: 0;" value="其他" name="ckbox" type="checkbox">';
	    	 str += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	    	 str += '<i></i> <font>其他</font>&nbsp;<input type="text" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></label>';
	    	 $(str).appendTo($("#"+id+" div.checkbox.i-checks"));
	    	 ckbIndex++;
    	 }else if(type=="select"){
    		 var propertyId = id + "_prop";
    		 var str = '<span id="'+propertyId+'_slcItem'+slcIndex+'_span"><input type="radio" id="'+propertyId+'_slc'+slcIndex+'" name="'+propertyId+'_slc" value="'+slcIndex+'" onclick="updateValue(\'isCheckSlc\',\''+id+'_'+slcIndex+'\')">&nbsp;<input style="width:120px;" type="text" name="'+propertyId+'_slcItem'+slcIndex+'" value="选项" id="'+propertyId+'_slcItem'+slcIndex+'" onblur="updateValue(\'slcTitle\',\''+id+'_'+slcIndex+'\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_slcItem'+slcIndex+'_span\',\''+slcIndex+'\',\'select\')" title="移除">×</a><br/></span>';
	    	 $(str).appendTo($("#"+propertyId+"_slcItemDiv"));
	    	 str = '<option id="'+id+'_opt'+slcIndex+'">选项</option>';
	    	 $(str).appendTo($("#"+id+" select"));
	    	 slcIndex++;
    	 }else if(type=="selectMore"){
    		 var propertyId = id + "_prop";
    		 var str = '<span id="'+propertyId+'_slmItem'+slmIndex+'_span"><input type="checkbox" id="'+propertyId+'_slm'+slmIndex+'" name="'+propertyId+'_slm" value="'+slmIndex+'" onclick="updateValue(\'isCheckSlm\',\''+id+'_'+slmIndex+'\')">&nbsp;<input style="width:120px;" type="text" name="'+propertyId+'_slmItem'+slmIndex+'" value="选项" id="'+propertyId+'_slmItem'+slmIndex+'" onblur="updateValue(\'slmTitle\',\''+id+'_'+slmIndex+'\')">&nbsp;<a href="javascript:void(0);" onclick="removeItem(\''+id+'\',\''+propertyId+'_slmItem'+slmIndex+'_span\',\''+slmIndex+'\',\'selectMore\')" title="移除">×</a><br/></span>';
	    	 $(str).appendTo($("#"+propertyId+"_slmItemDiv"));
	    	 str = '<option id="'+id+'_opt'+slmIndex+'">选项</option>';
	    	 $(str).appendTo($("#"+id+" select"));
	    	 slmIndex++;
    	 }
     }
     
     //移除选项
     function removeItem(id,propertyId,index,type){
    	 if(type=="radio"){
	    	 $("#"+propertyId).remove();
	    	 $("#"+id+"_lab"+index).remove();
    	 }else if(type=="checkbox"){
    		 $("#"+propertyId).remove();
	    	 $("#"+id+"_lab"+index).remove();
    	 }else if(type=="select"){
    		 $("#"+propertyId).remove();
    		 $("#"+id+"_opt"+index).remove();
    	 }else if(type=="selectMore"){
    		 $("#"+propertyId).remove();
    		 $("#"+id+"_opt"+index).remove();
    	 }
     }
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
			   ue = UE.getEditor('editors');
			   ue.addListener("ready", function () {
				    //ue.setContent( "000000000000000");
			   });
			   
			   $("div.col-md-12 .editorsSzc").each(function(){
				   ue = UE.getEditor($(this).attr("id"));
				   ue.addListener("ready", function () {
				   });
			   });
		});   
	</script> 
	<script>
		$(function() {
			//提交按钮
			$("#saveBtn").click(function() {
				$("#form").submit();
			});
			//返回按钮
			$("#cancelBtn").click(function() {
				$("#form").attr("action","${ctx}/formTemplate/list").submit();
				return false;
			});
		});
		function submitForm(){
			//解绑离开事件
			window.onbeforeunload = null;
			var f  =document.getElementById("valueForm");
			f.action = "${ctx}/formInput/save";
			
			var indexNum = new Array();
			indexNum[0] = rdoIndex;
			indexNum[1] = ckbIndex;
			indexNum[2] = slcIndex;
			indexNum[3] = slmIndex;
			var max = 0;
			for(var i = 0; i < indexNum.length;i++){
				if(indexNum[i] > max){
					max = indexNum[i];
				}
			}
			max++;
			$("#maxIndex").val(max);
			
			f.submit();
			return false;
		}
		function toConfigInputItemsPage(id){
			window.location.href="${ctx}/formTemplate/createInputItems?id="+id;
			return false;
		}
		window.onbeforeunload = function(){ return "您确定要退出页面吗？";} 
		
		function preview(){
			var viewDiv = $("#tzDiv").clone();
			$(viewDiv).find("p.tools").remove();
			var k = 1;
			//去除class 作用：去除div的单击事件
			$(viewDiv).find(".form-group.dropped").removeClass("dropped");
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
	</script>
</body>
</html>
