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
<%@ include file="header.jsp"%>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/companyPortraitSecond.css"/>
<link href="${ctx}/static/css/cityDataCenter/yzyyHomePage.css" rel="stylesheet">
<title>吉安高新技术开发区大数据平台-运行指数</title>
<style>
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/yzyy/bg2.png) no-repeat center;
    background-size: 100% 100%;
}
</style>
</head>
<body class="gray-bg">
 	<div class="content fz0" style="padding:15px 15px 15px 0">
		<div class="back" onclick="goindex(8)">
		    <img src="${ctx}/static/image/cityDataCenter/ycNew2/return.png">
		    <span>返回</span>
		</div>
		<div class="pro-left">
         	<ul class="production" style="position: relative;">
				<li class="first-li on" val="9">
					<div class="product-type">运行指数</div>
				</li>
				<li class="first-li" val="10">
					<div class="product-type">创新指数</div>
				</li>
				<li class="first-li" val="11"> 
					<div class="product-type">风险指数</div>
				</li>
				<li class="first-li" val="12"> 
					<div class="product-type">投资分析</div>
				</li>
				<li class="first-li" val="13"> 
					<div class="product-type">诊断建议</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div class="spanStyle" style="width: 70%;">
				<div class="nav-title fz0" style="padding-bottom: 10px;height: 211px;">
					<div class="fl selects"id="forthTab00">
						<div class="select pd0"  style="cursor: pointer;">
			    			<img src="${ctx}/static/image/cityDataCenter/yzyy/qylogo.png">
			    			<span style="display: inline-block;padding-top: 14px; font-size: 16px; font-weight: bold;">江西济民可信药业有限公司</span>
			    		</div>
						<div class="select select1">
							<p class="select-p"><font id="font1">2019</font><i class="fa fa-caret-down"></i></p>
							<div class="select-items">
								<ul id="ul1">
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="main-eco">
						<div class='jjzb-item dib'>
							<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
							<div class="jjzb-num">
								<p>产值（万元）</p>
								<div class="jjzb-b">
									<span><font id="cz1">890</font>.<font id="cz2">1</font>%</span>
									<img src="${ctx}/static/image/cityDataCenter/yzyy/red-up.png">
								</div>
							</div>
						</div>
						<div class='jjzb-item dib'>
							<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
							<div class="jjzb-num">
								<p>税收（万元）</p>
								<div class="jjzb-b">
									<span><font id="ss1">58</font>.<font id="ss2">6</font></span>
									<img src="${ctx}/static/image/cityDataCenter/yzyy/red-up.png">
								</div>
							</div>
						</div>
						<div class='jjzb-item dib' >
							<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
							<div class="jjzb-num">
								<p>利润率（%）</p>
								<div class="jjzb-b">
									<span><font id="lrl1">9</font>.<font id="lrl2">2</font></span>
									<img src="${ctx}/static/image/cityDataCenter/yzyy/green-down.png">
								</div>
							</div>
						</div>
						<div class='jjzb-item dib'>
							<img src="${ctx}/static/image/cityDataCenter/jxNew/tp.png">
							<div class="jjzb-num">
								<p>员工（人）</p>
								<div class="jjzb-b">
									<span><font id="yg">187</font></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="changeParent outsideBox" id="div1" style="height: calc(100% - 211px);">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="blockStyle" style="height: 50%;">
						<div class="spanStyle" style="width: 50%;">
							<div class="inlineBox" style="width: 100%;">
								<div class="tabCaptionBar  tab-links nopointer">
									<span class="on">全年产值趋势</span>
								</div>
								<div class="tabContBar">
									<div class="chartBar">
										<div id="chart1" style="height: 100%;"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="spanStyle" style="width: calc(50% - 10px);">
							<div class="inlineBox" style="width: 100%;">
								<div class="tabCaptionBar  tab-links nopointer">
								<span class="on">全年税收趋势</span>
								</div>
								<div class="tabContBar">
									<div class="chartBar">
										<div id="chart2" style="height: 100%;"></div>
									</div>
								</div>
							</div>	
						</div>
					</div>
					<div class="blockStyle" style="height: calc(50% - 10px);">
						<div class="spanStyle" style="width: 50%;">
							<div class="inlineBox" style="width: 100%;">
								<div class="tabCaptionBar tab-links nopointer">
								<span class="on">全年利润率对比</span>
								</div>
								<div class="tabContBar">
									<div class="chartBar">
										<div id="chart3" style="height: 100%;"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="spanStyle" style="width: calc(50% - 10px);">
							<div class="inlineBox" style="width: 100%;">
								<div class="tabCaptionBar  tab-links nopointer">
								<span class="on">员工学历结构对比</span>
								</div>
								<div class="tabContBar">
									<div class="chartBar">
										<div id="chart4" style="height: 100%;"></div>
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div>
			</div>
			<div class="spanStyle outsideBox" style="width: calc(30% - 10px)">
				<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
				<div class="blockStyle">
					<div class="inlineBox" style="width: 100%;">
						<div class="tabCaptionBar  tab-links">
							<span class="on selects">
								<div class="select select2">
									<p class="select-p"><font id="cpzl">消炎利胆片</font><i class="fa fa-caret-down"></i></p>
									<div class="select-items">
										<ul>
											<li>消炎利胆片</li>
											<li>常用舒颗粒</li>
										</ul>
									</div>
								</div>
							</span>
						</div>
						<div class="blockStyle" style="height: 35%;">
							<div class="inlineBox" style="width: 100%;text-align: center;">
								<i></i>
								<div class="verCenter" style="display: inline-block;position: relative;width: calc(100% - 20px);">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/productLine.png">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/arrow.png" class="pArrow pArr1">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/arrow.png" class="pArrow pArr2">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/arrow.png" class="pArrow pArr3">
			            			<img src="${ctx}/static/image/cityDataCenter/yzyy/arrow.png" class="pArrow pArr4">
			            			
			            			<div class="productIndexBar p1">
			            				<div class="productIndexTop">销量最高</div>
			            				<div class="productIndexMiddle">二季度</div>
			            				<div class="productIndexBottom">同比去年上涨20.1%</div>
			            			</div>
			            			<div class="productIndexBar p2">
			            				<div class="productIndexTop">库存</div>
			            				<div class="productIndexMiddle">减少</div>
			            				<div class="productIndexBottom">同比去年下降5.3%</div>
			            			</div>
			            			<div class="productIndexBar p3">
			            				<div class="productIndexTop">销量最低</div>
			            				<div class="productIndexMiddle">四季度</div>
			            				<div class="productIndexBottom">同比去年下降10.1%</div>
			            			</div>
			            			<div class="productIndexBar p4">
			            				<div class="productIndexTop">库存</div>
			            				<div class="productIndexMiddle">减少</div>
			            				<div class="productIndexBottom">同比去年上涨5.3%</div>
			            			</div>
			            			<div class="productState">正常</div>
			            			<div class="productTag">产销评估</div>
			            		</div>
	            			</div>
						</div>
						<div class="blockStyle" style="height: calc(65% - 45px)">
							<div class="tabContBar" style="height: 100%;">
								<div class="chartBar">
									<div id="chart5" style="height: 100%;"></div>
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
<script src="${ctx}/static/js/dataCenter/highcharts.js"></script>
<script src="${ctx}/static/js/dataCenter/highcharts-3d.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
	var historyData = "";
	$(function(){
		var tabIndex = '${tabIndex}';
		$(".head .tab>a:eq(4)").addClass("on");
		//左侧菜单栏点击事件
		$(".first-li").on("click",function(){
			var v = $(this).attr("val")
			if(v!=''){
				window.location.href = "${ctx}/front/cityDataCenter/jianIndex/"+v;
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
		$(".select2 li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			$('#cpzl').text($(this).text());
		})
		var yearList=["2019", "2018", "2017", "2016", "2015"]
		getselectYear(yearList);
		rollNums();
		getqncz();
		getqnssqs();
		getqnlrldb();
		chart3d();
		getBar2();
	})
	function getselectYear(yearList){
		for(var i=0; i<yearList.length;i++){
			$('#forthTab00 .select1 ul').append('<li>'+yearList[i]+'</li>');
		}
		$(".select1 li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			$('#font1').text($(this).text());
			$('#year').val($(this).text());
		})
	}
	//数字滚动
	function rollNums(){
		var cz = '890.1'
		var ss = '58.6'
		var lrl = '9.2'
		var yg = '187'
		$("#cz1").rollNum({
			deVal: cz.split('.')[0],
			digit: cz.split('.')[0].length
		});
		$("#cz2").rollNum({
			deVal: cz.split('.')[1],
			digit: cz.split('.')[1].length
		});
		$("#ss1").rollNum({
			deVal: ss.split('.')[0],
			digit: ss.split('.')[0].length
		});
		$("#ss2").rollNum({
			deVal: ss.split('.')[1],
			digit: ss.split('.')[1].length
		});
		$("#lrl1").rollNum({
			deVal: lrl.split('.')[0],
			digit: lrl.split('.')[0].length
		});
		$("#lrl2").rollNum({
			deVal: lrl.split('.')[1],
			digit: lrl.split('.')[1].length
		});
		$("#yg").rollNum({
			deVal: yg.split('.')[0],
			digit: yg.split('.')[0].length
		});
	}
	//全年产值趋势
	function getqncz(){
		var array=[420,620,390,840];
		var div_ = document.getElementById("chart1");
		var blueLineChart = echarts.init(div_);
		blueLineOption.series[0].data = array;
		blueLineChart.setOption(blueLineOption);
	}
	//全年税收趋势
	function getqnssqs(){
		var array=[580,600,800,700];
		var div_ = document.getElementById("chart2");
		var orangeLineChart = echarts.init(div_);
		orangeLineOption.series[0].data = array;
		orangeLineChart.setOption(orangeLineOption);
	}
	//全年税收趋势
	function getqnlrldb(){
		var array=[7,2.5,5,11.2];
		var div_ = document.getElementById("chart3");
		var barChart = echarts.init(div_);
		barOption1.series[0].data = array;
		barChart.setOption(barOption1);
	}
	function getBar2(){
		var array1=[350,410,190,530];
		var array2=[240,500,210,380];
		var div_ = document.getElementById("chart5");
		var barChart = echarts.init(div_);
		barOption2.series[0].data = array1;
		barOption2.series[1].data = array2;
		barChart.setOption(barOption2);
	}
	//蓝色线型配置
	var blueLineOption = {
		legend: {
			show: false,
	    	data: [
	            { name: '产值', icon: 'circle'}
	        ],
	        left: "left",
	        itemWidth: 12,
	        itemHeight: 12,
	        itemGap: 5,
	        textStyle: {
	            color: "#989CB8"
	        },
	    },
        grid: {
        	right: 40,
        	left: 50,
        	bottom: 30,
        	top: 25
        },
        tooltip: {
            show:true,
            trigger: 'axis',
        },
        xAxis: {
	        //data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
	        data: ["1季度","2季度","3季度","4季度"],
	        // boundaryGap: false,
            splitLine: {
                show: false,
                lineStyle: {
                    color: 'rgba(255,255,255,0.1)'
                }
            },
            axisLine: {
				show: true,
				lineStyle:{
					 color: 'rgba(255,255,255,0.1)'
				}
			},
            axisLabel: {
                color: '#009FF1',
                // rotate: 40,
                fontSize: 14,
            }
		},
		yAxis: {
			splitLine: {
			    lineStyle: {
			        color: 'rgba(255,255,255,0.1)'
			    }
			},
			axisLine: {
				show: true,
				lineStyle:{
					 color: 'rgba(255,255,255,0.1)'
				}
			},
			axisLabel: {
				color: '#009FF1',
				fontSize: 14,
				formatter:function(params){
					return params;
				}
			}
        },
		series: [{
			name: '产值',
			type: 'line',
			data: [420,620,390,840],
			symbolSize: 0,
			smooth: true,
			color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
				offset: 0,
				color: '#67F8B3'
			}, {
      			offset: 1,
      			color: '#05A6FC'
			}]),
			areaStyle: {
				color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
					offset: 0,
					color: '#67F8B3'
				}, {
	      			offset: 1,
	      			color: '#05A6FC'
				}]),
				opacity: 0.2,
			}
		},]
	};
	//橙色线型配置
	var orangeLineOption = {
		legend: {
			show: false,
	    	data: [
	            { name: '同比', icon: 'circle'}
	        ],
	        left: "left",
	        itemWidth: 12,
	        itemHeight: 12,
	        itemGap: 5,
	        textStyle: {
	            color: "#989CB8"
	        },
	    },
        grid: {
        	right: 40,
        	left: 50,
        	bottom: 30,
        	top: 25
        },
        tooltip: {
            show:true,
            trigger: 'axis',
        },
        xAxis: {
	        //data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			data: ["1季度","2季度","3季度","4季度"],
			type: 'category',
	        // boundaryGap: true,
            splitLine: {
                show: false,
                lineStyle: {
                    color: 'rgba(255,255,255,0.1)'
                }
            },
            axisLine: {
				show: true,
				lineStyle:{
					 color: 'rgba(255,255,255,0.1)'
				}
			},
            axisLabel: {
                color: '#009FF1',
                // rotate: 40,
                fontSize: 14,
            }
		},
		yAxis: {
			splitLine: {
			    lineStyle: {
			        color: 'rgba(255,255,255,0.1)'
			    }
			},
			axisLine: {
				show: true,
				lineStyle:{
					 color: 'rgba(255,255,255,0.1)'
				}
			},
			axisLabel: {
				color: '#009FF1',
				fontSize: 14,
				formatter:function(params){
					return params;
				}
			}
        },
		series: [{
			name: '税收',
			type: 'line',
			data: [],
			symbolSize: 0,
			smooth: true,
			color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
				offset: 0,
				color: '#FFD154'
			}, {
				offset: 1,
				color: '#FF903E'
			}]),
			areaStyle: {
				color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
					offset: 0,
					color: '#FFD154'
				}, {
					offset: 1,
					color: '#FF903E'
				}]),
				opacity: 0.2,
			}
		},]
	};
	//竖柱状图
	var barOption1 = {
	    tooltip : {
			trigger: "axis",
	    },
		grid: {
			right: 40,
        	left: 50,
        	bottom: 30,
        	top: 25
	        // containLabel:true
		},
	    // calculable: true,
	    xAxis: [{
	        type: "category",
	        splitLine: {
	          	show: false,
	              lineStyle: {
	                  color: "rgba(255,255,255,0.2)"
	              }
	          },
	          axisTick: {
	        	  show: false,
	          },
	          axisLine: {
				  
	          	lineStyle: {
	              	color: 'rgba(255,255,255,0.2)',
	              }
	          },
	          axisLabel: {
				color: '#009FF1',
				fontSize: 14,
	          },
	         data: ["1季度","2季度","3季度","4季度"],
	    }],
	    yAxis: [{
			type: 'value',
            nameTextStyle:{
            	color: '#00DEFF',
            },
            name: '',
            splitLine: {
              	show: true,
                  lineStyle: {
                      color: "rgba(255,255,255,0.1)"
                  }
              },
              axisTick: {
            	  show: false,
              },
              axisLine: {
				show: false,
              	lineStyle: {
                  	color: 'rgba(255,255,255,0.2)',
				},
              },
              axisLabel: {
				color: '#009FF1',
				fontSize: 14,
				formatter: "{value}%",
              }
        }],
	    series: [{
	            name: '全年利润率对比',
	            type: "bar",
	            barMaxWidth: 25,
	            barGap: "10%",
	            color : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: 'rgba(255,255,0,1)' // 0% 处的颜色rgba(0,255,255,0)
	                    }, {
	                        offset: 1, color: 'rgba(255,255,0,0.1)' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	            data: [],
	    }]
	}
	//横向柱状图
	var barOption2 = {
	    tooltip : {
			trigger: "axis",
		},
		legend: {
			show: true,
	    	data: [
				{ name: '产量', icon: 'circle'},
				{ name: '销量', icon: 'circle'}
	        ],
	        bottom: 5,
	        itemWidth: 12,
	        itemHeight: 12,
	        itemGap: 5,
	        textStyle: {
	            color: "#fff"
			},
	    },
		grid: {
			right: 30,
        	left: 60,
        	bottom: 80,
        	top: 35,
	        // containLabel:true
		},
	    // calculable: true,
	    yAxis: [{
	        type: "category",
	        splitLine: {
	          	show: false,
	              lineStyle: {
	                  color: "rgba(255,255,255,0.2)"
	              }
	          },
	          axisTick: {
	        	  show: false,
	          },
	          axisLine: {
				  
	          	lineStyle: {
	              	color: 'rgba(255,255,255,0.2)',
	              }
	          },
	          axisLabel: {
				color: '#009FF1',
				fontSize: 14,
	          },
	         data: ["1季度","2季度","3季度","4季度"],
	    }],
	    xAxis: [{
			type: 'value',
            nameTextStyle:{
            	color: '#00DEFF',
            },
            name: '',
            splitLine: {
              	show: true,
                  lineStyle: {
                      color: "rgba(255,255,255,0.1)"
                  }
              },
              axisTick: {
            	  show: false,
              },
              axisLine: {
				show: false,
              	lineStyle: {
                  	color: 'rgba(255,255,255,0.2)',
				},
              },
              axisLabel: {
				color: '#009FF1',
				fontSize: 14,
				formatter: "{value}",
              }
        }],
	    series: [{
	            name: '产量',
	            type: "bar",
	            barMaxWidth: 20,
	            barGap: "10%",
	            color : [
	    	        {
	                    type: 'linear',
	                    x: 1,
	                    y: 0,
	                    x2: 0,
	                    y2: 0,
	                    colorStops: [{
	                        offset: 0, color: 'rgba(255,255,0,1)' // 0% 处的颜色rgba(0,255,255,0)
	                    }, {
	                        offset: 1, color: 'rgba(255,255,0,0.1)' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	            data: [],
	    },{
	            name: '销量',
	            type: "bar",
	            barMaxWidth: 20,
	            barGap: "10%",
	            color : [
	    	        {
	                    type: 'linear',
	                    x: 1,
	                    y: 0,
	                    x2: 0,
	                    y2: 0,
	                    colorStops: [{
	                        offset: 0, color: 'rgba(0,255,255,1)' // 0% 处的颜色rgba(0,255,255,0)
	                    }, {
	                        offset: 1, color: 'rgba(0,255,255,0.1)' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	            data: [],
	    }]
	}
	//员工学历结构对比
	function chart3d() {
		var d=[
			{
				y:6,
				name:'硕士博士及以上'
			},
			{
				y:10,
				name:'本科'
			},
			{
				y:50,
				name:'中专/高中'
			},
			{
				y:10,
				name:'初中及以下'
			},
			{
				y:14,
				name:'大专'
			},
			
		]
		//3D饼图配置
		var highchartOptions={
			chart: {
				//renderTo: 'container',    //指定div放置图 
				type: 'pie',    
				backgroundColor: 'rgba(0,0,0,0)', 
				options3d: {
					enabled: true,	//显示图表是否设置为3D， 我们将其设置为 true
					alpha: 50, 		//图表视图旋转角度
					beta: 0,		//图表视图旋转角度
					// depth: 10,         //图表的合计深度，默认为100
					// viewDistance: 125   //定义图表的浏览长度
				},
			},
			title : {
				text:null
			},
			credits: {
				enabled:false
			},
			tooltip : {
				headerFormat:'',
				pointFormat: '<span style="color:{point.color}">\u25CF</span>{point.name}: <b>{point.y}人</b>'
			},
			colors:['#4EC973','#C497CD','#FCD434','#399EFF','#F16279'],
			legend: {
				enabled: false,
				itemStyle : {
					fontSize:14,
					color:'#fff'
				},
				itemHoverStyle : {
					color:'#FFE42D'
				},
				align: 'center',
				symbolRadius: 8,
				itemDistance: 30,
				itemMarginBottom: -10,
			},
			plotOptions : {
				pie: {
					allowPointSelect: false,
					cursor: 'pointer',
					depth: 25, //饼图厚度
					dataLabels: {
						enabled: true,
						cursor: 'pointer',
						format: '{point.name}<br/><b>{point.percentage:.1f}%</b>',//'<b>{point.percentage:.1f}%</b>',
						distance: 4,//调整标签圆心得距离
						style:{
							color:'#fff',
							fontSize: "14px"
						}
					},
					showInLegend: true
				}
			},  
			series: [{
				type: 'pie',
				name: '占比',
				center: ['50%', '60%'],
				size:'120%',//饼图大小
				startAngle: 340,//开始角度
				data: d
			}]
		};
		$("#chart4").highcharts(highchartOptions);
	}
	function goindex(num){
		if($("#companyId").val()!="" && $("#companyId").val() != undefined){
			window.location.href='${ctx}/front/cityDataCenter/jianIndex/'+num+'?companyId='+$("#companyId").val()
		}else{
			window.location.href='${ctx}/front/cityDataCenter/jianIndex/'+num+'?companyId=90020180314182240800039000001686'
		}
	}
</script>
</html>
