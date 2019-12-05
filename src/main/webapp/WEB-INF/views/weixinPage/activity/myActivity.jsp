<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的活动</title>
<link href="${ctx}/static/weixin/css/activity/myActivity.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<style>
body .layui-layer-tl_black .layui-layer-title {
	background-color: #F04444;
	color: #fff;
}

body .layui-layer-tl_black .layui-layer-btn0 {
	background-color: #F04444;
	color: #fff;
	width: 100%;
	border: 0;
	padding: 5px 0;
	text-align: center;
	margin: 0;
}
</style>
<script>
	$(function() {
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
	})
	$(".titleName ul li").each(
			function() {
				var index = $(this).index();
				$(".titleName ul li").eq(0).addClass("titleClick");
				$(this).click(
						function() {
							$(this).addClass("titleClick").siblings()
									.removeClass("titleClick");
							$(".titleItem>div").eq(index).stop(true).show()
									.siblings().stop(true).hide();
						});
			});

	$(".titName ul li").each(
			function() {
				var index = $(this).index();
				$(".titName ul li").eq(0).addClass("titClick");
				$(this).click(
						function() {
							$(this).addClass("titClick").siblings()
									.removeClass("titClick");
							$(".titleItem>div").eq(index).stop(true).show()
									.siblings().stop(true).hide();
						});
			});
	function userNotice() {
		window.location.href = "messageNotice.html";
	}
</script>
<script type="text/javascript">
	$(function() {
		getActivityList(1, 3, "", "");
		$("#type").val(1);
	});
	//异步加载列表
	function getActivityList(pageNum, type, activityName, tags) {
		$
				.ajax({
					url : "${ctx}/projectActivity/json/activityList",
					type : "get",
					data : {
						"pageNum" : pageNum,
						"type" : type,
						"activityName" : activityName,
						"activityTags" : tags
					},
					dataType : "json",
					success : function(result) {
						if (result.code == -1 || result.code == -2) {
							$("#proList").show();
							if(result.code == -2){
								layer.msg(result.msg);
								setTimeout(function() {
									window.location.href=("myActivity/add");
								}, 1000);
							}
						} else if (result.code == 2) {
							$("#proList").show();
							$("#getMore").hide();
						} else {
							$("#proList").hide();
							var list = result.value;
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = '<div class="activity_cont" style="cursor:pointer;position:relative;" onclick="activityDetails(\''
										+ info.activityId
										+ '\')" ><div class="activity_title">'
										+ info.activityName
										+ '</div>'
										+ '<div class="activity_time">'
										+ info.start
										+ '至'
										+ info.end
										+ '</div>'
										+ '<img src='
										+ info.activityImage
										+ ' width="100%;" height="140px;"/>'

										+ '<div class="activity-tagBox">'
										+ '<i class="icon-bg"></i>' + '<ul>';
								var tag = info.activityTags.split(",");
								if (tag != "" && tag != null) {
									for (var j = 0; j < tag.length; j++) {
										if (tag[j] != "" && tag[j] != null) {
											_div += '<li>' + tag[j] + '</li>';
										}
									}
								}
								_div += '</ul>'
										+ '<div class="tag-bg"></div>'
										+ '</div>'

										+ '<div class="activityCont_dataBar" style="margin-top:2%;">'
										+ '<div style="float:left;"><img src="${ctx}/static/weixin/images/activity/applyname.png" width="20px;" height="20px;" style = "margin-right: 10px;"></div>'
										+ '已有<span style="color:#F14241;">'
										+ info.enterCount + '</span>人报名';
								if (type == 2) {
									if (info.status == 1) {
										_div += '<div class="registrationIn" style = "text-align:center; background-color: #3A3D4C;"'
												+ ' onclick="event.cancelBubble = true;notice(\''
												+ info.activityId
												+ '\',\''
												+ info.activityName
												+ '\')">用户通知</div>'
												+ '<div style="float:right;">&nbsp;</div>';
										_div += '<div style = "padding:0 22px;float:right;border:0;text-align:center;color:#F14241;">报名中</div>';
									} else {
										_div += '<div class="registrationIn hasEnded" style = "padding:0 22px;">已结束</div>';
									}
								} else {
									if (info.status == 1) {
										_div += '<div class="registrationIn" style = "text-align:center;" onclick="event.cancelBubble = true;exitActivity(\''
												+ info.activityId
												+ '\');">取消报名</div>';
									} else {
										_div += '<div class="registrationIn hasEnded" style = "padding:0 22px;">已结束</div>';
									}
								}

								_div += '<div style="clear:both;"></div></div>';
								$(".activityBar").append(_div);
							}
							$(".activityBar").append(
									'<div style="clear:both;"></div>');
							if (result.code == 1) {
								$("#getMore").show();
							} else {
								$("#getMore").hide();
							}
							$("#activityName").val(result.msg);
						}

					},
					error : function() {
						layer.alert("系统异常");
					}
				});
	}

	function queryBySearchKey(obj) {
		if ($(obj).hasClass("optionBtn")) {
			if ($(obj).hasClass("selected")) {
				$(obj).removeClass("selected");
			} else {
				$(obj).addClass("selected");
			}
		}
		$(".activityBar").empty();
		getActivityList(1, $("#type").val(), $("#activityName").val(),
				getTags());
	}

	function queryByAccount(type) {
		$('#select1').css("color", type == 2 ? "#FFF" : "#F14241");
		$('#select1').css("background-color", type == 2 ? "#C42927" : "#FFF");

		$('#select2').css("color", type == 3 ? "#FFF" : "#F14241");
		$('#select2').css("background-color", type == 3 ? "#C42927" : "#FFF");

		$("#type").val(type);
		$("#pageNum").val(1);
		$(".activityBar").empty();
		$(".dropdownContent .optionBtn").each(function() {
			if ($(this).hasClass("selected")) {
				$(this).removeClass("selected");
			}
		});
		$("#activityName").val("");
		getActivityList(1, type, $("#activityName").val(), getTags());
	}

	function getMore() {
		var pageNum = Number($("#pageNum").val()) + 1;
		$("#pageNum").val(pageNum);
		getActivityList(pageNum, $("#type").val(), $("#activityName").val(),
				getTags());
	}

	function getTags() {
		var tags = "";
		$(".dropdownContent .optionBtn").each(function() {
			if ($(this).hasClass("selected")) {
				tags += ($(this).text() + ",");
			}
		});
		return tags;
	}
	function activityDetails(activityId) {
		// 		$("#activityId").val(activityId);
		// 		$("#viewform").submit();
		window.location.href = '${ctx}/projectActivity/weixin/detail/'
				+ activityId;
	}

	function notice(activityId, activityName) {
		$(".activityName").text(activityName);
		$("#name").val(activityName);
		$("#id").val(id);
		noticeType(1);
		layer.open({
			type : 1,
			title : false,
			shadeClose : true,
			shade : [ 0 ],
			area : [ '90%', '250px' ],
			closeBtn : 0,
			content : $('#messageNotice')
		});
	}

	function noticeType(type) {
		$('#choose1').css("color", type == 1 ? "#FFF" : "#808080");
		$('#choose1').css("background-color", type == 1 ? "#F14241" : "#FFF");

		$('#choose2').css("color", type == 2 ? "#FFF" : "#808080");
		$('#choose2').css("background-color", type == 2 ? "#F14241" : "#FFF");

		$("#noticeType").val(type);
		var activityName = $("#name").val();
		if (type == 1) {
			$(".noticeInput").children(":first").val(
					"亲，你报名参加的[" + activityName + "]活动有变更，变更内容为XXXX");
		} else {
			$(".noticeInput").children(":first").val(
					"亲，你报名参加的[" + activityName + "]活动已取消");
		}
	}

	function sendBtn() {
		var notice = $(".noticeInput").children(":first").val();
		if (notice == "" || notice == null) {
			layer.alert("变更内容不能为空");
		} else {
			$.ajax({
				url : "${ctx}/projectActivity/json/noticeSave",
				type : "get",
				data : {
					"type" : function getType() {
						return $("#type").val();
					},
					"activityId" : function getId() {
						return $("#id").val();
					},
					"msgContent" : notice,
					"msgType" : 2
				},

				dataType : "json",
				success : function(result) {
					layer.alert(result.msg);
				},
				error : function() {
					layer.alert("系统异常");
				}
			});
		}
	}
	function returnBtn() {
		layer.closeAll();
	}

	/* 取消报名 */
	function exitActivity(id) {
		$.ajax({
			url : "${ctx}/projectActivity/json/enterSave",
			type : "get",
			data : {
				"activityId" : id
			},
			dataType : "json",
			success : function(result) {
				if (result.code == 2) {
					enterNotice();
					$(".activityBar").empty();
					getActivityList(1, 3, "", "");
				}
			},
			error : function() {
				layer.alert("系统异常");
			}
		});
	}

	function enterNotice() {
		layer.open({
			type : 1,
			title : '提示',
			skin : 'layui-layer-tl_black',
			shadeClose : true,
			area : [ '250px', '120px' ],
			closeBtn : 1,
			time : '3000',
			content : $('#successLayer'),
			success : function(layero, index) {
				$('#seconds').html(3);
				setTimeout(function() {
					$('#seconds').html(2);
					setTimeout(function() {
						$('#seconds').html(1);
					}, 1000);
				}, 1000);
			}
		});
	}
</script>
</head>

<body>
	<div class="myActivity_main">
		<form action="${ctx}/projectActivity/details" method="post" id="viewform">
			<input type="hidden" id="activityId" name="activityId" />
		</form>
		<input type="hidden" id="noticeType" value="1" /> <input type="hidden" id="pageNum" value="1" /> <input type="hidden" id="type"
			value="" />
		<div class="activity_content">
			<div class="titleSwitch">
				<div class="titleName">
					<ul>
						<li id="select1" style="border-radius: 15px 0 0 15px; color: #F14241; background-color: #FFF;" onclick="queryByAccount('2')">我发布的</li>
						<li id="select2" style="border-radius: 0 15px 15px 0; background-color: #C42927; color: #FFF;" onclick="queryByAccount('3')">我参与的</li>
					</ul>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div style="margin-top: 55px;"></div>
			<div class="activityBar"></div>
			
			<div style="text-align: center;">
				<span id="proList" class="renovateTitle">暂无数据</span>
			</div>
			
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
			
			
			<div id="tbox" hidden>
				<a id="gotop" href="#top"></a>
			</div>
		</div>

		<div id="messageNotice" style="display: none;">
			<input type="hidden" id="noticeType" value="1" /> <input type="hidden" id="name" /> <input type="hidden" id="id" />
			<div style="padding: 5px 15px;">
				给所有参与“<span class="activityName"></span>”活动的用户发送如下消息：
			</div>
			<div style="background-color: #fff; padding: 0 10px;">
				<div class="titName">
					<ul>
						<li id="choose1" onclick="noticeType('1')"
							style="float: left; border: solid 1px #A8A8A8; margin-right: 10px; margin-bottom: 10px; padding: 0 5px;">活动变更</li>
						<li id="choose2" onclick="noticeType('2')" style="float: left; border: solid 1px #A8A8A8; padding: 0 5px;">活动取消</li>
					</ul>
					<div style="clear: both;"></div>
				</div>
				<div class="titItem">
					<div class="noticeInput" style="text-align: center;">
						<textarea rows="4" style="width: 98%;">亲，你报名参加的活动有变更，变更内容为XXXX</textarea>
					</div>
				</div>
			</div>
			<div style="padding: 10px 5px;">
				<input type="button" value="关闭" onclick="returnBtn()" class="returnBtn"
					style="cursor: pointer; margin-left: 48%; width: 24%; border: 0;"> <input type="button" value="发送" onclick="sendBtn()"
					class="sendBtn" style="cursor: pointer; width: 24%; color: #FFF; background-color: #F14241; border: 0;">
				<div style="clear: both;"></div>
			</div>
		</div>

		<!-- 取消报名成功提示框 -->
		<div id="successLayer" style="display: none; text-align: center; padding: 10px 15px;">
			<div style="font-size: 12px;">
				<div id="signUpMsg">取消报名成功！</div>
				<div>
					<span id="seconds">3</span>秒后自动关闭
				</div>
			</div>
		</div>

		<div class="navigationBar" style="z-index:1000;">
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
						<img src="${ctx}/static/weixin/images/activity/publicactivityed.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">发布活动</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/more_red.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
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
	</div>
</body>
</html>
