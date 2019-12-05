<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>大数据中心-园区与企业分析</title>
<link href="${ctx}/static/weixin/css/dataCenter/industryMap.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${ctx}/static/plugins/echart/echarts.min.js"></script>
</head>

<body>
	<div class="industry_main">
		<form action="" method="post" id="form">
			<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
			<input type="hidden" id="areaId" name="areaId" value="${areaInfo.areaId}">
			<input type="hidden" id="areaName" name="areaName" value="${areaInfo.areaName}">
			<input type="hidden" id="year" name="year" value="${searchInfo.year}">
			<input type="hidden" id="quarter" name="quarter" value="${searchInfo.quarter}">
			<input type="hidden" id="isProvince" name="isProvince" value="${areaInfo.isProvince}">
			<input type="hidden" id="provinceId" name="provinceId" value="${provinceId}">
		</form>
		<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/weixin/dataCenter/economicCount?orgId=${orgId}">
		<div class="industry_searchBar clearfix">
			<div class="industry_search_region">
				<img src="${ctx}/static/weixin/images/dataCenter/region.png" width="15">
				<span id="region">${areaInfo.areaName}</span> <span class="caret"></span>
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
			<div id="industry_down" style="left: 33%;">
				<ul>
					<c:if test="${! empty searchList.yearList}">
						<c:forEach items="${searchList.yearList}" var="info">
							<li><a href="javascript:;" onclick="selectByYear('${info.year}')">${info.year}年</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			
			<div class="industry_search_scale">
				<span id="scale">第${searchInfo.quarter==4?'四':searchInfo.quarter==3?'三':searchInfo.quarter==2?'二':'一'}季度</span> <span class="caret"></span>
			</div>
			<div id="scale_down" style="left: 66%;">
				<ul>
					<c:if test="${! empty searchList.quarterList}">
						<c:forEach items="${searchList.quarterList}" var="info">
							<li><a href="javascript:;" onclick="selectByQuarter('${info.quarter}')">第${info.quarter==4?'四':info.quarter==3?'三':info.quarter==2?'二':'一'}季度</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			
		</div>
		<div class="industry_content">
			<div id="mapPage" class="industry_dataCenter">
				<div class="industry_information clearfix">
					<a class="industry_choice_module greenModule" href="javascript:void(0)">
			        <div class="industry_text">
			            <p>工业园区总数</p>
			            <h1 id="ec0"></h1>
			            <p></p>
			        </div>
		        </a>
		        <a class="industry_choice_module purpleModule" href="javascript:void(0)">
			        <div class="industry_text">
			            <!-- <p>工业增加值</p>
			            <h1><span id="ec1"></span><small>亿元</small></h1>
			            <p>同比增长<span id="ec2"></span>%</p> -->
			            <p>工业增加值</p>
			            <h1><span style="font-size: 16px;color: #fff;">同比增长</span><span id="ec2"></span>%</h1>
			            <p></p>
			        </div>
		        </a>
		        <a class="industry_choice_module blueModule" href="javascript:void(0)">
			        <div class="industry_text">
			            <p>主营业务收入</p>
			            <h1><span id="ec3"></span><small>亿元</small></h1>
			            <p>同比增长<span id="ec4"></span>%</p>
			        </div>
		        </a>
		        <a class="industry_choice_module blueModule" href="javascript:void(0)">
			        <div class="industry_text">
			            <p>利润总额</p>
			            <h1><span id="ec5"></span><small>亿元</small></h1>
			            <p>同比增长<span id="ec6"></span>%</p>
			        </div>
		        </a>
				</div>
				<div class="industry_demoText industry_countText">
				<div class="industry_demoImg" id="part1" style="height: 500px;"></div>
				</div>
				<!-- <div class="industry_demoImg" id="part12"></div> -->
				<div class="industry_demoText industry_countText">
				<div class="industry_demoImg" id="part2"></div>
				</div>
				<div class="industry_demoText industry_countText">
				<div class="industry_demoImg" id="part3" style="height: 500px;"></div>
				</div>
				<!-- <div class="industry_demoImg" id="part32"></div> -->
				<div class="industry_demoText industry_countText">
				<div class="industry_demoImg" id="part4"></div>
				</div>
				<c:choose>
					<c:when test="${areaInfo.isProvince}">
						<div class="returnBtn" onclick="window.location.href='${ctx}/weixin/dataCenter/energyCount?orgId=${orgId}'"></div>
					</c:when>
					<c:otherwise>
						<div class="returnBtn" onclick="window.location.href='${ctx}/weixin/dataCenter/industryCount?orgId=${orgId}'"></div>
					</c:otherwise>
				</c:choose>
				<div class="returnBtn switchBtn_next" onclick="window.location.href='${ctx}/weixin/dataCenter/economicCount?orgId=${orgId}'"></div>
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
  	
    //产业下拉框
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
    //规模下拉框
    $(".industry_search_scale").click(function(e){
        var ul = $("#scale_down ul");
        e.stopPropagation();
        $("#region_down ul").slideUp();
        $("#industry_down ul").slideUp();
        ul.slideToggle();
    });
    $("#scale_down ul li a").click(function(){
        $("#scale").text($(this).text());
        $("#scale_down ul").hide();
    });

    $(document).scroll(function(){
        if($(document).scrollTop() >= $(document).height() - $(window).height() - 2){
           	$(".industry_more").fadeOut();
        }else {
        	$(".industry_more").fadeIn();
        }
    })
})
</script>

<script type="text/javascript">

var optionPart1 = {
		title : {
	        text: '| ${areaInfo.areaName}工业园区数量（单位：个）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:16,
	        },
	        left:5,
	        top:5
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	    	/* orient: 'vertical',
	        x:'right',
	        padding:[10,10],
	    	top:5,
			right:'2%', */
			top:35,
			padding:[10,30],
			selected:{'全部':true,'国家级':false,'重点省级':false,'省级':false,'筹建':false},
			itemWidth:20,
			itemHeight:10,
	        data:[
				{name:'全部',textStyle:{color:"#FCFF00"}},
				{name:'国家级',textStyle:{color:"#FCFF00"}},
				{name:'重点省级',textStyle:{color:"#FCFF00"}},
				{name:'省级',textStyle:{color:"#FCFF00"}},
				{name:'筹建',textStyle:{color:"#FCFF00"}}
			]
	    },
	    grid: {
	    	top:'17%',
	    	bottom:'5%',
	    	height:'80%',
	        containLabel: true
	    },
	    yAxis : [
	        {
	            type : 'category',
	        	axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	}
	        }
	    ],
	    xAxis : [
	        {
	            type : 'value',
	            axisLabel : {
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
	    series : [
	        {
	            name:'全部',
	            stack: '总量',
	            type:'bar',
	            barWidth:'45%',
	            label:{
	            	normal:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	},
	            	emphasis:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	}
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#799C0E'
	            	}
	            }
	        },
	        {
	            name:'国家级',
	            stack: '总量',
	            type:'bar',
	            barWidth:'45%',
	            label:{
	            	normal:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#000'
	            		}
	            	},
	            	emphasis:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#000'
	            		}
	            	}
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#FCFF00'
	            	}
	            }
	        },
	        {
	            name:'重点省级',
	            stack: '总量',
	            type:'bar',
	            barWidth:'45%',
	            label:{
	            	normal:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	},
	            	emphasis:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	}
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#5EC9F4'
	            	}
	            }
	        },
	        {
	            name:'省级',
	            stack: '总量',
	            type:'bar',
	            barWidth:'45%',
	            label:{
	            	normal:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	},
	            	emphasis:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	}
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#D48165'
	            	}
	            }
	        },
	        {
	            name:'筹建',
	            stack: '总量',
	            type:'bar',
	            barWidth:'45%',
	            label:{
	            	normal:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	},
	            	emphasis:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	}
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#62A1AA'
	            	}
	            }
	        }
	    ]
	};

var optionPart2 = {
		tooltip: {
		        trigger: 'item',
		        formatter: "{b}: {c} ({d}%)"
		},
	    legend: {
	    	top:10,
			padding:[10,30],
	        itemWidth:20,
	        itemHeight:10
	    },
	    color:['#CD0567','#FCFF00','#799C0E','#11729D'], 
	    series: [
	        {
	            type:'pie',
	            center:['50%','57%'],
	            radius: ['45%', '65%']
	        }
	    ]    
	     
	};

	
var optionPart3 = {
		title : {
	        text: '| ${areaInfo.areaName}工业园区投产企业数量（单位：个）',
	        textStyle:{
	        	color:"#b0e7ff",
	        	fontSize:16
	        },
	        left:5,
	        top:5
	    },
	    grid: {
	    	top:'17%',
	    	bottom:'5%',
	        containLabel: true
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
			top:35,
			padding:[10,30],
	        itemWidth:20,
			itemHeight:10,
			selected:{'投产':true,'非工企业数':false},
	        data:[
				{name:'投产',textStyle:{color:"#FCFF00"}},
				{name:'非工企业数',textStyle:{color:"#FCFF00"}}
			]
	    },
	    yAxis : [
	        {
	            type : 'category',
	        	axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	}
	        }
	    ],
	    xAxis : [
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
	            name:'投产',
	            stack: '总量',
	            type:'bar',
	            barWidth:'45%',
	            label:{
	            	normal:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	},
	            	emphasis:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#FCFF00'
	            		}
	            	}
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#C23531'
	            	}
	            }
	        },
	        {
	            name:'非工企业数',
	            stack: '总量',
	            type:'bar',
	            barWidth:'45%',
	            label:{
	            	normal:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#000'
	            		}
	            	},
	            	emphasis:{
	            		show:true,
	            		position:'insideRight',
	            		textStyle:{
	            			color:'#000'
	            		}
	            	}
	            },
	            itemStyle:{
	            	normal:{
	            		color:'#FCFF00'
	            	}
	            }
	        }
	    ]
	};



var optionPart4 = {
	    tooltip: {
	        trigger: 'item',
	        formatter: "{b}: {c} ({d}%)"
	    },
	    legend: {
	     //   orient: 'vertical',
	        x: 'right',
	        padding:[10,10],
	        itemWidth:20,
	        itemHeight:10
	    },
	    color:['#799C0E', '#FCFF00'] , 
	    series: [
	        {
			    center:['50%','50%'],
	            type:'pie',
	            radius: ['45%', '65%']
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
	
	/*按季度搜索*/
	function selectByQuarter(quarter){
     	$("#quarter").val(quarter);
     	loadEchart();
	}
	
	/*按地市搜索*/
	function selectByAreaId(areaId, areaName){
		$("#areaId").val(areaId); 
		$("#areaName").val(areaName);
		loadEchart();
	}
	
	var index = [
		"parkTotla",
		"gyzjz_value",
		"gyzjz_percent", 
		"zyywsr_value", 
		"zyywsr_percent", 
		"lr_value", 
		"lr_percent", 
	]
	function loadEchart(){
		$.ajax({
			url:"${ctx}/interface/json/dataCenter/organizationCount",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			success:function(result){
				var parkData = result.parkData;
				var compData = result.compAndEcData.compData;
				var ecData = result.compAndEcData.ecData;
				
				for(var i=0;i<index.length;i++){
					if(i==0){
						$("#ec"+i).text(parkData[index[i]]);
					}else{						
						$("#ec"+i).text(ecData[index[i]]);
					} 
				}
				
				var myChart1 = echarts.init(document.getElementById('part1'));
				var myChart2 = echarts.init(document.getElementById('part2'));
				var myChart3 = echarts.init(document.getElementById('part3'));
				var myChart4 = echarts.init(document.getElementById('part4'));
				//part1
				var areaName = $("#areaName").val();
				if(areaName=="江西省"){
					areaName = "全省";
				}
				
				optionPart1.title.text="| "+areaName+"工业园区数量（单位：个）";
			 	optionPart1.yAxis[0].data=arrData(parkData.line.xAxis);
				optionPart1.series[0].data=arrData(parkData.line.series[0]);
				optionPart1.series[1].data=arrData(parkData.line.series[1]);
				optionPart1.series[2].data=arrData(parkData.line.series[2]);
				optionPart1.series[3].data=arrData(parkData.line.series[3]);
				optionPart1.series[4].data=arrData(parkData.line.series[4]);
				myChart1.setOption(optionPart1);
				
				//part2
				var legend = [];
				var textStyle = {color:'#FFF'};
				for(var i=0;i<parkData.pie.legend.length;i++){
					var legendIndex = {
						name:parkData.pie.legend[i].name,
					    textStyle:textStyle
					};
					legend.push(legendIndex);
				}
				optionPart2.legend.data=legend;
				optionPart2.series[0].data=parkData.pie.series;
				myChart2.setOption(optionPart2);
				
				//part3
				optionPart3.title.text="| "+areaName+"工业园区投产企业数量（单位：个）";
				optionPart3.yAxis[0].data=arrData(compData.line.xAxis);
				optionPart3.series[0].data=arrData(compData.line.series[0]);
				optionPart3.series[1].data=arrData(compData.line.series[1]);
				myChart3.setOption(optionPart3);
				
				//part4
				optionPart2.legend.data=compData.pie.legend;
				optionPart2.series[0].data=compData.pie.series;
				myChart4.setOption(optionPart2);

			},
			error:function(){
				layer.msg("加载超时，请刷新重试！");
			}
		
		});
	}
	
	var arrData = function (data) {
		var arr = new Array();
		for(var i=0;i<data.length;i++){
			arr.push(data[data.length-i-1]);;
		}
		return arr;
	};
	
</script>
<script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js "></script>
<script type="text/javascript">

	$(document).on("pagecreate",function(){
		var isProvince ='${areaInfo.isProvince}';
		$("body").on("swipeleft",function(){
			window.location.href="${ctx}/weixin/dataCenter/economicCount?orgId=${orgId}";
        });
		$("body").on("swiperight",function(){
			if(isProvince=='true'){				
				window.location.href="${ctx}/weixin/dataCenter/energyCount?orgId=${orgId}";
			}else{
				window.location.href="${ctx}/weixin/dataCenter/industryCount?orgId=${orgId}";
			}
        });
    });
	
</script>
</body>

</html>