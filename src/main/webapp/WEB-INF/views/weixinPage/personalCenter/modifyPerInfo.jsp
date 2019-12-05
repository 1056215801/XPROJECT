<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>个人信息修改</title>
<link href="${ctx}/static/weixin/css/personalCenter/login.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/webuploader/webuploader.css">
<script type="text/javascript" src="${ctx}/static/js/plugins/webuploader/webuploader.js"></script>
</head>
<script type="text/javascript">
$(function(){
	// 图片上传选择初始化
	var uploader = WebUploader.create({
	    // 选完文件后，是否自动上传。
	    auto: true,
	    // swf文件路径
	    swf: '${ctx}/static/js/plugins/webuploader/Uploader.swf',
	    // 文件接收服务端。
	    server: '${ctx}/session/attachment/publish'  , 
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: '#picker',
	    duplicate : true, //可以重复上传
	    fileVal:'attachment',
	    // 只允许选择图片文件。
	    accept: {
	        title: 'Images',
	        extensions: 'gif,jpg,jpeg,bmp,png',
	        mimeTypes: 'image/*'
	    },
	    formData:{
			'moduleId': '-1', 
			'remark': '个人中心'
		}
	});
	// 当有文件被添加进队列的时候
    var  thumbnailWidth  =100 ;
	var  thumbnailHeight =100 ;
	uploader.on( 'fileQueued', function( file ) {
	});
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ,response ) {
	    $( '#'+file.id ).addClass('upload-state-done');
	    $("#uploadifyImg").attr('src', response.attachment.attachmentUrl );
	    $("#imageUrl").val(response.attachment.attachmentUrl); 
	});
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
	});
})
//异步保存修改信息
function saveInfo(){
	 $.ajax({
			url:"${ctx}/personalCenter/personalInfosave",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			success:function(result){ 
				if(result==1){
				$('#seconds1').html(3);
				 	layer.open({
						type: 1,
						title:false,
						shadeClose: true,
						shade: [0.3],
						area:['400px','150px'],
						closeBtn:0,
						time: 3000,
						content: $('#saveInfo'),
						success :function(){
							setTimeout(function(){
								$('#seconds1').html(2);
								setTimeout(function(){$('#seconds1').html(1);setTimeout(function(){window.location.href="${ctx}/auth/page/mobile/weixin/personalInfoBingding;"});},1000);
							},1000);
						},
					});
				}else{
					tips("修改失败！");
				}
			},error:function(){
				tips("修改异常！");
				},
			});


};
</script>
<body>
<form id="form">
<input type="hidden" name="imageUrl" id="imageUrl" value="${imageInfo.imageUrl}"/>
<input type="hidden" name="accountId" id="accountId" value="${info.accountId }"/>
<input type="hidden" name="status"  value="${info.status }"/>
<input type="hidden" name="accountCode"  value="${info.accountCode }"/>
<input type="hidden" name="imageId"  value="${imageInfo.imageId }"/>
<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>

	<div class="login_main">
		<div>
			<div class="input_dataBar">
				<div class="input_data">
					<div class="input_dataLeft" style="position:relative; top:24px;">个人头像</div>
					
					<c:choose>
						<c:when test="${imageInfo.imageUrl!=null&&imageInfo.imageUrl!=''}">
							<div id="picker" class="uploadifyInput" width="70px" height="70px" style="float:right;"><img src="${imageInfo.imageUrl}" id="uploadifyImg" class="uploadifyImg" width="50px" height="50px" style="float:right;border-radius:70px;"/></div>
						</c:when>
						<c:otherwise>
							<div id="picker" class="uploadifyInput" width="70px" height="70px" style="float:right;"><img src="${ctx}/static/weixin/images/personalCenter/headPortrait.png" id="uploadifyImg" class="uploadifyImg" width="70px" height="70px" style="float:right;border-radius:70px;"/></div>
						</c:otherwise>
					</c:choose>	
					<div style="clear:both;"></div>
				</div>
				<div class="input_data">
					<div class="input_dataLeft">名称</div>
					<input type="text" placeholder="" name="accountName" value="${info.accountName}" class="inputContral">
				</div>
			</div>
			</form>
			<div style="line-height:1;">
			<div style="padding:8px 7px;">
				<input type="button" value="确认修改" class="buttonContral_red" onClick="saveInfo();">
			</div>
			<div style="padding:0px 7px 10px;">
				<input type="button" value="返&nbsp;回" onClick="javascript:history.back(-1);" class="buttonContral_white">
			</div>
			</div>
		</div>
		<div id="saveInfo" style="display:none; text-align:center; margin:30px 0;">
		<img src="${ctx}/static/weixin/images/personalCenter/huod.png" width="70px" height="70px" style="vertical-align:middle;">
		<div><span style="vertical-align:middle; font-weight:bold; margin-left:20px;">恭喜您修改成功</span></div>
		<div><span id="seconds1"></span>秒后自动关闭</div>
	    </div>
	</div>
</body>
</html>
