<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>供应需求</title>
<link href="${ctx}/static/weixin/css/supply/supplyDemandDocking.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<script src="${ctx}/static/script/jquery.lazyload.min.js"></script>
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
	var suggestPageNum = 0;
	var pageNumber = 1;
	$(function() {
		$(".search").click(function() {
			var div = $("#dropdown");
			if (div.css("display") == "none") {
				hideAllDropdown();
				div.slideDown("fast");
				$(".search").addClass("colorDeep");
				$(".hidebg").show();
			} else {
				hideAllDropdown();
			}
		});
		$(".viewMore").click(function() {
			var ul = $("#viewMore ul");
			if (ul.css("display") == "none") {
				hideAllDropdown();
				ul.slideDown("fast");
			} else {
				hideAllDropdown();
			}
		});
		$("#viewMore ul li a").click(function() {
			hideAllDropdown();
		});

		$("#proList").hide();
		$('#tbox').hide();
		$('#searchHotBar').hide();

		/*第一次 异步加载找供求 */
		$('.searchType').val("");
		pageNumber = 1;
		$('.pageNumber').val(1);
		getproductList();
	})

	/* 异步加载找供求  */
	function getproductList() {
		$.ajax({
					url : "${ctx}/supply/json/main",
					type : "post",
					data : $('#form').serialize(),
					dataType : "json",
					success : function(result) {
						var list = result.value;
						var collect = result.jsonValue;
						var address = result.jsonValue1;
						/* var divwidth = document.body.clientWidth;
						var divWidth = (divwidth-6)*0.35; 
						height="'+divWidth+'px"*/
						var pageSize = 10;
						if (result.code == 1 || result.code == 0) {
							if (pageNumber == 1) {
								$("#listView").empty();
							} 
							suggestPageNum++;
							for (var i = pageSize * (pageNumber - 1); i < pageSize
									* (pageNumber - 1) + list.length; i++) {
								var info = list[i % pageSize];
								var id=info.id;
								var _divList = '<a href="javascript:void(0)" onclick="view(\''+info.id+'\')" style="text-decoration: none;">'
										+ '<div class="supplyDemand_dataBar">'
										+ '<img  data-original="'
										+info.pic_url
										+'" width="110px;" height="110px" class="supplyDemand_img">'
										+ '<div class="supplyDemand_title">';
										if(info.type==0){
											_divList+='<img src="${ctx}/static/weixin/images/supply/need.png" width="20px;" height="20px;">';
										}else{
											_divList+='<img src="${ctx}/static/weixin/images/supply/give.png" width="20px;" height="20px;">'
										}
										_divList+='<div class="supplyDemand_titleCont">';
										if (info.product_name.length <= 19) {
									    _divList += '<span>'
											+ info.product_name + '</span>';
								        } else {
									   _divList += '<span title="'+info.product_name+'">'
											+ info.product_name
													.substring(0, 20)
											+ '...</span>';
								        }
										
										_divList+='</div></div><div class="supplyDemand_company">'
										+ info.company_name
										+ '</div><div class="supplyDemand_data">'
										+ '<div class="supplyDemand_add" style="margin-top: -8px">';
										if(address[id]==undefined || address[id]=='null null'){
											_divList+='暂无地址';
										}else{
											_divList+=address[id];
										}
										_divList+='</div><div class="supplyDemand_time">'
										+ info.create_time.substring(0, 10)
										+ '</div>';
										if(collect[id]==1){
											_divList +='<img class='+info.id+' value="1" src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="position:absolute; top:-90%; right:10px;"onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
										}else{
									 		_divList +='<img class='+info.id+' value="0" src="${ctx}/static/weixin/images/logistics/notCollected.png" width="20px;" height="20px;" style="position:absolute; top:-90%; right:10px;" onclick="event.cancelBubble = true;collectAction(\''+info.product_name+'\',\''+info.id+'\');">';
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
						if (result.code != 1) {
							$('#getMore').hide();
						}
						//懒加载
						$(".supplyDemand_img").lazyload({ 
							  placeholder : "${ctx}/static/image/loading.gif",
					                 effect: "fadeIn"
					          }); 
					},
					error : function() {
						layer.alert("系统异常");
					}
				});
	}

	/* 加载更多 */
	function getMore() {
		pageNumber++;
		$('.pageNumber').val(pageNumber);
		if(currentType==2){
			getproductList();
		}else{
			getproductList();
		}
	}
	
	/* 搜索供需类型 */
	currentType = 2;//0需求 1供应 2全部
	function changeType(i) {
		$('#proList').hide();
		suggestPageNum = 0;
		pageNumber = 1;
		$("#listView").empty();
		$('#typeBtn_' + currentType).removeClass("boldOption");
		currentType = i;
		$('#typeBtn_' + i).addClass("boldOption");
		pageNumber = 1;
		$('.pageNumber').val(1);
		if(i==2){
			$('.searchType').val("");
			getproductList();
		}else{
			$('.searchType').val(i);
			getproductList();
		}
	}

	/**
	 **输入框点击事件
	 */
	function searchResult() {
		var searchOptions = $("#searchOptions");
		if (searchOptions.css("display") == "none") {
			hideAllDropdown();
			searchOptions.slideDown("fast");
			$(".hidebg").show();
		} else {
			hideAllDropdown();
		}
	}

	/**
	 **隐藏所有下拉框
	 */
	function hideAllDropdown() {
		$(".hidebg").hide();
		$("#viewMore ul").slideUp('fast');
		$(".search").removeClass("colorDeep");
		$("#dropdown").slideUp('fast');
		$("#searchOptions").slideUp('fast');
	}

	/** 左边下拉框中按钮点击事件 **/
	function optionClick(obj) {
		$('.optionBtn').each(function (index, item) {
			$(item).removeClass("selected");
		});
		$(obj).addClass("selected");
		$('#proList').hide();
		$("#listView").empty();
		$('.searchKey').val($(".searchInput").val());
		var optionId = $(obj).attr("value");
		if (optionId == 0) {
			$('.categoryId').val("");
		} else {
			$('.categoryId').val(optionId);
		}
		pageNumber = 1;
		$('.pageNumber').val(pageNumber);
		getproductList();
		$("#dropdown").slideUp("fast");
		$(".search").removeClass("colorDeep");
		$(".hidebg").css("display", "none");
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
		} else {
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

	/* 关键字搜索 */
	function queryByKey(key) {
		hideAllDropdown();
		$("#listView").empty();
		$('.searchKey').val($(".searchInput").val());
		$('.isSearch').val($(".searchInput").val());
		pageNumber = 1;
		$('.pageNumber').val(pageNumber);
		suggestPageNum = 0;
		getproductList();
		if(key!="" && key!=null){
			$("#searchHot").html(key);
			$("#searchHotBar").show();
			$("#topDistance").css("margin-top","100px");
		}
		$(".hidebg").css("display", "none");
	}

	/* 点击热搜关键字按钮 */
	function infoBtnClick(){
		$("#searchHotBar").hide();
		$("#topDistance").css("margin-top","50px");
		$('.searchKey').val("");
		pageNumber = 1;
		suggestPageNum = 0;
		getproductList();
		queryByKey("");
		$("#inputBox").val("");
	}

	function searchOptionClick(obj) {
		hideAllDropdown();
		$(".searchInput").val($(obj).text())
		$('.searchKey').val($(".searchInput").val());
		$('.isSearch').val($(".searchInput").val());
		pageNumber = 1;
		$('.pageNumber').val(pageNumber);
		suggestPageNum = 0;
		$("#searchHot").html($(obj).text());
		$("#searchHotBar").show();
		$("#topDistance").css("margin-top","100px");
		getproductList();
	}
</script>
</head>

<body>
	<form name="form" id="form">
		<input type="hidden" name="searchKey" class="searchKey"></input>
		<input type="hidden" name="pageNumber" class="pageNumber" value="1"></input>
		<input type="hidden" name="isSearch" class="isSearch" value="1"></input>
		<input type="hidden" name="categoryId" class="categoryId"></input>
		<input type="hidden" name="searchType" class="searchType"></input>
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	</form>
	<div class="hidebg"></div>
	<div class="supplyDemand_main">
		<div class="supplyDemand_content">
			<div class="searchBar">
				<div class="search">
					<img src="${ctx}/static/weixin/images/activity/sort.png" width="28px;" height="28px;" style="margin: 14px 12px;margin-top:10px;" />
				</div>
				<input id="inputBox" type="search" class="searchInput" onsearch="queryByKey(this.value);" onClick="searchResult();" placeholder="请输入搜索关键字" style="margin-left: 5px;vertical-align:middle"/>
				<div class="message">
					<img src="${ctx}/static/weixin/images/logistics/comments.png" width="28px;" height="28px;" style="margin: 14px 12px;margin-top:10px;" />
				</div>
				<div style="clear: both;"></div>
			</div>
			<div id="dropdown">
				<div class="dropdownContent">
					<div id="typeAll" class="optionBtn selected" onclick="optionClick(this)" value='0'>不限</div>
					<c:forEach items="${sortInfoList}" var="info">
						<div class="optionBtn" onclick="optionClick(this)" value='${info.id}'>${info.name}</div>
					</c:forEach>
				</div>
			</div>
			<div id="searchOptions">
				<div style="font-size: 16px; padding: 6px 10px;">关键字</div>
				<div class="options_1" style="background-color: #FFF; padding: 5px 12px;">
					<c:forEach items="${keys}" var="info">
						<div class="optionBtn" onClick="searchOptionClick(this)">${info.keys}</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>

			<div id="topDistance" style="margin-top: 50px;"></div>
			<div id="searchHotBar" class="info_top">
				<div class="infoBtn" onclick="infoBtnClick();" style="position:relative"><span id="searchHot">螺旋</span>
				<img src="/XProject/static/weixin/images/show/close.png" width="10px;" height="10px;" style="position:absolute;top:-5px;right:-5px;"></div>
			</div>

			<div style="margin-top: 60px;"></div>
			<div class="supplyDemand_operBar">
				<div id="typeBtn_2" style="width: 20%;" onclick="changeType(2);" class="supplyDemand_oper borRight boldOption">全部</div>
				<div id="typeBtn_1" style="width: 20%;" onclick="changeType(1);" class="supplyDemand_oper borRight">供应</div>
				<div id="typeBtn_0" style="width: 20%;" onclick="changeType(0);" class="supplyDemand_oper borRight">需求</div>
				<div style="width: 18%;" class="supplyDemand_oper"></div>
				<div class="supplyDemand_oper borLeft boldOption" style="width: 20%; float: right;">全国</div>
				<div style="clear: both;"></div>
			</div>
			<div style="background-color: #fff;">
				<div id="listView" style="padding-top: 5px;"></div>
				<div style="text-align: center;line-height: 30;">
					<span id="proList" class="renovateTitle" style ="color: #646464;">暂无供需</span>
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
		<div class="navigationBar">
			<ul>
				<li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/supply/homepage.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">首页</div>
				</a></li>
				<li><a href="${ctx}/auth/page/mobile/weixin/supply/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/supply/demandSupply_yellow.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">供应需求</div>
				</a></li>
				<li><a href="${ctx}/supply/findEnterprise">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/supply/findEnterprised.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">企业</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/logistics/more.png" width="20px;" height="20px;" style=" margin-top: 6%"/>
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -95px;">
					<!-- <li style="border-bottom:1px solid #E6E6E6;"><a href="myLeaveAMessage.html">我的留言</a></li> -->
					<li style="border-bottom:1px solid #E6E6E6;"><a href="${ctx}/supply/myCollection">我的收藏</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/supply/mySupplyDemand">我的供需</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
