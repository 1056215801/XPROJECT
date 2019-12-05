<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>动态详情</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main">
		<input type="hidden" id="replyId" />
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-nav"><p>动态详情</p><a href="${ctx}/experience/list?entranceId=${entranceId}&type=2">返回列表 ></a></div>
						<div class="artical-content">
							<div class="declareDataBar fz0">
								<div class="text-box_title">
									<div class="declareTitle">
							 	  	   	<c:if test="${detail.status==0}">
											<span class="flag flag2">未通过</span>
											<span class="triang triang2"></span>
							 	  	   	</c:if>
							 	  	   	<c:if test="${detail.status==1}">
											<span class="flag flag1">已发布</span>
											<span class="triang triang1"></span>
										</c:if>
							 	  	   	<c:if test="${detail.status==2}">
											<span class="flag flag3">审核中</span>
											<span class="triang triang3"></span>
										</c:if>
										${detail.expTitle}
									</div>
									<div class="declareData">
										<font>发布时间：<fmt:formatDate value="${detail.createTime}" pattern="yyyy-MM-dd"/></font>
										<font>发布单位：${detail.expUnit}</font>
										<font>地址：${detail.provinceName} ${detail.areaName}</font>
										<ul>
											<li><img onclick="shareToQQFriend(event,'动态')" src="${ctx}/static/image/qq.png" title="分享到QQ"></li>
											<li><img onclick="shareToWx(event)" src="${ctx}/static/image/wx.png" title="分享到微信"></li>
											<li><img onclick="shareToWb(event)" src="${ctx}/static/image/wb.png" title="分享到微博"></li>
											<li><img id='copyTo' src="${ctx}/static/image/cp.png" title="复制链接"></li>
										</ul>
									</div>
									<div class="declareData">
										<img src="/XProject/static/image/experienceSharing/browseCount.png">${detail.browseCountEdit}浏览 
										<img src="/XProject/static/image/experienceSharing/commentCount.png">${detail.commentCount}评论
									</div>
								</div>
							</div>
							<div class="main-contents">
								<div class="texts">${detail.expText}</div>
								<div class="files" id="attList">
									<p>附件：</p>
								</div>
							</div>
							<div class="reply">
								<h2 class="">评论</h2>
								<textarea rows="5" cols="" id="commentContent" placeholder="请输入评论内容"></textarea>
								<a class="publish-reply" href="javascript:;" onclick="addReplay()">发布</a>
								
								<div class="reply-list">
									<div class="tab-link">
										<a href="javascript:;" class="on">全部评论</a>
										<a href="javascript:;">我的评论</a>
										<span id="commentSize"><img src="${ctx}/static/image/experienceSharing/comment.png"><font id="commentCount"></font></span>
									</div>
									<div class="tab-content">
										<div class="tab" id="tabs0">
											<div class="tab-list" id="allCommentList">
											<!--  	<div class="reply-item">
													<img src="/XProject/static/image/experienceSharing/browseCount.png">
													<div class="reply-text">
														<div class="reply-user">
															<font>樱木花道</font>
															2018-05-05 15:28
															<span class='fr'>回复</span>
														</div>
														<p>环保的力量超级超大</p>
													</div>
												</div>  -->
											</div>
										</div>
										<div class="tab" id="tabs1" style="display: none;">
											<div class="tab-list" id="myCommentList">
											<!-- 	<div class="reply-item">
													<img src="/XProject/static/image/experienceSharing/browseCount.png">
													<div class="reply-text">
														<div class="reply-user">
															<font>樱木花道</font>
															2018-05-05 15:28
															<span class='fr'>回复</span>
														</div>
														<p>环保的力量超级超大</p>
													</div>
												</div> -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div style="display:none" id="qrcode">     
						<img src='${detail.qrCode}'  width="250px;" height="250px;"/>
				  	    <br>&nbsp;&nbsp;打开微信，点击底部的“发现”
					    <br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
    			  </div>
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import>
				</div>
			</div>
		</div>
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script src="${ctx}/static/js/url.min.js"></script>
<script src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
<script src="${ctx}/static/js/share.js"></script> 
<script type="text/javascript">
$(function(){
	if('${entranceId}'==3609009){
		$(".nav-content a:eq(3)").addClass("on");
	}
	$(".fr li").eq(1).addClass("on");
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(5)").addClass("on");
	if(Url.queryString("type") == 0){
		$(".flag").hide();
		$(".triang").hide();
	}
	if('${detail.attachmentId}' != ''){
		getAtts('${detail.attachmentId}');
		$("#attList").show();
	}
	$(".reply-list .tab-link a").on("click",function(){         //评论列表
		var $ind = $(this).index();
	    if($ind==0){
			$("#allCommentList").empty();
	    	getCommentList(1,'1');
	    }else{
			$("#myCommentList").empty();
	    	getCommentList(1,'2');
	    }
		$(this).addClass("on").siblings().removeClass("on");
		$("#tabs"+$ind).siblings().fadeOut("fast");
		setTimeout(function(){$("#tabs"+$ind).fadeIn("fast");},200)
	})
	getCommentList(1,'1');
});

//删除评论
function commentDelete(commentId,commentType){
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
					var $ind = Number(commentType)-1;
					$(".reply-list .tab-link a:eq("+$ind+")").addClass("on").siblings().removeClass("on");
					$("#tabs"+$ind).siblings().fadeOut("fast");
					setTimeout(function(){$("#tabs"+$ind).fadeIn("fast");},200)
					if(commentType==1){
						$("#allCommentList").empty();
						getCommentList(1,'1');
					}else{
						$("#myCommentList").empty();
						getCommentList(1,'2');
					}
					
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
function commentReply(replyId,replayUser){
	$("#commentContent").val("回复"+replayUser+"：");
	$("#replyId").val(replyId);
}

function getCommentList(pageNum,commentType){
	$.ajax({
		url:"${ctx}/projectActivity/json/commentList",
		type:"get",
		data:{
				"pageNum":pageNum,
				"commentType":commentType,
				"kind":202,
				"activityId":'${detail.expId}'
			},
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==-2){
				layer.msg(result.msg);
				$("#commentCount").text("0个评论");
				$("#getMoreComment").hide();
			}else if(result.code==2){
				$("#commentCount").text("0个评论");
				if(commentType==1){
					$('#allCommentList').html('<div style="width:100%; text-align: center; padding: 100px 0;font-size: 16px;"><span class="renovateTitle">暂无更多信息</span></div>');

				}else{
					$('#myCommentList').html('<div style="width:100%; text-align: center; padding: 100px 0;font-size: 16px;"><span class="renovateTitle">暂无更多信息</span></div>');

				}
			/* 	$("#commentSize").text("暂无评论");
				$("#getMoreComment").hide(); */
			}else{
	 			var list = result.value;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var _div = "";
					_div += '<div class="reply-item">'
					if(info.imageUrl!=""&&info.imageUrl!=null){
						_div += '<img src="'+info.imageUrl+'">'
					}
					if(info.imageUrl!=""&&info.imageUrl!=null){
						_div +=  '<div class="reply-text">'
					}else{
						_div +=  '<div class="reply-text" style="width:100%">'
					}
					
					_div +=	'<div class="reply-user">'
					_div +=	'<font>'+info.commentUser+'</font>'
					_div +=	info.comTime
					if(commentType==1){
						_div +=	'<span class="fr" onclick="commentReply(\''+info.commentId+'\',\''+info.commentUser+'\')"><img src="${ctx}/static/image/experienceSharing/replay.png">回复</span>'
					}
					if(info.isCurComment=='true'){
						_div +=	'<span class="fr" onclick="commentDelete(\''+info.commentId+'\',\''+commentType+'\')" >删除</span>'

					}
					
					_div +=	'</div>'
					_div +=	'<p>'+info.commentContent+'</p>'
					_div +='</div>'
					_div +='</div>'
					
					if(commentType==1){
						$('#allCommentList').append(_div);
					}else{
						$('#myCommentList').append(_div);
					}
					

	/* 				if(i>4){
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
					} */
				}	
				$("#commentCount").text(result.msg+"条评论");
				$("#replyId").val("");
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		},
	});
		
}

function addReplay(){
	
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
				"activityId":'${detail.expId}',
				'${_csrf.parameterName}':'${_csrf.token}'
			},
	 	headers:{"token":'${pageContext.session.id}'},
		dataType:"json",
		success:function(result){
			if(result.code==1){
				layer.msg("评论成功");
				$("#allCommentList").empty();
				$("#commentContent").val('');
				$(".reply-list .tab-link a:eq(0)").addClass("on").siblings().removeClass("on");
				$("#tabs0").siblings().fadeOut("fast");
				setTimeout(function(){$("#tabs0").fadeIn("fast");},200)
				getCommentList(1,'1');
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

function getAtts(attIdList){
	 $.ajax({
			url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
			type:'get',
			data:{'attachmentIdList':attIdList},
			dataType:'json',
			success:function(data){
				var value = JSON.parse(data).attachments;
				if(value==null||value==""){
					$("#attList").hide();
				}
				
				for(var i = 0;i<value.length;i++){
					$('#attList').append(
							 "<p>附件"+(i+1)+"<a href='"+value[i].downloadUrl+"' target='_blank'>"+value[i].remoteName+"</a></p>"
							);
				}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
}
function authorityTips() { //权限提示弹框
	layer.open({
		type : 1,
		title : false,
		shadeClose : true,
		shade : [ 0 ],
		area : [ '500px', '280px' ],
		closeBtn : 0,
		content : $('#authorityTips')
	});
};
 function add(){
	 $.ajax({
			url:"${ctx}/projectDeclare/isUpgrade",
			type:"get",
			success:function(result){
				 if(result==0){
					confirm('您尚未升级成政府用户，是否去升级？', function(index) {
						 window.location.href="${ctx}/projectDeclare/upgradeCreate";
					},function(){});  
				}else if(result==2){
					tips('您已提交升级申请，请耐心等待审核结果！');
				}else if(result==1){
					 window.location.href="${ctx}/projectDeclare/create";
				}else if(result==3){
					tips('请先登录！');
				} 
            },
			error:function(){
				layer.alert("创建异常！");
				},
			});
 }
</script>
</html>
