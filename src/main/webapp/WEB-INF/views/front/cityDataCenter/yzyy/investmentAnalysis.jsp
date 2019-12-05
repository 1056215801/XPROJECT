<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<%@ include file="header.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/companyPortraitSecond.css"/>
<title>袁州医药园智慧园区大数据平台-投资分析</title>
<style>
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/yzyy/bg2.png) no-repeat center;
    background-size: 100% 100%;
}
</style>
</head>
<body class="gray-bg">
 	<div class="content fz0" style="padding:15px 15px 15px 0">
		<div class="back" onclick="goindex(8)">
		    <img src="${ctx}/static/image/cityDataCenter/ycNew2/return.png">
		    <span>返回</span>
		</div>
		<div class="pro-left">
         	<ul class="production" style="position: relative;">
				<li class="first-li" val="9">
					<div class="product-type">运行指数</div>
				</li>
				<li class="first-li" val="10">
					<div class="product-type">创新指数</div>
				</li>
				<li class="first-li" val="11"> 
					<div class="product-type">风险指数</div>
				</li>
				<li class="first-li on" val="12"> 
					<div class="product-type">投资分析</div>
				</li>
				<li class="first-li" val="13"> 
					<div class="product-type">诊断建议</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div class="spanStyle" style="width: 62%;">
				<div class="nav-title fz0" style="padding-bottom: 20px;height: 187px;">
					<div class="fl selects">
						<div class="select pd0"  style="cursor: pointer;">
			    			<img src="${ctx}/static/image/cityDataCenter/yzyy/qylogo.png">
			    			<span style="display: inline-block;padding-top: 14px; font-size: 16px; font-weight: bold;">江西济民可信药业有限公司</span>
			    		</div>
					</div>
					<div class="comPowerBar" style="margin-top: 37px;">
						<div class="comPower kpr"> <i></i>
							<div class="propertyRightBar"> <img src="${ctx}/static/image/cityDataCenter/yzyy/halfcirle.png">
								<div class="propertyRightName">投资企业（家）</div>
								<div class="propertyRightValue">3</div>
							</div>
						</div>
						<div class="comPower kpr"> <i></i>
							<div class="propertyRightBar"> <img src="${ctx}/static/image/cityDataCenter/yzyy/halfcirle.png">
								<div class="propertyRightName">控股企业（家）</div>
								<div class="propertyRightValue">2</div>
							</div>
						</div>
						<div class="comPower kpr"> <i></i>
							<div class="propertyRightBar"> <img src="${ctx}/static/image/cityDataCenter/yzyy/halfcirle.png">
								<div class="propertyRightName">投资项目（个）</div>
								<div class="propertyRightValue">2</div>
							</div>
						</div>
						<div class="comPower kpr"> <i></i>
							<div class="propertyRightBar"> <img src="${ctx}/static/image/cityDataCenter/yzyy/halfcirle.png">
								<div class="propertyRightName">投资金额（亿元）</div>
								<div class="propertyRightValue">60</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="changeParent" id="div1" style="height: calc(100% - 187px);">
					<div class="blockStyle">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
								<span class="on">企业图谱</span>
								</div>
								<div class="part-content reusltContent">
									<i></i>
				            		<div class="verCenter">
				            			<div class="circleIndexBar size120 blueC">
				            				<div class="circleBack1"></div>
				            				<div class="circleBack2"></div>
				            				<div class="circle"></div>
				            				<div class="circleIndex">
				            					<div class="circleIndexComName">袁州唯美陶瓷</br>有限公司</div>
				            				</div>
				            			</div>
				            		</div>
				            		<!-- 轨迹 -->
									<div class="trackTop"></div>
									<div class="trackMid"></div>
									<div class="trackBtm"></div>
									<!-- 箭头 -->
									<img src="${ctx}/static/image/cityDataCenter/yzyy/tArrow.png" class="trackArrow1">
									<img src="${ctx}/static/image/cityDataCenter/yzyy/tArrow.png" class="trackArrow2">
									<img src="${ctx}/static/image/cityDataCenter/yzyy/tArrow.png" class="trackArrow3">
				            		<!-- 动点 -->
				            		<div class="atlas atlas_1"></div>
				            		<div class="atlas atlas_2"></div>
				            		<div class="atlas atlas_3"></div>
				            		<div class="atlas atlas_4"></div>
				            		<div class="atlas atlas_5"></div>
				            		<div class="atlas atlas_6"></div>
				            		<div class="atlas atlas_7"></div>
				            		<div class="atlas atlas_8"></div>
				            		<div class="atlas atlas_9"></div>
				            		<!-- 企业 -->
				            		<div class="companyAtlasBar c1">
										<div class="companyAtlasName">北京融智汇投资管理中心</div>
										<div class="companyAtlasValue">1.7%（5196.33万元）</div>
									</div>
									<div class="companyAtlasBar c2">
										<div class="companyAtlasName">山南嘉实弘盛投资合伙企业</div>
										<div class="companyAtlasValue">1.6%（4892.56万元）</div>
									</div>
									<div class="companyAtlasBar c3">
										<div class="companyAtlasName">宿迁东瑞银泰股份</div>
										<div class="companyAtlasValue">1.44%（4391万元）</div>
									</div>
									<div class="companyAtlasBar c4">
										<div class="companyAtlasName">深圳市金维蓝技术有限公司</div>
										<div class="companyAtlasValue">9%（5196.33万元）</div>
									</div>
									<div class="companyAtlasBar c5">
										<div class="companyAtlasName">北京3W科技有限公司</div>
										<div class="companyAtlasValue">5.66%（40.49万元）</div>
									</div>
									<div class="companyAtlasBar c6">
										<div class="companyAtlasName">上海晓途网络科技有限公司</div>
										<div class="companyAtlasValue">1.44%（4391万元）</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="spanStyle" style="width: calc(38% - 10px)">
				<div class="blockStyle">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
						<span class="on selects">
							<div class="select yywl">
								<p class="select-p"><font id="yywl">医药物流产业园项目</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items" style="width: 189px;right: auto;">
									<ul>
										<li>医药物流产业园项目</li>
										<li>医药塑料制品生产项目</li>
										<li>医药流通</li>
										<li>批发</li>
										<li>制造项目</li>
									</ul>
								</div>
							</div>
						</span>
						</div>
						<div class="part-content reusltContent">
							<div class="company-half">
								<div class="dib company-box">
									<p>投资金额（亿元）</p>
									<font class="yellowT2">20</font>
								</div>
								<div class="company-box">
									<p>总投资排名</p>
									<font class="yellowT2">5</font>
								</div>
								<div class="dib company-box">
									<p>所属行业/产业</p>
									<font class="yellowT2 text">电子信息</font>
								</div>
								<div class="dib company-box">
									<p>行业投资排名</p>
									<font class="yellowT2">2</font>
								</div>
								<div class="dib company-box">
									<p>占地面积（亩）</p>
									<font class="yellowT2">20</font>
								</div>
								<div class="dib company-box">
									<p>占地面积排名</p>
									<font class="yellowT2">3</font>
								</div>
								<div class="dib company-box" style="width: 85%;">
									<p>建设周期</p>
									<font class="yellowT2">2019.05.22-2021.06.21</font>(3年1个月)
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="tabs">
								<div class="tab">
									<div class="select-tab" id="select-chart">
										<span class="on">投资进度</span>
										<span>最新进展</span>
										<span>存在问题</span>
									</div>
									<div id="pie-guishang" style="height: calc(100% - 33px);"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
 	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/yzyyData.js"></script>
<script type="text/javascript">
var historyData = "";
$(function(){
	var tabIndex = '${tabIndex}';
	$(".head .tab>a:eq(4)").addClass("on");
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v = $(this).attr("val")
		if(v!=''){
			window.location.href = "${ctx}/front/cityDataCenter/yzyyIndex/"+v;
		} else { alert("建设中!")}
	});
	$(document).click(function(event){
		if(!$(".select p").is(event.target) && $(".select p").has(event.target).length === 0){
			$('.select-items').slideUp();
		}
	});
	$(".select p").on("click",function(){
		if($(this).next().css("display")!='block'){
			$(".select p").next().slideUp();
		}
		$(this).next().slideToggle();
	})
	$(".yywl li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		$('#yywl').text($(this).text());
	})
	$(".select-tab span").on("click",function(){
		$(this).addClass("on").siblings().removeClass("on");
	})
	getPie();
})
//饼图
function getPie(){
	var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	var fz1 = 36;
	var fz2 = 14;
	var radius1=['42%','71%']
	var radius2=['55%', '43%']
	if(width<=1600){
		fz1 =20;
		fz2 = 12;
	}
	if(width<=1440){
		fz1 = 14;
		fz2 = 10;
		radius1=['28%','47%']
		radius2=['38%', '29%']
	}
	var myChart = echarts.init(document.getElementById('pie-guishang'));	 
	var option = {
			color: ['#F16279', '#FCD434', '#4EC973', '#34C9C9', '#965DE4', '#399EFF', "rgba(0,0,0,0.2)"],
			title: {
				 text:'20000',
		         subtext: '总投资（万元）',
		         textStyle: {
		             color: '#FFEE2D',
		             fontSize: fz1,
		             lineHeight: 10,
		         },
		         subtextStyle: {
		             fontSize: fz2,
		             color: '#00DEFF',
		             lineHeight: 10,
		         },
		         x: 'center',
		         y: '42%',
		         itemGap: 5, 
		     },
		     grid: {
		         top:10,
		    	 bottom: 0,
		    	 containLabel:true
		     },
		     series: [
		    	 {
					 color:['#FCD434','#399EFF'],
		             radius:radius1,
		             center: ['50%', '50%'],
		             type: 'pie',
		             startAngle: 200,
		             label: {
		            	 show: true,
		                 formatter: function(param){
		                		 return param.name+'\n'+ param.value+'万元'+'（'+param.percent+'%）'; 
		                 },
		                 fontSize: 14,
		                 position: 'outside',
		                 color: '#fff',
		                 algin: 'center',
		             },
		             labelLine: {
		            	 show: true,
		                 length: 10,
		                 length2: 8,
		                 lineStyle: {
		                	color: '#fff' 
		                 }
		             },
		             data: [{
						name:'累计投资完成',
						value:'5900'
						 
					 },{
						name:'未完成投资',
						value:'14100'
					 }]
		         },
		         {
		             radius: radius2,
		             center: ['50%', '50%'],
		             type: 'pie',
		             label: {
		            	 show: false
		             },
		             labelLine: {
		            	 show: false
		             },
		             animation: false,
		             tooltip: {
		                 show: false
		             },
		             data: [{
		                 value: 1,
		                 itemStyle: {
		                     color: "rgba(0,0,0,0.2)",
		                 },
		             }],
		         }
		     ]
	}
	myChart.setOption(option);
}
function goindex(num){
		if($("#companyId").val()!="" && $("#companyId").val() != undefined){
			window.location.href='${ctx}/front/cityDataCenter/yzyyIndex/'+num+'?companyId='+$("#companyId").val()
		}else{
			window.location.href='${ctx}/front/cityDataCenter/yzyyIndex/'+num+'?companyId=90020180314182240800039000001686'
		}
	}
</script>
</html>
