<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的收藏</title>
<link href="${ctx}/static/weixin/css/show/myCollection.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/supply/supplyDemandDocking.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<style>
body .layui-layer-tl_green .layui-layer-title {
	background-color: #06B8C2;
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

 $(function(){
	 getCollectList(1,1,10);
	 $("#pageNum").val("1");
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
 });
 function getMore() {
		var pageNum = Number($("#pageNum").val()) + 1;
		var type=$("#type").val();
		$("#pageSize").val("pageSize");
		getCollectList($("#userId").val(),pageNum, $("#pageSize").val());		
	}


 function getCollectList(userId,pageNumber,pageSize){
	 
	$.ajax({
		url:"${ctx}/show/json/myCollection",
		type:"get",
		data:{
			"userId" : userId,
			"pageNumber" : pageNumber,
			"pageSize" : pageSize,
			"type" : 1,
		},
		dataType : "json",
	 	success:function(result){
	 		if(result.code == 1 || result.code==0){
	 			if(result.code==0){
	 				$("#getMore").hide();
	 			} 
	 					var imageUrlMap = '${imageUrl}';
	 					var orderNumMap = '${orderNum}';
	 					var priceMap = '${price}';
	 					var unitMap = '${unitMap}';
						var list = result.value;
						var divwidth = document.body.clientWidth;
						var divWidth = (divwidth-30)*0.3;
				    	for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var productId = info.product_id;
						var jsonImageUrl = eval('(' + imageUrlMap + ')');
						var jsonOrderNum = eval('(' + orderNumMap + ')'); 
						var jsonPrice = eval('(' + priceMap + ')'); 
						var jsonUnitMap = eval('(' + unitMap + ')');
						var _div ='<div style="color: #5e5e5e; margin: 0 15px; padding: 10px 0; font-size: 12px; border-bottom: 1px solid #f6f6f6; position: relative;" onclick="view(\''+productId+'\')">'
							    + ' <img src=" '
								+ jsonImageUrl[productId]
								+ '"style="float: left; width: 30%" height="'+divWidth+'px";>'
								+ '<div class="industry_title titleChange"></div>'
								+ '<div style="float: left; width: 56%;">'
								+ '<div style="font-weight: bold; margin: 4px 0;">';
								if (info.product_name.length <= 10) {
									_div += '<span style="font-size: 14px;line-height:14px;margin-left:0%">'
											+ info.product_name + '</span>';
								} else {
									_div += '<span title="'+info.product_name+'" style="font-size: 14px;line-height:14px;margin-left:0%">'
											+ info.product_name
													.substring(0, 10)
											+ '...</span>';
								}

								_div +='</div><div style="font-weight: bold; color: #ccc; margin: 15px 0;text-align: left;margin-left: 15px">起订量>='
								+ jsonOrderNum[productId]
								+ jsonUnitMap[productId] + '</div>'
								+ '<div class="industry_price priceChange" style="float: left; padding: 1px 5px;">￥'
								+ jsonPrice[productId]
								+ '</div>'
								+ '<div style="float:left; padding: 1px 0;">/'+jsonUnitMap[productId]+'</div>'							
								+ '<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;"style="float:right;margin-right: -30px" onclick="event.cancelBubble = true;cancelCollect(\''+info.product_name+'\',\''+info.product_id+'\');" >'
								+ '</div><div style="clear:both;"></div></div>';
								 
								$("#collection_operBar").append(_div);
	 			
	 			}
	 		}else{
	 			$("#collection_operBar")
	 						.append(
	 						'<span class="renovateTitle"  style = "line-height: 30;color: #646464;">暂无更多信息</span>');
	 			$("#getMore").hide();
	 		}
	 		},
	 	error:function(){
	 		layer.alert("系统异常");
	 	}
	});
 }
 //取消收藏操作
 function cancelCollect(producName,productId){
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
							end : function (){
								location.reload();
							}
						});
				}else{
					layer.alert(infoN.errorMsg);
				}
			}	
			});
/* 	 location.reload(); 
 */ }
 function view(id){
		window.location.href="${ctx}/show/productDetails?id="+id + "&type=1";
	}
 
</script>

</head>

<body>
<div class="collection_main">
	<input type="hidden" id="userId" value="${userId}">
	<input type="hidden" id="pageSize" value="${pageSize }">
	<input type="hidden" id="pageNum" value="${pageNumber }">
	<div class="fixed_top1">
		<img src="${ctx}/static/weixin/images/logistics/myCollection0.png" width="15px;" height="15px;">
		<span>我的收藏</span>
	</div>
	<div class="collection_content">
		<div class="collection_operBar">
			<div style="width:25%; color: #06B8C2;" class="collection_oper borRight">产品</div>
			<div style="width:59%;" class="collection_oper"></div>
			<div style="clear:both;"></div>
			<div class="industry_dataBar dataBarChange" ></div>
			
		</div>
		<div style="background-color: #fff;">
				<div id="collection_operBar" style="text-align: center;"></div>
		</div>
		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		<div id="tbox" hidden>
				<a id="gotop" href="#top"></a>
		</div>
		
	</div>
	
	<div id="cancelCollection"
			style="display: none; text-align: center; padding: 20px 0;">
			<div>收藏已取消</div>
			<div>
				“<span style="color: #FF6707;">收藏的产品已取消</span>”
			</div>
			<div><span id="seconds2">3</span>秒后自动关闭</div>
		</div>
	
	<div class="navigationBar">
		<ul>
			<li><a href="${ctx}/personalCenter/weixin/main">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/personalCenter/shou.png"
						width="20px;" height="20px;" style=" margin-top: 6%"/>
				</div>
				<div class="navTitle">首页</div>
			</a></li>
			<li><a href="${ctx}/auth/page/mobile/weixin/show/main">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/show/findProduct1.png"
						width="20px;" height="20px;" style=" margin-top: 6%"/>
				</div>
				<div class="navTitle">找产品</div>
			</a></li>
			<li><a href="${ctx}/show/findEnterprise">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/show/findEnterprised.png"
						width="20px;" height="20px;" style=" margin-top: 6%"/>
				</div>
				<div class="navTitle">找企业</div>
			</a></li>
			<li><a href="javascript:;" class="viewMore">
				<div class="navImage">
					<img src="${ctx}/static/weixin/images/show/mored.png"
						width="20px;" height="20px;" style=" margin-top: 6%"/>
				</div>
				<div class="navTitle">更多服务</div>
			</a></li>
		</ul>
		<div id="viewMore">
			<ul style="margin-top:-137px;"> 
<!-- 			<li style="border-bottom:1px solid #E6E6E6;"><a href="javascript:;">留言处理</a></li>  -->
			 	<li style="border-bottom:1px solid #E6E6E6;"><a href="myCollection.html">我的收藏</a></li>
				<li style="border-bottom:1px solid #E6E6E6;"><a href="myProduct.html">我的产品</a></li> 
				<li><a href="javascript:;">企业介绍</a></li> 
			</ul>
		</div>
	</div>
</div>
</body>
</html>
