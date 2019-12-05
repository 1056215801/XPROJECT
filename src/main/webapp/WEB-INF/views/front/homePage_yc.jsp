<!-- 宜春公共服务平台 -->
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
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
	
  
	<c:import url="/headerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	 
	<div class="homePage_banner">
		<div class="container banner-content">
			<div class="banner row">
				<div class="col-md-4">
					<div class="industry-new">
						<h3 class="fz0"><img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"><font class="dib">工业动态</font><a target="_blank" href="${ctx}/experience/list?entranceId=${entranceId}&type=2&city=宜春"class="fr">更多</a></h3>
						<div class="swiper-container" id="swiper1">
						    <div class="swiper-wrapper">
						    	<c:forEach items="${expShareList}" var="infoList" varStatus="k">
						    	 	<c:if test="${k.index<9}">
							    		<div class="swiper-slide pennal fz0">
									    	<a  target="_blank" href="${ctx}/experience/detail/${infoList.expId}?entranceId=${entranceId}">
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
						    	<div class="swiper-slide">
						    		<img src="${ctx}/static/image/homePage_yc/ad.jpg"  onclick="toDSJ()" style="cursor: pointer;">
						    	</div>
								<div class="swiper-slide">
									<img src="${ctx}/static/image/homePage_yc/znzz.jpg" onclick="toSWY()" style="cursor: pointer;">
								</div>			
							 </div>
						    <div id="prev1" class="swiper-button-prev swiper-button-white"></div>
						    <div id="next1" class="swiper-button-next swiper-button-white"></div>
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
								<p>获批项目资金</p>
								<p><strong>${projectFun}</strong>亿元</p>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="acts">
						<div class="tab-link">
 							<a  class="on" href="javascript:;">项目申报</a>
 							<a  href="javascript:;">活动报名</a>
						</div>
						<div class="tabs">
					 		<div class="tab" id="tab1">
								<div class="tab-list" >
							 	  	<c:forEach items="${declareList}" var="infoList" varStatus="k">
								 	  	<c:if test="${k.index<3}">
									 	  	<a target="_blank" href="${ctx}/declare/detail/${infoList.declareId}?entranceId=${entranceId}" class="act-item">
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
								<a target="_blank" href="${ctx}/declare/list?entranceId=${entranceId}">更多</a>
							</div>
							<div class="tab" id="tab2">
								<div class="tab-list">
								  	<c:forEach items="${activityeList}" var="infoList" varStatus="k">
								 	  	<c:if test="${k.index<3}">
									 	  	<a target="_blank" href="${ctx}/activity/detail/${infoList.activityId}?entranceId=${entranceId}" class="act-item fz0">
									 	  	   	<img  class="acitivityImg" src="${infoList.activityImage}">
									 	  	   	<div class="activity_div">
										 	  	   	 <c:if test="${infoList.status==1}">
										 	  	   	 	<span class="green_ing">报名中</span><font>${infoList.activityName}</font>
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
								<a target="_blank" href="${ctx}/activity/list?entranceId=${entranceId}">更多</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="recommends">
				<div class="recommend">
					<a href="javascript:;" onclick="goOffice(1)"><img src="${ctx}/static/image/homePage_yc/bangfu.png"><p>精准帮扶</p></a>
				</div>
				<div class="recommend">
					<a href="javascript:;" onclick="goOffice(2)"><img src="${ctx}/static/image/homePage_yc/xinxi.png"><p>信息互动</p></a>
				</div>
				<div class="recommend">   
					<a onclick="toOffice('/oneApplication?menuId=90020180112112320800044000000001')" href="javascript:;"><img src="${ctx}/static/image/homePage_yc/yonggong.png"><p>用工服务</p></a>
				</div>
				<div class="recommend">
					<a target="_blank" href="${ctx}/product/list?entranceId=${entranceId}"><img src="${ctx}/static/image/homePage_yc/chanpin.png"><p>产品发布</p></a>
				</div>
				<div class="recommend">
					<a target="_blank" href="${ctx}/supply/list?entranceId=${entranceId}"><img src="${ctx}/static/image/homePage_yc/yaosu.png"><p>供需发布</p></a>
				</div>
				<div class="recommend">
					<a target="_blank" href="${ctx}/helpAsk/allList?entranceId=${entranceId}"><img src="${ctx}/static/image/homePage_yc/wenwen.png"><p>帮您问问</p></a>
				</div>
				<div class="recommend">
					<a target="_blank" href="${ctx}/organ/list?entranceId=${entranceId}"><img src="${ctx}/static/image/homePage_yc/jigou.png"><p>服务机构</p></a>
				</div>
				<div class="recommend">
					<a  href="javascript:;" onclick="toSWY()"><img src="${ctx}/static/image/homePage_yc/zhinengzz.png"><p>智能制造</p></a>
				</div>
			</div>
		</div>
	</div>
	<div class="homePage_body">
		<div class="container main-content">
			<div class="row sec-floor">
				<div class="col-md-12" style="height: 100%;">
					<div class="production">
						<div class="pro-title">
							<h2 class="dib">产品展示</h2>
							<p class="dib blueT">共有<font class="redT fz16" id="production_font"></font>件产品正在热销</p>
							<a target="_blank" href="${ctx}/product/list?entranceId=${entranceId}" class="fr wgrayT">更多</a>
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
				<%-- <div class="col-md-3">
					<div class="industry-new">
						<h3 class="fz0"><img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"><font class="dib">产业动态</font><a href="${ctx}/industry/list?entranceId=${entranceId}" class="fr">更多</a></h3>
						<div class="news-list" id="news-list">
						</div>
					</div>
				</div> --%>
			</div>
			<div class="row thd-floor">
				<div class="col-md-9">
					<div class="ibox float-e-margins">
						<div class="industryHeader clearfix">
							<div class="industryLabelBar" onclick="industryDistribution()" style="cursor: pointer;"><img src="${ctx}/static/image/homePage_yc/biaoqian.png"><div class="industryLabel">产业地图</div></div>
							<div class="industryChoiceBar">
								<div class="industryChoice">
									<span class="industryAttr">热门产业</span>
									<!-- <span class="industryValue" onclick="industryChoice('90020180201174514800069000000014',this)">锂电产业</span> -->
									<span class="industryValue" onclick="javascript:window.open('${ctx}/front/cityDataCenter/ycLdIndex/1');">锂电产业</span>
									<span class="industryValue" onclick="javascript:window.open('${urlPath}XProject/front/cityDataCenter/industry/main?TopTitle=%E5%AE%9C%E6%98%A5%E5%B8%82%E6%99%BA%E6%85%A7%E5%B7%A5%E4%B8%9A%E5%B9%B3%E5%8F%B0&isCheckFlag=1&type=1');">中医药产业</span>
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
					<div class="reports reports1">
	                    <div class="tabs-container" id="kindTab">
	                    	<ul class="tab-link fz0">
	                    	 	<li class="on" ><a href="javascript:;">产业招聘月报</a></li>
	                    	 	<li class=""><a href="javascript:;">产业对接月报</a></li>
	                    	</ul>
	                    	<div class="tab-content">
	                    		<div id="tab-1" class="report-tab on">
                               		<div class="report-list" id="kind2List"></div>
                               		<a class="a_kind" id="kind2" target="_blank" href="/XProject/yc/list?type=2&entranceId=${entranceId}">更多</a>
	                            </div>
	                            <div id="tab-2" class="report-tab">
                               		<div class="report-list" id="kind1List"></div>
                               		<a class="a_kind" id="kind1" target="_blank" href="/XProject/yc/list?type=1&entranceId=${entranceId}">更多</a>/
	                            </div>
	                    	</div>
	                    </div>
	                </div>
				</div>
			</div>
			<div class="row organ-floor">
				<div class="col-md-12" style="height: 100%;">
				 	<div class="organList industry-new">
				 		<h3 class="fz0"><img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"><font class="dib">服务机构</font><a target="_blank" href="${ctx}/organ/list?entranceId=${entranceId}" class="fr">更多</a></h3>
						<div class="swiper-container loop-swipe" id="orgSwiper">
						    <div class="swiper-wrapper" id="orgSwiperChirld">
						    	 <%-- <div class="swiper-slide">
						    		<a>
						    			<img src="${ctx}/static/image/homePage_yc/ad.jpg">
						    			<p>名称：测试机构</p>
						    			<p>类别：企业管理</p>
						    		</a>
						    	</div> --%>
							 </div>
						</div>
						  <!-- <div class="swiper-button-prev swiper-button-white orgl-button-left"></div>
						    <div class="swiper-button-next swiper-button-white orgl-button-right"></div> -->
					</div> 
				</div>
			</div>
			<div class="row for-floor">
				<div class="col-md-9">
					<div class="informations fz0">
						<div class="infor-list infor-list1">
							<div class="infor-title">
								<a target="_blank" href="${ctx}/supply/list?entranceId=${entranceId}">
									<img src="${ctx}/static/image/homePage_yc/require.png">
									<div class="">
										<p><strong id="supplyTotals"></strong>条</p>
										<p>企业供求正在共享</p>
										<p class="describe">本月<font>+166</font></p>
									</div>
								</a>
							</div>
							<div class="infor-content" id="supplyInfo">
							</div>
						</div>
						<div class="infor-list infor-list2">
							<div class="infor-title">
								<a target="_blank" href="${ctx}/logistics/list?entranceId=${entranceId}"> <img
									src="${ctx}/static/image/homePage_yc/logistic.png">
									<div class="">
										<p><strong id="carTotals">1374</strong>辆</p>
										<p>物流车源为您服务</p>
										<p class="describe">本月<font>+20</font></p>
									</div>
								</a>
							</div>
							<div class="infor-content" id="carInfo"></div>
						</div>
						<div class="infor-list">
							<div class="infor-title">
								<a  onclick="getUrl()" href="javascript:;">
									<img src="${ctx}/static/image/homePage_yc/company.png">
									<div class="">
										<p><strong id="jobTotals">56</strong>个</p>
										<p>企业岗位正空缺</p>
										<p class="describe">本月<font>+235</font></p>
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
						<div class="help-title" onclick="getHelpUrl()">
							<img src="${ctx}/static/image/homePage_yc/helping.jpg">
							<div class="help-num">
								<p><b>26578</b>个问题</p>
								<p>本月<font>+78</font></p>
							</div>
						</div>
						<div class="help-content">
							<div class="help-list" id="help-list">
							</div>
							<a target="_blank" href="${ctx}/helpAsk/add?entranceId=${entranceId}"><img src="${ctx}/static/image/homePage_yc/publish.png">免费发布</a>
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
							<a target="_blank" href="${ctx}/expert/list?entranceId=${entranceId}">更多...</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="industry-new science">
						<h3 class="fz0"><img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"><font class="dib">科研机构</font><a  target="_blank" href="${ctx}/yc/list?type=5&entranceId=${entranceId}" class="fr">更多</a></h3>
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
                               <option value="http://gxw.nc.gov.cn/Index.shtml">南昌市工业和信息化局</option>
							   <option value="http://bm.pingxiang.gov.cn/gxw/">萍乡市工业和信息化局</option>
							   <option value="http://www.xysgxw.gov.cn/">新余市工业和信息化局</option>
							   <option value="http://www.ytetc.gov.cn/">鹰潭市工业和信息化局</option>
							   <option value="https://www.gzciit.gov.cn/">赣州市工业和信息化局</option>
							   <option value="http://www.jjciit.gov.cn/">九江市工业和信息化局</option>
							   <option value="http://www.jagxw.gov.cn/">吉安市工业和信息化局</option>
							   <option value="http://gxw.jxfz.gov.cn/">抚州市工业和信息化局</option>
							   <option value="http://www.ycgxw.gov.cn/">宜春市工业和信息化局</option>
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
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	<form action="" method="post" id="detailForm">
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	<input type="hidden" id="info" name="info"/>
</form>
</div>
<script>
function getHelpUrl(){
	window.open('${ctx}/helpAsk/allList?entranceId=${entranceId}',"_blank");
}
function getUrl(){
	var type = "${entranceId eq '3609009'?'3':'4'}";
	window.open('${ctx}/yc/list?type='+type+'&entranceId=${entranceId}',"_blank");
}
function detail(obj){
	$("#info").val("("+$(obj).attr("data")+")");
	$("#detailForm").attr("action","${ctx}/logistics/detail?entranceId=${entranceId}").submit();
}
function toDSJ(){
	window.open('${ctx}/cloud/list?entranceId=3609009',"_self");
}
function toSWY(){
	$.ajax({
		url : "${ctx}/session/getSWYUrl",
		type : "post",
		data : {},
		dataType : "json",
		success : function(result) {
			/* window.open(result, "_blank"); */
			if(result.success){
				window.open(result.SSOUrl, "_blank");
			}else{
				layer.alert(result.errorMsg);
			}
		},
		error : function() {
			layer.alert("系统异常");
		}
	});
}
 $(function(){
	 if('${entranceId}'== '90020180129150931800055000000001'){
		 document.title = '江西省开发区企业云服务平台';
	 }else if('${entranceId}'=='3600009'){
		 document.title = '江西省智慧工业云平台';
	 }else{
		 document.title = '宜春市企业服务平台';
	 }
	 
	 var swiper1 = new Swiper('#swiper1', {
		    autoplay:true,  
		    slidesPerView: 1,
		    slidesPerColumn : 3,
		    spaceBetween : 8,
		    observer:true,
		    pagination: {
		        el: '.swiper-pagination',
			    clickable :true,
		    },
	 });
	 var swiper2 = new Swiper('#swiper2', {
		    autoplay:true,  
		    navigation: {
		        nextEl: '#next1',
		        prevEl: '#prev1',
		        disabledClass: 'my-button-disabled'
	        },
	 });
	 $(".nav-content a:eq(0)").addClass("on");
	 $(".source-room a").removeClass("on");

	 $(".help-title img").load(function(){$(".infor-title").css("height",$(".help-title").height());});     //对齐物流、用工、供需的高度
	 $(".infor-title").css("height",$(".help-title").height());              //缓存高度
	 
	 /* $("#industry").on("click",function(e){           //二级菜单效果
		 e.stopPropagation();
		 $(this).toggleClass("act");
		 $("#companys").removeClass("act");
		 $("#secondMenu").slideToggle("fast").siblings(".second-menu").slideUp("fast");
	 });
	 $("#companys").on("click",function(e){           //二级菜单效果
		 e.stopPropagation();
		 $(this).toggleClass("act");
		 $("#industry").removeClass("act");
		 $("#thirdMenu").slideToggle("fast").siblings(".second-menu").slideUp("fast");
	 });
	 $(document).on("click",function(){         //二级菜单效果
		 $("#industry").removeClass("act");
		 $("#companys").removeClass("act");
		 $("#secondMenu").slideUp("fast");
		 $("#thirdMenu").slideUp("fast");
	 })
	 $(".second-menu ul").on("click",function(e){           //二级菜单效果
		 e.stopPropagation();
	 }) */
	 
	 $(".acts .tab-link a").on("click",function(){          //banner的tab切换
		 var $ind = $(this).index() + 1;
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#tab"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){$("#tab"+$ind).fadeIn("fast");},200)
	 })
	 $(".reports1 .tab-link li").on("click",function(){         //对接月报的tab切换
		 var $ind = $(this).index() + 1;
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#tab-"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){$("#tab-"+$ind).fadeIn("fast");},200)
	 })
 	 $(".reports3 .tab-link li").on("click", function() { //对接月报的tab切换
			var $ind = $(this).index() + 1;
			$(this).addClass("on").siblings().removeClass("on");
			$("#tabInstitution-" + $ind).siblings().fadeOut("fast");
			 setTimeout(function() {
				$("#tabInstitution-" + $ind).fadeIn("fast");
			}, 200) 
		})
	 
	 getProductionList(1,12)//获取产品展示列表
 	 getSupplyInList(1,4);//获取供需列表
	 //getIndustryDynamicsNewsList(1,5);//获取产业动态列表
	 getWanjiCarList(1,4);//获取万佶物流车源
	 getAskList(1,3)//获取帮你问问列表接口
	 getRecruitManageInfoList(1,4)//获取企业招聘列表
	 getScienInfoList(1,2)//获取科研机构列表
	 getAssistExpertInfoList(1,4)//获取专家顾问列表
	 gatherDataCountViewList(1,3,1)//获取产业对接列表
	 gatherDataCountViewList(1,3,2)
	 getOrganList(1,12)//获取服务机构列表


});
 function getOrganList(pageNum,pageSize){
	 var areaId = '';
	   if('${entranceId}'=='3609009'){
		 areaId = '360900';
	 }  
	 $.ajax({
			type : "post",
			url:"${urlPath}XOffice/interface/json/serviceInstitutionInfo/list",
			type:"post",
			data:{
				"pageNum":pageNum,
				"pageSize":pageSize,
				"instAreaId": areaId,
				"serviceKindId":'',
				orderByClause : "create_time desc",
				"type":'0'
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.value;
				if(result.total>0){
					for(var i=0;i<infoList.length;i++){
						var  info = infoList[i];
						var _div = '';
						_div += '<div class="swiper-slide">'
						_div +=	"<a target='_blank' href='${ctx}/organ/detail/"+info.id+"?entranceId=${entranceId}'>"
						_div += '<div class="pro-pic">'
					    _div +=	'<img src="'+info.logoUrl+'">'
						_div +=  '</div>'
						_div +=	'<p>'+info.institutionName+'</p>'
						var list = info.serviceKindName.split(',');
						_div += '<p>类别：'+list[0]+'</p>'
					    _div += '</a>'
					    _div += '</div>'
						$('#orgSwiperChirld').append(_div)
					}
					 var swiper = new Swiper('#orgSwiper', {
						    autoplay:true,  
						    slidesPerView : 6,
						    slidesPerGroup : 6,
						    spaceBetween : 12,
						    observer:true,
						    navigation: {
						        nextEl: '#next2',
						        prevEl: '#prev2',
					        },
					 });
				}else{
					var _div = "<div id='noData'>暂无数据</div>";
					$('#orgSwiperChirld').append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
  }
	function getSupplyInList(pageNum,pageSize) {
		$.ajax({
			url : "${ctx}/interface/json/showSupply/searchList",
			type : "post",
			data : {
				'${_csrf.parameterName}':'${_csrf.token}',
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				"provinceName" : '江西省',
			},
			dataType : "json",
			success : function(result) {
				var number1 = number(result.total.count1);
				$('#supplyTotals').text(number1);
				var infoList = result.supplyList;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
 					var _div = "";
					_div += "<a target='_blank' href='${ctx}/supply/detail/"+info.id+"?entranceId=${entranceId}'>"
 					if(info.type==0){
						_div += "<h4><font class=\'orangeT\'>"+"求购"
					}else{
						_div += "<h4><font class=\'blueT\'>"+"供应"

					}
					_div += "</font>"+info.productName+"</h4>" 
					_div += "<p>"+(info.provinceName==undefined?'':info.provinceName)+"&nbsp; "+(info.areaName==undefined?'':info.areaName)+"</p></a>"
              		$("#supplyInfo").append(_div);
				}
				
			},
			error : function() {
				//tips("请求超时，请稍后重试");
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
              		_div +=	"<a target='_blank' href='${ctx}/product/detail/"+info.id+"?entranceId=${entranceId}'>"
              		_div += "<div class=\'pro-pic\'>"
               		_div += "<img src=\'"+info.picUrl+"\'></div>"
               		_div += "<p>"+info.productName+"</p>"
              		_div += "<div class=\'province\'>"
              		if(info.spaceName){
              			_div += info.spaceName
              		}else{
              			if(info.areaName){
              				_div += info.areaName
              			}else{
              				_div += '江西省'
              			}
              		}
              		_div += "</div>"
              		_div += "</a>"
              		_div += "</div>"
              		$("#swiper3Chirld").append(_div);
				}
				 var swiper3 = new Swiper('#swiper3', {
					    autoplay:true,  
					    slidesPerView : 6,
					    slidesPerGroup : 6,
					    spaceBetween : 12,
					    observer:true,
					    pagination: {
					        el: '.swiper-pagination',
						    clickable :true,
					    },
				 });
			},
			error : function() {
				//tips("请求超时，请稍后重试");
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
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function dateToTimeStr(str){
	  return formatDate(new Date(str), "MM-dd");
	}
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format) {
		return formatDate(new Date(strDate), format);
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
	 					_div += '<a href="${ctx}/industry/detail/'+info.newsId+'?entranceId=${entranceId}">'
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
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function gatherDataCountViewList(pageNum,pageSize,kind) {
		  var areaId = "-1";
		    if('${entranceId}' == '3609009'){
		    	areaId = "360900";
		    }
		$.ajax({
  			url : "${urlPath}XOffice/interface/json/gatherDataCount/viewList",
			type : "post",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				"kind" : kind,
				"provinceId": '360000',
		  		"areaId" :areaId,
		  		"spaceId": "-1"
					},
			dataType : "json",
			success : function(result) {
				if(result.total>0){
					var infoList = result.infoList;
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						if(info.content){
							var text = info.content;
							text = text.replace(
									/<(table|tr|td|%)[\s\S]*?\/\1>/ig,
									"");
							text = text.replace(/<[^>]+>/g, "");
						}else{
							var text = '';
						}
						var _div = "";
						if(info.viewUrl){
		              		_div += '<a target="_blank" href="'+info.viewUrl+'"'
						}else{
		              		_div += '<a target="_blank" href="${ctx}/yc/detail?type='+kind+'&entranceId=${entranceId}&id='+info.id+'"'
						}
	              		_div +=	'><img class=\'dib\' src="'+info.imageUrl+'">'
 	              		_div +=  "<div class=\'dib\'><h4>"+info.title+"</h4>"
	              		_div += "<p>"+text+"</p>"
	              	 /*    _div += '<span style="font-size:15px;">'+info.browseNum+'次浏览</span>'
						_div += '<span style="font-size:15px;float:right;margin-top:2px;">'+formatCSTDate(info.createTime,'yyyy-MM-dd')+'</span>' */
	              		_div += "</div>"
	              		_div +=  "</a>"
             			if(kind==1){
                 			$("#kind1List").append(_div);
                 			$("#kind1").show();
                 		}else{
                 			$("#kind2List").append(_div);
                 			$("#kind2").show();
                 		}
					}
				}else{
					var _div = "<div id='noData'>暂无数据</div>";
					if(kind==1){
	          			$("#kind1List").append(_div);
	          			$("#kind1").hide();
	          		}else{
	          			$("#kind2List").append(_div);
	          			$("#kind2").hide();
	          		}
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function gatherDataCountViewList2(){
		$.ajax({
  			url : "${urlPath}XOffice/interface/json/recruit/statisticalAnalysis/list",
			type : "post",
			data : {
				"dateType" : 1,
		  		"orgId" : '360900',
		  		"orgType": 2
			},
			dataType : "json",
			success : function(result) {
				if(result.infoList.length>0){
					var infoList = result.infoList;
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var t = info.recruitTimeStr.slice(5);
						if(info.recruitTimeStr.slice(5,6) == 0){ t = info.recruitTimeStr.slice(6)}
						var _div = "";
	              		_div += '<a href="${ctx}/yc/detail?type='+info.recruitTimeStr+'&entranceId=${entranceId}">'
	              		_div += '<div class=\'dib report-hd\'> <img src="${ctx}/static/image/homePage_yc/use.jpg"><div class="thumb-box">'
	              		_div += '<span class=\'dib\'><font>'+t+'</font>月</span><span class=\'dib\'><p>'+info.recruitTimeStr.slice(0,4)+'年</p><p>宜春开发区</p></span></div></div>'
 	              		_div +=  "<div class=\'dib\'><h4>宜春市工业招聘统计("+info.recruitTimeStr+")</h4>"
	              		_div += "<p>本月开发区用工缺口共计"+info.recruitTotal+"人，涉及"+info.parkTotal+"个开发区，"+info.companyTotal+"家企业。</p>"
	              		_div += "</div>"
	              		_div +=  "</a>"
	              		
               			$("#kind2List").append(_div);
               			$("#kind1").show();
					}
				}else{
					var _div = "<div id='noData'>暂无数据</div>";
          			$("#kind2List").append(_div);
          			$("#kind2").hide();
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
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
						if(info.askImgUrls){
							var img = info.askImgUrls.split(",")[0];
						}
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
		              	_div += '<a target="_blank" href="${ctx}/helpAsk/detail/'+info.askId+'?entranceId=${entranceId}">'
	              		if(info.askImgUrls){
	    					_div +=  "<div class=\'help-infor\'>"
	              		}else{
	    					_div +=  "<div class=\'help-infor\' style=\'width:100%;\'>"
	              		}
						_div += "<h4>"+info.askTitle+"</h4>"
						_div += "<p><img src=\'${ctx}/static/image/homePage_yc/ico@3x.png\'>"+text+"... "+info.browseNum+"阅读 · "+info.answerNum+"回复<span class=\'fr\'>"
						_div += "<img src=\'${ctx}/static/image/homePage_yc/re@3x.png\'>回复</span></p>"
						if(info.askImgUrls){
		 				    _div += "</div><img src=\'"+img+"\'>"
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
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getRecruitManageInfoList(pageNum,pageSize) {
		var a  = "${entranceId eq '3609009'?entranceId:''}";
		$.ajax({
			url : "${urlPath}XOffice/interface/json/recruitInfo/gxwRecruitList",
			type : "post",
			data : {
  				"areaId" : "${entranceId eq '3609009'?360900:''}",
 				"pageNum" : pageNum,
				"pageSize" : pageSize,
 
			},
			dataType : "json",
			success : function(result) {
				var count = result.count;
				if (count.total3) {
					var number1 = number(count.total3);
					$('#jobTotals').text(number1);
				}else{
					$('#jobTotals').text(result.total);
				}
				var infoList = result.value;
				if (infoList.length > 0) {
					for (var i = 0; i < result.value.length; i++) {
						var info = infoList[i];
						var _div = "";
						if(info.createKind==1){  //2企业发布 1自主发布
							var t = formatCSTDate(info.recruitTime,"【MM.dd】");
					    	_div += '<a target="_blank" title="'+info.companyName+'" href="${urlPath}XProject/yc/detail?type=3&id='+info.companyId+'&time='+info.recruitTime+'&entranceId=${entranceId}">'
							_div += "<h4>"+t+""+info.companyName + "</h4>";
							_div += "<p class='job-p'>招聘：<font>" + info.recruitDetail + "</font></p>"
							_div += "</a>"
						}else{
							_div += '<a target="_blank" title="'+info.companyName+'" href="'+info.recruitDetail+'">'
							_div += "<h4 class='clamp2'> "+info.recruitTitle+" </h4>";
							_div += "</a>"
						}
						$("#jobInfo").append(_div);
					}
				} else {
					var _div = "<div id='noData'>暂无数据</div>";
					$("#jobInfo").append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
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
				"type": '1',
				 "orderByClause" : "create_time desc",
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.value;
				if(result.total>0){
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var  _div ="";
	              		_div += '<a target="_blank" href="${ctx}/yc/detail?type=5&entranceId=${entranceId}&id='+info.id+'">'
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
				//tips("请求超时，请稍后重试");
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
					_div += "<a target='_blank' class='dib' href='${ctx}/expert/detail/"+info.expertId+"?entranceId=${entranceId}'>"
					if(info.imageUrl!=undefined){
						_div += "<div class=\'expert-pic dib\'><img class=\'dib\' src=\'"+(info.imageUrl)+"\'></div>"
					}else{
						_div += "<div class=\'expert-pic dib\'><img class=\'dib\' src='${ctx}/static/image/homePage_yc/headPortrait.png'></div>"
					}		
					_div += "<div class=\'dib expert-infor\' >"
					_div +=  "<h3><strong>"+info.expertName+"</strong> "+(info.dutyLevel==undefined?'暂无':info.dutyLevel)+"</h3>"
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
				//tips("请求超时，请稍后重试");
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
				"gxwFlag":1,
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
				//layer.msg("系统异常1");
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
    	$(".industryChoice .industryValue").removeClass("choiced");
		$.ajax({
			url : "${urlPath}XWeixin/interface/json/parkInfo/count",
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
				//layer.msg("系统异常3");
			}
		});
	}
	//产业分布
	function industryDistribution(){
		$(".industryChoice .industryValue").removeClass("choiced");
		$.ajax({
			url : "${urlPath}XWeixin/interface/json/industryClusterInfo/count",
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
				//layer.msg("系统异常5");
			}
		});
	}
	//企业分布
	function enterpriseDistribution(){
		$(".industryChoice .industryValue").removeClass("choiced");
		$.ajax({
			url : "${urlPath}XWeixin/interface/json/companyInfo/count",
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
				//layer.msg("系统异常7");
			}
		});
	}
	//产业对接
	function industryDocking(){
		$(".industryChoice .industryValue").removeClass("choiced");
		window.location.href="${ctx}/product/list?entranceId=3609009";
	}
	function industryChoice(typeId,e){
		searchTypeId = typeId;
		enterpriseDistribution();
		$(".industryChoice .industryValue").removeClass("choiced");
		$(e).addClass("choiced");
	}
	function toMore(){
		window.open("${urlPath}XWeixin/static/pcHtml/industryMap/parkDistribution.html?areaId=360900&areaName=宜春市&entranceId=3609009");
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