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
	<title>宜春工业大数据企业服务</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="${orgId}">
		<input type="hidden" id="spaceId" name="spaceId" value="">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
		<input type="hidden" id="quarter" name="quarter" value="">
	</form>
	<%@ include file="header.jsp"%>
	<div class="content p15 fz0">
	    <div class="blockStyle" style="height:66.66%;">
		<div class="spanStyle" style="width: 25%;">
			<div class="blockStyle" style="height:50%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption" onclick="goLogistics()" style="cursor: pointer;">物流服务</span>
					</div>
					<div class="tabContBar">
						<div class="logistics-main" onclick="goLogistics()">
						    <div class="grid-content grid-content1">
				              <p>用户数量(人)</p>
				              <h2 class="rT" id="count1"></h2>
				            </div>
				            <div class="grid-content grid-content2">
				              <p>平台车辆(辆)</p>
				              <h2 class="gT" id="count2"></h2>
				            </div>
				            <div class="grid-content grid-content3">
				              <p>订单交易量(单)</p>
				              <h2 class="bT" id="count3"></h2>
				            </div>
				            <div class="grid-content grid-content4">
				              <p>订单交易额(万元)</p>
				              <h2 class="yT" id="count4"></h2>
				            </div>
						</div>
					</div>
				</div>
	        </div>
	        <div class="blockStyle" style="height:calc(50% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption" onclick="toRecruit()" style="cursor: pointer;">本月用工需求分析</span>
						<div class="fr selects" id="firstTab000" style="position: absolute;right: 0;top: 2px;">
						    <div class="selects" style="display: inline-block;">
								<div class="select" style="padding: 0 8px;">
									<p><font id="selectYear"></font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul id="sy" style="text-align: left;">
											
										</ul>
									</div>
								</div>
							</div>
							<div class="selects" style="display: inline-block;">
								<div class="select" style="padding: 0 8px;">
									<p><font id="selectMonth"></font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul id="sm" style="text-align: left;">
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
					<div class="tabContBar">
						<div class="jobMapMain" style="height:100%">
							<div class="jobMap" id="jobMap"></div>
						</div>
					</div>
				</div>
	        </div>
		</div>
		<div class="spanStyle" style="width: calc(50% - 10px);">
			<div class="blockStyle" style="height: 100%;">
				<div id="map" style="width: 100%; height: 100%;">
				</div>
				<div class="map-areas" style="top: 20px;left: 20px;">
					<span style="cursor: pointer;">
						<h4>宜春市</h4>
					</span>
					<span>
						<h4>宜春市</h4>
					</span>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(25% - 10px);">
	        <div class="blockStyle" style="height: 50%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar cp">
						<span class="tabCaption" onclick="checkRight('10','','index4_code4','企业帮扶')">企业帮扶</span>
					</div>
					<div class="tabContBar">
						<div class="help-main">
							<div class="help-title fz0 logistics-item" onclick="checkRight('10','','index4_code4','企业帮扶')">
								<span class="logistics-span">
								  <h1>累计问题</h1>
								  <p class="rT" id="t1"></p>
								</span>
								<span class="logistics-span">
								  <h1>已解决问题</h1>
								  <p class="gT" id="t2"></p>
								</span>
							</div>
							<div class="helpMap" id="helpMap"></div>
						</div>
					</div>
				</div>
	        </div>
        	<div class="blockStyle" style="height:calc(50% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="serviceDisplayBar">
						<div class="serviceDisplay">
							<div class="serviceTitle">项目申报 - 累计历年</div>
							<div class="serviceCont">
								<div class="serviceContBox" id="hp">
									<div class="serviceContName">已获批(个)</div>
									<div class="serviceContValue"><i></i><span>322</span></div>
								</div>
								<div class="serviceContBox" id="hpzj">
									<div class="serviceContName">获批资金(亿元)</div>
									<div class="serviceContValue"><i></i><span>4.23</span></div>
								</div>
								<div class="serviceContBox" id="sq">
									<div class="serviceContName">申请中(个)</div>
									<div class="serviceContValue"><i></i><span>43</span></div>
								</div>
							</div>
						</div>
						<div class="serviceDisplay" style="font-size:0;">
							<div class="serviceTitle" style="display: inline-block;">标准厂房</div>
							<div class="selects" style="display: inline-block;">
								<div class="select">
									<p><font id="bzcf">2019</font><i class="fa fa-caret-down" style="margin-top: -4px;"></i></p>
									<div class="select-items">
										<ul id="bzcfUl">
										  <li>2019</li>
										  <li>2018</li>
										</ul>
									</div>
							   </div>
							</div>
							<div class="serviceCont">
								<div class="serviceContBox" id="qn">
									<div class="serviceContName">全年合计(m^2)</div>
									<div class="serviceContValue"><i></i><span id="span1">135.7</span><font>万</font></div>
								</div>
								<div class="serviceContBox" id="zt">
									<div class="serviceContName">主体竣工(m^2)</div>
									<div class="serviceContValue"><i></i><span id="span2">10.5</span><font>万</font></div>
								</div>
								<div class="serviceContBox" id="zj">
									<div class="serviceContName">在建(m^2)</div>
									<div class="serviceContValue"><i></i><span id="span3">125.2</span><font>万</font></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="barChart" class="serviceDisplayChart"></div>
      		</div>
			</div>
		</div>
	    <div class="blockStyle" style="height: calc(33.33% - 10px)">
			<div class="outsideBox">
				<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
				<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
				<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
				<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
		        <div class="tabCaptionBar">
					<span class="tabCaption">服务动态</span>
				</div>
				<div class="tabContBar">
			        <div class="bottom_main fz0">
			        	<div class="bottom-item">
			        		<span class="title-span" onclick='goProject("${ctx}/logistics/list?entranceId=3609009")'>物流服务</span>
			        		<div class="service-list">
			        			<div  class="scrollList" id="carList">
			        			</div>
			        		</div>
			        	</div>
			        	<div class="bottom-item before-item">
			        		<span class="title-span" onclick='goProject("${ctx}/yc/list?type=3&entranceId=3609009")'>用工动态</span>
			        		<div class="service-list">
			        			<div class="scrollList" id="jobList">
			        			</div>
			        			<div class="nodataDiv"  style="height: 100%;position: relative;display:none;">
			        				<font class="nodata" style="margin-left: -110px;">该区县未发布用工信息</font>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="bottom-item before-item">
			        		<span class="title-span" onclick='goProject("${ctx}/supply/list?entranceId=3609009")'>供需对接</span>
			        		<div class="service-list production-list">
				        		<div class="scrollList" id="supplyList">
				        		</div>
			        		</div>
			        	</div>
			        	<div class="bottom-item before-item">
			        		<span class="title-span" onclick='goProject("${ctx}/activity/list?entranceId=3609009")'>活动报名</span>
			        		<div class="service-list">
			        			<div  class="scrollList" id="helpList">
			        			</div>
			        		</div>
			        	</div>
			        </div>
		        </div>
			</div>
	    </div>
	</div>
	<form action="" method="post" id="detailForm" target="_blank">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type="hidden" id="info" name="info"/>
	</form>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script>
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
var loading = true;
$(function(){
	//初始化
	$(".head>a:eq(4)").addClass("on");
	$('#orgId').val('360900')
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
	getYcMap();
	getselectYear();
	getHelping();
	getWanjiCarList();
	setTimeout(function(){ getJobList();},700);
	setTimeout(function(){ getActivityList();},700);
	setTimeout(function(){getSupplyInList();},700);
	getJobCount();
    getData();
	
	$(".serviceCont>.serviceContBox").on("mouseenter",function(){
		if($(this).attr("id") == "qn" || $(this).attr("id") == "zt" || $(this).attr("id") == "zj"){
			$(this).addClass("on").siblings().removeClass("on");
			$("#barChart").show();
			barChart();
		}
	})
	$(".serviceCont>.serviceContBox").on("mouseleave",function(){
		$(".serviceCont>.serviceContBox").removeClass("on");
        $("#barChart").hide();
	})
	$(".map-areas span:eq(0)").on("click",function(){
		$(this).next().removeClass("on");
		$("#spaceId").val('');
		$("#orgId").val('360900');
		getHelping();
		getJobList();
		getJobCount();
	});
})
//设置年份及年月点击事件
function getselectYear(){
	var date = new Date();
	var y = date.getFullYear();
    for(var i=y; 2015<i+1;i--){
    	$('.select #sy').append('<li>'+i+'</li>');
    }
	$(".select li").on("click",function(){
		$(this).parents('.select-items').slideToggle();
		if($(this).parent().attr('id')=='sy'){
			//修改下拉组件默认值
 			$('#selectYear').text($(this).text());
			//修改隐藏属性
 			$('#year').val($(this).text());
 			getJobCount();
		}else if($(this).parent().attr('id')=='sm'){
			//修改下拉组件默认值
			$('#selectMonth').text($(this).text());
			//修改隐藏属性
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			if(month < 10){
				$("#month").val("0"+month);
			}else{
				$("#month").val(month);
			}
			getJobCount();
		}else if($(this).parent().attr('id')=='bzcfUl'){
			var text = $(this).text();
			$('#bzcf').text(text);
			if($('#bzcf').text()==2019){
				$('#span1').text('135.7');
				$('#span2').text('10.5');
				$('#span3').text('125.2');
			}else{
				$('#span1').text('266.6');
				$('#span2').text('109.1');
				$('#span3').text('157.5');
			}
			barChart();
		}
	})
}
  	function getData() {
		var param = {
			orgId: '${orgId}'
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/xzLogistics/logisticsData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				var d = result.data;
				countdown(d.data1.peopleNum,d.data1.carNum,d.data1.tradeNum,d.data1.turnoverNum);
			}
		})
  }
// 翻牌器
function countdown(members, cars, orderCounter, orderTradAmount) {
  $("#count1").rollNum({
    deVal: members,
    digit: members.toString().length
  });
  $("#count2").rollNum({
    deVal: cars,
    digit: cars.toString().length
  });
  $("#count3").rollNum({
    deVal: orderCounter,
    digit: orderCounter.toString().length
  });
  $("#count4").rollNum({
    deVal: orderTradAmount,
    digit: orderTradAmount.toString().length
  });
}
function getJobCount(){
	var curMonth = "";
	if($('#year').val() != "" && $('#month').val() != ""){
		var curMonth = $('#year').val()+"-"+$('#month').val();
	}
 	$.ajax({
		url:"${OfficeUrl}XOffice/interface/json/recruitInfo/jobCount",
		type:"get",
		data:{
			"orgId": $('#orgId').val(),
			"curMonth": curMonth
		},
		dataType:"json",
		success:function(result){
			if(result.success){
				if(!$.isEmptyObject(result.data)){
					if(loading){
						var date = result.curMonth.split("-");
						$('#selectYear').text(date[0]);
						$('#year').val(date[0]);
						if(date[1] < 10){
							$("#month").val(date[1]);
							$('#selectMonth').text(date[1].substring(1)+"月");
						}else{
							$("#month").val(date[1]);
							$('#selectMonth').text(date[1]+"月");
						}
						loading = false;
					}
					chartJobMap(result.data.series);
				}else{
					$("#jobMap").html("<font class=\"nodata\" style=\"margin-left: -120px;\">该区县本月未发布用工信息</font>");
				}
			}
		},
		error:function(){
		/* 	tips("请求超时，请稍后重试"); */
			},
		});
	
}
var data = [ 
	{name : '袁州区', value : "360902"},
	{name : '奉新县', value : "360921"}, 
	{name : '万载县', value : "360922"}, 
	{name : '上高县', value : "360923"}, 
	{name : '宜丰县', value : "360924"}, 
	{name : '靖安县', value : "360925"}, 
	{name : '铜鼓县', value : "360926"}, 
	{name : '丰城市', value : "360981"}, 
	{name : '樟树市', value : "360982"}, 
	{name : '高安市', value : "360983"} 
]
function getYcMap(){
	$.get('${ctx}/static/map/360900.json', function (chinaJson) {
	    echarts.registerMap('yc', chinaJson);
	    mapChart(data);
	});
}
function goProject(url){
	window.open(url,'_blank');
}
function getProjectList(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/companyProjectSupport/manageList",
		type : "post",
		data : {
 			"pageNum" : 1,
			"pageSize" : 20,
		},
		dataType : "json",
		success : function(result) {
			if(result.success){
				var infoList = result.list;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
	    			var _div = "";
	    			_div += '<div class="project-item">'
	    			_div += '<font class="projectListFT">'
	    			if(info.schedules == '评审中'){
		    			_div += '<font class="gT">[&nbsp;评审中&nbsp;]</font>'

	    			}else if(info.schedules =='已公示'){
		    			_div += '<font class="bT">[&nbsp;已公示&nbsp;]</font>'
	    			}
	    			_div +=  '<font class="projectName">&nbsp;'+info.projectName+'</font></font>'
	    		    _div += '</div>'
	    		    $('#projectList').append(_div);
				}	
			}
		},
		error:function(){
		/* 	tips("请求超时，请稍后重试"); */
			},
		});
}
function getActivityList(){
	$.ajax({
		url:"${ctx}/projectActivity/json/activityList",
		type:"get",
		data:{
				"pageNum":1,
				"pageSize":20,
				"fastQuery":1,
				"type":0,
				"statusArray":[0,1].toString()
			 },
		dataType:"json",
		success:function(result){
			var infoList = result.value;
			for (var j=0; j<2;j++){
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
	    			var _div = "";
	    			_div += "<a target='_blank' href='${ctx}/activity/detail/"+info.activityId+"?entranceId=3609009'>"
	    			_div += ' <div class="service-item" style="margin-top: 5px;">'
	    			_div += '<font class="activityTitleFT">'
	   				if(info.status==1){
		    			_div +=	'<font class="bT">&nbsp;[&nbsp;报名中&nbsp;]</font>'
					}else{
		    			_div +=	'<font class="graT">&nbsp;[&nbsp;已结束&nbsp;]</font>'
					}
	    			_div += '<font>&nbsp;'+info.activityName+'</font>'
	    			_div += '</font></div></a>'
		    		$('#helpList').append(_div);
				}
			}
		},
		error:function(){
		/* 	tips("请求超时，请稍后重试"); */
			},
		});
}
function getWanjiCarList(){
	var AdCode = 0;
	var TargetAdCode = 0;
	var TypeCode = -1;
	var CarLoadType = -1;
	$.ajax({
		url:"${ctx}/logistics/wanji/json/getPlatCar",
		type : "post",
		data : {
			'${_csrf.parameterName}':'${_csrf.token}',
			"Take" : 20,
			"Skip" : 0*20,
			"AdCode" : AdCode,
			"TargetAdCode" : TargetAdCode,
			"TypeCode" : TypeCode,
			"CarLoadType" : CarLoadType
		},
		dataType : "json",
		success : function(result) {
			var infoList = result.value;
			for (var j=0; j<2;j++){
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
	    			var _div = "";
	    			_div += '<div class="service-item" onclick="detail(this)" data='+JSON.stringify(info)+'>'
	    			_div += '<font class="jobTitleFT">'
	    			_div +=	'<font>【'+info.CurPlace+'】到【全国】</font><font class="yT">'+(info.CarTypeName==undefined?'':info.CarTypeName)+'&nbsp;&nbsp;'+(info.CarLoadTypeName==undefined?'':info.CarLoadTypeName)+'</font>'
	    			_div += '</font>'
	    			_div +=  '</div>'
	    			$('#carList').append(_div);
				}
			}
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function detail(obj){
	$("#info").val("("+$(obj).attr("data")+")");
	$("#detailForm").attr("action","${ctx}/logistics/detail?entranceId=3609009").submit();
}
function getSupplyInList(){
	$.ajax({
		url : "${ctx}/interface/json/showSupply/searchList",
		type : "post",
		data : {
			'${_csrf.parameterName}':'${_csrf.token}',
			"pageNum" : 1,
			"pageSize" : 20,
			"provinceName" : '江西省',
		},
		dataType : "json",
		success : function(result) {
			  if(result.success){
		    	  var infoList = result.supplyList; 
		    	  for (var j=0; j<2;j++){
		    			for(var i=0;i<infoList.length;i++){
			    			var info = infoList[i];
			    			var _div = "";
							_div += "<a target='_blank' href='${ctx}/supply/detail/"+info.id+"?entranceId=3609009'>"
			    			_div += ' <div class="service-item" style="border-bottom: 1px dashed #0d4170; padding-bottom: 5px;">'
			    			_div += '<font class="jobTitleFT">'
		    				if(info.type==0){
				    			_div +=	'<font class="bT">&nbsp;【&nbsp;求购&nbsp;】</font>'
							}else{
				    			_div +=	'<font class="bT">&nbsp;【&nbsp;供应&nbsp;】</font>'
							}
			    			_div += '<font class="left-span yT youxiaoFT">【长期有效】</font>'
			    			_div +=	'<font class="production-area">'+(info.provinceName==undefined?'':info.provinceName)+'&nbsp;'+(info.areaName==undefined?'':info.areaName)+'</font>'
			    			_div += '</font>'
			    			_div +=	'<p><font>&nbsp;'+info.productName+'</font>'
			    			_div += '</p></div></a>'
			    			$('#supplyList').append(_div);
			    		}
		    	  }

		      }
		},
		error : function() {
			//tips("请求超时，请稍后重试");
		},
	});
}
function goSupplyDetail(id){
	window.open("${ctx}/supply/detail/"+id+"?entranceId=${entranceId}",'blank');
}
function getJobList(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/recruitInfo/recruitList",
		type : "post",
		data : {
			"time": '',
 			"areaId": 360900,
 			"pageNum" : 1,
			"pageSize" : 20,
			"spaceId": $("#spaceId").val()
		},
		dataType : "json",
		success : function(result) {
		$('#jobList').empty();
	      if(result.success){
	    	  var infoList = result.value; 
	    	  if(infoList.length>0){
	    		  $(".nodataDiv").hide();
	    		   if(infoList.length>6){
	    				  for (var j=0; j<2;j++){
	  		    			for(var i=0;i<infoList.length;i++){
	  			    			var info = infoList[i];
	  			    			var _div = "";
	  			    			if(info.createKind==1){
	  				    			_div += '<a  target="_blank" href="${ctx}/yc/detail?type=3&id='+info.parkId+'&time='+info.recruitTime+'&entranceId=3609009">'
	  			    			}else{
	  			    				_div += '<a  target="_blank" href="'+info.recruitUrl+'">'
	  			    			}
	  			    			_div += '<div class="service-item" style="border-bottom: 1px dashed #0d4170; padding-bottom: 5px;">'
	  			    			_div += '<font class="jobTitleFT">'+info.recruitTitle+'</font>'
	  			    			if(info.recruitDetail){
	  			    				_div +=	'<p><font class="yT">招聘：'+info.recruitDetail+'</font>'
	  			    	    		_div +=	'</p>'
	  			    			}
	  			    			_div +=	'</div><a/>'
	  			    			$('#jobList').append(_div);
	  			    		}
	  		    	  }
	    		   }else{
	    				for(var i=0;i<infoList.length;i++){
			    			var info = infoList[i];
			    			var _div = "";
			    			if(info.createKind==1){
				    			_div += '<a  target="_blank" href="${ctx}/yc/detail?type=3&id='+info.parkId+'&time='+info.recruitTime+'&entranceId=3600009">'
			    			}else{
			    				_div += '<a  target="_blank" href="'+info.recruitUrl+'">'
			    			}
			    			_div += '<div class="service-item" style="border-bottom: 1px dashed #0d4170; padding-bottom: 5px;">'
			    			_div += '<font class="jobTitleFT">'+info.recruitTitle+'</font>'
			    			if(info.recruitDetail){
			    				_div +=	'<p><font class="yT">招聘：'+info.recruitDetail+'</font>'
			    	    		_div +=	'</p>'
			    			}
			    			_div +=	'</div><a/>'
			    			$('#jobList').append(_div);
			    		}
	    		   }
	    		  
	    	  }else{
	    		  $(".nodataDiv").show();
	    	  }
	    	  
	      }
		},
		error : function() {
		}
	});
}
function getHelping(){
	var param = {
		"realType" : 1,  //假数据为0，真数据为1
		"size": 5,
		"spaceId": $('#spaceId').val(),
		"areaId": '360900',
	};
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/companyAppeal/dataStatistics",
		type : "post",
	 	async: false,
		data : param,
		dataType : "json",
		success : function(result){
			if(result.success){
	 			$('#t1').text(result.total1);
	 			$('#t2').text(result.total2);
				var x = [],y1 = [],y2 = [];
				for(var key in result.map1){
					x.push(key);
					y1.push(result.map1[key]);
				}
				for(var key in result.map2){
					y2.push(result.map2[key]);
				}
				helpingMap(x,y1,y2);
			}
		},
		error : function() {
				//layerTips("校验权限异常");
		}
	});
};
function goLogistics(){
	checkRight('6','','index4_code2','物流服务')
}
function toRecruit(){
	checkRight('18','','index4_code3','用工分析')
}
function chartJobMap(data,legend){
	var div_ = document.getElementById("jobMap");
	div_.removeAttribute("_echarts_instance_");
	var chart = echarts.init(div_);
/* 	var chart = echarts.init(document.getElementById('jobMap'));
 */	 var fz = 16;
	  if(width <= 1600){
	    	fz = 12;
	    }
	    if(width <= 1440){
	    	fz = 10;
	    }
	    if(width <= 1366){
	    	fz = 10;
	   }
	var option = {
		/* 	title: {
				text :'月十大产业基地占比',
				x: "0",
			    textStyle: {
			            color: '#fff',
			            fontSize: '16'
			      },
		    }, */
			tooltip: {
		        trigger: 'item',
		        textStyle:{
					fontSize: fz,
				},
		        formatter: "{b}: {c} ({d}%)"
			},
		    /* legend: {
		        orient: 'horizontal',
		        top: 'center',
		        right: 'right',
		        icon:'roundRect',
		        textStyle: {
		            color: '#fff',
		        },
		        data: legend,
		    }, */
		    color:['#f845b3','#f845f1','#ad46f3','#5045f6','#4777f5',
                '#44aff0','#45dbf7','#f6d54a','#f69846','#ff4343'
               ],
		    series : [
		        {
		            type: 'pie',
		            radius : '75%',
		            center: ['50%', '55%'],
		            data: data,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
				         },
			            normal : {
				             label:{
				            	 textStyle:{
				            		  fontSize: fz,
						         },
				         	formatter: function(params) {
				         		var percent = 0;
			                    var total = 0;
			                    for (var i = 0; i < data.length; i++) {
			                        total += Number(data[i].value);
			                    }
			                    percent = ((params.value / total) * 100).toFixed(2);
			                    if(params.name !== '') {
			                        return params.name + '\n' + percent+'%';
			                    }else {
			                        return '';
			                    }
			                },
				             },
		            	  borderWidth:3,
				          borderColor:'#000f30',
			            },
		            }
		        }
		    ]
		};
	if(width<=1600){
		//option.title.textStyle.fontSize = 14;
	}
/* 	if(width<=1366){
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.textStyle.fontSize = 10;
		option.series[0].itemStyle.normal.label.textStyle.fontSize = 10;
	} */
	
	chart.setOption(option);

}
function helpingMap(x,d1,d2){
	var chart = echarts.init(document.getElementById('helpMap'));
    var fz = 16;
    var legend = 12;
    var xfz = 12;
    var t = 40;
    var t2 = 10;
    var rotate = 20;
    if(width <= 1600){
    	fz = 12;
    	t = 40;
    	rotate = 15;
    	legend = 10;
    	xfz = 10;
    }
    if(width <= 1440){
    	fz = 10;
    	t = 40;
    	legend = 10;
    	xfz = 10;
    }
    
    if(width <= 1366){
    	fz = 10;
    	t = 30;
    	t2 = 0;
    	legend = 8;
    	xfz = 8;
    }
	var option = {
			title : {
				show: true,
				text: 'Top前5',
				textStyle: {
					color : '#fff',
					fontSize: fz,
				},
				top: '0',
			},
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data:['累计问题', '已解决问题'],
		        top: t2,
		        textStyle: {
		            color: 'rgba(220,240,245,.5)',
		            fontSize: legend
		        }
		    },
		    grid: {
		        left:'2%',
		        right:'2%',
		        top: t,
		        bottom: 0,
		        containLabel:true
		    },
		    color: ['#dc1f54','#4ed673'],
		    xAxis : [
		        {
		            type: 'category',
		            axisLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            },
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: xfz,
		                formatter : function(a){
		                	if(a.length>4){
		                		return a.substring(0,4)+'...';
		                	}
		                	return a;
                        },
		                
		                
		            },
		            axisTick: {show: false},
		            data: x
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisTick: {
		                show: false
		            },
		            splitNumber: 3,
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz
		            },
		            splitLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            }
		        }
		    ],
		    series : [
		         {
		            name: '累计问题',
		            type: 'bar',
		            barWidth: 15,
		            data: d1
		        },
		        {
		            name: '已解决问题',
		            type: 'bar',
		            barWidth: 15,
		            data: d2
		        }
		    ]
		};
	if(width<=1440){
		option.title.top = -6;
		option.legend.left = 30;
	}
	if(width<=1366){
		option.legend.left = 50;
	}
    chart.setOption(option);
}
function appearMessage(num){
	myChart.dispatchAction({
		type: 'showTip',
	    // 系列的 index，在 tooltip 的 trigger 为 axis 的时候可选。
	    seriesIndex: 0,
	    // 数据的 index，如果不指定也可以通过 name 属性根据名称指定数据
	    dataIndex: num,
	    // 可选，数据名称，在有 dataIndex 的时候忽略
	    name: "",
	    // 本次显示 tooltip 的位置。只在本次 action 中生效。
	    // 缺省则使用 option 中定义的 tooltip 位置。
	    position: ""//Array.<number>|string|Function,
    });
	
	setTimeout(function(){
		myChart.dispatchAction({
		    type: 'hideTip'
		})
	},2000)
}

var myChart = "";
var toolTipHtml = "";
function mapChart(d1) {
	myChart = echarts.init(document.getElementById('map'));
    var fz = 12;
    var sz = 10;
    var ss = 45;
    if(width <= 1440){
    	fz = 12;
    	sz = 6;
        ss = 40;
    }
    if(width <= 1366){
    	fz = 10;
        ss = 35;
    }
    var option = {
   		tooltip : {
   			trigger : 'item',
   			triggerOn: 'none',
   			position: 'inside',
   			borderColor: '#FF4571',
   			borderWidth: 2,
   			formatter: function(params){
            	return toolTipHtml;
            },
   		},
           geo : {
               roam : true,
               map : 'yc',
               zoom : 1.2,
               aspectScale : 1,
               label : {
                   show : true,
                   textStyle : {
                       color : '#fff',
                       fontSize: fz
                   },
               },
               itemStyle: {
                   normal: {
                       borderColor: 'rgba(147, 235, 248, 1)',
                       borderWidth: 1,
                       areaColor: {
                           type: 'radial',
                           x: 0.5,
                           y: 0.5,
                           r: 0.8,
                           colorStops: [{
                               offset: 0, 
                               color: 'rgba(147, 235, 248, 0)' // 0% 处的颜色
                           }, {
                               offset: 1, 
                               color: 'rgba(147, 235, 248, .2)' // 100% 处的颜色
                           }],
                           globalCoord: false // 缺省为 false
                       },
                       shadowColor: 'rgba(128, 217, 248, 1)',
                       shadowOffsetX: -2,
                       shadowOffsetY: 2,
                       shadowBlur: 10
                   },
                   emphasis: {
                       areaColor: '#389BB7',
                       borderWidth: 0
                   }
               },
               selectedMode: 'single'
           },
           series : [{
   			type : 'map',
   			geoIndex : 0,
   			data : d1
           },{
               type : 'effectScatter',
               coordinateSystem : 'geo',
               data : yc,
               symbolSize : sz,
               showEffectOn : 'render',
               rippleEffect: {
                   period: 4,
                   scale: 4,
                   brushType: 'fill'
               },
               hoverAnimation : true,
               label : {
                   normal : {
   					formatter : '{b}',
   					position : 'right',
                       textStyle:{
                           color:'#fff'
                       }
                   }
               },
               itemStyle : {
                   normal : {
                       color : '#0de6e6',
                       shadowBlur : 10,
                       shadowColor : '#333'
                   }
               },
               zlevel : 1,
       		tooltip : { show: false}
           },]
    }
    myChart.setOption(option);
	myChart.on("click",function(params){
		if(params.seriesIndex == 0){//点击区块
    		//地图左上区域栏控制
    	 	if($("#orgId").val() == params.data.value){
				$("#orgId").val('360900');
				$(".map-areas span:eq(1)").removeClass("on");
			} else { 
				$("#orgId").val(params.data.value);
				$(".map-areas span:eq(1)").addClass("on").find("h4").text(params.data.name);
			}
    	 	if($("#spaceId").val() == params.data.value){
				$("#spaceId").val('');
				$(".map-areas span:eq(1)").removeClass("on");
			} else { 
				$("#spaceId").val(params.data.value);
				$(".map-areas span:eq(1)").addClass("on").find("h4").text(params.data.name);
			}
    	 	getJobCount();
    	 	getJobList();
    	 	getHelping();
    	}else if(params.seriesIndex == 1){//点击坐标点
    		
    	}else{}
	})

};
function barChart(){
	/* var div_ = document.getElementById("barChart");
	div_.removeAttribute("_echarts_instance_");
	var chart = echarts.init(div_); */
	var chart = echarts.init(document.getElementById('barChart'));
	var data1 = [];
	var data2 = [];
	var data3 = [];
	if($('#bzcf').text()==2019){
		data1 = ["10","","","11","12.4","10","20.5","13","20","21","17.8"];
		data2 = ["","","","","","","","","","6","4.5"];
		data3 = ["10","","","11","12.4","10","20.5","13","20","15","13.3"];
	}else{
		data1 = ["34","4","0","46.2","7","21.3","15.3","14","30.6","48.6","50"];
		data2 = ["19","2","0","22","0","0","0","14","14","12.1","26"];
		data3 = ["15","2","0","24.2","7","21.3","15.3","0","16.6","32.1","24"];
	}
	if($("#qn").hasClass("on")){
		barOption.series[0].data = data1
	}else if($("#zt").hasClass("on")){
		barOption.series[0].data = data2;
	}else if($("#zj").hasClass("on")){
		barOption.series[0].data = data3;
	}else{}
	
	chart.setOption(barOption);
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
        itemWidth: 10,
        itemHeight: 10,
        itemGap: 35,
        textStyle: {
            color: "#fff"
        },
    },
    grid: {
    	top: '20%',
    	left: '2%',
        right: '2%',
        bottom: '5%',
        containLabel: true
    },
    xAxis: {
        type: 'category',
        data: ["经开区","靖安县","铜鼓县","奉新县","高安市","袁州区","宜丰县","樟树市","丰城市","上高县","万载县"],
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
            rotate: 35
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
        name: '',
        type: "bar",
        barWidth: 10,
        barGap: 1,
        itemStyle: {
            normal: {
            	color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#FFD154'
                }, {
                    offset: 1,
                    color: '#FF903E'
                }]),
                opacity: 1,
            }
        },
        data: [],
    }]
}

function dateToTimeStr(str){
	  return formatDate(new Date(str), "MM-dd");
	}
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format) {
		return formatDate(new Date(strDate), format);
	}
	// 格式化日期,
	function formatDate(date, format) {
		var paddNum = function(num) {
			num += "";
			return num.replace(/^(\d)$/, "0$1");
		}
		// 指定格式字符
		var cfg = {
			yyyy : date.getFullYear(), // 年 : 4位
			yy : date.getFullYear().toString().substring(2),// 年 : 2位
			M : date.getMonth() + 1, // 月 : 如果1位的时候不补0
			MM : paddNum(date.getMonth() + 1), // 月 : 如果1位的时候补0
			d : date.getDate(), // 日 : 如果1位的时候不补0
			dd : paddNum(date.getDate()),// 日 : 如果1位的时候补0
			hh : paddNum(date.getHours()), // 时
			mm : paddNum(date.getMinutes()), // 分
			ss : paddNum(date.getSeconds())
		// 秒
		}
		format || (format = "yyyy-MM-dd hh:mm:ss");
		return format.replace(/([a-z])(\1)*/ig, function(m) {
			return cfg[m];
		});
	}
	//实时刷新
	var websocket = null;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
	    websocket = new WebSocket("${wsPath}");
	}
	else {
	    alert('当前浏览器 Not support websocket')
	}
	
	//连接发生错误的回调方法
	websocket.onerror = function (event) {
	    // alert("WebSocket连接发生错误" );
	     console.error("WebSocket连接发生错误:", event);
	};
	
	//连接成功建立的回调方法
	websocket.onopen = function () {
		//alert("WebSocket连接成功");
	}
	
	//接收到消息的回调方法
	websocket.onmessage = function (event) {
	    var json=JSON.parse(event.data); 
	    if(json.type=='showSupplyDemandSave' || json.type=='recruitInfoSave' ){ //供需，用工
		    for(var i=0;i<data.length;i++){
		    	var info = data[i];
		    	if(info.value == json.remark){
		    		toolTipHtml = json.data
		    		appearMessage(i);
		    	}
		    }
	    }   
	}
	
	//连接关闭的回调方法
	websocket.onclose = function () {
	//	alert("WebSocket连接关闭");
	}
	
	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function () {
	    closeWebSocket();
	}
	//关闭WebSocket连接
	function closeWebSocket() {
	    websocket.close();
	}
</script>
</html>