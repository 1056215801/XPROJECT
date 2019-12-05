<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>企业供需</title>
<link href="${ctx}/static/weixin/css/supply/enterpriseSupplyDemand.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
</head>
<style>
body .layui-layer-tl_green .layui-layer-title {
	background-color: #FDC006;
	color: #fff;
	border: none;
}

body .layui-layer-bg_gray .layui-layer-content {
	background-color: #ebebeb;
}

body .layui-layer-bg_gray .layui-layer-btn0 {
	background-color: #00A85A;
	color: #FFF;
	text-align: center;
	padding: 5px 0;
	width: 100%;
	margin: 0;
}
</style>
<script>
	$(function() {
		var str = "${info.biz_service}";
		if (str.length > 20) {
			str = str.substring(0, 22) + "...";
		}
		$('#biz_service').html(str);

		// 		$('#gridView').hide();
		$("#proList").hide();
		$('#tbox').hide();

		/* 异步加载企业供需 */
		getEnterpriseProduct(1);
	})

	/* 异步加载企业供需 */
	productCount = 0;
	pageNumber = 1;
	function getEnterpriseProduct(pageNum) {
		$.ajax({
					url : "${ctx}/supply/json/enterpriseProduct",
					type : "get",
					data : {
						"pageNumber" : pageNum,
						"companyId" : '${info.company_id}'
					},
					dataType : "json",
					success : function(result) {
						var list = result.value;
						var collect = result.jsonValue;
						if (result.code == 1 || result.code == 0) {
							productCount += list.length;
							for (var i = 10 * (pageNum - 1); i < 10
									* (pageNum - 1) + list.length; i++) {
								var info = list[i % 10];
								var _divList = '<a href="javascript:void(0)" onclick="view(\''+info.id+'\')" style="text-decoration: none;">'
										+ '<div class="supplyDemand_dataBar">'
										+ '<img src="'
										+info.pic_url
										+'" width="110px;" height="110px;" class="supplyDemand_img">'
										+ '<div class="supplyDemand_title">';
										if(info.type==0){
											_divList+='<img src="${ctx}/static/weixin/images/supply/need.png" width="20px;" height="20px;">';
										}else{
											_divList+='<img src="${ctx}/static/weixin/images/supply/give.png" width="20px;" height="20px;">'
										}
										_divList+= '<div class="supplyDemand_titleCont">'
										+ info.product_name
										+ '</div></div><div class="supplyDemand_company">'
										+ info.company_name
										+ '</div><div class="supplyDemand_data">'
										+ '<div class="supplyDemand_add">';
										if(info.address==null){
											_divList+='暂无地址';
										}else{
											_divList+=info.address;
										}
										_divList+='</div><div class="supplyDemand_time">'
										+ info.create_time.substring(0,10)
										+ '</div>';
										var id=info.id;
										if(collect[id]==1){
											_divList +='<img class='+info.id+' value="1" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="25px;" height="25px;" style="position:absolute; top:-20px; right:10px;"onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
										}else{
									 		_divList +='<img class='+info.id+' value="0" src="${ctx}/static/weixin/images/logistics/notCollected.png" width="25px;" height="25px;" style="position:absolute; top:-20px; right:10px;" onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
										}
										_divList += '<div style="clear:both;"></div>'
										+ '</div><div style="clear:both;"></div></div></a>';
										$("#listView").append(_divList);
							}
						} else if (result.code == 2) {
							$("#proList").show();
						} else {
							layer.msg("获取数据失败");
						}
						if (result.code == 0 || result.code == 2) {
							$('#getMore').hide();
						}
					},
					error : function() {
						layer.alert("系统异常");
					}
				});
	}

	/* 加载更多 */
	function getMore() {
		pageNumber++;
		getEnterpriseProduct(pageNumber);
	}
	
	//供需详情
	function view(id){
		window.location.href="${ctx}/supply/productDetails?id="+id +"&type=1";
	}
	//收藏和取消收藏
	function collectAction(producName,productId){
		//取消收藏
		var status=$('.'+productId).attr("value");
		  if(status==1){
			$.ajax({
				url : "${ctx}/show/json/delFromCollection",
				type : "get",
				data : {
					"productId" : productId,
				},
				dataType : "json",
				success : function(result) {
					var infoN = jQuery.parseJSON(result);
					 if (infoN.success) {
						 $('#seconds2').html(3);
						 layer.open({
								type : 1,
								title : '提示',
								skin : 'layui-layer-tl_green',
								shadeClose : true,
								area : [ '250px', '150px' ],
								time : '3000',
								content : $('#cancelCollection'),
								success :function(){
									setTimeout(function(){
										$('#seconds2').html(2);
										setTimeout(function(){$('#seconds2').html(1);},1000);
									},1000);
								},
							});
							$('.'+productId).attr("src","${ctx}/static/weixin/images/logistics/notCollected.png");
	 						$('.'+productId).attr("value","0");

					}else{
						layer.alert(infoN.errorMsg);
					}
				}	
			});
		//添加收藏	
		}else{
			$.ajax({
				url : "${ctx}/show/json/addToCollection",
				type : "get",
				data : {
					"productName" : producName,
					"productId" : productId,
					"type":"2",
				},
				dataType : "json",
				success : function(result) {
					var infoN = jQuery.parseJSON(result);
					 if (infoN.success) {
						 $('#seconds1').html(3);
						 layer.open({
								type : 1,
								title : '提示',
								skin : 'layui-layer-tl_green',
								shadeClose : true,
								area : [ '250px', '150px' ],
								time : '3000',
								content : $('#addToCollection'),
								success :function(){
									setTimeout(function(){
										$('#seconds1').html(2);
										setTimeout(function(){$('#seconds1').html(1);},1000);
									},1000);
								},
							});
							$('.'+productId).attr("src","${ctx}/static/weixin/images/logistics/alreadyCollect.png");
	 						$('.'+productId).attr("value","1");

					}else{
						layer.alert(infoN.errorMsg);
					}
				}	
				}); 	
			
		} 
		
	 	
		}
</script>
<body>
	<div class="entSupplyDemand_main">
		<div class="entSupplyDemand_content">
			<div class="enterprise_top1">
				<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">
				<div class="entSupplyDemand_name" style="line-height: 100%">${info.company_name}</div>
			</div>
			<div class="enterprise_top2">
				<a href="${ctx}/supply/enterpriseDetails?companyId=${info.company_id}" style="text-decoration: none;">
					<div class="enterprise_logo">
						<c:choose>
							<c:when test="${info.companyImgAt eq undefined}">
								<img src="${ctx}/static/weixin/images/activity/headPortrait.png" width="70px;" height="70px;" style="border-radius:70px">
							</c:when>
							<c:otherwise>
								<img src="${info.companyImgAt}" width="70px;" height="70px;" style="border-radius:70px">
							</c:otherwise>
						</c:choose>
					</div>
				</a>
				<div style="line-height:15px;">
				<div class="enterprise_add">
					<span>经营地址：</span><span style="color: #646464">${info.province_name}${info.area_name}${info.space_name}</span>
				</div>
				<div class="enterprise_range">
					<span>经营范围：</span><span id="biz_service" style="color: #646464"></span>
				</div>
				</div>
			</div>

			<div style="margin-top: 120px;"></div>
			<div class="entSupplyDemand_operBar" style="width: 100%; position: fixed; top: 123px; z-index: 1000;">
				<div style="width: 20%; color: #FDC006; font-weight: bold;" class="entSupplyDemand_oper borRight">全部</div>
				<div style="width: 54%;" class="entSupplyDemand_oper"></div>
				<div style="clear: both;"></div>
			</div>

			<div style="margin-top: 160px;"></div>

			<div style="background-color: #fff;">
				<div id="listView"></div>
				<div style="text-align: center;line-height:30;">
					<span id="proList" class="renovateTitle" style="color:#646464">暂无数据</span>
				</div>
				<div style="clear: both;"></div>
			</div>
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
			<div id="tbox">
				<a id="gotop" href="#top"></a>
			</div>
		</div>
		
		<div id="addToCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>供需已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--我的收藏</span>”进行查看
			</div>
			<div>
				<span id="seconds1">3</span>秒后自动关闭
			</div>
		</div>
		<div id="cancelCollection" style="display: none; text-align: center; padding: 20px 0;">
			<div>收藏已取消</div>
			<div>
				“<span style="color: #FF6707;">收藏的供需已取消</span>”
			</div>
			<div>
				<span id="seconds2">3</span>秒后自动关闭
			</div>
		</div>
		<div class="fixed_bottom">
			<a href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;"
				height="20px;" class="returnBtn" />
			</a>
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>
