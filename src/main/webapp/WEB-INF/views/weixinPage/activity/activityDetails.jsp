<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>${projectActivityInfoBean.activityName}</title>
<link href="${ctx}/static/weixin/css/activity/activityDetails.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<style>
body .layui-layer-tl_black .layui-layer-title {
	background-color: #F04444;
	color: #fff;
}

body .layui-layer-tl_black .layui-layer-btn0 {
	background-color: #F04444;
	color: #fff;
	width: 100%;
	border: 0;
	padding: 5px 0;
	text-align: center;
	margin: 0;
}

body .layui-layer-btn .layui-layer-btn0 {
	border-color: #F04444;
	background-color: #F04444;
	color: #fff
}

body .layui-layer-title {
	padding: 0 80px 0 20px;
	height: 42px;
	line-height: 42px;
	border-bottom: 1px solid #eee;
	font-size: 14px;
	color: #fff;
	overflow: hidden;
	background-color: #F04444;
	border-radius: 2px 2px 0 0
}
</style>
<script>
	$(function() {
		//加载报名人数列表
		getEnterList(1);
		//加载评论
		getCommentList(1,"");
		//加载推荐活动
// 		getActivityList(1,1,"",'${projectActivityInfoBean.activityTags}');
		//加载活动状态
		getActivityStatus();
		
		$('#detailContent').height($('#detailContent')[0].scrollHeight);
		$('#detailContent').css("overflow","hidden");
		
// 		if($('#detailContent')[0].scrollHeight<200){
// 			$('#detailContent').height($('#detailContent')[0].scrollHeight);
// 			$('#detailContent').css("overflow","hidden");
// 		}else{
// 			$('#detailContent').height("200px");
// 			$('#detailContent').css("overflow","scroll");
// 		}
		$('#tbox').hide();
		
		var str=location.href;
		if(str.indexOf("main=1")!=-1){
			$("#back_a").attr("href","${ctx}/auth/page/mobile/weixin/projectActivity/weixin/activityMain");
		}
	});
	
	//获取报名用户头像列表
	function getEnterList(pageNum){
		$.ajax({
			url:"${ctx}/projectActivity/json/enterList",
			type:"get",
			data:{
				"pageNum":pageNum,
				"activityId":'${projectActivityInfoBean.activityId}'
			},
			dataType:"json",
			success:function(result){
				if(result.code==-1){
					layer.alert(result.msg);
				}else if(result.code==2){
					$("#enterList").append('<span class="renovateTitle">暂无人报名</span>');
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = '<div class="details_num">'
							+'<img src='+(info.imageUrl==undefined?'${ctx}/static/weixin/images/activity/headPortrait.png':info.imageUrl)+' width="34px;" height="34px;" style="border-radius:17px;">'
							+'</div>';
						$("#enterList").append(_div);
					}
					if(list.length>10){
						$('#getmoreNum').show();
					}else{
						$('#getmoreNum').hide();
					}
				}
			},
			error:function(){
				layer.alert("系统异常");
			}
		});
	}
	
	//展开收起报名用户头像列表
	function getmoreNum() {
		if($("#enterList").hasClass("enterList_hide")){
			$("#enterList").removeClass("enterList_hide");
			$("#showAndHide").text("收起");
		}else{
			$("#enterList").addClass("enterList_hide");
			$("#showAndHide").text("展开更多报名");
		}
	}
	
	//获取评论列表
	var commentCount = 0;
	function getCommentList(pageNum,commentAccount){
		$.ajax({
			url:"${ctx}/projectActivity/json/commentList",
			type:"get",
			data:{
					"pageNum":pageNum,
					"commentAccount":commentAccount,
					"activityId":'${projectActivityInfoBean.activityId}',
					"kind":201
				},
			dataType:"json",
			success:function(result){
				commentCount = result.msg==undefined?0:result.msg;
				if(result.code==-1){
					layer.alert(result.msg);
					$("#getmoreComment").hide();
				}else if(result.code==2){
					$("#commentList").append('<span class="renovateTitle">暂无更多信息</span>');
					$("#getmoreComment").hide();
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = '<div class="details_comCont"><div>'
							+'<img src="'+(info.imageUrl==undefined?'${ctx}/static/weixin/images/activity/headPortrait.png':info.imageUrl)+'" width="22px;" height="22px;" style="float: left;border-radius:11px;">'
							+'<div class="details_comName">'+info.commentUser+'</div>'
							+'<div class="details_comTime">'+info.comTime+'</div>'
							+'<div style="clear: both;"></div></div>'
							+'<div class="details_com">'+info.commentContent+'</div><div style="width:100%;height:15px;padding:0 0 5px 0;">';
						if(info.isCurComment=='true'){
							_div += '<a href="javascript:;" style="float:right; margin-left:10px;text-decoration:none;">'
								+'<span style="color:#9c9c9c;font-size:12px;" onclick="commentDelete(\''+info.commentId+'\')">删除</span>'
								+'</a>';
						}
						if(commentAccount==""||commentAccount==null){
							_div += '<a href="javascript:;" style="float:right;text-decoration:none;">'
								+'<img src="${ctx}/static/image/activity/replay.png" width="15px;" height="15px;" class="img_contral_t2">&nbsp;'
								+'<span style="color:#9c9c9c;font-size:12px;" onclick="commentReply(\''+info.commentId+'\',\''+info.commentUser+'\')">回复</span>'
								+'</a>';
						}	
						_div += '</div></div>';
						if(i<5){
							$("#commentList").append(_div);
						}else{
							$("#commentList_hide").append(_div);
						}
					}
					if(list.length>5){
						$("#getmoreComment").show();
					}else{
						$("#getmoreComment").hide();
					}
				}
				$("#commentSize").text(commentCount+"条评论");
			},
			error:function(){
				layer.alert("系统异常");
			}
		});
	}
	//展开收起更多评论
	function getmoreComment() {
		if($("#getmoreComment").text()=="展开更多评论"){
			$("#commentList_hide").show();
			$("#getmoreComment").text("收起");
		}else{
			$("#commentList_hide").hide();
			$("#getmoreComment").text("展开更多评论");
		}
	}
	
	
	//回复评论
	function commentReply(replyId,replayUser){
		//判断是否登录
		if(${empty curAccountId}){//未登录
			layer.msg("亲，您还没有登录");
			setTimeout(function() {
				window.location.href=("add/${projectActivityInfoBean.activityId}");
			}, 1000);
		}else{
			$("#commentMsg").val("回复"+replayUser+"：");
			$("#replyId").val(replyId);
			commentIndex=layer.open({
				type : 1,
				title : '回复评论',
	 			skin : 'layui-layer-tl_black',
				shadeClose : true,
				area : [ '250px', '220px' ],
				btn:'提交',
				closeBtn: 1,
				content : $('#inputComment'),
				yes: function(index, layero){
					commentSave("回复"+replayUser+"：");
				}
			});
		}
	}
	
	//删除评论
	function commentDelete(commentId){
		layer.confirm('确认删除？', function(){
			$.ajax({
				url:"${ctx}/projectActivity/json/commentDelete",
				type:"get",
				headers:{"token":'${pageContext.session.id}'},
				data:{
						"commentId":commentId
					},
				dataType:"json",
				success:function(result){
					if(result.code==1){
						layer.msg("删除成功");
						$("#commentList").empty();
						$("#commentList_hide").empty();
						getCommentList(1,$("#commentAccount").val());
					}else{
						layer.msg(result.msg);
					}
				},
				error:function(){
					layer.alert("系统异常");
				}
			});
		}, layer.close());
		
	}
	
	//获取活动列表(推荐)
// 	function getActivityList(pageNum,type,activityName,tags){
// 		$.ajax({
// 			url:"${ctx}/projectActivity/json/activityList",
// 			type:"post",
// 			data:{
// 					"pageNum":pageNum,
// 					"type":type,
// 					"activityName":activityName,
// 					"activityTags":tags,
// 					"status":1
// 				},
// 			dataType:"json",
// 			success:function(result){
// 				if(result.code==-1){
// 					layer.alert(result.msg);
// 				}else if(result.code==2){
// 					$(".activityBar").append('<span class="renovateTitle">暂无更多信息</span>');
// 				}else{
// 					var list = result.value;
// 					for(var i=0;i<list.length;i++){
// 						var info = list[i];
// 						var _div = '<div class="activity_cont" style="cursor:pointer;position:relative;" onclick="activityDetails(\''+info.activityId+'\')" style="cursor:pointer;"><div class="activity_title">'
// 						+ info.activityName
// 						+ '</div>'
// 						+ '<div class="activity_time">'
// 						+ info.start
// 						+ '至'
// 						+ info.end
// 						+ '</div>'
// 						+ '<img src='
// 						+ info.activityImage
// 						+ ' width="100%;" height="140px;"/>'
						
// 						+ '<div class="activity-tagBox" style="bottom:180px;">'
// 						+ '<i class="icon-bg"></i>' + '<ul>';
// 				var tag = info.activityTags.split(",");
// 				if (tag != "" && tag != null) {
// 					for (var j = 0; j < tag.length; j++) {
// 						if (tag[j] != "" && tag[j] != null) {
// 							_div += '<li>' + tag[j] + '</li>';
// 						}
// 					}
// 				}
// 				_div += '</ul>'
// 						+ '<div class="tag-bg"></div>'
// 						+ '</div>'
						
// 						+'<div class="activityCont_dataBar" style="margin-top:2%;">'
// 						+ '<div style="float:left;"><img src="${ctx}/static/weixin/images/activity/applyname.png" width="20px;" height="20px;"  style = "margin-right: 10px;" ></div>'
// 						+ '已有<span style="color:#F14241;">'
// 						+ info.enterCount + '</span>人报名'; 
// 						if (info.status == 1) {
// 							_div += '<div class="registrationIn" style = "text-align:center;">报名中</div>';
// 						} else {
// 							_div += '<div class="registrationIn hasEnded">已结束</div>';
// 						}
// 						_div += '<div style="clear:both;"></div></div>';
// 						$(".activityBar").append(_div);
// 					}
// 					$(".activityBar").append('<div style="clear:both;"></div>');
// 				}
// 				if(result.code==1){
// 					$("#getMore").show();	
// 				}else{
// 					$("#getMore").hide();	
// 				}
// 			},
// 			error:function(){
// 				layer.alert("系统异常");
// 			}
// 		});
// 	}
// 	var pageNum = 1;
// 	function getMore(){
// 		pageNum = pageNum+1;
// 		getActivityList(pageNum,1,"",'${projectActivityInfoBean.activityTags}');
// 	}
	
	//推荐活动详情
// 	function activityDetails(activityId) {
// 		window.location.href='${ctx}/projectActivity/weixin/detail/'+activityId;
// 	}
	
	//报名取消报名
	function enterSave(){
		//判断是否登录
		if(${empty curAccountId}){//未登录
			layer.msg("亲，您还没有登录");
			setTimeout(function() {
				window.location.href=("add/${projectActivityInfoBean.activityId}");
			}, 1000);
		}else{
			var activityId = '${projectActivityInfoBean.activityId}';
			$.ajax({
				url:"${ctx}/projectActivity/json/enterSave",
				type:"get",
				data:{
						"activityId":activityId
					},
				dataType:"json",
				success:function(result){
					layer.msg(result.msg);
					var enterCount = $("#enterCount").text();
					if(result.code==1){
						$("#enterCount").text(Number($("#enterCount").text())+1);
						$("#enterList").empty();
						num=0;
						getEnterList(1);
					}else if(result.code==2){
						$("#enterCount").text(Number($("#enterCount").text())-1);
						$("#enterList").empty();
						num=0;
						getEnterList(1);
					}
					if(result.code!=-1){
						$('#statusBtn_1').css('display',result.code==1? "block" : "none");
						$('#statusBtn_2').css('display',result.code==2? "block" : "none");
						$('#statusBtn_3').css('display',result.code==3? "block" : "none");
					}
				},
				error:function(){
					layer.alert("系统异常");
				}
			});
		}
	}

	function sendComment(){
		//判断是否登录
		if(${empty curAccountId}){//未登录
			layer.msg("亲，您还没有登录");
			setTimeout(function() {
				window.location.href=("add/${projectActivityInfoBean.activityId}");
			}, 1000);
		}else{
			$("#commentMsg").val("");
			commentIndex=layer.open({
				type : 1,
				title : '评论留言',
	 			skin : 'layui-layer-tl_black',
				shadeClose : true,
				area : [ '250px', '220px' ],
				btn:'提交',
				closeBtn: 1,
				content : $('#inputComment'),
				yes: function(index, layero){
					commentSave();
				}
			});
		}
	}
	
	//发送评论
	function commentSave(regStr){
		var commentContent = $("#commentMsg").val();
		if(commentContent == null ||commentContent == ""){
			layer.msg("评论内容不能为空");
			return;
		}
		if(commentContent.replace(regStr,"").replace(/\s/g,"")==""){
			layer.msg("评论内容必须包含可见字符");
			return;
		}
		var replyId = $("#replyId").val();
		$.ajax({
			url:"${ctx}/projectActivity/json/commentSave",
			type:"get",
			data:{
					"commentContent":commentContent,
					"replyId":replyId,
					"activityId":'${projectActivityInfoBean.activityId}',
					"kind":201
				},
			headers:{"token":'${pageContext.session.id}'},
			dataType:"json",
			success:function(result){
				if(result.code==1){
					layer.close(commentIndex);
					layer.msg("发布成功", {
						time: 1000
					}, function(){setTimeout(function(){
						$("#commentList").empty();
						$("#commentList_hide").empty();
						comment=0;
						commentCount++;
						getCommentList(1,"");
					},1000);});
				}else{
					layer.alert(result.msg);
				}
			},
			error:function(){
				layer.alert("系统异常");
			}
		});
	}
	
	//加载活动状态
	function getActivityStatus(){
		$('#statusBtn_1').css('display',${projectActivityInfoBean.status==1 && isEnter=='true'}? "block" : "none");
		$('#statusBtn_2').css('display',${projectActivityInfoBean.status==1 && isEnter=='false'}? "block" : "none");
		$('#statusBtn_3').css('display',${projectActivityInfoBean.status!=1}? "block" : "none");
	}
	
</script>
</head>

<body>
	<!-- 活动详情正文 -->
	<div class="details_main">
		<input type="hidden" id="replyId" />

		<div class="details_content" style="position: relative;">
			<img src="${projectActivityInfoBean.activityImage}" width="100%;" height="180px;" style="display: block;">
			<div class="activity-tagBox" style="top: -10px; right: 0;">
				<i class="icon-bg"></i>
				<ul>
					<c:forEach items="${projectActivityInfoBean.activityTags}" var="index">
						<li>${index}</li>
					</c:forEach>
				</ul>
				<div class="tag-bg"></div>
			</div>
			<div class="details_info">
				<div class="details_title">${projectActivityInfoBean.activityName}</div>
				<div class="details_dataBar" style="color: #646464; font-size: 15px;">
					<!-- 					<div> -->
					<%-- 						<img src="${ctx}/static/weixin/images/activity/label.png" width="12px;" height="12px;">&nbsp; <span> <c:forEach --%>
					<%-- 								items="${projectActivityInfoBean.activityTags}" var="index"> --%>
					<%-- 								${index}&nbsp; --%>
					<%-- 							</c:forEach> --%>
					<!-- 						</span> -->
					<!-- 					</div> -->
					<div>
						<img src="${ctx}/static/weixin/images/activity/time.png" width="12px;" height="12px;">&nbsp; <span> <fmt:formatDate
								value="${projectActivityInfoBean.startTime}" pattern="yyyy-MM-dd HH:mm" />&nbsp;至 <fmt:formatDate
								value="${projectActivityInfoBean.endTime}" pattern="yyyy-MM-dd HH:mm" />
						</span>
					</div>
					<div>
						<img src="${ctx}/static/weixin/images/activity/location.png" width="12px;" height="12px;">&nbsp; <span>${projectActivityInfoBean.activityLocation}</span>
					</div>
				</div>

				<!-- 参加活动用户头像 -->
				<div class="details_human">
					<div>
						<img src="${ctx}/static/weixin/images/activity/applyname.png" width="17px;" height="17px;"
							style="position: relative; top: 3px;">&nbsp; <span>已有<span id="enterCount" style="color: #F14241">${projectActivityInfoBean.enterCount}</span>人报名
						</span>
					</div>
					<div class="details_more">
						<div id="enterList" class="enterList_hide"></div>
						<div style="clear: both;"></div>
						<div id="getmoreNum" style="text-align: center;">
							<a href="javascript:void(0);" onClick="getmoreNum();" class="renovate" style="border: 0;"> <span id="showAndHide"
								class="renovateTitle">展开更多报名</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="info_top">
				<div class="info_title">活动详情</div>
			</div>
			<div class="details_cont">
				<textarea id="detailContent" style="width: 100%; background: #FFF; border: 0;" disabled="disabled">${projectActivityInfoBean.activityDescription}</textarea>
			</div>
			<div class="details_comment" style="margin-top: 10px;">

				<!-- 评论列表 -->
				<div class="details_comTitle">
					相关评论
					<div style="float: right; font-size: 12px; color: #9c9c9c; padding-top: 3px;">
						<img src="${ctx}/static/image/activity/comment.png" width="20px;" height="16px;"> <span id="commentSize">0条评论</span>
					</div>
				</div>

				<div id="commentList"></div>
				<div id="commentList_hide" style="display:none;"></div>
				<div style="clear: both;"></div>
				<div>
					<a class="renovate" style="border: 0; display: block;"> <span id="getmoreComment" onClick="getmoreComment();"
						class="renovateTitle" style="color: #FD7676; border: 1px solid #FD7676; margin: 0 7px 5px 0; padding: 3px 7px;">展开更多评论</span>
					</a>
				</div>
			</div>
			<!-- 			<div class="info_top"> -->
			<!-- 				<div class="info_title" style="width: 30%; left: 35%;">相关活动推荐</div> -->
			<!-- 			</div> -->

			<!-- 推荐活动 -->
			<!-- 			<div class="activityBar"></div> -->
			<!-- 			<div id="getMore" style="margin: 0 1.6% 10px;"> -->
			<!-- 				<a href="javascript:void(0);" onclick="getMore();" class="renovate" style="display: block;"> <span class="renovateTitle">加载更多</span> -->
			<!-- 				</a> -->
			<!-- 			</div> -->

			<div id="tbox">
				<a id="gotop" href="#top"></a>
			</div>
		</div>
	</div>

	<!-- 底部工具栏 -->
	<div class="fixed_bottom" style="z-index: 1000;">
		<a id="back_a" href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;"
			height="20px;" class="returnBtn" />
		</a>
		<div id="enterSave" class="bottom_operation" onclick="enterSave();">
			<div id="statusBtn_1" style="display: none;">
				<img id="statusImg" src="${ctx}/static/weixin/images/activity/delete.png" width="12px;" height="12px;"
					style="padding: 5px 3px 3px 5px;" /> <span id="statusTitle" class="spanContral_1"
					style="color: #F14241; position: relative; bottom: 16px;">取消报名</span>
			</div>
			<div id="statusBtn_2" style="display: none;">
				<img id="statusImg" src="${ctx}/static/weixin/images/activity/apply.png" width="20px;" height="20px;" /> <span id="statusTitle"
					class="spanContral_1" style="color: #F14241; position: relative; bottom: 16px;">我要报名</span>
			</div>
			<div id="statusBtn_3" style="display: none;">
				<div>&nbsp;</div>
				<span class="spanContral_1" style="color: #cccccc; position: relative; bottom: 8px;" onclick="event.cancelBubble = true;">活动已结束</span>
			</div>
		</div>
		<div class="bottom_operation" onclick="sendComment();">
			<img src="${ctx}/static/weixin/images/activity/newmessage.png" width="20px;" height="20px;" /> <span class="spanContral_1"
				style="color: #636363; position: relative; bottom: 16px;">评论留言</span>
		</div>
		<div style="clear: both;"></div>
	</div>


	<!-- 报名(取消报名)成功提示框 -->
	<div id="successLayer" style="display: none; text-align: center; padding: 10px 15px;">
		<div style="font-size: 12px;">
			<div id="signUpMsg">报名成功！</div>
			<div>
				<span id="seconds">3</span>秒后自动关闭
			</div>
		</div>
	</div>

	<!-- 评论留言输入框 -->
	<div id="inputComment" style="display: none; padding: 15px 20px; position: fixed; overflow: hidden;">
		<textarea id="commentMsg" style="width: 200px; height: 90px; outline: none; resize: none"></textarea>
	</div>

</body>
</html>
