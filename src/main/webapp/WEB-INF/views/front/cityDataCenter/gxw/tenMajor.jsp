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
<title>十大基地</title>
</head>
<body class="gray-bg">
    <%@ include file="header.jsp"%>
    <div class="nav-title">
    	<form action="" method="post" id="form">
			<input type="hidden" id="orgId" name="orgId" value="${orgId}">
			<input type="hidden" id="year" name="year">
			<input type="hidden" id="month" name="month">
			<input type="hidden" id="lastYear" name="lastYear">
			<input type="hidden" id="lastMonth" name="lastMonth">
			<input type="hidden" id="typeName" name="typeName">
			<input type="hidden" id="spanName" name="spanName" vlaue="主营业务收入">
		</form>
    	<div class="nav">	
			<div class="nav-text">
				<div class="eightIndustry" onclick="changeDiv()">
					<img width="25" src="${ctx}/static/image/cityDataCenter/ycNew/icons_08.png">
					<font>十大基地</font>
				</div>
			   <div class="tab-eightIndustry" id="index">
				   	<span name="title"  data="zyywsr" class="on">主营业务收入</span>
<!-- 				   	<span name="title"  data="gyzjz" style="display:none">工业增加值</span>
 -->				   	<span name="title"  data="lr">利润总额</span>
			   </div>
			   	<div class="selects" id="forthTab00" style="display: inline-block;margin-left: 20px;">
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
		    <%-- <div class="return" onclick="location.href='${ctx}/front/cityDataCenter/ycIndex/1?orgId=3609009'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div> --%>
		</div> 
    </div>
    <div class="container-fluid  eight-content" id="div1">
       <div class="ten-floor">
         <div class="part">
         	<div class="part-content" style="position: relative; padding: 5px 5% 5px 8%; background: rgba(0,0,0,0.1);">
         				<div class="tab" id="thirdTab0" style="overflow: hidden;height: 100%">
							<div class="orders" style="display: inline-block;">
								<span class="on">
									<font>主营业务收入</font>
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
								</span>
							</div>
							<div class="industry-list">
								<%-- <div class="industry-item">
									<span>1</span>
									<font>锂电新能源产业</font>
									<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_16.png">
									<font class="yellowT"><b>2134</b>亿元</font>
								</div> --%>
							</div>
						</div>
         		</div>
         </div>
         <div class="part">
         	<div class="part-content" style="background: rgba(0,0,0,0.1);">
         		<div class="eight-map">
         			<div  class="mapContent" id="ten-map2">
         			
         			</div>
         		</div> 
         	</div>
         </div>
       </div>
     	<div class="ten-second-floor">
     		<div class="part">
         		<div class="part-content" style="background: rgba(0,0,0,0.1);">
         			<div class="eight-map">
         				<div  class="mapContent" id="ten-map3">
         			
         				</div>
         			</div>
         		</div>
         	</div>
         	<div class="part">
	         	<div class="part-content" style="background: rgba(0,0,0,0.1);">
	         		<div class="eight-map">
         				<div  class="mapContent" id="ten-map4">
         			
         				</div>
         			</div>
	         	</div>
         	</div>
       </div>
    </div>
    <div class="economicData-county-content" style="display:none;" id="div2">
		<div class="economicData-pro-tab" id="bar1">
		 	<!-- <div style="width: 100%; height: 13%;" id="index" onclick="selectByIndex()">
				<div name="title" class="echarts-title1" style="margin-left: 0%;" data="zyywsr">主营业务收入</div>
				<div name="title" class="echarts-title" data="gyzjz">工业增加值</div>
				<div name="title" class="echarts-title" data="lr">利润总额</div>
				<div name="title" class="echarts-title" id="ls" data="ls" style="display: none;">利税</div>
			</div> -->
			<div id="tab1" name="echarts-map" class="echarts-map"></div>
			<div id="tab2" name="echarts-map" class="echarts-map1"></div>
			<div id="tab3" name="echarts-map" class="echarts-map1"></div>
<!-- 			<div id="tab4" name="echarts-map" class="echarts-map1" style="height:200px;width:200px"></div>
 -->		</div>
		<div class="economicData-pro-pieChart" id="pieBar" style="position: relative;">
			<span id="pieSpan">
				<font id="pieTitle"  style="color:#b0e7ff;font-size:14px;font-weight:bold;margin-top:10px;margin-left:10px;display:block;"></font>
			</span>
			<div id="pie" style="width: 100%;height: 90%"></div>
		</div>
		<div class="economicData-pro-barChart" id="bar2" style="width: calc(50% - 5px);"></div>
		<div class="economicData-pro-barChart" id="bar3" style="width: calc(50% - 5px);float:right;"></div>
		<div class="clear"></div>
	</div>
    
    
    
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script type="text/javascript">
var orderby = "ZYYWSR_VALUE DESC";
var isLoading = false;
$(function(){
	$(".head>a:eq(1)").addClass("on");
	$('#spanName').val('主营业务收入');
	$(".tab-eightIndustry>span").on("click",function(){
		var ind = $(this).index();
		$('#spanName').val($(this).text());
		$(this).addClass("on").siblings().removeClass("on");
		$('.orders span font').text($(this).text());
		if(ind==0){
			orderby = "ZYYWSR_VALUE DESC";
		}else{
			orderby = "LR_VALUE DESC";
		}
         getList(0,0);
	})
	$(".select p").on("click",function(){
		$(this).next().slideToggle();
	})
	getselectYear();
	var index = '${spanIndex}';
	if(index==0){
		orderby = "ZYYWSR_VALUE DESC";
		$('.orders span font').text('主营业务收入');
		$('#spanName').val('主营业务收入');
	}else if(index==1){
		orderby = "LR_VALUE DESC";
		$('.orders span font').text('利润总额');
		$('#spanName').val('利润总额');
	}else{
		orderby = "ZYYWSR_VALUE DESC";
		$('.orders span font').text('主营业务收入');
		$('#spanName').val('主营业务收入');
	}
	$('.tab-eightIndustry span:eq('+index+')').addClass("on").siblings().removeClass("on");
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
		if($(this).parent().attr('id')=='ul1'){
 			$('#font1').text($(this).text());
 			$('#year').val($(this).text());
 			 getList(0,0);
		}else if($(this).parents().attr('id')=='ul2'){
			$('#font2').text($(this).text());
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'))
				$('#month').val(month);
				getList(0,1);
		}
	})
}
function getList(type,monthSelect){
	var date = "";
	if( $('#year').val()!=''&&$('#month').val()!==''){
		 date  = $('#year').val()+'-'+$('#month').val();
	}
	$.ajax({
  		url : "${OfficeUrl}XOffice/interface/json/dataIndustryBaseLog/dataCenterList",
		type : "post", 
		data : {
			"date": date,
			"orderby": orderby,
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
					$('.industry-list').empty();
					$('#lastYear').val($('#year').val());
					$('#lastMonth').val($('#month').val());
		 			for (var i=0;i<list.length;i++){
						var info = list[i];
						var zyywsrValue = list[0].ZYYWSR_VALUE;
						var lrValue = list[0].LR_VALUE
						var index = i+1;
					    var _div = "";
					    if(i==0){
					    	$('#typeName').val(info.BASE_NAME);
							 getMap();
						    _div += '<div class="industry-item on" onclick="changeMap(this,\''+info.BASE_NAME+'\')">'
					    }else{
						    _div += '<div class="industry-item" onclick="changeMap(this,\''+info.BASE_NAME+'\')">'
					    }
					    _div += '<span>'+index+'</span>'
					    _div +=	'<font class="typeName">'+info.BASE_NAME+'</font>'
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
						$('.industry-list').append(_div);
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
				url : "${OfficeUrl}XOffice/interface/json/dataIndustryBaseLog/listForEchart",
				type : "post",
				data : {
					"yearCaliber": $('#year').val(),
					"monthCaliber": $('#month').val(),
					"baseName": $('#typeName').val(),
					"dateType": orderby=="ZYYWSR_VALUE DESC"?0:1
		 		},
				dataType : "json",
				success : function(result) {
					if(result.success){
						var echartData = result.echartData;
						chart5(echartData.pie,$('#typeName').val(),$('#year').val(),$('#month').val());
						chart6 (echartData.bar1,$('#year').val(),$('#typeName').val(),$('#spanName').val());
						chart7 (echartData.bar2,$('#year').val(),$('#month').val(),$('#typeName').val(),$('#spanName').val());

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
	orderby = "ZYYWSR_VALUE DESC";
	$('#spanName').val('主营业务收入');
	$('.orders span font').text('主营业务收入');
	getList(0,0)
	$(".tab-eightIndustry>span:eq(0)").addClass("on").siblings().removeClass("on");
}
</script>
</html>