<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>详情</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/static/css/page.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
</head>
<body class="gray-bg">

	<div class="row">
		<form action="${ctx}/projectActivityComment/save" id="editform"
			name="editform" method="post">
			<input
				type="hidden" id="replyAccount" name="replyAccount" value="" /> <input
				type="hidden" id="replayUser" name="replayUser" value="" /> <input
				type="hidden" id="replyId" name="replyId" value="" />
			<div class="col-sm-12">
				<textarea class="form-control message-input" placeholder="输入消息内容"
					name="commentContent" id="commentContent"></textarea>
				<br /> <a class="btn btn-primary btn-xs"
					style="position: absolute; right: 10px; bottom: -10px;"
					onclick="saveComment()">发布</a>
			</div>
		</form>
		<br />
		<hr />
		<div class="col-sm-12">
			<div class="panel-heading">
				<div class="panel-options">
					<ul class="nav nav-tabs">
						<li><a href="javascript:void(0)" data-toggle="tab"
							id="viewTable1" onclick="commentType('')">全部评论</a></li>
						<li class=""><a href="javascript:void(0)" data-toggle="tab" onclick="commentType('${currentAccount}')">我的评论</a></li>
					</ul>
				</div>
			</div>


			<form action="${ctx}/projectActivityComment/list" id="listform"
				name="listform" method="post">
				<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />
				<input type="hidden" id="commentAccount" name="commentAccount" value="${commentAccount}" />
				<div class="panel-body">
					<div class="tab-content">
						<div class="tab-pane active" id="tab-1">
							<div class="feed-activity-list" id="commentList">
								<c:forEach items="${page}" var="info">
									<div class="feed-element">
										<a href="profile.html#" class="pull-left"> <img
											alt="image" class="img-circle" src="img/a2.jpg">
										</a>
										<div class="media-body ">
											<small class="pull-right"> <fmt:formatDate
													value="${info.commentTime}" pattern="yyyy-MM-dd" />
											</small> <strong> ${info.commentUser} </strong> <br>
											<div class="well">${info.commentContent}</div>
											<div class="pull-right">
												<c:if test="${info.commentAccount!=currentAccount}">
													<a class="btn btn-xs btn-primary"
														onclick="replyComment('${info.commentId}','${info.commentAccount}','${info.commentUser}')"><i
														class="fa fa-pencil"></i> 回复</a>
												</c:if>
												<c:if test="${info.commentAccount==currentAccount}">
													<a class="btn btn-xs btn-primary"
														onclick="deleteComment('${info.commentId}')"><i
														class="fa fa-pencil"></i> 删除</a>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div style="height: 95px; width: 100%;">
								<c:if test="${totalPages>0}">
									<table width="100%" align="left" style="background: #f5f5f5;">
										<tr>
											<td align="left"><span class="pagetip">共检索到${pageTotal}条数据，每页${pageSize}条</span></td>
											<td align="right"><%@ include file="../common/page.jsp"%></td>
										</tr>
									</table>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</form>


		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			var msg = '${message}';
			if (msg != null && msg != "") {
				layer.alert(msg);
				msg = null;
			}
		})

		function replyComment(id, account, user) {
			$("#commentContent").val("回复" + user + ":");
			$("#replyAccount").val(account);
			$("#replayUser").val(user);
			$("#replyId").val(id);
		}

		function saveComment() {
			$("#editform").submit();
		}

		function deleteComment(commentId) {
			window.location.href="${ctx}/projectActivityComment/delete?commentId="+commentId;
		}
		
		function commentType(currentAccount){
			$("#commentAccount").val(currentAccount);
			$("#listform").submit();
		}
	</script>
</body>
</html>