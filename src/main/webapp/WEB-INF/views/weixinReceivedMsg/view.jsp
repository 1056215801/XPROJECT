  
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>查看</title>
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css" rel="stylesheet">

<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>

<script type="text/javascript">
	$(function(){
		 
	});
	
	function returnBtn(){
		window.location.href="${ctx}/weixinReceivedMsg/list";
	}
	
</script>
</head>

<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">查看
					</div>
					<div class="ibox-content">
						<form class="form-horizontal" id="form" action="" method="post">
						     <input type="hidden" id="id" name="id"  value="${weixinReceivedMsg.id}"  />
							<div class="form-group">
								<label class="col-sm-2 control-label">文本消息内容</label>
								<div class="col-sm-10">
${weixinReceivedMsg.content}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">发送方微信号</label>
								<div class="col-sm-10">
${weixinReceivedMsg.fromUserName}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">接收方微信号</label>
								<div class="col-sm-10">
${weixinReceivedMsg.toUserName}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息创建时间 （整型）</label>
								<div class="col-sm-10">
${weixinReceivedMsg.createTime}	  </div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">状态（1=有效，-1已删）</label>
								<div class="col-sm-10">
${weixinReceivedMsg.status}	    </div>
							</div>
							 
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">图片链接</label>
								<div class="col-sm-10">
${weixinReceivedMsg.picUrl}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">语音格式 </label>
								<div class="col-sm-10">
${weixinReceivedMsg.format}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息类型</label>
								<div class="col-sm-10">
${weixinReceivedMsg.type}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息标题</label>
								<div class="col-sm-10">
${weixinReceivedMsg.title}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息链接</label>
								<div class="col-sm-10">
${weixinReceivedMsg.url}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息描述</label>
								<div class="col-sm-10">
${weixinReceivedMsg.description}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息ID</label>
								<div class="col-sm-10">
${weixinReceivedMsg.msgId}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">媒体缩略图ID</label>
								<div class="col-sm-10">
${weixinReceivedMsg.thumbMediaId}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">地理位置维度</label>
								<div class="col-sm-10">
${weixinReceivedMsg.locationY}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">地理位置经度</label>
								<div class="col-sm-10">
${weixinReceivedMsg.locationX}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">地图缩放大小</label>
								<div class="col-sm-10">
${weixinReceivedMsg.scale}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">地理位置信息</label>
								<div class="col-sm-10">
${weixinReceivedMsg.label}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="button" class="btn btn-white" onclick="returnBtn()" value="返回">
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
