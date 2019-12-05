<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<div class="navigationBar">
	<ul>
		<li style="width:50%;"><a href="${ctx}/auth/page/mobile/weixin/recruitment/hcdy/main">
				<div class="navImage">
					<img src="${ctx}/static/weixin/recruitment/images/personal_${navBar.charAt(0)}.png"
						width="20">
				</div>
				<div class="navTitle">人才库</div>
		</a></li>
		<li style="width:50%;"><a href="${ctx}/auth/page/mobile/weixin/recruitment/hcdy/headhunt">
				<div class="navImage">
					<img src="${ctx}/static/weixin/recruitment/images/employment_${navBar.charAt(1)}.png"
						width="20">
				</div>
				<div class="navTitle">人才经纪人</div>
		</a></li>
		<%-- <li><a href="${ctx}/auth/page/mobile/weixin/recruitment/hcdy/my">
				<div class="navImage">
					<img src="${ctx}/static/weixin/recruitment/images/release_${navBar.charAt(2)}.png"
						width="20">
				</div>
				<div class="navTitle">我发布的</div>
		</a></li> --%>
		<%-- <li><a href="${ctx}/auth/page/mobile/weixin/personalInfoBingding">
				<div class="navImage">
					<img src="${ctx}/static/weixin/recruitment/images/more_${navBar.charAt(3)}.png"
						width="20">
				</div>
				<div class="navTitle">个人中心</div>
		</a></li> --%>
	</ul>
</div>
<script src="${ctx}/static/plugins/underscore/underscore-min.js"></script>
<script src="${ctx}/static/plugins/backbone/backbone-min.js"></script>
<script src="${ctx}/static/plugins/knockout/knockout.min.js"></script>
<script src="${ctx}/static/plugins/knockback/knockback.min.js"></script>
<script>
	var baseUrl = '${ctx}';
	
</script>