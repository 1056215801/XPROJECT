var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
 
function economic(d1,d2,m){   //主要经济指标
	var chart = echarts.init(document.getElementById('chart0'));
	var dd = [m];
	var d1 = dd.concat(d1);
	var d2 = dd.concat(d2);
    var fz1 = 14;
    if(width <= 1366){
    	fz1 = 10;
    }
	var option = {
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            lineStyle: {
	                color: '#57617B'
	            }
	        }
	    },
	    legend: {
	        itemWidth: 20,
	        itemHeight: 15,
	        itemGap: 15,
	        borderRadius : 15,
	        data: ['江西', '宜春'],
	        textStyle: {
	            fontSize: fz1,
	            color: '#F1F1F3'
	        }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '0',
	        top: '30',
	        containLabel: true
	    },
	    xAxis: [{
	        type: 'category',
	        boundaryGap: false,
	        axisLabel: {
                fontSize: fz1
	        },
	        axisLine: {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        data: ['1月','1-3月', '1-6月', '1-9月', '1-12月']
	    }],
	    yAxis: [{
	        type: 'value',
	        min: m,
	        axisTick: {
	            show: false
	        },
	        axisLine: {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        axisLabel: {
	            margin: 10,
                fontSize: fz1
	        },
	        splitLine: {
	            lineStyle: {
	                color: '#57617B'
	            }
	        }
	    }],
	    series: [{
	        name: '江西',
	        type: 'line',
	        smooth: false,
	        symbol: 'circle',
	        symbolSize: 5,
	        showSymbol: false,
	        lineStyle: {
	            normal: {
	                width: 2
	            }
	        },
	        areaStyle: {
	            normal: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                    offset: 0,
	                    color: 'rgba(78, 214, 115, 0.8)'
	                }, {
	                    offset: 1,
	                    color: 'rgba(78, 214, 115, 0)'
	                }], false),
	                shadowColor: 'rgba(0, 0, 0, 0.1)',
	                shadowBlur: 10
	            }
	        },
	        itemStyle: {
	            normal: {
	                color: 'rgb(78, 214, 115)',
	                borderColor: 'rgba(78, 214, 115,0.27)',
	                borderWidth: 12

	            }
	        },
	        data: d1
	    }, {
	        name: '宜春',
	        type: 'line',
	        smooth: false,
	        symbol: 'circle',
	        symbolSize: 5,
	        showSymbol: false,
	        lineStyle: {
	            normal: {
	                width: 2
	            }
	        },
	        areaStyle: {
	            normal: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                    offset: 0,
	                    color: 'rgba(226, 193, 75, 0.8)'
	                }, {
	                    offset: 1,
	                    color: 'rgba(226, 193, 75, 0)'
	                }], false),
	                shadowColor: 'rgba(0, 0, 0, 0.1)',
	                shadowBlur: 10
	            }
	        },
	        itemStyle: {
	            normal: {
	                color: 'rgb(226, 193, 75)',
	                borderColor: 'rgba(226, 193, 75,0.2)',
	                borderWidth: 12

	            }
	        },
	        data: d2
	    }]
	};
	chart.setOption(option);
}
function project() {     //项目申报
	var data = [
		{ name: '省级', value: 33},
		{ name: '国家级', value: 67}
	]
    var chart = echarts.init(document.getElementById('chart1'));
	var yData = [];
	for(var i = 0; i < data.length; i++){
		yData.push(data[i].name);
	}
    var fz1 = 18;
    var fz2 = 16;
    var fz3 = 32;
    var ra = 32;
    if(width <= 1440){
    	fz1 = 14;
    	fz2 = 12;
    	fz3 = 24;
        ra = 28;
    }
    if(width <= 1366){
        ra = 24;
    }
    var option = {
    	    tooltip : {
    	        trigger: 'item',
    	        formatter: '{b}\n{c}%',
    	        textStyle: {
    	        	fontSize: fz1 ,
    	        }
    	    },
    	    legend: {
    	        right : 35,
    	        bottom : 10,
    	        orient : 'vertical',
    	        data: yData,
    	        textStyle: {
    	        	color : '#fff',
    	        	fontSize: fz2
    	        }
    	    },
    	    color : ['#EB8C28',
	        {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                    offset: 0, color: '#5ebaf1' // 0% 处的颜色
                }, {
                    offset: 1, color: '#085ad4' // 100% 处的颜色
                }],
                globalCoord: false // 缺省为 false
            },'#4687FF'],
    	    calculable : true,
    	    series : [
    	        {
    	            name:'面积模式',
    	            type:'pie',
    	            radius : [ra, '65%'],
    	            center : ['35%', '50%'],
    	            roseType : 'radius',
    	            data: data,
    	            itemStyle: {
    	            	normal: {
    	            		shadowColor: 'rgba(0, 0, 0, 0.5)',
    	            	    shadowBlur: 20,
    	            	    shadowOffsetY: 5
    	            	}
    	            },
	    	        label: {
    	            	normal: {
    		    	        textStyle: {
    		    	        	fontSize: fz1 
    		    	        },
    		    	        formatter: function(params){
    		    	            if(params.name == '省级'){
    		    	                return '{a|'+params.name+'}\n{b|'+params.value+'}{a|%}';
    		    	            } else {
    		    	                return '{a|'+params.name+'}\n{c|'+params.value+'}{a|%}';
    		    	            }
    		    	        },
    		    	        rich: {
                                a: {
                                    fontSize: fz2,
                                    color: '#fff',
                                    verticalAlign: 'bottom'
                                },
                                b: {
                                    padding: [0, 0, 10, 0],
                                    color: ['#EB8C28'],
                                    fontSize: fz3
                                },
                                c: {
                                    padding: [0, 0, 10, 0],
                                    color: ['#4687FF'],
                                    fontSize: fz3
                                }
    		    	        }
    	            	}
	    	        },
    	            labelLine : {
    	            	normal: {
    	            		lineStyle: {
    	            			width: 1
    	            		}
    	            	}
    	            }
    	        },
    	        {
    	            type:'pie',
    	            radius : [ra-7, ra-4],
    	            center : ['35%', '50%'],
    	            data: [{name: '',value: 1}],
    	            hoverAnimation : false,
    	            tooltip: {
    	            	show: false
    	            },
    	            labelLine : {
    	            	normal: { show: false}
    	            }
    	        },
    	        {
    	            type:'pie',
    	            radius : ['70%', '70.5%'],
    	            center : ['35%', '50%'],
    	    	    color : '#000',
    	            data: [{name: '',value: 1}],
    	            hoverAnimation : false,
    	            itemStyle: {
    	            	normal: {
    	            		color: '#4687FF'
    	            	}
    	            },
    	            tooltip: {
    	            	show: false
    	            },
    	            labelLine : {
    	            	normal: { show: false}
    	            }
    	        }
    	    ]
    	};
    chart.setOption(option);
    if(isHidden){
        $("#secondTab1").hide();
        setTimeout(function(){ isHidden = false;},500);
    }
}
function helping(x,d1,d2){
	var chart = echarts.init(document.getElementById('chart2'));
    var fz = 14;
    var t = 60;
    var t2 = 10;
    if(width <= 1600){
    	fz = 12;
    	t = 40;
    }
    if(width <= 1366){
    	fz = 10;
    	t = 30;
    	t2 = 0;
    }
	var option = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data:['累计问题', '已解决问题'],
		        top: t2,
		        textStyle: {
		            color: 'rgba(220,240,245,.5)',
		            fontSize: fz
		        }
		    },
		    grid: {
		        left:'4%',
		        right:'4%',
		        top: t,
		        bottom: 10,
		        containLabel:true
		    },
		    color: ['#dc1f54','#4ed673'],
		    xAxis : [
		        {
		            type: 'category',
		            axisLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            },
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz
		            },
		            axisTick: {show: false},
		            data: x
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisTick: {
		                show: false
		            },
		            splitNumber: 3,
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz
		            },
		            splitLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            }
		        }
		    ],
		    series : [
		         {
		            name: '累计问题',
		            type: 'bar',
		            barWidth: 15,
		            data: d1
		        },
		        {
		            name: '已解决问题',
		            type: 'bar',
		            barWidth: 15,
		            data: d2
		        }
		    ]
		};
    chart.setOption(option);
    if(isHidden){
        $("#forthTab1").hide();
    }
}
var mapData1 = {
	show: true,
	trigger : 'item',
	formatter : function(params){
		var d = params.data;
		return "工业增加值："+notEmpty(d.gyzjzPercent)+"%<br>主营业务收入："+notEmpty(Number(d.zyywsrValue))/10000+"亿元<br>利润总额："+notEmpty(Number(d.lrValue))/10000+"亿元";
	}
};
var mapData2 = {
		show: true,
		trigger : 'item',
		formatter : function(params){
			var d = params.data;
			return "工业增加值："+notEmpty(d.gyzjzPercent)+"%<br>主营业务收入："+Number(notEmpty(d.zyywsrValue))/10000+"亿元<br>利润总额："+Number(notEmpty(d.lrValue))/10000+"亿元<br>从业人员："+notEmpty(d.cyryValue)+"人";
			//return "主营业务收入："+Number(d.zyywsrValue)/10000+"亿元<br>利润总额："+Number(d.lrValue)/10000+"亿元<br>从业人员："+d.cyryValue+"人";
		}
	};
var mapData3 = {
		show: true,
		trigger : 'item',
		formatter : function(params){
			var d = params.data;
			return "企业总数："+d.TOTAL+"家<br>规上企业："+d.GSTOTAL+"家";
		}
	};
var notEmpty = function(val){
	if(!val || val == null){ return 0}
	return val;
}
var flag1 = true;
function ycMap(type,d1) {
    var myChart = echarts.init(document.getElementById('chart3'));
    var fz = 12;
    var sz = 10;
    var ss = 45;
    if(width <= 1440){
    	fz = 12;
    	sz = 6;
        ss = 40;
    }
    if(width <= 1366){
    	fz = 10;
        ss = 35;
    }
    var add = function(a,b){
    	var arr = a;
    	for(var i = 0; i < a.length; i++){
    		for(var j = 0; j < b.length; j++){
        		if(a[i].name == b[j].name){
        			arr[i].value = b[j].value;
        		}
        	}
    	}
    	return arr;
    };
    var option = {
    		tooltip : {
    			trigger : 'item',
    			formatter : '{b}'
    		},
            geo : {
                roam : true,
                map : 'yichun',
                zoom : 1.2,
                label : {
                    show : true,
                    textStyle : {
                        color : '#fff',
                        fontSize: fz
                    },
                },
                itemStyle: {
                    normal: {
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
                    emphasis: {
                        areaColor: '#389BB7',
                        borderWidth: 0
                    }
                },
            },
            series : [{
    			type : 'map',
    			geoIndex : 0,
    			data : d1,
        		tooltip : { show: false}
            },{
                type : 'effectScatter',
                coordinateSystem : 'geo',
                data : yc,
                symbolSize : sz,
                showEffectOn : 'render',
                rippleEffect: {
                    period: 4,
                    scale: 4,
                    brushType: 'fill'
                },
                hoverAnimation : true,
                label : {
                    normal : {
    					formatter : '{b}',
    					position : 'right',
    					show : false,
                        textStyle:{
                            color:'#fff'
                        }
                    }
                },
                itemStyle : {
                    normal : {
                        color : '#0de6e6',
                        shadowBlur : 10,
                        shadowColor : '#333'
                    }
                },
                zlevel : 1,
        		tooltip : { show: false}
            },{
                type : 'scatter',
                coordinateSystem : 'geo',
                data : yc3,
                symbol:'pin',
                symbolSize : function(a){
                    return a[2]==0?0:ss;
                },
                rippleEffect : {
                    scale : 10,
                    brushType : 'stroke'
                },
                hoverAnimation : true,
                label : {
                    normal : {
                        formatter : function(a){
                            return a.value[2];
                        },
                        show : true,
                        position: 'inside',
                        textStyle:{
                            color:'#000',
                            fontSize: fz
                        }
                    }
                },
                itemStyle : {
                    normal : {
                        color : '#03ddfe',
                        shadowBlur : 12,
                        shadowColor : '#333',
                    }
                },
                zlevel : 2,
        		tooltip : { show: false}
            }]
	    }
    if(type == 1){
    	option.series[0].tooltip = mapData1;
    	option.series[2].symbolSize = 0;
    }
    if(type == 2){
    	var obj3 = add(d1, geoCoordMap);
    	option.series[1].tooltip = mapData2;
    	option.series[1].data = obj3;
    	option.series[1].label.normal.show = true;
    	option.geo.label.show = false;
    	option.series[2].symbolSize = 0;
    }
    if(type == 3){
    	option.series[0].tooltip = mapData3;
    }
    myChart.setOption(option);
	myChart.on('click', function (param) {
		var ind = $(".map-box .on").index()+1;
		if(flag1){
			flag1 = false;
			if(ind == 1){
				goPage('4?orgId=3609009');
			} else if(ind == 2){
				if(param.seriesType == 'effectScatter'){
					goPage('5?orgId=3609009&parkId='+param.data.orgId+'&parkName='+param.data.name);
				} else { goPage('5?orgId=3609009');}
			} else {
				var id = param.data.SPACEID;
				window.open('http://www.jx968969.com/XWeixin/static/pcHtml/industryMap/enterpriseDistribution.html?areaId=360900&areaName=%E5%AE%9C%E6%98%A5%E5%B8%82&spaceId='+id)
			}
			setTimeout(function(){ flag1 = true;},1000);
		}
	});
};
function helping2(x,d1,d2,d3){
	var chart = echarts.init(document.getElementById('helping'));
	var fz1 = 20;
	var bw = 20;
	var fz2 = 14;
    if(width <= 1600){
    	fz1 = 16;
    	bw = 15;
    }
    if(width <= 1366){
    	fz1 = 14;
    	fz2 = 12;
    }
	var option = {
		    title: {
		        text: '各（市）区县帮扶统计 ',
		        top: 0,
		        textStyle: {
		            color: '#fff',
		            fontSize: fz1
		        }
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data:['累计问题', '已解决问题', '走访次数'],
		        right: 10,
		        top: 0,
		        selected:{'累计问题':true,'已解决问题':true,'走访次数':false},
		        textStyle: {
		            color: 'rgba(220,240,245,.5)',
		            fontSize: fz2
		        }
		    },
		    grid: {
		        left:'4%',
		        right:'4%',
		        top: 60,
		        bottom: 10,
		        containLabel:true
		    },
		    color: ['#4381df','#b044d8','#e6b142'],
		    xAxis : [
		        {
		            type: 'category',
		            axisLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            },
		            axisLabel: {
		            	textStyle: {
			                color: '#83adba'
		            	},
		                fontSize: fz2
		            },
		            axisTick: {show: false},
		            data: x
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisTick: {
		                show: false
		            },
		            splitNumber: 2,
		            axisLabel: {
		            	textStyle: {
			                color: '#83adba'
		            	},
		                fontSize: fz2
		            },
		            splitLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            }
		        }
		    ],
		    series : [
		         {
		            name: '累计问题',
		            type: 'bar',
		            barWidth: bw,
		            data: d1
		        },
		        {
		            name: '已解决问题',
		            type: 'bar',
		            barWidth: bw,
		            data: d2
		        },
		        {
		            name: '走访次数',
		            type: 'bar',
		            barWidth: bw,
		            data: d3
		        }
		    ]
		};
    chart.setOption(option);
}
function chart2(data,d2,year,name){
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var chart = echarts.init(document.getElementById('eight-map2'));
	var xData = function() {
	    var data = [];
	    for (var i =1; i < 13; i++) {
	        data.push(i + "月");
	    }
	    return data;
	}();
	  var  option = {
			    "title": {
			        "text": year+"年工业增加值增长速度（%）"+'一'+name,
			        x: "0",
			        textStyle: {
			            color: '#fff',
			            fontSize: fz
			        },
			    },
			    "tooltip": {
			        "trigger": "axis",
			        "axisPointer": {
			            "type": "shadow",
			            textStyle: {
			                color: "#fff",
			                fontSize: fz1	
			            }

			        },
			    },
			    "legend": {
			        x: '65%',
			        top: '11%',
			        textStyle: {
			            color: '#90979c',
			        },
			        "data": ['发斯蒂芬斯蒂芬']
			    },
			     
			    "grid": {
			        "borderWidth": 0,
			        "top": 50,
			        "bottom": 20,
			        textStyle: {
			            color: "#fff"
			        }
			    },

			    "calculable": true,
			    "xAxis": [{
			        "type": "category",
			        "axisLine": {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "splitLine": {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "axisTick": {
			            "show": false
			        },
			        "splitArea": {
			            "show": false
			        },
			        "axisLabel": {
			            "interval": 0,
			            textStyle: {
			                color: '#83adba'
		            	},
			        },
			        "data": xData,
			    }],
			    "yAxis": [{
			        "type": "value",
			        "axisLine": {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "splitLine": {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "axisTick": {
			            "show": false
			        },
			        "axisLabel": {
			            "interval": 0,
			            textStyle: {
			                color: '#83adba'
		            	},
			        },
			        "splitArea": {
			            "show": false
			        },

			    }],

			    "series": [{
		            "name": "增长率",
		            "type": "line",
		            "stack": "总量",
			        symbolSize: 10,
		            "itemStyle": {
		                "normal": {
		                    "color": '#03ddfe',
		                    "label": {
		                    	textStyle:{
		                        },
		                        "show": true,
		                        "position": "top",
		                        formatter: function(p) {
		                            return p.value > 0 ? (p.value) : '';
		                        }
		                    }
		                }
		            },
		             "data": data,
		        }]
			}
	chart.setOption(option);
}
function chart3(data1,data2,year,name) {
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var chart = echarts.init(document.getElementById('eight-map3'));
	var xData = function() {
	    var data = [];
	    for (var i =1; i < 13; i++) {
	        data.push(i + "月");
	    }
	    return data;
	}();

	var option = {
	    "title": {
	        "text": year+ "年主营业务收入完成情况(亿元)"+'一'+name,
	        x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: fz
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff",
	                fontSize: fz1
	            }

	        },
	    },
	    "grid": {
	        "borderWidth": 0,
	        "top": 60,
	        "bottom": 20,
	        textStyle: {
	            color: "#fff"
	        }
	    },
	    "legend": {
	        x: '70%',
	        top: '1%',
	        right: 10,
	        textStyle: {
	            color: 'rgba(220,240,245,.5)', 
	        },
	        icon:'roundRect',
	        "data": ['主营业务收入', '增长率']
	    },
	     

	    "calculable": true,
	    "xAxis": [{
	        "type": "category",
	        "axisLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        "splitLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        "axisTick": {
	            "show": false
	        },
	        "splitArea": {
	            "show": false
	        },
	        "axisLabel": {
	            "interval": 0,
	            textStyle: {
	                color: '#83adba'
            	},
	        },
	        "data": xData,
	    }],
	    "yAxis": [{
            type: 'value',
            nameTextStyle:{
            	color: '#5EC9F4'
            },
            axisLabel: {
                formatter: '{value} ',
                 textStyle: {
     	                color: '#83adba'
                 	},
            },
            axisLine:{
        		lineStyle:{
        			 color: '#83adba'
        		}
        	},
        	splitLine:{
        		lineStyle:{
        			opacity:0
        		}
        	}
        },
        {
            type: 'value',
            scale: true,
            axisLabel: {
                formatter: '{value} %',
                textStyle: {
	                color: '#83adba'
            	},
            },
            axisLine:{
        		lineStyle:{
        			 color: '#83adba'
        		}
        	},
        	splitLine:{
        		lineStyle:{
        			opacity:0.2
        		}
        	}
        }],
	    "series": [{
	            "name": "主营业务收入",
	            "type": "bar",
	            "stack": "总量",
	            "barMaxWidth": 15,
	            "barGap": "10%",
	            "color" : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: '#31a7e2' // 0% 处的颜色
	                    }, {
	                        offset: 1, color: '#64e7f2' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	               "itemStyle": {
	                "normal": {
	                    "label": {
	                        "show": true,
	                        "textStyle": {
	                            "color": "#fff"
	                        },
	                        "position": "insideTop",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": data1
	        },
	         {
	            "name": "增长率",
	            "type": "line",
	            yAxisIndex:1,
	            symbolSize:10,
	            "itemStyle": {
	                "normal": {
	                    "label": {
	                    	textStyle:{
	                    	},
	                        "show": true,
	                        "position": "right",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": data2,
	        },
	    ]
	}
	if(width<=1600){
		option.legend.x = '68%';
		option.legend.top = -2;
	}
	if(width<=1440){
		option.legend.x = '65%';
	}
	if(width<=1440){
		option.title.textStyle.fontSize = 12;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.top = -5;
		option.legend.textStyle.fontSize = 10;
	}
	chart.setOption(option);
}
function chart4(data1,data2,year,name) {
	var chart = echarts.init(document.getElementById('eight-map4'));
	var xData = function() {
	    var data = [];
	    for (var i =1; i < 13; i++) {
	        data.push(i + "月");
	    }
	    return data;
	}();
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var option = {
	    "title": {
	        "text": year+"年利润总额(亿元)"+'一'+name,
	        x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: fz
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff",
	                fontSize: fz1
	            }

	        },
	    },
	    "grid": {
	        "borderWidth": 0,
	        "top": 60,
	        "bottom": 20,
	        textStyle: {
	            color: "#fff"
	        }
	    },
	    "legend": {
	        x: '76%',
	        top: '1%',
	        textStyle: {
	            color: '#90979c',
	        },
	        icon:'roundRect',
	        "data": ['利润总额', '增长率']
	    },
	     

	    "calculable": true,
	    "xAxis": [{
	        "type": "category",
	        "axisLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        "splitLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        axisLabel :{  
        	    interval:0,
        	    textStyle: {
	                color: '#83adba',
            	},
        	} ,
	        "axisTick": {
	            "show": false
	        },
	        "splitArea": {
	            "show": false
	        },
	        "data": xData,
	    }],
	    "yAxis": [
	    	  
	        {
	            type: 'value',
	            nameTextStyle:{
	            	color: '#5EC9F4'
	            },
	            axisLabel: {
	                formatter: '{value} ',
	                textStyle:{
	                	 
	                 }	
	            },
	            axisLine:{
	        		lineStyle:{
	        			 color: '#83adba'
	        		}
	        	},
	        	splitLine:{
	        		lineStyle:{
	        			opacity:0
	        		}
	        	}
	        },
	        {
	            type: 'value',
	            scale: true,
	            axisLabel: {
	                formatter: '{value} %',
	                 textStyle:{
	                	 
	                 }	
	            },
	            axisLine:{
	        		lineStyle:{
	        			 color: '#83adba'
	        		}
	        	},
	        	splitLine:{
	        		lineStyle:{
	        			opacity:0.2
	        		}
	        	}
	        }
	    
	    ],
	    "series": [{
	            "name": "利润总额",
	            "type": "bar",
	            "stack": "总量",
	            "barMaxWidth": 15,
	            "barGap": "10%",
	            "color" : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: '#ef920a' // 0% 处的颜色
	                    }, {
	                        offset: 1, color: '#f1c851' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	            "itemStyle": {
	                "normal": {
	                    "label": {
	                        "show": true,
	                        "textStyle": {
	                            "color": "#fff"
	                        },
	                        "position": "insideTop",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data":data1
	        },
	         {
	            "name": "增长率",
	            "type": "line",
	            "stack": "总量",
	            yAxisIndex:1,
	            symbolSize:10,
	            "itemStyle": {
	                "normal": {
	                    "color": "#e02323",
	                    "label": {
	                    	textStyle:{
	                        },
	                        "show": true,
	                        "position": "top",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": data2
	        },
	    ]
	}
	if(width<=1600){
		option.legend.x = '68%';
		option.legend.top = -2;
	}
	if(width<=1440){
		option.legend.x = '65%';
	}
	if(width<=1440){
		option.title.textStyle.fontSize = 12;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.top = -5;
		option.legend.textStyle.fontSize = 10;
	}
	chart.setOption(option);
}

function chart5(data,name,year,month){
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var chart = echarts.init(document.getElementById('ten-map2'));
	var xData = function() {
	    var data = [];
	    for (var i =1; i < 13; i++) {
	        data.push(i + "月");
	    }
	    return data;
	}();
	var option = {
		    title: {
		        "text":year+'利润率(%)一'+name,
		        x: "0",
		        textStyle: {
		            color: '#fff',
		            fontSize: fz
		        },
		    },
		    "tooltip": {
		        "trigger": "axis",
		        "axisPointer": {
		            "type": "shadow",
		            textStyle: {
		                color: "#fff",
		                fontSize: fz1
		            }

		        },
		        formatter: function(p) {
		        	if(p[0].value){
		        		return p[0].marker+p[0].axisValue+"利润率:"+p[0].value;
		        	}else{
		        		return p[0].marker+p[0].axisValue+"利润率:"+" -";
		        	}  
                }
		    },
		    "xAxis": [{
		        "type": "category",
		        "axisLine": {
		            lineStyle: {
		                color: '#83adba'
		            }
		        },
		        "splitLine": {
		            lineStyle: {
		                color: '#57617B'
		            }
		        },
		        "axisTick": {
		            "show": false
		        },
		        "splitArea": {
		            "show": false
		        },
		        "axisLabel": {
		            "interval": 0,
		            textStyle: {
		                color: '#83adba'
	            	},
		        },
		        "data": xData,
		    }],
		    "yAxis": [{
		        "type": "value",
		        "axisLine": {
		            lineStyle: {
		                color: '#83adba'
		            }
		        },
		        "splitLine": {
		            lineStyle: {
		                color: '#57617B'
		            }
		        },
		        "axisTick": {
		            "show": false
		        },
		        "axisLabel": {
		            "interval": 0,
		            textStyle: {
		                color: '#83adba'
	            	},
		        },
		        "splitArea": {
		            "show": false
		        },

		    }],
		    
		    "series" : [
		        {
		            "type": "line",
		            "data": data.PMseries,
		            symbolSize: 10,
		            "itemStyle": {
		                  "color": '#03ddfe',                                   
		            },
		        }
		    ]
		};
	chart.setOption(option);
}

function chart6(data,year,name,spanName){
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var chart = echarts.init(document.getElementById('ten-map3'));
	var xData = function() {
	    var data = [];
	    for (var i =1; i < 13; i++) {
	        data.push(i + "月");
	    }
	    return data;
	}();

	var option = {
	    "title": {
	        "text": year+ '产业基地指标趋势-'+spanName+'(亿元)'+'一'+name,
	         x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: fz
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff",
	                fontSize: fz1
	            }

	        },
	    },
	    "grid": {
	        "borderWidth": 0,
	        "top": 50,
	        "bottom": 50,
	        textStyle: {
	            color: "#fff"
	        }
	    },
	    "legend": {
	        x: '76%',
	        top: '1%',
	        textStyle: {
	            color: '#90979c',
	        },
	        icon:'roundRect',
	        "data": [spanName, '同比']
	    },
	    "calculable": true,
	    "xAxis": [{
	        "type": "category",
	        "axisLine": {
	            lineStyle: {
	            	 color: '#83adba'
	            }
	        },
	        "splitLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        "axisTick": {
	            "show": false
	        },
	        "splitArea": {
	            "show": false
	        },
	        "axisLabel": {
	            "interval": 0,
	             color: '#83adba',
	             textStyle:{
	             }
	        },
	        "data": xData,
	    }],
	    "yAxis": [
	    
        {
            type: 'value',
            nameTextStyle:{
            	color: '#5EC9F4',
            },
            axisLabel: {
                formatter: '{value} ',
                textStyle: {
	                color: "#83adba"
	            }
            },
            axisLine:{
        		lineStyle:{
        			 color: '#83adba'
        		}
        	},
        	splitLine:{
        		lineStyle:{
        			opacity:0
        		}
        	}
        },
        {
            type: 'value',
            scale: true,
            axisLabel: {
                formatter: '{value} ',
                textStyle: {
	                color: "#83adba"
	            }
            },
            axisLine:{
        		lineStyle:{
        			 color: '#83adba'
        		}
        	},
        	splitLine:{
        		lineStyle:{
        			opacity:0.2
        		}
        	}
        }
	    ],
	    "series": [{
	            "name": spanName,
	            "type": "bar",
	            "stack": "总量",
	            "barMaxWidth": 15,
	            "barGap": "10%",
	            "color" : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: '#31a7e2' // 0% 处的颜色
	                    }, {
	                        offset: 1, color: '#64e7f2' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	               "itemStyle": {
	                "normal": {
	                    "label": {
	                        "show": true,
	                        "textStyle": {
	                            "color": "#fff"
	                        },
	                        "position": "insideTop",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": data.bar1series1,
	        },
	         {
	            "name": "同比",
	            "type": "line",
	            yAxisIndex:1,
	            symbolSize:10,
	            "itemStyle": {
	                "normal": {
	                    "color": "#e02323",
	                    "label": {
	                    	textStyle:{
	                       },
	                        "show": true,
	                        "position": "right",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": data.bar1series2,
	        },
	    ]
	}
	if(width<=1600){
		option.legend.x = '68%';
		option.legend.top = -2;
	}
	if(width<=1440){
		option.legend.x = '65%';
	}
	if(width<=1440){
		option.title.textStyle.fontSize = 12;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.top = -5;
		option.legend.textStyle.fontSize = 10;
	}
	chart.setOption(option);
	
} 

function chart7(data,year,month,name,spanName){
	var chart = echarts.init(document.getElementById('ten-map4'));
	var xData = function() {
	    var data = [];
	    for (var i =1; i < 13; i++) {
	        data.push(i + "月");
	    }
	    return data;
	}();
	var fz = 16;
	var fz1 = 14;
	if(width<=1600){
		fz = 14;
		fz1 = 12;
	}
	if(width<=1440){
		fz = 12;
		fz1 = 10;
	}
	var option = {
	    "title": {
	        "text":year+'利润总额(亿元)一'+name,    
	        x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: fz
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff",
	                fontSize: fz1
	            }

	        },
	    },
	    "grid": {
	        "borderWidth": 0,
	        "top": 50,
	        "bottom": 50,
	        textStyle: {
	            color: "#fff",
	        }
	    },
	    "legend": {
	    	x: '76%',
		    top: '1%',
	        textStyle: {
	            color: '#90979c',
	        },
	        icon:'roundRect',
	        "data": ['利润总额', '同比']
	    },
	    "calculable": true,
	    "xAxis": [{
	        "type": "category",
	        "axisLine": {
	            lineStyle: {
	            	 color: '#83adba'
	            }
	        },
	        "splitLine": {
	            lineStyle: {
	                color: '#57617B'
	            }
	        },
	        "axisTick": {
	            "show": false
	        },
	        "splitArea": {
	            "show": false
	        },
	        "axisLabel": {
	            "interval": 0,
	            color: '#83adba',
            	 textStyle: {
     	        },
	        },
	        "data": xData,
	    }],
	    "yAxis": [
	    
        {
            type: 'value',
            nameTextStyle:{
            	color: '#5EC9F4'
            },
            axisLabel: {
                formatter: '{value} ',
                color: '#83adba',
                textStyle: {
     	        },
            },
            axisLine:{
        		lineStyle:{
        			 color: '#83adba'
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
            scale: true,
            axisLabel: {
                formatter: '{value} %',
                color: '#83adba',
                textStyle: {
     	        },
            },
            axisLine:{
        		lineStyle:{
        			 color: '#83adba'
        		}
        	},
        	splitLine:{
        		lineStyle:{
        			opacity:0
        		}
        	}
        }
	    
	    ],
	    "series": [{
	            "name": "利润总额",
	            "type": "bar",
	            barWidth: 15,
	            barGap: 1,
	            "color" : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: '#ef920a' // 0% 处的颜色
	                    }, {
	                        offset: 1, color: '#f1c851' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	               "itemStyle": {
	                "normal": {
	                    "label": {
	                        "show": true,
	                        "textStyle": {
	                            "color": "#fff"
	                        },
	                        "position": "insideTop",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": data.bar3series1,
	        },{
	            "name": "同比",
	            "type": "line",
	            yAxisIndex:1,
	            symbolSize:10,
	            "itemStyle": {
	                "normal": {
	                    "color": "#e02323",
	                    "label": {
	                    	textStyle:{
	                       },
	                        "show": true,
	                        "position": "right",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            "data": data.bar3series2,
	        },
	    ]
	}
	if(width<=1600){
		option.legend.x = '68%';
		option.legend.top = -2;
	}
	if(width<=1440){
		option.legend.x = '65%';
	}
	if(width<=1440){
		option.title.textStyle.fontSize = 12;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.top = -5;
		option.legend.textStyle.fontSize = 10;
	}
	chart.setOption(option);
}
function ycEconMap(d1) {
    var myChart = echarts.init(document.getElementById('ycEconMap'));
    var fz = 12;
    var sz = 10;
    var ss = 45;
    if(width <= 1440){
    	fz = 12;
    	sz = 6;
        ss = 40;
    }
    if(width <= 1366){
    	fz = 10;
        ss = 35;
    }
    var option = {
    		tooltip : {
    			trigger : 'item',
    			formatter : '{b}'
    		},
            geo : {
                roam : true,
                map : 'yc',
                zoom : 1.2,
                aspectScale : 1,
                label : {
                    show : true,
                    textStyle : {
                        color : '#fff',
                        fontSize: fz
                    },
                },
                itemStyle: {
                    normal: {
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
                    emphasis: {
                        areaColor: '#389BB7'
                    }
                },
    			selectedMode: 'single'
            },
            series : [{
    			type : 'map',
    			geoIndex : 0,
    			data : d1
            },{
                type : 'effectScatter',
                coordinateSystem : 'geo',
                data : yc,
                symbolSize : sz,
                showEffectOn : 'render',
                rippleEffect: {
                    period: 4,
                    scale: 4,
                    brushType: 'fill'
                },
                hoverAnimation : true,
                label : {
                    normal : {
    					formatter : '{b}',
    					position : 'right',
                        textStyle:{
                            color:'#fff'
                        }
                    }
                },
                itemStyle : {
                    normal : {
                        color : '#0de6e6',
                        shadowBlur : 10,
                        shadowColor : '#333'
                    }
                },
                zlevel : 1,
        		tooltip : { show: false}
            },{
                type : 'scatter',
                coordinateSystem : 'geo',
                data : yc3,
                symbol:'pin',
                symbolSize : function(a){
                    return a[2]?ss:0;
                },
                rippleEffect : {
                    scale : 10,
                    brushType : 'stroke'
                },
                hoverAnimation : true,
                label : {
                    normal : {
                        formatter : function(a){
                            return a.value[2];
                        },
                        show : true,
                        position: 'inside',
                        textStyle:{
                            color:'#000',
                            fontSize: fz
                        }
                    }
                },
                itemStyle : {
                    normal : {
                        color : '#03ddfe',
                        shadowBlur : 12,
                        shadowColor : '#333',
                    }
                },
                zlevel : 2,
        		tooltip : { show: false}
            }]
	    }
    myChart.setOption(option);
	myChart.on("click",function(params){
		if(params.componentSubType != 'effectScatter'){
			if($("#orgId").val() == params.data.value[0]){
				$("#orgId").val('360900');
				$(".map-areas span:eq(1)").removeClass("on");
			} else { 
				$("#orgId").val(params.data.value[0]);
				$(".map-areas span:eq(1)").addClass("on").find("h4").text(params.data.name);
			}
			getElecInfor();
			getAllElectric();
			getElectric();
		}
	})
};
function yc3dMap(d1) {
    var myChart = echarts.init(document.getElementById('ycEconMap'));
    var fz = 16;
    if(width <= 1440){
    	fz = 14;
    }
    if(width <= 1366){
    	fz = 10;
    }
    var option = {
    		tooltip : {
    			show: false
    		},
    		geo : {
    			 map : 'yc',
                 zoom : 1.2,
                 aspectScale : 1.3,
                 zlevel : 0,
                 data: d1,
                 itemStyle: {
                     areaColor: '#0909a6',
                     borderColor: '#0909a6'
                 }, 
                 emphasis : {
                  	itemStyle : {
                  		areaColor : '#0909a6'
                  	}
                 },
    		},
            series : [{
    			type : 'map',
    			data : d1,
                map : 'yc',
                zoom : 1.2,
                aspectScale : 1.3,
                zlevel : 1,
                center: [115.02, 28.27],
                selectedMode: 'single',
                label : {
                    show : false,
                    textStyle : {
                        color : '#B6EEFF',
                        fontSize: fz,
                    },
                },
                itemStyle: {
                    color: '#B6EEFF',
                    areaColor: '#3434ea',
                    opacity: 1,
                    borderWidth: 1,
                    borderColor: '#03038F'
                }, 
                emphasis : {
                	label : {
                		show : false,
                		color : '#B6EEFF'
                	},
                	itemStyle : {
                		areaColor : '#389bb7'
                	}
                },
            },{
                type : 'effectScatter',
                coordinateSystem : 'geo',
                data : yc,
                symbolSize : 10,
                rippleEffect: {
                    period: 4,
                    scale: 4,
                    brushType: 'fill'
                },
                label : {
					show : true,
                    formatter : function(a){
                        return areaInfoMap[a.name];
                    },
                    textStyle : {
                        color : '#fff',
                        fontSize: fz
                    },
                    offset: [0, 15]
                },
                itemStyle : {
                    normal : {
                        color : '#0de6e6',
                        shadowBlur : 10,
                        shadowColor : '#333'
                    }
                },
                zlevel : 2,
            }]
	    }
    myChart.setOption(option);
	myChart.on("click",function(params){
		if(params.componentSubType != 'effectScatter'){
		  $(".map-areas span:eq(1)").addClass("on").find("h4").text(params.data.name)
		}
		$("#orgId").val(params.data.value[0]);
		getEconomic();
		getAllElectric();
		getElectric();
	})
};

function ycHotMap(d1) {
    var myChart = echarts.init(document.getElementById('ycMap'));
    var fz = 16;
    if(width <= 1440){
    	fz = 14;
    }
    if(width <= 1366){
    	fz = 10;
    }
    
    var option = {
		title: {
			text: "宜春企业热点分布地图",
			left: 0,
			textStyle: {
				color: '#fff',
				fontSize: fz
			}
		},
        tooltip: {
            trigger: 'item',
            showDelay: 0,
            transitionDuration: 0.2,
            formatter: function (params) {
                //var value = (params.value + '').split('.');
                //value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                return params.name + '<br/>企业总数: ' + params.value + '家<br/>规上企业: ' + params.data.GSTOTAL + '家';
            }
        },
        visualMap: {
            top: 50,
            right: 20,
            min: 0,
            max: 500,
            inRange: {
                color: ['#ffef69', '#ff102c']
            },
            textStyle: {
            	color: '#fff'
            },
            text:['高', '低'],           // 文本，默认为数值文本
            calculable: false
        },
        toolbox: {
            show: false
        },
        series: [
            {
                name: '宜春市企业分布热点图',
                type: 'map',
                roam: false,
                zoom: 1.2,
                map: 'yc',
                aspectScale : 1,
                itemStyle:{
                    normal:{label:{show:true}},
                    emphasis:{label:{show:true}}
                },
                // 文本位置修正
                textFixed: {
                    Alaska: [20, -20]
                },
                data: d1
            }
        ]
    };
    myChart.setOption(option);
};
//宜春用电热力图
function ycHotMap_new(d1) {
    var myChart = echarts.init(document.getElementById('ycMap'));
    var fz = 16;
    if(width <= 1440){
    	fz = 14;
    }
    if(width <= 1366){
    	fz = 10;
    }
    
    var option = {
		title: {
			show: false,
			text: "宜春企业热点分布地图",
			left: 0,
			textStyle: {
				color: '#fff',
				fontSize: fz
			}
		},
        tooltip: {
            trigger: 'item',
            showDelay: 0,
            transitionDuration: 0.2,
            formatter: function (params) {
                var value = (params.name+'</br>当天累计用电：'+params.value + '万kwh');
                return value;
            }
        },
        visualMap: {
			bottom: 0,
			left: 0,
			min: 0,
			max: 100,
			itemWidth:50,
			itemHeight:230,
			inverse:true,
			inRange: {
				color: ['#00E230', '#DEFD47','#EEFF48']
			},
			textStyle: {
				color: '#fff'
			},
			// text:['低', '高'],           // 文本，默认为数值文本
			calculable: false
		},
        toolbox: {
            show: false
        },
        series: [
            {
                name: '宜春用电热力图',
                type: 'map',
                roam: false,
                zoom: 1.2,
                map: 'yc',
				aspectScale : 1,
				selectedMode:'single',
                itemStyle:{
					normal:{
						label:{show:true},
                		borderColor: 'rgba(41,50,104,1)',
						borderWidth:3
					},
					emphasis:{label:{show:true}},
                },
                // 文本位置修正
                textFixed: {
                    Alaska: [20, -20]
                },
                data: d1
            }
        ]
    };
	myChart.setOption(option);
	myChart.off("click");
	myChart.on("click",function(params){
		if(params.componentSubType != 'effectScatter'){
			if($("#orgId").val() == params.data.SPACE_ID){
				$("#orgId").val('360900');
			} else { 
				$("#orgId").val(params.data.SPACE_ID);
			}
			getElecInfor();
			getElectric();
			$(".select-company").text('选择企业');
		}
	})
};
function jxHotMap(d1) {
    var myChart = echarts.init(document.getElementById('ycMap'));
    var fz = 16;
    if(width <= 1440){
    	fz = 14;
    }
    if(width <= 1366){
    	fz = 10;
    }
    
    var option = {
		title: {
			text: "江西企业热点分布地图",
			left: 0,
			textStyle: {
				color: '#fff',
				fontSize: fz
			}
		},
        tooltip: {
            trigger: 'item',
            showDelay: 0,
            transitionDuration: 0.2,
            formatter: function (params) {
                //var value = (params.value + '').split('.');
                //value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                return params.name + '<br/>企业总数: ' + params.value + '家<br/>规上企业: ' + params.data.GSTOTAL + '家';
            }
        },
        visualMap: {
            top: 50,
            right: 20,
            min: 0,
            max: 3000,
            inRange: {
                color: ['#ffef69', '#ff102c']
            },
            textStyle: {
            	color: '#fff'
            },
            text:['高', '低'],           // 文本，默认为数值文本
            calculable: false
        },
        toolbox: {
            show: false
        },
        series: [
            {
                name: '江西省企业分布热点图',
                type: 'map',
                roam: false,
                zoom: 1.2,
                map: 'jiangxi',
                aspectScale : 1,
                itemStyle:{
                    normal:{label:{show:true}},
                    emphasis:{label:{show:true}}
                },
                // 文本位置修正
                textFixed: {
                    Alaska: [20, -20]
                },
				data: d1
            }
        ]
    };
    myChart.setOption(option);
};
//规上企业饼图
function gsPie(d1,d2,type){
	var fz1 = 25;
	var fz2 = 14;
	if(width<=1600){
		fz1 =20;
		fz2 = 12;
	}
	if(width<=1440){
		fz1 = 18;
		fz2 = 10;
	}
	var myChart = echarts.init(document.getElementById('pie-guishang'));	 
	var option = {
			color: ['#F16279', '#FCD434', '#4EC973', '#34C9C9', '#965DE4', '#399EFF', "rgba(0,0,0,0.2)"],
			title: {
				 text:d1.companyTotal,
		         subtext: '企业数量',
		         textStyle: {
		             color: '#FFEE2D',
		             fontSize: fz1,
		             lineHeight: 10,
		         },
		         subtextStyle: {
		             fontSize: fz2,
		             color: '#00DEFF',
		             lineHeight: 10,
		         },
		         x: 'center',
		         y: '38%',
		         itemGap: 5, 
		     },
		     grid: {
		         top:10,
		    	 bottom: 0,
		    	 containLabel:true
		     },
		     series: [
		    	 {
		             radius: ['43%', '71%'],
		             center: ['50%', '50%'],
		             type: 'pie',
		             startAngle: 200,
		             label: {
		            	 show: true,
		                 formatter: function(param){
		                	 if(type==0){
		                		 return param.name+'\n'+param.value+'家'+'（'+param.percent+'%）';
		                	 }else{
		                		 return param.name+'\n'+ param.value+'亿元'+'（'+param.percent+'%）'; 
		                	 }
		                 },
		                 fontSize: 12,
		                 position: 'outside',
		                 color: '#fff',
		                 algin: 'center',
		             },
		             labelLine: {
		            	 show: true,
		                 length: 10,
		                 length2: 8,
		                 lineStyle: {
		                	color: '#fff' 
		                 }
		             },
		             data: d2,
		         },
		         {
		             radius: ['55%', '43%'],
		             center: ['50%', '50%'],
		             type: 'pie',
		             label: {
		            	 show: false
		             },
		             labelLine: {
		            	 show: false
		             },
		             animation: false,
		             tooltip: {
		                 show: false
		             },
		             data: [{
		                 value: 1,
		                 itemStyle: {
		                     color: "rgba(0,0,0,0.2)",
		                 },
		             }],
		         }
		     ]
	}
	myChart.setOption(option);
}
//冰山图
function iceberg(d,select){
	$("#icebergChart").removeAttr("_echarts_instance_");
	var myChart = echarts.init(document.getElementById('icebergChart'));
	var xData = [];
	for (var i =1; i < 13; i++) {
	   xData.push(i + "月");
	}
	xData.unshift('');
	xData.push('');
	var d1 = d.valueList.unshift('');
	var d2 = d.percentList.unshift('');
	var d3 = [];
	d3.push('');
	for (var j = 0; j < d.numList.length; j++) {
		if(d.numList[j]==null){
			d3.push('');
		}else{
			d3.push(d.numList[j]);
		}
	}
	d3.push('');
	var legendSelect = function() {
		var lSelect;
		select==0 || select==2?lSelect = true:lSelect = false;
		return lSelect
	}();
	var legendSelect1 = function() {
		var lSelect;
		select==1 || select==2?lSelect = true:lSelect = false;
		return lSelect
	}();
  var option = {
  	grid: {
        left:'1%',
        right:'1%',
        top: 15,
        bottom: 0,
        containLabel:true
	},
	legend: {
	  	   show: false,
		   type: 'plain',
	  	   data: ['总量', '同比'],
	  	   selected: {
	  		   '总量': legendSelect,
	  		   '同比': legendSelect1,
	  	   }
	  	},
	tooltip: {
		show: true,
		trigger: 'axis',
		formatter: function(params){
			var par1 = ''; 
        	var par2 = ''; 
        	var unit = '',
        	unit1='';
        	var index;
        	if(params[0]){
        		console.log(params)
        		if(params[0].value != undefined && params[0].value!=''){
        			params[0].seriesName=='同比'?unit = '%':unit = '亿元';
        			par1 = params[0].marker + params[0].axisValue + '<br>' + params[0].seriesName + ':' + params[0].value + unit;
        		}
        		index = params[0].dataIndex;
        	}
        	if(params[1]){
        		if(params[1].value != undefined && params[1].value!=''){
        			params[1].seriesName=='总量'?unit1 = '亿元':unit1 = '%';
        			par2 = '<br>' + params[1].seriesName + ':' + params[1].value + unit1; 
        		}
        		index = params[1].dataIndex;
        	}
        	console.log(index)
        	if(par1 == ''){
        		par1 = params[0].marker + params[0].axisValue
        	}
        	var  s = "";
        	if(d3[index]==undefined||d3[index]==''||d3[index]==null){
        		s = "";
        	}else{
        		s = '<br>'+'企业总量:'+d3[index];
        	}
        	return par1 + par2+s;
		}
	},
  	xAxis: [{
          type: 'category',
          show: false,
          data: xData,
          boundaryGap: false,
          axisLine: {
          	lineStyle: {
              	color: 'rgba(255,255,255,0.2)',
              }
          },
      },
      {
          type: 'category',
          position: "bottom",
          data: xData,
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
          }
      }],
      yAxis: [{
          show: true,
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
      }, {
          type: "value",
          axisLabel: {
          	show: true,
          	formatter: '{value} %',
	        color: "#00DEFF"
          },
          axisLine:{
          	show: false,
      	},
      	splitLine: {
      		show: false,
          },
      }],
      series: [{
          type: 'pictorialBar',
          name: '总量',
          xAxisIndex: 1,
          barWidth : '200%',
          barCategoryGap: '-40%',
          symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
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
          data: d.valueList,
      },
      {
      	type: "line",
      	symbol: 'circle',
      	symbolSize: 8,
        name: "同比",
        yAxisIndex: 1,
        data: d.percentList,
        itemStyle: {
          	borderWidth: 2,
            color: '#00FFFF'
        }
      }]
  };
  myChart.setOption(option);
}
//平均价格走势图
function averageLine(d){
	 $("#averageLine").removeAttr("_echarts_instance_");
	 var myChart = echarts.init(document.getElementById('averageLine'));
	 var xData = [];
	 var d1 = d;
	 var bottom = 35;
	 if(width<=1600){
		 bottom = 15;
	 }
	 for (var i =1; i < 13; i++) {
		 xData.push(i + "月");
	 }
	 var option = {
			grid: {
		        left:'1%',
		        right:'1%',
		        top: 10,
		        bottom: bottom,
		        containLabel:true
		    },
		    tooltip: {
				show: true,
				trigger: 'axis',
				formatter: function(param){
					if(param[0].value){
						return param[0].marker+param[0].axisValue + name+'<br/>'+'平均价格： '+param[0].value+'元';
					}
				}
			},
			xAxis: {
				type: 'category',
				axisLine: {
					lineStyle: {
						color:'rgba(255,255,255,.2)',
					}
				},
				splitLine: {
					show: false,
				},
				axisTick: {
					show: false,
				},
				axisLabel: {
					color: '#00DEFF',
				},
				data:xData,
			},
			yAxis: {
				type: "value",
				axisLine: {
					lineStyle: {
						color:'rgba(255,255,255,.2)',
					}
				},
				splitLine: {
					show: true,
					lineStyle: {
						color:'rgba(255,255,255,.2)',
					}
				},
				axisTick: {
					show: false,
				},
				axisLabel: {
					color: '#00DEFF',
				}
			},
			series: {
				type: 'line',
				data:d1,
				smooth: false, //是否平滑曲线显示
				symbolSize: 4,
				itemStyle: {
					borderColor: '#0af'
				},
				lineStyle: {
					normal: {
						color: {
						    type: 'linear',
						    x: 1,
						    y: 0,
						    x2: 0,
						    y2: 0,
						    colorStops: [{
						        offset: 0, color: '#67F8B3' 
						    }, {
						        offset: 1, color: '#05A6FC' 
						    }],
						    global: false 
						},
						width: 4,
					}
				},
				areaStyle: { //区域填充样式
	                normal: {
	                 //线性渐变，前4个参数分别是x0,y0,x2,y2(范围0~1);相当于图形包围盒中的百分比。如果最后一个参数是‘true’，则该四个值是绝对像素位置。
	                   color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
						   { offset: 0,  color: '#67F8B3'}, 
						   { offset: 0.7,  color: '#05A6FC'}
					   ], false),
					   opacity:0.2,
	                   shadowColor: 'rgba(53,142,215, 0.9)', //阴影颜色
	                   shadowBlur: 20 //shadowBlur设图形阴影的模糊大小。配合shadowColor,shadowOffsetX/Y, 设置图形的阴影效果。
		             }
		        },
			}
	 }
	 if(d1&&d1.length>0){
		 myChart.setOption(option);
	 }
}



//用电月负荷折形图
function elecLine(d1){
    var myChart = echarts.init(document.getElementById('electricChart'));
    var dataSource = [];
    var dataSource2 = [];
    var xAxisFlag = "";
    var m = new Date().getMonth()+1;
    var d = new Date().getDate();
    var today = '今日('+m+'-'+d+')';
    var yesteday = '昨日('+m+'-'+(d-1)+')';
    var led = [
        { name: today, icon: 'roundRect'},
        { name: yesteday, icon: 'roundRect'}
        ]
    for(var m=0;m<d1.today.length;m++){
    	d1.today[m].value = d1.today[m].logPowAt;
    }
    for(var n=0;n<d1.yesterday.length;n++){
    	d1.yesterday[n].value = d1.yesterday[n].logPowAt;
    }
    var fz = 18;
    if(width <= 1440){
    	fz = 16;
    }
    if(width <= 1366){
    	fz = 14;
    }
    var index = 0;
    var option = {
        title: {
            show: false,
            text: '企业用电负荷实时曲线（单位：万kw）',
            textStyle:{
                color: '#fff',
                fontSize: fz
            }
        },
        grid: {
        	right: 200,
        	left: 50,
        	bottom: 38,
        	top: 10
        },
        color: ['#3EB5E2','#C12424'],
        tooltip: {
            show:true,
            trigger: 'axis',
            backgroundColor: '#fff',
            textStyle:{
                color:['#000']
            },
            formatter: function(params){
            	var d1 = params[0].axisValue + '<br>' + params[0].marker + params[0].seriesName + ':' + params[0].value + '万kw'; 
				if(params[0].data.compNum) { d1 += '<br>&nbsp; &nbsp; 监测企业数量：' +  params[0].data.compNum};
				var d2 = ''; 
            	if(params[1]){
                	d2 = '<br>' + params[1].marker + params[1].seriesName + ':' + params[1].value + '万kw'; 
					if(params[1].data.compNum) { d2 += '<br>&nbsp; &nbsp; 监测企业数量：' +  params[1].data.compNum};
				}
            	return d1 + d2
            }
        },
        legend: {
            show: true,
            right: 0,
            data: led,
            textStyle: {
                color: '#fff'
            }
        },
        dataZoom: {
            type: 'inside',
            realtime: true,
            start: start,
            end: end
        },
        xAxis: {
            data: d1.xAxis,
            boundaryGap: true,
            splitLine: {
                show: true,
                lineStyle: {
                    color: 'rgba(255,255,255,0.1)'
                }
            },
            axisLabel: {
                color: '#83ADBA'
            }
        },
        yAxis: {
        	scale: true,
            splitLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,0.1)'
                }
            },
            axisLabel: {
                color: '#83ADBA'
            }
        },
        series: [
            {
                name: today,
                type: 'line',
				data: d1.today,
				color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
							offset: 0,
							color: '#FFD154'
						}, {
							offset: 1,
							color: '#FF903E'
						}], false),
                symbolSize: 10,
                smooth: false
            },
            {
                name: yesteday,
                type: 'line',
				data: d1.yesterday,
				color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
							offset: 0,
							color: '#67F8B3'
						}, {
							offset: 1,
							color: '#05A6FC'
						}], false),
                symbolSize: 10,
                smooth: false
            }
        ]
    };
    if(width <= 1440){
    	option.grid.bottom = 5;
    	option.grid.top = 30;
    }
    if(width <= 1366){
    	option.grid.bottom = 20;
    	option.grid.top = 30;
    	option.grid.right = 170;
    }
    myChart.setOption(option);
}
//用电月负荷条形图
function electricBar(d1){
	var chart = echarts.init(document.getElementById('electricChart2'));
    var fz = 14;
    var end = 30;
    if(width <= 1600){
    	fz = 12;
    }
    if(width <= 1366){
    	fz = 10;
    }
    if(d1.xAxis.length < 10) { end = 100}
	var option = {
			title: {
				show: false,
				text: '本月与上月每日用电量对比（单位：万kwh）',
				textStyle: {
					color: '#fff',
					fontSize: 16
				}
			},
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
	        legend: {
	            show: true,
	            right: 0,
		        data:['本月电量', '上月电量'],
	            textStyle: {
	                color: '#fff'
	            },
	        	itemGap: 30
	        },
	        grid: {
	        	right: 200,
	        	left: 50,
				bottom: 38,
				top: 10
	        },
	        dataZoom: {
	            type: 'inside',
	            realtime: true,
	            start: 0,
	            end: end
	        },
		    color: ['#4381df','#e6b142'],
		    xAxis : [
		        {
		            type: 'category',
		            axisLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            },
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz
		            },
		            axisTick: {show: false},
		            data: d1.xAxis
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisTick: {
		                show: false
		            },
		            splitNumber: 3,
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz
		            },
		            splitLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            }
		        }
		    ],
		    series : [
		         {
		            name: '本月电量',
		            type: 'bar',
		            barWidth: 15,
		            data: d1.current
		        },
		        {
		            name: '上月电量',
		            type: 'bar',
		            barWidth: 15,
		            data: d1.lastMonth
		        }
		    ]
		};
    chart.setOption(option);
}
//每日用电高峰时段分布散点图
function electricScatter(d1){
	var chart = echarts.init(document.getElementById('electricChart3'));
    var fz = 14;
    if(width <= 1600){
    	fz = 12;
    }
    if(width <= 1366){
    	fz = 10;
    }
    var x = [];
    for(var i=0;i<24;i++){
    	for(var j=0;j<4;j++){
    		var m = i < 10 ? '0'+i : i;
    		var s = j == 0 ? '00' : 15*j;
        	x.push(m+':'+s);
    	}
    }
	var d2 = [];
    for(var j=0;j<d1.length;j++){
		// d1[j].value = d1[j].value.split(".")[1];
    	d1[j].value = [d1[j].name,d1[j].value]
    }
	var option = {
	        title: {
	            show: false,
	            text: '单位每天用电高峰时段（单位：万kw）',
	            textStyle:{
	                color: '#fff',
	                fontSize: 18
	            }
	        },
	    tooltip : {
	        trigger: 'item',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
	        formatter: function(params){
	        	return params.data.companyName+'<br>最高用电负荷：'+params.data.value[1]+'kw ('+params.data.name+')'
	        }
		},
		grid: {
			right: 150,
			left: 50,
			bottom: 38,
			top: 30
		},
	    yAxis : [
	        {
	            type : 'value',
	            axisTick: {
	                show: false
	            },
	            splitNumber: 3,
	            axisLabel: {
	                color: 'rgba(220,240,245,.5)',
	                fontSize: fz
	            },
	            splitLine: {
	                lineStyle :{
	                    color: 'rgba(220,240,245,.1)'
	                }
	            }
	        }
	    ],
	    xAxis : [
	        {
	            type: 'category',
	            axisLine: {
	                lineStyle :{
	                    color: 'rgba(220,240,245,.1)'
	                }
	            },
	            axisLabel: {
	                color: 'rgba(220,240,245,.5)',
	                fontSize: fz
	            },
	            axisTick: {show: false},
	            data: x
	        }
	    ],
	    series: [{
	        type: 'scatter',
	        symbol: 'circle', //'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
	        symbolSize: 14,
	        itemStyle: {
	            normal: {
	                color: 'rgba(237,178,65,.5)',
	            }
	        },
	        label: {
	            show: false
	        },
	        data: d1
	    }]
	};
    chart.setOption(option);
}
//设备在线
function devicePie(data){
	var chart = echarts.init(document.getElementById('pie'));
	var option = {
		tooltip: {
			trigger: 'item',
			formatter: "{b}: {c}个 ({d}%)"
		},
		series: [{
			name: '库存情况',
			type: 'pie',
			radius: '68%',
			center: ['50%', '50%'],
			clockwise: false,
			data:data,
			label: {
				normal: {
					textStyle: {
						color: '#fff',
						fontSize: 14,
					}
				}
			},
			labelLine: {
				normal: {
					show: false
				}
			},
			itemStyle: {
				normal: {
					borderWidth: 3,
					borderColor: 'rgba(0,0,0,0.3)',
					label:{
						formatter: function(params) {
			         		return params.name + '(' + params.value + '个)'  + '\n' + params.percent+'%';
		                },
	                },
				},
				emphasis: {
					borderWidth: 0,
					shadowBlur: 10,
					shadowOffsetX: 0,
					shadowColor: 'rgba(0, 0, 0, 0.5)'
				}
			},
			color: [
				'#00acee',
				'#52cdd5',
			],
		}],
	}
	chart.setOption(option);
} 
//入规企业条形图
function companyBar(x,d1,type){
	var chart = echarts.init(document.getElementById('rgqyBar'+type));
    var fz = 14;
	var t = 60;
	var bottom = 60;
    var c1 = '#05A6FC';
    var c2 = '#67F8B3';
    if(type == 2) {
    	c1 = '#FF903E';
		c2 = '#FFD154';
    }
    if(width <= 1600){
    	fz = 10;
    	t = 40;
    }
    if(width <= 1366){
    	fz = 10;
    	t = 30;
    }
	var option = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        },
		        formatter: "{b}: {c}"
		    },
		    grid: {
	        	top: 45,
	        	right: 20,
	        	left: 40,
	        	bottom: bottom,
	        },
		    color: ['#4381df','#e6b142'],
		    xAxis : [
		        {
		            type: 'category',
		            axisLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            },
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz,
		                rotate: 40
		            },
		            axisTick: {show: false},
		            data: x
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisTick: {
		                show: false
		            },
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz
		            },
		            splitLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            }
		        }
		    ],
		    series : [
		         {
		            name: '本月电量',
		            type: 'bar',
		            barWidth: 15,
		            data: d1,
		            itemStyle: {
		            	color: {
		            		type: 'linear',
		            	    x: 0,
		            	    y: 0,
		            	    x2: 0,
		            	    y2: 1,
		            	    colorStops: [{
		            	        offset: 0, color: c1 // 0% 处的颜色
		            	    }, {
		            	        offset: 1, color: c2 // 100% 处的颜色
		            	    }],
		            	    globalCoord: false // 缺省为 false
		            	}
		            }
		        }
		    ]
		};
    if(type == 2) { option.backgroundColor = 'rgba(0,6,28,.9)'}
    if(type == 3){
    	option.dataZoom = {
			type: 'inside',
			start: 0,
			end : Math.floor((12/x.length)*100) > 100 ? 100 : Math.floor((12/x.length)*100)
    	};
    	option.backgroundColor = 'rgba(0,6,28,.9)';
    	option.grid = {
			top: 20,
        	right: 5,
        	left: 15,
        	bottom: 5,
        	containLabel: true
    	};
    }
    if(width<=1366){
    	option.grid.top = 10;
    	option.grid.bottom = 35;
    }
    chart.setOption(option);
    if(type == 2) { $("#rgqyBar2").hide();}
}
function companyBar_new(x,d1,type){
	var chart = echarts.init(document.getElementById('rgqyBar'+type));
    var fz = 13;
	var t = 60;
    var c1 = '#05A6FC';
    var c2 = '#67F8B3';
    if(type == 2) {
    	c1 = '#FF903E';
		c2 = '#FFD154';
    }
    if(width <= 1600){
    	fz = 10;
    	t = 40;
    }
    if(width <= 1366){
    	fz = 10;
    	t = 30;
    }
	var option = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        },
		        formatter: "{b}: {c}"
		    },
	        grid: {
	        	top: 45,
	        	right: 20,
	        	left: 40,
	        	bottom: 60,
	        },
		    color: ['#4381df','#e6b142'],
		    xAxis : [
		        {
		            type: 'category',
		            axisLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            },
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz,
		                rotate: 40
		            },
		            axisTick: {show: false},
		            data: x
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisTick: {
		                show: false
		            },
		            axisLabel: {
		                color: 'rgba(220,240,245,.5)',
		                fontSize: fz
		            },
		            splitLine: {
		                lineStyle :{
		                    color: 'rgba(220,240,245,.1)'
		                }
		            }
		        }
		    ],
		    series : [
		         {
		            name: '本月电量',
		            type: 'bar',
		            barWidth: 15,
		            data: d1,
		            itemStyle: {
		            	color: {
		            		type: 'linear',
		            	    x: 0,
		            	    y: 0,
		            	    x2: 0,
		            	    y2: 1,
		            	    colorStops: [{
		            	        offset: 0, color: c1 // 0% 处的颜色
		            	    }, {
		            	        offset: 1, color: c2 // 100% 处的颜色
		            	    }],
		            	    globalCoord: false // 缺省为 false
		            	}
		            }
		        }
		    ]
		};
    if(type == 2) { option.backgroundColor = 'rgba(0,6,28,.9)'}
    if(width<=1366){
    	option.grid.top = 35;
    	option.grid.bottom = 45;
    }
    chart.setOption(option);
    if(type == 2) { $("#rgqyBar2").hide();}
}
//专利饼状图
function companyPie(data){
	var chart = echarts.init(document.getElementById('rgqyBar2'));
	var fz = 14;
	var theradius='72%';
    if(width <= 1600){
		fz = 12;
		theradius='50%'
	}
	if(width <= 1440){
		theradius='45%'
	}
    if(width <= 1366){
    	fz = 10;
    }
	var option = {
		backgroundColor: 'rgba(0,6,28,.9)',
	    tooltip : {
	    	show: true,
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
	        formatter: "{b}: {c}个 ({d}%)"
	    },
		series: [
			{
	 	        type: "pie",
		        radius: ['0', theradius],
		        center: ["50%", "55%"],
		        color: ['#4CC76C', '#F2A440', '#3F95F6','#9ED0FA','#89F1AA'],
		        label: {
		            normal: {
		                show: true,
		                formatter: "{b}",
		                fontSize: fz
		            },
		            emphasis: {
		                show: true
		            }
		        },
		        labelLine: {
		            normal: {
		                show: true,
		                smooth: false,
		                length: 2,
		                length2: 10
		            },
		            emphasis: {
		                show: true
		            }
				},
				data:data
		        // data: [{
		        // 	name: '16年专利总数',
		        // 	value: 1546
		        // },{
		        // 	name: '17年专利总数',
		        // 	value: 2720
		        // },{
		        // 	name: '18年专利总数',
		        // 	value: 3132
		        // }]
			}
		]
	}
	chart.clear();
    chart.setOption(option);
	$("#rgqyBar2").hide();
}
//规上企业tab2
function chartTab2Map1(d1,d2,id){
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	option = {
			
			 grid: {
			        left: '10',
			        right: '10',
			        bottom: '10',
			        top: '40',
			        containLabel: true
			    },
    
			    tooltip: {
			    	
			    },
			    xAxis: {
			        data: d2,
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
		                color: '00DEFF',
			            rotate: 0,
			        },
			        offset: 8,
		            axisLine: {
		                lineStyle: { 
		                	color: '#fff',
		                	width: 2,
		                	opacity:0.2
		                   }
		            },
			    },
			    yAxis: {
			        splitLine: {
			            show: false
			        },
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
			            textStyle: {
			              color: '#00DEFF',
			           }
			        },
		            axisLine: {
		                lineStyle: { 
		                	color: '#00DEFF',
		                	width: 2,
		                	opacity:0.2
		                }
		            },
			    },
			    series: [{
			        type: 'pictorialBar',
			        symbolSize: [25, 15],
			        symbolPosition: 'end',
			        symbolOffset: [0, -10],
			        z: 8,
			        itemStyle: {
			            normal: {
			              color: '#18A7E3'
			            }
			        },
			        data: d1
			          
			    }, {
			        type: 'pictorialBar',
			        symbolSize: [25, 15],
			        symbolOffset: [0, 10],
			        symbolPosition: 'start',
			        z: 12,
			        itemStyle: {
			            normal: {
			            	color: '#0380DD',
			            	// opacity: 0.7
			            }
			        },
			        data: d1
			    },   {
			        type: 'bar',
			        itemStyle: {
			            normal: {
			                    color: '#0380DD',
			                    // opacity: 0.7
			               
			            }
			        },
			        silent: true,
			        barWidth: 25,
			        barGap: '-100%', 
			        data: d1
			    }]
			};
	if(d1&&d1.length>0){
		chart.setOption(option);
	}else{
		$("#"+id).html("<div class='noData'>暂无数据</div>");
	}	
}
function chartTab3GsPie(d2,id,type){
	$("#"+id).removeAttr("_echarts_instance_");
	var myChart = echarts.init(document.getElementById(id));	
	var option = {
			color: ['#F16279', '#FCD434', '#34C9C9', "rgba(0,0,0,0.2)"],
		     grid: {
		         top:10,
		    	 bottom: 0,
		    	 containLabel:true
		     },
		     series: [
		    	 {
		             radius: ['43%', '71%'],
		             center: ['40%', '50%'],
		             type: 'pie',
		             label: {
		            	 show: true,
		                 formatter: function(param){
		                	 if(type==1){
		                		 return  param.name+'\n'+ param.value+'家'+'（'+param.percent+'%）';
		                	 }else{
		                		 return param.name +'\n'+ param.value+'亿元'+'（'+param.percent+'%）'; 
		                	 }
		                 },
		                 fontSize: 12,
		                 position: 'outside',
		                 color: '#fff',
		                 algin: 'center',
		             },
		             labelLine: {
		            	 show: true,
		                 length: 10,
		                 length2: 8,
		                 lineStyle: {
		                	color: '#fff' 
		                 }
		             },
		             data: d2,
		         },
		         {
		             radius: ['55%', '37%'],
		             center: ['40%', '50%'],
		             type: 'pie',
		             label: {
		            	 show: false
		             },
		             labelLine: {
		            	 show: false
		             },
		             animation: false,
		             tooltip: {
		                 show: false
		             },
		             data: [{
		                 value: 1,
		                 itemStyle: {
		                     color: "rgba(0,0,0,0.2)",
		                 },
		             }],
		         }
		     ]
	}
	myChart.setOption(option);
}
function chartTab2PieMap3(d) {
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
			pointFormat: '<span style="color:{point.color}">\u25CF</span>{point.name}:<b>{point.y}家</b>'
		},
		colors:['#3297FC','#FFE42D','#1D54DC','#DCBC35','#B231DC'],
		legend: {
			enabled: true,
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
				depth: 30, //饼图厚度
				dataLabels: {
					enabled: true,
					cursor: 'pointer',
					format: '{point.name}<br/><b>{point.y}家({point.percentage:.1f}%)</b>',//'<b>{point.percentage:.1f}%</b>',
					distance: 5,//调整标签圆心得距离
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
			center: ['50%', '50%'],
			size:'100%',//饼图大小
			startAngle: 340,//开始角度
			data: d
		}]
	};
	$("#tab2-map3").highcharts(highchartOptions);
}
function chartTab2PieMap4(d) {
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
			pointFormat: '<span style="color:{point.color}">\u25CF</span>{point.name}:<b>{point.y}家</b>'
		},
		colors:['#BE31FF','#37E25F','#B231DC'],
		legend: {
			enabled: true,
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
				depth: 30, //饼图厚度
				dataLabels: {
					enabled: true,
					cursor: 'pointer',
					format: '{point.name}<br/><b>{point.y}家({point.percentage:.1f}%)</b>',//'<b>{point.percentage:.1f}%</b>',
					distance: 5,//调整标签圆心得距离
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
			center: ['50%', '50%'],
			size:'100%',//饼图大小
			startAngle: 340,//开始角度
			data: d
		}]
	};
	$("#tab2-map4").highcharts(highchartOptions);
}
function chartTab2Map2(d1,d2,id,title){
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	option = {
			 title:{
				 text: title,
				 textStyle: {
			            fontWeight: 'normal',
			            fontSize: 14,
			            color: "#00DEFF"
			        },
			    },
			 grid: {
			        left: '10',
			        right: '10',
			        bottom: '10',
			        top: '40',
			        containLabel: true
			    },
    
			    tooltip: {},
			    xAxis: {
			        data: d2,
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
		                color: '00DEFF',
			            rotate: 0,
			        },
			        offset: 8,
		            axisLine: {
		                lineStyle: { 
		                	color: '#fff',
		                	width: 2,
		                	opacity:0.2
		                   }
		            },
			    },
			    yAxis: {
			        splitLine: {
			            show: false
			        },
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
			            textStyle: {
			              color: '#00DEFF',
			           }
			        },
		            axisLine: {
		                lineStyle: { 
		                	color: '#00DEFF',
		                	width: 2,
		                	opacity:0.2
		                }
		            },
			    },
			    series: [{
			        type: 'pictorialBar',
			        symbolSize: [25, 15],
			        symbolPosition: 'end',
			        symbolOffset: [0, -10],
			        z: 8,
			        itemStyle: {
			            normal: {
			              color: '#18A7E3'
			            }
			        },
			        data: d1
			          
			    }, {
			        type: 'pictorialBar',
			        symbolSize: [25, 15],
			        symbolOffset: [0, 10],
			        symbolPosition: 'start',
			        z: 12,
			        itemStyle: {
			            normal: {
			            	color: '#0380DD'
			            }
			        },
			        data: d1
			    },   {
			        type: 'bar',
			        itemStyle: {
			            normal: {
			                    color: '#0380DD',
			                    // opacity: 0.7
			               
			            }
			        },
			        silent: true,
			        barWidth: 25,
			        barGap: '-100%', 
			        data: d1
			    }]
			};
	if(d1&&d1.length>0){
		chart.setOption(option);
	}else{
		$("#"+id).html("<div class='noData'>暂无数据</div>");
	}	
}
function chartTab3Map1(d1,d2,d3,id,type){
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	var color1 = ['#F16279', '#FCD434', '#34C9C9'];
	var color2 = ['#B35274', '#B29D3E', '#2997A7'];
	var unit = ['家', '亿元', '亿元'];
	option = {
			 title:{
				 text: "",
				 textStyle: {
			            fontWeight: 'normal',
			            fontSize: 14,
			            color: "#00DEFF"
			        },
			    },
			 grid: {
			        left: '10',
			        right: '200',
			        bottom: '10',
			        top: '40',
			        containLabel: true
			    },
    
			    tooltip: {
			    	show : true,
                    formatter : function(params){
                        if(params.seriesIndex == 0){
                        	if(type == 0){
	                        	return params.name + ':' + params.data + '(占规上比:' + (params.data/1547*100).toFixed(2) + '%)'
                        	}else if (type == 1){
                        		return params.name + ':' + params.data + '(占规上比:' + (params.data/3058.4*100).toFixed(2) + '%)'
                        	}else if (type == 2){
                        		return params.name + ':' + params.data + '(占规上比:' + (params.data/277*100).toFixed(2) + '%)'
                        	}else{}
                        }else if(params.seriesIndex == 3){
	                        return params.name + ':' + params.data + '%'
                        }
                    },
                    textStyle:{
                        color:'#FFF'
                    }
	            },
			    xAxis: {
			        data: d3,
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
		                color: '00DEFF',
			            rotate: 0,
			        },
			        offset: 8,
		            axisLine: {
		                lineStyle: { 
		                	color: '#fff',
		                	width: 2,
		                	opacity:0.2
		                   }
		            },
			    },
			    yAxis: [{
			    	name: unit[type],
			        splitLine: {
			            show: false
			        },
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
			            textStyle: {
			              color: '#00DEFF',
			           }
			        },
		            axisLine: {
		                lineStyle: { 
		                	color: '#00DEFF',
		                	width: 2,
		                	opacity:0.2
		                }
		            },
			    }, {
			    	name:'%',
		          type: "value",
		          axisLabel: {
		          	show: true,
		          	formatter: '{value} %',
			        color: "#00DEFF"
		          },
		          axisLine: {
		                lineStyle: { 
		                	color: '#00DEFF',
		                	width: 2,
		                	opacity:0.2
		                }
		            },
		      	splitLine: {
		      		show: false,
		          },
		      }],
			    series: [{
			        type: 'pictorialBar',
			        symbolSize: [25, 15],
			        symbolPosition: 'end',
			        symbolOffset: [0, -10],
			        z: 8,
			        itemStyle: {
			            normal: {
						  color: color1[type]
			            }
			        },
			        data: d1
			          
			    }, {
			        type: 'pictorialBar',
			        symbolSize: [25, 15],
			        symbolOffset: [0, 10],
			        symbolPosition: 'start',
			        z: 12,
			        itemStyle: {
			            normal: {
			            	color: color2[type]
			            }
			        },
			        data: d1
			    },   {
					type: 'bar',
			        itemStyle: {
			            normal: {
		                    color: color2[type]
			            }
			        },
			        silent: true,
			        barWidth: 25,
			        barGap: '-100%', 
			        data: d1
			    },
			      {
			      	type: "line",
			      	symbol: 'circle',
			      	symbolSize: 8,
			        name: "占比",
			        yAxisIndex: 1,
			        itemStyle: {
			          	borderWidth: 2,
			            color: '#00FFFF'
			        },
			        data:d2
			      }]
			};
	if(d1&&d1.length>0){
		chart.setOption(option);
	}else{
		$("#"+id).html("<div class='noData'>暂无数据</div>");
	}	
}

var yc = [
	{name:'360901',   value:[114.33,27.87]},
	{name:'360921',   value:[115.20,28.80]},
	{name:'360922',   value:[114.40,28.29]},
	{name:'360923',   value:[114.88,28.25]},
	{name:'360924',   value:[114.78,28.50]},
	{name:'360925',   value:[115.27,29.05]},
	{name:'360926',   value:[114.37,28.66]},
	{name:'360981',   value:[115.88,28.2]},
	{name:'360982',   value:[115.45,28.11]},
	{name:'360983',   value:[115.30,28.42]}
];
var yc3 = [
	{name:'360902',   value:[114.38,27.83]},
	{name:'360921',   value:[115.38,28.7]},
	{name:'360922',   value:[114.43,28.12]},
	{name:'360923',   value:[114.92,28.23]},
	{name:'360924',   value:[114.78,28.38]},
	{name:'360925',   value:[115.35,28.87]},
	{name:'360926',   value:[114.37,28.53]},
	{name:'360981',   value:[115.78,28.2]},
	{name:'360982',   value:[115.53,28.07]},
	{name:'360983',   value:[115.37,28.42]}
];
var yc4 = [
	[114.38,27.83,50],
	[115.38,28.7,150],
	[114.43,28.12,250],
	[114.92,28.23,120],
	[114.78,28.38,140],
	[115.35,28.87,200],
	[114.37,28.53,80],
	[115.78,28.2,190],
	[115.53,28.07,134],
	[115.37,28.42,70]
];
var geoCoordMap = [
	{name:'丰城高新技术产业园区',   value:[115.74159,28.217616]},
	{name:'宜丰工业园区',   value:[114.854201,28.359521]},
	{name:'铜鼓工业园区',   value:[114.483175,28.623062]},
	{name:'宜春经济技术开发区',   value:[114.41185,27.873058]},
	{name:'樟树工业园区',   value:[115.489769,28.070988]},
	{name:'靖安工业园区',   value:[115.388088,28.880529]},
	{name:'万载工业园',   value:[114.50881,28.129731]},
	{name:'宜春袁州工业园区',   value:[114.328447,27.932489]},
	{name:'奉新工业园区',   value:[115.419849,28.680469]},
	{name:'上高工业园区',   value:[114.962862,28.258878]},
	{name:'高安高新技术产业园区',   value:[115.443779,28.470796]}
];

//规上仪表盘	
function ruleGauge(d){
	var fz1 = 20;
	var fz2 = 14;
	var x1 = '9.8%';
	var x2 = '44%';
	var x3 = '78.6%';
	if(width<=1600){
		fz1 = 15;
		fz2 = 10;
	}
	if(width<=1366){
		fz2 = 10;
	}
	var length = 60;
	var radius = '55%';
	if(width<=1600){
		length = 42;
	} 
	
	if(width<=1440){
		radius = '45%';
		length = 30;
		x1 = '9%';
		x2 = '42.5%';
		x3 = '77.5%';
	} 
	var myChart = echarts.init(document.getElementById('ruleGauge'));
	var val = d.GS_TOTAL?d.GS_TOTAL:0;
	var val1 = d.GS_ZYYWSR?(d.GS_ZYYWSR/10000).toFixed(2):0,
	val11 = d.SUM_ZYYWSR?(d.SUM_ZYYWSR/10000).toFixed(2):0,
	val2 = d.GS_LR?(d.GS_LR/10000).toFixed(2):0,
	val22 = d.SUM_LR?(d.SUM_LR/10000).toFixed(2):0;
	//var demoData = [
	//    { name: '规上数量占比', value: val, maxVal:d.SUM_TOTAL, pos: ['16%', '50%'], unit:'家',color: '#3A8FFF'},
	//    { name: '规上主营占比', value: val1, maxVal:val11, pos: ['49.8%', '50%'], unit:'亿元',color: '#A96BFF'},
	//    { name: '规上利润占比', value: val2, maxVal:val22, pos: ['84%', '50%'], unit:'亿元',color: '#34C9C9'}
	//];
	var demoData = [
	    { name: '规上数量占比', value: 1547, maxVal:6020, pos: ['16%', '50%'], unit:'家',color: '#3A8FFF'},
	    { name: '规上主营占比', value: 2707.9, maxVal:3058.4, pos: ['49.8%', '50%'], unit:'亿元',color: '#A96BFF'},
	    { name: '规上利润占比', value: 245.1, maxVal:277, pos: ['84%', '50%'], unit:'亿元',color: '#34C9C9'}
	];
	option = {
	 title: [{
	        x: x1,
	        bottom: 27,
	        text: '规上数量占比',
	        textStyle: {
	            fontWeight: 'normal',
	            fontSize: fz2,
	            color: "#fff"
	        },
	      },{
	        x: x2,
	        bottom: 27,
	        text: '园区主营占比',
	        textStyle: {
	            fontWeight: 'normal',
	            fontSize: fz2,
	            color: "#fff"
	        },
	    }, {
	        x: x3,
	        bottom: 27,
	        text: '园区利润占比',
	        textStyle: {
	            fontWeight: 'normal',
	            fontSize: fz2,
	            color: "#fff"
	        },
	    }],
	    tooltip: {
	    	show: true,
	    	formatter: function(p){
	    		return p.marker + "占比：" + p.value.toFixed(2) + '%'
	    	}
	    },
		series: (function() {
	        var result = [];
	        demoData.forEach(function(item) {
	        	var data = item.value/item.maxVal*100;
	        	var ang = 270-(data/100)*270-45; 
	        	result.push({
	                center: item.pos, //仪表的位置
	                name: "刻度", //仪表的名字
	                type: "gauge", //统计图类型为仪表
	                radius: radius, //统计图的半径大小
	                min: 0, //最小刻度
	                max: 100, //最大刻度
	                splitNumber: 5, //刻度数量
	                startAngle: 225, //开始刻度的角度
	                endAngle: -45, //结束刻度的角度
	                axisLine: { //设置默认刻度盘上的刻度不显示，重新定义刻度盘
	                    show: false,
	                    lineStyle: {
	                        width: 1,
	                        color: [
	                            [1, "rgba(255,255,255,0)"]
	                        ]
	                    }
	                }, //仪表盘轴线
	                axisLabel: { //仪表盘上的数据
	                    show: true,
	                    color: "#fff", //仪表盘上的轴线颜色
	                    distance: -29, //图形与刻度的间距
	                    formatter: '{value}%'
	                }, //刻度标签。
	                axisTick: {
	                    show: true,
	                    splitNumber: 10, //刻度的段落数
	                    lineStyle: {
	                        color: '#fff',
	                        width: 1 //刻度的宽度
	                    },
	                    length: -8 //刻度的长度
	                }, //刻度样式
	                splitLine: { //文字和刻度的偏移量
	                    show: true,
	                    length: -12, //便宜的长度
	                    lineStyle: {
	                        color: "#fff",
	                    }
	                }, //分隔线样式
	            },{
	                name: '内圈小',
	                type: 'gauge',
	                center: item.pos,
	                pointer:{
	                  length: length, 
	                },
	                itemStyle: {
	                	color: item.color,
	                },
	                radius: radius,
	                max:100,
	                startAngle: 225,
	                endAngle: -45,
	                splitNumber: 4,
	                axisLine: { // 坐标轴线
	                    lineStyle: { // 属性lineStyle控制线条样式
	                        color: [
	                            [1, '#bfcbd9']
	                        ],
	                        width: 15
	                    }
	                },
	                splitLine: { //分隔线样式
	                    show: false,
	                },
	                axisLabel: { //刻度标签
	                    show: false,
	                    formatter: '{value}%'
	                },
	                axisTick: { //刻度样式
	                    show: false,
	                },
	                detail: {
	                    // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize:fz1,
	                    color: '#FFE42D',
	                    offsetCenter:[0, '40%'],
	                    formatter: [
		            		 item.value,
	                     ].join('\n'),
	                },
	                data: [{
	                    value: data,
	                    name: ''
	                }]
	            }, {
	                name: '内圈小',
	                type: 'gauge',
	                title : {
	                    // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontSize: 12,
	                    offsetCenter: [0, '40%'],
	                    color: '##00D9FF',
	                },
	                pointer:{
	                  show:true  
	                },
	                center: item.pos,
	                radius: radius,
	                startAngle: 225,
	                endAngle: ang,
	                splitNumber: 4,
	                axisLine: { // 坐标轴线
	                    lineStyle: { // 属性lineStyle控制线条样式
	                        color: [
	                            [1, item.color]
	                        ],
	                        width: 15,
	                    }

	                },
	                pointer:{
	                	show: false,
	                	length: 60,   
		            },
	                splitLine: { //分隔线样式
	                	show: false,
	                },
	                axisLabel: { //刻度标签
	                    show: false,
	                },
	                axisTick: { //刻度样式
	                    show: false,
	                },
	                detail: {
	                    // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontSize:12,
	                    color: item.color,
	                    offsetCenter:[0, '65%'],
	                    formatter: [
	                    	item.unit,
	                     ].join('\n'),
	                },
	                data: [{
	                    value: data,
	                }]
	            })
	        });
	        return result; 
		})()
	}; 
	myChart.setOption(option);
}
function ruleIceberg(d,x,name,unit){
	var fz = 14;
	if(width<=1600){
		fz = 12;
	}
	if(width<=1366){
		fz = 10;
	}
	$("#ruleIceberg").removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById("ruleIceberg"));
	x.unshift('');
	x.push('');
	d.unshift('');
	d.push('');
	var option = {
		grid: {
			top: 10,
			left: 0,
			right: 0,
			bottom: 0,
			containLabel: true,
		},
	    tooltip: {
	    	textStyle:{
				fontSize: fz,
			},
	    	formatter: function(params){
	        	return params.marker + params.name + ':' + '<br/>' + params.value + unit;
			}
	    },
	    xAxis: [{
			type: 'category',
			position: "bottom",
	        boundaryGap: false,
			axisLine: { //坐标轴轴线相关设置。数学上的x轴
				show: true,
				lineStyle: {
					color: '#233e64'
				},
			},
			axisLabel: { //坐标轴刻度标签的相关设置
				color: '#00DEFF',
				fontSize: fz
			},
			splitLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisTick: { show: false,},
            data: x
        }],
	    yAxis: [{
			splitLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,.1)'
				}
			},
			axisLabel: {
				color: '#00DEFF',
				fontSize: fz
			},
			axisTick: { show: false} 
	    }],
	    color: ['#e54035'],
	    series: [{
	            name: name,
	            type: 'pictorialBar',
	            barWidth : '200%',
	            barCategoryGap: '-40%',
	            symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
	            itemStyle: {
	                normal: {
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
	                emphasis: {
	                    opacity: 1
	                }
	            },
	            data: d,
	        }]
	}
	chart.setOption(option);
}
function rankPie(d1,t,unit){
	var fz1 = 36;
	var fz2 = 14;
	if(width<=1600){
		fz1 = 25;
		fz2 = 12;
	}
	if(width<=1366){
		fz2 = 10;
	}
	$("#industryRank2").removeAttr("_echarts_instance_");
	var myChart = echarts.init(document.getElementById('industryRank2'));
	var option = {
			color: ['#F16279', '#FCD434', '#4EC973', '#34C9C9', '#965DE4', '#399EFF',"#849CD1","#B1B3B6", "rgba(0,0,0,0.2)"],
			title: {
				 text:t,
		         subtext: '企业数量(家)',
		         textStyle: {
		             color: '#FFEE2D',
		             fontSize: fz1,
		             lineHeight: 10,
		         },
		         subtextStyle: {
		             fontSize: fz2,
		             color: '#00DEFF',
		             lineHeight: 10,
		             align: 'center'
		         },
		         x: 'center',
		         y: '40%',
		         itemGap:0,
		     },
		     grid: {
		         top:10,
		    	 bottom: 0,
		    	 containLabel:true
		     },
		     series: [
		    	 {
		             radius: ['43%', '71%'],
		             center: ['50%', '50%'],
		             type: 'pie',
		             label: {
		            	 show: true,
		                 formatter: function(param){
		                	return param.name+'\n'+ param.value+ unit +'（'+param.percent+'%）'; 
		                 },
		                 fontSize: fz2,
		                 position: 'outside',
		                 color: '#fff',
		                 algin: 'center',
		             },
		             labelLine: {
		            	 show: true,
		                 length: 10,
		                 length2: 8,
		                 lineStyle: {
		                	color: '#fff' 
		                 }
		             },
		             data: d1,
		         },
		         {
		             radius: ['55%', '43%'],
		             center: ['50%', '50%'],
		             type: 'pie',
		             label: {
		            	 show: false
		             },
		             labelLine: {
		            	 show: false
		             },
		             animation: false,
		             tooltip: {
		                 show: false
		             },
		             data: [{
		                 value: 1,
		                 itemStyle: {
		                     color: "rgba(0,0,0,0.2)",
		                 },
		             }],
		         }
		     ]
	}
	myChart.setOption(option);
}








