<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>预览页面</title>
 <link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
 <link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
 <link href="${ctx}/static/css/plugins/summernote/summernote.css" rel="stylesheet">
 <link href="${ctx}/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
 <link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
 <!-- 单选框复选框引用 -->
 <link href="${ctx}/static/css/plugins/iCheck/custom.css" rel="stylesheet">

 <style>
     .droppable-active{background-color:#ffe!important}.tools a{cursor:pointer;font-size:80%}.form-body .col-md-6,.form-body .col-md-12{min-height:400px}
 	
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
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
                <div class="ibox-tools">
                <c:if test="${status==1}">
                	<a href="javascript:window.open('${ctx}/investigation/createInfo/${id }')" title="参与调查" id="attend">
                        <i class="fa btn btn-primary">参与调查</i>
                    </a>
                </c:if>
                     
                    <a class="close-link" href="javascript:window.history.go(-1);" title="关闭预览">
                        <i class="fa btn btn-primary">关闭预览</i>
                    </a>
                </div>
                    
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                	<div class="ibox-title" style="text-align:center;">
		                <h3>${formTemplate.formName}</h3>
		            </div>
                    <div class="ibox-content">
                        <div class="row form-body form-horizontal m-t">
                            <div class="col-md-12">
                            	<c:forEach items="${lstInput}" var="item" varStatus="k">
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
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="radio" value="${it}" name="rdobox${k.index+1}"  ${fn:contains(item.defaultValue,it)?'checked':''}> <i></i> 
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
                                      	    <!-- <input type="file" name=""> -->
                                      	    <div style="float:left; margin-top:6px;"> 
								             <input type="file" data-no-uniform="true"  name="attachment" id="file_uploads"  multiple="true" >
								              <span id="fileQueues" ></span> 
								             </div>
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
		                            </div>
                            	</c:forEach>
                            </div>
                        </div>
                        <div class="ibox-content">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/static/js/jquery-ui-1.10.4.min.js"></script>
    <script src="${ctx}/static/js/plugins/beautifyhtml/beautifyhtml.js"></script>
    
    <script type="text/javascript" src="${ctx}/static/js/contabs-tab.js"></script> 
<script type="text/javascript" src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script> 
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css" rel="stylesheet" type="text/css" />
    <!-- 富文本编辑器引用 -->
    <script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
	 <!-- 单选框复选框引用 -->
	 <script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	 <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
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
	<script type="text/javascript">
$(function() {
	// layer.msg('Hello layer');
	 $('#file_uploads').uploadify({
	    	'debug' : false,
	        'multi' : true ,
	        'auto': true ,
	        'swf':  "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
	        'overrideEvents' : [ 'onDialogClose', 'onUploadError', 'onSelectError' ],
	        'queueID':'fileQueues',
	        'fileObjName':'attachment',
	        'width':'80',
	        'height':'30',
	        'fileTypeDesc':'支持的格式：',
	        'fileTypeExts': '*.*'  ,
	        'buttonText' :  '选择文件',
	});
});
</script> 
</body>
</html>
