<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<%@ include file="header.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/companyPortraitSecond.css"/>
<title>袁州医药园智慧园区大数据平台-创新指数</title>
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
				<li class="first-li" val="9">
					<div class="product-type">运行指数</div>
				</li>
				<li class="first-li on" val="10">
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
			 <div class="nav-title fz0" style="padding-bottom: 10px;height: 210px;">
		    	<div class="fl selects">
					<div class="select pd0"  style="cursor: pointer;">
		    			<img src="${ctx}/static/image/cityDataCenter/yzyy/qylogo.png">
		    			<span style="display: inline-block;padding-top: 14px; font-size: 16px; font-weight: bold;">江西济民可信药业有限公司</span>
		    		</div>
				</div>
				<div class="clearfix threeIcon">
					<div class="iconBox">
						<img class="iconbg" src="${ctx}/static/image/cityDataCenter/yzyy/cxzs1.png">
						<img class="icon" src="${ctx}/static/image/cityDataCenter/yzyy/cxzs4.png">
						<div class="textBox">
							<div class="textName">创新活力</div>
							<div class="textValue">105</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="iconBox">
						<img class="iconbg" src="${ctx}/static/image/cityDataCenter/yzyy/cxzs2.png">
						<img class="icon" src="${ctx}/static/image/cityDataCenter/yzyy/cxzs6.png">
						<div class="textBox">
							<div class="textName">知识产权</div>
							<div class="textValue">55</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="iconBox">
						<img class="iconbg" src="${ctx}/static/image/cityDataCenter/yzyy/cxzs3.png">
						<img class="icon" src="${ctx}/static/image/cityDataCenter/yzyy/cxzs5.png">
						<div class="textBox">
							<div class="textName">科创平台</div>
							<div class="textValue">30</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="changeParent" id="div1" style="height: calc(100% - 210px);">
				<div class="blockStyle outsideBox" style="height: 50%;">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
		            <div class="spanStyle" style="width: 50%;">
		                 <div class="inlineBox" style="width: 100%;">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">各类知识产权数量</span>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="chart1">
			         				</div>
			         			</div>
		         		   </div>
		                </div>
			         </div>
					<div class="spanStyle" style="width: calc(50% - 10px);">
			             <div class="inlineBox" style="width: 100%;">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on selects">
									<div class="select zscq">
										<p class="select-p"><font id="zscq">全部知识产权</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items" style="width: 125px;">
											<ul>
												<li>全部知识产权</li>
												<li>商标数量</li>
												<li>专利数量</li>
												<li>证书数量</li>
												<li>作品著作权数量</li>
												<li>软件著作权数量</li>
												<li>网站域名数量</li>
											</ul>
										</div>
									</div>
								</span>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="chart2">
			         				</div>
			         			</div>
		         		   </div>
						 </div>	
			         </div>
       			</div>
		     	<div class="blockStyle outsideBox" style="height: calc(50% - 10px);">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
		     		<div class="spanStyle" style="width: 50%;">
						<div class="inlineBox" style="width: 100%;" style="padding: 10px 10px 0px 10px;">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on">科创平台</span>
				            </div>
							<div class="part-content reusltContent">
							   <div class="tab price-table2">
					   				<div class="table-title">
					   					<span class="dib">名称</span>
					   					<span class="dib" id="t1">级别</span>
					   					<span class="dib" id="t2" style="padding-right: 30px;text-align: right;">成立时间</span>
									</div>
									<div class="table-content table-scroll">
									   <table id="rateList" style="height: 100%;">
											<tbody>
											  <tr>
											     <td>宜春市水资源分析工程技术研究中心</td><td>市级</td>
											     <td style="text-align: right;padding-right: 30px;">2016-07</td>
											  </tr>
											   <tr>
											     <td>宜春市绿色印刷包装工程技术研究中心</td><td>市级</td>
											     <td style="text-align: right;padding-right: 30px;">2018-06</td>
											  </tr>
											  <tr>
											     <td>宜春市低品位锂矿石高效利用工程技术研究中心</td><td>市级</td>
											     <td style="text-align: right;padding-right: 30px;">2017-12</td>
											  </tr>
											  <tr>
											     <td>宜春市发酵米制品工程技术研究中心</td><td>市级</td>
											     <td style="text-align: right;padding-right: 30px;">2017-05</td>
											  </tr>
											  <tr>
											     <td>宜春市LED照明灯具工程技术研究中心</td><td>市级</td>
											     <td style="text-align: right;padding-right: 30px;">2017-05</td>
											  </tr>
											</tbody>
										</table>
									</div>
								</div>
		         		    </div>
		     		    </div>
		         	</div>
		         	<div class="spanStyle" style="width: calc(50% - 10px);">
		         	    <div class="inlineBox" style="width: 100%;">
							<div class="tabCaptionBar  tab-links" style="cursor: pointer;">
					           <span class="on selects">
									<div class="select kcpt">
										<p class="select-p"><font id="kcpt">全部科创平台</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items" style="width: 189px;right: auto;">
											<ul>
												<li>全部科创平台</li>
												<li>工程技术研究中心数量</li>
												<li>重点实验室数量</li>
												<li>院士工作站数量</li>
											</ul>
										</div>
									</div>
								</span>
				            </div>
							<div class="part-content reusltContent">
			         			<div class="eight-map">
			         				<div class="mapContent" id="chart4">
			         				</div>
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
<script type="text/javascript">
var historyData = "";
$(function(){
	var tabIndex = '${tabIndex}';
	$(".head .tab>a:eq(4)").addClass("on");
	//左侧菜单栏点击事件
	$(".first-li").on("click",function(){
		var v = $(this).attr("val")
		if(v!=''){
			window.location.href = "${ctx}/front/cityDataCenter/yzyyIndex/"+v;
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
	$(".zscq li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			$('#zscq').text($(this).text());
	})
	$(".kcpt li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			$('#kcpt').text($(this).text());
	})
	getZscq();
	geSbzc();
	geYjzx();
})
//获取知识产权数量
function getZscq(){
	var array=['',4,7,1,2,8,4,''];
	var div_ = document.getElementById("chart1");
	var zscqChart = echarts.init(div_);
	zscqOption.series[0].data = array;
	zscqChart.setOption(zscqOption);
}
//商标注册数量
function geSbzc(){
	var array=[11,13,14,8,6,16,4];
	var div_ = document.getElementById("chart2");
	var blueLineChart = echarts.init(div_);
	blueLineOption.series[0].data = array;
	blueLineChart.setOption(blueLineOption);
}
//研究中心注册数量
function geYjzx(){
	var array=[7,10,6,16,5,6,5];
	var div_ = document.getElementById("chart4");
	var barChart = echarts.init(div_);
	barOption1.series[0].data = array;
	barChart.setOption(barOption1);
}
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
			  data: ["2013","2014","2015","2016","2017","2018","2019"],
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
              }
        }],
	    series: [{
	            name: '数量',
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
var zscqOption = {
	  	grid: {
			right: 40,
        	left: 30,
        	bottom: 30,
        	top: 25
		},
	   tooltip: {
            show:true,
            trigger: 'axis',
        },
	  	xAxis: {
	        type: 'category',
	        position: "bottom",
	        data: ['','商标','专利','证书','作品著作','软件著作','网站域名',''],
	        boundaryGap: false,
	        splitLine: {
	        	show: true,
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
	           color: '#00DEFF',
	        },
	    },
	    yAxis: {
	        show: true,
	        name: '',
	        splitLine: {
	            lineStyle: {
	                color: "rgba(255,255,255,0.2)"
	            }
	        },
	        axisTick: {
	            show: false
	        },
	        axisLine: {
	            show: true,
	            lineStyle: {
	                color: "rgba(255,255,255,0.2)"
	            }
	        },
	        axisLabel: {
	            show: true,
	            color: '#00DEFF'
	        }
	    },
	    series: [{
	        type: 'pictorialBar',
	        name: '数量',
	        barCategoryGap: '-20%',
	        symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
	        data: [],
	        itemStyle: {
	        	color: {
	                type: 'linear',
	                x: 0,
	                y: 0,
	                x2: 0,
	                y2: 1,
	                colorStops: [{
	                    offset: 0, color: 'rgba(255,226,65,1)' 
	                }, {
	                    offset: 1, color: 'rgba(255,168,65,0.1)'
	                }],
	                global: false 
	            },
	            opacity:0.6,
	        },
	    },]
};
var blueLineOption = {
		legend: {
			show: false,
	    	data: [
	            { name: '数量', icon: 'circle'}
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
	        data: ["2013","2014","2015","2016","2017","2018","2019"],
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
			name: '数量',
			type: 'line',
			data: [420,620,390,840],
			symbolSize: 0,
			// smooth: true,
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
	function goindex(num){
		if($("#companyId").val()!="" && $("#companyId").val() != undefined){
			window.location.href='${ctx}/front/cityDataCenter/yzyyIndex/'+num+'?companyId='+$("#companyId").val()
		}else{
			window.location.href='${ctx}/front/cityDataCenter/yzyyIndex/'+num+'?companyId=90020180314182240800039000001686'
		}
	}
</script>
</html>
