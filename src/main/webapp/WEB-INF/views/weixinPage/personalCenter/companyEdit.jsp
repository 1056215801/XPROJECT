<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>企业设置</title>
<link href="${ctx}/static/weixin/css/personalCenter/companyEdit.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/webuploader/webuploader.css">
<script type="text/javascript" src="${ctx}/static/js/plugins/webuploader/webuploader.js"></script>
<style>
input[type="button"], input[type="submit"], input[type="reset"] {
    -webkit-appearance: none!important;
}
textarea {-webkit-appearance: none!important;}
</style>
</head>

<body>
	<div class="login_main">
		<c:choose>
			<c:when test="${info!=null}">
				<div class="input_dataBar">
					<div class="input_data">
						<div class="input_dataLeft" style="vertical-align: top;">默认企业</div>
						<div class="inputContral" style="width: 50%; vertical-align: top; margin-left: 5px;">${info.companyName}</div>
						<a href="javascript:companyDetail('${info.companyId}');" style="text-decoration: none; vertical-align: top;">
							<div class="setOperation">查看详情&nbsp;></div>
						</a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="input_dataBar">
					<div class="input_data">
						<div class="input_dataLeft">默认企业</div>
						<div class="inputContral" style="width: 60%; margin-left: 5px;">暂未设置默认企业</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

		<c:if test="${isVisitor==true}">
			<div class="input_dataBar">
				<div class="input_data">
					<div class="input_dataLeft" style="vertical-align: top;">企业列表</div>
					<div class="inputContral" style="width: 50%; vertical-align: top;"></div>
					<a href="javascript:companyCreate();" style="text-decoration: none; vertical-align: top;">
						<div class="setOperation">创建企业&nbsp;></div>
					</a>
				</div>
				<c:if test="${compList!=null}">
					<c:forEach items="${compList}" var="companyInfo">
						<div class="input_data">
							<div class="inputContral" style="padding:3px 5px;vertical-align: top;border:1px solid #ccc;">${companyInfo.companyName}
									<a href="javascript:deleteCompany('${companyInfo.companyId}');"
										style="text-decoration: none; vertical-align: top;color:#f14241;">
										X
									</a>
								
							</div>
							<a href="javascript:companyDetail('${companyInfo.companyId}');" style="text-decoration: none; vertical-align: top;">
								<div class="setOperation" style="padding:4px 0;">查看详情&nbsp;></div>
							</a> <a href="javascript:setDefault('${companyInfo.companyId}');" style="text-decoration: none; vertical-align: top;">
								<div class="setOperation" style="padding:4px 0;margin-right: 5px;">设为默认</div>
							</a>
							<div style="clear: both;"></div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</c:if>

		<a href="${ctx}/auth/page/mobile/weixin/personalInfoBingding">
			<div style="padding: 10px 7px;">
				<input type="button" value="返&nbsp;回" class="buttonContral_white" style="outline: none;">
			</div>
		</a>
	</div>

	<div id="createDiv" style="display: none;">
		<div class="create_content" style="position: fixed; top: 0; bottom: 45px; overflow: scroll;">
			<!-- 创建企业表单 -->
			<form method="post" id="editform">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" id="bizLicenseAt"
					name="bizLicenseAt" /> <input type="hidden" id="bizLicenseUrl" name="bizLicenseUrl" /> <input type="hidden" id="provinceId"
					name="provinceId" /> <input type="hidden" id="provinceName" name="provinceName" /> <input type="hidden" id="areaId"
					name="areaId" /> <input type="hidden" id="areaName" name="areaName" /> <input type="hidden" id="spaceId" name="spaceId" /> <input
					type="hidden" id="spaceName" name="spaceName" /> <input type="hidden" id="parentId" name="parentId" />


				<div style="background-color: #fff; margin-top: 6px; padding: 10px 0;">
					<div style="padding: 5px 0;">
						<span class="createTitle">企业名称</span> <input id="companyName" name="companyName" type="text" class="createInput"
							placeholder="请输入企业名称" maxlength="50" /> <span class="createAsterisk">*</span>
					</div>
					<div style="padding: 5px 0;">
						<span class="createTitle">信用代码</span> <input id="socialCreditNo" name="socialCreditNo" type="text" class="createInput"
							placeholder="请输入18位社会信用代码" maxlength="18" /> <span class="createAsterisk">*</span>
					</div>
					<div style="clear: both;"></div>
				</div>

				<div style="background-color: #fff; margin-top: 6px; padding: 10px 0;">
					<div style="padding: 5px 0;">
						<span class="createTitle">所在地区</span> <select id="province" style="outline: none;width:120px;">
							<option value="">省份/自治区</option>
						</select> <span class="createAsterisk">*</span>
					</div>
					<div style="padding: 5px 0;">
						<select id="city" style="margin-left: 84px; outline: none;width:120px;">
							<option value="">城市/自治州</option>
						</select>
					</div>
					<div style="padding: 5px 0;">
						<select id="town" style="margin-left: 84px; outline: none;width:120px;">
							<option value="">区/县</option>
						</select>
					</div>
					
					<div class="createTitle" style="float: left;">详细地址</div>
					<div style="float: left; padding: 10px;">
						<textarea id="positionAddress" name="positionAddress" maxlength="64" placeholder="建议您如实填写详细地址，例如街道名称，门牌号码，楼层和房间信息"
							style="width: 273px; outline: none; height: 100px; resize: none;"></textarea>
					</div>
					<div style="clear: both;"></div>
				</div>

				<div style="background-color: #fff; margin-top: 6px; padding: 10px 0;">
					<div style="padding: 5px 0;">
						<span class="createTitle">主营业务</span> <input id="operationMain" name="operationMain" type="text" class="createInput"
							placeholder="请输入主营业务" />
					</div>
					<div style="padding: 5px 0;">
						<span class="createTitle">企业网址</span> <input id="siteUrl" name="siteUrl" type="text" class="createInput" placeholder="请输入企业网址" />
					</div>
					<div class="createTitle" style="float: left;">企业简介</div>
					<div style="clear: both;"></div>
					<div style="float: left; padding: 10px;">
						<textarea id="companyDescription" name="companyDescription" style="width: 273px; outline: none; height: 100px; resize: none;"></textarea>
					</div>
					<div style="clear: both;"></div>
				</div>

				<div style="width: 100%; padding: 10px 0; text-align: center;">
					<button type="button" onclick="saveCompany()"
						; style="width: 52%; height: 35px; margin-left: 5%; background-color: #f14241; color: #fff; border-style: none; outline: none;">提交</button>
				</div>
			</form>
		</div>
		<div class="fixed_bottom">
			<a href="javascript:closeCreateLayer();"> <img src="${ctx}/static/weixin/images/riskLogistics/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a>
			<div style="clear: both;"></div>
		</div>

	</div>
</body>
<script type="text/javascript">
	
	function ityzl_SHOW_LOAD_LAYER() {
		return layer.msg('加载中...', {
			icon : 16,
			shade : [ 0.5, '#f5f5f5' ],
			scrollbar : false,
			time : 100000
		});
	}

	/* 设置默认企业  */
	function setDefault(companyId) {
		$.ajax({
			url : "${ctx}/personalCenter/setDefaultCompany",
			type : "get",
			data : {
				"companyId" : companyId
			},
			success : function(result) {
				layer.msg(result.msg);
				if (result.code == 1) {
					setTimeout(function() {
						window.location.reload();
					}, 1000);
				}
			},
			error : function() {
				layer.msg("请求超时，请稍后重试！");
			}
		});
	}

	/* 查看企业详情 */
	function companyDetail(companyId) {
		window.location.href = "${ctx}/personalCenter/companyDetail?companyId="
				+ companyId;
	}

	/* 创建企业弹窗 */
	function companyCreate() {
		createLayer = layer.open({
			type : 1,
			title : false,
			shadeClose : true,
			shade : [ 0 ],
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#createDiv')
		});

		setUploader();

		var isVisitor = '${isVisitor}';

		if (isVisitor == 'true') {
			getArea(0, 1);
		}

		$("#province").change(function() {
			getArea($(this).val(), 2);
		});

		$("#city").change(function() {
			getArea($(this).val(), 3);
		});
	}

	/* 关闭创建企业弹窗 */
	function closeCreateLayer() {
		layer.close(createLayer);
	}

	/* 保存企业 */
	function saveCompany() {

		$("#provinceId").val($("#province").val());
		$("#provinceName").val($("#province option:selected").text());

		$("#areaId").val($("#city").val());
		$("#areaName").val($("#city option:selected").text());

		$("#spaceId").val($("#town").val());
		$("#spaceName").val($("#town option:selected").text());

		$("#parentId").val($("#park option:selected").val());

		if (validate()) {
			$.ajax({
				url : "${ctx}/personalCenter/saveCommonCompany",
				type : "post",
				data : $("#editform").serialize(),
				success : function(result) {
					layer.msg(result.msg);
					if (result.code == 1) {
						setTimeout(function() {
							window.location.reload();
						}, 1000);
					}
				},
				error : function() {
					layer.msg("请求超时，请稍后重试！");
				}
			});
		}
	}

	function validate() {
		var companyName = $("#companyName").val();
		if (companyName == "" || companyName == null) {
			layer.msg("请填写企业名称！");
			return false;
		}
		
		var socialCreditNo = $("#socialCreditNo").val();
		if (socialCreditNo == "" || socialCreditNo == null) {
			layer.msg("请填写信用代码！");
			return false;
		}

		var provinceId = $("#provinceId").val();
		if (provinceId == "" || provinceId == null) {
			layer.msg("请填写所在地区！");
			return false;
		}

		return true;
	}

	function setUploader() {
		// 图片上传选择初始化
		var uploader = WebUploader.create({
			// 选完文件后，是否自动上传。
			auto : true,
			swf : '${ctx}/static/js/plugins/webuploader/Uploader.swf',
			server : '${ctx}/session/attachment/publish',
			pick : '#picker',
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
			$("#uploadImg").attr('src', response.attachment.attachmentUrl);
			$("#bizLicenseUrl").val(response.attachment.attachmentUrl);
			$("#bizLicenseAt").val(response.attachment.attachmentId);
		});
		// 文件上传失败，显示上传出错。
		uploader.on('uploadError', function(file) {
			layer.msg("上传失败");
		});
	}

	function getArea(parentId, type) {
		
		var provinceId = '${companyInfoBean.provinceId}';
		var areaId = '${companyInfoBean.areaId}';;
		var spaceId = '${companyInfoBean.spaceId}';;
		if(provinceId==null||provinceId=='undefined'||provinceId==''){
			provinceId = 360000;
			areaId = 360100;
			spaceId = 360101; 
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
	
	/* 删除企业 */
	function deleteCompany(companyId){
		layer.confirm("确认删除常用企业？",function(){
			$.ajax({
				url : "${ctx}/personalCenter/deleteCommonCompany",
				type : "get",
				data : {
					"companyId" : companyId
				},
				success : function(result) {
					layer.msg(result.msg);
					if(result.code==1){
						setTimeout(function(){
							window.location.reload();
						},1000);
					}
				},
				error : function() {
					layer.msg("请求超时，请稍后重试！");
				}
			});
		},function(){return;});
	}
</script>
</html>
