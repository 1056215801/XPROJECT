<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>script/artDialog/skins/blue.css" />
<script type="text/javascript" src="<%=basePath %>script/jquery/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>script/artDialog/artDialog.js"></script>
<script type="text/javascript" src="<%=basePath %>script/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript">
jQuery(function() {
	   //操作提示 1秒后自动关闭
		  window.tips = function(content){
			  var sa= artDialog({
			        icon: 'succeed',
			        lock: true,
			        opacity: 0,
			        time: 2 ,//提示框自动消失时间：单位秒
			        content: ""+ content
			    });  
			  return;
		}

		//操作警告
			window.alert = function(content){
			 //art.dialog.alert(content);
				 artDialog({
					  	autoOpen:false,
				        icon: 'warning',
				        lock: true,
				        opacity: 0,
				        content: ""+ content,
				        ok: function (){},
				        init: function(){
				        	var list = art.dialog.list;
				        	for (var i in list) {
				        	   //list[i].close();
				        	}
				        }
				    });
				  return false;
			}
			//操作确认
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
//截取字符串长度
function resetStrLength(str, length) {
	// 原字符串即使全部按中文算，仍没有达到预期的长度，不需要截取
	if(str==null) return "" ;
	if (str.length * 2 <= length)
		return str;
	var rtnLength = 0; // 已经截取的长度
	for (var i = 0; i < str.length; i++) {
		// 字符编码号大于200，将其视为中文，该判断可能不准确
		if (Math.abs(str.charCodeAt(i)) > 200)
			rtnLength = rtnLength + 2;
		else
			rtnLength++;
		// 超出指定范围，直接返回
		if (rtnLength > length)
			return str.substring(0, i) + (rtnLength % 2 == 0 ? "..." : "...");
	}
	return str;
}
$(document).ready(function(){

});

</script>

 