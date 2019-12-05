<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发布活动</title>
<link href="${ctx}/static/css/activity/releaseActivity.css" rel="stylesheet" />
<link href="${ctx}/static/css/activity/layer.css" rel="stylesheet" />
<style type="text/css">
.nameClick a {color:#fff;}
</style>
<script>
	$(function() {
		$(".tabName ul li").each(
			function() {
				var index = $(this).index();
				$(".tabName ul li").eq(0).addClass("nameClick");
				$(this).click(function() {
					$(this).addClass("nameClick").siblings().removeClass("nameClick");
					$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
			});
		});
		$(".tabItem ul li").each(
			function() {
				$(".tabItem ul li").eq(2).addClass("itemClick");
				$(this).click(function() {
					$(this).addClass("itemClick").siblings().removeClass("itemClick");
			});
		});
		$(".titleName ul li").each(
			function() {
				var index = $(this).index();
				$(".titleName ul li").eq(0).addClass("titleClick");
				$(this).click(function() {
					$(this).addClass("titleClick").siblings().removeClass("titleClick");
					$(".tiitleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
			});
		});
		
	});
	
</script>
<script type="text/javascript">
	$(function() {
		//时间控件
		var start = {
			elem : '#start', //选择ID为START的input
			event : "focus",
			format : 'YYYY-MM-DD hh:mm', //自动生成的时间格式
		//	min : laydate.now(), //设定最小日期为当前日期
			max : '2099-06-16 23:59', //最大日期
			istime : true, //必须填入时间
			start : laydate.now(0, "YYYY-MM-DD hh:mm"), //设置开始时间为当前时间
			choose : function(datas) {
				/* end.min = datas; //开始日选好后，重置结束日的最小日期
				end.start = datas; //将结束日的初始值设定为开始日 */
			}
		};
		var end = {
			elem : '#end',
			format : 'YYYY-MM-DD hh:mm',
			event : "focus",
		//	min : laydate.now(),
			max : '2099-06-16 23:59',
			istime : true,
			start : laydate.now(0, "YYYY-MM-DD hh:mm"),
			choose : function(datas) {
				start.max = datas; //结束日选好后，重置开始日的最大日期
			}
		};
		laydate(start);
		laydate(end);

		//初始化已选标签
		initTags('${projectActivityInfoBean.activityTags}');
		
		//图片附件
		$('#file_uploads').uploadify(
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
				'queueID' : 'fileQueues',
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
								+ $('#file_uploads').uploadify('settings',
										'queueSizeLimit') + "个文件！");
						break;
					case -110:
						alert("文件 ["
								+ file.name
								+ "] 大小超出系统限制的"
								+ $('#file_uploads').uploadify('settings',
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
					$("#activityImage").val(obj.attachment.attachmentUrl);
				}
			});

	});

	function showPic(jsonData) {
		$("#showPicUrl").attr('src', jsonData.attachmentUrl);
		$("#showPicUrl").show();
	}
	
	//初始化标签
	function initTags(tags) {
		var tag = tags.split(",");
		for (var i = 0; i < tag.length; i++) {
			$(".searchOptions .optionBtn").each(function() {
				if ($(this).text() == tag[i]) {
					$(this).addClass("selected");
				}
			});
		}
	}
	
	//获取标签的值并以字符串形式拼接
	function getTags(obj){
		if($(obj).hasClass("selected")){
			$(obj).removeClass("selected");
		}else{
			$(obj).addClass("selected");
		}
		var tags = "";
		var count = 0;
		$(".searchOptions .optionBtn").each(function(){
            if($(this).hasClass("selected")){
            	tags += ($(this).text() + ",");
            	count++;
            }
        });
		if(count<1){
        	layer.msg("请至少选择一项");
        	$(obj).addClass("selected");
        	return;
        }
        if(count>4){
        	layer.msg("最多选择四项");
        	$(obj).removeClass("selected");
        	return;
        }
		$("#activityTags").val(tags);
	}
	
	//发布
	function releaseSave(){
		if(validate()){
			$.ajax({
				url:"${ctx}/projectActivity/json/activitySave",
				type:"post",
			 	data:$("#editform").serialize(),
			 	dataType:"json",
			 	success:function(result){
			 		if(result.code==1){
			 			releaseSuccess(result.msg);
			 		}else if(result.code==-2){
						layer.msg(result.msg);
					}else{
			 			layer.alert(result.msg);
			 		}
			 	},
			 	error: function(XMLHttpRequest, textStatus, errorThrown) {
			 		layer.msg("请求超时，请稍后重试");
				}
			});
		}
	}
	
	//预览
	function releasePreview(){
		if(validate()){
			$("#editform").attr("action","${ctx}/projectActivity/preview");
			$("#editform").submit();
		}
	}
	
	//发布成功后处理
	function releaseSuccess(activityId) {
		layer.open({
			type : 1,
			title : false,
			shadeClose : true,
			shade : [ 0 ],
			area : [ '400px', '200px' ],
			time : 2000,
			closeBtn : 0,
			content : $('#releaseSuccess'),
			end : function() {
				window.location.href="${ctx}/projectActivity/details/"+activityId;
			}
		});
	};

	function validate(){
		var activityName = $("#activityName").val();
		if(activityName == ""||activityName == null){
			layer.msg("请输入活动主题");
			return false;
		}
		
		var start = $("#start").val();
		if(start == ""||start == null){
			layer.msg("请选择开始时间");
			return false;
		}
		
		var end = $("#end").val();
		if(end == ""||end == null){
			layer.msg("请选择结束时间");
			return false;
		}
		
		var activityLocation = $("#activityLocation").val();
		if(activityLocation == ""||activityLocation == null){
			layer.msg("请输入活动地址");
			return false;
		}
		var activityImage = $("#activityImage").val();
		if(activityImage == ""||activityImage == null){
			layer.msg("请选择图片");
			return false;
		}
		
		var activityTags = $("#activityTags").val();
		if(activityTags == ""||activityTags == null){
			layer.msg("请选择标签");
			return false;
		}
		
		var activityDescription = $("#activityDescription").val();
		if(activityDescription ==""||activityDescription ==null){
			layer.msg("请输入活动详情");
			return false;
		}
		
		
		var startTime = new Date(start.replace(/\-/g, "\/"));
		var  endTime = new Date(end.replace(/\-/g, "\/"));
		if(startTime>=endTime){
			layer.msg("结束时间不能小于开始时间");
			return false;
		}
		
		return true;
	}
	
	function moreImage(){
		layer.msg("亲，功能正在开发中！");
	}
</script>
</head>

<body>
	<div class="release_main">
		<div class="project_header">
			<%@ include file="../common/header.jsp"%>
		</div>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="-1"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="活动报名" />
		<div class="release_content">
			<div class="titleName">
				<ul>
					<li><a href="javascript:;">创建活动</a></li>
				</ul>
				<div style="clear: both;"></div>
			</div>
			<form action="" method="post" id="editform" name="editform">
				<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
				<input type="hidden" id="activityTags" name="activityTags" value="${projectActivityInfoBean.activityTags}"/> 
				<input type="hidden" id="activityImage" name="activityImage" value="${projectActivityInfoBean.activityImage}"/>
			<div class="tiitleItem">
				<div>
					<div class="release_dataBar">
						<div class="release_data">
							<font class="redStar">*</font> <span class="release_attr">活动名称</span>
							<input id="activityName" name="activityName" type="text" class="release_input" style="width: 87%;" value="${projectActivityInfoBean.activityName}" maxlength="24"/>
							<div style="clear: both;"></div>
						</div>
						<div class="release_data">
							<font class="redStar">*</font> <span class="release_attr">开始时间</span>
							<input id="start" name="start" type="text"
								class="laydate-icon laydateContral" placeholder="开始日期" value="${projectActivityInfoBean.start}"/>
							<div style="clear: both;"></div>
						</div>
						<div class="release_data">
							<font class="redStar">*</font> <span class="release_attr">结束时间</span>
							<input id="end" name="end" type="text"
								class="laydate-icon laydateContral" placeholder="结束日期" value="${projectActivityInfoBean.end}"/>
							<div style="clear: both;"></div>
						</div>
						<div class="release_data">
							<font class="redStar">*</font> <span class="release_attr">活动地点</span>
							<input id="activityLocation" name="activityLocation" type="text" placeholder="请输入详细地址" class="release_input"
								style="width: 87%; text-indent: 30px;" value="${projectActivityInfoBean.activityLocation}" maxlength="64"/> <img
								src="${ctx}/static/image/activity/location.png"
								width="20px;" height="20px;"
								style="position: relative; top: 5px; left: -87%;">
							<div style="clear: both;"></div>
						</div>
						<div class="release_data">
							<font class="redStar">*</font> <span class="release_attr">上传海报</span>
							<span style="float: left; margin-left: 15px;"> 
							<c:choose>
								<c:when test="${projectActivityInfoBean.activityImage!=null&&projectActivityInfoBean.activityImage!=''}">
									<img src="${projectActivityInfoBean.activityImage}" id="showPicUrl" width="100px;" height="100px;" />
								</c:when>
								<c:otherwise>
									<img src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl" width="100px;" height="100px;" />
								</c:otherwise>
							</c:choose>
							</span>
							<div style="float: left; margin-left: 15px; position:relative; color: #aaa; font-size: 12px;">
								<p>一张漂亮的海报，能让你的活动锦上添花，带来更多用户报名及增加传播效果，也将影响其在活动被推介的几率。</p>
								<p>图片小于2M ( jpg、gif、png)，尺寸为720*370px</p>
								<div style="float: left; margin-top: 10px;">
									<input type="file" data-no-uniform="true" name="attFiles" id="file_uploads" multiple="true" style="float:left;" />
								</div>
								<input type="button" value="推荐图库" class="release_btn release_rel" style="margin:10px 0 0 20px; float:none;" onclick="moreImage()"/>	
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="release_data">
							<font class="redStar">*</font> <span class="release_attr">选择标签</span>
							<div class="searchOptions">
								<c:forEach items="${tagList}" var="tags">
									<div class="optionBtn" onclick="getTags(this)">${tags.tagName}</div>
								</c:forEach>
								<br/>
								<div style=" color: #aaa; font-size: 12px;">（最少选择一个标签，最多只能选择四个标签 ）</div>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="release_data">
							<font class="redStar">*</font> <span class="release_attr">活动详情</span>
							<textarea id="activityDescription" name="activityDescription"  class="release_input" style="width: 87%;height:200px;">${projectActivityInfoBean.activityDescription}</textarea>
							<div style="clear: both;"></div>
						</div>
						<div>
							<input type="button" onClick="releaseSave();" value="发布"
								class="release_btn release_rel"> <input type="button"
								onclick="releasePreview();" value="预览"
								class="release_btn release_pre">
							<div style="clear: both;"></div>
						</div>
					</div>
				</div>

			</div>
			</form>
		</div>

		<div id="releaseSuccess" style="display: none;">
			<div style="margin: 20px auto; font-size: 18px; text-align: center;">
				<img src="${ctx}/static/image/activity/success.png"
					width="70px;" height="70px;">
				<div>恭喜你，活动发布成功！</div>
				<div>
					<span style="color: #F00; font-size: 24px;">2</span>&nbsp;秒后自动跳转到该活动页面
				</div>
			</div>
		</div>

	     <%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>
