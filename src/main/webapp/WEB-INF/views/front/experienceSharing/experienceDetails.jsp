<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${expShareInfo.expTitle}</title>
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<style type="text/css">
.hidden{display: none;}
</style>
</head>
<body>
<div class="share_main">
	<input type="hidden" id="pageNum" value="1"/>
	<input type="hidden" id="replyId" />
	<input type="hidden" id="commentType" />
	<div class="project_header">
	    <%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="details_content">
		<div class="detailsName clearfix">
			<ul>
				<li><a href="javascript:;">动态详情</a></li>
				<%-- <c:if test="${expShareInfo.status==1 }">
				<li><a href="javascript:;">评论详情</a></li>
				</c:if> --%>
			</ul>
			<a href="javascript:history.go(-1);">
				<div class="returnPage">返回上一页&nbsp;&nbsp;></div>
			</a>
		</div>
		<div class="detailsItem">
			<div>
				<div style="margin:0 7px;">
					<img src="${ctx}/static/image/experienceSharing/recommend.png" width="47px;" height="47px;" class="recommendItem">
					<div class="clearfix" style="padding:20px 18px;">
						<div class="detailsTitle">${expShareInfo.expTitle}</div>
						<div style="float:right; position:relative; top:-10px;">
							<span class="font12">一键分享</span>
							<a title="分享给QQ好友" onclick="shareToQQFriend(event,'动态分享')" href="javascript:;">
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
							<div class="clearfix" style="position:absolute; top:30px; right:0;">
								<div class="share_comment">
									<img src="${ctx}/static/image/experienceSharing/commentCount.png" width="15" height="15">
									<span>${expShareInfo.commentCount}评论</span>
								</div>
								<div class="share_browse">
									<img src="${ctx}/static/image/experienceSharing/browseCount.png" width="15" height="15">
									<span>${expShareInfo.browseCountEdit}浏览</span>
								</div>
							</div>
						</div>
					</div>
					<div class="showBar clearfix">
						<div style="float:left;">
							<div class="detailsDataLeft">标签：</div>
							<div class="detailsDataRight">${expShareInfo.expLabel.replaceAll(",","&nbsp;")}</div>
							<div class="detailsDataLeft">分享单位：</div>
							<div class="detailsDataRight">${expShareInfo.expUnit}</div>
							
							<div class="detailsDataLeft">发布时间：</div>
							<div class="detailsDataRight">
								<fmt:formatDate value="${expShareInfo.createTime}" pattern="yyyy-MM-dd HH:mm"/>
							</div>
						</div>
						<c:if test="${type==1}">
						<div style="float:right; margin:4px 10px 0; text-align:center;">
							<div class="details_stateBlue">
								<c:choose>
									<c:when test="${expShareInfo.status==2}">审核中</c:when>
									<c:when test="${expShareInfo.status==1}">已发布</c:when>
									<c:when test="${expShareInfo.status==0}">不通过</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</div>
							<a href="javascript:void(0);" class="deleteOper" style="float:none;" onclick="del('${expShareInfo.expId}')">X&nbsp;删除此篇</a>
						</div>
						</c:if>
					</div>
					<div style="border-bottom:1px dashed #ccc;"></div>
					<div style="padding:10px 50px 10px">
						<%-- <img src="${expShareInfo.expImage}" width="670" height="300" style="display:block; margin:0 auto;"> --%>
						<!-- <div style="margin:30px 0 50px;">
							<div style="text-indent:2em;">上汽北京公司2016年工作会议先进交流材料之一：</div>
							<div style="font-weight:bold; text-align:center;">众筹智慧促提升&nbsp;创新求变谋发展</div>
							<div style="text-align:right;">---严永荣（烟台公司副总经理、青岛分公司总经理）</div>
						</div> -->
						<div style="text-indent:2em;">${expShareInfo.expText}
							<div style="margin-top:20px;" id="attr"> 
								<div class="detailsDataLeft">附件：</div>
								<div class="detailsDataRight" id="attList"></div>
							</div>
						</div>
					</div>
					<div style="border:1px dashed #ccc;"></div>
				</div>
			</div>
			
			<div style="">
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
	
	<%@ include file="../common/footer.jsp"%>
	<div style="display:none" id="qrcode"> 
		<img src='${expShareInfo.qrCode}'  width="250px;" height="250px;"/>
		<br>&nbsp;&nbsp;打开微信，点击底部的“发现”
		<br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
<script type="text/javascript" src="${ctx}/static/js/share.js"></script> 
<script>
 $(function(){
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(0).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".detailsName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".detailsName ul li").eq(0).addClass("detailsClick");
		$(this).click(function(){
			$(this).addClass("detailsClick").siblings().removeClass("detailsClick");
			$(".detailsItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".commentName ul li").each(function(){
		var index=$(this).index();
		$(".commentName ul li").eq(0).addClass("commentClick");
		$(this).click(function(){
			$(this).addClass("commentClick").siblings().removeClass("commentClick");
		//	$(".commentItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
 });
 

</script>
<script type="text/javascript">
	$(function(){
		getAtts('${expShareInfo.attachmentId}');
		//加载评论
		getCommentList(1,'1');
	});
	
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
	 
	 function del(expId){
		 window.location.href="${ctx}/expShare/delete?expId="+expId;
	 }
	 
	//获取评论列表
		function getCommentList(pageNum,commentType){
			$.ajax({
				url:"${ctx}/projectActivity/json/commentList",
				type:"get",
				data:{
						"pageNum":pageNum,
						"commentType":commentType,
						"kind":202,
						"activityId":'${expShareInfo.expId}'
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
							if(i>4){
								_div = '<div class="commentBar hidden">';
							}else{
								_div = '<div class="commentBar">';
							}
							if(info.imageUrl!=""&&info.imageUrl!=null){
								_div += '<img src="'+info.imageUrl+'" width="40px;" height="40px;" style="float:left;border-radius:50%; overflow:hidden;">';
							}else{
								_div += '<img src="${ctx}/static/image/activity/headPortrait.png" width="40px;" height="40px;" style="float:left;border-radius:50%; overflow:hidden;">';
							}
							
							_div += '<div style="float:left; margin-left:10px; width:90%;">'
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
						if(list.length>5){
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
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				},
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
			getCommentList(pageNum,$("#commentType").val()); */
			
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
				data:{
						"commentContent":safeStr(commentContent),
						"replyId":replyId,
						"kind":202,
						"activityId":'${expShareInfo.expId}',
						'${_csrf.parameterName}':'${_csrf.token}'
					},
			 	headers:{"token":'${pageContext.session.id}'},
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
				/* error:function(){
					layer.alert("系统异常，请稍后重试！");
				} */
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				},
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
					/* error:function(){
						layer.alert("系统异常，请稍后重试！");
					} */
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
						alert(XMLHttpRequest.readyState);
						alert(textStatus);
					},
				});
			}, layer.close());
			
		}
</script>
</body>
</html>
