<!-- 工信委 -->
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
				<font>指导单位：江西省工业和信息化厅</font>
				<font>政府网站标识码：3600000010</font>
				<font>赣公网安备：36010802000136号</font>
			</p>
			<p><font>Copyright © 2017 China Graphics Net. All Rights Reserved 江西省工业园区智慧云平台 / 赣ICP备17013925号</font></p>
			<p><font>技术支持：江西融合科技有限责任公司</font></p>
		</div>
		<div class="qrcode dib">
			<img src="${ctx}/static/image/homePage_yc/qrcode.jpg" width="126">
		</div>
	</div>
</div>
 