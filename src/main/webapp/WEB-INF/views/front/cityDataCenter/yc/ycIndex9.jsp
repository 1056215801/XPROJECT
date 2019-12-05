<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/style.min.css?v=4.1.0" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/plugins/iCheck/custom.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/plugins/ztree/metroStyle/metroStyle.css" rel="stylesheet">
<link href="${ctx}/static/css/cityDataCenter/yc_bigDataCenter.css" rel="stylesheet" />
<link href="${ctx}/static/css/cityDataCenter/yc_liDianBigDataCenter.css" rel="stylesheet" />

<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<title>宜春市工业大数据中心</title>
<style type="text/css">
.focusOn{
	background-color: #0590C9;
	color: #fff !important;
}
.lableBox{
	width: 350px;background-color: #fff;color: #000;border-radius: 10px; 
}
.lable{
	padding: 10px;
}
.lableTitle{
	background-color: #2A87FE;color: #fff;
}
.lableIcon{
	width: 10px;height: 10px;display: block;float: left;margin-top: 5px;margin-right: 10px;
}
</style>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
	<div class="data_main">
		<div class="data_header">
			<img alt="" height="42px" src="${ctx}/static/image/cityDataCenter/main-logo.png">
			<div class="local-date">
				<p>2018年1月1号</p>
				<h1>00:00:00</h1>
			</div>
			<img class="statusTip" src="${ctx}/static/image/cityDataCenter/yc/jx.png" style="width: 55px; cursor: pointer;" onclick="window.location.href='https://test.inpark.com.cn/XProject/front/dataCenter/organizationCount?orgId=3600009&linkId=3609009'">
		</div>
		<div id="wrapper" class="data_content" style="padding: 0px; background-color: transparent; height: calc(100% - 79px); height: -moz-calc(100% - 79px); height: -webkit-calc(100% - 79px);">
			<nav class="navbar-default navbar-static-side" role="navigation">
				<div class="nav-close">
					<i class="fa fa-times-circle"></i>
				</div>
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu"></ul>
				</div>
			</nav>
			<div id="page-wrapper" class="dashbard-1">
				<div class="row J_mainContent" id="content-main" style="height: 100%;">
					<div style="width: 100%; height: 100%; padding: 20px;">
						<div style="height: 100%; width: 100%;">
							<div class="titleType">【<font id="menuTitle">碳酸锂 </font>】价格行情走势图</div>
							<div class="content">
								<div class="subtitles" id="subtitles">
									<span>
										<img src="${ctx}/static/image/cityDataCenter/checked.png" width="16px" height="16px" style="margin-top: -2px;">
										&nbsp;&nbsp;电池级碳酸锂&nbsp;&nbsp;Li2CO3:&nbsp;&nbsp;≥&nbsp;&nbsp;99.5%
									</span>
									<span style="margin-left: 15px; margin-right: 15px;">
										<img src="${ctx}/static/image/cityDataCenter/checked.png" width="16px" height="16px" style="margin-top: -2px;">
										&nbsp;&nbsp;工业级碳酸锂&nbsp;&nbsp;Li2CO3:&nbsp;&nbsp;≥&nbsp;&nbsp;99.9%
									</span>
								</div>
								<div class="downLine"></div>
								<div class="selectLabels" style="position: relative;">
									<span class="selectBtn on" onclick="loadData('1')">当日</span>
									<span class="selectBtn" onclick="loadData('2')">近一周</span>
									<span class="selectBtn" onclick="loadData('3')">近一年</span>
									<div style="float: right; width: 40%; height: 100%; text-align: right;">
										<span class="downLoadBtn" style="margin-right: 40px;"><i class="fa fa-download"></i>下载数据</span>
									</div>
								</div>
								<div class="dataShow">
									<div class="dataDiv" id="day" style="display: none; " >
										<table class="table table-bordered" style="width: 100%; height: 100%;">
											<thead >
												<tr>
													<th>日期</th><th>产品</th><th>指标</th>
													<th>价格类型</th><th>价格</th><th>涨跌额</th>
													<th>单位</th><th>更新时间</th>
												</tr>
											</thead>
											<tbody id="dayTable"></tbody>
										</table>
									</div>
									<div class="dataDiv" style="display: none;" id="week"></div>
									<div class="dataDiv" style="display: none;" id="year"></div>
									<div class="dataDiv" style="display: none;text-align: center;padding-top: 10%;font-size: 60px;color: #75D5FF;letter-spacing: 50px;" id="noData">
										暂无数据
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="btn_prev" onclick="window.location.href='${ctx}/front/cityDataCenter/index/8?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/cityDataCenter/index/1?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}">
	<input type="hidden" id="ids" name="ids" value="${ids}">
	<input type="hidden" id="names" name="names" value="${names}">
</body>
	<script src="${ctx}/static/js/dataCenter/ld.js"></script>
	<script type="text/javascript">
		$(function() {
			setTime();
			setInterval(setTime, 1000);
			$(".selectLabels .selectBtn").click(function() {
				$(".selectLabels>span").each(function() {
					$(this).removeClass("on");
				});
				$(this).addClass("on");
			});

			createMenu();
			/*页面定时跳转事件*/
		 //	initScreenSaver();
			
			loadData(1);
		});
		
		function setTime() {
			var date = new Date();
			var localDate = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";
			var localSec = date.getSeconds();
			if (localSec < 10) {
				localSec = "0" + localSec;
			} else {
				localSec = date.getSeconds();
			}
			var localTime = date.getHours() + ":" + date.getMinutes() + ':' + localSec;
			$(".local-date p").text(localDate);
			$(".local-date h1").text(localTime);
		};
		
		function createMenu(){
			var pId = "${pId}";
			var id = "${industryId}";
			
			for (var i = 0; i < list1.length; i++) {
				var str = '';
				if(list1[i].id == pId){
					str += '<li class="active"><a href="javascript:void(0);"><img src="${ctx}/static/image/cityDataCenter/icon0.png" width="15px" height="14px" />';
				}else{
					str += '<li><a href="javascript:void(0);"><img src="${ctx}/static/image/cityDataCenter/icon1.png" width="15px" height="14px" />';
				}
				
				str += '<span class="nav-label">'+list1[i].name+'</span>';
				str += '<span class="fa arrow"></span></a><ul class="nav nav-second-level">';
				for (var j = 0; j < list2.length; j++) {
					if(list1[i].id == list2[j].pId){
						if(list2[j].id == id){
							cutMenu(id, list2[j].name);
							str += '<li><a id="'+list2[j].id+'" class="J_menuItem focusOn" href="javascript:void(0);" onclick="cutMenu(\''+list2[j].id+'\',\''+list2[j].name+'\');">'+list2[j].name+'</a></li>';
						}else{
							str += '<li><a id="'+list2[j].id+'" class="J_menuItem" href="javascript:void(0);" onclick="cutMenu(\''+list2[j].id+'\',\''+list2[j].name+'\');">'+list2[j].name+'</a></li>';
						}
						str += '';
					}
				}
				str += '</ul></li>';
				$("#side-menu").append(str);
			}
			
		}
		
		function cutMenu(id, name) {
			$("#side-menu li ul li a").each(function(){
				$(this).removeClass("focusOn");
			});
			$(".selectLabels>span").each(function() {
				$(this).removeClass("on");
			});
			$(".selectLabels span").eq(0).addClass("on");
			$("#"+id).addClass("focusOn");
			$("#subtitles").empty();
			$("#menuTitle").empty();
			$("#menuTitle").append(name);
			var ids = '';
			var names = '';
			for (var i = 0; i < list3.length; i++) {
				if (list3[i].pId == id) {
					var str = '<span style="margin-left: 15px;margin-right: 15px;"><img src="${ctx}/static/image/cityDataCenter/checked.png" width="16px" height="16px" style="margin-top: -2px;">&nbsp;' + list3[i].name + '</span>';
					$("#subtitles").append(str);
					ids += (list3[i].id + ',');
					names += (list3[i].name + ',');
				}
			}
			$("#ids").val(ids);
			$("#names").val(names);
			loadData(1);
		}
		
		$(window).load(function(){
			$("#focusOn").focus();
			$("#side-menu li").click(function() {
				$("#side-menu li a img").attr("src", "${ctx}/static/image/cityDataCenter/icon1.png");
				if ($(this).hasClass("active")) {
					$(".active a img").attr("src", "${ctx}/static/image/cityDataCenter/icon0.png");
				}
			});
		})
		
		function loadData(type){
			
			var ids = $("#ids").val();
			var names = $("#names").val();
			
			var idsArr = ids.split(",");
			var namesArr = names.split(",");

			$.ajax({
				url:'${ctx}/interface/json/ldDataCenter/yc/ldData',
				type:'post',
				data:{'ids':ids, 'type':type},
				success:function(result){
					if(type==1){
						$("#dayTable").empty();
						var tr = '';
						
						var date = new Date();
						if(date.getHours()<10){
							date.setTime(date.getTime()-24*60*60*1000);
						}
						var time = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
						
						var data = result.ldData;

						if(idsArr.length>3){
							option.yAxis[1].name='元/公斤';
						}else{
							option.yAxis[1].name='';
						}
						
						if(ids.indexOf(130101)!=-1){
							$("#day").show();
							$("#week,#year").hide();
							tr += '<tr>'
								+'<td>'+time+'</td>'
								+'<td class="color1" rowspan="2">'+data[idsArr[0]].record.PARENT_NAME+'</td>'
								+'<td rowspan="2">'+data[idsArr[0]].record.INDUSTRY_NAME+'</td>'
								+'<td>'+data[idsArr[0]].record.PRICE_TYPE+'</td>'
								+'<td class="bgColor">'+(data[idsArr[0]].record.AVE_PRICE/10000).toFixed(1)+'</td>'
								+'<td class="color2">'+(data[idsArr[0]].record.CHANGE_PRICE/10000)+'</td>'
								+'<td>万'+data[idsArr[0]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
								+'<tr>'
								+'<td>'+time+'</td>'
								+'<td>成交价最低/最高</td>'
								+'<td>'+(data[idsArr[0]].record.MIN_PRICE/10000).toFixed(1)+'-'+(data[idsArr[0]].record.MAX_PRICE/10000).toFixed(1)+'</TD>'
								+'<td></td>'
								+'<td>万'+data[idsArr[0]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
								+'<tr>'
								+'<td>'+time+'</td>'
								+'<td class="color1" rowspan="2">'+data[idsArr[1]].record.PARENT_NAME+'</td>'
								+'<td rowspan="2">'+data[idsArr[1]].record.INDUSTRY_NAME+'</td>'
								+'<td>'+data[idsArr[1]].record.PRICE_TYPE+'</td>'
								+'<td class="bgColor">'+(data[idsArr[1]].record.AVE_PRICE/10000).toFixed(1)+'</td>'
								+'<td class="color2">'+(data[idsArr[1]].record.CHANGE_PRICE/10000)+'</td>'
								+'<td>万'+data[idsArr[1]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
								+'<tr>'
								+'<td>'+time+'</td>'
								+'<td>成交价最低/最高</td>'
								+'<td>'+(data[idsArr[1]].record.MIN_PRICE/10000).toFixed(1)+'-'+(data[idsArr[1]].record.MAX_PRICE/10000).toFixed(1)+'</td>'
								+'<td></td>'
								+'<td>万'+data[idsArr[1]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
						}else if(ids.indexOf(130201)!=-1){
							$("#day").show();
							$("#week,#year").hide();
							tr += '<tr>'
								+'<td>'+time+'</td>'
								+'<td class="color1" rowspan="4">'+data[idsArr[0]].record.PARENT_NAME+'</td>'
								+'<td rowspan="2">'+data[idsArr[0]].record.INDUSTRY_NAME+'</td>'
								+'<td>'+data[idsArr[0]].record.PRICE_TYPE+'</td>'
								+'<td class="bgColor">'+(data[idsArr[0]].record.AVE_PRICE/10000).toFixed(1)+'</td>'
								+'<td class="color2">'+(data[idsArr[0]].record.CHANGE_PRICE/10000)+'</td>'
								+'<td>万'+data[idsArr[0]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
								+'<tr>'
								+'<td>'+time+'</td>'
								+'<td>成交价最低/最高</td>'
								+'<td>'+(data[idsArr[0]].record.MIN_PRICE/10000).toFixed(1)+'-'+(data[idsArr[0]].record.MAX_PRICE/10000).toFixed(1)+'</td>'
								+'<td></td>'
								+'<td>万'+data[idsArr[0]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
								+'<tr>'
								+'<td>'+time+'</td>'
								+'<td rowspan="2">'+data[idsArr[1]].record.INDUSTRY_NAME+'</td>'
								+'<td>'+data[idsArr[1]].record.PRICE_TYPE+'</td>'
								+'<td class="bgColor">'+(data[idsArr[1]].record.AVE_PRICE/10000).toFixed(1)+'</td>'
								+'<td class="color2">'+(data[idsArr[1]].record.CHANGE_PRICE/10000)+'</td>'
								+'<td>万'+data[idsArr[0]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
								+'<tr>'
								+'<td>'+time+'</td>'
								+'<td>成交价最低/最高</td>'
								+'<td>'+(data[idsArr[1]].record.MIN_PRICE/10000).toFixed(1)+'-'+(data[idsArr[1]].record.MAX_PRICE/10000).toFixed(1)+'</td>'
								+'<td></td>'
								+'<td>万'+data[idsArr[1]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
								+'<tr>'
								+'<td>'+time+'</td>'
								+'<td class="color1" rowspan="2">'+data[idsArr[2]].record.PARENT_NAME+'</td>'
								+'<td rowspan="2">'+data[idsArr[2]].record.INDUSTRY_NAME+'</td>'
								+'<td>'+data[idsArr[2]].record.PRICE_TYPE+'</td>'
								+'<td class="bgColor">'+data[idsArr[2]].record.AVE_PRICE+'</td>'
								+'<td class="color2">'+data[idsArr[2]].record.CHANGE_PRICE+'</td>'
								+'<td>'+data[idsArr[2]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>'
								+'<tr>'
								+'<td>'+time+'</td>'
								+'<td>成交价最低/最高</td>'
								+'<td>'+data[idsArr[2]].record.MIN_PRICE+'-'+data[idsArr[2]].record.MAX_PRICE+'</td>'
								+'<td></td>'
								+'<td>'+data[idsArr[2]].record.UNIT+'</td>'
								+'<td>10:00</td>'
								+'</tr>';
						}else{
							$("#day,#week,#year").hide();
							$("#noData").show();
						}
						
						$("#dayTable").append(tr);
						
					}else if(type==2){
						
						if(ids.indexOf(130101)!=-1||ids.indexOf(130201)!=-1){
							$("#day,#year").hide();
							$("#week").show();
							var chart = echarts.init(document.getElementById('week'));
							
							var legend = [];
							var color = ['#596EFF', '#28BBFF', '#FF5D5E'];
							for(var i=0;i<namesArr.length;i++){
								if(namesArr[i]==null||namesArr[i]==''){
									continue;
								}
								var legendIndex = {
									name : namesArr[i],
									textStyle : {color:color[i]},
								};
								legend.push(legendIndex);
							}
							
							option.legend.data=legend;
							
							option.legend.selected={
								'单水氢氧化锂（LiOH :≥56.5%;Na:≤0.002% ）':true,
								'单水氢氧化锂（LiOH :≥96%;Na:≤0.003%  ）':true,
								'电池级氢氧化锂（LiOH:99% ）':false
							};
							
							var series = [];
							for(var i=0;i<idsArr.length;i++){
								
								if(idsArr[i]==null||idsArr[i]==''){
									continue;
								}
								var data = [];
								var rst = result.ldData[idsArr[i]];
								for (var j = 0; j < rst.length; j++) {
								    data.push(rst[j].value);
								}
								
								var seriesIndex = {
									name: namesArr[i],
							        type: 'bar',
							        barWidth: 25,
							        yAxisIndex : i>1?1:0,
							        itemStyle : {normal:{color:color[i]}},
							        data: data
								};
								series.push(seriesIndex);
							}
							
							option.xAxis.type='category';
							
							if(nowDate.getHours()<10){
								var xAxis = [];
								var str = result.ldData.xAxis;
								for(var j=0;j<str.length;j++){
									var n = new Date(str[j])
									n = new Date(n-oneDay);
									xAxis.push(n.getFullYear()+'-'+(n.getMonth()+1)+'-'+n.getDate());
								}
								option.xAxis.data=xAxis;
							}else{
								option.xAxis.data=result.ldData.xAxis;
							}
							option.series=series;
							chart.setOption(option);
						}else{
							$("#day,#week,#year").hide();
							$("#noData").show();
						}
						
					}else{
						
						if(ids.indexOf(130101)!=-1||ids.indexOf(130201)!=-1){
							$("#day,#week").hide();
							$("#year").show();
							var chart = echarts.init(document.getElementById('year'));
							
							var legend = [];
							var color = ['#FDD901', '#FF2CEA', '#3ace1f'];
							for(var i=0;i<namesArr.length;i++){
								if(namesArr[i]==null||namesArr[i]==''){
									continue;
								}
								var legendIndex = {
									name : namesArr[i],
									textStyle : {color:color[i]}
								};
								legend.push(legendIndex);
							}
							
							option.legend.data=legend;
							
							option.legend.selected={
								'单水氢氧化锂（LiOH :≥56.5%;Na:≤0.002% ）':true,
								'单水氢氧化锂（LiOH :≥96%;Na:≤0.003%  ）':true,
								'电池级氢氧化锂（LiOH:99% ）':false
							};
							
							var series = [];
							for(var i=0;i<idsArr.length;i++){
								
								if(nowDate.getHours()<10){
									now = + new Date(nowDate.getFullYear()-1, nowDate.getMonth(), nowDate.getDate()-1);
								}else{
									now = + new Date(nowDate.getFullYear()-1, nowDate.getMonth(), nowDate.getDate());
								}
								
								if(idsArr[i]==null||idsArr[i]==''){
									continue;
								}
								var data = [];
								var rst = result.ldData[idsArr[i]];
								for (var j = 0; j < rst.length; j++) {
								    data.push(randomData(rst[j].value));
								}
								
								var seriesIndex = {
									name: namesArr[i],
							        type: 'line',
							        yAxisIndex : i>1?1:0,
							        showSymbol: false,
							        hoverAnimation: false,
							        lineStyle : {normal:{color:color[i]}},
							        itemStyle : {normal:{color:color[i]}},
							        data:data
								};
								series.push(seriesIndex);
							}
							option.xAxis.type='time';
							option.series=series;
							chart.setOption(option);
						}else{
							$("#day,#week,#year").hide();
							$("#noData").show();
						}
						
					}
				},
				error:function(){
					layer.msg("数据访问超时，请稍后重试！");
				}
			})
			
		}
		
		var nowDate = new Date();
		var now;
		if(nowDate.getHours()<10){
			now = + new Date(nowDate.getFullYear()-1, nowDate.getMonth(), nowDate.getDate()-1);
		}else{
			now = + new Date(nowDate.getFullYear()-1, nowDate.getMonth(), nowDate.getDate());
		}
		var oneDay = 24 * 3600 * 1000;
		
		var value = Math.random() * 1000;
		function randomData(value) {
		    now = new Date(+now + oneDay);
		    return {
		        name: now.toString(),
		        value: [
		            [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('-'), Math.round(value)
		        ]
		    }
		}
		
		
		var option = {
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	bottom:'3%',
		    	x:'center',
		        data:[]
		    },
		    grid : {
				top : '10%',
				left : '5%',
				right : '5%',
				containLabel : true,
			},
		    yAxis: [{
		        type: 'value',
		        name: '元/吨',
		        boundaryGap: ['20%', '100%'],
		        scale:true,
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
		    },{
		        type: 'value',
		        name: '元/公斤',
		        boundaryGap: ['20%', '100%'],
		        scale:true,
		        axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	},
	        	splitLine:{
	        		lineStyle:{
	        			opacity:0
	        		}
	        	}
		    }],
		    xAxis: {
		        type: 'time',
		        splitLine: {
		            show: false
		        },
		        axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	},
		        data:[]
		    },
		    series: []
		};

	</script>
	<script src="${ctx}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${ctx}/static/js/hplus.min.js?v=4.1.0"></script>
	<script src="${ctx}/static/js/contabs.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/plugins/pace/pace.min.js"></script>
</html>