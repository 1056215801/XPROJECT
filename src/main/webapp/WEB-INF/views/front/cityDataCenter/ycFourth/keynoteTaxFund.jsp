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
<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<title>宜春工业大数据重点税源企业纳税</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content fz0">
		<input type="hidden" id="selectType" name="selectType" value="0">
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
				<li class="first-li on" val1="27" val2="index1_code9" val3="规上企业纳税"> 
					<div class="product-type">规上企业纳税</div>
				</li>
				<li class="first-li" val1="23" val2="index1_code10" val3="产品价格趋势"> 
					<div class="product-type">产品价格趋势</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
         	<div style="height:100%;padding-top:10px;">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 55%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar" style="cursor: pointer;">
					           	<span class="tabCaption">每月税收趋势</span>
								<div class="fr selects">
									<div class="select">
										<p><font id="year1">2019</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="yearUl1">
											</ul>
										</div>
									</div>
								</div>
								 <span class="noBorderLeft  legend changeLegend" id="changeChart0"  style="margin-right: 10px;">
		         					<font class="chirld-legend on"><span></span>累计</font>
		         					<font class="chirld-legend"><span></span>本月</font>
			         		    </span>
				            </div>
		                 	<div class="part-content reusltContent">
				         		<div class="eight-map">
			         				<div class="mapContent" id="chart1"></div>
			         			</div>
			         		</div>
			         	 </div>
			         </div>
					<div class="spanStyle" style="width: calc(45% - 10px);">
			             <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar tab-links" style="cursor: pointer;">
					           <span class="on">历年税收趋势</span>
				            </div>
							<div class="part-content reusltContent">
				         		<div class="eight-map">
			         				<div class="mapContent" id="chart2"></div>
			         			</div>
			         	     </div>
			              </div>
			         </div>
				</div>
				<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="spanStyle" style="width: 55%;">
		     		     <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					            <span class="on">行业纳税排行榜</span>
								<div class="fr selects">
									<div class="select">
										<p><font id="year2"></font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="yearUl2">
											</ul>
										</div>
									</div>
								</div>
								 <span class="noBorderLeft  legend changeLegend" id="changeChart1"  style="margin-right: 10px;">
		         					<font class="chirld-legend on"><span></span>总量</font>
		         					<font class="chirld-legend"><span></span>同比</font>
			         		    </span>
				            </div>
							<div class="part-content reusltContent">
				         		<div class="eight-map" style="overflow:hidden;">
			         				<div class="count-list area-list" id="rateList" style="height:100%;margin-top:0;"></div>
			         				<div class="count-list area-list eightIndustry-list" id="pecentList" style="height:100%;margin-top:0;display:none;"></div>
			         			</div>
		         		   </div>
		     		     </div>
		         	</div>
		         	<div class="spanStyle" style="width: calc(45% - 10px);">
		         	      <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar tab-links" id="rateSpan">
					            <span class="on">纳税企业对比</span>
								<div class="fr selects">
									<div class="select">
										<p><font id="year3"></font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="yearUl3">
											</ul>
										</div>
									</div>
								</div>
				            </div>
							<div class="part-content reusltContent">
				         		<div class="eight-map">
			         				<div class="mapContent" id="chart3"></div>
			         				<div id="noData" style="display: none;">暂无数据</div>
			         			</div>
			         	   </div>
		         	     </div>
		         	</div>
				</div>
         	</div>
		</div>
	</div>
<script type="text/javascript" src="${ctx}/static/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/highcharts.js"></script>
<script src="${ctx}/static/js/dataCenter/highcharts-3d.js"></script>
<script type="text/javascript">
var isLoading = false;
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
$(function(){
	$(".head>a:eq(1)").addClass("on");
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
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v1 = $(this).attr("val1");
		var v2 = $(this).attr("val2");
		var v3 = $(this).attr("val3");
		if(v1!=''){
			checkRight(v1,'',v2,v3);
		} else { alert("建设中!")}
	});
	getselectYear();
	getIceBerg(1);
	getList(1);
	getList(2);
	getList(3);
	getList(4);
	$(".changeLegend font").on("click",function(){
		var ind = $(this).index();
		var pId = $(this).parent().attr("id");
		$(this).addClass("on").siblings().removeClass("on");
		if(pId == 'changeChart0'){
			$('#selectType').val(ind);
			getIceBerg();
		}else{
			if(ind==0){
				$('#rateList').show();
				$('#pecentList').hide();
			}else{
				$('#rateList').hide();
				$('#pecentList').show();
			}
		}
	})
});
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    for(var i=y; i>2014;i--){
    	$('#yearUl1').append('<li>'+i+'</li>');
    	$('#yearUl2').append('<li>'+i+'</li>');
    	/* $('#yearUl3').append('<li>'+i+'</li>'); */
    }
    for(var i=2018; i>2014;i--){
    	$('#yearUl3').append('<li>'+i+'</li>');
    }
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		$(".changeChart span:eq(0)").addClass("on").siblings().removeClass("on");
		if($(this).parent().attr('id')=='yearUl1'){
 			$('#year1').text($(this).text());
 			getIceBerg();
		}else if($(this).parents().attr('id')=='yearUl2'){
			$('#year2').text($(this).text());
			getList(2);
			getList(4);
		}else if($(this).parents().attr('id')=='yearUl3'){
 			$('#year3').text($(this).text());
 			getList(3);
		}
	})
}
//冰山图
function getIceBerg(t){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/compTaxStatistics",
		type : "post",
	 	async: false,
		data : {
			year: $('#year1').text(),
			type: $('#selectType').val()
		},
		dataType : "json",
		success : function(result){
			var iceData = result.value; 
			if(result.success){
				if(t == 1) { 
					$('#year1').text(result.year);
					$('#year2').text(result.year);
					$('#year3').text(result.year);
				}
				iceberg(iceData,2);
			}
		},
		error : function() {
			//alert("校验权限异常");
		}
	})
} 
//其他3个列表
function getList(type){
	var year = "2019";
	if(type == 3 && $('#year'+type).text() == 2019){
		year = "2018";
		$('#year3').text('2018');
	}else if(type==4){
		year = $('#year2').text();
	}else{
		year = $('#year'+type).text();
	}
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/dataProductPrice/queryStatus",
		type : "post",
	 	async: false,
		data : {
			year: year,
			status: type
		},
		dataType : "json",
		success : function(result){
			if(result.success){
				if(type == 1) {
					var d1 = [];
					for(var i = 0; i < result.xAxis.length; i++){
						var temp = {
							name: result.xAxis[i],
							value: result.series[i],
							comp: result.totalArr[i]
						}
						d1.push(temp)
					}
					mount(result.xAxis,d1)
				} else if(type == 2){
					console.log(result);
					isLoading = true;
					var data = result.list;
				    var _div = "";
				    if(data.length>0){
				        for(var i=0;i<data.length;i++) {
					    	var index = i+1;
					    	var info = data[i];
					    	var w = i==0? '90' : ((info.LS_VALUE/data[0].LS_VALUE)*90).toFixed(2);
					    	_div += '<div class="count-item number-item">';
			 				_div += '<font class="nwp">'+index+'.'+info.TYPE_NAME+'</font>';
			 				_div += '<span>';
			 				if(info.LS_VALUE){
			 					_div += '<div style="width: '+w+'%;"></div>';
				 				_div += '</span><b>'+info.LS_VALUE+'</b><i>亿元</i></div>';
			 				}else{
			 					_div += '<div style="width: 0%;"></div>';
				 				_div += '</span><b>未公布</b></div>';
			 				}
					    }
				    	$('#rateList').html(_div);
				    }else{
				    	$('#rateList').html("<div class='noData'>暂无数据</div>");
				    }
				} else if(type==3) {
					var d2 = [];
					var isE = true;
					for(var i=0;i<result.data.length;i++){
						var temp2 = {
							name: result.data[i].name,
							y: result.data[i].value,
							sliced:'true',
							selected:'true'
						}
						d2.push(temp2);
						if(result.data[i].value > 0) { isE = false;}
					}
					if(isE){
						$('#noData').show().siblings().hide();
					} else { 
						$('#noData').hide().siblings().show();
						chart3d(d2)
					}
				}else{
					var data = result.list;
				    var _div = "";
				    if(data.length>0){
				        for(var i=0;i<data.length;i++) {
					    	var index = i+1;
					    	var info = data[i];
					    	var w = i==0? '90' : ((info.LS_PERCENT/data[0].LS_PERCENT)*90).toFixed(2);
					    	_div += '<div class="count-item number-item">';
			 				_div += '<font class="nwp">'+index+'.'+info.TYPE_NAME+'</font>';
			 				_div += '<span>';
			 				if(info.LS_PERCENT&&info.LS_PERCENT!=""){
			 					_div += '<div style="width: '+w+'%;"></div>';
				 				_div += '</span><b>'+info.LS_PERCENT+'</b><i>%</i></div>';
			 				}else{
			 					_div += '<div style="width: 0%;"></div>';
				 				_div += '</span><b>未公布</b></div>';
			 				}
					    }
				    	$('#pecentList').html(_div);
				    }else{
				    	$('#pecentList').html("<div class='noData'>暂无数据</div>");
				    }
				}
			}
		},
		error : function() {
			//alert("校验权限异常");
		}
	})
}
//冰山图
function iceberg(d,select){
	$("#chart1").removeAttr("_echarts_instance_");
	var myChart = echarts.init(document.getElementById('chart1'));
	var xData = [];
	for (var i =1; i < 13; i++) {
	   xData.push(i + "月");
	}
	xData.unshift('');
	xData.push('');
	var d1 = d.valueList.unshift('');
	var d2 = d.percentList.unshift('');
	var d3 = [];
	d3.push('');
	for (var j = 0; j < d.numList.length; j++) {
		if(d.numList[j]==null){
			d3.push('');
		}else{
			d3.push(d.numList[j]);
		}
	}
	d3.push('');
	var legendSelect = function() {
		var lSelect;
		select==0 || select==2?lSelect = true:lSelect = false;
		return lSelect
	}();
	var legendSelect1 = function() {
		var lSelect;
		select==1 || select==2?lSelect = true:lSelect = false;
		return lSelect
	}();
  var option = {
  	grid: {
        left:'1%',
        right:'1%',
        top: 15,
        bottom: 0,
        containLabel:true
	},
	legend: {
	  	   show: false,
		   type: 'plain',
	  	   data: ['总量', '同比'],
	  	   selected: {
	  		   '总量': legendSelect,
	  		   '同比': legendSelect1,
	  	   }
	  	},
	tooltip: {
		show: true,
		trigger: 'axis',
		formatter: function(params){
			var par1 = ''; 
        	var par2 = ''; 
        	var unit = '',
        	unit1='';
        	var index;
        	if(params[0]){
        		console.log(params)
        		if(params[0].value != undefined && params[0].value!=''){
        			params[0].seriesName=='同比'?unit = '%':unit = '亿元';
        			par1 = params[0].marker + params[0].axisValue + '<br>' + params[0].seriesName + ':' + params[0].value + unit;
        		}
        		index = params[0].dataIndex;
        	}
        	if(params[1]){
        		if(params[1].value != undefined && params[1].value!=''){
        			params[1].seriesName=='总量'?unit1 = '亿元':unit1 = '%';
        			par2 = '<br>' + params[1].seriesName + ':' + params[1].value + unit1; 
        		}
        		index = params[1].dataIndex;
        	}
        	console.log(index)
        	if(par1 == ''){
        		par1 = params[0].marker + params[0].axisValue
        	}
        	var  s = "";
        	if(d3[index]==undefined||d3[index]==''||d3[index]==null){
        		s = "";
        	}else{
        		s = '<br>'+'企业总量:'+d3[index];
        	}
        	return par1 + par2+s;
		}
	},
  	xAxis: [{
          type: 'category',
          show: false,
          data: xData,
          boundaryGap: false,
          axisLine: {
          	lineStyle: {
              	color: 'rgba(255,255,255,0.2)',
              }
          },
      },
      {
          type: 'category',
          position: "bottom",
          data: xData,
          boundaryGap: false,
          splitLine: {
          	show: true,
              lineStyle: {
                  color: "rgba(255,255,255,0.2)"
              }
          },
          axisTick: {
        	  show: false,
          },
          axisLine: {
          	lineStyle: {
              	color: 'rgba(255,255,255,0.2)',
              }
          },
          axisLabel: {
             color: '#00DEFF',
          }
      }],
      yAxis: [{
          show: true,
          splitLine: {
              lineStyle: {
                  color: "rgba(255,255,255,0.2)"
              }
          },
          axisTick: {
              show: false
          },
          axisLine: {
              show: true,
              lineStyle: {
                  color: "rgba(255,255,255,0.2)"
              }
          },
          axisLabel: {
              show: true,
              color: '#00DEFF'
          }
      }, {
          type: "value",
          axisLabel: {
          	show: true,
          	formatter: '{value} %',
	        color: "#00DEFF"
          },
          axisLine:{
          	show: false,
      	},
      	splitLine: {
      		show: false,
          },
      }],
      series: [{
          type: 'pictorialBar',
          name: '总量',
          xAxisIndex: 1,
          barWidth : '200%',
          barCategoryGap: '-40%',
          symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
          itemStyle: {
          	color: {
                  type: 'linear',
                  x: 0,
                  y: 0,
                  x2: 0,
                  y2: 1,
                  colorStops: [{
                      offset: 0, color: 'rgba(255,226,65,1)' 
                  }, {
                      offset: 1, color: 'rgba(255,168,65,0.1)'
                  }],
                  global: false 
              },
              opacity:0.6,
          },
          data: d.valueList,
      },
      {
      	type: "line",
      	symbol: 'circle',
      	symbolSize: 8,
        name: "同比",
        yAxisIndex: 1,
        data: d.percentList,
        itemStyle: {
          	borderWidth: 2,
            color: '#00FFFF'
        }
      }]
  };
  myChart.setOption(option);
}
/* function ice(d) {
	$("#chart1").removeAttr("_echarts_instance_");
	var myChart = echarts.init(document.getElementById('chart1'));
	var xData = [];
	for (var i = 1; i < 13; i++) {
	   xData.push(i + "月");
	}
	xData.unshift('');
	xData.push('');
	var d1 = d.valueList.unshift('');
	var d2 = d.percentList.unshift('');
	var option = {
	  	grid: {
	        left:'1%',
	        right:'1%',
	        top: 15,
	        bottom: 0,
	        containLabel:true
		},
		tooltip: {
			show: true,
			trigger: 'axis',
			formatter: function(params){
				var par1 = ''; 
	        	var par2 = ''; 
	        	var unit = '',
	        	unit1='';
	        	var index;
	        	if(params[0]){
	        		console.log(params)
	        		if(params[0].value != undefined && params[0].value!=''){
	        			params[0].seriesName=='同比'?unit = '%':unit = '亿元';
	        			par1 = params[0].marker + params[0].axisValue + '<br>' + params[0].seriesName + ':' + params[0].value + unit;
	        		}
	        		index = params[0].dataIndex;
	        	}
	        	if(params[1]){
	        		if(params[1].value != undefined && params[1].value!=''){
	        			params[1].seriesName=='总量'?unit1 = '亿元':unit1 = '%';
	        			par2 = '<br>' + params[1].seriesName + ':' + params[1].value + unit1; 
	        		}
	        		index = params[1].dataIndex;
	        	}
	        	console.log(index)
	        	if(par1 == ''){
	        		par1 = params[0].marker + params[0].axisValue
	        	}
	        	var  s = "";
	        	if(d3[index]==undefined||d3[index]==''||d3[index]==null){
	        		s = "";
	        	}else{
	        		s = '<br>'+'企业总量:'+d3[index];
	        	}
	        	return par1 + par2+s;
			}
		},
	  	xAxis: [
	      {
	          type: 'category',
	          position: "bottom",
	          data: xData,
	          boundaryGap: false,
	          splitLine: {
	          	show: true,
	              lineStyle: {
	                  color: "rgba(255,255,255,0.2)"
	              }
	          },
	          axisTick: {
	        	  show: false,
	          },
	          axisLine: {
	          	lineStyle: {
	              	color: 'rgba(255,255,255,0.2)',
	              }
	          },
	          axisLabel: {
	             color: '#00DEFF',
	          }
	      }],
	      yAxis: [{
	          show: true,
	          name: '亿元',
	          splitLine: {
	              lineStyle: {
	                  color: "rgba(255,255,255,0.2)"
	              }
	          },
	          axisTick: {
	              show: false
	          },
	          axisLine: {
	              show: true,
	              lineStyle: {
	                  color: "rgba(255,255,255,0.2)"
	              }
	          },
	          axisLabel: {
	              show: true,
	              color: '#00DEFF'
	          }
	      }, {
	          type: "value",
	          name: '同比',
	          axisLabel: {
	          	show: true,
	          	formatter: '{value} %',
		        color: "#00DEFF"
	          },
	          axisLine:{
	          	show: false,
	      	},
	      	splitLine: {
	      		show: false,
	          },
	      }],
	      series: [{
	          type: 'pictorialBar',
	          name: '总量',
	          barWidth : '200%',
	          barCategoryGap: '-20%',
	          symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
	          itemStyle: {
	          	color: {
	                  type: 'linear',
	                  x: 0,
	                  y: 0,
	                  x2: 0,
	                  y2: 1,
	                  colorStops: [{
	                      offset: 0, color: 'rgba(255,226,65,1)' 
	                  }, {
	                      offset: 1, color: 'rgba(255,168,65,0.1)'
	                  }],
	                  global: false 
	              },
	              opacity:0.6,
	          },
	          data: d.valueList,
	      },
	      {
	      	type: "line",
	      	symbol: 'circle',
	      	symbolSize: 8,
	        name: "同比",
	        yAxisIndex: 1,
	        data: d.percentList,
	        itemStyle: {
	          	borderWidth: 2,
	            color: '#00FFFF'
	        }
	    }]
	};
	myChart.setOption(option);
} */
function mount(x,d) {
	var myChart = echarts.init(document.getElementById('chart2'));
	x.unshift("");
	x.push("");
	d.unshift("");
	var option = {
	  	grid: {
	        left:'1%',
	        right:'1%',
	        top: 15,
	        bottom: 0,
	        containLabel:true
		},
		tooltip: {
			show: true,
			trigger: 'axis',
			formatter: function(p){
				var p0 = p[0].name!=undefined?p[0].name:'';
				var p1 = p[0].data.comp!=undefined?p[0].data.comp:''; 
				var p2 = p[0].value!=undefined?p[0].value:''; 
				if(p0!=''&&p1!=''&&p2!=''){
					return '年 &nbsp; &nbsp;&nbsp;&nbsp; 份：' + p0+'年'+'<br>企业数量：' + p1 +'家'+'<br>纳税总额：' + p2+'亿元'
				}
			}
		},
	  	xAxis: {
	        type: 'category',
	        position: "bottom",
	        boundaryGap: false,
	        splitLine: {
	        	show: true,
	            lineStyle: {
	                color: "rgba(255,255,255,0.2)"
	            }
	        },
	        axisTick: {
	      	  show: false,
	        },
	        axisLine: {
	        	lineStyle: {
	            	color: 'rgba(255,255,255,0.2)',
	            }
	        },
	        axisLabel: {
	           color: '#00DEFF',
	        },
	        data: x
	    },
	    yAxis: {
	        show: true,
	        name: '亿元',
	        splitLine: {
	            lineStyle: {
	                color: "rgba(255,255,255,0.2)"
	            }
	        },
	        axisTick: {
	            show: false
	        },
	        axisLine: {
	            show: true,
	            lineStyle: {
	                color: "rgba(255,255,255,0.2)"
	            }
	        },
	        axisLabel: {
	            show: true,
	            color: '#00DEFF'
	        }
	    },
	    series: {
	        type: 'pictorialBar',
	        name: '总量',
	        barCategoryGap: '-20%',
	        symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
	        itemStyle: {
	        	color: {
	                type: 'linear',
	                x: 0,
	                y: 0,
	                x2: 0,
	                y2: 1,
	                colorStops: [{
	                    offset: 0, color: 'rgba(0,255,228,1)' 
	                }, {
	                    offset: 1, color: 'rgba(0,255,228,0.1)'
	                }],
	                global: false 
	            },
	            opacity:0.6,
	        },
	        data: d
	    }
	};
	myChart.setOption(option);
}
function chart3d(d) {
	console.log(d)
	//3D饼图配置
	var highchartOptions={
		chart: {
			//renderTo: 'container',    //指定div放置图 
			type: 'pie',    
			backgroundColor: 'rgba(0,0,0,0)', 
			options3d: {
				enabled: true,	//显示图表是否设置为3D， 我们将其设置为 true
				alpha: 50, 		//图表视图旋转角度
				beta: 0,		//图表视图旋转角度
				// depth: 10,         //图表的合计深度，默认为100
				// viewDistance: 125   //定义图表的浏览长度
			},
		},
		title : {
			text:null
		},
		credits: {
	    	enabled:false
		},
		tooltip : {
			headerFormat:'',
			pointFormat: '<span style="color:{point.color}">\u25CF</span>{point.name}: <b>{point.y}家</b>'
		},
		colors:['#3297FC','#FFE42D','#1D54DC','#DCBC35','#B231DC'],
		legend: {
			enabled: true,
			itemStyle : {
				fontSize:14,
				color:'#fff'
			},
			itemHoverStyle : {
				color:'#FFE42D'
			},
			align: 'center',
			symbolRadius: 8,
			itemDistance: 30,
			itemMarginBottom: -10,
		},
		plotOptions : {
			pie: {
				allowPointSelect: false,
				cursor: 'pointer',
				depth: 30, //饼图厚度
				dataLabels: {
					enabled: true,
					cursor: 'pointer',
					format: '{point.name}<br/><b>{point.percentage:.1f}%</b>',//'<b>{point.percentage:.1f}%</b>',
					distance: 5,//调整标签圆心得距离
					style:{
						color:'#fff',
						fontSize: "14px"
					}
				},
				showInLegend: true
			}
		},  
		series: [{
			type: 'pie',
			name: '占比',
			center: ['50%', '50%'],
			size:'100%',//饼图大小
			startAngle: 340,//开始角度
			data: d
		}]
	};
	$("#chart3").highcharts(highchartOptions);
}
</script>
</body>
</html>