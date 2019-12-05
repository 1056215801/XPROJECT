<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../common/page.jsp"%><!-- 前端分页 -->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>金融服务</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_content_header">
			<div class="container newNav">
			     <div class="newNavSub">
			     	<img src="${ctx}/static/image/homePage_yc/projectDsc.png" />
			     </div>
			    <div class="newNavSub">
			    	<p class="navTitle">金融服务</p>
			    	<p><font class="projectNum" id="projectNum1">2</font>&nbsp;
				<font id="font1">家</font> &nbsp;&nbsp; <font id="font2">金融服务</font></p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
						    <div class="jrParent">
						    	<div class="jrService" onclick="openUrl(1)">
								  <img src="${ctx}/static/image/homePage_yc/jrService1.png">
								</div>
								<div class="jrService" onclick="openUrl(2)">
									<img src="${ctx}/static/image/homePage_yc/jrService2.png">
								</div>
						    </div>
						</div>
					</div>
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}"/>
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
<script src="${ctx}/static/js/plugins/pagination/jquery.pagination.js"></script> 
<script type="text/javascript">
var isBox0 = true;
var serviceKind = '';
var areaId = '';
var provinceId = 360000;
$(function(){
	$(".nav-content a").removeClass("on");
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(3)").addClass("on");
		$("#thirdMenu p:eq(0) a:eq(2)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(0) a:eq(2)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(14)").addClass("on");
	
});
function openUrl(type){
	if(type==1){
		window.open('https://www.bjdp2p.com','_blank');
	}else{
		window.open('https://www.pbcsurvey.org.cn/ncrhportal/','_blank');
	}
}
</script>
</html>

