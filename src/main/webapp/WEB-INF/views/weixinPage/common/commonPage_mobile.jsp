<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 此页面只在手机端端页面引用 -->
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="${ctx}/static/plugins/jquery-weui/lib/weui.min.css" rel="stylesheet" />
<link href="${ctx}/static/plugins/jquery-weui/css/jquery-weui.min.css" rel="stylesheet" />

<script type="text/javascript" src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script> 
<script type="text/javascript" src="${ctx}/static/weixin/js/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/js/logistics/collection.js"></script>
<script type="text/javascript" src="${ctx}/static/js/iscroll.js"></script>
<script type="text/javascript" src="${ctx}/static/weixin/js/laydate/laydate.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jquery-weui/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jquery.query/jquery.query.js"></script>
<script type="text/javascript">
function onlyNum(o){
	o.value=o.value.replace(/\D/g,'');
}
</script>