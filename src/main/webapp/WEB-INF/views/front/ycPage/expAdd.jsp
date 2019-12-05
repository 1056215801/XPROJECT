<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../../common/initUeditor.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>动态发布</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
<style type="text/css">
.searchable-select-holder {box-shadow:none;}
</style>
</head>
<body>
<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020171110162559000062000000022"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="园区动态" />
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-12">
						<div class="artical-nav"><p class="artical_p">动态发布</p><a href="${ctx}/experience/list?entranceId=${entranceId}&type=2">返回列表 ></a></div>
						<div class="artical-content">
							<form action="${ctx}/expShare/save" id="editForm" method="post">
								<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
								<input type="hidden" id="expId" name="expId" value="${expShareInfo.expId}"/>
								<input type="hidden" id="expLabel" name="expLabel" value="${expShareInfo.expLabel}"/>
								<input type="hidden" id="expImage" name="expImage" value="${expShareInfo.expImage}"/>
								<input type="hidden" id="imageId" name="imageId" value="${expShareInfo.imageId}"/>
								<input type="hidden" id="expAttachment" name="expAttachment" value="${expShareInfo.expAttachment}"/>
								<input type="hidden" id="attachmentId" name="attachmentId" value="${expShareInfo.attachmentId}"/>
								<input type="hidden" id="unitId" name="unitId" value="${expShareInfo.unitId}"/>
								<input type="hidden" id="isPreview" name="isPreview"/>
								<input type="hidden" id="isFwpg" name="isFwpg" value="1"/>
								<input type="hidden" id="entranceId" name="entranceId" value="${entranceId}"/>
								<div class="releaseItem">
									<div>
										<div class="release_inputBar">
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">动态名称</span>
												<input type="text" class="inputBox" style="width:81.5%;" id="expTitle" name="expTitle" value="${expShareInfo.expTitle}"/>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">分享单位</span>
												<!-- <select class="selectBox" style="width:40%;" name="expUnit">
													
													<option>江西融合科技股份有限责任公司</option>
												</select> -->
												<c:if test="${organizationList!=null && organizationList!=''}">
												<select class="selectBox" style="width:40%;" name="organizationId" id="organizationId">
													<c:forEach items="${organizationList}" var="info">
														<option value='${info.organizationId}' ${expShareInfo.unitId==info.organizationId?"selected":""}>
															${info.organizationName}
														</option>
													</c:forEach>
						        				</select>
												</c:if>
						        				<c:if test="${organizationList=='' || organizationList==null}">
												<span class="redTips" onclick="complete()" style="cursor: pointer;">请到&nbsp;“个人中心-企业设置”&nbsp;中完善你的信息&nbsp;></span>
						        				</c:if>
											</div>
											<div class="release_input clearfix">
												<span class="release_attr" style="margin-left:15px;">上传海报</span>
												<c:if test="${expShareInfo.expImage!=null}">
													<img src="${expShareInfo.expImage}" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
												</c:if>
												<c:if test="${expShareInfo.expImage==null}">
													<img src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
												</c:if>
												<div class="uploadImgTips">
													<p>一张动态分享封面，能让你的项目锦上添花，增加查看点击率，也将影响其动态被推荐的几率。</p>
													<p>图片小于2M ( jpg、gif、png)，尺寸为200*110px</p>
													<div id="pictureUpload" style="margin-top: 32px;">
														<input type="file" data-no-uniform="true" name="attFiles" id="pic_uploads" multiple="true"/>
													</div>
												</div>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">选择标签</span>
												<div class="searchOptionsRel clearfix">
													<c:forEach items="${tagList}" var="info">
														<div class="optionBtnRel" onclick="getTags(this)">${info.tagName}</div>
													</c:forEach>
													<div style="clear:both;"></div>
													<div style=" color: #aaa; font-size: 12px;">（最少选择一个标签，最多只能选择两个标签 ）</div>
												</div>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">动态详情</span>
												<div style="float:left; margin-left:15px; width:81.5%;">
													<%-- <textarea id="expText" name="expText"  placeholder="这里输入内容" style="width: 100%; height:200px; border: 1px solid #ccc; padding: 5px 7px;">${expShareInfo.expText}</textarea> --%>
													<script  id="editor" type="text/plain" name="expText" 
														style="width: 100%; height: 250px;  ">${expShareInfo.expText}</script>
												</div>
											</div>
											<div class="release_input clearfix">
												<span class="release_attr" style="margin-left: 15px;">附件</span>
												<div id="fileUpload" style="float:left; margin-left:15px;">
													<input type="file" data-no-uniform="true" name="file_uploads" id="file_uploads" multiple="true">
													<span id="fileQueues"></span>	
												</div>
												<div style="clear:both;"></div>
												<div style="margin-left:80px;" id="attList"></div>
											</div>
											<div style="padding-right:76px;">
												<input type="button" value="发布" onclick="save('2');" class="greenBtnContral">
												<input type="button" value="预览" onclick="save('1');" class="grayBtnContral">
												<div style="clear:both;"></div>
											</div>
										</div>
									</div>
								</div>	
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="authorityTips" style="display: none;">
			<div>
				<img src="${ctx}/static/image/projectDeclare/headPortrait.png"
					width="90px;" height="90px;"
					style="display: block; margin: 25px auto;">
				<div style="margin: 0 auto 30px; color: #aaa; text-align: center;">你当前账号未开通发布项目权限</div>
				<div style="width: 80%; margin: 0 auto;">
					<input type="button" class="button button-raised button_Contral"
						style="width: 37%;" value="暂不申请"> <input type="button"
						class="button button-raised button-caution button_Contral"
						style="width: 58%;" value="我要申请">
				</div>
			</div>
		</div>
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>	
<script type="text/javascript" src="${ctx}/static/plugins/tinymce/tinymce.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery-form.js"></script> 
<script type="text/javascript">

tinymce.init({
	selector: '#expText',
	height: 365,
	language: 'zh_CN',
	menubar: false,
	automatic_uploads: true,
	paste_data_images: true,
	convert_urls: false,
	relative_urls : false,
	font_formats : "仿宋=仿宋;楷体=楷体;宋体=宋体;黑体=黑体;微软雅黑=微软雅黑;华文中宋=华文中宋;Courier New=courier new,courier,monospace;AkrutiKndPadmini=Akpdmi-n",
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
		"advlist autolink autosave link image media lists charmap print preview hr anchor pagebreak spellchecker",
		"searchreplace wordcount visualblocks visualchars code codesample fullscreen insertdatetime media nonbreaking",
		"table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern uploadimage iw_2em"
	  ],
	  toolbar1: "undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | fontselect fontsizeselect iw_2em ",
      toolbar2: "forecolor backcolor | bullist numlist | outdent indent | removeformat | link unlink uploadimage | preview  code fullscreen ",
   //toolbar1: '  bold italic underline strikethrough removeformat | blockquote hr table image media codesample | anchor link   unlink | alignleft aligncenter alignright alignjustify | bullist numlist     ',
	//toolbar2: '  formatselect | outdent indent | forecolor backcolor  |  undo redo | code  fullscreen',
});
</script>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<script>
 $(function(){
	 $(".nav-content a").removeClass("on");
	if('${entranceId}'==3609009){
		$(".nav-content a:eq(3)").addClass("on");
	}	 
	$(".source-room a").removeClass("on");
    $(".source-room a:eq(5)").addClass("on");
	$(".fr li").eq(1).addClass("on");
    $(".tabName ul li").each(function(){
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(0).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".releaseName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".releaseName ul li").eq(0).addClass("releaseClick");
		$(this).click(function(){
			$(this).addClass("releaseClick").siblings().removeClass("releaseClick");
			$(".releaseItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
 });
 
</script>
<script type="text/javascript">
	$(function(){
		//初始化已选标签
		initTags('${expShareInfo.expLabel}');
		
		if('${expShareInfo.attachmentId}' != ''){
			initAttr('${expShareInfo.attachmentId}');
		}
		
		$("#organizationId").searchableSelect();
		
		//图片附件
		$('#pic_uploads').uploadify(
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
				'uploader': '${ctx}/session/attachment/publish' , // 新版
				'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
				'overrideEvents' : [ 'onDialogClose', 'onUploadError',
						'onSelectError' ],
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
				'onUploadStart' : function(file) {
					var myself = this; 
					if(!isSafeFile(file.name )){
						  alert('请选择合法的文件！');
						  myself.cancelUpload(file.id); 
					      $('#' + file.id).remove(); 
					}
				},
				'onSelect' : function(file) {
		
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
								+ $('#pic_uploads').uploadify('settings',
										'queueSizeLimit') + "个文件！");
						break;
					case -110:
						alert("文件 ["
								+ file.name
								+ "] 大小超出系统限制的"
								+ $('#pic_uploads').uploadify('settings',
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
					$("#expImage").val(obj.attachment.attachmentUrl);
					$("#imageId").val(obj.attachment.attachmentId);
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
				// alert(data);
				showAtts(obj.attachment);
				
				var urlStr = $("#expAttachment").val() + obj.attachment.attachmentUrl + ",";
				var url = (urlStr.substring(urlStr.length-1)==',')?urlStr.substring(0,urlStr.length-1):urlStr;
				$("#expAttachment").val(url);
				var idStr = $("#attachmentId").val() + obj.attachment.attachmentId + ",";
				var id = (idStr.substring(idStr.length-1)==',')?idStr.substring(0,idStr.length-1):idStr;
				$("#attachmentId").val(id);
			}
		});
	});
	
	
	
	
	function showPic(jsonData) {
		$("#showPicUrl").attr('src', jsonData.attachmentUrl);
		$("#showPicUrl").show();
	}
	
	function showAtts(jsonData) {
		var url = "";
		url += '<li id="'+jsonData.attachmentId+'" style="float:none;"><a href="'+jsonData.attachmentUrl+'" target="_blank" >'
				+ jsonData.remoteName
				+ '</a>&nbsp;<a href="javascript:;"  onclick="deleteAtt(\''+jsonData.attachmentId+'\',\''+jsonData.attachmentUrl+'\')">[删除]</a></li> ';
		$('#attList').append(url);
		
	}
	function deleteAtt(id,url) {
		confirm('确认删除？', function(index) {
        	$('#'+id).remove();
		    var atIdList = $('#attachmentId').val();
		    var atUrlList = $('#expAttachment').val();
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
		    $('#attachmentId').val(newIds);
		    $('#expAttachment').val(newUrls);
		    
		    /* $.ajax({
				url:'${ctx}/login/json/attachment/deleteByAttachmentId',
				type:'get',
				data:{'attachmentId':id},
				dataType:'json',
				success:function(data){
				}
			}); */
		},function(){});  
	}
	
	//初始化标签
	function initTags(tags) {
		var tag = tags.split(",");
		for (var i = 0; i < tag.length; i++) {
			$(".searchOptionsRel .optionBtnRel").each(function() {
				if ($(this).text() == tag[i]) {
					$(this).addClass("selectedRel");
				}
			});
		}
	}
	
	//初始化附件
	function initAttr(attIdList){
		$.ajax({
			url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
			type:'get',
			data:{'attachmentIdList':attIdList},
			dataType:'json',
			success:function(data){
				var value = JSON.parse(data).attachments;
				for(var i = 0;i<value.length;i++){
					var info = value[i];
					var url = "";
					url += '<li id="'+info.attachmentId+'" style="float: none;"><a href="'+info.attachmentUrl+'" target="_blank" >'
							+ info.remoteName
							+ '</a>&nbsp;<a href="javascript:;"  onclick="deleteAtt(\''+info.attachmentId+'\',\''+info.attachmentUrl+'\')">[删除]</a></li> ';
					$('#attList').append(url);
					
				}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
	}
	
	
	//获取标签的值并以字符串形式拼接
	function getTags(obj){
		if($(obj).hasClass("selectedRel")){
			$(obj).removeClass("selectedRel");
		}else{
			$(obj).addClass("selectedRel");
		}
		var tags = "";
		var count = 0;
		$(".searchOptionsRel .optionBtnRel").each(function(){
		    if($(this).hasClass("selectedRel")){
		    	tags += ($(this).text() + ",");
		    	count++;
		    }
		});
		if(count<1){
			layer.msg("请至少选择一项！");
			$(obj).addClass("selectedRel");
			return;
		}
		if(count>2){
			layer.msg("最多选择两项！");
			$(obj).removeClass("selectedRel");
			return;
		}
		$("#expLabel").val(tags);
	}
	
	function validate(){
		 var expTitle = $("#expTitle").val();
		 if(expTitle==null||expTitle==""){
			 layer.msg("请填写动态名称！");
			 return false;
		 }
		 
		 if(expTitle.length>50){
			 layer.msg("标题名不超过50个汉字！");
			 return false;
		 }
		 
		 var unitId = $("#organizationId").val();
		 if(unitId==null||unitId==""){
			 layer.msg("请选择分享单位！");
			 return false;
		 }
		 
		 var expImage = $("#expImage").val();
		 if(expImage==null||expImage==""){
			 layer.msg("请上传海报图片！");
			 return false;
		 }
		 
		 var expLabel = $("#expLabel").val();
		 if(expLabel==null||expLabel==""){
			 layer.msg("请选择标签！");
			 return false;
		 }
		/*  var activeEditor = tinymce.activeEditor; 
		 var editBody = activeEditor.getBody(); 
		 activeEditor.selection.select(editBody); 
		 var expText = activeEditor.selection.getContent( { 'format' : 'text' } );
		 expText = expText.trim();
		 if(expText==null||expText==""){
			 layer.msg("请填写动态内容！");
			 return false;
		 } */
		 
		 var ue = UE.getEditor('editor');
		 var expText = ue.getContent();
		 if(expText==null||expText==""){
			 layer.msg("请填写动态内容！");
			 return false;
		 }
		 return true;
	 }
	
	function save(type){
		if(type==1){
			$("#isPreview").val(type);
		}
		$("#unitId").val( $("#organizationId option:selected").val());
		if(validate()){
		 	$("#editForm").submit();
		 	$(".greenBtnContral").attr('disabled',"true");
		 	$(".grayBtnContral").attr('disabled',"true");
		}
	}
	
	function complete(){
		window.location.href="${ctx}/personalCenter/companyEdit?url=1";
	}
	
</script>
</body>
</html>
