<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我发布的</title>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<link href="${ctx}/static/weixin/css/experienceSharing/experienceSharing.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
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

		getList(1);
		
		if(${!empty message}){
			layer.msg("${message}")
		}
	})

	/* 收起下拉列表 */
	function hideAllDropdown() {
		$(".hidebg").hide();
		$(".search").removeClass("colorDeep");
		$("#dropdown").slideUp("fast");
	}

	/* 异步获取经验列表 */
	page = 1;
	function getList(pageNum) {
		$.ajax({
					url : "${ctx}/expShare/json/list",
					type : "get",
					data : {
						"type" : 1,
						"pageNum" : pageNum,
						"pageSize" : 5
					},
					dataType : "json",
					success : function(result) {
						if (pageNum == 1) {
							$("#shareList").empty();
						}
						if (result.code == -1 || result.code == -2 || result.code==2) {
							$("#proList").show();
							if(result.code == -2){
								layer.msg(result.msg);
								setTimeout(function() {
									window.location.href=("${ctx}/experienceSharing/weixin/myShare/add");
								}, 1000);
							}
						} else {
							$("#proList").hide();
							var list = result.value;
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = "";
								_div += "	<a href=\'${ctx}/experienceSharing/weixin/detail/";
								_div += info.expId;
								_div += "	\'>";
								_div += "	<div class=\'shareCont\'>";
								_div += "    <div class=\'shareContTop clearfix\'>";
								_div += "      <img src=\'";
								_div += info.expImage == null ? "${ctx}/static/weixin/images/experienceSharing/banner_1.jpg"
										: info.expImage;
								_div += "\' width=\'125\' height=\'69\' class=\'shareContTopLeft\'>";
								_div += "      <div class=\'shareContTopRight\'>";
								_div += "        <div class=\'shareContTitle\'>";
								_div += info.expTitle == null ? "&nbsp;"
										: info.expTitle;
								_div += "		 </div>";
								_div += "        <div class=\'shareContPosition\'>";
								_div += "          <div>";
								_div += "            <img src=\'${ctx}/static/weixin/images/experienceSharing/enterCount.png\' width=\'10\' height=\'10\'>";
								_div += "            <span>";
								_div += info.expUnit == null ? "&nbsp;"
										: info.expUnit;
								_div += "			 </span></div>";
								_div += "          <div>";
								_div += "            <img src=\'${ctx}/static/weixin/images/experienceSharing/location.png\' width=\'10\' height=\'10\'>";
								_div += "            <span>";
								_div += info.provinceName == null ? "&nbsp;"
										: info.provinceName;
								_div += "&nbsp;";
								_div += info.areaName == null ? "&nbsp;"
										: info.areaName;
								_div += "			 </span></div>";
								_div += "        </div>";
								_div += "      </div>";
								_div += "    </div>";
								_div += "    <div class=\'shareContBottom clearfix\'>";
								if (info.status != 2) {
									_div += "      <div style=\'float: left;\'>";
									_div += "        <img src=\'${ctx}/static/weixin/images/experienceSharing/eye.png\' width=\'10\' height=\'10\'>";
									_div += "        <span>";
									_div += info.browseCount == null ? "0"
											: info.browseCount;
									_div += "		 浏览</span></div>";
								}
								_div += "      <div style=\'float: right; width: 72px;\'>";
								_div += "        <img src=\'${ctx}/static/weixin/images/experienceSharing/talk.png\' width=\'10\' height=\'10\'>";
								_div += "        <span>";
								_div += info.commentCount == null ? "0"
										: info.commentCount;
								_div += "		 评论</span></div>";
								_div += "    </div>";
								if(info.isTop==1){
									_div += "    <img src=\'${ctx}/static/weixin/images/experienceSharing/recommend.png\' width=\'45\' height=\'45\' class=\'recommendItem\'>";
								}
								_div += "	 <div class=\'deleteOper clearfix\'></a>";
								if(info.status==2){
									_div += "		<div class=\'stateBlue\'>审核中</div>";
								}else if(info.status==1){
									_div += "		<div class=\'stateGreen\'>已发布</div>";
								}else if(info.status==0){
									_div += "		<div class=\'stateGray\'>不通过</div>";
								}else{
									_div += "		<div class=\'stateGray\'>草稿</div>";
								}
								_div += "	 <a href=\'javascript:deleteExp(\""+info.expId+"\");\'>X&nbsp;删除</a>";
								_div += "	 </div>";
								_div += "</div>";
								$("#shareList").append(_div);
							}
						}
						if (result.code == 1) {
							//加载更多
							$("#getMore").show();
						} else {
							$("#getMore").hide();
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						layer.msg("网络异常");
					}
				});
	}

	/* 加载更多 */
	function getMore() {
		page++;
		getList(page);
	}
	
	/* 删除分享 */
	function deleteExp(expId){
		var confirmIndex = layer.confirm("确定删除吗?",function(index, layero){
			layer.close(confirmIndex);
			window.location.href="${ctx}/experienceSharing/weixin/delete?expId="+expId
		});
	}
</script>
</head>
<body>
	<div class="share_main">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/experienceSharing/mySend.png" width="20px;" height="20px;"> <span>我发布的</span>
		</div>

		<div class="share_content">
			<div style="margin-top: 60px;"></div>

			<div id="shareList"></div>
			<div style="text-align: center;">
				<span id="proList" class="renovateTitle">暂无数据</span>
			</div>
			
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
			
		</div>
		
		<div id="tbox" onclick="location.href='#top';"></div>
		
		<div class="navigationBar">
			<ul>
				</a></li>
				<li><a href="${ctx}/auth/page/mobile/weixin/experienceSharing/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/experienceSharing/exp.png" width="20" height="20" />
					</div>
					<div class="navTitle">园区动态</div>
				</a></li>
				<li><a href="${ctx}/experienceSharing/weixin/add">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/experienceSharing/share.png" width="20" height="20" />
					</div>
					<div class="navTitle">分享动态</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/experienceSharing/mored.png" width="20" height="20" />
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -43x;">
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/experienceSharing/weixin/myShare">我发布的</a></li>
					<%-- <li><a href="${ctx}/auth/page/mobile/weixin/personalInfoBingding">个人中心</a></li>
				 --%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>