<!-- ç±»å1 --><%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>产业招聘月报</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-nav"><p>产业招聘月报</p><a href="${ctx}/yc/list?type=2&entranceId=${entranceId}">返回列表 ></a></div>
						<div class="artical-content">
						     <div class="declareTitle" style="text-align: center;padding: 20px 0px 0px 0px;">
							</div>
							<div class="detailImg_div"></div>
						</div>
					</div>
					
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import>
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
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script src="${ctx}/static/js/url.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".nav-content a").removeClass("on");
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(2)").addClass("on");
	}else{
		$(".nav-content a:eq(1)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(8)").addClass("on");
	var id = '${id}';
	getDetail(id);
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
});

function getDetail(id){
	 $.ajax({
			url : "${urlPath}XOffice/interface/json/gatherDataCount/view",
			type:'get',
			data:{'id':id},
			dataType:'json',
			success:function(data){
				 $('.declareTitle').html(data.infoBean.title);
					var  attachmentIds = data.infoBean.attachmentIds;
				 	if(attachmentIds==null||attachmentIds==undefined){
						$('.detailImg').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无详情信息</span></div>');
				 	}else{
				 	 	getAtts(attachmentIds);
				 	}

			},
			error:function(){
				alert("访问后台异常!");
			}
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
				if(value.length>0){
					var attachmentUrl = value[0].attachmentUrl;
					$('.detailImg_div').append('<img class="detailImg" src="'+attachmentUrl+'">');
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
</script>
</html>
