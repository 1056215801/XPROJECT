<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用工服务-查看简历</title>
<link href="${ctx}/static/css/recruitment/employmentService.css" rel="stylesheet"/>
<link href="${ctx}/static/css/recruitment/projectHeader2.css" rel="stylesheet"/>
<link href="${ctx}/static/css/recruitment/projectFooter.css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx}/static/js/recruitment/hcdyIndustry.js"></script>
</head>

<body>
<div class="employment_main">
	<div class="project_header">
			<%@ include file="../../common/header.jsp"%>
	</div>
	
	<div class="employment_content">
		<div class="view_cont clearfix">
			<div class="view_contLeft">
				<div class="view_label">
					<img src="${ctx}/static/image/recruitment/column.jpg" width="798" style="position:relative; left:-15px;">
					<div class="view_labelPosition">
						<div class="redFont font28">${info.positionName}</div>
						<div>${info.rootName}</div>
					</div>
					<div class="view_labelSalary">
						<div class="whiteFont font28">年薪</div>
						<div class="whiteFont font28">${info.payName}</div>
					</div>
				</div>
				<div class="view_information">
					<div>${info.industryTypeName.replaceAll("/","&nbsp;/&nbsp;")}</div>
					<div>${info.workAreaName}&nbsp;|&nbsp;
					${info.workYearName==null?"经验不限":info.workYearName}&nbsp;(经验：年)&nbsp;|&nbsp;
					${info.diplomaName==null?"学历不限":info.diplomaName}&nbsp;|&nbsp;
					${info.ageYear==null?"年龄不限":info.ageYear}&nbsp;(年龄：岁)&nbsp;|&nbsp;
					${info.workNatureName}</div>
					<span class="list_labelBar">
						<c:forEach items="${info.positionTags}" var="index">
							<span class="list_label">${index}</span>
						</c:forEach>
					</span>
					<div class="grayFont_9f font13">截止时间：<fmt:formatDate value="${info.deadLine}" pattern="yyyy-MM-dd"/> </div>
					<div style="float: right;">
						<div class="list_view" onclick="window.location.href='${ctx}/front/recruitment/hcdy/main?pageType=2'">返回</div>
						<c:if test="${info.positionStatus==1}">
							<div class="list_view" id="down" onclick="down('${info.id}')">下线</div>
						</c:if>
						<div class="list_view" onclick="edit('${info.id}')">编辑</div>
					</div>
					<br>
				</div>
				<div>
					<div class="view_list_titleBar">
						<div class="view_list_title">已投简历</div>
					</div>
					<div class="personal_listBar" style="padding:0 20px;">
						<c:choose>
							<c:when test="${ajInfoList!=null&&ajInfoList!=''&&ajInfoList!='[]'}">
								<c:forEach items="${ajInfoList}" var="ajInfo">
									<div class="personal_list_content clearfix">
										<div class="list_headPortrait">
											<c:choose>
												<c:when test="${ajInfo.head_portrait!=null&&ajInfo.head_portrait!=''}">
													<img src="http://${ajInfo.head_portrait}" width="100" style="border-radius:50%;">
												</c:when>
												<c:otherwise>
													<c:if test="${ajInfo.sex=='男'||ajInfo.sex==''}">
														<img src="${ctx}/static/image/recruitment/rcf_tx.png" width="100" style="border-radius:50%;">
													</c:if>
													<c:if test="${ajInfo.sex=='女'}">
														<img src="${ctx}/static/image/recruitment/rcf_tx1.png" width="100" style="border-radius:50%;">
													</c:if>
												</c:otherwise>
											</c:choose>
											<img src="${ctx}/static/image/recruitment/vip.png" width="25" class="vip">
										</div>
										<div class="list_containe" style="width:594px;">
											<div class="clearfix">
												<div class="list_name">${ajInfo.name}</div>
												<div class="list_time">${ajInfo.time}</div>
												<div class="list_time">&nbsp;&nbsp;<font style="color: red;font-size: 14px;">${ajInfo.status}</font> </div>
												<div class="list_view" onclick="openUrl('${ajInfo.pc_url}')">看简历</div>
											</div>
											<div class="clearfix">
												<span>性别：</span>
												<span>${ajInfo.sex}</span>
											</div>
											<div class="clearfix">
												<span>工作经验：</span>
												<span>${ajInfo.workYear}</span>
											</div>
											<div class="clearfix">
												<span>当前位置：</span>
												<span>${ajInfo.currentLocation}</span>
											</div>
											<div class="clearfix">
												<span>当前职位：</span>
												<span>${ajInfo.currentPost=='None'?'':ajInfo.currentPost}</span>
											</div>
											<!-- <div class="clearfix">
												<span>个人标签：</span>
												<span>
													<span class="list_label">带薪年假</span>
													<span class="list_label">午餐补助</span>
													<span class="list_label">租房津贴</span>
													<span class="list_label">年底奖金</span>
												</span>
											</div> -->
										</div>
									</div>
								</c:forEach>
								
								<!-- <div class="view_screenBar clearfix">
									此处为分页栏
								</div> -->
							</c:when>
							<c:otherwise>
								<div style="width:100%; text-align: center; padding: 100px 0;">
									<span class="renovateTitle">暂无投递简历</span>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="view_screenBar clearfix"></div>
				</div>
				<div>
					<div class="view_details">
						<div class="view_details_title">岗位职责</div>
						<div class="view_details_contBar">
							<div class="view_details_cont">${info.describe}</div>
						</div>
					</div>
					<div class="view_details">
						<div class="view_details_title">职位要求</div>
						<div class="view_details_contBar">
							<div class="view_details_cont">${info.demand}</div>
						</div>
					</div>
					<div class="view_details">
						<div class="view_details_title">其他信息</div>
						<div class="view_details_contBar">
							<div class="view_details_cont">招聘人数：${info.count}</div>
							<div class="view_details_cont">联系人：<font class="redFont font18">${info.contactName}</font></div>
							<div class="view_details_cont">手机号：<font class="redFont font18">${info.contactPhone}</font></div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="view_contRight">
				<div class="view_side_company">
					<img src="${ctx}/static/image/recruitment/headPortrait.png" width="100" style="border-radius:50%;">
					<span class="view_side_name">${hcdyOrganizationLogBean.pcName}</span>
				</div>
				<div class="view_side_dataBar">
					<%-- <div class="view_side_data"><img src="${ctx}/static/image/recruitment/add.jpg" width="20"><span>南昌市</span></div> --%>
					<div class="view_side_data"><img src="${ctx}/static/image/recruitment/num_white.jpg" width="20"><span id="scale">${hcdyOrganizationLogBean.scale}</span></div>
					<div class="view_side_data"><img src="${ctx}/static/image/recruitment/nature.jpg" width="20"><span id="nature">${hcdyOrganizationLogBean.nature}</span></div>
					<div class="view_side_data"><img src="${ctx}/static/image/recruitment/industry.jpg" width="20"><span id="business">${hcdyOrganizationLogBean.business}</span></div>
				</div>
				<div class="view_side_dataBar" style="padding:20px 0;">
					<div class="font16">职位发布人</div>
					<div class="view_side_data"><img src="${ctx}/static/image/recruitment/num_black.jpg" width="20"><span>${info.accountName}</span></div>
				</div>
				<div class="view_side_map">
					<div class="font16">公司位置</div>
					<div class="grayFont_9f font12">${hcdyOrganizationLogBean.address}</div>
					<div>此处为地图区域</div>
				</div>
				<%-- <div class="view_side_other">
					<div class="font16">企业发布的其他职位</div>
					<div class="view_side_more" onclick="getMorePosition()">更多>></div>
					<table>
						<c:forEach items="${positionList}" var="positionInfo">
							<c:if test="${positionInfo.accountId!=info.accountId}">
								<tr>
									<td class="blueFont">${positionInfo.positionName}</td>
									<td class="grayFont_9f">${positionInfo.workAreaName}</td>
									<td class="redFont">${positionInfo.payName}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div> --%>
				
			</div>
			
		</div>
	</div>
	<iframe src="" style="display: none;" id="loign" name="login">
	
	</iframe>
	<%@ include file="../../common/footer.jsp"%>
</div>
<script>
 $(function(){
	$('.tabItem').children().eq(0).css({'display':'none'});
	$('.tabItem').children().eq(1).css({'display':'block'});
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(1).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(8).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
	$(".header_WeChat").click(function(){		
    	var div = $(".WeChatQRcode"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	
	var business = '${hcdyOrganizationLogBean.business}';
	for(var i=0;i<industryJson.industryList.length;i++){
		if(industryJson.industryList[i].code==business){
			$("#business").text(industryJson.industryList[i].name);
			break;
		}
		for(var j=0;j<industryJson.industryList[i].children.length;j++){
			if(industryJson.industryList[i].children.code==business){
				$("#business").text(industryJson.industryList[i].name);
				break;
			}
		}
	}
	
	var scale = '${hcdyOrganizationLogBean.scale}';
	for(var i=0;i<scaleJson.length;i++){
		if(scaleJson[i].code==scale){
			$("#scale").text(scaleJson[i].name);
			break;
		}
	}
	
	var nature = '${hcdyOrganizationLogBean.nature}';
	for(var i=0;i<natureJson.length;i++){
		if(natureJson[i].code==nature){
			$("#nature").text(natureJson[i].name);
			break;
		}
	}
	
 });
 
 function getMorePosition(){
	 layer.msg("功能建设中。。。");
 }
 
 
 function edit(id){
	 window.location.href="${ctx}/front/recruitment/hcdy/edit?id="+id;
 }
 
 function down(id){
	 $("#down").attr("disabled","disabled");
	 $.ajax({
		url:"${ctx}/json/recruitment/hcdy/jsonSave",
		type:"get",
		data:{"id":id,operationType:0,"type":3},
		success:function(result){
			layer.msg(result.msg);
			if(result.code!=0){
				$("#down").removeAttr("disabled");
			}
		},
		error:function(){
			layer.msg("加载超时，请稍后重试！");
		}
	 });
 }
 
function openUrl(url){
	$.ajax({
		url:"${ctx}/json/recruitment/hcdy/hcdyLogin",
		type:"post",
		success:function(result){
			if(result.errorCode==0){
				window.login.location.href = "http://"+result.value.pc_url;
				setTimeout(function(){
					window.open('http://'+url, '_blank');
				}, 1000);
			}else{
				window.open('http://'+url, '_blank');
			}
		},
		error:function(){
			layer.msg("系统加载超时，请刷新重试！");
		}
	});
}
 
</script>
</body>
</html>
