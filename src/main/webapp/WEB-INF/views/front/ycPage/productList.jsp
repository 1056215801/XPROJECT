<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../common/page.jsp"%><!-- 前端分页 -->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>产品展示</title>
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/product/industryDocking.css" rel="stylesheet" />
<style>
.buttonBar {
	padding:5px 0;
	text-align:center;
}
.buttonImg {
	position:relative;
	top:-2px;
	margin-right:10px;
}
.buttonContral {
	width:95%;
	border-radius:7px;
	height:70px!important;
	color:#f14241!important;
	font-size:26px!important;
	font-weight:bold!important;
	padding:10px 0!important;
}
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
.productDisplayPrice {
    float: left;
    background-color: #FFF;
    color: #F14240;
    padding: 0 4px 0 2px;
    margin-right: 2px;
}
</style>
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_content_header">
			<div class="container newNav">
			     <div class="newNavSub">
			     	<img src="${ctx}/static/image/homePage_yc/projectDsc.png" />
			     </div>
			    <div class="newNavSub">
			    	<p class="navTitle">产品展示</p>
			    	<p><font class="projectNum" id="projectNum1">0</font>&nbsp;
					<font id="font1">个</font> &nbsp;&nbsp; <font id="font2">产品正在热销</font></p>
			    </div>
			</div>
		</div>
		<div class="project_artical">
			<input type="hidden" id="pageNum" name="pageNum" value="1">
			<input type="hidden" id="type" name="type" value="1">
			<input type="hidden" id="orderType" name="orderType" value="0">
			<input type="hidden" id="industryId" name="industryId" value="">
			<input type="hidden" id="provinceName" name="provinceName" value="江西省">
			<input type="hidden" id="areaName" name="areaName" value="">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName">
								<ul>
									<li id="li1">宜春</li>
									<li id="li2">江西省</li>
									<li style="display: none">我发布的</li>
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" name="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;"/>
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" onclick="search()">
								</div>
							</div>
							<div class="MOQScreen">
								<span class="moqlabel">起订</span>
								<input type="number" id="orderNumMin" name="orderNumMin" maxlength="8"> 
								<span>-</span>
								<input type="number" id="orderNumMax" name="orderNumMax" maxlength="8">
								<div class="areaSearchBtn" onclick="getList(1)">搜索</div>
							</div>
							<div class="searchKeyBox">
								<div class="searchOptions open">展开</div>
								<div class="searchKeys searchKeys1">
									<div class="searchOptions"><span>分类</span></div>
									<div class="searchOptions options" id="declareGrade">
										<div class="optionBtn selected" onclick="selectByKey(this,'',2);">全部</div>
										<c:forEach items="${industryList.parentList}" var="item" varStatus="n">
											<div class="optionBtn" onclick="selectByKey(this,'${item.typeId}',2);">${item.typeName}</div>
										</c:forEach>
									</div>
								</div>
								<div class="searchKeys searchKeys2">
									<div class="searchOptions"><span>地域</span></div>
									<div class="searchOptions options" id="declareGrade2"></div>
								</div>
						    </div>	
							<div class="titleItem">
								<div class="title-content" id="set0">
									<div class="productDisplayBar clearfix" id="ycList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize0"></div>
										<div class="m-style M-box0"></div>
									</div>
								</div>
								<div class="title-content" id="set1" style="display: none">
									<!-- <div class="productScreenBar clearfix">
										<div class="sortOrder on" id="all">综合</div>
										<div class="sortOrder" id="popularityButton">人气<span id="popularityPic"></span></div>
										<div class="sortOrder" id="priceButton">价格<span id="pricePic"></span></div>
									</div> -->
									<div class="productDisplayBar clearfix" id="productList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize1"></div>
										<div class="m-style M-box1"></div>
									</div>
								</div>
								<div class="title-content" style="display: none;">此处为我发布的区域</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="fir-floor">
							<div class="publish-btn" onclick="publish()">
								<a href="javascript:;">
									<img alt="" src="${ctx}/static/image/homePage_yc/icon-ed.png" width="25">
									<h1>发布</h1>
								</a>
							</div>
						</div>
						<div class="products-new">
							<h3>热门企业排行</h3>
							<div class="enterpriseRecommendBar">
								<c:if test="${companyList==null || companyList==''}">
									<div style="width: 100%; text-align: center; padding: 100px 0;">
										<span class="renovateTitle">暂无更多信息</span>
									</div>
								</c:if>
								<c:if test="${companyList!=null && companyList!=''}">
									<c:forEach items="${companyList}" var="info" varStatus="k">
										<c:if test="${k.index < 8 }">
											<div class="enterpriseRecommend" title="${info.companyName}">
												<span class="${k.index < 3 ? 'bluebg' : ''}">${k.index + 1}</span>
												<font>${info.companyName}</font>
											</div>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<div class="products-new">
							<h3>热门产品推荐</h3>
							<div class="productRecommendBar" id="popProduct">
								<div class="swiper-container" id="swiper5">
									<div class="swiper-wrapper">
										<c:forEach items="${pushProductList}" var="info" varStatus="i">
											<div class="productRecommend swiper-slide" onclick="view('${info.id}')">
												<c:choose>
													<c:when test="${empty info.picUrl}">
														<img src="${ctx}/static/weixin/image/product/defaultImage.png" width="80" height="80" style="float: left;" />
													</c:when>
													<c:otherwise>
														<img src="${info.picUrl}" width="80" height="80" />
													</c:otherwise>
												</c:choose>
												<div class="productInfor">
													<div class="productRecommendName" title="${info.productName}">${info.productName}</div>
													<p>${info.companyName}</p>
													<div class="productNumPrice">
														<c:choose>
															<c:when test="${info.orderNum>0}">
																<span class="num">起订量>=${info.orderNum}${info.orderUnitName}</span>
															</c:when>
															<c:otherwise>
																<span class="num">起订量（面议）</span>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${info.price == ''|| info.price == undefined || info.price == null || info.price == 0}">
																<span class="price">价格面议</span>
															</c:when>
															<c:otherwise>
																<span class="price"><font class="redT">￥${info.price}</font>/${info.unitName}</span>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	<%@ include file="../showFront/collectAndMessage.jsp"%>
	</div>
</body>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script src="${ctx}/static/js/plugins/pagination/jquery.pagination.js"></script> 
<script type="text/javascript">
var isBox0 = true
var isBox1 = true;
	$(function() {
		getArea();
		if ('${entranceId}' == '3609009') {
			$(".searchKeys2").hide();
			$('#li1').show();
			$("#li2").removeClass("on");
			$("#li1").addClass("on");
			$('#set0').show();
			$('#set1').hide()
			$("#type").val('0');
			$("#areaName").val('宜春市');
			getList(1);
		} else {
			$('#li1').hide();
			$("#li1").removeClass("on");
			$("#li2").addClass("on");
			$('#set0').hide();
			$('#set1').show();
			$("#type").val('1');
			getList(1);
		}
		var swiper5 = new Swiper('#swiper5', {
			autoplay : {
				disableOnInteraction : false,
			},
			direction : 'vertical',
			slidesPerView : 3,
			slidesPerGroup : 1,
			observer : true
		});
		if('${entranceId}'==3600009){
			$(".nav-content a:eq(2)").addClass("on");
		}else{
			$(".nav-content a:eq(1)").addClass("on");
		}
		$(".second-menu li:eq(0) a:eq(0)").addClass("on");
		$(".source-room a").removeClass("on");
		$(".source-room a:eq(9)").addClass("on");
		$(".fir-floor").show();
/* 		$(".publish-btn h1").text('产品发布');
 */
		var $l = 0;    //判断是否要展开
		$(".options").each(function(){ $l += $(this).height();})
		if($l < 40){ $(".open").hide();}
		else { $(".searchKeyBox").css("height","45px");}
		
		$(".open").on("click",function() { //展开收起筛选项
			$(this).toggleClass("on");
			var $l = 0;
			$(".options").each(function(){ $l += $(this).height() + 10;})
			if($(this).hasClass("on")) { 
				$(".searchKeyBox").css("height", $l + 'px');
				$(".open").text("收起");
			}
			else { 
				$(".searchKeyBox").css("height","45px");
				$(".open").text("展开");
			}
		})
		$(".titleName li").on("click",function() { //大项目tab切换
			$("#industryId").val('');
			var $ind = $(this).index();
			if ($ind == 2) {
				$("#areaName").val('');
				if ('${accountId}' == '') {
					layer.msg('亲，您还没登录!');
					return;
				}
			} else if ($ind == 1) {
				isBox1 = true;
				$("#areaName").val('');
				$(".searchKeys2").show();
			} else if ($ind == 0) {
				isBox0 = true;
				$("#areaName").val('宜春市');
				$(".searchKeys2").hide();
			}

			var $l = 0;    //判断是否要展开
			$(".options").each(function(){$l += $(this).height();})
			$(".open").removeClass("on").text("展开");
			if($l < 40){$(".open").hide();} 
			else { $(".searchKeyBox").css("height","45px"); $(".open").show();}
			$(".searchKeys .optionBtn").removeClass("selected");
			$(".searchKeys .optionBtn:eq(0)").addClass("selected");
			$(".searchKeys .optionBtn").each(function() {
				var $ind2 = $(this).text().indexOf("(");
				var t = $(this).text().substring(0, $ind2)
				if ($ind2 > -1) {
					$(this).text(t)
				}
			})
			
			$("#type").val($ind);
			getList(1);

			$(this).addClass("on").siblings().removeClass("on");
			$("#set" + $ind).siblings().fadeOut("fast");
			setTimeout(function() {
				$("#set" + $ind).fadeIn("fast");
			}, 200);
		});
		$(".sortOrder").on("click",function(){
			$(this).addClass("on").siblings().removeClass("on");
			if($(this).attr("id") == 'popularityButton') {
				if ($('#orderType').val() == 0) {
					$('#orderType').val(1);
					$('#popularityPic').attr("class","caret_red_down");
				} else if ($('#orderType').val() == 1) {
					$('#orderType').val(2);
					$('#popularityPic').attr("class","caret_red_up");
				} else {
					$('#orderType').val(1);
					$('#popularityPic').attr("class","caret_red_down");
				}
			}else if($(this).attr("id") == 'priceButton'){
				if ($('#orderType').val() == 0) {
					$('#orderType').val(3);
					$('#pricePic').attr("class", "caret_red_down");
				} else if ($('#orderType').val() == 3) {
					$('#orderType').val(4);
					$('#pricePic').attr("class", "caret_red_up");
				} else {
					$('#orderType').val(3);
					$('#pricePic').attr("class", "caret_red_down");
				}
			}
			$('#productList').empty();
			getList(1);
		})
		//回车触发搜索事件
		$("#searchKey").bind('keydown', function(event) {
			if (event.keyCode == "13") {
				search();
			}
		});
		var isComplete = '${isComplete}';
		if(isComplete=='true'&&isComplete!=''&&isComplete!=null){
			layer.open({
				  id:'cframe',			
				  type: 2,
				  title: false,
				  closeBtn: 1, //不显示关闭按钮
				  shade: [.4],
				  area: ['70%', '80%'],
				  anim: 2,
				  content: ['${ctx}/login/page/show/validateLogin?entranceId=${entranceId}&type=3'], //iframe的url，no代表不显示滚动条
				  btn: ['关闭'],
				  yes: function(index, layero){
		              history.go(-1);
					  layer.closeAll();
				  },cancel: function(){ 
		              history.go(-1)
		          }
			}); 
		}else if(isComplete=='false'&&isComplete!=''&&isComplete!=null){
			layer.confirm('请完善企业信息！', {
				btn: ['确定', '再想想'], btn1:function(){
					window.location.href = "${ctx}/personalCenter/companyEdit?url=5";
	            }, btn2: function () {
	                
	            },cancel: function(){ 
	            	
	            }
	        });
		}
	});
   function search(){
	   var type = $('#type').val();
	   if(type==0){
		 isBox0 = true;  
	   }else if(type==1){
		 isBox1 = true;  
	   }
		getList(1);
   }
	function getArea() {
		var areaList = [ {
			title : "全省",
			value : "360000",
		}, {
			title : "南昌市",
			value : "360100",
		}, {
			title : "景德镇市",
			value : "360200",
		}, {
			title : "萍乡市",
			value : "360300",
		}, {
			title : "九江市",
			value : "360400",
		}, {
			title : "新余市",
			value : "360500",
		}, {
			title : "鹰潭市",
			value : "360600",
		}, {
			title : "赣州市",
			value : "360700",
		}, {
			title : "吉安市",
			value : "360800",
		}, {
			title : "宜春市",
			value : "360900"
		}, {
			title : "抚州市",
			value : "361000"
		}, {
			title : "上饶市",
			value : "361100"
		} ];
		for (var i = 0; i < areaList.length; i++) {
			var map = areaList[i];
			var _div = "";
			if (map.title == '全省') {
				_div += '<div class="optionBtn selected" value=\'' + map.title
						+ '\'  onclick="selectByKey(this,\'' + map.title
						+ '\',1);">'
			} else {
				_div += '<div class="optionBtn" value=\'' + map.title
						+ '\'  onclick="selectByKey(this,\'' + map.title
						+ '\',1);">'
			}
			_div += map.title
			_div += '</div>'
			$('#declareGrade2').append(_div);
		}
	}
	function selectByKey(e, val, type) {
		if(type == 1){
			val == '全省' ? $("#areaName").val('') : $("#areaName").val(val);
		}
		if(type == 2){
			$("#industryId").val(val);
		}
		var kind = $('#type').val();
		$(e).parent().find(".optionBtn").each(function() {
			var $ind = $(this).text().indexOf("(");
			var t = $(this).text().substring(0, $ind)
			if ($ind > -1) {
				$(this).text(t)
			}
			if(kind==0){
				isBox0 = true;
			}else if(kind==1){
				isBox1 = true;
			}
		})
		$(e).addClass("selected").siblings().removeClass("selected");
		getList(1);
	}

	var proWidth = 0;
	function getList(pageNum) {
		$('#getmoreYcActi').hide();
		$('#moreList').hide();
		var pageSize = 16;
		var type = $("#type").val();
		$('#pageNum').val(pageNum);
		var param = {
				'${_csrf.parameterName}':'${_csrf.token}',
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				"searchKey" : $("#searchKey").val(),
				"industryId" : $("#industryId").val(),
				"orderType" : '',
				"orderNumMin" : $("#orderNumMin").val(),
				"orderNumMax" : $("#orderNumMax").val(),
				"provinceName" : $("#provinceName").val(),
				"areaName" : $("#areaName").val()
		}
		$.ajax({
			url : "${ctx}/interface/json/showProduct/searchList",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				$('#projectNum1').text(result.total);
				if (result.success) {
					var list = result.productList;
					var total = result.total;
					if(total == 0){ //暂无数据情况
						if(type == 0){
							$('#pageSize0').hide();
							$('.M-box0').hide();
							$('#ycList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');
						}
						if(type == 1){
							$('#pageSize1').hide();
							$('.M-box1').hide();
							$('#productList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');
						}
					}else{
							if(type == 0) { $('#ycList').empty();}
							if(type == 1) { $('#productList').empty();}
							if(type == 2) { $('#myList').empty();}
							$(".optionBtn").each(function() {              //给标签加上数量
								if ($(this).hasClass("selected")) {
									var $ind = $(this).text().indexOf("(");
									var t = $(this).text().substring(0, $ind)
									if ($ind > -1) {
										$(this).text(t)
									}
									$(this).text($(this).text() + "(" + result.total + ")");
								}
							})
						for (var i = 0; i < list.length; i++) {
							var info = list[i];
							var text = info.productName;
							var _div = '<div class="productDisplay">';
							_div += '<div onclick="view(\''+ info.id+ '\')" class="divWidth">';
							if(info.picUrl==null||info.picUrl==""){
								_div += '<img src="${ctx}/static/weixin/image/product/defaultImage.png" width="100%" >';
							}else{
								_div += '<img src="'+ info.picUrl+ '" width="100%" >';
							}
							_div += '</div>';
							_div += 	'<div class="productText">';
							_div += 		'<div class="productDisplayName">'+ text+ '</div>';
							if(info.price && info.price != '' && info.price != null && info.price != 'undefined'){
								_div += 		'<p>价 &nbsp; 格：<font class="redT">￥' + info.price + '</font></p>';
							} else { _div += 		'<p>价 &nbsp; 格：<font class="redT">面议</font></p>' 	;}
							if(info.orderNum && info.orderNum != '' && info.orderNum != null && info.orderNum != 'undefined'){
								_div += 		'<p>起订量：&gt;' + info.orderNum + info.unitName + '</p>';
							} else { _div += 		'<p>起订量：面议</p>';}
							_div += 		'<p class="productDescribe">'+info.companyName+'</p>';
							_div += 	'</div>';
							_div += '</div>';
							
							if(type == 0){ $('#ycList').append(_div);}
							if(type == 1){ $('#productList').append(_div);}
						}
					    if(16 < result.total && pageNum ==1){
					    	if(type==0){
					    		if(isBox0){
									 isBox0 = false;
									 showPagination('.M-box0',result.total,getList,type,16);
								}
					    		$('#pageSize0').show();
								$('#pageSize0').html('共检索到'+result.total+' 条数据，每页16条');
					    	}else if (type==1){
					    		if(isBox1){
									 isBox1 = false;
									 showPagination('.M-box1',result.total,getList,type,16);
								}
					    		$('#pageSize1').show();
								$('#pageSize1').html('共检索到'+result.total+' 条数据，每页16条');
					    	}
					    }else if(16 >= result.total && pageNum ==1){
					    	if(type==0){
					    		$('#pageSize0').hide();
					    		$('.M-box0').hide();
					    	}else{
					    		$('#pageSize1').hide();
					    		$('.M-box1').hide();
					    	}
					    }
						
						if(proWidth == 0){ proWidth = $('.divWidth>img').width();}   //定义图片的高度，让他成为正方形
						$('.divWidth>img').css({'height' : proWidth});
					}
				} else {
					layer.msg("获取数据异常");
				}
			}
		});
	}
	
	function view(id) {
		window.open("${ctx}/product/detail/" + id+'?entranceId='+'${entranceId}',"_blank");
	}
	
	function publish(){
		if('${accountId}' == ''){
			return tips("亲，请先登陆哦！");
		}
		window.location.href = "${ctx}/login/page/show/validate?type=3&entranceId=${entranceId}";
	}
	
</script>
</html>
