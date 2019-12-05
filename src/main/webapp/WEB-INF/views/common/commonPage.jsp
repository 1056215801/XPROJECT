<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<link type="text/css" rel="stylesheet" href="${ctx}/static/plugins/jedate/skin/jedate.css">
<link type="text/css" rel="stylesheet" href="${ctx}/static/plugins/uploadify3.2/uploadify.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/font-awesome.min93e3.css" />
<link type="image/x-icon" rel="icon"   href="${ctx}/static/image/${entranceId}/favicon.ico"/>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script> 
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/iscroll.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/echarts/echarts-all.js"></script> 
<script type="text/javascript" src="${ctx}/static/plugins/jedate/jquery.jedate.js"></script>

<script type="text/javascript">
var ctx= '${ctx}';
jQuery(function() {
	/**
	 * 操作提示
	 * content:提示内容
	 *  
	 */
		window.tips = function(content){
		layer.closeAll();
		layer.msg(''+content, {
			time: 2000 //2秒关闭（如果不配置，默认是3秒）
			}, function(){
			//do something 
			});
			return;
		}
/**
 * 操作警告
 * content:警告内容
 * obj：要获得焦点的对象（选填）
 */
		 
		window.alert = function(content){
	    layer.closeAll();
	 	layer.alert(""+content, { title:'提示',shift: 0,shade: 0,icon: 0}); 
			  return false;
		}
		 
		/**
		 * 带回调的操作警告
		 * content:警告内容
		 * youFn：回调函数（ ）
		 */		
		window.alertNew = function(content, youFn){
		    layer.closeAll();
		    var index=layer.alert(""+content, { title:'提示',shift: 0,shade: 0,icon: 0}, youFn);  
		    
			}
		
 /**
 * 操作确认
 * content:确认内容
 * yesFn：点击确定触发的函数 
 * noFn：点击取消触发的函数
 */
		window.confirm = function(content, yesFn,noFn ){
			// var s= art.dialog.confirm(content, yes, no);
		  layer.closeAll();
		 var index= layer.confirm(""+content, {
			  				title:'请确认',
    			  			icon: 3,
    			  		    shade: false //不显示遮罩
    					  	}, function(index){
    					  		 yesFn();
    					  		 layer.close(index);
    						 }, function(){
    							 if(noFn!=null){
    					  			noFn();
    							 }
    							 layer.close(index);
    						 }
    					  	); 
			 return false;
		}
});
function onlyNum(o){
	o.value=o.value.replace(/\D/g,'');
}

</script>
		