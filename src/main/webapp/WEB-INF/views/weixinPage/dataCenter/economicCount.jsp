<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>大数据中心-主要经济指标分析</title>
<link href="${ctx}/static/weixin/css/dataCenter/industryMap.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
</head>

<body>
	<form action="" method="post" id="form">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type="hidden" id="areaId" name="areaId" value="${areaInfo.areaId}">
		<input type="hidden" id="areaName" name="areaName" value="${areaInfo.areaName}">
		<input type="hidden" id="year" name="year" value="${searchInfo.year}">
		<input type="hidden" id="quarter" name="quarter" value="${searchInfo.quarter}">
		<input type="hidden" id="isProvince" name="isProvince" value="${areaInfo.isProvince}">
		<input type="hidden" id="provinceId" name="provinceId" value="${provinceId}">
	</form>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/weixin/dataCenter/industryCount?orgId=${orgId}">
	<div class="industry_main">
		<div class="industry_searchBar clearfix">
			<div class="industry_search_region">
				<img src="${ctx}/static/weixin/images/dataCenter/region.png" width="15"> 
				<span id="region">${areaInfo.areaName}</span>
				<span class="caret"></span>
			</div>
			<div id="region_down" style="left: 0;">
				<ul>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360000','江西省')">江西省</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360100','南昌市')">南昌市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360400','九江市')">九江市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360700','赣州市')">赣州市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360800','吉安市')">吉安市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360300','萍乡市')">萍乡市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360600','鹰潭市')">鹰潭市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360500','新余市')">新余市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360900','宜春市')">宜春市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('361100','上饶市')">上饶市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('360200','景德镇市')">景德镇市</a></li>
					<li><a href="javascript:;"
						onclick="selectByAreaId('361000','抚州市')">抚州市</a></li>
				</ul>
			</div>
			
			<div class="industry_search_industry">
				<span id="industry">${searchInfo.year}年</span> <span class="caret"></span>
			</div>
			<div id="industry_down" style="left: 50%;">
				<ul>
				    <c:if test="${! empty searchList.yearList}">
						<c:forEach items="${searchList.yearList}" var="info">
							<li><a href="javascript:;" onclick="selectByYear('${info.year}')">${info.year}年</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			
		</div>
		<div class="industry_content">
			<div id="mapPage" class="industry_dataCenter">
				<div class="industry_demoText industry_countText">
					<div class="industry_demoImg half_height" id="part1"></div>
				</div>
				<div class="industry_demoText industry_countText">
					<div class="industry_demoImg half_height" id="part2"></div>
				</div>
				<div class="industry_demoText industry_countText">
					<div class="industry_demoImg half_height" id="part3"></div>
				</div>
				<div class="industry_demoText industry_countText">
					<div class="industry_demoImg half_height" id="part4"></div>
				</div>
				<div class="industry_demoText industry_countText">
					<div class="industry_demoImg half_height" id="part5"></div>
				</div>
				<div class="industry_demoText industry_countText">
					<div class="industry_demoImg half_height" id="part6"></div>
				</div>
                <div class="returnBtn"></div>
                <div class="returnBtn switchBtn_next"></div>
				
				<div class="returnBtn" onclick="window.location.href='${ctx}/weixin/dataCenter/organizationCount?orgId=${orgId}'"></div>
				<div class="returnBtn switchBtn_next" onclick="window.location.href='${ctx}/weixin/dataCenter/industryCount?orgId=${orgId}'"></div>
				<div class="industry_more">+ 下拉查看更多</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
    var downHeight = $(".industry_content").height();
    $("#region_down ul").css("max-height",downHeight);
    $("#industry_down ul").css("max-height",downHeight);
    $("#scale_down ul").css("max-height",downHeight);
  	//点击空白关闭下拉框
    $(document).on("click",function(){
        $(".industry_searchBar ul").slideUp();
        $(".industry_searchBar").click(function(e){
        	e.stopPropagation();
        });

    });
    $(document).scroll(function(){
        if($(document).scrollTop() >= $(document).height() - $(window).height() - 2){
           $(".industry_more").fadeOut();
           }
        else {$(".industry_more").fadeIn();}
    })
    
	var isProvince ='${areaInfo.isProvince}';
	if(isProvince=='true'){
		//区域下拉框
		$(".industry_search_region").click(function(e) {
			var ul = $("#region_down ul");
			e.stopPropagation();
			$("#industry_down ul").slideUp();
			$("#scale_down ul").slideUp();
			$("#industryKind_down ul").slideUp();
			ul.slideToggle();
		});
		$("#region_down ul li a").click(function() {
			$("#region").text($(this).text());
			$("#region_down ul").hide();
		});
	}
  	
    //时间
    $(".industry_search_industry").click(function(e){
        var ul = $("#industry_down ul");
        e.stopPropagation();
        $("#region_down ul").slideUp();
        $("#scale_down ul").slideUp();
        ul.slideToggle();
    });
    $("#industry_down ul li a").click(function(){
        $("#industry").text($(this).text());
        $("#industry_down ul").hide();
    }); 
});
</script>
<script type="text/javascript">
var optionPart1 = {
		title : {
	        text: '| 工业增加值（单位：亿元）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:16
	        },
	        left:5,
	        top:5
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        padding:[5,5],
	    	top:'15%',
			itemWidth:20,
			itemHeight:10,
	        data:[
				{name:'同比增速',textStyle:{color:"#FCFF00"}}
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
	            boundaryGap:false,
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
	            name: '增速',
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value} %'
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
	            name:'同比增速',
	            type:'line',
	            yAxisIndex: 0,
	            areaStyle: {normal: {}},
	            data:[],
	            markPoint : {
	            	symbolSize : 35,
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ],
	                label:{
	            		normal:{
	            			textStyle:{
		            			color:"#fff"
	            			}
	            		}
	            	},
	            	itemStyle:{
	            		normal:{
	            			color:"#799C0E"
	            		}
	            	}
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name: '平均值'}
	                ],
	                lineStyle:{
		            	normal:{
		            		color:"#88CFFB"
		            	},
		            	emphasis:{
		            		color:'#5EC9F4'
		            	}
		            },
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#88CFFB'
	            	}
	            }
	        }
	    ]
};


//part2
var optionPart2 = {
		title : {
	        text: '| 主营业务收入（单位：亿元）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:16
	        },
	        left:5,
	        top:5
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        padding:[5,5],
	    	top:'15%',
			itemWidth:20,
			itemHeight:10,
	        data:[
				{name:'同比增速',textStyle:{color:"#FCFF00"}},
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
	            scale: true,
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
	        },
	        {
	            type: 'value',
	            name: '增速',
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value} %'
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
	            data:[],
	            barWidth:'25%',
	            markPoint : {
	            	symbolSize:35,
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
		            		color:"#5EC9F4"
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
	            		color:'#5EC9F4'
	            	}
	            }
	        },
	        {
	            name:'同比增速',
	            type:'line',
	            yAxisIndex: 1,
	            data:[],
	            markPoint : {
	            	symbolSize : 35,
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ],
	                label:{
	            		normal:{
	            			textStyle:{
		            			color:"#fff"
	            			}
	            		}
	            	},
	            	itemStyle:{
	            		normal:{
	            			color:"#799C0E"
	            		}
	            	}
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name: '平均值'}
	                ],
	                lineStyle:{
		            	normal:{
		            		color:"#799C0E"
		            	},
		            	emphasis:{
		            		color:'#5EC9F4'
		            	}
		            },
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#F16B4E'
	            	}
	            }
	        }
	    ]
};


//part3
var optionPart3 = {
		title : {
	        text: '| 招商实际到位资金（单位：亿元）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:16
	        },
	        left:5,
	        top:5
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        padding:[5,5],
	    	top:'15%',
			itemWidth:20,
			itemHeight:10,
	        data:[
				{name:'同比增速',textStyle:{color:"#FCFF00"}},
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
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value}'
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
	        {
	            type: 'value',
	            name: '增速',
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value} %'
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
	            data:[],
	            barWidth:'25%',
	            markPoint : {
	            	symbolSize:35,
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
		            		color:"#8AEED6"
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
	            		color:'#8AEED6'
	            	}
	            }
	        },
	        {
	            name:'同比增速',
	            type:'line',
	            yAxisIndex: 1,
	            data:[],
	            markPoint : {
	            	symbolSize : 35,
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ],
	                label:{
	            		normal:{
	            			textStyle:{
		            			color:"#fff"
	            			}
	            		}
	            	},
	            	itemStyle:{
	            		normal:{
	            			color:"#799C0E"
	            		}
	            	}
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name: '平均值'}
	                ],
	                lineStyle:{
		            	normal:{
		            		color:"#94BD9F"
		            	},
		            	emphasis:{
		            		color:'#5EC9F4'
		            	}
		            },
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#94BD9F'
	            	}
	            }
	        }
	    ]
};


//part4
var optionPart4 = {
		title : {
	        text: '| 利润总额（单位：亿元）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:16
	        },
	        left:5,
	        top:5
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        padding:[5,5],
	    	top:'15%',
			itemWidth:20,
			itemHeight:10,
	        data:[
				{name:'同比增速',textStyle:{color:"#FCFF00"}},
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
	            boundaryGap : false,
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
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value}'
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
	        {
	            type: 'value',
	            name: '增速',
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value} %'
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
	            type:'line',
	            data:[],
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
		            		color:"#E8B600"
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
	            		color:'#E8B600'
	            	}
	            }
	        },
	        {
	            name:'同比增速',
	            type:'line',
	            yAxisIndex: 1,
	            data:[],
	            markPoint : {
	            	symbolSize : 35,
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ],
	                label:{
	            		normal:{
	            			textStyle:{
		            			color:"#fff"
	            			}
	            		}
	            	},
	            	itemStyle:{
	            		normal:{
	            			color:"#799C0E"
	            		}
	            	}
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name: '平均值'}
	                ],
	                lineStyle:{
		            	normal:{
		            		color:"#799C0E"
		            	},
		            	emphasis:{
		            		color:'#5EC9F4'
		            	}
		            },
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#799C0E'
	            	}
	            }
	        }
	    ]
};

//part5
var optionPart5 = {
		title : {
	        text: '| 本月止园区实际开发面积（单位：平方公里）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:16
	        },
	        left:5,
	        top:5
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        padding:[5,5],
	    	top:'15%',
			itemWidth:20,
			itemHeight:10,
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
	            boundaryGap : false,
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
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value}'
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
	            type:'line',
	            areaStyle: {normal: {}},
	            data:[],
	            barWidth:'25%',
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
		            		color:"#9AA585"
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
	            		color:'#9AA585'
	            	}
	            }
	        }
	    ]
};


//part6
var optionPart6 = {
		title : {
	        text: '| 出口交货值（单位：亿元）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:16
	        },
	        left:5,
	        top:5
	    },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        padding:[5,5],
	    	top:'15%',
			itemWidth:20,
			itemHeight:10,
	        data:[
				{name:'同比增速',textStyle:{color:"#FCFF00"}},
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
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value}'
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
	        {
	            type: 'value',
	            name: '增速',
	            scale: true,
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value} %'
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
	            data:[],
	            barWidth:'25%',
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
		            		color:"#CD0567"
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
	            		color:'#CD0567'
	            	}
	            }
	        },
	        {
	            name:'同比增速',
	            type:'line',
	            yAxisIndex: 1,
	            data:[],
	            markPoint : {
	            	symbolSize : 35,
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ],
	                label:{
	            		normal:{
	            			textStyle:{
		            			color:"#fff"
	            			}
	            		}
	            	},
	            	itemStyle:{
	            		normal:{
	            			color:"#799C0E"
	            		}
	            	}
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name: '平均值'}
	                ],
	                lineStyle:{
		            	normal:{
		            		color:"#9AA585"
		            	},
		            	emphasis:{
		            		color:'#5EC9F4'
		            	}
		            }
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#9AA585'
	            	}
	            }
	        }
	    ]
};

</script>
<script type="text/javascript">
	$(function(){
		/*判断组织id是否有效*/
		var areaInfo = ${areaInfo};
		if($.isEmptyObject(areaInfo)){
			layer.msg('请填写有效组织ID！', {
				shade: 0.5,
				time:100000000
			});
			return;
		}
		 
		/*加载echart图形*/
		loadEchart();
		
		/*页面定时跳转事件*/
		initScreenSaver();
	});
	
	/*按年份搜索*/
	function selectByYear(year){
	 	$("#year").val(year);
	 	loadEchart();
	}
	
	/*按地市搜索*/
	function selectByAreaId(areaId, areaName){
		$("#areaId").val(areaId); 
		$("#areaName").val(areaName);
		loadEchart();
	}
	
	function loadEchart(){
		$.ajax({
			url:"${ctx}/interface/json/dataCenter/economicCount",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			success:function(result){
				var ecData = result.economicData.ecData;
				
				var myChart1 = echarts.init(document.getElementById('part1'));
				var myChart2 = echarts.init(document.getElementById('part2'));
				var myChart3 = echarts.init(document.getElementById('part3'));
				var myChart4 = echarts.init(document.getElementById('part4'));
				var myChart5 = echarts.init(document.getElementById('part5')); 
				var myChart6 = echarts.init(document.getElementById('part6'));
				
				optionPart1.series[0].data=ecData[0][0];
				myChart1.setOption(optionPart1);
				
				optionPart2.series[0].data=ecData[1][0];
				optionPart2.series[1].data=ecData[1][1];
				myChart2.setOption(optionPart2);
				
				optionPart3.series[0].data=ecData[2][0];
				optionPart3.series[1].data=ecData[2][1];
				myChart3.setOption(optionPart3);
				
				optionPart4.series[0].data=ecData[3][0];
				optionPart4.series[1].data=ecData[3][1];
				myChart4.setOption(optionPart4);
				
				optionPart5.series[0].data=ecData[4][0];
				myChart5.setOption(optionPart5);
				
				optionPart6.series[0].data=ecData[5][0];
				optionPart6.series[1].data=ecData[5][1];
				myChart6.setOption(optionPart6);
				
			},
			error:function(){
				layer.msg("加载超时，请刷新重试！");
			}
		
		});
	}
	
	
</script>
<script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js "></script>
<script type="text/javascript">

	$(document).on("pagecreate",function(){
		$("body").on("swipeleft",function(){
			window.location.href="${ctx}/weixin/dataCenter/industryCount?orgId=${orgId}";
        });
		$("body").on("swiperight",function(){
			window.location.href="${ctx}/weixin/dataCenter/organizationCount?orgId=${orgId}";
        });
    });
	
</script>
</body>
</html>