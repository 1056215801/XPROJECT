<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>分享预览</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/experienceSharing/experienceSharing.css" rel="stylesheet" />
<script type="text/javascript">
	$(function() {

	})
	
	function edit(){
		window.location.href="${ctx}/experienceSharing_fgw/weixin/edit?expId=${expShareInfo.expId}";
	}
	
	function publicExp(){
		window.location.href="${ctx}/experienceSharing_fgw/weixin/save?expId=${expShareInfo.expId}";
	}
</script>
</head>
<body>
	<div class="details_main">
		<!-- 评论留言输入框 -->
		<div id="inputComment" style="display: none; padding: 15px 20px; position: fixed; overflow: hidden;">
			<textarea id="commentMsg" style="width: 200px; height: 90px; outline: none; resize: none"></textarea>
		</div>

		<div class="details_content">
			<div style="padding-bottom: 5px;">
				<div class="detailsStatePreview">当前处于预览模式</div>
			</div>
			<div class="detailsCont">
				<div class="detailsContTop clearfix">
					<div class="detailsContTopRight">
						<div class="detailsContTitle">${empty expShareInfo.expTitle?"无标题":expShareInfo.expTitle}</div>
						<div class="detailsContPosition">
							<div>
								<img src="${ctx}/static/weixin/images/experienceSharing/enterCount.png" width="10" height="10"> <span>${empty expShareInfo.expUnit?"&nbsp;":expShareInfo.expUnit}</span>
							</div>
							<div>
								<img src="${ctx}/static/weixin/images/experienceSharing/location.png" width="10" height="10"> <span>${empty expShareInfo.provinceName?"&nbsp;":expShareInfo.provinceName}&nbsp;
									${empty expShareInfo.areaName?"&nbsp;":expShareInfo.areaName}</span>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="border-top: 1px solid #ebebeb; height: 30px; margin-top: 10px;"></div>

				</div>
			</div>
			<div class="detailsCont" style="padding: 15px;">
				<img src="${expShareInfo.expImage}" width="90%" style="display: block; margin: 0 auto 15px;">
				<div class="detailsText">${expShareInfo.expText}</div>
			</div>
		</div>

		<div class="fixed_bottom">
			<a href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/experienceSharing/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a>
			<div class="bottom_operation" onclick="publicExp();" style="padding:0 15px;">
				<img src="${ctx}/static/weixin/images/experienceSharing/public.png" width="20px;" height="20px;" /> <span
					class="spanContral_1" style="color: #f04646;">发布</span>
			</div>
			<div class="bottom_operation" onclick="edit();" style="padding:0 15px;">
				<img src="${ctx}/static/weixin/images/experienceSharing/edit.png" width="20px;" height="20px;" /> <span
					class="spanContral_1" style="color: #00a65a;">编辑</span>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>