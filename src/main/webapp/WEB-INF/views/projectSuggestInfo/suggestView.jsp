<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目详情</title>
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

$(function(){
	getAtts('${projectSuggestInfo.attachmentId}');
});

//附件下载
function getAtts(attIdList){
	 $.ajax({
			url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
			type:'get',
			data:{'attachmentIdList':attIdList},
			dataType:'json',
			success:function(data){
				var value = JSON.parse(data).attachments;
				if(value==null||value==""){
					$("#attr").hide();
				}
				
				for(var i = 0;i<value.length;i++){
					$('#attList').append(
							 "<li><a href='"+value[i].downloadUrl+"' target='_blank'>"+value[i].remoteName+"</a></li>"
							);
				}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
}

//返回
function returnBtn(){
	window.history.go(-1);
}
</script>

</head>

<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>项目详情</h5> 
					</div>
					<div class="ibox-content">
						<form class="form-horizontal" id="form">
							  <div class="form-group">
								<label class="col-sm-2 control-label">建议主题</label>
								<div class="col-sm-10" style="padding-top: 7px;">
									${projectSuggestInfo.suggestTitle}	
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">建议人名称</label>
								<div class="col-sm-10" style="padding-top: 7px;">
									${projectSuggestInfo.accountName}	
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">建议人联系电话</label>
								<div class="col-sm-10" style="padding-top: 7px;">
									${projectSuggestInfo.accountTel}	
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">建议内容</label>
								<div class="col-sm-10" style="padding-top: 7px;">
									${projectSuggestInfo.suggestContent}	
								</div>
							</div> 
							
							<div class="hr-line-dashed"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">创建时间</label>
								<div class="col-sm-4" style="padding-top: 7px;">
								<fmt:formatDate value="${projectSuggestInfo.createTime}"
												pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</div>

                           <c:if test="${projectSuggestInfo.attachmentId != null }">
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">附件</label>
								<div class="col-sm-10">
									<div style="float: left;" style="padding-top: 7px;">
									 <div style="margin-top:20px;" id="attr"> </div>
								      <div class="detailsDataRight" id="attList"></div>
							          </div>
								</div>
							</div>
                            </c:if>

                    <c:if test="${projectSuggestInfo.managerId!=null}">
                    <c:if test="${projectSuggestInfo.replyContent != null}">
                          <div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">回复内容</label>
								<div class="col-sm-4" style="padding-top: 7px;">
								${projectSuggestInfo.replyContent}
								</div>
							</div>
							</c:if>
							
						<c:if test="${projectSuggestInfo.rewardContent !=null}">
						<div class="hr-line-dashed"></div> 
                          <div class="form-group">
								<label class="col-sm-2 control-label">奖励内容</label>
								<div class="col-sm-4" style="padding-top: 7px;">
								${projectSuggestInfo.rewardContent}
								</div>
							</div>
						</c:if>	
							 <div class="hr-line-dashed"></div> 
							<div class="form-group">
								<label class="col-sm-2 control-label">审核时间</label>
								<div class="col-sm-4" style="padding-top: 7px;">
								<fmt:formatDate value="${projectSuggestInfo.auditTime}"
												pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</div>
                           <div class="hr-line-dashed"></div> 
                            <div class="form-group">
								<label class="col-sm-2 control-label">采纳状态</label>
								<div class="col-sm-4" style="padding-top: 7px;">
								${projectSuggestInfo.status==1?"已采纳":"未采纳"}
								</div>
							</div>
                          
                          </c:if>
                    
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