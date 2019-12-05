<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目申报</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/enterpriseApplication.css" rel="stylesheet"/>
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020171109144912000062000000008"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="项目申报" />
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9" style="background-color: #fff;">
						<form action="${ctx }/projectDeclare/applySaveToYc" id="form">
							<input type="hidden" id="atUrlList" name="atUrlList"/> 
							<input type="hidden" id="atIdList" name="atIdList"/> 
							<input type="hidden" id="declareId" name="declareId" value="${declareId }"/>
							<div class="tiitleItem">
								<div>
									<div class="enterprise_inputBar">
										<div class="enterprise_input">
											<font class="redStar">*</font>
											<span class="enterprise_attr">上报企业</span>
											<input type="hidden"  id="companyName" maxlength="25" name="companyName"/>
											<select name="companyId" id="companyId" class="selectContral form-control" style="width: 25%;">
												<c:forEach items="${organizationList }" var="info">
												<option value="${info.organizationId }">${info.organizationName}</option>
												</c:forEach>
											</select>
											<div style="clear:both;"></div>
										</div>
										<div class="enterprise_input">
											<font class="redStar">*</font>
											<span class="enterprise_attr">上报人</span>
											<input type="text" class="inputContral form-control" style="width:19%;" id="accountName" maxlength="10" name="accountName"/>
											<div style="clear:both;"></div>
										</div>
										<div class="enterprise_input">
											<font class="redStar">*</font>
											<span class="enterprise_attr">联系电话</span>
											<input type="text" class="inputContral form-control" style="width:27%;" id="accountTel" maxlength="15" name="accountTel"/>
											<div style="clear:both;"></div>
										</div>
										<div class="enterprise_input">
											<div class="enterprise_attr" style="margin-left:15px;">附件</div>
											<div id="fileUpload" style="float: left; margin-left: 15px;">
												<input type="button" value="上传附件" class="uploadAttachBtn" id="file_uploads" name="file_uploads">
												<span id="fileQueues"></span>
											</div>
											<div style="clear: both;"></div>
											<div style="margin-left:80px;" id="attList"></div>
										</div>
										<div style="padding-right:76px;">
											<input type="button" value="确认申报" class="redBtnContral" id="saveBtn">
											<input type="button" value="返回上一页" class="grayBtnContral" onclick="history.go(-1)">
											<div style="clear:both;"></div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import>
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
<script type="text/javascript">
$(function(){
	$(".nav-content a:eq(4)").addClass("on");
	$(".source-room a").removeClass("on");
	/* $(".fir-floor").show();
	$(".publish-btn h1").text('在线申请'); */
	
	$(".artical-tab p").on("click",function(){          //大项目tab切换
		 var $ind = $(this).index();
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#tab"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){ $("#tab"+$ind).fadeIn("fast");},200);
		 if($(this).index() == 2 && '${accountId}' == ''){
			tips("亲，请先登陆哦！");
			$("#myGetmoreAllActi").hide();
		 }
	});
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
	
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
			var obj =JSON.parse(data);
			// alert(data);
			showAtts(obj);
			
			var url = $("#atUrlList").val() + obj.attachment.attachmentUrl + ",";
			$("#atUrlList").val(url);
			var id = $("#atIdList").val() + obj.attachment.attachmentId + ",";
			$("#atIdList").val(id);
		}
	});
	
	$('#saveBtn').click(function(){
		var companyName = $("#companyName").val();
		/* if(companyName == null || companyName == ""){
			tips('请输入上报企业');
			return false;
		} */
		var accountName = $("#accountName").val();
		if(accountName == null || accountName == ""){
			tips('请输入上报人');
			return false;
		}
		var accountTel = $("#accountTel").val();
		if(accountTel == null || accountTel == ""){
			tips('请输入联系方式');
			return false;
		}
		var atUrlList = $("#atUrlList").val();
		var atIdList = $("#atIdList").val();
		if((atUrlList==null || atUrlList=="")||(atIdList==null || atIdList=="")){
			tips('请上传附件！');
			return false;
		}
		$("#companyName").val($("#companyId option:selected").text());
		$("#form").submit();
	});
	
});

function showAtts(jsonData) {
	var url = "";
	url += '<li id="'+jsonData.attachment.attachmentId+'"><a href="'+jsonData.attachment.attachmentUrl+'" target="_blank" style="color:blue;">'
			+ jsonData.attachment.remoteName
			+ '</a>&nbsp;<a href="javascript:;" style="color:blue;"  onclick="deleteAtt(\''+jsonData.attachment.attachmentId+'\',\''+jsonData.attachment.attachmentUrl+'\')">[删除]</a></li> ';
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

</script>
</html>
