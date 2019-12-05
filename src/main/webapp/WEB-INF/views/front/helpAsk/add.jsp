<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../../common/initUeditor.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发布问题</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/plugins/bootstrap-switch/bootstrap-switch.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
</head>

<body>
	<div class="project_main">
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020181228143754800061000000033"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="发布问题" />
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-12">
						<div class="artical-nav"><p>问题发布</p><a href="${ctx}/helpAsk/allList?entranceId=${entranceId}">返回列表 ></a></div>
						<div class="artical-content">
							<form action="" id="editForm" method="">
								<input type="hidden" id="expImage" name="expImage" value=""/>
								<input type="hidden" id="imageId" name="imageId" value=""/>
								<input type="hidden" id="unitId" name="unitId" value=""/>
								<input type="hidden" id="isPreview" name="isPreview"/>
								<div class="releaseItem">
									<div>
										<div class="release_inputBar">
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">问题标题</span>
												<input type="text" class="inputBox" maxlength="49" style="width:81.5%;" id="expTitle" name="expTitle" value=""/>
											</div>
											<div class="release_input clearfix">
												<span class="release_attr" style="margin-left:15px;">上传图片</span>
												<div id="picUrls" class="uploadImgContral"></div>
												<img src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
												<div class="uploadImgTips">
													<p>上传几张问题配图，能让你的问题锦上添花，增加查看点击率，更好的描述问题。</p>
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
													<div style="clear:both;"></div>
													<div style=" color: #aaa; font-size: 12px;">（最少选择一个标签，最多只能选择两个标签 ）</div>
												</div>
											</div>
											<div class="release_input clearfix">
												<font class="redStar">*</font>
												<span class="release_attr">问题详情</span>
												<div style="float:left; margin-left:15px; width:81.5%;">
													<%-- <textarea id="expText" name="expText"  placeholder="这里输入内容" style="width: 100%; height:200px; border: 1px solid #ccc; padding: 5px 7px;">${expShareInfo.expText}</textarea> --%>
													<script  id="editor" type="text/plain" name="expText" 
														style="width: 100%; height: 250px;  "></script>
												</div>
											</div>
											<div class="release_input clearfix">
												<span class="release_attr">是否匿名</span>
												<input type="hidden" id="isMessage" name="isMessage" value="0"/>
												<input type="checkbox" id="mySwitch2" data-on-text="是" data-off-text="否" />
											</div>
											<div style="padding-right:76px;">
												<input type="button" value="发布" onclick="save('2');" class="greenBtnContral">
												<!-- <input type="button" value="预览" onclick="save('1');" class="grayBtnContral"> -->
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
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<script type="text/javascript">
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(6)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(1) a:eq(0)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".fr li").eq(5).addClass("on");
	getTagList();
	
	//按钮
	$("#mySwitch2").bootstrapSwitch({
			onSwitchChange : function(event, state) { //状态改变时触发事件
				if (state == true) {
					$("#isMessage").val("1");
				} else {
					$("#isMessage").val("0");
				}
			}
		});
	//图片附件
	var urls = [],ids=[];
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
				'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
				'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val(),
				'jsessionid' : '${pageContext.session.id}'
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
				urls.push(obj.attachment.attachmentUrl);
				ids.push(obj.attachment.attachmentId);
				$("#expImage").val(urls.toString());
				$("#imageId").val(ids.toString());
			}
		});
});
function showPic(jsonData) {
	var div = '<img src="'+jsonData.attachmentUrl+'" width="100px;" height="100px;" class="uploadImgContral"/>'
	$("#picUrls").append(div);
	$("#showPicUrl").hide();
}

//初始化标签
function getTagList() {
	 $.ajax({
			url:"${urlPath}XOffice/interface/json/question/tagInfo/tagList",
			type:"post",
			success:function(result){
				if(result.success){
					console.log(result) 
					for(var i = result.tagList.length-1;i > -1;i--){
						var _div = "";
						_div = '<div class="optionBtnRel" onclick="getTags(this)" data-val="'+result.tagList[i].tagId+'">'+result.tagList[i].tagName+'</div>';
						$(".searchOptionsRel").prepend(_div);
					}
				}
            },
			error:function(){
				layer.alert("创建异常！");
			},
		});
}
//获取标签的值并以字符串形式拼接
function getTags(obj){
	if($(obj).hasClass("selectedRel")){
		$(obj).removeClass("selectedRel");
	}else{
		$(obj).addClass("selectedRel");
	}
	var count = 0;
	$(".searchOptionsRel .optionBtnRel").each(function(){
	    if($(this).hasClass("selectedRel")){
	    	count++;
	    }
	});
	if(count<1){
		layer.msg("请至少选择一项！");
		$(obj).addClass("selectedRel");
		return;
	}
	if(count>3){
		layer.msg("最多选择三项！");
		$(obj).removeClass("selectedRel");
		return;
	}
}
function save(type){
	var askTitle = $("#expTitle").val();
	var isHide = $("#isMessage").val();
	var ue = UE.getEditor('editor');
	var content = ue.getContent();
	var askTagIds = [];
	$(".selectedRel").each(function(){
		askTagIds.push($(this).attr("data-val"));
	})
	if(askTitle == ''){ return tips("请输入标题！");}
	if(content == ''){ return tips("请输入内容！");}
	if(askTagIds.length == 0){ return tips("请选择至少一个标签！");}
	var param = {
			askTitle : askTitle,
			askContent : content,
			askTagIds : askTagIds.join(","),
			askImgIds : $("#imageId").val(),
			askImgUrls : $("#expImage").val(),
			isAnonymous : isHide,
			isTop : 0,
			accountId : '${accountId}',
			rootId : '${entranceId}',
			rootName : '${parkName}',
			parkId : '${entranceId}',
			parkName : '${parkName}',
	}
	$.ajax({
		url:"${urlPath}XOffice/interface/json/question/askInfo/askAdd",
		type:"post",
		data: param,
		success:function(result){
			console.log(result)
			if(result.success){
				tips("发布成功！");
				setTimeout(function(){ location.href="${ctx}/helpAsk/allList?entranceId=${entranceId}"},1000)
			}
        },
		error:function(){
			layer.alert("创建异常！");
		},
	});
}
</script>
</html>
