<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发布预览</title>
<link href="${ctx}/static/css/activity/releasePreview.css" rel="stylesheet"/>
<link href="${ctx}/static/css/activity/layer.css" rel="stylesheet"/>
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
			$(".tiitleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	
	$('#detailContent').height($('#detailContent')[0].scrollHeight);
	$('#detailContent').css("overflow","hidden");
 });
</script>
<script type="text/javascript">
	//发布
	function releaseSave(){
		$.ajax({
			url:"${ctx}/projectActivity/json/activitySave",
			type:"get",
		 	success:function(result){
		 		if(result.code==1){
		 			releaseSuccess(result.msg);
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
	
	//再次编辑
	function releaseEdit(){
		window.location.href="${ctx}/projectActivity/create?type=2";
	}
	
	//发布成功后处理
	function releaseSuccess(activityId) {
		layer.open({
			type : 1,
			title : false,
			shadeClose : true,
			shade : [ 0 ],
			area : [ '400px', '200px' ],
			time : 2000,
			closeBtn : 0,
			content : $('#releaseSuccess'),
			end : function() {
				window.location.href="${ctx}/projectActivity/details/"+activityId;
			}
		});
	};

</script>
</head>

<body>
<div class="preview_main">
	<div class="project_header">
		<%@ include file="../common/header.jsp"%>
		
	</div>
	
	<div class="preview_tip">
		<div style="float:left;color:#F00; margin:5px 15px 0">当前处于预览模式</div>
		<input type="button" onclick="releaseSave();" value="发布" class="release_btn release_rel">
		<input type="button" onclick="releaseEdit();" value="再次编辑" class="release_btn release_pre">
		<div style="clear:both;"></div>
	</div>
	<div class="preview_content">
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
						<img src="${ctx}/static/image/activity/activityTags.png" width="12px;" height="12px;" class="img_contral">&nbsp;
						<span>
							<c:forEach items="${projectActivityInfoBean.activityTags}" var="index">
								${index}&nbsp;
							</c:forEach>
						</span>
					</div>
					<div class="right_data">
						<img src="${ctx}/static/image/activity/time.png" width="12px;" height="12px;" class="img_contral">&nbsp;
						<span>${projectActivityInfoBean.start} 至 ${projectActivityInfoBean.end}</span>
					</div>
					<div class="right_data">
						<img src="${ctx}/static/image/activity/location.png" width="12px;" height="12px;" class="img_contral">&nbsp;
						<span>${projectActivityInfoBean.activityLocation}</span>
					</div>
					<div class="right_data">
						<img src="${ctx}/static/image/activity/enterCount.png" width="12px;" height="12px;" class="img_contral">&nbsp;
						<span>已报名人数：<span style="color:#F14241">1</span>人</span>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="details_cont">
			<div class="titleName">
				<ul>
					<li><a href="javascript:;">活动详情</a></li>
				</ul>
				<div style="clear:both;"></div>
			</div>
			<div class="tiitleItem">
				<div style="padding:15px 20px;">
					<textarea id="detailContent" style="width: 100%;background:#FFF;border: 0;" disabled="disabled">${projectActivityInfoBean.activityDescription}</textarea>
				</div>
				
			</div>
		</div>
	</div>
	
	<div id="releaseSuccess" style="display:none;">
		<div style="margin:20px auto; font-size:18px; text-align:center;">
			<img src="${ctx}/static/image/activity/success.png" width="70px;" height="70px;">
			<div>恭喜你，活动发布成功！</div>
			<div><span style="color:#F00; font-size:24px;">2</span>&nbsp;秒后自动跳转到该活动页面</div>
		</div>
	</div>
	
	 <%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>
