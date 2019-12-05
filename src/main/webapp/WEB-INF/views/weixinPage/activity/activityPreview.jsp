<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>发布预览</title>
<link href="${ctx}/static/weixin/css/activity/releasePreview.css" rel="stylesheet"/>
<script type="text/javascript">

function releaseSave(){
	$.ajax({
		url:"${ctx}/projectActivity/json/activitySave",
		type:"get",
	 	data:$("#form").serialize(),
	 	dataType:"json",
	 	success:function(result){
	 		if(result.code==1){
	 			releaseSuccess(result.msg);
	 		}else{
	 			layer.alert(result.msg);
	 		}
	 	}
	});
}

//再次编辑
function releaseEdit(){
	window.location.href="${ctx}/projectActivity/weixin/activityCreate?type=2";
}

//发布成功后处理
function releaseSuccess(activityId) {
	layer.open({
		type : 1,
		title : false,
		shadeClose : true,
		shade : [ 0 ],
		area : [ '400px', '200px' ],
		time : 3000,
		closeBtn : 0,
		content : $('#releaseSuccess'),
		end : function() {
 			window.location.href="${ctx}/projectActivity/weixin/detail/"+activityId;
 		}
	});
};



 


</script>


</head>



<body>
<div class="preview_main">
    <form action="" method="get" id="viewform">
	</form>
	<div style="width:90%; padding:10px 5%; background-color:#FDFFD8; color:#F04444;">
		当前处于预览模式
	</div>
	<div class="preview_content">
	    <div style="position: relative;">
		<img src="${projectActivityInfoBean.activityImage}" width="100%;" height="180px;" style="display:block;">
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
		<div class="details_info">
			<div class="details_title">${projectActivityInfoBean.activityName}</div>
			<div class="details_dataBar">
				<div>
					<img src="${ctx}/static/weixin/images/activity/label.png" width="12px;" height="12px;">&nbsp;
					<span>
					   <c:forEach items="${projectActivityInfoBean.activityTags}" var="index">
								${index}&nbsp;
							</c:forEach>
					</span>
				</div>
				<div>
					<img src="${ctx}/static/weixin/images/activity/time.png" width="12px;" height="12px;">&nbsp;
					<span>${projectActivityInfoBean.start} 至 ${projectActivityInfoBean.end}</span>
				</div>
				<div>
					<img src="${ctx}/static/weixin/images/activity/location.png" width="12px;" height="12px;">&nbsp;
					<span>${projectActivityInfoBean.activityLocation}</span>
				</div>
			</div>
			<div class="details_human">
				<div>
					<img src="${ctx}/static/weixin/images/activity/applyname.png" width="17px;" height="17px;" style="position:relative; top:3px;">&nbsp;
					<span>已有<span style="color:#F14241">1</span>人报名</span>
				</div>
			</div>
		</div>
		<div class="info_top">
			<div class="info_title">活动详情</div>
		</div>
		<div class="details_cont">
			<div class="titleName">
				<div style="clear:both;"></div>
			</div>
			<div class="tiitleItem">
				<div style="padding:15px 20px;">
					<textarea style="width: 100%;height:200px; background:#FFF;border: 0;" disabled="disabled">${projectActivityInfoBean.activityDescription}</textarea>
				</div>
				
			</div>
		</div>
	</div>
	<div id="releaseSuccess" style="display: none;">
		<div style="margin: 20px auto; font-size: 18px; text-align: center;">
			<img src="${ctx}/static/image/activity/success.png" width="70px;" height="70px;">
			<div>恭喜你，活动发布成功！</div>
			<div>
				<span style="color: #F00; font-size: 24px;">3</span>&nbsp;秒后自动跳转到该活动页面
			</div>
		</div>
	</div>
	<div class="fixed_bottom">
		<a href="javascript:;" onClick="javascript:history.back(-1);" style="text-decoration:none;">
		<img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;" class="returnBtn"/>
		</a>
		<div class="bottom_operation">
	     	<a href="javascript:;" onClick="javascript:releaseEdit();" style="text-decoration:none;">
			 	<img src="${ctx}/static/weixin/images/logistics/edit.png" width="20px;" height="20px;"/>
			 	<span class="spanContral_1" style="color:#01A858;">编辑</span>
			</a>
			<a href="javascript:;" onClick="javascript:releaseSave();" style="text-decoration:none;">
			 	<img src="${ctx}/static/weixin/images/activity/publicactivity.png" width="20px;" height="20px;"/>
				<span class="spanContral_1" style="color:#F14241;">发布</span>
			</a>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>
</body>
</html>
