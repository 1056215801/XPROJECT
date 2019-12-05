<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/plugins/iCheck/custom.css" />
<title>宜春工业大数据各园区经济指标</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
    <div class="nav-title">
		<form action="" method="post" id="form">
			<input type="hidden" id="orgId" name="orgId" value="${orgId}">
			<input type="hidden" id="parkId" name="parkId" value="${parkId}">
			<input type="hidden" id="parkName" name="parkName" value="${parkName}">
			<input type="hidden" id="year" name="year" value="">
			<input type="hidden" id="month" name="month" value="">
		</form>
    	<div class="nav">	
			<div class="nav-text">
				<div class="eightIndustry dib" style="padding-right: 30px;">
					<img src="${ctx}/static/image/cityDataCenter/ycNew/barIcon.png">
					<font>全市各园区经济指标</font>
				</div>
			   <div class="selects dib" id="forthTab00">
					<div class="select select1">
						<p><font id="font1"></font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="ul1"></ul>
						</div>
					</div>
					<div class="select select2">
						<p><font id="font2"></font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="ul2">
								<li>1月</li>
								<li>2月</li>
								<li>3月</li>
								<li>4月</li>
								<li>5月</li>
								<li>6月</li>
								<li>7月</li>
								<li>8月</li>
								<li>9月</li>
								<li>10月</li>
								<li>11月</li>
								<li>12月</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="checks dib">
					<span id="parkIndex">
						<input type="checkbox" class="i-checks" id="gyzjz" value="gyzjz" data="工业增加值（亿元）"><font>工业增加值</font>
						<input type="checkbox" class="i-checks" value="zyywsr" data="主营业务收入（亿元）" checked><font>主营业务收入</font>
						<input type="checkbox" class="i-checks" value="lr" data="利润总额（亿元）" checked><font>利润总额</font>
						<input type="checkbox" class="i-checks" id="csgyschd_cyry" value="csgyschd_cyry" data="平均从业人数（人）"><font>平均从业人数</font>
					</span>
				</div>
				<div class="dib map-tip">温馨提示：只能同时选两个</div>
			</div>
		    <%-- <div class="return" onclick="location.href='${ctx}/front/cityDataCenter/ycIndex/1?orgId=3609009'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div> --%>
		</div> 
    </div>
	<div class="container-fluid eight-content">
		<div class="map-floor">
			<div class="map-room">
				<div class="chart3" id="map"></div>
			</div>
			<div class="map-room">
				<div class="map-top">
					<div class="chart3" id="bar1"></div>
				</div>
				<div class="map-top">
					<div class="chart3" id="bar2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/noData.js"></script>
<script type="text/javascript">
var totalm = '';
	$(function(){
		$(".head>a:eq(1)").addClass("on");
		
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		});
        if($("#parkId").val() != ''){
			$("#month").val(12);
			$(".select2").hide();
        };
		
		$(".i-checks").iCheck({
			checkboxClass : "icheckbox_square-green",
			radioClass : "iradio_square-green"
		});
		getselectYear();
		/*经济运行数据*/
		loadData(1);
		/* 宜春市地图 */
		loadMap();

		$(".i-checks").on('ifChecked', function(event){
			var count = 0;
			$(".i-checks").each(function(){
				if($(this).is(':checked')){
					count ++;
				}
			})
			if(count==2){
				selectByIndIndex();
			}
			
		});
		
		$(".i-checks").on('ifUnchecked', function(event){
			var count = 0;
			$(".i-checks").each(function(){
				if($(this).is(':checked')){
					count ++;
				}
			})
			if(count==2){
				selectByIndIndex();
			}
		});
	});
	//按选项搜索
	function selectByIndIndex(){
		var count = 0;
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				count += 1;
			}
		});
		
		if(count!=2){
			layer.msg("请选择两项进行展示！");
			return;
		}
		
		loadbar(econData);
	}
	var econData = "";
	function loadData(type) {
		var orgId = $("#orgId").val();
		var parkId = $("#parkId").val();
		var year = $("#year").val();
		var month = $("#month").val();
		var param = {
				"orgId" : orgId,
				"parkId" : parkId,
				"year" : year,
				"month" : month,
				"type" : 2
		}
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/ycNew/fourthPageData",
			type : "post",
			data : param,
			success : function(result) {
				if (result.success) {
					if(type == 1) { totalm = result.month;}
					$('#year').val(result.year);
					$('#font1').text(result.year);
					$('#month').val(result.month);
					$('#font2').text(result.month + '月');
					econData = result.value;
					loadbar(econData);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}

		})
	}

	function loadbar(econData){
		var parkIndex = new Array();
		var parkIndexName = new Array();
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				parkIndex.push($(this).val());
				parkIndexName.push($(this).attr("data"));
			}
		});
		var bar1 = echarts.init(document.getElementById('bar1'));
		option.xAxis[0].data = econData.xAxis;
		var parkId = $("#parkId").val();
		var parkName = $("#parkName").val();
		if(parkId!=null&&parkId!=""){
			option.title.text=parkName+parkIndexName[0];
			option.xAxis[0].axisLabel.rotate=0;
		}else{
			option.xAxis[0].axisLabel.rotate=20;
			option.title.text = parkIndexName[0];
		}
		
		if(econData!='undefined'&&!$.isEmptyObject(econData[parkIndex[0]])){
			option.series[0].data = econData[parkIndex[0]].bar;
			option.series[1].data = econData[parkIndex[0]].line;
			bar1.setOption(option);
		}else{
			bar1.setOption(noDataOption);
		}
		
		if(parkId!=null&&parkId!=""){
			option.title.text=parkName+parkIndexName[1];
		}else{
			option.title.text = parkIndexName[1];
		}
		
		var bar2 = echarts.init(document.getElementById('bar2'));
		if(econData!='undefined'&&!$.isEmptyObject(econData[parkIndex[0]])){
			option.series[0].data = econData[parkIndex[1]].bar;
			option.series[1].data = econData[parkIndex[1]].line;
			bar2.setOption(option);
		}else{
			bar2.setOption(noDataOption);
		}
	}

	function loadMap() {
		var mapType = [];
		var cityMap = {
			"丰城高新技术产业园区" : "1226",
			"宜丰工业园区" : "1229",
			"铜鼓工业园区" : "1285",
			"宜春经济技术开发区" : "1224",
			"樟树工业园区" : "1225",
			"靖安工业园区" : "1227",
			"万载工业园" : "1230",
			"宜春袁州工业园区" : "1284",
			"奉新工业园区" : "1047",
			"上高工业园区" : "1113",
			"高安高新技术产业园区" : "1228"
		};

		for ( var city in cityMap) {
			mapType.push(city);
		}
		var geoCoordMap = {
			"丰城高新技术产业园区" : [115.74159,28.217616],
			"宜丰工业园区" : [114.854201,28.359521],
			"铜鼓工业园区" : [114.483175,28.623062],
			"宜春经济技术开发区" : [114.41185,27.873058],
			"樟树工业园区" : [115.489769,28.070988],
			"靖安工业园区" : [115.388088,28.880529],
			"万载工业园" : [114.50881,28.129731],
			"宜春袁州工业园区" : [114.328447,27.932489],
			"奉新工业园区" : [115.419849,28.680469],
			"上高工业园区" : [114.962862,28.258878],
			"高安高新技术产业园区" : [115.443779,28.470796]
		}
		var data = [ 
			{name : '丰城高新技术产业园区', value : 1226}, 
			{name : '宜丰工业园区', value : 1229}, 
			{name : '铜鼓工业园区', value : 1285}, 
			{name : '宜春经济技术开发区', value : 1224}, 
			{name : '樟树工业园区', value : 1225}, 
			{name : '靖安工业园区', value : 1227}, 
			{name : '万载工业园', value : 1230}, 
			{name : '宜春袁州工业园区', value : 1284}, 
			{name : '奉新工业园区', value : 1047}, 
			{name : '上高工业园区', value : 1113},
			{name : '高安高新技术产业园区', value : 1228}
		]
		//这里是生成series的数据，将经纬度和value值映射起来
		var convertData = function(data) {
			var res = [];
			if (data != null && data != "") {
				for (var i = 0; i < data.length; i++) {
					var geoCoord = geoCoordMap[data[i].name];
					if (geoCoord) {
						if(data[i].value==$("#parkId").val()){
							res.push({
								name : data[i].name,
								value : geoCoord.concat(data[i].value),
								itemStyle: {
					                normal: {
					                 	color: '#FCFF00',
					                    label:{
					                    	show:true,
					                    	textStyle:{
					                    		color:'#FCFF00',
					                    		fontSize:14,
					                    		fontWeight:'bold'
					                    	}
					                    }
					                }
					            }
							});
						}else{
							res.push({
								name : data[i].name,
								value : geoCoord.concat(data[i].value)
							});
						}
						
					}
				}
			}
			return res;
		};

		$.get('${ctx}/static/map/360900.json', function(chinaJson) {
			echarts.registerMap('360900', chinaJson);
			var mapChart = echarts.init(document.getElementById('map'));
			mapOption.series[1].data=convertData(data);
			mapChart.setOption(mapOption);
			
			mapChart.on('click', function (params) {
				var parkName = params.data.name;
				var m = '${searchInfo.month}';
				var flag=false;
		        for(var i= 0;i<mapType.length;i++){
		        	if(parkName==mapType[i]){
		        		flag=true;
		        		break;
		        	}
		        }
		        if(cityMap[parkName]==null||cityMap[parkName]==""){
		        	return;
		        }
		        if(cityMap[parkName]==$("#parkId").val()){
		        	$("#parkId").val('');
			        $("#parkName").val('');
					$("#month").val(totalm);
					$(".select2").show();
		        	loadData();
		        	loadMap();
		        }else{
		        	$("#parkId").val(cityMap[parkName]);
			        $("#parkName").val(parkName);
			        if(flag){
						$("#month").val(12);
						$(".select2").hide();
			        	loadData(cityMap[parkName]);
			        	loadMap();
				    } 
		        }
		    });
		});
	}

	/*折线图配置*/
	var option = {
		backgroundColor: 'rgba(0,0,0,0.1)',
		title : {
			text : '',
			textStyle : {
				color : "#fff",
				fontSize : 12,
			},
			left : '2%',
			top : '5%'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			top: '7%',
			right:'45%',
			inactiveColor:'#FFF',
	        data:[
				{name:'总量',textStyle:{color:"#FCFF00"}},
				{name:'同比',textStyle:{color:"#FCFF00"}}
			]
		},
		grid : {
			bottom : '15%',
			top : '35%',
			left: '5%',
			right: '5%',
			containLabel : true,
		},
		xAxis : [ {
			type : 'category',
			boundaryGap : true,
			axisLine : {
				lineStyle : {
					color : "#5EC9F4"
				}
			},
			axisLabel :{  
        	    interval:0,
        	    rotate:20
        	} 
		} ],
		yAxis : [ {
	        type: 'value',
	        name: '总量',
	        scale: true,
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
	        name: '同比',
	        scale: true,
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
	    }],
		series : [
			{
				name : '总量',
				type : 'bar',
				barWidth : '35%',
				yAxisIndex: 0,
				markPoint : {
	            	symbolSize:40,
	            	itemStyle:{
	            		normal:{
	            			color:"#CD0567"
	            		}
	            	},
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'} 
	                ]
	            }
			},
			{
				name : '同比',
				type : 'line',
				yAxisIndex: 1,
				lineStyle:{
	            	normal:{
	            		color:"#CD0567"
	            	}
	            },
				markPoint : {
					symbolSize:40,
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ],
	                label:{
	                	normal:{
	        	            formatter: function(params){
	        	            	var p = params.value;
	        	        		return (p == '999999')?'增亏':(p == '-999999')?'亏损':(p == '-999998')?'扭亏':(p == '-999997')?'减亏':p;
	        	            },
	                		textStyle:{
		            			color:"#FCFF00"
	            			}
	                	}
	                },
	                itemStyle:{
	                	normal:{
		            		color:'#799c0c'
		            	}
	                }
	            }
			}
		]
	};
	
	/*地图配置*/
	var mapOption = {
		backgroundColor: 'rgba(0,0,0,0.1)',
		tooltip : {
			trigger : 'item',
			formatter : '{b}'
		},
		geo : {
			show : true,
			map : '360900',
			zoom : 1.1,
			label : {
				normal : {
					show : false,
				},
				emphasis : {
					show : false,
				}
			},
			roam : false,
			itemStyle : {
				hoverAnimation : false,
				normal : {
                    borderColor: 'rgba(147, 235, 248, 1)',
                    borderWidth: 1,
                    areaColor: {
                        type: 'radial',
                        x: 0.5,
                        y: 0.5,
                        r: 0.8,
                        colorStops: [{
                            offset: 0, 
                            color: 'rgba(147, 235, 248, 0)' // 0% 处的颜色
                        }, {
                            offset: 1, 
                            color: 'rgba(147, 235, 248, .2)' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    },
                    shadowColor: 'rgba(128, 217, 248, 1)',
                    shadowOffsetX: -2,
                    shadowOffsetY: 2,
                    shadowBlur: 10
				},
				emphasis : {
					areaColor : '#A6C5BD',
					borderColor : '#FFF',
					opacity : 1
				}
			}
		},
		series : [ {
			type : 'map',
			geoIndex : 0
		},
		{
			type : 'effectScatter',
			coordinateSystem : 'geo',
			symbolSize : function(val) {
				return 14;
			},
			showEffectOn : 'render',
            rippleEffect: {
                period: 4,
                scale: 4,
                brushType: 'fill'
            },
			label : {
				normal : {
					formatter : '{b}',
					position : 'right',
					show : true,
					color : '#fff'
				}
			},
			itemStyle: {
                normal: {
                 	color: '#05C3F9',
                    borderColor: 'rgba(100,149,237,1)',
                    label:{
                    	show:true,
                    	textStyle:{
                    		color:'#fff',
                    		fontSize:12
                    	}
                    }
                },
                emphasis: {
                	areaColor: '#A6C5BD',
                	borderColor: '#fff',
                    opacity:1,
                    label:{
                    	show:true,
                    	textStyle:{
                    		color:'#fff'
                    	}
                    }
                }
            },
			zlevel : 1
		}]
	};
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>2014;i--){
	    	$('#ul1').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='ul1'){
 				$('#year').val($(this).text());
 				$('#font1').text($(this).text() + '年');
			}else if($(this).parent().attr('id')=='ul2'){
				var month = $(this).text();
				$('#font2').text(month);
				month = month.substring(0,month.lastIndexOf('月'));
				$('#month').val(month);
			}
			loadData();
		})
	}
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format) {
		return formatDate(new Date(strDate), format);
	}
	// 格式化日期,
	function formatDate(date, format) {
		var paddNum = function(num) {
			num += "";
			return num.replace(/^(\d)$/, "0$1");
		}
		// 指定格式字符
		var cfg = {
			yyyy : date.getFullYear(), // 年 : 4位
			yy : date.getFullYear().toString().substring(2),// 年 : 2位
			M : date.getMonth() + 1, // 月 : 如果1位的时候不补0
			MM : paddNum(date.getMonth() + 1), // 月 : 如果1位的时候补0
			d : date.getDate(), // 日 : 如果1位的时候不补0
			dd : paddNum(date.getDate()),// 日 : 如果1位的时候补0
			hh : paddNum(date.getHours()), // 时
			mm : paddNum(date.getMinutes()), // 分
			ss : paddNum(date.getSeconds())
		// 秒
		}
		format || (format = "yyyy-MM-dd hh:mm:ss");
		return format.replace(/([a-z])(\1)*/ig, function(m) {
			return cfg[m];
		});
	}
</script>
</html>
