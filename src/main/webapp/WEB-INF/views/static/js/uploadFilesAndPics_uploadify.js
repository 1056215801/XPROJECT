/***
 * xiaoyouxin
 * 基于UploadIfy 的封装 文件上传单个图片上传
 */
function registerUploadFilesComm(elementId,btnheight,btnwidth,buttonText,uplaodServerdir,swfdir,queueSpanId,attachmentInputId,attachmentHtmlId){
	$('#'+elementId).uploadify({
    	'debug' : false,
        'simUploadLimit': 3 ,
        'multi' : true ,
        'auto': true ,
        'removeCompleted': true ,
        'removeTimeout': 1 ,
        'successTimeout':99999,
        'formData':{
        	'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
			'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val(),
            'jsessionid':'${pageContext.session.id}' 
        },
        'uploader': uplaodServerdir  , 
        'swf': swfdir ,
        'overrideEvents' : [ 'onDialogClose', 'onUploadError', 'onSelectError' ],
        'queueID':queueSpanId,
        'fileObjName':'attachment',
        'width':btnwidth,
        'height':btnheight,
        'fileTypeDesc':'支持的格式：',
        'fileTypeExts': '*.*'  ,
        'fileSizeLimit':'100MB',
        'buttonText' :  buttonText, 
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
        	 var obj = eval('(' + data + ')');
        	 if(obj.success){
        		 $("#"+attachmentInputId).val(obj.attachment.attachmentId);
        		 //showAtts(obj) ;
        		 var url = "";
        		 url+="<li id='"+obj.attachment.attachmentId+"'><a href='"+ obj.attachment.attachmentUrl+"' target='_blank' title='下载'>"+ obj.attachment.remoteName+"</a>&nbsp;<a href='javascript:;' style='color:black' onclick='deleteAtt(this)'>[删除]</a></li> ";
        		 $("#"+attachmentHtmlId).append(url) ;
        	 }else{
        		 alert(obj.errorMsg) ;
        	 }
        	/* 返回的JSON 
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
		//getAttachmentHtmlAppendElement(attachmentHtmlId,oldattachmentids,'true',attachmentInputId);
}

function deleteAtt(obj){
	 layer.confirm('确定要删除吗？', {
		icon: 3,
	    shade: false //不显示遮罩
		}, function(index){
		     layer.close(index);
		     var id=$(obj).parent('li').attr('id')  ;
      	 $(obj).parent('li').remove();
		}); 
}
function getExtName(fileName){
	 var extStart=fileName.lastIndexOf(".");
	 if(extStart>0){
        return fileName.substring(extStart+1,filepath.length).toLowerCase();
	 }else
		 return "";
}
function isSafeFile(fileName){
  var ext=	getExtName(fileName);
  if(ext=='jsp' || ext=='php' || ext=='jspx' || ext=='asp' || ext=='aspx' || ext=='exe' || ext=='dll' )
	   return false
  else
		   return true ;
}