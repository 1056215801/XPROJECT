<!-- 宜春公共服务平台 -->
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>宜春公共服务平台他的故事</title>
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet"/>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/coordMap.js" ></script>
</head>
<body>
<div class="homePage_main">
	<%@ include file="common/header_yc.jsp"%>
	<div class="homePage_banner">
		<div class="container banner-content">
			<div class="banner row">
				<div class="col-md-4">
					<div class="industry-new">
						<h3 class="fz0"><img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"><font class="dib">工业动态</font><a href="${ctx}/experience/list?entranceId=${entranceId}&type=2&city=宜春" class="fr">更多</a></h3>
						<div class="swiper-container" id="swiper1">
						    <div class="swiper-wrapper">
						    	<c:forEach items="${expShareList}" var="infoList" varStatus="k">
						    	 	<c:if test="${k.index<9}">
							    		<div class="swiper-slide pennal fz0">
									    	<a href="${ctx}/experience/detail/${infoList.expId}">
								 				<img src="${infoList.expImage}">
								 				<div class='pennal-text dib'>
								 				<h4>${infoList.expTitle}</h4>
								 				<p><img src='/XProject/static/image/homePage_yc/position.png'>${infoList.expUnit}</p>
								 				</div>
							 				</a>
							    		</div>
					 				 </c:if>
				 				</c:forEach> 
						    </div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="loop-bar">
						<div class="swiper-container loop-swipe" id="swiper2">
						    <div class="swiper-wrapper">
						    	<div class="swiper-slide"><img src="${ctx}/static/image/homePage_yc/ad.jpg"></div>
						    </div>
						    <div class="swiper-button-prev swiper-button-white"></div>
						    <div class="swiper-button-next swiper-button-white"></div>
						</div>
						<div class="loop-infor">
							<a class="blue" href="javascript:;">
								<p>产业对接</p>
								<p><strong id="production_strong"></strong>次</p>
							</a>
							<a class="green" href="javascript:;">
								<p>服务企业</p>
								<p><strong id="severice_strong"></strong>个</p>
							</a>
							<a class="orange" href="javascript:;">
								<p>下发项目资金</p>
								<p><strong>${projectFun}</strong>万元</p>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="acts">
						<div class="tab-link">
							<a class="on" href="javascript:;">项目申报</a>
							<a href="javascript:;">活动报名</a>
						</div>
						<div class="tabs">
							<div class="tab" id="tab1">
								<div class="tab-list" >
							 	  	<c:forEach items="${declareList}" var="infoList" varStatus="k">
								 	  	<c:if test="${k.index<3}">
									 	  	<a href="${ctx}/declare/detail/${infoList.declareId}" class="act-item">
									 	  		<div class="item-container">
										 	  		<c:choose>
														<c:when  test="${infoList.declareStatus==0}">
															<span class="green_ing status_ing">申报中</span><font>${infoList.declareTitle}</font>
														</c:when>
													 	<c:when test="${infoList.declareStatus==1}">
															<span class="gray_ing">已截止</span><font>${infoList.declareTitle}</font>
														</c:when> 
														<c:otherwise>
															<span class="blue_ing">已公示</span><font>${infoList.declareTitle}</font>
														</c:otherwise>
													</c:choose>
													<font class="redT"><fmt:formatDate value="${infoList.createTime}" pattern="MM-dd"/></font>
									 	  		</div>
											</a>
								 	  	</c:if>
									</c:forEach> 
								</div>
								<a href="${ctx}/declare/list?entranceId=${entranceId}">更多</a>
							</div>
							<div class="tab" id="tab2">
								<div class="tab-list">
								  	<c:forEach items="${activityeList}" var="infoList" varStatus="k">
								 	  	<c:if test="${k.index<3}">
									 	  	<a href="${ctx}/activity/detail/${infoList.activityId}" class="act-item fz0">
									 	  	   	<img  class="acitivityImg" src="${infoList.activityImage}">
									 	  	   	<div class="activity_div">
										 	  	   	 <c:if test="${infoList.status==1}">
										 	  	   	 	<span class="red_ing">进行中</span><font>${infoList.activityName}</font>
										 	  	   	 </c:if>
										 	  	   	 <c:if test="${infoList.status!=1}">
														<span class="gray_ing">已结束</span><font>${infoList.activityName}</font>
													</c:if>
													<font class="redT"><fmt:formatDate value="${infoList.createTime}" pattern="MM-dd"/></font>
												</div>
											</a>
								 	  	</c:if>
									</c:forEach> 
								</div>
								<a href="${ctx}/activity/list?entranceId=${entranceId}">更多</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="recommends">
				<div class="recommend">
					<a href="javascript:;" onclick="goOffice(1)"   ><img src="${ctx}/static/image/homePage_yc/bangfu.png"><p>精准帮扶</p></a>
				</div>
				<div class="recommend">
					<a href="${ctx}/declare/list?entranceId=${entranceId}"><img src="${ctx}/static/image/homePage_yc/shenbao.png"><p>项目申报</p></a>
				</div>
				<div class="recommend">
					<a href="javascript:;" onclick="goOffice(2)"   ><img src="${ctx}/static/image/homePage_yc/xinxi.png"><p>信息互动</p></a>
				</div>
				<div class="recommend">
					<a href="${ctx}/helpAsk/allList?entranceId=${entranceId}"><img src="${ctx}/static/image/homePage_yc/wenwen.png"><p>帮您问问</p></a>
				</div>
				<div class="recommend">
					<a target="_blank" href="${urlPath}XOffice/login/yc"><img src="${ctx}/static/image/homePage_yc/zhengce.png"><p>政策资讯</p></a>
				</div>
			</div>
		</div>
	</div>
	<div class="homePage_body">
		<div class="container main-content">
			<div class="row sec-floor">
				<div class="col-md-9">
					<div class="production">
						<div class="pro-title">
							<h2 class="dib">产品展示</h2>
							<p class="dib blueT">共有<font class="redT fz16" id="production_font"></font>件产品正在热销</p>
							<a href="${ctx}/product/list" class="fr wgrayT">更多</a>
						</div>
						<div class="pro-content">
							<div class="swiper-container" id="swiper3">
							    <div class="swiper-wrapper" id="swiper3Chirld">
							    </div>
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="industry-new">
						<h3 class="fz0"><img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"><font class="dib">产业动态</font><a href="${ctx}/industry/list?entranceId=${entranceId}" class="fr">更多</a></h3>
						<div class="news-list" id="news-list">
						</div>
					</div>
				</div>
			</div>
			<div class="row thd-floor">
				<div class="col-md-9">
					<div class="ibox float-e-margins">
						<div class="industryHeader clearfix">
							<div class="industryLabelBar" onclick="industryDistribution()" style="cursor: pointer;"><img src="${ctx}/static/image/homePage_yc/biaoqian.png"><div class="industryLabel">产业地图</div></div>
							<div class="industryChoiceBar">
								<div class="industryChoice">
									<span class="industryAttr">热门产业</span>
									<span class="industryValue" onclick="industryChoice(90020180201174514800069000000014)">锂电产业</span>
									<span class="industryValue" onclick="industryChoice(90020180201174514800069000000015)">中医药产业</span>
								</div>
								<div class="industryMore" onclick="toMore()">更多</div>
							</div>
						</div>
						<div class="ibox-content clearfix" style="position: relative; padding: 15px 0px; height:340px; overflow: hidden;">
							<div class="moduleChoiceBar clearfix">
								<div class="moduleChoice" onclick="parkDistribution()">
									<img src="${ctx}/static/image/homePage_yc/park.png" width="70">
									<span class="moduleData">
										<div class="moduleCount"><span class="parkCount">0</span><span>个</span></div>
										<div class="moduleName">园区分布</div>
									</span>
								</div>
								<div class="moduleChoice" onclick="industryDistribution()">
									<img src="${ctx}/static/image/homePage_yc/industry.png" width="70">
									<span class="moduleData">
										<div class="moduleCount"><span class="industryCount">0</span><span>个</span></div>
										<div class="moduleName">产业分布</div>
									</span>
								</div>
								<div class="moduleChoice" onclick="enterpriseDistribution()">
									<img src="${ctx}/static/image/homePage_yc/enterprise.png" width="70">
									<span class="moduleData">
										<div class="moduleCount"><span class="enterpriseCount">0</span><span>个</span></div>
										<div class="moduleName">企业分布</div>
									</span>
								</div>
								<div class="moduleChoice" onclick="industryDocking()">
									<img src="${ctx}/static/image/homePage_yc/industry2.png" width="70">
									<span class="moduleData">
										<div class="moduleCount"><span class="industry2Count">0</span><span>个</span></div>
										<div class="moduleName">产业对接</div>
									</span>
								</div>
							</div>
							<div id="map" style="float:left; width: 50%; height: 100%;"></div>
	                   </div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="reports">
	                    <div class="tabs-container" id="kindTab">
	                    	<ul class="tab-link fz0">
	                    	 	<li class="on" ><a href="javascript:;">产业招聘月报</a></li>
	                    	 	<li class=""><a href="javascript:;">产业对接月报</a></li>
	                    	</ul>
	                    	<div class="tab-content">
	                    		<div id="tab-1" class="report-tab on">
                               		<div class="report-list" id="kind2List"></div>
                               		<a class="a_kind" href="/XProject/yc/list?type=2&entranceId=${entranceId}">更多</a>
	                            </div>
	                            <div id="tab-2" class="report-tab">
                               		<div class="report-list" id="kind1List"></div>
                               		<a class="a_kind" href="/XProject/yc/list?type=1&entranceId=${entranceId}">更多</a>/
	                            </div>
	                    	</div>
	                    </div>
	                </div>
				</div>
			</div>
			<div class="row for-floor">
				<div class="col-md-9">
					<div class="informations fz0">
						<div class="infor-list infor-list1">
							<div class="infor-title">
								<a href="${ctx}/supply/list">
									<img src="${ctx}/static/image/homePage_yc/require.png">
									<div class="">
										<p><strong id="supplyTotals"></strong>条</p>
										<p>企业供求正在共享</p>
									</div>
								</a>
							</div>
							<div class="infor-content" id="supplyInfo">
							</div>
						</div>
						<div class="infor-list infor-list2">
							<div class="infor-title">
								<a href="${ctx}/logistics/list">
									<img src="${ctx}/static/image/homePage_yc/logistic.png">
									<div class="">
										<p><strong id="carTotals">1374</strong>辆</p>
										<p>物流车源为您服务</p>
									</div>
								</a>
							</div>
							<div class="infor-content" id="carInfo">
							</div>
						</div>
						<div class="infor-list infor-list3">
							<div class="infor-title">
								<a href="${ctx}/yc/list?type=3&entranceId=${entranceId}">
									<img src="${ctx}/static/image/homePage_yc/company.png">
									<div class="">
										<p><strong id="jobTotals">56</strong>个</p>
										<p>企业岗位正空缺</p>
									</div>
								</a>
							</div>
							<div class="infor-content" id="jobInfo">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="helping">
						<div class="help-title" onclick="location.href='${ctx}/helpAsk/allList?entranceId=${entranceId}'"><img src="${ctx}/static/image/homePage_yc/helping.png"></div>
						<div class="help-content">
							<div class="help-list" id="help-list">
							</div>
							<a href="javascript:;"><img src="${ctx}/static/image/homePage_yc/publish.png">免费发布</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row fif-floor">
				<div class="col-md-9">
					<div class="experts fz0">
						<div class="expert-title dib fz16">
							<img src="${ctx}/static/image/homePage_yc/zhuanjia.png">
							<p>专<br>家<br>服<br>务</p>
						</div>
						<div class="expert-content dib">
							<div class="expert-list" id="experts">
							</div>
							<a href="${ctx}/expert/list">更多...</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="industry-new science">
						<h3 class="fz0"><img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"><font class="dib">科研机构</font><a href="${ctx}/yc/list?type=5&entranceId=${entranceId}" class="fr">更多</a></h3>
						<div class="science-list fz0" id="science-list">
						</div>
					</div>
				</div>
			</div>
			<div class="row six-floor">
				<div class="col-md-2">
					<div class="pro-title">
						<h2 class="dib">友情链接</h2>
					</div>
				</div>
				<div class="col-md-10">
					<div class="row">
                   		<div class="col-sm-3">
                           <select class="form-control m-b wicon dropup" name="account" onchange="openFriendshiplink(this.options[this.selectedIndex].value)">
                               <option value>&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;工信系统网站&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;</option>
                               <option value="http://www.jxciit.gov.cn/">江西省工业和信息化厅</option>
                               <option value="http://www.miit.gov.cn/">中华人民共和国工业和信息化部</option>
                               <option value="http://gxw.nc.gov.cn/Index.shtml">南昌市工业和信息化会	</option>
							   <option value="http://bm.pingxiang.gov.cn/gxw/">萍乡市工业和信息化会</option>
							   <option value="http://www.xysgxw.gov.cn/">新余市工业和信息化会</option>
							   <option value="http://www.ytetc.gov.cn/">鹰潭市工业和信息化会</option>
							   <option value="https://www.gzciit.gov.cn/">赣州市工业和信息化会</option>
							   <option value="http://www.jjciit.gov.cn/">九江市工业和信息化会</option>
							   <option value="http://www.jagxw.gov.cn/">吉安市工业和信息化会</option>
							   <option value="http://gxw.jxfz.gov.cn/">抚州市工业和信息化会</option>
							   <option value="http://www.ycgxw.gov.cn/">宜春市工业和信息化会</option>
                           </select>
                   		</div>
                   		<div class="col-sm-3">
                   			<select class="form-control m-b wicon dropup" name="account" onchange="openFriendshiplink(this.options[this.selectedIndex].value)">
                                <option value>&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;行业网站&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;</option>
		                        <option value="http://libattery.ofweek.com/">OFweek锂电网 –锂电池行业门户</option>
								<option value="http://www.cpi.gov.cn/publish/default/">中国医药信息网</option>
								<option value="http://www.yiyaojie.com/index.html">医药界</option>
								<option value="http://www.esujiao.com/">中国橡胶网</option>
								<option value="http://www.cnfood.net/">中国食品行业网</option>
                             </select>
                   		</div>
                   		<div class="col-sm-3">
                   			<select class="form-control m-b wicon dropup" name="account" onchange="openFriendshiplink(this.options[this.selectedIndex].value)">
	                            <option value>&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;协会网站&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;</option>
                                <option value="http://www.capc.org.cn/index.html">中国医药商业协会</option>
								<option value="http://www.chinania.org.cn/">有色金属工业协会网</option>
								<option value="http://www.chinabattery.org/">中国电池协会</option>
								<option value="http://www.cnfia.cn/html/main/index.html	">中国食品工业协会网</option>
								<option value="http://www.cnga.org.cn/">中国服装协会网</option>
		                	</select>
                   		</div>
                   		<div class="col-sm-3">
                   			<select class="form-control m-b wicon dropup" name="account" onchange="openFriendshiplink(this.options[this.selectedIndex].value)">
                                <option value>&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;标杆企业网站&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;</option>
                                <option value="http://www.wantwant.com.cn/">江西旺旺食品有限公司</option>
								<option value="http://www.kelunyx.com/list-10-1.html">江西科伦医疗器械制造有限公司</option>
								<option value="http://www.jxhesyy.com/">江西海尔思药业股份有限公司</option>
								<option value="http://www.gangsili.com/">江西港丝利服饰有限公司</option>
								<option value="http://www.jxbsyy.com/">江西百神药业有限公司</option>
								<option value="http://www.renhe.com/">仁和(集团)发展有限公司</option>
								<option value="http://www.jxzeto.com/">江西正拓新能源科技股份有限公司</option>
								<option value="http://www.sitejiu.com/">江西四特酒有限公司</option>
								<option value="http://www.jmkx.com/">江西济民可信药业有限公司</option>
								<option value="http://www.jxhongyu.cn/index.html">江西宏宇能源发展有限公司</option>
                            </select>
                   		</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="common/footer_yc.jsp"%>
	
	<form action="" method="post" id="detailForm">
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	<input type="hidden" id="info" name="info"/>
</form>
</div>
<script>
function detail(obj){
	$("#info").val("("+$(obj).attr("data")+")");
	$("#detailForm").attr("action","${ctx}/logistics/detail").submit();
}
 $(function(){
	 
	 var swiper1 = new Swiper('#swiper1', {
		    autoplay:true,  
		    slidesPerView: 1,
		    slidesPerColumn : 3,
		    spaceBetween : 8,
		    observer:true,
		    pagination: {
		        el: '.swiper-pagination',
		    },
	 });
	 var swiper2 = new Swiper('#swiper2', {
		    autoplay:true,  
		    navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
	        },
	 });
	 $(".nav-content a:eq(0)").addClass("on");
	 $(".help-title img").load(function(){$(".infor-title").css("height",$(".help-title").height());});     //对齐物流、用工、供需的高度
	 $(".infor-title").css("height",$(".help-title").height());              //缓存高度
	 
	 
	 $(".industry").on("click",function(e){           //二级菜单效果
		 e.stopPropagation();
		 $(this).toggleClass("act");
		 $(".second-menu").slideToggle();
	 });
	 $(document).on("click",function(){         //二级菜单效果
		 $(".industry").removeClass("act");
		 $(".second-menu").slideUp();
	 })
	 $(".second-menu").on("click",function(e){           //二级菜单效果
		 e.stopPropagation();
	 })
	 
	 
	 $(".acts .tab-link a").on("click",function(){          //banner的tab切换
		 var $ind = $(this).index() + 1;
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#tab"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){$("#tab"+$ind).fadeIn("fast");},200)
	 })
	 $(".reports .tab-link li").on("click",function(){         //对接月报的tab切换
		 var $ind = $(this).index() + 1;
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#tab-"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){$("#tab-"+$ind).fadeIn("fast");},200)
	 })
	 
	 getProductionList(1,10)//获取产品展示列表
	 getSupplyInList(1,4);//获取供需列表
	 getIndustryDynamicsNewsList(1,5);//获取产业动态列表
	 getWanjiCarList(1,4);//获取万佶物流车源
	 getAskList(1,3)//获取帮你问问列表接口
	 getRecruitManageInfoList(1,7)//获取企业招聘列表
	 getScienInfoList(1,2)//获取科研机构列表
	 getAssistExpertInfoList(1,4)//获取专家顾问列表
	 gatherDataCountViewList(1,3,1)//获取产业对接列表
	 gatherDataCountViewList(1,3,2)//获取工业招聘统计列表


});
	function getSupplyInList(pageNum,pageSize) {
		$.ajax({
			url : "${ctx}/interface/json/showSupply/searchList",
			type : "post",
			data : {
				'${_csrf.parameterName}':'${_csrf.token}',
				"pageNum" : pageNum,
				"pageSize" : pageSize,
			},
			dataType : "json",
			success : function(result) {
				var number1 = number(result.total)
				$('#supplyTotals').text(number1);
				var infoList = result.supplyList;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
 					var _div = "";
					_div += "<a href='${ctx}/supply/detail/"+info.id+"'>"
 					if(info.type==0){
						_div += "<h4><font class=\'orangeT\'>"+"求购"
					}else{
						_div += "<h4><font class=\'blueT\'>"+"供应"

					}
					_div += "</font>"+info.productName+"</h4>"
					_div += "<p>"+info.provinceName+"&nbsp; "+info.areaName+"</p></a>"
              		$("#supplyInfo").append(_div);
				}
				
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getProductionList(pageNum,pageSize) {
		$.ajax({
 			url : "${ctx}/interface/json/showProduct/searchList",
			type : "post",
			data : {
				'${_csrf.parameterName}':'${_csrf.token}',
				"pageNum" : pageNum,
				"pageSize" : pageSize,
			},
			dataType : "json",
			success : function(result) {
				var number1 = number(result.total);
				$('.industry2Count').text(result.total);
				$('#production_strong').text(number1);
				$('#production_font').text(number1);
				var infoList = result.productList;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
              		_div += "<div class=\'swiper-slide\'>"
              		_div +=	"<a href='${ctx}/product/detail/"+info.id+"'>"
              		_div += "<div class=\'pro-pic\'>"
               		_div += "<img src=\'"+info.picUrl+"\'></div>"
               		_div += "<p>"+info.productName+"</p>"
              		_div += "<div class=\'province\'>"
              		if(info.spaceName){
              			_div += info.spaceName
              		}
              		_div += "</div>"
              		_div += "</a>"
              		_div += "</div>"
              		$("#swiper3Chirld").append(_div);
				}
				 var swiper3 = new Swiper('#swiper3', {
					    autoplay:true,  
					    slidesPerView : 5,
					    slidesPerGroup : 5,
					    spaceBetween : 10,
					    observer:true,
					    pagination: {
					        el: '.swiper-pagination',
					    },
				 });
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getWanjiCarList(pageNum,pageSize) {
		var AdCode = 0;
		var TargetAdCode = 0;
		var TypeCode = -1;
		var CarLoadType = -1;
		$.ajax({
			url:"${ctx}/logistics/wanji/json/getPlatCar",
			type : "post",
			data : {
				'${_csrf.parameterName}':'${_csrf.token}',
				"Take" : pageSize,
				"Skip" : (pageNum-1)*pageSize,
				"AdCode" : AdCode,
				"TargetAdCode" : TargetAdCode,
				"TypeCode" : TypeCode,
				"CarLoadType" : CarLoadType
			},
			dataType : "json",
			success : function(result) {
				var number1 = number(result.jsonValue.Total);
				$('#carTotals').text(number1);
					var infoList = result.value;
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
	 					var _div = "";
	              		_div += "<a data='"+JSON.stringify(info)+"' href='JavaScript:;' onclick='detail(this)'>"
	              		_div += "<h4>"+info.CurPlace+"&nbsp;&nbsp至&nbsp;&nbsp全国</h4>"
	              		_div += "<p>"
	              		 if(info.CarTypeName&&info.CarTypeName!=undefined){
		              		 _div += info.CarTypeName
	              		 }
	              		_div += "&nbsp;<font class=\'redT\'>"
	              		_div +=  info.CarLoad+'吨  '
	              		if(info.CarLength=='-1.00'){
	              			_div+= '不限'
	              		}else{
	              			_div+= info.CarLength+"米"
	              		}
              			_div+= '*'
             			if(info.CarWidth=='-1.00'){
   	              			_div+= '不限'
   	              		}else{
   	              			_div+= info.CarWidth+"米"
   	              		}
	              		_div += "</font></p></a>"
	              		$("#carInfo").append(_div);
					}
					$(".helping").css("height",$(".infor-list2").height());
					$(".infor-list3 .infor-content").css("height",$(".infor-list2 .infor-content").outerHeight());
				
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function dateToTimeStr(str){
	  return formatDate(new Date(str), "MM-dd");
	}
	// 格式化日期,
	function formatDate(date, format) {
		var paddNum = function(num) {
			num += "";
			return num.replace(/^(\d)$/, "0$1");
		}
		// 指定格式字符
		var cfg = {
			yyyy : date.getFullYear(), // 年 : 4位
			yy : date.getFullYear().toString().substring(2),// 年 : 2位
			M : date.getMonth() + 1, // 月 : 如果1位的时候不补0
			MM : paddNum(date.getMonth() + 1), // 月 : 如果1位的时候补0
			d : date.getDate(), // 日 : 如果1位的时候不补0
			dd : paddNum(date.getDate()),// 日 : 如果1位的时候补0
			hh : paddNum(date.getHours()), // 时
			mm : paddNum(date.getMinutes()), // 分
			ss : paddNum(date.getSeconds())
		// 秒
		}
		format || (format = "yyyy-MM-dd hh:mm:ss");
		return format.replace(/([a-z])(\1)*/ig, function(m) {
			return cfg[m];
		});
	}
	function getIndustryDynamicsNewsList(pageNum,pageSize) {
		$.ajax({
			url : "${urlPath}XOffice/interface/json/columnInfo/getPublicColumnNewsInfoList",
			data : {
				"pageNum" : pageNum,
				"parkId" : "${entranceId}",
				"pageSize" : pageSize,
				"columnId" :  '',
			},
			dataType : "json",
			success : function(result) {
				var map = result.columnInfo;
				var infoList = result.value;
				if(result.total>0){
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var id = info.columnId;
	 					var _div = "";
	 					_div += '<a href="${ctx}/industry/detail/'+info.newsId+'">'
	              		_div += "<div class='item-container'>"
	              	    _div += "<font class=\'blueT\'>"+map[id.toString()]+' '+"|  </font>"
	              	 	_div += info.newsTitle
	              	 	_div += "<font class=\'redT\'>  "
	              	 	_div +=  dateToTimeStr(info.createTime)
	              	 	_div += "</font>"
	              	 	_div += "</div>"
	              	    _div +=  "</a>"
	              		$("#news-list").append(_div);
					}
				}else{
					 var _div = "<div id=noData>暂无数据</div>"
					$("#news-list").append(_div);
					$('.industry-new h3>a').hide();
				}
				
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function gatherDataCountViewList(pageNum,pageSize,kind) {
		$.ajax({
 			url : "${urlPath}XOffice/interface/json/gatherDataCount/viewList",
			type : "post",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				 "kind" : kind,
					 "parkId" : "${entranceId}",
					},
			dataType : "json",
			success : function(result) {
				if(result.total>0){
					var infoList = result.infoList;
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var text = info.content;
						text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
						text = text.replace(/<[^>]+>/g,"");
						var _div = "";
	              		_div += '<a href="${ctx}/yc/detail?type='+kind+'&entranceId=${entranceId}&id='+info.id+'"><img class=\'dib\' src="'+info.imageUrl+'">'
 	              		_div +=  "<div class=\'dib\'><h4>"+info.title+"</h4>"
	              		_div += "<p>"+text+"</p>"
	              		_div += "</div>"
	              		_div +=  "</a>"
	              		if(kind==1){
	              			$("#kind1List").append(_div);
	              		}else{
	              			$("#kind2List").append(_div);
	              		}
					}
				}else{
					var _div = "<div id='noData'>暂无数据</div>";
					if(kind==1){
	          			$("#kind1List").append(_div);
	          		}else{
	          			$("#kind2List").append(_div);
	          		}
					$(".reports .report-tab>a").hide();
				}
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getAskList(pageNum,pageSize) {
		$.ajax({
			url : "${urlPath}XOffice/interface/json/question/askInfo/askList",
			type : "post",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize
			},
			dataType : "json",
			success : function(result) {
				var tagList = result.tagList;
				var infoList = result.askList;
				if(result.total>0){
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var _div = "";
						 var id = info.askTagIds.split(",")[0];
						 var text;
					 	 for(var j=0;j<tagList.length;j++){
							 var temp = tagList[j];
							 if(temp.tagId==id){
								 text = temp.tagName;
								 break;
							 }
						 }
	              		_div += "<a href=\'${ctx}/helpAsk/detail/"+info.askId+"\'>"
	              		if(info.askImgUrls){
	    					_div +=  "<div class=\'help-infor\'>"
	              		}else{
	    					_div +=  "<div class=\'help-infor\' style=\'width:100%;\'>"
	              		}
						_div += "<h4>"+info.askTitle+"</h4>"
						_div += "<p><img src=\'${ctx}/static/image/homePage_yc/ico@3x.png\'>"+text+"... "+info.browseNum+"阅读 · "+info.answerNum+"回复<span class=\'fr\'>"
						_div += "<img src=\'${ctx}/static/image/homePage_yc/re@3x.png\'>回复</span></p>"
						if(info.askImgUrls){
		 				    _div += "</div><img src=\'"+info.askImgUrls+"\'>"
						}
						_div += "</div>"
	 			        _div +=  "</a>"
	            		$("#help-list").append(_div);
					}
				}else{
					var _div = "<div id=noData>暂无数据</div>"
	 				$("#help-list").append(_div);
				}
				
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getRecruitManageInfoList(pageNum,pageSize) {
		var parkId = ${entranceId};
		if(parkId==3609009){
			parkId = 360900;
		}
		$.ajax({
			url : "${urlPath}XOffice/interface/json/recruitInfo/recruitList",
			type : "post",
			data : {
  				"areaId" : "${entranceId}",
 				"areaId" : parkId,
 				"pageNum" : pageNum,
				"pageSize" : pageSize,
 
			},
			dataType : "json",
			success : function(result) {
				console.log(result)
				var count = result.count;
				if(count.total3){
					var number1 = number(count.total3);
					  $('#jobTotals').text(number1);
				}
				var infoList = result.value;
				if(infoList.length>0){
				 	for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var _div = "";
					    if(info.createKind==0){
						   _div += '<a title="'+info.recruitTitle+'" href="'+info.recruitUrl+'" target="_blank">'
					    }else{
					    	_div += '<a title="'+info.recruitTitle+'" href="${ctx}/yc/detail?type=3&id='+info.parkId+'&time='+info.recruitTime+'">'
					    }
						_div += "<h4>"+info.recruitTitle+"</h4></a>"
	            		$("#jobInfo").append(_div);
					} 
				}else{
					var _div = "<div id='noData'>暂无数据</div>";
					$("#jobInfo").append(_div);
					
				}
				
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getScienInfoList(pageNum,pageSize) {
		$.ajax({
 			url : "${urlPath}XOffice/interface/json/scientificInstitutionInfo/list",
			type : "post",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize,
			},
			dataType : "json",
			success : function(result) {
				console.log(result);
				var infoList = result.value;
				if(result.total>0){
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var  _div ="";
	              		_div += '<a href="${ctx}/yc/detail?type=5&entranceId=${entranceId}&id='+info.id+'">'
	              	    if(info.logoUrl){
	              	    	_div += '<img src="'+info.logoUrl+'">'
	              	    }else{
		              		_div +=  "<img src=\'${ctx}/static/image/homePage_yc/kyjg1.png\'>"
	              	    }
					    _div += "<p>"+info.institutionName+"</p>"	
					    _div += "<div><span>"
					    if(info.areaName){
					    	_div += info.areaName;
					    }else{
					    	_div += " ";
					    }
					    _div +="</span><span>"
					    if(info.researchDirection){
					    	_div += info.researchDirection;
					    }else{
					    	_div += " ";
					    }
					    _div += "</span></div>"
					    _div += "</a>"
	            		$("#science-list").append(_div);
					}
				}else{
					var _div = "<div id='noData'>暂无数据</div>";
					$("#science-list").append(_div);
				}
				
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getAssistExpertInfoList(pageNum,pageSize) {
		$.ajax({
			url : "${urlPath}XOffice/interface/json/assistExpertInfo/list",
			type : "post",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize,
/* 			 	"areaId" : "${entranceId}",
 */			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					_div += "<a class='dib' href='${ctx}/expert/detail/"+info.expertId+"'>"
					_div += "<div class=\'expert-pic dib\'><img class=\'dib\' src=\'"+info.imageUrl+"\'></div>"
					_div += "<div class=\'dib expert-infor\'>"
					_div +=  "<h3><strong>"+info.expertName+"</strong> "+info.dutyLevel+"</h3>"
					if(info.introduction){
						_div +=	"<p>"+getHtmlStr(info.introduction)+"</p>"
					}else{
						_div +=	"<p>暂无简介</p>"
					}
					_div += "</div>"
					_div  += "</a>"
					$("#experts").append(_div);
				}
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
					$("#experts").append(_div);
					$(".expert-content>a").hide();
				}
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getHtmlStr(text){
		text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
		text = text.replace(/<[^>]+>/g,"");
		return text;
	}
</script>
<script type="text/javascript">
var myChart = "";
var searchProvinceId = 360000;
var searchAreaId = 360900;
var searchTypeId = "";
var mapData = [];
	$(function(){
		companyCount();
		industryDistribution();
	})
	//加载echart地图
	function initialChart(provinceId,areaId){
		//echarts释放内存
        myChart&&myChart.dispose();
        if(areaId == "" || areaId == undefined){
        	areaId = provinceId;
		}
		$.get('${ctx}/static/map/'+areaId+'.json', function(chinaJson) {
		     echarts.registerMap(areaId, chinaJson);
		     optionMap.geo.map = areaId;
		     myChart = echarts.init(document.getElementById('map'));
		     optionMap.series[0].data = mapData;
		     optionMap.series[1].data = mapData;
		     optionMap.series[2].data = mapData; 
		     myChart.setOption(optionMap);
		});
    };
    //获取园区分布、产业分布、企业分布的企业总数
    function companyCount(){
		$.ajax({
			url : "${urlPath}XOffice/interface/json/officeCompanyInfo/parkCount",
			type : "post",
			data : {
				"orgId":searchAreaId
			},
			dataType : "json",
			success : function(result) {
				if(result.success){
					$(".parkCount").text(result.list[1]);
					$(".industryCount").text(result.list[2]);
					$(".enterpriseCount").text(result.list[0]);
					var number1 = number(result.list[0]);
					$("#severice_strong").text(number1);
				}else{
					layer.msg("系统异常0");
				}
			},
			error : function() {
				layer.msg("系统异常1");
			}
		});
	}
    function cleanMapData(){//清除地图上的数据
    	mapData = [];
    }
    /* 非空字符串 */
    function nvlStr(str){
    	if(str==null || str==undefined){
    		return "";
    	}
    	return str;
    }
	//园区分布
    function parkDistribution(){
		$.ajax({
			url : "https://test.inpark.com.cn/XWeixin/interface/json/parkInfo/count",
			type : "post",
			data : {
				"provinceId":searchProvinceId,
				"areaId":searchAreaId,
				"level":3
			},
			dataType : "json",
			success : function(result) {
				if(result.success){
					//清除地图上的数据
					cleanMapData();
					var list = result.list;
					for(var i=0 ; i<list.length ; i++){
						var info = list[i];
						var data = {};
						if(searchAreaId == "" || searchAreaId == undefined){//省级
							data.name = info.areaId;
						}else {//市级
							if(info.spaceId == "" || info.spaceId == undefined || info.spaceId == -1){
								data.name = searchAreaId;
							}else{
								data.name = info.spaceId;
							}
						}
						data.parkName = info.parkName;
						data.parkId = info.parkId;
						data.value = info.countNum;
						mapData[i] = data;
					}
					mapData = convertData_park(mapData);
					initialChart(searchProvinceId,searchAreaId);
				}else{
					layer.msg("系统异常2");
				}
			},
			error : function() {
				layer.msg("系统异常3");
			}
		});
	}
	//产业分布
	function industryDistribution(){
		$.ajax({
			url : "https://test.inpark.com.cn/XWeixin/interface/json/industryClusterInfo/count",
			type : "post",
			data : {
				"provinceId":searchProvinceId,
				"areaId":searchAreaId,
				"level":3
			},
			dataType : "json",
			success : function(result) {
				if(result.success){
					//清除地图上的数据
					cleanMapData();
					var list = result.list;
					for(var i=0 ; i<list.length ; i++){
						var info = list[i];
						var data = {};
						if(searchAreaId == "" || searchAreaId == undefined){//省级
							data.name = info.areaId;
						}else {//市级
							if(info.spaceId == "" || info.spaceId == undefined || info.spaceId == -1){
								data.name = searchAreaId;
							}else{
								data.name = info.spaceId;
							}
						}
						data.clusterName = info.clusterName;
						data.clusterId = info.clusterId;
						data.value = info.countNum;
						mapData[i] = data;
					}
					mapData = convertData_industry(mapData);
					initialChart(searchProvinceId,searchAreaId);
				}else{
					layer.msg("系统异常4");
				}
			},
			error : function() {
				layer.msg("系统异常5");
			}
		});
	}
	//企业分布
	function enterpriseDistribution(){
		$.ajax({
			url : "https://test.inpark.com.cn/XWeixin/interface/json/companyInfo/count",
			type : "post",
			data : {
				"provinceId":searchProvinceId,
				"areaId":searchAreaId,
				"typeId":searchTypeId,
				"level":3
			},
			dataType : "json",
			success : function(result) {
				if(result.success){
					//清除地图上的数据
					cleanMapData();
					var list = result.list;
					for(var i=0 ; i<list.length ; i++){
						var info = list[i];
						var data = {};
						if(searchAreaId == "" || searchAreaId == undefined){//省级
							data.name = info.areaId;
						}else {//市级
							if(info.spaceId == "" || info.spaceId == undefined || info.spaceId == -1){
								data.name = searchAreaId;
							}else{
								data.name = info.spaceId;
							}
						}
						data.companyName = info.companyName;
						data.companyId = info.companyId;
						data.value = info.countNum;
						mapData[i] = data;
					}
					mapData = convertData_enterprise(mapData);
					initialChart(searchProvinceId,searchAreaId);
					
					//点击热门产业，加载地图后清空typeId
					searchTypeId = "";
				}else{
					layer.msg("系统异常6");
				}
			},
			error : function() {
				layer.msg("系统异常7");
			}
		});
	}
	//产业对接
	function industryDocking(){
		window.location.href="${ctx}/product/list?entranceId=3609009";
	}
	function industryChoice(typeId){
		searchTypeId = typeId;
		enterpriseDistribution();
	}
	function toMore(){
		window.open("${urlPath}XWeixin/static/pcHtml/industryMap/parkDistribution.html?areaId=360900&areaName=宜春市");
	}
    
    //这里是生成series的数据，将经纬度和value值映射起来
    var convertData_park = function(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name : data[i].name,
                    value : geoCoord.concat(data[i].value).concat(data[i].parkName).concat(data[i].parkId)
                });
            }
        }
        return res;
    };
    var convertData_industry = function(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name : data[i].name,
                    value : geoCoord.concat(data[i].value).concat(data[i].clusterName).concat(data[i].clusterId).concat(data[i].name)
                });
            }
        }
        return res;
    };
    var convertData_enterprise = function(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name : data[i].name,
                    value : geoCoord.concat(data[i].value).concat(data[i].companyName).concat(data[i].companyId)
                });
            }
        }
        return res;
    };

    var optionMap = {
        tooltip : {
            trigger : 'item',
            formatter : function(a) {
                return "";
            },
            show:true,
            alwaysShowContent: true,
            enterable: true,
            /* position: 'top', */
            backgroundColor:'rgba(255,255,255,0.7)',
            borderColor: '#019ADD',
            borderWidth: 2,
            padding: [5,10],
            textStyle: {
                color: '#000',
            }
        },
        //地图坐标系必备的配置，具体的含义可以参考api
        geo : {
            roam : false,
            map : '360000',
            zoom : 1.2,
            selectedMode : 'single',
            label : {
                normal : {
                    show : true,
                    textStyle : {
                        color : '#fff'
                    }
                },
                emphasis : {
                    show : true
                }
            },
            itemStyle : {
                hoverAnimation : false,
                normal : {
                    color : '#0065CF',
                    borderColor : '#FFF'
                },
                emphasis : {
                    areaColor : '#A6C5BD',
                    borderColor : '#FFF',
                    opacity : 1
                }
            }
        },
        series : [ {
            type : 'effectScatter',
            coordinateSystem : 'geo',
            data : mapData,
            symbol:'circle',
            symbolSize : 5,
            showEffectOn : 'render',
            rippleEffect : {
                scale : 10,
                brushType : 'stroke'
            },
            hoverAnimation : true,
            label : {
                normal : {
                    formatter : function(a){
                        return "";
                    },
                    show : true,
                    position:'inside',
                    offset : [0 ,-20],
                    textStyle:{
                        color:'#fff'
                    }
                }
            },
            itemStyle : {
                normal : {
                    color : '#f4e925',
                    shadowBlur : 10,
                    shadowColor : '#333'
                }
            },
            zlevel : 1
        },{
            type : 'scatter',
            coordinateSystem : 'geo',
            data : mapData,
            symbol:'pin',
            symbolSize : function(a){
                return a[2]==1?0:40;
            },
            rippleEffect : {
                scale : 10,
                brushType : 'stroke'
            },
            hoverAnimation : true,
            label : {
                normal : {
                    formatter : function(a){
                        return a.value[2];
                    },
                    show : true,
                    position: 'inside',
                    textStyle:{
                        color:'#fff'
                    }
                }
            },
            itemStyle : {
                normal : {
                    color : '#00DEFF',
                    shadowBlur : 10,
                    shadowColor : '#333'
                }
            },
            zlevel : 2
        },{
            type : 'scatter',
            coordinateSystem : 'geo',
            data : mapData,
            symbol : 'image://${ctx}/static/image/homePage_yc/testTip_02_s.png',
            symbolKeepAspect: true,
            symbolSize : function(a){
            	var size = nvlStr(a[3]).length;
                return [size*14,40];//[size*13,30]
            },
            symbolOffset : [0,-15],
            label : {
                normal : {
                    formatter : function(a){
                        return nvlStr(a.data.value[3]);
                    },
                    show : true,
                    position: [11,9],
                    /* offset: [0,-6], */
                    textStyle:{
                        color:'#000'
                    }
                }
            },
            itemStyle : {
            	opacity : 1
            },
            zlevel : 3
        }]
    };
    /* 格式化数字 */
    function number(data){
    	num = parseInt(data);
        if(num!=null){
            return num.toFixed(0).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g,'$&,');
        }else{
            return ;
        }
    }
</script>
<body>
</html>