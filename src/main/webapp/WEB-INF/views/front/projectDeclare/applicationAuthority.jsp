<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>申请权限</title>
<link href="${ctx}/static/css/projectDeclare/applicationAuthority.css" rel="stylesheet"/>
<link href="${ctx}/static/plugins/select2/css/common.css" rel="stylesheet"/>
<link href="${ctx}/static/plugins/select2/css/select2.css" rel="stylesheet"/>

<script type="text/javascript" src="${ctx}/static/plugins/select2/js/area.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/location.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2_locale_zh-CN.js"></script>
<script>
 $(function(){
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(1).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".tiitleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	
	
	$('.diyUpload').each(function() {
	   var id=$(this).attr('id');
	   var sortGrade=$(this).attr('sortGrade');
	   $(this).uploadify({
	    	'debug' : false,
	        'simUploadLimit': 1 ,
	        'multi' : false ,
	        'auto': true ,
	        'buttonText' :  '选择图片', 
	       // 'buttonClass': 'diyUpload', 
	       // 'buttonImage':'${ctx}/static/images/S.png', 
	        'removeCompleted': true ,
	        'removeTimeout': 1 , 
	        'successTimeout':99999,
	        'formData':{
	        	'para':'', //  
	            'jsessionid':'${pageContext.session.id}'  ,
				'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
				'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val()
	        },
	        'uploader': '${ctx}/session/attachment/publish' , // 新版
	        'swf':  "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
	        'overrideEvents' : [ 'onDialogClose', 'onUploadError', 'onSelectError' ],
	        'queueID':'fileQueue',
	        'fileObjName':'attachment',
	        'width':'32',
	        'height':'32',
	        'top':'116',
	        'left':'138',
	        'title':'上传图片',
	        'fileTypeDesc':'支持的格式：',
	        'fileTypeExts': '*.jpg;*.gif;*.png;*.bmp;*.jpeg'  ,
	        'fileSizeLimit':'2MB',
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
		            showPic(obj.attachment,id ) ;
	        }
	   });   
	});
 })
 function showPic(jsonData,id){
	 $("#"+id+"_img").attr('src', jsonData.attachmentUrl);
	 $("#"+id+"_input").val(jsonData.attachmentUrl);
 }
 function saveData(){
	 $('#companyProvince').val($('#loc_province').select2('data').text );
	 $('#companyCity').val($('#loc_city').select2('data').text );
	 $('#companyCounty').val($('#loc_town').select2('data').text );
	 if(checkValue()) 
		 $('#editform').submit();
 }
 function checkValue(){
	 /* if($('#companyName').val()==''){ 
		 alertNew('请输入单位名称！',function(){
			 layer.closeAll();//点击确认后，关闭弹框；
			 $('#companyName').focus();
		 }) ;
		 return false ;
	 }
	 if($('#loc_province').val()==''|| $('#loc_city').val() ==''|| $('#loc_town').val()==''){
		 alert('请选择单位所在地！');
		 return false ;
	 }
	 return true ; */
	 	 var companyName = $("#companyName").val();
		if(companyName == null || companyName == ""){
			tips('请输入单位名称');
			return false;
		}
		var loc_province = $("#loc_province").val();
		var loc_city = $("#loc_city").val();
		var loc_town = $("#loc_town").val();
		if((loc_province == "") || (loc_city == "") || ( loc_town == "")){
			tips('请选择单位所在地');
			return false;
		} 
		
		return true ;
 }
</script>
</head>

<body>
<div class="authority_main">
	<div class="project_header">
		<%@ include file="../common/header.jsp"%>
	</div>
	<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020171109144912000062000000008"/>
	<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="项目申报" />
	<div class="authority_content">
		<div class="titleName">
			<ul>
				<li><a href="javascript:;">申请升级为政府用户</a></li>
			</ul>
			<div style="clear:both;"></div>
		</div>
		<form action="${ctx}/projectDeclare/upgradeSave" method="post" id="editform" name="editform">
		<input type="hidden" id="companyProvince" name="companyProvince" value=""/> 
		<input type="hidden" id="companyCity" name="companyCity" value=""/>
		<input type="hidden" id="companyCounty" name="companyCounty" value=""/> 
		<input type="hidden" id="accountId" name="accountId" value="${accountId }"/> 
		<div class="tiitleItem">
			<div>
				<div class="authority_inputBar">
					<div class="authority_input">
						<font class="redStar">*</font>
						<span class="authority_attr">单位名称</span>
						<input type="text" id="companyName" class="inputContral" style="width:81.5%;" name="companyName" maxlength="20"/>
						<div style="clear:both;"></div>
					</div>
					<div class="authority_input">
						<font class="redStar">*</font>
						<span class="authority_attr">单位所在</span>&nbsp;&nbsp;&nbsp;  
						<select id="loc_province" style="width:120px;">
					    </select>
					    <select id="loc_city" style="width:120px; margin-left: 10px">
					    </select>
					    <select id="loc_town" style="width:120px;margin-left: 10px">
					    </select>
						<div style="clear:both;"></div>
					</div>
					<div class="authority_input">
						<span class="authority_attr" style="margin-left:15px;">单位组织机构代码证或三证合一后的统一社会信用代码原件扫描件或照片</span>
						<img src="${ctx}/static/image/projectDeclare/defaultImage.png" id="file_upload1_img" width="100px;" height="100px;" class="uploadImgContral"/>
						<div class="uploadImgTips">
							<p>组织机构代码证必须在有效期范围内，格式要求：原件照片、扫描件或加盖公章的复印件。</p>
							<p>图片小于2M ( jpg、gif、png)</p>
							<div id="pictureUpload" style="margin-top: 32px;">
								<input type="file" data-no-uniform="true" name="" id="file_upload1"  class="diyUpload" style="float:left;" />
								<input type="hidden"  id="file_upload1_input" name="companyCodeImage"  value="" />
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="authority_input">
						<span class="authority_attr" style="margin-left:15px;">申请人姓名</span>
						<input type="text" class="inputContral" style="width:47%;" name="accountName" id="accountName" maxlength="10"/>
						<div style="clear:both;"></div>
					</div>
					<div class="authority_input">
						<span class="authority_attr" style="margin-left:15px;">申请人身份证号码</span>
						<input type="text" class="inputContral" name="idcardNum" id="idcardNum" style="width:47%;" maxlength="18"/>
						<div style="clear:both;"></div>
					</div>
					<div class="authority_input">
						<span class="authority_attr" style="margin-left:15px;">申请人手机号码</span>
						<input type="text" class="inputContral" name="telephone" id="telephone" style="width:47%;" maxlength="11"/>
						<div style="clear:both;"></div>
					</div>
					<div class="authority_input">
						<span class="authority_attr" style="margin-left:15px;">授权书</span>
						<img src="${ctx}/static/image/projectDeclare/defaultImage.png" id="file_upload2_img" width="100px;" height="100px;" class="uploadImgContral"/>
						<div class="uploadImgTips">
							<p>授权书必须在有效期范围内，格式要求：原件照片、扫描件或加盖公章的复印件。</p>
							<p>图片小于2M ( jpg、gif、png)</p>
							<div id="pictureUpload" style="margin-top: 32px;">
								<input type="file" data-no-uniform="true" name="" id="file_upload2"  class="diyUpload" />
								<input type="hidden"  id="file_upload2_input" name="certificateImage"  value="" />
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div>
						<div style="float:left;">
							<div class="authority_input">
								<span class="authority_attr" style="margin-left:15px;">申请人身份证正面照</span>
								<img src="${ctx}/static/image/projectDeclare/defaultImage.png" id="file_upload3_img" width="100px;" height="100px;" class="uploadImgContral"/>
								<div class="uploadImgTips">
									<p>请提交中华人民共和国居民身份证，无居民身份证的内地居民可提交《临时居民身份证》。</p>
									<p>图片小于2M ( jpg、gif、png)</p>
									<div id="pictureUpload" style="margin-top: 32px;">
										<input type="file" data-no-uniform="true" name="" id="file_upload3" class="diyUpload" />
										<input type="hidden"  id="file_upload3_input" name="idcardFront"  value="" />
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="authority_input">
								<span class="authority_attr" style="margin-left:15px;">申请人身份证反面照</span>
								<img src="${ctx}/static/image/projectDeclare/defaultImage.png" id="file_upload4_img" width="100px;" height="100px;" class="uploadImgContral"/>
								<div class="uploadImgTips">
									<p>请提交中华人民共和国居民身份证，无居民身份证的内地居民可提交《临时居民身份证》。</p>
									<p>图片小于2M ( jpg、gif、png)</p>
									<div id="pictureUpload" style="margin-top: 32px;">
										<input type="file" data-no-uniform="true" name="" id="file_upload4" class="diyUpload" />
										<input type="hidden"  id="file_upload4_input" name="idcardBack"  value="" />
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
						<div style="float:left; margin-left:20px;">
							<div class="authority_exampleBar" style="margin-bottom:34px;">
								<div class="authority_example">示例</div>
								<img src="${ctx}/static/image/projectDeclare/identityCard1.jpg">
							</div>
							<div class="authority_exampleBar">
								<div class="authority_example">示例</div>
								<img src="${ctx}/static/image/projectDeclare/identityCard2.jpg">
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div style="padding-right:76px;">
						<input type="button" value="申请" class="redBtnContral" onclick="saveData()">
						<input type="button" value="返回" class="grayBtnContral" onclick="back()">
						<div style="clear:both;"></div>
					</div>
				</div>
			</div>
		</div>	
		</form>
	</div>
	
	 <%@ include file="../common/footer.jsp"%>
	 
</div>
</body>
</html>
