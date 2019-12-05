<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>消息中心</title>
<link href="${ctx}/static/weixin/css/personalCenter/messageCenter.css" rel="stylesheet" />
<script type="text/javascript">
	/* 初始化 */
	$(function() {
		$("#proList").hide(); //隐藏暂无信息
		$('#tbox').hide(); //隐藏火箭
		$("#getMore").hide();//隐藏加载更多
		/* 异步加载消息中心*/
		pageNumber = 1;
		$('.pageNumber').val(1);
		getmessageList();
	})
	/* 异步加载消息中心列表 */
	function getmessageList() {
		   $.ajax({
					url : "${ctx}/personalCenter/json/messageNotification",
					type : "get",
					data : $('#form').serialize(),
					dataType : "json",
					success : function(result) {
						if (result.code == -1) {
							$("#proList").hide();
							layer.msg("获取数据失败");
						} else if (result.code == 2) {
							$("#proList").show();
							if (pageNumber == 1) {
								$(".message_dataBar").empty();
							}
						} else {
							var list = result.value;
							if (pageNumber == 1) {
								$(".message_dataBar").empty();
							}
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _divList = '<div class="message_data" onclick="view(\''
										+ info.msgId + '\');">';
								/*  _divList += '<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">';  */
								_divList += '<div class="message_cont">'
										+ info.msgTitle + '</div>';
								_divList += '<div class="message_time">'
										+ getTime(info.createTime) + '</div>';
								_divList += '</div><div style="clear:both;"></div>';
								$(".message_dataBar").append(_divList);
							}
							$("#proList").hide();
						}
						if(result.code!=1){
							$("#getMore").hide();
						}else{
							$("#getMore").show();
						}
					},
					error : function() {
						layer.alert("系统异常");
					}
				});
	}

	/* 全读、未读、已读 */
	function mesClick(mes) {
		$(".message_dataBar").empty();
		$(".message_oper").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(mes).addClass("selected");
		var v = $(mes).attr("value");
		if (v == 0) {
			$('#status').val('0');
		} else if (v == 1) {
			$('#status').val('1');
		} else {
			$('#status').val('');
		}
		pageNumber = 1;
		$('#pageNum').val(pageNumber);
		getmessageList();
	}

	/* 消息详情 */
	function view(msgId) {
		$('#detailsForm').attr("action",
				"${ctx}/personalCenter/weixin/messageView?msgId=" + msgId);
		$("#detailsForm").submit();
	}

	/* 加载更多 */
	function getMore() {
		pageNumber++;
		$('#pageNum').val(pageNumber);
		getmessageList();
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
		return (Y + "年" + M + "月" + D + "日");
	}
</script>
</head>
<body>
	<form id="form">
		<input type='hidden' name='pageNum' id='pageNum' value='1'></input> <input type='hidden' name='pageSize' id='pageSize' value='10'></input>
		<input type='hidden' name='status' id='status'></input>
	</form>
	<form id="detailsForm" action="" method="post">
		<input type='hidden' name='detailsType' value='"messageCenter"'></input> <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<div class="message_main">
		<div class="message_content" style="margin-bottom:55px;">
			<div class="message_operBar">
				<div style="width: 15%;" class="message_oper borRight selected" onClick="mesClick(this);">全部</div>
				<div style="width: 15%;" class="message_oper borRight" onClick="mesClick(this);" value="0">未读</div>
				<div style="width: 15%;" class="message_oper borRight" onClick="mesClick(this);" value="1">已读</div>
				<div style="width: 54%;" class="message_oper"></div>
				<div style="clear: both;"></div>
			</div>
			<div class="message_dataBar"></div>
			<div style="text-align: center; line-height: 30;">
				<span id="proList" class="renovateTitle" style="color: #646464;">暂无消息</span>
			</div>
			<div style="clear: both;"></div>
			
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
			
			<div id="tbox">
				<a id="gotop" href="#top"></a>
			</div>
		</div>
		<div class="fixed_bottom">
			<a href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a>
			<!-- <div class="bottom_operation" style="display:none;">
			<img src="images/phone.png" width="20px;" height="20px;"/>
			<span class="spanContral_1" style="color:#F14241;">公示结果</span>
		</div> -->
			<!-- <div class="bottom_operation" style="display:none;">
			<span class="spanContral_1 spanContral_2" style="color:#ABABAB;">活动已取消</span>
		</div> -->
			<!-- <div class="bottom_operation" style="display:none;">
			<img src="images/alreadyCollect.png" width="20px;" height="20px;"/>
			<span class="spanContral_1" style="color:#1B8ECD;">申报企业</span>
		</div> -->
			<!-- <div style="clear:both;"></div> -->
		</div>
	</div>
</body>
</html>