<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>简洁富文本编辑器-simditor</title>
<head> 
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/plugins/simditor/simditor.css" />
    <!-- 
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/plugins/simditor/font-awesome.css" />
     -->
    <script type="text/javascript" src="${ctx}/static/js/plugins/simditor/module.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/plugins/simditor/hotkeys.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/plugins/simditor/uploader.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/plugins/simditor/simditor.min.js"></script>
  </head>

  <body>
    <textarea id="editor" placeholder="这里输入内容" autofocus></textarea>
  </body><h3> 页面：test5.jsp <br></h3>

  <script type="text/javascript">
  $(function() {
	  
  }); 
    var editor = new Simditor({
    	 toolbar: ['title', 'bold', 'italic', 'underline', 'strikethrough', 'fontScale', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', '|', 'indent', 'outdent', 'alignment'] , 
         pasteImage: true,
         defaultImage: 'assets/images/image.png',
         upload: location.search === '?upload' ? {
           url: '/upload'
         } : false,
         textarea: $('#editor')
    });

  </script>
  
 </html>
 