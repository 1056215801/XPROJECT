<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>分享预览</title>
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
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
		$(".tabItem ul li").eq(0).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	
 });
</script>
<script type="text/javascript">
	$(function(){
		getAtts('${expShareInfo.attachmentId}');
		
	});
	function save(){
		window.location.href="${ctx}/expShare/save?expId=${expShareInfo.expId}";
		$(".greenBtnContral").attr('disabled',"true");
	 	$(".grayBtnContral").attr('disabled',"true");
	}
	
	function edit(){
		window.location.href="${ctx}/expShare/edit?expId=${expShareInfo.expId}";
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
</script>
</head>

<body>
<div class="share_main">
	<div class="project_header">
	    <%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="preview_tipBar">
		<div class="preview_tip">当前处于预览模式</div>
		<input type="button" onclick="save();" value="发布" class="greenBtnContral" style="margin-right:15px;">
		<input type="button" onclick="edit();" value="再次编辑" class="grayBtnContral">
		<div style="clear:both;"></div>
	</div>
	<div class="details_content">
		<div style="margin:0 7px;">
			<img src="${ctx}/static/image/experienceSharing/recommend.png" width="47px;" height="47px;" class="recommendItem">
			<div class="clearfix" style="padding:20px 18px;">
				<div class="detailsTitle">${expShareInfo.expTitle}</div>
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
			</div>
			<div style="border-bottom:1px dashed #ccc;"></div>
			<div style="padding:30px 50px 100px">
				<%-- <img src="${expShareInfo.expImage}" width="670" height="300" style="display:block; margin:0 auto;"> --%>
				<!-- <div style="margin:30px 0 50px;">
					<div style="text-indent:2em;">上汽北京公司2016年工作会议先进交流材料之一：</div>
					<div style="font-weight:bold; text-align:center;">众筹智慧促提升&nbsp;创新求变谋发展</div>
					<div style="text-align:right;">---严永荣（烟台公司副总经理、青岛分公司总经理）</div>
				</div> -->
				<div style="text-indent:2em;">${expShareInfo.expText}</div>
				<div style="margin:30px 0 50px;"></div>
				<div style="margin-top:20px;" id="attr">
					<div class="detailsDataLeft">附件：</div>
					<div class="detailsDataRight" id="attList"></div>			
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>
