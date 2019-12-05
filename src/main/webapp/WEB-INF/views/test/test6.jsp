<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>省市县</title>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/area.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/location.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2_locale_zh-CN.js"></script>
  
<link href="${ctx}/static/plugins/select2/css/common.css" rel="stylesheet"/>
<link href="${ctx}/static/plugins/select2/css/select2.css" rel="stylesheet"/>
 
</head>
<body>
<h3> 页面：test6.jsp <br></h3>
<div class="main">
  <center>
    <select id="loc_province" style="width:120px;">
    </select>
    <select id="loc_city" style="width:120px; margin-left: 10px">
    </select>
    <select id="loc_town" style="width:120px;margin-left: 10px">
    </select>
    <br>
    <br>
    <br>
    <br>
    <input type="button" id="btnval" value="获取值" style="padding:5px 15px;"/>
    <input type="button" id="btntext" value="获取文本" style="padding:5px 15px;" />
  </center>
</div>

</body>
</html>
