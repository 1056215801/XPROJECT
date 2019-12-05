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
	        smooth: true,
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
	        smooth: true,
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
			            fontSize: '16'
			        },
			    },
			    "tooltip": {
			        "trigger": "axis",
			        "axisPointer": {
			            "type": "shadow",
			            textStyle: {
			                color: "#fff"
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
		if(width<=1600){
			option.title.textStyle.fontSize = 14;
		}
		if(width<=1366){
			option.title.textStyle.fontSize = 12;
			option.xAxis[0].axisLabel.textStyle.fontSize = 10;
			option.series[0].itemStyle.normal.label.textStyle.fontSize = 10;
		}
	chart.setOption(option);
}
function chart3(data1,data2,year,name) {
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
	            fontSize: '16'
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff"
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
		option.title.textStyle.fontSize = 14;
		option.legend.x = '66%';
		option.legend.top = -2;
	}
	if(width<=1366){
		option.title.textStyle.fontSize = 12;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.top = -5;
		option.legend.textStyle.fontSize = 10;
		option.series[0].itemStyle.normal.label.textStyle.fontSize = 10;
		option.series[1].itemStyle.normal.label.textStyle.fontSize = 10;
		option.xAxis[0].axisLabel.textStyle.fontSize = 10;
		option.yAxis[0].axisLabel.textStyle.fontSize = 10;
		option.yAxis[1].axisLabel.textStyle.fontSize = 10;
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

	var option = {
	    "title": {
	        "text": year+"年利润总额(亿元)"+'一'+name,
	        x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: '16'
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff"
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
		option.title.textStyle.fontSize = 14;
		option.legend.x = '66%';
		option.legend.top = -2;
	}
	if(width<=1366){
		option.title.textStyle.fontSize = 12;
		option.legend.top = -5;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.textStyle.fontSize = 10;
		option.series[0].itemStyle.normal.label.textStyle.fontSize = 10;
		option.series[1].itemStyle.normal.label.textStyle.fontSize = 10;
		option.xAxis[0].axisLabel.textStyle.fontSize = 10;
		option.yAxis[0].axisLabel.textStyle.fontSize = 10;
		option.yAxis[1].axisLabel.textStyle.fontSize = 10;
	}
	chart.setOption(option);
}

function chart5(data,name,year,month){
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
		            fontSize: '16'
		        },
		    },
		    "tooltip": {
		        "trigger": "axis",
		        "axisPointer": {
		            "type": "shadow",
		            textStyle: {
		                color: "#fff"
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
	if(width<=1600){
		option.title.textStyle.fontSize = 14;
	}
	if(width<=1366){
		option.title.textStyle.fontSize = 12;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.textStyle.fontSize = 10;
		option.series[0].itemStyle.normal.label.textStyle.fontSize = 10;
	}
	
	chart.setOption(option);

}

function chart6(data,year,name,spanName){
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
	            fontSize: '16'
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff"
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
		option.title.textStyle.fontSize = 14;
		option.legend.x = '66%';
		option.legend.top = -1;

	}
	if(width<=1366){
		option.title.textStyle.fontSize = 12;
		option.grid.bottom = 40;
		option.legend.top = -5;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.textStyle.fontSize = 10;
		option.series[0].itemStyle.normal.label.textStyle.fontSize = 10;
		option.series[1].itemStyle.normal.label.textStyle.fontSize = 10;
		option.xAxis[0].axisLabel.textStyle.fontSize = 10;
		option.yAxis[0].axisLabel.textStyle.fontSize = 10;
		option.yAxis[1].axisLabel.textStyle.fontSize = 10;
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
	var option = {
	    "title": {
	        "text":year+'利润总额(亿元)一'+name,    
	        x: "0",
	        textStyle: {
	            color: '#fff',
	            fontSize: '16'
	        },
	    },
	    "tooltip": {
	        "trigger": "axis",
	        "axisPointer": {
	            "type": "shadow",
	            textStyle: {
	                color: "#fff"
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
		option.title.textStyle.fontSize = 14;
		option.legend.x = '66%';
		option.legend.top = -1;
	}
	if(width<=1366){
		option.title.textStyle.fontSize = 12;
		option.grid.bottom = 35;
		option.legend.top = -5;
		option.legend.padding = [10,10];
		option.legend.itemWidth = 20;		
		option.legend.itemHeight = 10;
		option.legend.itemGap = 6;
		option.legend.textStyle.fontSize = 10;
		option.series[0].itemStyle.normal.label.textStyle.fontSize = 10;
		option.series[1].itemStyle.normal.label.textStyle.fontSize = 10;
		option.xAxis[0].axisLabel.textStyle.fontSize = 10;
		option.xAxis[0].axisLabel.rotate = 15;
		option.yAxis[0].axisLabel.textStyle.fontSize = 10;
		option.yAxis[1].axisLabel.textStyle.fontSize = 10;
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
            series : [{
    			type : 'map3D',
    			geoIndex : 0,
    			data : d1,
                roam : true,
                map : 'yc',
                selectedMode: 'single',
                label : {
                    show : true,
                    textStyle : {
                        color : 'yellow',
                        fontSize: fz,
                        backgroundColor: 'rgba(0,23,11,0)'
                    },
                },
                itemStyle: {
                    color: '#1d5e98',
                    opacity: 1,
                    borderWidth: 0.5,
                    borderColor: '#000'
                },
                emphasis: { //当鼠标放上去  地区区域是否显示名称
                    label: {
                        show: true,
                        textStyle: {
                            color : 'yellow',
                            fontSize: fz,
                            backgroundColor: 'rgba(0,23,11,0)'
                        }
                    }
                },
                light: { //光照阴影
                    main: {
                        color: '#fff', //光照颜色
                        intensity: 1.2, //光照强度
                        //shadowQuality: 'high', //阴影亮度
                        shadow: false, //是否显示阴影
                        alpha: 55,
                        beta: 10

                    },
                    ambient: {
                        intensity: 0.3
                    }
                },
                viewControl: {
                	beta : -360,
                    autoRotate: true,
                    distance : 80,
                    autoRotateAfterStill: 10,
                    minBeta: -360,
                    maxBeta: 360,
                }
            }]
	    }
    myChart.setOption(option);
	myChart.on("click",function(params){
		$("#orgId").val(params.data.value[0]);
		$(".map-areas span:eq(1)").addClass("on").find("h4").text(params.data.name)
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
            show: true,
            text: '企业用电负荷实时曲线（单位：万kw）',
            textStyle:{
                color: '#fff',
                fontSize: fz
            }
        },
        grid: {
        	right: 200,
        	left: 50,
        	bottom: 30,
        	top: 60
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
            	var d1 = params[0].axisValue + '<br>' + params[0].marker + params[0].seriesName + ':' + params[0].value + '万kw<br>&nbsp; &nbsp; 监测企业数量：' +  params[0].data.compNum; 
            	var d2 = ''; 
            	if(params[1]){
                	d2 = '<br>' + params[1].marker + params[1].seriesName + ':' + params[1].value + '万kw<br>&nbsp; &nbsp; 监测企业数量：' +  params[1].data.compNum; 
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
            boundaryGap: false,
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
                symbolSize: 10,
                smooth: true
            },
            {
                name: yesteday,
                type: 'line',
                data: d1.yesterday,
                symbolSize: 10,
                smooth: true
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
    if(width <= 1600){
    	fz = 12;
    }
    if(width <= 1366){
    	fz = 10;
    }
	var option = {
			title: {
				text: '本月与上月每日用电量对比（单位：万kwh）',
				textStyle: {
					color: '#fff',
					fontSize: 18
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
	        	bottom: 30
	        },
	        dataZoom: {
	            type: 'inside',
	            realtime: true,
	            start: 0,
	            end: 30
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
    	d1[j].value = [d1[j].name,d1[j].value]
    }
	var option = {
	        title: {
	            show: true,
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
	        	return params.data.companyName+'<br>最高用电负荷：'+params.data.value[1]+'万kw ('+params.data.name+')'
	        }
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
//入规企业条形图
function companyBar(x,d1,type){
	var chart = echarts.init(document.getElementById('rgqyBar'+type));
    var fz = 14;
	var t = 60;
    var c1 = '#05A6FC';
    var c2 = '#67F8B3';
    if(type == 2) {
    	c1 = '#FF903E';
		c2 = '#FFD154';
    }
    if(width <= 1600){
    	fz = 12;
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
	        	top: 20,
	        	right: 20,
	        	left: 40,
	        	bottom: 50,
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
    var fz = 14;
	var t = 60;
    var c1 = '#05A6FC';
    var c2 = '#67F8B3';
    if(type == 2) {
    	c1 = '#FF903E';
		c2 = '#FFD154';
		console.log(x)
    }
    if(width <= 1600){
    	fz = 12;
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
	        	top: 50,
	        	right: 20,
	        	left: 40,
	        	bottom: 50,
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
var yc = [
	{name:'360901',   value:[114.38,27.83]},
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
]