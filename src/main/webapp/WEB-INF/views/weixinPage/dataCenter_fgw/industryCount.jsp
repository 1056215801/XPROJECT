<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>江西省开发区大数据中心</title>
<link href="${ctx}/static/weixin/css/dataCenter/industryMap.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/industry.js"></script>

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
		<input type="hidden" id="industryType" name="industryType" value="2">
	</form>
	<c:choose>
		<c:when test="${areaInfo.isProvince}">
			<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/weixin/dataCenter/energyCount?orgId=${orgId}">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/weixin/dataCenter/organizationCount?orgId=${orgId}">
		</c:otherwise>
	</c:choose>
	<div class="industry_main">
		<div class="industry_searchBar clearfix">
			<div class="industry_search_region" style="">
				<img src="${ctx}/static/weixin/images/dataCenter/region.png"
					width="15"> <span id="region">${areaInfo.areaName}</span> <span class="caret"></span>
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
			<div id="industry_down" style="left: 25%;">
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
			<div id="scale_down" style="left: 50%;">
				<ul>
					<c:if test="${! empty searchList.quarterList}">
						<c:forEach items="${searchList.quarterList}" var="info">
							<li><a href="javascript:;" onclick="selectByQuarter('${info.quarter}')">第${info.quarter==4?'四':info.quarter==3?'三':info.quarter==2?'二':'一'}季度</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			
			<div class="industry_search_industryKind">
				<span id="industryKind">主营业务收入</span> <span class="caret"></span>
			</div>
			<div id="industryKind_down" style="left: 75%;">
				<ul>
					<li><a href="javascript:;" onclick="selectByIndustryType('2')">主营业务收入</a></li>
					<li><a href="javascript:;" onclick="selectByIndustryType('3')">利润总额</a></li>
					<li><a href="javascript:;" onclick="selectByIndustryType('4')">出口交货值</a></li>
				</ul>
			</div>
			
		</div>
		<div class="industry_content">
			<div id="mapPage" class="industry_dataCenter">
				<div class="industry_demoText industry_countText">
					<div class="titleBar">
						按开发区排名 <span id="title1">工业增加值（亿元）</span>
					</div>
					<ul id="parkList"></ul>
				</div>
				<div class="industry_demoText industry_countText">
					<div class="titleBar" style="margin-bottom: -10px; margin-top: 10px;">
						按产业排名 <span id="title2" style="color: #fffc06;">主营业务收入（亿元）</span>
					</div>
					<div class="industry_demoImg" id="part1" ></div>
				</div>
				<div class="industry_demoText industry_countText">
					<div class="industry_demoImg" id="part2" style="height: 800px;"></div>
				</div>
				<div class="returnBtn" onclick="window.location.href='${ctx}/weixin/dataCenter/economicCount?orgId=${orgId}'"></div>
				<c:choose>
					<c:when test="${areaInfo.isProvince}">
						<div class="returnBtn switchBtn_next" onclick="window.location.href='${ctx}/weixin/dataCenter/energyCount?orgId=${orgId}'"></div>					
					</c:when>
					<c:otherwise>					
						<div class="returnBtn switchBtn_next" onclick="window.location.href='${ctx}/weixin/dataCenter/organizationCount?orgId=${orgId}'"></div>
					</c:otherwise>
				</c:choose>
				<div class="industry_more">+ 下拉显示更多</div>
			</div>
		</div>
	</div>
<script>
		$(function() {
			var downHeight = $(".industry_content").height();
			$("#region_down ul").css("max-height", downHeight);
			$("#industry_down ul").css("max-height", downHeight);
			$("#scale_down ul").css("max-height", downHeight);

			//点击空白关闭下拉框
			$(document).on("click", function() {
				$(".industry_searchBar ul").slideUp();
				$(".industry_searchBar").click(function(e) {
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
			
			//时间下拉框
			$(".industry_search_industry").click(function(e) {
				var ul = $("#industry_down ul");
				e.stopPropagation();
				$("#region_down ul").slideUp();
				$("#scale_down ul").slideUp();
				$("#industryKind_down ul").slideUp();
				ul.slideToggle();
			});
			$("#industry_down ul li a").click(function() {
				$("#industry").text($(this).text());
				$("#industry_down ul").hide();
			});
			//季度下拉框
			$(".industry_search_scale").click(function(e) {
				var ul = $("#scale_down ul");
				e.stopPropagation();
				$("#region_down ul").slideUp();
				$("#industry_down ul").slideUp();
				$("#industryKind_down ul").slideUp();
				ul.slideToggle();
			});
			$("#scale_down ul li a").click(function() {
				$("#scale").text($(this).text());
				$("#scale_down ul").hide();
			});
			//种类下拉框
			$(".industry_search_industryKind").click(function(e) {
				var ul = $("#industryKind_down ul");
				e.stopPropagation();
				$("#region_down ul").slideUp();
				$("#industry_down ul").slideUp();
				$("#scale_down ul").slideUp();
				ul.slideToggle();
			});
			$("#industryKind_down ul li a").click(function() {
				$("#industryKind").text($(this).text());
				$("#industryKind_down ul").hide();
			});

		    $(document).scroll(function(){
		        if($(document).scrollTop() >= $(document).height() - $(window).height() - 2){
		           $(".industry_more").fadeOut();
		           }
		        else {$(".industry_more").fadeIn();}
		    })
		});
</script>
<script type="text/javascript">
	
	//part1
	var optionPart1 = {
			backgroundColor: 'transparent', 
		    grid: {
		    	top:'7%',
				bottom:'7%',
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
		        axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	}
		    },
		    series: [
		        {
		            type: 'bar',
		            barWidth:'50%',
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
		            		color:function(params){
		            			var index = params.dataIndex;//表示当前的数据条的索引
		            		    var alternateNumber = 2;//表示按几种颜色交替出现

		            		    var newColor="";//表示最终显示的颜色
		            		    /**
		            		    自定义的颜色池
		            		    如果颜色池长度不够，将无法取得正确的颜色，所以有必要使
		            		    index的最大值小于colorList.length
		            		    */
		            		    var colorList = ['#5EC9F4','#CD0567','#FCCE10','#E87C25','#27727B',
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

		            		    return newColor;
		            		}
		            	}
		            }
		        }
		    ]
		};
		
		//part2
		var optionPart2 = {
				title : {
			        text: '| 工业总产值（单位：亿元）',
			        textStyle:{
			        	color:"#b0e7ff",
			        	fontSize:16
			        },
			        left:5,
			        top:5
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			    	top:30,
					itemWidth:20,
					itemHeight:10,
				//	selected:{'国家级':true,'省重点级':false,'一般省级':false},
			        data:[
						{name:'国家级',textStyle:{color:"#FCFF00"}},
						{name:'省重点级',textStyle:{color:"#FCFF00"}},
						{name:'一般省级',textStyle:{color:"#FCFF00"}}
					]
			    },
			    grid: {
			    	bottom:'3%',
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
			            name:'国家级',
			            type:'bar',
			            barWidth:'20%',
			            label:{
			            	normal:{
			            		show:true,
			            		position:'right',
			            		textStyle:{
			            			color:'#fffc06'
			            		}
			            	},
			            	emphasis:{
			            		show:true,
			            		position:'insideRight',
			            		textStyle:{
			            			color:'#7DFC00'
			            		}
			            	}
			            },
			            itemStyle:{
			            	normal:{
			            		color:'#7DFC00'
			            	}
			            }
			        },
			        {
			            name:'省重点级',
			            type:'bar',
			            barWidth:'20%',
			            label:{
			            	normal:{
			            		show:true,
			            		position:'right',
			            		textStyle:{
			            			color:'#red',
			            		}
			            	}
			            },
			            itemStyle:{
			            	normal:{
			            		color:'red'
			            	}
			            }
			        },
			        {
			            name:'一般省级',
			        	barWidth:'20%',
			            type:'bar',
			            label:{
			            	normal:{
			            		show:true,
			            		position:'right',
			            		textStyle:{
			            			color:'#5EC9F4'
			            		}
			            	}
			            },
			            itemStyle:{
			            	normal:{
			            		color:'#5EC9F4'
			            	}
			            }
			        }
			    ]
			};

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
		
		/*按种类搜索*/
		function selectByIndustryType(industryType){
			$("#industryType").val(industryType);
			loadEchart();
		}
		
		function loadEchart(){
			$.ajax({
				url:"${ctx}/interface/json/dataCenter/industryCount",
				type:"post",
				data:$("#form").serialize(),
				dataType:"json",
				success:function(result){
					var parkSort = result.industryData.parkSort;
					var ecData = result.industryData.ecData;
					
					var industryType = $("#industryType").val();
					var areaId = $("#areaId").val();
					
					initParkSortData(parkSort);	
					
					if(industryType==2){
						$("#title1").text("主营业务收入(亿元)");
						$("#title2").text("主营业务收入(亿元)");
						optionPart2.title.text="| 主营业务收入(亿元)";
						
						optionPart2.series[0].data = arrData2(ecData.series.zyywsr.zyywsrValue1);
						optionPart2.series[1].data = arrData2(ecData.series.zyywsr.zyywsrValue2);
						optionPart2.series[2].data = arrData2(ecData.series.zyywsr.zyywsrValue0);
					}else if(industryType==3){
						$("#title1").text("利润总额(亿元)");
						$("#title2").text("利润总额(亿元)");
						optionPart2.title.text="| 利润总额(亿元)";
						
						optionPart2.series[0].data = arrData2(ecData.series.lr.lrValue1);
						optionPart2.series[1].data = arrData2(ecData.series.lr.lrValue2);
						optionPart2.series[2].data = arrData2(ecData.series.lr.lrValue0);
					}else{	
						$("#title1").text("出口交货值(亿元)");
						$("#title2").text("主营业务收入(亿元)");
						optionPart2.title.text="| 出口交货值(亿元)";
						
						optionPart2.series[0].data = arrData2(ecData.series.ckjhz.ckjhzValue1);
						optionPart2.series[1].data = arrData2(ecData.series.ckjhz.ckjhzValue2);
						optionPart2.series[2].data = arrData2(ecData.series.ckjhz.ckjhzValue0);
					}
					
					var myChart1 = echarts.init(document.getElementById('part1'));
					var myChart2 = echarts.init(document.getElementById('part2'));
					
					optionPart1.yAxis.data = arrData(getData(areaId, industryType, 1));
					optionPart1.series[0].data = arrData(getData(areaId, industryType, 2));
					myChart1.setOption(optionPart1);
					
					optionPart2.yAxis[0].data = arrData2(ecData.xAxis);
					
					myChart2.setOption(optionPart2);
				},
				error:function(){
					layer.msg("加载超时，请刷新重试！");
				}
			
			});
		}
		
		var arrData = function (data) {
			var str = data.split(",");
			var arr = new Array();
			for(var i=0;i<str.length;i++){
				arr.push(str[i]);;
			}
			return arr;
		};
		
		var arrData2 = function (data) {
			var arr = new Array();
			for(var i=0;i<data.length;i++){
				arr.push(data[data.length-i-1]);;
			}
			return arr;
		};
		
		function initParkSortData(data){
			$("#parkList").empty();
			for(var i=0;i<data.length;i++){
				var _div = '<li>'+(i+1);
				if(i==0){				
					_div += ' <img src="${ctx}/static/weixin/images/dataCenter/one.png">';
				}else if(i==1){
					_div += ' <img src="${ctx}/static/weixin/images/dataCenter/two.png">';
				}else if(i==2){
					_div += ' <img src="${ctx}/static/weixin/images/dataCenter/three.png">';
				}else{
					_div += ' <img src="${ctx}/static/weixin/images/dataCenter/other.png">';
				}
				_div += data[i].parkName+' <font>'+data[i].value+'</font></td></li>';
				$("#parkList").append(_div);
			} 
			
		}
	
</script>
<script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js "></script>
<script type="text/javascript">

	$(document).on("pagecreate",function(){
		var isProvince ='${areaInfo.isProvince}';
		$("body").on("swipeleft",function(){
			if(isProvince=='true'){				
				window.location.href="${ctx}/weixin/dataCenter/energyCount?orgId=${orgId}";
			}else{
				window.location.href="${ctx}/weixin/dataCenter/organizationCount?orgId=${orgId}";
			}
        });
		$("body").on("swiperight",function(){
			window.location.href="${ctx}/weixin/dataCenter/economicCount?orgId=${orgId}";
        });
    });
	
</script>

</body>

</html>
