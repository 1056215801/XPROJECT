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
<script>
	function fnDate(){
		 var oDiv=document.getElementById("dateBar");
		 var date=new Date();
		 var year=date.getFullYear();
		 var month=date.getMonth();
		 var data=date.getDate();
		 var hours=date.getHours();
		 var minute=date.getMinutes();
		 var second=date.getSeconds();
		 var time="<span style='font-size:14px;'>"+year+"年"+fnW((month+1))+"月"+fnW(data)+"日</span><br /><span style='font-size:26px;'>"+fnW(hours)+":"+fnW(minute)+":"+fnW(second)+"</span>";
		 oDiv.innerHTML=time;
	}
	function fnW(str){
		str>9?num=str:num="0"+str;
		return num;
	}
	$(function(){
		setInterval(function(){ fnDate();},1000);
		$("#btnYear").click(function(){		
	   		var div = $("#yearMenu"); 
			if(div.css("display")=="none"){ 
		  		div.slideDown("fast"); 
			}else{ 
		  		div.slideUp("fast"); 
			} 
	   });
	})	    
</script>	
<script type="text/javascript">
	
	$(function(){
		/*页面定时跳转事件*/
		initScreenSaver();
		
		var myChart2 = echarts.init(document.getElementById('part2'));
		optionPart1.title.text="主营业务收入（单位：万元）"
		optionPart1.series[0].data=arrData('${map.data2.zyywsr}');
		optionPart1.series[0].itemStyle.normal.color="#01c5ff";
		myChart2.setOption(optionPart1);
		
		var myChart4 = echarts.init(document.getElementById('part4'));
		optionPart1.title.text="从业人员（单位：人）"
		optionPart1.series[0].data=arrData('${map.data2.cyry}');
		optionPart1.series[0].itemStyle.normal.color="#ff7f50";
		myChart4.setOption(optionPart1);
		
		var myChart3 = echarts.init(document.getElementById('part3'));
		optionPart1.title.text="利税总额（单位：万元）"
		optionPart1.series[0].data=arrData('${map.data2.ls}');
		optionPart1.series[0].itemStyle.normal.color="#feff02";
		optionPart1.series[0].type='line';
		myChart3.setOption(optionPart1);
		
		var myChart1 = echarts.init(document.getElementById('part1'));
		optionPart1.title.text="工业增加值（单位：万元）"
		optionPart1.series[0].data=arrData('${map.data2.gyzjz}');
		optionPart1.series[0].itemStyle.normal.color="#ce0867";
		if('${year}'==2017){
			optionPart1.series[0].markLine="";
		}
		optionPart1.series[0].type='bar';
		myChart1.setOption(optionPart1);
		
		
		optionPart2.yAxis.data=arrData1('${map.data3.yAxis}');
		var myChart6 = echarts.init(document.getElementById('part6'));
		optionPart2.title.text="主营业务收入（单位：万元）";
		optionPart2.series[0].data=arrData1('${map.data3.zyywsr}');
		myChart6.setOption(optionPart2);
		
		var myChart7 = echarts.init(document.getElementById('part7'));
		optionPart2.title.text="利税总额（单位：万元）"
		optionPart2.series[0].data=arrData1('${map.data3.ls}');
		myChart7.setOption(optionPart2);
		
		var myChart5 = echarts.init(document.getElementById('part5'));
		optionPart2.title.text="工业增加值（单位：万元）"
		optionPart2.series[0].data=arrData1('${map.data3.gyzjz}');
		optionPart2.series[0].type='line';
		if('${year}'==2017){
			optionPart2.yAxis.data=[2015, 2016];
		}
		myChart5.setOption(optionPart2);
		
	});
	
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
			title : {
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:14
		        },
		        left:15,
		        top:5
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    grid: {
		    	top:'20%',
		    	bottom:'5%',
		    	heigth:'80%',
		    	left:'5%',
		        containLabel: true
		    },
		    xAxis: {
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
		    yAxis: {
		        type: 'category',
		        data: [2017, 2016, 2015],
		        axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	}
		    },
		    series: [
		        {
		            type: 'bar',
		            data: [0, 0, 0],
		            barWidth:'50%',
		            label:{
		            	normal:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	}
		            },
		            areaStyle: {
		            	normal: {
		            		opacity: 0.2
		            	}
		            },
		            itemStyle:{
		            	normal:{
		            		color:function(params){
		            			var index = params.dataIndex;//表示当前的数据条的索引
		            		    var alternateNumber = 3;//表示按几种颜色交替出现

		            		    var newColor="";//表示最终显示的颜色
		            		    /**
		            		    自定义的颜色池
		            		    如果颜色池长度不够，将无法取得正确的颜色，所以有必要使
		            		    index的最大值小于colorList.length
		            		    */
		            		    var colorList = ['#18fee1','#18ccff','#0090ff','#E87C25','#27727B',
		            		                     '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
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

		            		    return colorList[index];
		            		}
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
		//	var str = eval('(' + data + ')');
			var str = JSON.parse(data);
			for(var i=0;i<str.length;i++){
				arr.push(str[str.length-i-1]);;
			}
		}
		return arr;
	};
	
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	    	var orgAreaId ='${orgAreaId}';
	        if(e.wheelDelta>0){ //向上滚动事件 
	        	window.location.href="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}";
	        }else{   //向下滚动事件 
	        	window.location.href="${ctx}/front/parkDataCenter/industryEconomic?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) {  //向上滚动事件
	        	 window.location.href="${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}";
	         }else{  //向下滚动事件
	        	 window.location.href="${ctx}/front/parkDataCenter/industryEconomic?orgId=${orgId}";
	         }  
	    } //ScrollText(direct);   
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
	
	function selectByYear(year){
		$("#year").val(year);
		$("#form").submit();
	}
</script>	
</head>

	<body>
		<div class="data_main">
			<form action="${ctx}/front/parkDataCenter/parkEconomic" method="post" id="form">
				<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
				<input type="hidden" id="orgId" name="orgId" value="${orgId}"/>
				<input type="hidden" id="year" name="year" value="${year}"/>
			</form>
			<div class="data_header">
				<div style="float: left;margin-left: 25%;">
					<img src="${ctx}/static/image/parkDataCenter/LOGO1.png" style="margin-top: 3%;" height="42px">
				</div>
				<div style="float: left;color: #6DCCF6;border-left: 1px solid #6DCCF6;margin-top: 8px;padding-left: 15px;height: 60px;" id="dateBar" class="dateBar"></div>
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
				<div style="width: 100%; height: 50px;line-height: 50px;float: left;color: ; ">
					<div style="background-color: #AFE7FE;width: 3px;height: 20px;float: left;margin-top: 15px;"></div>
					<span style="float: left;margin-left: 10px;font-size: 22px;color: #AFE7FE;">园区经济指标</span>
				</div>
				<div style="width: 100%;height: 88%;float: left;">
					<div style="width: 70%;height: 100%;float: left;">
						<div class="clearfix" style="height:22%; margin-bottom:1%;">
							<div class="dataBarMagenta">
								<div class="dataBarTitle">工业增加值</div>
								<c:choose>
									<c:when test="${map.data1.GYZJZ_VALUE!=null&&map.data1.GYZJZ_VALUE!=''}">
										<div class="dataBarNum"><font class="yellowFont24">${map.data1.GYZJZ_VALUE}</font>万元</div>
									</c:when>
									<c:otherwise>
										<div class="dataBarNum"><font class="yellowFont24">--</font></div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="dataBarLightBlue">
								<div class="dataBarTitle">主营业务收入</div>
								<c:choose>
									<c:when test="${map.data1.ZYYWSR_VALUE!=null&&map.data1.ZYYWSR_VALUE!=''}">
										<div class="dataBarNum"><font class="yellowFont24">${map.data1.ZYYWSR_VALUE}</font>万元</div>
									</c:when>
									<c:otherwise>
										<div class="dataBarNum"><font class="yellowFont24">--</font></div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="dataBarNavy">
								<div class="dataBarTitle">利税总额</div>
								<c:choose>
									<c:when test="${map.data1.LS_VALUE!=null&&map.data1.LS_VALUE!=''}">
										<div class="dataBarNum"><font class="yellowFont24">${map.data1.LS_VALUE}</font>万元</div>
									</c:when>
									<c:otherwise>
										<div class="dataBarNum"><font class="yellowFont24">--</font></div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="dataBarGreen" style="margin-right:0;">
								<div class="dataBarTitle">工业园区总数</div>
								<c:choose>
									<c:when test="${map.data1.CSGYSCHD_CYRY_VALUE!=null&&map.data1.CSGYSCHD_CYRY_VALUE!=''}">
										<div class="dataBarNum"><font class="yellowFont24">${map.data1.CSGYSCHD_CYRY_VALUE}</font>人</div>
									</c:when>
									<c:otherwise>
										<div class="dataBarNum"><font class="yellowFont24">--</font></div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						
						<div style="height:76%;">
							<div class="dataBar_1">
								<div class="dataBar_1_Left" id="part1" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;" ></div>
								<div class="daraBar_1_Right" id="part2" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
								<div style="clear:both;"></div>
							</div>
							<div class="dataBar_1">
								<div class="dataBar_1_Left" id="part3" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
								<div class="daraBar_1_Right" id="part4" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<div style="width: 30%;height: 100%;float: left;">
						<div class="data_contentLeft" style="width: 98%;height: 100%;margin-left: 2%;">
							<div class="dataBar_2_top" id="part5" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							<div class="dataBar_2_mid" id="part6" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
							<div class="dataBar_2_btm" id="part7" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/parkDataCenter/yyDetail?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/parkDataCenter/industryEconomic?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/parkDataCenter/industryEconomic?orgId=${orgId}">
	</body>

</html>