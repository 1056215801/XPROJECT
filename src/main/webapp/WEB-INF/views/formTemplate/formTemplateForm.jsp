<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建/编辑</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.btn-success {
	background: orange;
}
</style>
</head>

<body class="gray-bg">
	<input type="hidden" id="requireCode" value="0" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>创建表单</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
							<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#"> <i class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="form_basic.html#">选项1</a></li>
								<li><a href="form_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i></a>
						</div>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal" action="${ctx}/formTemplate/save" id="form">
							<input name="pageNum" value="${pageNum}" type="hidden">
							<input name="id" value="${formTemplate.id}" type="hidden">
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">表单名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="formName" value="${formTemplate.formName}" 
										placeholder="请输入表单名称" />
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">所属业务类型</label>
								<div class="col-sm-10" id="require">
									<select class="form-control m-b" name="relationType" id="relationType">
										<option value="">请选择</option>
                                        <option value="1" ${formTemplate.relationType=='1'?'selected':''}>活动</option>
                                        <option value="2" ${formTemplate.relationType=='2'?'selected':''}>项目申报</option>
                                    </select>
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">表单描述</label>
								<div class="col-sm-10">
									<textarea id="formDesc" name="formDesc" placeholder="请输入表单相关描述" class="form-control" style="height: 100px;">${formTemplate.formDesc}</textarea>
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">查看页面URL</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="showUrl" value="${formTemplate.showUrl}" 
										placeholder="请输入查看页面URL" />
								</div>
							</div>
							 
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">编辑页面URL</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="editUrl" value="${formTemplate.editUrl}" 
										placeholder="请输入编辑页面URL" />
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<textarea id="description" name="brief" placeholder="请输入备注" class="form-control" style="height: 100px;">${formTemplate.brief}</textarea>
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">状态</label>
								<div class="col-sm-10" id="require">
									<select class="form-control m-b" name="statusFlag" id="statusFlag">
                                        <option value="1" ${formTemplate.statusFlag==1?'selected':''}>有效</option>
                                        <option value="0" ${formTemplate.statusFlag==0?'selected':''}>无效</option>
                                    </select>
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" id="saveBtn">发布</button>
									<button class="btn btn-white" id="cancelBtn">取消</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
	<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script>
	<script src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
	<script>
		$(function() {
			//提交返回按钮
			$("#saveBtn").click(function() {
				$("#form").submit();
			});

			$("#cancelBtn").click(function() {
				$("#form").attr("action","${ctx}/formTemplate/list").submit();
				return false;
			});
		});
	</script>
</body>
</html>
