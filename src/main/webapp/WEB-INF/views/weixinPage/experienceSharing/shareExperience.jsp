<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>分享动态</title>
<link href="${ctx}/static/weixin/css/experienceSharing/experienceSharing.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/weixin/css/jquery.searchableSelect.css" />
<script type="text/javascript" src="${ctx}/static/weixin/js/jquery.searchableSelect.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/webuploader/webuploader.css">
<script type="text/javascript" src="${ctx}/static/js/plugins/webuploader/webuploader.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/font-awesome.min93e3.css">
<style>
.deleteOper {
    padding: 0px;
}
.webuploader-pick{
	text-align: left;
}
.attachUpload {
    position: relative;
    width: 79px;
    margin: 10px 0 0 15px;
}
.attList{
	width: 100%;
	-webkit-display: flex;
    display: flex;
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
}
.attachUpload_details {
    position: relative;
    width: 79px;
    height: 79px;
}
.attachUpload_filename {
    position: absolute;
    z-index: 9;
    width: 100%;
    background: rgba(0,0,0,.3);
    color: #fff;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.attachUpload_details img {
    width: 100%;
    height: 79px;
}
.attachUpload_size {
    position: absolute;
    bottom: 0;
    z-index: 9;
    width: 100%;
    background: rgba(0,0,0,.3);
    color: #fff;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.attachUpload .deleteOper {
    position: absolute;
    width: 15px;
    height: 15px;
    bottom: 0;
    right: 0;
    z-index: 9;
    color: #fff;
    background: #f00;
    text-align: center;
    -webkit-border-radius: 50%;
    border-radius: 50%;
    line-height: 15px;
    font-size: 12px;
}
</style>
<script>
	$(function(){
		$("#organizationId").searchableSelect();
		$(".viewMore").click(function() {
			var ul = $("#viewMore ul");
			if (ul.css("display") == "none") {
				ul.slideDown("fast");
			} else {
				ul.slideUp("fast");
			}
		});
		$("#viewMore ul li a").click(function() {
			$("#viewMore ul").hide();
		});
		
		//初始化已选标签
		initTags('${expShareInfo.expLabel}');
		
		//宽度自适应
		$(".addShareInput").width($(window).width()-115);
		$(".searchable-select").width($(window).width()-108);
		$("textarea").width($(window).width()-110);
		$("#imgContent").width($(window).width()-120);
		$("#btn_span").width($(window).width()-60);
		
		// 图片上传选择初始化
		var uploader = WebUploader.create({
		    // 选完文件后，是否自动上传。
		    auto: true,
		    swf: '${ctx}/static/js/plugins/webuploader/Uploader.swf',
		    server: '${ctx}/session/attachment/publish'  , 
		    pick: '#picker',
		    duplicate : true, //可以重复上传
		    fileVal:'attachment',
		    // 只允许选择图片文件。
		    accept: {
		        title: 'Images',
		        extensions: 'gif,jpg,jpeg,bmp,png',
		        mimeTypes: 'image/*'
		    },
		    formData:{
				'moduleId': '90020171110162559000062000000022', 
				'remark': '园区动态'
			}
		});
		// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		uploader.on( 'uploadSuccess', function( file ,response ) {
			layer.msg("上传成功");
		    $("#uploadImg").attr('src', response.attachment.attachmentUrl );
		    $("#expImage").val(response.attachment.attachmentUrl); 
			$("#imageId").val(response.attachment.attachmentId);
		});
		// 文件上传失败，显示上传出错。
		uploader.on( 'uploadError', function( file ) {
			layer.msg("上传失败");
		});
		
		
		// 文件上传选择初始化
		var uploaderList = WebUploader.create({
		    // 选完文件后，是否自动上传。
		    auto: true,
		    swf: '${ctx}/static/js/plugins/webuploader/Uploader.swf',
		    server: '${ctx}/session/attachment/publish', 
		    pick: '#file_uploads',
		    formData:{
		    	'moduleId': '90020171110162559000062000000022', 
				'remark': '园区动态'，
	            'generateSnapshot':true  // 生成预览图
	        },
		    fileVal:'attachment',
	    	fileSingleSizeLimit: 20 * 1024 * 1024, //20M
	        duplicate: true
		});
		
		uploaderList.on( 'uploadSuccess', function( file ,response ) {
			layer.msg("上传成功");
			var image='';
			
		    var id= response.attachment.attachmentId;
		    var name= response.attachment.remoteName;
		    var size= (response.attachment.attachmentSize/1024).toFixed(1);   
		    var url=  response.attachment.attachmentUrl;
		    if(name.toLowerCase().endsWith('.jpg') || name.toLowerCase().endsWith('.jpeg') 
					|| name.toLowerCase().endsWith('.png') || name.toLowerCase().endsWith('.gif') ){
				image='<img src="'+url+'" width="100" height="100">' ;
			}
		    var html='<div  class="attachUpload" id="'+id+'_div">'
		    +'<div class="attachUpload_details">'
			+'<div class="attachUpload_filename">'+name+'</div>'
			+ image
			+'<div class="attachUpload_size">'+size+'KB</div>'
			+'</div>'
			+'<div id="'+id+'" onclick="deleteAtt(\''+id+'\',\''+url+'\')" class="deleteOper fa fa-close" title="删除" ></div>' 
			+'<input type="hidden" id="'+id+'_url"  value="'+url+'" />'   
			+'<input type="hidden" id="'+id+'_name"  value="'+name+'" />' 
			+'</div>';
		    $("#attList").append(html);
		    
		    var expAttStr =  $("#expAttachment").val();
		    if(expAttStr != ""){
			    if(expAttStr.substr(expAttStr.length-1,1) == ","){
				    $("#expAttachment").val($("#expAttachment").val() + response.attachment.attachmentUrl); 
					$("#attachmentId").val($("#attachmentId").val() + response.attachment.attachmentId);
			    }else{
			    	$("#expAttachment").val( $("#expAttachment").val() + "," + response.attachment.attachmentUrl ); 
					$("#attachmentId").val( $("#attachmentId").val() + "," + response.attachment.attachmentId );
			    }
		    }else{
		    	$("#expAttachment").val( response.attachment.attachmentUrl ); 
				$("#attachmentId").val( response.attachment.attachmentId );
		    }
		});
		
		// 文件上传失败，显示上传出错。
		uploaderList.on( 'uploadError', function( file ) {
			layer.msg("上传失败");
		});
		
		
		
	})
	
	//获取标签的值并以字符串形式拼接
	tagCount = 0;
	tag = "";
	function getTags(obj){
		if($(obj).hasClass("typeBtn_sel")){
			$(obj).removeClass("typeBtn_sel");
			if(tagCount==1){
				tag="";
			}else{
				tag = tag.replace($(obj).text(),"").replace(",","");
			}
			tagCount--;
		}else{
			if(tagCount==2){
				layer.msg("最多选择两项！");
			}else{
				$(obj).addClass("typeBtn_sel");
				if(tagCount==1){
					tag+=",";
				}
				tag+=$(obj).text();
				tagCount++;
			}
		}
		$("#expLabel").val(tag);
	}
	
	/* 展开收起标签栏 */
	fold = false;
	function foldTags(){
		if(fold){
			$("#tags").slideDown("fast");
			$("#foldImg").attr("src","${ctx}/static/weixin/images/experienceSharing/unfold.png");
		}else{
			$("#tags").slideUp("fast");
			$("#foldImg").attr("src","${ctx}/static/weixin/images/experienceSharing/packup.png");
		}
		fold = !fold;
	}
	
	/* 显示单位列表 */
	function showUnits(){
		$(".selectUnits").click();		
	}
	
	function validate(){
		 var expTitle = $("#expTitle").val();
		 if(expTitle==null||expTitle==""){
			 layer.msg("请填写动态名称！");
			 return false;
		 }
		 
		 if(expTitle.length>50){
			 layer.msg("标题名不超过50个汉字！");
			 return false;
		 }
		 
		 var unitId = $("#organizationId").val();
		 if(unitId==null||unitId==""){
			 layer.msg("请选择分享单位！");
			 return false;
		 }
		 
		 var expImage = $("#expImage").val();
		 if(expImage==null||expImage==""){
			 layer.msg("请上传海报图片！");
			 return false;
		 }
		 
		 var expLabel = $("#expLabel").val();
		 if(expLabel==null||expLabel==""){
			 layer.msg("请选择标签！");
			 return false;
		 }
		 
		 var expText = $("#expText").val();
		 if(expText==null||expText==""){
			 layer.msg("请填写动态内容！");
			 return false;
		 }
		 return true;
	 }
	
	function save(type){//1是预览 2是发布
		if(type==1){
			$("#isPreview").val(type);
		}else{
			$("#isPreview").val("");
		}
		$("#unitId").val( $("#organizationId option:selected").val());
		if(validate()){
		 	$("#editForm").submit();
		}
	}
	
	//初始化标签
	function initTags(tags) {
		var tag = tags.split(",");
		for (var i = 0; i < tag.length; i++) {
			$(".typeBtn").each(function() {
				if ($(this).text() == tag[i]) {
					$(this).addClass("typeBtn_sel");
				}
			});
		}
	}
	
	//推荐图片
	function galleryPictures(){
		  LayerIndex =layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			shade: [0],
			area:['100%','100%'],
			shift:2,
			closeBtn:0,
			content: $('#galleryPictures')

		}); 
	};
	
	function backTo(){
		layer.close(LayerIndex);
	}
	
	function choosePicture(obj){
		var imgUrl = $(obj).children(":first").attr("src");
		if(!$(obj).hasClass("s")){
			 $(".gallery_pic").each(function(index, item) {
				if($(item).hasClass("s")) {
					$(item).removeClass("s");
					$(item).html('<img src=' + imgUrl + ' width="100%;" height="100px;">');
				}
			});
			var html='<img src=' + imgUrl + ' width="100%;" height="100px;"> <img src="${ctx}/static/weixin/images/activity/selected.png" width="20px;" height="20px;" class="choice">';
			$(obj).html(html);
			$(obj).addClass("s");
		}else{
			$(obj).html('<img src=' + imgUrl + ' width="100%;" height="100px;">');
			$(obj).removeClass("s");
		}
		url = $(obj).children(":first").attr("src");
	 };
	 
	 function selectedImg(){
		 $(".gallery_pic").each(function(index, item) {
				if($(item).hasClass("s")) {
					$("#uploadImg").attr( 'src', url );
				    $("#expImage").val(url); 
				}
			});
		layer.close(LayerIndex);
	}
	 function deleteAtt(id,url) {
			confirm('确认删除？', function(index) {
	        	$('#'+id+'_div').remove();
			    var atIdList = $('#attachmentId').val();
			    var atUrlList = $('#expAttachment').val();
			    if (atIdList.substr(0,1)==','){
			    	atIdList=atIdList.substr(1);
			    }
			    if (atUrlList.substr(0,1)==','){
			    	atUrlList=atUrlList.substr(1);
			    } 
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
			    $('#attachmentId').val(newIds);
			    $('#expAttachment').val(newUrls);
			},function(){});  
		}
</script>
</head>
<body>
		<!-- 表单参数 -->
		<form action="${ctx}/experienceSharing/weixin/save" id="editForm" method="post">
			<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
			<input type="hidden" id="expImage" name="expImage" value="${expShareInfo.expImage}"/>
			<input type="hidden" id="imageId" name="imageId" value="${expShareInfo.imageId}"/>
			<input type="hidden" id="expLabel" name="expLabel" value="${expShareInfo.expLabel}"/>
			
			<input type="hidden" id="expId" name="expId" value="${expShareInfo.expId}"/>
			<input type="hidden" id="unitId" name="unitId" value="${expShareInfo.unitId}"/>
			<input type="hidden" id="isPreview" name="isPreview"/>
			<input type="hidden" id="expAttachment" name="expAttachment" value="">
			<input type="hidden" id="attachmentId" name="attachmentId" value="">
		
		<div class="share_main">
			<!-- 搜索栏 -->
			<div class="fixed_top">
				<img src="${ctx}/static/weixin/images/experienceSharing/share_white.png" width="20px;" height="20px;"> <span>我发布的</span>
			</div>
			
	 		<!-- 滚动内容 -->
			<div class="share_content" style="position:fixed;top:50px;bottom:55px;background-color:#ebebeb;width:100%;overflow:scroll;">
				<div style="background-color:#fff;margin-top:6px;padding:10px 0;">
					<div>
						<span class="addShareTitle">动态名称</span>
						<input id="expTitle" name="expTitle" type="text" class="addShareInput" value="${expShareInfo.expTitle}"/>
						<span class="addShareAsterisk">*</span>
					</div>
					<div style="margin-top:10px;position:relative;"> 
						<span class="addShareTitle">分享单位</span>
						<c:choose>
							<c:when test="${organizationList!=null && organizationList!='' && organizationList!='[]'}">
								<select class="selectBox" id="organizationId" name="organizationId">
										<c:forEach items="${organizationList}" var="info">
											<option value='${info.organizationId}' ${expShareInfo.unitId==info.organizationId?"selected":""}>
												${info.organizationName}
											</option>
										</c:forEach>
								</select>
								<span class="addShareAsterisk">*</span>
							</c:when>
							<c:otherwise>
								<div class="addSharePrompt">请到"个人中心-企业设置"中完善您的信息 </div>
							</c:otherwise>
						</c:choose>
						
					</div>
					<div style="clear:both;"></div>
				</div>
				<div style="background-color:#fff;margin-top:6px;padding:7px 10px;">
					<div style="width:90px; height:90px; float:left; margin-right:10px;">
						<c:choose>
							<c:when test="${expShareInfo.expImage!=null}">
								<img src="${expShareInfo.expImage}" id="uploadImg" width="90px;" height="90px;" style="float:left;margin-right:10px;"  />
							</c:when>
							<c:otherwise>
								<img src="${ctx}/static/weixin/images/activity/egpic.png" id="uploadImg" width="90px;" height="90px;" style="float:left;margin-right:10px;margin-top: 3%;"/>
							</c:otherwise>
						</c:choose>
					</div>  
					
					<div  class="uploadifyText">一张漂亮的海报，能让你的分享锦上添花，带来更多用户报名及增加传播效果，也将影响其在分享被推荐的几率。图片小于2M(jpg、gif、png)，尺寸为720*370px</div>
					<div> 
					<div id="picker" class="uploadifyInput" style="top:2px;float:left;font-size: 14px;margin-right:10px;margin: 20px 7px 5px 0;padding: 0 5px;border-radius: 3px;" >上传图片</div>
					<div type="button" onClick="galleryPictures();"
						class="uploadifyInput" style="top:2px;float:left;font-size: 14px;margin-right:10px;margin: 22px 7px 5px 0;padding: 0 5px;border-radius: 3px;">推荐图片</div>
					<div style="clear:both;"></div>	
					</div>
					<div style="clear:both;"></div>
				</div>
				<div style="background-color:#fff;margin-top:6px;padding:10px 0;">
					<div>
						<span class="addShareTitle">动态标签</span><span style="font-size:12px;">(最多可选2个标签)</span>
						<div style="float:right;width:20px;height:20px;margin-right:10px;" onclick="foldTags();">
							<img id="foldImg" src="${ctx}/static/weixin/images/experienceSharing/unfold.png" style="width:14px;margin:3px;"/>
						</div>
						
					</div>
					<div id="tags" style="margin-left:10px;">
						<div id="btn_span" style="float:left;margin-top:5px;">
							<c:forEach items="${tagList}" var="info">
								<button type="button" class="typeBtn" onclick="getTags(this);">${info.tagName}</button>
							</c:forEach>
						</div>
						<span class="addShareAsterisk">*</span>
						<div style="clear:both;"></div>
					</div>
				</div>
				<div style="background-color:#fff;margin-top:6px;padding:10px 0;">
					<div class="addShareTitle" style="float:left;">动态详情</div>
					<textarea id="expText" name="expText" style="float:left;outline:none;width:200px;height:100px;resize:none;">${expShareInfo.expText}</textarea>
					<span class="addShareAsterisk">*</span>
					<div style="clear:both;"></div>
				</div>
				<div style="background-color:#fff;margin-top:6px;padding:10px 0;">
					<div class="addShareTitle">上传附件</div>
					<div id="attList" class="attList"></div>
					<div style="width:79px;" id="file_uploads" >
						<img id="file_uploads_img" src="${ctx}/static/weixin/images/experienceSharing/add_btn.png" height="79px" width="79px"/>
					</div>
				</div>
				<div style="padding:10px 0;">
					<button type="button" onclick="save('1')"; style="width:35%;height:35px;margin-left:3%;background-color:#fff;color:#646464;border-style:none;outline:none;">预览</button>
					<button type="button" onclick="save('2')"; style="width:52%;height:35px;margin-left:5%;background-color:#f14241;color:#fff;border-style:none;outline:none;">确认发布</button>
				</div>
			</div>
			
			<!-- 底部选项卡 -->
			<div class="navigationBar">
				<ul>
					<li><a href="${ctx}/auth/page/mobile/weixin/experienceSharing/weixin/main">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/experienceSharing/exp.png" width="20" height="20" />
						</div>
						<div class="navTitle">园区动态</div>
					</a></li>
					<li><a href="${ctx}/experienceSharing/weixin/add">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/experienceSharing/share_red.png" width="20" height="20" />
						</div>
						<div class="navTitle">分享动态</div>
					</a></li>
					<li><a href="javascript:;" class="viewMore">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/experienceSharing/more.png" width="20" height="20" />
						</div>
						<div class="navTitle">更多服务</div>
					</a></li>
				</ul>
				<div id="viewMore">
					<ul style="margin-top: -43px;">
						<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/experienceSharing/weixin/myShare">我发布的</a></li>
					<%-- 
						<li><a href="${ctx}/auth/page/mobile/weixin/personalInfoBingding">个人中心</a></li>
					 --%>
					</ul>
				</div>
			</div>
		</div>
		</form>
		
		<!-- 推荐图片弹窗 -->
		<div id="galleryPictures" style="display: none;">
			<div class="fixed_top">
				<img src="${ctx}/static/weixin/images/activity/publicactivity2.png"
					width="20px;" height="20px;"> <span>推荐图片</span>
			</div>
	
			<div class="gallery_content">
				<div class="gallery_pic" onclick="choosePicture(this);">
					<img src="${ctx}/static/weixin/images/activity/field.jpg"
						width="100%;" height="100px;">
				</div>
				<div class="gallery_pic" onclick="choosePicture(this);">
					<img src="${ctx}/static/weixin/images/activity/field.jpg"
						width="100%;" height="100px;">
				</div>
				<div class="gallery_pic" onclick="choosePicture(this);">
					<img src="${ctx}/static/weixin/images/activity/field.jpg"
						width="100%;" height="100px;">
				</div>
				<div class="gallery_pic" onclick="choosePicture(this);">
					<img src="${ctx}/static/weixin/images/activity/field.jpg"
						width="100%;" height="100px;">
				</div>
	
				<div style="clear: both;"></div>
			</div>
	
			<div class="fixed_bottom">
				<a href="javascript:backTo();"> <img
					src="${ctx}/static/weixin/images/logistics/return.png"
					width="20px;" height="20px;" class="returnBtn" />
				</a>
				<div class="bottom_operation">
				   <a href="javascript:selectedImg();" style="text-decoration: none;"> 
					<span class="spanContral_1 spanContral_2" style="color: #F14241;" >确认选择</span>
				 	</a>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
</body>
</html>