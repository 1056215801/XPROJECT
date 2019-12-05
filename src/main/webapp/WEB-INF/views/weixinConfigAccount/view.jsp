<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>编辑</title>

<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
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
<script type="text/javascript"  src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript"  src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript"  src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script>

</head>

<body class="gray-bg">
	<input type="hidden" id="requireCode" value="0" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>编辑微信配置</h5>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal" action="${ctx}/weixinConfigInfo/save" id="form">
							<input type="hidden" id="configId" name="configId" value="${weixinConfigInfo.configId}" /> 
							<input type="hidden" id="save_image1" name="qrcode" value="${weixinConfigInfo.qrcode}" /> 
							<input type="hidden" id="save_image2" name="welcomeImg" value="${weixinConfigInfo.welcomeImg}" />
							 
							<div class="form-group">
								<label class="col-sm-2 control-label">微信名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="wxName" value="${weixinConfigInfo.wxName}" 
										placeholder="微信名称" />
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">openId</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="openid"
										placeholder="openId" value="${weixinConfigInfo.openid}" />
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">appId</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="appid"
										placeholder="appId" value="${weixinConfigInfo.appid}" />
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">appSecret</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="appsecret"
										placeholder="appSecret" value="${weixinConfigInfo.appsecret}" />
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">token</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="token"
										placeholder="appSecret" value="${weixinConfigInfo.token}" />
								</div>
							</div>
							
						 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">二维码</label>
								<div class="col-sm-10">
									<div style="float: left;">
										<img alt="" src="${weixinConfigInfo.qrcode}" id="show_image1" style="width: 100px; height: 100px;" />
									</div>
									<div style="float: left; margin-left: 15px;">
										<p>图片小于2M ( jpg、gif、png)，尺寸为1080*640px</p>
										<input type="file" data-no-uniform="true"  class="upc" name="" id="image1" multiple="true" />
									</div>
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">欢迎图</label>
								<div class="col-sm-10">
									<div style="float: left;">
										<img alt="" src="${weixinConfigInfo.welcomeImg}" id="show_image2" style="width: 100px; height: 100px;" />
									</div>
									<div style="float: left; margin-left: 15px;">
										<p>图片小于2M ( jpg、gif、png)，尺寸为1080*640px</p>
										<input type="file" data-no-uniform="true" class="upc"  name="" id="image2" multiple="true" />
									</div>
								</div>
							</div>
 
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">欢迎词</label>
								<div class="col-sm-10">
									<!-- <script id="editors" type="text/plain" style="width: 100%;"></script> -->
									<textarea id="description" name="welcomeText" class="form-control" style="height: 200px;">${weixinConfigInfo.welcomeText}</textarea>
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" id="saveBtn">保存</button>
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
			 
			//提交返回按钮
			$("#saveBtn").click(function() {
				$("#form").submit();
			});

			//图片附件
			$('.upc').each(function() {
				   var id=$(this).attr('id');
				 //  var sortGrade=$(this).attr('sortGrade');
				   $(this).uploadify({
								'debug' : false,
								'simUploadLimit' : 1,
								'multi' : false,
								'auto' : true,
								'removeCompleted' : true,
								'removeTimeout' : 1,
								'successTimeout' : 99999,
								'formData' : {
									'jsessionid' : '${pageContext.session.id}'
									'moduleId':'-1', 
									'remark':'编辑微信配置'
								},
							 
								 'uploader': '${ctx}/session/attachment/publish' , // 新版
								'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
								'overrideEvents' : [ 'onDialogClose','onUploadError', 'onSelectError' ],
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
								'onUploadError' : function(file, errorCode,errorMsg) {
									if (errorCode = -280) {

									} else {
										alert('上传失败，请联系管理员2');
									}
								},
								'onCloseError' : function(file, errorCode,errorMsg) {
										
									alert('上传失败，请联系管理员3');
								},
								'onSelectError' : function(file, errorCode,
										errorMsg) {
									switch (errorCode) {
									case -100:
										alert("上传的文件数量已经超出系统限制的"
												+ $('#uploadify').uploadify('settings','queueSizeLimit')+ "个文件！");
										break;
									case -110:
										alert("文件 ["+ file.name+ "] 大小超出系统限制的"
											  + $('#uploadify').uploadify('settings','fileSizeLimit')+ "大小！");
										break;
									case -120:
										alert("文件 [" + file.name+ "] 大小为零，不能上传！");
												
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
								'onUploadSuccess' : function(file, data,response) {
									var obj = JSON.parse(data);
									showPic(obj,id);
								}
							});
			});
		});

		function format(s) {
			if (s == null) {
				return "";
			} else {
				s = s.replace("\n\r", "<br>&nbsp;&nbsp;");
				s = s.replace("\r\n", "<br>&nbsp;&nbsp;");//这才是正确的！
				s = s.replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
				s = s.replace(" ", "&nbsp;");
				s = s.replace("\"", "\\" + "\"");//如果原文含有双引号，这一句最关键！！！！！！
				return s;
			}
		}

		function delImg() {
			layer.confirm('确定要删除吗？', {
				icon : 3,
				shade : false
			//不显示遮罩
			}, function(index) {
				layer.close(index);
			//	$("#article\\.cover").val('');
			///	$("#showPicUrl").attr('src', '');
			//	$("#showPicUrl").hide();
				$("#delBtn").hide();
			});
		}
		function showPic(jsonData,id) {
			$("#save_"+id).val(jsonData.attachmentUrl);
			$("#show_"+id).attr('src', jsonData.attachmentUrl);
			$("#show_"+id).show();
			$("#delBtn").show();
		}
	</script>
</body>
</html>
