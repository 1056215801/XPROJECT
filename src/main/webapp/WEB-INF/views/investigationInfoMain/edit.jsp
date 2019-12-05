<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>创建/编辑</title>
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
 
<style type="text/css">
.btn-success {
	background: orange;
}
</style>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
 
<script type="text/javascript">
	$(function() {
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

		$("#saveBtn").click(
				function() {
					$("#form").attr("action",
							"${ctx}/investigationInfoMain/save").submit();
				});
		$("#cancelBtn").click(
				function() {
					$("#form").attr("action","${ctx}/investigationInfoMain/myList");
				});
		
		$('#file_uploads').uploadify(
				{
					'debug' : false,
					'simUploadLimit' : 3,
					'multi' : true,
					'auto' : true,
					'removeCompleted' : true,
					'removeTimeout' : 1,
					'successTimeout' : 99999,
					'formData' : {
						'jsessionid' : '${pageContext.session.id}'
					},
					'uploader': '${ctx}/login/json/attachment/publish' , // 新版
					'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
					'overrideEvents' : [ 'onDialogClose', 'onUploadError',
							'onSelectError' ],
					'queueID' : 'fileQueues',
					'fileObjName' : 'attachment',
					'width' : '80',
					'height' : '30',
					'fileTypeDesc' : 'jpg gif png',
					'fileTypeExts' : '*.jpg;*.gif;*.png',
					'fileSizeLimit' : '2MB',
					'buttonText' : '上传图片',
					'queueSizeLimit' : 3,
					'onUploadProgress' : function(file, bytesUploaded,
							bytesTotal, totalBytesUploaded, totalBytesTotal) {
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
					'onUploadError' : function(file, errorCode, errorMsg) {
						if (errorCode = -280) {

						} else {
							alert('上传失败，请联系管理员2');
						}
					},
					'onCloseError' : function(file, errorCode, errorMsg) {
						alert('上传失败，请联系管理员3');
					},
					'onSelectError' : function(file, errorCode, errorMsg) {
						switch (errorCode) {
						case -100:
							alert("上传的文件数量已经超出系统限制的"
									+ $('#file_uploads').uploadify('settings',
											'queueSizeLimit') + "个文件！");
							break;
						case -110:
							alert("文件 ["
									+ file.name
									+ "] 大小超出系统限制的"
									+ $('#file_uploads').uploadify('settings',
											'fileSizeLimit') + "大小！");
							break;
						case -120:
							alert("文件 [" + file.name + "] 大小为零，不能上传！");
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
					'onUploadSuccess' : function(file, data, response) {
						var obj = JSON.parse(data);
						showPic(obj.attachment);
						$("#extend1").val(obj.attachment.attachmentUrl);
					}
				});

	});
	
	function showPic(jsonData) {
		$("#showPicUrl").attr('src', jsonData.attachmentUrl);
		$("#showPicUrl").show();
	}
</script>
</head>

<body class="gray-bg">
	<input type="hidden" id="requireCode" value="0" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>创建调查表</h5>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal" action="" id="form">
						<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
						<input type="hidden" name="id" value="${investigationInfoMain.id}"/>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">调查名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										name="investigationName"
										value="${investigationInfoMain.investigationName}"
										placeholder="请输入调查名称" />
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否可以匿名参与</label>
								<div class="col-sm-10">
									<div class="radio i-checks">
										<label> <input type="radio" value="1"
											name="isanonymous"
											${investigationInfoMain.isanonymous==1?"checked":""}>
											<i></i> 是
										</label> <label> <input type="radio" checked="checked"
											value="0" name="isanonymous"
											${investigationInfoMain.isanonymous==0?"checked":""}>
											<i></i> 否
										</label>
									</div>
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否可以查看结果统计</label>
								<div class="col-sm-10">
									<div class="radio i-checks">
										<label> <input type="radio" value="1" name="iscount"
											${investigationInfoMain.iscount==1?"checked":""}> <i></i>
											是
										</label> <label> <input type="radio" checked="checked"
											value="0" name="iscount"
											${investigationInfoMain.iscount==0?"checked":""}> <i></i>
											否
										</label>
									</div>
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">结束时间</label>
								<div class="col-sm-4">
									<input id="end" class="laydate-icon form-control layer-date"
										name="end"
										value='<fmt:formatDate value="${investigationInfoMain.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>' />
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<input type="hidden" name="extend1" id="extend1" value="${investigationInfoMain.extend1}">
								<label class="col-sm-2 control-label">上传图片</label>
								<div class="col-sm-10">
									<div style="float: left;">
										<img alt="" src="${investigationInfoMain.extend1}" id="showPicUrl" style="width: 100px; height: 100px;" />
									</div>
									<div style="float: left; margin-left: 15px;">
										<p>一张在线调查封面，能让你的调查锦上添花，增加查看点击率，也将影响其调查被推介的几率。</p>
										<p>图片小于2M ( jpg、gif、png)，尺寸为900*440px</p>
										<input type="file" data-no-uniform="true" name="attFiles" id="file_uploads" multiple="true" />
									</div>
								</div>
							</div>



							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<textarea id="remark" name="remark" class="form-control"
										style="height: 200px;">${investigationInfoMain.remark}</textarea>
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" id="saveBtn">保存</button>
									<c:if test="${investigationInfoMain.id!=null&&investigationInfoMain.id!=''}">
										<a class="btn btn-white" id="backBtn" href="javascript:window.history.go(-1);">取消</a>
									</c:if>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
