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
	<link href="${ctx}/static/css/cityDataCenter/lowindy.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/cityDataCenter/site.css" rel="stylesheet">
	<title>宜春大数据企业创新信息</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="${orgId}">
		<input type="hidden" id="qx1val" name="qx1val" value="">
		<input type="hidden" id="cy1val" name="cy1val" value="">
		<input type="hidden" id="year1val" name="year1val" value="">

		<input type="hidden" id="lv2val" name="lv2val" value="">
		<input type="hidden" id="cy2val" name="cy2val" value="">
		<input type="hidden" id="year2val" name="year2val" value="">

		<input type="hidden" id="lv3val" name="lv3val" value="">
		<input type="hidden" id="qx3val" name="qx3val" value="">
		<input type="hidden" id="cy3val" name="cy3val" value="">

		<input type="hidden" id="lv4val" name="lv4val" value="">
		<input type="hidden" id="qx4val" name="qx4val" value="">
		<input type="hidden" id="year4val" name="year4val" value="">
	</form>
	<%@ include file="header.jsp"%>
	<div class="mainpage clear-box">
		<div class="pro-left">
				<div class="nav">	
					<div class="nav-text" onclick="goPage('${ctx}/front/cityDataCenter/ycIndex/19?orgId=3609009')">
						<div class="eightIndustry dib" style="padding: 5px 30px 5px 15px;">
							<img src="${ctx}/static/image/cityDataCenter/ycNew/cxIcon.png" style="vertical-align: text-bottom;">
							<font style="margin: 0 8px;">企业创新信息</font>
						</div>
					</div>
				</div>
			<ul class="production">
				<li class="first-li">
					<div class="product-type" >科创平台（<span id="kcpt"></span>）</div>
				</li>
				<li class="first-li">
					<div class="product-type" >驰名商标（<span id="cmsb"></span>）</div>
				</li>
				<li class="first-li on"> 
					<div class="product-type">院士工作站（<span id="ysgzz"></span>）</div>
				</li>
				<li class="first-li"> 
					<div class="product-type">专利（<span id="zl"></span>）</div>
				</li>
			</ul>
		</div>
		<div class="pro-right" style="padding: 0; height: 100%;">
			<div class="cxtabs on" id="tab3">
				<div class="blockStyle" style="height: 50%;">
					<div class="spanStyle" style="width: 30%;">
						<div class="boxStyleBg" style="padding: 15px 20px;">
							<div class="left-top-radius"></div>
							<div class="left-bottom-radius"></div>
							<div class="right-top-radius"></div>
							<div class="right-bottom-radius"></div>
							<div class="top-line"></div>
							<div class="bottom-line"></div>
							<div class="left-line"></div>
							<div class="right-line"></div>
							<div class="industryDataBar">
								<div class="tab-links">
									<span class="on">平台级别分布情况</span>
										
								</div>
								<div class="tab-links">
									<div class="selects wd33 textAlign" >
										<div class="select">
											<p><font id="qx1Font">选择区县</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part1">
												<ul id="qx1">
													<li>选择区县</li>
													<li>市本级</li>
													<li>袁州区</li>
													<li>经开区</li>
													<li>万载县</li>
													<li>丰城市</li>
													<li>樟树市</li>
													<li>高安市</li>
													<li>铜鼓县</li>
													<li>宜丰县</li>
													<li>奉新县</li>
													<li>靖安县</li>
													<li>上高县</li>
													<li>明月山</li>
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="cy1Font">选择产业</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part1">
												<ul id="cy1">
													<li>选择产业</li>
													<li>锂电产业</li>
													<li>医药产业</li>
													<li>机电产业</li>
													<li>食品产业</li>
													<li>建材产业</li>
													<li>纺织服装产业</li>
													<li>化工产业</li>
													<li>有色冶炼</li>
													<li>橡胶塑料制品</li>
													<li>金属制品</li>
													<li>电子信息产业</li>
													<li>先进装备制造产业</li>
													<li>其它产业</li>
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="year1Font">选择年份</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part1">
												<ul id="year1" class="yearUl">
													<li>选择年份</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="qycx-charts">
									<div id="chart3-1" style="width: 100%;height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="spanStyle" style="width: calc(70% - 10px);">
						<div class="boxStyleBg" style="padding: 15px 20px;">
							<div class="left-top-radius"></div>
							<div class="left-bottom-radius"></div>
							<div class="right-top-radius"></div>
							<div class="right-bottom-radius"></div>
							<div class="top-line"></div>
							<div class="bottom-line"></div>
							<div class="left-line"></div>
							<div class="right-line"></div>
							<div class="industryDataBar">
								<div class="tab-links">
									<span class="on">各区县分布情况</span>
									<div class="fr selects wd33 textAlign" style="padding-top: 5px">
										<div class="select ">
											<p><font id="lv2Font">选择级别</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part2">
												<ul id="lv2">
													<li>选择级别</li>
													<li>省级</li>
													<li>市级</li>
												</ul>
											</div>
										</div>
										<div class="select ">
											<p><font id="cy2Font">选择产业</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part2">
												<ul id="cy2">
													<li>选择产业</li>
													<li>锂电产业</li>
													<li>医药产业</li>
													<li>机电产业</li>
													<li>食品产业</li>
													<li>建材产业</li>
													<li>纺织服装产业</li>
													<li>化工产业</li>
													<li>有色冶炼</li>
													<li>橡胶塑料制品</li>
													<li>金属制品</li>
													<li>电子信息产业</li>
													<li>先进装备制造产业</li>
													<li>其它产业</li>
												</ul>
											</div>
										</div>
										<div class="select ">
											<p><font id="year2Font">选择年份</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part2">
												<ul id="year2" class="yearUl">
													<li>选择年份</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="qycx-charts2">
									<div id="chart3-2" style="width: 100%;height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="blockStyle" style="height: calc(50% - 10px);">
					<div class="spanStyle" style="width: 30%;">
						<div class="boxStyleBg" style="padding: 15px 20px;">
							<div class="left-top-radius"></div>
							<div class="left-bottom-radius"></div>
							<div class="right-top-radius"></div>
							<div class="right-bottom-radius"></div>
							<div class="top-line"></div>
							<div class="bottom-line"></div>
							<div class="left-line"></div>
							<div class="right-line"></div>
							<div class="industryDataBar">
								<div class="tab-links">
									<span class="on">建站年份分布情况</span>
										
								</div>
								<div class="tab-links">
									<div class="selects wd33 textAlign" >
										<div class="select">
											<p><font id="qx3Font">选择区县</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part3">
												<ul id="qx3">
													<li>选择区县</li>
													<li>市本级</li>
													<li>袁州区</li>
													<li>经开区</li>
													<li>万载县</li>
													<li>丰城市</li>
													<li>樟树市</li>
													<li>高安市</li>
													<li>铜鼓县</li>
													<li>宜丰县</li>
													<li>奉新县</li>
													<li>靖安县</li>
													<li>上高县</li>
													<li>明月山</li>
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="cy3Font">选择产业</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part3">
												<ul id="cy3">
													<li>选择产业</li>
													<li>锂电产业</li>
													<li>医药产业</li>
													<li>机电产业</li>
													<li>食品产业</li>
													<li>建材产业</li>
													<li>纺织服装产业</li>
													<li>化工产业</li>
													<li>有色冶炼</li>
													<li>橡胶塑料制品</li>
													<li>金属制品</li>
													<li>电子信息产业</li>
													<li>先进装备制造产业</li>
													<li>其它产业</li>
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="lv3Font">选择级别</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part3">
												<ul id="lv3">
													<li>选择级别</li>
													<li>省级</li>
													<li>市级</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="qycx-charts">
									<div id="chart3-3" style="width: 100%;height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="spanStyle" style="width: calc(70% - 10px);">
						<div class="boxStyleBg" style="padding: 15px 20px;">
							<div class="left-top-radius"></div>
							<div class="left-bottom-radius"></div>
							<div class="right-top-radius"></div>
							<div class="right-bottom-radius"></div>
							<div class="top-line"></div>
							<div class="bottom-line"></div>
							<div class="left-line"></div>
							<div class="right-line"></div>
							<div class="industryDataBar">
								<div class="tab-links">
									<span class="on">各产业分布情况</span>
									<div class="fr selects wd33 textAlign" style="padding-top: 5px">
										<div class="select ">
											<p><font id="lv4Font">选择级别</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part4">
												<ul id="lv4">
													<li>选择级别</li>
													<li>省级</li>
													<li>市级</li>
												</ul>
											</div>
										</div>
										<div class="select ">
											<p><font id="qx4Font">选择区县</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part4">
												<ul id="qx4">
													<li>选择区县</li>
													<li>市本级</li>
													<li>袁州区</li>
													<li>经开区</li>
													<li>万载县</li>
													<li>丰城市</li>
													<li>樟树市</li>
													<li>高安市</li>
													<li>铜鼓县</li>
													<li>宜丰县</li>
													<li>奉新县</li>
													<li>靖安县</li>
													<li>上高县</li>
													<li>明月山</li>
												</ul>
											</div>
										</div>
										<div class="select ">
											<p><font id="year4Font">选择年份</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part4">
												<ul id="year4" class="yearUl">
													<li>选择年份</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="qycx-charts2">
										<div id="chart3-4" style="width: 100%;height: 100%;"></div>
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
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/liData.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/number.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script type="text/javascript">
$(function () {
	getselectYear();
	$(".head>a:eq(4)").addClass("on");
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var ind=$(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		if(ind==0){
			window.location.href = "${ctx}/front/cityDataCenter/ycIndex/19?orgId=3609009";
		}else if(ind==1){
			window.location.href = "${ctx}/front/cityDataCenter/ycIndex/20?orgId=3609009";
		}else if(ind==2){
			window.location.href = "${ctx}/front/cityDataCenter/ycIndex/21?orgId=3609009";
		}else{
			window.location.href = "${ctx}/front/cityDataCenter/ycIndex/22?orgId=3609009";
		}
		
	})
	//下拉框点击事件
	$(".select p").on("click",function(){
		$(this).next().slideToggle();
	});
	getSumData();
	getLevelData();
	getSpaceData();
	getYearData();
	getIndustryData();
});

//设置年份及年月点击事件
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    for(var i=y; i>y-4;i--){
    	$('.select .yearUl').append('<li>'+i+'</li>');
    }
    
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		var id=$(this).parent().attr('id');
		// console.log(id);
		$('#'+id+'Font').text($(this).text());
		$('#'+id+'val').val($(this).text());
		if($(this).parents('.select-items').hasClass('part1')){
			getLevelData();
		}else if($(this).parents('.select-items').hasClass('part2')){
			getSpaceData();
		}else if($(this).parents('.select-items').hasClass('part3')){
			getYearData();
		}else if($(this).parents('.select-items').hasClass('part4')){
			getIndustryData();
		}
	})
}

function getSumData(){
	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/project/summary/counts",
		type:"post",
		async: false,
		data : {
		},
		dataType : "json",
		success : function(result){
			console.log(result);
			if(result.project!=''&& result.project!=null && result.project!=undefined){
				$("#kcpt").text(result.project);
			}else{
				$("#kcpt").text('未公布');
			}
			if(result.trademark!=''&& result.trademark!=null && result.trademark!=undefined){
				$("#cmsb").text(result.trademark);
			}else{
				$("#cmsb").text('未公布');
			}
			if(result.academician!=''&& result.academician!=null && result.academician!=undefined){
				$("#ysgzz").text(result.academician);
			}else{
				$("#ysgzz").text('未公布');
			}
			if(result.patent!=''&& result.patent!=null && result.patent!=undefined){
				$("#zl").text(result.patent);
			}else{
				$("#zl").text('未公布');
			}
		},
		error : function(e) {
			alert(e)
		}
	})
}

function getLevelData(){
	var spaceName=$('#qx1val').val();
	var industryName=$('#cy1val').val();
	var year;

	if($('#qx1val').val()=='选择区县'){
		spaceName='';
		$('#qx1val').val('')
	}
	if($('#cy1val').val()=='选择产业'){
		industryName='';
		$('#cy1val').val('')
	}
	if($('#year1val').val()!='' && $('#year1val').val()!='选择年份'){
		year=$('#year1val').val();
	}
	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/academician/summary/data",
		type:"post",
		async: false,
		data : {
			// platformLevel:platformLevel,
			spaceName:spaceName,
			industryName:industryName,
			year:year,
			status:0,
		},
		dataType : "json",
		success : function(result){
			console.log(result);
			var data=result.platformLevel;
			var havedata=false;
			for(var i=0;i<data.length;i++){
				if(data[i].value>0){
					havedata=true;
				}
			}
			if(havedata){
				$("#chart3-1").show();
				getPie("chart3-1",data);
				$("#chart3-1").siblings('.nodata').remove();
			}else{
				var _div='<font class="nodata">暂无数据</font>'
				$("#chart3-1").parent().append(_div);
				$("#chart3-1").hide();
			}
		},
		error : function(e) {
			alert(e)
		}
	})
}


function getSpaceData(){
	var platformLevel='';
	var industryName=$('#cy2val').val();
	var year;

	if($('#lv2val').val()=='省级'){
		platformLevel=0;
	}else if($('#lv2val').val()=='市级'){
		platformLevel=1;
	}
	if($('#cy2val').val()=='选择产业'){
		industryName='';
		$('#cy2val').val('')
	}
	if($('#year2val').val()!='' && $('#year2val').val()!='选择年份'){
		year=$('#year2val').val();
	}

	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/academician/summary/data",
		type:"post",
		async: false,
		data : {
			platformLevel:platformLevel,
			// spaceName:spaceName,
			industryName:industryName,
			year:year,
			status:1,
		},
		dataType : "json",
		success : function(result){
			console.log(result);
			var spacedata='';
			if(result.spaceName!=''&&result.spaceName!=null && result.spaceName!=undefined){
				spacedata=result.spaceName;
				var data=[],x=[];
				var havedata=false;
				for(var i=0;i<spacedata.length;i++){
					x[i]=spacedata[i].name;
					data[i]=spacedata[i].value;
					if(data[i]>0){
						havedata=true;
					}
				}
				
				if(havedata){
					$("#chart3-2").show();
					getBar('chart3-2',1,2,data,x);
					$("#chart3-2").siblings('.nodata').remove();
				}else{
					var _div='<font class="nodata">暂无数据</font>'
					$("#chart3-2").parent().append(_div);
					$("#chart3-2").hide();
				}
			}else{
				var _div='<font class="nodata">暂无数据</font>'
				$("#chart3-2").parent().append(_div);
				$("#chart3-2").hide();
			}
		},
		error : function(e) {
			alert(e)
		}
	})
}

function getYearData(){
	var platformLevel='';
	var spaceName=$('#qx3val').val();
	var industryName=$('#cy3val').val();
	
	if($('#lv3val').val()=='省级'){
		platformLevel=0;
	}else if($('#lv3val').val()=='市级'){
		platformLevel=1;
	}else{
		platformLevel='';
	}
	if($('#qx3val').val()=='选择区县'){
		spaceName='';
		$('#qx3val').val('')
	}
	if($('#cy3val').val()=='选择产业'){
		industryName='';
		$('#cy3val').val('')
	}
	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/academician/summary/data",
		type:"post",
		async: false,
		data : {
			platformLevel:platformLevel,
			spaceName:spaceName,
			industryName:industryName,
			// year:year,
			status:2,
		},
		dataType : "json",
		success : function(result){
			console.log(result);
			var yeardata='';
			if(result.yearCaliber!=''&&result.yearCaliber!=null && result.yearCaliber!=undefined){
				yeardata=result.yearCaliber;
				var data=[],x=[];
				var havedata=false;
				for(var i=0;i<yeardata.length;i++){
					x[i]=yeardata[i].name;
					data[i]=yeardata[i].value;
					if(data[i]>0){
						havedata=true;
					}
				}
				if(havedata){
					$("#chart3-3").show();
					getBar2('chart3-3',data,x);
					$("#chart3-3").siblings('.nodata').remove();
				}else{
					var _div='<font class="nodata">暂无数据</font>'
					$("#chart3-3").parent().append(_div);
					$("#chart3-3").hide();
				}
			}else{
				var _div='<font class="nodata">暂无数据</font>'
				$("#chart3-3").parent().append(_div);
				$("#chart3-3").hide();
			}
		},
		error : function(e) {
			alert(e)
		}
	})
}

function getIndustryData(){
	var platformLevel='';
	var spaceName=$('#qx4val').val();
	var year;

	if($('#year4val').val()!='' && $('#year4val').val()!='选择年份'){
		year=$('#year4val').val();
	}
	if($('#lv4val').val()=='省级'){
		platformLevel=0;
	}else if($('#lv4val').val()=='市级'){
		platformLevel=1;
	}else{
		platformLevel='';
	}
	if($('#qx4val').val()=='选择区县'){
		spaceName='';
		$('#qx4val').val('')
	}

	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/academician/summary/data",
		type:"post",
		async: false,
		data : {
			platformLevel:platformLevel,
			spaceName:spaceName,
			// industryName:industryName,
			year:year,
			status:3,
		},
		dataType : "json",
		success : function(result){
			console.log(result);
			var industrydata='';
			if(result.industryName!=''&&result.industryName!=null && result.industryName!=undefined){
				industrydata=result.industryName;
				var data=[],x=[];
				var havedata=false;
				for(var i=0;i<industrydata.length;i++){
					x[i]=industrydata[i].name;
					data[i]=industrydata[i].value;
					if(data[i]>0){
						havedata=true;
					}
				}
				if(havedata){
					$("#chart3-4").show();
					getBar('chart3-4',2,1,data,x);
					$("#chart3-4").siblings('.nodata').remove();
				}else{
					var _div='<font class="nodata">暂无数据</font>'
					$("#chart3-4").parent().append(_div);
					$("#chart3-4").hide();
				}
			}else{
				var _div='<font class="nodata">暂无数据</font>'
				$("#chart3-4").parent().append(_div);
				$("#chart3-4").hide();
			}
		},
		error : function(e) {
			alert(e)
		}
	})
}

function getPie(id,data){

	var div_ = document.getElementById(id);
	div_.removeAttribute("_echarts_instance_");
	var chart = echarts.init(div_);
	var fz = 14;
	var theradius='70%';
	var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    if(width <= 1600){
		fz = 12;
		theradius='65%'
	}
	if(width <= 1440){
		theradius='52%'
	}
    if(width <= 1366){
    	fz = 10;
	}
	for(var i=0;i<data.length;i++){
		if(data[i].value==0){
			data[i].value=null
		}
	}
	var option = {
		// backgroundColor: 'rgba(0,6,28,.9)',
	    tooltip : {
	    	show: true,
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
			formatter: "{b}\n {d}%  ({c})",
	    },
		series: [
			{
	 	        type: "pie",
		        radius: ['0', theradius],
		        center: ["50%", "50%"],
				color: ['#48A1FF', '#FFE840', '#3F95F6','#9ED0FA','#89F1AA'],
				startAngle:110,
		        label: {
		            normal: {
		                show: true,
		                formatter: "{b}\n {d}%  ({c})",
						fontSize: fz,
						color:'#fff'
		            },
		            emphasis: {
		                show: true
		            }
		        },
		        labelLine: {
		            normal: {
		                show: true,
		                smooth: false,
		                length: 2,
		                length2: 10
		            },
		            emphasis: {
		                show: true
		            }
				},
				data:data
			}
		]
	}
	chart.clear();
    chart.setOption(option);
}

function getBar(id,type1,type2,data,x){
	var div_ = document.getElementById(id);
	div_.removeAttribute("_echarts_instance_");
	var chart = echarts.init(div_);
	var color1='',color2='';
	var rotate=0;
	if(type1==1){
		color1='#FFD154',color2='#FF903E';
	}else{
		color1='#67F8B3',color2='#05A6FC';
	}
	if(type2==1){
		rotate=35;
	}
	var barOption = {
		tooltip: {
			trigger: "axis",
			axisPointer: {
				type: "shadow",
			},
		},
		legend: {
			show: false,
			data: [],
			align: 'right',
			right: 10,
			itemWidth: 10,
			itemHeight: 10,
			itemGap: 35,
			textStyle: {
				color: "#fff"
			},
		},
		grid: {
			top: '40',
			left: '5',
			right: '5',
			bottom: '10',
			containLabel: true
		},
		xAxis: {
			type: 'category',
			data: x,
			axisLine: {
				lineStyle: {
					color: '#57617B'
				}
			},
			splitLine: {
				lineStyle: {
					color: '#57617B'
				}
			},
			axisTick: {
				show: false
			},
			splitArea: {
				show: false
			},
			axisLabel: {
				interval: 0,
				color: '#83ADBA',
				rotate:rotate
			},
		},
		yAxis: [{
			type : 'value',
			axisLabel : {
				formatter : '{value}'
			},
			axisLine : {
				show : false,
				lineStyle: {
					color: '#83adba'
				}
			},
			axisTick : {
				show : false
			},
			splitLine: {
				lineStyle: {
					color: '#57617B'
				}
			},
			splitArea: {
				show: false
			},
		}],
		series: [{
			name: '产业项目数量',
			type: "bar",
			barWidth:'20',
			barGap: 1,
			itemStyle: {
				normal: {
					color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
								offset: 0,
								color: color1
							},{
								offset: 1,
								color: color2
							}]),
					opacity: 1,
				}
			},
			data: data,
		}]
	}
	chart.setOption(barOption);
}

function getBar2(id,data,x){
	var div_ = document.getElementById(id);
	div_.removeAttribute("_echarts_instance_");
	var chart = echarts.init(div_);
	var rotate=0;
	var color1='#FFD154',color2='#FF903E';
	var end=data.length-1;
	var start=end-4;
	var barOption = {
		tooltip: {
			trigger: "axis",
			axisPointer: {
				type: "shadow",
			},
		},
		legend: {
			show: false,
			data: [],
			align: 'right',
			right: 10,
			itemWidth: 10,
			itemHeight: 10,
			itemGap: 35,
			textStyle: {
				color: "#fff"
			},
		},
		grid: {
			top: '40',
			left: '5',
			right: '5',
			bottom: '10',
			containLabel: true
		},
		xAxis: {
			type: 'category',
			data: x,
			axisLine: {
				lineStyle: {
					color: '#57617B'
				}
			},
			splitLine: {
				lineStyle: {
					color: '#57617B'
				}
			},
			axisTick: {
				show: false
			},
			splitArea: {
				show: false
			},
			axisLabel: {
				interval: 0,
				color: '#83ADBA',
				rotate:rotate
			},
		},
		yAxis: [{
			type : 'value',
			axisLabel : {
				formatter : '{value}'
			},
			axisLine : {
				show : false,
				lineStyle: {
					color: '#83adba'
				}
			},
			axisTick : {
				show : false
			},
			splitLine: {
				lineStyle: {
					color: '#57617B'
				}
			},
			splitArea: {
				show: false
			},
		}],
		dataZoom: [{
      		"type": "inside",
			"show": true,
			"startValue": start,
			"endValue": end,
			"handleStyle":8
		}],
		series: [{
			name: '产业项目数量',
			type: "bar",
			barWidth:'20',
			barGap: 1,
			itemStyle: {
				normal: {
					color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
								offset: 0,
								color: color1
							},{
								offset: 1,
								color: color2
							}]),
					opacity: 1,
				}
			},
			data: data,
		}]
	}
	chart.setOption(barOption);
}
</script>
</html>