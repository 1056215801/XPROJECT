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
<script type="text/javascript" src="${ctx}/static/js/dataCenter/organizationCountConfig.js"></script>
<title>区县经济指标</title>
</head>
<body class="gray-bg">
    <%@ include file="header.jsp"%>
    <div class="content">
        <div class="eight-main">
           <div class="pro-left">
	         	<ul class="production" style="position: relative;">
					<li class="first-li" val="1">
						<div class="product-type">主要经济指标</div>
					</li>
					<li class="first-li" val="14">
						<div class="product-type">工业用电</div>
					</li>
					<li class="first-li" val="4"> 
						<div class="product-type">区县经济指标</div>
					</li>
					<li class="first-li on" val="5"> 
						<div class="product-type">园区经济指标</div>
					</li>
					<li class="first-li" val="7"> 
						<div class="product-type">八大产业</div>
					</li>
					<li class="first-li" val="8"> 
						<div class="product-type">十大基地</div>
					</li>
				    <li class="first-li" val="26"> 
						<div class="product-type">规上企业</div>
					</li>
					<li class="first-li" val=""> 
						<div class="product-type">企业融资</div>
					</li>
					<li class="first-li" val="27"> 
						<div class="product-type">重点税源企业纳税</div>
					</li>
					<li class="first-li" val="23"> 
						<div class="product-type">产品价格趋势</div>
					</li>
				</ul>
	         </div>
	         <div class="pro-right">
				 <div class="nav-title">
				    	<form action="" method="post" id="form">
							<input type="hidden" id="orgId" name="orgId" value="${orgId}">
							<input type="hidden" id="year" name="year" value="${searchInfo.year}">
							<input type="hidden" id="month" name="month" value="${searchInfo.month}">
							<input type="hidden" id="lastYear" name="lastYear">
							<input type="hidden" id="lastMonth" name="lastMonth">
							<input type="hidden" id="typeName" name="typeName">
						</form>
				    	<div class="nav">	
							<div class="nav-text">
								<div class="eightIndustry on" onclick="changeDiv()">
									<font>园区指标</font>
								</div>
							    <div class="tab-eightIndustry">
								   	<span name="title" data="zyywsr">园区指标效益对比</span>
								   	<span name="title" >园区创新对比</span>
							    </div>
								<div class="selects" id="forthTab00" style="display: inline-block;">
									<div class="select select1">
										<p><font id="font1">2018</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="ul1">
											</ul>
										</div>
									</div>
									<div class="select select2">
										<p><font id="font2">1月</font><i class="fa fa-caret-down"></i></p>
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
				 	 <div class="floor">
			            <div class="part">
			                 <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="part-content" style="position: relative; padding: 10px 20p;">
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
										<div class="industry-list" id="industryList"></div>
									 </div>
				         	    </div>
			                 </div>
				         </div>
				         <div class="part">
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
			     	<div class="floor">
			     		<div class="part">
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
			         	<div class="part">
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
				 	<div class="floor">
			            <div class="part">
			                 <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
			                 	<div class="part-content" style="position: relative;">
					   			<div class="tab" style="overflow: hidden;height: 100%">
									<div class="orders" style="display: inline-block;">
										<b>各产业利润率对比排行：</b>
									</div>
									<div class="industry-list" id="rateList"></div>
									</div>
				         		</div>
				         	 </div>
				         </div>
				         <div class="part">
				             <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="part-content">
					         		 <div class="eight-map">
					         			 <table class="ten-table">
				         					<tr>
				         						<td></td>
				         						<td>利润率最高</td>
				         						<td>销售收入最高</td>
				         						<td>利润最高</td>
				         						<td>工业增加值同比最高</td>
				         					</tr>
				         					<tr>
				         						<td>产业名称</td>
				         						<td id="lrl1">电子信息产业</td>
				         						<td id="sr1">电子信息产业</td>
				         						<td id="lr1">电子信息产业</td>
				         						<td id="zjz1">电子信息产业</td>
				         					</tr>
				         					<tr>
				         						<td>当前数据</td>
				         						<td id="lrl2">18.3%</td>
				         						<td id="sr2">125 <i>亿元</i></td>
				         						<td id="lr2">25 <i>亿元</i></td>
				         						<td id="zjz2">7.3%</td>
				         					</tr>
				         					<tr>
				         						<td>上年同期</td>
				         						<td id="lrl3">18.3%</td>
				         						<td id="sr3">125 <i>亿元</i></td>
				         						<td id="lr3">25 <i>亿元</i></td>
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
     	           <div class="floor">
			     		<div class="part">
			     		     <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="part-content">
				         			<div class="eight-map">
				         				<div  class="mapContent" id="bar2"></div>
				         				<div class="changeChart" id="changeChart1">
				         					<span class="on">总量对比</span>
				         					<span>同比对比</span>
				         				</div>
				         			</div>
			         		   </div>
			     		     </div>
			         	</div>
			         	<div class="part">
			         	      <div class="outsideBox">
			                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="part-content">
					         		<div class="eight-map">
				         				<div  class="mapContent" id="bar3"></div>
				         				<div class="changeChart" id="changeChart2">
				         					<span class="on">总量对比</span>
				         					<span>同比对比</span>
				         				</div>
				         			</div>
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
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script type="text/javascript">
var orderby = "ZYYWSR_VALUE DESC";
var echartData;
var isLoading = false;
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
$(function(){
	$(".head>a:eq(1)").addClass("on");
	var index = "";
	$(".tab-eightIndustry>span").on("click",function(){
		var ind = $(this).index();
		index = $(this).attr("data");
		if(ind==1){
			alert('建设中！')
		}else{
			$('#div1').hide();
			$('#div2').show();
			$('.eightIndustry').removeClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			var indexs = ["zyywsr", "gyzjz", "lr", "ls"];
			var sort = 0;
			for(var i=0;i<indexs.length;i++){
				if(index==indexs[i]){
					sort = i;
				}
			}
			if(!isLoading){
				loadData();
			}
		}
	})
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v = $(this).attr("val");
		if(v!=''){
			window.location.href = "${ctx}/front/cityDataCenter/ycFourth/"+v+"?orgId=3609009";
		} else { alert("建设中!")}
	});
	$(".select p").on("click",function(){
		$(this).next().slideToggle();
	})
	$(".orders>span").on("click",function(){
		var ind = $(this).index()-1;
		$(this).addClass("on").siblings().removeClass("on");
		if(ind==0){
			orderby = "ZYYWSR_VALUE DESC";
			getList(0,0);
		}else if(ind==1){
			orderby = "GYZJZ_PERCENT DESC";
			 getList(0,0);
		}else if(ind==2){
			orderby = "LR_VALUE DESC"
			getList(0,0);
		}else{
			alert('建设中!')
		}
	})
	$(".changeChart span").on("click",function(){
		var ind = $(this).index();
		var pId = $(this).parent().attr("id");
		$(this).addClass("on").siblings().removeClass("on");
		if(pId == 'changeChart1') {
			if(ind == 0) {
				loadBar(econData.lrData.lr,econData.lrData.lrLegend,'bar2','各产业利润对比（亿元）');
			} else {
				loadBar2(econData.lrData.lrPerJa,econData.lrData.lrPerJaLegend,'bar2','各产业利润对比');
			}
		} else {
			if(ind == 0) {
				loadBar(econData.zyywsrData.zyywsr,econData.zyywsrData.zyywsrLegend,'bar3','各产业主营业务对比（亿元）');
			} else {
				loadBar2(econData.zyywsrData.zyywsrPer,econData.zyywsrData.zyywsrPerLegend,'bar3','各产业主营业务对比');
			}
		}
	})
	getselectYear();
	var index = '${spanIndex}';
	if(index==0){
		orderby = "ZYYWSR_VALUE DESC";
	}else if(index==1){
		orderby = "GYZJZ_PERCENT DESC";
	}else if(ind==2){
		orderby = "LR_VALUE DESC";
	}else{
		orderby = "ZYYWSR_VALUE DESC";
	}
	$('.orders span:eq('+index+')').addClass("on").siblings().removeClass("on");
	getList(1,0);
});
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    for(var i=y; i>2014;i--){
    	$('#forthTab00 .select1 ul').append('<li>'+i+'</li>');
    	$('#forthTab001 .select1 ul').append('<li>'+i+'</li>');
    }
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		$(".changeChart span:eq(0)").addClass("on").siblings().removeClass("on");
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
	$.ajax({
 		url : "${OfficeUrl}XOffice/interface/json/pkInTpInOpMnAcLog/dataCenterList",
		type : "post",
		data : {
			"areaId": $('#orgId').val()=='3609009'?'360900':"360900",
			"yearCaliber": $('#year').val(),
			"monthCaliber": $('#month').val(),
			"orderby": orderby,
			"isNewData": type==1?1:0,
 		},
		dataType : "json",
		success : function(result) {
			if(result.success){
				if(type==1){
					$('#year').val(result.yearCaliber);
					$('#month').val(result.monthCaliber);
					$('#font1').text(result.yearCaliber);
					$('#font2').text(result.monthCaliber+'月');
				}
				var list = result.value;
				if(list.length>0){
					$('#industryList').empty();
					$('#lastYear').val($('#year').val());
					$('#lastMonth').val($('#month').val());
					for (var i=0;i<list.length;i++){
						var info = list[i];
						var zyywsrValue = list[0].ZYYWSR_VALUE;
						var lrValue = list[0].LR_VALUE
						var index = i+1;
					    var _div = "";
					    if(i==0){
					    	$('#typeName').val(info.TYPE_NAME);
							 getMap();
						    _div += '<div class="industry-item on" onclick="changeMap(this,\''+info.TYPE_NAME+'\')">'
					    }else{
						    _div += '<div class="industry-item" onclick="changeMap(this,\''+info.TYPE_NAME+'\')">'
					    }
					    _div += '<span>'+index+'</span>'
					    _div +=	'<font class="typeName">'+info.TYPE_NAME+'</font>'
					    //_div +=	'<img class="lineImg" src="${ctx}/static/image/cityDataCenter/ycNew/icons_16.png">'
						    if(orderby=='ZYYWSR_VALUE DESC'){
				    	    	if(info.ZYYWSR_VALUE && zyywsrValue != '0'){
							    	_div += '<font class="percentBox"><div style="width: '+(((info.ZYYWSR_VALUE?info.ZYYWSR_VALUE:'0')/zyywsrValue)*100*0.9).toFixed(2)+'%;"></div></font>'
				    	    		var ZYYWSR_VALUE = info.ZYYWSR_VALUE/10000;
								    _div +=	'<font class="yellowT"><b>'+(ZYYWSR_VALUE!=undefined?ZYYWSR_VALUE.toFixed(2):'0')+'</b>亿元</font>'
				    	    	}else{
									 _div +='<font class="yellowT"><b>未公布</b></font>'
				    	    	}
						    }else if(orderby=='GYZJZ_PERCENT DESC'){
						    	if(info.GYZJZ_PERCENT){
						    		_div += '<font class="percentBox"><div style="width: '+(info.GYZJZ_PERCENT?info.GYZJZ_PERCENT:'0')+'%;"></div></font>'
								    _div +=	'<font class="yellowT"><b>'+(info.GYZJZ_PERCENT?info.GYZJZ_PERCENT:'0')+'</b>%</font>'
						    	}else{
								    _div +=	'<font class="yellowT"><b>未公布</b></font>'
						    	}
						    }else{
						    	 if(info.LR_VALUE && lrValue != '0'){
						    		 _div += '<font class="percentBox"><div style="width: '+(((info.LR_VALUE?info.LR_VALUE:'0')/lrValue)*100*0.9).toFixed(2)+'%;"></div></font>'
						    		 var LR_VALUE = info.LR_VALUE/10000;
									  _div +='<font class="yellowT"><b>'+(LR_VALUE!=undefined?LR_VALUE.toFixed(2):'0')+'</b>亿元</font>'
						    	 }else{
						    		 _div +='<font class="yellowT"><b>未公布</b></font>' 
						    	 }
						    }
					    _div += '</div>'
						$('#industryList').append(_div);
					}

				}else{
					alert($('#font1').text()+'年'+$('#font2').text()+"未公布数据");
					$('#font1').text($('#lastYear').val());
					$('#font2').text($('#lastMonth').val()+'月');
					$('#year').val($('#lastYear').val());
					$('#month').val($('#lastMonth').val());
					
				}
			}else{
				tips("数据获取异常");
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function getMap(){
    $.ajax({
		url : "${OfficeUrl}XOffice/interface/json/pkInTpInOpMnAcLog/listForEchart",
		type : "post",
		data : {
			"areaId": $('#orgId').val()=='3609009'?'360900':"360900",
			"yearCaliber": $('#year').val(),
			"typeName": $('#typeName').val()
 		},
		dataType : "json",
		success : function(result) {
			if(result.success){
				echarData = result.echarData;
				chart2(echarData[3],echarData[6],$('#year').val(),$('#typeName').val());//工业增加百分比
				chart3 (echarData[0],echarData[1],$('#year').val(),$('#typeName').val());//主营业务收入和增长率
				chart4 (echarData[4],echarData[5],$('#year').val(),$('#typeName').val());//利润总额和增长率
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function changeMap(e,name){
	$('#typeName').val(name);
	$(e).addClass("on").siblings().removeClass("on");
	getMap()
}
function changeDiv(){
	$('#div1').show();
	$('#div2').hide();
	$(".eightIndustry").addClass("on");
	$(".tab-eightIndustry>span").removeClass("on");
}
var econData = "";
function loadData() {
	var year = $("#year").val();
	var month = $("#month").val();
	var param = {
			"areaId" : '360900',
			"yearCaliber" :  year,
			"monthCaliber" : month	
	}
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/pkInTpInOpMnAcLog/industriesComparativeAnalysis",
		type : "post",
		data : param,
		success : function(result) {
			console.log(result)
			if (result.success) {
				isLoading = true;
				var data = result.echarData;
			    var _div = "";
			    for(var i=0;i<data.lrRateData.lrRate.length;i++) {
			    	var index = i+1;
			    	var info = data.lrRateData.lrRate[i];
			    	var info2 = data.lrRateData.lrRateLegend[i];
			    	_div += '<div class="industry-item">'
				    _div += '<span>'+index+'</span>'
				    _div +=	'<font class="typeName">'+info2+'</font>'
			    	if(info){
			    		_div += '<font class="percentBox"><div style="width: '+info+'%;"></div></font>'
					    _div +=	'<font class="yellowT"><b>'+info+'</b>%</font>'
			    	}else{
					    _div +=	'<font class="yellowT"><b>未公布</b></font>'
			    	}
				    _div += '</div>'
			    }
			    if(data.lrRateData.lrRate.length>0) {
					econData = data;
			    	$('#rateList').html(_div);
				    loadTable(data.analysisData);
					loadBar(data.lrData.lr,data.lrData.lrLegend,'bar2','各产业利润对比（亿元）');
					loadBar(data.zyywsrData.zyywsr,data.zyywsrData.zyywsrLegend,'bar3','各产业主营业务对比（亿元）');
			    }
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}

function loadTable(d){
	$("#lrl1").html(d.lr_rate_an.typeName);
	$("#lrl2").html(tongBi(d.lr_rate_an.newYear,2));
	$("#lrl3").html(tongBi(d.lr_rate_an.lastYear,2));
	$("#lrl4").html(tongBi(d.lr_rate_an.DValue,3));
	
	$("#lr1").html(d.lr_value_an.typeName);
	$("#lr2").html(tongBi(d.lr_value_an.newYear,1));
	$("#lr3").html(tongBi(d.lr_value_an.lastYear,1));
	$("#lr4").html(tongBi(d.lr_value_an.DValue,4));
	
	$("#sr1").html(d.zyywsr_value_an.typeName);
	$("#sr2").html(tongBi(d.zyywsr_value_an.newYear,1));
	$("#sr3").html(tongBi(d.zyywsr_value_an.lastYear,1));
	$("#sr4").html(tongBi(d.zyywsr_value_an.DValue,4));
	
	$("#zjz1").html(d.gyzjz_percent_an.typeName);
	$("#zjz2").html(tongBi(d.gyzjz_percent_an.newYear,2));
	$("#zjz3").html(tongBi(d.gyzjz_percent_an.lastYear,2));
	$("#zjz4").html(tongBi(d.gyzjz_percent_an.DValue,3));
}
function tongBi(d,t){           //根据不同类型返回不同数据，1是亿元，2是%，3是带箭头%
	if(d){
		if(t == 4){
			if(Number(d) > 0) { return d + '<i>亿元</i><img src="${ctx}/static/image/cityDataCenter/jxNew/big-red-up.png" />'}
			else if( d == '') { return '未公布'}
			else if( Number(d) < 0) { return d + '<i>亿元</i><img src="${ctx}/static/image/cityDataCenter/jxNew/big-green-down.png" />'}
			else { return d}
		} else if(t == 3){
			if(Number(d) > 0) { return d + '%<img src="${ctx}/static/image/cityDataCenter/jxNew/big-red-up.png" />'}
			else if( d == '') { return '未公布'}
			else if( Number(d) < 0) { return d + '%<img src="${ctx}/static/image/cityDataCenter/jxNew/big-green-down.png" />'}
			else { return d}
		} else if(t == 2){
			if(d == '') { return '未公布';}
			else { return d + '%';}
		} else {
			if(d == '') { return '未公布';}
			else { return d + '<i>亿元</i>';}
		}
	} else { return '未公布'}
}

function loadBar(d1,d2,id,t){
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	var d3 = [];
	for(var i=0;i<d1.length;i++){
		var temp = { name: d2[i], value: d1[i]}
		d3.push(temp)
	}
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
			trigger: 'item'
		},
	    legend: {
	    	show: true,
			data: d2,
	        top: 'center',
	        right: '0',
	        orient: 'vertical',
	        padding:[10,10],
	        itemWidth:20,
	        itemHeight:10,
	        itemGap:6,
	        textStyle: {
	            fontSize: 14,
	            color: '#fff'
	        }
	    },
	   	grid: {
	    	top: 60,
	    	bottom: 0,
	    	left: 0,
	    	rigth: 0,
	        containLabel: true
	    },
	    color:['#FF43CC','#FFA360','#0060B1','#E60012','#FFFF60',
	           '#8957A1','#2199FF','#FF4571','#4EC971','#16ffaf',
	           '#f06500','#ffbb18','#009812','#b40040','#49d000',
	           '#ff2333'],
	    series: {
	        type: 'pie',
	        radius : ['55%', '70%'],
	        center: ['45%', '52%'],
	        label: {
	        	formatter: function(params){
	            	return params.name + "\n" + params.value + "亿元（" + (params.percent).toFixed(0)+"%）";
	            },
	            fontSize: 14,
	            color: '#fff'
	        },
	        labelLine: {
	        	length: 10,
	        	length2: 10,
			},
			data: d3
	    }
	};
	if(d1&&d1.length>0){
		chart.setOption(option);
	}else{
		$("#"+id).html("<div class='noData'>暂无数据</div>");
	}
}

function loadBar2(d1,d2,id,t) {
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
</script>
</html>