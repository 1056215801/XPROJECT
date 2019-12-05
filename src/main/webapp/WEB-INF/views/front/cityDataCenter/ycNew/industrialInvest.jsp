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
	<title>宜春工业大数据工业投资</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360900">
		<input type="hidden" id="year" name="year" value="2018">
		<input type="hidden" id="month" name="month" value="">
		<input type="hidden" id="quarter" name="quarter" value="4">
		<input type="hidden" id="region" name="region" value="宜春市">
	</form>
	<%@ include file="header.jsp"%>
	<div class="mainpage clear-box">
		<div class="logis-main mainfl" style="width: 30%;">
			<div class="countBox clear-box boxStyle" style="height: 60%; cursor: pointer;">
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
						<div class="selects" style="position: absolute; top: 3px; right: -7px;">
							<div class="selects" style="display: inline-block;">
								<div class="select">
									<p><font id="selectYear">2018</font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul id="sy">
											
										</ul>
									</div>
								</div>
							</div>
							<div class="selects" style="display: inline-block;">
								<div class="select">
									<p><font id="selectQuarter">四季度</font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul id="sq">
											<li value="1">一季度</li>
											<li value="2">二季度</li>
											<li value="3">三季度</li>
											<li value="4">四季度</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="industryData">
							<div class="industryDataTitle">
								<i></i>
								<span onclick="toSecondPage()">工业投资</span>
							</div>
							<div class="industryDataCont">
								<div class="industryDataBox" onclick="toSecondPage()">
									<div class="industryDataName">增速</div>
									<div class="industryDataValue"><i></i><span id="growthRate">0%</span></div>
								</div>
								<div class="industryDataBox" onclick="toSecondPage()">
									<div class="industryDataName" id="pm">全省排名</div>
									<div class="industryDataValue"><i></i><span id="proRanking">0</span></div>
								</div>
							</div>
						</div>
						<div class="industryData">
							<div class="industryDataTitle">
								<i></i>
								<span>亿元以上工业项目</span>
							</div>
							<div class="industryDataCont">
								<div class="industryDataBox" onclick="toSecondPage()">
									<div class="industryDataName">工业项目（个）</div>
									<div class="industryDataValue"><i></i><span id="indProject1">0</span></div>
								</div>
								<div class="industryDataBox" onclick="toSecondPage()">
									<div class="industryDataName">总投资（亿元）</div>
									<div class="industryDataValue"><i></i><span id="totalInv1">0</span></div>
								</div>
							</div>
						</div>
						<div class="industryData">
							<div class="industryDataTitle">
								<i></i>
								<span>500百万元以上技改项目</span>
							</div>
							<div class="industryDataCont">
								<div class="industryDataBox" onclick="toSecondPage()">
									<div class="industryDataName">工业项目（个）</div>
									<div class="industryDataValue"><i></i><span id="indProject2">0</span></div>
								</div>
								<div class="industryDataBox" onclick="toSecondPage()">
									<div class="industryDataName">总投资（亿元）</div>
									<div class="industryDataValue"><i></i><span id="totalInv2">0</span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="boxStyle" style="height: calc(40% - 10px); margin-top: 10px;">
				<div class="boxStyleBg">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit" onclick="toSecondPage()">
						<span>工业投资占比（亿元）</span>
					</div>
					<div class="pieChartBar">
						<div id="chart2" style="height: 100%; position: relative;"></div>
						<div class="ratioPieLeftTip">亿元以上</br>投资占比</div>
						<div class="ratioPierightTip">500万以上</br>投资占比</div>
					</div>
				</div>
			</div>
		</div>
		<div class="logis-main maincenter" style="width: 50%;">
			<div class="boxStyle" style="height: 66.66%;">
				<div class="dataBrandBar">
					<div class="dataBrand">
						<div class="dataBrandName">市统管项目（个）</div>
						<div class="dataBrandValue" id="projectCount"></div>
					</div>
					<div class="dataBrand">
						<div class="dataBrandName">累计更新次数</div>
						<div class="dataBrandValue" id="updateCount"></div>
					</div>
				</div>
				<div id="map" style="width: 100%; height: calc(100% - 50px); margin-top: 50px;"></div>
				<div class="map-areas" style="top: 40px;left: 20px;">
					<span style="cursor: pointer;">
						<h4>宜春市</h4>
					</span>
					<span>
						<h4>宜春市</h4>
					</span>
				</div>
			</div>
			<div class="boxStyle" style="height: calc(33.33% - 10px); margin-top: 10px;">
				<div class="boxStyleBg">
			    	<div class="left-top-radius"></div>
			    	<div class="left-bottom-radius"></div>
			    	<div class="right-top-radius"></div>
			    	<div class="right-bottom-radius"></div>
			    	<!-- <div class="top-line"></div>
					<div class="top-line-light"></div>
					<div class="top-line-light02"></div> -->
			        <div class="bottom-line"></div>
			        <div class="left-line"></div>
			        <div class="right-line"></div>
			        <div class="boxTit">
						<span>各区县续建/新建项目</span>
					</div>
			        <div class="" id="chart1" style="height: 100%;"></div>
				</div>
			</div>
		</div>
		<div class="logis-main mainfr">
	        <div class="boxStyle carTopBox" style="height: 66.66%;">
				<div class="boxStyleBg">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit" onclick="toSecondPage()">
						<span>10亿元以上项目</span>
					</div>
					<div class="bigProjectDataBar">
						<div class="bigProjectDataValue">
							<span class="bigProjectDataName">项目数量（个）</span>
							<span class="bigProjectDataNum" id="projectNum"></span>
						</div>
						<div class="pieChartBar" style="height: calc(50% - 20px);">
							<div id="chart3" style="height: 100%; position: relative;"></div>
							<div class="numPieTip">10亿以上</br>投资占比</div>
						</div>
						<div class="pieChartBar" style="height: calc(50% - 20px);">
							<div class="progressPieTitle">投资进度（亿元）</div>
							<div id="chart4" style="height: 100%; position: relative;"></div>
							<div class="progressPieTip"><span>0</span><font>亿</font></br>投资总额</div>
						</div>
					</div>
				</div>
	        </div>
	        <div class="boxStyle orderTableBox" style="padding: 0px 5% 5%; margin-top: 10px; cursor: pointer;">
				<div class="boxStyleBg" style="overflow: hidden;">
					<div class="left-top-radius"></div>
					<div class="left-bottom-radius"></div>
					<div class="right-top-radius"></div>
					<div class="right-bottom-radius"></div>
					<div class="bottom-line"></div>
					<div class="left-line"></div>
					<div class="right-line"></div>
					<div class="boxTit">
						<span>工程项目实时动态</span>
					</div>
					<div class="projectRealDataBar">
						<div class="projectRealDataBox">
							<!-- <div class="projectRealData">
								<span class="projectRealDataName">宜春经开园区XXX项目上报项目上报项目上报</span>
								<span class="projectRealDataTime">11:02</span>
							</div>-->
						</div>
						<font class="unPublish" style="display: inline-block;left: calc(50% - 9px);">未公布</font>
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
	$(".head>a:eq(2)").addClass("on");
	//初始化
	getselectYear();
	//getDefaultDate();

	getYcMap();
	getIndInvData();
	getRealTimeData();
	
	//下拉框点击事件
	$(".select p").on("click",function(){
		$(this).next().slideToggle();
	})
	$(".map-areas span:eq(0)").on("click",function(){
		$(this).next().removeClass("on");
		$("#orgId").val('360900');
		$("#pm").text("全省排名");
		getIndInvData();
		getRealTimeData();
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
 			getIndInvData();
		}else if($(this).parent().attr('id')=='sq'){
			//修改下拉组件默认值
			$('#selectQuarter').text($(this).text());
			//修改隐藏属性
			$('#quarter').val($(this).attr("value"));
			getIndInvData();
		}else{}
	})
}
function getDefaultDate(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/getIndInvData/ycsBigData",
		type : "post",
		data : {
			"year" : "",//$('#year').val(),
			"quarter" : "",//$('#quarter').val()
			"countyId" : $('#orgId').val()
		},
		success : function(result) {
			console.log(result)
			if (result.success) {
				$('#selectYear').text(result.value.year);
				if(result.value.quarter == 1){
					$('#selectQuarter').text("一季度");
				}else if(result.value.quarter == 2){
					$('#selectQuarter').text("二季度");
				}else if(result.value.quarter == 3){
					$('#selectQuarter').text("三季度");
				}else if(result.value.quarter == 4){
					$('#selectQuarter').text("四季度");
				}else{}
				$('#year').val(result.value.year);
				$('#quarter').val(result.value.quarter);
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getIndInvData(){
	var param = {
			"year" : $('#year').val(),
			"quarter" : $('#quarter').val(),	
	}
	console.log(param)
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/getIndInvData/ycsBigData",
		type : "post",
		data : {
			"year" : $('#year').val(),
			"quarter" : $('#quarter').val(),
			"countyId" : $('#orgId').val()
		},
		success : function(result) {
			console.log(result)
			if (result.success) {
				if($('#year').val() == "2018" && $('#quarter').val() == "4"){
					console.log(1)
					$("#growthRate").text("14.2%");
					$("#proRanking").text("5");
					$("#indProject1").text("382");
					$("#totalInv1").text("1749.4");
					$("#indProject2").text("159");
					$("#totalInv2").text("369.84");
					var count7 = 60;
					$("#projectNum").rollNum({
				    	deVal: count7,
				    	digit: count7.toString().length
				    });
					numPieChart("410","643");
					$(".numPieTip").show();
					progressPieChart("1053","422.65");
					$(".progressPieTip span").text("1053");
					$(".progressPieTip").show();
					ratioPieChart("781.2","968.2","69.22","300.62");
					$(".ratioPieLeftTip").show();
					$(".ratioPierightTip").show();
					
					return
				}
					if(result.value.count1 != "" && result.value.count1 != undefined){
						$("#growthRate").text(result.value.count1+"%");
					}else{
						$("#growthRate").text("未公布");
					}
					if(result.value.count2 != "" && result.value.count2 != undefined){
						$("#proRanking").text(result.value.count2);
					}else{
						$("#proRanking").text("未公布");
					}
					if(result.value.count3 != "" && result.value.count3 != undefined){
						$("#indProject1").text(result.value.count3);
					}else{
						$("#indProject1").text("未公布");
					}
					if(result.value.count4 != "" && result.value.count4 != undefined){
						$("#totalInv1").text(result.value.count4);
					}else{
						$("#totalInv1").text("未公布");
					}
					if(result.value.count5 != "" && result.value.count5 != undefined){
						$("#indProject2").text(result.value.count5);
					}else{
						$("#indProject2").text("未公布");
					}
					if(result.value.count6 != "" && result.value.count6 != undefined){
						$("#totalInv2").text(result.value.count6);
					}else{
						$("#totalInv2").text("未公布");
					}
					$("#projectNum").empty();
					if(result.value.count7 != "" && result.value.count7 != undefined){
						$("#projectNum").rollNum({
					    	deVal: result.value.count7,
					    	digit: result.value.count7.toString().length
					    });
					}else{
						$("#projectNum").rollNum({
					    	deVal: Number(0),
					    	digit: Number(0).toString().length
					    });
					}
					
					if(result.value.count8 != "" && result.value.count8 != undefined && result.value.count9 != "" && result.value.count9 != undefined){
						numPieChart(result.value.count8,result.value.count9);
						$(".numPieTip").show();
					}else{
						$("#chart3").html("<font class=\"unPublish\">未公布</font>");
						$(".numPieTip").hide();
					}
					if(result.value.count10 != "" && result.value.count10 != undefined && result.value.count11 != "" && result.value.count11 != undefined){
						progressPieChart(result.value.count10,result.value.count11);
						$(".progressPieTip span").text(result.value.count10);
						$(".progressPieTip").show();
					}else{
						$("#chart4").html("<font class=\"unPublish\">未公布</font>");
						$(".progressPieTip").hide();
					}
					if(result.value.count12 != "" && result.value.count12 != undefined && result.value.count13 != "" && result.value.count13 != undefined && result.value.count14 != "" && result.value.count14 != undefined && result.value.count15 != "" && result.value.count15 != undefined){
						ratioPieChart(result.value.count12,result.value.count13,result.value.count14,result.value.count15);
						$(".ratioPieLeftTip").show();
						$(".ratioPierightTip").show();
					}else{
						$("#chart2").html("<font class=\"unPublish\">未公布</font>");
						$(".ratioPieLeftTip").hide();
						$(".ratioPierightTip").hide();
					}
				
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
var flag = 0;
function getRealTimeData(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/enginProjectCommonInfo/indexData",
		type : "post",
		data : {
			"orgId" : $('#orgId').val(),
			"limit" : ""
		},
		success : function(result) {
			if (result.success) {
				$("#projectCount").empty();
				if(result.data.totalNum != "" && result.data.totalNum != undefined){
					$("#projectCount").rollNum({
				    	deVal: result.data.totalNum,
				    	digit: result.data.totalNum.toString().length
				    });
				}else{
					$("#projectCount").rollNum({
				    	deVal: Number(0),
				    	digit: Number(0).toString().length
				    });
				}
				$("#updateCount").empty();
				if(result.data.updateNum != "" && result.data.updateNum != undefined){
				    $("#updateCount").rollNum({
				    	deVal: result.data.updateNum,
				    	digit: result.data.updateNum.toString().length
				    });
				}else{
					$("#updateCount").rollNum({
				    	deVal: Number(0),
				    	digit: Number(0).toString().length
				    });
				}
				
				if(result.data.chartData.xAxis != "" && result.data.chartData.xAxis != undefined){
					if(flag==0){						
						barOption.xAxis.data = result.data.chartData.xAxis;
						barOption.series[0].data = result.data.chartData.newProject;
						barOption.series[1].data = result.data.chartData.continueProject;
						barChart();
					}
					flag++;
				}else{
					$("#chart1").html("<font class=\"unPublish\">未公布</font>");
				}
				
				$(".projectRealDataBox").empty();
				if(result.data.listData != "" && result.data.listData != undefined){
					for(var j =0 ; j<4 ; j++){
						for(var i=0 ; i<result.data.listData.length ; i++){
							var info = result.data.listData[i];
							var title = info.title; 
							var uniqueMark = changeStr(title,"uniqueMark",1);
							var enginName = changeStr(title,"enginName",1);
							var enginId = changeStr(title,"enginId",0);
							var moduleId = changeStr(title,"moduleId",0);
							var type = changeStr(title,"type",0);
							var url = "/projectScheduleInfo/view?id="+enginId+"@moduleId="+moduleId+"@uniqueMark="+uniqueMark+"@enginName="+enginName+"@type="+type;
							var _div = "";
							_div = "<div class=\"projectRealData\">";
							_div+= "	<div class=\"projectRealDataTime\">"+info.time+"</div>";
							_div+= '	<div class="projectRealDataName" onclick="goDetail(\''+url+'\')">'+info.title.split("-param-")[0]+'</div>';
							_div+= "</div>";
							$(".projectRealDataBox").append(_div);
						}
					}
					$(".projectRealDataBar .unPublish").hide();
				}else{
					//$(".projectRealDataBox").html("<font class=\"unPublish\">未公布</font>");
					$(".projectRealDataBar .unPublish").show();
				}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}

function goDetail(url){
	if(isLogin=='1'){ 
		if('${cityId}'==360900){
			if('${orgType}'==0||'${orgType}'==1 ||'${orgType}'==2 ||'${orgType}'==4){
				layer.open({
					  id:'cframe',			
					  type: 2,
					  title: false,
					  closeBtn: 1, //不显示关闭按钮
					  shade: [.4],
					  area: ['70%', '80%'],
					  anim: 2,
					  content: ["${ctx}/toXOffice?type=0&replaceFlag=1&path="+encodeURI(url)], //iframe的url，no代表不显示滚动条
					  btn: ['关闭'],
					  yes: function(index, layero){
			        
						  layer.closeAll();
					  },cancel: function(){ 
			            
			        }
				}); 
			}else{
				alert('您暂无权限查看二级页面')
			}
		}else{
			if('${governmentKind}'==2){
				layer.open({
					  id:'cframe',			
					  type: 2,
					  title: false,
					  closeBtn: 1, //不显示关闭按钮
					  shade: [.4],
					  area: ['70%', '80%'],
					  anim: 2,
					  content: ["${ctx}/toXOffice?type=0&replaceFlag=1&path="+encodeURI(url)], //iframe的url，no代表不显示滚动条
					  btn: ['关闭'],
					  yes: function(index, layero){
			        
						  layer.closeAll();
					  },cancel: function(){ 
			            
			        }
				}); 
			}else{
				alert('您暂无权限查看二级页面')
			}
		}
	}else{ 
		goPage("${ctx}/front/cityDataCenter/ycIndex/12?orgId=3609009")
	}

}
function toSecondPage(){
	goPage("${ctx}/front/cityDataCenter/ycIndex/15?orgId=3609009");
}
/**
 * type 1:字符串 0:数字
 */
function changeStr(title,str,type){
	var rst = "";
	if(title.indexOf(str)>=0){
		var s = title.substring(title.indexOf(str)+str.length+2+type);
		var splitStr = type==1?'"':',';
		if(s.indexOf(splitStr)>=0){
			var d = s.substring(0,s.indexOf(splitStr));
			rst = d;
		}else{
			splitStr = '}';
			if(s.indexOf(splitStr)>=0){
				var d = s.substring(0,s.indexOf(splitStr));
				rst = d;
			}
		}
	}
	return rst;
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
    		
    		//实现重复点击，切换回初始
    		var cityName = param.name;
    		if(cityName == $("#region").text()){
	    		$("#region").text("宜春市");
	    		$('#orgId').val("360900");
	    		$("#pm").text("全省排名");
	    		getIndInvData();
	    		getRealTimeData();
	    	}else{
	            $("#region").text(cityName);
	            $('#orgId').val(param.value);
	            $("#pm").text("全市排名");
	            getIndInvData();
	            getRealTimeData();
	    	}
    	}else if(param.seriesIndex == 1){//点击坐标点
    		$('#orgId').val(param.name);
    		$("#pm").text("全市排名");
    		getIndInvData();
    		getRealTimeData();
    	}else{}
    })
};

function barChart(){
	var div_ = document.getElementById("chart1");
	div_.removeAttribute("_echarts_instance_");
	var chart1 = echarts.init(div_);
	//var chart1 = echarts.init(document.getElementById('chart1'));
	
	chart1.setOption(barOption);
}
var barOption = {
    tooltip: {
    	trigger: "axis",
        axisPointer: {
        	type: "shadow",
        },
    },
    legend: {
    	data: ['新建项目','续建项目'],
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
            rotate:35
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
        name: '新建项目',
        type: "bar",
        barWidth: 10,
        barGap: 1,
        itemStyle: {
		    normal: {
		        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		            offset: 0,
		            color: '#12AABB'
		        }, {
		            offset: 1,
		            color: '#3451B9'
		        }]),
		        opacity: 1,
		    }
        },
        data: ["234","23","43","146","76","86","54","35","198","45","26"],
    },{
        name: '续建项目',
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
        data: ["123","23","45","56","34","135","45","76","127","23","53"]
    },]
}

function ratioPieChart(new1,continue1,new2,continue2){
	var labelTop = {
	    normal : {
	    	color: '#FFD054',
	        label : {
	            show : true,
	        },
	        labelLine : {
	            show : false
	        }
	    }
	};
	var labelBottom = {
	    normal : {
	    	color: '#2D6FFF',
	        label : {
	        	show : true,
	        },
	        labelLine : {
	            show : false
	        }
	    },
	};
	
	var series1 = [{name:'新建项目',value:new1, itemStyle:labelBottom}, {name:'续建项目',value:continue1, itemStyle:labelTop}];
	var series2 = [{name:'新建项目',value:new2, itemStyle:labelBottom}, {name:'续建项目',value:continue2, itemStyle:labelTop}];
	
	
	var div_ = document.getElementById("chart2");
	div_.removeAttribute("_echarts_instance_");
	var chart2 = echarts.init(div_);
	//var chart2 = echarts.init(document.getElementById('chart2'));
	ratioPieOption.series[0].data = series1;
	ratioPieOption.series[1].data = series2;
	
	chart2.setOption(ratioPieOption);
}
var ratioPieOption = {
	tooltip: {
		trigger: 'item'
	},
    legend: {
    	show: true,
    	data:['新建项目', '续建项目'],
        bottom: '5%',
        itemWidth: 10,
        itemHeight: 10,
        itemGap: 35,
   		textStyle: {
            color: "#fff"
        },
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
        radius : ['55%', '70%'],
        center: ['27%', '40%'],
        label: {
        	formatter: function(params){
            	return (params.percent).toFixed(0)+"%";
            },
            color: '#fff',
        },
        labelLine: {
        	length: 10,
        	length2: 10,
		},
    },{
        type: 'pie',
        radius : ['55%', '70%'],
        center: ['73%', '40%'],
        label: {
        	formatter: function(params){
            	return (params.percent).toFixed(0)+"%";
            },
            color: '#fff',
        },
        labelLine: {
        	length: 10,
        	length2: 10,
		},
    }]  
};
function numPieChart(new3,continue3){
	var labelTop = {
	    normal : {
	    	color: '#FFD054',
	        label : {
	            show : true,
	        },
	        labelLine : {
	            show : false
	        }
	    }
	};
	var labelBottom = {
	    normal : {
	        color: '#2D6FFF',
	        label : {
	        	show : true,
	        },
	        labelLine : {
	            show : false
	        }
	    },
	};
	
	var series = [{name:'新建项目',value:new3, itemStyle:labelBottom}, {name:'续建项目',value:continue3, itemStyle:labelTop}];
	
	var div_ = document.getElementById("chart3");
	div_.removeAttribute("_echarts_instance_");
	var chart3 = echarts.init(div_);
	//var chart3 = echarts.init(document.getElementById('chart3'));
	numPieOption.series[0].data = series;
	
	chart3.setOption(numPieOption);
}
var numPieOption = {
	tooltip: {
		trigger: 'item'
	},
    legend: {
    	show: true,
    	data:['新建项目', '续建项目'],
    	orient: 'vertical',
        right: '5%',
        itemWidth: 10,
        itemHeight: 10,
        itemGap: 10,
   		textStyle: {
            color: "#fff"
        },
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
        radius : ['55%', '70%'],
        center: ['50%', '45%'],
        label: {
        	formatter: function(params){
            	return (params.percent).toFixed(0)+"%";
            },
            color: '#fff',
        },
        labelLine: {
        	length: 10,
        	length2: 10,
		},
    }] 
};
function progressPieChart(total,complete){
	var labelTop = {
	    normal : {
	    	color: '#ff4f78',
	    	label : {
	        	show : false,
	        },
	        labelLine : {
	            show : false
	        }
	    }
	};
	var labelBottom = {
	    normal : {
	        color: '#060081',
	        label : {
	        	show : false,
	        },
	        labelLine : {
	            show : false
	        }
	    },
	};
	
	var series = [{name:'剩余进度',value:(total-complete).toFixed(2), itemStyle:labelBottom}, {name:'完成进度',value:complete, itemStyle:labelTop}];
	
	var div_ = document.getElementById("chart4");
	div_.removeAttribute("_echarts_instance_");
	var chart4 = echarts.init(div_);
	//var chart4 = echarts.init(document.getElementById('chart4'));
	progressPieOption.series[0].data = series;
	
	chart4.setOption(progressPieOption);
}
var progressPieOption = {
	tooltip: {
		trigger: 'item'
	},
    legend: {
    	show: false,
    	data:['总投资额', '完成进度'],
        bottom: '5%',
        itemWidth: 10,
        itemHeight: 10,
        itemGap: 35,
   		textStyle: {
            color: "#fff"
        },
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
        radius : ['55%', '70%'],
        center: ['50%', '45%'],
        clockwise: false,
        startAngle: 180,
        label: {
        	formatter: function(params){
            	return params.data.value+"亿";
            },
            color: '#fff',
        },
        labelLine: {
        	length: 10,
        	length2: 10,
		},
    }] 
}
</script>
</html>