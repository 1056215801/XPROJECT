<!-- 宜春市产业集群公共服务平台 -->
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%-- <link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet"/> --%>
<style>
.dib { display: inline-block; vertical-align: middle;}
.homePage_footer {
    background: #303030;
    color: #fff;
}
.foot-content {
    padding: 30px 0;
    font-size: 0;
}
.foot-content .footCont {
    margin-right: 20px;
    width: calc(100% - 146px);
    font-size: 14px;
    line-height: 1.8;
}
.foot-links {
    margin-bottom: 30px;
    font-size: 17px;
    line-height: 1;
}
.foot-links a {
    margin-right: 15px;
    padding-right: 15px;
    border-right: 1px solid #ccc;
    display: inline-block;
    color: #fff !important;
}
.foot-links a:last-child { border: none;}
.foot-content p font {
    margin-right: 20px;
    max-width: -webkit-calc(100% - 146px);
    max-width: -moz-calc(100% - 146px);
    max-width: calc(100% - 146px);
}
</style>
<div class="homePage_footer">
	<div class="container foot-content">
		<div class="footCont dib">
			<div class="foot-links">
				<a href="javascript:;">关于我们</a>
				<a href="javascript:;">联系我们</a>
				<a href="javascript:;">帮助中心</a>
				<a href="javascript:;">服务公开</a>
				<a href="javascript:;">法律声明</a>
			</div>
			<p>
				<font>指导单位：宜春市工业和信息化局</font>
			</p>
			<p><font>Copyright @ 2016 - 2020 CloudCommunity Inc.All Rights Reserved.Powered by 宜春市智慧工业服务平台 / 赣ICP备16003961号-1</font><span class="fr">手机扫描右侧二维码</span></p>
			<p><font>技术支持：江西融合科技有限责任公司</font><span class="fr">关注“宜春市工信局”官方微号</span></p>
		</div>
		<div class="qrcode dib">
			<img src="${ctx}/static/image/homePage_yc/qrcodeNew.png">
		</div>
	</div>
</div>
