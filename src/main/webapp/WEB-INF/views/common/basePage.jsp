<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/mainContent.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/titleTips/styles.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/titleTips/colortip-1.0-jquery.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>script/artDialog/skins/blue.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>script/My97DatePicker/skin/WdatePicker.css" />
<script type="text/javascript" src="<%=basePath %>script/jquery/jquery.js"></script>
<script type="text/javascript" src="../../script/select/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../../script/select/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/public/addTab.js"></script>
<script type="text/javascript" src="<%=basePath %>script/bootstrap/assets/js/websjy.js"></script>
<script type="text/javascript" src="<%=basePath %>script/artDialog/artDialog.js"></script>
<script type="text/javascript" src="<%=basePath %>js/login/login.js"></script>
<script type="text/javascript" src="<%=basePath %>script/My97DatePicker/WdatePicker.js" ></script>
<script type="text/javascript" src="<%=basePath %>script/titleTips/colortip-1.0-jquery.js" ></script>
<!-- 
<script type="text/javascript" src="<%=basePath %>script/titleTips/script.js" ></script> -->
<script type="text/javascript">
jQuery(function() {
	/**
	 * 操作提示
	 * content:提示内容
	 *  
	 */
	   
		  window.tips = function(content){
			  var sa= artDialog({
			        icon: 'succeed',
			        lock: true,
			        opacity: 0,
			        time: 1 ,//提示框自动消失时间：单位秒
			        content: ""+ content
			    });  
			  return;
		}
/**
 * 操作警告
 * content:警告内容
 * obj：要获得焦点的对象（选填）
 */
		 
		window.alert = function(content,obj){
		 //art.dialog.alert(content);
			 artDialog({
				  	autoOpen:false,
			        icon: 'warning',
			        lock: true,
			        opacity: 0,
			        content: ""+ content,
			        ok: function (){if(obj) obj.focus();},
			        init: function(){
			        	var list = art.dialog.list;
			        	for (var i in list) {
			        	   //list[i].close();
			        	}
			        }
			    });
			  return false;
		}
		 
 /**
 * 操作确认
 * content:确认内容
 * yesFn：点击确定触发的函数 
 * noFn：点击取消触发的函数
 */
		window.confirm = function(content, yesFn, noFn){
			// var s= art.dialog.confirm(content, yes, no);
			 var s= artDialog({
			        icon: 'question',
			        lock: true,
			        opacity: 0,
			        content: content,
			        ok: function () {
			        	 yesFn();
			        },
			        cancel: function () {
			        	 noFn();
			        },
			        init: function(){
			        	
			        	var list = art.dialog.list;
			        	for (var i in list) {
			        	   list[i].close();
			        	}
			        }
			    }); 
			 return false;
		}
		 	
		

});
function onlyNum(o){
	o.value=o.value.replace(/\D/g,'');
}
$(document).ready(function(){

});

</script>

<!-- 
<script type="text/javascript" src="<%=basePath %>platform/js/common.js"></script>
<script type="text/javascript" src="<%=basePath %>platform/js/form.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/easyui/easyui.css"/>
<script type="text/javascript" src="<%=basePath %>js/easyui/jquery.easyui.min.js"></script>
<script defer="defer" src="<%=basePath %>script/My97DatePicker/WdatePicker.js"/></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/inputclass.css"/>
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>js/inputlimiter/jquery.inputlimiter.1.0.css" />
<script type="text/javascript"
	src="<%=basePath %>js/inputlimiter/jquery.inputlimiter.1.2.2.min.js" ></script>
 -->
	