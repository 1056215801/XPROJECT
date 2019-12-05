<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>个人信息</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/personalCenter/personalInformation.css" rel="stylesheet"/>
<style type="text/css">
/*防止Bootstrap样式影响laydate组件*/
* {
	-webkit-box-sizing: inherit!important;
	-moz-box-sizing: inherit!important;
	box-sizing: inherit!important;
}
</style>
<script>
 $(function(){
	 $(".tabName ul li").each(function(){
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
     });
	 $(".tabItem ul li").each(function(){
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
     });
	//时间控件
	var	time = {
		elem : '#laydate', //选择ID为START的input
		event : "focus",
		at : 'YYYY-MM-DD', //自动生成的时间格式
		istoday : true, //是否是当天
		start : laydate.now(0, "YYYY-MM-DD"), //设置开始时间为当前时间
		};
	laydate(time);
	 
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
		'overrideEvents' : [ 'onDialogClose','onUploadError', 'onSelectError' ],
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
		'onUploadError' : function(file, errorCode,errorMsg) {
			if (errorCode = -280) {

			} else {
				alert('上传失败，请联系管理员2');
			}
		},
		'onCloseError' : function(file, errorCode,errorMsg) {
			alert('上传失败，请联系管理员3');
		},
		'onSelectError' : function(file, errorCode,errorMsg) {
			switch (errorCode) {
			case -100:
				alert("上传的文件数量已经超出系统限制的"+ $('#pic_uploads').uploadify('settings','queueSizeLimit')+ "个文件！");
				break;
			case -110:
				alert("文件 ["+ file.name+ "] 大小超出系统限制的"+ $('#pic_uploads').uploadify('settings','fileSizeLimit')+ "大小！");
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
		 console.log(data);
	 	 var obj = JSON.parse(data);
		 	$("#pic").attr('src', obj.attachment.attachmentUrl);
		 	$("#imageUrl").val(obj.attachment.attachmentUrl);
		}
	});
 })
 function saveInfo(){
	 if($('#accountNick').val().length>16){
		 tips("昵称过长，最长不要超过16个字符！");
		 return;
	 }
	 if($('#accountName').val().length>16){
		 tips("名称过长，最长不要超过16个字符！");
		 return;
	 }
	 var im= $("#imageUrl").val();
	 $("#imageUrl").val(im);
	 $.ajax({
		url:"${ctx}/personalCenter/personalInfosave",
		type:"post",
		data:$("#form").serialize(),
		dataType:"json",
		success:function(result){ 
			if(result==1){
			 	layer.open({
					type: 1,
					title:false,
					shadeClose: true,
					shade: [0.3],
					area:['400px','150px'],
					closeBtn:0,
					content: $('#saveInfo')
				});
			 	//更新顶部头像
			 	var hi=$("#pic").attr('src');
			 	$('#head_image').attr("src",hi);
			 	 setTimeout(function() { layer.closeAll(); },2000); 
			}else{
				tips("修改失败！");
			}
		},error:function(){
			tips("修改异常！");
		},
	});
 };
</script>
</head>

<body>
<div class="info_main">
	<div class="project_header">
	    <%-- <c:if test="${entranceId==3609009 }"  >
	      <link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		  <%@ include file="../common/bak/header_yc.jsp"%>
		</c:if>
		<c:if test="${entranceId!=3609009  }"  >
		  <%@ include file="../common/header.jsp"%>
		</c:if> --%>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="-1"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="个人信息" />
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
	</div>
	
	<div class="info_content">
		<div class="info_contentLeft">
			<div class="menuNav">
				<a href="${ctx }/personalCenter/messageNotification">
					<img src="${ctx}/static/image/personalCenter/message.jpg" width="24" height="24" style="vertical-align:middle;">
					<span style="vertical-align:middle; margin-left:2px;" >消息通知</span>
				</a>
			</div>
			<div class="menuNav">
				<a href="javascript:;">
					<img src="${ctx}/static/image/personalCenter/setUp.jpg" width="24" height="24" style="vertical-align:middle;">
					<span style="vertical-align:middle; margin-left:2px;">设置</span>
				</a>
				<ul>
					<li>
						<a href="${ctx }/personalCenter/personalInfoEdit" style="color:#000;">个人信息</a>
					</li>
					<li>
						<a href="${ctx }/personalCenter/accountSecurity">账号安全</a>
					</li>
					<li>
						<a href="${ctx }/personalCenter/accountUpgrade">账号升级</a>
					</li>
					<%-- <li><a href="${ctx }/personalCenter/parkEdit">园区设置</a></li> --%>
					<li><a href="${ctx }/personalCenter/companyEdit" >企业设置</a></li>
					<%-- <li><a href="${ctx }/projectSuggestInfo/list" >意见反馈</a></li> --%>
				</ul>
			</div>
		</div>
		<div class="info_contentRight">
			<div class="info_cont">
			<form id="form">
				<input type="hidden" name="imageUrl" id="imageUrl" value="${imageInfo.imageUrl}"/>
				<input type="hidden" name="accountId" id="accountId" value="${accountId}"/>
				<input type="hidden" name="status"  value="${info.status }"/>
				<input type="hidden" name="accountCode"  value="${info.accountCode }"/>
				<input type="hidden" name="imageId"  value="${imageInfo.imageId }"/>
				<div class="info_top">个人信息</div>
				<div style="padding:40px 50px;">
					<div class="info_data">
						<div class="info_dataLeft">头像：</div>
						<img src="${imageInfo.imageUrl}" width="90px" height="90px" style="display:block; border-radius:90px;" id="pic">
						<div id="pictureUpload" style="margin-top: 20px;">
							<input  type="file" data-no-uniform="true" name="attFiles" id="pic_uploads" multiple="true" />
						</div>
					</div>
					<div class="info_data">
						<div class="info_dataLeft">昵称：</div>
						<input type="text" value="${info.accountNick }" class="inputTextContral" name="accountNick" id="accountNick">
					</div>
					<div class="info_data">
						<div class="info_dataLeft">姓名：</div>
						<input type="text" value="${info.accountName }" class="inputTextContral" name="accountName" id="accountName">
					</div>
					<div class="info_data">
						<div class="info_dataLeft">性别：</div>
						<div class="inputCase"><input type="radio" name="sex" style="margin-right: 7px;" value="1" ${info.sex=='1'?"checked":"" }>男</div>
						<div class="inputCase"><input type="radio" name="sex" style="margin-right: 7px;" value="0" ${info.sex=='2'?"checked":"" }>女</div>
						<div class="inputCase"><input type="radio" name="sex" style="margin-right: 7px;" value="2" ${info.sex=='0'?"checked":"" }>保密</div>
						<div style="clear:both;"></div>
					</div>
					 <div class="info_data">
						<div class="info_dataLeft">生日：</div>
						<!--<div class="inputCase"><input type="radio" name="birthday">阳历</div>
						<div class="inputCase"><input type="radio" name="birthday">阴历</div> -->
						<input id="laydate" class="laydate-icon layer-date laydateContral" name="birthdayStr" value="<fmt:formatDate value="${info.birthday}" pattern="yyyy-MM-dd"/>">
						<div style="clear:both;"></div>
					</div> 
					<div class="info_data">
						<input type="button" value="保存" class="buttonContral" onClick="saveInfo();">
					</div>
				</div>
			</div>
			</form>
		</div>
		<div style="clear:both;"></div>
	</div>
	
	<div id="saveInfo" style="display:none; text-align:center; margin:30px 0;">
		<img src="${ctx}/static/image/personalCenter/headPortrait.png" width="90px" height="90px" style="vertical-align:middle;">
		<span style="vertical-align:middle; font-weight:bold; margin-left:20px;">恭喜您修改成功</span>
	</div>
	
    <%-- <c:if test="${entranceId==3609009 }"  >
	  <%@ include file="../common/bak/footer_yc.jsp"%>
	</c:if>
	<c:if test="${entranceId!=3609009  }"  >
	  <%@ include file="../common/footer.jsp"%>
	</c:if> --%>
	
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
</div>
</body>
</html>
