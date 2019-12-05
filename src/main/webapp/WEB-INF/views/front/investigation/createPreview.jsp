<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>创建预览</title>
<link href="${ctx}/static/css/investigation/createPreview.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/projectHeader.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/projectFooter.css" rel="stylesheet"/>

<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
 <link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
 
 <link href="${ctx}/static/css/plugins/summernote/summernote.css" rel="stylesheet">
 <link href="${ctx}/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
 <link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
 <!-- 单选框复选框引用 -->
 <link href="${ctx}/static/css/plugins/iCheck/custom.css" rel="stylesheet">

<style>
.tabItem {
	background-color:#f1921c;
	height:40px;
}
.itemClick { background-color:#B76501;}
</style>

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
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/share.js"></script> 
<script>
$(document).ready(function(){
	$(".i-checks").iCheck({
		checkboxClass:"icheckbox_square-green",
		radioClass:"iradio_square-green",
		});

});

 $(function(){
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(2).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
 });

</script>
<script type="text/javascript">
	function submitForm(){
		var f = document.getElementById("inputform");
		f.submit();
		return false;
	}
	function returnBtn(){
		window.history.go(-1);
	}
</script>
</head>

<body>
<div class="preview_main">
	<%@ include file="../common/header.jsp"%>
		
	</div>
	
	<div class="preview_tipBar">
		<div class="preview_tip">当前处于预览模式</div>
		<input type="button" value="发布" class="yellowBtnContral" style="margin-right:15px;">
		<input type="button" onClick="javascript:history.back(-1);" value="再次编辑" class="grayBtnContral">
		<div style="clear:both;"></div>
	</div>
	
	<div class="preview_content">
		<div class="preview_cont">
			<div class="preview_title">${infoBean.investigationName}</div>
			<div class="preview_top">
				<div>
					<img src="${ctx}/static/image/activity/time.png" width="15px" height="15px" class="img_contral_t1" style="float:left;">
					<div style="float:left; margin-left:5px;">
						<fmt:formatDate value="${infoBean.publishTime}" pattern="yyyy-MM-dd HH:mm"/>至
						<c:choose>
							<c:when test="${infoBean.endTime==null}">
								-
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${infoBean.endTime}" pattern="yyyy-MM-dd HH:mm"/>	
							</c:otherwise>
						</c:choose>
					</div>
					
					<div style="float:right; margin-left:20px;">阅读：${browseLogCount}</div>
					<div style="float:right;">发布人：${infoBean.accountName}</div>
					<div style="clear:both;"></div>
				</div>
				<div style="margin-top:5px;">
					<img src="${ctx}/static/image/activity/enterCount.png" width="15px" height="15px" class="img_contral_t4" style="float:left;">
					<div style="float:left; margin-left:5px;">
						参与人气：<font style="color:#f1921c; font-size:16px; font-weight:bold;">${joinCount}</font>人
					</div>
					
					<%-- <div style="float:right; position:relative; top:5px;">
						<span class="font14 span_contral_t-3" style="color:#5e5e5e;">一键分享</span>
						<img src="${ctx}/static/image/investigation/headPortrait.png" width="17px;" height="17px;" style="margin-left:5px;">
						<img src="${ctx}/static/image/investigation/headPortrait.png" width="17px;" height="17px;" style="margin-left:5px;">
						<img src="${ctx}/static/image/investigation/headPortrait.png" width="17px;" height="17px;" style="margin-left:5px;">
						<img src="${ctx}/static/image/investigation/headPortrait.png" width="17px;" height="17px;" style="margin-left:5px;">
					</div> --%>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div style="margin:20px auto 0; width:940px;">
				<img src="${infoBean.extend1}" width="940px" height="450px;">
			</div>
			<div style="padding:0 40px;">
				<div style="margin:20px 0;"></div>
			<c:set var="num" value="1"/>
			<div style="margin-top:10px;" class="col-sm-12">
							<form action="${ctx}/investigation/saveInfo" method="post" name="inputform" id="inputform">
								<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
								<input type="hidden" name="formId" value="${infoBean.formId}"/>
								<c:forEach items="${lstProinst}" var="item" varStatus="k">
                           			 <div class="form-group draggable ui-draggable dropped" style="position:static;" id="item${k.index+1}">
		                                <c:if test="${item.inputType!='line'}">
			                                <div class="col-sm-3 survey_subject">${num}、${item.inputTitle}：</div>
			                                <div class="col-sm-12">
			                                <c:set var="num" value="${num+1}"/>
		                                </c:if>
		                                <c:if test="${item.inputType=='line'}">
		                                	<div class="col-sm-12">
		                                </c:if>
                            		<!-- 文本框 -->
                            		<c:if test="${item.inputType=='text'}">
		                                    <input type="text" name="${item.filedName}" value="${input.defaultValue}" class="form-control" placeholder="请输入${item.dataFormat=='email'?'邮箱格式':item.dataFormat=='phone'?'手机号码格式':item.dataFormat=='tel'?'固定电话格式':item.dataFormat=='code'?'邮政编码格式':''}文本">
                            		</c:if>
                            		<!-- 密码框 -->
                            		<c:if test="${item.inputType=='password'}">
		                                    <input type="password" class="form-control" name="${item.filedName}"  value="${input.defaultValue}"  placeholder="请输入密码">
                            		</c:if>
                            		<!-- 数值 -->
                            		<c:if test="${item.inputType=='number'}">
	                                      <input type="text" class="form-control" name="${item.filedName}" placeholder="请输入数值" value="<fmt:formatNumber minFractionDigits="${item.precision}" maxFractionDigits="${item.precision}" value="${input.defaultValue}"/>">
                            		</c:if>
                            		<c:if test="${item.inputType=='textarea'}">
                                      	  <textarea class="form-control" name="${item.filedName}" placeholder="请输入文本">${input.defaultValue}</textarea>
                            		</c:if>
                            		<c:if test="${item.inputType=='richtext'}">
                                      	  <script name="${item.filedName}" id="editors${k.index+1}" type="text/plain" class="editorsSzc"></script>
                            		</c:if>
                            		<c:if test="${item.inputType=='radio'}">
                                      	  <div class="radio i-checks">
                                      	  	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="radio" value="${it}" name="${item.filedName}"  ${fn:contains(input.defaultValue,it)?'checked':''}> <i></i> 
		                                     <font>
		                                     ${it}
		                                     <c:if test="${it=='其他'}">&nbsp;<input type="text" name="${item.filedName}_other" value="${item.otherInputValue}" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></c:if>
		                                     </font>
		                                     </label>
		                                     <c:if test="${item.dataFormat=='shupai'}"><br/></c:if>
		                                    </c:forEach>
		                                 </div>
                            		</c:if>
                            		<c:if test="${item.inputType=='checkbox'}">
                                      	  <div class="checkbox i-checks">
                                      	  	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                     <label id="item${k.index+1}_lab${j.index+1}"><input type="checkbox" value="${it}" name="${item.filedName}" ${fn:contains(input.defaultValue,it)?'checked':''}> <i></i> 
											 <font>
		                                     ${it}
		                                     <c:if test="${it=='其他'}">&nbsp;<input type="text" name="${item.filedName}_other" value="${item.otherInputValue}" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></c:if>
		                                     </font>
											</label>
											<c:if test="${item.dataFormat=='shupai'}"><br/></c:if>
		                                     </c:forEach>
		                                 </div>
                            		</c:if>
                            		<c:if test="${item.inputType=='select'}">
                                      	   <select class="form-control" name="${item.filedName}">
                                      	   		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                        	<option id="item${k.index+1}_opt${j.index+1}" ${fn:contains(input.defaultValue,it)?'selected':''}>${it}</option>
		                                        </c:forEach>
		                                    </select>
                            		</c:if>
                            		<c:if test="${item.inputType=='selectmore'}">
                                      	   <select class="form-control" multiple="" name="${item.filedName}">
	                                         <c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
		                                        	<option id="item${k.index+1}_opt${j.index+1}" ${fn:contains(input.defaultValue,it)?'selected':''}>${it}</option>
		                                        </c:forEach>
	                                       </select>
                            		</c:if>
                            		<c:if test="${item.inputType=='date'}">
                                      	   <input name="${item.filedName}" class="form-control layer-date laydate-icon" value="${input.defaultValue}" placeholder="单击选择时间" onclick="laydate({istime: true, format: '${item.dataFormat=='ymdhms'?'YYYY-MM-DD hh:mm:ss':item.dataFormat=='ymdhm'?'YYYY-MM-DD hh:mm':item.dataFormat=='ymd'?'YYYY-MM-DD':item.dataFormat=='ym'?'YYYY-MM':'YYYY-MM-DD hh:mm:ss'}'})">
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
											<input type="hidden" id="attIds_item${k.index+1}" name="${item.filedName}" value="" />
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
                            </form>
			</div>
		</div>
		
	</div>
	 <%@ include file="../common/footer.jsp"%>
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

function showAtts(jsonData){
	 var url="" ;
	 url+="<li id='"+jsonData.attachment.attachmentId+"'><a href='"+ jsonData.attachment.attachmentUrl+"' target='_blank' title='下载'>"+ jsonData.attachment.remoteName+"</a>&nbsp;<a href='javascript:;' style='color:black' onclick='deleteAtt(this)'>[删除]</a></li> ";
	 $('#attList').append(url) ;
}
</script> 
</body>
</html>
