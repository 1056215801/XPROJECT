<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>帮你问问</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/plugins/bootstrap-switch/bootstrap-switch.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main">
		<input type="hidden" id="pageNum" value="1">
		<input type="hidden" id="replyId" value="">
		<input type="hidden" id="expImage" name="expImage" value=""/>
		<input type="hidden" id="imageId" name="imageId" value=""/>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020181228143754800061000000033"/>
<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="帮你问问" />
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-nav"><p>问题详情</p><a href="${ctx}/helpAsk/allList?entranceId=${entranceId}">返回列表 ></a></div>
						<div class="artical-content">
							<div class="declareDataBar fz0" id="askInfo"></div>
							<div class="main-contents">
								<div class="texts">${detail.declareText}</div>
								<div class="ask-opt">
									<a href="javascript:;" onclick="solReply('${id}')"><img src="${ctx}/static/image/homePage_yc/unsol@3x.png">解决</a>
 									<a href="javascript:;" onclick="openLay('${id}',2)"><img src="${ctx}/static/image/homePage_yc/ed@3x.png">补充</a>
									<a href="javascript:;" onclick="delReply('${id}',1)"><img src="${ctx}/static/image/homePage_yc/de@3x.png">删除</a>
 									<a href="javascript:;" onclick="openLay('${id}',1)"><img src="${ctx}/static/image/homePage_yc/re@3x.png">回复</a>
								</div>
							</div>
							<div class="reply">
								<h2>回复列表</h2>
								<div class="comment-list" id="commentList"></div>
								<div class="get-more" id="getMore">加载更多</div>
							</div>
						</div>
					</div>
					<div style="display:none" id="addBox" class="reply-box">    
						<h3>问题补充</h3>
						<div class="reply-input">
							<label for="askContent"><font class="redT">*</font>补充内容</label>
							<textarea rows="5" id="askContent" placeholder="请输入补充内容"></textarea>
						</div>
						<div class="opt-btns">
							<a href="javascript:;" onclick="layer.closeAll();">取消</a>
							<a href="javascript:;" onclick="addReply()">确定</a>
						</div>
	                </div>
					<div style="display:none" id="replyBox" class="reply-box">    
						<h3>回复</h3>
						<div class="reply-input">
							<label for="replyContent"><font class="redT">*</font>回复内容</label>
							<textarea rows="5" id="replyContent" placeholder="请输入回复内容"></textarea>
						</div>
						<div class="reply-input">
							<label for="replyContent">上传图片</label>
							<div id="picUrls" class="uploadImgContral"></div>
							<img src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
							<div class="uploadImgTips">
								<div id="pictureUpload">
									<input type="file" data-no-uniform="true" name="attFiles" id="pic_uploads" multiple="true"/>
								</div>
							</div>
						</div>
						<div class="reply-input">
							<label for="replyContent">是否匿名</label>
							<input type="hidden" id="isMessage" name="isMessage" value="0"/>
							<input type="checkbox" id="mySwitch2" data-on-text="是" data-off-text="否" />
						</div>
						<div class="opt-btns">
							<a href="javascript:;" onclick="layer.closeAll();">取消</a>
							<a href="javascript:;" onclick="reReply()">确定</a>
						</div>
	                </div>
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import>
				</div>
			</div>
		</div>
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript">
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(6)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(1) a:eq(0)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".fr li").eq(5).addClass("on");
	//按钮
	$("#mySwitch2").bootstrapSwitch({
		onSwitchChange : function(event, state) { //状态改变时触发事件
			if (state == true) {
				$("#isMessage").val("1");
			} else {
				$("#isMessage").val("0");
			}
		}
	});
	//图片附件
	var urls = [],ids=[];
	$('#pic_uploads').uploadify(
		{
			'debug' : false,
			'simUploadLimit' : 3,
			'multi' : true,
			'auto' : true,
			'removeCompleted' : true,
			'removeTimeout' : 1,
			'successTimeout' : 99999,
			'formData' : {
				'jsessionid' : '${pageContext.session.id}'
			},
			'uploader': '${ctx}/session/attachment/publish' , // 新版
			'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
			'overrideEvents' : [ 'onDialogClose', 'onUploadError',
					'onSelectError' ],
			'fileObjName' : 'attachment',
			'width' : '80',
			'height' : '30',
			'fileTypeDesc' : 'jpg gif png',
			'fileTypeExts' : '*.jpg;*.gif;*.png',
			'fileSizeLimit' : '2MB',
			'buttonText' : '上传图片',
			'queueSizeLimit' : 3,
			'onUploadProgress' : function(file, bytesUploaded,
					bytesTotal, totalBytesUploaded, totalBytesTotal) {
				//使用方法见官方说明
			},
			'onUploadStart' : function(file) {
				var myself = this; 
				if(!isSafeFile(file.name )){
					  alert('请选择合法的文件！');
					  myself.cancelUpload(file.id); 
				      $('#' + file.id).remove(); 
				}
			},
			'onUploadError' : function(file, errorCode, errorMsg) {
				if (errorCode = -280) {
	
				} else {
					alert('上传失败，请联系管理员2');
				}
			},
			'onCloseError' : function(file, errorCode, errorMsg) {
				alert('上传失败，请联系管理员3');
			},
			'onSelectError' : function(file, errorCode, errorMsg) {
				switch (errorCode) {
				case -100:
					alert("上传的文件数量已经超出系统限制的"
							+ $('#pic_uploads').uploadify('settings',
									'queueSizeLimit') + "个文件！");
					break;
				case -110:
					alert("文件 ["
							+ file.name
							+ "] 大小超出系统限制的"
							+ $('#pic_uploads').uploadify('settings',
									'fileSizeLimit') + "大小！");
					break;
				case -120:
					alert("文件 [" + file.name + "] 大小为零，不能上传！");
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
			'onUploadSuccess' : function(file, data, response) {
				var obj =JSON.parse(data);
				showPic(obj.attachment);
				urls.push(obj.attachment.attachmentUrl);
				ids.push(obj.attachment.attachmentId);
				$("#expImage").val(urls.toString());
				$("#imageId").val(ids.toString());
			}
		});
	getAskInfo(1,10,"${id}")
});
function showPic(jsonData) {
	var div = '<img src="'+jsonData.attachmentUrl+'" width="100px;" height="100px;" class="uploadImgContral"/>'
	$("#picUrls").append(div);
	$("#showPicUrl").hide();
}

function getAskInfo(pageNum,pageSize,askId){ 
	$('#pageNum').val(pageNum);
	$.ajax({
		url:"${urlPath}XOffice/interface/json/question/askInfo/askDetail",
		type:"get",
		data:{
				"pageNum": pageNum,
				"pageSize": pageSize,
				"askId":askId
			 },
		dataType:"json",
		success:function(result){
			if(result.success){
				var info = result.askInfo;
				var answer = result.answerList;
				var extra = result.extraList;
				var tagList = getTagList();
				if('${accountId}' == info.accountId){
					$(".ask-opt a").show();
				}
				if(pageNum == 1){
					$("#commentList").empty();
				}
				var accName = info.isAnonymous == 0 ? info.accountNick : "匿名";
				var accImg = info.accountImg && info.isAnonymous == 0 ? info.accountImg : '${ctx}/static/image/homePage_yc/headPortrait.png';
				//详情
				var _div = '<div class="text-box">';
				if(!info.askImgUrls){
					_div = '<div class="text-box" style="width: 100%;">';
				}
				_div+= '<div class="text-box_title">'
					+ '<img class="account-img" src="'+accImg+'">'
					+ '<div class="title-text">'
					+ '<div class="declareTitle">';
				if(info.isSolved == 1){
					_div+= '<span class="flag flag4">已解决</span><span class="triang triang4"></span>';
					$(".ask-opt a:eq(0)").hide();
				}
				_div+= info.askTitle+'</div>'
					+ '<div class="declareData">'
					+ '<font>发布人：' + accName + '</font>'
					+ '<font>发布时间：' + dateToTimeStr(info.createTime,'yyyy-MM-dd hh:mm:ss') + '</font>'
					+ '</div>'
					+ '<div class="declareData">'
					+ '<font><img src="${ctx}/static/image/homePage_yc/ico@3x.png">' + typeLevel(tagList,info.askTagIds)
					+ '<img src="${ctx}/static/image/experienceSharing/browseCount.png">' + info.browseNum + '浏览'
					+ '<img src="${ctx}/static/image/experienceSharing/commentCount.png">' + info.answerNum + '评论</font>'
					+ '</div>'
					+ '</div>'   //title-text
					+ '</div>'   //text-box_title
					+ '</div>';   //text-box
					if(info.askImgUrls){
						var img = info.askImgUrls.split(",")[0];
						_div+= '<img src="'+img+'">'
					}
				$('#askInfo').html(_div); 
				$('.texts').html(info.askContent); 
				//问题补充
				for(var i = 0;i < extra.length;i++){
					var div2 = '<p>'+ extra[i].askTitle + '</p>';
					$('.texts').append(div2); 
				}
				//回复列表
				for(var j = 0;j < answer.length;j++){
					var accName2 = answer[j].parent.isAnonymous == 0 ? answer[j].parent.accountNick : "匿名";
					var accImg2 = answer[j].parent.accountImg && answer[j].parent.isAnonymous == 0 ? answer[j].parent.accountImg : '${ctx}/static/image/homePage_yc/headPortrait.png';
					var div3 = '<div class="comment-item">'
						+ '<div class="comment-title">'
							+ '<img src="'+accImg2+'">'
							+ '<div class="title-text">'
							+ '<h3>'+accName2+'</h3>'
							+ '<p>'+dateToTimeStr(answer[j].parent.createTime,'yyyy-MM-dd hh:mm:ss')+'</p>'
							+ '</div>'
						+ '</div>'
						+ '<div class="comment-content">'
							+ '<div class="text">'+answer[j].parent.answerContent+'</div>'
							+ '<div class="picture">';
							if(answer[j].parent.answerImgUrls){
								var pImgs = answer[j].parent.answerImgUrls.split(',');
								for(var x = 0;x < pImgs.length;x++){
									div3 += '<span style="background-image:url('+pImgs[x]+')"></span>';
								}
							}
							div3 += '</div>'
							+ '<div class="comment-opt">'
							+ '<a href="javascript:;" onclick="delReply(\''+answer[j].parent.answerId+'\',2)"><img src="${ctx}/static/image/homePage_yc/del@3x.png">删除</a>'
							+ '<a href="javascript:;" onclick="openLay(\''+answer[j].parent.answerId+'\',1)"><img src="${ctx}/static/image/homePage_yc/rec@3x.png">回复</a>'
							+ '</div>'
							+ '</div>';
							if(answer[j].childSize > 0){
								var child = answer[j].childList;
								for(var y = 0;y < child.length;y++){
									var accName3 = child[y].isAnonymous == 0 ? child[y].accountNick : "匿名";
									var accImg3 = child[y].accountImg && child[y].isAnonymous == 0 ? child[y].accountImg : '${ctx}/static/image/homePage_yc/headPortrait.png';
									div3 += '<div class="comment-child">'
										+		'<div class="child-item">'
										+			'<div class="comment-title">'
										+				'<img src="'+accImg3+'">'
										+				'<div class="title-text">';
										if(answer[j].parent.answerId != child[y].parentId){
											div3 += '<h3><font class="blueT">'+accName3+'</font> 回复 '+child[y].parentAccountNick+'：'+child[y].answerContent+'</h3>'
										}else {
											div3 += '<h3><font class="blueT">'+accName3+'</font>：'+child[y].answerContent+'</h3>'
										}
										div3 +=			'<p>'+dateToTimeStr(child[y].createTime,'yyyy-MM-dd hh:mm:ss')
										+				'<a href="javascript:;" onclick="delReply(\''+child[y].answerId+'\',2)"><img src="${ctx}/static/image/homePage_yc/del@3x.png">删除</a>'
										+				'<a href="javascript:;" onclick="openLay(\''+child[y].answerId+'\',1)"><img src="${ctx}/static/image/homePage_yc/rec@3x.png">回复</a>'
										+				'</p>'
										+				'</div>'
										+			'</div>'
										+			'<div class="picture">';
										if(child[y].answerImgUrls){
											var pImgs = child[y].answerImgUrls.split(',');
											for(var x = 0;x < pImgs.length;x++){
												div3 += '<span style="background-image:url('+pImgs[x]+')"></span>';
											}
										}
										div3 += 	'</div>'
										+		'</div>'
										+	'</div>';
								}
							}
							div3 += '</div>'
					$("#commentList").append(div3);
				}
				if(answer.length == 0){
					$("#commentList").append('<div class="nodata">暂无更多数据！</div>');
				}
				if(result.total>pageNum*10){
					$("#getMore").show();
				} else { $("#getMore").hide();}
			}else {
				tips(result.errorMsg);
				$(".artical-content").html("<p style='padding: 50px;font-size:18px;text-align:center;'>该问题已被删除！</p>");
			}
		},
		error:function(){
			tips("请求超时，请稍后重试");
		},
	});
}

function getMore(){
	var pageNum = Number($("#pageNum").val())+1;
	$("#pageNum").val(pageNum);
	getAskInfo(pageNum,10,'${id}');
}
function getTagList() {
	var flag = new Array();
	$.ajax({
			url : "${urlPath}XOffice/interface/json/question/tagInfo/tagList",
			type : "post",
			async: false, 
			dataType : "json",
			success : function(data) {
				if(data.success){
					flag = data.tagList;
    			}
			},
			error : function() {
				tips("请求超时，请稍后重试");
			}
		});
	return flag;
}
function typeLevel(list, ids) {
	var str = "";
	var arr = ids.split(",");
	for (var i = 0; i < arr.length; i++) {
		for (var j = 0; j < list.length; j++) {
			if (arr[i].toString() == list[j].tagId.toString()) {
				str += list[j].tagName + "&nbsp;&nbsp;";
			}
		}
	}
	return str;
}

//弹窗，回复：1，补充：2
function openLay(id,type){
	if('${accountId}' == '') { return tips("亲，请先登录！");}
	$("#replyId").val(id);
	if(type==1){
		layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			skin: 'reportBar',
			shade: [0],
			area:['auto','auto'],
			closeBtn:0,
			content: $('#replyBox'),
		});
	}else {
		layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			skin: 'reportBar',
			shade: [0],
			area:['auto','auto'],
			closeBtn:0,
			content: $('#addBox'),
		});
	}
};
//解决问题
function solReply(id){
	if('${accountId}' == '') { return tips("亲，请先登录！");}
	layer.confirm('确认该问题已解决？', function(){
		$.ajax({
			url:"${urlPath}XOffice/interface/json/question/askInfo/askSolved",
			type:"post",
			data:{
				askId: id,
			},
			dataType:"json",
			success:function(data){
				if(data.success){
					$("#pageNum").val(1);
					self.getAskInfo(1,10,"${id}");
					layer.msg("解决成功！")
				}
				else {
					$.alert(data.errorMsg)
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				layer.msg("请求超时，请稍后重试");
			}
		});
	}, layer.close());
}
//删除  问题：1 回复：2
function delReply(id,type){
	if('${accountId}' == '') { return tips("亲，请先登录！");}
	if(type == 1){
		var text = '问题';
		var url = '${urlPath}XOffice/interface/json/question/askInfo/askDelete';
		var param = {
				askId: id,
		};
	}else {
		var text = '回复';
		var url = '${urlPath}XOffice/interface/json/question/answerInfo/answerDelete';
		var param = {
				answerId: id,
		};
	}
	layer.confirm('确认删除该'+text+'？', function(){
		$.ajax({
			url:url,
			type:"post",
			data:param,
			dataType:"json",
			success:function(data){
				if(data.success){
					layer.msg("删除成功！");
					if(type == 1){
						setTimeout(function(){ location.href="${ctx}/helpAsk/allList?entranceId=${entranceId}"},1000)
					}else {
						$("#pageNum").val(1);
						self.getAskInfo(1,10,"${id}");
					}
				}
				else {
					$.alert(data.errorMsg)
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				layer.msg("请求超时，请稍后重试");
			}
		});
	}, layer.close());
}
//补充问题
function addReply(){
	var id = $("#replyId").val();
	var content = $("#askContent").val();
	if(content == ''){ return layer.msg("请输入补充内容！");}
	$.ajax({
		url:"${urlPath}XOffice/interface/json/question/askInfo/extraAdd",
		type:"post",
		data:{
			askTitle: content,
			parentId: id,
		},
		dataType:"json",
		success:function(data){
			if(data.success){
				$("#pageNum").val(1);
				$("#askContent").val("");
				self.getAskInfo(1,10,"${id}");
				layer.closeAll();
				tips("补充成功！");
			}
			else {
				$.alert(data.errorMsg)
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			layer.msg("请求超时，请稍后重试");
		}
	});
}
//回复
function reReply(){
	var id = $("#replyId").val();
	if(id == '${id}') { id= '-1'}
	var content = $("#replyContent").val();
	if(content == ''){ return layer.msg("请输入回复内容！");}
	var param = {
			answerContent : content,
			askId : '${id}',
			askTitle : $(".declareTitle").text(),
			answerImgIds : $("#imageId").val(),
			answerImgUrls : $("#expImage").val(),
			isAnonymous : $("#isMessage").val(),
	    	accountId : '${accountId}',
	    	accountName : '${accountName}',
			parentId : id,
			rootId : '${entranceId}',
			rootName : '${parkName}',
			parkId : '${entranceId}',
			parkName : '${parkName}'
	}
	console.log(param)
	$.ajax({
		url:"${urlPath}XOffice/interface/json/question/answerInfo/answerAdd",
		type:"post",
		data: param,
		dataType:"json",
		success:function(data){
			console.log(data)
			if(data.success){
				$("#pageNum").val(1);
				$("#replyContent").val("");
				$("#imageId").val('');
				$("#expImage").val('');
				$("#picUrls").empty();
				$("#showPicUrl").show();
				self.getAskInfo(1,10,"${id}");
				layer.closeAll();
				tips("回复成功！");
			}
			else {
				$.alert(data.errorMsg)
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			layer.msg("请求超时，请稍后重试");
		}
	});
}

</script>
</body>
</html>

