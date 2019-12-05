<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

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
</head>

<body class="gray-bg">
	<input type="hidden" id="requireCode" value="0" />
	<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020171109144912000062000000008"/>
	<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="项目申报" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>发布结果公示</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
							<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#"> <i class="fa fa-wrench"></i></a>
							
							<a class="close-link"> <i class="fa fa-times"></i></a>
						</div>
					</div>
					<div class="ibox-content">
						<form  class="form-horizontal"  id="form">
							<input type="hidden" id="atUrlList" name="atUrlList" value="" />
                         	<input type="hidden" id="atIdList" name="atIdList" value="" /> 
							<input type="hidden" id="declareId" name="declareId" value="${declareId}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">公示标题</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="publicityTitle" name="publicityTitle" value="${projectDeclarePublicity.publicityTitle}" 
										placeholder="请输入公示标题" />
								</div>
							</div>	
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">公示正文</label>
								<div class="col-sm-10">	
								<script name="publicityText" id="editors" type="text/plain" style="width:100%;height: 300px;">
										${projectDeclarePublicity.publicityText}
									</script> 								
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>														
														
							<div class="form-group">
								<label class="col-sm-2 control-label">附件</label>
								<div class="col-sm-10">
									<div style="float: left; margin-top: 6px;">
										<input type="file" data-no-uniform="true"
											name="file_uploads" id="file_uploads" multiple="true">
										<span id="fileQueues"></span>																       
									</div>
									<div id="attList"></div>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">填写创建时间</label>
								<div class="col-sm-10">
									<input id="laydate"
										class="laydate-icon form-control layer-date laydateContral"
										style="width: 40%" name="createDate" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
						<%-- 	<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">公示单位</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="publicityUnit" id="publicityUnit"
										placeholder="请输入公示单位" value="${projectDeclarePublicity.publicityUnit}" />
								</div>
							</div>	 --%>					

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="button" class="btn btn-primary" id="saveBtn" value="确定">
									<input type="button" class="btn btn-white" id="cancelBtn" value="返回">								
								</div>
							</div>
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
			
			var timeNow1 = {
					elem : '#laydate', //选择ID为START的input
					event : "focus",
					format : 'YYYY-MM-DD', //自动生成的时间格式
					//min : laydate.now(), //设定最小日期为当前日期
					max : '2099-06-16 23:59:59', //最大日期
					istoday : true, //是否是当天
					start : laydate.now(0, "YYYY-MM-DD"), //设置开始时间为当前时间
				};
				laydate(timeNow1);
			//校验 
			  $("#form").validate({
				 rules: {
					 publicityTitle: {
					        required: true,
					        maxlength: 50
					      },
				      publicityUnit: {
						        required: true,
						        maxlength: 10
						      },					 
				 }
				 
			}); 
			
			//富文本编辑器
			UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
			UE.Editor.prototype.getActionUrl = function(action) {
			    if (action == 'uploadvideo' || action == 'uploadscrawl' || action == 'uploadimage'  ) {
			        return '${ctx}/uploadimage';
			    } else {
			        return this._bkGetActionUrl.call(this, action);
			    }
			}	
			   ue = UE.getEditor('editors');
			 
			var msg = '${message}';
			if(msg!=null&&msg!=""){
				tips(msg);
				msg=null;
			}
			
			
			//附件
	 $('#file_uploads').uploadify({
	    	'debug' : false,
	        'simUploadLimit': 3 ,
	        'multi' : true ,
	        'auto': true ,
	        'removeCompleted': true ,
	        'removeTimeout': 1 ,
	        'successTimeout':99999,
	        'formData':{
	            'jsessionid':'${pageContext.session.id}' ,
				'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
				'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val()
	        },
	        'uploader': '${ctx}/session/attachment/publish' , // 新版
	        'swf':  "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
	        'overrideEvents' : [ 'onDialogClose', 'onUploadError', 'onSelectError' ],
	        'queueID':'fileQueues',
	        'fileObjName':'attachment',
	        'width':'80',
	        'height':'30',
	        'fileTypeDesc':'支持的格式：',
	        'fileTypeExts': '*.*'  ,
	        'fileSizeLimit':'100MB',
	        'buttonText' :  '选择文件', 
	        'queueSizeLimit' : 3,
	        'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
	             //使用方法见官方说明
	        },
	        'onSelect' : function( file ) {
	        	  
	        },
	        'onUploadStart' : function(file) {
				var myself = this; 
				if(!isSafeFile(file.name )){
					  alert('请选择合法的文件！');
					  myself.cancelUpload(file.id); 
				      $('#' + file.id).remove(); 
				}
			},
	        'onUploadError':function(file, errorCode, errorMsg){
	             if( errorCode = -280){
	            	 
	             }else{
	            	 alert('上传失败，请联系管理员2') ;
	             }
	        },
	        'onCloseError':function(file, errorCode, errorMsg){
	        	     alert('上传失败，请联系管理员3') ;
	        },
	        'onSelectError':function(file, errorCode, errorMsg){
	            switch(errorCode) {
	                case -100:
	                    alert("上传的文件数量已经超出系统限制的"+$('#file_uploads').uploadify('settings','queueSizeLimit')+"个文件！");
	                    break;
	                case -110:
	                    alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#file_uploads').uploadify('settings','fileSizeLimit')+"大小！");
	                    break;
	                case -120:
	                    alert("文件 ["+file.name+"] 大小为零，不能上传！");
	                    break;
	                case -130:
	                    alert("文件 ["+file.name+"] 类型不正确！");
	                    break;
	            }
	        },
	        //检测FLASH失败调用
	        'onFallback':function(){
	            alert("您未安装FLASH控件，无法上传！请安装FLASH控件后再试。");
	        },
	        'onUploadSuccess':function(file, data, response){
	        	 var obj = JSON.parse(data);
	        	 showAtts(obj ) ;
	        	 var url = $("#atUrlList").val() + obj.attachment.attachmentUrl + ",";
					$("#atUrlList").val(url);
					var id = $("#atIdList").val() + obj.attachment.attachmentId + ",";
					$("#atIdList").val(id);
	        } 
	});
			//提交返回按钮
				/* $("#saveBtn").click(function() {
					$("#form").submit();
				});
				$("#cancelBtn").click(function() {
					$("#form").attr("action","${ctx}/projectDeclareInfo/mylist?declareId=").submit();
				      return false;
				}); */
			//提交返回按钮
				$("#saveBtn").click(function() {
					
				$
						.ajax({
							url : "${ctx}/projectDeclarePublicity/operationSave",
							type : "post",
							data : $("#form").serialize(),
							dataType : "json",
							success : function(result) {
								layer.msg(result);
							},
							error : function() {
								layer.msg("创建异常！");
							}
						});
				});
		
				$("#cancelBtn").click(function() {
					window.history.go(-1);
				});
				
			})	
	 
			function deleteAtt(id,url) {
				layer.confirm('确定要清空吗？', {
					icon : 3,
					shade : false
				//不显示遮罩
				}, function(index) {
					layer.close(index);
		        	 $('#'+id).remove();
				    var atIdList = $('#atIdList').val();
				    var atUrlList = $('#atUrlList').val();
				    var atIdAttr = atIdList.split(","); 
				    var atUrlAttr = atUrlList.split(",");
				    var newIds = "";
				    var newUrls= "";
				    for(var i = 0;i<atIdAttr.length;i++){
				    	if(atIdAttr[i]!=""&&atIdAttr[i]!=id){
				    		var newId =  atIdAttr[i] + ","
				    		newIds += newId;
				    	}
				    	if(atUrlAttr[i]!=""&&atUrlAttr[i]!=url){
				    		var newUrl = atUrlAttr[i] + ","
				    		newUrls += newUrl;
				    	}
				    }
				    $('#atIdList').val(newIds);
				    $('#atUrlList').val(newUrls);
				});
			}
		function showAtts(jsonData) {
			var url = "";
			url += '<li id="'+jsonData.attachment.attachmentId+'"><a href="'+jsonData.attachment.attachmentUrl+'" target="_blank" >'
					+ jsonData.attachment.remoteName
					+ '</a>&nbsp;<a href="javascript:;"  onclick="deleteAtt(\''+jsonData.attachment.attachmentId+'\',\''+jsonData.attachment.attachmentUrl+'\')">[删除]</a></li> ';
			$('#attList').append(url);
			
		}
	</script>
</body>

</html>
