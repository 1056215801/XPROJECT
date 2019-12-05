<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>要素共享</title>
<link href="${ctx}/static/css/showFront/factorSharing.css"
	rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/buttons.css"
	rel="stylesheet" />
<script src="${ctx}/static/weixin/js/layer-v2.4/layer.js"></script>
<link href="${ctx}/static/plugins/select2/css/select2.css"
	rel="stylesheet" />

<style>
.select2-container .select2-choice {
    border-radius: 4px;
    border: 1px solid #e1e1e1;
    background-color: #fff;
    background-image: linear-gradient(to top, #fff 0%, #fff 50%);
}
.select2-drop-active {
    border: 1px solid #e1e1e1;
}
.select2-container .select2-choice .select2-arrow {
    border-left: 0px solid #aaa;
    border-radius: 0 4px 4px 0;
    background-image: linear-gradient(to top, #fff 0%, #fff 60%);
}
</style>
</head>
<body>
	<input type="hidden" id="pageNum" value="1" />
	<input type="hidden" id="categoryId" value="" />
	<input type="hidden" id="type" value="" />
	
	<div class="project_main">
		<div class="project_header">
			<%@ include file="../../common/header.jsp"%>
		</div>

		<div class="factor_content">
			<div class="factor_cont clearfix">
				<div class="dataStatisticsBar clearfix">
					<div class="dataStatistics">
						<font class="redFont_num">${supplyDemandCount.supply}</font>个&nbsp;供应信息
					</div>
					<div class="dataStatistics">
						<font class="redFont_num">${supplyDemandCount.demand}</font>个&nbsp;需求信息
					</div>
					<%-- <div class="projectSearch">
						<input type="text" placeholder="标签关键字" id="typeKey"  />
						<img src="${ctx}/static/image/projectDeclare/search.png" width="20" height="20" onclick="search();"/>
					</div> --%>
				</div>
				<div style="margin-top: 10px;">
					<div class="factor_contLeft">
						<div class="titleName clearfix">
							<ul>
								<li onclick="setType('2');"><a href="javascript:;">全部</a></li>
								<li onclick="setType('1');"><a href="javascript:;">供应</a></li>
								<li onclick="setType('0');"><a href="javascript:;">求购</a></li>
								<!-- <li onclick="setType(3);"><a href="javascript:;">我发布的</a></li> -->
							</ul>
							<div class="searchBar">
								<input type="text" id="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;" /> 
								<img src="${ctx}/static/image/product/sea.png" width="15" height="15" onclick="search();">
							</div>
							<div class="selectBar">
								<select id="loc_province" style="width: 120px;"></select> 
								<select id="loc_city" style="width: 120px; margin-left: 10px"></select> 
								<input type="hidden" id="provinceName" /> 
								<input type="hidden" id="areaName" />
							</div>
						</div>
						<div class="titleItem">
							<div>
								<div class="searchOptions">
									<div id="allKeys" class="optionBtn selected" onclick="searchAll();">全部</div>
									<div class="searchOptions" id="declareGrade">
										<c:forEach items="${categoryList}" var="item" varStatus="n">
											<div class="optionBtn" onclick="selectByKey(this,'${item.id}');">${item.name}</div>
										</c:forEach>
									</div>
									<div style="clear: both;"></div>
								</div>
								<div class="factorDisplayBar clearfix"></div>
								<div id="displayMore" style="margin: 10px 0;background-color: rgb(247, 247, 247);">
									<a href="javascript:void(0);" onClick="getmore();" class="renovate"> 
										<span class="renovateTitle">加载更多</span>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="factor_contRight">
						<div class="buttonBar">
							<button class="button button-raised buttonContral" onClick="publish()">
								<img src="${ctx}/static/image/logistics/goods.png" width="30" height="30" class="buttonImg">发布供需
							</button> 
						</div> 
						<div class="productSideBar">
							<div class="productSideTop">
								<div class="productSideTopTitle">热门企业推荐</div>
								<!-- <div class="productSideTopMore">更多></div> -->
							</div>
							<div class="enterpriseRecommendBar">
								<c:forEach items="${companyList}" var="info">
									<a href="javascript:;">
										<div class="enterpriseRecommend" title="${info.companyName}">
											<c:choose>
												<c:when test="${empty info.logoUrl}">
													<img src="${ctx}/static/weixin/images/show/logo.png" width="100%" heigth="80px" style="border-radius: 50%;">
												</c:when>
												<c:otherwise>
													<img class="downloadImg" src="${info.logoUrl}"
														width="100%" height="80px" style="border-radius: 50%;">
												</c:otherwise>
											</c:choose>
											<div style="font-size: 12px; height: 35px; margin-top: 5px;">
												<c:choose>
													<c:when test="${fn:length(info.companyName)>13}">
														${info.companyName.substring(0,13)}...
													</c:when>
													<c:otherwise>
														${info.companyName}
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
						<div class="productSideBar">
							<div class="productSideTop">
								<div class="productSideTopTitle">热门供需推荐</div>
								<!--<div class="productSideTopMore">更多></div>-->
							</div>
							<div class="factorRecommendBar">
								<c:forEach items="${pushSypplyList}" var="info" varStatus="i">
									<c:if test="${i.index < 3}">
										<a href="${ctx}/showSupply/detail?id=${info.id}">
											<div class="factorRecommend clearfix">
												<c:choose>
													<c:when test="${empty info.picUrl}">
														<img src="${ctx}/static/weixin/image/product/defaultImage.png" width="110" height="110" style="float: left;" />
													</c:when>
													<c:otherwise>
														<img src="${info.picUrl}" width="110" height="110" style="float: left;" />
													</c:otherwise>
												</c:choose>
												<div class="factorRecommendTitle">
													<img src="${ctx}/static/weixin/images/supply/${info.type eq 0?'need':'give'}.png" width="20" height="20">
													<div>${info.productName}</div>
												</div>
												<div class="factorRecommendCompany">${info.companyName}</div>
												<div class="clearfix" style="position: relative; margin-top: 16px; margin-left: 120px;">
													<c:choose>
														<c:when test="${empty info.provinceName&&empty info.areaName}">
															<div class="factorRecommendAdd">暂无地址</div>
														</c:when>
														<c:otherwise>
															<div class="factorRecommendAdd">${info.provinceName}&nbsp;${info.areaName}</div>
														</c:otherwise>
													</c:choose>
													<div class="factorRecommendTime">长期有效</div>
												</div>
											</div>
										</a>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="../../common/footer.jsp"%>
	</div>
</body>
<script type="text/javascript"
	src="${ctx}/static/plugins/select2/js/area.js"></script>
<script type="text/javascript"
	src="${ctx}/static/plugins/select2/js/location.js"></script>
<script type="text/javascript"
	src="${ctx}/static/plugins/select2/js/select2.js"></script>
<script type="text/javascript"
	src="${ctx}/static/plugins/select2/js/select2_locale_zh-CN.js"></script>
<script>
	$(function() {
		$('.tabItem').children().eq(0).css({
			'display' : 'none'
		});
		$('.tabItem').children().eq(1).css({
			'display' : 'block'
		});
		$(".tabName ul li").each(
				function() {//页面头部模块切换控制
					var index = $(this).index();
					$(".tabName ul li").eq(1).addClass("nameClick");
					$(this).click(
							function() {
								$(this).addClass("nameClick").siblings()
										.removeClass("nameClick");
								$(".tabItem>ul").eq(index).stop(true).show()
										.siblings().stop(true).hide();
							})
				});
		$(".tabItem ul li").each(
				function() {
					$(".tabItem ul li").eq(6).addClass("itemClick");
					$(this).click(
							function() {
								$(this).addClass("itemClick").siblings()
										.removeClass("itemClick");
							})
				});
		$(".titleName ul li").each(
				function() {//页面内容切换控制
					var index = $(this).index();
					$(".titleName ul li").eq(0).addClass("titleClick");
					$(this).click(
							function() {
								$(this).addClass("titleClick").siblings()
										.removeClass("titleClick");
							})
				});
	})
</script>
<script>
	$(function() {
		var msg = '${message}';
		if (msg != null && msg != "") {
			tips(msg);
			msg = null;
		}

		//回车触发搜索事件
		$("#searchKey").bind('keydown', function(event) {
			if (event.keyCode == "13") {
				search();
			}
		});

		getInfoList(1);
	});

	
	function search() {
		getInfoList(1);
	}

	/* 异步获取供需数据 */
	function getInfoList(pageNum) {
		$('#displayMore').hide();
		if ($('#loc_province').val() != "") {
			$("#provinceName").val($('#loc_province').select2('data').text);
		} else {
			$("#provinceName").val("");
		}
		if ($('#loc_city').val() != "") {
			$("#areaName").val($('#loc_city').select2('data').text);
		} else {
			$("#areaName").val("");
		}
		if (pageNum == 1) {
			$('.factorDisplayBar').empty();
		}
		$('#pageNum').val(pageNum);
		var pageSize = 8;
		$.ajax({
					url : "${ctx}/interface/json/showSupply/searchList",
					type : "post",
					data : {
						'${_csrf.parameterName}':'${_csrf.token}',
						"pageNum" : pageNum,
						"pageSize" : pageSize,
						"searchKey" : $("#searchKey").val(),
						"type" : $("#type").val(),
						"categoryId" : $("#categoryId").val(),
						"provinceName" : $("#provinceName").val(),
						"areaName" : $("#areaName").val()
					},
					dataType : "json",
					success : function(result) {
						if (result.success) {
							var list = result.supplyList;
							var total = result.total;
							
							if(pageNum==1&&total==0){
								$('.factorDisplayBar').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
							}else{
								if(pageNum*pageSize<total){
									$('#displayMore').show();
								}
								
								for (var i = 0; i < list.length; i++) {
									var info = list[i];
									var _div = "";
									_div += "<a href=\'${ctx}/showSupply/detail?id=" + info.id + "\'";
									_div += "<div class=\'factorDisplay\'>";
									if (info.picUrl == null) {
										_div += "<img src=\'${ctx}/static/image/projectDeclare/defaultImage.png\' width=\'100%\' height=\'200px\' >";
									} else {
										_div += "<img src=\'"+ info.picUrl + "\' width=\'100%\' height=\'200px\' >";
									}
									_div += "  <div class=\'factorDisplayTitle\'>";
									if (info.type == 0) {
										_div += "<img src=\'${ctx}/static/weixin/images/supply/need.png\' width=\'25\' height=\'25\'>";
									} else {
										_div += "<img src=\'${ctx}/static/weixin/images/supply/give.png\' width=\'25\' height=\'25\'>";
									}
									_div += "<span>"+ subStr(info.productName, 9)+ "</span></div>";
									_div += "<div class=\'factorDisplayCompany\'>"+ subStr(info.companyName, 15)+ "</div>";
									_div += "  <div class=\'clearfix\' style=\'padding:5px;\'>";
									_div += "    <div class=\'factorDisplayAdd\'>";
									
									if (info.provinceName == null && info.areaName == null) {
										_div += '暂无地址';
									} else {
										_div += info.provinceName + info.areaName;
									}
									_div += "  </div><div class=\'factorDisplayTime\'>长期有效</div></div></div></a>";
									/* if (info.downTime != null) {
										_div += "    <div class=\'factorDisplayTime\'>"
												+ info.down_time.substring(0, 10)
												+ "过期</div></div>";
									} else {
										_div += "    <div class=\'factorDisplayTime\'>长期有效</div></div>";
									}
									_div += "</div></a>"; */
									$('.factorDisplayBar').append(_div);
								}
							}
							
						} else {
							layer.msg("获取数据异常");
						}
					},
					error : function() {
						tips("请求超时，请稍后重试");
					},
				});
		var $divWidth = $('.enterpriseRecommend>img').width();
		$('.enterpriseRecommend>img').css({
			'height' : $divWidth
		});
	}

	/* 全部 供应 需求切换 */
	function setType(type) {
		if (type == 2) {
			$('#type').val("");
		} else {
			$('#type').val(type);
		}
		getInfoList(1);
	}

	/* 分类搜索 */
	function selectByKey(obj, id) {
		$("#allKeys").removeClass("selected");
		$("#declareGrade .optionBtn").each(function() {
			if ($(this).hasClass("selected")) {
				$(this).removeClass("selected");
			}
		});
		$(obj).addClass("selected");
		$("#categoryId").val(id);
		getInfoList(1);
	}

	function searchAll() {
		$("#declareGrade .optionBtn").each(function() {
			if ($(this).hasClass("selected")) {
				$(this).removeClass("selected");
			}
		});
		$("#allKeys").addClass("selected");
		$("#categoryId").val("");
		getInfoList(1);
	}

	/* 加载更多供需 */
	function getmore() {
		getInfoList(parseInt($('#pageNum').val()) + 1);
	}

	function subStr(str, len) {
		if (str != undefined && str != null) {
			if (str.length > len) {
				return str.substring(0, len) + "...";
			}
		}
		return str;
	}
	
	function publish(){
		window.location.href = "${ctx}/login/page/show/validate?type=2";
	}
	$(function(){
		var isComplete = '${isComplete}';
		if(isComplete=='true'&&isComplete!=''&&isComplete!=null){
			layer.open({
				  id:'cframe',			
				  type: 2,
				  title: false,
				  closeBtn: 1, //不显示关闭按钮
				  shade: [.4],
				  area: ['1000px', '700px'],
				  anim: 2,
				  content: ['${ctx}/login/page/show/validateLogin?type=2'], //iframe的url，no代表不显示滚动条
				  btn: ['关闭'],
				  yes: function(index, layero){
					  layer.closeAll();
				  },cancel: function(){ 
					  
		          }
			});
		}else if(isComplete=='false'&&isComplete!=''&&isComplete!=null){
			layer.confirm('请完善企业信息！', {
				btn: ['确定', '再想想'], btn1:function(){
					window.location.href = "${ctx}/personalCenter/companyEdit?url=4";
	            }, btn2: function () {
	                
	            },cancel: function(){ 
	            	
	            }
	        });
		}
		
	});
</script>
</html>
