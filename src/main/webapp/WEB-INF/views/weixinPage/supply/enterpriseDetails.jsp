<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>企业详情</title>
<link href="${ctx}/static/weixin/css/supply/enterpriseDetails.css" rel="stylesheet" />
</head>

<script>
	$(function() {
		var str = "${info.biz_service}";
		if (str.length > 20) {
			str = str.substring(0, 22) + "...";
		}
		$('#biz_service').html(str);
		var dataStr = "${info.establisth_date.split(' ')[0]}".split('-');
		if (dataStr.length < 3) {
			$('#dataRight').html("&nbsp;");
		} else {
			$('#dataRight').html(
					dataStr[0] + "年" + dataStr[1] + "月" + dataStr[2] + "日");
		}
	})

	/* 企业描述展开收起 */
	function showDescription() {
		if ($('#show').html() == "展开+") {
			$('.enterprise_intro').css("overflow", "visable");
			if($('.enterprise_intro')[0].scrollHeight>$('.enterprise_intro').height()+10){
				$('.enterprise_intro').css("height", "100%");
			}
			$('#show').html("收起-");
		} else {
			$('.enterprise_intro').css("overflow", "hidden");
			$('.enterprise_intro').css("height", "4.3em");
			$('#show').html("展开+");
		}
	}
</script>

<body>
	<div class="entDetails_main">
		<div class="entDetails_content">
			<div class="enterprise_top1">
				<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">
				<div class="entProduct_name">${info.company_name}</div>
			</div>
			<div class="enterprise_top2">
				<div class="enterprise_logo">
					<c:choose>
						<c:when test="${info.companyLog eq undefined}">
							<img src="${ctx}/static/weixin/images/activity/headPortrait.png" width="70px;" height="70px;">
						</c:when>
						<c:otherwise>
							<img src="${info.companyLog}" width="70px;" height="70px;">
						</c:otherwise>
					</c:choose>
				</div>
				<div style="line-height:11px;">
				<div class="enterprise_add">
					<span>经营地址：</span><span style="font-weight: bold;">${info.province_name}${info.area_name}${info.space_name}</span>
				</div>
				<div class="enterprise_range">
					<span>经营范围：</span><span id="biz_service" style="font-weight: bold;"></span>
				</div>
				</div>
			</div>

			<div style="margin-top: 120px;"></div>
			<div class="entDetails_cont" style="padding: 0;">
				<div class="entDetails_dataBar">
					<div class="entDetails_data">
						<div class="entDetails_dataLeft">联系人</div>
						<div class="entDetails_dataRight">${info.contact_name}</div>
						<div style="clear: both;"></div>
					</div>
					<div class="entDetails_data">
						<div class="entDetails_dataLeft">联系电话</div>
						<div class="entDetails_dataRight">${info.contact_phone}</div>
						<div style="clear: both;"></div>
					</div>
					<div class="entDetails_data">
						<div class="entDetails_dataLeft">成立时间</div>
						<div id="dataRight" class="entDetails_dataRight"></div>
						<div style="clear: both;"></div>
					</div>
					<div class="entDetails_data" style="border-bottom: 0;">
						<div class="entDetails_dataLeft">注册资本</div>
						<div class="entDetails_dataRight">${info.capital_money}万</div>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div class="enterprise_intro" style="text-indent: 0;">${info.company_description}</div>
				<div style="text-align: right; color: #03B8C2; background-color: #fff; padding: 5px 3% 5px 0;">
					<a id="show" onclick="showDescription();">展开+</a>
				</div>

				<div class="enterprise_pic">
					<c:forEach items="${imageList}" var="info">
						<img src="${info.image_path}" width="23%;" height="80px;">
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>

		<div class="fixed_bottom">
			<a href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a>
			<!-- 			<div class="bottom_operation" style="display: none;"> -->
			<!-- 				<img src="images/phone.png" width="20px;" height="20px;" /> <span class="spanContral_1" style="color: #03B8C2;">在线留言</span> -->
			<!-- 			</div> -->
			<!-- 			<div class="bottom_operation" style="display: none;"> -->
			<!-- 				<img src="images/alreadyCollect.png" width="20px;" height="20px;" /> <span class="spanContral_1" style="color: #F14241;">已收藏</span> -->
			<!-- 			</div> -->
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>
