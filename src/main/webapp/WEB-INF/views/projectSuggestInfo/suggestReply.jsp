<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>意见审核</title>
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
//选择未采纳时 隐藏回复内容和奖励内容
function statusNo(){
	$("#reply").hide();
	$("#reward").hide();	
}

function statusYes(){
	$("#reply").show();
	$("#reward").show();	
}
</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>意见审核</h5>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal" id="inputForm"  method="post" action="${ctx}/projectSuggestInfo/saveReply">
						<input type="hidden" id="suggestId" name="suggestId" value="${projectSuggestInfoBean.suggestId}"/>
							  <div class="form-group">
								<label class="col-sm-2 control-label">建议主题</label>
								<div class="col-sm-10" style="padding-top: 7px;">
									${projectSuggestInfoBean.suggestTitle}	
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建议人名称</label>
								<div class="col-sm-10" style="padding-top: 7px;">
									${projectSuggestInfoBean.accountName}	
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建议内容</label>
								<div class="col-sm-10" style="padding-top: 7px;">
									${projectSuggestInfoBean.suggestContent}	
								</div>
							</div> 
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建议人联系方式</label>
								<div class="col-sm-10" style="padding-top: 7px;">
									${projectSuggestInfoBean.accountTel}	
								</div>
							</div>
							<div class="hr-line-dashed"></div>

	                    <c:if test="${projectSuggestInfoBean.status == 2 }">
							<div class="form-group">
							  <label class="col-sm-2 control-label">是否采纳</label>
							  <div class="col-sm-10">
							  <div class="radio i-checks" style="padding-top: 7px;">
							  <label>
							  <input type="radio" name="status" value="1" checked="checked" onclick="statusYes()">是
							  </label>
							  <label>
							  <input type="radio" name="status" value="0" onclick="statusNo()">否
							  </label>
							  </div>
							 </div>
							</div> 
						</c:if>	
                              
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建时间</label>
								<div class="col-sm-4" style="padding-top: 7px;">
			<fmt:formatDate value="${projectSuggestInfoBean.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</div>
							
					<c:if test="${projectSuggestInfoBean.attachmentId != null}">
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">附件</label>
								<div class="col-sm-10">
									<div style="float: left;" style="padding-top: 7px;">
									    <div style="margin-top:20px;" id="attr"> 
								        <div class="detailsDataRight" id="attList"></div>
							            </div>
									</div>
								</div>
							</div>
					</c:if>		

                            <div id="reply">
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">回复内容</label>
								<div class="col-sm-10" style="padding-top: 7px;">
<textarea id="replyContent" name="replyContent" class="form-control" style="width: 80%; height: 100px;" cols="100" rows="8" maxlength="250">${projectSuggestInfoBean.replyContent}</textarea>
			                 </div>
							</div>
							</div>
							
							<div id="reward">
							<div class="hr-line-dashed"></div>
							<div class="form-group" >
								<label class="col-sm-2 control-label">奖励内容</label>
								<div class="col-sm-10" style="padding-top: 7px;">
<textarea id="rewardContent" name="rewardContent" class="form-control" style="width: 80%; height: 100px;" cols="100" rows="8" maxlength="250">${projectSuggestInfoBean.rewardContent}</textarea>
								</div>
							</div>
				           </div>
				           
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2"> 
									<input type="button" class="btn btn-primary" id="okbtn" value="发布"/>
									<input type="button" class="btn btn-white" onclick="returnBtn()" value="返回">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>

$(function(){
	getAtts('${projectSuggestInfoBean.attachmentId}');
	
	//发布
	$("#okbtn").click(function(){
		
	 if($("#replyContent").is(":hidden") || $("#rewardContent").is(":hidden")){
		 $("input[type='button']").attr("disabled" ,"disabled");
			var f = document.getElementById("inputForm");		
			f.action = "${ctx}/projectSuggestInfo/saveReply";
			f.submit();
			return false;
	 }else{
		 /* 设置所填项不能为空  */
			/* if ($('#replyContent').val() == "" || $('#replyContent').val() == null){alert("请输入回复内容");return false;} */
			if ($('#rewardContent').val() == ""|| $('#rewardContent').val() == null){alert("请输入奖励内容");return false;}
		 $("input[type='button']").attr("disabled" ,"disabled");
			var f = document.getElementById("inputForm");		
			f.action = "${ctx}/projectSuggestInfo/saveReply";
			f.submit();
			return false;
	 }	
	
	});
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

	
//取消
function returnBtn(){
window.history.go(-1);
}
</script>	
</body>
</html>