<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
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
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/css/jquery.searchableSelect.css" />
<script type="text/javascript"
	src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<script type="text/javascript"
	src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script>
<script type="text/javascript"
	src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript"
	src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript"
	src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js"
	charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript"
	src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
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
						<h5>项目发布</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal"
							action="${ctx}/projectDeclareInfo/save" id="form">
							<input type="hidden" id="atUrlList" name="atUrlList"
								value="${projectDeclareInfo.atUrlList}" /> <input type="hidden"
								id="atIdList" name="atIdList"
								value="${projectDeclareInfo.atIdList}" /> <input type="hidden"
								name="declareImage" id="declareImage"
								value="${projectDeclareInfo.declareImage}" /> <input
								type="hidden" name="declareId" id="declareId"
								value="${projectDeclareInfo.declareId}" /> <input type="hidden"
								name="saveType" id="saveType" value="" /> <input type="hidden"
								id="accountId" name="accountId" value="" /> <input
								type="hidden" id="accountName" name="accountName" value="" /> <input
								type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目标题</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="declareTitle"
										id="declareTitle" value="${projectDeclareInfo.declareTitle}" />
								</div>
							</div>
							<%-- <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">批次</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="declareBatch" id="declareBatch"
										value="${projectDeclareInfo.declareBatch}"
										placeholder="第几批，或哪年" />
								</div>
							</div> --%>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目级别</label>
								<div class="col-sm-10">
									<select class="form-control m-b" name="declareGrade">
										<option value=''>请选择</option>
										<option value='国家级'
											${projectDeclareInfo.declareGrade == '国家级'?"selected":"" }>国家级</option>
										<option value='省级'
											${projectDeclareInfo.declareGrade == '省级'?"selected":"" }>省级</option>
										<option value='市级'
											${projectDeclareInfo.declareGrade == '市级'?"selected":"" }>市级</option>
										<option value='区级'
											${projectDeclareInfo.declareGrade == '区级'?"selected":"" }>区级</option>
										<option value='其他'
											${projectDeclareInfo.declareGrade == '其他'?"selected":"" }>其他</option>
									</select>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">主管单位</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="supervisorName"
										id="supervisorName" value="${projectDeclareInfo.supervisorName }"/>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">正文</label>
								<div class="col-sm-10">
									<script name="declareText" id="editors" type="text/plain"
										style="width: 100%; height: 300px;">
										${projectDeclareInfo.declareText}
									</script>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">附件</label>
								<div class="col-sm-10">
									<div style="float: left; margin-top: 6px;">
										<input type="file" data-no-uniform="true" name="file_uploads"
											id="file_uploads" multiple="true"> <span
											id="fileQueues"></span>
									</div>
									<div id="attList"></div>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">海报</label>
								<div class="col-sm-10">
									<div style="float: left;">
										<img src="${projectDeclareInfo.declareImage}" id="showPic"
											style="width: 100px; height: 100px;" />
									</div>
									<div style="float: left; margin-left: 15px;">
										<p>图片小于2M ( jpg、gif、png)，尺寸为200*110px</p>
										<input type="file" name="picFile" data-no-uniform="true"
											id="pic_uploads" multiple="true" />
									</div>
								</div>
							</div>
							<c:if test="${projectDeclareInfo.declareId==null }">
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">时间节点</label>
								<div class="col-sm-10">
									<table id="tab" border="0" align="center" width="100%"
										class="editTable">
										<tr id="headId">
											<td>序号</td>
											<td></span>节点名称</td>
											<td>截止时间</td>
											<td></span>备注</td>
											<td align='center'><a href='javascript:void(0);'
												title='增加' onclick='addtr()'> [增加] </a></td>
										</tr>
										<%-- <c:forEach items="${nodeList }" var="nodeList" varStatus="i">
											<tr id="${i.index + 1 }" align='left'>
											<td><input type='hidden' name='nodeNum' id='nodeNum_"+${i.index + 1 }"'  value="${i.index + 1 }" />${i.index + 1 }</td>
											<td><input type='text' name='nodeTitle' id='nodeTitle_"+${i.index + 1 }"' value="${nodeList.nodeName}"/></td>
											<td><input id='endTime_"+${i.index + 1 }"'  class='laydate-icon form-control layer-date' name='endTime' style='width: 80%' value="<fmt:formatDate value="${nodeList.endTime}" pattern="yyyy-MM-dd"/>"/></td>
											<td style='height: 60px;'><textarea name='remark'  id='remark_"+${i.index + 1 }"'  cols='60' rows='4' style='width: 90%; height: 50px;'>${nodeList.remark}</textarea></td>
											<td></td>
											</tr> 
											</c:forEach> --%>
									</table>
								</div>
							</div>
							</c:if>
							<c:if test="${projectDeclareInfo.declareRemark!=null || projectDeclareInfo.declareId==null}">
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<textarea name='declareRemark' id='declareRemark' cols='60'
										rows='4' style='width: 70%; height: 150px;'
										placeholder="若不设置时间节点，请填写备注，例'常年受理'">${projectDeclareInfo.declareRemark }</textarea>
								</div>
							</div>
							</c:if>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否允许在线申报</label>
								<div class="col-sm-10">
									<div class="radio i-checks">
										<c:if test="${projectDeclareInfo.applyOnline!=null}">
											<label> <input type="radio" name="applyOnline"
												value="1"
												${projectDeclareInfo.applyOnline == '1'?"checked":"" }>是
											</label>
											<label> <input type="radio" name="applyOnline"
												value="0"
												${projectDeclareInfo.applyOnline == '0'?"checked":"" }>否
											</label>
										</c:if>
										<c:if test="${projectDeclareInfo.applyOnline==null}">
											<label> <input type="radio" name="applyOnline"
												value="1">是
											</label>
											<label> <input type="radio" name="applyOnline"
												value="0" checked="checked">否
											</label>
										</c:if>
									</div>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否推荐</label>
								<div class="col-sm-10">
									<div class="radio i-checks">
										<c:if test="${projectDeclareInfo.isRecommend!=null}">
											<label> <input type="radio" name="isRecommend"
												value="1"
												${projectDeclareInfo.isRecommend == '1'?"checked":"" }>是
											</label>
											<label> <input type="radio" name="isRecommend"
												value="0"
												${projectDeclareInfo.isRecommend == '0'?"checked":"" }>否
											</label>
										</c:if>
										<c:if test="${projectDeclareInfo.isRecommend==null}">
											<label> <input type="radio" name="isRecommend"
												value="1">是
											</label>
											<label> <input type="radio" name="isRecommend"
												value="0" checked="checked">否
											</label>
										</c:if>
									</div>
								</div>
							</div>
                            <c:if test="${projectDeclareInfo.declareId==null}">
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">选择账户</label>
								<div class="col-sm-10">
									<select class="form-control m-b" id="selectAccountId"
										style="width: 40%">
										<%
											int n = 0;
										%>
										<c:if test="${accountInfoList!=null}">
											<c:forEach items="${accountInfoList}" var="account">
												<option id="a<%=n++%>" value='${account.accountId}'>${account.accountName}</option>
											</c:forEach>
										</c:if>
									</select> <input type="checkbox" id="check" />
								</div>

							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">随机账户</label>
								<div class="col-sm-10">
									<input id="randomAccountId" type="hidden"
										value="${accountInfoRandom.accountId}" /> <input
										id="randomAccountName" style="width: 40%"
										value="${accountInfoRandom.accountName}" />
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
							</c:if>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="button" class="btn btn-primary" id="saveBtn"
										value="发布" />
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
		var ue = null;
		$(function() {
			
			$("#cancelBtn").click(function() {
				window.history.go(-1);
			});
			
			if('${projectDeclareInfo.declareImage}'==null || '${projectDeclareInfo.declareImage}'==""){
			$('#showPic').hide();
			}
			$("#selectAccountId").searchableSelect();
            
			if('${projectDeclareInfo.declareId}'==null){
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
			}
			//校验 
			$("#form").validate({
				rules : {
					declareTitle : {
						required : true,
						maxlength : 50
					},
					declareBatch : {
						required : true,
						maxlength : 10
					},
					editors : {
						required : true,
						maxlength : 10000
					},
					declareRemark : {
						maxlength : 250
					},
				}

			});

			

			//时间控件
			if ("${listSize!=null}") {
				var size = "${listSize}";
				for (var i = 1; i < size; i++) {
					var timeNow = {
						elem : '#endTime_' + i, //选择ID为START的input
						event : "focus",
						format : 'YYYY-MM-DD', //自动生成的时间格式
						//	min : laydate.now(), //设定最小日期为当前日期
						max : '2099-06-16 23:59:59', //最大日期
						istoday : true, //是否是当天
						start : laydate.now(0, "YYYY-MM-DD"), //设置开始时间为当前时间
					};
					laydate(timeNow);
				}
			}

			UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
			UE.Editor.prototype.getActionUrl = function(action) {
				if (action == 'uploadvideo' || action == 'uploadscrawl'
						|| action == 'uploadimage') {
					return '${ctx}/uploadimage';
				} else {
					return this._bkGetActionUrl.call(this, action);
				}
			}
			ue = UE.getEditor('editors');
			/*  ue.addListener("ready", function () {
			    ue.setContent( "000000000000000");
			   }); */

			var msg = '${message}';
			if (msg != null && msg != "") {
				tips(msg);
				msg = null;
			}

			//图片附件
			$('#pic_uploads')
					.uploadify(
							{
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
								'uploader' : '${ctx}/session/attachment/publish', // 新版
								'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
								'overrideEvents' : [ 'onDialogClose',
										'onUploadError', 'onSelectError' ],
								'fileObjName' : 'attachment',
								'width' : '80',
								'height' : '30',
								'fileTypeDesc' : '支持的格式：',
								'fileTypeExts' : '*.jpg;*.png',
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
												+ $('#uploadify').uploadify(
														'settings',
														'queueSizeLimit')
												+ "个文件！");
										break;
									case -110:
										alert("文件 ["
												+ file.name
												+ "] 大小超出系统限制的"
												+ $('#uploadify').uploadify(
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
									showPic(obj.attachment);
									$("#declareImage").val(obj.attachment.attachmentUrl);
								}
							});

			$('#file_uploads')
					.uploadify(
							{
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
								'uploader' : '${ctx}/session/attachment/publish', // 新版
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
												+ $('#uploadify').uploadify(
														'settings',
														'queueSizeLimit')
												+ "个文件！");
										break;
									case -110:
										alert("文件 ["
												+ file.name
												+ "] 大小超出系统限制的"
												+ $('#uploadify').uploadify(
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
									showAtts(obj.attachment);

									var url = $("#atUrlList").val()
											+ obj.attachment.attachmentUrl
											+ ",";
									$("#atUrlList").val(url);
									var id = $("#atIdList").val()
											+ obj.attachment.attachmentId + ",";
									$("#atIdList").val(id);
								}
							});

			//提交  
			$("#saveBtn")
					.click(
							function() {

								if ($('#applyAccountName').val() != ""
										&& $('#applyAccountName').val() != null) {
									$('#accountName').val(
											$('#applyAccountName').val());
									if ($('#check').is(':checked')) {
										$('#accountId')
												.val(
														$(
																'#selectAccountId option:selected')
																.val());
									} else {
										$('#accountId').val(
												$('#randomAccountId').val());
									}
								} else {
									if ($('#check').is(':checked')) {
										$('#accountId')
												.val(
														$(
																'#selectAccountId option:selected')
																.val());
										$('#accountName')
												.val(
														$(
																'#selectAccountId option:selected')
																.text());
									} else {
										$('#accountId').val(
												$('#randomAccountId').val());
										$('#accountName').val(
												$('#randomAccountName').val());
									}
								}
								$
										.ajax({
											url : "${ctx}/projectDeclareInfo/operationSave",
											type : "post",
											data : $("#form").serialize(),
											dataType : "json",
											success : function(result) {
												layer.msg(result);
												window.location.href="${ctx}/projectDeclareInfo/operationList";
											},
											error : function() {
												tips("创建异常！");
											}
										});
							});

			$("#previewBtn").click(function() {
				$('#saveType').val(0);
				$("#form").submit();
			});

			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});

		});
		function endTime(num) {
			var time = "";
			if (num == 1) {
				//时间控件
				time = {
					elem : '#endTime_' + num, //选择ID为START的input
					event : "focus",
					format : 'YYYY-MM-DD', //自动生成的时间格式
					//min : laydate.now(), //设定最小日期为当前日期
					max : '2099-06-16 23:59:59', //最大日期
					istoday : true, //是否是当天
					start : laydate.now(0, "YYYY-MM-DD"), //设置开始时间为当前时间
				};

			} else {
				var minNum = num - 1;
				var minTime = "";
				if ($('#endTime_' + minNum).val() == "") {
					minTime = laydate.now();
				} else {
					minTime = $('#endTime_' + minNum).val();
				}
				time = {
					elem : '#endTime_' + num, //选择ID为START的input
					event : "focus",
					format : 'YYYY-MM-DD', //自动生成的时间格式
					min : minTime, //设定最小日期为当前日期
					max : '2099-06-16 23:59:59', //最大日期
					istoday : true, //是否是当天
					start : laydate.now(0, "YYYY-MM-DD"), //设置开始时间为当前时间
				};
			}
			laydate(time);
		}

		function showAtts(jsonData) {
			var url = "";
			url += '<li id="'+jsonData.attachmentId+'"><a href="'+jsonData.attachmentUrl+'" target="_blank" >'
					+ jsonData.remoteName
					+ '</a>&nbsp;<a href="javascript:;"  onclick="deleteAtt(\''
					+ jsonData.attachmentId
					+ '\',\''
					+ jsonData.attachmentUrl
					+ '\')">[删除]</a></li> ';
			$('#attList').append(url);

		}
		function deleteAtt(id, url) {
			confirm('确认删除？', function(index) {
				$('#' + id).remove();
				var atIdList = $('#atIdList').val();
				var atUrlList = $('#atUrlList').val();
				var atIdAttr = atIdList.split(",");
				var atUrlAttr = atUrlList.split(",");
				var newIds = "";
				var newUrls = "";
				for (var i = 0; i < atIdAttr.length; i++) {
					if (atIdAttr[i] != "" && atIdAttr[i] != id) {
						var newId = atIdAttr[i] + ",";
						newIds += newId;
					}
					if (atUrlAttr[i] != "" && atUrlAttr[i] != url) {
						var newUrl = atUrlAttr[i] + ",";
						newUrls += newUrl;
					}
				}
				$('#atIdList').val(newIds);
				$('#atUrlList').val(newUrls);
			}, function() {
			});
		}

		if ("${listSize!=null}") {
			var squences = "${listSize}";
		} else {
			var squences = 0;
		}
		function addtr() {
			squences++;
			var nodeNumId = "nodeNum_" + squences;
			var nodeNameId = "nodeTitle_" + squences;
			var endTimeId = "endTime_" + squences;
			var reMarkId = "remark" + squences;
			var _len = $("#tab tr").length;
			$("#tab")
					.append(
							"<tr id='"+squences+"' align='left'>"
									+ "<td><input type='hidden' name='nodeNum' id='"+nodeNumId+"'  value='"+ _len+ "' />"
									+ _len
									+ "</td>"
									+ "<td><input type='text' name='nodeTitle' id='"
									+ nodeNameId
									+ "' style='width: 80%'/></td>"
									+ "<td><input id='"
									+ endTimeId
									+ "' class='laydate-icon form-control layer-date' name='endTime' style='width: 60%' /></td>"
									+ "<td style='height: 60px;'><textarea name='remark' id='"
									+ reMarkId
									+ "' cols='60' rows='4' style='width: 70%; height: 100px;'></textarea></td>"
									+ "<td><a href='javascript:void(0);' title='删除' onclick='deltr("
									+ squences + ")'>[删除]</a></td>" + "</tr>");
			endTime(squences);
			return squences;
		}
		//删除<tr/>并重新设置序号
		function deltr(sid) {
			/* 	confirm('确定删除?', function() {
			 */
			$("tr[id='" + sid + "']").remove();//删除当前行
			squences--;
			var _len = $("#tab tr").length;
			$("#tab tr").each(function(i, val) {
				if (i > 0)
					$(this).children().eq(0).text(i);
			});
			/* return;
			}, function() {
			return;
			}
			); */
		}
		function showPic(jsonData) {
			$("#showPic").attr('src', jsonData.attachmentUrl);
			$("#showPic").show();
		}
	</script>
</body>



</html>
