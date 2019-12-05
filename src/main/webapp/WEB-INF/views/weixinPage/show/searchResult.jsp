<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>搜索结果</title>
<link href="${ctx}/static/weixin/css/show/searchResult.css" rel="stylesheet"/>
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
var pageNumber =1;
var productListCount =0;
 $(function(){
	$(".search").click(function() {
		$("#dropdownPrice").css("display", "none");
		$("#dropdownMOQ").css("display", "none"); 
		var div = $("#dropdown");
		if(div.css("display")=="none"){ 
			div.slideDown("fast"); 
			$(".search").addClass("colorDeep");
			$(".hidebg").css("display","block");
		}else{ 
			div.slideUp("fast"); 
			$(".search").removeClass("colorDeep");
			$(".hidebg").css("display","none");
		}
	});

	$(".price").click(function(){
		$(".result_oper").each(function(index, item) {
			$(item).removeClass("selecter");
		});
		$(".price").addClass("selecter");
		$("#dropdownMOQ").css("display","none");
		var div = $("#dropdownPrice");
		if(div.css("display")=="none") {
			div.slideDown("fast"); 
		}else{ 
			div.slideUp("fast"); 
		}
	});

	$(".moq").click(function(){ 
		$(".result_oper").each(function(index, item) {
			$(item).removeClass("selecter");
		});
		$(".moq").addClass("selecter");
		$("#dropdownPrice").css("display","none");
		var div = $("#dropdownMOQ"); 
		if(div.css("display")=="none"){ 
			div.slideDown("fast");
		}else{ 
			div.slideUp("fast");
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

	$('#listView').hide();
	$("#proList").hide();
	$('#tbox').hide();
	productListCount = 0;
	pageNumber =1;
	$('#pageNumber').val(pageNumber);
	$('#parkId').val('${info.company_id}');
	getResult();
 })
	
	function dropdownPriceConfirm() {
		$(".popularity").val("");
		if ($(".price").val() == "") {
			$(".price").val('desc')
		}
		$("#dropdownPrice").css("display", "none");
		pageNumber =1;
		$('#pageNumber').val(pageNumber);
		productListCount = 0;
		var start = $('#price1').val();
		var end = $('#price2').val();
		if (start > end) {
			$('.minPrice').val(end);
			$('.maxPrice').val(start);
		} else {
			$('.minPrice').val(start);
			$('.maxPrice').val(end);
		}
		if ($('.choose1').css("display") == "none") {
			$('.price').val('asc');
		} else {
			$('.price').val('desc');
		}
		getResult();
	}
	function dropdownPriceCancel() {
		$("#dropdownPrice").css("display", "none");
	}
	function dropdownMOQConfirm() {
		$("#dropdownMOQ").css("display", "none");
		pageNumber = 1;
		$('#pageNumber').val(pageNumber);
		productListCount = 0;
		var start = $('#count1').val();
		var end = $('#count2').val();
		if (start > end) {
			$('.startNum').val(end);
			$('.endNum').val(start);
		} else {
			$('.startNum').val(start);
			$('.endNum').val(end);
		}
		getResult();
	}
	function dropdownMOQCancel() {
		$("#dropdownMOQ").css("display", "none");
	}

	function borBottomClick () {
		$('.choose1').show();
		$('.choose2').hide();
	}

	function borBottomClick2 () {
		$('.choose2').show();
		$('.choose1').hide();
	}

	function searchResult() {
		$("#dropdown").css("display", "none");
		$("#dropdownPrice").css("display", "none");
		$("#dropdownMOQ").css("display", "none");
		$(".hidebg").css("display","none");
		$(".search").removeClass("colorDeep");
		var div = $("#searchOptions");
		if (div.css("display") == "none") {
			div.slideDown("fast");
			$(".hidebg").show();
		} else {
			div.slideUp("fast");
		}
	}

	/* 关键字搜索 */
	function queryByKey(key) {
		setTimeout(function(){
			$('#searchText').val($(".searchInput").val());
			$("#searchOptions").slideUp("fast");
			$(".hidebg").hide();
			pageNumber = 1;
			$('#pageNumber').val(pageNumber);
			productListCount = 0;
			getResult();
		},200)
	}

	function searchOptionClick(obj) {
		$(".optionBtn").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(obj).addClass("selected");
		$("#dropdown").slideUp("fast");
		$(".search").removeClass("colorDeep");
		$(".hidebg").hide();
		$(".searchInput").val($(obj).text());
		$('#searchText').val($(obj).text());
		pageNumber = 1;
		$('#pageNumber').val(pageNumber);
		productListCount = 0;
		getResult();
	}

	function optionClick(obj) {
		var search_id = $('#id').val();
		$(".optionBtn").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(obj).addClass("selected");
		$("#dropdown").slideUp("fast");
		$(".search").removeClass("colorDeep");
		$(".hidebg").css("display","none");
		productListCount = 0;
		pageNumber = 1;
		$("#listView").empty();
		$("#gridView").empty();
		$('#pageNumber').val(pageNumber);
		if ($(obj).attr("value") == null || $(obj).attr("value") == "") {
			search_id = "";
		} else {
			search_id = $(obj).attr("value");
		}
		$('.id').val(search_id);
		getResult();
	}

	function popularityClick (obj) {
		$("#dropdownPrice").css("display", "none");
		$("#dropdownMOQ").css("display", "none"); 
		$(".result_oper").each(function(index, item) {
			$(item).removeClass("selecter");
		});
		$(obj).addClass("selecter");
		$('.price').val('');
		pageNumber = 1;
		$('#pageNumber').val(pageNumber);
		productListCount = 0;
		var str = $('.popularity').val();
		if (str == 'desc') {
			$('.popularity').val('asc');
		} else {
			$('.popularity').val('desc');
		}
		getResult();
	}

	function mainButtonClick(obj) {
		$("#dropdownPrice").css("display", "none");
		$("#dropdownMOQ").css("display", "none"); 
		$(".result_oper").each(function(index, item) {
			$(item).removeClass("selecter");
		});
		$(obj).addClass("selecter");
		$('.popularity').val('');
		$('.price').val('');
		pageNumber = 1;
		$('#pageNumber').val(pageNumber);
		productListCount = 0;
		getResult();
	}

function getMore() {
	pageNumber++;
	$('#pageNumber').val(pageNumber);
	getResult();
}

viewType = 1//0为listView 1为gridView
function changeViewType(){
	if(productListCount>0){
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
//加载更多自动加载
$(document).ready(
		function() {
			$(window)
					.scroll(
							function() {
								if ($(document).scrollTop()
										+ $(window).height() > $(document)
										.height() - 1) {
									setTimeout(function() {
										getMore();
									}, 1000);
								}
								if ($(document).scrollTop() > 0) {
									$('#tbox').show();
								} else {
									$('#tbox').hide();
								}
							});
		});

	function getResult() {
		getInfoLabel();
		$('#rebivateTip').hide();
		$.ajax({
			url : "${ctx}/show/json/main",
			type : "post",
			data : $('#form').serialize(),
			dataType : "json",
			success : function(result) {
			if (result.code == -1) {
				layer.alert(result.msg);
			} else if (result.code == 2) {
				if ($('#rebivateTip').length > 0) {
					$('#rebivateTip').show();
					$("#getMore").hide();
				} else {
					$(".industry_cont")
						.append(
								'<span id="rebivateTip" class="renovateTitle" style = "margin-left: 35%;margin-top: 20%;">暂无更多信息</span>');
					$("#getMore").hide();
				}
			} else {
				var list = result.value;
				var collect = result.jsonValue;

				if (list == null) {
					return;
				}
				if (pageNumber == 1) {
					$("#listView").empty();
					$("#gridView").empty();
				}
				productListCount += list.length;
					for(var i=10*(pageNumber-1);i<10*(pageNumber-1)+list.length;i++){
						var info = list[i%10];
						_divList = '<a href="javascript:void(0)" onclick="view(\''+info.id+'\')" style="text-decoration: none;">'
						+'<div style="color: #5e5e5e; padding: 10px 0; font-size: 12px; border-bottom: 1px solid #e6e6e6; position: relative; background-color: #fff;">'
						+'<img src="'+info.pic_url+'" style="float: left; width: 30%; height:100px; margin-right: 20px;margin-left: 10px;">'
						+'<div style="float: left; width: 56%;">'
						+'<div style="font-weight: bold; margin: 4px 0;">'
						+'<img src="${ctx}/static/weixin/images/show/hot.png" width="20px;" height="10px;">'+info.product_name
						+'</div><div style="font-weight: bold; color: #ccc; margin: 15px 0;">起订量>='+info.order_num+'件</div>'
						+'<div class="entProduct_price" style="float: left; padding: 1px 5px;">￥'+info.price+'</div>'
						+ '<div style="float: left;color:#5e5e5e;">/'+getUnit(info.order_unit)+'</div>';
						 var id=info.id;
						 if(collect[id]==1){
							 _divList +='<img class='+info.id+' class="isCollectImg" value="1" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="25px;" height="25px;" style="float: right;margin-right: 7px;"onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
						}else{
							 _divList +='<img class='+info.id+' class="isCollectImg" value="0" src="${ctx}/static/weixin/images/logistics/notCollected.png" width="25px;" height="25px;" style="float: right;margin-right: 7px;" onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
						}
						 _divList +='</div><div style="clear: both;"></div></div></a>';
						$("#listView").append(_divList);	

						var _divGrid="";
						_divGrid += '<a href="javascript:void(0)" onclick="view(\''+info.id+'\')" style="text-decoration: none;">'
						+'<div class="industry_dataBar" style="color: #5e5e5e;border-bottom: 1px solid #e6e6e6;position: relative;">';
						if(info.pic_url == null){
							_divGrid +='<img src="${ctx}/static/weixin/images/show/advertise.png" width="100%;" height="150px;"/>'; 
						}else{
							_divGrid +='<img src="'+info.pic_url+'" width="100%;" height="150px;"/>';
						}
						_divGrid +='<div style="font-size: 12px;height: 40px;overflow: hidden; color: #5e5e5e;">'; 

						if(info.product_name.length<=30 ){ 
							_divGrid += '<span>'+info.product_name+'</span>';
						}else{
							 _divGrid += '<span title="'+info.product_name+'">'+info.product_name.substring(0,30)+'...</span>';
						}

						_divGrid +='</div><div><div class="industry_price" style="float: left;">￥'
						+ info.price
						+'</div><div style="float: left;color:#5e5e5e;">/' + getUnit(info.order_unit) + '</div>';
						if(collect[id]==1){
							_divGrid +='<img class='+info.id+' value="1" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="25px;" height="25px;" style="float: right;padding-right:5px;" onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
						}else{
							_divGrid +='<img class='+info.id+' value="0" src="${ctx}/static/weixin/images/logistics/notCollected.png" width="25px;" height="25px;" style="float: right;padding-right:5px;" onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
						}
						_divGrid += '<div style="clear: both;"></div></a>';
						$("#gridView").append( _divGrid);
				}
				$(".industry_cont").append(
						'<div style="clear:both;"></div>'); 
				if (result.code == 1) {
					$("#getMore").show();
				} else {
					$("#getMore").hide();
				}
				$(document).scrollTop(0);
			}

		},
		error : function() {
			layer.alert("系统异常");
		}
		});
	}

	function getInfoLabel() {
		$('.info').empty();
		if ($('.minPrice').val() != "") {
			var minP = $('.minPrice').val();
			var maxP = $('.maxPrice').val();
			$('.info').append('<div class="infoBtn" value="1" onClick="infoBtnClick(this);" style="position:relative">价格' + minP + '-' + maxP + '<img src="${ctx}/static/weixin/images/show/close.png" width="10px;" height="10px;" style="position:absolute;top:-5px"></div>');
			$('.info').addClass('info_top');
		}
		if ($('.startNum').val() != "") {
			var minN = $('.startNum').val();
			var maxN = $('.endNum').val();
			$('.info').append('<div class="infoBtn" value="2" onClick="infoBtnClick(this);" style="position:relative">订量' + minN + '-' + maxN + '<img src="${ctx}/static/weixin/images/show/close.png" width="10px;" height="10px;" style="position:absolute;top:-5px"></div>');
			$('.info').addClass('info_top');
		}
		if ($('#searchText').val() != "") {
			var stext = $('#searchText').val();
			$('.info').append('<div class="infoBtn" value="3" onClick="infoBtnClick(this);" style="position:relative">' + stext + '<img src="${ctx}/static/weixin/images/show/close.png" width="10px;" height="10px;" style="position:absolute;top:-5px"></div>');
			$('.info').addClass('info_top');
		}
		if ($('.info').html() == "") {
			$('.info').removeClass('info_top');
		}
	}

	function infoBtnClick(obj) {
		var info = $(obj).attr('value');
		if (info == 3) {
			$('#searchText').val("");
			$('.searchInput').val("");
		} else if (info == 2) {
			$('.startNum').val("");
			$('.endNum').val("");
		} else if (info == 1) {
			$('.minPrice').val("");
			$('.maxPrice').val("");
		}
		pageNumber = 1;
		$('#pageNumber').val(pageNumber);
		productListCount = 0;
		getResult();
	}
	function view(id){
		window.location.href="${ctx}/show/productDetails?id="+id +"&type=1";
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
	/* 单位转换 */
	function getUnit(i){
		var unitMap = ${unitMap};
		return unitMap[i];
	}
</script>
</head>

<body>
<form action="${ctx}/auth/page/mobile/weixin/show/main" name="form" id="form"
	method="post">
	<input type='hidden' name='id' class="id"></input>
	<input type='hidden' name='isSearch' class="isSearch" value='${isSearch}'></input>
	<input type='hidden' name='popularity' class="popularity"></input>
	<input type='hidden' name='price' class="price"></input>
	<input type='hidden' name='minPrice' class="minPrice"></input>
	<input type='hidden' name='maxPrice' class="maxPrice"></input>
	<input type='hidden' name='startNum' class='startNum'></input>
	<input type='hidden' name='endNum' class='endNum'></input>
	<input type='hidden' name='pageNumber' id='pageNumber'></input>
	<input type='hidden' name='parkId' id='parkId' value=''></input>
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	<input type='hidden' name='searchText' id='searchText' value='${isSearch}'></input>
</form>
<div class="hidebg"></div>
<div class="result_main">
	<div class="result_content">
		<div class="searchBar">
			<div class="search">
				<img src="${ctx}/static/weixin/images/activity/sort.png" width="20px;" height="20px;" style="margin:14px 10px;"/>
			</div>
			<input type="search" class="searchInput" placeholder="产品搜索" onsearch="queryByKey(this.value);" onClick="searchResult();" value="${isSearch}"/>
			<div class="home_position">
					<img src="${ctx}/static/weixin/images/personalCenter/map.png" width="15px" height="15px" style="vertical-align:middle;">
					<span class="home_add">全国</span>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div id="dropdown">
			<div class="dropdownContent">
				<div class="optionBtn selected" onClick="optionClick(this)">不限</div>
				<c:forEach items="${allRoot}" var="info">
					<div class="optionBtn" onClick="optionClick(this)" value='${info.type_id}'>${info.type_name}</div>
				</c:forEach>
			</div>
		</div>
		
		<div style="margin-top:50px;"></div>
		<div class="info">
		</div>
		<div class="result_operBar">
			<div style="width:15%;" class="result_oper borRight selecter" onClick="mainButtonClick(this);">综合</div>
			<div style="width:15%;" class="result_oper" onClick="popularityClick(this);">人气</div>
			<div style="width:25%;" class="result_oper price">价格<img src="${ctx}/static/weixin/images/show/down.png" width="10px;" height="10px;" style="position:absolute; right:15px;margin-right: 43%; margin-top: 1.5%;"></div>
			<div style="width:29%;" class="result_oper moq">起订量<img src="${ctx}/static/weixin/images/show/down.png" width="10px;" height="10px;" style="position:absolute; right:15px;margin-right: 14%; margin-top: 1.5%;"></div>
			<div style="width:15%;" class="result_oper borLeft" onclick="changeViewType();">
				<img id="changeView" src="${ctx}/static/weixin/images/show/block.png" width="20px;" height="20px;" style="display:block; margin:0 auto;">
			</div>
			<div style="clear:both;"></div>
		</div>
		<div id="dropdownPrice">
			<div class="dropdownPriceCont">
				<div class="borBottom">
					价格区间（元）
					<div style="padding:5px 10px;">
						<input id="price1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" style="width:30%;" placeholder="最低价">
						&nbsp;—&nbsp;
						<input id="price2" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" style="width:30%;" placeholder="最高价">
					</div>
				</div>
				<div class="borBottom" style="padding:5px 0;" onClick="borBottomClick();">
					价格由高到低
					<img class="choose1" src="${ctx}/static/weixin/images/show/choose.png" width="10px;" height="10px;" style="position:relative;right:15px;margin-left:50%;">
				</div>
				<div class="borBottom" style="padding:5px 0;" onClick="borBottomClick2();">
					价格由低到高
					<img class="choose2" src="${ctx}/static/weixin/images/show/choose.png" width="10px;" height="10px;" style="position:relative;right:15px;margin-left:50%; display:none">
				</div>
			</div>
			<div id="dropdownPriceButtons">
				<div id="searchButton1" onClick="dropdownPriceConfirm()">确定</div>
				<div id="searchButton2" onClick="dropdownPriceCancel()">取消</div>
			</div>
		</div>
		<div id="dropdownMOQ">
			<div class="dropdownMOQCont">
				<div style="border-bottom:1px solid #cbcbcb;">
					起订量<img src="${ctx}/static/weixin/images/show/choose.png" width="10px;" height="10px;" style="position:absolute; right:15px;margin-right: 2%; margin-top: 1.5%; display:none;">
					<div style="padding:5px 10px;">
						<input id="count1" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" style="width:30%;" placeholder="最低量">
						&nbsp;—&nbsp;
						<input id="count2" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" style="width:30%;" placeholder="最高量">
						<select style="padding:4px 3px;">
							<option>件</option>
						</select>
					</div>
				</div>
			</div>
			<div id="dropdownMOQButtons">
				<div id="searchButton1" onClick="dropdownMOQConfirm()">确定</div>
				<div id="searchButton2" onClick="dropdownMOQCancel()">取消</div>
			</div>
		</div>
		<div id="searchOptions">
			<div style="font-size: 16px; padding: 6px 10px;">关键字</div>
			<div class="options_1" style="background-color: #FFF; padding: 5px 12px;">
				<c:forEach items="${keys}" var="info">
					<div class="optionBtn" onClick="searchOptionClick(this)" value="${info.keys}">${info.keys}</div>
				</c:forEach>
				<div style="clear: both;"></div>
			</div>
		</div>
		<div class="industry_cont">
		<div id="gridView" ></div>
		<div id="listView"></div>
		<span id="proList" class="renovateTitle">暂无产品</span>
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

	
	
	
	<div class="navigationBar">
			<ul>
				<li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/personalCenter/shou.png"
							width="20px;" height="20px;" />
					</div>
					<div class="navTitle">首页</div>
				</a></li>
				<li><a href="${ctx}/auth/page/mobile/weixin/show/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/findProduct.png" width="20px;" height="20px;" />
					</div>
					<div class="navTitle">找产品</div>
				</a></li>
				<li><a href="${ctx}/show/findEnterprise">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/show/findEnterprised.png" width="20px;" height="20px;" />
					</div>
					<div class="navTitle">找企业</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/logistics/more.png" width="20px;" height="20px;" />
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -137px;">
<!-- 				<li style="border-bottom: 1px solid #E6E6E6;"><a href="javascript:;">留言处理</a></li> -->
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="myCollection">我的收藏</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/show/myProduct">我的产品</a></li>
					<li><a href="javascript:;">企业介绍</a></li>
				</ul>
			</div>
		</div>
</div>
</body>
</html>
