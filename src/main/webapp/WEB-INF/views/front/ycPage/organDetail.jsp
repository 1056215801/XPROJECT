<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>机构详情</title>
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
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
						<div class="organ-nav"><p id="organTitle"></p><a href="${ctx}/organ/list?entranceId=${entranceId}">返回列表 ></a></div>
						<div class="artical-content" style="margin-top: 10px;">
							<div class="declareDataBar fz0">
								<div class="text-box_title">
									<div class="declareData">
										<ul>
											<li><img onclick="shareToQQFriend(event,'动态')" src="${ctx}/static/image/qq.png" title="分享到QQ"></li>
											<li><img onclick="shareToWx(event)" src="${ctx}/static/image/wx.png" title="分享到微信"></li>
											<li><img onclick="shareToWb(event)" src="${ctx}/static/image/wb.png" title="分享到微博"></li>
											<li><img id='copyTo' src="${ctx}/static/image/cp.png" title="复制链接"></li>
										</ul>
									</div>
									<div class="declareData" id="position">
									</div>
								</div>
							</div>
							<div class="organ-main">
								<div class="organ-content" id="content1">
									<div class="organ-subContent" id="organ-subContent1">服务机构</div>
									<div class="texts" id="texts1">
									</div>	
									</div>
								<div class="organ-content" style="margin-top:30px;" id="content2">
									<div class="organ-subContent" id="organ-subContent2">服务案例</div>	
									<!-- <div class="texts" id="texts2" style="text-align: center; color: #ccc;padding: 20px 50px;">
									     暂无
									</div>	 -->
								</div>
							</div>
					<%-- 		<div class="reply">
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
											</div>
										</div>
										<div class="tab" id="tabs1" style="display: none;">
											<div class="tab-list" id="myCommentList">
											</div>
										</div>
									</div>
								</div>
							</div> --%>
						</div>
					</div>
					<div class="col-md-3">
						<div class="organ-fir-floor">
							<div class="organ-title">服务机构名片</font></div>
							<div class="industry-new" id="organCard">
							</div>
						</div>
						 <div class="for-floor" id="secondfloor">
							<div class="imgView">
								<div class="img-title">图库</div>
								<div style="padding: 20px;">
									<div class="swiper-wrapper" id="swiper2">
							   	 	<div class="swiper-wrapper" id="swiper2Chirld">
							   	 	
								 	</div>		
								 </div>
								</div>
							    <div class="swiper-button-prev swiper-button-white"></div>
							    <div class="swiper-button-next swiper-button-white"></div>
							</div>
						</div> 
						 <div class="for-floor">
							<div class="contactView">
							</div>
						</div> 
					</div>
					<div style="display:none" id="qrcode">     
						<img src='${detail.qrCode}'  width="250px;" height="250px;"/>
				  	    <br>&nbsp;&nbsp;打开微信，点击底部的“发现”
					    <br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
    			  </div>
					<%-- <c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import> --%>
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
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(3)").addClass("on");
		$("#thirdMenu p:eq(2) a:eq(2)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(2) a:eq(2)").addClass("on");
	}
	$(".fr li").eq(1).addClass("on");
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(13)").addClass("on");
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
	getDetail();
	getCommentList(1,'1');
});
function getDetail(){
	$.ajax({
		url:"${urlPath}XOffice/interface/json/serviceInstitutionInfo/view",
		type:"post",
		data:{
			"id":'${id}'
		},
		dataType:"json",
		success:function(result){
			var items = result.value;
			getCompanypicture(items.institutionId);
			$('#organTitle').text(items.institutionName);
			var div = "";
			if(items.viewCount1){
				div +=  '<img src="/XProject/static/image/experienceSharing/browseCount.png">浏览量：'+(Number(items.viewCount)+Number(items.viewCount1))+' 次 '
			}else{
				div +=  '<img src="/XProject/static/image/experienceSharing/browseCount.png">浏览量：'+items.viewCount+' 次 '
			}
			div +=	'<img src="/XProject/static/image/homePage_yc/position.png">'
			if(items.instPrName){
				div += '<font>'+items.instPrName+'</font>'
			}
			if(items.instAreaName){
				div += '<font>'+items.instAreaName+'</font>'
			}
			if(items.instSpaceName){
				div += '<font>'+items.instSpaceName+'</font>'
			}
			$('#position').append(div);
			if(items.serviceContent){
				$('#content1').append('<div class="texts" id="texts1">'+items.serviceContent+'</div>');
			}else{
				$('#content1').append('<div class="texts" id="texts1" style="text-align: center; color: #ccc;padding: 20px 50px;">暂无</div>');
			}
			if(items.serviceCase){
				$('#content2').append('<div class="texts" id="texts2">'+items.serviceCase+'</div>');
			}else{
				$('#content2').append('<div class="texts" id="texts2" style="text-align: center; color: #ccc;padding: 20px 50px;">暂无</div>');
			}
			
			var div2 = "";
			div2 += '<div class="organ-imgDiv"><img src="'+items.logoUrl+'"></div>'
			div2 +=	'<div class="organ-text1">'+items.institutionName+'</div>'
			div2 +=	'<div class="organ-text2">服务类别：'+(items.serviceKindName?items.serviceKindName:'')+'</div>'
/* 			div2 +=	'<div class="organ-text2">服务案例：'+(items.serviceCase?items.serviceCase:'')+'</div>'
 */			div2 +=	'<div class="organ-text2">擅长领域：'+(items.researchDirection?items.researchDirection:'')+'</div>' 
			$('#organCard').append(div2);
			var div3 = "";
			div3 += '<div class="img-title">联系方式</div>'
			div3 +=	'<div class="contact-content">'
			div3 += '<div class="content">'
			div3 +=	 '<div class="left-content">联系人：</div>'
			div3 +=	 '<div class="right-content">'+items.contactName+'</div>'
			div3 +=  '</div>'
			div3 += '<div class="content" style="border:none">'
			div3 += '<div class="left-content">联系电话：</div>'
			div3 +=	'<div class="right-content">'+items.contactPhone+'</div>'
			div3 += '</div>'
			if(items.officePhone){
					div3 += '<div class="content">'
					div3 += '<div class="left-content"></div>'
					div3 +=	'<div class="right-content">'+items.officePhone+'</div>'
					div3 += '</div>'
			}
			if(items.institutionAddress){
			 		div3 += '<div class="content" style="border:none">'
					div3 +=	'<div class="left-content">地址：</div>'
					div3 +=	'<div class="right-content">'+items.institutionAddress+'</div>'
					div3 += '</div>' 
			}
			div3 += '</div>'
			$('.contactView').append(div3);
			
			
		},
		error : function() {
			layer.msg("地址请求超时，请刷新页面！");
		}
	})
}
//获取企业图库
function getCompanypicture(companyId){
	if(companyId==undefined||companyId==''){
		$('#secondfloor').hide();
	}else{
      	$.ajax({
			url : "${urlPath}XOffice/interface/json/organizationImage/list",
			type : "post",
			data : {
				"organizationId":companyId,
				"pageSize":'100',
				"pageNum":'1 '
			},
			dataType : "json",
			success : function(result) {
				if(result.success){
					var imgList = result.list
					if(imgList.length<1){
						$('#secondfloor').hide();
					}else{
						for(var i=0; i<imgList.length;i++){
							var info = imgList[i];
							var div = "";
							div +=  '<div class="swiper-slide"><img src="'+info.imageUrl+'" style="height:100%; width: 100%;"></div'
							$("#swiper2Chirld").append(div);
						}
						 var swiper2 = new Swiper('#swiper2', {
							 	autoplay:false,  
							    slidesPerView : 1,
							    slidesPerGroup : 1,
							    spaceBetween : 1,
							    observer:true,  
							    navigation: {
							        nextEl: '.swiper-button-next',
							        prevEl: '.swiper-button-prev',
						        },
						 });
						
					}
				}else{
					layer.msg("系统异常");
				}
			},
			error : function() {
				layer.msg("系统异常");

			}
		});
	}
	
}
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
				"kind":203,
				"activityId":'${id}'
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
				"kind":203,
				"activityId":'${id}',
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
