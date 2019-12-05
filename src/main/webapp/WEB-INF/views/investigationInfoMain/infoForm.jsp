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
 <link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
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
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                	<div class="ibox-title" style="text-align:center;">
		                <h3>${infoBean.investigationName}</h3>
		            </div>
                    <div class="ibox-content">
                        <div class="row form-body form-horizontal m-t">
                            <div class="col-md-12" id="inputDiv">
                            <form action="${ctx}/investigationInfoMain/saveInfo" method="post" name="inputform" id="inputform">
                            	<input type="hidden" name="formId" value="${infoBean.formId}"/>
                            	<input type="hidden" name="id" value="${infoBean.id}"/>
                            	<input type="hidden" name="accountId" id="accountId2" />
                            	<input type="hidden" name="accountName" id="accountName" />
                            	<input type="hidden" name="createTime" id="createTime" />
                            	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
                            	<c:forEach items="${lstProinst}" var="item" varStatus="k">
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
		                                    <input type="text" name="${item.filedName}" value="${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}" class="form-control" placeholder="请输入${item.dataFormat=='email'?'邮箱格式':item.dataFormat=='phone'?'手机号码格式':item.dataFormat=='tel'?'固定电话格式':item.dataFormat=='code'?'邮政编码格式':''}文本">
                            		</c:if>
                            		<!-- 密码框 -->
                            		<c:if test="${item.inputType=='password'}">
		                                    <input type="password" class="form-control" name="${item.filedName}"  value="${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}"  placeholder="请输入密码">
                            		</c:if>
                            		<!-- 数值 -->
                            		<c:if test="${item.inputType=='number'}">
	                                      <input type="text" class="form-control" name="${item.filedName}" placeholder="请输入数值" value="<fmt:formatNumber minFractionDigits="${item.precision}" maxFractionDigits="${item.precision}" value="${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}"/>">
                            		</c:if>
                            		<c:if test="${item.inputType=='textarea'}">
                                      	  <textarea class="form-control" name="${item.filedName}" placeholder="请输入文本"> ${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}</textarea>
                            		</c:if>
                            		<c:if test="${item.inputType=='richtext'}">
                                      	  <script name="${item.filedName}" id="editors${k.index+1}" type="text/plain" class="editorsSzc"></script>
                            		</c:if>
                            		<c:if test="${item.inputType=='radio'}">
                                      	  <div class="radio i-checks">
                                      	  	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
                                      	  		<c:if test="${item.dataFormat=='shupai'}"><br/></c:if>
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="radio" value="${it}" name="${item.filedName}"  ${fn:contains(item.inputValue,it)?'checked':''}> <i></i> 
		                                     <font>
		                                     ${it}
		                                     <c:if test="${it=='其他'}">&nbsp;<input type="text" name="${item.filedName}_other" value="${item.otherInputValue}" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></c:if>
		                                     </font>
		                                     </label>
		                                    </c:forEach>
		                                 </div>
                            		</c:if>
                            		<c:if test="${item.inputType=='checkbox'}">
                                      	  <div class="checkbox i-checks">
                                      	  	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
                                      	  		<c:if test="${item.dataFormat=='shupai'}"><br/></c:if>
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="checkbox" value="${it}" name="${item.filedName}" ${fn:contains(item.inputValue,it)?'checked':''}> <i></i> 
											 <font>
		                                     ${it}
		                                     <c:if test="${it=='其他'}">&nbsp;<input type="text" name="${item.filedName}_other" value="${item.otherInputValue}" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></c:if>
		                                     </font>
											</label>
		                                     </c:forEach>
		                                 </div>
                            		</c:if>
                            		<c:if test="${item.inputType=='select'}">
                                      	   <select class="form-control" name="${item.filedName}">
                                      	   		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                        	<option id="item${k.index+1}_opt${j.index+1}" ${fn:contains(item.inputValue,it)?'selected':''}>${it}</option>
		                                        </c:forEach>
		                                    </select>
                            		</c:if>
                            		<c:if test="${item.inputType=='selectmore'}">
                                      	   <select class="form-control" multiple="" name="${item.filedName}">
	                                         <c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                        	<option id="item${k.index+1}_opt${j.index+1}" ${fn:contains(item.inputValue,it)?'selected':''}>${it}</option>
		                                        </c:forEach>
	                                       </select>
                            		</c:if>
                            		<c:if test="${item.inputType=='date'}">
                                      	   <input name="${item.filedName}" class="form-control layer-date laydate-icon" value="${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}" placeholder="单击选择时间" onclick="laydate({istime: true, format: '${item.dataFormat=='ymdhms'?'YYYY-MM-DD hh:mm:ss':item.dataFormat=='ymdhm'?'YYYY-MM-DD hh:mm':item.dataFormat=='ymd'?'YYYY-MM-DD':item.dataFormat=='ym'?'YYYY-MM':'YYYY-MM-DD hh:mm:ss'}'})">
                            		</c:if>
                            		<c:if test="${item.inputType=='hidden'}">
                                      	    <input type="hidden" name="${item.filedName}"/>
                            		</c:if> 
                            		<c:if test="${item.inputType=='file'}">
                                      	    <div style="margin-top:6px;"> 
								             <input type="file" data-no-uniform="true" id="fileUploads_item${k.index+1}"  multiple="true" >
								              <span id="fileQueues_item${k.index+1}" ></span> 
								             </div>
											 <div id="attList_item${k.index+1}" ></div>
											<input type="text" id="attIds_item${k.index+1}" name="${item.filedName}" value="${item.inputValue}" />
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
		                          
                            	</c:forEach>
                            	</form>
                            	  </div>
							</div>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">人员选择</label>
							<div class="col-sm-4">
								<select class="form-control m-b" id="accountId">
									<c:if test="${accountInfoList!=null}">
										<c:forEach items="${accountInfoList}" var="account">
											<option value='${account.accountId}'>${account.accountName}</option>
										</c:forEach>
									</c:if>
                                </select>
							</div>
						</div>
						<br/>
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">参与时间</label>
							<div class="col-sm-4">
								<input id="end" class="laydate-icon form-control layer-date" name="end" value="${projectActivityInfo.end}"/>
							</div>
						</div>
                        
                        <div class="ibox-content">
                           	<div class="form-group">
							<div class="col-sm-4 col-sm-offset-2">
								<a class="close-link" href="javascript:void(0);" onclick="submitForm()" title="发布">
			                        <i class="btn btn-primary">发布</i>
			                    </a>
								<a class="close-link" href="javascript:window.history.go(-1);" title="取消">
			                        <i class="btn btn-white">取消</i>
			                    </a>
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
    <!-- 富文本编辑器引用 -->
    <script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
	 <!-- 单选框复选框引用 -->
	 <script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	 <!-- 上传 -->
	 <script src="${ctx}/static/js/uploadFilesAndPics_uploadify.js"></script>
	 <script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
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
	$("#inputDiv input:file").each(function(){
		var strId = $(this).attr("id");
		var divId = "_"+strId.split("_")[1];
		registerUploadFilesComm("fileUploads"+divId,30,80,"选择文件","${ctx}/login/json/attachment/publish","${ctx}/static/plugins/uploadify3.2/uploadify.swf","fileQueues"+divId,"attIds"+divId,"attList"+divId);
	});
});

function submitForm(){
	$("#accountId2").val($("#accountId").val());
	$("#accountName").val($("#accountId option:selected").text());
	$("#createTime").val($("#end").val());
	var f = document.getElementById("inputform");
	f.submit();
	return false;
}

function showAtts(jsonData){
	 var url="" ;
	 url+="<li id='"+jsonData.attachment.attachmentId+"'><a href='"+ jsonData.attachment.attachmentUrl+"' target='_blank' title='下载'>"+ jsonData.attachment.remoteName+"</a>&nbsp;<a href='javascript:;' style='color:black' onclick='deleteAtt(this)'>[删除]</a></li> ";
	 $('#attList').append(url) ;
}
</script> 
<script type="text/javascript">
	$(function(){
		//初始化
		$("#accountId").searchableSelect();
		var end = {
				elem : "#end",
				event : "focus",
				format : "YYYY-MM-DD hh:mm:ss",
				min : laydate.now(),
				max : "2099-06-16 23:59:59",
				istime : true,
				istoday : false,
				start : laydate.now(0, "YYYY-MM-DD hh:mm:ss"), //设置开始时间为当前时间
			};
		laydate(end);
	});

</script>
</body>
</html>
