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
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxwHomePage.css"/>
<title>江西省工业大数据各地市（园区）经济指标</title>
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
					<font>全省各地市（园区）经济指标</font>
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
								<li>一季度累计</li>
								<li>二季度累计</li>
								<li>三季度累计</li>
								<li>四季度累计</li>
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
		    <%-- <div class="return" onclick="location.href='${ctx}/front/cityDataCenter/gxwIndex/1?orgId=3609009'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div> --%>
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
var bartype ='';
	$(function(){
		$("#orgId").val('360000')
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
		/* 江西省地图 */
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
		
		loadbar(econData,bartype);
	}
	var econData = "";
	function loadData(type) {
		bartype=type;
		var orgId = $("#orgId").val();
		var parkId = $("#parkId").val();
		if($("#parkId").val()!=''){
			orgId=parkId
		}
		var year = $("#year").val();
		var month = $("#month").val();
		var param = {
				"orgId" : orgId,
				"year" : year,
				"month" : month,
				"type" : 0
		}
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/ycNew/fourthPageData",
			type : "post",
			data : param,
			success : function(result) {
				// console.log(result)
				if (result.success) {
					
					if(type == 1) { totalm = result.month;}
					$('#year').val(result.year);
					$('#font1').text(result.year);
					$('#month').val(result.month);
					var num=""
					num=result.month<=3?'一':result.month<=6?'二':result.month<=9?'三':'四'
					$('#font2').text(num+ '季度累计');
					// $('#font2').text(result.month+ '月');
					econData = result.value;
					// console.log(econData)
					loadbar(econData,type);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}

		})
	}

	function loadbar(econData,type){
		var parkIndex = new Array();
		var parkIndexName = new Array();
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				parkIndex.push($(this).val());
				parkIndexName.push($(this).attr("data"));
			}
		});
		var bar1 = echarts.init(document.getElementById('bar1'));
		if(type==2){
			var xAxis=['一季度累计','二季度累计','三季度累计','四季度累计']
			option.xAxis[0].data = xAxis;
		}else{
			option.xAxis[0].data = econData.xAxis;
		}
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
			var data1=[];
			var nodata=true;
			// for(var i=10;)
			if(type==2){
				var b1=1,b2=4,b3=7,b4=10;
				var l1=1,l2=4,l3=7,l4=10;
				var nonum1=econData[parkIndex[0]].bar.indexOf(null);
				var nonum2=econData[parkIndex[0]].line.indexOf(null);
				
				if(nonum1<=10 && nonum1>7){
					b4=nonum1-1;
				}else if(nonum1<=7 && nonum1>4){
					b3=nonum1-1;
				}else if(nonum1<=4 && nonum1>1){
					b2=nonum1-1;
				}else if(nonum1<=1 && nonum1>0){
					b1=nonum1-1;
				}
				if(nonum2<=10 && nonum2>7){
					l4=nonum2-1;
				}else if(nonum2<=7 && nonum2>4){
					l3=nonum2-1;
				}else if(nonum2<=4 && nonum2>1){
					l2=nonum2-1;
				}else if(nonum2<=1 && nonum2>0){
					l1=nonum2-1;
				}
				option.series[0].data = [econData[parkIndex[0]].bar[b1],econData[parkIndex[0]].bar[b2],econData[parkIndex[0]].bar[b3],econData[parkIndex[0]].bar[b4]];
				option.series[1].data = [econData[parkIndex[0]].line[l1],econData[parkIndex[0]].line[l2],econData[parkIndex[0]].line[l3],econData[parkIndex[0]].line[l4]];
			}else{
				option.series[0].data =econData[parkIndex[0]].bar;
				option.series[1].data =econData[parkIndex[0]].line;
			}
			for(var i=0;i<option.series[0].data.length;i++){
				if(option.series[0].data[i]!=null || option.series[1].data[i]!=null){
					nodata=false;
				}
			}
			if(nodata){
				bar1.setOption(noDataOption)
			}else{
				bar1.setOption(option);
			}
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
			var nodata=true;
			if(type==2){
				var b1=1,b2=4,b3=7,b4=10;
				var l1=1,l2=4,l3=7,l4=10;
				var nonum1=econData[parkIndex[1]].bar.indexOf(null);
				var nonum2=econData[parkIndex[1]].line.indexOf(null);
				
				if(nonum1<=10 && nonum1>7){
					b4=nonum1-1;
				}else if(nonum1<=7 && nonum1>4){
					b3=nonum1-1;
				}else if(nonum1<=4 && nonum1>1){
					b2=nonum1-1;
				}else if(nonum1<=1 && nonum1>0){
					b1=nonum1-1;
				}
				if(nonum2<=10 && nonum2>7){
					l4=nonum2-1;
				}else if(nonum2<=7 && nonum2>4){
					l3=nonum2-1;
				}else if(nonum2<=4 && nonum2>1){
					l2=nonum2-1;
				}else if(nonum2<=1 && nonum2>0){
					l1=nonum2-1;
				}
				option.series[0].data = [econData[parkIndex[1]].bar[b1],econData[parkIndex[1]].bar[b2],econData[parkIndex[1]].bar[b3],econData[parkIndex[1]].bar[b4]];
				option.series[1].data = [econData[parkIndex[1]].line[l1],econData[parkIndex[1]].line[l2],econData[parkIndex[1]].line[l3],econData[parkIndex[1]].line[l4]];
			}else{
				option.series[0].data =econData[parkIndex[1]].bar;
				option.series[1].data =econData[parkIndex[1]].line;
			}
			// console.log(option.series[0].data)
			// console.log(option.series[1].data)
			for(var i=0;i<option.series[0].data.length;i++){
				if(option.series[0].data[i]!=null|| option.series[1].data[i]!=null){
					nodata=false;
				}
			}
			if(nodata){
				bar2.setOption(noDataOption)
			}else{
				bar2.setOption(option);
			}
		}else{
			bar2.setOption(noDataOption);
		}
	}

	function loadMap() {
		var mapType = [];
		var cityMap = {
			"南昌市" : "360100",
			"景德镇市" : "360200",
			"萍乡市" : "360300",
			"九江市" : "360400",
			"新余市" : "360500",
			"鹰潭市" : "360600",
			"赣州市" : "360700",
			"吉安市" : "360800",
			"抚州市" : "361000",
			"上饶市" : "361100",
			"宜春市" : "360900"
		};

		for ( var city in cityMap) {
			mapType.push(city);
		}
		var geoCoordMap = {
			'南昌市': [115.854754,28.707192],
			'景德镇市': [117.17936,29.28948],
			'萍乡市': [113.826452,27.696667],
			'九江市': [116.068359,29.614163],
			'新余市': [114.893496,27.893005],
			'鹰潭市': [117.027582,28.317168],
			'赣州市': [114.93029,25.863818],
			'吉安市': [114.967085,27.154901],
			'抚州市': [116.537102,27.634297],
			'上饶市': [117.910652,28.528612],
			'宜春市': [114.819434,28.413542]
		}
		var data = [ 
			{
		      name: "南昌市",
		      value: "360100",
		    },
		    {
		      name: "景德镇市",
		      value: "360200",
		    },
		    {
		      name: "萍乡市",
		      value: "360300",
		    },
		    {
		      name: "九江市",
		      value: "360400",
		    },
		    {
		      name: "新余市",
		      value: "360500",
		    },
		    {
		      name: "鹰潭市",
		      value: "360600",
		    },
		    {
		      name: "赣州市",
		      value: "360700",
		    },
		    {
		      name: "吉安市",
		      value: "360800",
		    },
		    {
		      name: "宜春市",
		      value: "360900"
		    },
		    {
		      name: "抚州市",
		      value: "361000"
		    },
		    {
		      name: "上饶市",
		      value: "361100"
		    }
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

		$.get('${ctx}/static/map/360000.json', function(chinaJson) {
			echarts.registerMap('360000', chinaJson);
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
			        	loadData(2);
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
			map : '360000',
			zoom : 1.1,
			aspectScale : 1,
			selectedMode:'single',
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
			geoIndex : 0,
		},
		{
			type : 'effectScatter',
			coordinateSystem : 'geo',
			symbolSize : function(val) {
				return 14;
			},
			
			// silent: true,
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
	    for(var i=y; i>y-4;i--){
	    	$('#ul1').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='ul1'){
 				$('#year').val($(this).text());
 				$('#font1').text($(this).text());
			}else if($(this).parent().attr('id')=='ul2'){
				var month = $(this).text();
				$('#font2').text(month);
				// month = month.substring(0,month.lastIndexOf('月'));
				month=(month=='一季度累计'?3:month=='二季度累计'?6:month=='三季度累计'?9:12);
				if(totalm<month && totalm>month-3){
					month=totalm;
				}
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
