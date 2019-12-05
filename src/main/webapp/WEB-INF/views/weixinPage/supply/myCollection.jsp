<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的收藏</title>
<link href="${ctx}/static/weixin/css/supply/myCollection.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/supply/supplyDemandDocking.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
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
		url:"${ctx}/supply/json/myCollection",
		type:"get",
		data:{
			"userId" : userId,
			"pageNumber" : pageNumber,
			"pageSize" : pageSize,
			"type" : 2,
		},
		dataType : "json",
	 	success:function(result){
	 		if(result.code == 1 || result.code==0){
	 			if(result.code == 0){
	 				$("#getMore").hide();
	 			} 
	 					var imageUrlMap = '${imageUrl}';
	 					var compNameMap = '${compName}';
	 					var areaMap = '${area}';
	 					var provinceMap = '${province}';
	 					var supplyDemandMap = '${supplyDemand}';
						var list = result.value;
				    	for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var productId = info.product_id;
						var jsonImageUrl = eval('(' + imageUrlMap + ')');
						var jsonCompName = eval('(' + compNameMap + ')');
						var jsonProvince = eval('(' + provinceMap + ')');
						var jsonArea = eval('(' + areaMap + ')');
						var jsonSupplyDemand = eval('(' + supplyDemandMap + ')');
						var _div ='<a href="javascript:void(0)" onclick="view(\''+info.product_id+'\')" style="text-decoration: none;">'
						+ '<div class="supplyDemand_dataBar" style="background-color: #fff">'
						+ '<img src="'
						+jsonImageUrl[productId]
						+'" width="110px;" height="110px;" class="supplyDemand_img" style="padding-top: 5px">'
						+ '<div class="supplyDemand_title">';
						if(jsonSupplyDemand[productId]==0){
							_div+='<img src="${ctx}/static/weixin/images/supply/need.png" width="20px;" height="20px;">';
						}else{
							_div+='<img src="${ctx}/static/weixin/images/supply/give.png" width="20px;" height="20px;">'
						}
						_div+='<div style="display:inline-block; vertical-align:middle;margin-left: 5px;width: 85%">';
						if (info.product_name.length <= 19) {
						    _div+= '<span>'
								+ info.product_name + '</span>';
					        } else {
						   _div+= '<span title="'+info.product_name+'">'
								+ info.product_name
										.substring(0, 20)
								+ '...</span>';
					        }
						_div+='</div></div><div class="supplyDemand_company">'
						+ jsonCompName[productId]
						+ '</div><div class="supplyDemand_data">'
						+ '<div class="supplyDemand_add">';
						 if(jsonProvince[productId]==undefined || jsonArea[productId]==undefined){
							_div+='暂无地址';
						}else{
							_div+=jsonProvince[productId]+'&nbsp'+ jsonArea[productId];
						}
						_div+='</div><div class="supplyDemand_time">'
						+ info.create_time.substring(0, 10)
						+ '</div>'
						+'<img class='+info.id+' value="1" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="position:absolute; top:-15px; right:10px;"onclick="event.cancelBubble = true;cancelCollect(\''+info.product_name+'\',\''+info.product_id+'\');">';
						+'<div style="clear:both;"></div>'
						+ '</div><div style="clear:both;"></div></div></a>';
								 
								$("#listView").append(_div);
	 			
	 			}
	 		}else{
	 			$("#listView")
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
	 window.location.href="${ctx}/supply/productDetails?id="+id +"&type=2";
	}
</script>

</head>

<body>
<div class="collection_main">
	<input type="hidden" id="userId" value="${userId}">
	<input type="hidden" id="pageSize" value="${pageSize }">
	<input type="hidden" id="pageNum" value="${pageNumber }">
	<div class="fixed_top2">
		<img src="${ctx}/static/weixin/images/logistics/myCollection0.png" width="15px;" height="15px;">
		<span>我的收藏</span>
	</div>
	<div class="collection_content">
		<div class="collection_operBar">
			<div style="width:25%; color: #FDC006;" class="collection_oper borRight">供需</div>
			<div style="width:59%;" class="collection_oper"></div>
			<div style="clear:both;"></div>
		<div class="industry_dataBar dataBarChange" ></div>
		</div>
		<div style="background-color: #fff">
		<div id="listView" style="text-align: center;background-color: #fff"></div>
		<div style="clear: both;"></div>
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
				“<span style="color: #FF6707;">收藏的供需已取消</span>”
			</div>
			<div><span id="seconds2">3</span>秒后自动关闭</div>
		</div>
	
	<div class="navigationBar">
		<ul>   
			<li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage"><img src="${ctx}/static/weixin/images/supply/homepage.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">首页</div>
				</a></li>
			<li><a href="${ctx}/auth/page/mobile/weixin/supply/main">
					<div class="navImage"><img src="${ctx}/static/weixin/images/supply/demandSupply.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">供应需求</div>
				</a></li>
			<li><a href="${ctx}/supply/findEnterprise">
					<div class="navImage"><img src="${ctx}/static/weixin/images/show/findEnterprised.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">企业</div>
				</a></li>
			<li><a href="javascript:;" class="viewMore">
					<div class="navImage"><img src="${ctx}/static/weixin/images/supply/more_yellow.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">更多服务</div>
				</a></li>
		</ul>
		<div id="viewMore">
			<ul style="margin-top:-95px;"> 
				<!-- <li style="border-bottom:1px solid #E6E6E6;"><a href="myLeaveAMessage.html">我的留言</a></li> -->
				<li style="border-bottom:1px solid #E6E6E6;"><a href="${ctx}/supply/myCollection">我的收藏</a></li> 
				<li><a href="${ctx}/supply/mySupplyDemand">我的供需</a></li> 
			</ul>
		</div>
	</div>
</div>
</body>
</html>
