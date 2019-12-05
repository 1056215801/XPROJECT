<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>创建调查</title>
<link href="${ctx}/static/css/investigation/createSurvey.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/iCheck/custom.css" rel="stylesheet"/>
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<style>
.tabItem {
	background-color:#f1921c;
	height:40px;
}
.itemClick { background-color:#B76501;}
</style>
<script>
$(document).ready(function(){
	$(".i-checks").iCheck({
		checkboxClass:"icheckbox_square-green",
		radioClass:"iradio_square-green",
		});
	});
 $(function(){
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(2).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	
 });

</script>
<script type="text/javascript">
	$(function(){
		var endTime = {
				elem : '#endTime', //选择ID为START的input
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
		laydate(endTime);
		
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
						'jsessionid' : '${pageContext.session.id}'
					},
					'uploader': '${ctx}/login/json/attachment/publish' , // 新版
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
						$("#extend1").val(obj.attachment.attachmentUrl);
					}
				});

	});
	
	
	function showPic(jsonData) {
		$("#showPicUrl").attr('src', jsonData.attachmentUrl);
		$("#showPicUrl").show();
	}
	
	function createPreview(){
		 window.location.href="${ctx}/investigation/createPreview";
	}
</script>
</head>

<body>
<div class="create_main">
	<%@ include file="../common/header.jsp"%>
		
	</div>
	
	<div class="create_content">
		<div class="titleName">
			<ul>
				<li><a href="javascript:;">创建调查</a></li>
			</ul>
			<div style="clear:both;"></div>
		</div>
		<div class="tiitleItem">
			<div>
				<div class="create_inputBar">
					<div class="create_input">
						<font class="redStar">*</font>
						<span class="create_attr">标题</span>
						<input type="text" class="inputContral" style="width:81.5%;" name="investigationName"/>
						<div style="clear:both;"></div>
					</div>
					<div class="create_input">
						<div class="create_attr" style="margin-left:15px;">截止时间</div>
						<input id="endTime" class="laydate-icon form-control layer-date laydateContral">
						<div style="clear:both;"></div>
					</div>
					<div class="create_input">
						<font class="redStar">*</font>
						<span class="create_attr">是否允许查看统计结果</span>
						<div style="float:left; margin-left:15px;">
							<div class="i-checks" style="float:left;">
								<input type="radio" value="option1" name="iscount">是
							</div>
							<div class="i-checks" style="float:left; margin-left:15px;">
								<input type="radio" checked="" value="option2" name="iscount">否
							</div>
							<div style="clear:both;"></div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="create_input">
						<font class="redStar">*</font>
						<span class="create_attr">是否允许匿名参加</span>
						<div style="float:left; margin-left:15px;">
							<div class="i-checks" style="float:left;">
								<input type="radio" value="option1" name="isanonymous">是
							</div>
							<div class="i-checks" style="float:left; margin-left:15px;">
								<input type="radio" checked="" value="option2" name="isanonymous">否
							</div>
							<div style="clear:both;"></div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="create_input">
						<input type="hidden" name="extend1" id="extend1">
						<span class="create_attr" style="margin-left:15px;">上传海报</span>
						<img src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
						<div class="uploadImgTips">
							<p>一张在线调查封面，能让你的调查锦上添花，增加查看点击率，也将影响其调查被推介的几率。</p>
							<p>图片小于2M ( jpg、gif、png)，尺寸为900*440px</p>
							<input type="file" data-no-uniform="true" name="attFiles" id="file_uploads" multiple="true" />
						</div>
						<div style="clear:both;"></div>
					</div>
					
				</div>
				
				<div style="background-color:#f6f6f6; padding:10px 20px;">
					<input type="button" value="发布" class="yellowBtnContral">
					<input type="button" value="保存" class="greenBtnContral">
					<input type="button" value="预览" onClick="createPreview();" class="grayBtnContral">
					<div style="clear:both;"></div>
				</div>
			</div>
			
		</div>
	</div>
	  <%@ include file="../common/footer.jsp"%>
	 

</body>
</html>
