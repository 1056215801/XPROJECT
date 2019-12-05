<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>吉安智慧园区大数据决策平台</title>
<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
</head>
<style>
.floatbox{
	position:absolute;
	width:165px;
	height:166px;
	z-index: 9;
}
.floatbox.new{
    left: 380px;
    top: 0px;
}
.floatbox.ele{
    top: 160px;
    left: 110px;
}
.floatbox.big{
	left: 120px;
    top: 420px;
}
.floatbox.other{
    top: 420px;
    right: 110px;
}
.floatbox.wit{
    top: 160px;
    right: 100px;
}
.reinfoBox{
    display: none;
    position: relative;
    background: #011e54;
    height: 100%;
}
</style>
<body class="gray-bg">
<%@ include file="header.jsp"%>
	 <div class="content fz0" id="content">
	    <div class="spanStyle" style="width:25%">
	        <div class="blockStyle" style="height: calc(33.3% - 20px)">
				<div class="outsideBox" >
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">资产总计（单位：亿元））</span>
						<div class="fr selects" >
							<div class="select">
								<p><font></font>2018<i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul >
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="total-assets" class="retabTitleBar"></div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(33.3% - 20px)">
				<div class="outsideBox" >
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">主营业务收入（单位：亿元）</span>
						<div class="fr selects" >
							<div class="select">
								<p><font ></font>2018<i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul >
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="business-income" class="retabTitleBar"></div>
				</div>
			</div>
			<div class="blockStyle" style="height:33.3%">
				<div class="outsideBox" >
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">利润总额（单位：亿元）</span>
						<div class="fr selects" >
							<div class="select">
								<p><font ></font>2018<i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul >
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="profit" class="retabTitleBar"></div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(50% - 20px)">	
		    <div class="blockStyle" style="height:90px;">
				<div class="spanStyle" style="width: calc(25% - 8px)">
					<div class="tabCaptionBar" style="height:100%">
						<span class="tabCaption" style="width:100%;margin:0;padding:0">
							<span class="fontmar lh">工业销售产值</span>
							<span class="df">
								<em id="cz1"></em>
								<em class="color mt">.</em>
								<em class="cz2" id="cz2"></em>
                                <em class="fontmar mt">亿元</em>
							</span>
						</span>
					</div>
				 </div>
		         <div class="spanStyle" style="width: calc(25% - 7px)">
			          <div class="tabCaptionBar" style="height:100%">
						<span class="tabCaption" style="width:100%;">
							<span class="fontmar lh">主营业务收入</span>
							<span class="df">
								<em id="as1"></em>
								<em class="color mt">.</em>
								<em class="cz2" id="as2"></em>
								<em class="fontmar mt">亿元</em>
							</span>
						</span>
			          </div>
		         </div>
		       	 <div class="spanStyle" style="width: calc(25% - 7px)">
			        <div class="tabCaptionBar" style="height:100%;">
						<span class="tabCaption" style="width:100%;">
							<span class="fontmar lh">利润总额</span>
							<span class="df">
								<em id="sd1"></em>
								<em class="color mt">.</em>
								<em class="cz2" id="sd2"></em>
								<em class="fontmar mt">亿元</em>
							</span>
						</span>
			        </div>
		         </div>
		        <div class="spanStyle" style="width: calc(25% - 8px)"">
			        <div class="tabCaptionBar" style="height:100%;">
						<span class="tabCaption" style="width:100%;">
							<span class="fontmar lh">出口交货值</span>
							<span class="df">
								<em id="df1"></em>
								<em class="color mt">.</em>
								<em class="cz2" id="df2"></em>
								<em class="fontmar mt">亿元</em>
							</span>
						</span>
			        </div>
		        </div>
		   </div>
		    <div class="blockStyle" style="height:calc(100% - 90px);margin:0 auto;display:block;position: relative;">
		   	    <div class="floatbox new" onclick="getMoreDetailnew('3')"></div> 
		        <div class="floatbox wit" onclick="getMoreDetailnew('6')"></div>
		        <div class="floatbox other" onclick="getMoreDetailnew('5')"></div>
		        <div class="floatbox big" onclick="getMoreDetailnew('2')"></div>
		        <div class="floatbox ele" onclick="getMoreDetailnew('1')"></div>
		        <img  src="${ctx}/static/image/cityDataCenter/common/zxc.png" style="height:100%;margin:0 auto;display:block">
		   </div>
		</div>
		<div class="spanStyle" style="width:25%">
		     <div class="blockStyle" style="height: calc(33.3% - 20px);">
				 <div class="outsideBox" >
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">工业销售产值（单位：亿元）</span>
						<div class="fr selects" >
							<div class="select">
								<p><font ></font>2018<i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul >
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="sales-output" class="retabTitleBar"></div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(33.3% - 20px);">
				<div class="outsideBox" >
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">出口交货值（单位：亿元）</span>
						<div class="fr selects" >
							<div class="select">
								<p><font ></font>2018<i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul >
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="exit" class="retabTitleBar"></div>
				</div>
			</div>
			<div class="blockStyle" style="height:33.3%">
				<div class="outsideBox" >
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption" style="padding:0px">从事工业生产活动的从业人员平均人数（单位：人）</span>
						<div class="fr selects" >
							<div class="select">
								<p><font ></font>2018<i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul >
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="average" class="retabTitleBar"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="newdetail" class="reinfoBox">
		<div class="outsideBox">
			<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
			<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
			<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
			<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
			<div class="tabCaptionBar df">
				<span class="tabCaption fx1" style="padding-top: 10px;">主营业务收入（单位：亿元）</span>
				<div class="fr selects" >
					<div class="select">
						<p><font ></font>2018<i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul >
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="newchart" class="tabTitleBar"></div>	
	</div>
<script src="${ctx}/static/js/vue.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/1251.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
	$(function(){
       	getDate();
   		$(".head .tab>a:eq(2)").addClass("on");
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
    })
    function getchartdata(id){
		var data = "";
		if(id=='3') {
			data=[2.03,4.3,7.1,7.59];
		}
		else if(id=='1'){
			data=[43.4,95.4,165.8,265.8];
		}
		else if(id=='5'){
			data=[21.67,45.2,68.5,80.21];
		}
		else if(id=='2'){
			data=[13.2,28.7,49.2,71.3];
		}
		newchart(data);
	}
	function getDate(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/parkIndicator/industrialData",
			type : "get",
			async:false, 
			data : {
				"organizationId" :'1245',
				"yearCaliber" :'2018',
			},
			success : function(result) {
				var result = result
				var unPublish=0;
				if (result.success) {
					for(var a=0;a<result.json.zczj.length;a++){
						if(result.json.zczj[a]==null) unPublish++;
					}
					if(unPublish==result.json.zczj.length){
						$("#total-assets").html("<font class=\"unPublish\">未公布</font>");
						}
               		else { chart1(result.json.zczj);}
					unPublish=0;
					for(var b=0 ;b<result.json.zyywsr.length;b++){
						if(result.json.zyywsr[b]==null) unPublish++;
					}
					if(unPublish==result.json.zyywsr.length){
						$("#business-income").html("<font class=\"unPublish\">未公布</font>");
						}
               		else { chart2(result.json.zyywsr);}
					unPublish=0;
					for(var c=0 ;c<result.json.lr.length;c++){
						if(result.json.lr[c]==null) unPublish++;
					}
					if(unPublish==result.json.lr.length){
						$("#profit").html("<font class=\"unPublish\">未公布</font>");
						}
               		else { chart3(result.json.lr);}
					unPublish=0;
					for(var d=0 ;d<result.json.gyxscz.length;d++){
						if(result.json.gyxscz[d]==null) unPublish++;
					}
					if(unPublish==result.json.gyxscz.length){
						$("#sales-output").html("<font class=\"unPublish\">未公布</font>");
						}
               		else { chart4(result.json.gyxscz);}
					unPublish=0;
					for(var e=0 ;e<result.json.ckjhz.length;e++){
						if(result.json.ckjhz[e]==null) unPublish++;
					}
					if(unPublish==result.json.ckjhz.length){
						$("#exit").html("<font class=\"unPublish\">未公布</font>");
						}
               		else { chart5(result.json.ckjhz);}
					unPublish=0;
					for(var f=0 ;f<result.json.csgyschd.length;f++){
						if(result.json.csgyschd[f]==null) unPublish++;
					}
					if(unPublish==result.json.csgyschd.length){
						$("#average").html("<font class=\"unPublish\">未公布</font>");
						}
               		else { chart6(result.json.csgyschd);}
					var u= 0;
					for(var g=0 ;g<result.json.gyxscz.length;g++){
						if(result.json.gyxscz[g]==null) u++;
					}
					u = 3 - u;
					gettitledata(result.json.gyxscz[u],result.json.zyywsr[u],result.json.lr[u],result.json.ckjhz[u])
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
function gettitledata(data1,data2,data3,data4){
	    var cz = data1.toString()
		var as = data2.toString()
		var sd = data3.toString()
		var df = data4.toString()
		
		$("#cz1").rollNum({
			deVal: cz.split('.')[0],
			digit: cz.split('.')[0].length
		});
		$("#cz2").rollNum({
			deVal: cz.split('.')[1],
			digit: 2
		});
		$("#as1").rollNum({
			deVal: as.split('.')[0],
			digit: as.split('.')[0].length
		});
		$("#as2").rollNum({
			deVal: as.split('.')[1],
			digit: 2
		});
		$("#sd1").rollNum({
			deVal: sd.split('.')[0],
			digit: sd.split('.')[0].length
		});
		$("#sd2").rollNum({
			deVal: sd.split('.')[1],
			digit: 2
		});
		$("#df1").rollNum({
			deVal: df.split('.')[0],
			digit: df.split('.')[0].length
		});
		$("#df2").rollNum({
			deVal: df.split('.')[1],
			digit: 2
		});
}
function chart1(data){
var tu1 = echarts.init(document.getElementById('total-assets'));
    var charts = {
    		names: ['', ''],
    		lineX: ["1~3月","1~6月","1~9月","1~12月"],
    		value: [data]
   		}
	var color = ['rgba(23, 255, 243', 'rgba(255,100,97']
	var lineY = []
	for (var i = 0; i < charts.names.length; i++) {
	var x = i
	if (x > color.length - 1) {
	x = color.length - 1
	}
	var data = {
		name: charts.names[i],
		type: 'line',
		color:new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
	             offset: 0,
	             color: '#67f8b3FF' // 0% 处的颜色
	           }, {
	             offset: 1,
	             color: '#05a6fcFF' // 100% 处的颜色
	           }], false),
		smooth: true,
		lineStyle:{
			  width:4,  
			},
		areaStyle: {
		normal: {
			color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
				offset: 0,
				color: color[x] + ',1)'
			}, {
				offset:1,
				color: color[x] + ', 0)'
			}], false),
			shadowColor: 'rgba(0, 0, 0, 0.6)',
			}
		},
		symbol: 'circle',
		symbolSize: 2,
		data: charts.value[i]
	}
  lineY.push(data)
  }
		var option = {
			backgroundColor:'rgb(0,0,0,0)',
			tooltip: {
				trigger: 'axis'
			},
			grid: {
				top: '10%',
				left: '4%',
				right: '8%',
				bottom: '4%',
				containLabel: true
			},
			xAxis: {
				type: 'category',
				boundaryGap: false,
				data: charts.lineX,
				axisLine: {
					show: false,
				},
				axisLabel: {
					color: '#009FF1',
					fontSize: 14,
				},
				axisLine: {
			       lineStyle: {
			           color: 'rgb(0,0,0,0)'
			       }
		    	},
    		},
    		yAxis: {
	    		type: 'value',
	    		axisLabel: {
	    		formatter: '{value}',
	    		color: '#009FF1',
    		},
    		splitLine: {
	    		lineStyle: {
	    			color: 'rgba(255,255,255,0.2)'
	    		}
    		},
    		axisLine: {
	    		lineStyle: {
	    			color:'rgba(255,255,255,0.2)'
	    		}
    		},
    		axisTick: {
   			   show: false
   			},
   		  },
   		  series: lineY
   }
tu1.setOption(option);
}
function chart2(data){
var tu2 = echarts.init(document.getElementById('business-income'));
var art=data
option = {
		 color: new echarts.graphic.LinearGradient(
	                0, 0, 0, 1,
	                [
	                    {offset: 0, color: '#ffd154FF'},
	                    {offset: 1, color: '#ff903eFF'}
	                ]
	            ),
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        top:'9%',
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data :["1~3月","1~6月","1~9月","1~12月"],
	            axisTick: {
	                alignWithLabel: true
	            },
	            axisLabel: {
	            show: true,
	            color: "#009FF1FF" ,//X轴文字颜
	        }, 
	         axisLine: {
	            lineStyle: {
	                color: 'rgb(0,0,0,0)'
	            }
	        }
	        }
	    ],
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}',
	            color: '#009FF1FF',
	            
	        },
	        splitLine: {
	            lineStyle: {
	                color: '#344171FF'
	            }
	        },
	        axisLine: {
	            lineStyle: {
	                color: '#344171FF'
	            }
	        },
	        axisTick: {
	       show: false
	    },
	    },
	    series : [
	        {
	            name:'',
	            type:'bar',
	            barWidth: '30px',
	            data: art,
	            label: {
		            normal: {
		                show: true,
		                lineHeight: 30,
		                width: 80,
		                height: 30,
		                borderRadius: 200,
		                position: ['-25', '-30'],
		                distance: 1,
		                formatter: [' {a|{c}}'].join(','),
		                rich: {
		                    a: {
		                        color: '#FFFD2EFF',
		                        align: 'center',
		                        fontSize: 14,
		                    },
		                   
		                }
		            }
	          }
	       },  
	    ]
    };
tu2.setOption(option);
}
function chart3(data){
var tu3 = echarts.init(document.getElementById('profit'));
var art=data
option = {
		 color: new echarts.graphic.LinearGradient(
	                0, 0, 0, 1,
	                [
	                    {offset: 0, color: '#67f8b3FF'},
	                    {offset: 1, color: '#05a6fcFF'}
	                ]
	            ),
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        top:'9%',
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data :["1~3月","1~6月","1~9月","1~12月"],
	            axisTick: {
	                alignWithLabel: true
	            },
	            axisLabel: {
	            show: true,
	            color: "#009FF1FF" ,//X轴文字颜
	        }, 
	         	axisLine: {
		            lineStyle: {
		                color: 'rgb(0,0,0,0)'
		            }
	        }
	        }
	    ],
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}',
	            color: '#009FF1FF',
	            
	        },
	        splitLine: {
	            lineStyle: {
	                color: '#344171FF'
	            }
	        },
	        axisLine: {
	            lineStyle: {
	                color: '#344171FF'
	            }
	        },
	        axisTick: {
	       	show: false
	    },
	    },
	    series : [
	        {
	            name:'',
	            type:'bar',
	            barWidth: '30px',
	            data: art,
	            label: {
		            normal: {
		                show: true,
		                lineHeight: 30,
		                width: 80,
		                height: 30,
		                borderRadius: 200,
		                position: ['-25', '-30'],
		                distance: 1,
		                formatter: [' {a|{c}}'].join(','),
		                rich: {
		                    a: {
		                        color: '#FFFD2EFF',
		                        align: 'center',
		                        fontSize: 14,
		                    },
		                   
		                }
		            }
	            }
	        },   
	    ]
	};
tu3.setOption(option);
}
function chart4(data){
var tu4 = echarts.init(document.getElementById('sales-output'));
var art=data
option = {
		backgroundColor: 'rgb(0,0,0,0)',
		tooltip: {
			trigger: 'axis',
			axisPointer: {
			   lineStyle: {
			       color: '#57617B'
			   }
			}
		},
		legend: {
			show:false
		},
		grid: {
	        top:'9%',
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
		xAxis: [{
			type: 'category',
			boundaryGap: false,
			axisLine: {
			   lineStyle: {
			       color: 'rgb(0,0,0,0)'
			   }
			},
			splitLine: {show: false},
			axisLabel: {
			       fontSize: 14,
			       color:'#009FF1FF',
			},
			data:["1~3月","1~6月","1~9月","1~12月"], 
		}],
		yAxis: [{
			type: 'value',
			axisTick: {
			   show: false
			},
			axisLine: {
			   lineStyle: {
			       color: 'rgba(255,255,255,0.2)'
			   }
			},
			axisLabel: {
			   margin: 10,
		       fontSize: 14,
		       color:'#009FF1FF', 
			},
			splitLine: {
			   lineStyle: {
			       color: 'rgba(255,255,255,0.2)'
			   }
			}
		}],
		series: {
			name: '',
			type: 'line',
			smooth: false,
			showAllSymbol: true,
			symbol: 'emptyCircle',
			symbolSize: 7,
			lineStyle: {
			   normal: {
			       width:3
			   }
			},
			itemStyle: {
			   normal: {
			       color: '#E85242FF',
			   }
			},
			 data:art,
		} 
		};
tu4.setOption(option);
}
function chart5(data){
var tu5 = echarts.init(document.getElementById('exit'));
var art=data
option = {
		 color: new echarts.graphic.LinearGradient(
	                0, 0, 0, 1,
	                [
	                    {offset: 0, color: '#ffd154FF'},
	                    {offset: 1, color: '#67f8b3FF'}
	                ]
	            ),
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        top:'9%',
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data :["1~3月","1~6月","1~9月","1~12月"],
	            axisTick: {
	                alignWithLabel: true
	            },
	            axisLabel: {
	            show: true,
	            color: "#009FF1FF" ,//X轴文字颜
	        }, 
		        axisLine: {
		            lineStyle: {
		                color: 'rgb(0,0,0,0)'
		            }
		        }
	        }
	    ],
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}',
	            color: '#009FF1FF',
	            
	        },
	        splitLine: {
	            lineStyle: {
	                color: '#344171FF'
	            }
	        },
	        axisLine: {
	            lineStyle: {
	                color: '#344171FF'
	            }
	        },
	        axisTick: {
	        show: false
	    },
	    },
	    series : [
	        {
	            name:'',
	            type:'bar',
	            barWidth: '30px',
	            data: art,
	            label: {
		            normal: {
		                show: true,
		                lineHeight: 30,
		                width: 80,
		                height: 30,
		                borderRadius: 200,
		                position: ['-25', '-30'],
		                distance: 1,
		                formatter: [' {a|{c}}'].join(','),
		                rich: {
		                    a: {
		                        color: '#FFFD2EFF',
		                        align: 'center',
		                        fontSize: 14,
		                    },
		                }
		            }
	           }
	        },  
	    ]
	};
tu5.setOption(option);
}
function chart6(data){
var tu6 = echarts.init(document.getElementById('average'));	
var art=data
var charts = {
		names: ['', ''],
		lineX:  ["1~3月","1~6月","1~9月","1~12月"],
		value: [art]
	}
var color = ['rgba(23, 255, 243', 'rgba(255,100,97']
var lineY = []

for (var i = 0; i < charts.names.length; i++) {
var x = i
if (x > color.length - 1) {
x = color.length - 1
}
var data = {
	name: charts.names[i],
	type: 'line',
	color:'#00AF6DFF',
	smooth: true,
	areaStyle: {
	normal: {
		color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		offset: 0,
		color: color[x] + ', 1)'
		}, {
		offset:1,
		color: color[x] + ', 0)'
		}], false),
		shadowColor: 'rgba(0, 0, 0, 0.6)',
	}
	},
	lineStyle:{
		  width:4,  
		},
	symbol: 'circle',
	symbolSize: 2,
	data: charts.value[i]
	}
	lineY.push(data)
}
var option = {
	backgroundColor:'rgb(0,0,0,0)',
	tooltip: {
		trigger: 'axis'
	},
	grid: {
		top: '10%',
		left: '4%',
		right: '8%',
		bottom: '4%',
		containLabel: true
	},
	xAxis: {
		type: 'category',
		boundaryGap: false,
		data: charts.lineX,
		axisLine: {
			show: false,
		},
		axisLabel: {
			color: '#009FF1',
			fontSize: 14,
			
		},
		axisLine: {
		    lineStyle: {
		       color: 'rgb(0,0,0,0)'
		    }
	    },
		},
	yAxis: {
		type: 'value',
		axisLabel: {
			formatter: '{value}',
			color: '#009FF1',
		},
		splitLine: {
			lineStyle: {
				color: 'rgba(255,255,255,0.2)'
			}
		},
		axisLine: {
			lineStyle: {
				color:'rgba(255,255,255,0.2)'
			}
		},
		axisTick: {
   			show: false
        },
		},
		series: lineY
		}
tu6.setOption(option);
}
function getMoreDetailnew(id){
		layer.closeAll();
		layer.open({
			type: 1,
			area: ['500px', '300px'],
			offset: '300px',
			title: false,
			closeBtn: 0,
			content: $('#newdetail')
		});
		getchartdata(id)
		//添加自定义关闭按钮
		var $div = '<img src=\"${ctx}/static/image/cityDataCenter/close.png\" width=\"30\" class=\"closeBtn\" onclick="layer.closeAll()">';
		$('.layui-layer').prepend($div); //将新创建的div节点插入到nav容器的内容顶部
}
function newchart(data){
	var tu = echarts.init(document.getElementById('newchart'));
	var art=data;
	var option = {
			 color: new echarts.graphic.LinearGradient(
		                0, 0, 0, 1,
		                [
		                    {offset: 0, color: '#ffd154FF'},
		                    {offset: 1, color: '#ff903eFF'}
		                ]
		            ),
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		        top:'9%',
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data :["1~3月","1~6月","1~9月","1~12月"],
		            axisTick: {
		                alignWithLabel: true
		            },
		            axisLabel: {
		            show: true,
		            color: "#009FF1FF" ,//X轴文字颜
		        }, 
		         axisLine: {
		            lineStyle: {
		                color: 'rgb(0,0,0,0)'
		            }
		        }
		        }
		    ],
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		            formatter: '{value}',
		            color: '#009FF1FF',
		            
		        },
		        splitLine: {
		            lineStyle: {
		                color: '#344171FF'
		            }
		        },
		        axisLine: {
		            lineStyle: {
		                color: '#344171FF'
		            }
		        },
		        axisTick: {
		       show: false
		    },
		    },
		    series : [
		        {
		            name:'',
		            type:'bar',
		            barWidth: '30px',
		            data: art,
		            label: {
			            normal: {
			                show: true,
			                lineHeight: 30,
			                width: 80,
			                height: 30,
			                borderRadius: 200,
			                position: ['-25', '-30'],
			                distance: 1,
			                formatter: [' {a|{c}}'].join(','),
			                rich: {
			                    a: {
			                        color: '#FFFD2EFF',
			                        align: 'center',
			                        fontSize: 14,
			                    },
			                   
			                }
			            }
		          }
		       },  
		    ]
	    };
	tu.setOption(option);
	}
</script>
</body>
</html>
