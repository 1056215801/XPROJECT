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
<title>袁州医药园智慧园区大数据平台</title>
</head>
<style>
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/yzyy/bg2.png) no-repeat center;
    background-size: 100% 100%;
}
</style>
<body class="gray-bg">
 	<%@ include file="header.jsp"%>
 	<div class="content fz0" style="padding:15px 15px 15px 0">
		<div class="pro-left">
         	<ul class="production" style="position: relative;">
				<li class="first-li" val="2">
					<div class="product-type">经济总量分析</div>
				</li>
				<li class="first-li on" val="3">
					<div class="product-type">经济效益分析</div>
				</li>
				<li class="first-li" val="4"> 
					<div class="product-type">园区产业分析</div>
				</li>
				<li class="first-li" val="6"> 
					<div class="product-type">医药产业分析</div>
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
					<input type="hidden" id="isLoad" name="isLoad" value="0">
				</form>
		    	<div class="nav">	
					<div class="nav-text">
						<div class="tab-eightIndustry" id="eightIndustry" style="margin:0;">
							<span class="on">按年分析</span>
							<span name="title" data="zyywsr">按月分析</span>
						</div>
						<div class="selects" id="forthTab00" style="display:inline-block;margin-left:5px;width: 65px;">
							<div class="select select1">
								<p class="select-p" style="display:none;"><font id="font1"></font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="ul1">
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
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">园区利润率分析</span>
			         		    <div class="yzyyLegend" id="legend1">
<!-- 									<span><i></i>同比</span>
 -->									<span><i></i>利润率</span>
								</div>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="div1-map1">
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
					           <span class="on">园区人均销售产值</span>
			         		    <div class="yzyyLegend" id="legend2">
									<span><i></i>人均</span>
									<span><i></i>同比</span>
								</div>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="div1-map2">
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
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">单位产值能耗</span>
			         		    <div class="yzyyLegend" id="legend3">
									<span><i></i>能耗</span>
									<span><i></i>同比</span>
								</div>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="div1-map3">
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
					           <span class="on">园区出口比重</span>
			         		    <div class="yzyyLegend" id="legend4">
									<span><i></i>比重</span>
									<span><i></i>同比</span>
								</div>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="div1-map4">
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
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/yzyyData.js"></script>
<script type="text/javascript">
var historyData = "";
$(function(){
	var tabIndex = '${tabIndex}';
	$(".head .tab>a:eq(1)").addClass("on");
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
	$(".tab-eightIndustry>span").on("click",function(){
		$(this).addClass("on").siblings().removeClass("on");
		var ind = $(this).index();
		if(ind==0){
			$('.select-p').css('display','none');
		}else{
			$('.select-p').css('display','block');
		}
		loadData(ind);
	})
	loadData(0);
	$('.yzyyLegend span').on("click",function(){
		$(this).toggleClass('on');
		if($(this).parent().attr('id')=='legend1'){
	 		var legend1 = $('#legend1 span:eq(0)');
			 legend2 = $('#legend1 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['利润率'],
		  	  selected: {
		  		 '利润率': true,
		  	  }
			};
			 if(legend1.hasClass('on')){
				 legend.selected = {'利润率': false}
			 }else{
				 legend.selected = {'利润率': true}
			 }
		     yzyyDataOne(historyData.lrValueYears1,'利润率','div1-map1',legend);
		}else if($(this).parent().attr('id')=='legend2'){
			var legend1 = $('#legend2 span:eq(0)');
			 legend2 = $('#legend2 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['人均', '同比'],
		  	  selected: {
		  		 '人均': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'人均': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'人均': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'人均': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'人均': false,'同比': false}
			}	
			yzyyData2(historyData.rjxsczValueYears1,historyData.rjxsczValueYears2,'产值（万元）','同比','div1-map2',2,'人均','同比','万元','%',legend,'',2,1);
		}else if($(this).parent().attr('id')=='legend3'){
			var legend1 = $('#legend3 span:eq(0)');
			 legend2 = $('#legend3 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['能耗', '同比'],
		  	  selected: {
		  		 '能耗': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'能耗': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'能耗': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'能耗': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'能耗': false,'同比': false}
			}
			yzyyData2(historyData.cznhValueYears1,historyData.cznhValueYears2,'能耗（万度/万元）','同比','div1-map3',2,'能耗','同比','（度/万元）','%',legend,'',2,1);
		}else if($(this).parent().attr('id')=='legend4'){
			var legend1 = $('#legend4 span:eq(0)');
			 legend2 = $('#legend4 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['比重', '同比'],
		  	  selected: {
		  		 '比重': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'比重': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'比重': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'比重': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'比重': false,'同比': false}
			}
			yzyyData1(historyData.ckbzValueYears1,historyData.ckbzValueYears2,'同比','比重','div1-map4','同比','比重','%','%',legend,2,1);
		}
	});
})
function getselectYear(yearList){
    for(var i=0; i<yearList.length;i++){
    	$('#forthTab00 .select1 ul').append('<li>'+yearList[i]+'</li>');
    }
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
 		$('#font1').text($(this).text());
 		$('#year').val($(this).text());
 		loadData(1);
	})
	$('#isLoad').val('1')
}
function loadData(type){ //0表示按年分析,1表示按月分析
	var url = "";
	var param = {};
	if(type==0){
		url = "${OfficeUrl}XOffice/interface/json/yuanZhouPharma/jjxyByYears";
	}else{
		param = {
			"yearCaliber": $('#year').val()	
		};
		url = "${OfficeUrl}XOffice/interface/json/yuanZhouPharma/jjxyByMonth";
	}
	$.ajax({
  		url : url,
		type : "post", 
		data : param,
		dataType : "json",
		success : function(result) {
			console.log(result)
			if(result.success){
				if(type==0&&$('#isLoad').val()=='0'){
					$('#year').val(result.yzyy.year);
					getselectYear(result.yzyy.yearList);
					$('#font1').text(result.yzyy.year);
				}
			 	var data = result.yzyy.data;
				historyData = data;
				yzyyDataOne(data.lrValueYears1,'利润率','div1-map1');
				yzyyData2(data.rjxsczValueYears1,data.rjxsczValueYears2,'产值（万元）','同比','div1-map2',2,'人均','同比','万元','%','',2,1);
				yzyyData2(data.cznhValueYears1,data.cznhValueYears2,'能耗（万度/万元）','同比','div1-map3',2,'能耗','同比','（度/万元）','%','',2,1);
				yzyyData1(data.ckbzValueYears1,data.ckbzValueYears2,'同比','比重','div1-map4','同比','比重','%','%','',2,2);
			}else{
				alert(result.errorMsg);
			}
		},
		error : function() {
		},
	});
	
}
function yzyyDataOne (data1,unit1,id,legend){
	var xData = [];
	var yData1 = [];
	for(var i=0;i<data1.length;i++){
		var temp = data1[i];
		xData.push(temp.name);
		yData1.push(temp.value);
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
	var chart = echarts.init(document.getElementById(id));
	var option = {
	    tooltip : {
	        trigger: "axis",
	    	formatter: function(params){
				var par1 = ''; 
	        	var par2 = ''; 
	        	unit1='';
	        	if(params[0]){
	        		if(params[0].value != undefined && params[0].value!=''){
	        			par1 = params[0].marker + params[0].axisValue + '<br>' + params[0].seriesName + ':' + params[0].value + '%';
	        		}
	        	}
	        	if(par1 == ''){
	        		par1 = params[1].marker + params[0].axisValue;
	        	}
	        	return par1 
			}
	    },
		grid: {
	        left:'4%',
	        right:'4%',
	        top: 50,
	        bottom: 30,
	        containLabel:true
		},
		legend: legend,
	    calculable: true,
	    xAxis: [{
	        type: "category",
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
	         data: xData,
	    }],
	    yAxis: [
	    
        {
            type: 'value',
            nameTextStyle:{
            	color: '#00DEFF',
            },
            name: unit1,
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
                  show: true,
                  formatter: '{value} %',
        	        color: "#00DEFF"
                  },
        },
	    ],
	    series: [{
	            name: "利润率",
	            type: "bar",
	            stack: "利润率",
	            barMaxWidth: 25,
	            barGap: "10%",
	            color : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: 'rgba(0,255,255,1)' // 0% 处的颜色
	                    }, {
	                        offset: 1, color: 'rgba(0,255,255,0)' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	            data: yData1,
	        },
	    ]
	}
	chart.setOption(option);
} 
</script>
</html>
