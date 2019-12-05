<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>在线申报</title>



<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
	<script type="text/javascript" src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script> 
	<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script type="text/javascript" src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
	<script type="text/javascript" src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>	
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
						<h5>在线申报</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> 
						</div>
					</div>
					<div class="ibox-content">
						<form  class="form-horizontal" id="form">
							<input type="hidden" id="atUrlList" name="atUrlList" value="" />
                         	<input type="hidden" id="atIdList" name="atIdList" value="" />
                         	<input type="hidden" id="declareId" name="declareId" value="${declareId }" />
                         	<input type="hidden" id="accountId" name="accountId" value="" />
                         	<input type="hidden" id="accountName" name="accountName" value="" />
							<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/> 
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">上报企业</label>
								<div class="col-sm-10">
									<input type="text" class="inputContral"  name="companyName"/>
									</div>
								</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">上报人名称</label>
								<div class="col-sm-10">
									<input type="text" class="inputContral"   id="applyAccountName"/>
									</div>
								</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系电话</label>
								<div class="col-sm-10">
									<input type="text" class="inputContral"  name="accountTel"/>
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
								<label class="col-sm-2 control-label">选择账户</label>
								<div class="col-sm-10">
									<select class="form-control m-b" id="selectAccountId" style="width:40%" >
         							   <% int n=0; %>
									<c:if test="${accountInfoList!=null}">
										<c:forEach items="${accountInfoList}" var="account">
											<option id="a<%=n++%>" value='${account.accountId}'>${account.accountName}</option>
										</c:forEach>
									</c:if>
        							</select>
        							<input type="checkbox" id="check"/>
								</div>
								
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">随机账户</label>
								<div class="col-sm-10">
									<input id="randomAccountId" type="hidden" value="${accountInfoRandom.accountId}" />
									<input id="randomAccountName" style="width:40%" value="${accountInfoRandom.accountName}" />
								</div>
								
									
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">填写创建时间</label>
								<div class="col-sm-10">
								<input id="laydate"
										class="laydate-icon form-control layer-date laydateContral" style="width:40%" name="createDate"/>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group" >
							
								<div class="col-sm-4 col-sm-offset-2" >
									<a class="btn btn-primary"  href="javaScript:save();" >发送申报</a>
									<input type="button" class="btn btn-white" id="cancelBtn" value="返回">								
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script>
		$(function() {
			
			$("#cancelBtn").click(function() {
				window.history.go(-1);
			});
			initPage();
			
			//时间控件
			var	time = {
				elem : '#laydate', //选择ID为START的input
				event : "focus",
				format : 'YYYY-MM-DD', //自动生成的时间格式
			/* 	min : laydate.now(), //设定最小日期为当前日期 */
				max : '2099-06-16 23:59:59', //最大日期
				istoday : true, //是否是当天
				start : laydate.now(0, "YYYY-MM-DD"), //设置开始时间为当前时间
				};
			laydate(time);
			
			$('#file_uploads').uploadify({
								'debug' : false,
								'simUploadLimit' : 3,
								'multi' : true,
								'auto' : true,
								'removeCompleted' : true,
								'removeTimeout' : 1,
								'successTimeout' : 99999,
								'formData' : {
									'jsessionid' : '${pageContext.session.id}',
									'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
									'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val()
								},
								 'uploader': '${ctx}/login/json/attachment/publish' , // 新版
								'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
								'overrideEvents' : [ 'onDialogClose',
										'onUploadError', 'onSelectError' ],
								'queueID' : 'fileQueues',
								'fileObjName' : 'attachment',
								'width' : '80',
								'height' : '30',
								'fileTypeDesc' : '支持的格式：',
								'fileTypeExts' : '*.*',
								'fileSizeLimit' : '100MB',
								'buttonText' : '选择文件',
								'queueSizeLimit' : 3,
								'onUploadProgress' : function(file,
										bytesUploaded, bytesTotal,
										totalBytesUploaded, totalBytesTotal) {
									//使用方法见官方说明
								},
								'onSelect' : function(file) {

								},
								'onUploadStart' : function(file) {
									var myself = this; 
									if(!isSafeFile(file.name )){
										  alert('请选择合法的文件！');
										  myself.cancelUpload(file.id); 
									      $('#' + file.id).remove(); 
									}
								},
								'onUploadError' : function(file, errorCode,
										errorMsg) {
									if (errorCode = -280) {

									} else {
										alert('上传失败，请联系管理员2');
									}
								},
								'onCloseError' : function(file, errorCode,
										errorMsg) {
									alert('上传失败，请联系管理员3');
								},
								'onSelectError' : function(file, errorCode,
										errorMsg) {
									switch (errorCode) {
									case -100:
										alert("上传的文件数量已经超出系统限制的"
												+ $('#file_uploads').uploadify(
														'settings',
														'queueSizeLimit')
												+ "个文件！");
										break;
									case -110:
										alert("文件 ["
												+ file.name
												+ "] 大小超出系统限制的"
												+ $('#file_uploads').uploadify(
														'settings',
														'fileSizeLimit')
												+ "大小！");
										break;
									case -120:
										alert("文件 [" + file.name
												+ "] 大小为零，不能上传！");
										break;
									case -130:
										alert("文件 [" + file.name + "] 类型不正确！");
										break;
									}
								},
								//检测FLASH失败调用
								'onFallback' : function() {
									alert("您未安装FLASH控件，无法上传！请安装FLASH控件后再试。");
								},
								'onUploadSuccess' : function(file, data,
										response) {
									var obj = JSON.parse(data);
									showAtts(obj);
									
									var url = $("#atUrlList").val() + obj.attachment.attachmentUrl + ",";
									$("#atUrlList").val(url);
									var id = $("#atIdList").val() + obj.attachment.attachmentId + ",";
									$("#atIdList").val(id);
								}
							});

			

			//提交返回按钮
			$("#saveBtn").click(function() {
				if($('#applyAccountName').val()!="" &&$('#applyAccountName').val()!=null){
						$('#accountName').val($('#applyAccountName').val());
					if($('#check').is(':checked')){
						$('#accountId').val($('#selectAccountId option:selected').val());
					}else{
						$('#accountId').val($('#randomAccountId').val());
					}
				}else{
					if($('#check').is(':checked')){
						$('#accountId').val($('#selectAccountId option:selected').val());
						$('#accountName').val($('#selectAccountId option:selected').text());
					}else{
						$('#accountId').val($('#randomAccountId').val());
						$('#accountName').val($('#randomAccountName').val());
					}
				}
				
				
				
				
				 $.ajax({
					url:"${ctx}/projectDeclareApply/operationSave",
					type:"post",
					data:$("#form").serialize(),
					dataType:"json",
					success:function(result){
						layer.msg(result);
					},
					error:function(){
						tips("创建异常！");
					}
			}); 
		});

			

			
		});
       
        
		function initTags(tags) {
			var tag = tags.split(",");
			for (var i = 0; i < tag.length; i++) {
				$("#require button").each(function() {
					if ($(this).text() == tag[i]) {
						$(this).addClass("btn-success");
					}
				});
			}
		}
		function showAtts(jsonData) {
			var url = "";
			url += '<li id="'+jsonData.attachment.attachmentId+'"><a href="'+jsonData.attachment.attachmentUrl+'" target="_blank" >'
					+ jsonData.attachment.remoteName
					+ '</a>&nbsp;<a href="javascript:;"  onclick="deleteAtt(\''+jsonData.attachment.attachmentId+'\',\''+jsonData.attachment.attachmentUrl+'\')">[删除]</a></li> ';
			$('#attList').append(url);
			
		}
		function deleteAtt(id,url) {
			confirm('确认删除？', function(index) {
	        	$('#'+id).remove();
			    var atIdList = $('#atIdList').val();
			    var atUrlList = $('#atUrlList').val();
			    var atIdAttr = atIdList.split(","); 
			    var atUrlAttr = atUrlList.split(",");
			    var newIds = "";
			    var newUrls= "";
			    for(var i = 0;i<atIdAttr.length;i++){
			    	if(atIdAttr[i]!=""&&atIdAttr[i]!=id){
			    		var newId =  atIdAttr[i] +"," ;
			    		newIds += newId;
			    	}
			    	if(atUrlAttr[i]!=""&&atUrlAttr[i]!=url){
			    		var newUrl = atUrlAttr[i] +",";
			    		newUrls += newUrl;
			    	}
			    }
			    $('#atIdList').val(newIds);
			    $('#atUrlList').val(newUrls);
			},function(){});  
		}
		
		function initPage(){
			  $("#selectAccountId").searchableSelect();
		}
		
		function save(){
			if($('#applyAccountName').val()!="" &&$('#applyAccountName').val()!=null){
				$('#accountName').val($('#applyAccountName').val());
			if($('#check').is(':checked')){
				$('#accountId').val($('#selectAccountId option:selected').val());
			}else{
				$('#accountId').val($('#randomAccountId').val());
			}
		}else{
			if($('#check').is(':checked')){
				$('#accountId').val($('#selectAccountId option:selected').val());
				$('#accountName').val($('#selectAccountId option:selected').text());
			}else{
				$('#accountId').val($('#randomAccountId').val());
				$('#accountName').val($('#randomAccountName').val());
			}
		}
		
		
		 $.ajax({
			url:"${ctx}/projectDeclareApply/operationSave",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			success:function(result){
				layer.msg(result);
			},
			error:function(){
				tips("创建异常！");
			}
	}); 
		}
		
	</script>
</body>



</html>
