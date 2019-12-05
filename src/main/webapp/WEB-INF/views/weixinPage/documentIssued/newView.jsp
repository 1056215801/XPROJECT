<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>文件下达详情</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<link href="${ctx}/static/weixin/css/documentIssued/view.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/lightbox.css" rel="stylesheet"/>

<script src="${ctx}/static/weixin/js/modernizr-custom-v2.7.1.js"></script>
<script src="${ctx}/static/weixin/js/jquery-finger-v0.1.0.js"></script>
<script src="${ctx}/static/weixin/js/lightbox.js"></script>
<script>
	
	$(function() {
		$("#pageNum").val(1);
		var id = '${id}';
		var logId = '${logId}';
		var logStatus = '${logStatus}';
		getViews(id, logId, logStatus);
		getComment(id, 1);

		$('#back_a').attr("href","${ctx}/auth/page/mobile/weixin/documentIssued/viewList");

		/* 滚动显示小火箭 */
		$(window).scroll(
				function() {
					if ($(document).scrollTop() + $(window).height() > $(
							document).height() - 1
							&& $('#getMore').length > 0) {
						$(".renovate").attr("onclick","");
						setTimeout(function() {
							getMore();
							$(".renovate").attr("onclick","getMore();");
						}, 1000);
					}
					if ($(document).scrollTop() > 0) {
						$('#tbox').show();
					} else {
						$('#tbox').hide();
					}
				});
	});

	function getViews(id, logId, logStatus) {
		var accountId = '${accountId}';
		var parkId = '${parkId}';
		var accountName = '${accountName}';
		if (accountId == null || accountId == "") {
			layer.msg("登录后可查看更多文件");
			accountId = "1291";
		}
		if (logId == 0) {
			logId = '';
		}
		$.ajax({
			url : "http://117.21.209.17:8080/OfficeAutomationPlatform/Spring/json/documents/documentsissuedinfo/viewOfPhone",
			type : "get",
			data : {
				'id' : id,
				'logStatus' : logStatus,
				'logId' : logId,
				'accountName' : accountName,
				'accountId' : accountId,
				'orgId' : parkId,
				'parkId' : parkId,
				'orgName' : '',
				'parkName' : '',
			},
			dataType : "jsonp",
			success : function(result) {
				if (result.errorCode == 0) {
					var value = result.value.result;
					if (value) {
						$('.projectTitle').empty();
						$('.projectTitle').html(value.title);
						$('#timevalue').empty();
						$('#timevalue').html(value.createTime);
						$('#authorvalue').empty();
						$('#authorvalue').html(value.accountName);
						$('#authorwhere').empty();
						$('#authorwhere').html(value.orgName);
						$('#documentType').empty();
						$('#documentType').html(value.documentType);
						$('#moreContent').append(value.content);
						if (value.attachUrl) {
							if (value.attachUrl.endWith('png') || value.attachUrl.endWith('jpg') || value.attachUrl.endWith('jpeg')) {
								getAttrImg(value.attachUrl, value.attachName);
							} else {
								showImages(value.attachIds, value.attachName);
							}
							$('#detailsContent').show();
						} else {
							$('#detailsContent').hide();
						}
					}
				} else {
					alert("网络异常");
				}
			},
		});
	}

	String.prototype.endWith=function(str){
		if(str==null||str==""||this.length==0||str.length>this.length)
			return false;
		if(this.substring(this.length-str.length)==str)
			return true;
		else
			return false;
		return true;
	}

	function getComment(id, pageNo) {
		
		$.ajax({
			url : "http://117.21.209.17:8080/OfficeAutomationPlatform/Spring/json/mobileInvoke/publicationInfo/queryCommentList",
			type : "get",
			data : {
				'infoId' : id,
				'pageNo' : pageNo,
				'pageSize' : '10',
			},
			dataType : "jsonp",
			success : function(result) {
				if (result.errorCode == 0) {
					var list = result.value.resultList;
					if (!list) {
						layer.msg("网络异常");
						return;
					}
					if (pageNo == 1) {
						$('#commondlist').empty();
						if (list.length == 0) {
							$('#noComment').hide();
						} else {
							$('#noComment').hide();
						}
					} else {
						$('#noComment').hide();
					}
					$('#commentSize').html("" + list.length + "条评论");
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var _div = '<div class="details_comCont">'
							+'<img src="'+(info.imageUrl==undefined?'${ctx}/static/weixin/images/activity/headPortrait.png':info.imageUrl)+'" width="22px;" height="22px;" style="float: left;border-radius:11px;">'
							+'<div class="details_comName">'+info.accountName+'</div>'
							+'<div class="details_comTime">'+info.commentTime+'</div>'
							+'<div style="clear: both;"></div>'
							+'<div class="details_com">'+info.commentText+'</div>';
						_div += '</div>';
						$('#commondlist').append(_div);
					}
					if (list.length == 10) {
						var moreStr = "";
						moreStr += "<div id=\"getMore\" style=\"margin:0 1.6% 10px;\">";
						moreStr += "<a href=\"javascript:void(0);\" onclick=\"getMore();\" class=\"renovate\" style=\"text-decoration: none;\">";
						moreStr += "<span class=\"renovateTitle\" style=\"color: #120F0F;\">加载更多</span>";
						moreStr += "</a>";
						moreStr += "</div>";
						$(moreStr).appendTo($("#commondlist"));
					}
				} else {
					layer.msg("网络异常");
				}
			},
		});
	}

	function sumbitComment() {
		var accountId = '${accountId}';
		if (accountId == null || accountId == "") {
			layer.msg("登录后可查看更多文件");
			return;
		}
		var parkId = '${parkId}';
		if (parkId == null || parkId == "") {
			layer.msg("登录后可查看更多文件");
			return;
		}
		var id = '${id}';
		if (!$('#commentText').val()) {
			layer.msg("请填写评论");
			return;
		}
		var commentText = $('#commentText').val();
		var isAnonymous = ($('#isAnonymous').is(':checked') ? 1 : 0);
		$.ajax({
			url:"http://117.21.209.17:8080/OfficeAutomationPlatform/Spring/json/mobileInvoke/publicationInfo/submitComment",
			type : "get",
			data : {
				'infoId' : id,
				'isAnonymous' : isAnonymous,
				'commentText' : commentText,
				'publicType' : '6',
				'rootId' : parkId,
				'accountId' : accountId,
				'orgId' : parkId,
			},
			dataType : "jsonp",
			success : function(result) {
				if (result.errorCode == 0) {
					layer.msg("评论成功");
					$("#pageNum").val(1);
					$('#commentText').val("");
					getComment(id, 1);
				} else {
					layer.msg("网络异常");
				}
			}
		});
	}

	function getAttrImg(attrUrls, attachName) {
		var list = attachName.split(",");
		var listImg = attrUrls.split(",");
		var _div = "";
		
		for (var i = 0; i < list.length; i++) {
			var remoteName = list[i];
			var imgUrl = listImg[i];
			_div += "<a href=\"javascript:void(0);\" onClick=\"showImageForUrl(\'" + imgUrl + "\');\" style=\"text-decoration:none;\">";
			_div += "<div class=\"surveyDataBottom\" style=\"text-align: left; color:blue;\">";
			_div += "<span class=\"surveyPop\">"+ remoteName + "</span>  查看";
			_div += "</div>";
			_div += "</a>";
		}
		$('#detailsContent').append(_div);
	}

	function getAttr(attrIds) {
		$.ajax({
			url : "http://117.21.209.17:8080/OfficeAutomationPlatform/Spring/json/attach/attachment/getAttachList",
			type:'get',
			data:{
				'ids' : attrIds,
			},
			dataType:'jsonp',
			success:function(result){
				if (result.errorCode == 0) {
					var list = result.value.resultList;
					if (!list) {
						layer.msg("网络异常");
						return;
					}
					$('#detailsContent').empty();
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var _div = "";
						_div += "<a href=\"javascript:void(0);\" onClick=\"showImages(" + info.attachmentId + ");\" style=\"text-decoration:none;\">";
						_div += "<div class=\"surveyDataBottom\" style=\"text-align: left; color:blue;\">";
						_div += "<span class=\"surveyPop\">"+ info.remoteName + "</span>  查看";
						_div += "</div>";
						_div += "</a>";
						$('#detailsContent').append(_div);
					}
				} else {
					layer.msg("网络异常");
				}
			},
			error:function(){
				layer.msg("网络异常!");
			}
		});
	}

	//加载更多数据
	function getMore() {
		var pageNum = Number($("#pageNum").val()) + 1;
		$("#pageNum").val(pageNum);
		$("#getMore").remove();
		var id = '${id}';
		getComment(id, pageNum);
	}

	function showImageForUrl(imageUrl) {
		$("#img_src").attr('src', imageUrl);
		layer.open({
			type: 1,
			title: false,
			closeBtn: 0,
			area: ['80%', '80%'],
			skin: 'layui-layer-nobg', //没有背景色
			shadeClose: true,
			content: $('#show_img')
		});
	}

	function showImages(attachmentId, remoteName) {
		$.post("${ctx}/login/json/attachment/selectByAttachmentId",
				"attachmentId="+attachmentId, 
				function(data) {
					var obj = JSON.parse(data);
					if (obj.attachment) {
						var attachment = obj.attachment;
						if (attachment.imageUrlList) {
							var list = attachment.imageUrlList;
							var length = list.length;
							var _div = "";
							for (var i = 0; i < length; i++) {
								var info = list[i];
								if (i == 0) {
									_div += '<a href=\"' + info + '\" data-lightbox=\"lightbox\" >';
									_div += '<div class=\"surveyDataBottom\" style=\"text-align: left; color:blue;\">';
									_div += '<span class=\"surveyPop\">'+ remoteName + '</span>  查看';
									_div += '</div>';
									_div += '</a>';
								} else {
									_div += '<a href=\"' + info + '\" data-lightbox=\"lightbox\" ></a>';
								}
							}
							$('#detailsContent').append(_div);
							return;
						}
					}
					$('#detailsContent').remove();
			} ,"json" );
	}
</script>
</head>
<body>
	<!-- 数据页数 -->
	<input type="hidden" id="pageNum" name="pageNum" value="1">

	<div id="show_img" class="hide" ><img src="" id="img_src" style="width:100%;height:100%;"></div>

	<div class="details_main">
		<div class="details_content">
			<div class="detailsDataBar" style="padding:10px 15px;">
				<div class="projectTitle"></div>
				<div class="projectData">
					<div class="projectDataLeft">发布部门：</div>
					<div class="projectDataRight" id="authorwhere"></div>
					<div class="projectDataLeft">发布用户：</div>
					<div class="projectDataRight" id="authorvalue"></div>
					<div class="projectDataLeft">发布时间：</div>
					<div class="projectDataRight" id="timevalue"></div>
					<div class="projectDataLeft">文件类型：</div>
					<div class="projectDataRight" id="documentType"></div>
					</div>
				<div style="clear:both;"></div>
			</div>
			
			<div id="detailsContent" class="detailsDataBar" style="padding:10px 15px;">
			</div>
			
			<div class="detailsDataBar detailsCont" style="padding:10px 15px;">
				${projectDeclareInfo.declareText}
			</div>
			<div class="seeMore" onclick="" style="padding: 20px;"><!--展开查看更多
				<img src="${ctx}/static/weixin/images/projectDeclare/packup0.png" width="12px;" height="12px;"/>-->
				<div style="text-align: left; color:black;" id="moreContent"></div>
			</div>
			
			<div class="info_top" style="display:none">
				<div class="info_title">评论内容</div>
			</div>
			<div id="noComment" class="detailsDataBar" style="background-color: #ffffff;display:none;">
					<div style="width:100%;overflow:hidden;">
						<div id="publicityBar">
						</div>
						<div style="text-align: center;">
							<span class="renovateTitle">暂无数据</span>
						</div>
					</div>
				</div>
				<div class="detailsDataBar detailsCont" style="width:100%;display:none;">
					<textarea id="commentText" type="text" style="margin-left:2%; margin-top:5%; width: 96%;border-color:#b0b0b0; padding:5px 0; border:1px solid #7E7E7E; text-indent:3px; font: 14px/1.5 arial,"黑体";"></textarea>
					<input type="checkbox" id="isAnonymous" style="margin-left:2%;"/>是否匿名<br />
					<input type="submit" value="提交" onClick="sumbitComment();" style="margin-right:2%; margin-bottom:3%; margin-top:1%; float:right;" />
					<div style="clear:both;"></div>
				</div>
				<!-- <div id="commondlist" class="detailsDataBar detailsCont" style="width:100%">
				</div> -->
				
				<div class="details_comment" style="margin-top: 10px;display:none;">
					<!-- 评论列表 -->
					<div class="details_comTitle">
						相关评论
						<div style="float: right; font-size: 12px; color: #9c9c9c;padding-top:3px;">
							<img src="${ctx}/static/image/activity/comment.png" width="20px;" height="16px;"> <span id="commentSize"></span>
						</div>
					</div>
	
					<div id="commondlist"></div>
					<div style="clear: both;"></div>
					<!--<div>
						<a class="renovate" style="border: 0; display: block;"> 
							<span id="getmoreComment" onClick="getmoreComment();" class="renovateTitle" style="color: #FD7676; border: 1px solid #FD7676; margin: 0 7px 5px 0; padding: 3px 7px;">展开更多评论</span>
							<span id="commentSpace" style="padding: 0 5px 0px 5px"></span> 
							<span id="hidemoreComment" onClick="hidemoreComment();" class="renovateTitle" style="color: #FD7676; border: 1px solid #FD7676; margin: 0 7px 5px 0; padding: 3px 7px;">收起更多评论</span>
						</a>
					</div>-->
				</div>
				
				<!-- 小火箭 -->
				<div id="tbox" onclick="location.href='#top';"></div>
				<div class="fixed_bottom">
					<a id="back_a" href="">
						<img src="${ctx}/static/weixin/images/projectDeclare/return.png" width="20px;" height="20px;" class="returnBtn"/>
					</a>
					<div style="clear:both;"></div>
				</div>
		</div>
	</div>
</body>
</html>