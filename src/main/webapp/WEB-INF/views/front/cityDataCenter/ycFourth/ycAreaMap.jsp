<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link href="${ctx}/static/css/cityDataCenter/fourthSite.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/js/dataCenter/organizationCountConfig.js"></script>
<title>区县经济指标</title>
</head>
<body class="gray-bg">
    <%@ include file="header.jsp"%>
    <div class="content fz0">
		<div class="pro-left">
	         <ul class="production" style="position: relative;">
				<li class="first-li" val1="2" val2="index1_code2" val3="主要经济指标">
					<div class="product-type">主要经济指标</div>
				</li>
				<li class="first-li" val1="3" val2="index1_code3" val3="工业用电">
					<div class="product-type">工业用电</div>
				</li>
				<li class="first-li on" val1="4" val2="index1_code4" val3="区县经济指标"> 
					<div class="product-type">区县经济指标</div>
				</li>
				<li class="first-li" val1="5" val2="index1_code5" val3="园区经济指标"> 
					<div class="product-type">园区经济指标</div>
				</li>
				<li class="first-li" val1="7" val2="index1_code6" val3="八大产业"> 
					<div class="product-type">八大产业</div>
				</li>
				<li class="first-li" val1="8" val2="index1_code7" val3="十大基地"> 
					<div class="product-type">十大基地</div>
				</li>
			    <li class="first-li" val1="26" val2="index1_code8" val3="规上企业"> 
					<div class="product-type">规上企业</div>
				</li>
				<li class="first-li" val1="" > 
					<div class="product-type">企业融资</div>
				</li>
				<li class="first-li" val1="27" val2="index1_code9" val3="规上企业纳税"> 
					<div class="product-type">规上企业纳税</div>
				</li>
				<li class="first-li" val1="23" val2="index1_code10" val3="产品价格趋势"> 
					<div class="product-type">产品价格趋势</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			 <div class="nav-title">
		    	<form action="" method="post" id="form">
					<input type="hidden" id="orgId" name="orgId" value="${orgId}">
					<input type="hidden" id="year" name="year" value="">
					<input type="hidden" id="month" name="month" value="">
					<input type="hidden" id="lastYear" name="lastYear">
					<input type="hidden" id="lastMonth" name="lastMonth">
					<input type="hidden" id="spaceId" name="spaceId">
					<input type="hidden" id="spaceName" name="spaceName">
				</form>
		    	<div class="nav">	
					<div class="nav-text">
						<div class="tab-eightIndustry" id="eightIndustry" style="margin:0;" onclick="changeDiv()">
							<span class="on">区县指标</span>
						</div>
					    <div class="tab-eightIndustry" id="tab-eightIndustry">
						   	<span name="title" data="zyywsr">区县效益对比</span>
						   	<span name="title" >区县创新对比</span>
						   	<span name="title" >产业集群聚集度</span>
					    </div>
						<div class="selects" id="forthTab00" style="display: inline-block;">
							<div class="select select1">
								<p><font id="font1"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="ul1">
									</ul>
								</div>
							</div>
							<div class="select select2">
								<p><font id="font2"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="ul2">
										<li>1月</li>
										<li>2月</li>
										<li>3月</li>
										<li>4月</li>
										<li>5月</li>
										<li>6月</li>
										<li>7月</li>
										<li>8月</li>
										<li>9月</li>
										<li>10月</li>
										<li>11月</li>
										<li>12月</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div> 
			</div>
			<div class="changeParent" id="div1">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 50%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content" style="position: relative; padding: 10px 20px;">
				   				<div class="tab" style="overflow: hidden;height: 100%">
									<div class="orders" style="display: inline-block;">
										<b>按指标排名：</b>
										<span class="on">
											主营业务收入
											<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
											<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
										</span>
										<span>
											工业增加值
											<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
											<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
										</span>
										<span>
											利润总额
											<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
											<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
										</span>
									</div>
									<div class="count-list area-list" id="industryList" style="margin-top:0;"></div>
								 </div>
			         	    </div>
		                 </div>
			         </div>
					<div class="spanStyle" style="width: calc(50% - 10px);">
			             <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
				         		 <div class="eight-map">
				         			 <div  class="mapContent" id="eight-map2">
				         			 </div>
				         		 </div> 
			         	    </div>
						  </div>	
			         </div>
       			</div>
		     	<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="spanStyle" style="width: 50%;">
						<div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
			         			<div class="eight-map">
			         				<div  class="mapContent" id="eight-map3">
			         			
			         				</div>
			         			</div>
		         		   </div>
		     		     </div>
		         	</div>
		         	<div class="spanStyle" style="width: calc(50% - 10px);">
		         	    <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
				         		<div class="eight-map">
			         				<div  class="mapContent" id="eight-map4">
			         			
			         				</div>
			         			</div>
			         	   </div>
						</div>	
		         	</div>
		       </div>
			</div>
			<div class="changeParent" id="div2" style="display:none;">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 50%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar" style="cursor: pointer;">
					           <span class="tabCaption">区县主营利润率对比</span>
					           <span class="noBorderLeft  legend changeLegend">
	         					 <font id="average1" class="average"></font>
		         		       </span>
				            </div>
		                 	<div class="part-content reusltContent" style="position: relative;">
				   			<div class="tab" style="overflow: hidden;height: 100%">
								<div class="count-list area-list" id="rateList" style="height:100%;margin-top:0;"></div>
								</div>
			         		</div>
			         	 </div>
			         </div>
					<div class="spanStyle" style="width: calc(50% - 10px);">
			             <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar tab-links" style="cursor: pointer;">
					           <span class="on">区县指标结果分析</span>
					           <span class="noBorderLeft" id="resultAys"></span>
				            </div>
							<div class="part-content reusltContent">
				         		 <div class="eight-map">
				         			 <table class="ten-table">
			         					<tr>
			         						<td></td>
			         						<td>主营利润率最高</td>
			         						<td>主营业务收入最高</td>
			         						<td>利润最高</td>
			         						<td>工业增加值同比最高</td>
			         					</tr>
			         					<tr>
			         						<td>区县名称</td>
			         						<td id="lrl1">电子信息产业</td>
			         						<td id="sr1">电子信息产业</td>
			         						<td id="lr1">电子信息产业</td>
			         						<td id="zjz1">电子信息产业</td>
			         					</tr>
			         					<tr>
			         						<td>当前数据</td>
			         						<td id="lrl2">18.3%</td>
			         						<td id="sr2">125 <i style="height:18px;">亿元</i></td>
			         						<td id="lr2">25 <i style="height:18px;">亿元</i></td>
			         						<td id="zjz2">7.3%</td>
			         					</tr>
			         					<tr>
			         						<td>上年同期</td>
			         						<td id="lrl3">18.3%</td>
			         						<td id="sr3">125 <i style="height:18px;">亿元</i></td>
			         						<td id="lr3">25 <i style="height:18px;">亿元</i></td>
			         						<td id="zjz3">7.3%</td>
			         					</tr>
			         					<tr>
			         						<td>同比</td>
			         						<td id="lrl4">18.3% <img src="${ctx}/static/image/cityDataCenter/yc/up.png" /></td>
			         						<td id="sr4">8.3% <img src="${ctx}/static/image/cityDataCenter/yc/down.png" /></td>
			         						<td id="lr4">18.3% <img src="${ctx}/static/image/cityDataCenter/yc/up.png" /></td>
			         						<td id="zjz4">9.3% <img src="${ctx}/static/image/cityDataCenter/yc/down.png" /></td>
			         					</tr>
			         				</table>
				         		 </div> 
			         	     </div>
			              </div>
			         </div>
				</div>
				<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="spanStyle" style="width: 50%;">
		     		     <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">区县利润对比（亿元，%）</span>
					           <span class="noBorderLeft" onclick="alert('建设中!')">区县税收对比</span>
					           <span class="noBorderLeft  legend changeLegend" id="changeChart1">
		         					<font class="chirld-legend on"><span></span>总量</font>
		         					<font class="chirld-legend"><span></span>同比</font>
			         		    </span>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="lrze" id="lrData" style="display:none;">
			         				      <h1></h1>
			         				      <span>利润总额（亿元）</span>
			         				 </div>
			         				<div class="mapContent" id="bar2">
			         				</div>
			         			</div>
		         		   </div>
		     		     </div>
		         	</div>
		         	<div class="spanStyle" style="width: calc(50% - 10px);">
		         	      <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">区县主营业务对比（亿元,%）</span>
					            <span class="noBorderLeft  legend changeLegend" id="changeChart2">
		         					<font class="chirld-legend on"><span></span>总量</font>
		         					<font class="chirld-legend"><span></span>同比</font>
			         		    </span>
				            </div>
							<div class="part-content reusltContent" style="padding:10px">
				         		<div class="eight-map">
				         		    <div class="lrze" id="zyData" style="display:none;">
			         				      <h1></h1>
			         				      <span>主营业务（亿元）</span>
			         				 </div>
			         				<div  class="mapContent" id="bar3"></div>
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
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script type="text/javascript">
var orderby = "2";
var echartData;
var isLoading = false;
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
$(function(){
	$(".head>a:eq(1)").addClass("on");
	var index = "";
	$("#tab-eightIndustry>span").on("click",function(){
		var ind = $(this).index();
		console.log(ind)
		index = $(this).attr("data");
		if(ind==1||ind==2){
			alert('建设中！')
		}else{
			$('#div1').hide();
			$('#div2').show();
			$('#eightIndustry span').removeClass("on");
			$(this).addClass("on").siblings().removeClass("on");
		    loadData();
		}
	})
	$(document).click(function(event){
		if(!$(".select p").is(event.target) && $(".select p").has(event.target).length === 0){
			$('.select-items').slideUp();
		}
	});
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v1 = $(this).attr("val1");
		var v2 = $(this).attr("val2");
		var v3 = $(this).attr("val3");
		if(v1!=''){
			checkRight(v1,'',v2,v3);
		} else { alert("建设中!")}
	});
	$(".select p").on("click",function(){
		if($(this).next().css("display")!='block'){
			$(".select p").next().slideUp();
		}
		$(this).next().slideToggle();
	})
	$(".orders>span").on("click",function(){
		var ind = $(this).index()-1;
		$(this).addClass("on").siblings().removeClass("on");
		if(ind==0){
			orderby = "2";
			getList(0,0);
		}else if(ind==1){
			orderby = "1";
			 getList(0,0);
		}else if(ind==2){
			orderby = "3"
			getList(0,0);
		}else{
			alert('建设中!')
		}
	})
	$(".changeLegend font").on("click",function(){
		var ind = $(this).index();
		var pId = $(this).parent().attr("id");
		$(this).addClass("on").siblings().removeClass("on");
		if(pId == 'changeChart1') {
			if(ind == 0) {
				loadBar(econData.div3_seriesPieLr,econData.div3_legendPieLr,'bar2',econData.div3_pieFlag);
			} else {
				loadBar2(econData.div3_seriesBarLr,econData.div3_xAxisBarLr,'bar2',econData.div3_barFlag);
			}
		} else {
			if(ind == 0) {
				loadBar(econData.div4_seriesPieZyywsr,econData.div4_legendPieZyywsr,'bar3',econData.div4_pieFlag);
			} else {
				loadBar2(econData.div4_seriesBarZyywsr,econData.div4_xAxisBarZyywsr,'bar3',econData.div4_barFlag);

			}
		}
	})
	var index = '${spanIndex}';
	if(index==0){
		orderby = "2";
	}else if(index==1){
		orderby = "1";
	}else if(ind==2){
		orderby = "3";
	}else{
		orderby = "3";
	}
	$('.orders span:eq('+index+')').addClass("on").siblings().removeClass("on");
	getList(1,0);
});
function getselectYear(yearList){
    for(var i=0; i<yearList.length;i++){
    	$('#forthTab00 .select1 ul').append('<li>'+yearList[i]+'</li>');
    	$('#forthTab001 .select1 ul').append('<li>'+yearList[i]+'</li>');
    }
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		$(".changeLegend font:eq(0)").addClass("on").siblings().removeClass("on");
		if($(this).parent().attr('id')=='ul1'){
 			$('#font1').text($(this).text());
 			$('#year').val($(this).text());
			getList(0);
			loadData();
		}else if($(this).parents().attr('id')=='ul2'){
  			$('#font2').text($(this).text());
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			$('#month').val(month);
			getList(0);
			loadData();
		}
	})
}
function getList(type){
	var param = {
			"areaId": $('#orgId').val()=='3609009'?'360900':"360900",
					"year": $('#year').val(),
					"month": $('#month').val(),
					"orderType": orderby,
	};
	//console.log(param);
	$.ajax({
 		url : "${ctx}/interface/json/cityDataCenter/ycNew/selectSpaceEconomicData",
		type : "post",
		data : {
			"areaId": $('#orgId').val()=='3609009'?'360900':"360900",
			"year": $('#year').val(),
			"month": $('#month').val(),
			"orderType": orderby,
 		},
		dataType : "json",
		success : function(result) {
			if(result.success){
				if(type==1){
					$('#year').val(result.year);
					$('#month').val(result.month);
					$('#font1').text(result.year);
					$('#font2').text(result.month+'月');
					$('#resultAys').text('截至'+result.year+'年'+result.month+'月');
					getselectYear(result.yearList);
				}
				type=0;
				var list = result.value;
				if(list.length>0){
					$('#industryList').empty();
					$('#lastYear').val($('#year').val());
					$('#lastMonth').val($('#month').val());
				 	for (var i=0;i<list.length;i++){
						var info = list[i];
						var index = i+1;
						 var w = i==0? '90' : ((info.value/list[0].value)*90).toFixed(2);
					    var _div = "";
					     if(i==0){
						    	$('#spaceId').val(info.spaceId);
						    	$('#spaceName').val(info.spaceName);
								 getMap();
								    _div += '<div class="count-item on" onclick="changeMap(this,\''+info.spaceId+'\',\''+info.spaceName+'\')">'
							    }else{
								    _div += '<div class="count-item" onclick="changeMap(this,\''+info.spaceId+'\',\''+info.spaceName+'\')">'
							    }
			 				_div += '<font style="width:100px;">'+index+'.'+info.spaceName+'</font>';
			 				_div += '<span style="width: calc(100% - 230px);">';
			 				if(info.value){
			 					_div += '<div style="width: '+w+'%;"></div>';
				 				if(orderby==1){
					 				_div += '</span><b style="width:120px;">'+info.value+'<i>%</i></b></div>';
				 				}else{
					 				_div += '</span><b style="width:120px;">'+info.value+'<i>亿元</i></b></div>';
				 				}
			 				}else{
			 					_div += '<div style="width: 0%;"></div>';
				 				_div += '</span><b style="width:80px;">未公布</b></div>';
			 				}
						$('#industryList').append(_div);
					}
					
					$('#resultAys').text('截至'+$('#year').val()+'年'+$('#month').val()+'月'); 
				}else{
					alert($('#font1').text()+'年'+$('#font2').text()+"暂无数据");
					$('#font1').text($('#lastYear').val());
					$('#font2').text($('#lastMonth').val()+'月');
					$('#year').val($('#lastYear').val());
					$('#month').val($('#lastMonth').val());
					
				}
			}else{
				//tips("数据获取异常");
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function getMap(){
	var param  = {
		"year": $('#year').val(),
		"spaceId": $('#spaceId').val()
		};
    $.ajax({
		url : "${ctx}/interface/json/cityDataCenter/ycNew/selectSpaceMonthEconomicData",
		type : "post",
		data : {
			"year": $('#year').val(),
			"spaceId": $('#spaceId').val(),
			"month": $('#month').val()
 		},
		dataType : "json",
		success : function(result) {
			//console.log(result)
		 	if(result.success){
		 		var xAxis = result.value.xAxis;
				echarData = result.value;
			 	chartMap2(echarData.gyzjz_percent,'',$('#year').val(),$('#spaceName').val(),xAxis);//工业增加百分比
				chartMap3 (echarData.zyywsr_value,echarData.zyywsr_percent,$('#year').val(),$('#spaceName').val(),xAxis);//主营业务收入和增长率
				chartMap4 (echarData.lr_value,echarData.lr_percent,$('#year').val(),$('#spaceName').val(),xAxis);//利润总额和增长率    
			} 
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function changeMap(e,spaceId,spaceName){
	$('#spaceId').val(spaceId);
	$('#spaceName').val(spaceName);
	$(e).addClass("on").siblings().removeClass("on");
	getMap()
}
function changeDiv(){
	$('#div1').show();
	$('#div2').hide();
	$("#eightIndustry span").addClass("on");
	$("#tab-eightIndustry>span").removeClass("on");
}
var econData = "";
function loadData() {
	var year = $("#year").val();
	var month = $("#month").val();
	var param = {
			"areaId" : '360900',
			"year" :  year,
			"month" : month	
	}
	$.ajax({
		url:'${ctx}/interface/json/cityDataCenter/ycNew/selectSpaceBenefitAnalysisData',
		type : "post",
		data : param,
		success : function(result) {
			if (result.success) {
			 	isLoading = true;
				var data = result.value;
				if(data.div1_list.length>0){
				  econData = data;
				}
				if(data.div1_area_value){
					$('#average1').text('全市平均值：'+data.div1_area_value+'%');
				}
			    var _div = "";
			    if(data.div1_list.length>0){
			        for(var i=0;i<data.div1_list.length;i++) {
				    	var index = i+1;
				    	var info =  data.div1_list[i].value;
				    	var info2 = data.div1_list[i].spaceName;
						 var w = i==0? '90' : ((info/data.div1_list[0].value)*90).toFixed(2);

				    	_div += '<div class="count-item">';
		 				_div += '<font style="width:100px;">'+index+'.'+info2+'</font>';
		 				_div += '<span style="width: calc(100% - 230px);">';
		 				if(info){
		 					_div += '<div style="width: '+w+'%;"></div>';
			 				_div += '</span><b style="width:90px;">'+info+'<i>%</i></b></div>';
		 				}else{
		 					_div += '<div style="width: 0%;"></div>';
			 				_div += '</span><b style="width:90px;">未公布</b></div>';
		 				}
				    }
				    $('#rateList').html(_div);
				    $('#lrData h1').text(data.div3_totalLr);
				    $('#zyData h1').text(data.div4_totalZyywsr); 
				    loadTable(data);
					loadBar(data.div3_seriesPieLr,data.div3_legendPieLr,'bar2',data.div3_pieFlag);
					loadBar(data.div4_seriesPieZyywsr,data.div4_legendPieZyywsr,'bar3',data.div4_pieFlag);
			    }
			}
		},
		error : function() {
			//layer.msg("数据获取异常！");
		}
	})
}

function loadTable(d){
	$("#lrl1").html(d.div2_ja1[0]);
	$("#lrl2").html(tongBi(d.div2_ja1[1],2));
	$("#lrl3").html(tongBi(d.div2_ja1[2],2));
	$("#lrl4").html(tongBi(d.div2_ja1[3],3));
	
	$("#lr1").html(d.div2_ja3[0]);
	$("#lr2").html(tongBi(d.div2_ja3[1],1));
	$("#lr3").html(tongBi(d.div2_ja3[2],1));
	$("#lr4").html(tongBi(d.div2_ja3[3],4));
	
	$("#sr1").html(d.div2_ja2[0]);
	$("#sr2").html(tongBi(d.div2_ja2[1],1));
	$("#sr3").html(tongBi(d.div2_ja2[2],1));
	$("#sr4").html(tongBi(d.div2_ja2[3],4));
	
	$("#zjz1").html(d.div2_ja4[0]);
	$("#zjz2").html(tongBi(d.div2_ja4[1],2));
	$("#zjz3").html(tongBi(d.div2_ja4[2],2));
	$("#zjz4").html(tongBi(d.div2_ja4[3],3)); 
}
function tongBi(d,t){           //根据不同类型返回不同数据，1是亿元，2是%，3是带箭头%
	if(d){
		if(t == 4){
			if(Number(d) > 0) { return d + '<i style="height:18px;">亿元</i><img src="${ctx}/static/image/cityDataCenter/jxNew/big-red-up.png" />'}
			else if( d == ''|| d == null) { return '未公布'}
			else if( Number(d) < 0) { return d + '<i style="height:18px;">亿元</i><img src="${ctx}/static/image/cityDataCenter/jxNew/big-green-down.png" />'}
			else { return d}
		} else if(t == 3){
			if(Number(d) > 0) { return d + '%<img src="${ctx}/static/image/cityDataCenter/jxNew/big-red-up.png" />'}
			else if( d == ''|| d == null) { return '未公布'}
			else if( Number(d) < 0) { return d + '%<img src="${ctx}/static/image/cityDataCenter/jxNew/big-green-down.png" />'}
			else { return d}
		} else if(t == 2){
			if(d == ''|| d == null) { return '未公布';}
			else { return d + '%';}
		} else {
			if(d == ''|| d == null) { return '未公布';}
			else { return d + '<i style="height:18px;">亿元</i>';}
		}
	} else { return '未公布'}
}

function loadBar(d1,d2,id,flag){
	var d3 = new Array(); //如果某年某月区县的利润为负数，不参与占比，当年当月 过滤掉该区县。
	if(id=='bar2'){
		for(i=0;i<d1.length;i++){
			if(d1[i].value>0){
				d3.push(d1[i]);
			}
		}
	}else{
		d3 = d1;
	}
	var fz = 14;
	if(width<=1600){
		fz = 12;
	}
	if(width<=1366){
		fz = 10;
	}
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	var option = {
		tooltip: {
			trigger: 'item',
			textStyle:{
				fontSize: fz,
			}
		},
	   	grid: {
	    	top: 0,
	    	bottom: 0,
	    	left: 0,
	    	rigth: 0,
	        containLabel: true
	    },
		 color:['#2126FF','#2B3EFF','#3350FF','#3D66FF','#4981FF','#4C88FF',
	           '#57A2FF','#66C3FF','#71DEFF','#72DFFF'],
	    series: {
	        type: 'pie',
	        radius : ['45%', '65%'],
	        center: ['45%', '50%'],
	        itemStyle: {
	        },
	        label: {
	        	formatter: function(params){
	            	return params.name + "\n" + params.value + "亿元（" + (params.percent).toFixed(0)+"%）";
	            },
	            fontSize: fz,
	            color: '#fff'
	        },
	        labelLine: {
	        	length: 10,
	        	length2: 10,
			},
			data: d3
	    }
	};
	if(flag){
		chart.setOption(option);
		if(id=='bar2'){
			$('#lrData').show();
		}
		if(id=='bar3'){
			$('#zyData').show();
		}
	}else{
		$("#"+id).html("<div class='noData'>暂无数据</div>");
		if(id=='bar2'){
			$('#lrData').hide();
		}
		if(id=='bar3'){
			$('#zyData').hide();
		}
	}
}
function loadBar2(d1,d2,id,flag){
	var fz = 14;
	if(width<=1600){
		fz = 10;
	}
	if(width<=1366){
		fz = 10;
	}
	var d3 = new Array();
	for(i=0;i<d1.length;i++){
		if(d1[i].value==999999||d1[i].value==-999999||d1[i].value==-999998||d1[i].value==-999997){
			d3.push({"name":d1[i].name,"value":""});
		}else{
			if(d1[i].value==0){
				d3.push({"name":d1[i].name,"value":""});
			}else{
				d3.push(d1[i]);
			}
		}
	}
	if(id=='bar2'){
		$('#lrData').hide();
	}
	if(id=='bar3'){
		$('#zyData').hide();
	}
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	option = {
			
			 grid: {
			        left: '10',
			        right: '10',
			        bottom: '10',
			        top: '40',
			        containLabel: true
			    },
    
			    tooltip: {
			    	textStyle:{
						fontSize: fz,
					}
			    },
			    xAxis: {
			        data: d2,
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
		                color: '00DEFF',
			            rotate: 30,
			            fontSize: fz,
			        },
			        offset: 8,
		            axisLine: {
		                lineStyle: { 
		                	color: '#fff',
		                	width: 2,
		                	opacity:0.2
		                   }
		            },
			    },
			    yAxis: {
			        splitLine: {
			            show: false
			        },
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
			            textStyle: {
			              color: '#00DEFF',
			           }
			        },
		            axisLine: {
		                lineStyle: { 
		                	color: '#00DEFF',
		                	width: 2,
		                	opacity:0.2
		                }
		            },
			    },
			    series: [{
			        type: 'pictorialBar',
			        symbolSize: [25, 15],
			        symbolPosition: 'end',
			        symbolOffset: [0, -10],
			        z: 8,
			   /*      label:{
			        	show:true,
	                	normal:{
	        	            formatter: function(params){
	        	            	console.log(params)
	        	            	var p = params.value;
	        	        		return (p == '999999')?'增亏':(p == '-999999')?'亏损':(p == '-999998')?'扭亏':(p == '-999997')?'减亏':p;
	        	            },
	                	},
	                }, */
			        itemStyle: {
			            normal: {
			              color: '#18A7E3'
			            }
			    
			        },
			        data: d3
			          
			    }, {
			        type: 'pictorialBar',
			        symbolSize: [25, 15],
			        symbolOffset: [0, 10],
			        symbolPosition: 'start',
			        z: 12,
			        label:{
			        	show:true,
	                	normal:{
	        	            formatter: function(params){
	        	            	var p = params.value;
	        	        		return (p == '999999')?'增亏':(p == '-999999')?'亏损':(p == '-999998')?'扭亏':(p == '-999997')?'减亏':p;
	        	            },
	                	},
	                },
			        itemStyle: {
			            normal: {
			            	color: '#0380DD'
			            }
			        },
			        data: d3
			    },   {
			        type: 'bar',
			        itemStyle: {
			            normal: {
			                    color: '#0380DD',
			                    opacity: 0.7
			               
			            }
			        },
			        silent: true,
			        barWidth: 25,
			        barGap: '-100%', 
			        data: d3
			    }]
			};
	if(flag){
		chart.setOption(option);
	}else{
		$("#"+id).html("<div class='noData'>暂无数据</div>");
	}	
}



function loadBar3(d1,d2,id,t) {
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	var option = {
		title: {
			text: t,
	        x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: '16'
	        },
		},
		tooltip: {
	        trigger: 'axis',
	        axisPointer : {           
	            type : 'shadow'    
	        },
			formatter: function(params){
            	return params[0].name + ":" + params[0].value + "%";
            }
	    },
	    grid: {
	    	top: 60,
	    	bottom: 0,
	    	left: 0,
	    	rigth: 0,
	        containLabel: true
	    },
	    xAxis: [{
            type: 'category',
            axisLine:{
            	lineStyle: {
	                color: '#57617B'
	            }
        	},
        	axisLabel :{  
        	    interval:0,
        	    rotate:15,
        	    textStyle: {
	                color: '#83adba',
            	}
        	},
        	data: d2
        }],
	    yAxis: [{
            type: 'value',
            nameTextStyle:{
            	color: '#5EC9F4'
            },
            axisLabel: {
                formatter: '{value}%',
                textStyle: {
	                color: '#83adba',
            	},
            },
            axisLine:{
            	  lineStyle: {
 	            	 color: '#83adba'
 	            }
        	},
        	splitLine:{
        		lineStyle:{
        			opacity:0.2
        		}
        	}
        }],
	    series: {
            name:'总量',
            type:'bar',
            barWidth: 25,
            itemStyle: {
	        	normal: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                    offset: 0,
	                    color: '#2FA7E1'
	                }, {
	                    offset: 1,
	                    color: '#70E4F0'
	                }]),
	                opacity: 1
	            }
	        },
	        data: d1
        }
	}
	if(d1&&d1.length>0){
		chart.setOption(option);
	}else{
		$("#"+id).html("<div class='noData'>暂无数据</div>");
 	} 
}
function chartMap2(data,d2,year,name,xData){
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var chart = echarts.init(document.getElementById('eight-map2'));
	  var  option = {
			    "title": {
			        "text": year+"年工业增加值增长速度（%）"+'一'+name,
			        x: "0",
			        textStyle: {
			            color: '#fff',
			            fontSize: fz
			        },
			    },
			    "tooltip": {
			        "trigger": "axis",
			        "axisPointer": {
			            "type": "shadow",
			            textStyle: {
			                color: "#fff",
			                fontSize: fz1
			            }

			        },
			    },
			    "legend": {
			        x: '65%',
			        top: '11%',
			        textStyle: {
			            color: '#90979c',
			        },
			        "data": ['发斯蒂芬斯蒂芬']
			    },
			     
			    "grid": {
			        "borderWidth": 0,
			        "top": 50,
			        "bottom": 20,
			        textStyle: {
			            color: "#fff"
			        }
			    },

			    "calculable": true,
			    "xAxis": [{
			        "type": "category",
			        "axisLine": {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "splitLine": {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "axisTick": {
			            "show": false
			        },
			        "splitArea": {
			            "show": false
			        },
			        "axisLabel": {
			            "interval": 0,
			            textStyle: {
			                color: '#83adba'
		            	},
			        },
			        "data": xData,
			    }],
			    "yAxis": [{
			        "type": "value",
			        "axisLine": {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "splitLine": {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "axisTick": {
			            "show": false
			        },
			        "axisLabel": {
			            "interval": 0,
			            textStyle: {
			                color: '#83adba'
		            	},
			        },
			        "splitArea": {
			            "show": false
			        },

			    }],

			    "series": [{
		            "name": "增长率",
		            "type": "line",
		            "stack": "总量",
			        symbolSize: 10,
		            "itemStyle": {
		                "normal": {
		                    "color": '#03ddfe',
		                    "label": {
		                    	textStyle:{
		                        },
		                        "show": true,
		                        "position": "top",
		                        formatter: function(p) {
		                            return p.value > 0 ? (p.value) : '';
		                        }
		                    }
		                }
		            },
		             "data": data,
		        }]
			}
	chart.setOption(option);
}
function chartMap3(data1,data2,year,name,xData) {
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var d3 = [];
	for(i=0;i<data2.length;i++){
		if(data2[i]==999999||data2[i]==-999999||data2[i]==-999998||data2[i]==-999997){
			d3.push('');
		}else{
			d3.push(data2[i]);
		}
	}
	var chart = echarts.init(document.getElementById('eight-map3'));
	var option = {
	    "title": {
	        "text": year+ "年主营业务收入完成情况(亿元)"+'一'+name,
	        x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: fz
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff",
	                fontSize: fz1,
	            }

	        },
	    },
	    "grid": {
	        "borderWidth": 0,
	        "top": 60,
	        "bottom": 20,
	        textStyle: {
	            color: "#fff"
	        }
	    },
	    "legend": {
	        x: '76%',
	        top: '1%',
	        right: 10,
	        textStyle: {
	            color: 'rgba(220,240,245,.5)', 
	        },
	        icon:'roundRect',
	        "data": ['主营业务收入', '增长率']
	    },
	     

	    "calculable": true,
	    "xAxis": [{
	        "type": "category",
	        "axisLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        "splitLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        "axisTick": {
	            "show": false
	        },
	        "splitArea": {
	            "show": false
	        },
	        "axisLabel": {
	            "interval": 0,
	            textStyle: {
	                color: '#83adba'
            	},
	        },
	        "data": xData,
	    }],
	    "yAxis": [{
            type: 'value',
            nameTextStyle:{
            	color: '#5EC9F4'
            },
            axisLabel: {
                formatter: '{value} ',
                 textStyle: {
     	                color: '#83adba'
                 	},
            },
            axisLine:{
        		lineStyle:{
        			 color: '#83adba'
        		}
        	},
        	splitLine:{
        		lineStyle:{
        			opacity:0
        		}
        	}
        },
        {
            type: 'value',
            scale: true,
            axisLabel: {
                formatter: '{value} %',
                textStyle: {
	                color: '#83adba'
            	},
            },
            axisLine:{
        		lineStyle:{
        			 color: '#83adba'
        		}
        	},
        	splitLine:{
        		lineStyle:{
        			opacity:0.2
        		}
        	}
        }],
	    "series": [{
	            "name": "主营业务收入",
	            "type": "bar",
	            "stack": "总量",
	            "barMaxWidth": 15,
	            "barGap": "10%",
	            "color" : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: '#31a7e2' // 0% 处的颜色
	                    }, {
	                        offset: 1, color: '#64e7f2' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	               "itemStyle": {
	                "normal": {
	                    "label": {
	                        "show": true,
	                        "textStyle": {
	                            "color": "#fff"
	                        },
	                        "position": "insideTop",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": data1
	        },
	         {
	            "name": "增长率",
	            "type": "line",
	            yAxisIndex:1,
	            symbolSize:10,
	            "itemStyle": {
	                "normal": {
	                    "label": {
	                    	textStyle:{
	                    	},
	                        "show": true,
	                        "position": "right",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": d3,
	        },
	    ]
	}
	if(width<=1600){
		option.legend.x = '68%';
		option.legend.top = -2;
	}
	if(width<=1440){
		option.legend.x = '65%';
	}
	if(width<=1440){
		option.title.textStyle.fontSize = 12;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.top = -5;
		option.legend.textStyle.fontSize = 10;
	}
	chart.setOption(option);
}
function chartMap4(data1,data2,year,name,xData) {
	var d3 = [];
	for(i=0;i<data2.length;i++){
		if(data2[i]==999999||data2[i]==-999999||data2[i]==-999998||data2[i]==-999997){
			d3.push('');
		}else{
			d3.push(data2[i]);
		}
	}
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var chart = echarts.init(document.getElementById('eight-map4'));
	var option = {
	    "title": {
	        "text": year+"年利润总额(亿元)"+'一'+name,
	        x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: fz
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff",
	                fontSize: fz1
	            }

	        },
	    },
	    "grid": {
	        "borderWidth": 0,
	        "top": 60,
	        "bottom": 20,
	        textStyle: {
	            color: "#fff"
	        }
	    },
	    "legend": {
	        x: '76%',
	        top: '1%',
	        textStyle: {
	            color: '#90979c',
	        },
	        icon:'roundRect',
	        "data": ['利润总额', '增长率']
	    },
	     

	    "calculable": true,
	    "xAxis": [{
	        "type": "category",
	        "axisLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        "splitLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        axisLabel :{  
        	    interval:0,
        	    textStyle: {
	                color: '#83adba',
            	},
        	} ,
	        "axisTick": {
	            "show": false
	        },
	        "splitArea": {
	            "show": false
	        },
	        "data": xData,
	    }],
	    "yAxis": [
	    	  
	        {
	            type: 'value',
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value} ',
	                textStyle:{
	                	 
	                 }	
	            },
	            axisLine:{
	        		lineStyle:{
	        			 color: '#83adba'
	        		}
	        	},
	        	splitLine:{
	        		lineStyle:{
	        			opacity:0
	        		}
	        	}
	        },
	        {
	            type: 'value',
	            scale: true,
	            axisLabel: {
	                formatter: '{value} %',
	                 textStyle:{
	                	 
	                 }	
	            },
	            axisLine:{
	        		lineStyle:{
	        			 color: '#83adba'
	        		}
	        	},
	        	splitLine:{
	        		lineStyle:{
	        			opacity:0.2
	        		}
	        	}
	        }
	    
	    ],
	    "series": [{
	            "name": "利润总额",
	            "type": "bar",
	            "stack": "总量",
	            "barMaxWidth": 15,
	            "barGap": "10%",
	            "color" : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: '#ef920a' // 0% 处的颜色
	                    }, {
	                        offset: 1, color: '#f1c851' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	            "itemStyle": {
	                "normal": {
	                    "label": {
	                        "show": true,
	                        "textStyle": {
	                            "color": "#fff"
	                        },
	                        "position": "insideTop",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data":data1
	        },
	         {
	            "name": "增长率",
	            "type": "line",
	            "stack": "总量",
	            yAxisIndex:1,
	            symbolSize:10,
	            "itemStyle": {
	                "normal": {
	                    "color": "#e02323",
	                    "label": {
	                    	textStyle:{
	                        },
	                        "show": true,
	                        "position": "top",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": d3
	        },
	    ]
	}
	if(width<=1600){
		option.legend.x = '68%';
		option.legend.top = -2;
	}
	if(width<=1440){
		option.legend.x = '65%';
	}
	if(width<=1440){
		option.title.textStyle.fontSize = 12;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.top = -5;
		option.legend.textStyle.fontSize = 10;
	}
	chart.setOption(option);
}


</script>
</html>