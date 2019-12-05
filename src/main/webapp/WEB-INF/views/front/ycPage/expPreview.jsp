<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>动态预览</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
</head>

<body>
<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-12">
						<div class="artical-nav"><p class="artical_p">动态预览</p><a href="${ctx}/experience/list?entranceId=${entranceId}&type=2">返回列表 ></a></div>
						<div class="artical-content">
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
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="authorityTips" style="display: none;">
			<div>
				<img src="${ctx}/static/image/projectDeclare/headPortrait.png"
					width="90px;" height="90px;"
					style="display: block; margin: 25px auto;">
				<div style="margin: 0 auto 30px; color: #aaa; text-align: center;">你当前账号未开通发布项目权限</div>
				<div style="width: 80%; margin: 0 auto;">
					<input type="button" class="button button-raised button_Contral"
						style="width: 37%;" value="暂不申请"> <input type="button"
						class="button button-raised button-caution button_Contral"
						style="width: 58%;" value="我要申请">
				</div>
			</div>
		</div>
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
	
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript">
	$(function(){
		getAtts('${expShareInfo.attachmentId}');
		$(".nav-content a").removeClass("on");
		$(".nav-content a:eq(3)").addClass("on");
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
	function save(){
		window.location.href="${ctx}/expShare/save?expId=${expShareInfo.expId}&isFwpg=1&entranceId=${entranceId}";
		$(".greenBtnContral").attr('disabled',"true");
	 	$(".grayBtnContral").attr('disabled',"true");
	}
	
	function edit(){
		window.location.href="${ctx}/experience/edit?expId=${expShareInfo.expId}";
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
</body>
</html>
