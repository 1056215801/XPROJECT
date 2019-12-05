<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>${expShareInfo.expTitle}</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<style type="text/css">
.detailsText img{
	width:100%;
}

.detailsDataLeft {
    float: left;
    text-align: right;
    width: 70px;
}
.detailsDataRight {
    margin-left: 70px;
}
</style>
<script type="text/javascript">
	$(function(){
		if(${expShareInfo.status eq 1}){//已发布的经验分享才具有评论功能
			getList(1);	
		}
		var str=location.href;
		if(str.indexOf("main=1")!=-1){
			$("#back_a").attr("href","${ctx}/auth/page/mobile/weixin/experienceSharing_fgw/weixin/main");
		}
		
		//如果不需要横向滑动显示内容 则去除横向滚动条
		if($(".detailsText").width()==$(".detailsText")[0].scrollWidth){
			$(".detailsText").css("overflow-x","");
		}
		
		getAtts('${expShareInfo.attachmentId}');
	})
	
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
	
	/* 异步获取评论列表 */
	page = 1;
	function getList(pageNum) {
		$.ajax({
			url : "${ctx}/projectActivity/json/commentList",
			type : "get",
			data : {
				"pageNum": pageNum,
				"kind":202,
				"activityId":'${expShareInfo.expId}'
			},
			dataType : "json",
			success : function(result) {
				if (pageNum == 1) {
					$("#commentList").empty();
					$("#commentList_hide").empty();
				}
				if (result.code == -1 || result.code == 2) {
					$("#proList").show();
					$("#getmoreComment").hide();
				} else {
					$("#proList").hide();
					var list = result.value;
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var _div = "";
						_div += "<div class=\'detailsComCont\'>";
						_div += "  <div class=\'clearfix\'>";
						if(info.imageUrl!=""&&info.imageUrl!=null){
							_div += '<img src="'+info.imageUrl+'" width=\'22px;\' height=\'22px;\' style=\'float:left; border-radius:22px;\'>';
						}else{
							_div += '<img src="${ctx}/static/weixin/images/experienceSharing/headPortrait.png" width=\'22px;\' height=\'22px;\' style=\'float:left; border-radius:22px;\'>';
						}
						_div += "    <div class=\'detailsComName\'>";
						_div += info.commentUser;
						_div += "	 </div>";
						_div += "    <div class=\'detailsComTime\'>";
						_div += info.comTime;
						_div += "	 </div></div>";
						_div += "    <div class=\'detailsCom\'>";
						_div += info.commentContent;
						_div += "	 </div><div style=\'clear:both;\'></div>";
						if(info.isCurComment=='true'){
							_div += '<a href="javascript:;" style="float:right; margin-left:10px;text-decoration:none;">'
								+'<span style="color:#9c9c9c;font-size:12px;" onclick="commentDelete(\''+info.commentId+'\')">删除</span>'
								+'</a>';
						}
						_div += '<a href="javascript:;" style="float:right;text-decoration:none;">'
							+'<img src="${ctx}/static/image/activity/replay.png" width="15px;" height="15px;" class="img_contral_t2">&nbsp;'
							+'<span style="color:#9c9c9c;font-size:12px;" onclick="commentReply(\''+info.commentId+'\',\''+info.commentUser+'\')">回复</span>'
							+'</a>';
						_div += "	 <div style=\'clear:both;\'></div></div>";
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
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				layer.msg("网络异常");
			}
		});
	}
	
	//回复评论
	function commentReply(replyId,replayUser){
		//判断是否登录
		if(${empty curAccountId}){//未登录
			layer.msg("亲，您还没有登录");
			setTimeout(function() {
				window.location.href=("${ctx}/experienceSharing_fgw/weixin/detail/${expShareInfo.expId}");
			}, 1000);
		}else{
			$("#commentMsg").val("回复"+replayUser+"：");
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
					commentSave(replyId,"回复"+replayUser+"：");
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
						page=1;
						$("#getMore").html("展开更多评论");
						getList(page);
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
	
	/* 时间格式转换 */
	function getTime(time) { 
		var date = new Date(time);
		Y = date.getFullYear() ;
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1);
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y +"-"+ M +"-"+ D +" "+h+m+s);
	}
	
	/* 加载更多 */
	function getmoreComment() {
		if($("#getMore").text()=="展开更多评论"){
			$("#commentList_hide").show();
			$("#getMore").text("收起更多评论");
		}else{
			$("#commentList_hide").hide();
			$("#getMore").text("展开更多评论");
		}
	}
	
	/* 发表评论 */
	function sendComment(){
		//判断是否登录
		if(${empty curAccountId}){//未登录
			layer.msg("亲，您还没有登录");
			setTimeout(function() {
				window.location.href=("${ctx}/experienceSharing_fgw/weixin/add/detail/${expShareInfo.expId}");
			}, 1000);
		}else{
			$("#commentMsg").val("");
			commentIndex=layer.open({
				type : 1,
				title : '评论留言',
	 			skin : 'layui-layer-tl_green',
				shadeClose : true,
				area : [ '250px', '220px' ],
				btn:'提交',
				closeBtn: 1,
				anim: 1,
				content : $('#inputComment'),
				yes: function(index, layero){
					commentSave("","");
				}
			});
		}
	}
	
	function commentSave(replyId,regStr){
		var commentContent = $("#commentMsg").val();
		if(commentContent == null ||commentContent == ""){
			layer.msg("评论内容不能为空");
			return;
		}
		if(commentContent.replace(regStr,"").replace(/\s/g,"")==""){
			layer.msg("评论内容必须包含可见字符");
			return;
		}
		$.ajax({
			url:"${ctx}/projectActivity/json/commentSave",
			type:"post",
			headers:{"token":'${pageContext.session.id}'},
			data:{
					"commentContent":commentContent,
					"activityId":'${expShareInfo.expId}',
					"replyId":replyId,
					"kind":202,
					'${_csrf.parameterName}':'${_csrf.token}'
				},
			dataType:"json",
			success:function(result){
				if(result.code==1){
					layer.close(commentIndex);
					layer.msg("发布成功", {
						time: 1000
					}, function(){setTimeout(function(){
						page=1;
						$("#commentList_hide").hide();
						$("#getMore").html("展开更多评论");
						getList(page);
					},1000);});
				}else{
					layer.msg(result.msg);
				}
			},
			error:function(){
				layer.msg("系统异常");
			}
		});
	}
	
	/* 删除分享 */
	function deleteExp(expId){
		var confirmIndex = layer.confirm("确定删除吗?",function(index, layero){
			layer.close(confirmIndex);
			window.location.href="${ctx}/experienceSharing_fgw/weixin/delete?expId="+expId
		});
	}
</script>
</head>
<body>
<div class="details_main">
	<div class="details_content">
		<c:if test="${expShareInfo.status eq 2}">
			<div style="padding:5px 0;">
				<div class="detailsStateBlue">审核中</div>
			</div>
		</c:if>
		<c:if test="${expShareInfo.status eq 0}">
			<div style="padding:5px 0;">
				<div class="detailsStateGray">未通过审核</div>
			</div>
		</c:if>
		<div class="detailsCont">
			<div class="detailsContTop clearfix">
				<div class="detailsContTopRight">
					<div class="detailsContTitle">${empty expShareInfo.expTitle?"无标题":expShareInfo.expTitle}</div>
					<div class="detailsContPosition">
						<div>
							<img src="${ctx}/static/weixin/images/experienceSharing/enterCount.png" width="12" height="12">
							<span>${empty expShareInfo.expUnit?"&nbsp;":expShareInfo.expUnit}</span>
						</div>
						<div>
							<img src="${ctx}/static/weixin/images/experienceSharing/location.png" width="12" height="12" style="position: relative; top: 1px;">
							<span>${empty expShareInfo.provinceName?"&nbsp;":expShareInfo.provinceName}&nbsp;
							${empty expShareInfo.areaName?"&nbsp;":expShareInfo.areaName}</span>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${expShareInfo.status eq 1}">
				<div class="detailsContBottom clearfix"><!--当不需要浏览与评论时，去除此div即可-->
					<div style="float:left;">
						<img src="${ctx}/static/weixin/images/experienceSharing/eye.png" width="12" height="12">
						<span>${empty expShareInfo.browseCountEdit?0:expShareInfo.browseCountEdit}浏览</span>
					</div>
					<div style="float:right;">
						<img src="${ctx}/static/weixin/images/experienceSharing/talk.png" width="12" height="12">
						<span>${empty expShareInfo.commentCount?0:expShareInfo.commentCount}评论</span>
					</div>
				</div>
			</c:if>
			<c:if test="${expShareInfo.isTop==1}">
				<img src="${ctx}/static/weixin/images/experienceSharing/recommend.png" width="45" height="45" class="recommendItem">
			</c:if>
		</div>
		<div class="detailsCont" style="padding:15px;">
			<img src="${expShareInfo.expImage}" width="90%" style="display:block; margin:0 auto 15px;">
			<div class="detailsText" style="width:100%;overflow-x:scroll;">
				${expShareInfo.expText}
			</div>
		</div>
		<div class="clearfix" style="background-color: #fff;" id="attr"> 
			<div class="detailsDataLeft">附件：</div>
			<div class="detailsDataRight" id="attList"></div>
		</div>
		<c:if test="${expShareInfo.status eq 1}">
			<div class="detailsComment"><!--当不需要评论时，去除此div即可-->
				<div class="detailsComTitle">相关评论</div>
				
				<div id="commentList"></div>
				<div id="commentList_hide" style="display:none;"></div>
				<div style="text-align: center;">
					<span id="proList" class="renovateTitle">暂无评论</span>
				</div>
				
				<div id="getmoreComment">
					<a href="javascript:void(0);" onClick="getmoreComment();" class="comRenovate">
						<span id="getMore" class="comRenovateTitle">展开更多评论</span>
					</a>
				</div>
			</div>
		</c:if>
	</div>
	
	<div class="fixed_bottom">
		<a id="back_a" href="javascript:history.go(-1);">
			<img src="${ctx}/static/weixin/images/experienceSharing/return.png" width="20px;" height="20px;" class="returnBtn"/>
		</a>
		<c:if test="${isCurrentAccount}">
			<div class="bottom_operation" onclick="deleteExp('${expShareInfo.expId}');">
				<img src="${ctx}/static/weixin/images/experienceSharing/delete.png" width="20px;" height="20px;"/>
				<span class="spanContral_1" style="color:#ee4848;">删除</span>
			</div>
		</c:if>
		<c:if test="${expShareInfo.status eq 1}">
			<div class="bottom_operation" onclick="sendComment();">
				<img src="${ctx}/static/weixin/images/experienceSharing/newmessage.png" width="20px;" height="20px;"/>
				<span class="spanContral_1" style="color:#5DB75D;">评论留言</span>
			</div>
		</c:if>
		<div style="clear:both;"></div>
	</div>
</div>

<!-- 评论留言输入框 -->
<div id="inputComment" style="display: none; padding: 15px 20px; position: fixed; overflow: hidden;">
	<textarea id="commentMsg" style="width: 200px; height: 90px; outline: none; resize: none"></textarea>
</div>
</body>
</html>