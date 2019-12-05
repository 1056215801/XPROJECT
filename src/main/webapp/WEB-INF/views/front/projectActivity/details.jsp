<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${projectActivityInfoBean.activityName}</title>
<link href="${ctx}/static/css/activity/activityDetails.css" rel="stylesheet"/>
<link href="${ctx}/static/css/activity/layer.css" rel="stylesheet"/>
<style type="text/css">
body .reportBar{border-radius:10px!important;}

.end{
	background-color: #CCC;
}

.icon-bg {
   	background: url(${ctx}/static/image/activity/activityTags.png) no-repeat;
   	background-size:14px 14px;
}

.returnBtn {
	width:100px;
	border:1px solid #E6E6E6;
	background-color:#F2F2F2;
	color:#000;
	padding:4px 0;
	margin-right:5px;
	float:right;
}
.sendBtn {
	width:100px;
	border:1px solid #F04444;
	background-color:#F04444;
	color:#fff;
	padding:4px 0;
	margin-right:15px;
	float:right;
}
.hidden{
	display: none;
}
</style>

</head>

<body>
<div class="details_main">
	<input type="hidden" id="pageNum1" value="1"/>
	<input type="hidden" id="pageNum2" value="1"/>
	<input type="hidden" id="pageNum3" value="1"/>
	<input type="hidden" id="replyId" />
	<input type="hidden" id="commentType" value="1"/>
	<div class="project_header">
		<%@ include file="../common/header.jsp"%>
		
	</div>
	
	<div class="details_content">
		<div class="details_header">
			<div style="position: relative;">
			<img src="${projectActivityInfoBean.activityImage}" width="720px;" height="370px;" style="float:left;"><!-- width="65%;"height="32%"; -->
			<div class="activity-tagBox">
				<i class="icon-bg"></i>
				<ul>
					<c:forEach items="${projectActivityInfoBean.activityTags}" var="index">
						<li>${index}</li>
					</c:forEach>
				</ul>
				<div class="tag-bg"></div>
			</div>
			</div>
			<div class="details_headerRight">
				<div class="right_title">${projectActivityInfoBean.activityName}</div>
				<div class="right_dataBar">
					<div class="right_data">
						<img src="${ctx}/static/image/activity/activityTags.png" width="12px;" height="12px;" class="img_contral_t2">&nbsp;
						<span>
							<c:forEach items="${projectActivityInfoBean.activityTags}" var="index">
								${index}&nbsp;
							</c:forEach>
						</span>
					</div>
					<div class="right_data">
						<img src="${ctx}/static/image/activity/time.png" width="12px;" height="12px;" class="img_contral_t2">&nbsp;
						<span>
							<fmt:formatDate value="${projectActivityInfoBean.startTime}" pattern="yyyy-MM-dd HH:mm"/>&nbsp;至 
							<fmt:formatDate value="${projectActivityInfoBean.endTime}" pattern="yyyy-MM-dd HH:mm"/>
						</span>
					</div>
					<div class="right_data">
						<img src="${ctx}/static/image/activity/location.png" width="12px;" height="12px;" class="img_contral_t2">&nbsp;
						<span>${projectActivityInfoBean.activityLocation}</span>
					</div>
					<div class="right_data">
						<img src="${ctx}/static/image/activity/enterCount.png" width="12px;" height="12px;" class="img_contral_t2">&nbsp;
						<span>已报名人数：<span style="color:#F14241" id="enterCount" class="enterCount">${projectActivityInfoBean.enterCount}</span>人</span>
					</div>
				</div>
				<a href="javascript:;" class="right_input" onclick="enterSave(this)">
					<c:choose>
							<c:when test="${projectActivityInfoBean.status==1}">
								<c:if test="${isEnter==true}"><span style="color:#fff;" id="enter">取消报名</span></c:if>
								<c:if test="${isEnter==false}"><span style="color:#fff;" id="enter">活动报名</span></c:if>
							</c:when>
							<c:otherwise><span style="color:#fff;" id="enter">活动结束</span></c:otherwise>
					</c:choose>	
					
				</a>
				<div class="right_oper">
					<div style="float:left;">
						<img src="${ctx}/static/image/activity/complain.png" width="15px;" height="15px;" class="img_contral_t3">
						<span class="font12" onclick="reportBar()" style="cursor:pointer;">举报该活动</span>
					</div>
					
					<div id="reportBar" style="display:none; padding:14px 20px 10px;">
						<div>
							<div style="float:left; text-align:left; width:90px;"><input type="checkbox" class="selected" value="色情" onclick="getSubmitContent(this)"/>色情</div>
							<div style="float:left; text-align:left; width:90px;"><input type="checkbox" class="selected" value="欺诈" onclick="getSubmitContent(this)"/>欺诈</div>
							<div style="float:left; text-align:left; width:90px;"><input type="checkbox" class="selected" value="反动政治" onclick="getSubmitContent(this)"/>反动政治</div>
							<div style="float:left; text-align:left; width:90px;"><input type="checkbox" class="selected" value="谩骂骚扰" onclick="getSubmitContent(this)"/>谩骂骚扰</div>
							<div style="float:left; text-align:left; width:90px;"><input type="checkbox" class="selected" value="伪造他人" onclick="getSubmitContent(this)"/>伪造他人</div>
							<div style="float:left; text-align:left; width:90px;"><input type="checkbox" class="selected" value="恶意" onclick="getSubmitContent(this)"/>恶意</div>
							<div style="float:left; text-align:left; width:90px;"><input type="checkbox" class="selected" value="其他" onclick="getSubmitContent(this)"/>其他</div>
						</div>
						<div style="margin-top:5px;">
							<textarea rows="4" style="width:355px;" id="submitContent" name="submitContent"></textarea>
							<span>（字数100以内）</span>
						</div>
						<div style="padding:10px 5px;">
							<input type="button" value="发送" onclick="sendBtn()" class="sendBtn" style="cursor:pointer;">
							<input type="button" value="关闭" onclick="returnBtn()" class="returnBtn" style="cursor:pointer;">
							<div style="clear:both;"></div>
						</div>
					</div>
					
					<div style="float:right;">
						<span class="font12 span_contral_t-3" style="position:relative; top:-3px;"> </span>
						<a title="分享给QQ好友" onclick="shareToQQFriend(event,'活动')" href="javascript:;">
							<img src="${ctx}/static/image/qq.png" style="margin-left:5px;">
						</a>
						<a title="分享到微信" onclick="shareToWx(event)" href="javascript:;">
							<img src="${ctx}/static/image/wx.png" style="margin-left:5px;">
						</a>
						<a title="分享到微博" onclick="shareToWb(event)" href="javascript:;">
							<img src="${ctx}/static/image/wb.png" style="margin-left:5px;">
						</a>
						<a title="复制链接"  id='copyTo'   href="javascript:;">
							<img src="${ctx}/static/image/cp.png" style="margin-left:5px;">
						</a>
						<!-- 
						<a title="分享到QQ空间" onclick="shareToQzone(event)" href="javascript:;"><img src="${ctx}/static/image/kj.jpg" width="35px;" height="35px;" style="margin-left:5px;"></a>
						 -->
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="details_cont">
			<div class="titleName">
				<ul>
					<li><a href="javascript:;">活动详情</a></li>
					<li><a href="javascript:;">评论详情</a></li>
				</ul>
				<div style="clear:both;"></div>
			</div>
			<div class="titleItem">
				<div>
					<div style="padding:15px 20px;">
						<textarea id="detailContent" style="width: 100%;background:#FFF;border: 0;" disabled="disabled" >${projectActivityInfoBean.activityDescription}</textarea>
					</div>
				</div>
				<div style="display:none;">
					<div style="padding:15px 6%;">
						<div class="commentInput" id="commentInput">
							<textarea placeholder="输入你的评论..." rows="4" id="commentContent"></textarea>
							<div class="commentContral">
								<input type="button" value="评论" onclick="commentSave()" style="cursor:pointer;">
							</div>
						</div>
						<div class="commentArea">
							<div class="commentName">
								<ul>
									<li><a href="javascript:;" onclick="queryByType('1')">全部评论</a></li>
									<li><a href="javascript:;" onclick="queryByType('2')">我的评论</a></li>
								</ul>
								<div class="commentCount">
									<img src="${ctx}/static/image/activity/comment.png" width="20px;" height="16px;" class="img_contral_t2">
									<span id="commentSize"></span>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="commentItem">
								<div id="commentList"></div>
								<br/>
								<div id="getMoreComment" style="margin:0 1.6% 10px;">
									<a href="javascript:void(0);" onclick="getMoreComment();" class="renovate">
										<span class="renovateTitle">加载更多</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<div class="details_footer">
			<div class="detailsNum">已报名<span style="color:#F14241" class="enterCount">${projectActivityInfoBean.enterCount}</span>人</div>
			<div style="margin-top:15px;" id="enterList"></div>
			<div id="getMoreEnter">
				<a href="javascript:void(0);" onclick="getMoreEnter();" class="renovate" style="border:0;">
					<span class="renovateTitle">加载更多报名</span>
				</a>
			</div>
		</div>
	</div>
	
	<div class="activity_recommend">
		<div class="activityTitle">相关活动推荐</div>
		<div class="activityBar"></div>
		<div id="getMore" style="margin:0 7px 10px;">
			<a href="javascript:void(0);" onclick="getMore();" class="renovate">
				<span class="renovateTitle">加载更多</span>
			</a>
		</div>
	</div>
	
	 <%@ include file="../common/footer.jsp"%>
</div>

				<div style="display:none" id="qrcode">     
					<img src='${projectActivityInfoBean.qrCode}'  width="250px;" height="250px;"/>
				  	  <br>&nbsp;&nbsp;打开微信，点击底部的“发现”
					  <br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
                </div>
                
<script type="text/javascript" src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
<script type="text/javascript" src="${ctx}/static/js/share.js"></script> 
<script>
 $(function(){
 	$(".tabName ul li").each(function(){
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(2).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".titleName ul li").each(function(){
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".commentName ul li").each(function(){
		var index=$(this).index();
		$(".commentName ul li").eq(0).addClass("commentClick");
		$(this).click(function(){
			$(this).addClass("commentClick").siblings().removeClass("commentClick");
		});
    });
 });
</script>
<script type="text/javascript">
	$(function(){
		var tags = '${projectActivityInfoBean.activityTags}';
		//加载评论
		getCommentList(1,1);
		//加载推送活动
		getActivityList(1,1,"",tags);
		//加载报名人数列表
		getEnterList(1);
		
		if($("#enter").text()=="活动结束"){
			$(".right_input").addClass("end");
		}
		
		$('#detailContent').height($('#detailContent')[0].scrollHeight);
		$('#detailContent').css("overflow","hidden");

	});
	
	//报名取消报名
	var flags = true;
	function enterSave(obj){
		if(!flags){
			layer.msg("请不要重复操作！");
			return;
		}
		flags = false;
		var activityId = '${projectActivityInfoBean.activityId}';
		$.ajax({
			url:"${ctx}/projectActivity/json/enterSave",
			type:"get",
			data:{
					"activityId":activityId
				},
			dataType:"json",
			success:function(result){
				flags = true;
				layer.msg(result.msg);
				var enterCount = $("#enterCount").text();
				if(result.code==1){
					$("#enter").text("取消报名");
					$(".enterCount").text(Number(enterCount)+1);
				}else if(result.code==2){
					$("#enter").text("活动报名");	
					$(".enterCount").text(Number(enterCount)-1);
				}else if(result.code==3){
					$("#enter").text("活动结束");	
					$("#enter").parent().addClass("end");
				}else if(result.code==-2){
					layer.msg(result.msg);
				}
				$("#enterList").empty();
				getEnterList(1);
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				flags = true;
				layer.msg("请求超时，请稍后重试");
			}
		});
	}
	
	//获取活动列表
	function getActivityList(pageNum,type,activityName,tags){
		$.ajax({
			url:"${ctx}/projectActivity/json/activityList",
			type:"post",
			data:{
					"pageNum":pageNum,
					"type":type,
					"activityName":activityName,
					"activityTags":tags,
					"status":1,
					"activityId":'${projectActivityInfoBean.activityId}',
					'${_csrf.parameterName}':'${_csrf.token}'
				},
			dataType:"json",
			success:function(result){
				if(result.code==-1){
					layer.alert(result.msg);
				}else if(result.code==2){
					$(".activityBar").append('<span class="renovateTitle">暂无更多信息</span>');
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = '<div class="activityCont">'
							+'<div style="position: relative;">'
							+'<img src='+info.activityImage+' width="362px;" height="186px;"onclick="activityDetails(\''+info.activityId+'\')" style="cursor:pointer;"/>'/* width="100%;" height="120px;" */
							+'<div class="activity-tagBox1">'
							+'<i class="icon-bg"></i>'
							+'<ul>';
							var tag = info.activityTags.split(",");
							if(tag!=""&&tag!=null){
								for(var j=0;j<tag.length;j++){
									if(tag[j]!=""&&tag[j]!=null){
										_div += '<li>'+tag[j]+'</li>';
									}
								}
							}
							_div += '</ul>'
							+'<div class="tag-bg"></div>'
							+'</div>'
						+'<div class="activityCont_title">';
						if(info.activityName.length<=14){
							_div += '<div class="activityCont_text">'+info.activityName+'</div>';
						}else{
							_div += '<div class="activityCont_text" title="'+info.activityName+'">'+info.activityName.substring(0,14)+'...</div>';
						}
						if(info.status==1){
							_div += '<div class="registrationIn">报名中</div>';
						}else{
							_div += '<div class="registrationIn hasEnded">已结束</div>';
						}
						_div += '<div style="clear:both;"></div>'
						+'</div>'
						+'<div class="activityCont_data">'
						+'	<img src="${ctx}/static/image/activity/time.png" width="10px;" height="10px;">&nbsp;'
						+'	<span>'
						+'	'+info.start+'至'
						+'	'+info.end+''
						+'</div>'
						+'<div class="activityCont_data">'
						+'	<img src="${ctx}/static/image/activity/location.png" width="10px;" height="10px;">&nbsp;';
						if(info.activityLocation.length<=25){
							_div += '<span>'+info.activityLocation+'</span>';
						}else{
							_div += '<span title="'+info.activityLocation+'">'+info.activityLocation.substring(0,24)+'...</span>';
						}
						_div += '</div>'
						+'</div>';
						$(".activityBar").append(_div);
					}
					$(".activityBar").append('<div style="clear:both;"></div>');
					
				}
				if(result.code==1){
					$("#getMore").show();	
				}else{
					$("#getMore").hide();	
				}
				
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				layer.msg("请求超时，请稍后重试");
			}
		});
	}
	
	function getMore(){
		var pageNum = Number($("#pageNum3").val())+1;
		$("#pageNum3").val(pageNum);
		getActivityList(pageNum,1,"",'${projectActivityInfoBean.activityTags}');
	}
	
	//获取评论列表
	function getCommentList(pageNum,commentType){
		$.ajax({
			url:"${ctx}/projectActivity/json/commentList",
			type:"get",
			data:{
					"pageNum":pageNum,
					"commentType":commentType,
					"kind":201,
					"activityId":'${projectActivityInfoBean.activityId}'
				},
			dataType:"json",
			success:function(result){
				if(result.code==-1){
					layer.alert(result.msg);
				}else if(result.code==-2){
					layer.msg(result.msg);
					$("#getMoreComment").hide();
				}else if(result.code==2){
					$("#commentList").append('<span class="renovateTitle">暂无更多信息</span>');
					$("#commentSize").text("暂无评论");
					$("#getMoreComment").hide();
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = "";
						if(i>1){
							_div = '<div class="commentBar hidden">';
						}else{
							_div = '<div class="commentBar">';
						}
						if(info.imageUrl!=""&&info.imageUrl!=null){
							_div += '<img src="'+info.imageUrl+'" width="40px;" height="40px;" style="float:left;border-radius:50%; overflow:hidden;">';
						}else{
							_div += '<img src="${ctx}/static/image/activity/headPortrait.png" width="40px;" height="40px;" style="float:left;border-radius:50%; overflow:hidden;">';
						}
						
						_div += '<div style="float:left; margin-left:10px;">'
						+'<div>'
						+'	<span style="color:#EE7085">'+info.commentUser+'</span>'
						+'	<span style="margin-left:20px;">'+info.comTime+'</span>'
						+'</div>'
						+'<div>'+info.commentContent+'</div></div>';
						
						if(info.isCurComment=='true'){
							_div += '<a href="javascript:;" style="float:right; margin-left:10px;">'
								+'<span style="color:#9c9c9c;" onclick="commentDelete(\''+info.commentId+'\')">删除</span>'
								+'</a>';
						}
						if(commentType==1){
							_div += '<a href="#commentInput" style="float:right;">'
								+'<img src="${ctx}/static/image/activity/replay.png" width="15px;" height="15px;" class="img_contral_t2">&nbsp;'
								+'<span style="color:#9c9c9c;" onclick="commentReply(\''+info.commentId+'\',\''+info.commentUser+'\')">回复</span>'
								+'</a>';
						}
						
						_div += '<div style="clear:both;"></div></div>';	
						$("#commentList").append(_div);
					}
					$("#commentList").append('<div style="clear:both;"></div>');
					$("#commentSize").text(result.msg+"条评论");
					
					if(list.length>2){
						$("#getMoreComment").show();	
					}else{
						$("#getMoreComment").hide();	
					}
				}
				/* if(result.code==1){
					$("#getMoreComment").show();	
				}else{
					$("#getMoreComment").hide();	
				} */
				$("#replyId").val("");
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				layer.msg("请求超时，请稍后重试");
			}
		});
			
	}
	
	//按分类加载评论
	function queryByType(commentType){
		$("#commentType").val(commentType);
		$("#pageNum").val(1);
		$("#commentList").empty();
		getCommentList(1,commentType);
	}
	
	//加载更多评论
	function getMoreComment(){
		/* var pageNum = Number($("#pageNum2").val())+1;
		$("#pageNum2").val(pageNum);
		getCommentList(pageNum,$("#commentType").val());*/
		
		$(".commentBar").each(function(){
			if($(this).hasClass("hidden")){
				$(this).removeClass("hidden");
			}
		});
		$("#getMoreComment").hide(); 
	}
	 
	//保存评论
	function commentSave(){
		var commentContent = $("#commentContent").val();
		if(commentContent == null ||commentContent == ""){
			layer.msg("评论内容不能为空");
			return;
		}
		var replyId = $("#replyId").val();
		$.ajax({
			url:"${ctx}/projectActivity/json/commentSave",
			type:"post",
			headers:{"token":'${pageContext.session.id}'},
			data:{
					"commentContent":safeStr(commentContent),
					"replyId":replyId,
					"kind":201,
					"activityId":'${projectActivityInfoBean.activityId}',
					'${_csrf.parameterName}':'${_csrf.token}'
				},
			dataType:"json",
			success:function(result){
				if(result.code==1){
					layer.msg("评论成功");
					$("#commentContent").val('');
					$("#commentList").empty();
					getCommentList(1,$("#commentType").val());
				}else if(result.code==-2){
					layer.msg(result.msg);
				}else{
					layer.alert(result.msg);
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				layer.msg("请求超时，请稍后重试");
			}
		});
		
	}
	
	//回复评论
	function commentReply(replyId,replayUser){
		$("#commentContent").val("回复"+replayUser+"：");
		$("#replyId").val(replyId);
	}
	
	//删除评论
	function commentDelete(commentId){
		layer.confirm('确认删除？', function(){
			$.ajax({
				url:"${ctx}/projectActivity/json/commentDelete",
				type:"get",
				data:{
						"commentId":commentId
					},
				dataType:"json",
				headers:{"token":'${pageContext.session.id}'},
				success:function(result){
					if(result.code==1){
						layer.msg("删除成功");
						$("#commentList").empty();
						getCommentList(1,$("#commentType").val());
					}else{
						layer.alert(result.msg);
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					layer.msg("请求超时，请稍后重试");
				}
			});
		}, layer.close());
		
	}
	
	function activityDetails(activityId){
		window.location.href="${ctx}/projectActivity/details/"+activityId;
	}
	
	
	//获取报名列表
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
					$("#getMoreEnter").hide();
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = "";
						if(i>19){
							_div = '<div class="detailsHuman hidden">';
						}else{
							_div = '<div class="detailsHuman">';
						}
						if(info.imageUrl!=""&&info.imageUrl!=null){
							_div += '<img src='+info.imageUrl+' width="70px;" height="70px;" style="border-radius:50%; overflow:hidden;">';
						}else{
							_div += '<img src="${ctx}/static/image/activity/headPortrait.png" width="70px;" height="70px;" style="border-radius:50%; overflow:hidden;">';
						}
						
						if(info.enterUser.length>5){						
							_div += '<div class="detailsHumanName" title="'+info.enterUser+'">'+info.enterUser.substring(0,4)+'...</div>';
						}else{
							_div += '<div class="detailsHumanName" title="'+info.enterUser+'">'+info.enterUser+'</div>';
						}
						
						_div += '</div>';
							
						$("#enterList").append(_div);
					}
					$("#enterList").append('<div style="clear:both;"></div>');
					if(list.length>20){
						$("#getMoreEnter").show();	
					}else{
						$("#getMoreEnter").hide();	
					}
				}
				/* if(result.code==1){
					$("#getMoreEnter").show();	
				}else{
					$("#getMoreEnter").hide();	
				}  */
				
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				layer.msg("请求超时，请稍后重试");
			}
		});
	}
	
	//加载报名人数列表
	function getMoreEnter(){
		/* var pageNum = Number($("#pageNum1").val())+1;
		$("#pageNum1").val(pageNum);
		getEnterList(pageNum);  */
		
		$(".detailsHuman").each(function(){
			if($(this).hasClass("hidden")){
				$(this).removeClass("hidden");
			}
		});
		$("#getMoreEnter").hide(); 
	}
	
	function reportBar(){
	 	layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			skin: 'reportBar',
			shade: [0],
			area:['400px','250px'],
			offset:['200px','600px'],
			closeBtn:0,
			content: $('#reportBar'),
		});
	 };
	 
	 function getSubmitContent(obj){
		 if($(obj).hasClass("check")){
			 $(obj).removeClass("check");
		 }else{
			 $(obj).addClass("check");
		 }
		 
		 var submitContent = "";
		 $(".selected").each(function(){
			 if($(this).hasClass("check")){
				 submitContent += ($(this).val()+",");			 
			 }
		});
		$("#submitContent").val(submitContent);
	 }
	 
	 function sendBtn(){
		 var submitContent = $("#submitContent").val();
			if(submitContent!=""&&submitContent!=null){
				if(submitContent.length>100){
					layer.msg("处理内容不能超过100字");
					return;
				}
				$.ajax({
					url:"${ctx}/projectActivity/json/complainSave",
					type:"post",
					data:{
							"submitContent":submitContent,
							"activityId":'${projectActivityInfoBean.activityId}',
							'${_csrf.parameterName}':'${_csrf.token}'
						},
					dataType:"json",
					success:function(result){
						if(result.code==1){
							layer.closeAll();
							layer.msg("举报成功");
						}else if(result.code==-2){
							layer.msg(result.msg);
						}else{
							layer.alert(result.msg);
						}
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						layer.msg("请求超时，请稍后重试");
					}
				}); 
			}else{
				layer.msg("举报内容不能为空");
			}
		}
		
		function returnBtn(){
			layer.closeAll();
		}
</script>
</body>
</html>
