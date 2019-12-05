<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>弋阳数据中心</title>
<link href="${ctx}/static/css/parkDataCenter/yy_bigDataCenter.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<style>
.echarts-title {
	cursor: pointer;
	float: left;
	width: 13%;
	height: 100%;
	border: 1px solid #6FBBDF;
	margin-left: 1%;
	text-align: center;
	/* padding-top: 2%; */
	color: #fff;
	background-color: #0071B5;
	border-radius: 6px 6px 0 0;
	border-bottom: none;
}

.echarts-title1 {
	cursor: pointer;
	float: left;
	width: 13%;
	height: 100%;
	margin-left: 1%;
	text-align: center;
	/* padding-top: 2%; */
	color: #FCFF00;
	font-weight: bold;
	border-radius: 6px 6px 0 0;
	-moz-user-select: none;
	position: relative;
	background: rgb(8, 47, 86) none repeat scroll 0% 0%;
}

.echarts-map {
	display: block;
	width: 100%;
	height: 87%;
	-moz-user-select: none;
	position: relative;
	background: rgb(8, 47, 86) none repeat scroll 0% 0%;
}

.echarts-map1 {
	display: none;
	width: 100%;
	height: 87%;
	-moz-user-select: none;
	position: relative;
	background: rgb(8, 47, 86) none repeat scroll 0% 0%;
}
</style>
<script>
	function fnDate() {
		var oDiv = document.getElementById("dateBar");
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth();
		var data = date.getDate();
		var hours = date.getHours();
		var minute = date.getMinutes();
		var second = date.getSeconds();
		var time = "<span style='font-size:14px;'>" + year + "年"
				+ fnW((month + 1)) + "月" + fnW(data)
				+ "日</span><br /><span style='font-size:26px;'>" + fnW(hours)
				+ ":" + fnW(minute) + ":" + fnW(second) + "</span>";
		oDiv.innerHTML = time;
	}
	function fnW(str) {
		str > 9 ? num = str : num = "0" + str;
		return num;
	}
	$(function() {
		/*页面定时跳转事件*/
		initScreenSaver();
		
		setInterval(function() {
			fnDate();
		}, 1000);
		$("#btnYear").click(function() {
			var div = $("#yearMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		$("#btnQuarter").click(function() {
			var div = $("#quarterMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		$("div[name='title']").click(function() {
			$("div[name='title']").each(function(a, item) {
				if (item.className == 'echarts-title1') {
					item.className = 'echarts-title';
				}
			});
			$(this).removeClass('echarts-title');
			$(this).addClass('echarts-title1');
			$("div[name='title']").each(function(b, item) {
				if (item.className == 'echarts-title1') {
					$("div[name='echarts-map']").each(function(a, item) {
						if (a == b) {
							item.className = 'echarts-map';
						} else {
							item.className = 'echarts-map1';
						}
					});
				}
			});
			
			//echarts
			var type = $(this).attr("data");
			
		//	var typeList = eval('(' + '${map.typeList}' + ')');
			var typeList = ${map.typeList};
			if(type==1){ //工业增加值
				var chart1 = echarts.init(document.getElementById('tab1'));
				optionPart2.xAxis[0].data=arrData('${map.data1.xAxis_this}');
				optionPart2.yAxis[0].name="总量（万元）";
				optionPart2.series[0].data=arrData('${map.data1.gyzjz._this}');
				optionPart2.series[1].data=arrData('${map.data1.gyzjz._last}');
				optionPart2.series[2].data=arrData('${map.data1.gyzjz._before}');
				chart1.setOption(optionPart2);
				
				if(isExit(typeList[0])){
					var myChart1 = echarts.init(document.getElementById('part1'));
					optionPart1.series[0].type='bar';
					optionPart1.title.text=typeList[0].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index0.gyzjz}');
					myChart1.setOption(optionPart1);
				}
				
				if(isExit(typeList[2])){
					var myChart3 = echarts.init(document.getElementById('part3'));
					optionPart1.title.text=typeList[2].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index2.gyzjz}');
					myChart3.setOption(optionPart1);
				}
				
				if(isExit(typeList[3])){
					var myChart4 = echarts.init(document.getElementById('part4'));
					optionPart1.title.text=typeList[3].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index3.gyzjz}');
					myChart4.setOption(optionPart1);
				}
				
				if(isExit(typeList[1])){
					var myChart2 = echarts.init(document.getElementById('part2'));
					optionPart1.title.text=typeList[1].typeName+"（单位：万元）";
					optionPart1.series[0].type='line';
					optionPart1.series[0].data=arrData('${map.data2.index1.gyzjz}');
					myChart2.setOption(optionPart1);
				}
				
				if(isExit(typeList[4])){
					var myChart5 = echarts.init(document.getElementById('part5'));
					optionPart1.title.text=typeList[4].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index4.gyzjz}');
					myChart5.setOption(optionPart1);
				}
				
			}else if(type==2){ //主营业务收入
				var chart2 = echarts.init(document.getElementById('tab2'));
				optionPart2.xAxis[0].data=arrData('${map.data1.xAxis_this}');
				optionPart2.yAxis[0].name="总量（万元）";
				optionPart2.series[0].data=arrData('${map.data1.zyywsr._this}');
				optionPart2.series[1].data=arrData('${map.data1.zyywsr._last}');
				optionPart2.series[2].data=arrData('${map.data1.zyywsr._before}');
				chart2.setOption(optionPart2);
				
				if(isExit(typeList[0])){
					var myChart1 = echarts.init(document.getElementById('part1'));
					optionPart1.series[0].type='bar';
					optionPart1.title.text=typeList[0].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index0.zyywsr}');
					myChart1.setOption(optionPart1);
				}
				
				if(isExit(typeList[2])){
					var myChart3 = echarts.init(document.getElementById('part3'));
					optionPart1.title.text=typeList[2].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index2.zyywsr}');
					myChart3.setOption(optionPart1);
				}
				
				if(isExit(typeList[3])){
					var myChart4 = echarts.init(document.getElementById('part4'));
					optionPart1.title.text=typeList[3].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index3.zyywsr}');
					myChart4.setOption(optionPart1);
				}
				
				if(isExit(typeList[1])){
					var myChart2 = echarts.init(document.getElementById('part2'));
					optionPart1.title.text=typeList[1].typeName+"（单位：万元）";
					optionPart1.series[0].type='line';
					optionPart1.series[0].data=arrData('${map.data2.index1.zyywsr}');
					myChart2.setOption(optionPart1);
				}
				
				if(isExit(typeList[4])){
					var myChart5 = echarts.init(document.getElementById('part5'));
					optionPart1.title.text=typeList[4].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index4.zyywsr}');
					myChart5.setOption(optionPart1);
				}
				
			}else if(type==3){ //利税
				var chart3 = echarts.init(document.getElementById('tab3'));
				optionPart2.xAxis[0].data=arrData('${map.data1.xAxis_this}');
				optionPart2.yAxis[0].name="总量（万元）";
				optionPart2.series[0].data=arrData('${map.data1.ls._this}');
				optionPart2.series[1].data=arrData('${map.data1.ls._last}');
				optionPart2.series[2].data=arrData('${map.data1.ls._before}');
				chart3.setOption(optionPart2);
				
				if(isExit(typeList[0])){
					var myChart1 = echarts.init(document.getElementById('part1'));
					optionPart1.series[0].type='bar';
					optionPart1.title.text=typeList[0].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index0.ls}');
					myChart1.setOption(optionPart1);
				}
				
				if(isExit(typeList[2])){
					var myChart3 = echarts.init(document.getElementById('part3'));
					optionPart1.title.text=typeList[2].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index2.ls}');
					myChart3.setOption(optionPart1);
				}
				
				if(isExit(typeList[3])){
					var myChart4 = echarts.init(document.getElementById('part4'));
					optionPart1.title.text=typeList[3].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index3.ls}');
					myChart4.setOption(optionPart1);
				}
				
				if(isExit(typeList[1])){
					var myChart2 = echarts.init(document.getElementById('part2'));
					optionPart1.title.text=typeList[1].typeName+"（单位：万元）";
					optionPart1.series[0].type='line';
					optionPart1.series[0].data=arrData('${map.data2.index1.ls}');
					myChart2.setOption(optionPart1);
				}
				
				if(isExit(typeList[4])){
					var myChart5 = echarts.init(document.getElementById('part5'));
					optionPart1.title.text=typeList[4].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index4.ls}');
					myChart5.setOption(optionPart1);
				}
				
			}else if(type==4){ //用电量
				var chart4 = echarts.init(document.getElementById('tab4'));
				optionPart2.xAxis[0].data=arrData('${map.data1.xAxis_this}');
				optionPart2.yAxis[0].name="总量（万度）";
				optionPart2.series[0].data=arrData('${map.data1.gyydl._this}');
				optionPart2.series[1].data=arrData('${map.data1.gyydl._last}');
				optionPart2.series[2].data=arrData('${map.data1.gyydl._before}');
				chart4.setOption(optionPart2);
				
				if(isExit(typeList[0])){
					var myChart1 = echarts.init(document.getElementById('part1'));
					optionPart1.series[0].type='bar';
					optionPart1.title.text=typeList[0].typeName+"（单位：万度）";
					optionPart1.series[0].data=arrData('${map.data2.index0.gyydl}');
					myChart1.setOption(optionPart1);
				}
				
				if(isExit(typeList[2])){
					var myChart3 = echarts.init(document.getElementById('part3'));
					optionPart1.title.text=typeList[2].typeName+"（单位：万度）";
					optionPart1.series[0].data=arrData('${map.data2.index2.gyydl}');
					myChart3.setOption(optionPart1);
				}
				
				if(isExit(typeList[3])){
					var myChart4 = echarts.init(document.getElementById('part4'));
					optionPart1.title.text=typeList[3].typeName+"（单位：万度）";
					optionPart1.series[0].data=arrData('${map.data2.index3.gyydl}');
					myChart4.setOption(optionPart1);
				}
				
				if(isExit(typeList[1])){
					var myChart2 = echarts.init(document.getElementById('part2'));
					optionPart1.title.text=typeList[1].typeName+"（单位：万度）";
					optionPart1.series[0].type='line';
					optionPart1.series[0].data=arrData('${map.data2.index1.gyydl}');
					myChart2.setOption(optionPart1);
				}
				
				if(isExit(typeList[4])){
					var myChart5 = echarts.init(document.getElementById('part5'));
					optionPart1.title.text=typeList[4].typeName+"（单位：万度）";
					optionPart1.series[0].data=arrData('${map.data2.index4.gyydl}');
					myChart5.setOption(optionPart1);
				}
				
			}else if(type==5){ //从业人数
				var chart5 = echarts.init(document.getElementById('tab5'));
				optionPart2.xAxis[0].data=arrData('${map.data1.xAxis_this}');
				optionPart2.yAxis[0].name="总人数（人）";
				optionPart2.series[0].data=arrData('${map.data1.cyry._this}');
				optionPart2.series[1].data=arrData('${map.data1.cyry._last}');
				optionPart2.series[2].data=arrData('${map.data1.cyry._before}');
				chart5.setOption(optionPart2);
				
				if(isExit(typeList[0])){
					var myChart1 = echarts.init(document.getElementById('part1'));
					optionPart1.series[0].type='bar';
					optionPart1.title.text=typeList[0].typeName+"（单位：人）";
					optionPart1.series[0].data=arrData('${map.data2.index0.cyry}');
					myChart1.setOption(optionPart1);
				}
				
				if(isExit(typeList[2])){
					var myChart3 = echarts.init(document.getElementById('part3'));
					optionPart1.title.text=typeList[2].typeName+"（单位：人）";
					optionPart1.series[0].data=arrData('${map.data2.index2.cyry}');
					myChart3.setOption(optionPart1);
				}
				
				if(isExit(typeList[3])){
					var myChart4 = echarts.init(document.getElementById('part4'));
					optionPart1.title.text=typeList[3].typeName+"（单位：人）";
					optionPart1.series[0].data=arrData('${map.data2.index3.cyry}');
					myChart4.setOption(optionPart1);
				}
				
				if(isExit(typeList[1])){
					var myChart2 = echarts.init(document.getElementById('part2'));
					optionPart1.title.text=typeList[1].typeName+"（单位：人）";
					optionPart1.series[0].type='line';
					optionPart1.series[0].data=arrData('${map.data2.index1.cyry}');
					myChart2.setOption(optionPart1);
				}
				
				if(isExit(typeList[4])){
					var myChart5 = echarts.init(document.getElementById('part5'));
					optionPart1.title.text=typeList[4].typeName+"（单位：人）";
					optionPart1.series[0].data=arrData('${map.data2.index4.cyry}');
					myChart5.setOption(optionPart1);
				}
				
			}else if(type==6){ //利润
				var chart6 = echarts.init(document.getElementById('tab6'));
				optionPart2.xAxis[0].data=arrData('${map.data1.xAxis_this}');
				optionPart2.yAxis[0].name="总量（万元）";
				optionPart2.series[0].data=arrData('${map.data1.lr._this}');
				optionPart2.series[1].data=arrData('${map.data1.lr._last}');
				optionPart2.series[2].data=arrData('${map.data1.lr._before}');
				chart6.setOption(optionPart2);
				
				if(isExit(typeList[0])){
					var myChart1 = echarts.init(document.getElementById('part1'));
					optionPart1.series[0].type='bar';
					optionPart1.title.text=typeList[0].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index0.lr}');
					myChart1.setOption(optionPart1);
				}
				
				if(isExit(typeList[2])){
					var myChart3 = echarts.init(document.getElementById('part3'));
					optionPart1.title.text=typeList[2].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index2.lr}');
					myChart3.setOption(optionPart1);
				}
				
				if(isExit(typeList[3])){
					var myChart4 = echarts.init(document.getElementById('part4'));
					optionPart1.title.text=typeList[3].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index3.lr}');
					myChart4.setOption(optionPart1);
				}
				
				if(isExit(typeList[1])){
					var myChart2 = echarts.init(document.getElementById('part2'));
					optionPart1.title.text=typeList[1].typeName+"（单位：万元）";
					optionPart1.series[0].type='line';
					optionPart1.series[0].data=arrData('${map.data2.index1.lr}');
					myChart2.setOption(optionPart1);
				}
				
				/* if(isExit(typeList[4])){
					var myChart5 = echarts.init(document.getElementById('part5'));
					optionPart1.title.text=typeList[4].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index4.lr}');
					myChart5.setOption(optionPart1);
				} */
				
			}else if(type==7){ //税金
				var chart7 = echarts.init(document.getElementById('tab7'));
				optionPart2.xAxis[0].data=arrData('${map.data1.xAxis_this}');
				optionPart2.yAxis[0].name="总量（万元）";
				optionPart2.series[0].data=arrData('${map.data1.sj._this}');
				optionPart2.series[1].data=arrData('${map.data1.sj._last}');
				optionPart2.series[2].data=arrData('${map.data1.sj._before}');
				chart7.setOption(optionPart2);
				
				if(isExit(typeList[0])){
					var myChart1 = echarts.init(document.getElementById('part1'));
					optionPart1.series[0].type='bar';
					optionPart1.title.text=typeList[0].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index0.sj}');
					myChart1.setOption(optionPart1);
				}
				
				if(isExit(typeList[2])){
					var myChart3 = echarts.init(document.getElementById('part3'));
					optionPart1.title.text=typeList[2].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index2.sj}');
					myChart3.setOption(optionPart1);
				}
				
				if(isExit(typeList[3])){
					var myChart4 = echarts.init(document.getElementById('part4'));
					optionPart1.title.text=typeList[3].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index3.sj}');
					myChart4.setOption(optionPart1);
				}
				
				if(isExit(typeList[1])){
					var myChart2 = echarts.init(document.getElementById('part2'));
					optionPart1.title.text=typeList[1].typeName+"（单位：万元）";
					optionPart1.series[0].type='line';
					optionPart1.series[0].data=arrData('${map.data2.index1.sj}');
					myChart2.setOption(optionPart1);
				}
				
				/* if(isExit(typeList[4])){
					var myChart5 = echarts.init(document.getElementById('part5'));
					optionPart1.title.text=typeList[4].typeName+"（单位：万元）";
					optionPart1.series[0].data=arrData('${map.data2.index4.sj}');
					myChart5.setOption(optionPart1);
				} */
				
			}
			
		});
	})
</script>
<script>
$(function(){
		//var typeList = eval('(' + '${map.typeList}' + ')');
		var typeList = ${map.typeList};
		if(isExit(typeList[0])){
			var myChart1 = echarts.init(document.getElementById('part1'));
			optionPart1.title.text=typeList[0].typeName+"（单位：万元）";
			optionPart1.series[0].data=arrData('${map.data2.index0.gyzjz}');
			optionPart1.series[0].itemStyle.normal.color="#ff7f50";
			myChart1.setOption(optionPart1);
		}
		
		if(isExit(typeList[2])){
			var myChart3 = echarts.init(document.getElementById('part3'));
			optionPart1.title.text=typeList[2].typeName+"（单位：万元）";
			optionPart1.series[0].data=arrData('${map.data2.index2.gyzjz}');
			optionPart1.series[0].itemStyle.normal.color="#5cc600";
			myChart3.setOption(optionPart1);
		}
		
		if(isExit(typeList[3])){
			var myChart4 = echarts.init(document.getElementById('part4'));
			optionPart1.title.text=typeList[3].typeName+"（单位：万元）";
			optionPart1.series[0].data=arrData('${map.data2.index3.gyzjz}');
			optionPart1.series[0].itemStyle.normal.color="#01c5ff";
			myChart4.setOption(optionPart1);
		}
				
		if(isExit(typeList[1])){
			var myChart2 = echarts.init(document.getElementById('part2'));
			optionPart1.title.text=typeList[1].typeName+"（单位：万元）";
			optionPart1.series[0].type='line';
			optionPart1.series[0].data=arrData('${map.data2.index1.gyzjz}');
			optionPart1.series[0].itemStyle.normal.color="#ce0867";
			myChart2.setOption(optionPart1);
		}
		
		if(isExit(typeList[4])){
			var myChart5 = echarts.init(document.getElementById('part5'));
			optionPart1.title.text=typeList[4].typeName+"（单位：万元）";
			optionPart1.series[0].data=arrData('${map.data2.index4.gyzjz}');
			optionPart1.series[0].itemStyle.normal.color="#feff02";
			myChart5.setOption(optionPart1);
		}
		
		if(isExit(typeList[5])){
			var myChart6 = echarts.init(document.getElementById('part6'));
			optionPart1.title.text=typeList[5].typeName+"（单位：万元）";
			optionPart1.series[0].data=arrData('${map.data2.index5.lr}');
			optionPart1.series[0].itemStyle.normal.color="#feff02";
			myChart6.setOption(optionPart1);
		}
		
		if(isExit(typeList[6])){
			var myChart7 = echarts.init(document.getElementById('part7'));
			optionPart1.title.text=typeList[6].typeName+"（单位：万元）";
			optionPart1.series[0].data=arrData('${map.data2.index6.sj}');
			optionPart1.series[0].itemStyle.normal.color="#01c5ff";
			myChart7.setOption(optionPart1);
		}
		
		
		var chart1 = echarts.init(document.getElementById('tab1'));
		optionPart2.xAxis[0].data=arrData('${map.data1.xAxis_this}');
		optionPart2.yAxis[0].name="总量（万元）";
		optionPart2.series[0].data=arrData('${map.data1.gyzjz._this}');
		optionPart2.series[1].data=arrData('${map.data1.gyzjz._last}');
		optionPart2.series[2].data=arrData('${map.data1.gyzjz._before}');
		chart1.setOption(optionPart2);
		
		var year = '${year}';
		if(year==2017||year==2018){
			$("#zyywsr").click();
		}
		
		
	});
	
	function isExit(obj){
		if(obj==null||obj==''||obj=='undefined'){
			return false;
		}else{
			return true;
		}
	}
	
	var optionPart1 = {
			backgroundColor: '#082F56', 
			title : {
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:14
		        },
		        left:15,
		        top:10
		    },
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:'6%',
		    	right: '5%',
				itemWidth:25,
				itemHeight:12,
		        data:[
					{name:'总量',textStyle:{color:"#FCFF00"}},
				]
		    },
		    grid: {
		    	top:'40%',
		    	bottom:'5%',
		    	heigth:'60%',
		        containLabel: true,
		    },
		    xAxis: [
		        {
		            type: 'category',
		            data: ['1-3月','1-6月','1-9月','1-12月'],
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	}
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            name: '总量',
		            nameTextStyle:{
		            	color: '#5EC9F4'
		            },
		            axisLabel: {
		                formatter: '{value} '
		            },
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	splitLine:{
		        		lineStyle:{
		        			opacity:0.2
		        		}
		        	}
		        }
		    ],
		    series: [
		        {
		            name:'总量',
		            type:'bar',
		            data:[0,0,0,0],
		            barWidth:'25%',
		            areaStyle: {
		            	normal: {
		            		opacity: 0.2
		            	}
		        	},
		            markPoint : {
		            	symbolSize : 35,
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ],
		                label:{
		            		normal:{
		            			textStyle:{
			            			color:"#000"
		            			}
		            		}
		            	},
		            	itemStyle:{
		            		normal:{
		            			color:"#FCFF00"
		            		}
		            	}
		            },
		            markLine : {
		            	lineStyle:{
			            	normal:{
			            		color:"#FF7F50"
			            	},
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            },
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#FF7F50'
		            	}
		            }
		        }
		    ]
	};
	
	
	var optionPart2 = {
			backgroundColor: '#082F56', 
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:5,
		        data:[
					{name:'${year}',textStyle:{color:"#FCFF00"}},
					{name:'${year-1}',textStyle:{color:"#FCFF00"}},
					{name:'${year-2}',textStyle:{color:"#FCFF00"}}
				]
		    },
		    grid: {
		    	bottom:'5%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ['有色金属','新型建材','食品医药','智能装备','其他'],
		        	axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	}
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {
		                formatter: '{value} '
		            },
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	splitLine:{
		        		lineStyle:{
		        			opacity:0.2
		        		}
		        	}
		        }
		    ],
		    series : [
		        {
		            name:'${year}',
		            type:'bar',
		            barWidth:'20%',
		            data:[0,0,0,0,0],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'} 
		                ],
		                label:{
		                	normal:{
		                		textStyle:{
			            			color:"#000"
		            			}
		                	}
		                }
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ],
		                lineStyle:{
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            }
		            },
		            itemStyle:{
		            	normal:{
		            		color:function(params){
		            			var index = params.dataIndex;//表示当前的数据条的索引
		            		    var alternateNumber = 5;//表示按几种颜色交替出现

		            		    var newColor="";//表示最终显示的颜色
		            		    /**
		            		    自定义的颜色池
		            		    如果颜色池长度不够，将无法取得正确的颜色，所以有必要使
		            		    index的最大值小于colorList.length
		            		    */
		            		    var colorList = ['#01c5ff','#01c5ff','#01c5ff','#01c5ff','#01c5ff',
		            		                     '#01c5ff','#ce0867','#feff02','#ff7f50','#5cc600',
		            		                     '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
		            		                    ];
		            		    //当当前的索引值小于交替值的时候
		            		    if(index < alternateNumber){
		            		        //取出当前索引值对应的colorList的颜色
		            		        newColor = colorList[index];

		            		    }else{
		            		        /**当当前的索引值大于等于交替值的时候*/
		            		        var rowNumber=Math.floor(index/alternateNumber);//表示当前的数据出现在几次
		            		        //通过表达式计算返回正确的colorList索引
		            		        newColor = colorList[index-rowNumber*alternateNumber];
		            		        
		            		    }

		            		    return newColor;
		            		}
		            	}
		            }
		        },
		        {
		            name:'${year-1}',
		            type:'line',
		            data:[0,0,0,0,0],
		            itemStyle: {
		            	normal: {
		            		color: '#01c5ff'
		            	}
		            }
		        },
		        {
		            name:'${year-2}',
		            type:'line',
		            data:[0,0,0,0,0],
		            itemStyle: {
		            	normal: {
		            		color: '#ffea01'
		            	}
		            }
		        }
		    ]
		};
	
	var arrData = function (data) {
		var arr = new Array();
		if(data!=null&&data!=''){
			//var str = eval('(' + data + ')');
			var str = JSON.parse(data);
			for(var i=0;i<str.length;i++){
				arr.push(str[i]);;
			}
		}
		return arr;
	};
	
	var arrData1 = function (data) {
		var arr = new Array();
		if(data!=null&&data!=''){
			//var str = eval('(' + data + ')');
			var str = JSON.parse(data);
			for(var i=0;i<str.length;i++){
				arr.push(str[str.length-i-1]);;
			}
		}
		return arr;
	};
	
	function selectByYear(year){
		$("#year").val(year);
		$("#form").submit();
	}
	
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	    	var orgAreaId ='${orgAreaId}';
	        if(e.wheelDelta>0){ //向上滚动事件 
	        	window.location.href="${ctx}/front/parkDataCenter/parkEconomic?orgId=${orgId}";
	        }else{   //向下滚动事件 
	        	window.location.href="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) {  //向上滚动事件
	        	 window.location.href="${ctx}/front/parkDataCenter/parkEconomic?orgId=${orgId}";
	         }else{  //向下滚动事件
	        	 window.location.href="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}";
	         }  
	    } //ScrollText(direct);   
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
</script>
</head>

<body>
	<div class="data_main">
		<form action="${ctx}/front/parkDataCenter/industryEconomic" method="post" id="form">
			<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
			<input type="hidden" id="orgId" name="orgId" value="${orgId}"/>
			<input type="hidden" id="year" name="year" value="${year}"/>
		</form>
		<div class="data_header">
			<div style="float: left; margin-left: 25%;">
				<img src="${ctx}/static/image/parkDataCenter/LOGO1.png" style="margin-top: 3%;" height="42px">
			</div>
			<div style="float: left; color: #6DCCF6; border-left: 1px solid #6DCCF6; margin-top: 8px; padding-left: 15px; height: 60px;"
				id="dateBar" class="dateBar"></div>
			<div style="float: right;margin-right: 2%;margin-top: 2%;">
				<button id="btnYear" class="dropdownButton" type="button"><span id="yearText">${year}年</span><span class="caret"></span></button>
				<ul id="yearMenu" class="dropdownMenu">
					<li><a href="javascript:;" onclick="selectByYear('2018')">2018年</a></li>
					<li><a href="javascript:;" onclick="selectByYear('2017')">2017年</a></li>
					<li><a href="javascript:;" onclick="selectByYear('2016')">2016年</a></li>
					<li><a href="javascript:;" onclick="selectByYear('2015')">2015年</a></li>
				</ul>
			</div>
		</div>
		<div class="data_content">
			<div style="width: 100%; height: 100%; float: left;">
				<div style="width: 33.7%; height: 68%; float: right;">
					<div class="data_contentLeft" style="width: 98%; height: 100%; margin-left: 2%;">
						<div class="dataBar_3_top" id="part4" style="height: ${year eq 2018?'76%':''};margin-top: ${year eq 2018?'21.5%':''};-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
						<div class="dataBar_3_btm" id="part5" style="display:${year eq 2018?'none':''}; margin-bottom: 0px; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
					</div>
				</div>
				<div
					style="width: 66.3%; height: 50px; line-height: 50px; float: left;">
					<div style="background-color: #AFE7FE; width: 3px; height: 20px; float: left; margin-top: 15px;"></div>
					<span style="float: left; margin-left: 10px; font-size: 22px; color: #AFE7FE;">产业经济指标</span>
				</div>
				<div style="width: 66.3%; height: 59.4%; float: left;">
					<div style="width: 100%; height: 13%;">
						<c:choose>
							<c:when test="${year eq 2018}">
								<div name="title" class="echarts-title1" data="1" style="display: none;">工业增加值</div>
								<div name="title" class="echarts-title" style="margin-left: 0%;" data="2" id="zyywsr">主营业务收入</div>
								<div name="title" class="echarts-title" data="3" style="display: none;">利税总额</div>
								<div name="title" class="echarts-title" data="4" style="display: none;">用电量</div>
								<div name="title" class="echarts-title" data="5" style="display: none;">平均从业人数</div>
								<div name="title" class="echarts-title" data="6">利润总额</div>
								<div name="title" class="echarts-title" data="7">税金总额</div>	
							</c:when>
							<c:when test="${year eq 2017}">
								<div name="title" class="echarts-title1" data="1" style="display: none;">工业增加值</div>
								<div name="title" class="echarts-title" style="margin-left: 0%;" data="2" id="zyywsr">主营业务收入</div>
								<div name="title" class="echarts-title" data="3">利税总额</div>
								<div name="title" class="echarts-title" data="4">用电量</div>
								<div name="title" class="echarts-title" data="5">平均从业人数</div>
								<div name="title" class="echarts-title" data="6" style="display: none;">利润总额</div>
								<div name="title" class="echarts-title" data="7" style="display: none;">税金总额</div>	
							</c:when>
							<c:otherwise>
								<div name="title" class="echarts-title1" style="margin-left: 0%;" data="1">工业增加值</div>
								<div name="title" class="echarts-title" data="2" id="zyywsr">主营业务收入</div>
								<div name="title" class="echarts-title" data="3">利税总额</div>
								<div name="title" class="echarts-title" data="4">用电量</div>
								<div name="title" class="echarts-title" data="5">平均从业人数</div>
								<div name="title" class="echarts-title" data="6" style="display: none;">利润总额</div>
								<div name="title" class="echarts-title" data="7" style="display: none;">税金总额</div>	
							</c:otherwise>
						</c:choose>
						
						
					</div>
					<div id="tab1" name="echarts-map" class="echarts-map">1</div>
					<div id="tab2" name="echarts-map" class="echarts-map1">2</div>
					<div id="tab3" name="echarts-map" class="echarts-map1">3</div>
					<div id="tab4" name="echarts-map" class="echarts-map1">4</div>
					<div id="tab5" name="echarts-map" class="echarts-map1">5</div>
					<div id="tab6" name="echarts-map" class="echarts-map1">6</div>
					<div id="tab7" name="echarts-map" class="echarts-map1">7</div>
				</div>
				<div style="width: 100%; height: 30.5%; float: left;">
					<div class="data_contentLeft"
						style="width: 100%; height: 99.5%; margin-top: 0.5%;">
						<div class="dataBar_4_left" id="part1"
							style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
						<div class="dataBar_4_mid" id="part2"
							style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
						<div class="dataBar_4_right" id="part3"
							style="margin-right: 0px; -moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/parkDataCenter/parkEconomic?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}">
</body>
</html>
