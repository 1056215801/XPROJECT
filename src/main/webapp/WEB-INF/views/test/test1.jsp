<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>PC端附件上传</title>
<head> 
<meta charset="utf-8">
<meta name="renderer" content="webkit"  /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="${ctx}/static/js/contabs-tab.js"></script> 
<script type="text/javascript" src="${ctx}/static/plugins/uploadify3.2/jquery.uploadify.js"></script> 
<link href="${ctx}/static/plugins/uploadify3.2/uploadify.css" rel="stylesheet" type="text/css" />    
</head>
  
 <body><h3> 页面：test1.jsp <br></h3>
 <div style="float:left; margin-top:6px;"> 
	             <input type="file" data-no-uniform="true"  name="attachment" id="file_uploads"  multiple="true" >
	              <span id="fileQueues" ></span> 
	             </div>
<div id="attList" ></div>
<br>
 						 
<input type="hidden" id="att_ids" value="90020161214094808809898000000446,90020161021164512809898000000003,90020161021170817809898000000010" />
<input type="button" onclick="showLayer();" value="加载多个默认附件" />

<input type="button" onclick="showOne();" value="加载一个默认附件" />
</body>	             
<script type="text/javascript">
$(function() {
	// layer.msg('Hello layer');
	 $('#file_uploads').uploadify({ 
	    	'debug' : false,
	        'simUploadLimit': 3 ,
	        'multi' : false ,
	        'auto': true ,
	        'removeCompleted': true ,
	        'removeTimeout': 1 ,
	        'successTimeout':99999,
	        'formData':{
//	        	'jsessionid':'${pageContext.session.id}',
	            'generateSnapshot':true,
	            '${_csrf.parameterName}':'${_csrf.token}',
	        	'moduleId':'-1', 
	        	'remark':'测试附件test1'
	        },
	        'uploader': '${ctx}/session/attachment/publish' , // 新版
	       // 'uploader': '${ctx}/saveUploadifyAtt'  ,  // 原版
	        'swf':  "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
	        'overrideEvents' : [ 'onDialogClose', 'onUploadError', 'onSelectError' ],
	        'queueID':'fileQueues',
	        'fileObjName':'attachment',
	        'width':'80',
	        'height':'30',
	        'fileTypeDesc':'支持的格式：',
	        'fileTypeExts': '*.*'  ,
	        'fileSizeLimit':'100MB',
	        'buttonText' :  '选择文件', 
	        'queueSizeLimit' : 3,
	        'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
	             //使用方法见官方说明
	        },
	        'onSelect' : function( file ) {
	        	  
	        },
	        'onUploadError':function(file, errorCode, errorMsg){
	             if( errorCode = -280){
	            	 
	             }else{
	            	 alert('上传失败，请联系管理员2') ;
	             }
	        },
	        'onCloseError':function(file, errorCode, errorMsg){
	        	     alert('上传失败，请联系管理员3') ;
	        },
	        'onSelectError':function(file, errorCode, errorMsg){
	            switch(errorCode) {
	                case -100:
	                    alert("上传的文件数量已经超出系统限制的"+$('#uploadify').uploadify('settings','queueSizeLimit')+"个文件！");
	                    break;
	                case -110:
	                    alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#uploadify').uploadify('settings','fileSizeLimit')+"大小！");
	                    break;
	                case -120:
	                    alert("文件 ["+file.name+"] 大小为零，不能上传！");
	                    break;
	                case -130:
	                    alert("文件 ["+file.name+"] 类型不正确！");
	                    break;
	            }
	        },
	        //检测FLASH失败调用
	        'onFallback':function(){
	            alert("您未安装FLASH控件，无法上传！请安装FLASH控件后再试。");
	        },
	        'onUploadSuccess':function(file, data, response){
	        	 var obj = JSON.parse(data);
	        	 if(obj.success)
	        		 showAtts(obj.attachment) ;
	        	 else{
	        		 alert(obj.errorMsg) ;
	        	 }
	        	/*  返回的JSON 
	        	 {
				    "attachment":{
				        "attachmentId":"90020161011155317809898000000009",
				        "attachmentSize":"13652",
				        "attachmentUrl":"http://134.225.108.144/resources/2016/10/11/90020161011155317809898000000009.png",
				        "downloadUrl":"http://134.225.108.144/AttachmentPortal/interface/json/attachment/download?attachmentId=90020161011155317809898000000009",
				        "kbSize":13.332031,
				        "remoteName":"8.png",
				        "thirdSeq":""
				    },
				    "success":true,
				    "errorCode":0,
				    "errorMsg":"发布资源成功！"
				  }
	        	
	        	
	        	 */
	        } 
	});
});
	 
	  
	   
	/*   $.post("${ctx}/ajaxGetAtts", "attIds="+$('#att_ids').val(), 
	    		function(data) {
			          for(var i=0;i<data.length;i++){
			        	  showAtts(data[i],false);  
			            }
			    } ,"json" ); */
function delImg(){
	/* layer.confirm('确定要删除吗？', {
		icon: 3,
	    shade: false //不显示遮罩
		}, function(index){
		     layer.close(index);
		     $("#article\\.cover").val('');
	       	 $("#showPicUrl").attr('src','');
	       	 $("#showPicUrl").hide();
	       	 $("#delBtn").hide();
		}); */
}
function showPic(jsonData){
	 $("#article\\.cover").val(jsonData.attachment.attachmentUrl);
	 $("#showPicUrl").attr('src',jsonData.attachment.attachmentUrl);
	 $("#showPicUrl").show();
	 $("#delBtn").show();  
}
function showAtts(jsonData){
	// var str = JSON.stringify(jsonData);
	 var url="" ;
	 url+="<li id='"+jsonData.attachmentId+"'><a href='"+ jsonData.attachmentUrl+"' target='_blank' title='下载'>"+ jsonData.remoteName+"</a>&nbsp;<a href='javascript:;' style='color:black' onclick='deleteAtt(this)'>[删除]</a></li> ";
	 $('#attList').append(url) ;
}
function deleteAtt(obj){
	 layer.confirm('确定要删除吗？', {
		icon: 3,
	    shade: false //不显示遮罩
		}, function(index){
		     layer.close(index);
		     var id=$(obj).parent('li').attr('id')  ;
        	 $(obj).parent('li').remove();
        	 
        	 $.post("${ctx}/login/json/attachment/deleteByAttachmentId", "attachmentId="+id, 
     	    		function(data) {
     			           alert('删除成功！');
     			    } ,"json" );
		}); 
		//layer.msg('Hello layer');
	 
}
function showLayer1(){
	//加载默认的附件(老版本，show)
	 $.post("${ctx}/ajaxGetAtts", "attIds="+$('#att_ids').val(), 
	    		function(data) {
			          for(var i=0;i<data.length;i++){
			        	  showAtts(data[i]);  
			            }
			    } ,"json" );
}
function showLayer(){
	//加载默认的附件  
     $.post("${ctx}/login/json/attachment/selectListByAttachmentIdList", "attachmentIdList="+$('#att_ids').val(), 
	    		function(data) {
	    			 var obj =JSON.parse(data);
			          for(var i=0;i<obj.attachments.length;i++){
			         	  showAtts(obj.attachments[i]);  
			           }
			    } ,"json" );
}
function showOne(){
	 var  id = '90020161214094808809898000000446';
	 $.post("${ctx}/login/json/attachment/selectByAttachmentId", "attachmentId="+id, 
	    		function(data) {
	    			 var obj = JSON.parse(data);
	    			 alert(obj.snapshotUrl);
	    			 alert(obj.attachment.imageUrlList.length);
		 			 showAtts(obj.attachment);
			    } ,"json" );
}
</script> 
</html>  