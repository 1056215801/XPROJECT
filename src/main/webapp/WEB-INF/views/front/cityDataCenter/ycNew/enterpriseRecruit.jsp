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
	<title>宜春工业大数据企业用工</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360900">
		<input type="hidden" id="spaceId" name="spaceId" value="">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
		<input type="hidden" id="region" name="region" value="宜春市">
	</form>
	<%@ include file="header.jsp"%>
	<div class="nav-title">
    	<div class="nav">
			<div class="nav-text">
				<div class="nav-titleName">
					<font>企业用工</font>
				</div>
				<div class="selects" style="display: inline-block;">
					<div class="select">
						<p><font id="selectYear">年</font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="sy">
								
							</ul>
						</div>
					</div>
				</div>
				<div class="selects" style="display: inline-block;">
					<div class="select">
						<p><font id="selectMonth">月</font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="sm">
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
	<div class="mainpage clear-box" style="height: -webkit-calc(100% - 130px); height: calc(100% - 130px);">
		<div class="logis-main mainfl" style="width: 25%;">
			<div class="countBox clear-box boxStyle" style="height: 50%;">
				<div class="boxStyleBg" style="padding: 15px 20px;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="tab-links">
						<span class="on">招聘的开发区</span>
						<span class="fr" style="color: #fff;border: 0;padding: 0;margin: 0; margin-right: 10px;">数量</span>
					</div>
					<div  class="tabs">
						<div class="tab">
							<div class="industry-list" id="developList" style="max-height: 100%;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="boxStyle" style="height: calc(50% - 10px); margin-top: 10px;">
				<div class="boxStyleBg" style="padding: 15px 20px;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="tab-links">
						<span class="on">招聘的企业</span>
						<span class="fr" style="color: #fff;border: 0;padding: 0;margin: 0; margin-right: 10px;">数量</span>
					</div>
					<div  class="tabs">
						<div class="tab">
							<div class="industry-list" id="enterpriseList" style="max-height: 100%;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="logis-main maincenter" style="width: 50%;">
			<div class="boxStyle" style="height: 100%;">
				<div class="recruitTitleBar">
					<div class="recruitTitle">本月招聘需求量</div>
					<div class="recruitLine clearfix">
						<div class="line1"></div>
						<div class="line2"></div>
					</div>
				</div>
				<div class="dataBrandBar" style="top: 30px;">
					<div class="dataBrand" style="padding-left: 20px; width: calc(40% - 3px);">
						<div class="dataBrandName">招聘人数</div>
						<div class="dataBrandValue" id="peopleNum"></div>
					</div>
					<div class="dataBrand" style="padding-left: 20px; width: calc(30% - 3px);">
						<div class="dataBrandName">涉及企业数</div>
						<div class="dataBrandValue" id="enterpriseNum"></div>
					</div>
					<div class="dataBrand" style="padding-left: 20px; width: calc(30% - 3px);">
						<div class="dataBrandName">涉及开发区数</div>
						<div class="dataBrandValue" id="developNum"></div>
					</div>
				</div>
				<div id="map" style="width: 100%; height: calc(100% - 30px - 86px); margin-top: 86px;"></div>
				<div class="map-areas" style="top: 120px !important; left: 20px !important;">
					<span style="cursor: pointer;">
						<h4>宜春市</h4>
					</span>
					<span>
						<h4>宜春市</h4>
					</span>
				</div>
			</div>
		</div>
		<div class="logis-main mainfr" style="width: 25%;">
			<div class="countBox clear-box boxStyle" style="height: 50%;">
				<div class="boxStyleBg" style="padding: 15px 20px;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<!-- <div class="top-line"></div> -->
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit">
						<span>本月用工需求分析</span>
					</div>
					<div class="jobMap" id="jobMap" style="height: 100%;"></div>
				</div>
			</div>
			<div class="boxStyle" style="height: calc(50% - 10px); margin-top: 10px;">
				<div class="boxStyleBg" style="padding: 15px 20px;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="top-line"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="tab-links" id="firstTab">
						<span id="dt" class="on">招聘岗位动态</span>
						<span id="yb">招聘月报</span>
					</div>
					<div class="tabs">
						<div class="tab" id="firstTab0"><!-- postList -->
			        		<div class="service-list" style="height: 100%;margin-top: 0;">
			        			<div class="scrollList" id="postList">
			        			</div>
			        			<div id="nodataDiv1" class="nodataDiv"  style="height: 100%;position: relative;display:none;">
			        				<font class="nodata" style="margin-left: -110px;">该区县未发布用工信息</font>
			        			</div>
			        		</div>
						</div>
						<div class="tab" id="firstTab1" style="display: none;"><!-- reportList -->
			        		<div class="service-list" style="height: 100%;margin-top: 0;">
			        			<div class="scrollList" id="reportList">
			        			</div>
			        			<div id="nodataDiv2" class="nodataDiv"  style="height: 100%;position: relative;display:none;">
			        				<font class="nodata" style="margin-left: -110px;">该区县未发布用工信息</font>
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
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script>
$(function(){
	$(".head>a:eq(3)").addClass("on");
	//初始化
	getYcMap();
	getselectYear();
	getRealTimeData();
	getPostList();
	//getReportList();
	//getPieChart();
	
	//下拉框点击事件
	$(".select p").on("click",function(){
		$(this).next().slideToggle();
	})
	$(".map-areas span:eq(0)").on("click",function(){
		$(this).next().removeClass("on");
		$("#orgId").val('360900');
		getRealTimeData();
		//getPieChart();
		if($("#dt").hasClass("on")){
			getPostList();
		}else if($("#yb").hasClass("on")){
			getReportList();
		}else{}
	});
	$("#firstTab span").on("click",function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$(this).parent().next().find(".tab").fadeOut("fast");
		$("#type").val(ind+1);
		setTimeout(function(){
			$("#firstTab"+ind).fadeIn("fast");
			if(ind = 0){
				getPostList();
			}else{
				getReportList();
			}
		},210);
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
		}else if($(this).parent().attr('id')=='sm'){
			//修改下拉组件默认值
			$('#selectMonth').text($(this).text());
			//修改隐藏属性
			var month = $(this).text();
			month = month.substring(0,month.lastIndexOf('月'))
			$('#month').val(month);
		}else{}
		getRealTimeData();
		//getPieChart();
	})
}
function getRealTimeData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/recruitInfo/recountCount",
		type : "post",
		data : {
			"orgId" : $('#orgId').val(),
			"year" : $('#year').val(),
			"month" : $('#month').val()
		},
		success : function(result) {
			console.log($('#orgId').val())
			console.log(result)
			if (result.success) {
				var date = result.dateStr.split("-");
				$('#selectYear').text(date[0]+"年");
				$('#selectMonth').text(date[1]+"月");
				$('#year').val(date[0]);
				$('#month').val(date[1]);
				
				var num = result.data.totalNum;
				$("#peopleNum").empty();
				if(num.RECRUIT_TOTAL != "" && num.RECRUIT_TOTAL != undefined){
					$("#peopleNum").rollNum({
				    	deVal: num.RECRUIT_TOTAL,
				    	digit: num.RECRUIT_TOTAL.toString().length
				    });
				}else{
					$("#peopleNum").rollNum({
				    	deVal: Number(0),
				    	digit: Number(0).toString().length
				    });
				}
				$("#enterpriseNum").empty();
				if(num.COMPANY_TOTAL != "" && num.COMPANY_TOTAL != undefined){
					$("#enterpriseNum").rollNum({
				    	deVal: num.COMPANY_TOTAL,
				    	digit: num.COMPANY_TOTAL.toString().length
				    });
				}else{
					$("#enterpriseNum").rollNum({
				    	deVal: Number(0),
				    	digit: Number(0).toString().length
				    });
				}
				$("#developNum").empty();
				if(num.PARK_TOTAL != "" && num.PARK_TOTAL != undefined){
					$("#developNum").rollNum({
				    	deVal: num.PARK_TOTAL,
				    	digit: num.PARK_TOTAL.toString().length
				    });
				}else{
					$("#developNum").rollNum({
				    	deVal: Number(0),
				    	digit: Number(0).toString().length
				    });
				}
				
				if($('#orgId').val() == "360900"){
					$('#developList').empty();
					var list = result.data.parkList;
					if(list.length>0){
						for (var i=0;i<list.length;i++){
							var info = list[i];
							var index = i+1;
						    var _div = "";
						    if(i==0){
							    _div += '<div class="industry-item">'
						    }else{
							    _div += '<div class="industry-item">'
						    }
						    _div += '<span>'+index+'</span>'
						    _div +=	'<font>'+info.PARK_NAME+'</font>'
						    _div +=	'<img class="lineImg recruitline" src="${ctx}/static/image/cityDataCenter/ycNew/icons_16.png">'
			    	    	if(info.RECRUIT_NUMBER){
							    _div +=	'<font class="yellowT" style="width: 50px; text-align: center;"><b>'+info.RECRUIT_NUMBER+'</b></font>'
			    	    	}else{
								 _div +='<font class="yellowT" style="width: 50px; text-align: center;"><b>未公布</b></font>'
			    	    	}
						    _div += '</div>'
							$('#developList').append(_div);
						}
					}else{
						var _div = "<div id='noData' style='color: #00FFFF; text-align: center;'>该区县本月未发布用工信息</div>";
						$('#developList').append(_div);
					}
				}
				
				$('#enterpriseList').empty();
				var list = result.data.companyList;
				if(list.length>0){
					for (var i=0;i<list.length;i++){
						var info = list[i];
						var index = i+1;
					    var _div = "";
					    if(i==0){
						    _div += '<div class="industry-item">'
					    }else{
						    _div += '<div class="industry-item">'
					    }
					    _div += '<span>'+index+'</span>'
					    _div +=	'<font>'+info.COMPANY_NAME+'</font>'
					    _div +=	'<img class="lineImg recruitline" src="${ctx}/static/image/cityDataCenter/ycNew/icons_16.png">'
		    	    	if(info.RECRUIT_NUMBER){
						    _div +=	'<font class="yellowT" style="width: 50px; text-align: center;"><b>'+info.RECRUIT_NUMBER+'</b></font>'
		    	    	}else{
							 _div +='<font class="yellowT" style="width: 50px; text-align: center;"><b>未公布</b></font>'
		    	    	}
					    _div += '</div>'
						$('#enterpriseList').append(_div);
					}
				}else{
					var _div = "<div id='noData' style='color: #00FFFF; text-align: center;'>该区县本月未发布用工信息</div>";
					$('#enterpriseList').append(_div);
				}
				
				if(!$.isEmptyObject(result.data.perData)){
					chartJobMap(result.data.perData.series);
				}else{
					$("#jobMap").html("<font class=\"nodata\" style=\"margin-left: -120px;\">该区县本月未发布用工信息</font>");
				}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
//产业饼图
function getPieChart(){
 	$.ajax({
		url:"${OfficeUrl}XOffice/interface/json/recruitInfo/jobCount",
		type:"get",
		data:{
			"orgId": $('#orgId').val(),
		},
		dataType:"json",
		success:function(result){
			if(result.success){
				if(!$.isEmptyObject(result.data)){
					chartJobMap(result.data.series);
				}else{
					$("#jobMap").html("<font class=\"nodata\" style=\"margin-left: -120px;\">该区县本月未发布用工信息</font>");
				}
			}
		},
		error:function(){},
	});
}
//招聘岗位动态
function getPostList(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/recruitInfo/recruitList",
		type : "post",
		data : {
 			"areaId": 360900,
			"spaceId": $("#spaceId").val(),
 			"pageNum" : 1,
			"pageSize" : 20,
			"time": '',
		},
		dataType : "json",
		success : function(result) {
			$('#postList').empty();
			if(result.success){
				var infoList = result.value; 
				if(infoList.length>0){
					$("#nodataDiv1").hide();
					for (var j=0; j<2;j++){
						for(var i=0;i<infoList.length;i++){
							var info = infoList[i];
							var _div = "";
							if(info.createKind==1){
								_div += '<a target="_blank" href="${ctx}/yc/detail?type=3&id='+info.parkId+'&time='+info.recruitTime+'&entranceId=3609009">'
							}else{
								_div += '<a target="_blank" href="'+info.recruitUrl+'">'
							}
							_div += '<div class="service-item" style="border-bottom: 1px dashed #0d4170; padding-bottom: 5px;">'
							_div += '<font class="jobTitleFT">'+info.recruitTitle+'</font>'
							if(info.recruitDetail){
								_div +=	'<p><font class="yT">招聘：'+info.recruitDetail+'</font>'
					    		_div +=	'</p>'
							}
							_div +=	'</div></a>'
							$('#postList').append(_div);
						}
					}
				}else{
					$("#nodataDiv1").show();
				} 
		    }
		},
		error : function() {
		}
	});
}
//招聘月报
function getReportList(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/gatherDataCount/viewList",
		type : "post",
		data : {
			"provinceId": 360000,
 			"areaId": 360900,
			"spaceId": "-1",
 			"pageNum" : 1,
			"pageSize" : 20,
			"kind": "2",
		},
		dataType : "json",
		success : function(result) {
			$('#reportList').empty();
			if(result.success){
				var infoList = result.infoList; 
				if(infoList.length>0){
					$("#nodataDiv2").hide();
					for (var j=0; j<8;j++){
						for(var i=0;i<infoList.length;i++){
							var info = infoList[i];
							var _div = "";
							if(info.viewUrl){
			              		_div += '<a target="_blank" href="'+info.viewUrl+'">'
							}else{
								_div +='<a target="_blank" href="${ctx}/yc/detail?type=2&id='+info.id+'&entranceId=3609009">'
							}
							_div += '<div class="service-item" style="border-bottom: 1px dashed #0d4170; padding-bottom: 5px;">'
							_div += '<font class="jobTitleFT">'+info.title+'</font>'
							if(info.content){
								_div +=	'<p><font class="yT">'+info.content+'</font>'
					    		_div +=	'</p>'
							}
							_div +=	'</div></a>'
							$('#reportList').append(_div);
						}
					}
				}else{
					$("#nodataDiv2").show();
				} 
		    }
		},
		error : function() {
		}
	});
}

//宜春地图
function getYcMap(){
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
	$.get('${ctx}/static/map/360900.json', function (chinaJson) {
	    echarts.registerMap('yc', chinaJson);
	    mapChart(data);
	});
}

function mapChart(d1) {
	var myChart = echarts.init(document.getElementById('map'));
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
   			formatter : '{b}'
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
        }]
    }
    myChart.setOption(option);
    
    myChart.on('click', function(param){
    	if(param.seriesIndex == 0){//点击区块
    		//地图左上区域栏控制
    		if($("#orgId").val() == param.data.value){
				$("#orgId").val('360900');
				$(".map-areas span:eq(1)").removeClass("on");
			} else { 
				$("#orgId").val(param.data.value);
				$(".map-areas span:eq(1)").addClass("on").find("h4").text(param.data.name);
			}
    		if($("#spaceId").val() == param.data.value){
				$("#spaceId").val('');
				$(".map-areas span:eq(1)").removeClass("on");
			} else { 
				$("#spaceId").val(param.data.value);
				$(".map-areas span:eq(1)").addClass("on").find("h4").text(param.data.name);
			}
    		getRealTimeData();
    		//getPieChart();
    		if($("#dt").hasClass("on")){
    			getPostList();
    		}else if($("#yb").hasClass("on")){
    			getReportList();
    		}else{}
    	}else if(param.seriesIndex == 1){//点击坐标点
    		
    	}else{}
    })
};
function chartJobMap(data,legend){
	var div_ = document.getElementById("jobMap");
	div_.removeAttribute("_echarts_instance_");
	var chart = echarts.init(div_);
 	/* var chart = echarts.init(document.getElementById('jobMap')); */
	var fz = 16;
		if(width <= 1600){
	    	fz = 14;
	    }
	    if(width <= 1440){
	    	fz = 12;
	    }
	    if(width <= 1366){
	    	fz = 10;
		}
	var option = {
		tooltip: {
	        trigger: 'item',
	        formatter: "{b}: {c} ({d}%)"
		},
	    color:['#f845b3','#f845f1','#ad46f3','#5045f6','#4777f5',
               '#44aff0','#45dbf7','#f6d54a','#f69846','#ff4343'],
	    series : [{
            type: 'pie',
            radius : '55%',
            center: ['45%', '55%'],
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
        }]
	};
	
	chart.setOption(option);
}
</script>
</html>