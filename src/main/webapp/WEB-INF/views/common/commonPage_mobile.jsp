<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Cache" content="no-cache">

<!-- 此页面只在手机端端页面引用 -->
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script> 
<script type="text/javascript" src="${ctx}/static/weixin/js/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/js/logistics/collection.js"></script>
<script type="text/javascript" src="${ctx}/static/js/iscroll.js"></script>
<script type="text/javascript" src="${ctx}/static/weixin/js/laydate/laydate.js"></script>
<script type="text/javascript">
var ctx= '${ctx}';
var basePath= '<%=basePath%>';
var msg = '${message}';
</script>
<script type="text/javascript">
jQuery(function() {
	 

});
function onlyNum(o){
	o.value=o.value.replace(/\D/g,'');
}

</script>