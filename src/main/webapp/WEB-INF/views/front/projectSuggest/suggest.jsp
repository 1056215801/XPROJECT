<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>意见反馈</title>
<link href="${ctx}/static/css/suggest/feedback.css" rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/buttons.css"
	rel="stylesheet" />
<style>
.button_Contral {
	width: 230px;
	height: 45px;
	-moz-border-radius: 45px;
	-webkit-border-radius: 45px;
	border-radius: 45px;
	text-align: center;
	font-weight: bold !important;
}
</style>
<script>
	$(function() {
		
		getList(0,1,5);
		
		$(".tabName ul li").each(
				function() {//页面头部模块切换控制
					var index = $(this).index();
					$(".tabName ul li").eq(0).addClass("nameClick");
					$(this).click(
							function() {
								$(this).addClass("nameClick").siblings()
										.removeClass("nameClick");
								$(".tabItem>ul").eq(index).stop(true).show()
										.siblings().stop(true).hide();
							})
				});
		$(".tabItem ul li").each(
				function() {
					$(".tabItem ul li").eq(7).addClass("itemClick");
					$(this).click(
							function() {
								$(this).addClass("itemClick").siblings()
										.removeClass("itemClick");
							})
				});
		$(".header_WeChat").click(function() {
			var div = $(".WeChatQRcode");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		$(".commentName ul li").each(
				function() {
					var index = $(this).index();
					$(".commentName ul li").eq(0).addClass("commentClick");
					$(this).click(
							function() {
								$(this).addClass("commentClick").siblings()
										.removeClass("commentClick");
								$(".commentItem>div").eq(index).stop(true)
										.show().siblings().stop(true).hide();
							});
				});

		//图片附件
		$('#pic_uploads').uploadify({
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
			'fileObjName' : 'attachment',
			'width' : '80',
			'height' : '30',
			'fileTypeDesc' : '支持的格式：',
			'fileTypeExts' : '*.jpg;*.png;*.gif',
			'fileSizeLimit' : '2MB',
			'buttonText' : '上传截图',
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
							+ $('#pic_uploads').uploadify(
									'settings',
									'queueSizeLimit')
							+ "个文件！");
					break;
				case -110:
					alert("文件 ["
							+ file.name
							+ "] 大小超出系统限制的"
							+ $('#pic_uploads').uploadify(
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
				var obj = JSON.parse(data);
				showAtts(obj.attachment);
				var url = $("#atUrlList").val() + obj.attachment.attachmentUrl + ",";
				$("#atUrlList").val(url);
				var id = $("#atIdList").val() + obj.attachment.attachmentId + ",";
				$("#atIdList").val(id);
			}
		});
		
		$('#morePassList').click(function(){
			var pageNum = Number($("#pageNum").val())+1;
		   getList(0,pageNum,5);
		});
		$('#moreMyList').click(function(){
			var pageNum = Number($("#pageNum").val())+1;
		   getList(1,pageNum,5);
		});
		
		
		String.prototype.Trim = function() {  
			var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);  
			return (m == null) ? "" : m[1];  
			}
		
		String.prototype.isMobile = function() {  
			return (/^(?:13\d|15[89])-?\d{5}(\d{3}|\*{3})$/.test(this.Trim()));  
			}
	});

	//提交
	function suggestSave() {
	 	if(validate()){
	 		var s=$("#suggestContent").val();
	 		$("#suggestContent").val(safeStr(s));
			 $.ajax({
				url : "${ctx}/projectSuggestInfo/json/baocun",
				type : "post",
				dataType:"json",
				data : $('#editform').serialize(),
				headers:{"token":'${pageContext.session.id}'},
				success : function(result) {
					if (result.code == 1) {
						tips('提交成功');
						$("#suggestTitle").val("");
						$("#suggestContent").val("");
						$("#accountTel").val("");
						$("#atIdList").val("");
						$("#atUrlList").val("");
						$("#attList").empty(); 
						if(result.msg==1){
							getList(1,1,5);
						}
					} else if (result.code == 0) {
						layer.msg(result.msg);
					} else {
						layer.msg(result.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					 layer.msg("请求超时，请稍后重试"); 
				}
			}); 
		} 
		
	}
	 
	//校验
	function validate() {
		var suggestTitle = $("#suggestTitle").val();
		 if (suggestTitle == "" || suggestTitle == null) {
			layer.msg("请输入标题",{anim: 0});
			return false;
		}

		var suggestContent = $("#suggestContent").val();
		if (suggestContent == "" || suggestContent == null) {
			layer.msg("请输入内容");
			return false;
		}
		var accountTel = $("#accountTel").val();
		var phone = /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/;
		
		if (accountTel == null || accountTel == "") {
			tips("手机号不能为空!");
			return false;
		}
		if (!phone.test(accountTel)) {
			layer.open({
				type : 1,
				title : false,
				shadeClose : true,
				shade : [ 0.3 ],
				area : [ '400px', '150px' ],
				closeBtn : 0,
				content : $('#mobilePhoneVer')
				
			});
			setTimeout(function() { layer.closeAll(); },2000); 
			return false;
		}

		return true; 
	}

	function deleteAtt(id, url) {
		confirm('确认删除？', function(index) {
			$('#' + id).remove();
			var atIdList = $('#atIdList').val();
			var atUrlList = $('#atUrlList').val();
			var atIdAttr = atIdList.split(",");
			var atUrlAttr = atUrlList.split(",");
			var newIds = "";
			var newUrls = "";
			for (var i = 0; i < atIdAttr.length; i++) {
				if (atIdAttr[i] != "" && atIdAttr[i] != id) {
					var newId = atIdAttr[i] + ",";
					newIds += newId;
				}
				if (atUrlAttr[i] != "" && atUrlAttr[i] != url) {
					var newUrl = atUrlAttr[i] + ",";
					newUrls += newUrl;
				}
			}
			$('#atIdList').val(newIds);
			$('#atUrlList').val(newUrls);
		}, function() {
		});
	}
	
	function showAtts(jsonData) {
		var url = "";
		url += '<li id="'+jsonData.attachmentId+'"><a href="'+jsonData.attachmentUrl+'" target="_blank" style="color:blue;">'
				+ jsonData.remoteName
				+ '</a>&nbsp;<a href="javascript:;" style="color:blue;"  onclick="deleteAtt(\''+jsonData.attachmentId+'\',\''+jsonData.attachmentUrl+'\')">[删除]</a></li> ';
		$('#attList').append(url);
		
	}
	
	function getList(type,pageNum,pageSize){
		$.ajax({
			url:"${ctx}/projectSuggestInfo/json/list",
			type:"get",
			data:{
				"type":type,
				"pageNum":pageNum,
				"pageSize":pageSize
			},
			dataType:"json",
			success:function(result){
				$('#pageNum').val(pageNum);
				if(result.code==-1){
					layer.msg(result.msg);
				}else if(result.code==2){
					if(type==0){
						 $('#passList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						 $('#total').show();
						 $('#totalNum').text("0条      意见已采纳");
						 $('#morePassList').hide();
					}else if(type==1){
						$('#myList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						$('#total').hide();
						$('#moreMyList').hide();
					}
				}else{
					   var list = result.value;
					   var total = result.msg;
				    if(pageNum==1){
						if(type==0){
							$('#total').show();
							$('#passList').empty();
							$('#totalNum').text(total+"条      意见已采纳");
						}else{
							$('#myList').empty();
							$('#total').hide();
						}
				    }
				 
				    for(var i = 0;i<list.length;i++){
				    	var info = list[i];
				    	var status = 0;
				    	if(info.status==0){
				    		status = "未采纳";
				    	}else if(info.status==1){
				    		status = "已采纳";
				    	}else if(info.status==2){
				    		status = "审核中";
				    	}
				    	_div =	'<div class="commentBar clearfix">';
				               if(info.accountImage!=-1){
				            	   _div += '<img src="'+info.accountImage+'" width="40" height="40" style="float: left; border-radius: 40px;">';
				               }else{
				            	   _div += '<img src="${ctx}/static/image/suggest/headPortrait.png" width="40" height="40" style="float: left; border-radius: 40px;">';
				               }
						
				                  _div += '<div class="commentCont">'
										+ '<div>'
										+ '<span class="commentContName">'+info.accountName+'</span>' 
										+ '<span class="commentContTime">'+info.createTime+'</span>'
										+ '</div>'
										+ '<div class="commentContTitle">'+info.suggestTitle+'</div>'
										+ '<div class="commentContAbstract">'+info.suggestContent+'</div>';
								 if(info.attachmentId!=null){
									 _div += '<div class="commentContFile"><a href="${ctx}/projectSuggestInfo/batchDownload?ids='+info.suggestId+'" style="color:#0000FF;">截图下载</a></div>'
								        }
								  _div += '</div>';
								 if(type==0){
								  _div +='<div class="commentLabel">'+info.rewardContent+'</div>'
									   + '</div>';
								 }else{
								  _div += '<div style="float: right;">';
								  	 if(info.status==1){
								    	 _div += '<div class="commentLabel" style="float: none;">'+info.rewardContent+'</div>'
								  		}
								 _div += '<div style="float: right;">'+status+'</div>'
										+ '</div>';
								 }
										
								 
								 if(type==0){
										$('#passList').append(_div);
									}else{
										$('#myList').append(_div);
									}
								 if(result.code==0){
										$('#morePassList').hide();
										$('#moreMyList').hide();
									}else if(result.code==1){
										$('#morePassList').show();
										$('#moreMyList').show();
									}
										
				    }
				}
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
	 
	 
</script>
</head>

<body>



	<div class="project_header">
		<%@ include file="../common/header.jsp"%>
	</div>
	<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="-1"/>
	<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="意见反馈" />
	<div class="feed_content">
		<div class="feed_title">提意见，赢大奖！</div>
		<img src="${ctx}/static/image/suggest/banner_pc.jpg"
			style="display: block; margin: 15px auto;">
		<div class="feedContent">
			<div class="feedName clearfix">
				<ul>
					<li class="feedClick"><a href="javascript:;">意见反馈</a></li>
				</ul>
			</div>
			<input type="hidden" id="pageNum" value="1"/>
			<form method="post" id="editform" class="editform">
				<input type="hidden" name="suggestSource" id="suggestSource"
					value="1" /> <input type="hidden" name="attachmentUrl"
					id="atUrlList" value="" /> <input type="hidden"
					name="attachmentId" id="atIdList" value="" /> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="feedInputBar">
					<div class="feedInput clearfix">
						<font class="redStar">*</font> <span class="feedAttr">标题</span> 
						<input type="text" class="inputBox" style="width: 81.5%;" name="suggestTitle" id="suggestTitle" maxlength="25" />
					</div>
					<div class="feedInput clearfix">
						<font class="redStar">*</font> <span class="feedAttr">内容</span>
						<textarea cols="4" class="textareaBox" style="width: 80%;"
							placeholder="请输入意见反馈内容" id="suggestContent" name="suggestContent" maxlength="250"
							></textarea>
					</div>
					<div class="feedInput clearfix">
						<span class="feedAttr" style="margin-left: 15px;">附件</span>
						<div id="fileUpload" style="float: left; margin-left: 15px;">
								<input type="file" data-no-uniform="true" name="attFiles" id="pic_uploads" multiple="true" /> 
								<span id="attList"></span>
						</div>
						<span class="fileUploadTip">附件大小不超过5M</span>
						<div style="clear: both;"></div>
						<div style="margin-left: 80px;" id="attList"></div>
					</div>
					<div class="feedInput clearfix">
						<font class="redStar">*</font> <span class="feedAttr">获奖联系电话</span>
						<input type="text" class="inputBox"
							style="width: 32%; " name="accountTel" id = "accountTel"
							 maxlength="11"
							onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"
							onblur="this.v();" />
					</div>
					<div style="text-align: center;">
						<input type="button"
							class="button button-raised button-caution button_Contral"
							value="提&nbsp;交" onClick="suggestSave();">
					</div>
				</div>
			</form>
		</div>
		<div class="splitLine"></div>
		<div class="feedContent">
			<div class="commentArea">
				<div class="commentName">
					<ul>
						<li><a href="javascript:;" onclick="getList(0,1,5)">已采纳意见</a></li>
						<li><a href="javascript:;" onclick="getList(1,1,5)">我的意见</a></li>
					</ul>
					<div class="commentStatistics" id="total">
						<img src="${ctx }/static/image/activity/comment.png" width="20"
							height="16"> <span id="totalNum">23条&nbsp;意见已采纳</span>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="commentItem">
				<div>
					<div id="passList">
						<%-- <div class="commentBar clearfix">
							<img src="${ctx}/static/image/suggest/headPortrait.png"
								width="40" height="40" style="float: left; border-radius: 40px;">
							<div class="commentCont">
								<div>
									<span class="commentContName">张耀</span> <span
										class="commentContTime">2016-09-07 21:49</span>
								</div>
								<div class="commentContTitle">物流经验分享页面存在问题</div>
								<div class="commentContAbstract">货车帮&nbsp;值得借鉴</div>
								<div class="commentContFile"></div>
							</div>
							<div style="float: right;">
								<div class="commentLabel" style="float: none;">奖励话费100元</div>
								<div style="float: right;">审核中</div>
							</div>
						</div>
						<div class="commentBar clearfix">
							<img src="${ctx}/static/image/suggest/headPortrait.png"
								width="40" height="40" style="float: left; border-radius: 40px;">
							<div class="commentCont">
								<div>
									<span class="commentContName">张耀</span> <span
										class="commentContTime">2016-09-07 21:49</span>
								</div>
								<div class="commentContTitle">物流经验分享页面存在问题</div>
								<div class="commentContAbstract">货车帮&nbsp;值得借鉴</div>
								<div class="commentContFile"></div>
							</div>
							<div class="commentLabel">奖励话费10元</div>
						</div>--%>
                    </div>
                    <br/>
					<div id="getMoreComment" style="margin: 0 0 10px;">
						<a href="javascript:void(0);" id="morePassList"
							class="renovate"> <span class="renovateTitle">加载更多</span>
						</a>
					</div>
				</div>
				<div style="display: none;">
					<div id="myList" ></div>
					<br />
					<div id="getMoreComment" style="margin: 0 0 10px;">
						<a href="javascript:void(0);" id="moreMyList"
							class="renovate"> <span class="renovateTitle">加载更多</span>
						</a>
					</div>
				</div>
				</div>
				
					<div id="mobilePhoneVer"
						style="display: none; text-align: center; margin: 30px 0;">
						<img src="${ctx}/static/image/personalCenter/headPortrait.png"
							width="90px" height="90px" style="vertical-align: middle;">
						<span
							style="vertical-align: middle; font-weight: bold; margin-left: 20px;">请输入有效手机号码</span>
					</div>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
	</div>

</body>
</html>
