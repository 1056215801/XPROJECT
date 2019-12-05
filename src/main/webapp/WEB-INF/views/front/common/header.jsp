<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../common/commonPage_front.jsp"%>
<script src="${ctx}/static/script/front/main.js"></script>
	<%-- <div class="header_tab">
		<div class="header_sign">
			<img src="${ctx}/static/image/activity/LOGO2.png"/>
			<div class="header_add">
				<div>南昌</div>
				<input type="button" value="切换"/>
			</div>
		</div>
		<div class="tabName">
			<ul>
				<li><a href="javascript:;">服务</a></li>
				<li><a href="javascript:;">办公</a></li>
			</ul>
		</div>
		<div class="header_user">
			<img id="head_image" src="${ctx}/static/image/activity/headPortrait.png" width="80" height="80"/>
			<div id="dropdown" class="dropdown" style="display:none;">
				<ul>
					<li><img src="${ctx }/static/image/message.png" width="20" height="20" style="vertical-align:middle; float:none;">
						  消息</li>
					<li><a href="${ctx}/personalCenter/messageNotification" style="margin-left: 30px;">
						  消息通知</a></li>
					<li><img src="${ctx }/static/image/menu.png" width="20" height="20" style="vertical-align:middle; float:none;">
						  设置</li>
					<li><a href="${ctx}/personalCenter/personalInfoEdit" style="margin-left: 30px;">
					           个人信息</a></li> 
					<li><a href="${ctx}/personalCenter/accountSecurity" style="margin-left: 30px;">
					           账号安全</a></li> 
					<li><a href="${ctx}/personalCenter/accountUpgrade" style="margin-left: 30px;">
					           账号升级</a></li> 
				</ul>
				<div style="padding:5px 7px;">
					<input type="button" value="退出登录" class="dropdownBtn">
				</div>
			</div>
			<span id="nologin" style="float:left; position:relative; top:30px; left:5px; margin-right:50px;">
				<a href="${ctx}/session/page/login/index">登录</a>
				<a href="${ctx}/session/page/register/index">注册</a>
			</span>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div class="tabItem">
		<ul>
			<li><a href="${ctx}/projectActivity/main">活动</a></li>
			<li><a href="${ctx}/projectDeclare/main">项目申报</a></li>
			<li><a href="${ctx}/investigation/main">在线调查</a></li>
		</ul>
		<ul style="display: none;">
			<li><a href="javascript:;">办公</a></li>
			<li><a href="javascript:;">审计</a></li>
		</ul>
	</div> --%>
	<div class="header_top">
<!-- 		<div class="header_logo" onclick="tohomepage();"> -->
			<div class="header_logo" onclick="javascript:location.href='${ctx}/homePage/main';">
			<img src="${ctx}/static/image/homePage/logoNew.png">
		</div>
		<div class="tabName">
			<ul>
				<li><a href="javascript:;">政务服务</a></li>
				<li><a href="javascript:;">配套服务</a></li>
			</ul>
		</div>
		<div class="header_user" >
			<img id="head_image" style="display:none; border-radius:50px;"  src="${headImage}" width="50" height="50"/>
			<div id="dropdown" class="dropdown" style="display:none;">
				<ul>
					<%-- <li><img src="${ctx }/static/image/message.png" width="20" height="20" style="vertical-align:middle; float:none; margin-left: -50px;">
						  消息</li> --%>
					<li><a href="${ctx}/personalCenter/messageNotification">
					<img src="${ctx }/static/image/messageCenter.png" width="20" height="20" style="vertical-align:middle; margin-right: 5px;">
						  消息通知</a></li>
					<%-- <li><img src="${ctx }/static/image/menu.png" width="20" height="20" style="vertical-align:middle; float:none;  margin-left: -50px;">
						  设置</li> --%>
					<li><a href="${ctx}/personalCenter/personalInfoEdit">
					<img src="${ctx }/static/image/personalCenter.png" width="20" height="20" style="vertical-align:middle; margin-right: 5px;">
					           个人信息</a></li> 
					<li><a href="${ctx}/personalCenter/accountSecurity">
					<img src="${ctx }/static/image/accountSecurity.png" width="20" height="20" style="vertical-align:middle; margin-right: 5px;">
					           账号安全</a></li> 
					<li><a href="${ctx}/personalCenter/accountUpgrade">
					<img src="${ctx }/static/image/accountUpgrade.png" width="20" height="20" style="vertical-align:middle; margin-right: 5px;">
					           账号升级</a></li> 
				</ul>
				<div style="padding:5px 7px;" id="" >
					<input type="button" onclick="logout()" value="退出登录" class="dropdownBtn">
				</div>
			</div>
			<span id="nologin" >
				<a onclick="login();" href="javascript:;">登录</a>
				<a href="${ctx}/session/page/login/register/index">注册</a>
			</span>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div class="header_bottom">
		<div class="header_botContral">
			<div class="header_add">
				<img src="${ctx}/static/image/map.png">
				<span>江西</span>
				<img src="${ctx}/static/image/button.png" style="cursor:pointer;">
			</div>
			<div class="tabItem">
				<ul>
					<li><a href="${ctx}/expShare/main">园区动态</a></li>
					<li><a href="${ctx}/projectDeclare/main">项目申报</a></li>
					<li><a href="${ctx}/projectActivity/main">活动报名</a></li>
					<li><a href="javascript:void(0);" onclick="javascript:window.open('http://www.jxciit.gov.cn/Category_1275/Index.aspx', '_blank')" style="cursor:pointer;">企声通道</a></li>
					<%-- <li><a href="http://www.hcdyhr.com/" target="_blank">用工服务</a></li>
					<li><a href="${ctx}/projectSuggest/main" target="_blank">意见反馈</a></li> --%>
				</ul>
				<ul style="display: none;">
					<li><a href="${ctx}/front/logistics/main" >物流服务</a></li>
					<li><a href="${ctx}/front/showProduct/main" >产业对接</a></li>
					<li><a href="${ctx}/showSupply/main">要素共享</a></li>
					<li><a href="https://www.bjdp2p.com/" target="_blank">金融服务</a></li>
				<%-- 	<li><a href="${ctx}/front/recruitment/hcdy/main">人才招聘</a></li> --%>
					<li><a href="javascript:;" onclick="toSWY()">智能制造</a></li>
				</ul>
			</div> 
			<%-- <div class="header_WeChat">
				<img src="${ctx}/static/image/QRcode.png" width="13" height="13">
				<span>关注微信</span>
			</div>
			<div class="WeChatQRcode" style="display:none;">
				<img src="${ctx}/static/image/QRcodeImg.jpg" width="130" height="130" style="display:block; margin:10px auto;">
		     	<div style="text-align:center; color:#aaa; line-height:1.4;">
					<div>扫描二维码</div>
					<div>关注官方微信</div>
				</div>
				<s><i></i></s>
			</div> --%>
		</div>
	</div>
<script>
function login(){
	window.location.href ="${ctx}/session/page/login/index?redirectUrl="+encodeURI(window.location.href) ;
}
function openMsg(){
	layer.alert("该功能暂未开通，敬请期待！");
}
function toSWY(){
	$.ajax({
		url : "${ctx}/session/getSWYUrl",
		type : "post",
		data : {},
		dataType : "json",
		success : function(result) {
			/* window.open(result, "_blank"); */
			if(result.success){
				window.open(result.SSOUrl, "_blank");
			}else{
				layer.alert(result.errorMsg);
			}
		},
		error : function() {
			layer.alert("系统异常");
		}
	});
}
</script>