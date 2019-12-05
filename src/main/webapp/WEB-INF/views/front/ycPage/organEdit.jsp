<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../../common/initUeditor.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发布机构</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
<style type="text/css">
.searchable-select {box-shadow:none;display:none}
</style>
</head>
<body>
<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="-1"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="发布机构" />
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-12">
						<div class="artical-nav"><p class="artical_p">发布机构</p><a href="${ctx}/organ/list?entranceId=${entranceId}">返回列表 ></a></div>
						<div class="artical-content">
							<form id="editForm" method="post">
								<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
								<input type="hidden" id="serviceKindId" name="serviceKindId" value="${serviceBean.serviceKindId}"/>
								<input type="hidden" id="serviceKindName" name="serviceKindName" value="${serviceBean.serviceKindName}"/>
								<input type="hidden" id="logoUrl" name="logoUrl" value="${serviceBean.logoUrl}"/>
								<input type="hidden" id="logoId" name="logoId" value="${serviceBean.logoId}"/>
								<input type="hidden" id="type" name="type" value="0"/>
								<input type="hidden" id="accountId" name="accountId" value="${accountId}">
								<input type="hidden" id="institutionId" name="institutionId" value="${companyId}">
								<input type="hidden" id="id" name="id" value="${id}">
								
								
								<input type="hidden" id="accountName" name="accountName" value="${accountName}">
								<input type="hidden" id="parkId" name="parkId" value="${parkId}">
								<input type="hidden" id="parkName" name="parkName" value="${parkName}">
								<input type="hidden" id="rootId" name="rootId" value="${rootId}">
								<input type="hidden" id="rootName" name="rootName" value="${rootName}">
								<input type="hidden" id="organizationId" name="organizationId" value="${organizationId}">
								<input type="hidden" id="organizationName" name="organizationName" value="${organizationName?organizationName:''}">
								<input type="hidden" id="entranceId" name="entranceId" value="${entranceId}"/>
								<input type="hidden" id="provinceId" name="provinceId" value="${provinceId}"> 
								<input type="hidden" id="provinceName" name="provinceName" value="${provinceName}"> 
								<input type="hidden" id="areaId" name="areaId" value="${areaId}"> 
								<input type="hidden" id="areaName" name="areaName" value="${areaName}"> 
								<input type="hidden" id="spaceId" name="spaceId" value="${spaceId}"> 
								<input type="hidden" id="spaceName" name="spaceName" value="${spaceName}"> 
								
								
								<input type="hidden" id="instPrId" name="instPrId" value="${serviceBean.instPrId}"> 
								<input type="hidden" id="instPrName" name="instPrName" value="${serviceBean.instPrName}"> 
								<input type="hidden" id="instAreaId" name="instAreaId" value="${serviceBean.instAreaId}"> 
								<input type="hidden" id="instAreaName" name="instAreaName" value="${serviceBean.instAreaName}"> 
								<input type="hidden" id="instSpaceId" name="instSpaceId" value="${serviceBean.instSpaceId}"> 
								<input type="hidden" id="instSpaceName" name="instSpaceName" value="${serviceBean.instSpaceName}"> 
								
								<div class="releaseItem">
									<div>
										<div class="release_inputBar">
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">机构名称</span>
												<input type="text" class="inputBox" style="width:81.5%;" id="institutionName" name="institutionName" value="${companyName}"/>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">企业LOGO</span>
												    <c:choose>
														<c:when test="${serviceBean.logoUrl == '' || serviceBean.logoUrl == null}">
											                 <img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
														</c:when>
														<c:otherwise>
											                 <img  src="${serviceBean.logoUrl}" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
														</c:otherwise>
													</c:choose>
												<div class="uploadImgTips">
													<div id="pictureUpload">
														<input type="file" data-no-uniform="true" name="attFiles" id="pic_uploads" multiple="true"/>
													</div>
													<p>为了不影响您企业页面展示效果，建议背景使用透明或白色底LOGO，大小不超过1M</p>
												</div>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">所在城市</span>
												<div class="company_organ clearfix">
													<select id="province"><option>省份/自治区</option></select> 
													<select id="city" ><option>城市/自治州</option></select> 
													<select id="town" ><option>区/县</option></select>
												</div>
											</div>
											<div class="release_input clearfix">
												<font class="clearStar">*</font>
												<span class="release_attr">机构地址</span>
												<input type="text" class="inputBox" style="width:81.5%;" id="institutionAddress" name="institutionAddress" value="${serviceBean.institutionAddress}"/>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">服务类别</span>
												<c:if test="${serviceBean.serviceKindId!=null}">
													<div class="searchOptionsRel clearfix organ-searchOptionsRel">
														<c:forEach items="${kindList}" var="obj">
															<c:if test="${fn:indexOf(serviceBean.serviceKindId,obj.kindId)>-1}">
																<div class="optionBtnRel selectedRel"  onclick="getTags(this)" value="${obj.kindId}">${obj.kindName}</div>
															</c:if>
															<c:if test="${fn:indexOf(serviceBean.serviceKindId,obj.kindId)==-1}">
																<div class="optionBtnRel"  onclick="getTags(this)" value="${obj.kindId}">${obj.kindName}</div>
															</c:if>
														</c:forEach>
														<div style="clear:both;"></div>
														<div style=" color: #aaa; font-size: 12px;">（最少选择一个标签，最多只能选择四个标签 ）</div>
													</div>
												</c:if>
												<c:if test="${serviceBean.serviceKindId==null}">
													<div class="searchOptionsRel clearfix organ-searchOptionsRel" id="searchOptionsRel">
													</div>
												</c:if>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">擅长领域</span>
												<textarea type="text" class="inputBox" placeholder="请输入少于120个文字的描述" style="width:81.5%;" id="researchDirection" name="researchDirection" />${serviceBean.researchDirection}</textarea>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">服务介绍</span>
												<div style="float:left; margin-left:15px; width:81.5%;">
													<script  class="editorText" id="editor" type="text/plain" name="serviceContent" 
														style="width: 100%; height: 250px;">${serviceBean.serviceContent}</script>
												</div>
											</div>
											<div class="release_input clearfix">
												<font class="clearStar">*</font>
												<span class="release_attr">服务案例</span>
												<div style="float:left; margin-left:15px; width:81.5%;">
													<%-- <textarea id="expText" name="expText"  placeholder="这里输入内容" style="width: 100%; height:200px; border: 1px solid #ccc; padding: 5px 7px;">${expShareInfo.expText}</textarea> --%>
													<script  class="editorText" id="editor1" type="text/plain" name="serviceCase" 
														style="width: 100%; height: 250px;">${serviceBean.serviceCase}</script>
												</div>
											</div>
										<%-- 	<div class="release_input clearfix">
												<font class="clearStar">*</font>
												<span class="release_attr">服务案例</span>
												<textarea type="text" rows="3" class="inputBox" style="width:81.5%;" id="serviceCase" name="serviceCase"/>${serviceBean.serviceCase}</textarea>
											</div>  --%>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">联系人</span>
												<input type="text" class="inputBox" style="width:81.5%;" id="contactName" name="contactName" value="${serviceBean.contactName}"/>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">联系方式</span>
												<input type="text" class="inputBox" style="width:81.5%;" id="contactPhone" name="contactPhone" value="${serviceBean.contactPhone}"/>
											</div>
											 <div class="release_input clearfix">
												<font class="clearStar">*</font>
												<span class="release_attr">固定电话</span>
												<input type="text" class="inputBox" style="width:81.5%;" id="officePhone" name="officePhone" value="${serviceBean.officePhone}"/>
											</div>
											<div style="padding-right:76px;">
												<input type="button" value="发布" onclick="save('2');" class="greenBtnContral">
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
</script>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<script>
 $(function(){
	 initRichTextEditor('editorText',false);//初始富文本
	 getTypeList();
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(3)").addClass("on");
		$("#thirdMenu p:eq(2) a:eq(2)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(2) a:eq(2)").addClass("on");
	}
	 $(".nav-content a:eq(2)").addClass("on");
	 $(".source-room a").removeClass("on");
	 $(".source-room a:eq(13)").addClass("on");
	$(".fr li").eq(1).addClass("on");
	//加载地址
	getArea(0, 1);
 	$("#province").change(function() {
		getArea($(this).val(), 2);
	});
	$("#city").change(function() {
		getArea($(this).val(), 3);
	}); 
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
 function getTypeList(){
		$.ajax({
			url : "${urlPath}XOffice/interface/json/serviceKindInfo/list",
			type : "post",
			data : {
				"parkId": ''
			},
			dataType : "json",
			success:function(result){
/* 				console.log(result)
 */				var list = result.value;
				if(result.success){
					if(list.length>0){
						for(var i = 0;i<list.length;i++){
							var _div = '<div class="optionBtnRel" onclick="getTags(this)" data-value="'+list[i].kindId+'">'+list[i].kindName+'</div>';
							$('#searchOptionsRel').append(_div);
						}
						$('#searchOptionsRel').append('<div style="clear:both;"></div><div style=" color: #aaa; font-size: 12px;">（最少选择一个类别，最多只能选择四个类别 ）</div>');
					}else{
						layer.msg('请在后台配置服务类别');
					}
				}
			}
		})
		
	}
</script>
<script type="text/javascript">
function getArea(parentId, type) {
	var provinceId = '${serviceBean.instPrId}';
	var areaId = '${serviceBean.instAreaId}';
	var spaceId = '${serviceBean.instSpaceId}';
	if(provinceId==null||provinceId=='undefined'||provinceId==''){
		provinceId = 360000;
	}
	
	$.ajax({
		url : "${ctx}/personalCenter/getArea",
		type : "get",
		data : {
			"parentId" : parentId
		},
		success : function(result) {
			if (result.code == 1) {
				var list = result.value;
				if (type == 1) {
					$("#province").empty();
				} else if (type == 2) {
					$("#city").empty();
				} else if (type == 3) {
					$("#town").empty();
				}

				for (var i = 0; i < list.length; i++) {
					var info = list[i];
					var _div = "";
					if (type == 3) {
						if(info.areaId == spaceId){								
							_div = '<option value="'+info.areaId+'" selected="selected">' + info.areaName + '</option>';
						}else{
							_div = '<option value="'+info.areaId+'">' + info.areaName + '</option>';
						}
								
						$("#town").append(_div);
					} else if (type == 2) {
						if(info.areaId == areaId){								
							_div = '<option value="'+info.areaId+'" selected="selected">' + info.areaName + '</option>';
						}else{
							_div = '<option value="'+info.areaId+'">' + info.areaName + '</option>';
						}
						
						$("#city").append(_div);
					} else {
						if(info.areaId == provinceId){								
							_div = '<option value="'+info.areaId+'" selected="selected">' + info.areaName + '</option>';
						}else{
							_div = '<option value="'+info.areaId+'">' + info.areaName + '</option>';
						}
						
						$("#province").append(_div);
					}
				}

				if (type == 2) {
					getArea($("#city option:selected").val(), 3);
				} else if (type == 1) {
					getArea($("#province option:selected").val(), 2);
				} 
			} else if (result.code == 0) {
				if (type == 1) {
					$("#province").empty();
					$("#city").empty();
					$("#town").empty();
					$("#province").append('<option>省份/自治区</option>');
					$("#city").append('<option>城市/自治州</option>');
					$("#town").append('<option>区/县</option>');
				} else if (type == 2) {
					$("#city").empty();
					$("#town").empty();
					$("#city").append('<option>城市/自治州</option>');
					$("#town").append('<option>区/县</option>');
				} else if (type == 3) {
					$("#town").empty();
					$("#town").append('<option>区/县</option>');
				}
			} else {
				layer.msg(result.msg);
			}
		},
		error : function() {
			layer.msg("地址请求超时，请刷新页面！");
		}
	});
}
	$(function(){
		
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
				'buttonText' : '上传LOGO',
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
					$("#logoUrl").val(obj.attachment.attachmentUrl);
					$("#logoId").val(obj.attachment.attachmentId);
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
			'buttonText' : '',
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
		var kindName = "";
		var kindId = "";
		var count = 0;
		$(".searchOptionsRel .optionBtnRel").each(function(){
		    if($(this).hasClass("selectedRel")){
		    	kindName += ($(this).text() + ",");
		    	kindId += ($(this).attr('data-value') + ",");
		    	count++;
		    }
		});
		if(count<1){
			layer.msg("请至少选择一项！");
			$(obj).addClass("selectedRel");
			return;
		}
		if(count>4){
			layer.msg("最多选择四项！");
			$(obj).removeClass("selectedRel");
			return;
		}
		$("#serviceKindId").val(kindId);
		$("#serviceKindName").val(kindName);
	}
	
	function validate(){
		 var institutionName = $("#institutionName").val();
		 if(institutionName==null||institutionName==""){
			 layer.msg("请填写机构名称！");
			 return false;
		 }
		 if(institutionName.length>50){
			 layer.msg("机构名称不超过50个汉字！");
			 return false;
		 }
		 
		 var logoUrl = $("#logoUrl").val();
		 if(logoUrl==null||logoUrl==""){
			 layer.msg("请上传企业logo！");
			 return false;
		 }
		/*  if($("#town option:selected").text()=='市辖区'){
			 layer.msg("请选择区域！");
			 return false;
		 } */
		 
		 var serviceKind = $("#serviceKindId").val();
		 if(serviceKind==null||serviceKind==""){
			 layer.msg("请选择服务类别！");
			 return false
		 } 
		 if($('#researchDirection').val()==''){
			 layer.msg("请填写擅长领域！");
			 return false;
		 }
		 if($('#orgField').text().length>120){
			 layer.msg("擅长领域不超过120个汉字！");
			 return false;
		 }
		 
		 var ue = UE.getEditor('editor');
		 var serviceContent = ue.getContent();
		 if(serviceContent==null||serviceContent==""){
			 layer.msg("请填服务介绍");
			 return false;
		 } 
		 
		 
		 if($('#contactName').val()==''){
			 layer.msg("请填写联系人！");
			 return false;
		 }
		 
		 if($('#contactPhone').val()==''){
			 layer.msg("请填写联系方式！");
			 return false;
		 }
		 
		 return true;
	 }
	
	function save(){
		if(validate()){
			if('${id}'==undefined||'${id}'==''){
				if($("provinceId").val()==''||$("#instPrId").val()==undefined){
					$("provinceId").val('-1')
				}
				if($("spaceId").val()==''||$("#spaceId").val()==undefined){
					$("spaceId").val('-1')
				}
				if($("areaId").val()==''||$("#areaId").val()==undefined){
					$("areaId").val('-1')
				}
			}
			
			
			$("#instPrId").val($("#province option:selected").val());
			$("#instPrName").val($("#province option:selected").text());

			$("#instAreaId").val($("#city option:selected").val());
			$("#instAreaName").val($("#city option:selected").text());
			$("#instSpaceId").val($("#town option:selected").val());
			$("#instSpaceName").val($("#town option:selected").text());

			if($("#instSpaceName").val()=='市辖区'){
				$("#instSpaceId").val('');
				$("#instSpaceName").val('');
			}
			
			var s1=$("#researchDirection").val() ;
			var ue = UE.getEditor('editor');
			var s2 = ue.getContent();
			var serviceCase = UE.getEditor('editor1');
			var s3 = serviceCase.getContent();
			
			$("#researchDirection").val(safeStr(s1)) ;
			$("#serviceContent").val(safeStr(s2));
			$("#serviceCase").val(safeStr(s3));
			console.log($("#editForm").serialize());
 		 	$.post("${urlPath}XOffice/interface/json/serviceInstitutionInfo/save?"+$("#editForm").serialize(),function(result){
				console.log(result)
				if(result.errorCode==0){
						layer.confirm('发布成功！'+'，是否更换企业图库？', {
							btn: ['是', '否'], btn1:function(){
								window.location.href = "${ctx}/personalCenter/companyEdit";
				            }, btn2: function () {
				            	setTimeout(function() {
									window.history.go(-1);
								}, 1000);
				            },cancel: function(){ 
				            	setTimeout(function() {
				            		window.history.go(-1);
								}, 1000);
				            }
				        });
				}else{
					layer.msg('系统异常！');
				}
			    
			  });
			
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
