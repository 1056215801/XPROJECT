<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>供需详情</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/showFront/factorSharing.css" rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/buttons.css" rel="stylesheet" />
<link href="${ctx}/static/css/product/pictureShow.css" rel="stylesheet"/>
<style type="text/css">
.commentBar {
	padding:30px 0;
	border-bottom:1px solid #e6e6e6;
}
.msg_til{    font-size: 22px;
    margin-left: 10px;
    color: red;}
.border_bottom{border-bottom: 1px solid #e6e6e6;padding-bottom:10px;}
</style>
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
				<div class="artical-nav"><p class="artical_p">产品详情</p><a href="${ctx}/supply/list?entranceId=${entranceId}">返回列表 ></a></div>
				<div class="artical-content" style="padding: 10px;">
				  	<div class="Xcontent">
					<ul class="Xcontent01">
						<div class="Xcontent06"><img src="${supplyDemand.picUrl}" width="100%" height="430px;"/></div>
						<ol class="Xcontent08" style="overflow-y:auto;width:95px;">
							 <div class="Xcontent07"><img src="${supplyDemand.picUrl}" width="100%" height="100%"></div>
							<c:forEach items="${imageList}" var="image" varStatus="n">
						       <div class="${n.index eq 0?'Xcontent07':'Xcontent09'}"><img src="${image.url}" width="100%" height="100%"></div>
							</c:forEach>
						</ol>
						<ol class="Xcontent13">
							<div class="Xcontent14">
								<c:choose>
									<c:when test="${supplyDemand.type eq 1}">
										<img src="${ctx}/static/weixin/images/supply/give.png" width="40" height="40">
									</c:when>
									<c:otherwise>
										<img src="${ctx}/static/weixin/images/supply/need.png" width="40" height="40">
									</c:otherwise>
								</c:choose>
								<span>${supplyDemand.productName}</span>
							</div>
							<div class="Xcontent16">${supplyDemand.companyName}</div>
								<div class="Xcontent17">
									<div class="Xcontent23">
										<p class="Xcontent24">类别</p>
										<p class="Xcontent25">${supplyDemand.categoryName}</p>
									</div>
									<div class="Xcontent23">
										<p class="Xcontent24">联系人</p>
										<p class="Xcontent25">${supplyDemand.contactName}</p>
									</div>
									<div class="Xcontent23">
										<p class="Xcontent24">联系电话</p>
										<p class="Xcontent25">${supplyDemand.contactPhone}</p>
									</div>
									<div class="Xcontent23">
										<p class="Xcontent24">所在地</p>
										<p class="Xcontent25">
											<c:choose>
												<c:when test="${supplyDemand.provincName == '' && supplyDemand.areaName == '' }">
													暂无地址
												</c:when>
												<c:otherwise>
													${supplyDemand.provincName}&nbsp;${supplyDemand.areaName}
												</c:otherwise>
											</c:choose>
										</p>
									</div>
								</div>
								<div style="overflow:hidden; margin-top:15px;">
									<c:choose>
										<c:when test="${supplyDemand.status==1}">
											<div class="collectionBtn" onclick="collect(this, 2, '${supplyDemand.id}', '${supplyDemand.productName}')" data="${supplyDemand.isCollect}">
												<c:if test="${supplyDemand.isCollect==0}">
													<img src="${ctx}/static/image/product/notCollected.png" width="20">
												</c:if>
												<c:if test="${supplyDemand.isCollect==1}">
													<img src="${ctx}/static/image/product/alreadyCollect.png" width="20">
												</c:if>
												<span>立即收藏</span>
											</div>
											<div class="messageBtn" onclick="message(2, '${supplyDemand.id}', '${supplyDemand.productName}', '${supplyDemand.companyId}')">
												<span style="margin:0 10px;">在线留言</span>
											</div>
										</c:when>
										<c:otherwise>
											<span><font style="font-size: 24px; color: red; ">该供需已下架！</font></span>
										</c:otherwise>
									</c:choose>
								</div>
								<div style="margin-top:18px;">
									<span style="font-size:12px;">一键分享</span>
									<img onclick="shareToQQFriend(event,'产品')" src="${ctx }/static/image/product/qq.png" style="margin-left: 5px; cursor: pointer;"> 
									<img onclick="shareToWx(event)" id="wxImg" src="${ctx }/static/image/product/wx.png" style="margin-left: 5px; cursor: pointer;"> 
									<img onclick="shareToWb(event)" src="${ctx }/static/image/product/wb.png" style="margin-left: 5px; cursor: pointer;"> 
									<img id='copyTo' src="${ctx }/static/image/product/cp.png" style="margin-left: 5px; cursor: pointer;">
								</div>
							</ol>
						</ul>
					</div>
				<div>
				<div class="titleName clearfix">
					<ul>
						<li><a href="javascript:;">详情</a></li>
						<li><a href="javascript:;">联系企业</a></li>
						<li><a href="javascript:;">交流详情</a></li>
					</ul>
				</div>
				<div class="titleItem">
				<div>
					<div style="padding-top:10px; min-height:200px;">
						<c:if test="${supplyDemand.description==null || supplyDemand.description=='' }">
							<div style="color:#9f9f9f;">暂无详情</div>
						</c:if>
						<c:if test="${supplyDemand.description!=null&& supplyDemand.description!='' }">
							${supplyDemand.description}
						</c:if>
					</div>
				</div>
				<div style="display:none;">
					<div style="padding-top:10px; min-height:200px;">
						<div>联系人：${empty supplyDemand.contactName?"暂无":supplyDemand.contactName}</div>
						<div>联系电话：${empty supplyDemand.contactPhone?"暂无":supplyDemand.contactPhone}</div>
					</div>
				</div>
				<div style="display: none;">
						<div style="padding-top: 10px; min-height: 200px;">
							<c:forEach items="${messageList}" var="messageInfo">
								<div class="commentBar hidden" style=" padding-top: 10px;">
									<div class="border_bottom"><h3 class="msg_til">${messageInfo.title}</h3></div>
									<div>
										<c:choose>
											<c:when test="${empty messageInfo.createrImg}">
												<img src="${ctx}/static/image/activity/headPortrait.png" width="40px;" height="40px;" style="float:left;border-radius:50%; overflow:hidden;margin-top: 4px;">
											</c:when>
											<c:otherwise>
												<img src="${messageInfo.createrImg}" width="40px;" height="40px;" style="float:left;border-radius:50%; overflow:hidden;margin-top: 4px;">
											</c:otherwise>
										</c:choose>
										
										<div style="float:left; margin-left:10px;">
											<div style="margin-bottom: 6px ;">
												<span style="color:#EE7085">${messageInfo.createrName}</span>
												<span style="margin-left:20px;font-size: 12px">${messageInfo.createTime}</span>
											</div>
											<div>留言：${messageInfo.content}</div>
										</div>
										<div style="clear:both;"></div>
									</div>
									<div style="height: 15px;"></div>
									<div>
										<c:choose>
											<c:when test="${messageInfo.status==2}">
												<c:choose>
													<c:when test="${empty messageInfo.replyImg}">
														<img src="${ctx}/static/image/activity/headPortrait.png" width="40px;" height="40px;" style="float:left;border-radius:50%; overflow:hidden;margin-top: 4px;">
													</c:when>
													<c:otherwise>
														<img src="${messageInfo.replyImg}" width="40px;" height="40px;" style="float:left;border-radius:50%; overflow:hidden;margin-top: 4px;">
													</c:otherwise>
												</c:choose>
												<div style="float:left; margin-left:10px;">
													<div style="margin-bottom: 6px ;">
														<span style="color:#EE7085">${messageInfo.replyName}</span>
														<span style="margin-left:20px;font-size: 12px">${messageInfo.replyTime}</span>
													</div>
													<div>回复：${messageInfo.replyContent}</div>
												</div>
												<div style="clear:both;"></div>
											</c:when>
											<c:otherwise><span style="display: block;font-weight:800; font-size:20px; width:100%;text-align: center;color:#c6c6c6;">对方暂未回复</span></c:otherwise>
										</c:choose>
										
									</div>
									<div style="clear:both;"></div>
								</div>
								</c:forEach>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		<div style="display:none" id="qrcode">     
				<img src='${supplyDemand.qrCode}'  width="250px;" height="250px;"/>
			  	  <br>&nbsp;&nbsp;打开微信，点击底部的“发现”
				  <br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
	       </div>
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	<%@ include file="../showFront/collectAndMessage.jsp"%>
</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
<script src="${ctx}/static/js/share.js"></script> 
<script type="text/javascript" src="${ctx}/static/js/modernizr-custom-v2.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(2)").addClass("on");
	}else{
		$(".nav-content a:eq(1)").addClass("on");
	}
	$(".second-menu li:eq(1) a:eq(0)").addClass("on");
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(10)").addClass("on");
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	var $miaobian=$('.Xcontent08>div');
	var $huantu=$('.Xcontent06>img');
	var $miaobian1=$('.Xcontent26>div');
	$miaobian.mousemove(function(){miaobian(this);});
	$miaobian1.click(function(){miaobian1(this);});
	function miaobian(thisMb){
		for(var i=0; i<$miaobian.length; i++){
			$miaobian[i].style.borderColor = '#dedede';
		}
		thisMb.style.borderColor = '#cd2426';

		$huantu[0].src = thisMb.children[0].src;
	}
	function miaobian1(thisMb1){
		for(var i=0; i<$miaobian1.length; i++){
			$miaobian1[i].style.borderColor = '#dedede';
		}
		$miaobian.css('border-color','#dedede');
		thisMb1.style.borderColor = '#cd2426';
		$huantu[0].src = thisMb1.children[0].src;
	}
	$(".Xcontent33").click(function(){
		var value=parseInt($('.input').val())+1;
		$('.input').val(value);
	})
	$(".Xcontent32").click(function(){	
		var num = $(".input").val()
		if(num>0){
			$(".input").val(num-1);
		}
	})
	if(!'${supplyDemand.qrCode}'){
 		$('#wxImg').hide();
	}
})
</script>
</html>
