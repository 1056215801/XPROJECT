<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>创建项目</title>
<link href="${ctx}/static/css/projectDeclare/createProject.css"rel="stylesheet" />
<link href="${ctx}/static/css/plugins/iCheck/custom.css"rel="stylesheet" />
<script>
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
		$(".tabItem ul li").eq(1).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".tiitleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
 });
 function createPreview(){
 	location.href="createPreview.html";
 }
</script>
</head>

<body>
	<div class="create_main">
		<div class="project_header">
			<%@ include file="../common/header.jsp"%>
		</div>
	<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020171109144912000062000000008"/>
	<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="项目申报" />
		<div class="create_content">
			<div class="titleName">
				<ul>
					<li><a href="javascript:;">创建项目</a></li>
				</ul>
				<div style="clear: both;"></div>
			</div>
			<form method="post" class="form-horizontal" action="${ctx}/projectDeclare/save" id="form">
				<input type="hidden" id="atUrlList" name="atUrlList" value="${projectDeclareInfo.atUrlList}" /> 
				<input type="hidden" id="atIdList" name="atIdList" value="${projectDeclareInfo.atIdList}" /> 
				<input type="hidden" name="declareImage" id="declareImage" value="${projectDeclareInfo.declareImage}" /> 
				<input type="hidden" name="declareId" id="declareId" value="${projectDeclareInfo.declareId}" />
				<input type="hidden" name="nodeTitle" id="nodeTitle" value="" /> 
				<input type="hidden" name="endTime" id="endTime" value="" /> 
				<input type="hidden" id="num" value="0" /> 
				<input type="hidden" id="isPreview" name="isPreview" value="" /> 
				<input type="hidden" name="saveType" id="saveType" value="" /> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="tiitleItem">
					<div>
						<div class="create_inputBar">
							<div class="create_input">
								<font class="redStar">*</font> <div class="create_attr">项目标题</div>
								<input type="text" class="inputContral" style="width: 81.5%;" name="declareTitle" id="declareTitle" value="${projectDeclareInfo.declareTitle}" maxlength="50" />
								<div style="clear: both;"></div>
							</div>
							<div class="create_input">
								<font class="redStar">*</font> <div class="create_attr">项目级别</div>
								<select class="selectContral" style="width: 15%;" name="declareGrade">
									<option value='国家级' ${projectDeclareInfo.declareGrade == '国家级'?"selected":"" }>国家级</option>
									<option value='省级' ${projectDeclareInfo.declareGrade == '省级'?"selected":"" }>省级</option>
									<option value='市级' ${projectDeclareInfo.declareGrade == '市级'?"selected":"" }>市级</option>
									<option value='县级' ${projectDeclareInfo.declareGrade == '县级'?"selected":"" }>县级</option>
									<option value='其他' ${projectDeclareInfo.declareGrade == '其他'?"selected":"" }>其他</option>
								</select>
								<div style="clear: both;"></div>
							</div>
							<div class="create_input">
								<font class="redStar">*</font> <div class="create_attr">主管单位</div>
								<input type="hidden" class="inputContral" name="supervisorName" id="supervisorName" value="${projectDeclareInfo.supervisorName}" maxlength="50" />
								
								<select name="supervisorId" id="supervisorId" class="selectContral" style="width: 25%;">
									<c:forEach items="${organizationList }" var="info">
									<option value="${info.organizationId }">${info.organizationName}</option>
									</c:forEach>
								</select>
								<div style="clear: both;"></div>
							</div>
							<div class="create_input">
								<font class="redStar">*</font> <div class="create_attr">上传海报</div>
								<c:if test="${projectDeclareInfo.declareImage!=null}">
									<img src="${projectDeclareInfo.declareImage}" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
								</c:if>
								<c:if test="${projectDeclareInfo.declareImage==null}">
									<img src="${ctx}/static/image/projectDeclare/defaultImage.png" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
								</c:if>
								<div class="uploadImgTips">
									<p>一张项目申报封面，能让你的项目锦上添花，增加查看点击率，也将影响其项目被推介的几率。</p>
									<p>图片小于2M ( jpg、gif、png)，尺寸为200*110px</p>
									<div id="pictureUpload" style="margin-top: 32px;">
										<input type="file" data-no-uniform="true" name="attFiles" id="pic_uploads" multiple="true" />
									</div>
								</div>
								<div style="clear: both;"></div>
							</div>
							<div class="create_input">
								<font class="redStar">*</font> <div class="create_attr">正文</div>
								<div style="float: left; margin-left: 15px; width: 81.5%;">
									<textarea id="editor" name="declareText"  placeholder="这里输入内容">${projectDeclareInfo.declareText}</textarea>
								</div>
								<div style="clear: both;"></div>
							</div>
							<div class="create_input">
								<div class="create_attr" style="margin-left: 15px;">附件</div>
								<div id="fileUpload" style="float: left; margin-left: 15px;">
									<input type="file" data-no-uniform="true" name="file_uploads" id="file_uploads" multiple="true" />
									<span id="fileQueues"></span>
								</div>
								<div style="clear: both;"></div>
								<div style="margin-left:80px;" id="attList"></div>
							</div>
							<div class="create_input">
								<font class="redStar">*</font> <div class="create_attr">项目各阶段截至时间节点设置</div>
								<div style="float: left;">
									<input id="laydate" class="laydate-icon form-control layer-date laydateContral">
									<input type="text" class="inputContral" style="width: 200px; margin-left: 10px;" id="nodeTitleStr">
									<input type="button" value="添加" class="addNodeBtn" onclick='addtr()'>&nbsp;<span style='color:red'>添加后时间节点才可生效！</span>
									<div style="clear: both;"></div>

									<div style="margin: 15px;" id="nodeList">
									<%
										int n = 1;
									%>
									<c:forEach items="${nodeList }" var="nodeList" varStatus="i">
										<%
											n++;
										%>
										<c:if test="<%=n % 4 == 0%>">
											<div class="timeNode conduct_element" id="${i.index + 1 }">
										</c:if>
										<c:if test="<%=n % 4 == 1%>">
											<div class="timeNode success_element" id="${i.index + 1 }">
										</c:if>
										<c:if test="<%=n % 4 == 2%>">
											<div class="timeNode warning_element" id="${i.index + 1 }">
										</c:if>
										<c:if test="<%=n % 4 == 3%>">
											<div class="timeNode danger_element" id="${i.index + 1 }">
										</c:if>
										${nodeList.nodeName}
										<div class="timeNodeBottom">
											<a href="javascript:;" class="deleteNodeBtn" onclick="deltr('${i.index + 1 }','${nodeList.nodeName}','${nodeList.endTimeStr}')">删除</a>
											<img src="${ctx}/static/image/projectDeclare/time.png" width="12px;" height="12px;" class="img_contral_t1">
											<fmt:formatDate value="${nodeList.endTime}" pattern="yyyy-MM-dd" />
										</div>
									</div>
									</c:forEach>

									<%-- <div class="timeNode conduct_element">
									申报截止
									<div class="timeNodeBottom">
										<a href="javascript:;" class="deleteNodeBtn">删除</a>
										<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="12px;" height="12px;" class="img_contral_t1"> 
										2015.09.01
									</div>
								</div>
								<div class="timeNode success_element">
									申报截止
									<div class="timeNodeBottom">
										<a href="javascript:;" class="deleteNodeBtn">删除</a>
										<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="12px;" height="12px;" class="img_contral_t1"> 
										2015.09.01
									</div>
								</div>
								<div class="timeNode warning_element">
									申报截止
									<div class="timeNodeBottom">
										<a href="javascript:;" class="deleteNodeBtn">删除</a>
										<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="12px;" height="12px;" class="img_contral_t1"> 
										2015.09.01
									</div>
								</div>
								<div class="timeNode danger_element">
									申报截止
									<div class="timeNodeBottom">
										<a href="javascript:;" class="deleteNodeBtn">删除</a>
										<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="12px;" height="12px;" class="img_contral_t1"> 
										2015.09.01
									</div>
								</div> --%>

								</div>
							</div>
							<div style="clear: both;"></div>
						</div>

						<div class="create_input">
							<font class="redStar">*</font> <div class="create_attr">备注</div>
							<input name="declareRemark" id="declareRemark" maxlength="4" style="width: 70%; float: left; margin-left: 15px;"
								placeholder="若不设置时间节点，请填写备注，例'全年受理'，最多4个字符" onkeyup="this.value=this.value.replace(/[^u4e00-u9fa5w]/g,'')" value="${projectDeclareInfo.declareRemark }"/>
							<div style="clear: both;"></div>
						</div>

						<div class="create_input">
							<font class="redStar">*</font> <div class="create_attr">是否允许企业在线申报</div>
							<div style="float: left; margin-left: 15px;">
								<c:if test="${projectDeclareInfo.applyOnline!=null}">
									<div class="radio i-checks" style="float: left;">
										<input type="radio" name="applyOnline" value="1" ${projectDeclareInfo.applyOnline == '1'?"checked":"" }>是
									</div>
									<div class="radio i-checks"
										style="float: left; margin-left: 15px;">
										<input type="radio" name="applyOnline" value="0" ${projectDeclareInfo.applyOnline == '0'?"checked":"" }>否
									</div>
									<div style="clear: both;"></div>
								</c:if>
								<c:if test="${projectDeclareInfo.applyOnline==null}">
									<div class="radio i-checks" style="float: left;">
										<input type="radio" name="applyOnline" value="1">是
									</div>
									<div class="radio i-checks" style="float: left; margin-left: 15px;">
										<input type="radio" name="applyOnline" value="0" checked="checked">否
									</div>
									<div style="clear: both;"></div>
								</c:if>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="create_input">
							<font class="redStar">*</font> <div class="create_attr">是否推荐</div>
							<div style="float: left; margin-left: 15px;">
								<c:if test="${projectDeclareInfo.isRecommend!=null}">
									<div class="radio i-checks" style="float: left;">
										<input type="radio" name="isRecommend" value="1" ${projectDeclareInfo.isRecommend == '1'?"checked":"" }>是
									</div>
									<div class="radio i-checks"
										style="float: left; margin-left: 15px;">
										<input type="radio" name="isRecommend" value="0" ${projectDeclareInfo.isRecommend == '0'?"checked":"" }>否
									</div>
									<div style="clear: both;"></div>
								</c:if>
								<c:if test="${projectDeclareInfo.isRecommend==null}">
									<div class="radio i-checks" style="float: left;">
										<input type="radio" name="isRecommend" value="1">是
									</div>
									<div class="radio i-checks" style="float: left; margin-left: 15px;">
										<input type="radio" name="isRecommend" value="0" checked="checked">否
									</div>
									<div style="clear: both;"></div>
								</c:if>
							</div>
							<div style="clear: both;"></div>
						</div>


						<!-- <div class="create_input">
						<font class="redStar">*</font>
						<span class="create_attr">是否允许企业查看申报进度</span>
						<div style="float:left; margin-left:15px;">
							<div class="i-checks" style="float:left;">
								<input type="radio" value="option1" name="schedule">是
							</div>
							<div class="i-checks" style="float:left; margin-left:15px;">
								<input type="radio" checked="" value="option2" name="schedule">否
							</div>
						</div>
						<div style="clear:both;"></div>
					</div> -->
						<div style="padding-right: 76px;">
							<input type="button" value="发布" class="redBtnContral"
								id="saveBtn"> <input type="button" value="预览"
								id="previewBtn" class="grayBtnContral">
							<div style="clear: both;"></div>
						</div>
					</div>
				</div>
		</div>
		</form>
	</div>

	<%@ include file="../common/footer.jsp"%>
	
    <script type="text/javascript" src="${ctx}/static/js/jquery-form.js"></script> 
	<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script type="text/javascript" src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
	<script type="text/javascript" src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/plugins/tinymce/tinymce.min.js"></script>
 
	<script type="text/javascript">
		var ue = null;
		$(function() {
			if('${listSize}'!=0){
				var nodeTitle = '${nodeTitle}';
				var endTime = '${endTime}';
				$('#nodeTitle').val(nodeTitle);
				$('#endTime').val(endTime);
			}
			
			//时间控件
			var	time = {
				elem : '#laydate', //选择ID为START的input
				event : "focus",
				format : 'YYYY-MM-DD', //自动生成的时间格式
			 	min : laydate.now(), //设定最小日期为当前日期 
				max : '2099-06-16 23:59:59', //最大日期
				istoday : true, //是否是当天
				start : laydate.now(0, "YYYY-MM-DD"), //设置开始时间为当前时间
				};
			laydate(time);
			
			/* if('${projectDeclareInfo.declareImage}'==null || '${projectDeclareInfo.declareImage}'==""){
			$("#showPicUrl").hide();
			}else{
				$("#showPicUrl").show();
			} */
			
			 //附件编辑时展示
			if("${projectDeclareInfo.atIdList}"!=null &&"${projectDeclareInfo.atIdList}"!=""){
				var atIdList = "${projectDeclareInfo.atIdList}";
			   $.get("${ctx}/login/json/attachment/selectListByAttachmentIdList", "attachmentIdList="+atIdList, 
	    		function(datas) {
				var data =JSON.parse(datas);
			          for(var i=0;i<data.attachments.length;i++){
			        	  showAtts(data.attachments[i]);  
			            }
			    } ,"json" );
			}

			  tinymce.init({
				    selector: '#editor',
			        height: 365,
			        language: 'zh_CN',
			        menubar: false,
			        automatic_uploads: true,
			        paste_data_images: true,
			        convert_urls: false,
			        relative_urls : false,
			        font_formats : "仿宋=仿宋;楷体=楷体;宋体=宋体;黑体=黑体;微软雅黑=微软雅黑;华文中宋=华文中宋;Courier New=courier new,courier,monospace;AkrutiKndPadmini=Akpdmi-n",
			     // fontsize_formats : "14px 15px 16px 17px 18px 19px 20px 21px 22px 23px 24px 25px 26px 27px 28px 29px 30px 32px 48px",
			        setup : //默认字体大小
						  function(ed) {
						    ed.on('init', function() 
						    {
						        this.getDoc().body.style.fontSize = '14px';
						    });
						  },

						  upload_image_url: '${ctx}/session/attachment/publish?moduleId='+$('#moduleId').val()==undefined ? -1 : $('#moduleId').val()+'&remark='+$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val(), //配置的上传图片的路由
			        wordcount_countregex: /[\u4e00-\u9fa5_a-zA-Z0-9]/g,
			        plugins: [
					    "advlist autolink autosave link image   lists charmap print preview hr anchor pagebreak spellchecker",
					    "searchreplace wordcount visualblocks visualchars code codesample fullscreen insertdatetime media nonbreaking",
					    "table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern uploadimage iw_2em"
					  ],
					  toolbar1: "undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | fontselect fontsizeselect iw_2em ",
			          toolbar2: "forecolor backcolor | bullist numlist | outdent indent | removeformat | link unlink uploadimage | preview code fullscreen ",
			       // toolbar1: '  bold italic underline strikethrough removeformat | blockquote hr table image  codesample | anchor link   unlink | alignleft aligncenter alignright alignjustify | bullist numlist     ',
			       // toolbar2: '  formatselect | outdent indent | forecolor backcolor  |  undo redo | code  fullscreen uploadimage',
				});
			var msg = '${message}';
			if(msg!=null&&msg!=""){
				tips(msg);
				msg=null;
			}
			//图片附件
			$('#pic_uploads').uploadify({
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
				 'uploader': '${ctx}/session/attachment/publish' , // 新版
				'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
				'overrideEvents' : [ 'onDialogClose',
						'onUploadError', 'onSelectError' ],
				'fileObjName' : 'attachment',
				'width' : '80',
				'height' : '30',
				'fileTypeDesc' : '支持的格式：',
				'fileTypeExts' : '*.jpg;*.png',
				'fileSizeLimit' : '2MB',
				'buttonText' : '上传图片',
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
								+ $('#pic_uploads').uploadify(
										'settings',
										'queueSizeLimit')
								+ "个文件！");
						break;
					case -110:
						alert("文件 ["
								+ file.name
								+ "] 大小超出系统限制的"
								+ $('#pic_uploads').uploadify(
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
					var obj =JSON.parse(data);
					showPic(obj.attachment);
					$("#declareImage").val(obj.attachment.attachmentUrl);
				}
			});
			
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
				 'uploader': '${ctx}/session/attachment/publish' , // 新版
				'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
				'overrideEvents' : [ 'onDialogClose',
						'onUploadError', 'onSelectError' ],
				'queueID' : 'attList',
				'fileObjName' : 'attachment',
				'width' : '80',
				'height' : '30',
				'fileTypeDesc' : '支持的格式：',
				'fileTypeExts' : '*.*',
				'fileSizeLimit' : '100MB',
				'buttonText' : '上传附件',
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
					var obj =JSON.parse(data);
					// alert(data);
					showAtts(obj.attachment);
					
					var url = $("#atUrlList").val() + obj.attachment.attachmentUrl + ",";
					$("#atUrlList").val(url);
					var id = $("#atIdList").val() + obj.attachment.attachmentId + ",";
					$("#atIdList").val(id);
				}
			});

			

			//提交  
			$("#saveBtn").click(function() {
				$("#saveBtn").attr("disabled","true");
			  	 var declareTitle = $("#declareTitle").val(); 
				if(declareTitle==null || declareTitle==""){
					tips('请输入项目标题！');
					return false;
				}
				/* var supervisorName = $("#supervisorName").val(); 
				if(supervisorName==null || supervisorName==""){
					tips('请输入主管单位！');
					return false;
				} */
				var declareImage = $("#declareImage").val(); 
				if(declareImage==null || declareImage==""){
					tips('请上传海报！');
					return false;
				}   
				var activeEditor = tinymce.activeEditor;
				var editBody = activeEditor.getBody();
				activeEditor.selection.select(editBody);
				var declareText = activeEditor.selection.getContent( { 'format' : 'text' } );
				declareText = declareText.trim();
				if(declareText==null || declareText==""){
					tips('请输入项目正文！');
					return false;
				} 
				
				 var atUrlList = $("#atUrlList").val();
				var atIdList = $("#atIdList").val();
				if((atUrlList==null || atUrlList=="")||(atIdList==null || atIdList=="")){
					tips('请上传附件！');
					return false;
				} 
				
			  
			 	 var endTime = $("#endTime").val();				
				if(endTime==null || endTime==""){
					if($('#declareRemark').val()==""){
						tips('若没有时间节点，备注不能为空！');
						return false;
					}
				}else{
					 if( $("#declareRemark").val()!=""  && $("#declareRemark").val()!=null){
					      alert("时间节点备注不能同时存在！");
					      return false;
					    } 
				}   
				
				 $("#supervisorName").val($("#supervisorId option:selected").text());
				 
				$("#form").submit();    
			});
			//预览
			$("#previewBtn").click(function() {
				$("#previewBtn").attr("disabled","true");
				var declareTitle = $("#declareTitle").val(); 
				if(declareTitle==null || declareTitle==""){
					tips('请输入项目标题！');
					return false;
				}
				/* var supervisorName = $("#supervisorName").val(); 
				if(supervisorName==null || supervisorName==""){
					tips('请输入主管单位！');
					return false;
				} */
				var declareImage = $("#declareImage").val(); 
				if(declareImage==null || declareImage==""){
					tips('请上传海报！');
					return false;
				}   
				var activeEditor = tinymce.activeEditor;
				var editBody = activeEditor.getBody();
				activeEditor.selection.select(editBody);
				var declareText = activeEditor.selection.getContent( { 'format' : 'text' } );
				declareText = declareText.trim();
				if(declareText==null || declareText==""){
					tips('请输入项目正文！');
					return false;
				}
				/* var atUrlList = $("#atUrlList").val();
				var atIdList = $("#atIdList").val();
				if((atUrlList==null || atUrlList=="")||(atIdList==null || atIdList=="")){
					tips('请上传附件！');
					return false;
				} */
			 	var endTime = $("#endTime").val();				
				if(endTime==null || endTime==""){
					if($('#declareRemark').val()==""){
						tips('若没有时间节点，备注不能为空！');
						return false;
					}
				}else{
					 if( $("#declareRemark").val()!=""  && $("#declareRemark").val()!=null){
					      alert("时间节点备注不能同时存在！");
					      return false;
					    } 
				}    
				$("#supervisorName").val($("#supervisorId option:selected").text());
				$('#saveType').val(0);
				$("#form").submit();
			});
			
			
			 $(".i-checks").iCheck({
			        checkboxClass: "icheckbox_square-green",
			        radioClass: "iradio_square-green",
			    }) ;
			
		});
      
        
		function showAtts(jsonData) {
			var url = "";
			url += '<li id="'+jsonData.attachmentId+'"><a href="'+jsonData.attachmentUrl+'" target="_blank" style="color:blue;">'
					+ jsonData.remoteName
					+ '</a>&nbsp;<a href="javascript:;" style="color:blue;"  onclick="deleteAtt(\''+jsonData.attachmentId+'\',\''+jsonData.attachmentUrl+'\')">[删除]</a></li> ';
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
		
		if("${listSize!=null}"){
		     var squences="${listSize}";
		}else{
		     var squences=0;
		}
		var num = 0;
		function addtr(){
			squences++;
			num = $('#num').val();
			if(num==4){
				num = 1;
				$('#num').val(1);
			}else{
				num++;
				$('#num').val(num);
			}
			
			var nodeTitleStr = $('#nodeTitleStr').val().trim();
			var laydate = $('#laydate').val().trim();
			
			if(nodeTitleStr==null || nodeTitleStr == "" || laydate==null || laydate == ""){
				 tips('请不要添加空节点！');
			}else{
			var nodeTitle = $('#nodeTitle').val();
			var endTime = $('#endTime').val();
			var endTimeLast = "";
			
			if(endTime!=null && endTime!=""){
				var endTimeStr = endTime.split(","); 
				var nodeTitleStrr = nodeTitle.split(","); 
				endTimeLast = endTimeStr[endTimeStr.length-1];
				if(endTimeLast>=laydate){
					tips('时间节点时间必须小于上一时间节点的时间！');
					return;
				}
				for(var i =0;i<nodeTitleStrr.length;i++){
				if(nodeTitleStrr[i]==nodeTitleStr){
					tips('节点名称不能相同！');
					return;
				}
				}
			}
			if(nodeTitle=="" || nodeTitle==null){
			nodeTitle = nodeTitleStr;
			}else{
			nodeTitle += ","+nodeTitleStr;
			}
			if(endTime=="" || endTime==null){
				endTime = laydate;
			}else{
			   endTime += ","+laydate;
			}
			$('#nodeTitle').val(nodeTitle);
			$('#endTime').val(endTime);
			
			var _div= "";
			   if(num==1){
				   _div += '<div class="timeNode conduct_element" id="'+squences+'">';
			   }else if(num==2){
				   _div += '<div class="timeNode success_element" id="'+squences+'">';
			   }else if(num==3){
				   _div += '<div class="timeNode warning_element" id="'+squences+'">';
			   }else if(num==4){
				   _div += '<div class="timeNode danger_element" id="'+squences+'">';
			   }
			    _div  += nodeTitleStr
					   +'<div class="timeNodeBottom">'
					   +'<a href="javascript:;" class="deleteNodeBtn" onclick="deltr(\''+squences+'\',\''+nodeTitleStr+'\',\''+laydate+'\')">删除</a>'
					   +'<img src="${ctx}/static/image/projectDeclare/time.png" width="12px;" height="12px;" class="img_contral_t1">'
				       + laydate
					   +'</div>'
					   +'</div>';
			$("#nodeList").append(_div);
			}
			$('#nodeTitleStr').val("");
			$('#laydate').val("");
		}
		
		//删除<tr/>并重新设置序号
		function deltr(squences,nodeTitleStr,laydate) {
				 $("#"+squences).remove();//删除当前行
				 squences--;
				var nodeTitle = $('#nodeTitle').val();
				var endTime = $('#endTime').val();
				var nodeTitleArr = nodeTitle.split(",");
				var endTimeArr = endTime.split(",");
				nodeTitle = "";
				endTime = "";
				 for(var i =0;i<nodeTitleArr.length;i++){
					 if(nodeTitleArr[i] != nodeTitleStr){
						 if(i==0){
							 nodeTitle = nodeTitleArr[i];
						 }else{
							 nodeTitle += "," + nodeTitleArr[i];
						 }
					 }
					 if(endTimeArr[i] != laydate){
						 if(i==0){
							 endTime = endTimeArr[i];
						 }else{
							 endTime += "," + endTimeArr[i];
						 }
					 }
						 
				 }
				 $('#nodeTitle').val(nodeTitle);
				 $('#endTime').val(endTime);
				 
		}
		
		function showPic(jsonData){
				$("#showPicUrl").attr('src', jsonData.attachmentUrl);
				$("#showPicUrl").show();
		}
		
		function getEndTime(endTime){
			$("#showPicUrl").attr('src', jsonData.attachmentUrl);
			$("#showPicUrl").show();
	}
	</script>
</body>
</html>


