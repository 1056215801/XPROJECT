<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${projectDeclareInfo.declareTitle}</title>
<link href="${ctx}/static/css/projectDeclare/projectDetails.css" rel="stylesheet"/>
<link href="${ctx}/static/css/projectDeclare/buttons.css" rel="stylesheet"/>
<%-- <link href="${ctx}/static/css/plugins/simditor/simditor.css" rel="stylesheet"/> --%>
<style>
body .auditOper{border-radius:10px!important;}
.button_Contral {
	margin:0 1%;
	text-align:center;
	border-radius:20px;
	font-weight:bold;
}
.redcolor{
	color:#f14241;
}
.displayNone{
	display:none;
}
img { max-width: 100%;}
</style>
<script>
 $(function(){
	 $('#checkAll').click(function() {
			jQuery("[name='ids']:enabled").attr("checked", this.checked);
		});
	 $('#passAudit').click(function() {
		 var str = "";
		 jQuery("input[name='ids']:checkbox:checked").each(function() {
				str += jQuery(this).val() + ",";
			});
		 audit(str,"通过");
		});
	
	 $('#noPassAudit').click(function() {
		 var str = "";
		 jQuery("input[name='ids']:checkbox:checked").each(function() {
				str += jQuery(this).val() + ",";
			});
		 audit(str,"不通过");
		});
	 $('#batchDown').click(function() {
		 var str = "";
		 jQuery("input[name='ids']:checkbox:checked").each(function() {
				str += jQuery(this).val() + ",";
			});
		 window.location.href="${ctx}/projectDeclare/batchDownload?ids="+str;
		});
	 
		//附件编辑时展示
		if($('#atIdList').val()!=null && $('#atIdList').val()!=""){
			var atIdList = $('#atIdList').val();
		$.get("${ctx}/login/json/attachment/selectListByAttachmentIdList", "attachmentIdList="+atIdList, 
 		function(datas) {
			var data = JSON.parse(datas);
		          for(var i=0;i<data.attachments.length;i++){
		        	  showAtts(data.attachments[i]);  
		            }
		    } ,"json" );
		}
		
	 
	 if('${pubView}'!=null && '${pubView}'!=""){
		 $(".titleName ul li").each(function(){
			 if($(this).hasClass("titleClick")){
				 $(this).removeClass("titleClick");
			 }
			 if($(this).text()=='公示结果'){
				 $(this).addClass("titleClick");
				 var a = $(this).index();
				 $(".titleItem>div").eq(a).stop(true).show().siblings().stop(true).hide();
				 $('#publicityView').show();
				 $('#publicityCreate').hide();
				 $('#pubList').hide();
			 }
			 if('${declareId}'==-1){
				 $('#myApply').hide();
				 $('#declareContent').hide();
			 }
		 });
		/*  $(".titleName ul li").eq(2).addClass("titleClick");
		 $(".titleItem>div").eq(2).stop(true).show().siblings().stop(true).hide(); */
		 
		 getPublicityView(0,'${pubId}');
	 }
	 //异步加载附件
	 var atIdList="${projectDeclareInfo.atIdList}";
	 if(atIdList!=null&&atIdList!=""){
		 
		$.ajax({
			url:"${ctx}/login/json/attachment/selectListByAttachmentIdList",
			type:'get',
			data:{'attachmentIdList':atIdList},
			dataType:'json',
			success:function(datas){
				var data = JSON.parse(datas);
				for(var i = 0;i<data.attachments.length;i++){
					if(i==data.attachments.length){
						$('#getAtts').append(
								 "<a href='"+data.attachments[i].attachmentUrl+"' target='_blank'>"+data.attachments[i].remoteName+"</a>"
								);
						}else{
							$('#getAtts').append(
									 "<a href='"+data.attachments[i].attachmentUrl+"' target='_blank'>"+data.attachments[i].remoteName+"</a><br/>"
									);
						}
					}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
	 }
		
	 $('#file_uploads').uploadify({
			'debug' : false,
			'simUploadLimit' : 3,
			'multi' : true,
			'auto' : true,
			'removeCompleted' : true,
			'removeTimeout' : 1,
			'successTimeout' : 99999,
			'formData' : {
				'jsessionid' : '${pageContext.session.id}',
				'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
				'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val()
			},
			 'uploader': '${ctx}/session/attachment/publish' , // 新版
			'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
			'overrideEvents' : [ 'onDialogClose',
					'onUploadError', 'onSelectError' ],
			'queueID' : 'attList',
			'fileObjName' : 'attachment',
			'width' : '80',
			'height' : '30',
			'fileTypeDesc' : '支持的格式：',
			'fileTypeExts' : '*.*',
			'fileSizeLimit' : '100MB',
			'buttonText' : '上传附件',
			'queueSizeLimit' : 3,
			'onUploadProgress' : function(file,
					bytesUploaded, bytesTotal,
					totalBytesUploaded, totalBytesTotal) {
				//使用方法见官方说明
			},
			'onSelect' : function(file) {

			},
			'onUploadStart' : function(file) {
				var myself = this; 
				if(!isSafeFile(file.name )){
					  alert('请选择合法的文件！');
					  myself.cancelUpload(file.id); 
				      $('#' + file.id).remove(); 
				}
			},
			'onUploadError' : function(file, errorCode,
					errorMsg) {
				if (errorCode = -280) {

				} else {
					alert('上传失败，请联系管理员2');
				}
			},
			'onCloseError' : function(file, errorCode,
					errorMsg) {
				alert('上传失败，请联系管理员3');
			},
			'onSelectError' : function(file, errorCode,
					errorMsg) {
				switch (errorCode) {
				case -100:
					alert("上传的文件数量已经超出系统限制的"
							+ $('#file_uploads').uploadify(
									'settings',
									'queueSizeLimit')
							+ "个文件！");
					break;
				case -110:
					alert("文件 ["
							+ file.name
							+ "] 大小超出系统限制的"
							+ $('#file_uploads').uploadify(
									'settings',
									'fileSizeLimit')
							+ "大小！");
					break;
				case -120:
					alert("文件 [" + file.name
							+ "] 大小为零，不能上传！");
					break;
				case -130:
					alert("文件 [" + file.name + "] 类型不正确！");
					break;
				}
			},
			//检测FLASH失败调用
			'onFallback' : function() {
				alert("您未安装FLASH控件，无法上传！请安装FLASH控件后再试。");
			},
			'onUploadSuccess' : function(file, data,
					response) {
				var obj =JSON.parse(data);
				showAtts(obj.attachment);
				
				var url = $("#atUrlList").val() + obj.attachment.attachmentUrl + ",";
				$("#atUrlList").val(url);
				var id = $("#atIdList").val() + obj.attachment.attachmentId + ",";
				$("#atIdList").val(id);
			}
		});

		$('#apply').click(function(){
			window.location.href="${ctx}/projectDeclare/applyCreate?declareId=${projectDeclareInfo.declareId}";
		});
	 
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(1).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		if('${pubView}'==null || '${pubView}'==""){
		$(".titleName ul li").eq(0).addClass("titleClick");
		}
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	
	$("#stateBar .details_State").click(function(){
		 if($(this).hasClass("redcolor")){
			 if($(this).text().indexOf("(")!=-1){
					$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
				}
				$(this).removeClass("redcolor");
			}else{
				$("#stateBar .details_State").each(function(){
		            if($(this).hasClass("redcolor")){
		            	if($(this).text().indexOf("(")!=-1){
							$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
						}
		            	$(this).removeClass("redcolor");
		            }
		        }); 
				$(this).addClass("redcolor");
			}
	});
	
	$(".audit_optionBar div").click(function(){
		 if($(this).hasClass("audit_redOption selected")){
				
		}else{
			$(".audit_optionBar div").each(function(){
	            if($(this).hasClass("audit_redOption selected")){
	            	$(this).removeClass("audit_redOption selected");
	            	$(this).addClass("audit_grayOption");
	            	$("#pass").attr("src","${ctx}/static/image/projectDeclare/t3.png");
	            	$("#nopass").attr("src","${ctx}/static/image/projectDeclare/b3.png");
	            }
	        }); 
			if($(this).text().trim()=="通过"){
				$("#pass").attr("src","${ctx}/static/image/projectDeclare/t1.png");
			}else{
				$("#nopass").attr("src","${ctx}/static/image/projectDeclare/b1.png");
			}
			$(this).removeClass("audit_grayOption");
			$(this).addClass("audit_redOption selected");
		}
	});
	//提交
	$("#saveBtn").click(function(){
		var publicityTitle = $("#publicityTitle").val();
		if(publicityTitle == null || publicityTitle == ""){
			tips('请输入标题');
			return false;
		}
		
		var activeEditor = tinymce.activeEditor;
		var editBody = activeEditor.getBody();
		activeEditor.selection.select(editBody);
		var declareText = activeEditor.selection.getContent( { 'format' : 'text' } );
		declareText = declareText.trim();
		if(declareText==null || declareText==""){
			tips('请输入项目正文！');
			return false;
		}
	
		 $('#form').submit();
		 $('#atIdList').val();
		 $('#atUrlList').val();
	});
	/* //预览
	$("#previewBtn").click(function() {
		var publicityTitle = $("#publicityTitle").val();
		if(publicityTitle == null || publicityTitle == ""){
			tips('请输入标题');
			return false;
		}
		
		var activeEditor = tinymce.activeEditor;
		var editBody = activeEditor.getBody();
		activeEditor.selection.select(editBody);
		var publicityText = activeEditor.selection.getContent( { 'format' : 'text' } );
		publicityText = publicityText.trim();
		if(publicityText==null || publicityText==""){
			tips('请输入正文！');
			return false;
		}
		preview();
	
 }); */
 });
 function auditOper(ids){//审核操作弹框
	 $('#applyIdAudit').val(ids);
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		skin: 'auditOper',
		shade: [0],
		area:['500px','280px'],
		closeBtn:0,
		content: $('#auditOper')
	});
 };
 
 
 function getApplyList(declareId,status,pageNum,pageSize,accountId){//获取申报企业列表
	 
	 $.ajax({
			url:"${ctx}/projectDeclare/json/applylist",
			type:"get",
			data:{
					"declareId":declareId,
					"status":status,
					"pageNum":pageNum,
					"pageSize":pageSize,
					"accountId":accountId
				 },
			dataType:"json",
			success:function(result){
				if(pageNum==1){
					  $('#myApplyList').empty();
				}
				if(result.code==-1){
					layer.msg(result.msg);
				}else if(result.code==2){
						$('#myApplyList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						$('#myGetmoreAllActi').hide();
				}else if(result.code==-2){
					layer.msg(result.msg);
					$('#myGetmoreAllActi').hide();
				}else{
					var list = result.value;
					var size = result.msg;
					
					 $("#stateBar .details_State").each(function(){
				         if($(this).hasClass("redcolor")){
				        	 if($(this).text().indexOf("(")!=-1){
									$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
								}
				         	$(this).text($(this).text()+"("+size+")");
				         }
				     }); 
					
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div =  '<div class="details_dataBar">'
								   +'<div class="details_company">'+info.companyName+'</div>'
					  			   +'<div style="margin-left:10px;">'
								   +'<div>联系人：<span>'+info.accountName+'</span></div>'
								   +'<div>联系电话：<span>'+info.accountTel+'</span></div>'
								   +'<div>上报附件：<span>该企业上报材料</span>';
								   if(info.atIdList!=""&&info.atIdList!=null){
								     _div += '<span class="spanOper">[<a class="aOper" href="${ctx}/projectDeclare/batchDownload?ids='+info.applyId+'">下载</a>]</span></div>';
								   }else{
									   _div += '&nbsp;无</div>';
								   }
							         _div += '<div>上报时间：<span>'+getTime(info.createTime)+'</span></div>'
								   +'</div>';
						       if(info.applyStatus==2){
						    	   if(accountId!="" && accountId!=null){
						    		   _div += '<div class="details_blueOper" ">审核中</div>'
							           +'</div>';
						    	   }else{
						    		   _div += '<div class="details_blueOper" onClick="auditOper(\''+info.applyId+'\');">审核</div>'
							           +'</div>'; 
						    	   }
						    	  
						       }else if(info.applyStatus==1){
						    	   if(info.auditOrgId == '${projectDeclareInfo.supervisorId}'){
						    		   _div +=  '<div class="details_redOper">'
									       +'<img src="${ctx}/static/image/projectDeclare/t2.png" width="25px;" height="25px;" class="imgContral">通过'
										   +'</div>'
						                   +'</div>';
						    	   }else{
						    		   _div += '<div class="details_blueOper" ">审核中</div>'
								           +'</div>';
						    	   }
						    	   
						       }else{
						    	   _div +=  '<div class="details_grayOper">'
										   +'<img src="${ctx}/static/image/projectDeclare/b2.png" width="25px;" height="25px;" class="imgContral">未通过'
								           +'</div>'
							               +'</div>';
						       }
						    	   $('#myApplyList').append(_div);   
									if(result.code==0){
										$('#myGetmoreAllActi').hide();
										}else if(result.code==1){
											$('#myGetmoreAllActi').show();
										}
					}
				}
			},
			error:function(){
				tips("请求超时，请稍后重试");
				},
			});
 };
 
 function getAuditList(declareId,status,pageNum,pageSize){//获取申报企业列表
	 
	 $.ajax({
			url:"${ctx}/projectDeclare/json/applylist",
			type:"get",
			data:{
					"declareId":declareId,
					"status":status,
					"pageNum":pageNum,
					"pageSize":pageSize
				 },
			dataType:"json",
			success:function(result){
				if(pageNum==1){
					  $('#auditList').empty();
				}
				if(result.code==-1){
					layer.msg(result.msg);
				}else if(result.code==2){
						$('#auditList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						$('#getmoreAllActi').hide();
				}else{
					var list = result.value;
					var size = result.msg;
					
					if(pageNum==1){
						$('#auditList').empty();
					}
					
					 $("#stateBar .details_State").each(function(){
				         if($(this).hasClass("redcolor")){
				        	 if($(this).text().indexOf("(")!=-1){
									$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
								}
				         	$(this).text($(this).text()+"("+size+")");
				         }
				     }); 
					
						var _div="";
						if(pageNum==1){
							 _div += '<tr class="firstTr">'
								+'<th style="width:5%;"></th>'
								+'<th style="width:30%;">公司名称</th>'
								+'<th style="width:10%;">联系人</th>'
								+'<th style="width:15%;">联系电话</th>'
								+'<th style="width:15%;">上报时间</th>'
								+'<th style="width:10%;">上报材料</th>'
								+'<th style="width:15px;">其他操作</th>'
								+'</tr>';
						}
					for(var i=0;i<list.length;i++){
						var info = list[i];
						 _div += '<tr class="nextTr">'
									+'<td style="width:5%;">'
									+'<div class="i-checks" style="text-align:center;"><input type="checkbox" name="ids" value="'+info.applyId+'"></div>'
									+'</td>'
									+'<td style="width:30%;">'
									+info.companyName
									+'</td>'
									+'<td style="width:10%;">'+info.accountName+'</td>'
									+'<td style="width:15%;">'+info.accountTel+'</td>'
									+'<td style="width:15%;">'+getTime(info.createTime)+'</td>'
									+'<td style="width:10%;">';
									if(info.atIdList=="" || info.atIdList==null){
										 _div += '无';
									}else{
									     _div += '<a href="${ctx}/projectDeclare/batchDownload?ids='+info.applyId+'" class="details_AOper">下载</a>';
									}
							_div += '</td>'
									+'<td style="width:15%;">';
									if(info.applyStatus==2){
									_div +='<a href="javascript:auditOper(\''+info.applyId+'\');" class="details_AOper">审核</a>';
									}else{
									_div +='暂无';
									}
									_div +='</td>'
									+'</tr>';
									if(result.code==0){
										$('#getmoreAllActi').hide();
										}else if(result.code==1){
											$('#getmoreAllActi').show();
										}
					}
									$('#auditList').append(_div);   
				}
			},
			error:function(){
				tips("请求超时，请稍后重试");
				},
			});
 };
 
 function selectByStatus(declareId,status){
	 if(status!=2){
		 $('#passAudit').hide();
		 $('#noPassAudit').hide();
	 }else{
		 $('#passAudit').show();
		 $('#noPassAudit').show(); 
	 }
	 getAuditList(declareId,status,1,6,"");
	
	 
 }
 
 function getmore(type){
			var status = "";
	 if(type==1){
			var pageNum = Number($("#pageNum").val())+1;
			$("#pageNum").val(pageNum);
			 $("#stateBar .details_State").each(function(){
		         if($(this).hasClass("redcolor")){
		        	 if($(this).text()=="待审核"){
		        		 status = 2;
		        	 }
		        	 if($(this).text()=="通过"){
		        		 status = 1;
		        	 }
		        	 if($(this).text()=="不通过"){
		        		 status = 0;
		        	 }
		         }
		     }); 
			
			 getAuditList('${projectDeclareInfo.declareId}',status,pageNum,6,"");
	 }else if(type==2){
		 var pageNumber = Number($("#pageNumber").val())+1;
			$("#pageNumber").val(pageNumber);
			getPublicityList(pageNumber,6);
	 }else if(type==3){
		 var myPageNumber = Number($("#myPageNumber").val())+1;
		 var accountId = '${currentAccountId}';
			$("#myPageNumber").val(myPageNumber);
			 getApplyList('${projectDeclareInfo.declareId}',status,myPageNumber,6,accountId);
	 }
	
	 }
 
 function audit(ids,audit){
	 if(audit==""){
	 ids = $('#applyIdAudit').val();
	 $(".audit_optionBar div").each(function(){
         if($(this).hasClass("audit_redOption selected")){
        	 audit = $(this).text();
         }
     }); 
	 }
	 $.ajax({
			url:"${ctx}/projectDeclare/json/auditApply",
			type:"get",
			data:{
					"ids":ids,
					"audit":audit
				 },
			dataType:"json",
			success:function(result){
				if(result.success==true){
					tips("审核成功！");
				}else{
					tips("审核失败！");
				}
	            getAuditList('${projectDeclareInfo.declareId}',2,1,6,"");
			},
			error:function(){
				tips("审核失败！");
				},
			});
 }
 
 function getApplyComp(){
	 getAuditList('${projectDeclareInfo.declareId}',2,1,6,"");
 }
 function getmyApplyComp(){
	 var accountId = '${currentAccountId}';
	 if(accountId==null || accountId==''){
		 accountId=-1;
	 }
	 getApplyList('${projectDeclareInfo.declareId}','',1,6,accountId);
 }
 
 function colseLayer(){
	 layer.closeAll();
 }
 
 function addPublic(){
	 $(".titleName ul li").each(function(){
		 if($(this).hasClass("titleClick")){
			 $(this).removeClass("titleClick");
		 }
		 if($(this).text()=='公示结果'){
			 $(this).addClass("titleClick");
		 }
		 var a = $(this).index();
		 $(".titleItem>div").eq(a).stop(true).show().siblings().stop(true).hide();
	 });
 }
 
 function showAtts(jsonData) {
		var url = "";
		url += '<li id="'+jsonData.attachmentId+'"><a href="'+jsonData.attachmentUrl+'" target="_blank" style="color:blue;">'
				+ jsonData.remoteName
				+ '</a>&nbsp;<a href="javascript:;" style="color:blue;"  onclick="deleteAtt(\''+jsonData.attachmentId+'\',\''+jsonData.attachmentUrl+'\')">[删除]</a></li> ';
		$('#attList').append(url);
		
	}
 
 function deleteAtt(id,url) {
		confirm('确认删除？', function(index) {
     	$('#'+id).remove();
		    var atIdList = $('#atIdList').val();
		    var atUrlList = $('#atUrlList').val();
		    var atIdAttr = atIdList.split(","); 
		    var atUrlAttr = atUrlList.split(",");
		    var newIds = "";
		    var newUrls= "";
		    for(var i = 0;i<atIdAttr.length;i++){
		    	if(atIdAttr[i]!=""&&atIdAttr[i]!=id){
		    		var newId =  atIdAttr[i] +"," ;
		    		newIds += newId;
		    	}
		    	if(atUrlAttr[i]!=""&&atUrlAttr[i]!=url){
		    		var newUrl = atUrlAttr[i] +",";
		    		newUrls += newUrl;
		    	}
		    }
		    $('#atIdList').val(newIds);
		    $('#atUrlList').val(newUrls);
		},function(){});  
	}
 
 function publicityType(type) {
	 var accountId = '${currentAccountId}';
	 if(type==1){
		 $("#noPublicity").hide(); 
		 $('#pubList').hide();
		 $("#publicityCreate").show();
		 
	 }else{
	 if('${projectDeclareInfo.declareStatus}'==2){
		 $("#noPublicity").hide(); 
		 $("#publicityCreate").hide();
		 $('#publicityView').show();
		 getPublicityView(1,'${projectDeclareInfo.declareId}');
	 }else if('${projectDeclareInfo.declareRemark}'!==null && '${projectDeclareInfo.declareRemark}'!=="" 
			 ){
		 $("#noPublicity").hide(); 
		 $('#publicityView').hide();
		 $("#publicityCreate").hide();
		 $('#pubList').show();
		 getPublicityList(1,6);
	 }else if('${projectDeclareInfo.declareStatus}'==0 && ('${projectDeclareInfo.declareRemark}'==null || '${projectDeclareInfo.declareRemark}'=="")){
		 $('#publicityView').hide();
		 $('#pubList').hide();
		 /* if('${projectDeclareInfo.accountId}' == accountId){ */
	/* 	 $("#publicityCreate").show();
		 $("#noPublicity").hide(); 
		 }else{ */
			 $("#publicityCreate").hide(); 
			 $("#noPublicity").show(); 
		/*  } */
	 }else if('${projectDeclareInfo.declareStatus}'==1 ){
		 $('#publicityView').hide();
		 $('#pubList').hide();
		 if('${projectDeclareInfo.accountId}' == accountId){
			 $("#publicityCreate").show();
			 $("#noPublicity").hide(); 
			 }else{
				 $("#publicityCreate").hide(); 
				 $("#noPublicity").show();
			 }
	 }
   }
 }
 
 
 
 function publicityView(type,id) {
	 if(type==0){
	 $('#publicityView').show();
	 $('#publicityCreate').hide();
	 $('#pubList').hide();
	 getPublicityView(0,id);
	 }else if(type==1){
		 $(".titleName ul li").each(function(){
			 if($(this).hasClass("titleClick")){
				 $(this).removeClass("titleClick");
			 }
			 if($(this).text()=='公示结果'){
				 $(this).addClass("titleClick");
			    var a = $(this).index();
			    $(".titleItem>div").eq(a).stop(true).show().siblings().stop(true).hide();
			 }
		 });
		 if('${projectDeclareInfo.declareStatus}'==1 ){
			 $('#publicityView').hide();
			 $('#pubList').hide();
					 $("#publicityCreate").hide(); 
					 $("#noPublicity").show();
		 }else if('${projectDeclareInfo.declareStatus}'==2){
			 $('#publicityView').show();
			 $('#publicityCreate').hide();
			 $('#pubList').hide();
			 $('#noPublicity').hide();
			 getPublicityView(1,id);
		 }
		
	 }
 }
 
 function getPublicityView(type,id){
	 if(type==0 ||type == 2 || type == 3){
		 $.ajax({
				url:"${ctx}/projectDeclare/json/publicityViewById",
				type:"post",
				data:{
						"publicityId":id,
						"${_csrf.parameterName}":"${_csrf.token}"
					 },
				dataType:"json",
				success:function(result){
					var info = result;
					if(type==3){
						$('#declareId').val(info.declareId);
						$('#publicityTitle').val(info.publicityTitle);
						tinyMCE.get('publicityText').setContent(info.publicityText);
						$('#atUrlList').val(info.atUrlList);
						$('#atIdList').val(info.atIdList);
						$('#publicityId').val(info.publicityId);
						 $('#publicityView').hide();
						 $('#publicityCreate').show();
						 $('#pubList').hide();
					}else{
						 $('#publicityView').empty();
						 
							var _div = '<div style="padding:15px 18px;">'
							           + '<div style="float:right; position:relative; top:5px;">'
									   + '<span class="font12">一键分享</span>'
									   + '<a title="分享给QQ好友" onclick="shareToQQFriend(event,"项目")" href="javascript:;"><img src="${ctx}/static/image/qq.png"style="margin-left:5px;"></a>'
									   + '<a title="分享到微信" onclick="shareToWx(event)" href="javascript:;"><img src="${ctx}/static/image/wx.png" style="margin-left:5px;"></a>'
								       + '<a title="分享到微博" onclick="shareToWb(event)" href="javascript:;"><img src="${ctx}/static/image/wb.png" style="margin-left:5px;"></a>'
								       + '<a title="复制链接"  id="copyTo"   href="javascript:;"><img src="${ctx}/static/image/cp.png" style="margin-left:5px;"></a>'
							           + '</div>'
									   + '<div style="clear:both;"></div>'
									   + '</div>'
									   + '<div style="width:90%; margin:0 auto;">'
									 /*   + '<div class="publicityTitle">中华人民共和国工业和信息化部</div>' 
									   + '<div style="border-bottom:2px solid #f14241; margin:1px auto; width:80%;"></div>'*/
									   + '<div style="text-align:center;">'
								       + info.publicityTitle
									   + '</div>'
									   + '<div style="width:70%;margin: 0 auto;">'
									   + '<div style="text-align:left;">'
								       + info.publicityText
								       + '<div id="getPubAtts">附件：'
				       			       + '</div>'
									   + '</div>'
									   + '</div>'
									   + '<div style="text-align:right;">'
								       + info.publicityUnit
									   + '</div>'
									   + '<div style="text-align:right;">'
								       + getTime(info.createTime)
								      
									   + '</div>'
									  
				       			   	   + '<div style="padding:50px 0 100px; text-align:center;">';
				       			   	   if(type==2){
				       			   		_div += '<div style="padding-right:65px;">'
										     +'<input type="button" value="确认发布" class="redBtnContral" onclick="savePre(\''+id+'\',\''+info.declareId+'\');">'
										     +'<input type="button" value="再次编辑" class="grayBtnContral" onclick="getPublicityView(3,\''+id+'\');">'
										     +'<div style="clear:both;"></div>'
									         +'</div>';
				       			   	   }else if(type==0){
				       			   		 if('${pubView}'==null || '${pubView}'==""){
					       			   	   _div += '<input type="button" class="button button-raised button_Contral" onclick="publicityType(2);" style="width:180px;" value="返回">';
					       			   	   }
				       			   	   }
				       			   	  
				       			   	_div +=  ' <div style="clear:both;"></div>'
				       			       + '  </div>'
								       + '</div>';
							$('#publicityView').html(_div);
							$('#noPublicity').hide();
							getAtts(info.atIdList);
					}
					
				},
				error:function(){
					tips("获取详情失败！");
					},
				});
	 }else{
		 $.ajax({
				url:"${ctx}/projectDeclare/json/publicityView",
				type:"post",
				data:{
						"declareId":id,
						"${_csrf.parameterName}":"${_csrf.token}"
					 },
				dataType:"json",
				success:function(result){
					 $('#publicityView').empty();
					 
					var info = result;
					var _div = '<div style="padding:15px 18px;">'
					           + '<div style="float:right; position:relative; top:5px;">'
							   + '<span class="font12">一键分享</span>'
							   + '<a title="分享给QQ好友" onclick="shareToQQFriend(event,"项目")" href="javascript:;"><img src="${ctx}/static/image/qq.png"style="margin-left:5px;"></a>'
							   + '<a title="分享到微信" onclick="shareToWx(event)" href="javascript:;"><img src="${ctx}/static/image/wx.png" style="margin-left:5px;"></a>'
						       + '<a title="分享到微博" onclick="shareToWb(event)" href="javascript:;"><img src="${ctx}/static/image/wb.png" style="margin-left:5px;"></a>'
						       + '<a title="复制链接"  id="copyTo"   href="javascript:;"><img src="${ctx}/static/image/cp.png" style="margin-left:5px;"></a>'
					           + '</div>'
							   + '<div style="clear:both;"></div>'
							   + '</div>'
							   + '<div style="width:90%; margin:0 auto 100px;">'
							   + '<div class="publicityTitle">中华人民共和国工业和信息化部</div>'
							   + '<div style="border-bottom:2px solid #f14241; margin:1px auto; width:80%;"></div>'
							   + '<div style="text-align:center;">'
						       + info.publicityTitle
							   + '</div>'
							   + '<div style="width:70%;margin: 0 auto;">'
							   + '<div style="text-align:left;">'
						       + info.publicityText
						       + '<div id="getPubAtts">附件：'
				       			 + '</div>'
							   + '</div>'
							   + '</div>'
							   + '<div style="text-align:right;">'
						       + info.publicityUnit
							   + '</div>'
							   + '<div style="text-align:right;">'
						       + getTime(info.createTime)
						       
							   + '</div>'
							 
						       + '</div>';
					$('#publicityView').html(_div);
					getAtts(info.atIdList);
				},
				error:function(){
					tips("获取详情失败！");
					},
				});
	 }
 }
	 
	 
	 function getPublicityList(pageNum,pageSize){
		   var id = '${projectDeclareInfo.declareId}';
			 $.ajax({
					url:"${ctx}/projectDeclare/json/publicityList",
					type:"get",
					data:{
							"declareId":id,
							"pageNum":pageNum,
							"pageSize":pageSize
						 },
					dataType:"json",
					success:function(result){
						if(pageNum==1){
							 $('#publicityList').empty();
						}
						if(result.code==-1){
							layer.msg(result.msg);
						}else if(result.code==2){
							$('#publicityList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
							$('#getmoreAllActii').hide();
						}else{
							var list = result.value;
							 
							for(var i=0;i<list.length;i++){
								var info = list[i];
								var _div =  '<div class="details_dataBar">'
										   +'<div class="details_company">'+info.publicityTitle+'</div>'
							  			   +'<div style="margin-left:10px;">'
										   +'<div>单位：<span>'+info.publicityUnit+'</span></div>'
										   +'<div>公示时间：<span>'+getTime(info.createTime)+'</span></div>'
										   +'</div>'
										   +'<div class="details_blueOper" onclick="publicityView(0,\''+info.publicityId+'\');">查看</div>'
										   +'</div>';
								      
										$('#publicityList').append(_div);   
								if(result.code==0){
									$('#getmoreAllActii').hide();
								}else if(result.code==1){
									$('#getmoreAllActii').show();
								}
							}
						}
					},
					error:function(){
						tips("请求超时，请稍后重试");
						},
					});
		
	 
 }
 
 function getAtts(attIdList){
		$.ajax({
			url:"${ctx}/login/json/attachment/selectListByAttachmentIdList",
			type:'get',
			data:{'attachmentIdList':attIdList},
			dataType:'json',
			success:function(data){
				var obj = JSON.parse(data);
				if(obj.success==true){
					for(var i = 0;i<obj.attachments.length;i++){
						if(i==obj.attachments.length){
							$('#getPubAtts').append(
									 "<a href='"+obj.attachments[i].attachmentUrl+"' target='_blank'>"+obj.attachments[i].remoteName+"</a>"
									);
							}else{
								$('#getPubAtts').append(
										 "<a href='"+obj.attachments[i].attachmentUrl+"' target='_blank'>"+obj.attachments[i].remoteName+"</a><br/>"
										);
							}
						}
				}
				
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
 }
 
 function getTime(time) {
		var date = new Date(time);
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				+ '-';
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y + M + D + h + m + s);
	}
 
  function preview(){
	  var declareId = $('#declareId').val();
	  var publicityTitle = $('#publicityTitle').val();
	  var publicityText = tinyMCE.get('publicityText').getContent();
	  var atUrlList = $('#atUrlList').val();
	  var atIdList = $('#atIdList').val();
	  var publicityId = $('#publicityId').val();
	  
		if(publicityTitle == null || publicityTitle == ""){
			tips('请输入标题');
			return false;
		}
		
		var activeEditor = tinymce.activeEditor;
		var editBody = activeEditor.getBody();
		activeEditor.selection.select(editBody);
		var publicityText1 = activeEditor.selection.getContent( { 'format' : 'text' } );
		publicityText1 = publicityText1.trim();
		if(publicityText1==null || publicityText1==""){
			tips('请输入正文！');
			return false;
		}
		 $.ajax({
			url:'${ctx}/projectDeclare/json/publicitypreView',
			type:'post',
			data:{'declareId':declareId,
				  'publicityTitle':publicityTitle,
			  	  'publicityText':publicityText,
				  'atUrlList':atUrlList,
				  'atIdList':atIdList,
				  'publicityId':publicityId,
				  "${_csrf.parameterName}":"${_csrf.token}"
			      },
			dataType:'json',
			success:function(data){
				if(data!=0){
					$('#publicityTitle').val("");
					$('#publicityText').val("");
					$('#atUrlList').val("");
					$('#atIdList').val("");
					$('#publicityId').val("");
					$('#declareId').val(declareId);
					getPublicityView(2,data);
					 $('#publicityView').show();
					 $('#publicityCreate').hide();
					 $('#pubList').hide();
				}else{
					alert("预览异常！");
				}
			},
			error:function(){
				alert("访问后台异常!");
			}
		}); 
  }
  
  function savePre(publicityId,declareId){
	  window.location.href="${ctx}/projectDeclare/publicitySave?publicityId="+publicityId +"&declareId="+declareId;
  }
  
  function downAtt(atIdList){
	  window.location.href="${ctx}/projectDeclare/batchDownload?atIdList="+atIdList;
  }
</script>
</head>

<body>
<div class="details_main">
	<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020171109144912000062000000008"/>
	<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="项目申报" />
	<div class="project_header">
		<%@ include file="../common/header.jsp"%>
	<%-- 	<div class="tabItem">
			<ul>
				<li><a href="javascript:;">服务</a></li>
				<li><a href="${ctx }/projectDeclare/main">项目申报</a></li>
				<li><a href="activityRegistration.html">活动</a></li>
			</ul>
			<ul style="display: none;">
				<li><a href="javascript:;">办公</a></li>
				<li><a href="javascript:;">审计</a></li>
			</ul>
		</div>  --%>
	</div>
	
	<div class="details_content">
		<div class="titleName">
			<ul>
				<li id="declareContent"><a href="javascript:;" >正文内容</a></li>
				<%-- <c:if test="${projectDeclareInfo.accountId==currentAccountId}">
				<li onclick="getApplyComp();"><a href="javascript:;" >申报审核</a></li>
				</c:if> --%>
				<li onclick="publicityType(2);"><a href="javascript:;" >公示结果</a></li>
				<c:if test="${projectDeclareInfo.accountId!=currentAccountId}">
				<li onclick="getmyApplyComp();" id="myApply"><a href="javascript:;" >我的申报</a></li>
				</c:if>
			</ul>
			<a href="${ctx }/projectDeclare/main" style="text-decoration:none;">
				<div class="returnPage">返回上一页&nbsp;&nbsp;></div>
			</a>
			<div style="clear:both;"></div>
		</div>
		<div class="titleItem">
			<div>
				<div style="margin:0 7px;">
				<c:if test="${projectDeclareInfo.isRecommend==1}">
					<img src="${ctx}/static/image/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">
					</c:if>
					<div style="padding:15px 18px;">
						<div class="details_Title">${projectDeclareInfo.declareTitle}</div>
						<div style="float:right; position:relative; top:5px;">
							<span class="font12">一键分享</span>
							<a title="分享给QQ好友" onclick="shareToQQFriend(event,'项目')" href="javascript:;"><img src="${ctx}/static/image/qq.png"style="margin-left:5px;"></a>
							<a title="分享到微信" onclick="shareToWx(event)" href="javascript:;"><img src="${ctx}/static/image/wx.png" style="margin-left:5px;"></a>
							<a title="分享到微博" onclick="shareToWb(event)" href="javascript:;"><img src="${ctx}/static/image/wb.png" style="margin-left:5px;"></a>
							<a title="复制链接"  id='copyTo'   href="javascript:;"><img src="${ctx}/static/image/cp.png" style="margin-left:5px;"></a>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="showBar">
						<div style="float:left;">
							<div class="declareDataLeft">发布时间：</div>
							<div class="declareDataRight"><fmt:formatDate value="${projectDeclareInfo.createTime}" pattern="yyyy年MM月dd日"/></div>
							<div class="declareDataLeft">项目级别：</div>
							<div class="declareDataRight">${projectDeclareInfo.declareGrade}</div>
							<div class="declareDataLeft">主管单位：</div>
							<div class="declareDataRight">${projectDeclareInfo.supervisorName}</div>
						</div>
						<div style="float:right; margin-right:10px;">
							<c:if test="${projectDeclareInfo.declareStatus==0}">
							<c:if test="${projectDeclareInfo.endDate==null}">
							<c:if test="${projectDeclareInfo.accountId!=currentAccountId}">
							<input type="button" class="button button-raised button-caution button_Contral" style="width:180px;" value="在线申报" id="apply" ${projectDeclareInfo.applyOnline==0?"disabled":"" }>
							</c:if>
							<%-- <c:if test="${projectDeclareInfo.accountId==currentAccountId}">
							<input type="button" class="button button-raised button-caution button_Contral" style="width:180px;" value="发布公示结果" onclick="addPublic();">
							</c:if> --%>
							<div style="text-align:center; margin-top:2px;">${projectDeclareInfo.declareRemark}</div>
							</c:if>
							<c:if test="${projectDeclareInfo.endDate!=null}">
							<c:if test="${projectDeclareInfo.accountId!=currentAccountId}">
							<input type="button" class="button button-raised button-caution button_Contral" style="width:180px;" value="在线申报" id="apply" ${projectDeclareInfo.applyOnline==0?"disabled":"" }>
							</c:if>
							<%-- <c:if test="${projectDeclareInfo.accountId==currentAccountId}">
							<input type="button" class="button button-raised button-caution button_Contral" style="width:180px;" value="发布公示结果" disabled="disabled" >
							</c:if> --%>
							<div style="text-align:center; margin-top:2px;">
								<c:choose>
									<c:when test="${projectDeclareInfo.endDate eq 0}"><font style="color:#f14342; font-size:16px;">今天截止</font></div></c:when>
									<c:otherwise>具体申报结束还有<font style="color:#f14342; font-size:16px;">${projectDeclareInfo.endDate}</font>天</div></c:otherwise>
								</c:choose>
							</c:if>
							</c:if>
						<%-- 	<c:if test="${projectDeclareInfo.declareStatus==1}">
							<c:if test="${projectDeclareInfo.accountId==currentAccountId}">
							<input type="button" class="button button-raised button-caution button_Contral" style="width:180px;" value="发布公示结果" onclick="addPublic();">
							</c:if>
							<c:if test="${projectDeclareInfo.accountId!=currentAccountId}">
 							<input type="button" class="button button-raised button-caution button_Contral" style="width:180px;" value="查看公示结果" onclick="publicityView(1,'${projectDeclareInfo.declareId}');">
 							</c:if>
							<div style="text-align:center; margin-top:2px;">申报已截止</div>
							</c:if> --%>
							<c:if test="${projectDeclareInfo.declareStatus==2}">
							<input type="button" class="button button-raised button-caution button_Contral" style="width:180px;" value="查看公示结果" onclick="publicityView(1,'${projectDeclareInfo.declareId}');">
							<div style="text-align:center; margin-top:2px;">申报已截止</div>
							</c:if>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div style="border-bottom:1px dashed #ccc;"></div>
					<div style="width:90%;margin: 20px auto 100px;">
					<div style="text-align: left">
						<div Style="height: 150px; vertical-align: top; line-height: 25px;"
															align="center">
							<img src="${projectDeclareInfo.declareImage }" height="200" />
						</div>
						<br/>
						${projectDeclareInfo.declareText}
						<div id="getAtts">
						附件：
			            </div>
					</div>
					</div>
					<%-- <div style="text-align: right">
						${projectDeclareInfo.accountName}
					</div>
					<div style="text-align: right">
						<fmt:formatDate value="${projectDeclareInfo.createTime }" pattern="yyyy年MM月dd日" /> 
					</div> --%>
					
				</div>
			</div>
			<%-- <c:if test="${projectDeclareInfo.accountId==currentAccountId}">
			<div style="display:none;">
			<input type="hidden" id="pageNum" value="1" />
			<input type="hidden" id="applyIdAudit" value="" />
			
				<c:if test="${projectDeclareInfo.isRecommend==1}">
					<img src="${ctx}/static/image/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">
					</c:if>
				<div style="padding:15px 25px;">
					<div class="details_Title">${projectDeclareInfo.declareTitle}</div>
					<div style="clear:both;"></div>
				</div>
				 <div class="details_StateBar" id="stateBar">
					<div class="details_State" onclick="selectByStatus('${projectDeclareInfo.declareId}','');">全部</div>
					<div class="details_State redcolor" onclick="selectByStatus('${projectDeclareInfo.declareId}',2);">待审核</div>
					<div class="details_State" onclick="selectByStatus('${projectDeclareInfo.declareId}',1);">通过</div>
					<div class="details_State" onclick="selectByStatus('${projectDeclareInfo.declareId}',0);">不通过</div>
					<div style="clear:both;"></div>
				</div> 
				<div style="padding:10px;" >
					 <div class="details_operBar">
						<div class="i-checks" style="float:left; text-align:center;"><input type="checkbox" id="checkAll">
							<span class="details_oper" >全选</span>
						</div>
						<div class="details_operType" style="float:left;" id="passAudit">批量审核通过</div>
						<div class="details_operType" style="float:left;" id="noPassAudit">批量审核未通过</div>
						<div class="details_operType" style="float:left;" id="batchDown">批量下载上报附件</div>
						<div style="clear:both;"></div>
					</div>
					<div class="declareEnt">
						<table id="auditList">
						
							<!-- <tr class="nextTr">
								<td style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</td>
								<td style="width:30%;">
									江西省融合科技有限责任公司
								</td>
								<td style="width:10%;">李明</td>
								<td style="width:15%;">18970008000</td>
								<td style="width:15%;">2016-10-04</td>
								<td style="width:10%;">
									<a href="javascript:;" class="details_AOper">下载</a>
								</td>
								<td style="width:15%;">
									<a href="javascript:;" class="details_AOper">查看</a>
									<a href="javascript:;" class="details_AOper">审核</a>
								</td>
							</tr>
							<tr class="nextTr">
								<td style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</td>
								<td style="width:30%;">
									江西省融合科技有限责任公司
								</td>
								<td style="width:10%;">李明</td>
								<td style="width:15%;">18970008000</td>
								<td style="width:15%;">2016-10-04</td>
								<td style="width:10%;">
									<a href="javascript:;" class="details_AOper">下载</a>
								</td>
								<td style="width:15%;">
									<a href="javascript:;" class="details_AOper">查看</a>
									<a href="javascript:;" class="details_AOper">审核</a>
								</td>
							</tr>
							<tr class="nextTr">
								<td style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</td>
								<td style="width:30%;">
									江西省融合科技有限责任公司
								</td>
								<td style="width:10%;">李明</td>
								<td style="width:15%;">18970008000</td>
								<td style="width:15%;">2016-10-04</td>
								<td style="width:10%;">
									<a href="javascript:;" class="details_AOper">下载</a>
								</td>
								<td style="width:15%;">
									<a href="javascript:;" class="details_AOper">查看</a>
									<a href="javascript:;" class="details_AOper">审核</a>
								</td>
							</tr> -->
						</table>	
					<div style="clear:both;"></div>
				<div id="getmoreAllActi" style="margin:10px 1.6% 10px;">
					<a href="javascript:;" onClick="getmore(1);" class="renovate">
						<span class="renovateTitle">加载更多</span>
					</a>
				</div>
					</div> 
				</div>
			</div>
			</c:if> --%>
			<div style="display:none;" >
			
				<%-- <div class="publicity_dataInput" id="publicityCreate"  >
					<form action="${ctx }/projectDeclare/publicitySave" id="form" method="post">
					<input type="hidden" name="declareId" id="declareId" value="${projectDeclareInfo.declareId}"/>
					<input type="hidden" name="publicityId" id="publicityId" value=""/>
					<input type="hidden" id="atUrlList" name="atUrlList" value="" /> 
					<input type="hidden" id="atIdList" name="atIdList" value="" /> 
					<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/> 
					<div class="publicity_data">
						<div class="redStar">*</div>
						<div class="publicity_dataLeft">标题</div>
						<input type="text" class="publicity_dataRight" maxlength="50" style="width:81.5%;" name="publicityTitle" id="publicityTitle">
						<div style="clear:both;"></div>
					</div>
					<div class="publicity_data">
						<div class="redStar">*</div>
						<div class="publicity_dataLeft">正文</div>
						<div style="float:left; margin-left:15px; width: 82%;">
							<textarea  placeholder="这里输入内容" name="publicityText" id="publicityText"></textarea>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="publicity_data">
						<div class="publicity_dataLeft" style="margin-left:15px;">附件</div>
						<div style="float:left; margin-left:15px;">
							<input type="button" value="上传附件" class="uploadAttachBtn" id="file_uploads" name="file_uploads"/>
							<div id="attList"></div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div style="padding-right:65px;">
						<input type="button" value="确认发布" class="redBtnContral" id="saveBtn">
						<input type="button" value="预览" class="grayBtnContral" id="previewBtn" onclick="preview();">
						<div style="clear:both;"></div>
					</div>
					</form>
				</div> --%>
				
				<div class="displayNone" id="publicityView">
					
				</div>
				
				<div id="pubList" class="displayNone" >
					<input type="hidden" id="pageNumber" value="1" />
				<c:if test="${projectDeclareInfo.isRecommend==1}">
					<img src="${ctx}/static/image/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">
					</c:if>
				<div style="padding:15px 25px;">
					<div class="details_Title">${projectDeclareInfo.declareTitle}</div>
					<div style="clear:both;"></div>
				</div>
				
				<div style="padding:10px;" id="publicityList">
					
				</div>
					<div style="clear:both;"></div>
			
				<div id="getmoreAllActii" style="margin:10px 1.6% 10px;">
					<a href="javascript:;" onClick="getmore(2);" class="renovate">
						<span class="renovateTitle">加载更多</span>
					</a>
				</div>
				</div>
				
					<div style="padding:10px;" id="noPublicity" style="display:none;">
					<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无公示</span></div>
				</div>
			</div>
			
			
			<div style="display:none;">
			<input type="hidden" id="myPageNumber" value="1" />
				<c:if test="${projectDeclareInfo.isRecommend==1}">
					<img src="${ctx}/static/image/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">
					</c:if>
				<div style="padding:15px 25px;">
					<div class="details_Title">${projectDeclareInfo.declareTitle}</div>
					<div style="clear:both;"></div>
				</div>
				
				<c:if test="${projectDeclareInfo.accountId!=currentAccountId}">
				<div style="padding:10px;" id="myApplyList">
					
				</div>
				</c:if>
					<div style="clear:both;"></div>
				<div id="myGetmoreAllActi" style="margin:10px 1.6% 10px;">
					<a href="javascript:;" onClick="getmore(3);" class="renovate">
						<span class="renovateTitle">加载更多</span>
					</a>
				</div>
			</div>
			
		</div>
	
	</div>
	
	<div id="auditOper" style="display:none;height: 280px;">
		<div style="padding:30px 20px;">
			<div style="border-bottom:1px solid #ccc;">
				<div class="audit_top">选择审核结果</div>
			</div>
			<div class="audit_optionBar">
				<div class="audit_grayOption">
					<img id="pass" src="${ctx}/static/image/projectDeclare/t3.png" width="25px;" height="25px;" class="imgContral">通过
				</div>
				<div class="audit_grayOption">
					<img id="nopass" src="${ctx}/static/image/projectDeclare/b3.png" width="25px;" height="25px;" class="imgContral">不通过
				</div>
				<div style="clear:both;"></div>
			</div>
			<div style="width:80%; margin:0 auto;">
				<input type="button" class="button button-raised button_Contral" style="width:36%;" value="关闭" onclick="colseLayer();">
				<input type="button" class="button button-raised button-caution button_Contral" style="width:58%;" value="确认" onclick="audit('','');">
			</div>
		</div>
	</div>
	<div style="display:none" id="qrcode">     
					<img src='${projectDeclareInfo.qrCode}'  width="250px;" height="250px;"/>
				  	  <br>&nbsp;&nbsp;打开微信，点击底部的“发现”
					  <br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
                </div>
	<%@ include file="../common/footer.jsp"%>
</div>
	 <script type="text/javascript" src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
	<script type="text/javascript" src="${ctx}/static/js/share.js"></script> 
	 <script type="text/javascript" src="${ctx}/static/plugins/tinymce/tinymce.min.js"></script>
	<%-- <script type="text/javascript" src="${ctx}/static/js/plugins/simditor/module.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/plugins/simditor/uploader.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/plugins/simditor/hotkeys.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/plugins/simditor/simditor.js"></script> --%>
	<script>
	  tinymce.init({
		    selector: '#publicityText',
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
	
	</script>
</body>
</html>
