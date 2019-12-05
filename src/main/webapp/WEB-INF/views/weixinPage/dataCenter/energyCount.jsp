<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>大数据中心-重点企业能耗监测</title>
<link href="${ctx}/static/weixin/css/dataCenter/industryMap.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
</head>
<body>
	<form action="" method="post" id="form">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type="hidden" id="areaId" name="areaId" value="${areaInfo.areaId}">
		<input type="hidden" id="areaName" name="areaName" value="${areaInfo.areaName}">
		<input type="hidden" id="year" name="year" value="2016">
		<input type="hidden" id="isProvince" name="isProvince" value="${areaInfo.isProvince}">
		<input type="hidden" id="provinceId" name="provinceId" value="${provinceId}">
		<input type="hidden" id="industryType" name="industryType" value="2">
	</form>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/weixin/dataCenter/organizationCount?orgId=${orgId}">
    <div class="industry_main">
        <div class="industry_searchBar clearfix">
            <div class="industry_search_region">
				<img src="${ctx}/static/weixin/images/dataCenter/region.png" width="15"> <span id="region">江西省</span>
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
				<span id="industry">2016年</span> <span class="caret"></span>
			</div>
			<div id="industry_down" style="left: 50%;">
				<ul>
				    <li><a href="javascript:;" onclick="selectByTime('2017')">2017年</a></li>
					<li><a href="javascript:;" onclick="selectByTime('2016')">2016年</a></li>
					<li><a href="javascript:;" onclick="selectByTime('2015')">2015年</a></li>
					<li><a href="javascript:;" onclick="selectByTime('2014')">2014年</a></li>
				</ul>
			</div>	
			
        </div>
        <div class="industry_content">
            <div id="mapPage" class="industry_dataCenter">
                <div class="industry_infor">
                    <div class="industry_text greenModule">
                        <p>纳入监管企业</p>
                        <h1 id="totalData1">492<small>户</small></h1>
                    </div>
                    <div class="industry_text purpleModule">
                        <p>能耗消耗五千吨以上</p>
                        <h1 id="totalData2">253<small>户</small></h1>
                    </div>
                    <div class="industry_text blueModule">
                        <p>能耗消耗十万吨以上</p>
                        <h1 id="totalData3">55<small>户</small></h1>
                    </div>
                </div>
				<div class="industry_demoText industry_countText">
                <div class="industry_demoImg" id="part1" style="height: 500px;"></div>
                </div>
				<div class="industry_demoText industry_countText">
                <div class="industry_demoImg" id="part2" style="height: 400px;"></div>
                </div>
                <!-- <div class="industry_demoImg"></div> -->
                <div class="industry_demoText industry_demoText2">
                    <div class="title" id="listData">钢铁企业能耗下降明显</div>
                    <ul id="listDataUl">
                        <li>萍乡安源钢铁	<span style="float: right;">-9.60%</span></li>
                        <li>新余钢铁	<span>-3.10%</span></li>
                        <li>放大特钢	<span>-0.60%</span></li>
                    </ul>
                </div>
                
                <div class="returnBtn" onclick="window.location.href='${ctx}/weixin/dataCenter/industryCount?orgId=${orgId}'"></div>
				<div class="returnBtn switchBtn_next" onclick="window.location.href='${ctx}/weixin/dataCenter/organizationCount?orgId=${orgId}'"></div>
				<div class="industry_more">+ 下拉显示更多</div>
            </div>
        </div>
    </div>
    <script>
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
      	
		/* var areaId = '${areaId}';
		if(areaId==360000){
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
		} */
		
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

        $(document).scroll(function(){
            if($(document).scrollTop() >= $(document).height() - $(window).height() - 2){
               $(".industry_more").fadeOut();
               }
            else {$(".industry_more").fadeIn();}
        })
    })

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
	
	function loadEchart(){
		$.ajax({
			url:"${ctx}/interface/json/dataCenter/energyCount",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			success:function(result){
				var bar1 = result.energyData.bar1;
				var bar2 = result.energyData.bar2;
				var listData = result.energyData.list;
				var totalData = result.energyData.totalData;
				
				if(totalData.length>1){
					$("#totalData1").text(totalData[0]).append("<small>户</small>");
					$("#totalData2").text(totalData[1]).append("<small>户</small>");
					$("#totalData3").text(totalData[2]).append("<small>户</small>");
				}else{
					$("#totalData1").text("暂无数据");
					$("#totalData2").text("暂无数据");
					$("#totalData3").text("暂无数据");
				}
				
				$("#listData").empty();
				$("#listDataUl").empty();
				$("#listData").append(listData.comment);
				if(listData.listData.length>1){
					for(var i=0;i<listData.listData.length/2;i++){
						$("#listDataUl").append("<li>"+listData.listData[i*2]+"<span style='float: right;'>"+listData.listData[i*2+1]+"</span></li>");
					}
				}
				
				var myChart1 = echarts.init(document.getElementById('part1'));
				var myChart2 = echarts.init(document.getElementById('part2'));
				
				//part1
			 	optionPart1.legend.data = arrData(bar1.legend);
			 	optionPart1.yAxis[0].data = arrData(bar1.xAxis);
				optionPart1.series[0].data = arrData(bar1.series0);
				optionPart1.series[1].data = arrData(bar1.series1); 
				myChart1.setOption(optionPart1);
				
			    //part2
				optionPart2.legend.data = arrData(bar2.legend);
				optionPart2.yAxis[0].data = arrData(bar2.xAxis);
				optionPart2.series[0].data = arrData(bar2.series0);
				optionPart2.series[1].data = arrData(bar2.series1);
				myChart2.setOption(optionPart2);
				
			},
			error:function(){
				layer.msg("加载超时，请刷新重试！");
			}
		
		});
	}
	
	function selectByTime(year){
		$("#year").val(year);
		loadEchart();
	}
	
	var arrData = function (data) {
		var str = eval('(' + data + ')');
		var arr = new Array();
		for(var i=0;i<str.length;i++){
			arr.push(str[str.length-i-1]);;
		}
		return arr;
	};
    
    
	var optionPart1 = {
			backgroundColor: '#044d79', 
			title : {
		        text: '| 规模以上工业能源消费（单位：万吨标准煤）',
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:16,
		        },
		        left:5,
		        top:5
		    },
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:'6%',
				right:'2%'
		    },
		    grid: {
		    	bottom:15,
		    	left:'4%',
		    	width:'85%',
		        containLabel: true,
		    },
		    yAxis: [
		        {
		            type: 'category',
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	}
		        }
		    ],
		    xAxis: [
		        {
		            type: 'value',
		            name: '总量',
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
		            name:'综合能耗',
		            type:'bar',
		            barWidth:'12',
		            label:{
		            	normal:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	},
		            	emphasis:{
		            		show:true,
		            		position:'right',
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
		            name:'同比',
		            type:'bar',
		            barWidth:'12',
		            label:{
		            	normal:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	},
		            	emphasis:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	}
		            },
		            xAxisIndex: 1,
		            itemStyle:{
		            	normal:{
		            		color:'#799C0E'
		            	}
		            }
		        }
		    ]
	};
	
	
	var optionPart2 = {
			backgroundColor: '#044d79', 
			title : {
		        text: '| 六大高耗能行业综合能源消耗量（单位：万吨标准煤）',
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:16,
		        },
		        left:5,
		        top:5
		    },
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:'6%',
				right:'2%'
		    },
		    grid: {
		    	bottom:15,
		    	left:'4%',
		    	width:'85%',
		        containLabel: true,
		    },
		    yAxis: [
		        {
		            type: 'category',
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	axisLabel :{ 
		        		formatter : function(params){
                            var newParamsName = "";
                            var paramsNameNumber = params.length;
                            var provideNumber = 4;
                            var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
                            if (paramsNameNumber > provideNumber) {
                                for (var p = 0; p < rowNumber; p++) {
                                    var tempStr = "";
                                    var start = p * provideNumber;
                                    var end = start + provideNumber;
                                    if (p == rowNumber - 1) {
                                        tempStr = params.substring(start, paramsNameNumber);
                                    } else {
                                        tempStr = params.substring(start, end) + "\n";
                                    }
                                    newParamsName += tempStr;
                                }

                            } else {
                                newParamsName = params;
                            }
                            return newParamsName
                        },
                        fontSize:12,
		        	    interval:0
		        	}
		        }
		    ],
		    xAxis: [
		        {
		            type: 'value',
		            name: '总量',
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
		            name:'综合能耗',
		            type:'bar',
		            barWidth:'12',
		            label:{
		            	normal:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	},
		            	emphasis:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	}
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#CE0867'
		            	}
		            }
		        },
		        {
		            name:'同比',
		            type:'bar',
		            barWidth:'12',
		            label:{
		            	normal:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	},
		            	emphasis:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	}
		            },
		            xAxisIndex: 1,
		            itemStyle:{
		            	normal:{
		            		color:'#FCFF00'
		            	}
		            }
		        }
		    ]
	};

    </script>
    <script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js "></script>
<script type="text/javascript">

	$(document).on("pagecreate",function(){
		$("body").on("swipeleft",function(){
			window.location.href="${ctx}/weixin/dataCenter/organizationCount?orgId=${orgId}";
        });
		$("body").on("swiperight",function(){
			window.location.href="${ctx}/weixin/dataCenter/industryCount?orgId=${orgId}";
        });
    });
	
</script>
</body>

</html>
