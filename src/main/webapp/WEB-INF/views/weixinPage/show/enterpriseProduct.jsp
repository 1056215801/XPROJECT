<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>企业产品</title>
<link href="${ctx}/static/weixin/css/show/enterpriseProduct.css" rel="stylesheet" />
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
	var str = '${info.biz_service}';
	if(str.length>20){
		 str = str.substring(0,22)+"...";
	}
	$('#biz_service').html(str);
	if ('${info.operation_address}') {
		$('#biz_address').html('${info.operation_address}');
	} else {
		$('#biz_address').html('${info.company_address}');
	}
	
	$('#gridView').hide();
	 $("#proList").hide();
	 $('#tbox').hide();
	 
	 /* 异步加载企业产品 */
	 getEnterpriseProduct(1);
	 var ids = "${info.company_img_at}";
	 getAjaxAttr(ids);
})
	function view(id){
	window.location.href="${ctx}/show/productDetails?id="+id + "&type=1";
}
//收藏
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
				"type":"1",
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
/* 异步加载企业产品 */
productCount = 0;
pageNumber = 1;
function getEnterpriseProduct(pageNum){
	$.ajax({
		url:"${ctx}/show/json/enterpriseProduct",
		type:"get",
		data:{
			"pageNumber":pageNum,
			"companyId":'${info.company_id}'
		},
		dataType:"json",
		success:function(result){
			var list = result.value;
			var collect = result.jsonValue;
			var divwidth = document.body.clientWidth;
			var divWidth = (divwidth-30)*0.3;
			if(result.code==1 || result.code==0){
				productCount += list.length;
				for(var i=10*(pageNum-1);i<10*(pageNum-1)+list.length;i++){
					var info = list[i%10];
					var _divList = '<a href="javascript:void(0)" onclick="view(\''+info.id+'\')" style="text-decoration: none;">'
						+'<div style="color: #5e5e5e; margin: 0 15px; padding: 10px 0; font-size: 12px; border-bottom: 1px solid #f6f6f6; position: relative;">';
						if(info.pic_url == null){
						_divList +='<img src="${ctx}/static/weixin/images/show/advertise.png" style="float: left; width: 30%; height="'+divWidth+'px" margin-right: 20px;"/>'; 
						}else{
						   _divList +='<img src="'+info.pic_url+'" style="float: left; width: 30%;margin-right: 20px;"height="'+divWidth+'px"/>';
						}
						_divList+='<div style="float: left; width: 56%;margin-left: 0%;vertical-align: middle">'
						+'<div style="font-weight: bold; height:36px;overflow:hidden;">'
						+'<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;"style="color:#000;">'+(info.product_name.length>23?info.product_name.substring(0,22)+"...":info.product_name)
						+'</div><div style="font-weight: bold; color: #ccc; margin: 4% 0;">起订量>='+info.order_num+getUnit(info.order_unit)+'</div>'
						+'<div class="entProduct_price" style="float: left; padding: 1px 5px;">￥'+info.price+'</div>'
						+'<div style="float: left; padding: 1px 0;">/'+getUnit(info.order_unit)+'</div>';
						 var id=info.id;
						 if(collect[id]==1){
							 _divList +='<img class='+info.id+' value="1" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="25px;" height="25px;" style="float:right;margin-right:-30px;margin-top:-10px;"onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
						}else{
							 _divList +='<img class='+info.id+' value="0" src="${ctx}/static/weixin/images/logistics/notCollected.png" width="25px;" height="25px;" style="float:right;margin-right:-30px;margin-top:-10px;" onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
						}
						  _divList +='</div><div style="clear: both;"></div></div></a>';
						$("#listView").append(_divList);
			
						
						var _divGrid = '<a href="javascript:void(0)" onclick="view(\''+info.id+'\')" style="text-decoration: none;">'
						+'<div class="entProduct_dataBar" style="color: #5e5e5e;border-bottom: 1px solid #f6f6f6;">'
						+'<div style="text-align: center;">';
						if(info.pic_url == null){
							_divGrid +='<img src="${ctx}/static/weixin/images/show/advertise.png" height="120px;" height="'+divWidth+'px" style="vertical-align: middle;"/>'; 
						}else{
							_divGrid +='<img src='+info.pic_url+' height="120px;" height="'+divWidth+'px" style="vertical-align: middle;"/>';
						}
						_divGrid +='<div style="font-size: 14px; height: 40px; overflow: hidden;color:#000;text-align: left">'+info.product_name+'</div>'
						+'<div style="padding-bottom:5px;"><div class="entProduct_price" style="float: left;">￥'
						+info.price+'</div><div style="float: left;color:#000;">/'+getUnit(info.order_unit)+'</div>';
						if(collect[id]==1){
							_divGrid +='<img class='+info.id+' value="1" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="25px;" height="25px;" style="float: right;padding-right:5px;" onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
						}else{
							_divGrid +='<img class='+info.id+' value="0" src="${ctx}/static/weixin/images/logistics/notCollected.png" width="25px;" height="25px;" style="float: right;padding-right:5px;" onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
						}
						_divGrid +='<div style="clear: both;"></div></div></div></a>';
						$("#gridView").append(_divGrid);					
				}
				$("#gridView").append('<div style="clear: both;"></div>');
			}else if(result.code==2){
				$("#proList").show();
			}else{
				layer.msg("获取数据失败");
			}
			if(result.code==0 || result.code==2){
				$('#getMore').hide();
			}
		},
		error:function(){
			layer.alert("系统异常");
		}
	});
}

/* 加载更多 */
function getMore() {
	pageNumber++;
	getEnterpriseProduct(pageNumber);
}

viewType = 0//0为listView 1为gridView
function changeViewType(){
	if(productCount>0){
		$(document).scrollTop(0);//切换试图回到顶部
		if(viewType==0){
			$('#listView').hide();
			$('#gridView').show();
			viewType=1;
			$('#changeView').attr("src","${ctx}/static/weixin/images/show/block.png");
		}else{
			$('#gridView').hide();
			$('#listView').show();
			viewType=0;
			$('#changeView').attr("src","${ctx}/static/weixin/images/show/list.png");
		}
	}
}

	/* 单位转换 */
	function getUnit(i){
		switch(i){
			case 1:return "只";
			case 2:return "个";
			case 3:return "箱";
			case 4:return "瓶";
			case 5:return "台";
			case 6:return "升";
			case 7:return "包";
			case 8:return "套";
			case 9:return "千克";
			case 10:return "克";
			case 11:return "件";
			case 12:return "本";
			case 13:return "张";
			case 18:return "米";
		}
		return "单位";
	}

	//获取企业图片
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
				if (result) {
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
	<div class="entProduct_main">
		<div class="entProduct_content">
			<div class="enterprise_top1">
				<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">
				<div class="entProduct_name">${info.company_name}</div>
			</div>
			<div class="enterprise_top2">
				<a href="${ctx}/show/enterpriseDetails?companyId=${info.company_id}" style="text-decoration: none;">
					<div class="enterprise_logo">
						<c:choose>
							<c:when test="${info.companyImgAt eq undefined}">
								<img src="${ctx}/static/weixin/images/show/logo.png" id="${info.company_img_at}" width="70px;" height="70px;" style="border-radius:70px">
							</c:when>
							<c:otherwise>
								<img src="${info.companyImgAt}" width="70px;" height="70px;" style="border-radius:70px">
							</c:otherwise>
						</c:choose>
					</div>
				</a>
				<div style="line-height:15px">
				<div class="enterprise_add" style="color: #646464;">
					<span>经营地址：</span><span id="biz_address"></span>
				</div>
				<div class="enterprise_range" style="color: #646464;">
					<span>经营业务：</span><span id="biz_service" ></span>
				</div>
				</div>
			</div>

			<div style="margin-top: 120px;"></div>
			<div class="entProduct_operBar" style="width: 100%; position: fixed; top: 123px; z-index: 1000;">
				<div style="width: 25%; color: #06B8C2;" class="entProduct_oper borRight">全部产品</div>
				<div style="width: 57%;" class="entProduct_oper"></div>
				<div style="width: 17%;" class="entProduct_oper borLeft" onclick="changeViewType();">
					<img id="changeView" src="${ctx}/static/weixin/images/show/list.png" width="20px;" height="20px;"
						style="display: block; margin: 0 auto;">
				</div>
				<div style="clear: both;"></div>
			</div>
			
			<div id="addToCollection"
				style="display: none; text-align: center; padding: 20px 0;">
				<div>产品已收藏</div>
			<div>
				请到“<span style="color: #FF6707;">更多服务--我的收藏</span>”进行查看
			</div>
				<div><span id="seconds1">3</span>秒后自动关闭</div>
			</div>
				<div id="cancelCollection"
				style="display: none; text-align: center; padding: 20px 0;">
				<div>收藏已取消</div>
			<div>
				“<span style="color: #FF6707;">收藏的产品已取消</span>”
				</div>
				<div><span id="seconds2">3</span>秒后自动关闭</div>
			</div>
			<div style="margin-top: 160px;"></div>

			<div style="background-color: #fff;">
				<div id="gridView" class="entProduct_cont" style="text-align:center;"></div>
				<div id="listView"></div>
				<div style="text-align:center; line-height:30;">
					<span id="proList" class="renovateTitle" style="color:#646464;">暂无产品</span>
				</div>
			</div>
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
			<div id="tbox">
				<a id="gotop" href="#top"></a>
			</div>
		</div>

	</div>

	<div class="fixed_bottom">
		<a href="javascript:history.go(-1);"> <img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;"
			class="returnBtn" />
		</a>
		<div style="clear: both;"></div>
	</div>
	</div>
</body>
</html>
