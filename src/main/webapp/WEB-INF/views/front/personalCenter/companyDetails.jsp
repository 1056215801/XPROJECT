<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>企业详情</title>
<link href="${ctx}/static/css/personalCenter/personalCenter.css" rel="stylesheet"/>
<style>
 body .layui-layer-font_black .layui-layer-content {color:#000; padding:5px 15px;}
</style>
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script>
      $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>
<script>
$(function(){
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			//$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
			if(index==1){
				layer.msg("正在建设中，敬请期待...");
			}
		});
    });
 });
 function inviteCode(){
 	layer.tips('VTOXTW', '#inviteCode', {
	  tips: [3, '#F2F2F2'],
	  skin: "layui-layer-font_black",
	  time: 7000
	});
 }
 function Invitation(){
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0.3],
		area:['420px','200px'],
		closeBtn:0,
		content: $('#Invitation')
	});
 };
 function authorization(){
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0.3],
		area:['420px','220px'],
		closeBtn:0,
		content: $('#authorization')
	});
 };
</script>
<script type="text/javascript">
	$(function(){
		$('#detailContent').height($('#detailContent')[0].scrollHeight);
		$('#detailContent').css("overflow","hidden");
		
		var attachmentId = '${companyInfoBean.socialCreditAt}';
		if(attachmentId!=null&&attachmentId!=""){
			$.ajax({
				url:"${ctx}/login/json/attachment/selectByAttachmentId",
				type:'get',
				data:{'attachmentId':attachmentId},
				dataType:'json',
				success:function(data){
					var obj = JSON.parse(data);
					$("#socialCreditAt").attr("src", obj.attachment.attachmentUrl);
				},
				error:function(){
					alert("访问后台异常!");
				}
			});
		}
		
	});

</script>


</head>

<body>
<div class="center_main">
	<div class="project_header">
	       <c:if test="${entranceId==3609009 }"  >
			  <%@ include file="../common/bak/header_yc.jsp"%>
			</c:if>
			<c:if test="${entranceId!=3609009  }"  >
			  <%@ include file="../common/header.jsp"%>
			</c:if>
	</div>
	
	<div class="center_content clearfix">
		<div class="centerContentLeft">
				<div class="menuNav">
					<a href="${ctx}/personalCenter/messageNotification"> <img
						src="${ctx}/static/image/personalCenter/message.jpg" width="24"
						height="24" style="vertical-align: middle;"> <span
						style="vertical-align: middle; margin-left: 2px;">消息通知</span>
					</a>
				</div>
				<div class="menuNav">
					<a href="javascript:;"> <img src="${ctx}/static/image/personalCenter/setUp.jpg" width="24"
						height="24"> <span style="margin-left: 2px;">设置</span>
					</a>
					<ul>
						<li>
							<a href="${ctx}/personalCenter/personalInfoEdit" >个人信息</a>
						</li>
						<li>
							<a href="${ctx}/personalCenter/accountSecurity">账号安全</a>
						</li>
						<li>
							<a href="${ctx}/personalCenter/accountUpgrade">账号升级</a>
						</li>
						<%-- <li><a href="${ctx}/personalCenter/parkEdit" >园区设置</a></li> --%>
						<li><a href="${ctx}/personalCenter/companyEdit" style="color:#000;">企业设置</a></li>
					</ul>
				</div>
			</div>
		<div class="centerContentRight">
			<div class="centerContent">
				<div class="centerTop">企业设置
					<div class="returnOper" onClick="javascript:history.back(-1);">返回&nbsp;></div>
				</div>
				<div style="padding:0 15px 20px;">
					<div style="margin-top:20px;"></div>
					<div class="company_detailsBar">
						<div class="park_dataRight" style="display:inline-block; float:none;">${companyInfoBean.companyName}</div>
					</div>
					<div class="company_detailsBar" style="display: none;">
						<span>公司成员：<font class="redCount">1</font>人</span>
						<span class="company_detailsOper" id="inviteCode" onClick="inviteCode();">查看邀请码</span>
						<span class="company_detailsOper" onClick="Invitation();">邀请更多同事</span>
					</div>
					<div style="position:relative;">
						<div class="titleName clearfix">
							<ul>
								<li><a href="javascript:;">公司详情</a></li>
								<li><a href="javascript:;">公司成员</a></li>
							</ul>
						</div>
						<div class="titleItem">
							<div>
								<div class="company_establishBar" style="border:0;">
									<div class="company_establish clearfix">
										<span class="park_dataLeft">
											<span class="redStar"></span>公司名称：
										</span>
										<span style="padding:2px 0;float: left">${companyInfoBean.companyName}</span>
									</div>
									
									<div class="company_establish clearfix">
										<span class="park_dataLeft">
											<span class="redStar"></span>信用代码：
										</span>
										<span style="padding:2px 0;float: left">${companyInfoBean.socialCreditNo}</span>
									</div>
									
									<div class="company_establish clearfix">
										<span class="park_dataLeft">主营业务：</span>
										<span style="padding:2px 0;float: left">${companyInfoBean.operationMain}</span>
									</div>	
									
									<div class="company_establish clearfix">
										<span class="park_dataLeft">
											<span class="redStar"></span>所在地区：
										</span>
										<span style="padding:2px 0;float: left">${companyInfoBean.provinceName}</span>
										<c:if test="${companyInfoBean.areaName!=null}">
											<span style="padding:2px 0;float: left">--${companyInfoBean.areaName}</span>
										</c:if>
										<c:if test="${companyInfoBean.spaceName!=null}">
											<span style="padding:2px 0;float: left">--${companyInfoBean.spaceName}</span>
										</c:if>
									</div>
									
									<div class="company_establish clearfix">
										<span class="park_dataLeft">详细地址：</span>
										<span style="padding:2px 0;float: left">${companyInfoBean.positionAddress}</span>
									</div>
									
									<div class="company_establish clearfix">
										<span class="park_dataLeft">公司网址：</span>
										<span style="padding:2px 0;float: left">${companyInfoBean.siteUrl}</span>
									</div>
									<div class="company_establish clearfix">
										<span class="park_dataLeft">公司简介：</span>
										<textarea rows="4" placeholder="" id="detailContent" 
											style="width: 100%;background:#FFF;border: 0;" disabled="disabled">
											${companyInfoBean.companyDescription}</textarea>
									</div>
								</div>
							</div>
							<div style="display:none;">
								<div class="memberSearchBar clearfix">
									<div class="searchOptionBar">
										<div class="searchOption clearfix">
											<div class="searchOptionLeft">状态：</div>
											<div class="searchOptionRight searchSelected">全部</div>
											<div class="searchOptionRight">已授权</div>
											<div class="searchOptionRight">已停用</div>
										</div>
										<div class="searchOption clearfix">
											<div class="searchOptionLeft">授权：</div>
											<div class="searchOptionRight searchSelected">全部</div>
											<div class="searchOptionRight">公司成员</div>
											<div class="searchOptionRight">管理员</div>
										</div>
									</div>
									<div class="searchBar">
										<input type="text" placeholder="请输入姓名或姓名全称"/>
										<img src="images/search.png" width="15px" height="15px;"/>
									</div>
								</div>
								<div class="memberSearchList">
									<table>
										<tr>
											<td style="width:7%; text-align:right;">
												<img src="images/headPortrait.png" width="30" height="30">
											</td>
											<td style="width:10%; text-align:left; padding-left:10px;">袁月</td>
											<td style="width:10%;">创建人</td>
											<td style="width:20%;">
												<img src="images/headPortrait.png" width="15" height="15">
												<span class="tablePhone">13209872342</span>
											</td>
											<td style="width:28%;"></td>
											<td style="width:25%; text-align:right;">
												<span class="tableOper">停用</span>
												<span class="tableOper" onClick="authorization();">授权</span>
											</td>
										</tr>
										<tr>
											<td style="width:7%; text-align:right;">
												<img src="images/headPortrait.png" width="30" height="30">
											</td>
											<td style="width:10%; text-align:left; padding-left:10px;">王立峰</td>
											<td style="width:10%;">管理员</td>
											<td style="width:20%;">
												<img src="images/headPortrait.png" width="15" height="15">
												<span class="tablePhone">13209872342</span>
											</td>
											<td style="width:28%;"></td>
											<td style="width:25%; text-align:right;">
												<span class="tableOper">停用</span>
												<span class="tableOper" onClick="authorization();">授权</span>
												<span class="tableOper">删除</span>
											</td>
										</tr>
										<tr>
											<td style="width:7%; text-align:right;">
												<img src="images/headPortrait.png" width="30" height="30">
											</td>
											<td style="width:10%; text-align:left; padding-left:10px;">张有为</td>
											<td style="width:10%;">成员</td>
											<td style="width:20%;">
												<img src="images/headPortrait.png" width="15" height="15">
												<span class="tablePhone">13209872342</span>
											</td>
											<td style="width:28%;"></td>
											<td style="width:25%; text-align:right;">
												<span class="tableOper">停用</span>
												<span class="tableOper" onClick="authorization();">授权</span>
												<span class="tableOper">删除</span>
											</td>
										</tr>
										<tr>
											<td style="width:7%; text-align:right;">
												<img src="images/headPortrait.png" width="30" height="30">
											</td>
											<td style="width:10%; text-align:left; padding-left:10px;">李全福</td>
											<td style="width:10%;">成员</td>
											<td style="width:20%;">
												<img src="images/headPortrait.png" width="15" height="15">
												<span class="tablePhone">13209872342</span>
											</td>
											<td style="width:28%;"></td>
											<td style="width:25%; text-align:right;">
												<span class="tableOper tableEnable">启用</span>
												<span class="tableOper" onClick="authorization();">授权</span>
												<span class="tableOper">删除</span>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>	
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<div id="Invitation" style="display:none;">
		<div class="invitationTitle">邀请同事加入</div>
		<div class="invitationInput">
			<input type="text" placeholder="请输入姓名" style="width:90px;">
			<input type="text" placeholder="请输入对方园企智汇账号或手机号" style="width:240px;">
			<span>删除</span>
		</div>
		<div class="invitationAdd">
			<img src="images/give.png" width="20" height="20">
			<span>添加</span>
		</div>
		<div class="invitationBtn">
			<input type="button" value="邀请" class="buttonContralRed">
			<input type="button" value="取消" class="buttonContralGray">
		</div>
	</div>
	
	<div id="authorization" style="display:none;">
		<div class="authorizationName">"沈家华"授权成为</div>
		<div class="authorizationCheck">
			<div class="i-checks checkTerm">
				<input type="radio" checked="" value="option1" name="Q1">
				<span>公司成员</span>
			</div>
			<div class="i-checks checkTerm">
				<input type="radio" value="option2" name="Q1">
				<span>管理员</span>
			</div>
		</div>
		<div class="authorizationBtn">
			<input type="button" value="保存" class="buttonContralRed">
			<input type="button" value="取消" class="buttonContralGray">
		</div>
	</div>
	 <c:if test="${entranceId==3609009 }"  >
		  <%@ include file="../common/bak/footer_yc.jsp"%>
		</c:if>
		<c:if test="${entranceId!=3609009  }"  >
		  <%@ include file="../common/footer.jsp"%>
		</c:if>
</div>
</body>
</html>
