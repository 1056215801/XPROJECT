<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 此页面只在PC端页面引用  以及下面的封装alert 等方法只在PC端使用-->
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/image/${entranceId}/favicon.ico" rel="icon" type="image/x-icon" />
<link href="${ctx}/static/css/projectHeader2.css" rel="stylesheet" />
<link href="${ctx}/static/css/projectFooter.css" rel="stylesheet" />
<link href="${ctx}/static/css/projectCommon.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/plugins/jedate/skin/jedate.css">

<script type="text/javascript" src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script> 
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/iscroll.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jedate/jquery.jedate.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jedateInitialize.js"></script>
<script type="text/javascript">
var ctx= '${ctx}' ;
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
function getExtName(fileName){
	 var extStart=fileName.lastIndexOf(".");
	 if(extStart>0){
        return fileName.substring(extStart+1,fileName.length).toLowerCase();
	 }else
		 return "";
}
function isSafeFile(fileName){
  var ext=	getExtName(fileName);
  if(ext=='jsp' || ext=='php' || ext=='jspx' || ext=='asp' || ext=='aspx' || ext=='html'|| ext=='shtml' || ext=='jhtml' || ext=='exe' || ext=='dll' )
	   return false
  else
		   return true ;
}

function safeStr(str){
	return str.replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;");
	}

/**
 *
 * 页面自动轮播
 *
 */

var saver; 
function initScreenSaver(){     
    saver = new ScreenSaver({timeout:13000});     
}


function ScreenSaver(settings){     
    this.settings = settings;     
    
    this.nTimeout = this.settings.timeout;     
                 
    document.body.screenSaver = this;     
    // link in to body events     
    document.body.onmousemove = ScreenSaver.prototype.onevent;     
    document.body.onmousedown = ScreenSaver.prototype.onevent;     
    document.body.onkeydown = ScreenSaver.prototype.onevent;     
    document.body.onkeypress = ScreenSaver.prototype.onevent;     
    
    document.body.ontouchstart = ScreenSaver.prototype.onevent;     
    document.body.ontouchmove = ScreenSaver.prototype.onevent;  
    
    var pThis = this;     
    var f = function(){pThis.timeout();}     
    this.timerID = window.setTimeout(f, this.nTimeout);     
}     
ScreenSaver.prototype.timeout = function(){     
    if ( !this.saver ){
    	var url = $("#nextPageUrl").val();
    	/* $("#form").attr("action", url);   
    	$("#form").submit(); */
    	window.location.href=url;
    }     
}     
ScreenSaver.prototype.signal = function(){     
    if ( this.saver ){     
        this.saver.stop();     
    }     
         
    window.clearTimeout(this.timerID);     
         
    var pThis = this;     
    var f = function(){pThis.timeout();}     
    this.timerID = window.setTimeout(f, this.nTimeout);     
}     
    
ScreenSaver.prototype.onevent = function(e){     
    this.screenSaver.signal();     
}     
 
</script>
		