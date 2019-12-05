  
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
		window.location.href="${ctx}/weixinConfigReply/list";
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
						     <input type="hidden" id="replyId" name="replyId"  value="${weixinConfigReply.replyId}"  />
							<div class="form-group">
								<label class="col-sm-2 control-label">输入语（为空表示匹配任何输入语）</label>
								<div class="col-sm-10">
${weixinConfigReply.inputWord}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">备用字段2</label>
								<div class="col-sm-10">
${weixinConfigReply.remark2}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">回复内容</label>
								<div class="col-sm-10">
${weixinConfigReply.replyWord}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建时间</label>
								<div class="col-sm-10">
${weixinConfigReply.createTime}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人</label>
								<div class="col-sm-10">
${weixinConfigReply.createUser}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">附件（声音图片视频）url</label>
								<div class="col-sm-10">
${weixinConfigReply.replyAttachment}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
${weixinConfigReply.remark}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">状态</label>
								<div class="col-sm-10">
${weixinConfigReply.status}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">类型（NewsMsg,TextMsg）</label>
								<div class="col-sm-10">
${weixinConfigReply.type}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">回复标题</label>
								<div class="col-sm-10">
${weixinConfigReply.title}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">图片地址</label>
								<div class="col-sm-10">
${weixinConfigReply.picUrl}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">关注时是否显示</label>
								<div class="col-sm-10">
${weixinConfigReply.showSubscribe}								</div>
							</div>
							 <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">排序</label>
								<div class="col-sm-10">
${weixinConfigReply.showSubscribeOrder}								</div>
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
