<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>企业详情</title>
<link href="${ctx}/static/weixin/css/show/enterpriseDetails.css" rel="stylesheet" />
<script>
	$(function() {
		var str = "${info.biz_service}";
		if (str.length > 20) {
			str = str.substring(0, 22) + "...";
		}
		$('#biz_service').html(str);
		if ('${info.operation_address}') {
			$('#biz_address').html('${info.operation_address}');
		} else {
			$('#biz_address').html('${info.company_address}');
		}
		if ('${info.capital_money}') {
			$('#biz_capital_money').html('${info.capital_money}万');
		} else {
			$('#biz_capital_item').hide();
		}
		var dataStr = "${info.establisth_date.split(' ')[0]}".split('-');
		if (dataStr.length < 3) {
			$('#dataRight').html("&nbsp;");
		} else {
			$('#dataRight').html(
					dataStr[0] + "年" + dataStr[1] + "月" + dataStr[2] + "日");
		}

		var ids = "${info.company_img_at}";
		getAjaxAttr(ids);
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

	function getAjaxAttr(ids) {
		var url = "${ctx}/ajaxGetAtts";
		if ('${parkId}' == '0') {
			url = "${ctx}/show/json/ajaxGetAtts";
		}
		$.ajax({
			url : url,
			type : "get",
			data : {
				"attIds" : ids,
			},
			dataType : "json",
			success : function(result) {
				if (result != null) {
					if (result[0] && result[0].attachmentUrl) {
						$("#" + ids).attr("src", result[0].attachmentUrl);
					} else {
						if (result.value && result.value[0] && result.value[0].attachmentUrl) {
							$("#" + ids).attr("src", result.value[0].attachmentUrl);
						}
					}
				}
			}
		});
	}
</script>
</head>

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
							<img src="${ctx}/static/weixin/images/show/logo.png" id="${info.company_img_at}" width="70px;" height="70px;" style="border-radius:70px">
						</c:when>
						<c:otherwise>
							<img src="${info.companyLog}" width="70px;" height="70px;">
						</c:otherwise>
					</c:choose>
				</div>
				<div style="line-height:11px;">
				<div class="enterprise_add" style="color: #646464;">
					<span>经营地址：</span><span id="biz_address"></span>
				</div>
				<div class="enterprise_range" style="color: #646464;">
					<span>经营业务：</span><span id="biz_service"></span>
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
					<div class="entDetails_data" style="border-bottom: 0;" id="biz_capital_item">
						<div class="entDetails_dataLeft">注册资本</div>
						<div class="entDetails_dataRight" id="biz_capital_money"></div>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div class="enterprise_intro" style="text-indent: 0;">
					${info.company_description}
				</div>
				<div style="text-align: right; color: #03B8C2; background-color: #fff; padding: 5px 3% 5px 0;">
					<a id="show" onclick="showDescription();">展开+</a>
				</div>

				<div class="enterprise_pic">
					<c:forEach items="${imageList}" var="info">
						<img class="img" src="${info.image_path}" width="23%;">
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
				<script>
				$(function() {
		        var divWidth = document.body.clientWidth*0.23;
		        $('.img').height(divWidth);})
                </script>
			</div>
		</div>

		<div class="fixed_bottom">
			<a href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a>
			<!-- 			<div class="bottom_operation"> -->
			<%-- 				<img src="${ctx}/static/weixin/images/logistics/edit.png" width="20px;" height="20px;" /> <span class="spanContral_1" --%>
			<!-- 					style="color: #14A265;">编辑</span> -->
			<!-- 			</div> -->
			<!-- 			<div class="bottom_operation" style=""> -->
			<%-- 				<img src="${ctx}/static/weixin/images/logistics/sincerity.png" style="width: 16px; height: 16px; padding: 3px 1px 1px 3px;" /> --%>
			<!-- 				<span class="spanContral_1" style="color: #03B8C2;">申请诚信企业</span> -->
			<!-- 			</div> -->
			<!-- 			<div class="bottom_operation"> -->
			<%-- 				<img src="${ctx}/static/weixin/images/logistics/delete.png" style="width: 12px; height: 12px; padding: 5px 2px 3px 6px;" /> <span --%>
			<!-- 					class="spanContral_1" style="color: #F14241;">删除</span> -->
			<!-- 			</div> -->

			<!-- 			<div class="bottom_operation"> -->
			<%-- 				<img src="${ctx}/static/weixin/images/activity/newmessage.png" width="20px;" height="20px;" /> <span class="spanContral_1" --%>
			<!-- 					style="color: #03B8C2;">在线留言</span> -->
			<!-- 			</div> -->
			<!-- 			<div class="bottom_operation" style="display: none;"> -->
			<!-- 				<span class="spanContral_1 spanContral_2" style="color: #ABABAB;">活动已取消</span> -->
			<!-- 			</div> -->
			<!-- 			<div class="bottom_operation"> -->
			<%-- 				<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" /> <span class="spanContral_1" --%>
			<!-- 					style="color: #F14241;">已收藏</span> -->
			<!-- 			</div> -->
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>
