<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>活动报名</title>
<link href="${ctx}/static/weixin/css/activity/activityRegistration.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/flickerplate.css" rel="stylesheet">
<script src="${ctx}/static/weixin/js/modernizr-custom-v2.7.1.js"></script>
<script src="${ctx}/static/weixin/js/jquery-finger-v0.1.0.js"></script>
<script src="${ctx}/static/weixin/js/flickerplate.js"></script>
<script>
	$(function() {
		$(".search").click(function() {
			var div = $("#dropdown");
			if (div.css("display") == "none") {
				div.slideDown("fast");
				$(".search").addClass("colorDeep");
			} else {
				div.slideUp("fast");
				$(".search").removeClass("colorDeep");
			}
		});
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
		$('.flicker-example').flicker();
		status = [0,1];
		getActivityList(1, 1, "", "", status);
		$("#type").val(1);
	})

	function getActivityList(pageNum, type, activityName, tags ,status) {
		$.ajax({
					url : "${ctx}/projectActivity/json/activityList",
					type : "get",
					data : {
						"pageNum" : pageNum,
						"type" : type,
						"activityName" : activityName,
						"activityTags" : tags,
						"statusArray" : status.toString()
					},
					dataType : "json",
					success : function(result) {
						var arr = "";
						if (result.code == -1) {
							layer.msg(result.msg);
						} else if (result.code == 2) {
							$(".activityBar")
									.append(
											'<span class="renovateTitle"  style = "margin-left: 35%;margin-top: 20%;">暂无更多信息</span>');
							$("#getMore").hide();
						} else {
							var list = result.value;
							arr = result.msg.split(",");
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = "";
								 _div = '<div class="activity_cont" onclick="activityDetails(\''
										+ info.activityId
										+ '\')" style="cursor:pointer;position:relative;"><div class="activity_title">';
										
								 
									+'<div class="tag-bg"></div>'
									+'</div>'
									+'<div class="activityCont_title">';
									
									if(info.activityName.length<=14){
										_div += '<div class="activityCont_text">'+info.activityName+'</div>';
									}else{
										_div += '<div class="activityCont_text" title="'+info.activityName+'">'+info.activityName.substring(0,14)+'...</div>';
									}
										_div += '</div>'
										+ '<div class="activity_time">'
										+ info.start
										+ '至'
										+ info.end
										+ '</div>'
										+ '<img src='
										+ info.activityImage
										+ ' width="100%;" height="140px;" style="display:block;"/>'

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
										+ '<div style="float:left;"><img src="${ctx}/static/weixin/images/activity/applyname.png" width="20px;" height="20px;"  style = "margin-right: 10px;" ></div>'
										+ '已有<span style="color:#F14241;">'
										+ info.enterCount + '</span>人报名';
								if (info.status == 1) {
									_div += '<div class="registrationIn" style = "text-align:center;">报名中</div>';
								} else {
									_div += '<div class="registrationIn hasEnded"><div style="margin-top:2px;">已结束</div></div>';
								}
								_div += '<div style="clear:both;"></div>'
								+ '<div style="float:left;"><img src="/XProject/static/weixin/images/activity/location.png" width="20px;" height="20px;"  style = "margin-right: 10px;"></div>'
								+ info.activityLocation
								+ '</div>'+'<div style="clear:both;"></div></div>';
								$(".activityBar").append(_div);
							}
							$(".activityBar").append(
									'<div style="clear:both;"></div>');
							
							$(".dropdownContent .optionBtn").each(function(){
						        if($(this).hasClass("selected")){
						        	if($(this).text().indexOf("(")!=-1){
						        		$(this).text($(this).text().substring(0,$(this).text().indexOf("("))+"("+arr[1]+")");
					            	}else{
					            		$(this).text($(this).text()+"("+arr[1]+")");
					            	}
						        }
						   	});
							if (result.code == 1) {
								$("#getMore").show();
							} else {
								$("#getMore").hide();
								$("#activityName").val(arr[0]);
							}
						}

					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
						alert(XMLHttpRequest.readyState);
						alert(textStatus);
					},
				});
	}

	/* 类型搜索 */
	function queryBySearchKey(obj,kind){
		$("#pageNum").val(1);
		if($(obj).hasClass("optionBtn")){
			if($(obj).hasClass("selected")){
				$(obj).removeClass("selected");
				$(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
			}else{
				$(".dropdownContent .optionBtn").each(function(){
		            if($(this).hasClass("selected")){
		            	if($(this).text().indexOf("(")!=-1){
		            		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
		            	}
		            	$(this).removeClass("selected");
		            }
		        }); 
				$(obj).addClass("selected");
			}
		}
		$(".activityBar").empty();	
		getActivityList(1,$("#type").val(),$("#activityName").val(),getTags(), status);		
	}

	function getMore() {
		var pageNum = Number($("#pageNum").val())+1;
		$("#pageNum").val(pageNum);
		getActivityList(pageNum,$("#type").val(),$("#activityName").val(),getTags(), status);
	}

	function getTags() {
		var tags = "";
		$(".dropdownContent .optionBtn").each(function(){
	        if($(this).hasClass("selected")){
	        	if($(this).text().indexOf("(")!=-1){
	        		tags += ($(this).text().substring(0,$(this).text().indexOf("("))+",");
            	}else{
            		tags += ($(this).text()+",");
            	}
	        }
	   	});  
		if(tags=="全部,"||tags==""){
			tags = "";
			$(".dropdownContent .optionBtn").each(function(){
				if($(this).text().indexOf("(")!=-1){
	        		tags += ($(this).text().substring(0,$(this).text().indexOf("("))+",");
            	}else{
            		tags += ($(this).text()+",");
            	}
	        }); 			
		}
		return tags;
		
		return tags;
	}
	function activityDetails(activityId) {
		window.location.href = '${ctx}/projectActivity/weixin/detail/'
				+ activityId;
	}

	/* 关键字搜索 */
	function queryByKey(key) {
		$(".activityBar").empty();
		getActivityList(1, 1, key, getTags(), status);
	} 
	
	/* 类型切换 */
	function borClick(btn,index) {
		if(index==1){//进行中
			status = [1];
		}else if(index==2){//已结束
			status = [0];
		}else{//进行中+已结束
			status = [0,1];
		}
		$(".project_oper").each(function(index,item){
			$(item).removeClass("selected");
		});
		$(btn).addClass("selected");

		$(".activityBar").empty();
		$("#pageNum").val(1);
		getActivityList(1,$("#type").val(),$("#activityName").val(),getTags(), status);		
 	} 
	
// 	function queryByAccount(type){
// 		$("#type").val(type);
// 		$("#pageNum").val(1);
// 		$(".activityBar").empty();
// 		$(".dropdownContent .optionBtn").each(function(){
//             if($(this).hasClass("selected")){
//             	if($(this).text().indexOf("(")!=-1){
//             		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
//             	}
//             	$(this).removeClass("selected");            		
//             }
//         });
// 		$("#all").addClass("selected");
// 		$("#activityName").val("");
// 		getActivityList(1,type,$("#activityName").val(),getTags(), $("#status").val());
// 	}
</script>
</head>

<body>
	<div class="activity_main">
		<form action="${ctx}/projectActivity/details" method="post" id="viewform">
			<input type="hidden" id="activityId" name="activityId" />
		</form>
		<input type="hidden" id="pageNum" value="1"/>
	   	<input type="hidden" id="type" value=""/>
		<div class="activity_content">
			<div class="searchBar">
				<div class="search">
					<img src="${ctx}/static/weixin/images/activity/sort.png" width="28px;" height="28px;" style="margin: 10px 12px;" />
				</div>
				<input type="search" class="searchInput" id="activityName" placeholder="活动搜索" onSearch="queryByKey(this.value);"/>
				<div class="message">
					<img src="${ctx}/static/weixin/images/activity/message.png" width="28px;" height="28px;" style="margin: 10px 12px;" />
				</div>
				<div style="clear: both;"></div>
			</div>

			<div id="dropdown">
				<div>
					<div class="dropdownContent">
					<!-- <div class="optionBtn" onclick="queryBySearchKey(this,'2')">全部</div> -->
					<div id="all" class="optionBtn selected" onclick="queryBySearchKey(this,'2')">全部</div>
					<c:forEach items="${tagList}" var="tags">
						<div class="optionBtn" onclick="queryBySearchKey(this,'1')">${tags.tagName}</div>
					</c:forEach>
					</div>
				</div>
			</div>

			<div style="margin-top: 55px;"></div>
			<%-- <div class="flicker-example" data-block-text="false"
				style="height: 120px; margin-bottom: 10px;">
				<ul>
					<li
						style="background-image:url(${ctx}/static/weixin/images/activity/banner.jpg); background-size:100% 120px;"></li>
					/**先隐藏其它图片**/
					<li
						data-background="${ctx}/static/weixin/images/activity/forest.jpg"></li>
					<li
						data-background="${ctx}/static/weixin/images/activity/frozen-water.jpg"></li>
				</ul>
			</div> --%> 
			<div class="project_operBar">
				<div style="width:15%;" class="project_oper borRight selected" onClick="borClick(this,0);">全部</div>
				<div style="width:25%;" class="project_oper borRight" onClick="borClick(this,1);">进行中</div>
				<div style="width:25%;" class="project_oper borRight" onClick="borClick(this,2);">已结束</div>
				<div style="clear:both;"></div>
			</div>

			<div class="searchResult" style="display: none;">
				在12345个活动中包含“培训”的活动<span style="color: #F14241;">32</span>个
			</div>
			<div class="activityBar"></div>
			
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
			
			<div id="tbox" hidden>
				<a id="gotop" href="#top"></a>
			</div>
		</div>
		<div class="navigationBar" style="z-index: 1000;">
			<ul>
				<li><a href="${ctx}/auth/page/mobile/weixin/projectActivity/weixin/activityMain">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/activity/findactivity.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
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
						<img src="${ctx}/static/weixin/images/logistics/more.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top:-95px;">
					<li style="border-bottom: 1px solid #E6E6E6"><a href="${ctx}/projectActivity/weixin/myActivity">我的活动</a></li>
					<li><a href="${ctx}/personalCenter/weixin/messageNotification">消息中心</a></li>
				</ul>
			</div>
		</div>
</body>
</html>