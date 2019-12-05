<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>${projectDeclareInfo.declareTitle}</title>
<link href="${ctx}/static/weixin/css/projectDeclare/projectDetails.css" rel="stylesheet"/>
</head>
<script>
	$(function() {
		$('#tbox').hide();//隐藏小火箭
		$('#getMore').hide();//隐藏加载更多
		
		
		//如果不需要横向滑动显示内容 则去除横向滚动条
		if($("#detailsContent").width()==$("#detailsContent")[0].scrollWidth-24){
			$("#detailsContent").css("overflow-x","");
		}
	
		$('#enterprises').attr("href","${ctx}/projectDeclare/weixin/applyComp?declareId="+"${declareId}");
		$('#myEnterprise').attr("href","${ctx}/projectDeclare/weixin/applyComp?declareId="+"${declareId}");
	
		/* 判断是否显示展开查看更多按钮 */
		if($('#detailsContent').height()>113){
			$('#detailsContent').addClass("detailsMore");
			$('#seeMoreBtn').show();
		}else{
			$('#seeMoreBtn').hide();
		}
		
		<% String detailsType=request.getParameter("detailsType"); %> 
		if(<%=detailsType%>!=null){
			document.cookie="detailsType="+<%=detailsType%>; 
		}
		var detailsType = document.cookie.split(";")[0].split("=")[1];
		if(detailsType=="myApplication"){
			//我申报的项目：我申请的企业列表及状态、 在线申报
			$('#fromMyApplication').show();
			$('#back_a').attr("href","${ctx}/projectDeclare/weixin/myListApplyPro");
		}else if(detailsType=="haveSendProject"){
			//已发项目： 申请企业列表、公示结果的发布
			$('#fromHaveSendProject').show();
			$('#back_a').attr("href","${ctx}/projectDeclare/weixin/myListPro");
		}else if(detailsType=="projectApplication"){
			//找项目中: 在线申报的发起
			$('#fromMyApplication').show();
			$('#fromProjectApplication').hide();
			$('#back_a').attr("href","${ctx}/auth/page/mobile/weixin/projectDeclare/weixin/main");
		}else{
			//公示项目详情 Nothing resultPublicity
			$('#back_a').attr("href","${ctx}/projectDeclare/weixin/publicityList");
		}
		
		if(${projectDeclareInfo.declareStatus == 2} || ${info.endDate==null}){//已公示或常年有效可查看公示内容
			$('#publicityBar').show();//已公示
			$('#proList').hide();
			
			//异步加载公示内容
			getPublicityList(1);
		}else{
			$('#publicityBar').hide();
			$('#proList').show();
		}
		
		$("p img").width("96%");
	})

	/* 展开收起查看更多 */
	function seeMore(){
		if($('#detailsContent').hasClass("detailsMore")){
			$('#detailsContent').removeClass("detailsMore");
			var _div = "";
			_div = '<img src="${ctx}/static/weixin/images/projectDeclare/unfold0.png" width="12px;" height="12px;"/>';
			$('#seeMoreBtn').html("收起"+_div);
		}else{
			$('#detailsContent').addClass("detailsMore");
			var _div = "";
			_div = '<img src="${ctx}/static/weixin/images/projectDeclare/packup0.png" width="12px;" height="12px;"/>';
			$('#seeMoreBtn').html("展开查看更多"+_div);
		}
	}
	
	pageNumber = 1;
	//异步加载公示内容
	function getPublicityList(pageNumber){
		$.ajax({
			url:"${ctx}/projectDeclare/json/publicityList",
			type:"post",
			data:{
					"declareId": "${declareId}",
					"pageNum" : pageNumber,
					"pageSize" : 10,
					"${_csrf.parameterName}" : "${_csrf.token}"
				},
			dataType:"json",
			success:function(result){
				var list = result.value;
				if (result.code == 1 || result.code == 0) {
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var _divList = '<div style="background-color:#fff;margin-bottom: 10px;" onClick="viewClick(this);">'
							+'<div class="publicityTitle" style="text-align:' + (i==0?'center':'left') + ';">'
							+ info.publicityTitle
							+'</div><div class="publicityContLine" style="border-bottom:1px solid #f14342; display:' + (i==0?'bolck':'none') + '; margin:0 10px 0;"></div>'
							+ '<div class="publicityContLine2" style="border-bottom:2px solid #f14342; display:' + (i==0?'bolck':'none') + '; margin:1px 10px 0;"></div>'
							+'<div class="publicityCont" style="display:' + (i==0?'bolck':'none') + ';margin-top:6px">'
							+ info.publicityText
							+'</div>'
							+'<div class="publicityTitleSummary">'
							+ getTime(info.createTime)
							+'</div></div>';
						$("#publicityBar").append(_divList);
					}
					$("#proList").hide();
				} else if (result.code == 2) {
					$("#proList").show();
				} else {
					$("#proList").hide();
					layer.msg("获取数据失败");
				}
				if (result.code != 1) {
					$('#getMore').hide();
				} else {
					$('#getMore').show();
				}
			},
			error:function(){
				layer.alert("系统异常");
			}
		});
	}
	
	/* 加载更多 */
	function getMore() {
		pageNumber++;
		getPublicityList(pageNumber);
	}
	/* 年月日转换方法*/
	function getTime(time) { 
		var date = new Date(time);
		Y = date.getFullYear() ;
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1);
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y +"年"+ M +"月"+ D +"日" );
	}

	function viewClick(item) {
		$(".publicityContLine2").each(function (index, obj) {
			$(obj).hide();
		});
		$(".publicityContLine").each(function (index, obj) {
			$(obj).hide();
		});
		$(".publicityCont").each(function (index, obj) {
			$(obj).hide();
		});
		$(".publicityTitle").each(function (index, obj) {
			$(obj).css('text-align', 'left');
		});
		$(item).find(".publicityContLine2").show();
		$(item).find(".publicityContLine").show();
		$(item).find(".publicityCont").show();
		$(item).find(".publicityTitle").css('text-align', 'center');
	}
	
	
	
</script>
<body>
<div class="details_main">
	<div class="details_content">
		<div class="detailsDataBar" style="padding:30px 15px;">
			<div class="projectTitle">${projectDeclareInfo.declareTitle}</div>
			<div class="projectData">
				<div class="projectDataLeft">发布时间：</div>
				<div class="projectDataRight"><fmt:formatDate value="${projectDeclareInfo.createTime}" pattern="yyyy年MM月dd日"/></div>
				<div class="projectDataLeft">项目级别：</div>
				<div class="projectDataRight">${projectDeclareInfo.declareGrade}</div>
				<div class="projectDataLeft">主管单位：</div>
				<div class="projectDataRight">${projectDeclareInfo.supervisorName}</div>
			</div>
			<div style="clear:both;"></div>
			<c:if test="${projectDeclareInfo.isRecommend == '1' }">
			<img src="${ctx}/static/weixin/images/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">
			</c:if>
		</div>
		<div class="detailsDataBar" style="padding:10px 0;">
		<c:choose>
			<c:when test="${projectDeclareInfo.declareStatus==0}">
				<div class="projectStateGreen" style="float:left;">申报中</div>
				<c:choose>
					<c:when test="${projectDeclareInfo.endDate==null}">
						<div style="margin-left:85px;">常年有效<font style="color:#f14342; font-size:18px;">&nbsp;</font></div>
					</c:when>
					<c:otherwise>
						<div style="margin-left:85px;">距离申报截止还有<font style="color:#f14342; font-size:18px;">${projectDeclareInfo.endDate}</font>天</div>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${projectDeclareInfo.declareStatus==1}">
				<div class="projectStateGray">已截止</div>
			</c:when>
			<c:otherwise>
				<div class="projectStateBlue">已公示</div>
			</c:otherwise>
		</c:choose>
		</div>
		<div id="detailsContent" class="detailsDataBar detailsCont" style="padding:10px 12px;overflow-x:scroll;">
			${projectDeclareInfo.declareText}
		</div>
		<div id="seeMoreBtn" class="seeMore" onclick="seeMore();" style="padding: 20px;">展开查看更多
			<img src="${ctx}/static/weixin/images/projectDeclare/packup0.png" width="12px;" height="12px;"/>
		</div>
		<div class="info_top">
			<div class="info_title">结果公示</div>
		</div>
		<div class="detailsDataBar" style="background-color: #ebebeb;">
			<div style="width:100%;overflow:hidden;">
				<div id="publicityBar">
				</div>
				<div style="text-align: center;">
					<span id="proList" class="renovateTitle">暂无数据</span>
				</div>	
			</div>
		</div>
	</div>
	
	<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
	<div id="tbox">
		<a id="gotop" href="#top"></a>
	</div>
	
	<div class="fixed_bottom">
		<a id="back_a" href="">
		<img src="${ctx}/static/weixin/images/projectDeclare/return.png" width="20px;" height="20px;" class="returnBtn"/>
		</a>
		
		<div id="fromMyApplication" style="display:none;">
<!-- 			<div class="bottom_operation" onclick=""> -->
<%-- 				<img src="${ctx}/static/weixin/images/projectDeclare/sheb.png" width="20px;" height="20px;"/> --%>
<!-- 				<span class="spanContral_1" style="color:#F14241;">在线申报</span> -->
<!-- 			</div> -->
			<div id="fromProjectApplication" class="bottom_operation">
				<a id="myEnterprise" href="javascript:void(0);">
				<img src="${ctx}/static/weixin/images/projectDeclare/qiye.png" width="20px;" height="20px;"/>
				<span class="spanContral_1" style="color:#1B8ECD;">我申报的</span>
				</a>
			</div>
		</div>
		
		<div id="fromHaveSendProject" style="display:none;">
			<%-- <div class="bottom_operation" onclick="">
				<img src="${ctx}/static/weixin/images/projectDeclare/resultShowed.png" width="20px;" height="20px;"/>
				<span class="spanContral_1" style="color:#F14241;">公示结果</span>
			</div> --%>
			<div class="bottom_operation">
				<a id="enterprises" href="javascript:void(0);"}>
				<img src="${ctx}/static/weixin/images/projectDeclare/qiye.png" width="20px;" height="20px;"/>
				<span class="spanContral_1" style="color:#1B8ECD;">申报企业</span>
				</a>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>
</body>
</html>
