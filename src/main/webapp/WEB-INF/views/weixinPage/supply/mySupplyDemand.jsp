<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我的供需</title>
<link href="${ctx}/static/weixin/css/supply/mySupplyDemand.css" rel="stylesheet"/>
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
	
	$("#proList").hide();
	$('#tbox').hide();
	getSupplyDemandList(1, "");
 });
 $(document).ready(function() {
	    $(window).scroll(function() {
	        if ($(document).scrollTop() + $(window).height() > $(document).height()-1 && !$('#getMore').is(":hidden")) {
	        	$(".renovate").attr("onclick","");
				setTimeout(function() {
					getMore();
					$(".renovate").attr("onclick","getMore();");
				}, 1000);
	        }
	        if($(document).scrollTop()>0){
	        	$('#tbox').show();
	        }else{
	        	$('#tbox').hide();
	        }
	    });
	});
 	/*异步加载我的供需*/
 	suggestPageNum = 0;
	function getSupplyDemandList(pageNum, searchType) {
		$
				.ajax({
					url : "${ctx}/supply/json/mySupplyDemand",
					type : "get",
					data : {
						"pageNumber" : pageNum,
						"searchType" : searchType
					},
					dataType : "json",
					success : function(result) {
						var list = result.value;
						var addrMap = result.jsonValue;
						var pageSize = 10;
						if (result.code == 1 || result.code == 0) {
							suggestPageNum++;
							for (var i = pageSize * (pageNum - 1); i < pageSize
									* (pageNum - 1) + list.length; i++) {
								var info = list[i % pageSize];
						var _div ='<a href="javascript:void(0)" onclick="view(\''+info.id+'\')" style="text-decoration: none;">'
						+ '<div class="supplyDemand_dataBar">'
						+ '<img src="'+ info.pic_url +'" width="110px;" height="110px;" class="supplyDemand_img">'
						+ '<div class="supplyDemand_title">';
					if(info.type==0){
						_div+='<img src="${ctx}/static/weixin/images/supply/need.png" width="20px;" height="20px;">';
					}else{
						_div+='<img src="${ctx}/static/weixin/images/supply/give.png" width="20px;" height="20px;">'
					}
						_div+='<div class="supplyDemand_titleCont">'+info.product_name+'</div>'
						+ '</div>'
						+ '<div class="supplyDemand_company">'+info.company_name+'</div>'
						+ '<div class="supplyDemand_data">'
						+ '<div class="supplyDemand_add">';
						if(addrMap[info.id]==""){
							_div+='暂无地址';
						}else{
							_div+=addrMap[info.id];
						}
						_div+= '</div><div class="supplyDemand_time">'+info.create_time.substring(0, 10)+'</div>'
						+ '<div style="clear:both;"></div>'
						+ '</div>'
						+ '<div style="clear:both;"></div></div></a>';					
						$("#supplyDemand_operBar").append(_div);
							}
						} else if (result.code == 2) {
							$("#proList").show();
						} else {
							layer.msg("获取数据失败");
						}
						if (result.code !=1) {
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
		getSupplyDemandList(pageNumber);
	}

	
	//供需详情
	function view(id){
		window.location.href="${ctx}/supply/productDetails?id="+id +"&type=2";
	}
</script>
</head>

<body>
<div class="supplyDemand_main">
	<div class="fixed_top">
		<img src="${ctx}/static/weixin/images/show/findProducted.png" width="15px;" height="15px;">
		<span>我的供需</span>
	</div>
	<div class="supplyDemand_content">
		<div class="supplyDemand_operBar">
			<div style="width:20%;" class="supplyDemand_oper borRight">全部</div>
			<div style="width:79%;" class="supplyDemand_oper"></div>
			<div style="clear:both;"></div>
		</div>
		
		
		<div style="background-color: #fff;">
			<div style="padding-top: 5px;" id="supplyDemand_operBar"></div>
				<div style="text-align: center;line-height:30" >
					<span id="proList" class="renovateTitle" style="color:#646464;">暂无供需</span>
				</div>
			<div style="clear:both;"></div>
		</div>
		<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		<div id="tbox">
			<a id="gotop" href="#top"></a>
		</div>
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
				<li style="border-bottom:1px solid #E6E6E6;"><a href="${ctx}/supply/mySupplyDemand">我的供需</a></li> 
			</ul>
		</div>
	</div>
</div>
</body>
</html>
