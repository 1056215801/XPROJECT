<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>已采纳意见</title>
<link href="${ctx}/static/weixin/css/suggest/feedback.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<script>
$(function(){
	$(".search").click(function(){ 
		var div = $("#dropdown"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
			$(".search").addClass("colorDeep");
		}else{ 
	  		div.slideUp("fast"); 
			$(".search").removeClass("colorDeep");
		} 
	}); 
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
	$(".feedOper").click(function(){
		if($(this).parent().prev().children().eq(1).css("display")=='none'){
			$(this).parent().prev().children().eq(1).css("display","block");
			$(this).text("收起");
		}else{
			$(this).parent().prev().children().eq(1).css("display","none");
			$(this).text("展开");
		}
	});
	$('#pageNum').val(1);
	getListData(1);
})

function getListData(pageNum) {
	$.ajax({
		url : "${ctx}/projectSuggestInfo/json/list",
		type : "get",
		data : {
			"pageNum" : pageNum,
			"pageSize" : '5',
			"type" : 0,
		},
		dataType : "json",
		success : function(result) {
			if (pageNum == 1) {
				$(".feedlist").empty();
			}
			$("#surveyList").empty();
			$('#count_star').text(result.msg);

			if (result.code == -1) {
				layer.msg(result.errorMsg);
			} else if (result.code == 2) {
				if (pageNum == 1) {
					$(".feed_content").empty();
					$(".feedEmpty").show();
				}
				layer.msg("暂无更多数据");
			} else {
				var list = result.value;
				if(list.length==0){
					layer.msg("暂无更多数据");
					return;
				} else {
					$(".feedEmpty").hide();
				}
				for (var i = 0; i < list.length; i++) {
					var info = list[i];
					var div = "";
					div += '<div class=\"feedCont\">';
					div += '<div class=\"feedContTop clearfix\">';
					if (info.accountImage && info.accountImage != -1) {
						div += ('<img src=\"' + info.accountImage + '\" width=\"30\" height=\"30\" class=\"feedContTopImage\">');
					} else {
						div += '<img src=\"${ctx}/static/weixin/images/suggest/headPortrait.png\" width=\"30\" height=\"30\" class=\"feedContTopImage\">';
					}
					div += ('<div class=\"feedContTopName\">' + info.accountName + '</div>');
					div += ('<div class="feedContTopTime">' + getTime(info.createTime) + '</div>');
					div += '</div>';
					div += '<div class=\"feedContMid clearfix\">';
					div += '<div style=\"padding:0 10px;\">';
					div += ('<div style=\"font-weight:bold;\">' + info.suggestTitle + '</div>');
					div += ('<div>' + info.suggestContent + '</div>');
					div += '</div>';
					div += '<div class=\"feedAttach clearfix\">';
					div += '<div class=\"attachBar\" style=\"display:none\">';
					div += '<img src=\"${ctx}/static/weixin/images/suggest/file/jpg86.png\" width=\"60\" height=\"60\" class=\"attachImage\">';
					div += '<div class=\"attachName\">界面截图.jpg</div>';
					div += '</div>';
					div += '<div class=\"attachBar\" style=\"display:none\">';
					div += '<img src=\"${ctx}/static/weixin/images/suggest/file/icon_word.png\" width=\"60\" height=\"60\" class=\"attachImage\">';
					div += '<div class=\"attachName\">文档全省工业说....doc</div>';
					div += '</div>';
					div += '</div>';
					div += '</div>';
					div += '<div class=\"feedContBot clearfix\">';
					div += '<div class=\"feedOper\" style=\"display:none\">收起</div>';
					div += ('<div class=\"feedLabel\">奖励话费' + info.rewardContent + '</div>');
					div += '</div>';
					div += '</div>';
					$(".feedlist").append(div);
				}
				if (list.length == 5) {
					//加载更多
					var moreStr = "";
					moreStr += "<div id=\"getMore\" style=\"margin:0 1.6% 10px;display:block\">";
					moreStr += "<a href=\"javascript:void(0);\" onclick=\"getMore();\" class=\"renovate\" style=\"text-decoration: none;\">";
					moreStr += "<span class=\"renovateTitle\" style=\"color: #120F0F;\">加载更多</span>";
					moreStr += "</a>";
					moreStr += "</div>";
					$(moreStr).appendTo($("#surveyList"));
				}
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("网络异常");
		} 
	});
}

//加载更多数据
function getMore() {
	var pageNum = Number($("#pageNum").val()) + 1;
	$("#pageNum").val(pageNum);
	$("#getMore").remove();
	getListData(pageNum);
}

//long类型时间转换
function getTime(time) {
	var date = new Date(time);
	Y = date.getFullYear() + '-';
	M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
			.getMonth() + 1)
			+ '-';
	D = (date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate())
			+ ' ';
	h = (date.getHours() < 10 ? ('0' + date.getHours()) : date.getHours())
			+ ':';
	m = (date.getMinutes() < 10 ? ('0' + date.getMinutes()) : date
			.getMinutes())
			+ ':';
	s = (date.getSeconds() < 10 ? ('0' + date.getSeconds()) : date
			.getSeconds());
	return (Y + M + D + h + m + s);
}
</script>
</head>

<body>
<!-- 数据页数 -->
<input type="hidden" id="pageNum" name="pageNum" value="1">
<div class="feed_main">
	<div class="feed_content">
		<div style="margin-top:10px;"></div>
		<div class="feedCont" style="padding:5px 7px;">
			<img src="${ctx}/static/weixin/images/suggest/hasAdopted.png" width="20" height="20" class="feedContImage">
			<span class="feedContStatistics">共有&nbsp;<font style="color:#f14241;" id="count_star">23</font>&nbsp;条&nbsp;已采纳意见</span>
		</div>
		<div class="feedlist">
		</div>
		<div id="surveyList"></div>
	</div>
	<div class="feedEmpty" style="margin-top:200px;text-align:center;display:none;"><font style="text-align:center;color:#999999;font-size:18px;">暂无更多信息</font></div>
	<!-- 小火箭 -->
	<div id="tbox" onclick="location.href='#top';"></div>
	<div class="navigationBar">
		<ul>
			<li>
				<a href="${ctx}/projectSuggestInfo/weixin/feedback">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/suggest/feedback.png" width="20" height="20" style="margin-top: 6%;"/>
				</div>
				<div class="navTitle">意见反馈</div>
				</a>
			</li>
			<li>
				<a href="${ctx}/projectSuggestInfo/weixin/hasAdopt">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/suggest/hasAdopted.png" width="20" height="20" style="margin-top: 6%;"/>
				</div>
				<div class="navTitle">已采纳意见</div>
				</a>
			</li>
			<li>
				<a href="${ctx}/projectSuggestInfo/weixin/myOpinion">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/suggest/myOpinion.png" width="20" height="20" style="margin-top: 6%;"/>
				</div>
				<div class="navTitle">我的意见</div>
				</a>
			</li>
			<li>
				<a href="javascript:;" class="viewMore">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/suggest/more.png" width="20" height="20" style="margin-top: 6%;"/>
				</div>
				<div class="navTitle">更多服务</div>
				</a>
			</li>
		</ul>
		<div id="viewMore">
			<ul style="margin-top: -95px;">
				<li style="border-bottom: 1px solid #E6E6E6;"><a href="javascript:;">我发布的</a></li>
				<li><a href="javascript:;">个人中心</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>