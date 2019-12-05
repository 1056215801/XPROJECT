<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<%@ include file="styleForAuto2.jsp"%>
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
 	.test{width:40px;}
 	input[type="number"]{-moz-appearance:textfield;}
 	
 	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button{
	    -webkit-appearance: none !important;
	    margin: 0; 
	}
	
	.survey_subject {
		font-weight:bold;
		margin-top:20px;
	}
	.clickBg{
		background-color: #CEF4FD;
	}
	.overBg{
		background-color: #F7F7F7;
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
            <div id="fx-frame-west">
				<div class="frame-inner-list">
					<div class="widget-cate">
						基础字段
					</div>
					<ul>
						<li class="form-edit-widget-label draggable szc" xtype="text">
							<a>
								<i class="icon-widget-text">
								</i>
								<span>
									单行文本
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="textarea">
							<a>
								<i class="icon-widget-textarea">
								</i>
								<span>
									多行文本
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="password">
							<a>
								<i class="icon-widget-password">
								</i>
								<span>
									密码框
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="richtext">
							<a>
								<i class="icon-widget-richtext">
								</i>
								<span>
									富文本
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="number">
							<a>
								<i class="icon-widget-number">
								</i>
								<span>
									数字
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="date">
							<a>
								<i class="icon-widget-datetime">
								</i>
								<span>
									日期时间
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="radio">
							<a>
								<i class="icon-widget-radiogroup">
								</i>
								<span>
									单选按钮组
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="checkbox">
							<a>
								<i class="icon-widget-checkboxgroup">
								</i>
								<span>
									复选框组
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="select">
							<a>
								<i class="icon-widget-combo">
								</i>
								<span>
									下拉框
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="selectmore">
							<a>
								<i class="icon-widget-combocheck">
								</i>
								<span>
									下拉复选框
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="line">
							<a>
								<i class="icon-widget-separator">
								</i>
								<span>
									分割线
								</span>
							</a>
						</li>
					</ul>
					<div class="widget-cate">
						增强字段
					</div>
					<ul>
						<!-- 
						<li class="form-edit-widget-label draggable szc" xtype="address">
							<a>
								<i class="icon-widget-address">
								</i>
								<span>
									地址
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="location">
							<a>
								<i class="icon-widget-location">
								</i>
								<span>
									定位
								</span>
							</a>
						</li>
						 -->
						<li class="form-edit-widget-label draggable szc" xtype="file">
							<a>
								<i class="icon-widget-upload">
								</i>
								<span>
									文件上传
								</span>
							</a>
						</li>
						<!-- 
						<li class="form-edit-widget-label draggable szc" xtype="hidden">
							<a>
								<i class="icon-widget-hidden">
								</i>
								<span>
									隐藏域
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="subform">
							<a>
								<i class="icon-widget-subform">
								</i>
								<span>
									子表单
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="linkquery">
							<a>
								<i class="icon-widget-linkquery">
								</i>
								<span>
									关联查询
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="linkdata">
							<a>
								<i class="icon-widget-linkdata">
								</i>
								<span>
									关联数据
								</span>
							</a>
						</li>
						 -->
					</ul>
					<!-- 
					<div class="widget-cate">
						部门成员字段
					</div>
					<ul>
						<li class="form-edit-widget-label draggable szc" xtype="user">
							<a>
								<i class="icon-widget-user">
								</i>
								<span>
									成员单选
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="usergroup">
							<a>
								<i class="icon-widget-usergroup">
								</i>
								<span>
									成员多选
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="dept">
							<a>
								<i class="icon-widget-dept">
								</i>
								<span>
									部门单选
								</span>
							</a>
						</li>
						<li class="form-edit-widget-label draggable szc" xtype="deptgroup">
							<a>
								<i class="icon-widget-deptgroup">
								</i>
								<span>
									部门多选
								</span>
							</a>
						</li>
					</ul> -->
				</div>
			</div>
			<div id="fx-frame-right">
				<div class="form-tab-select" id="fx-frame-east">
					<div class="config-tab">
						<div class="widget-tab" onclick="changePane('widget')">
							控件属性
						</div>
						<div class="form-tab" onclick="changePane('form')">
							表单属性
						</div>
					</div>
					<form name="valueForm" id="valueForm" method="post">
					<div class="config-content">
						<input type="hidden" name="tagNames" id="tagNames" value="${tagNames}">
						<input type="hidden" name="templateId" id="templateId" value="${formTemplate.id}">
						<input type="hidden" name="maxIndex" id="maxIndex">
						<input type="hidden" name="formLayout" id="formLayout" value="${formTemplate.formLayout==null?'h':formTemplate.formLayout}"/>
						<div id="widget-config-pane" >
							<!-- 插入控件属性div -->
							<!-- 编辑时,读取控件对应的属性 -->
							<c:forEach items="${inputList}" var="item" varStatus="k">
								<div class="fx_config_pane" id="item${k.index+1}_prop" style="display:none;">
								<c:if test="${item.inputType=='text'}">
									<div class="cfg_title">
										<span>标题</span>
										<div class="cfg_widget_type">
											<span>单行文本</span>
										</div>
									</div>
									<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
										<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
									</div>
									<div class="cfg_split"></div>
									<div class="cfg_title">
										<span>描述信息</span>
									</div>
									<div class="cfg_content x-richtext" style="width: 240px;">
										<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
									</div>
									<div class="cfg_split"></div>
									<div class="cfg_title">
										<span>格式</span>
									</div>
									<div class="cfg_content fui_combo" style="width: 240px; height: 30px; line-height: 28px;">
										<select class="fui_trigger-input" name="item${k.index+1}_prop_format" id="item${k.index+1}_prop_format" onchange="updateValue('txtFormat','item${k.index+1}')">
											<option value="">无</option>
							                <option value="email" ${item.dataFormat=='email'?'selected':''}>邮箱</option>
							                <option value="phone" ${item.dataFormat=='phone'?'selected':''}>手机号码</option>
						                    <option value="tel" ${item.dataFormat=='tel'?'selected':''}>固定电话</option>
						                    <option value="code" ${item.dataFormat=='code'?'selected':''}>邮政编码</option>
										</select>
									</div>
									<div class="cfg_split"></div>
									<div class="cfg_title">
										<span>默认值</span>
									</div>
									<div class="cfg_content fui_text" widgetname="defaultInput" style="width: 240px; height: 30px;">
										<input class="x-input" type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')">
									</div>
								</c:if>
								<c:if test="${item.inputType=='password'}">
									<div class="cfg_title">
					            		<span>标题</span>
						            	<div class="cfg_widget_type">
						            		<span>密码文本</span>
						            	</div>
					            	</div>
					            	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>默认值</span></div>
					            	<div class="cfg_content fui_text" widgetname="defaultInput" style="width: 240px; height: 30px;">
										<input class="x-input" type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')">
									</div>
								</c:if>
								<!-- 数值 -->
	                       		<c:if test="${item.inputType=='number'}">
	                       			<div class="cfg_title">
						            	<span>标题</span>
						            	<div class="cfg_widget_type">
						            		<span>数字</span>
						            	</div>
						            </div>
						            <div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>最小值</span></div>
					            	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" type="text" name="item${k.index+1}_prop_min" value="${item.minValue}"/>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>最大值</span></div>
					            	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" type="text" name="item${k.index+1}_prop_max" value="${item.maxValue}"/>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>小数点后几位</span></div>
					            	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" type="text" name="item${k.index+1}_prop_pre" value="${item.precision}" id="item${k.index+1}_prop_pre" onblur="updateValue('precision','item${k.index+1}')"/>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>默认值</span></div>
					            	<div class="cfg_content fui_text" widgetname="defaultInput" style="width: 240px; height: 30px;">
										<input class="x-input" type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')">
									</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='textarea'}">
	                       			<div class="cfg_title">
					            		<span>标题</span>
					            		<div class="cfg_widget_type"><span>多行文本</span></div>
					            	</div>
					            	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>默认值</span></div>
					            	<div class="cfg_content fui_text" widgetname="defaultInput" style="width: 240px; height: 30px;">
										<input class="x-input" type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')">
									</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='richtext'}">
	                       			<div class="cfg_title">
						            	<span>标题</span>
						            	<div class="cfg_widget_type"><span>富文本</span></div>
						            </div>
						            <div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>默认值</span></div>
					            	<div class="cfg_content fui_text" widgetname="defaultInput" style="width: 240px; height: 30px;">
										<input class="x-input" type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')">
									</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='radio'}">
	                       			<div class="cfg_title">
							         	<span>标题</span>
							         	<div class="cfg_widget_type"><span>单选按钮组</span></div>
							         </div>
							         <div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>选项</span></div>
					            	<div class="cfg_content fx_selection_pane">
						            	<div id="item${k.index+1}_prop_rdoItemDiv">
						            		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
						            			<div class="radio i-checks" id="item${k.index+1}_prop_rdoItem${j.index+1}_div">
									            	<label>
										            	<input type="radio" name="item${k.index+1}_prop_rdo" value="${j.index+1}" ${fn:contains(item.defaultValue,it)?'checked':''}>
										            	<i></i><font>
										            	<input type="text" class="x-input" style="width: 180px; height:30px; display: inline;" name="item${k.index+1}_prop_rdoItem${j.index+1}" value="${it}" id="item${k.index+1}_prop_rdoItem${j.index+1}" onblur="updateValue('rdoTitle','item${k.index+1}_${j.index+1}')" onclick="updateValue('isCheckRdo','item${k.index+1}_${j.index+1}')">
										            	</font>
									            	</label>
									            	<c:if test="${j.index>0}">
									            		<img src="${ctx}/static/image/del.png" width="15" height="15" style="cursor:pointer;" onclick="removeItem('item${k.index+1}','item${k.index+1}_prop_rdoItem${j.index+1}_div','${j.index+1}','radio')" title="移除">
									            	</c:if>
								            	</div>
						            		</c:forEach>
					            		</div>
					            		<div class="add_btn_group">
							            	<div class="add_item" onclick="addItem('item${k.index+1}','radio')">添加选项</div>
							            	<div class="add_item add_other" onclick="addItem('item${k.index+1}','rdoOther')">添加其他选项</div>
							            	<div class="add_item multi-edit" onclick="batchEditItems('item${k.index+1}','item${k.index+1}_prop_rdoItemDiv','radio')">批量编辑</div>
						            	</div>
					            	</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='checkbox'}">
	                       			<div class="cfg_title">
							         	<span>标题</span>
							         	<div class="cfg_widget_type"><span>复选按钮组</span></div>
						         	</div>
						         	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>选项</span></div>
					            	<div class="cfg_content fx_selection_pane">
						            	<div id="item${k.index+1}_prop_ckbItemDiv">
						            		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
						            			<div class="checkbox i-checks" id="item${k.index+1}_prop_ckbItem${j.index+1}_div">
									            	<label>
										            	<input type="checkbox" name="item${k.index+1}_prop_ckb" value="${j.index+1}" id="item${k.index+1}_prop_ckb${j.index+1}"  ${fn:contains(item.defaultValue,it)?'checked':''}>
										            	<i></i><font>
										            	<input type="text" class="x-input" style="width: 180px; height:30px; display: inline;" name="item${k.index+1}_prop_ckbItem${j.index+1}" value="${it}" id="item${k.index+1}_prop_ckbItem${j.index+1}" onblur="updateValue('ckbTitle','item${k.index+1}_${j.index+1}')" onclick="updateValue('isCheckCkbInput','item${k.index+1}_${j.index+1}')">
										            	</font>
									            	</label>
									            	<c:if test="${j.index>0}">
									            		<img src="${ctx}/static/image/del.png" width="15" height="15" style="cursor:pointer;" onclick="removeItem('item${k.index+1}','item${k.index+1}_prop_ckbItem${j.index+1}_div','${j.index+1}','checkbox')" title="移除">
									            	</c:if>
								            	</div>
						            		</c:forEach>
					            		</div>
					            		<div class="add_btn_group">
							            	<div class="add_item" onclick="addItem('item${k.index+1}','checkbox')">添加选项</div>
							            	<div class="add_item add_other" onclick="addItem('item${k.index+1}','ckbOther')">添加其他选项</div>
							            	<div class="add_item multi-edit" onclick="batchEditItems('item${k.index+1}','item${k.index+1}_prop_ckbItemDiv','checkbox')">批量编辑</div>
						            	</div>
					            	</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='select'}">
	                       			<div class="cfg_title">
							         	<span>标题</span>
							         	<div class="cfg_widget_type"><span>下拉列表</span></div>
							         </div>
							         <div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>选项</span></div>
					            	<div class="cfg_content fx_selection_pane">
						            	<div id="item${k.index+1}_prop_slcItemDiv">
						            		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
						            			<div class="radio i-checks" id="item${k.index+1}_prop_slcItem${j.index+1}_div">
									            	<label>
										            	<input type="radio" name="item${k.index+1}_prop_slc" value="${j.index+1}" ${fn:contains(item.defaultValue,it)?'checked':''}>
										            	<i></i><font>
										            	<input type="text" class="x-input" style="width: 180px; height:30px; display: inline;" name="item${k.index+1}_prop_slcItem${j.index+1}" value="${it}" id="item${k.index+1}_prop_slcItem${j.index+1}" onblur="updateValue('slcTitle','item${k.index+1}_${j.index+1}')" onclick="updateValue('isCheckSlc','item${k.index+1}_${j.index+1}')">
										            	</font>
									            	</label>
									            	<c:if test="${j.index>0}">
									            		<img src="${ctx}/static/image/del.png" width="15" height="15" style="cursor:pointer;" onclick="removeItem('item${k.index+1}','item${k.index+1}_prop_slcItem${j.index+1}_div','${j.index+1}','select')" title="移除">
									            	</c:if>
								            	</div>
						            		</c:forEach>
					            		</div>
					            		<div class="add_btn_group">
							            	<div class="add_item" onclick="addItem('item${k.index+1}','select')">添加选项</div>
							            	<div class="add_item multi-edit" onclick="batchEditItems('item${k.index+1}','item${k.index+1}_prop_slcItemDiv','select')">批量编辑</div>
						            	</div>
					            	</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='selectmore'}">
	                       			<div class="cfg_title">
							         	<span>标题</span>
							         	<div class="cfg_widget_type"><span>下拉复选列表</span></div>
						         	</div>
						         	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>选项</span></div>
					            	<div class="cfg_content fx_selection_pane">
						            	<div id="item${k.index+1}_prop_slmItemDiv">
						            		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
						            			<div class="checkbox i-checks" id="item${k.index+1}_prop_slmItem${j.index+1}_div">
									            	<label>
										            	<input type="checkbox" name="item${k.index+1}_prop_slm" value="${j.index+1}" id="item${k.index+1}_prop_slm${j.index+1}" ${fn:contains(item.defaultValue,it)?'checked':''}>
										            	<i></i><font>
										            	<input type="text" class="x-input" style="width: 180px; height:30px; display: inline;" name="item${k.index+1}_prop_slmItem${j.index+1}" value="${it}" id="item${k.index+1}_prop_slmItem${j.index+1}" onblur="updateValue('slmTitle','item${k.index+1}_${j.index+1}')" onclick="updateValue('isCheckSlmInput','item${k.index+1}_${j.index+1}')">
										            	</font>
									            	</label>
									            	<c:if test="${j.index>0}">
									            		<img src="${ctx}/static/image/del.png" width="15" height="15" style="cursor:pointer;" onclick="removeItem('item${k.index+1}','item${k.index+1}_prop_slmItem${j.index+1}_div','${j.index+1}','selectmore')" title="移除">
									            	</c:if>
								            	</div>
						            		</c:forEach>
					            		</div>
					            		<div class="add_btn_group">
							            	<div class="add_item" onclick="addItem('item${k.index+1}','selectmore')">添加选项</div>
							            	<div class="add_item multi-edit" onclick="batchEditItems('item${k.index+1}','item${k.index+1}_prop_slmItemDiv','selectmore')">批量编辑</div>
						            	</div>
					            	</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='date'}">
	                       			<div class="cfg_title">
						            	<span>标题</span>
						            	<div class="cfg_widget_type"><span>日期时间</span></div>
					            	</div>
					            	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>类型</span></div>
					            	<div class="cfg_content fui_combo" style="width: 240px; height: 30px; line-height: 28px;">
					            		<select class="fui_trigger-input" name="item${k.index+1}_prop_format" id="item${k.index+1}_prop_format" onchange="updateValue('dateFormat','item${k.index+1}')">
											<option value="ymdhms" ${item.dataFormat=='ymdhms'?'selected':''}>年-月-日 时:分:秒</option>
							                <option value="ymdhm" ${item.dataFormat=='ymdhm'?'selected':''}>年-月-日 时:分</option>
							                <option value="ymd" ${item.dataFormat=='ymd'?'selected':''}>年-月-日</option>
											<option value="ym" ${item.dataFormat=='ym'?'selected':''}>年-月</option>
											<!-- 
							                <option value="hms">时:分:秒</option>
							                <option value="hm">时:分</option>
							                 -->
										</select>
									</div>
									<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>默认值</span></div>
					            	<div class="cfg_content fui_text" widgetname="defaultInput" style="width: 240px; height: 30px;">
										<input class="x-input" type="text" name="item${k.index+1}_prop_default" id="item${k.index+1}_prop_default" value="${item.defaultValue}" onblur="updateValue('dfValue','item${k.index+1}')">
									</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='hidden'}">
	                       			<div class="cfg_title"><span>默认值</span>
						        		<div class="cfg_widget_type"><span>隐藏域</span></div>
						        	</div>
						        	<div class="cfg_content fui_text" widgetname="defaultInput" style="width: 240px; height: 30px;">
										<input class="x-input" type="text" name="item${k.index+1}_prop_default" value="${item.defaultValue}" id="item${k.index+1}_prop_default" onblur="updateValue('dfValue','item${k.index+1}')">
									</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='file'}">
	                       			<div class="cfg_title">
						            	<span>标题</span>
						            	<div class="cfg_widget_type"><span>文件上传</span></div>
					            	</div>
					            	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='subform'}">
	                       			<div class="cfg_title">
						            	<span>标题</span>
						            	<div class="cfg_widget_type"><span>子表单</span></div>
					            	</div>
					            	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					            		<input class="x-input" name="item${k.index+1}_prop_title" id="item${k.index+1}_prop_title" type="text" value="${item.inputTitle}" onblur="updateValue('title','item${k.index+1}')">
					            	</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
						            	<span>待开发...</span>
					            	</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType=='line'}">
	                       			<div class="cfg_title">
						            	<span>类型</span>
						            	<div class="cfg_widget_type"><span>分隔符</span></div>
					            	</div>
					            	<div class="cfg_content fui_combo" style="width: 240px; height: 30px; line-height: 28px;">
					            		<select class="fui_trigger-input" name="item${k.index+1}_prop_format" id="item${k.index+1}_prop_format" onchange="updateValue('lineType','item${k.index+1}')">
											<option value="dashed" ${item.dataFormat=='dashed'?'selected':''}>虚线</option>
				                			<option value="solid" ${item.dataFormat=='solid'?'selected':''}>实线</option>
										</select>
									</div>
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title">
					            		<span>描述信息</span>
					            	</div>
					            	<div class="cfg_content x-richtext" style="width: 240px;">
					            		<textarea class="note-codable" name="item${k.index+1}_prop_des" id="item${k.index+1}_prop_des" onblur="updateValue('des','item${k.index+1}')">${item.promptMsg}</textarea>
					            	</div>
	                       		</c:if>
	                       		
	                       		<c:if test="${item.inputType!='line'}">
	                       			<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>校验</span></div>
					            	<div class="cfg_content x-check">
						            	<div class="checkbox i-checks">
							            	<label>
								            	<input type="checkbox" value="1" name="item${k.index+1}_prop_check"  ${item.checkType==1?'checked':''}>
								            	<i></i><font>必填</font>
								            </label>
								        </div>
								        <!-- 
								        <div class="checkbox i-checks">
								            <label>
								            	<input type="checkbox" value="unique" name="item${k.index+1}_prop_whrite">
								            	<i></i><font>不允许重复值</font>
							            	</label>
						            	</div>
						            	 -->
					            	</div>
					            	<!-- 
					            	<div class="cfg_split"></div>
					            	<div class="cfg_title"><span>操作权限</span></div>
					            	<div class="cfg_content x-check">
						            	<div class="checkbox i-checks">
							            	<label id="item1_lab3">
								            	<input type="checkbox" value="show" name="item${k.index+1}_prop_show" ${fn:contains(item.funcPermission,'show')?'checked':''}>
								            	<i></i><font>可见</font>
								            </label>
								        </div>
								        <div class="checkbox i-checks">
								            <label id="item2_lab2">
								            	<input type="checkbox" value="edit" name="item${k.index+1}_prop_edit" ${fn:contains(item.funcPermission,'edit')?'checked':''}>
								            	<i></i><font>可编辑</font>
							            	</label>
						            	</div>
					            	</div>
					            	 -->
	                       		</c:if>
								<div class="cfg_split"></div>
					            <div class="cfg_title"><span>排序</span></div>
					           	<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
					           		<input class="x-input" readOnly name="item${k.index+1}_prop_sort" id="item${k.index+1}_prop_sort" type="text" value="${item.sortGrade}">
					           	</div>
					          </div>
							</c:forEach>
						</div>
						<div id="form-config-pane">
							<div class="fx_config_pane">
								<!-- 
								<div class="cfg_title">
									<span>
										表单提交校验
									</span>
								</div>
								<ul class="form-submit-validator cfg_content">
								</ul>
								<div class="cfg_content x-btn style-white" style="width: 240px; height: 30px; line-height: 28px;">
									<span>
										添加校验条件
									</span>
								</div>
								<div class="cfg_split"></div>
								 -->
								<div class="cfg_title">
									<span>表单名称</span>
								</div>
								<div class="cfg_content fui_text" style="width: 240px; height: 30px;">
				            		<input class="x-input" name="templateName" id="templateName" type="text" value="${formTemplate.formName}" onblur="updateValue('templateName','')">
				            	</div>
				            	<div class="cfg_split"></div>
				            	<div class="cfg_title">
				            		<span>描述信息</span>
				            	</div>
				            	<div class="cfg_content x-richtext" style="width: 240px;">
				            		<textarea class="note-codable" name="templateDes" id="templateDes">${formTemplate.formDesc}</textarea>
				            	</div>
				            	<div class="cfg_split"></div>
								<div class="cfg_title">
									<span>
										表单布局
									</span>
								</div>
								<div class="cfg_content fui_segment">
									<div class="fui_segment_item fui_segment_item-first ${formTemplate.formLayout!='z'?'selected':''}" onclick="changeFormShowModel('m_h')" id="m_h">
										<span>
											横排
										</span>
									</div>
									<div class="fui_segment_item fui_segment_item-last ${formTemplate.formLayout=='z'?'selected':''}" onclick="changeFormShowModel('m_z')" id="m_z">
										<span>
											纵排
										</span>
									</div>
								</div>
								<!-- 
								<div class="cfg_content fui_segment" widgetname="_widget_1478075117848">
									<div class="fui_segment_item fui_segment_item-first selected">
										<span>
											单列
										</span>
									</div>
									<div class="fui_segment_item fui_segment_item-last">
										<span>
											双列
										</span>
									</div>
								</div>
								 -->
								<!-- 
								<div class="cfg_split">
								</div>
								<div class="cfg_title">
									<span>
										隐藏控件赋值
									</span>
									<i class="cfg_tooltip icon-help">
									</i>
								</div>
								<div class="cfg_content fui_combo" style="width: 240px; height: 30px; line-height: 28px;">
									<input class="fui_trigger-input" onfocus="this.blur();" readonly="readonly" unselectable="on" value="保持原值">
									<i class="fui_trigger-btn icon-ui-combo">
									</i>
								</div>
								<div class="cfg_content x-label submit-rules-tip" widgetname="submitRuleTip">
									<a>
										控件被隐藏时，不改变该字段的原有值
									</a>
								</div>
								 -->
							</div>
						</div>
					</div>
					</form>
				</div>
				<div class="fui-form" id="fx-frame-center">
					<div class="form-edit-title">
						<div class="title">
							<span id="form-name">
								${formTemplate.formName}
							</span>
						</div>
						<div class="btn-share x-btn style-blue"
						style="width: 80px; height: 30px; line-height: 28px;" onclick="preview()">
							<i class="icon-preview">
							</i>
							<span>
								预览
							</span>
						</div>
						<div class="btn-save x-btn style-green"
						style="width: 80px; height: 30px; line-height: 28px;" onclick="submitForm()">
							<i class="icon-save">
							</i>
							<span>
								保存
							</span>
						</div>
						<div class="btn-preview fx_share x-btn style-blue"
						style="width: 80px; height: 30px; line-height: 28px;" onclick="window.history.go(-1);">
							<i class="icon-share">
							</i>
							<span>
								返回
							</span>
						</div>
					</div>
					<div id="form-widget-list">
						<div class="col-md-12 droppable sortable m-t form-horizontal" style="height:100%;overflow-y:auto;overflow-x:hidden;">
                            <!-- 插入元素控件 -->
                            <!-- 编辑时,读取控件 -->
                            <c:forEach items="${inputList}" var="item" varStatus="k">
                            	<div class="form-group draggable ui-draggable dropped" style="position:static;left:null;right:null;" id="item${k.index+1}" xtype="${item.inputType}">
                            		<c:if test="${item.inputType!='line'}">
		                                <label class="col-sm-3 control-label commlab">${item.inputTitle}</label>
		                                <div class="col-sm-9 common">
		                                </c:if>
		                                <c:if test="${item.inputType=='line'}">
		                                <div class="col-sm-12 line">
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
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="radio" value="${it}" name="rdobox"  ${fn:contains(item.defaultValue,it)?'checked':''}> <i></i> 
		                                     <font>
		                                     ${it}
		                                     <c:if test="${it=='其他'}">&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;"></c:if>
		                                     </font>
		                                     </label>
		                                    </c:forEach>
		                                 </div>
                            		</c:if>
                            		<c:if test="${item.inputType=='checkbox'}">
                                      	  <div class="checkbox i-checks">
                                      	  	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="checkbox" value="${it}" name="ckbox" ${fn:contains(item.defaultValue,it)?'checked':''}> <i></i> 
											 <font>
		                                     ${it}
		                                     <c:if test="${it=='其他'}">&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;"></c:if>
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
						<!-- 
						<ul class="frame-inner-list loaded">
						</ul>
						
						<div class="form-empty">
							<div class="img">
							</div>
							<span>
								拖入左侧控件绘制表单
							</span>
						</div> -->
					</div>
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
        $(document).ready(function(){
        	$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
        });
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
				activate: function(event, ui) {
					//当前拖动元素
					var currentObj = $(ui.draggable);
					//当拖动的元素高亮并显示属性
					//显示控件属性
	        		changePane("widget");
					changeBgColor(currentObj);
	       			var divId = currentObj.attr("id");
	       			showHidePropDiv($("#"+divId+"_prop"));
				},
				drop: function(event, ui){
					var formLayout = $("#formLayout").val();//获取表单布局格式  h标识横排  z标识纵排
					$(".form-empty").remove();
					var $orig = $(ui.draggable);
					if (!$orig.hasClass("dropped")) {
						/* var $el = $orig.clone().attr("id","item"+i).addClass("dropped").css({
							"position": "static",
							"left": null,
							"right": null
						}).appendTo(this); */
						
						var type = $orig.attr("xtype");
						var htmlStr = "";//定义变量存放拼装html
						//根据拖动的标签类型，来显示不同的控件
						htmlStr += "<div class=\"form-group draggable ui-draggable\">";
						if(type == "text"){//单行文本
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">文本框</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<input type=\"text\" name=\"\" class=\"form-control\" placeholder=\"请输入文本\">";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "textarea"){//多行文本
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">多行文本</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<textarea class=\"form-control\" name=\"\" placeholder=\"请输入文本\"></textarea>";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "number"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">数字</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<input type=\"text\" class=\"form-control\" name=\"number\" placeholder=\"请输入数值\">";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "password"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">密码框</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<input type=\"password\" class=\"form-control\" name=\"password\" placeholder=\"请输入密码\">";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "richtext"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">富文本</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							//htmlStr += "<script id=\"editors\" type=\"text\/plain\"><\/script>";
							htmlStr += "<div id=\"editors"+i+"\" class=\"edui-default\" style=\"\">";
							htmlStr += "<div id=\"edui1\" class=\"edui-editor  edui-default\" style=\"width: 100%; z-index: 90;\">";
							htmlStr += "<div id=\"edui1_toolbarbox\" class=\"edui-editor-toolbarbox edui-default\">";
							htmlStr += "<div id=\"edui1_toolbarboxouter\" class=\"edui-editor-toolbarboxouter edui-default\">";
							htmlStr += "<div class=\"edui-editor-toolbarboxinner edui-default\">";
							htmlStr += "<div id=\"edui2\" class=\"edui-toolbar   edui-default\" onselectstart=\"return false;\" onmousedown=\"return $EDITORUI[\"edui2\"]._onMouseDown(event, this);\" style=\"-moz-user-select: none;\">";
							htmlStr += "<div id=\"edui3\" class=\"edui-box edui-button edui-for-fullscreen edui-default\">";
							htmlStr += "<div id=\"edui3_state\" onmousedown=\"$EDITORUI[\"edui3\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui3\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui3\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui3\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui3_body\" unselectable=\"on\" title=\"全屏\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui3\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui3\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui4\" class=\"edui-box edui-button edui-for-source edui-default\">";
							htmlStr += "<div id=\"edui4_state\" onmousedown=\"$EDITORUI[\"edui4\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui4\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui4\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui4\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui4_body\" unselectable=\"on\" title=\"源代码\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui4\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui4\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui5\" class=\"edui-box edui-button edui-for-undo edui-default\">";
							htmlStr += "<div id=\"edui5_state\" onmousedown=\"$EDITORUI[\"edui5\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui5\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui5\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui5\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui5_body\" unselectable=\"on\" title=\"撤销\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui5\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui5\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui6\" class=\"edui-box edui-button edui-for-redo edui-default\">";
							htmlStr += "<div id=\"edui6_state\" onmousedown=\"$EDITORUI[\"edui6\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui6\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui6\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui6\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui6_body\" unselectable=\"on\" title=\"重做\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui6\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui6\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui7\" class=\"edui-box edui-menubutton edui-for-insertunorderedlist edui-default\">";
							htmlStr += "<div title=\"无序列表\" id=\"edui7_state\" onmousedown=\"$EDITORUI[\"edui7\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui7\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui7\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui7\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-menubutton-body edui-default\">";
							htmlStr += "<div id=\"edui7_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui7\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui7\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui14\" class=\"edui-box edui-menubutton edui-for-insertorderedlist edui-default\">";
							htmlStr += "<div title=\"有序列表\" id=\"edui14_state\" onmousedown=\"$EDITORUI[\"edui14\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui14\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui14\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui14\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-menubutton-body edui-default\">";
							htmlStr += "<div id=\"edui14_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui14\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui14\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui27\" class=\"edui-box edui-button edui-for-unlink edui-default\">";
							htmlStr += "<div id=\"edui27_state\" onmousedown=\"$EDITORUI[\"edui27\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui27\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui27\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui27\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui27_body\" unselectable=\"on\" title=\"取消链接\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui27\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui27\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui34\" class=\"edui-box edui-button edui-for-link edui-default\">";
							htmlStr += "<div id=\"edui34_state\" onmousedown=\"$EDITORUI[\"edui34\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui34\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui34\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui34\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui34_body\" unselectable=\"on\" title=\"超链接\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui34\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui34\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui35\" class=\"edui-box edui-button edui-for-cleardoc edui-default\">";
							htmlStr += "<div id=\"edui35_state\" onmousedown=\"$EDITORUI[\"edui35\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui35\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui35\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui35\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui35_body\" unselectable=\"on\" title=\"清空文档\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui35\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui35\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui36\" class=\"edui-box edui-button edui-for-selectall edui-default\">";
							htmlStr += "<div id=\"edui36_state\" onmousedown=\"$EDITORUI[\"edui36\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui36\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui36\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui36\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui36_body\" unselectable=\"on\" title=\"全选\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui36\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui36\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui37\" class=\"edui-box edui-button edui-for-print edui-default\">";
							htmlStr += "<div id=\"edui37_state\" onmousedown=\"$EDITORUI[\"edui37\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui37\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui37\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui37\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui37_body\" unselectable=\"on\" title=\"打印\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui37\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui37\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui40\" class=\"edui-box edui-button edui-for-searchreplace edui-default\">";
							htmlStr += "<div id=\"edui40_state\" onmousedown=\"$EDITORUI[\"edui40\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui40\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui40\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui40\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui40_body\" unselectable=\"on\" title=\"查询替换\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui40\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui40\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui41\" class=\"edui-box edui-button edui-for-drafts edui-default\">";
							htmlStr += "<div id=\"edui41_state\" onmousedown=\"$EDITORUI[\"edui41\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui41\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui41\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui41\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui41_body\" unselectable=\"on\" title=\"从草稿箱加载\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui41\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui41\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui42\" class=\"edui-box edui-button edui-for-horizontal edui-default\">";
							htmlStr += "<div id=\"edui42_state\" onmousedown=\"$EDITORUI[\"edui42\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui42\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui42\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui42\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui42_body\" unselectable=\"on\" title=\"分隔线\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui42\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui42\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui47\" class=\"edui-box edui-button edui-for-anchor edui-default\">";
							htmlStr += "<div id=\"edui47_state\" onmousedown=\"$EDITORUI[\"edui47\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui47\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui47\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui47\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui47_body\" unselectable=\"on\" title=\"锚点\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui47\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui47\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui50\" class=\"edui-box edui-button edui-for-spechars edui-default\">";
							htmlStr += "<div id=\"edui50_state\" onmousedown=\"$EDITORUI[\"edui50\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui50\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui50\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui50\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui50_body\" unselectable=\"on\" title=\"特殊字符\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui50\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui50\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui51\" class=\"edui-box edui-button edui-for-blockquote edui-default\">";
							htmlStr += "<div id=\"edui51_state\" onmousedown=\"$EDITORUI[\"edui51\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui51\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui51\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui51\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui51_body\" unselectable=\"on\" title=\"引用\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui51\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui51\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui52\" class=\"edui-box edui-button edui-for-pasteplain edui-default\">";
							htmlStr += "<div id=\"edui52_state\" onmousedown=\"$EDITORUI[\"edui52\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui52\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui52\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui52\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui52_body\" unselectable=\"on\" title=\"纯文本粘贴模式\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui52\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui52\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui57\" class=\"edui-box edui-button edui-for-template edui-default\">";
							htmlStr += "<div id=\"edui57_state\" onmousedown=\"$EDITORUI[\"edui57\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui57\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui57\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui57\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui57_body\" unselectable=\"on\" title=\"模板\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui57\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui57\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui62\" class=\"edui-box edui-button edui-for-background edui-default\">";
							htmlStr += "<div id=\"edui62_state\" onmousedown=\"$EDITORUI[\"edui62\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui62\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui62\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui62\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui62_body\" unselectable=\"on\" title=\"背景\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui62\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui62\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui63\" class=\"edui-box edui-button edui-for-bold edui-default\">";
							htmlStr += "<div id=\"edui63_state\" onmousedown=\"$EDITORUI[\"edui63\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui63\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui63\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui63\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui63_body\" unselectable=\"on\" title=\"加粗\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui63\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui63\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui64\" class=\"edui-box edui-button edui-for-italic edui-default\">";
							htmlStr += "<div id=\"edui64_state\" onmousedown=\"$EDITORUI[\"edui64\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui64\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui64\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui64\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui64_body\" unselectable=\"on\" title=\"斜体\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui64\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui64\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui65\" class=\"edui-box edui-button edui-for-underline edui-default\">";
							htmlStr += "<div id=\"edui65_state\" onmousedown=\"$EDITORUI[\"edui65\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui65\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui65\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui65\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui65_body\" unselectable=\"on\" title=\"下划线\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui65\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui65\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui66\" class=\"edui-box edui-button edui-for-fontborder edui-default\">";
							htmlStr += "<div id=\"edui66_state\" onmousedown=\"$EDITORUI[\"edui66\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui66\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui66\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui66\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui66_body\" unselectable=\"on\" title=\"字符边框\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui66\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui66\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui67\" class=\"edui-box edui-button edui-for-strikethrough edui-default\">";
							htmlStr += "<div id=\"edui67_state\" onmousedown=\"$EDITORUI[\"edui67\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui67\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui67\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui67\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui67_body\" unselectable=\"on\" title=\"删除线\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui67\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui67\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui68\" class=\"edui-box edui-splitbutton edui-for-forecolor edui-default edui-colorbutton\">";
							htmlStr += "<div title=\"字体颜色\" id=\"edui68_state\" onmousedown=\"$EDITORUI[\"edui68\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui68\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui68\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui68\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-splitbutton-body edui-default\">";
							htmlStr += "<div id=\"edui68_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui68\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "<div id=\"edui68_colorlump\" class=\"edui-colorlump\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui68\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui71\" class=\"edui-box edui-splitbutton edui-for-backcolor edui-default edui-colorbutton\">";
							htmlStr += "<div title=\"背景色\" id=\"edui71_state\" onmousedown=\"$EDITORUI[\"edui71\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui71\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui71\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui71\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-splitbutton-body edui-default\">";
							htmlStr += "<div id=\"edui71_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui71\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "<div id=\"edui71_colorlump\" class=\"edui-colorlump\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui71\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui74\" class=\"edui-box edui-button edui-for-superscript edui-default\">";
							htmlStr += "<div id=\"edui74_state\" onmousedown=\"$EDITORUI[\"edui74\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui74\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui74\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui74\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui74_body\" unselectable=\"on\" title=\"上标\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui74\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui74\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui75\" class=\"edui-box edui-button edui-for-subscript edui-default\">";
							htmlStr += "<div id=\"edui75_state\" onmousedown=\"$EDITORUI[\"edui75\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui75\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui75\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui75\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui75_body\" unselectable=\"on\" title=\"下标\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui75\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui75\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui76\" class=\"edui-box edui-button edui-for-justifyleft edui-default\">";
							htmlStr += "<div id=\"edui76_state\" onmousedown=\"$EDITORUI[\"edui76\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui76\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui76\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui76\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui76_body\" unselectable=\"on\" title=\"居左对齐\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui76\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui76\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui77\" class=\"edui-box edui-button edui-for-justifycenter edui-default\">";
							htmlStr += "<div id=\"edui77_state\" onmousedown=\"$EDITORUI[\"edui77\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui77\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui77\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui77\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui77_body\" unselectable=\"on\" title=\"居中对齐\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui77\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui77\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui78\" class=\"edui-box edui-button edui-for-justifyright edui-default\">";
							htmlStr += "<div id=\"edui78_state\" onmousedown=\"$EDITORUI[\"edui78\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui78\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui78\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui78\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui78_body\" unselectable=\"on\" title=\"居右对齐\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui78\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui78\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui79\" class=\"edui-box edui-button edui-for-justifyjustify edui-default\">";
							htmlStr += "<div id=\"edui79_state\" onmousedown=\"$EDITORUI[\"edui79\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui79\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui79\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui79\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui79_body\" unselectable=\"on\" title=\"两端对齐\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui79\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui79\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui80\" class=\"edui-box edui-button edui-for-touppercase edui-default\">";
							htmlStr += "<div id=\"edui80_state\" onmousedown=\"$EDITORUI[\"edui80\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui80\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui80\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui80\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui80_body\" unselectable=\"on\" title=\"字母大写\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui80\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui80\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui81\" class=\"edui-box edui-button edui-for-tolowercase edui-default\">";
							htmlStr += "<div id=\"edui81_state\" onmousedown=\"$EDITORUI[\"edui81\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui81\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui81\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui81\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui81_body\" unselectable=\"on\" title=\"字母小写\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui81\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui81\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui82\" class=\"edui-box edui-button edui-for-directionalityltr edui-default\">";
							htmlStr += "<div id=\"edui82_state\" onmousedown=\"$EDITORUI[\"edui82\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui82\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui82\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui82\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui82_body\" unselectable=\"on\" title=\"从左向右输入\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui82\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui82\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui83\" class=\"edui-box edui-button edui-for-directionalityrtl edui-default\">";
							htmlStr += "<div id=\"edui83_state\" onmousedown=\"$EDITORUI[\"edui83\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui83\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui83\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui83\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui83_body\" unselectable=\"on\" title=\"从右向左输入\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui83\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui83\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui84\" class=\"edui-box edui-button edui-for-indent edui-default\">";
							htmlStr += "<div id=\"edui84_state\" onmousedown=\"$EDITORUI[\"edui84\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui84\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui84\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui84\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui84_body\" unselectable=\"on\" title=\"首行缩进\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui84\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui84\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui85\" class=\"edui-box edui-button edui-for-removeformat edui-default\">";
							htmlStr += "<div id=\"edui85_state\" onmousedown=\"$EDITORUI[\"edui85\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui85\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui85\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui85\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui85_body\" unselectable=\"on\" title=\"清除格式\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui85\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui85\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui86\" class=\"edui-box edui-button edui-for-formatmatch edui-default\">";
							htmlStr += "<div id=\"edui86_state\" onmousedown=\"$EDITORUI[\"edui86\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui86\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui86\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui86\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui86_body\" unselectable=\"on\" title=\"格式刷\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui86\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui86\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui87\" class=\"edui-box edui-splitbutton edui-for-autotypeset edui-default\">";
							htmlStr += "<div title=\"自动排版\" id=\"edui87_state\" onmousedown=\"$EDITORUI[\"edui87\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui87\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui87\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui87\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-splitbutton-body edui-default\">";
							htmlStr += "<div id=\"edui87_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui87\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui87\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui90\" class=\"edui-box edui-combox edui-for-customstyle edui-default\">";
							htmlStr += "<div title=\"自定义标题\" id=\"edui90_state\" onmousedown=\"$EDITORUI[\"edui90\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui90\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui90\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui90\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-combox-body edui-default\">";
							htmlStr += "<div id=\"edui90_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui90\"]._onButtonClick(event, this);\">自定义标题</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui90\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui96\" class=\"edui-box edui-combox edui-for-paragraph edui-default\">";
							htmlStr += "<div title=\"段落格式\" id=\"edui96_state\" onmousedown=\"$EDITORUI[\"edui96\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui96\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui96\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui96\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-combox-body edui-default\">";
							htmlStr += "<div id=\"edui96_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui96\"]._onButtonClick(event, this);\">段落格式</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui96\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui105\" class=\"edui-box edui-menubutton edui-for-rowspacingbottom edui-default\">";
							htmlStr += "<div title=\"段后距\" id=\"edui105_state\" onmousedown=\"$EDITORUI[\"edui105\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui105\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui105\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui105\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-menubutton-body edui-default\">";
							htmlStr += "<div id=\"edui105_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui105\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui105\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui112\" class=\"edui-box edui-menubutton edui-for-lineheight edui-default\">";
							htmlStr += "<div title=\"行间距\" id=\"edui112_state\" onmousedown=\"$EDITORUI[\"edui112\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui112\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui112\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui112\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-menubutton-body edui-default\">";
							htmlStr += "<div id=\"edui112_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui112\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui112\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui121\" class=\"edui-box edui-combox edui-for-fontfamily edui-default\">";
							htmlStr += "<div title=\"字体\" id=\"edui121_state\" onmousedown=\"$EDITORUI[\"edui121\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui121\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui121\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui121\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-combox-body edui-default\">";
							htmlStr += "<div id=\"edui121_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui121\"]._onButtonClick(event, this);\">字体</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui121\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui134\" class=\"edui-box edui-combox edui-for-fontsize edui-default\">";
							htmlStr += "<div title=\"字号\" id=\"edui134_state\" onmousedown=\"$EDITORUI[\"edui134\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui134\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui134\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui134\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-combox-body edui-default\">";
							htmlStr += "<div id=\"edui134_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui134\"]._onButtonClick(event, this);\">字号</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui134\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui148\" class=\"edui-box edui-menubutton edui-for-rowspacingtop edui-default\">";
							htmlStr += "<div title=\"段前距\" id=\"edui148_state\" onmousedown=\"$EDITORUI[\"edui148\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui148\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui148\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui148\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-menubutton-body edui-default\">";
							htmlStr += "<div id=\"edui148_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui148\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui148\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui155\" class=\"edui-box edui-button edui-for-imagenone edui-default\">";
							htmlStr += "<div id=\"edui155_state\" onmousedown=\"$EDITORUI[\"edui155\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui155\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui155\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui155\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui155_body\" unselectable=\"on\" title=\"默认\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui155\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui155\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui156\" class=\"edui-box edui-button edui-for-imageleft edui-default\">";
							htmlStr += "<div id=\"edui156_state\" onmousedown=\"$EDITORUI[\"edui156\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui156\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui156\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui156\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui156_body\" unselectable=\"on\" title=\"左浮动\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui156\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui156\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui157\" class=\"edui-box edui-button edui-for-imageright edui-default\">";
							htmlStr += "<div id=\"edui157_state\" onmousedown=\"$EDITORUI[\"edui157\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui157\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui157\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui157\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui157_body\" unselectable=\"on\" title=\"右浮动\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui157\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui157\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui158\" class=\"edui-box edui-button edui-for-imagecenter edui-default\">";
							htmlStr += "<div id=\"edui158_state\" onmousedown=\"$EDITORUI[\"edui158\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui158\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui158\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui158\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui158_body\" unselectable=\"on\" title=\"居中\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui158\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui158\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui159\" class=\"edui-box edui-splitbutton edui-for-inserttable edui-default\">";
							htmlStr += "<div title=\"插入表格\" id=\"edui159_state\" onmousedown=\"$EDITORUI[\"edui159\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui159\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui159\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui159\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-splitbutton-body edui-default\">";
							htmlStr += "<div id=\"edui159_button_body\" class=\"edui-box edui-button-body edui-default\" onclick=\"$EDITORUI[\"edui159\"]._onButtonClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div class=\"edui-box edui-splitborder edui-default\"></div>";
							htmlStr += "<div class=\"edui-box edui-arrow edui-default\" onclick=\"$EDITORUI[\"edui159\"]._onArrowClick();\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui162\" class=\"edui-box edui-button edui-for-deletetable edui-default\">";
							htmlStr += "<div id=\"edui162_state\" onmousedown=\"$EDITORUI[\"edui162\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui162\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui162\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui162\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui162_body\" unselectable=\"on\" title=\"删除表格\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui162\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui162\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui163\" class=\"edui-box edui-button edui-for-mergeright edui-default\">";
							htmlStr += "<div id=\"edui163_state\" onmousedown=\"$EDITORUI[\"edui163\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui163\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui163\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui163\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui163_body\" unselectable=\"on\" title=\"右合并单元格\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui163\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui163\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui164\" class=\"edui-box edui-button edui-for-mergedown edui-default\">";
							htmlStr += "<div id=\"edui164_state\" onmousedown=\"$EDITORUI[\"edui164\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui164\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui164\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui164\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui164_body\" unselectable=\"on\" title=\"下合并单元格\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui164\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui164\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui165\" class=\"edui-box edui-button edui-for-splittorows edui-default\">";
							htmlStr += "<div id=\"edui165_state\" onmousedown=\"$EDITORUI[\"edui165\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui165\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui165\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui165\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui165_body\" unselectable=\"on\" title=\"拆分成行\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui165\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui165\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui166\" class=\"edui-box edui-button edui-for-splittocols edui-default\">";
							htmlStr += "<div id=\"edui166_state\" onmousedown=\"$EDITORUI[\"edui166\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui166\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui166\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui166\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui166_body\" unselectable=\"on\" title=\"拆分成列\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui166\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui166\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui167\" class=\"edui-box edui-button edui-for-splittocells edui-default\">";
							htmlStr += "<div id=\"edui167_state\" onmousedown=\"$EDITORUI[\"edui167\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui167\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui167\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui167\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui167_body\" unselectable=\"on\" title=\"完全拆分单元格\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui167\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui167\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui168\" class=\"edui-box edui-button edui-for-mergecells edui-default\">";
							htmlStr += "<div id=\"edui168_state\" onmousedown=\"$EDITORUI[\"edui168\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui168\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui168\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui168\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui168_body\" unselectable=\"on\" title=\"合并多个单元格\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui168\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui168\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui169\" class=\"edui-box edui-button edui-for-insertcol edui-default\">";
							htmlStr += "<div id=\"edui169_state\" onmousedown=\"$EDITORUI[\"edui169\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui169\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui169\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui169\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui169_body\" unselectable=\"on\" title=\"前插入列\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui169\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui169\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui170\" class=\"edui-box edui-button edui-for-insertrow edui-default\">";
							htmlStr += "<div id=\"edui170_state\" onmousedown=\"$EDITORUI[\"edui170\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui170\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui170\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui170\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui170_body\" unselectable=\"on\" title=\"前插入行\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui170\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui170\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui171\" class=\"edui-box edui-button edui-for-deletecol edui-default\">";
							htmlStr += "<div id=\"edui171_state\" onmousedown=\"$EDITORUI[\"edui171\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui171\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui171\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui171\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui171_body\" unselectable=\"on\" title=\"删除列\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui171\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui171\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui172\" class=\"edui-box edui-button edui-for-deleterow edui-default\">";
							htmlStr += "<div id=\"edui172_state\" onmousedown=\"$EDITORUI[\"edui172\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui172\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui172\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui172\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui172_body\" unselectable=\"on\" title=\"删除行\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui172\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui172\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui173\" class=\"edui-box edui-button edui-for-insertparagraphbeforetable edui-default\">";
							htmlStr += "<div id=\"edui173_state\" onmousedown=\"$EDITORUI[\"edui173\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui173\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui173\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui173\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui173_body\" unselectable=\"on\" title=\"表格前插入行\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui173\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui173\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui178\" class=\"edui-box edui-button edui-for-charts edui-default\">";
							htmlStr += "<div id=\"edui178_state\" onmousedown=\"$EDITORUI[\"edui178\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui178\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui178\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui178\"].Stateful_onMouseOut(event, this);\" class=\"edui-default edui-state-disabled\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui178_body\" unselectable=\"on\" title=\"图表\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui178\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui178\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui179\" class=\"edui-box edui-button edui-for-simpleupload edui-default\">";
							htmlStr += "<div id=\"edui179_state\" onmousedown=\"$EDITORUI[\"edui179\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui179\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui179\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui179\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui179_body\" unselectable=\"on\" title=\"单图上传\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui179\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui179\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\">";
							htmlStr += "<iframe style=\"display: block; width: 20px; height: 20px; overflow: hidden; border: 0px none; margin: 0px; padding: 0px; position: absolute; top: 0px; left: 0px; opacity: 0; cursor: pointer;\"></iframe>";
							htmlStr += "<iframe style=\"display: block; width: 20px; height: 20px; overflow: hidden; border: 0px none; margin: 0px; padding: 0px; position: absolute; top: 0px; left: 0px; opacity: 0; cursor: pointer;\"></iframe>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui184\" class=\"edui-box edui-button edui-for-map edui-default\">";
							htmlStr += "<div id=\"edui184_state\" onmousedown=\"$EDITORUI[\"edui184\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui184\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui184\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui184\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui184_body\" unselectable=\"on\" title=\"Baidu地图\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui184\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui184\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui187\" class=\"edui-box edui-button edui-for-preview edui-default\">";
							htmlStr += "<div id=\"edui187_state\" onmousedown=\"$EDITORUI[\"edui187\"].Stateful_onMouseDown(event, this);\" onmouseup=\"$EDITORUI[\"edui187\"].Stateful_onMouseUp(event, this);\" onmouseover=\"$EDITORUI[\"edui187\"].Stateful_onMouseOver(event, this);\"";
							htmlStr += "onmouseout=\"$EDITORUI[\"edui187\"].Stateful_onMouseOut(event, this);\" class=\"edui-default\">";
							htmlStr += "<div class=\"edui-button-wrap edui-default\">";
							htmlStr += "<div id=\"edui187_body\" unselectable=\"on\" title=\"预览\" class=\"edui-button-body edui-default\" onmousedown=\"return $EDITORUI[\"edui187\"]._onMouseDown(event, this);\" onclick=\"return $EDITORUI[\"edui187\"]._onClick(event, this);\">";
							htmlStr += "<div class=\"edui-box edui-icon edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui1_message_holder\" class=\"edui-editor-messageholder edui-default\" style=\"top: 154px; z-index: 91;\"></div>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui1_iframeholder\" class=\"edui-editor-iframeholder edui-default\" style=\"width: 355px; height: 176px; z-index: 90; overflow: hidden;\">";
							htmlStr += "<iframe id=\"ueditor_0\" style=\"border:0px;\" src=\"javascript:void(function(){document.open();document.write(\"<!DOCTYPE html><html xmlns=\'http://www.w3.org/1999/xhtml\' class=\'view\' ><head><style type=\'text/css\'>.view{padding:0;word-wrap:break-word;cursor:text;height:90%;}";
							htmlStr += "body{margin:8px;font-family:sans-serif;font-size:16px;}p{margin:5px 0;}</style><link rel=\'stylesheet\' type=\'text/css\' href=\'http://localhost:8080/XProject/ueditor/themes/iframe.css\'/></head><body class=\'view\' ></body><script type=\'text\/javascript\'  id=\'_initialScript\'>setTimeout(function(){editor = window.parent.UE.instants[\'ueditorInstant0\'];editor._setup(document);},0);var _tmpScript = document.getElementById(\'_initialScript\');_tmpScript.parentNode.removeChild(_tmpScript);<\/script></html>document.close();}())\"";
							htmlStr += "width=\"100%\" height=\"100%\" frameborder=\"0\"></iframe>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui1_bottombar\" class=\"edui-editor-bottomContainer edui-default\">";
							htmlStr += "<table class=\"edui-default\">";
							htmlStr += "<tbody class=\"edui-default\">";
							htmlStr += "<tr class=\"edui-default\">";
							htmlStr += "<td id=\"edui1_elementpath\" class=\"edui-editor-bottombar edui-default\"></td>";
							htmlStr += "<td id=\"edui1_wordcount\" class=\"edui-editor-wordcount edui-default\">字数统计</td>";
							htmlStr += "</tr>";
							htmlStr += "</tbody>";
							htmlStr += "</table>";
							htmlStr += "</div>";
							htmlStr += "<div id=\"edui1_scalelayer\" class=\"edui-default\"></div>";
							htmlStr += "</div>";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "radio"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">单选按钮组</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<div class=\"radio i-checks\">";
							htmlStr += "<label id=\"lab1\"><input type=\"radio\" value=\"选项1\" name=\"rdobox\"> <i></i> <font>选项1</font></label>";
							htmlStr += "<label id=\"lab2\"><input type=\"radio\" value=\"选项2\" name=\"rdobox\"> <i></i> <font>选项2</font></label>";
							htmlStr += "<label id=\"lab3\"><input type=\"radio\" value=\"选项3\" name=\"rdobox\"> <i></i> <font>选项3</font></label>";
							htmlStr += "</div>";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "checkbox"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">复选按钮组</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<div class=\"checkbox i-checks\">";
							htmlStr += "<label id=\"lab1\"><input type=\"checkbox\" value=\"选项1\" name=\"ckbox\"> <i></i> <font>选项1</font></label>";
							htmlStr += "<label id=\"lab2\"><input type=\"checkbox\" value=\"选项2\" name=\"ckbox\"> <i></i> <font>选项2</font></label>";
							htmlStr += "<label id=\"lab3\"><input type=\"checkbox\" value=\"选项3\" name=\"ckbox\"> <i></i> <font>选项3</font></label>";
							htmlStr += "</div>";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "select"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">下拉列表</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<select class=\"form-control\" name=\"slt\">";
							htmlStr += "<option id=\"opt1\">选项1</option>";
							htmlStr += "<option id=\"opt2\">选项2</option>";
							htmlStr += "<option id=\"opt3\">选项3</option>";
							htmlStr += "</select>";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "selectmore"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">下拉复选列表</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<select class=\"form-control\" multiple=\"\">";
							htmlStr += "<option id=\"opt1\">选项1</option>";
							htmlStr += "<option id=\"opt2\">选项2</option>";
							htmlStr += "<option id=\"opt3\">选项3</option>";
							htmlStr += "</select>";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "date"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">日期时间</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<input class=\"form-control layer-date laydate-icon\" placeholder=\"单击选择时间\" onclick=\"laydate({istime: true, format: \'YYYY-MM-DD hh:mm:ss\'})\">";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "hidden"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">隐藏域</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<input type=\"hidden\" name=\"hidden\" />";
						}else if(type == "file"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">文件上传</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<input type=\"file\" name=\"\">";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
						}else if(type == "subform"){
							htmlStr += "<label class=\"col-sm-3 control-label commlab\">子表单</label>";
							htmlStr += "<div class=\"col-sm-9 common\">";
							htmlStr += "<p class=\"form-control-static\" id=\"subform\">请选择需引用的表单</p>";
						}else if(type == "line"){
							//htmlStr += "<label class=\"col-sm-3 control-label line\">分割线</label>";
							htmlStr += "<div class=\"col-sm-12 line\">";
							htmlStr += "<span class=\"help-block m-b-none\"></span>";
							htmlStr += "<div class=\"hr-line-dashed\" id=\"line\"></div>";
						}
						htmlStr += "</div>";
						htmlStr += "</div>";
						var $el = $(htmlStr).attr("id","item"+i).addClass("dropped").css({
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
						//根据表单布局调整拖拽控件显示
						if(formLayout == 'h'){
							/* $el.find(".col-sm-12.common").attr("class","col-sm-9 common");
							$el.find(".col-sm-3.commlab").attr("class","col-sm-3 control-label commlab");
							$el.find(".i-checks br").remove();  */
						}else if(formLayout == 'z'){
							$el.find(".col-sm-3.commlab").attr("class","col-sm-3 survey_subject commlab");
							$el.find(".col-sm-9.common").attr("class","col-sm-12 common");
							$el.find(".i-checks label").after("<br/>");
							//删除最后一个选项后的br标签
							$el.find(".i-checks").each(function (){
								$(this).find("br:last").remove();//删除最后一个多余的br标签
							});
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
				/* //当拖动的元素高亮并显示属性
				//显示控件属性
        		changePane("widget");
				changeBgColor(currentObj);
       			var divId = currentObj.attr("id");
       			showHidePropDiv($("#"+divId+"_prop")); */
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
       			//增加绑定事件
       			$("#fx-frame-east").attr("class","widget-tab-select");
       			var type = $(this).attr("xtype");
       			if(type != undefined){
	       			var propertyId = divId+"_prop";
	       			if(type == 'radio'){
	             		$("#"+propertyId+"_rdoItemDiv label").each(function(){
	        	     		var i = $(this).find("input[type='radio']").val();
	        	     		//对外围label增加事件
	             			$(this).bind("click",function(){
	                 			updateValue('isCheckRdo',divId+"_"+i);
	                 	    });
	             			//对ins(勾选框)增加事件
	             			$(this).find("ins").bind("click",function(){
	             				updateValue('isCheckRdo',divId+"_"+i);
	             	    	});
	             		});
	             	}else if(type == 'checkbox'){
	             		$("#"+propertyId+"_ckbItemDiv label").each(function(){
	        	     		var i = $(this).find("input[type='checkbox']").val();
	        	     		//对外围label增加事件
	             			$(this).bind("click",function(){
	                 			updateValue('isCheckCkb',divId+"_"+i);
	                 	    });
	             			//对ins(勾选框)增加事件
	             			$(this).find("ins").bind("click",function(){
	             				updateValue('isCheckCkb',divId+"_"+i);
	             	    	});
	             		});
	             	}else if(type == 'select'){
	             		$("#"+propertyId+"_slcItemDiv label").each(function(){
	        	     		var i = $(this).find("input[type='radio']").val();
	        	     		//对外围label增加事件
	             			$(this).bind("click",function(){
	                 			updateValue('isCheckSlc',divId+"_"+i);
	                 	    });
	             			//对ins(勾选框)增加事件
	             			$(this).find("ins").bind("click",function(){
	             				updateValue('isCheckSlc',divId+"_"+i);
	             	    	});
	             		});
	             	}else if(type == 'selectmore'){
	             		$("#"+propertyId+"_slmItemDiv label").each(function(){
	        	     		var i = $(this).find("input[type='checkbox']").val();
	        	     		//对外围label增加事件
	             			$(this).bind("click",function(){
	                 			updateValue('isCheckSlm',divId+"_"+i);
	                 	    });
	             			//对ins(勾选框)增加事件
	             			$(this).find("ins").bind("click",function(){
	             				updateValue('isCheckSlm',divId+"_"+i);
	             	    	});
	             		});
	             	}
       			}
       		}
        );
		// 鼠标悬浮 变色 
        $(document).on("mouseover", ".form-group.dropped",
       		function(ev) {
        	if(!$(this).hasClass("clickBg")){
	        	$(this).addClass("overBg");
        	}
        });
		
     // 鼠标离开 变色 
        $(document).on("mouseout", ".form-group.dropped",
       		function(ev) {
        	$(this).removeClass("overBg");
        });
        
        function createProperties(id,type){
        	var propertyId = id + "_prop";//创建属性div 的id名
        	var htmlStr = "<div class=\"fx_config_pane\" id=\""+propertyId+"\" style=\"display:none;\">";
        	//根据type封装不同的属性div
        	if(type == 'text'){//文本框
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>标题</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>单行文本</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"文本框\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
            	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
            	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>格式</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_combo\" style=\"width: 240px; height: 30px; line-height: 28px;\">";
            	htmlStr += "<select class=\"fui_trigger-input\" name=\""+propertyId+"_format\" id=\""+propertyId+"_format\" onchange=\"updateValue('txtFormat',\'"+id+"\')\">";
            	htmlStr += "<option value=\"\">无</option>";
            	htmlStr += "<option value=\"email\">邮箱</option>";
            	htmlStr += "<option value=\"phone\">手机号码</option>";
            	htmlStr += "<option value=\"tel\">固定电话</option>";
            	htmlStr += "<option value=\"code\">邮政编码</option>";
            	htmlStr += "</select>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>默认值</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" widgetname=\"defaultInput\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\">";
            	htmlStr += "</div>";
        	}else if(type == 'password'){//密码输入框
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>标题</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>密码文本</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"密码框\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
            	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
            	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>默认值</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" widgetname=\"defaultInput\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\">";
            	htmlStr += "</div>";
        	}else if(type == 'number'){//数值
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>标题</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>数字</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"数字\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
            	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
            	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>最小值</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_min\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>最大值</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_max\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>小数点后几位</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_pre\" id=\""+propertyId+"_pre\" onblur=\"updateValue(\'precision\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>默认值</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" widgetname=\"defaultInput\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'precision\',\'"+id+"\')\">";
            	htmlStr += "</div>";
        	}else if(type == 'textarea'){//多行文本
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>标题</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>多行文本</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"多行文本\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
            	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
            	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>默认值</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" widgetname=\"defaultInput\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'areadfValue\',\'"+id+"\')\">";
            	htmlStr += "</div>";
        	}else if(type == 'richtext'){//富文本
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>标题</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>富文本</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"富文本\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
            	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
            	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>默认值</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" widgetname=\"defaultInput\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'richvalue\',\'"+id+"\')\">";
            	htmlStr += "</div>";
        	}else if(type == 'radio'){//单选按钮组
	        	htmlStr += "<div class=\"cfg_title\">";
	         	htmlStr += "<span>标题</span>";
	         	htmlStr += "<div class=\"cfg_widget_type\"><span>单选按钮组</span></div>";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
	         	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"单选按钮组\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_split\"></div>";
	         	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
	         	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
	         	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	         	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>选项</span></div>";
            	htmlStr += "<div class=\"cfg_content fx_selection_pane\">";
            	htmlStr += "<div id=\""+propertyId+"_rdoItemDiv\">";
            	//-------选项1
            	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem1_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdo\" value=\"1\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_rdoItem1\" value=\"选项1\" id=\""+propertyId+"_rdoItem1\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_1\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "</div>";
            	//------选项2
            	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem2_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdo\" value=\"2\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_rdoItem2\" value=\"选项2\" id=\""+propertyId+"_rdoItem2\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_2\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_2\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem2_div\',\'2\',\'radio\')\" title=\"移除\">";
            	htmlStr += "</div>";
            	//------选项3
            	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem3_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdo\" value=\"3\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_rdoItem3\" value=\"选项3\" id=\""+propertyId+"_rdoItem3\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_3\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_3\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem3_div\',\'3\',\'radio\')\" title=\"移除\">";
            	htmlStr += "</div>";
            	//------end
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"add_btn_group\">";
            	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'radio\')\">添加选项</div>";
            	htmlStr += "<div class=\"add_item add_other\" onclick=\"addItem(\'"+id+"\',\'rdoOther\')\">添加其他选项</div>";
            	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_rdoItemDiv\',\'radio\')\">批量编辑</div>";
            	htmlStr += "</div>";
            	htmlStr += "</div>";
        	}else if(type == 'checkbox'){//复选框
	        	htmlStr += "<div class=\"cfg_title\">";
	         	htmlStr += "<span>标题</span>";
	         	htmlStr += "<div class=\"cfg_widget_type\"><span>复选按钮组</span></div>";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
	         	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"复选按钮组\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_split\"></div>";
	         	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
	         	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
	         	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_split\"></div>";
	         	//-----以下为选项
	         	htmlStr += "<div class=\"cfg_title\"><span>选项</span></div>";
            	htmlStr += "<div class=\"cfg_content fx_selection_pane\">";
            	htmlStr += "<div id=\""+propertyId+"_ckbItemDiv\">";
            	//-------选项1
            	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem1_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckb\" id=\""+propertyId+"_ckb1\" value=\"1\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_ckbItem1\" value=\"选项1\" id=\""+propertyId+"_ckbItem1\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_1\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "</div>";
            	//-------选项2
            	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem2_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckb\" id=\""+propertyId+"_ckb2\" value=\"2\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_ckbItem2\" value=\"选项2\" id=\""+propertyId+"_ckbItem2\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_2\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_2\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem2_div\',\'2\',\'checkbox\')\" title=\"移除\">";
            	htmlStr += "</div>";
            	//-------选项3
            	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem3_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckb\" id=\""+propertyId+"_ckb3\" value=\"3\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_ckbItem3\" value=\"选项3\" id=\""+propertyId+"_ckbItem3\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_3\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_3\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem3_div\',\'3\',\'checkbox\')\" title=\"移除\">";
            	htmlStr += "</div>";
            	//-------end
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"add_btn_group\">";
            	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'checkbox\')\">添加选项</div>";
            	htmlStr += "<div class=\"add_item add_other\" onclick=\"addItem(\'"+id+"\',\'ckbOther\')\">添加其他选项</div>";
            	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_ckbItemDiv\',\'checkbox\')\">批量编辑</div>";
            	htmlStr += "</div>";
            	htmlStr += "</div>";
        	}else if(type == 'select'){//下拉列表
        		htmlStr += "<div class=\"cfg_title\">";
	         	htmlStr += "<span>标题</span>";
	         	htmlStr += "<div class=\"cfg_widget_type\"><span>下拉列表</span></div>";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
	         	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"下拉列表\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_split\"></div>";
	         	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
	         	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
	         	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	         	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>选项</span></div>";
            	htmlStr += "<div class=\"cfg_content fx_selection_pane\">";
            	htmlStr += "<div id=\""+propertyId+"_slcItemDiv\">";
            	//-------选项1
            	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem1_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slc\" value=\"1\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slcItem1\" value=\"选项1\" id=\""+propertyId+"_slcItem1\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckSlc\',\'"+id+"_1\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "</div>";
            	//------选项2
            	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem2_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slc\" value=\"2\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slcItem2\" value=\"选项2\" id=\""+propertyId+"_slcItem2\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_2\')\" onclick=\"updateValue(\'isCheckSlc\',\'"+id+"_2\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem2_div\',\'2\',\'select\')\" title=\"移除\">";
            	htmlStr += "</div>";
            	//------选项3
            	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem3_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slc\" value=\"3\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slcItem3\" value=\"选项3\" id=\""+propertyId+"_slcItem3\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_3\')\" onclick=\"updateValue(\'isCheckSlc\',\'"+id+"_3\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem3_div\',\'3\',\'select\')\" title=\"移除\">";
            	htmlStr += "</div>";
            	//------end
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"add_btn_group\">";
            	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'select\')\">添加选项</div>";
            	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_slcItemDiv\',\'select\')\">批量编辑</div>";
            	htmlStr += "</div>";
            	htmlStr += "</div>";
        	}else if(type == 'selectmore'){//下拉复选列表
        		htmlStr += "<div class=\"cfg_title\">";
	         	htmlStr += "<span>标题</span>";
	         	htmlStr += "<div class=\"cfg_widget_type\"><span>下拉复选列表</span></div>";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
	         	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"下拉复选列表\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_split\"></div>";
	         	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
	         	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
	         	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	         	htmlStr += "</div>";
	         	htmlStr += "<div class=\"cfg_split\"></div>";
	         	//-----以下为选项
	         	htmlStr += "<div class=\"cfg_title\"><span>选项</span></div>";
            	htmlStr += "<div class=\"cfg_content fx_selection_pane\">";
            	htmlStr += "<div id=\""+propertyId+"_slmItemDiv\">";
            	//-------选项1
            	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem1_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slm\" id=\""+propertyId+"_slm1\" value=\"1\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slmItem1\" value=\"选项1\" id=\""+propertyId+"_slmItem1\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckSlmInput\',\'"+id+"_1\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "</div>";
            	//-------选项2
            	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem2_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slm\" id=\""+propertyId+"_slm2\" value=\"2\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slmItem2\" value=\"选项2\" id=\""+propertyId+"_slmItem2\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_2\')\" onclick=\"updateValue(\'isCheckSlmInput\',\'"+id+"_2\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem2_div\',\'2\',\'selectmore\')\" title=\"移除\">";
            	htmlStr += "</div>";
            	//-------选项3
            	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem3_div\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slm\" id=\""+propertyId+"_slm3\" value=\"3\">";
            	htmlStr += "<i></i><font>";
            	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slmItem3\" value=\"选项3\" id=\""+propertyId+"_slmItem3\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_3\')\" onclick=\"updateValue(\'isCheckSlmInput\',\'"+id+"_3\')\">";
            	htmlStr += "</font>";
            	htmlStr += "</label>";
            	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem3_div\',\'3\',\'selectmore\')\" title=\"移除\">";
            	htmlStr += "</div>";
            	//-------end
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"add_btn_group\">";
            	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'selectmore\')\">添加选项</div>";
            	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_slmItemDiv\',\'selectmore\')\">批量编辑</div>";
            	htmlStr += "</div>";
            	htmlStr += "</div>";
        	}else if(type == 'date'){//日期时间
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>标题</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>日期时间</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"日期时间\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
            	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
            	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>类型</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_combo\" style=\"width: 240px; height: 30px; line-height: 28px;\">";
            	htmlStr += "<select class=\"fui_trigger-input\" name=\""+propertyId+"_format\" id=\""+propertyId+"_format\" onchange=\"updateValue('dateFormat',\'"+id+"\')\">";
            	htmlStr += "<option value=\"ymdhms\">年-月-日 时:分:秒</option>";
            	htmlStr += "<option value=\"ymdhm\">年-月-日 时:分</option>";
            	htmlStr += "<option value=\"ymd\">年-月-日</option>";
            	htmlStr += "<option value=\"ym\">年-月</option>";
            	htmlStr += "<option value=\"hms\">时:分:秒</option>";
            	htmlStr += "<option value=\"hm\">时:分</option>";
            	htmlStr += "</select>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>默认值</span></div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" widgetname=\"defaultInput\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\">";
            	htmlStr += "</div>";
        	}else if(type == 'hidden'){//隐藏域
        		htmlStr += "<div class=\"cfg_title\"><span>默认值</span>";
        		htmlStr += "<div class=\"cfg_widget_type\"><span>隐藏域</span></div>";
        		htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" widgetname=\"defaultInput\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\">";
            	htmlStr += "</div>";
        	}else if(type == 'file'){//文本域
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>标题</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>文件上传</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"文件上传\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
            	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
            	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
            	htmlStr += "</div>";
        	}else if(type == 'subform'){//子表单
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>标题</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>子表单</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<input class=\"x-input\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"子表单\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>待开发...</span>";
            	htmlStr += "</div>";
        	}else if(type == 'line'){//分隔符
        		htmlStr += "<div class=\"cfg_title\">";
            	htmlStr += "<span>类型</span>";
            	htmlStr += "<div class=\"cfg_widget_type\"><span>分隔符</span></div>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
            	htmlStr += "<select class=\"fui_trigger-input\" id=\""+propertyId+"_format\" name=\""+propertyId+"_format\" onchange=\"updateValue(\'lineType\',\'"+id+"\')\">";
            	htmlStr += "<option value=\"dashed\">虚线</option>";
            	htmlStr += "<option value=\"solid\">实线</option>";
            	htmlStr += "</select>";
            	htmlStr += "</div>";
            	htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>描述信息</span></div>";
            	htmlStr += "<div class=\"cfg_content x-richtext\" style=\"width: 240px;\">";
            	htmlStr += "<textarea class=\"note-codable\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
            	htmlStr += "</div>";
        	}
        	//str += '说明文字:<br/><input type="text" name="'+propertyId+'_des" id="'+propertyId+'_des" onblur="updateValue(\'des\',\''+id+'\')"><br/>';
        	if(type != 'line'){
        		htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>校验</span></div>";
        		//----begin
            	htmlStr += "<div class=\"cfg_content x-check\">";
            	//----------checkbox
            	htmlStr += "<div class=\"checkbox i-checks\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"checkbox\" value=\"1\" name=\""+propertyId+"_check\">";
            	htmlStr += "<i></i><font>必填</font>";
            	htmlStr += "</label>";
            	htmlStr += "</div>";
            	//-----------
            /* 	htmlStr += "<div class=\"checkbox i-checks\">";
            	htmlStr += "<label>";
            	htmlStr += "<input type=\"checkbox\" value=\"unique\" name=\""+propertyId+"_whrite\">";
            	htmlStr += "<i></i><font>不允许重复值</font>";
            	htmlStr += "</label>";
            	htmlStr += "</div>"; */
            	//-----------
            	htmlStr += "</div>";
            	//----end
            	/* htmlStr += "<div class=\"cfg_split\"></div>";
            	htmlStr += "<div class=\"cfg_title\"><span>操作权限</span></div>"; */
            	//--------begin
            	/* htmlStr += "<div class=\"cfg_content x-check\">"; */
            	//--------
            	/* htmlStr += "<div class=\"checkbox i-checks\">";
            	htmlStr += "<label id=\"item1_lab3\">";
            	htmlStr += "<input type=\"checkbox\" value=\"show\" name=\""+propertyId+"_show\" checked>";
            	htmlStr += "<i></i><font>可见</font>";
            	htmlStr += "</label>";
            	htmlStr += "</div>"; */
            	//--------
            	/* htmlStr += "<div class=\"checkbox i-checks\">";
            	htmlStr += "<label id=\"item2_lab2\">";
            	htmlStr += "<input type=\"checkbox\" value=\"edit\" name=\""+propertyId+"_edit\" checked>";
            	htmlStr += "<i></i><font>可编辑</font>";
            	htmlStr += "</label>";
            	htmlStr += "</div>"; */
            	//--------
            	/* htmlStr += "</div>"; */
            	//----end
        	}
            //str += '排序:<br/><input type="text" readOnly name="'+propertyId+'_sort" id="'+propertyId+'_sort" value="'+(i)+'"></div>';
            htmlStr += "<div class=\"cfg_split\"></div>";
            htmlStr += "<div class=\"cfg_title\"><span>排序</span></div>";
           	htmlStr += "<div class=\"cfg_content fui_text\" style=\"width: 240px; height: 30px;\">";
           	htmlStr += "<input class=\"x-input\" readOnly name=\""+propertyId+"_sort\" id=\""+propertyId+"_sort\" type=\"text\" value=\""+(i)+"\">";
           	htmlStr += "</div>";
           	//--------
            htmlStr += "</div>";
            $(htmlStr).appendTo($("#widget-config-pane"));
        	
        	//存储创建标签信息
        	var v = $("#tagNames").val();
        	v += ";" + id + "_" + type;
        	$("#tagNames").val(v);

        	//执行一下
       	 	$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})
        	showHidePropDiv($("#"+propertyId));
        	//显示控件属性
        	changePane("widget");
        	changeBgColor($("#"+id));
        	
        	//绑定单选框/复选框事件
         	if(type == 'radio'){
         		$("#"+propertyId+"_rdoItemDiv label").each(function(){
    	     		var i = $(this).find("input[type='radio']").val();
    	     		//对外围label增加事件
         			$(this).bind("click",function(){
             			updateValue('isCheckRdo',id+"_"+i);
             	    });
         			//对ins(勾选框)增加事件
         			$(this).find("ins").bind("click",function(){
         				updateValue('isCheckRdo',id+"_"+i);
         	    	});
         		});
         	}else if(type == 'checkbox'){
         		$("#"+propertyId+"_ckbItemDiv label").each(function(){
    	     		var i = $(this).find("input[type='checkbox']").val();
    	     		//对外围label增加事件
         			$(this).bind("click",function(){
             			updateValue('isCheckCkb',id+"_"+i);
             	    });
         			//对ins(勾选框)增加事件
         			$(this).find("ins").bind("click",function(){
         				updateValue('isCheckCkb',id+"_"+i);
         	    	});
         		});
         	}else if(type == 'select'){
         		$("#"+propertyId+"_slcItemDiv label").each(function(){
    	     		var i = $(this).find("input[type='radio']").val();
    	     		//对外围label增加事件
         			$(this).bind("click",function(){
             			updateValue('isCheckSlc',id+"_"+i);
             	    });
         			//对ins(勾选框)增加事件
         			$(this).find("ins").bind("click",function(){
         				updateValue('isCheckSlc',id+"_"+i);
         	    	});
         		});
         	}else if(type == 'selectmore'){
         		$("#"+propertyId+"_slmItemDiv label").each(function(){
    	     		var i = $(this).find("input[type='checkbox']").val();
    	     		//对外围label增加事件
         			$(this).bind("click",function(){
             			updateValue('isCheckSlm',id+"_"+i);
             	    });
         			//对ins(勾选框)增加事件
         			$(this).find("ins").bind("click",function(){
         				updateValue('isCheckSlm',id+"_"+i);
         	    	});
         		});
         	}
        }
        //选中div 背景色加亮
        function changeBgColor(obj){
        	//选中背景色加深操作 
        	//清空所有拖拽过来的元素背景色
        	$(".form-group.dropped.clickBg").removeClass("clickBg");
        	$(obj).removeClass("overBg");//去除悬浮样式
        	$(obj).addClass("clickBg");//给选中的元素增加背景色加深
        }
        //选中div显示所属属性div，并隐藏其他
        function showHidePropDiv(obj){
        	$("#widget-config-pane .fx_config_pane").each(function(){//隐藏所有的存放属性的div
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
        
      //修改控件属性,联动修改拖拽的控件显示
        function updateValue(type,id){
    	  	//更改表单
    	  	if(type == "templateName"){
    	  		$("#form-name").html($("#templateName").val());
    	  	}
    	  
        	if(type=='title'){
	        	$("#"+id+" label.control-label").html($("#"+id+"_prop_title").val());
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
        	}else if(type=='isCheckCkbInput'){//选中事件 -复选按钮组 单击内容input
        		var array = id.split("_");
        		//重置所有单选选项勾选状态
        		if($("#"+array[0]+"_prop_ckb"+array[1]).is(':checked')){//由于执行顺序关系,单击文本框事件在前,关联勾选复选框在后,所以此处要写反
        			$("#"+array[0]+"_lab"+array[1]+" .icheckbox_square-green").attr("class","icheckbox_square-green");
        		}else{
	        		//关联勾选状态
	        		$("#"+array[0]+"_lab"+array[1]+" .icheckbox_square-green").attr("class","icheckbox_square-green checked");
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
        	}else if(type=='isCheckSlmInput'){//选中事件 -下拉复选列表选项 单击文本框 此处同isCheckCkbInput原理一致
        		var array = id.split("_");
        		//重置所有选项选中状态
        		if($("#"+array[0]+"_prop_slm"+array[1]).is(':checked')){
	        		//关联勾选状态
        			$("#"+array[0]+"_opt"+array[1]).removeAttr('selected');
        		}else{
	        		$("#"+array[0]+"_opt"+array[1]).attr('selected',true);
	        		$("#"+array[0]+"_opt"+array[1]).prop('selected',true);
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
        	}
        }
       
     //增加选项
     function addItem(id,type){
    	 var formLayout = $("#formLayout").val();//页面布局
    	 var htmlStr = "";
    	 var propertyId = id + "_prop";
    	 if(type=="radio"){
	    	//拖放显示:增加选项
	    	if(formLayout == "z"){
	    		htmlStr += '<br/>';
	    	}
	    	htmlStr += '<label id="'+id+'_lab'+rdoIndex+'"><div style="position: relative;" class="iradio_square-green">';
	    	htmlStr += '<input style="position: absolute; opacity: 0;" type="radio" value="选项" name="'+id+'_rdobox">';
	    	htmlStr += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	    	htmlStr += '<i></i> <font>选项</font></label>';
	    	$(htmlStr).appendTo($("#"+id+" div.radio.i-checks"));
	    	//属性栏:增加选项
	    	htmlStr = "";
	    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem"+rdoIndex+"_div\">";
         	htmlStr += "<label>";
         	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdo\" value=\""+rdoIndex+"\">";
         	htmlStr += "<i></i><font>";
         	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_rdoItem"+rdoIndex+"\" value=\"选项\" id=\""+propertyId+"_rdoItem"+rdoIndex+"\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_"+rdoIndex+"\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_"+rdoIndex+"\')\">";
         	htmlStr += "</font>";
         	htmlStr += "</label>";
         	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem"+rdoIndex+"_div\',\'"+rdoIndex+"\',\'radio\')\" title=\"移除\">";
         	htmlStr += "</div>";
	    	$(htmlStr).appendTo($("#"+propertyId+"_rdoItemDiv"));
	    	rdoIndex++;
    	 }else if(type=="rdoOther"){//单选按钮组 其他可输入
    		//拖放显示:增加选项
    		 if(formLayout == "z"){
 	    		htmlStr += '<br/>';
 	    	 }
    		 htmlStr += '<label id="'+id+'_lab'+rdoIndex+'"><div style="position: relative;" class="iradio_square-green">';
    		 htmlStr += '<input style="position: absolute; opacity: 0;" type="radio" value="其他" name="'+id+'_rdobox">';
    		 htmlStr += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
    		 htmlStr += '<i></i> <font>其他</font>&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;"></label>';
	    	 $(htmlStr).appendTo($("#"+id+" div.radio.i-checks"));
	    	//属性栏:增加选项
	    	 htmlStr = "";
	    	 htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem"+rdoIndex+"_div\">";
         	 htmlStr += "<label>";
         	 htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdo\" value=\""+rdoIndex+"\">";
         	 htmlStr += "<i></i><font>";
         	 htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_rdoItem"+rdoIndex+"\" value=\"其他\" readOnly id=\""+propertyId+"_rdoItem"+rdoIndex+"\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_"+rdoIndex+"\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_"+rdoIndex+"\')\">";
          	 htmlStr += "</font>";
         	 htmlStr += "</label>";
         	 htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem"+rdoIndex+"_div\',\'"+rdoIndex+"\',\'radio\')\" title=\"移除\">";
         	 htmlStr += "</div>";
         	$(htmlStr).appendTo($("#"+propertyId+"_rdoItemDiv"));
	    	 rdoIndex++;
    	 }else if(type=="checkbox"){
	    	//拖放显示:增加选项
    		 if(formLayout == "z"){
  	    		htmlStr += '<br/>';
  	    	 }
	    	 htmlStr += '<label id="'+id+'_lab'+ckbIndex+'"><div style="position: relative;" class="icheckbox_square-green">';
	    	 htmlStr += '<input style="position: absolute; opacity: 0;" value="选项" name="'+id+'_ckbox" type="checkbox">';
	    	 htmlStr += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	    	 htmlStr += '<i></i> <font>选项</font></label>';
	    	 $(htmlStr).appendTo($("#"+id+" div.checkbox.i-checks"));
	    	//属性栏:增加选项
	    	 htmlStr = "";
	    	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem"+ckbIndex+"_div\">";
         	 htmlStr += "<label>";
         	 htmlStr += "<input type=\"checkbox\" id=\""+propertyId+"_ckb"+ckbIndex+"\" name=\""+propertyId+"_ckb\" value=\""+ckbIndex+"\">";
         	 htmlStr += "<i></i><font>";
         	 htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_ckbItem"+ckbIndex+"\" value=\"选项\" id=\""+propertyId+"_ckbItem"+ckbIndex+"\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_"+ckbIndex+"\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_"+ckbIndex+"\')\">";
         	 htmlStr += "</font>";
         	 htmlStr += "</label>";
         	 htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem"+ckbIndex+"_div\',\'"+ckbIndex+"\',\'checkbox\')\" title=\"移除\">";
         	 htmlStr += "</div>";
         	$(htmlStr).appendTo($("#"+propertyId+"_ckbItemDiv"));
	    	 ckbIndex++;
    	 }else if(type=="ckbOther"){
	    	//拖放显示:增加选项
    		 if(formLayout == "z"){
  	    		htmlStr += '<br/>';
  	    	 }
	    	 htmlStr += '<label id="'+id+'_lab'+ckbIndex+'"><div style="position: relative;" class="icheckbox_square-green">';
	    	 htmlStr += '<input style="position: absolute; opacity: 0;" value="其他" name="'+id+'_ckbox" type="checkbox">';
	    	 htmlStr += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	    	 htmlStr += '<i></i> <font>其他</font>&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;"></label>';
	    	 $(htmlStr).appendTo($("#"+id+" div.checkbox.i-checks"));
	    	//属性栏:增加选项
	    	 htmlStr = "";
	    	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem"+ckbIndex+"_div\">";
         	 htmlStr += "<label>";
         	 htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckb\" id=\""+propertyId+"_ckb"+ckbIndex+"\" value=\""+ckbIndex+"\">";
         	 htmlStr += "<i></i><font>";
         	 htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_ckbItem"+ckbIndex+"\" value=\"其他\" readOnly id=\""+propertyId+"_ckbItem"+ckbIndex+"\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_"+ckbIndex+"\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_"+ckbIndex+"\')\">";
         	 htmlStr += "</font>";
         	 htmlStr += "</label>";
         	 htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem"+ckbIndex+"_div\',\'"+ckbIndex+"\',\'checkbox\')\" title=\"移除\">";
         	 htmlStr += "</div>";
         	 $(htmlStr).appendTo($("#"+propertyId+"_ckbItemDiv"));
	    	 ckbIndex++;
    	 }else if(type=="select"){
	    	//拖放显示:增加选项
	    	 htmlStr = '<option id="'+id+'_opt'+slcIndex+'">选项</option>';
	    	 $(htmlStr).appendTo($("#"+id+" select"));
	    	//属性栏:增加选项
	    	 htmlStr = "";
	    	 htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem"+slcIndex+"_div\">";
         	 htmlStr += "<label>";
         	 htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slc\" name=\""+propertyId+"_slc"+slcIndex+"\" value=\""+slcIndex+"\">";
         	 htmlStr += "<i></i><font>";
         	 htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slcItem"+slcIndex+"\" value=\"选项\" id=\""+propertyId+"_slcItem"+slcIndex+"\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_"+slcIndex+"\')\" onclick=\"updateValue(\'isCheckSlc\',\'"+id+"_"+slcIndex+"\')\">";
         	 htmlStr += "</font>";
         	 htmlStr += "</label>";
         	 htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem"+slcIndex+"_div\',\'"+slcIndex+"\',\'select\')\" title=\"移除\">";
         	 htmlStr += "</div>";
         	 $(htmlStr).appendTo($("#"+propertyId+"_slcItemDiv"));
	    	 slcIndex++;
    	 }else if(type=="selectmore"){
    		//拖放显示:增加选项
    		 htmlStr = '<option id="'+id+'_opt'+slmIndex+'">选项</option>';
	    	 $(htmlStr).appendTo($("#"+id+" select"));
	    	//属性栏:增加选项
	    	 htmlStr = "";
	    	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem"+slmIndex+"_div\">";
         	 htmlStr += "<label>";
         	 htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slm\" id=\""+propertyId+"_slm"+slmIndex+"\" value=\""+slmIndex+"\">";
         	 htmlStr += "<i></i><font>";
         	 htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slmItem"+slmIndex+"\" value=\"选项\" id=\""+propertyId+"_slmItem"+slmIndex+"\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_"+slmIndex+"\')\" onclick=\"updateValue(\'isCheckSlmInput\',\'"+id+"_"+slmIndex+"\')\">";
         	 htmlStr += "</font>";
         	 htmlStr += "</label>";
         	 htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem"+slmIndex+"_div\',\'"+slmIndex+"\',\'selectmore\')\" title=\"移除\">";
         	 htmlStr += "</div>";
         	 $(htmlStr).appendTo($("#"+propertyId+"_slmItemDiv"));
	    	 slmIndex++;
    	 }
    	//执行一下
    	 $(".i-checks:not(:has(ins))").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
    	//绑定单选框/复选框事件
     	if(type == 'radio' || type == 'rdoOther'){
     		$("#"+propertyId+"_rdoItemDiv label").each(function(){
	     		var i = $(this).find("input[type='radio']").val();
	     		//对外围label增加事件
     			$(this).bind("click",function(){
         			updateValue('isCheckRdo',id+"_"+i);
         	    });
     			//对ins(勾选框)增加事件
     			$(this).find("ins").bind("click",function(){
     				updateValue('isCheckRdo',id+"_"+i);
     	    	});
     		});
     	}else if(type == 'checkbox' || type == 'ckbOther'){
     		$("#"+propertyId+"_ckbItemDiv label").each(function(){
	     		var i = $(this).find("input[type='checkbox']").val();
	     		//对外围label增加事件
     			$(this).bind("click",function(){
         			updateValue('isCheckCkb',id+"_"+i);
         	    });
     			//对ins(勾选框)增加事件
     			$(this).find("ins").bind("click",function(){
     				updateValue('isCheckCkb',id+"_"+i);
     	    	});
     		});
     	}else if(type == 'select'){
     		$("#"+propertyId+"_slcItemDiv label").each(function(){
	     		var i = $(this).find("input[type='radio']").val();
	     		//对外围label增加事件
     			$(this).bind("click",function(){
         			updateValue('isCheckSlc',id+"_"+i);
         	    });
     			//对ins(勾选框)增加事件
     			$(this).find("ins").bind("click",function(){
     				updateValue('isCheckSlc',id+"_"+i);
     	    	});
     		});
     	}else if(type == 'selectmore'){
     		$("#"+propertyId+"_slmItemDiv label").each(function(){
	     		var i = $(this).find("input[type='checkbox']").val();
	     		//对外围label增加事件
     			$(this).bind("click",function(){
         			updateValue('isCheckSlm',id+"_"+i);
         	    });
     			//对ins(勾选框)增加事件
     			$(this).find("ins").bind("click",function(){
     				updateValue('isCheckSlm',id+"_"+i);
     	    	});
     		});
     	}
     }
     
     //移除选项
     function removeItem(id,propertyId,index,type){
    	 if(type=="radio"){
	    	 $("#"+propertyId).remove();
	    	 $("#"+id+"_lab"+index).prev("br").remove();
	    	 $("#"+id+"_lab"+index).remove();
    	 }else if(type=="checkbox"){
    		 $("#"+propertyId).remove();
    		 $("#"+id+"_lab"+index).prev("br").remove();
	    	 $("#"+id+"_lab"+index).remove();
    	 }else if(type=="select"){
    		 $("#"+propertyId).remove();
    		 $("#"+id+"_opt"+index).remove();
    	 }else if(type=="selectmore"){
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
			
			if($("#formLayout").val() == "z"){
				$("#form-widget-list .col-sm-3.commlab").attr("class","col-sm-3 survey_subject commlab");
				$("#form-widget-list .col-sm-9.common").attr("class","col-sm-12 common");
				$("#form-widget-list .i-checks label").after("<br/>");
				//删除最后一个选项后的br标签
				$("#form-widget-list .i-checks").each(function (){
					$(this).find("br:last").remove();//删除最后一个多余的br标签
				});
			}
		});
		function submitForm(){
			//解绑离开事件
			window.onbeforeunload = null;
			var f  =document.getElementById("valueForm");
			f.action = "${ctx}/formInput/saveNew";
			
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
			var viewDiv = $("#form-widget-list").children().clone();
			$(viewDiv).find(".clickBg").removeClass("clickBg");
			$(viewDiv).find(".overBg").removeClass("overBg");
			var k = 1;
			//去除class 作用：去除div的单击事件
			$(viewDiv).find(".form-group.dropped").removeClass("dropped");
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
		
		function changePane(v){
			if(v == "widget"){
				$("#fx-frame-east").attr("class","widget-tab-select");
			}else{
				$("#fx-frame-east").attr("class","form-tab-select");
			}
		}
		
		function changeFormShowModel(id){
			var formLayout = $("#formLayout").val();//标识当前布局格式 h标识横排 z标识纵排
			//布局显示模式 h横排 z纵排
			if(id == 'm_h'){//横排
				if(formLayout != 'h'){
					$("#m_z").removeClass("selected");
					$("#form-widget-list .col-sm-12.common").attr("class","col-sm-9 common");
					$("#form-widget-list .col-sm-3.commlab").attr("class","col-sm-3 control-label commlab");
					$("#form-widget-list .i-checks br").remove(); 
					$("#formLayout").val("h");
				}
			}else{//m_z 纵排
				if(formLayout != 'z'){
					$("#m_h").removeClass("selected");
					$("#form-widget-list .col-sm-3.commlab").attr("class","col-sm-3 survey_subject commlab");
					$("#form-widget-list .col-sm-9.common").attr("class","col-sm-12 common");
					$("#form-widget-list .i-checks label").after("<br/>");
					//删除最后一个选项后的br标签
					$("#form-widget-list .i-checks").each(function (){
						$(this).find("br:last").remove();//删除最后一个多余的br标签
					});
					$("#formLayout").val("z");
				}
			}
			$("#"+id).addClass("selected");
		}
		
		//批量编辑弹出框
		function batchEditItems(id,divId,type){
			//获取已有选项
			var str = "";
			$("#"+divId+" input[type='text']").each(function(){
				str += "\n";
				str += $(this).val();
			});//'每行对应一个选项'
		  	layer.prompt(
			{
				title: '批量编辑',
				value: str,
				shade: [0.5, '#393D49'],//遮盖层
			  	formType: 2
			}, 
			function(value,index,obj){
				if(value != ""){
					var items = value.split("\n");//replace(/[\r\n]/g,""));
					batchEditChangeItems(id,divId,items,type);
				}
				layer.close(index);
		  	}
		  );
		}
	
	//执行修改操作
	function batchEditChangeItems(id,divId,items,type){
		var propertyId = id + "_prop";
		var checksDivId = "";
		//1、清空原来的选项
		$("#"+divId).html("");
		if(type=="radio"){
			checksDivId = id+" div.radio.i-checks";
			$("#"+checksDivId).html("");
    	 }else if(type=="checkbox"){
    		 checksDivId = id+" div.checkbox.i-checks";
    		 $("#"+checksDivId).html("");
    	 }else if(type=="select" || type=="selectmore"){
    		 checksDivId = id+" select";
    		 $("#"+checksDivId).html("");
    	 }
		//2、更新选项值
		for(var i = 0; i < items.length; i++){
			 if(items[i] != ""){
				 var htmlStr = "";
		    	 if(type=="radio"){
			    	//拖放显示:增加选项
			    	htmlStr += "<label id=\""+id+"_lab"+rdoIndex+"\">";
			    	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_dropped_rdo\" value=\""+rdoIndex+"\">";
			    	htmlStr += "<i></i> <font>"+items[i]+"</font>";
			    	if(items[i] == '其他'){
			    		htmlStr += '&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;">';
			    	}
			    	htmlStr += "</label>";
			    	$(htmlStr).appendTo($("#"+checksDivId));
			    	//属性栏:增加选项
			    	htmlStr = "";
			    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem"+rdoIndex+"_div\">";
		         	htmlStr += "<label>";
		         	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdo\" value=\""+rdoIndex+"\">";
		         	htmlStr += "<i></i><font>";
		         	htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_rdoItem"+rdoIndex+"\" value=\""+items[i]+"\" id=\""+propertyId+"_rdoItem"+rdoIndex+"\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_"+rdoIndex+"\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_"+rdoIndex+"\')\">";
		         	htmlStr += "</font>";
		         	htmlStr += "</label>";
		         	if(i > 0){
		         		htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem"+rdoIndex+"_div\',\'"+rdoIndex+"\',\'radio\')\" title=\"移除\">";
		         	}
		         	htmlStr += "</div>";
			    	$(htmlStr).appendTo($("#"+divId));
			    	rdoIndex++;
		    	 }else if(type=="checkbox"){
			    	//拖放显示:增加选项
			    	 htmlStr = "<label id=\""+id+"_lab"+ckbIndex+"\">";
			    	 htmlStr += "<input type=\"checkbox\" id=\""+propertyId+"_dropped_ckb"+ckbIndex+"\" name=\""+propertyId+"_dropped_ckb\" value=\""+ckbIndex+"\">";
			    	 htmlStr += "<i></i> <font>"+items[i]+"</font>";
			    	 if(items[i] == '其他'){
				     	htmlStr += '&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;">';
				     }
			    	 htmlStr += "</label>";
			    	 $(htmlStr).appendTo($("#"+checksDivId));
			    	//属性栏:增加选项
			    	 htmlStr = "";
			    	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem"+ckbIndex+"_div\">";
		         	 htmlStr += "<label>";
		         	 htmlStr += "<input type=\"checkbox\" id=\""+propertyId+"_ckb"+ckbIndex+"\" name=\""+propertyId+"_ckb\" value=\""+ckbIndex+"\">";
		         	 htmlStr += "<i></i><font>";
		         	 htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_ckbItem"+ckbIndex+"\" value=\""+items[i]+"\" id=\""+propertyId+"_ckbItem"+ckbIndex+"\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_"+ckbIndex+"\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_"+ckbIndex+"\')\">";
		         	 htmlStr += "</font>";
		         	 htmlStr += "</label>";
		         	 if(i > 0){
		         	 	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem"+ckbIndex+"_div\',\'"+ckbIndex+"\',\'checkbox\')\" title=\"移除\">";
		         	 }
		         	 htmlStr += "</div>";
		         	$(htmlStr).appendTo($("#"+divId));
			    	 ckbIndex++;
		    	 }else if(type=="select"){
			    	//拖放显示:增加选项
			    	 htmlStr = "<option id=\""+id+"_opt"+slcIndex+"\">"+items[i]+"</option>";
			    	 $(htmlStr).appendTo($("#"+checksDivId));
			    	//属性栏:增加选项
			    	 htmlStr = "";
			    	 htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem"+slcIndex+"_div\">";
		         	 htmlStr += "<label>";
		         	 htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slc\" id=\""+propertyId+"_slc"+slcIndex+"\" value=\""+slcIndex+"\">";
		         	 htmlStr += "<i></i><font>";
		         	 htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slcItem"+slcIndex+"\" value=\""+items[i]+"\" id=\""+propertyId+"_slcItem"+slcIndex+"\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_"+slcIndex+"\')\" onclick=\"updateValue(\'isCheckSlc\',\'"+id+"_"+slcIndex+"\')\">";
		         	 htmlStr += "</font>";
		         	 htmlStr += "</label>";
		         	 if(i > 0){
		         	 	htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem"+slcIndex+"_div\',\'"+slcIndex+"\',\'select\')\" title=\"移除\">";
		         	 }
		         	 htmlStr += "</div>";
		         	 $(htmlStr).appendTo($("#"+divId));
			    	 slcIndex++;
		    	 }else if(type=="selectmore"){
		    		//拖放显示:增加选项
		    		 htmlStr = "<option id=\""+id+"_opt"+slmIndex+"\">"+items[i]+"</option>";
			    	 $(htmlStr).appendTo($("#"+checksDivId));
			    	//属性栏:增加选项
			    	 htmlStr = "";
			    	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem"+slmIndex+"_div\">";
		         	 htmlStr += "<label>";
		         	 htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slm\" id=\""+propertyId+"_slm"+slmIndex+"\" value=\""+slmIndex+"\">";
		         	 htmlStr += "<i></i><font>";
		         	 htmlStr += "&nbsp;<input type=\"text\" class=\"x-input\" style=\"width: 180px; height:30px; display: inline;\" name=\""+propertyId+"_slmItem"+slmIndex+"\" value=\""+items[i]+"\" id=\""+propertyId+"_slmItem"+slmIndex+"\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_"+slmIndex+"\')\" onclick=\"updateValue(\'isCheckSlmInput\',\'"+id+"_"+slmIndex+"\')\">";
		         	 htmlStr += "</font>";
		         	 htmlStr += "</label>";
		         	 if(i > 0){
			         	 htmlStr += "&nbsp;<img src=\"${ctx}/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem"+slmIndex+"_div\',\'"+slmIndex+"\',\'selectmore\')\" title=\"移除\">";
		         	 }
		         	 htmlStr += "</div>";
		         	 $(htmlStr).appendTo($("#"+divId));
			    	 slmIndex++;
		    	 }
			 }
		}
		
    	//执行一下
    	 $("#"+checksDivId).iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
    	 $("#"+divId+" .i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
    	//根据布局 增加回车换行符
    	 if($("#formLayout").val() == "z"){
				$("#form-widget-list #"+checksDivId+" label").after("<br/>");//排除已经是纵排布局的标签
				//删除最后一个选项后的br标签
				$("#form-widget-list #"+checksDivId+" br:last").remove();//删除最后一个多余的br标签
			}
    	 
    	//绑定单选框/复选框事件
     	if(type == 'radio'){
     		$("#"+propertyId+"_rdoItemDiv label").each(function(){
	     		var i = $(this).find("input[type='radio']").val();
	     		//对外围label增加事件
     			$(this).bind("click",function(){
         			updateValue('isCheckRdo',id+"_"+i);
         	    });
     			//对ins(勾选框)增加事件
     			$(this).find("ins").bind("click",function(){
     				updateValue('isCheckRdo',id+"_"+i);
     	    	});
     		});
     	}else if(type == 'checkbox'){
     		$("#"+propertyId+"_ckbItemDiv label").each(function(){
	     		var i = $(this).find("input[type='checkbox']").val();
	     		//对外围label增加事件
     			$(this).bind("click",function(){
         			updateValue('isCheckCkb',id+"_"+i);
         	    });
     			//对ins(勾选框)增加事件
     			$(this).find("ins").bind("click",function(){
     				updateValue('isCheckCkb',id+"_"+i);
     	    	});
     		});
     	}else if(type == 'select'){
     		$("#"+propertyId+"_slcItemDiv label").each(function(){
	     		var i = $(this).find("input[type='radio']").val();
	     		//对外围label增加事件
     			$(this).bind("click",function(){
         			updateValue('isCheckSlc',id+"_"+i);
         	    });
     			//对ins(勾选框)增加事件
     			$(this).find("ins").bind("click",function(){
     				updateValue('isCheckSlc',id+"_"+i);
     	    	});
     		});
     	}else if(type == 'selectmore'){
     		$("#"+propertyId+"_slmItemDiv label").each(function(){
	     		var i = $(this).find("input[type='checkbox']").val();
	     		//对外围label增加事件
     			$(this).bind("click",function(){
         			updateValue('isCheckSlm',id+"_"+i);
         	    });
     			//对ins(勾选框)增加事件
     			$(this).find("ins").bind("click",function(){
     				updateValue('isCheckSlm',id+"_"+i);
     	    	});
     		});
     	}
	}
	</script>
</body>
</html>
