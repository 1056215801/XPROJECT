<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>问题详情</title>
<link href="${ctx}/static/weixin/css/investigation/questionDetails.css" rel="stylesheet" />
</head>
<script type="text/javascript">
	$(function(){
		/* 获取post参数 */		
		<%String surveyId = request.getParameter("surveyId");%> 
		<%String inputId = request.getParameter("inputId");%> 
		
		/* cookie缓存参数 */
		if(<%=surveyId%>!=null && <%=inputId%>!=null){
			document.cookie="surveyId=<%=surveyId%>";
			document.cookie="inputId=<%=inputId%>";
		}
		surveyId = document.cookie.split(";")[0].split("=")[1];
		inputId = document.cookie.split(";")[1].split("=")[1];
		getQuestionDetails(surveyId, inputId, 1);
		
	})

	/* 异步获取问题详情 */
	pageNumber = 1;
	function getQuestionDetails(surveyId, inputId, pageNum) {
		$.ajax({
			url : "${ctx}/investigation/json/getQuestionItemForWx",
			type : "get",
			data : {
				"pageNum" : pageNum,
				"id" : surveyId,
				"inputId" : inputId,
				"pageSize" : 10
			},
			dataType : "json",
			success : function(result) {
				var list = result.value;
				if (result.code == 1 || result.code == 0) {
					if (list != null && list.length > 0) {
						$('#questionTitle').html(
								list[0].sortGrade + '、' + list[0].inputTitle);
					}
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var _div = "";
						_div += "<div class=\'question_reply\'>";
						_div += "  <div style=\'margin: 0 10px;\'>";
						_div += "    <div class=\'question_replyPeople\'>";
						_div += "      <div style=\'float: left\'>"
								+ info.accountId + "</div>";
						_div += "      <div style=\'float: right;\'>"
								+ getTime(info.createTime) + "</div>";
						_div += "      <div style=\'clear: both;\'></div>";
						_div += "    </div>";
						_div += "    <div class=\'question_replyCont\'>"
								+ (info.inputValue==null?"&nbsp;":info.inputValue) + "</div></div>";
						_div += "</div>";
						$('#questionList').append(_div);
					}
				} else {
					layer.msg("获取数据失败");
				}
				if (result.code != 1) {
					$('#getMore').hide();
				} else {
					$('#getMore').show();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("网络异常");
			}
		});
	}

	/* 加载更多 */
	function getMore() {
		pageNumber++;
		getQuestionDetails(surveyId, inputId, pageNumber);
	}
	
	/* 年月日转换方法*/
	function getTime(time) {
		var date = new Date(time);
		Y = date.getFullYear();
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1);
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y + "-" + M + "-" + D + "- " + h + m + s);
	}
</script>
<body>
	<div class="question_main">
		<div class="question_content">
			<!-- 问题标题 -->
			<div class="question_cont" id="questionTitle"></div>
			<!-- 回答详情 -->
			<div id="questionList"></div>
			
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		</div>
		
		<!-- 小火箭 -->
		<div id="tbox" onclick="location.href='#top';"></div>
		
		<!-- 返回前页 -->
		<a href="javascript:history.back(-1);"> <img src="${ctx}/static/weixin/images/investigation/return.png" width="40px"
			height="40px" style="position: fixed; top: 3px; right: 5px;">
		</a>
	</div>
</body>
</html>
