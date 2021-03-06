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
	<link href="${ctx}/static/css/cityDataCenter/fourthSite.css" rel="stylesheet">
	<title>宜春大数据企业创新信息</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="${orgId}">
		<input type="hidden" id="qx1val" name="qx1val" value="">
		<input type="hidden" id="gs1val" name="gs1val" value="">
		<input type="hidden" id="year1val" name="year1val" value="">

		<input type="hidden" id="qx2val" name="qx2val" value="">
		<input type="hidden" id="gs2val" name="gs2val" value="">
		<input type="hidden" id="type2val" name="type2val" value="">

		<input type="hidden" id="type3val" name="type3val" value="">
		<input type="hidden" id="qx3val" name="qx3val" value="">
		<input type="hidden" id="year3val" name="year3val" value="">

		<input type="hidden" id="type4val" name="type4val" value="">
		<input type="hidden" id="gs4val" name="gs4val" value="">
		<input type="hidden" id="qx4val" name="qx4val" value="">
	</form>
	<%@ include file="header.jsp"%>
	<div class="content fz0">
		<div class="pro-left">
			<ul class="production">
				<li class="first-li">
					<div class="product-type">企业统计</div>
				</li>
				<li class="first-li on">
					<div class="product-type">企业创新</div>
				</li>
				<li class="first-li"> 
					<div class="product-type">企业画像</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div class="nav-title">
				<div class="nav">	
					<div class="nav-text">
						<div class="tab-eightIndustry" style="margin: 0;">
							<span name="title" class="tabs">科创平台(<font id="kcpt"></font>)</span>
							<span name="title" class="tabs">驰名商标(<font id="cmsb"></font>)</span>
							<span name="title" class="tabs">院士工作站(<font id="ysgzz"></font>)</span>
							<span name="title" class="tabs on">专利(<font id="zl"></font>)</span>
						 </div>
					</div>
				</div> 
			</div>
			<div class="cxtabs on" id="tab4">
				<div class="blockStyle" style="height: 50%;">
					<div class="spanStyle" style="width: calc(30% - 5px)">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="industryDataBar">
								<div class="tab-links">
									<span class="on">各专利类型分布情况</span>
										
								</div>
								<div class="tab-links">
									<div class="selects wd33 textAlign" >
										<div class="select">
											<p><font id="qx1Font">选择区县</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part1">
												<ul id="qx1">
													<li>选择区县</li>
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
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="gs1Font">选择专利归属</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part1">
												<ul id="gs1">
													<li>选择专利归属</li>
													<li>企业</li>
													<li>个人</li>
													<li>大专院校</li>
													<li>机关团体</li>
													<li>科研机构</li>
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
								<div class="qycx-charts" >
									<div id="chart4-1" style="width: 100%;height: 100%;"></div>
									<div class="progressPieTip" style="display: none;"><span id="total">1076.92</span><br>总数</div>
								</div>
							</div>
						</div>
					</div>
					<div class="spanStyle" style="width: calc(40% - 20px);">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="industryDataBar">
								<div class="tab-links">
									<span class="on">评定年份分布情况</span>
										
								</div>
								<div class="tab-links">
									<div class="selects wd33 textAlign" >
										<div class="select">
											<p><font id="qx2Font">选择区县</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part2">
												<ul id="qx2">
													<li>选择区县</li>
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
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="gs2Font">选择专利归属</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part2">
												<ul id="gs2">
													<li>选择专利归属</li>
													<li>企业</li>
													<li>个人</li>
													<li>大专院校</li>
													<li>机关团体</li>
													<li>科研机构</li>
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="type2Font">选择类型</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part2">
												<ul id="type2">
													<li>选择类型</li>
													<li>发明</li>
													<li>实用新型</li>
													<li>外观设计</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="qycx-charts">
									<div id="chart4-2" style="width: 100%;height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="spanStyle" style="width: calc(30% - 5px)">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="industryDataBar">
								<div class="tab-links">
									<span class="on">各专利权人类型分布情况</span>
										
								</div>
								<div class="tab-links">
									<div class="selects wd33 textAlign" >
										<div class="select">
											<p><font id="qx3Font">选择区县</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part3">
												<ul id="qx3">
													<li>选择区县</li>
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
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="type3Font">选择类型</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part3">
												<ul id="type3">
													<li>选择类型</li>
													<li>发明</li>
													<li>实用新型</li>
													<li>外观设计</li>
												</ul>
											</div>
										</div>
										<div class="select">
											<p><font id="year3Font">选择年份</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part3">
												<ul id="year3" class="yearUl">
													<li>选择年份</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="qycx-charts">
										<div id="chart4-3" style="width: 100%;height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="blockStyle" style="height: calc(50% - 10px);">
					<div class="spanStyle" style="width: 100%;">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="industryDataBar">
								<div class="tab-links">
									<span class="on">各区县分布情况</span>
									<div class="fr selects wd33 textAlign" style="padding-top: 5px">
										<div class="select ">
											<p><font id="type4Font">选择类型</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part4">
												<ul id="type4">
													<li>选择类型</li>
													<li>发明</li>
													<li>实用新型</li>
													<li>外观设计</li>
												</ul>
											</div>
										</div>
										<div class="select ">
											<p><font id="gs4Font">选择专利归属</font><i class="fa fa-caret-down"></i></p>
											<div class="select-items part4">
												<ul id="gs4">
													<li>选择专利归属</li>
													<li>企业</li>
													<li>个人</li>
													<li>大专院校</li>
													<li>机关团体</li>
													<li>科研机构</li>
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
									<div id="chart4-4" style="width: 100%;height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/liData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script type="text/javascript">
$(function () {
	getselectYear();
	$(".head>a:eq(5)").addClass("on");
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var ind=$(this).index();
		if(ind==0){
			$(this).addClass("on").siblings().removeClass("on");
			window.location.href = "${ctx}/front/cityDataCenter/ycFourth/9?orgId=3609009";
		}else if(ind==1){
			$(this).addClass("on").siblings().removeClass("on");
			window.location.href = "${ctx}/front/cityDataCenter/ycFourth/19?orgId=3609009";
		}else if(ind==2){
			alert('建设中！');
		}
	});
	//顶部二级菜单栏
	$(".tabs").on("click",function(){
		var ind=$(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		if(ind==0){
			checkRight('19','','index5_code3','企业创新-科创平台')
		}else if(ind==1){
			checkRight('20','','index5_code4','企业创新-驰名商标')
		}else if(ind==2){
			checkRight('21','','index5_code5','企业创新-院士工作站')
		}else{
			checkRight('22','','index5_code6','企业创新-专利')
		}
	})
	//下拉框点击事件
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
	getSumData();
	getTypeData();
	getYearData();
	getPatenterTypeData();
	getSpaceData();
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
			getTypeData();
		}else if($(this).parents('.select-items').hasClass('part2')){
			getYearData();
		}else if($(this).parents('.select-items').hasClass('part3')){
			getPatenterTypeData();
		}else if($(this).parents('.select-items').hasClass('part4')){
			getSpaceData();
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


function getTypeData(){
	var spaceName=$('#qx1val').val();
	var patenterType='';
	var year;

	if($('#qx1val').val()=='选择区县'){
		spaceName='';
		$('#qx1val').val('')
	}
	if($('#gs1val').val()=='选择专利归属'){
		patenterType='';
		$('#gs1val').val('')
	}else if($('#gs1val').val()=='企业'){
		patenterType=1;
	}else if($('#gs1val').val()=='个人'){
		patenterType=2;
	}else if($('#gs1val').val()=='大专院校'){
		patenterType=3;
	}else if($('#gs1val').val()=='机关团体'){
		patenterType=4;
	}else if($('#gs1val').val()=='科研机构'){
		patenterType=5;
	}
	if($('#year1val').val()!='' && $('#year1val').val()!='选择年份'){
		year=$('#year1val').val();
	}

	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/patent/summary/data",
		type:"post",
		async: false,
		data : {
			patenterType:patenterType,
			spaceName:spaceName,
			year:year,
			status:0,
		},
		dataType : "json",
		success : function(result){
			console.log(result);
			if(result.type!=''&& result.type!=undefined &&result.type!=null){
				var progreassPielist=result.type;
				var total=0;
				for(var i=0;i<progreassPielist.length;i++){
					total+=progreassPielist[i].value;
				}
				if(total==0){
					var _div='<font class="nodata">暂无数据</font>'
					$("#chart4-1").parent().append(_div);
					$("#chart4-1").hide();
					$(".progressPieTip").hide();
				}else{
					$("#chart4-1").show();
					getprogreassPie("chart4-1",progreassPielist);
					$(".progressPieTip").show();
					$("#total").text(total);
					$("#chart4-1").siblings('.nodata').remove();
				}
			}else{
				var _div='<font class="nodata">暂无数据</font>'
				$("#chart4-1").parent().append(_div);
				$("#chart4-1").hide();
				$(".progressPieTip").hide();
			}
		},
		error : function(e) {
			alert(e)
		}
	})
}

function getYearData(){
	var type='';
	var patenterType='';
	var spaceName=$('#qx2val').val();
	
	if($('#type2val').val()=='选择类型'){
		type='';
		$('#type2val').val('')
	}else if($('#type2val').val()=='发明'){
		type=1;
	}else if($('#type2val').val()=='实用新型'){
		type=2;
	}else if($('#type2val').val()=='外观设计'){
		type=3;
	}
	if($('#gs2val').val()=='选择专利归属'){
		patenterType='';
		$('#gs2val').val('')
	}else if($('#gs2val').val()=='企业'){
		patenterType=1;
	}else if($('#gs2val').val()=='个人'){
		patenterType=2;
	}else if($('#gs2val').val()=='大专院校'){
		patenterType=3;
	}else if($('#gs2val').val()=='机关团体'){
		patenterType=4;
	}else if($('#gs2val').val()=='科研机构'){
		patenterType=5;
	}
	if($('#qx2val').val()=='选择区县'){
		spaceName='';
		$('#qx2val').val('')
	}

	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/patent/summary/data",
		type:"post",
		async: false,
		data : {
			type:type,
			spaceName:spaceName,
			patenterType:patenterType,
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
					$("#chart4-2").show();
					getBar2('chart4-2',data,x);
					$("#chart4-2").siblings('.nodata').remove();
				}else{
					var _div='<font class="nodata">暂无数据</font>'
					$("#chart4-2").parent().append(_div);
					$("#chart4-2").hide();
				}
			}else{
				var _div='<font class="nodata">暂无数据</font>'
				$("#chart4-2").parent().append(_div);
				$("#chart4-2").hide();
			}
		},
		error : function(e) {
			alert(e)
		}
	})
}

function getPatenterTypeData(){
	var type='';
	var spaceName=$('#qx3val').val();
	var year;

	if($('#type3val').val()=='选择类型'){
		type='';
		$('#type3val').val('')
	}else if($('#type3val').val()=='发明'){
		type=1;
	}else if($('#type3val').val()=='实用新型'){
		type=2;
	}else if($('#type3val').val()=='外观设计'){
		type=3;
	}
	if($('#qx3val').val()=='选择区县'){
		spaceName='';
		$('#qx3val').val('')
	}
	if($('#year3val').val()!='' && $('#year3val').val()!='选择年份'){
		year=$('#year3val').val();
	}
	
	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/patent/summary/data",
		type:"post",
		async: false,
		data : {
			type:type,
			spaceName:spaceName,
			year:year,
			status:3,
		},
		dataType : "json",
		success : function(result){
			console.log(result);
			var data=result.patenterType;
			var havedata=false;
			for(var i=0;i<data.length;i++){
				if(data[i].value>0){
					havedata=true;
				}
			}
			if(havedata){
				$("#chart4-3").show();
				getPie("chart4-3",data);
				$("#chart4-3").siblings('.nodata').remove();
			}else{
				var _div='<font class="nodata">暂无数据</font>'
				$("#chart4-3").parent().append(_div);
				$("#chart4-3").hide();
			}
		},
		error : function(e) {
			alert(e)
		}
	})
}

function getSpaceData(){
	var type='';
	var patenterType='';
	var year;

	if($('#type4val').val()=='选择类型'){
		type='';
		$('#type4val').val('')
	}else if($('#type4val').val()=='发明'){
		type=1;
	}else if($('#type4val').val()=='实用新型'){
		type=2;
	}else if($('#type4val').val()=='外观设计'){
		type=3;
	}
	if($('#gs4val').val()=='选择专利归属'){
		patenterType='';
		$('#gs4val').val('')
	}else if($('#gs4val').val()=='企业'){
		patenterType=1;
	}else if($('#gs4val').val()=='个人'){
		patenterType=2;
	}else if($('#gs4val').val()=='大专院校'){
		patenterType=3;
	}else if($('#gs4val').val()=='机关团体'){
		patenterType=4;
	}else if($('#gs4val').val()=='科研机构'){
		patenterType=5;
	}
	if($('#year4val').val()!='' && $('#year4val').val()!='选择年份'){
		year=$('#year4val').val();
	}

	$.ajax({
		url: "${OfficeUrl}XOffice/interface/json/patent/summary/data",
		type:"post",
		async: false,
		data : {
			type:type,
			patenterType:patenterType,
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
					$("#chart4-4").show();
					getBar('chart4-4',1,2,data,x);
					$("#chart4-4").siblings('.nodata').remove();
				}else{
					var _div='<font class="nodata">暂无数据</font>'
					$("#chart4-4").parent().append(_div);
					$("#chart4-4").hide();
				}
			}else{
				var _div='<font class="nodata">暂无数据</font>'
				$("#chart4-4").parent().append(_div);
				$("#chart4-4").hide();
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

function getprogreassPie(id,data){
	var div_ = document.getElementById(id);
	div_.removeAttribute("_echarts_instance_");
	var chart = echarts.init(div_);
	var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	var fz = 14;
	var theradius1='50%';
	var theradius2='70%';
	for(var i=0;i<data.length;i++){
		if(data[i].value==0){
			data[i].value=null
		}
	}
    if(width <= 1600){
		fz = 12;
		theradius1='40%';
		theradius2='60%';
	}
	if(width <= 1440){
		theradius1='35%';
		theradius2='47%';
	}
    if(width <= 1366){
    	fz = 10;
    }
	var progressPieOption = {
		tooltip: {
			trigger: 'item'
		},
		grid: {
			top: '20%',
			left: '0%',
			right: '0%',
			bottom: '0%',
			containLabel: true
		},
		series: [{
			type: 'pie',
			radius : [theradius1, theradius2],
			center: ['50%', '50%'],
			color: ['#FCD44E', '#F46680', '#9860E7','#9ED0FA','#89F1AA'],
			clockwise: false,
			startAngle: 30,
			label: {
				formatter: "{b}\n {d}%({c})",
				color: '#fff',
				fontSize:fz
			},
			labelLine: {
				length: 10,
				length2: 10,
			},
			data:data
		}] 
	}
	chart.clear();
    chart.setOption(progressPieOption);
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
			name: '专利归属项目数量',
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
	if(start<0){
		start=0;
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
		dataZoom: [{
      		"type": "inside",
			"show": true,
			"startValue": start,
			"endValue": end,
			"handleStyle":8
		}],
		series: [{
			name: '专利归属项目数量',
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
// /interface/json/patent/summary/data

</script>
</html>