<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>大数据中心</title>
<link href="${ctx}/static/css/dataCenter/xlDataCenter.css" rel="stylesheet"/>
</head>

<body>
<div class="data_main">
	<div class="data_header">
		<img src="${ctx}/static/image/dataCenter/head2.png" width="100%">
		<img src="${ctx}/static/image/dataCenter/LOGO2.png" width="35%" class="dataLogo">
		<div class="data_weather">
			<div class="weather"> 
		        <iframe src="http://m.weather.com.cn/m/pn3/weather.htm?id=101240101T " width="190" height="20" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no"></iframe>
		    </div>
		</div>
	</div>
	<div class="data_content">
		<div class="dropdownBar">
			<button id="btnYear" class="dropdownButton" type="button">2016年 <span class="caret"></span></button>
			<ul id="yearMenu" class="dropdownMenu">
				<li><a href="javascript:;">选项1</a></li>
				<li><a href="javascript:;">选项2</a></li>
				<li><a href="javascript:;">选项3</a></li>
				<li><a href="javascript:;">选项4</a></li>
			</ul>
			<button id="btnQuarter" class="dropdownButton" type="button">第三季度 <span class="caret"></span></button>
			<ul id="quarterMenu" class="dropdownMenu" style="right:12px;">
				<li><a href="javascript:;">选项1</a></li>
				<li><a href="javascript:;">选项2</a></li>
				<li><a href="javascript:;">选项3</a></li>
				<li><a href="javascript:;">选项4</a></li>
			</ul>
		</div>
		
		<div class="data_contentLeft" style="width:40%;">
			<iframe src="http://134.225.108.140:8080/park!index?year=2016&month=06&type=1" style="height: 98%;width: 96%;"></iframe>
		</div>
		
		<div class="data_contentRight" style="width:60%;">
			<div class="dataBarTop clearfix" style="height:22%;">
				<div class="dataBarGreen" style="width:24.55%;">
					<div class="dataBarTitle">落户企业</div>
					<div class="dataBarNum"><font class="yellowFont24">104</font></div>
					<div class="dataBarIncrease"></div>
				</div>
				<div class="dataBarMagenta" style="width:24.55%;">
					<div class="dataBarTitle">工业增加值</div>
					<div class="dataBarNum"><font class="yellowFont24">4253.46</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont">9.4%</font></div>
				</div>
				<div class="dataBarNavy" style="width:24.55%;">
					<div class="dataBarTitle">主营业务收入</div>
					<div class="dataBarNum"><font class="yellowFont24">18330.76</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont">8.3%</font></div>
				</div>
				<div class="dataBarNavy" style="width:24.55%; margin-right:0;">
					<div class="dataBarTitle">利税总额</div>
					<div class="dataBarNum"><font class="yellowFont24">1956.72</font>亿元</div>
					<div class="dataBarIncrease">同比增长<font class="yellowFont">10.5%</font></div>
				</div>
			</div>
			<div class="dataBarBottom" style="height:76%;">
				<div class="dataBar_1" id="part1"></div>
				<div class="dataBar_1" id="part2"></div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>	
<script>
 $(function(){
	$("#btnYear").click(function(){		
    	var div = $("#yearMenu"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
	$("#btnQuarter").click(function(){		
    	var div = $("#quarterMenu"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
 })
</script>	
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.js"></script>
<script type="text/javascript">
var myChart1 = echarts.init(document.getElementById('part1'));
var optionPart1 = {
		backgroundColor: '#082F56',
		title: {
	        text: '江西省园区工业增加值增长速度（%）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:14
	        },
	        left:5,
	        top:5
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	    	top:5,
			right:'2%',
	        data:[
				{name:'总量',textStyle:{color:"#FCFF00"}},
				{name:'同比增速',textStyle:{color:"#FCFF00"}}
			]
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        axisLine:{
        		lineStyle:{
        			color:"#5EC9F4"
        		}
        	},
	        data: ['周一','周二','周三','周四','周五','周六','周日']
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} °C'
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
	    },
	    series: [
	        {
	            name:'总量',
	            type:'line',
	            data:[11, 11, 15, 13, 12, 13, 10],
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        },
	        {
	            name:'同比增速',
	            type:'line',
	            data:[1, -2, 2, 5, 3, 2, 0],
	            markPoint: {
	                data: [
	                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        }
	    ]
};

myChart1.setOption(optionPart1);


var myChart2 = echarts.init(document.getElementById('part2'));
var optionPart2 = {
		backgroundColor: '#082F56',
		title: {
	        text: '折线图堆叠',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:14
	        },
	        left:5,
	        top:5
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        axisLine:{
        		lineStyle:{
        			color:"#5EC9F4"
        		}
        	},
	        data: ['周一','周二','周三','周四','周五','周六','周日']
	    },
	    yAxis: {
	        type: 'value',
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
	    },
	    series: [
	        {
	            name:'邮件营销',
	            type:'line',
	            stack: '总量',
	            data:[120, 132, 101, 134, 90, 230, 210]
	        },
	        {
	            name:'联盟广告',
	            type:'line',
	            stack: '总量',
	            data:[220, 182, 191, 234, 290, 330, 310]
	        },
	        {
	            name:'视频广告',
	            type:'line',
	            stack: '总量',
	            data:[150, 232, 201, 154, 190, 330, 410]
	        },
	        {
	            name:'直接访问',
	            type:'line',
	            stack: '总量',
	            data:[320, 332, 301, 334, 390, 330, 320]
	        },
	        {
	            name:'搜索引擎',
	            type:'line',
	            stack: '总量',
	            data:[820, 932, 901, 934, 1290, 1330, 1320]
	        }
	    ]
};

myChart2.setOption(optionPart2);
	
</script>
</body>
</html>
