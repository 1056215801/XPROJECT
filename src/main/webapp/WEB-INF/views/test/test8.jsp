<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>简洁富文本编辑器-tinymce</title>
<head> 
    <script type="text/javascript" src="${ctx}/static/plugins/tinymce/tinymce.min.js"></script>
  </head>

  <body>
  <h3> 页面：test8.jsp  </h3> <input type="button" value="赋值" onclick="setVal('支付宝：abcd')">
    <textarea id="editor" >你好啊</textarea>
  </body>

  <script type="text/javascript">
  $(function() {
	 /*  $('#mceu_51-action').uploadify({ 
	    	'debug' : false,
	        'simUploadLimit': 3 ,
	        'multi' : true ,
	        'auto': true ,
	        'removeCompleted': true ,
	        'removeTimeout': 1 ,
	        'successTimeout':99999,
	        'formData':{
	            'jsessionid':'${pageContext.session.id}' 
	        },
	        'uploader': '${ctx}/login/json/attachment/publish' , // 新版
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
	        'onUploadStart' : function(file) {
				var myself = this; 
				if(!isSafeFile(file.name )){
					  alert('请选择合法的文件！');
					  myself.cancelUpload(file.id); 
				      $('#' + file.id).remove(); 
				}
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
	        		 alert(obj.attachment.attachmentUrl) ;
	        	 else{
	        		 alert(obj.errorMsg) ;
	        	 }
	        } 
	}); */
	  tinymce.init({
		    selector: '#editor',
	        height: 365,
	        language: 'zh_CN',
	        menubar: false,
	        automatic_uploads: true,
	        paste_data_images: true,
	        convert_urls: false,
	        relative_urls : false,
	        imagetools_toolbar: "rotateleft rotateright | flipv fliph | editimage imageoptions",
	     //   imagetools_proxy: '/jpress/admin/tinymce/image/proxy',
	     //   images_upload_url: '/jpress/admin/tinymce/image/upload',
	        wordcount_countregex: /[\u4e00-\u9fa5_a-zA-Z0-9]/g,
			file_picker_callback: function(callback, value, meta) {
			 	/* layer.open({
				    type: 2,
				    title: '选择图片',
				    shadeClose: true,
				    shade: 0.8,
				    area: ['50%', '50%'],
				    content: '/jpress/admin/attachment/choose_layer',
				    end:function(){
				    	if(''!=data.url && null != data.url){
				    		callback(data.url, {alt: data.alt});
				    	}
				    }
				});  */
				
			 },
	        plugins: [
			    "advlist autolink autosave link image media imagetools lists charmap print preview hr anchor pagebreak spellchecker",
			    "searchreplace wordcount visualblocks visualchars code codesample fullscreen insertdatetime media nonbreaking",
			    "table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
			  ],
	        toolbar1: '  bold italic underline strikethrough removeformat | blockquote hr table image media codesample | anchor link   unlink | alignleft aligncenter alignright alignjustify | bullist numlist     ',
	        toolbar2: '  formatselect | outdent indent | forecolor backcolor  |  undo redo | code  fullscreen',
		});
	
	
  }); 
  
    function setVal(v){
	    //获取
    	var s=tinyMCE.get('editor').getContent();
    	alert('原始值：'+s);
    	// 赋值
     	tinyMCE.get('editor').setContent(v);
    //	document.getElementById('editor_ifr').contentWindow.document.getElementById('tinymce').innerHTML =  v;
    }

  </script>
  
 </html>
 