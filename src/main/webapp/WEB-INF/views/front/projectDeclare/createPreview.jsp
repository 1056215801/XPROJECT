<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目预览</title>
<link href="${ctx}/static/css/projectDeclare/createPreview.css" rel="stylesheet"/>
<script>
 $(function(){
	$('#saveBtn').click(function(){
		window.location.href="${ctx}/projectDeclare/save?declareId=${projectDeclareInfo.declareId}";
	});
	$('#editBtn').click(function(){
		window.location.href="${ctx}/projectDeclare/create?declareId=${projectDeclareInfo.declareId}";
	});
	 
	 //异步加载附件
	 var atIdList="${projectDeclareInfo.atIdList}";
		$.ajax({
			url:"${ctx}/login/json/attachment/selectListByAttachmentIdList",
			type:'get',
			data:{'attachmentIdList':atIdList},
			dataType:'json',
			success:function(datas){
				var data = JSON.parse(datas);
				for(var i = 0;i<data.attachments.length;i++){
					if(i==data.attachments.length){
						$('#getAtts').append(
								 "<a href='"+data.attachments[i].attachmentUrl+"' target='_blank'>"+data.attachments[i].remoteName+"</a>"
								);
						}else{
							$('#getAtts').append(
									 "<a href='"+data.attachments[i].attachmentUrl+"' target='_blank'>"+data.attachments[i].remoteName+"</a><br/>"
									);
							
						}
					}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
	 
	 
    $(".tabName ul li").each(function(){
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(1).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
 })
 

</script>
</head>

<body>
<div class="preview_main">
	<div class="project_header">
		<%@ include file="../common/header.jsp"%>
		<%-- <div class="tabItem">
			<ul>
				<li><a href="javascript:;">服务</a></li>
				<li><a href="${ctx }/projectDeclare/main">项目申报</a></li>
				<li><a href="activityRegistration.html">活动</a></li>
			</ul>
			<ul style="display: none;">
				<li><a href="javascript:;">办公</a></li>
				<li><a href="javascript:;">审计</a></li>
			</ul>
		</div>  --%>
	</div>
	
	<div class="preview_tipBar">
		<div class="preview_tip">当前处于预览模式</div>
		<input type="button" value="发布" class="redBtnContral" style="margin-right:15px;" id="saveBtn">
		<input type="button" id="editBtn" value="再次编辑" class="grayBtnContral">
		<div style="clear:both;"></div>
	</div>
	<div class="preview_content">
		<div style="margin:0 7px;">
		<c:if test="${projectDeclareInfo.isRecommend==1}">
			<img src="${ctx}/static/image/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">
		</c:if>
			<div style="padding:15px 18px;">
				<div class="details_Title">${projectDeclareInfo.declareTitle}</div>
				<%-- <div style="float:right; position:relative; top:5px;">
					<span class="font12 span_contral_t-3">一键分享</span>
					<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="17px;" height="17px;" style="margin-left:5px;">
					<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="17px;" height="17px;" style="margin-left:5px;">
					<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="17px;" height="17px;" style="margin-left:5px;">
					<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="17px;" height="17px;" style="margin-left:5px;">
				</div> --%>
				<div style="clear:both;"></div>
			</div>
			<div class="showBar">
				<div style="float:left;">
					<div class="declareDataLeft">发布时间：</div>
					<div class="declareDataRight"><fmt:formatDate value="${projectDeclareInfo.createTime}" pattern="yyyy年MM月dd日"/></div>
					<div class="declareDataLeft">项目级别：</div>
					<div class="declareDataRight">${projectDeclareInfo.declareGrade}</div>
					<div class="declareDataLeft">主管单位：</div>
					<div class="declareDataRight">${projectDeclareInfo.supervisorName}</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div style="border-bottom:1px dashed #ccc;"></div>
			<div style="width:90%;margin: 0 auto;">
				<div style="text-align: left">
						${projectDeclareInfo.declareText}
				</div>
				</div>
		<%-- 	<div style="text-align: right;">
			${projectDeclareInfo.supervisorName}
			</div> --%>
			<div id="getAtts">
			</div>
		</div>
		
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>
