<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<%@ include file="../../common/datetimePage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>发布活动</title>
<link href="${ctx}/static/weixin/css/activity/releaseActivity.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/webuploader/webuploader.css">
<script type="text/javascript" src="${ctx}/static/js/plugins/webuploader/webuploader.js"></script>
<script>
var url = null;
	$(function(){
		//标签默认选第一个
		$(".searchOptions .optionBtn:first").addClass("selected");
		$('.activityTags').val($(".searchOptions .optionBtn:first").text());
 		//初始化已选标签
	    initTags('${projectActivityInfoBean.activityTags}');
		$(".viewMore").click(function(){ 
			var ul = $("#viewMore ul"); 
			if(ul.css("display")=="none"){ 
				ul.slideDown("fast"); 
			}else{ 
				ul.slideUp("fast"); 
			} 
		});

		$("#viewMore ul li a").click(function(){
			$("#viewMore ul").hide(); 
		});
	
		$(".release_label img").click(function(){ 
			var div = $(".release_moreLabel"); 
			if(div.css("display")=="none"){ 
				div.slideDown("fast"); 
				$(".release_label img").attr("src","${ctx}/static/weixin/images/activity/unfold.png");
			}else{ 
	 			div.slideUp("fast"); 
				$(".release_label img").attr("src","${ctx}/static/weixin/images/activity/packup.png");
			} 
		});
		
		// 图片上传选择初始化
		var uploader = WebUploader.create({
		    // 选完文件后，是否自动上传。
		    auto: true,
		    // swf文件路径
		    swf: '${ctx}/static/js/plugins/webuploader/Uploader.swf',
		    // 文件接收服务端。
		    server: '${ctx}/session/attachment/publish'  , 
		    // 选择文件的按钮。可选。
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
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
				'moduleId': '-1', 
				'remark': '活动报名（公共服务平台）'
			}
		});
		// 当有文件被添加进队列的时候
	    var  thumbnailWidth  =100 ;
		var  thumbnailHeight =100 ;
		uploader.on( 'fileQueued', function( file ) {
		  //  var $li = $( '<div id="' + file.id + '" class="file-item thumbnail"><img></div>');
		  //  var $img = $("#uploadifyImg");
		    // $list为容器jQuery实例
		  //  $('#picker').append( $li );
		    // 创建缩略图
		    // 如果为非图片文件，可以不用调用此方法。
		    // thumbnailWidth x thumbnailHeight 为 100 x 100
		    /* uploader.makeThumb( file, function( error, src ) {
		        if ( error ) {
		            $img.replaceWith('<span>不能预览</span>');
		            return;
		        }
		        $img.attr( 'src', src );
		    }, thumbnailWidth, thumbnailHeight ); */
		});
		// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		uploader.on( 'uploadSuccess', function( file ,response ) {
		    $( '#'+file.id ).addClass('upload-state-done');
		    $("#uploadifyImg").attr('src', response.attachment.attachmentUrl );
		    $(".activityImage").val(response.attachment.attachmentUrl); 
		});
		// 文件上传失败，显示上传出错。
		uploader.on( 'uploadError', function( file ) {
		   /*  var $li = $( '#'+file.id ),
		        $error = $li.find('div.error');
		    // 避免重复创建
		    if ( !$error.length ) {
		        $error = $('<div class="error"></div>').appendTo( $li );
		    }
		    $error.text('上传失败'); */
		});
	});

	//初始化标签
	function initTags(tags) {
		var tag = tags.split(",");
		for (var i = 0; i < tag.length; i++) {
			$(".searchOptions .optionBtn").each(function() {
				if ($(this).text() == tag[i]) {
					$(this).addClass("selected");
				}
			});
		}
	}
	
	function getTags(obj){
		if($(obj).hasClass("selected")){
			$(obj).removeClass("selected");
		}else{
			$(obj).addClass("selected");
		}
		var activityTags = "";
		var count = 0;
		$(".searchOptions .optionBtn").each(function() {
			if($(this).hasClass("selected")) {
				activityTags += ($(this).text() + ",");
				count++;
			}
		});
		if(count<1){
			layer.msg("最少选择一个标签");
			$(obj).addClass("selected");
			return;
		}
		if(count>4){
			layer.msg("最多只能选择四个标签");
			$(obj).removeClass("selected");
			return;
		}
		$('.activityTags').val(activityTags);
		
	}

	 
	
 
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
 function releasePreview(){
	 var value = $('.release_name').val();
	  if (value == "") {
			layer.alert("活动名称不能为空");
			return;
		}
		value = $('#start').val();
		if (value == "") {
			layer.alert("开始时间不能为空");
			return;
		}
		value = $('#end').val();
		if (value == "") {
			layer.alert("结束时间不能为空");
			return;
		}
		var date1= $('#start').val();
		var date2= $('#end').val();
		var date1 = new Date(Date.parse(date1.replace(/-/g, "/")));  
		var date2 = new Date(Date.parse(date2.replace(/-/g, "/")));  
		if(date1>=date2)  
		 {  
		 layer.alert("开始时间不能大于结束时间！");  
		  return;  
		 }
		value = $('.release_address').val();
		if (value == "") {
			layer.alert("活动地点不能为空");
			return;
		}
		var activityImage = $(".activityImage").val();
		if(activityImage == ""||activityImage == null){
			layer.alert("请选择一张图片");
			return;
		}
		//标签选择
		value = $('.release_textarea').val();
		if (value == "") {
			layer.alert("活动介绍不能为空");
			return;
		}
	$("#form").attr("action","${ctx}/projectActivity/weixin/activityPreview");
	$("#form").submit();
	
 };
 //发布活动
 function confirmCreate(){
 	 var value = $('.release_name').val();
	  if (value == "") {
			layer.alert("活动名称不能为空");
			return;
		}
		value = $('#start').val();
		if (value == "") {
			layer.alert("开始时间不能为空");
			return;
		}
		value = $('#end').val();
		if (value == "") {
			layer.alert("结束时间不能为空");
			return;
		}
		var date1= $('#start').val();
		var date2= $('#end').val();
		var date1 = new Date(Date.parse(date1.replace(/-/g, "/")));  
		var date2 = new Date(Date.parse(date2.replace(/-/g, "/")));  
		if(date1>=date2)  
		 {  
		 layer.alert("开始时间不能大于结束时间！");  
		  return;  
		 }
		value = $('.release_address').val();
		if (value == "") {
			layer.alert("活动地点不能为空");
			return;
		}
		var activityImage = $(".activityImage").val();
		if(activityImage == ""||activityImage == null){
			layer.alert("请选择一张图片");
			return;
		}
		//标签选择
		value = $('.release_textarea').val();
		if (value == "") {
			layer.alert("活动介绍不能为空");
			return;
		}
		createActivity();
		
		
	};

	//创建活动，提交表单
	function createActivity(){
		$.ajax({
			url:"${ctx}/projectActivity/json/activitySave",
			type:"post",
		 	data:$("#form").serialize(),
		 	dataType:"json",
		 	success:function(result){
		 		if(result.code==1){
		 			releaseSuccess(result.msg);
		 		}else{
		 			layer.alert(result.msg);
		 		}
		 	}
		});
	}

	 function releaseSuccess(activityId) {
		 $('#seconds').html(3);
	 	layer.open({
			type : 1,
			title : false,
			shadeClose : true,
			shade : [ 0 ],
			area : [ '400px', '200px' ],
			time : 3000,
			closeBtn : 0,
			content : $('#releaseSuccess'),
			success :function(){
				setTimeout(function(){
					$('#seconds').html(2);
					setTimeout(function(){$('#seconds').html(1);},1000);
				},1000);
			},
			end : function() {
	 			window.location.href="${ctx}/projectActivity/weixin/detail/"+activityId;
  			}
		}); 
	
	} 
	function backTo(){
		layer.close(LayerIndex);
	}
	function selectedImg(){
		 $(".gallery_pic").each(function(index, item) {
				if($(item).hasClass("s")) {
					$("#uploadifyImg").attr( 'src', url );
				    $(".activityImage").val(url); 
				}
			});
		layer.close(LayerIndex);
	}
</script>
</head>

<body>
	<div class="release_main">
		<form name="form" id="form" action="${ctx}/projectActivity/json/activitySave" method="post">
			<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
			<input type='hidden' name='activityImage' class="activityImage" value="${projectActivityInfoBean.activityImage}">
			<input type='hidden' name='activityTags' class="activityTags" value="${projectActivityInfoBean.activityTags}">
			<div class="fixed_top">
				<img src="${ctx}/static/weixin/images/activity/publicactivity2.png" width="15px;" height="15px;"> 
				<span>发起活动</span>
			</div>
			<div class="release_content">
				<div class="release_dataBar">
					<div class="release_data">
						<span>活动名称&nbsp;</span> 
						<input type="text"  name='activityName' class="release_name" style="padding: 5px 0;border: 1px solid #7E7E7E;text-indent: 3px;border-color:#b0b0b0;width:72%;" placeholder=" &nbsp;建议4-25个字" value="${projectActivityInfoBean.activityName}">
					</div>
					<div class="release_data">
						<span>开始时间&nbsp;</span> 
						<input id="start" type="text" name='start' readonly="readonly" style="padding: 5px 0;border: 1px solid #7E7E7E;text-indent: 3px;border-color:#b0b0b0" class="release_time" value="${projectActivityInfoBean.start}" placeholder="&nbsp;开始日期" />
					</div>
					
					<div class="release_data">
						<span>结束时间&nbsp;</span> 
						<input id="end" type="text" name='end' style="padding: 5px 0;border: 1px solid #7E7E7E;text-indent: 3px;border-color:#b0b0b0" readonly="readonly" class="release_time" value="${projectActivityInfoBean.end}" placeholder="&nbsp;结束日期" />
					</div>
					<div class="release_data">
						<span>活动地点&nbsp;</span> 
						<input type="text" name='activityLocation' value="${projectActivityInfoBean.activityLocation}" class="release_address" style="padding: 5px 0;border: 1px solid #7E7E7E;text-indent: 3px;border-color:#b0b0b0;width:72%;"  placeholder="&nbsp;请填写活动详细地址">
					</div>
				</div>
				<div class="release_dataBar" style="padding: 7px 10px;">
					 <div style="width:90px; height:90px; float:left; margin-right:10px;">
					<%-- <img id="uploadifyImg" src="${ctx}/static/weixin/images/activity/egpic.png" width="90px;" height="90px;" class="uploadifyImg"> --%>
					<c:choose>
						<c:when test="${projectActivityInfoBean.activityImage!=null&&projectActivityInfoBean.activityImage!=''}">
							<img src="${projectActivityInfoBean.activityImage}" id="uploadifyImg" width="90px;" height="90px;" class="uploadifyImg"  />
						</c:when>
						<c:otherwise>
							<img src="${ctx}/static/weixin/images/activity/egpic.png" id="uploadifyImg" width="90px;" height="90px;" class="uploadifyImg" style="margin-top: 3%;"/>
						</c:otherwise>
					</c:choose>
					</div>  
					<%--<img id=picker  src="${ctx}/static/weixin/images/activity/headPortrait.png" width="90px;" height="90px;" class="uploadifyImg"> --%> 
					<div class="uploadifyText">一张漂亮的海报，能让你的活动锦上添花，带来更多用户报名及增加传播效果，也将影响其在活动被推荐的几率。图片小于2M(jpg、gif、png)，尺寸为720*370px</div>
					<div> 
						<div id="picker" class="uploadifyInput" style="top:2px;float:left;font-size: 14px;margin-right:10px;margin: 5px 7px 5px 0;padding: 0 5px;border-radius: 3px;margin-top: 7%" >上传图片</div>
						<div type="button" onClick="galleryPictures();" class="uploadifyInput" style="top:2px;float:left;font-size: 14px;margin-right:10px;margin: 5px 7px 5px 0;padding: 0 5px;border-radius: 3px;margin-top: 8%;">推荐图片</div>
						<div style="clear:both;"></div>	
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="release_dataBar">
					<div class="release_label">
						<div style="float: left;">活动标签</div>
						<div style="float: left;" class="release_labelTip">(最多可选4个标签)</div>
						<img src="${ctx}/static/weixin/images/activity/unfold.png" width="15px;" height="15px;" class="img_contral_t5" style="float: right;">
						<div style="clear: both;"></div>
					</div>
					<div class="release_moreLabel">
						<div class="searchOptions">
							<c:forEach items="${tagList}" var="tags">
								<div class="optionBtn" onclick="getTags(this)">${tags.tagName}</div>
							</c:forEach>
							<div style="clear: both;"></div>
						</div>
					</div>
				</div>
                
				<div class="release_dataBar"
					style="padding: 9px 10px 3px; margin-bottom: 0;">
					<div style="float: left;">活动介绍</div>
					<textarea rows="4" name='activityDescription' placeholder="请简单介绍下你的活动" class="release_textarea">${projectActivityInfoBean.activityDescription}</textarea>
					<div style="clear: both;"></div>
				</div>
				<div style="padding: 10px 5px;">
					<input type="button" value="预览" onClick="releasePreview();" class="previewBtn"> 
					<input type="button" value="确认发布" onClick="confirmCreate();" class="confirmRelBtn">
				</div>
			</div>

			<div id="galleryPictures" style="display: none;">
				<div class="fixed_top">
					<img src="${ctx}/static/weixin/images/activity/publicactivity2.png" width="20px;" height="20px;"> <span>发起活动</span>
				</div>

				<div class="gallery_content">
					<div class="gallery_pic" onclick="choosePicture(this);">
						<img src="${ctx}/static/weixin/images/activity/field.jpg" width="100%;" height="100px;">
					</div>
					<div class="gallery_pic" onclick="choosePicture(this);">
						<img src="${ctx}/static/weixin/images/activity/field.jpg" width="100%;" height="100px;">
					</div>
					<div class="gallery_pic" onclick="choosePicture(this);">
						<img src="${ctx}/static/weixin/images/activity/field.jpg" width="100%;" height="100px;">
					</div>
					<div class="gallery_pic" onclick="choosePicture(this);">
						<img src="${ctx}/static/weixin/images/activity/field.jpg" width="100%;" height="100px;">
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

			<div id="releaseSuccess" style="display: none;">
				<div style="margin: 20px auto; font-size: 18px; text-align: center;">
					<img src="${ctx}/static/image/activity/success.png"
						width="70px;" height="70px;">
					<div>恭喜你，活动发布成功！</div>
					<div>
						<span id="seconds" style="color: #F00; font-size: 24px;">3</span>&nbsp;秒后自动跳转到该活动页面
					</div>
				</div>
			</div>


			<div class="navigationBar">
				<ul>
					<%-- <li><a href="${ctx}/personalCenter/weixin/main">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/personalCenter/shou.png"
								width="20px;" height="20px;" style=" margin-top: 6%"/>
						</div>
						<div class="navTitle" style="margin-top: 8%;font-size: 12px">首页</div>
					</a></li> --%>
					<li><a href="${ctx}/auth/page/mobile/weixin/projectActivity/weixin/activityMain">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/activity/findactivityed.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
						</div>
						<div class="navTitle">找活动</div>
					</a></li>
					<li><a href="${ctx}/projectActivity/weixin/createActivity">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/activity/publicactivity.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
						</div>
						<div class="navTitle">发布活动</div>
					</a></li>
					<li><a href="javascript:;" class="viewMore">
						<div class="navImage">
							<img src="${ctx}/static/weixin/images/logistics/more.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
						</div>
						<div class="navTitle">更多服务</div>
					</a></li>
				</ul>
				<div id="viewMore">
					 <ul style="margin-top:-95px;">
						<li style="border-bottom: 1px solid #E6E6E6"><a href="${ctx}/projectActivity/weixin/myActivity">我的活动</a></li>
						<li style="border-bottom: 1px solid #E6E6E6"><a href="${ctx}/personalCenter/weixin/messageNotification">消息中心</a></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<script>
 	$(function(){
	/* var start = {
		elem : '#start', //选择ID为START的input
		event : "focus",
		format : 'YYYY-MM-DD hh:mm', //自动生成的时间格式
		min : laydate.now(), //设定最小日期为当前日期
		max : '2099-06-16 23:59', //最大日期
		istime : true, //必须填入时间
		istoday : true, //是否是当天
		start : laydate.now(0, "YYYY-MM-DD hh:mm"), //设置开始时间为当前时间
		choose : function(datas) {
		/* 	 end.min = datas; //开始日选好后，重置结束日的最小日期
			end.start = datas; //将结束日的初始值设定为开始日 
			}
	};
	var end = {
		elem : '#end',
		format : 'YYYY-MM-DD hh:mm',
		event : "focus",
		min : laydate.now(),
		max : '2099-06-16 23:59',
		istime : true,
		istoday : true,
		start : laydate.now(0, "YYYY-MM-DD hh:mm"),
		choose : function(datas) {
			start.max = datas; //结束日选好后，重置开始日的最大日期
		}
	};
); */
    
    var optDateTime = $.extend(opt['datetime'], opt['default']);
	var optTime = $.extend(opt['time'], opt['default']);
	
  	$("#start").mobiscroll(optDateTime).datetime(optDateTime);
	$("#start")[0].value = new Date().Format("yyyy-MM-dd hh:mm");
  	
    //初始化 
    $("#end").mobiscroll(optDateTime).datetime(optDateTime);
    $("#end")[0].value = new Date().Format("yyyy-MM-dd hh:mm");
    if('${type}'==2){
    	$("#start").val('${projectActivityInfoBean.start}');
    	$("#end").val('${projectActivityInfoBean.end}');	
    }else{
    	$("#start").val("");
    	$("#end").val("");
    	$(".release_name").val("");
    	$(".release_address").val("");
    	$(".release_textarea").val("");
    }	
	});
</script>
</body>
</html>
