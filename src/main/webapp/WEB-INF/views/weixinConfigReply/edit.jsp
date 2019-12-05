 
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>创建/编辑</title>
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
 
<style type="text/css">
.selected {
	background: orange;
}
</style>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>		
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
<script type="text/javascript">
	function saveBtn(){
		if(validate()){
			$("#form").submit();
		}
	}
	
	function validate(){
		return true;
	}
	
	function returnBtn(){
		window.location.href="${ctx}/weixinConfigReply/list";
	}
	
	
$(function() {
	$(".i-checks").iCheck({
		checkboxClass:"icheckbox_square-green",
		radioClass:"iradio_square-green"
	}); 
	//图片附件
	$('.upc').each(function() {
		   var id=$(this).attr('id');
		 //  var sortGrade=$(this).attr('sortGrade');
		   $(this).uploadify({
						'debug' : false,
						'simUploadLimit' : 1,
						'multi' : false,
						'auto' : true,
						'removeCompleted' : true,
						'removeTimeout' : 1,
						'successTimeout' : 99999,
						'formData' : {
							'jsessionid' : '${pageContext.session.id}',
							'moduleId':'-1', 
							'remark':'微信自动回复模板配置'
						},
						 'uploader': '${ctx}/session/attachment/publish' , // 新版
						'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
						'overrideEvents' : [ 'onDialogClose','onUploadError', 'onSelectError' ],
						'queueID' : 'fileQueues',
						'fileObjName' : 'attachment',
						'width' : '80',
						'height' : '30',
						'fileTypeDesc' : '支持的格式：',
						'fileTypeExts' : '*.*',
						'fileSizeLimit' : '100MB',
						'buttonText' : '选择文件',
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
						'onSelectError' : function(file, errorCode,
								errorMsg) {
							switch (errorCode) {
							case -100:
								alert("上传的文件数量已经超出系统限制的"
										+ $('#uploadify').uploadify('settings','queueSizeLimit')+ "个文件！");
								break;
							case -110:
								alert("文件 ["+ file.name+ "] 大小超出系统限制的"
									  + $('#uploadify').uploadify('settings','fileSizeLimit')+ "大小！");
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
							var obj = JSON.parse(data);
							showPic(obj,id);
						}
					});
	});
});
	function delImg() {
		layer.confirm('确定要删除吗？', {
			icon : 3,
			shade : false
		//不显示遮罩
		}, function(index) {
			layer.close(index);
		//	$("#article\\.cover").val('');
		///	$("#showPicUrl").attr('src', '');
		//	$("#showPicUrl").hide();
			$("#delBtn").hide();
		});
	}
	function showPic(jsonData,id) {
		$("#save_"+id).val(jsonData.attachment.attachmentUrl);
		$("#show_"+id).attr('src', jsonData.attachment.attachmentUrl);
		$("#show_"+id).show();
		$("#delBtn").show();
	}
</script>	
</head>

<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>编辑 </h5><!--  
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
							<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#"> <i class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="form_basic.html#">选项1</a></li>
								<li><a href="form_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i></a>
						</div>-->
					</div>
					<div class="ibox-content">
						<form class="form-horizontal" id="form" name="form"  action="${ctx}/weixinConfigReply/save" method="post">
						     <input type="hidden" id="save_image2" name="picUrl" value="${weixinConfigReply.picUrl}" />
						     <input type="hidden" id="replyId" name="replyId"  value="${weixinConfigReply.replyId}"  />
						  
							<div class="form-group">
								<label class="col-sm-2 control-label">回复标题</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="title" id="title"  value="${weixinConfigReply.title}" 
										placeholder="请输入回复标题" />
								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">用户输入语</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="inputWord" id="inputWord"  value="${weixinConfigReply.inputWord}" 
										placeholder="为空表示匹配任何输入语" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">回复类型 </label>
								<div class="col-sm-10">
								 <select class="form-control m-b" name="type">
                                        <option value="newsMsg" ${weixinConfigReply.type=="newsMsg"?"selected":""}>newsMsg</option>
                                        <option value="textMsg" ${weixinConfigReply.type=="textMsg"?"selected":""}>textMsg</option>
                                    </select>
								</div>
							</div> 
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">回复内容</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="replyWord" id="replyWord"  value="${weixinConfigReply.replyWord}" 
										placeholder="请输入回复内容" />
								</div>
							</div>
							 
						   <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">图片</label>
								<div class="col-sm-10">
									<div style="float: left;">
										<img alt="" src="${weixinConfigReply.picUrl}" id="show_image2" style="width: 100px; height: 100px;" />
									</div>
									<div style="float: left; margin-left: 15px;">
										<p>图片小于2M ( jpg、gif、png)，尺寸为1080*640px</p>
										<input type="file" data-no-uniform="true" class="upc"  name="" id="image2" multiple="true" />
									</div>
								</div>
							</div>
							 
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">点击跳转URL</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="jumpUrl" id="jumpUrl"  value="${weixinConfigReply.jumpUrl}" 
										placeholder="请输入跳转地址" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">排序</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="showSubscribeOrder" id="showSubscribeOrder"  value="${weixinConfigReply.showSubscribeOrder}" 
										placeholder="请输入排序" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">关注时是否显示</label>
								<div class="col-sm-10">
									<div class="radio i-checks">
                                        <label>
                                            <input type="radio" value="1" name="showSubscribe" ${weixinConfigReply.showSubscribe==1?"checked":""}> <i></i> 是</label>
                                    </div>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" value="0" name="showSubscribe" ${weixinConfigReply.showSubscribe==0?"checked":""}> <i></i> 否</label>
                                    </div>
								</div>
							</div>
							
								<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">状态</label>
								<div class="col-sm-10">
									 <div class="radio i-checks">
                                        <label>
                                            <input type="radio" value="1" name="status" ${weixinConfigReply.status==1?"checked":""}> <i></i> 有效</label>
                                    </div>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" value="0" name="status" ${weixinConfigReply.status==0?"checked":""}> <i></i> 无效</label>
                                    </div>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="button" class="btn btn-primary" onclick="saveBtn()" value="保存"/>
									<input type="button" class="btn btn-white" onclick="returnBtn()" value="取消">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
