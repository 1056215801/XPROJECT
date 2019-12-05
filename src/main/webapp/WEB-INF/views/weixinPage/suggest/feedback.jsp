<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>意见反馈</title>
<link href="${ctx}/static/weixin/css/suggest/feedback.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/webuploader/webuploader.css">
<script type="text/javascript" src="${ctx}/static/js/plugins/webuploader/webuploader.js"></script>
<script>
	$(function() {
		$(".search").click(function() {
			var div = $("#dropdown");
			if (div.css("display") == "none") {
				div.slideDown("fast");
				$(".search").addClass("colorDeep");
			} else {
				div.slideUp("fast");
				$(".search").removeClass("colorDeep");
			}
		});
		$(".viewMore").click(function() {
			var ul = $("#viewMore ul");
			if (ul.css("display") == "none") {
				ul.slideDown("fast");
			} else {
				ul.slideUp("fast");
			}
		});
		$("#viewMore ul li a").click(function() {
			$("#viewMore ul").hide();
		});
		getListData();
	})

function getListData() {
	$.ajax({
		url : "${ctx}/projectSuggestInfo/json/list",
		type : "get",
		data : {
			"pageNum" : 1,
			"pageSize" : '10',
			"type" : 0,
		},
		dataType : "json",
		success : function(result) {
			if (result.code == -1) {
				layer.msg(result.errorMsg);
			} else if (result.code == 2) {
			} else {
				var list = result.value;
				if(list.length==0){
					return;
				}
				$("#ink_con1").empty();
				for (var i = 0; i < list.length; i++) {
					var info = list[i];
					var div = '<a href=\"javascript:;\" target=\"_blank\">' + info.accountName + '的意见被采纳，奖励话费' + info.rewardContent + '</a>';
					$("#ink_con1").append(div);
				}
				for (var i = 0; i < list.length; i++) {
					var info = list[i];
					var div = '<a href=\"javascript:;\" target=\"_blank\">' + info.accountName + '的意见被采纳，奖励话费' + info.rewardContent + '</a>';
					$("#ink_con1").append(div);
				}
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			layer.msg("网络异常");
		} 
	});
}
</script>
</head>

<body>
	<form method="post" id="editform" class="editform">
		<input type="hidden" name="suggestSource" id="suggestSource" value="0" /> <input type="hidden" name="attachmentUrl"
			id="atUrlList" value="" /> <input type="hidden" name="attachmentId" id="atIdList" value="" /> <input type="hidden"
			name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="feed_main">
			<div class="feed_content">
				<img src="${ctx}/static/weixin/images/suggest/top.jpg" width="100%">
				<div class="shell">
					<img src="${ctx}/static/weixin/images/suggest/horn.png" width="17" height="17" style="vertical-align: middle;">
					<div id="ink_con1">
					</div>
				</div>
				<script>
					var c1, _ = Function;
					with (o1 = document.getElementById("ink_con1")) {
						innerHTML += innerHTML;
					}
					(F1 = _("if(#%20||!c1)#++,#%=o1.scrollHeight>>1;setTimeout(F1,#%20?10:1500);"
							.replace(/#/g, "o1.scrollTop")))();
				</script>
				<div class="caption_top">
					<div class="caption_title">意见反馈</div>
				</div>
				<div class="feedCont">
					<table>
						<tr>
							<td colspan="1" class="feedAttribute">标题</td>
							<td colspan="3" class="feedTable95"><input name="suggestTitle" id="suggestTitle" type="text" style="width: 95%;border-color: #A9A9A9;"> <font
								class="redStar">*</font></td>
						</tr>
						<tr>
							<td colspan="1" class="feedAttribute" style="vertical-align: bottom;">内容</td>
							<td colspan="3" class="feedTable95"><textarea name="suggestContent" id="suggestText" cols="4"
									style="width: 95%;border: 1px #A9A9A9 solid;vertical-align: top; resize: none;"></textarea> <font class="redStar">*</font></td>
						</tr>
					</table>
				</div>
				<div class="feedCont clearfix" style="padding: 15px 7px;">
<!-- 					<div class="attachBar"> -->
<%-- 						<img src="${ctx}/static/weixin/images/suggest/file/jpg86.png" width="60" height="60" class="attachImage"> --%>
<!-- 						<div class="attachName" style="">界面截图.jpg</div> -->
<%-- 						<img src="${ctx}/static/weixin/images/suggest/attachDelete.png" width="25" height="25" class="attachDel"> --%>
<!-- 					</div> -->
					<div id="attachList"></div>

					<div style="width: 80px; height: 80px; margin-top: 5px; border: 1px solid #ccc; float: left;">
						<div id="pic_uploads" style="width: 60px; margin: 20px 10px">点击添加附件内容</div>
					</div>
				</div>
				<div class="feedCont">
					<table>
						<tr>
							<td colspan="1" class="feedAttribute">昵称</td>
							<td colspan="3" class="feedTable95"><input id="nickName" name="accountName" type="text" style="width: 95%;border-color: #A9A9A9"> <font class="redStar">*</font>
							</td>
						</tr>
						<tr>
							<td colspan="1" class="feedAttribute">获奖联系电话</td>
							<td colspan="3" class="feedTable95"><input id="phoneNum" name="accountTel" type="text" style="width: 95%;border-color: #A9A9A9"> <font class="redStar">*</font>
							</td>
						</tr>
					</table>
				</div>
				<div style="margin: 10px 5px;">
					<input type="button" class="feedBtn" value="提&nbsp;交" onClick="suggestSave();">
				</div>
			</div>
			<div class="navigationBar">
				<ul>
					<li><a href="${ctx}/projectSuggestInfo/weixin/feedback">
							<div class="navImage">
								<img src="${ctx}/static/weixin/images/suggest/feedbacked.png" width="20" height="20" style="margin-top: 6%;" />
							</div>
							<div class="navTitle">意见反馈</div>
					</a></li>
					<li><a href="${ctx}/projectSuggestInfo/weixin/hasAdopt">
							<div class="navImage">
								<img src="${ctx}/static/weixin/images/suggest/hasAdopt.png" width="20" height="20" style="margin-top: 6%;" />
							</div>
							<div class="navTitle">已采纳意见</div>
					</a></li>
					<li><a href="${ctx}/projectSuggestInfo/weixin/myOpinion">
							<div class="navImage">
								<img src="${ctx}/static/weixin/images/suggest/myOpinion.png" width="20" height="20" style="margin-top: 6%;" />
							</div>
							<div class="navTitle">我的意见</div>
					</a></li>
					<li><a href="javascript:;" class="viewMore">
							<div class="navImage">
								<img src="${ctx}/static/weixin/images/suggest/more.png" width="20" height="20" style="margin-top: 6%;" />
							</div>
							<div class="navTitle">更多服务</div>
					</a></li>
				</ul>
				<div id="viewMore">
					<ul style="margin-top: -95px;">
						<li style="border-bottom: 1px solid #E6E6E6;"><a href="javascript:;">我发布的</a></li>
						<li><a href="javascript:;">个人中心</a></li>
					</ul>
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	$(function() {
		uploader = WebUploader.create({
			// 选完文件后，是否自动上传。
			auto : true,
			swf : '${ctx}/static/js/plugins/webuploader/Uploader.swf',
			server : '${ctx}/session/attachment/publish',
			pick : '#pic_uploads',
			duplicate : true, //可以重复上传
			fileVal : 'attachment',,
		    formData:{
				'moduleId': '-1', 
				'remark': '意见反馈'
			}
		// 只允许选择图片文件。
		// 			accept : {
		// 				title : 'Images',
		// 				extensions : 'gif,jpg,jpeg,bmp,png',
		// 				mimeTypes : 'image/*'
		// 			}
		});

		// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		uploader.on(
						'uploadSuccess',
						function(file, response) {
							layer.msg("上传成功");
							var attachment = response.attachment;
							var _div = "";
							_div += "<div class=\'attachBar\'>";
							_div += "  <img src=\'${ctx}/static/weixin/images/suggest/file/";
							var ext = file.ext;//判断文件格式
							if (ext == "jpg" || ext == "jpeg" || ext == "bmp"
									|| ext == "png" || ext == "gif") {
								_div += "jpg86.png";
							} else if (ext == "avi") {
								_div += "avi86.png";
							} else if (ext == "xlsx" || ext == "xls") {
								_div += "icon_excel.png";
							} else if (ext == "pdf") {
								_div += "icon_pdf.png";
							} else if (ext == "pptx" || ext == "ppt") {
								_div += "icon_ppt.png";
							} else if (ext == "txt" || ext == "ppt") {
								_div += "txt86.png";
							} else if (ext == "doc" || ext == "docx") {
								_div += "icon_word.png";
							} else if (ext == "zip") {
								_div += "icon_zip.png";
							} else if (ext == "mov") {
								_div += "mov86.png";
							} else if (ext == "mp3") {
								_div += "MP386.png";
							} else {
								_div += "icon_unfile.png";
							}
							_div += "\' width=\'60\' height=\'60\' class=\'attachImage\'>";
							_div += "  <div class=\'attachName\'>"
									+ attachment.remoteName + "</div>";
							_div += "  <img src=\'${ctx}/static/weixin/images/suggest/attachDelete.png\' width=\'25\' height=\'25\' class=\'attachDel\' onclick=\'removeAttachment(this,\""+attachment.attachmentId+"\",\""+attachment.attachmentUrl+"\");\'></div>";
							
							$("#attachList").append(_div);
							var url = $("#atUrlList").val() + attachment.attachmentUrl + ",";
							$("#atUrlList").val(url);
							var id = $("#atIdList").val() + attachment.attachmentId + ",";
							$("#atIdList").val(id);
						});
		// 文件上传失败，显示上传出错。
		uploader.on('uploadError', function(file) {
			layer.msg("上传失败");
		});
	});
	
	function removeAttachment(obj,id,url) {
		layer.confirm('确认删除？', function() {
			layer.closeAll();
			$(obj).parent().remove();
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
		}, function(){});
	}

	//提交
	function suggestSave() {
		if (checkValue()) {
			$.ajax({
				url : "${ctx}/projectSuggestInfo/json/baocun",
				type : "post",
				dataType : "json",
				data : $('#editform').serialize(),
				success : function(result) {
					if (result.code == 1) {
						layer.msg('提交成功');
						window.location.href="${ctx}/projectSuggestInfo/weixin/myOpinion";
					} else if (result.code == 0) {
						layer.msg(result.msg);
					} else {
						layer.msg(result.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					layer.msg("请求超时，请稍后重试");
				}
			});
		}
	}

	function checkValue() {
		if ($("#suggestTitle").val() == "") {
			layer.msg("请输入标题");
			return false;
		}
		if ($("#suggestText").val() == "") {
			layer.msg("请输入内容");
			return false;
		}
		if ($("#nickName").val() == "") {
			layer.msg("请输入昵称");
			return false;
		}
		if ($("#phoneNum").val() == "") {
			layer.msg("请输入联系电话");
			return false;
		}
		return true;
	}
</script>
</html>
