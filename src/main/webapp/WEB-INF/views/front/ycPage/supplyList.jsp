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
<title>供需</title>
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/showFront/factorSharing.css"
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
			    	<p class="navTitle">企业供求</p>
			    	<p>
				   <font class="font0"><font class="projectNum" id="projectNum0">${supplyDemandCount.supply}</font>&nbsp;<font id="font">个</font>&nbsp;&nbsp;<font>供应信息</font>
					&nbsp;&nbsp;&nbsp;&nbsp;</font><font class="font1"><font class="projectNum" id="projectNum1">${supplyDemandCount.demand}</font>&nbsp;<font>个</font> &nbsp;&nbsp;<font>需求信息</font></font>
					
				</p>
			     </div>
			</div>
		</div>
		
		<%-- <div class="project_content_header">
			<div class="container">
				<img src="${ctx}/static/image/homePage_yc/projectDsc.png"/>
				&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum">${supplyDemandCount.supply}</font>&nbsp; 个  &nbsp;&nbsp; 供应信息
				&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum">${supplyDemandCount.demand}</font>&nbsp; 个 &nbsp;&nbsp; 需求信息
			</div>
		</div> --%>
		<div class="project_artical">
			<input type="hidden" id="pageNum" value="1" />
			<input type="hidden" id="categoryId" value="" />
			<input type="hidden" id="type" value="4" />
			<input type="hidden" id="provinceName" value="江西省"/> 
			<input type="hidden" id="areaName" value=""/>
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName clearfix">
								<ul>
									<li>宜春</li>
									<li>江西省</li>
									<li>供应</li>
									<li>求购</li>
									<!-- <li onclick="setType(3);"><a href="javascript:;">我发布的</a></li> -->
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;" /> 
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" height="15" onclick="search()">
								</div>
							</div>
							<div class="searchKeyBox">
								<div class="searchOptions open">展开</div>
								<div class="searchKeys searchKeys1">
									<div class="searchOptions"><span>分类</span></div>
									<div class="searchOptions options" id="declareGrade">
										<div class="optionBtn selected" onclick="selectByKey(this,'',2);">全部</div>
										<c:forEach items="${categoryList}" var="item" varStatus="n">
											<div class="optionBtn" onclick="selectByKey(this,'${item.id}',2);">${item.name}</div>
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
								<div class="title-content" id="set1"style="display: none">
									<div class="factorDisplayBar clearfix" id="jxList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize1"></div>
										<div class="m-style M-box1"></div>
									</div>
								</div>
								<div class="title-content" id="set2"style="display: none">
									<div class="factorDisplayBar clearfix" id="gyList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize2"></div>
										<div class="m-style M-box2"></div>
									</div>
								</div>
								<div class="title-content" id="set3"style="display: none">
									<div class="factorDisplayBar clearfix" id="xqList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize3"></div>
										<div class="m-style M-box3"></div>
									</div>
								</div>
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
											<div class="enterpriseRecommend" title="${info.companyName}" onclick="view('${info.id}')">
												<span class="${k.index < 3 ? 'bluebg' : ''}">${k.index + 1}</span>
												<font>${info.companyName}</font>
											</div>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<div class="products-new">
							<h3>热门供需推荐</h3>
							<div class="factorRecommendBar">
								<div class="swiper-container" id="swiper5">
									<div class="swiper-wrapper">
										<c:forEach items="${pushSypplyList}" var="info">
											<a class="swiper-slide" target="_blank" href="${ctx}/supply/detail/${info.id}?entranceId=${entranceId}">
												<div class="factorRecommend clearfix">
													<c:choose>
														<c:when test="${empty info.picUrl}">
															<img src="${ctx}/static/weixin/image/product/defaultImage.png" width="80" height="80" style="float: left;" />
														</c:when>
														<c:otherwise>
															<img src="${info.picUrl}" width="80" height="80" style="float: left;" />
														</c:otherwise>
													</c:choose>
													<div class="factorRecommendTitle">
														<img src="${ctx}/static/weixin/images/supply/${info.type eq 0?'need':'give'}.png" width="20" height="20">
														<div>${info.productName}</div>
													</div>
													<div class="factorRecommendCompany" style="font-size: 12px;">${info.companyName}</div>
													<div class="clearfix" style="position: relative; margin-left: 90px;">
														<div class="factorRecommendAdd">长期有效</div>
														<c:choose>
															<c:when test="${empty info.provinceName&&empty info.areaName}">
																<div class="factorRecommendTime">暂无地址</div>
															</c:when>
															<c:otherwise>
																<div class="factorRecommendTime">${info.provinceName}&nbsp;${info.areaName}</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</a>
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
	</div>
</body>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script src="${ctx}/static/js/plugins/pagination/jquery.pagination.js"></script> 
<script type="text/javascript">
var isBox0 = true
var isBox1 = true;
var isBox2 = true
var isBox3 = true
	$(function() {
		console.log('${entranceId}')
		getArea();
		if ('${entranceId}' == '3609009') {
			$(".searchKeys2").hide();
			$('.titleName li:eq(0)').show().addClass("on").siblings().removeClass("on");
			$('#set0').show().siblings().hide();
			$("#type").val('4');
			$("#areaName").val('宜春市');
			getInfoList(1);
		} else {
			$('.titleName li:eq(0)').hide();
			$('.titleName li:eq(1)').addClass("on").siblings().removeClass("on");
			$('#set1').show().siblings().hide();
			$("#type").val('2');
			$("#areaName").val('');
			getInfoList(1);
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
		};
		$(".second-menu li:eq(1) a:eq(0)").addClass("on");
		$(".source-room a").removeClass("on");
		$(".source-room a:eq(10)").addClass("on");
		$(".fir-floor").show();
/* 		$(".publish-btn h1").text('供需发布');
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
			var $ind = $(this).index();
			if ($ind == 4) {
				$("#type").val(3);
				$("#areaName").val('');
				$(".searchKeys2").show();
				if ('${accountId}' == '') {
					layer.msg('亲，您还没登录!');
					return;
				}
			} else if ($ind == 1 || $ind == 2 || $ind == 3) {
				$(".searchKeys2").show();
				$("#type").val(3 - $ind);
				$("#areaName").val('');
				if($ind==1){
					isBox1 = true;
				}else if($ind==2){
					isBox2 = true;
				}else{
					isBox3 = true;
				}
			} else if ($ind == 0) {
				isBox0 = true;
				$("#type").val(4);
				$("#areaName").val('宜春市');
				$(".searchKeys2").hide();
			}
			$("#categoryId").val('');
			
			$(".searchKeys .optionBtn").removeClass("selected");
			$(".searchKeys").each(function() {
				$(this).find(".optionBtn:eq(0)").addClass("selected");
			})
			$(".searchKeys .optionBtn").each(function() {
				var $ind2 = $(this).text().indexOf("(");
				var t = $(this).text().substring(0, $ind2)
				if ($ind2 > -1) {
					$(this).text(t)
				}
			})
			var $l = 0;    //判断是否要展开
			$(".options").each(function(){$l += $(this).height();})
			$(".open").removeClass("on").text("展开");
			if($l < 40){$(".open").hide();} 
			else { $(".searchKeyBox").css("height","45px"); $(".open").show();}
			
			getInfoList(1);

			$(this).addClass("on").siblings().removeClass("on");
			$("#set" + $ind).siblings().fadeOut("fast");
			setTimeout(function() {
				$("#set" + $ind).fadeIn("fast");
			}, 200);
		});

		//回车触发搜索事件
		$("#searchKey").bind('keydown', function(event) {
			if (event.keyCode == "13") {
				search();
			}
		});
	});
    function search(){
    	var kind = $('#type').val();
    	if(kind==4){
			isBox0 = true;
		}else if(kind==2){
			isBox1 = true;
		}else if (kind==1){
			isBox2 = true;
		}else{
			isBox3 = true;
		}
		getInfoList(1);
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

	var proWidth = 0;
	/* 异步获取供需数据 */
	function getInfoList(pageNum) {
		$('#getmoreYcActi').hide();
		$('#displayMore').hide();
		$('#displayMore2').hide();
		$('#displayMore3').hide();
		var type = $("#type").val();
		var $type = type;
		if(type == 4 || type == 2){ $type = ''};
		$('#pageNum').val(pageNum);
		var pageSize = 16;
		var param = {
				'${_csrf.parameterName}':'${_csrf.token}',
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				"searchKey" : $("#searchKey").val(),
				"type" : $type,
				"categoryId" : $("#categoryId").val(),
				"provinceName" : $("#provinceName").val(),
				"areaName" : $("#areaName").val()
		}
		console.log(param)
		$.ajax({
			url : "${ctx}/interface/json/showSupply/searchList",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				if (result.success) {
					var list = result.supplyList;
					var total = result.total;
					if(type==4){
						$('#projectNum0').text(total.count2);
						$('#projectNum1').text(total.count3);
						$('.font1').show();
						$('.font0').show();
					}else if(type==2){
						$('#projectNum0').text(total.count2);
						$('#projectNum1').text(total.count3);
						$('.font1').show();
						$('.font0').show();
					}else if(type==1){
						$('#projectNum0').text(total.count2);
						$('.font0').show();
						$('.font1').hide();
					}else if(type==0){
						$('#projectNum1').text(total.count3);
						$('.font1').show();
						$('.font0').hide();
					}
					if(total.count1==0){ //暂无数据情况
						if(type == 4){
							$('#ycList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');
							$('.M-box0').hide();
							$('#pageSize0').hide();
						}
						if(type == 2){
							$('#jxList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');
							$('.M-box1').hide();
							$('#pageSize1').hide();
						}
						if(type == 1){
							$('#gyList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');
							$('.M-box2').hide();
							$('#pageSize2').hide();
						}
						if(type == 0){
							$('#xqList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');
							$('.M-box3').hide();
							$('#pageSize3').hide();

						}
					}else{
							if(type == 0) { $('#xqList').empty();}
							if(type == 1) { $('#gyList').empty();}
							if(type == 2) { $('#jxList').empty();}
							if(type == 4) { $('#ycList').empty();}
							$(".optionBtn").each(function() {              //给标签加上数量
								if ($(this).hasClass("selected")) {
									var $ind = $(this).text().indexOf("(");
									var t = $(this).text().substring(0, $ind)
									if ($ind > -1) {
										$(this).text(t)
									}
									$(this).text($(this).text() + "(" + result.total.count1 + ")");
								}
							})
						for (var i = 0; i < list.length; i++) {
							var info = list[i];
							var _div = "";
							_div += "<a target='_blank' href=\'${ctx}/supply/detail/" + info.id + "?entranceId=${entranceId}\'";
							_div += "<div class=\'productDisplay\'>";
							_div += '	<div class="divWidth">';
							if (info.picUrl == null) {
								_div += "	<img src=\'${ctx}/static/image/projectDeclare/defaultImage.png\' width=\'100%\'>";
							} else {
								_div += "	<img src=\'"+ info.picUrl + "\' width=\'100%\'>";
							}
							_div += '	</div>';
							_div += "   <div class=\'productText\'>";
							_div += "		<div class=\'productDisplayName\'>";
							if (info.type == 0) {
								_div += "<img src=\'${ctx}/static/weixin/images/supply/need.png\' width=\'25\' height=\'25\'>";
							} else {
								_div += "<img src=\'${ctx}/static/weixin/images/supply/give.png\' width=\'25\' height=\'25\'>";
							}
							_div += "<span>"+ subStr(info.productName, 9)+ "</span></div>";
							if (info.provinceName == null && info.areaName == null) {
								_div += 		'<p>地 &nbsp;&nbsp;址：暂无地址</p>';
							} else {
								_div += 		'<p>地 &nbsp;&nbsp;址：' + info.provinceName + info.areaName + '</p>';
							}
							_div += 		'<p>有效期：长期有效</p>';
							_div += "		<p class=\'productDescribe\'>"+ info.companyName+ "</p>";
							_div += "	</div></div></a>";

							if(type == 4){ $('#ycList').append(_div);}
							if(type == 2){ $('#jxList').append(_div);}
							if(type == 1){ $('#gyList').append(_div);}
							if(type == 0){ $('#xqList').append(_div);}
						}
						if(total.count1 > 16 &&pageNum==1){
							 if(type==4){
								  if(isBox0){
									 isBox0 = false;
									 showPagination('.M-box0',total.count1,getInfoList,type,16);
									}
								  $('#pageSize0').show();
								  $('#pageSize0').html('共检索到'+total.count1+' 条数据，每页16条');
							 }else if(type==1){
								 if(isBox2){
									 isBox2 = false;
									 showPagination('.M-box2',total.count1,getInfoList,type,16);
									}
								 $('#pageSize2').show();
								 $('#pageSize2').html('共检索到'+total.count1+' 条数据，每页16条');
							 }else if (type==2){
								 if(isBox1){
								 isBox1 = false;
								 showPagination('.M-box1',total.count1,getInfoList,type,16);
								} 
								 $('#pageSize1').show();
								 $('#pageSize1').html('共检索到'+total.count1+' 条数据，每页16条');
							 }else{
								  if(isBox3){
									 isBox3 = false;
									 showPagination('.M-box3',total.count1,getInfoList,type,16);
									}
								  $('#pageSize3').show();
								  $('#pageSize3').html('共检索到'+total.count1+' 条数据，每页16条');
							 }	
						}else if(total.count1 <= 16 &&pageNum==1){
						 	 if(type==4){
						 		 $('#pageSize0').hide();
								 $('.M-box0').hide();
							 }else if(type==1){
								 $('#pageSize2').hide();
								 $('.M-box2').hide();
							 }else if (type==2){
								 $('#pageSize1').hide();
								 $('.M-box1').hide();
							 }else{
								 $('#pageSize3').hide();
								 $('.M-box3').hide();
							 }
						}			
						if(proWidth == 0){ proWidth = $('.divWidth>img').width();}   //定义图片的高度，让他成为正方形
						$('.divWidth>img').css({'height' : proWidth});
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

	/* 分类搜索 */
	function selectByKey(e, val, type) {
		if(type == 1){
			val == '全省' ? $("#areaName").val('') : $("#areaName").val(val);
		}
		if(type == 2){
			$("#categoryId").val(val);
		}
		$(e).parent().find(".optionBtn").each(function() {
			var $ind = $(this).text().indexOf("(");
			var t = $(this).text().substring(0, $ind)
			if ($ind > -1) {
				$(this).text(t)
			}
		})
		var kind = $('#type').val();
		if(kind==4){
			isBox0 = true;
		}else if(kind==2){
			isBox1 = true;
		}else if (kind==1){
			isBox2 = true;
		}else{
			isBox3 = true;
		}
		$(e).addClass("selected").siblings().removeClass("selected");
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
		if('${accountId}' == ''){
			return tips("亲，请先登陆哦！");
		}
		window.location.href = "${ctx}/login/page/show/validate?type=4&entranceId=${entranceId}";
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
				  area: ['70%', '80%'],
				  anim: 2,
				  content: ['${ctx}/login/page/show/validateLogin?entranceId=${entranceId}&type=4'], //iframe的url，no代表不显示滚动条
				  btn: ['关闭'],
				  yes: function(index, layero){
					  layer.closeAll();
				  },cancel: function(){ 
					  
		          }
			});
		}else if(isComplete=='false'&&isComplete!=''&&isComplete!=null){
			layer.confirm('请完善企业信息！', {
				btn: ['确定', '再想想'], btn1:function(){
					window.location.href = "${ctx}/personalCenter/companyEdit?url=6";
	            }, btn2: function () {
	                
	            },cancel: function(){ 
	            	
	            }
	        });
		}
		
	});
</script>
</html>
