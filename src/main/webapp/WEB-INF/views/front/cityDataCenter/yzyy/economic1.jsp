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
				<li class="first-li on" val="2">
					<div class="product-type">经济总量分析</div>
				</li>
				<li class="first-li" val="3">
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
			 <div class="nav-title fz0" style="padding-bottom: 10px;">
		    	<form action="" method="post" id="form">
					<input type="hidden" id="orgId" name="orgId" value="${orgId}">
					<input type="hidden" id="year" name="year" value="${searchInfo.year}">
					<input type="hidden" id="month" name="month" value="${searchInfo.month}">
					<input type="hidden" id="lastYear" name="lastYear">
					<input type="hidden" id="lastMonth" name="lastMonth">
					<input type="hidden" id="typeName" name="typeName">
					<input type="hidden" id="isLoad" name="isLoad" value="0">
				</form>
		    	<div class="nav" style="padding: 10px 0 0;">	
					<div class="nav-text">
						<div class="tab-eightIndustry" id="eightIndustry" style="margin:0;">
							<span class="on">按年分析</span>
							<span>按月分析</span>
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
				<div class="jjzl fz0">
					<div class="jjzl-item">
						<img src="${ctx}/static/image/cityDataCenter/yzyy/circular.png">
						<div class="jjzl-infof">
							<h1 class="yellowT" id="t0"></h1>
							<p>工业总产值（亿元）</p>
						</div>
					</div>
				    <div class="jjzl-item">
						<img src="${ctx}/static/image/cityDataCenter/yzyy/circular.png">
						<div class="jjzl-infof">
							<h1 class="yellowT" id="t1"></h1>
							<p>主营业务收入（亿元）</p>
						</div>
					</div>
				     <div class="jjzl-item">
						<img src="${ctx}/static/image/cityDataCenter/yzyy/circular.png">
						<div class="jjzl-infof">
							<h1 class="yellowT" id="t2"></h1>
							<p>利润总额（亿元）</p>
						</div>
					</div>
					<div class="jjzl-item">
						<img src="${ctx}/static/image/cityDataCenter/yzyy/circular.png">
						<div class="jjzl-infof">
							<h1 class="yellowT" id="t3"></h1>
							<p>用电量（万度）</p>
						</div>
					</div>
				</div>
			</div>
			<div class="changeParent" id="div1" style="height: calc(100% - 110px);">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 50%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">园区工业总产值历年趋势</span>
					         	<div class="yzyyLegend" id="legend1">
									<span><i></i>总量</span>
									<span><i></i>同比</span>
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
					           <span class="on">园区主营业务收入历年趋势</span>
					           <div class="yzyyLegend" id="legend2">
									<span><i></i>总量</span>
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
					           <span class="on">园区利润总额历年趋势</span>
					            <div class="yzyyLegend" id="legend3">
									<span><i></i>总量</span>
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
					           <span class="on">园区用电历年趋势</span>
					            <div class="yzyyLegend" id="legend4">
									<span><i></i>总量</span>
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
		  	  data: ['总量', '同比'],
		  	  selected: {
		  		 '总量': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'总量': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'总量': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'总量': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'总量': false,'同比': false}
			}
			yzyyData1(historyData.gyzczValueYears1,historyData.gyzczValueYears2,'产值（亿元）','同比','div1-map1','同比','总量','%','亿元',legend,2,1);
		}else if($(this).parent().attr('id')=='legend2'){
			var legend1 = $('#legend2 span:eq(0)');
			 legend2 = $('#legend2 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['总量', '同比'],
		  	  selected: {
		  		 '总量': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'总量': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'总量': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'总量': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'总量': false,'同比': false}
			}	
			yzyyData2(historyData.zyywsrValueYears1,historyData.zyywsrValueYears2,'利润（亿元）','同比','div1-map2',3,'总量','同比','亿元','%',legend,2,1);
		}else if($(this).parent().attr('id')=='legend3'){
			var legend1 = $('#legend3 span:eq(0)');
			 legend2 = $('#legend3 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['总量', '同比'],
		  	  selected: {
		  		 '总量': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'总量': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'总量': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'总量': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'总量': false,'同比': false}
			}
			yzyyData2(historyData.zyywsrValueYears1,historyData.zyywsrValueYears2,'利润（亿元）','同比','div1-map3',3,'总量','同比','亿元','%',legend,2,1);
		}else if($(this).parent().attr('id')=='legend4'){
			var legend1 = $('#legend4 span:eq(0)');
			 legend2 = $('#legend4 span:eq(1)');
			 var legend = {
			  show: false,
			  type: 'plain',
		  	  data: ['总量', '同比'],
		  	  selected: {
		  		 '总量': true,
		  		 '同比': true,
		  	  }
			};
			if(!legend1.hasClass('on') && !legend2.hasClass('on')){
			  	legend.selected = {'总量': true,'同比': true}
			}else if(!legend1.hasClass('on') && legend2.hasClass('on')){
			  	 legend.selected = {'总量': true,'同比': false}
			}else if(!legend2.hasClass('on') && legend1.hasClass('on')){
			  	 legend.selected = {'总量': false,'同比': true}
			}else if(legend1.hasClass('on') && legend2.hasClass('on')){
			  	legend.selected = {'总量': false,'同比': false}
			}
			yzyyData1(historyData.ydValueYears1,historyData.ydValueYears2,'用电（万度）','同比','div1-map4','同比','总量','%','（万度）',legend,2,1);
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
		url = "${OfficeUrl}XOffice/interface/json/yuanZhouPharma/jjzlByYears";
	}else{
		url = "${OfficeUrl}XOffice/interface/json/yuanZhouPharma/jjzlByMonth";
		param = {
			"yearCaliber": $('#year').val()	
		};
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
	 			var topValue = data.topValue;
				for(var i=0;i<topValue.length;i++){
					var temp = topValue[i];
					if(temp==null){
						$('#t'+i).text('未公布');
					}else{
						$('#t'+i).text(temp);
					}
				} 
				historyData = data;
				yzyyData1(data.gyzczValueYears1,data.gyzczValueYears2,'产值（亿元）','同比','div1-map1','同比','总量','%','亿元','',2,1);
				yzyyData2(data.zyywsrValueYears1,data.zyywsrValueYears2,'利润（亿元）','同比','div1-map2',2,'总量','同比','亿元','%','',2,1);
				yzyyData2(data.lrValueYears1,data.lrValueYears2,'利润（亿元）','同比','div1-map3',2,'总量','同比','亿元','%','',2,1);
				yzyyData1(data.ydValueYears1,data.ydValueYears2,'用电（万度）','同比','div1-map4','同比','总量','%','（万度）','',2,1);
			}else{
				alert(result.errorMsg);
			}
		},
		error : function() {
		},
	});
	
}
</script>
</html>
