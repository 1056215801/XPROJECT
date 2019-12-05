<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>活动报名详情</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main">
		<input type="hidden" id="pageNum3" value="1"/>
		<input type="hidden" id="replyId" value="">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-nav"><p>活动详情</p><a href="${ctx}/activity/list?entranceId=${entranceId}">返回列表 ></a></div>
						<div class="artical-content">
							<div class="declareDataBar fz0">
								<div class="text-box">
									<div class="text-box_title">
										<div class="declareTitle">
								 	  	   	<c:if test="${detail.status==0}">
												<span class="flag flag2">已结束</span>
												<span class="triang triang2"></span>
								 	  	   	</c:if>
								 	  	   	<c:if test="${detail.status==1}">
												<span class="flag flag1">报名中</span>
												<span class="triang triang1"></span>
											</c:if>
											${detail.activityName}
										</div>
										<div class="declareData">
											<font>活动标签：${detail.activityTags}</font>
											<font>活动时间：<fmt:formatDate value="${detail.startTime}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${detail.endTime}" pattern="yyyy-MM-dd"/></font>
											<font>活动地址：${detail.activityLocation}</font>
										</div>
										<div class="declareData">
											<c:choose>
													<c:when test="${detail.status==1}">
														<c:if test="${isEnter==true}"><span class="join-now" onclick="enterSave()" id="enter">取消报名</span></c:if>
														<c:if test="${isEnter==false}"><span class="join-now" onclick="enterSave()" id="enter">活动报名</span></c:if>
													</c:when>
													<c:otherwise><span class="join-now end" id="enter">活动结束</span></c:otherwise>
											</c:choose>	
										</div>
										<div class="declareData">
											<span class="tip-off" onclick="reportBar()"><img src="${ctx}/static/image/activity/complain.png">举报该活动</span>
											<ul style="position: relative; left: 190px;">
												<li><img onclick="shareToQQFriend(event,'活动')" src="${ctx}/static/image/qq.png" title="分享到QQ"></li>
												<li><img onclick="shareToWx(event)" src="${ctx}/static/image/wx.png" title="分享到微信"></li>
												<li><img onclick="shareToWb(event)" src="${ctx}/static/image/wb.png" title="分享到微博"></li>
												<li><img id='copyTo' src="${ctx}/static/image/cp.png" title="复制链接"></li>
											</ul>
										</div>
										
									</div>
								</div>
								<img src="${detail.activityImage}">
							</div>
							<div class="content-tabs">
								<div class="tab-link">
									<a href="javascript:;" class="on">活动详情</a>
									<a href="javascript:;">评论详情</a>
								</div>
								<div class="tab-content">
									<div class="tab" id="contentTab0">
										<div class="main-contents">
											<div class="texts"><textarea id="detailContent" style="width: 100%;background:#FFF;border: 0;" disabled="disabled" >${detail.activityDescription}</textarea></div>
										</div>
									</div>
									<div class="tab" id="contentTab1" style="display: none;">
										<div class="reply">
											<h2 class="">评论</h2>
											<textarea rows="5" cols="" placeholder="请输入评论内容" id="commentContent"></textarea>
											<a class="publish-reply" href="javascript:;" onclick="commentSave()">发布</a>
											<div class="reply-list">
												<div class="tab-link">
													<a href="javascript:;" class="on">全部评论</a>
													<a href="javascript:;">我的评论</a>
													<span><img src="${ctx}/static/image/experienceSharing/comment.png"><font id="replyTotal">1</font>条评论</span>
												</div>
												<div class="tab-content">
													<div class="tab" id="tabs0">
														<div class="tab-list" id="list1">
														</div>
													</div>
													<div class="tab" id="tabs1" style="display: none;">
														<div class="tab-list" id="list2">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="activity-man fz0">
								<h2 class="">已报名<font id="enterCount" class="redT">${detail.enterCount}</font>人<span id="getMoreEnter" onclick="$('#enterList2').slideToggle();">显示更多</span></h2>
								<ul id="enterList"></ul>
								<ul id="enterList2" style="display:none;"></ul>
							</div>
							<div class="reply">
								<h2>相关活动推荐</h2>
								<div class="activityBar"></div>
								<div id="getMore" class="renovate">
									<a href="javascript:void(0);" onclick="getMore();">
										<span class="renovateTitle">加载更多</span>
									</a>
								</div>
							</div>
						</div>
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
							<input type="button" value="关闭" onclick="layer.closeAll();" class="returnBtn" style="cursor:pointer;">
							<div style="clear:both;"></div>
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
<script src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
<script src="${ctx}/static/js/share.js"></script> 
<script src="${ctx}/static/js/url.min.js"></script>
<script type="text/javascript">
$(function(){
	var tags = '${detail.activityTags}';
	$('#detailContent').height($('#detailContent')[0].scrollHeight);
	$('#detailContent').css("overflow","hidden");
	$(".nav-content a:eq(5)").addClass("on");
	$(".reply-list .tab-link a").on("click",function(){         //评论列表
		var $ind = $(this).index();
		var $ind1 = $(this).index() + 1;
		$(this).addClass("on").siblings().removeClass("on");
		$("#tabs"+$ind).siblings().fadeOut("fast");
		setTimeout(function(){$("#tabs"+$ind).fadeIn("fast");},200);
		
		getCommentList(1,$ind1);
	})
	$(".content-tabs>.tab-link a").on("click",function(){         //评论列表
		var $ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#contentTab"+$ind).siblings().fadeOut("fast");
		setTimeout(function(){$("#contentTab"+$ind).fadeIn("fast");},200);
	})
	//加载推送活动
	getActivityList(1,1,"",tags);
	//评论
	getCommentList(1,1);
	//参加人员
	getEnterList(1);
	$(".declareData font:eq(0)").text('活动标签：'+'${detail.activityTags}'.slice(0,'${detail.activityTags}'.length-1));
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

//获取评论列表
function getCommentList(pageNum,commentType){
	$.ajax({
		url:"${ctx}/projectActivity/json/commentList",
		type:"get",
		data:{
				"pageNum":pageNum,
				"commentType":commentType,
				"kind":201,
				"activityId":'${detail.activityId}'
			},
		dataType:"json",
		success:function(result){
			console.log(result)
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==-2){
				layer.msg(result.msg);
				$("#getMoreComment").hide();
			}else if(result.code==2){
				$("#list"+commentType).html('<div style="padding: 50px;text-align: center;font-size: 16px;" class="renovateTitle">暂无更多信息</div>');
				$("#replyTotal").text("0");
				$("#getMoreComment").hide();
			}else{
				var list = result.value;
				$("#list"+commentType).empty();
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var _div = "";
					_div+='<div class="reply-item">';
					if(info.imageUrl){
						_div+='<img src="'+info.imageUrl+'">'
							+'<div class="reply-text">';
					}else {
						_div+='<div class="reply-text" style="width: 100%;">';
					}
					_div+='<div class="reply-user fz14">'
						+'<font>'+info.commentUser+'</font>'
						+info.comTime;
					if(commentType == 1){
						if(info.isCurComment && info.isCurComment == 'true'){
							_div+='<span class="fr" onclick="deleteC(\''+info.commentId+'\',1)">删除</span>';
						}
						_div+='<span class="fr" onclick="reply(\''+info.commentUser+'\',\''+info.commentId+'\')"><img src="${ctx}/static/image/experienceSharing/replay.png">回复</span>';
					}else {
						_div+='<span class="fr" onclick="deleteC(\''+info.commentId+'\',2)">删除</span>';
					}
					_div+='</div>'
						+'<p>'+info.commentContent+'</p>'
						+'</div>'
						+'</div>';

					$("#list"+commentType).append(_div);
				}
				$("#replyTotal").text(result.msg);
				
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
			//layer.msg("请求超时，请稍后重试");
		}
	});
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
				"commentContent": safeStr(commentContent),
				"replyId": replyId,
				"kind": 201,
				"activityId":'${detail.activityId}',
			},
		dataType:"json",
		headers:{"token":'${pageContext.session.id}'},
		success:function(result){
			if(result.code==1){
				layer.msg("评论成功");
				$("#commentContent").val('');
				$(".reply-list .tab-link a:eq(0)").addClass("on").siblings().removeClass("on");
				$("#tabs0").siblings().fadeOut("fast");
				setTimeout(function(){$("#tabs0").fadeIn("fast");},200);
				getCommentList(1,1);
			}else if(result.code==-2){
				layer.msg(result.msg);
			}else{
				layer.alert(result.msg);
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			//layer.msg("请求超时，请稍后重试");
		}
	});
	
}
//回复评论
function reply(name,replyId){
	$("#commentContent").val("回复"+name+"：");
	$("#replyId").val(replyId);
	var i = $(document).scrollTop();
	var h = $(".declareDataBar").height() + $(".main-contents").height() + 200;
	var inte = setInterval(function() {
		if (i > h) {
			i -= (i - h)/5;
			$(document).scrollTop(i);
		}
	}, 10);
	setTimeout(function() {
		clearInterval(inte);
	}, 500);
}
//删除评论
function deleteC(commentId,commentType){
	var commentType = commentType;
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
					setTimeout(function(){$("#tabs"+$ind).fadeIn("fast");},200);
					getCommentList(1,commentType);
				}else{
					layer.alert(result.msg);
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				//layer.msg("请求超时，请稍后重试");
			}
		});
	}, layer.close());
	
}
//提交举报
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
					"submitContent": safeStr(submitContent),
					"activityId":'${detail.activityId}',
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
				//layer.msg("请求超时，请稍后重试");
			}
		}); 
	}else{
		layer.msg("举报内容不能为空");
	}
}
//举报选项
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
//举报弹窗
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
//获取报名列表
function getEnterList(pageNum){
	$.ajax({
		url:"${ctx}/projectActivity/json/enterList",
		type:"get",
		data:{
				"pageNum":pageNum,
				"activityId":'${detail.activityId}'
			},
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==2){
				$("#enterList").append('<div style="padding: 50px;text-align: center;font-size: 16px;" class="renovateTitle">暂无人报名</div>');
				$("#getMoreEnter").hide();
			}else{
				var list = result.value;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var _div = "";
					var accImg = info.imageUrl ? info.imageUrl : '${ctx}/static/image/homePage_yc/headPortrait.png';
					_div+='<li>'
						+'	<img src="'+accImg+'">'
						+'	<p>'+info.enterUser+'</p>'
						+'</li>';
					if(i < 8){
						$("#enterList").append(_div);
					}
					else {
						$("#enterList2").append(_div);
					}
				}
				if(list.length>8){
					$("#getMoreEnter").show();	
				}else{
					$("#getMoreEnter").hide();	
				}
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			//layer.msg("请求超时，请稍后重试");
		}
	});
}
//报名取消报名
var flags = true;
function enterSave(){
	if(!flags){
		layer.msg("请不要重复操作！");
		return;
	}
	flags = false;
	$.ajax({
		url:"${ctx}/projectActivity/json/enterSave",
		type:"get",
		data:{
			"activityId": '${detail.activityId}'
		},
		dataType:"json",
		success:function(result){
			flags = true;
			layer.msg(result.msg);
			var enterCount = $("#enterCount").text();
			if(result.code==1){
				$("#enter").text("取消报名");
				$("#enterCount").text(Number(enterCount)+1);
			}else if(result.code==2){
				$("#enter").text("活动报名");	
				$("#enterCount").text(Number(enterCount)-1);
			}else if(result.code==3){
				$("#enter").text("活动结束");	
				$("#enter").parent().addClass("end");
			}else if(result.code==-2){
				layer.msg(result.msg);
			}
			$("#enterList").empty();
			$("#enterList2").empty();
			getEnterList(1);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			flags = true;
			//layer.msg("请求超时，请稍后重试");
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
			"activityId":'${detail.activityId}',
		},
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==2){
				$(".activityBar").append('<span style="padding: 50px;text-align: center;font-size: 16px;" class="renovateTitle">暂无更多信息</span>');
			}else{
				var list = result.value;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var text = info.activityDescription;
					text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
					text = text.replace(/<[^>]+>/g,"");
							  
					var _div =   '<div class="declareDataBar">'
						+'<a href="${ctx}/activity/detail/'+info.activityId+'?entranceId=${entranceId}">'
						+	'<div class="text-box">';
				    _div += '<div class="title-text"><div class="declareTitle">';
					if(info.status==1){
				  		_div += '<span class="flag flag1">报名中</span><span class="triang triang1"></span>';
				 		}else{
						_div += '<span class="flag flag2">已结束</span><span class="triang triang2"></span>';
						}
					_div += info.activityName+'</div>'
							
						+'<div class="declareData">'
						+	'<font>活动时间：'+info.start+'至'+info.end+'</font>'
						+	'<font>分类：'+info.activityTags.slice(0,info.activityTags.length-1)+'</font>'
						+	'<font>活动地址：'+info.activityLocation+'</font></div>'
						+'</div><div class="declare-content">'+text+'</div></div>'
						+'<img src="'+info.activityImage+'">'+'</a></div>';
					$(".activityBar").append(_div);
				}
			}
			if(result.code==1){
				$("#getMore").show();	
			}else{
				$("#getMore").hide();	
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			//layer.msg("请求超时，请稍后重试");
		}
	});
}
function getMore(){
	var pageNum = Number($("#pageNum3").val())+1;
	$("#pageNum3").val(pageNum);
	getActivityList(pageNum,1,"",'${projectActivityInfoBean.activityTags}');
}
</script>
</html>
