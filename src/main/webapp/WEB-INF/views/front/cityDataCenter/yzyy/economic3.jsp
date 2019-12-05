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
				<li class="first-li" val="3">
					<div class="product-type">经济效益分析</div>
				</li>
				<li class="first-li on" val="4"> 
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
					<input type="hidden" id="types" name="types" value="1">
					<input type="hidden" id="year" name="year" value="">
					<input type="hidden" id="month" name="month" value="">
					<input type="hidden" id="lastYear" name="lastYear" value="">
					<input type="hidden" id="lastMonth" name="lastMonth" value="">
					<input type="hidden" id="typeName" name="typeName" value="">
					<input type="hidden" id="isLoad" name="isLoad" value="0">
					<input type="hidden" id="selectIndex" name="selectIndex" value="0">
				</form>
		    	<div class="nav">	
					<div class="nav-text">
						<div class="tab-eightIndustry" id="eightIndustry" style="margin:0;">
							<span class="on">总量分析</span>
							<span name="title" data="zyywsr">效益分析</span>
						</div>
						<div class="selects" id="forthTab00" style="display: inline-block;margin-left:10px;">
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
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">指标排行榜</span>
				            </div>
							<div class="part-content reusltContent cyContent">
			         		   <div class="yzyyTab">
									<div class="orders" style="display: inline-block;">
										<span class="on">
											主营业务收入
										</span>
										<span>
											工业总产值
										</span>
										<span>
											利润总额
										</span>
									</div>
									<div class="count-list area-list eight-count-list" id="industryList1" style="margin-top:0;"></div>
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
					           <span class="on" id="tabTitle2">主营业务收入情况</span>
			         		   <div class="yzyyLegend" id="legend2">
									<span><i></i>主营</span>
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
					           <span class="on" id="tabTitle3">工业总产值情况</span>
			         		   <div class="yzyyLegend" id="legend3">
									<span><i></i>总产值</span>
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
					           <span class="on" id="tabTitle4">利润总额情况</span>
			         		   <div class="yzyyLegend" id="legend4">
									<span><i></i>利润</span>
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
			<div class="changeParent" id="div2" style="display:none;">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 50%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						    <div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">产业利润率对比</span>
				            </div>
							<div class="part-content reusltContent cyContent">
			         		  <div class="yzyyTab">
									<div class="count-list area-list eight-count-list" id="industryList2" style="margin-top:0;height: 100%;"></div>
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
					           <span class="on">产业人均销售产值</span>
			         		   <div class="yzyyLegend" id="legend5">
									<span><i></i>产值</span>
									<span><i></i>同比</span>
							   </div>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="div2-map2">
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
					           <span class="on">产业单位产值能耗</span>
			         		   <div class="yzyyLegend" id="legend6">
									<span><i></i>能耗</span>
									<span><i></i>同比</span>
							   </div>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="div2-map3">
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
					           <span class="on">产业指标结果分析</span>
					           <span class="noBorderLeft" id="resultAys"></span>
				            </div>
							<div class="part-content reusltContent  cyContent">
				         		 <div class="eight-map">
				         			 <table class="ten-table">
			         					<tr>
			         						<td></td>
			         						<td>利润率最高</td>
			         						<td>人均销售产值最高</td>
			         						<td>单位产值能耗最低</td>
			         					</tr>
			         					<tr>
			         						<td>产业名称</td>
			         						<td id="lrl1"></td>
			         						<td id="sr1"></td>
			         						<td id="lr1"></td>
			         					</tr>
			         					<tr>
			         						<td>当前数据</td>
			         						<td id="lrl2"></td>
			         						<td id="sr2"></td>
			         						<td id="lr2"></td>
			         					</tr>
			         					<tr>
			         						<td>上年同期</td>
			         						<td id="lrl3"></td>
			         						<td id="sr3"></td>
			         						<td id="lr3"></td>
			         					</tr>
			         				 	<tr>
			         						<td>同比</td>
			         						<td id="lrl4"></td>
			         						<td id="sr4"></td>
			         						<td id="lr4"></td>
			         					</tr> 
			         				</table>
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
var historyData1 = "";
var historyData2 = "";
$(function(){
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
		$('#selectIndex').val(ind);
		index = $(this).attr("data");
		$('#typeName').val('');
		if(ind==0){
			$('#div1').show();
			$('#div2').hide();
			loadData1(0);
	    }else{
	    	loadData2();
			$('#div1').hide();
			$('#div2').show();
		}
	})
	$(".orders>span").on("click",function(){
		var ind = $(this).index()+1;
		$(this).addClass("on").siblings().removeClass("on");
		$('#types').val(ind);
		$('#typeName').val('');
		loadData1(0);
	})
	loadData1(1);
	$('.yzyyLegend span').on("click",function(){
		$(this).toggleClass('on');
		if($(this).parent().attr('id')=='legend1'){
		}else if($(this).parent().attr('id')=='legend2'){
			var legend1 = $('#legend2 span:eq(0)');
			 legend2 = $('#legend2 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['主营', '同比'],
		  	  selected: {
		  		 '主营': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'主营': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'主营': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'主营': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'主营': false,'同比': false}
			}	
			yzyyData2(historyData1.zyywsrValue1,historyData1.zyywsrValue2,'产值（亿元）','同比','div1-map2',2,'主营','同比','亿元','%',legend,2,2);
		}else if($(this).parent().attr('id')=='legend3'){
			var legend1 = $('#legend3 span:eq(0)');
			 legend2 = $('#legend3 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['总产值', '同比'],
		  	  selected: {
		  		 '总产值': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'总产值': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'总产值': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'总产值': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'总产值': false,'同比': false}
			}
			yzyyData2(historyData1.gyzczValue1,historyData1.gyzczValue2,'产值（亿元）','同比','div1-map3',2,'总产值','同比','亿元','%',legend,2,2);
		}else if($(this).parent().attr('id')=='legend4'){
			var legend1 = $('#legend4 span:eq(0)');
			 legend2 = $('#legend4 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['利润', '同比'],
		  	  selected: {
		  		 '利润': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'利润': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'利润': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'利润': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'利润': false,'同比': false}
			}
			yzyyData1(historyData1.lrzeValue2,historyData1.lrzeValue1,'利润（亿元）','同比','div1-map4','同比','利润','%','亿元',legend,2,2);
		}else if($(this).parent().attr('id')=='legend5'){
			var legend1 = $('#legend5 span:eq(0)');
			 legend2 = $('#legend5 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['产值', '同比'],
		  	  selected: {
		  		 '产值': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'产值': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'产值': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'产值': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'产值': false,'同比': false}
			}
			yzyyData2(historyData2.rjxsczValue1,historyData2.rjxsczValue2,'产值（万元）','同比','div2-map2',2,'产值','同比','万元','%',legend,2,2);
		}else if($(this).parent().attr('id')=='legend6'){
			var legend1 = $('#legend6 span:eq(0)');
			 legend2 = $('#legend6 span:eq(1)');
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
			yzyyData2(historyData2.dwcznhValue1,historyData2.dwcznhValue2,'能耗（万度/万元）','同比','div2-map3',2,'能耗','同比','（万度/万元）','%',legend,2,2);
		}
	});
})
function getselectYear(yearList){
    for(var i=0; i<yearList.length;i++){
    	$('#forthTab00 .select1 ul').append('<li>'+yearList[i]+'</li>');
    }
	$(".select li").on("click",function(){
		$('#typeName').val('');
		$(this).parents('.select-items').slideToggle();
		if($(this).parent().attr('id')=='ul1'){
 			$('#font1').text($(this).text());
 			$('#year').val($(this).text());
 			if($('#selectIndex').val()==0){
 	 			loadData1(0);
 			}else{
 	 			loadData2(0);
 			}
		}else if($(this).parents().attr('id')=='ul2'){
			 $('#font2').text($(this).text());
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			$('#month').val(month);
			if($('#selectIndex').val()==0){
 	 			loadData1(0);
 			}else{
 	 			loadData2(0);
 			}
		}
	})
	$('#isLoad').val('1')
}
function loadData1(type){
   var url = "${OfficeUrl}XOffice/interface/json/yuanZhouPharma/yqcyFx";
   var param = {
		"types": $('#types').val(),
		"year": $('#year').val(),
		"month": $('#month').val(),
		"typeName": $('#typeName').val()   
   };
	$.ajax({
  		url : url,
		type : "post", 
		data : param,
		dataType : "json",
		success : function(result) {
			if(type==1){
				if($('#isLoad').val()=='0'){
					getselectYear(result.yearList);
				}
				$('#year').val(result.year);
				$('#month').val(result.month);
				$('#font1').text(result.year);
				$('#font2').text(result.month+'月');
			}
			if(result.indexList){
				var list = result.indexList; 
				if(list.length>0){
					$('#industryList1').empty();
					$('#lastYear').val($('#year').val());
					$('#lastMonth').val($('#month').val()); 
					var maxValue = null;
					for (var i=0;i<list.length;i++){
						var info = list[i];
						var index = i+1;
					    var _div = "";
					    var value = $('#types').val()=="1"?info.zyywsrValue:$('#types').val()=="2"?info.gyzczValue:info.lrValue;
					    if(i==0){
							maxValue = value;
						}
					    var w = i==0? '90' : maxValue!=null && maxValue!=0?((value/maxValue)*90).toFixed(2):'0';
						 if(i==0){
					    	$('#typeName').val(info.typeName);
					    	console.log($('#typeName').val())
					    	$('#tabTitle2').text('主营业务收入情况-'+info.typeName);
							$('#tabTitle3').text('工业总产值情况-'+info.typeName);
							$('#tabTitle4').text('利润总额情况-'+info.typeName);
							getMap()
							_div += '<div class="count-item on count-item-first" onclick="changeMap(this,\''+info.typeName+'\')">'
						 }else{
							_div += '<div class="count-item" onclick="changeMap(this,\''+info.typeName+'\')">'
				      	}
		 				_div += '<font style="width:110px;">'+index+'.'+info.typeName+'</font>';
		 				_div += '<span style="width: calc(100% - 230px);">';
		 				if(value){
		 					_div += '<div style="width: '+w+'%;"></div>';
					 		_div += '</span><b style="width:120px;">'+value+'<i>亿元</i></b></div>';
		 				}else{
		 					_div += '<div style="width: 0%;"></div>';
			 				_div += '</span><b style="width:80px;">未公布</b></div>';
		 				}
						$('#industryList1').append(_div);
					}
				}else{
					alert($('#font1').text()+'年'+$('#font2').text()+"暂无数据");
					$('#font1').text($('#lastYear').val());
					$('#font2').text($('#lastMonth').val()+'月');
					$('#year').val($('#lastYear').val());
					$('#month').val($('#lastMonth').val());
					
				}
			}else{
				$('#font1').text($('#lastYear').val());
				$('#font2').text($('#lastMonth').val()+'月');
				alert($('#year').val()+'年'+$('#month').val()+'月'+"暂无数据");
				$('#year').val($('#lastYear').val());
				$('#month').val($('#lastMonth').val());
				
			}
		},
		error : function() {
		},
	});
}
function getMap(){
	   var url = "${OfficeUrl}XOffice/interface/json/yuanZhouPharma/yqcyFx2";
	   var param = {
			"year": $('#year').val(),
			"typeName": $('#typeName').val()   
	   };
	   console.log(param)
		$.ajax({
	  		url : url,
			type : "post", 
			data : param,
			dataType : "json",
			success : function(result) {
				 if(result.success&&result.yzyy.data){
					 historyData1 = result.yzyy.data;
					 var data = result.yzyy.data;
					 console.log(data);
					 $('#tabTitle2').text('主营业务收入情况-'+$('#typeName').val());
					 $('#tabTitle3').text('工业总产值情况-'+$('#typeName').val());
					 $('#tabTitle4').text('利润总额情况-'+$('#typeName').val());
					 yzyyData2(data.zyywsrValue1,data.zyywsrValue2,'产值（亿元）','同比','div1-map2',2,'主营','同比','亿元','%','',2,2);
					 yzyyData2(data.gyzczValue1,data.gyzczValue2,'产值（亿元）','同比','div1-map3',2,'总产值','同比','亿元','%','',2,2);
					 yzyyData1(data.lrzeValue2,data.lrzeValue1,'利润（亿元）','同比','div1-map4','同比','利润','%','亿元','',2,2);
				 }else{
					 alert(result.errorMsg);
				 }
			},
			error : function() {
			},
		});
	
}
function changeMap(e,name){
	$('#typeName').val(name);
	$(e).addClass("on").siblings().removeClass("on");
	getMap();
}
function loadData2(){
     var url = "${OfficeUrl}XOffice/interface/json/yuanZhouPharma/yqcyXy";
	$.ajax({
  		url : url,
		type : "post", 
		data : {
			"yearCaliber": $('#year').val(),
			"monthCaliber": $('#month').val(),
 		},
		dataType : "json",
		success : function(result) {
			if(result.success){
				var data = result.yzyy.data;
				var list = data.lrlValue;
				historyData2 =data;
				if(list.length>0){
					$('#industryList2').empty();
					/* $('#lastYear').val($('#year').val());
					$('#lastMonth').val($('#month').val()); */
					for (var i=0;i<list.length;i++){
						var info = list[i];
						var index = i+1;
					    var _div = "";
						var w = i==0? '90' : ((info.value/list[0].value)*90).toFixed(2);
					    _div += '<div class="count-item">'
		 				_div += '<font style="width:110px;">'+index+'.'+info.name+'</font>';
		 				_div += '<span style="width: calc(100% - 220px);">';
		 				if(info.value){
		 					_div += '<div style="width: '+w+'%;"></div>';
					 		_div += '</span><b style="width:110px;">'+info.value+'<i>%</i></b></div>';
		 				}else{
		 					_div += '<div style="width: 0%;"></div>';
			 				_div += '</span><b style="width:80px;">未公布</b></div>';
		 				}
						$('#industryList2').append(_div);
					}
					yzyyData2(data.rjxsczValue1,data.rjxsczValue2,'产值（万元）','同比','div2-map2',2,'产值','同比','万元','%','',2,1);
					yzyyData2(data.dwcznhValue1,data.dwcznhValue2,'能耗（万度/万元）','同比','div2-map3',2,'能耗','同比','（万度/万元）','%','',2,1);
					loadTable(data);
					$('#resultAys').text('截至'+$('#year').val()+'年'+$('#month').val()+'月');
				}else{
					$('#font1').text($('#lastYear').val());
					$('#font2').text($('#lastMonth').val()+'月');
					alert($('#year').val()+'年'+$('#month').val()+'月'+"暂无数据");
					$('#year').val($('#lastYear').val());
					$('#month').val($('#lastMonth').val());
				}
			}else{
				alert(result.errorMsg);
			}
		},
		error : function() {
		},
	});
}
function loadTable(d){
	var arr1 = d.zbjgValue1;
	var arr2 = d.zbjgValue2;
	var arr3 = d.zbjgValue3;
 	$("#lrl1").html(arr1.typeName?arr1.typeName:'未公布');
	$("#lrl2").html(tongBi(arr1.value,2));
	$("#lrl3").html(tongBi(arr1.lastYear,2));
	$("#lrl4").html(tongBi(arr1.percent,3));
	
	$("#sr1").html(arr2.typeName?arr2.typeName:'未公布');
	$("#sr2").html(tongBi(arr2.value,6));
	$("#sr3").html(tongBi(arr2.lastYear,6));
	$("#sr4").html(tongBi(arr2.percent,3));
	
	$("#lr1").html(arr3.typeName?arr3.typeName:'未公布');
	$("#lr2").html(tongBi(arr3.value,7));
	$("#lr3").html(tongBi(arr3.lastYear,7));
	$("#lr4").html(tongBi(arr3.percent,3));
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
			if(d == '' || d == null) { return '未公布';}
			else { return d + '%';}
			
		}else if (t==5){
			if(Number(d) > 0) { return d + '<i style="height:18px;">万元</i><img src="${ctx}/static/image/cityDataCenter/jxNew/big-red-up.png" />'}
			else if( d == ''|| d == null) { return '未公布'}
			else if( Number(d) < 0) { return d + '<i style="height:18px;">万元</i><img src="${ctx}/static/image/cityDataCenter/jxNew/big-green-down.png" />'}
			else { return d}
			
		} else if (t==6){
			if(d == ''|| d == null) { return '未公布';}
			else { return d + '<i style="height:18px;">万元/人</i>';}
		}  else if (t==7){
			if(d == ''|| d == null) { return '未公布';}
			else { return d + '<i style="height:18px;">万度/万元</i>';}
		}
	} else { return '未公布'}
}
</script>
</html>
