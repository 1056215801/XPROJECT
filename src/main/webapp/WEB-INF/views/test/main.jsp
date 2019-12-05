<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>首页</title>
<head> 
<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
</head>
 
 <body> <h3> 页面：main.jsp <br></h3>
 <div>
  <script id="editors" type="text/plain" style="width:100%;"></script>     
 </div>
 <input type="button" value="test" onclick=add() />
 </body>
 </html>
 
	  
	             
<script type="text/javascript">
var ue =null ;
$(function() {
	UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
	UE.Editor.prototype.getActionUrl = function(action) {
	    if (action == 'uploadvideo' || action == 'uploadscrawl' || action == 'uploadimage'  ) {
	        return '${ctx}/uploadimage';
	    } else {
	        return this._bkGetActionUrl.call(this, action);
	    }
	}	
	   ue = UE.getEditor('editors');
	   ue.addListener("ready", function () {
		    ue.setContent( "你好我是富文本编辑框");
		   });
	 
});   
 function findContent(){
	 return ue.getContent();   
 }
 function add(){
	//	window.location.href="${ctx}/projectActivityInfo/add";
	tips('你好，测试');
	}
</script> 