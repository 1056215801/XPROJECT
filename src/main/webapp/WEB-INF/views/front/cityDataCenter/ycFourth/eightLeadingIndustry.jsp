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
<link href="${ctx}/static/plugins/jedate/skin/jedate.css" rel="stylesheet">
<link href="${ctx}/static/css/cityDataCenter/fourthSite.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/js/dataCenter/organizationCountConfig.js"></script>
<title>八大主导产业</title>
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
				<li class="first-li" val1="4" val2="index1_code4" val3="区县经济指标"> 
					<div class="product-type">区县经济指标</div>
				</li>
				<li class="first-li" val1="5" val2="index1_code5" val3="园区经济指标"> 
					<div class="product-type">园区经济指标</div>
				</li>
				<li class="first-li on" val1="7" val2="index1_code6" val3="八大产业"> 
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
					<input type="hidden" id="year" name="year" value="${searchInfo.year}">
					<input type="hidden" id="month" name="month" value="${searchInfo.month}">
					<input type="hidden" id="lastYear" name="lastYear">
					<input type="hidden" id="lastMonth" name="lastMonth">
					<input type="hidden" id="typeName" name="typeName">
				</form>
		    	<div class="nav">	
					<div class="nav-text">
						<div class="tab-eightIndustry" id="eightIndustry" style="margin:0;" onclick="changeDiv()">
							<span class="on">八大产业</span>
						</div>
					    <div class="tab-eightIndustry" id="tab-eightIndustry">
						   	<span name="title" data="zyywsr">效益分析</span>
						   	<span name="title" >创新分析</span>
					    </div>
						<div class="selects" id="forthTab00" style="display: inline-block;vertical-align: middle;">
							<div class="select select1">
								<p><input class="datainp form-control" style="background: transparent; color: #fff; width: 100px;text-align: center;" id="date1" type="text" value='' readonly /></p>
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
							<div class="part-content" style="position: relative; padding: 7px 20px;">
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
									<div class="count-list area-list eight-count-list" id="industryList" style="margin-top:0;"></div>
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
					           <span class="tabCaption eight-tabCaption">主要产业主营利润率对比</span>
					           <span class="noBorderLeft  legend changeLegend">
	         					 <font id="average1" class="average"></font>
		         		       </span>
				            </div>
		                 	<div class="part-content reusltContent" style="position: relative;">
				   			<div class="tab" style="overflow: hidden;">
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
					           <span class="on">主要产业指标结果分析</span>
					           <span class="noBorderLeft" id="resultAys"></span>
				            </div>
							<div class="part-content reusltContent">
				         		 <div class="eight-map">
				         			 <table class="ten-table">
			         					<tr>
			         						<td></td>
			         						<td>主营利润率最高</td>
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
					           <span class="on">主要产业利润对比亿元（亿元，%）</span>
					           <span class="noBorderLeft" onclick="alert('建设中!')">各产业税收对比</span>
					           <span class="noBorderLeft  legend changeLegend" id="changeChart1">
		         					<font class="chirld-legend on"><span></span>总量</font>
		         					<font class="chirld-legend"><span></span>同比</font>
			         		    </span>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="lrze" id="lrData">
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
					           <span class="on">主要产业主营业务对比（亿元，%）</span>
					            <span class="noBorderLeft  legend changeLegend" id="changeChart2">
		         					<font class="chirld-legend on"><span></span>总量</font>
		         					<font class="chirld-legend"><span></span>同比</font>
			         		    </span>
				            </div>
							<div class="part-content reusltContent" style="padding:10px">
				         		<div class="eight-map">
				         		    <div class="lrze" id="zyData">
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
<script type="text/javascript" src="${ctx}/static/plugins/jedate/jquery.jedate.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script type="text/javascript">
var orderby = "ZYYWSR_VALUE DESC";
var echartData;
var isLoading = false;
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
$(function(){
	$(".head>a:eq(1)").addClass("on");
	var index = "";
	$("#tab-eightIndustry>span").on("click",function(){
		var ind = $(this).index();
		index = $(this).attr("data");
		if(ind==1){
			alert('建设中！')
		}else{
			$('#div1').hide();
			$('#div2').show();
			$('#eightIndustry span').removeClass("on");
			$(this).addClass("on").siblings().removeClass("on");
			var indexs = ["zyywsr", "gyzjz", "lr", "ls"];
			var sort = 0;
			for(var i=0;i<indexs.length;i++){
				if(index==indexs[i]){
					sort = i;
				}
			}
			loadData();
		}

	})
    //左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v1 = $(this).attr("val1");
		var v2 = $(this).attr("val2");
		var v3 = $(this).attr("val3");
		if(v1!=''){
			checkRight(v1,'',v2,v3);
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
	$(".changeLegend font").on("click",function(){
		var ind = $(this).index();
		var pId = $(this).parent().attr("id");
		$(this).addClass("on").siblings().removeClass("on");
		if(pId == 'changeChart1') {
			if(ind == 0) {
				$('#lrData').show();
				loadBar(econData.lrData.lr,econData.lrData.lrLegend,'bar2');
			} else {
				$('#lrData').hide();
				loadBar2(econData.lrData.lrPerJa,econData.lrData.lrPerJaLegend,'bar2',econData.lrData.lrPerJaList);
			}
		} else {
			if(ind == 0) {
				$('#zyData').show();
				loadBar(econData.zyywsrData.zyywsr,econData.zyywsrData.zyywsrLegend,'bar3');
			} else {
				$('#zyData').hide();
				loadBar2(econData.zyywsrData.zyywsrPer,econData.zyywsrData.zyywsrPerLegend,'bar3',econData.zyywsrData.zyywsrPerList);
			}
		}
	})
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
					$('#date1').val(result.yearCaliber+'-'+result.monthCaliber);
					$("#date1").jeDate({
				        format: "YYYY-MM",
				        isToday: false,
					    choosefun: function(elem,datas){
					    	var year = datas.slice(0,4);
					    	var month = datas.slice(5,7);
					        $("#year").val(year);
							$("#month").val(month);
							getList(0);
							loadData();
					    },
						okfun: function(elem,datas){
					    	var year = datas.slice(0,4);
					    	var month = datas.slice(5,7);
					        $("#year").val(year);
							$("#month").val(month);
							getList(0);
							loadData();
					    }
				    });
					$('#resultAys').text('截至'+result.yearCaliber+'年'+result.monthCaliber+'月');
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
							    _div += '<div class="count-item on count-item-first" onclick="changeMap(this,\''+info.TYPE_NAME+'\')">'
						    }else{
							    _div += '<div class="count-item" onclick="changeMap(this,\''+info.TYPE_NAME+'\')">'
						    }
		 				_div += '<font style="width:135px;">'+index+'.'+info.TYPE_NAME+'</font>';
		 				_div += '<span style="width: calc(100% - 285px);">';
		 				if(orderby=='ZYYWSR_VALUE DESC'){
			    	    	if(info.ZYYWSR_VALUE && zyywsrValue != '0'){
			    	    		_div += '<div style="width: '+(((info.ZYYWSR_VALUE?info.ZYYWSR_VALUE:'0')/zyywsrValue)*100*0.9).toFixed(2)+'%;"></div>';
			    	    		var ZYYWSR_VALUE = info.ZYYWSR_VALUE/10000;
				 				_div += '</span><b style="width:120px;">'+(ZYYWSR_VALUE!=undefined?ZYYWSR_VALUE.toFixed(2):'0')+'<i>亿元</i></b></div>';
			    	    	}else{
			    	    		_div += '<div style="width: 0%;"></div>';
				 				_div += '</span><b style="width:90px;">未公布</b></div>';								 
			    	    	}
					    }else if(orderby=='GYZJZ_PERCENT DESC'){
					    	if(info.GYZJZ_PERCENT){
					    		_div += '<div style="width: '+(info.GYZJZ_PERCENT?info.GYZJZ_PERCENT:'0')+'%;"></div>';
				 				_div += '</span><b style="width:120px;">'+(info.GYZJZ_PERCENT?info.GYZJZ_PERCENT:'0')+'<i>%</i></b></div>';
					    	}else{
					    		_div += '<div style="width: 0%;"></div>';
				 				_div += '</span><b style="width:90px;">未公布</b></div>';
				 			}
					    }else{
					    	 if(info.LR_VALUE && lrValue != '0'){
					    		 _div += '<div style="width: '+(((info.LR_VALUE?info.LR_VALUE:'0')/lrValue)*100*0.9).toFixed(2)+'%;"></div>';
					    		 var LR_VALUE = info.LR_VALUE/10000;
					 			_div += '</span><b style="width:120px;">'+(LR_VALUE!=undefined?LR_VALUE.toFixed(2):'0')+'<i>亿元</i></b></div>';
					    	 }else{
					    		 _div += '<div style="width: 0%;"></div>';
					 			_div += '</span><b style="width:90px;">未公布</b></div>';
					 		}
					    }
		 				
						$('#industryList').append(_div);
					}
					$('#resultAys').text('截至'+$('#year').val()+'年'+$('#month').val()+'月');
				}else{
					alert($('#year').val()+'年'+$('#month').val()+'月'+"暂无数据");
					$('#date1').val($('#lastYear').val()+'-'+$('#lastMonth').val());
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
	$("#eightIndustry span").addClass("on");
	$("#tab-eightIndustry>span").removeClass("on");
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
			    if(data.lrData.lrAvg){
			    	$('#average1').text('全市主要产业平均主营利润率:'+data.lrData.lrAvg+'%');
			    }else{
			    	$('#average1').text('');
			    }
			    for(var i=0;i<data.lrRateData.lrRate.length;i++) {
			    	var index = i+1;
			    	var info = data.lrRateData.lrRate[i];
			    	var info2 = data.lrRateData.lrRateLegend[i];
					var w = i==0? '90' : ((info/data.lrRateData.lrRate[0])*90).toFixed(2);
			    	_div += '<div class="count-item">';
	 				_div += '<font>'+index+'.'+info2+'</font>';
	 				_div += '<span>';
	 				if(info){
	 					_div += '<div style="width: '+w+'%;"></div>';
		 				_div += '</span><b style="width:80px;">'+info+'<i>%</i></b></div>';
	 				}else{
	 					_div += '<div style="width: 0%;"></div>';
		 				_div += '</span><b style="width:80px;">未公布</b></div>';
	 				}
			    }
			    if(data.lrRateData.lrRate.length>0) {
					econData = data;
			    	$('#rateList').html(_div);
				    loadTable(data.analysisData);
				    $('#lrData h1').text(data.lrData.lrTotal);
				    $('#zyData h1').text(data.zyywsrData.zyywsrTotal);
					loadBar(data.lrData.lr,data.lrData.lrLegend,'bar2');
					loadBar(data.zyywsrData.zyywsr,data.zyywsrData.zyywsrLegend,'bar3');
					//loadBar2(econData.zyywsrData.zyywsrPer,econData.zyywsrData.zyywsrPerLegend,'bar3',econData.zyywsrData.zyywsrPerList);
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
	console.log(d,t)
	if(d){
		if(t == 4){
			if(Number(d) > 0) { return d + '<i style="height:18px;">亿元</i><img src="${ctx}/static/image/cityDataCenter/jxNew/big-red-up.png" />'}
			else if( d == '') { return '未公布'}
			else if( Number(d) < 0) { return d + '<i style="height:18px;">亿元</i><img src="${ctx}/static/image/cityDataCenter/jxNew/big-green-down.png" />'}
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
			else { return d + '<i style="height:18px;">亿元</i>';}
		}
	} else { return '未公布'}
}

function loadBar(d1,d2,id,t){
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	var d3 = [];
	var fz = 14;
	if(width<=1600){
		fz = 12;
	}
	if(width<=1366){
		fz = 10;
	}
	for(var i=0;i<d1.length;i++){
		var temp = { name: d2[i], value: d1[i]}
		d3.push(temp)
	}
	var option = {
		tooltip: {
			trigger: 'item',
			textStyle:{
				fontSize: fz,
			}
		},
	 /*    legend: {
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
	    }, */
	   	grid: {
	    	top: 60,
	    	bottom: 0,
	    	left: 0,
	    	rigth: 0,
	        containLabel: true
	    },
	     color:['#2B3EFF','#3350FF','#3D66FF','#4981FF','#4C88FF',
	           '#57A2FF','#66C3FF','#71DEFF'],
	    series: {
	        type: 'pie',
	        radius : ['55%', '70%'],
	        center: ['45%', '52%'],
	        label: {
	        	formatter: function(params){
	            	return params.name + "\n" + params.value + "亿元（" + '占比：'+(params.percent).toFixed(0)+"%）";
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
	if(d1&&d1.length>0){
		chart.setOption(option);
	}else{
		$("#"+id).html("<div class='noData'>暂无数据</div>");
	}
}
function loadBar2(d1,d2,id,d3){
	var fz = 14;
	if(width<=1600){
		fz = 12;
	}
	if(width<=1366){
		fz = 10;
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
			        symbolOffset: [0, -10],
			        z: 8,
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
			        z: 12,
			        itemStyle: {
			            normal: {
			            	color: '#0380DD'
			            }
			        },
			        data: d1
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
			        data: d1
			    }]
			};
	if(width<=1600){
		option.grid.top = 10;
		option.grid.bottom = 0;
		option.xAxis.axisLabel.rotate = 20;
		
	}
	
	chart.setOption(option);
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
</script>
</html>