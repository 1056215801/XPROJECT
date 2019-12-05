<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>申请权限</title>
<link href="${ctx}/static/weixin/css/personalCenter/applicationAuthority.css" rel="stylesheet" />

<link href="${ctx}/static/plugins/select2/css/common.css" rel="stylesheet" />
<link href="${ctx}/static/plugins/select2/css/select2.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/area.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/location.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2_locale_zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/webuploader/webuploader.css">
<script type="text/javascript" src="${ctx}/static/js/plugins/webuploader/webuploader.js"></script>
<script>

	function showPic(jsonData, id) {
		$("#" + id + "_img").attr('src', jsonData.attachmentUrl);
		$("#" + id + "_input").val(jsonData.attachmentUrl);
	}
	function saveData() {
		if (checkValue())
		$('#editform').submit();
	}
	function checkValue() {
		var companyName = $("#companyName").val();
		if (companyName == null || companyName == "") {
			tips('请输入单位名称');
			return false;
		}
		var loc_province = $("#loc_province").val();
		var loc_city = $("#loc_city").val();
		var loc_town = $("#loc_town").val();
		if(loc_province == ""){
			tips('请选择单位所在省');
			return false;
		}
		$('#companyProvince').val($('#loc_province').select2('data').text);
		if (loc_city == "") {
			tips('请选择单位所在市');
			return false;
		}
		$('#companyCity').val($('#loc_city').select2('data').text);
		if(loc_town!=""){
			$('#companyCounty').val($('#loc_town').select2('data').text);
		}
		return true;
	}
</script>
</head>
<body>
	<form action="${ctx}/projectDeclare/upgradeSave" method="post" id="editform" name="editform">
		<input type="hidden" id="companyProvince" name="companyProvince" value="" />
		<input type="hidden" id="companyCity" name="companyCity" value="" />
		<input type="hidden" id="companyCounty" name="companyCounty" value="" />
		<input type="hidden" id="accountId" name="accountId" value="${accountId }" />
	<div style="padding-bottom:50px;">
		<div style="background-color: #fff; margin-top: 6px; padding: 10px 0;">
			<div style="padding: 5px 0;">
				<span class="createTitle" style="font-weight: bold;">申请升级为政府用户</span>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div style="background-color: #fff; margin-top: 6px; padding: 10px 0;">
			<div style="padding: 5px 0;">
				<span class="createTitle">单位名称</span> <input id="companyName" type="text" class="createInput" placeholder="请输入单位名称"
					name="companyName" maxlength="20" /> <span class="createAsterisk">*</span>
			</div>
			<div style="padding: 5px 0;">
				<span class="createTitle">单位所在</span> <select id="loc_province" style="width: 120px;">
				</select> <span class="createAsterisk">*</span>
			</div>
			<div style="padding: 5px 74px;">
				<select id="loc_city" style="width: 120px; margin-left: 10px"></select>
			</div>
			<div style="padding: 5px 74px;">
				<select id="loc_town" style="width: 120px; margin-left: 10px"></select>
			</div>
			<div style="clear: both;"></div>
		</div>

		<div style="background-color: #fff; margin-top: 6px; padding: 7px 10px;">
			<div style="padding: 10px 0;">单位组织机构代码证或三证合一后的统一社会信用代码原件扫描件或照片</div>
			<div style="width: 90px; height: 90px; float: left; margin-right: 10px;">
				<img src="${ctx}/static/weixin/images/activity/egpic.png" id="uploadImg0" width="90px;" height="90px;"
					style="float: left; margin-right: 10px; margin-top: 3%;" />
			</div>
			<div class="uploadifyText">
				<p>组织机构代码证必须在有效期范围内，格式要求：原件照片、扫描件或加盖公章的复印件。</p>
				<p>图片小于2M ( jpg、gif、png)</p>
			</div>
			<div>
				<div id="picker0" class="uploadifyInput"
					style="top: 2px; float: left; font-size: 14px; margin-right: 10px; margin: 20px 7px 5px 0; padding: 0 5px; border-radius: 3px;">上传图片</div>
			</div>
			<input type="hidden" id="bizLicenseUrl0" name="companyCodeImage" value="" />
			<div style="clear: both;"></div>
		</div>

		<div style="background-color: #fff; margin-top: 6px; padding: 10px 0;">
			<div style="padding: 5px 0;">
				<span class="createTitle">姓<span style="opacity: 0;">空格</span>名
				</span> <input type="text" class="createInput" placeholder="请输入姓名" name="accountName" id="accountName" maxlength="10" />
			</div>
			<div style="padding: 5px 0;">
				<span class="createTitle">身份证号</span> <input type="text" class="createInput" placeholder="请输入身份证号" name="idcardNum"
					id="idcardNum" maxlength="19" />
			</div>
			<div style="padding: 5px 0;">
				<span class="createTitle">手机号码</span> <input type="text" class="createInput" placeholder="请输入手机号码" name="telephone"
					id="telephone" maxlength="11" />
			</div>
			<div style="clear: both;"></div>
		</div>

		<div style="background-color: #fff; margin-top: 6px; padding: 7px 10px;">
			<div style="padding: 10px 0;">授权书</div>
			<div style="width: 90px; height: 90px; float: left; margin-right: 10px;">
				<img src="${ctx}/static/weixin/images/activity/egpic.png" id="uploadImg1" width="90px;" height="90px;"
					style="float: left; margin-right: 10px; margin-top: 3%;" />
			</div>
			<div class="uploadifyText">
				<p>授权书必须在有效期范围内，格式要求：原件照片、扫描件或加盖公章的复印件。</p>
				<p>图片小于2M ( jpg、gif、png)</p>
			</div>
			<div>
				<div id="picker1" class="uploadifyInput"
					style="top: 2px; float: left; font-size: 14px; margin-right: 10px; margin: 20px 7px 5px 0; padding: 0 5px; border-radius: 3px;">上传图片</div>
			</div>
			<input type="hidden" id="bizLicenseUrl1" name="certificateImage" value="" />
			<div style="clear: both;"></div>
		</div>

		<div style="background-color: #fff; margin-top: 6px; padding: 7px 10px;">
			<div style="padding: 10px 0;">申请人身份证正面照</div>
			<div style="width: 90px; height: 90px; float: left; margin-right: 10px;">
				<img src="${ctx}/static/weixin/images/activity/egpic.png" id="uploadImg2" width="90px;" height="90px;"
					style="float: left; margin-right: 10px; margin-top: 3%;" />
			</div>
			<div class="uploadifyText">
				<p>请提交中华人民共和国居民身份证，无居民身份证的内地居民可提交《临时居民身份证》。</p>
				<p>图片小于2M ( jpg、gif、png)</p>
			</div>
			<div>
				<div id="picker2" class="uploadifyInput"
					style="top: 2px; float: left; font-size: 14px; margin-right: 10px; margin: 20px 7px 5px 0; padding: 0 5px; border-radius: 3px;">上传图片</div>
			</div>
			<input type="hidden" id="bizLicenseUrl2" name="idcardFront" value="" />
			<div style="clear: both;"></div>
			<hr style="margin:10px 0;"/>
			<div>
				<div>示例</div>
				<img src="${ctx}/static/image/projectDeclare/identityCard1.jpg">
			</div>
		</div>

		<div style="background-color: #fff; margin-top: 6px; padding: 7px 10px;">
			<div style="padding: 10px 0;">申请人身份证反面照</div>
			<div style="width: 90px; height: 90px; float: left; margin-right: 10px;">
				<img src="${ctx}/static/weixin/images/activity/egpic.png" id="uploadImg3" width="90px;" height="90px;"
					style="float: left; margin-right: 10px; margin-top: 3%;" />
			</div>
			<div class="uploadifyText">
				<p>请提交中华人民共和国居民身份证，无居民身份证的内地居民可提交《临时居民身份证》。</p>
				<p>图片小于2M ( jpg、gif、png)</p>
			</div>
			<div>
				<div id="picker3" class="uploadifyInput"
					style="top: 2px; float: left; font-size: 14px; margin-right: 10px; margin: 20px 7px 5px 0; padding: 0 5px; border-radius: 3px;">上传图片</div>
			</div>
			<input type="hidden" id="bizLicenseUrl3" name="idcardBack" value="" />
			<div style="clear: both;"></div>
			<hr style="margin:10px 0;"/>
			<div>
				<div>示例</div>
				<img src="${ctx}/static/image/projectDeclare/identityCard2.jpg">
			</div>
		</div>

		<div style="width: 100%; padding: 10px 0; text-align: center;">
			<button type="button" onclick="saveData();" style="width: 52%; height: 35px; margin-left: 5%; background-color: #f14241; color: #fff; border-style: none; outline: none;">提交</button>
		</div>
	</div>
	
	</form>
	<div class="fixed_bottom">
		<a href="javascript:history.go(-1);"> 
			<img src="${ctx}/static/weixin/images/riskLogistics/return.png" width="20px;" height="20px;" class="returnBtn" />
		</a>
		<div style="clear: both;"></div>
	</div>
</body>
<script>
$(function(){
	$(".uploadifyInput").each(function(index,item){
		setUploader(index);
	});
});


function setUploader(index) {
	// 图片上传选择初始化
	var uploader = WebUploader.create({
		// 选完文件后，是否自动上传。
		auto : true,
		swf : '${ctx}/static/js/plugins/webuploader/Uploader.swf',
		server : '${ctx}/session/attachment/publish',
		pick : '#picker'+index,
		duplicate : true, //可以重复上传
		fileVal : 'attachment',
		// 只允许选择图片文件。
		accept : {
			title : 'Images',
			extensions : 'gif,jpg,jpeg,bmp,png',
			mimeTypes : 'image/*'
		},
	    formData:{
			'moduleId': '-1', 
			'remark': '个人中心'
		}
	});

	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on('uploadSuccess', function(file, response) {
		layer.msg("上传成功");
		$("#uploadImg"+index).attr('src', response.attachment.attachmentUrl);
		$("#bizLicenseUrl"+index).val(response.attachment.attachmentUrl);
	});
	// 文件上传失败，显示上传出错。
	uploader.on('uploadError', function(file) {
		layer.msg("上传失败");
	});
}
</script>
</html>