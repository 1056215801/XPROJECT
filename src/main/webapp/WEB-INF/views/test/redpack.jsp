<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>附件上传</title>
<head> 
<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
</head>
 
 <body>
 <div>
 <form  name="dataForm" id="dataForm" action="${ctx}/wx/redpack/send" method="post">
  活动名称 <input type="text" name="act_name"  value="测试红包-国庆节抢钱啦" /><br>
   
     祝福语 <input type="text" name="wishing"  value="天天有红包" /><br>
   
     活动备注 <input type="text" name="remark"  value="好好学习" /><br>
   
     人数  <input type="text" name="total_num"   value="3" /><br>
     
     金额（分） <input type="text" name="money"   value="300" /><br>
     
     路径<input type="text" name="path"   value="/home/admin/test/apiclient_cert.p12" /><br>
     
       <input type="button" onclick="send1()"   value="普通" /> 
        <input type="button" onclick="send2()"   value="裂变" /><br>
  </form> 
 </div>
 </body>
 </html>
 
	  
	             
<script>
 function send1(){
	   $.post($("#dataForm").attr("action"), $("#dataForm").serialize(), 
		function(data) {
	           alert(data);
	    } ,"text" );  
	 
 }
 function send2(){
	   $.post("${ctx}/wx/redpack/sendGroup", $("#dataForm").serialize(), 
		function(data) {
	           alert(data);
	    } ,"text" );  
	 
}
</script> 