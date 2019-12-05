 
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
		window.location.href="${ctx}/weixinReceivedMsg/list";
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
						<form class="form-horizontal" id="form" name="form"  action="${ctx}/weixinReceivedMsg/save" method="post">
						   
						     <input type="hidden" id="id" name="id"  value="${weixinReceivedMsg.id}"  />
						   
							<div class="form-group">
								<label class="col-sm-2 control-label">文本消息内容</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="content" id="content"  value="${weixinReceivedMsg.content}" 
										placeholder="请输入文本消息内容" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">发送方微信号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="fromUserName" id="fromUserName"  value="${weixinReceivedMsg.fromUserName}" 
										placeholder="请输入发送方微信号" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">接收方微信号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="toUserName" id="toUserName"  value="${weixinReceivedMsg.toUserName}" 
										placeholder="请输入接收方微信号" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息创建时间 （整型）</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="createTime" id="createTime"  value="${weixinReceivedMsg.createTime}" 
										placeholder="请输入消息创建时间 （整型）" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">状态（1=有效，-1已删）</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="status" id="status"  value="${weixinReceivedMsg.status}" 
										placeholder="请输入状态（1=有效，-1已删）" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">媒体ID</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="mediaId" id="mediaId"  value="${weixinReceivedMsg.mediaId}" 
										placeholder="请输入媒体ID" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">图片链接</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="picUrl" id="picUrl"  value="${weixinReceivedMsg.picUrl}" 
										placeholder="请输入图片链接" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">语音格式，如amr，speex等</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="format" id="format"  value="${weixinReceivedMsg.format}" 
										placeholder="请输入语音格式，如amr，speex等" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">收到的类型类型（文本text，图片image，语音voice，视频video，小视频shortvideo，地理位置location，链接link）</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="type" id="type"  value="${weixinReceivedMsg.type}" 
										placeholder="请输入收到的类型类型（文本text，图片image，语音voice，视频video，小视频shortvideo，地理位置location，链接link）" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">回复标题</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="title" id="title"  value="${weixinReceivedMsg.title}" 
										placeholder="请输入回复标题" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息链接</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="url" id="url"  value="${weixinReceivedMsg.url}" 
										placeholder="请输入消息链接" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息描述</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="description" id="description"  value="${weixinReceivedMsg.description}" 
										placeholder="请输入消息描述" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">消息ID</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="msgId" id="msgId"  value="${weixinReceivedMsg.msgId}" 
										placeholder="请输入消息ID" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">媒体缩略图ID</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="thumbMediaId" id="thumbMediaId"  value="${weixinReceivedMsg.thumbMediaId}" 
										placeholder="请输入媒体缩略图ID" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">地理位置维度</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="locationY" id="locationY"  value="${weixinReceivedMsg.locationY}" 
										placeholder="请输入地理位置维度" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">地理位置经度</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="locationX" id="locationX"  value="${weixinReceivedMsg.locationX}" 
										placeholder="请输入地理位置经度" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">地图缩放大小</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="scale" id="scale"  value="${weixinReceivedMsg.scale}" 
										placeholder="请输入地图缩放大小" />
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">地理位置信息</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="label" id="label"  value="${weixinReceivedMsg.label}" 
										placeholder="请输入地理位置信息" />
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
