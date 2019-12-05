
		var width = window.innerWidth
		|| document.documentElement.clientWidth
		|| document.body.clientWidth;
	var loop2 = '';
	function chart1(datas){
		var chart = echarts.init(document.getElementById('elecBar'));
		var option = {
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            lineStyle: {
		                color: '#57617B'
		            }
		        }
		    },
		    grid: {
		        left: '0',
		        right: '10',
		        bottom: '1%',
		        top:'25',
		        containLabel: true
		    },
		    xAxis: [{
		        type: 'category',
		        boundaryGap: true,
		        axisLine: {
		            lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        data: ['1月', '2月', '3月', '4月', '5月', '6月'],
		        axisTick: {
		            show: false
		        },
		        axisLabel:{
		        	margin: 5,
		        	interval:0,
	            	color:  'rgba(131,173,186,1)',
		            textStyle: {
		                fontSize: 8
		            }
		        }
		    }],
		    yAxis: [{
		        type: 'value',
		        axisTick: {
		            show: false
		        },
		        splitNumber : 2,
		        splitLine: {
		        	lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        axisLine: {
		            lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        axisLabel: {
	            	color:  'rgba(131,173,186,1)',
		            textStyle: {
		                fontSize: 8
		            }
		        }
		    }],
		    series: [{
		        name: '累计收入',
		        type: 'bar',
		        barWidth  : '15',
		        symbolSize: 0,  
		        itemStyle: {
		            normal: {
		                color: {
		            		type: 'linear',
		            	    x: 0,
		            	    y: 0,
		            	    x2: 0,
		            	    y2: 1,
		            	    colorStops: [{
		            	        offset: 0, color: '#FFD154' // 0% 处的颜色
		            	    }, {
		            	        offset: 1, color: '#FF903E' // 100% 处的颜色
		            	    }],
		            	    globalCoord: false // 缺省为 false
		            	}
		            },
		        },
		        data: datas.slice(0,6),
		    } ]
		};
		if(width < 1100) {
			option.yAxis[0].splitNumber = 1;
		}
		chart.setOption(option);
		var axisData = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];
		var data4 = datas;
		var count = 7;
		clearInterval(loop2);
		loop2 = setInterval(function (){
		    var data0 = option.series[0].data;
		    data0.shift();
		    data0.push(data4[count-1]);
		    option.xAxis[0].data.shift();
		    option.xAxis[0].data.push(axisData[count-1]);
		    if (count == 12) {
				count = 1;
			}else{
		    	count = count+1;
			}
		   chart.setOption(option);
		}, 2000);
	 }
	function chartElecLine(m){   //实时用电
		var chart = echarts.init(document.getElementById('elecLine'));
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
		    grid: {
		        left: '0',
		        right: '20',
		        bottom: '1%',
		        top:'25',
		        containLabel: true
		    },
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        axisLabel:{
		        	margin: 5,
		        	interval:0,
	            	color:  'rgba(131,173,186,1)',
		            textStyle: {
		                fontSize: 8
		            }
		        },
		        axisLine: {
		        	lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        data: ['8:00','9:00', '10:00', '11:00', '12:00']
		    },
		    yAxis: {
		        type: 'value',
		        //min: m,
		        axisTick: {
		            show: false
		        },
		        splitNumber : 2,
		        splitLine: {
		        	lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        axisLine: {
		            lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        axisLabel: {
	            	color:  'rgba(131,173,186,1)',
		            textStyle: {
		                fontSize: 8
		            }
		        }
		    },
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
		                    color: 'rgba(71,255,238, 0.8)'
		                }, {
		                    offset: 1,
		                    color: 'rgba(71,255,238, 0)'
		                }], false),
		                shadowColor: 'rgba(0, 0, 0, 0.1)',
		                shadowBlur: 10
		            }
		        },
		        itemStyle: {
		            normal: {
		                color: '#47FFEE',
		                borderColor: '#47FFEE',
		                borderWidth: 12

		            }
		        },
		        data: ['20','34','30','40','50']
		    }]
		};
		chart.setOption(option);
	}
	function chart2(type,mapData) {
		for(var i=0;i<mapData.length;i++){
			if(mapData[i].value[2] == 0){
				mapData.splice(i,1);
				i--;
			}
		}
        var myChart = echarts.init(document.getElementById('map2'));
        var fz = 14;
        var sz = 10;
        var ss = 35;
        if(width <= 1440){
        	fz = 12;
        	sz = 6;
            ss = 30;
        }
        if(width <= 1366){
        	fz = 10;
            ss = 25;
        }
        var t = type == '中游' ? 1 : type=='下游' ? 0.5 : 1;
	    var option = {
	    	tooltip : {
	    		formatter: function(params){
	    			if(type == '储量'){
                    	return params.name + '：' + params.value[2] + '万吨'
                    }
                    return params.value[2] + '家企业'
                }
            },
	    	geo : {
                map : 'china',
                zoom : 1.3,
                aspectScale : 1,
                zlevel:1,
                center: [104.55, 35.15],
                label : {
                    show : true,
                    distance : t,
                    textStyle : {
                        color : '#fff',
                        fontSize: fz,
                        backgroundColor: 'rgba(0,23,11,0)'
                    },
                },
                emphasis : {
                	label : {
                		color : '#fff'
                	},
                	itemStyle : {
                		areaColor : '#389bb7'
                	}
                },
                itemStyle : {
                    color : '#3743FF',
                    opacity: 1,
                    borderWidth: 0.5,
                    borderColor : '#1C1CD9'
                },
                regions : [{
                	name : '南海诸岛',
                	itemStyle : {
                		opacity : 0
                	},
                	label : {
                		show : false
                	},
                	emphasis : {
                    	label : {
                    		show : false
                    	}
                    },
                }]
            },
            series : [
            	{
            		type:'map',
            		map : 'china',
            		zlevel:0,
            		zoom : 1.3,
                    aspectScale : 1,
                    itemStyle : {
                    	areaColor:'#212899',
                    },
                    label : {
                    	show : false
                    },
                    emphasis : {
                    	label : {
                    		show : false,
                    	},
                    	itemStyle : {
                        	areaColor:'#212899',
                        }
                    },
                    tooltip : {
        	    		show : false
                    },
                    data:[{  
                           name:"南海诸岛",
                           value:0,  
                           itemStyle:{  
                        	   opacity:0,
                        	   label:{show:false}  
                           },  
                    }]
            	},
                //散点图
                {
                    name: 'effectScatter',
                    type: "effectScatter",
                    coordinateSystem: 'geo',
                    symbolSize: 8, 
                    symbolOffset : [0, -12], 
                    opacity: 1,
                    zlevel: 2,
			        rippleEffect: {
			            brushType: 'fill',
			            scale : 5
			        },
	                itemStyle : {
                        color : '#66de9c',
	                },
                    label: {
                        show: false,
                    },
                    data: mapData
                },
                {
			        type: 'scatter',
			        coordinateSystem: 'geo',
			        zlevel: 3,
			        symbol: 'pin',
			        symbolSize: 45,
			        symbolOffset : [0, -12],
			        itemStyle: {
			        	color: '#d6c534',
			        	opacity : 1,
			        },
			        label: {
			        	show: true,
		                textStyle: {
		                	color: '#f57032',
		                    fontSize: 14,
		                },
		                formatter: function(params){
			    			if(type == '储量'){
		                    	return params.name + '：' + params.value[2] + '万吨'
		                    }
		                    return params.value[2]
		                }
		            },
			        data: mapData
			    }
             ],
		}
	    console.log(option)
	    myChart.setOption(option);
	    myChart.getZr().on("click",function(p){
	    	if(p.target){
	    		toLink(4)
	    	}
	    });
	    
	};
	function chart3(value) {
		value.sort(function(o1, o2) {
		    if (isNaN(o1.value) || o1.value == null) return -1;
		    if (isNaN(o2.value) || o2.value == null) return 1;
		    return o1.value - o2.value;
		});
		var yData = [];
		var xData = [];
		for(var i = 0; i < value.length; i++){
			yData.push(value[i].name);
			var temp = {
				name: value[i].name,
				value: value[i].value
			}
			xData.push(temp)
		}
		var nameMap = {
	           'Singapore Republic':'新加坡',
	           'Dominican Republic':'多米尼加',
	           'Palestine':'巴勒斯坦',
	           'Bahamas':'巴哈马',
	           'Timor-Leste':'东帝汶',
	           'Afghanistan':'阿富汗',
	           'Guinea-Bissau':'几内亚比绍',
	           "Côte d'Ivoire":'科特迪瓦',
	           'Siachen Glacier':'锡亚琴冰川',
	           "Br. Indian Ocean Ter.":'英属印度洋领土',
	           'Angola':'安哥拉',
	           'Albania':'阿尔巴尼亚',
	           'United Arab Emirates':'阿联酋',
	           'Argentina':'阿根廷',
	           'Armenia':'亚美尼亚',
	           'French Southern and Antarctic Lands':'法属南半球和南极领地',
	           'Australia':'澳大利亚',
	           'Austria':'奥地利',
	           'Azerbaijan':'阿塞拜疆',
	           'Burundi':'布隆迪',
	           'Belgium':'比利时',
	           'Benin':'贝宁',
	           'Burkina Faso':'布基纳法索',
	           'Bangladesh':'孟加拉国',
	           'Bulgaria':'保加利亚',
	           'The Bahamas':'巴哈马',
	           'Bosnia and Herz.':'波斯尼亚和黑塞哥维那',
	           'Belarus':'白俄罗斯',
	           'Belize':'伯利兹',
	           'Bermuda':'百慕大',
	           'Bolivia':'玻利维亚',
	           'Brazil':'巴西',
	           'Brunei':'文莱',
	           'Bhutan':'不丹',
	           'Botswana':'博茨瓦纳',
	           'Central African Republic':'中非',
	           'Canada':'加拿大',
	           'Switzerland':'瑞士',
	           'Chile':'智利',
	           'China':'中国',
	           'Ivory Coast':'象牙海岸',
	           'Cameroon':'喀麦隆',
	           'Republic of the Congo':'刚果',
	           'Democratic Republic of the Congo':'刚果民主共和国',
	           'Colombia':'哥伦比亚',
	           'Costa Rica':'哥斯达黎加',
	           'Cuba':'古巴',
	           'N. Cyprus':'北塞浦路斯',
	           'Cyprus':'塞浦路斯',
	           'Czech Republic':'捷克',
	           'Germany':'德国',
	           'Djibouti':'吉布提',
	           'Denmark':'丹麦',
	           'Algeria':'阿尔及利亚',
	           'Ecuador':'厄瓜多尔',
	           'Egypt':'埃及',
	           'Eritrea':'厄立特里亚',
	           'Spain':'西班牙',
	           'Estonia':'爱沙尼亚',
	           'Ethiopia':'埃塞俄比亚',
	           'Finland':'芬兰',
	           'Fiji':'斐',
	           'Falkland Islands':'福克兰群岛',
	           'France':'法国',
	           'Gabon':'加蓬',
	           'United Kingdom':'英国',
	           'Georgia':'格鲁吉亚',
	           'Ghana':'加纳',
	           'Guinea':'几内亚',
	           'Gambia':'冈比亚',
	           'Guinea Bissau':'几内亚比绍',
	           'Eq. Guinea':'赤道几内亚',
	           'Greece':'希腊',
	           'Greenland':'格陵兰',
	           'Guatemala':'危地马拉',
	           'French Guiana':'法属圭亚那',
	           'Guyana':'圭亚那',
	           'Honduras':'洪都拉斯',
	           'Croatia':'克罗地亚',
	           'Haiti':'海地',
	           'Hungary':'匈牙利',
	           'Indonesia':'印度尼西亚',
	           'India':'印度',
	           'Ireland':'爱尔兰',
	           'Iran':'伊朗',
	           'Iraq':'伊拉克',
	           'Iceland':'冰岛',
	           'Israel':'以色列',
	           'Italy':'意大利',
	           'Jamaica':'牙买加',
	           'Jordan':'约旦',
	           'Japan':'日本',
	           'Kazakhstan':'哈萨克斯坦',
	           'Kenya':'肯尼亚',
	           'Kyrgyzstan':'吉尔吉斯斯坦',
	           'Cambodia':'柬埔寨',
	           'North Korea':'韩国',
	           'Kosovo':'科索沃',
	           'Kuwait':'科威特',
	           'Laos':'老挝',
	           'Lebanon':'黎巴嫩',
	           'Liberia':'利比里亚',
	           'Libya':'利比亚',
	           'Sri Lanka':'斯里兰卡',
	           'Lesotho':'莱索托',
	           'Lithuania':'立陶宛',
	           'Luxembourg':'卢森堡',
	           'Latvia':'拉脱维亚',
	           'Morocco':'摩洛哥',
	           'Moldova':'摩尔多瓦',
	           'Madagascar':'马达加斯加',
	           'Mexico':'墨西哥',
	           'Macedonia':'马其顿',
	           'Mali':'马里',
	           'Myanmar':'缅甸',
	           'Montenegro':'黑山',
	           'Mongolia':'蒙古',
	           'Mozambique':'莫桑比克',
	           'Mauritania':'毛里塔尼亚',
	           'Malawi':'马拉维',
	           'Malaysia':'马来西亚',
	           'Namibia':'纳米比亚',
	           'New Caledonia':'新喀里多尼亚',
	           'Niger':'尼日尔',
	           'Nigeria':'尼日利亚',
	           'Nicaragua':'尼加拉瓜',
	           'Netherlands':'荷兰',
	           'Norway':'挪威',
	           'Nepal':'尼泊尔',
	           'New Zealand':'新西兰',
	           'Oman':'阿曼',
	           'Pakistan':'巴基斯坦',
	           'Panama':'巴拿马',
	           'Peru':'秘鲁',
	           'Philippines':'菲律宾',
	           'Papua New Guinea':'巴布亚新几内亚',
	           'Poland':'波兰',
	           'Puerto Rico':'波多黎各',
	           'South Korea':'朝鲜',
	           'Portugal':'葡萄牙',
	           'Paraguay':'巴拉圭',
	           'Qatar':'卡塔尔',
	           'Romania':'罗马尼亚',
	           'Russia':'俄罗斯',
	           'Rwanda':'卢旺达',
	           'W. Sahara':'西撒哈拉',
	           'Saudi Arabia':'沙特阿拉伯',
	           'Sudan':'苏丹',
	           'South Sudan':'南苏丹',
	           'Senegal':'塞内加尔',
	           'Solomon Is.':'所罗门群岛',
	           'Sierra Leone':'塞拉利昂',
	           'El Salvador':'萨尔瓦多',
	           'Somaliland':'索马里兰',
	           'Somalia':'索马里',
	           'Serbia':'塞尔维亚',
	           'Suriname':'苏里南',
	           'Slovakia':'斯洛伐克',
	           'Slovenia':'斯洛文尼亚',
	           'Sweden':'瑞典',
	           'Swaziland':'斯威士兰',
	           'Syria':'叙利亚',
	           'Chad':'乍得',
	           'Togo':'多哥',
	           'Thailand':'泰国',
	           'Tajikistan':'塔吉克斯坦',
	           'Turkmenistan':'土库曼斯坦',
	           'East Timor':'东帝汶',
	           'Trinidad and Tobago':'特里尼达和多巴哥',
	           'Tunisia':'突尼斯',
	           'Turkey':'土耳其',
	           'United Republic of Tanzania':'坦桑尼亚',
	           'Uganda':'乌干达',
	           'Ukraine':'乌克兰',
	           'Uruguay':'乌拉圭',
	           'United States':'美国',// of America
	           'Uzbekistan':'乌兹别克斯坦',
	           'Venezuela':'委内瑞拉',
	           'Vietnam':'越南',
	           'Vanuatu':'瓦努阿图',
	           'West Bank':'西岸',
	           'Yemen':'也门',
	           'South Africa':'南非',
	           'Zambia':'赞比亚',
	           'Zimbabwe':'津巴布韦'
	        };
	    var chart = echarts.init(document.getElementById('map3'));
	    var fz = 14;
	    if(width <= 1366){
        	fz = 10;
        }
	    var option = {
		        tooltip: {
		        	show: true,
		        	padding: 0,
		        	position: 'bottom',
		        	trigger: 'item',
		        	formatter:function(params){
		        		if(params.value){
		        			return params.name + '：' + params.value+'万吨';
		        		}
		        	}
		        },
		        visualMap: {
		            max: 2000,
		            min: 0,
		            left: 20,
		            bottom: '45%',
		            text: ['高','低'],
		            seriesIndex: [0,1],
		            itemWidth: 30,
		            itemHeight: 180,
	 	            inRange: {
		                color: ['#FFED51','#FF7A51']
		            },
		            textStyle: {
			            color: '#fff',
			            fontSize: fz
		            }
		        },
		        grid: {
		            left: 80,
		            right: 40,
		            bottom: 40,
		            top: '61%'
		        },
		        yAxis: {
		            type: 'value',
		            splitLine: {
		                lineStyle: {
		                    color: 'rgba(255,255,255,.2)'
		                }
		            },
		            axisLine: {
		                lineStyle: {
		                    color: 'rgba(255,255,255,.2)'
		                }
		            },
		            axisTick: {
		                show: false
		            },
		            axisLabel: {
		                fontSize: fz,
	                    color: '#fff'
		            }
		        },
		        xAxis: {
		            type: 'category',
		            axisLine: {
		                show: false
		            },
		            axisTick: {
		                show: false
		            },
		            axisLabel: {
		                interval: 0,
			            fontSize: fz,
	                    color: '#fff'
		            },
		            data: yData
		        },
		        series: [{
		            type: 'map',
		            map: 'world',
		            aspectScale : .9,
		            top: 20,
		            bottom: '40%',
			    	nameMap: nameMap,
			    	itemStyle: {
			    		normal: {
			    			areaColor  : '#6F6FFF',
			    			borderColor: '#6F6FFF'
			    		}
			    	},
			    	label: {
			    		normal: {
			    			position: 'inside'
			    		}
			    	},
			    	data: value
		        }, {
		            type: 'bar',
		            zlevel: 2,
		            tooltip: { show: false},
		            barWidth: 40,
		            label: {
		                normal: {
		                    show: true,
		                    position: 'top',
		                    textStyle: {
		                    	fontSize: fz,
		                    	color: '#fff'
		                    }
		                }
		            },
		            data: value.reverse()
		        }]
		    }
	    chart.setOption(option);
	}
	function chart4(data) {
	    var chart = echarts.init(document.getElementById('map1'));
	    var fz = 14;
	    if(width <= 1600){
        	fz = 12;
        }
	    if(width <= 1366){
        	fz = 10;
        }
	    option = {
	    	    tooltip : {
	    	        trigger: 'item',
	    	        formatter: "{b} : {c} ({d}%)",
	    	        textStyle: {
	    	        	fontSize: fz,
	    	        }
	    	    },
	    	    color : ['#2261FF','#FFDA3E','#CE39FF','#FF3964'],
	    	    calculable : true,
	    	    series : [
	    	        {
	    	            type:'pie',
	    	            radius : [0, '85%'],
	    	            center : ['25%', '55%'],
	    	            data:data,
		    	        label: {
	    	            	normal: {
	    		    	        textStyle: {
	    		    	        	fontSize: fz,
	    		    	        	color: '#fff'
	    		    	        },
	    		    	        formatter: '{d}%'
	    	            	}
		    	        },
	    	            labelLine : {
	    	            	normal: {
	    	            		lineStyle: {
	    	            			width: 1
	    	            		}
	    	            	}
	    	            }
	    	        }
	    	    ]
	    	};
	    
	    if(width<=1600){
	    	option.series[0].radius = [0, '70%'];
	    }
	    if(width<=1366){
	    	option.series[0].radius = ['0%', '75%'];
	    	option.series[0].center = ['25%', '55%'];
	    }
	    
	    
	    chart.setOption(option);
	}
	
	function chart5(data){
	    var chart = echarts.init(document.getElementById('priceTable2'));
		options = {
			    title: {
			        //text: '检查企业信息分析'
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
			            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
			        }
			    },
			    legend: {
			        data: ['检查企业数', '完成整改企业数', '违法违规企业数']
			    },
			    
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis: [{
			        type: 'category',
			         data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			    }],
			    yAxis: [{
			        type: 'value',
			        //name: '投诉举报数',
			        axisLabel: {
			            formatter: '{value}'
			        }
			    }],
			    series: [{
			        name: '检查企业数',
			        type: 'bar',
			        itemStyle:{
			            normal:{color:'#01949B'},
			        },
			        data: [2031, 1793, 3640, 2593, 4377,3201, 2275, 3289, 3356,2859,4244,3945]
			    }, {
			        name: '完成整改企业数',
			        type: 'bar',
			        itemStyle:{
			            normal:{color:'#EBA954'},
			        },
			        data: [1043, 1456, 1900, 1200, 2100,1870, 980, 1569, 1130, 1490,2300, 2210]
			    }, {
			        name: '违法违规企业数',
			        type: 'bar',
			        itemStyle:{
			            normal:{color:'#C23531'},
			        },
			        data: [787, 571, 999, 341, 231,812, 735, 231,322,712,1230, 870]
			    }]
			};
	    chart.setOption(options);
	}
	function chart6(datas){
	    var chart = echarts.init(document.getElementById('priceTable2'));
	    var name = [];
	    var  legendName = [];
	    var color = ['#00f2ff', '#ffff00', '#ff0000', '#f845b3', '#f845f1', '#ad46f3', '#5045f6', '#4777f5', '#44aff0', '#45dbf7', '#f6d54a', '#f69846', '#ff4343', '#00f2ff', '#ffff00', '#ff0000', '#f845b3', '#f845f1', '#ad46f3', '#5045f6', '#4777f5', '#44aff0', '#45dbf7', '#f6d54a', '#f69846', '#ff4343'];
	    var indicators = [];
	    for(var x = 0; x < datas.nameList.length;x++){
    		var n = datas.nameList[x][0] + "(" + datas.nameList[x][1] + ")" + datas.nameList[x][2];
    		var indicator = datas.nameList[x][0] + "(" + datas.nameList[x][1] + ")";
    		if(indicators.indexOf(indicator)<0){
    			indicators.push(indicator);
    		}
    		name.push(n);
    		legendName.push(n);
	    }
//	    for(var x = 0; x < indicators.length;x++){
//	    	legendName.push(indicators[x]);
//	    }
	    var data = datas.valueList;
	    var d1 = [];
	    for(var j = 0 ;j < name.length;j++){
    		d1[j] = [];
	    	for(var m = 0;m < data.length;m++){
	    		d1[j].push(data[m][j]);
	    	}
	    }
	    var series = [];
	    for (var i = 0; i < name.length; i++) {
	        series.push({
	            name: name[i],
	            type: "line",
	            symbolSize: 3,//标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10[ default: 4 ]
	            symbol: 'circle',//标记的图形。ECharts 提供的标记类型包括 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
	            smooth: true, //是否平滑曲线显示
	            showSymbol: false, //是否显示 symbol, 如果 false 则只有在 tooltip hover 的时候显示
	            areaStyle: {
	                normal: {
	                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                        offset: 0,
	                        color: color[i]
	                    }, {
	                        offset: 1,
	                        color: 'rgba(255,255,255,0)'
	                    }], false),
	                    // shadowColor: 'rgba(255,255,255, 0.1)',
	                    shadowBlur: 10,
	                    opacity:0.3,
	                }
	            },
	            itemStyle: {
	                normal: {
	                    color: color[i],
	                    lineStyle: {
	                        width: 1,
	                        type: 'solid' //'dotted'虚线 'solid'实线
	                    },
	                    borderColor: color[i], //图形的描边颜色。支持的格式同 color
	                    borderWidth: 8 ,//描边线宽。为 0 时无描边。[ default: 0 ] 
	                    barBorderRadius: 0,
	                    label: {
	                        show: false,
	                    },
	                    opacity:0.5,
	                }
	            },
	            data: d1[i],
	        })
	    }
	    option = {
	        legend: {
	            bottom: 20,
	                itemGap:5,
	                itemWidth:5,
	                show:false,
	                textStyle: {
	                    color: '#fff',
	                    fontSize: '12'
	                },
	                data: legendName
	        },
	        tooltip: {
	            trigger: "axis",
	            axisPointer: { // 坐标轴指示器，坐标轴触发有效
	                type: 'line', // 默认为直线，可选为：'line' | 'shadow'
	                lineStyle: {
	                    color: '#57617B'
	                }
	            },
	            //formatter: '{b}<br />{a0}: {c0}%<br />{a1}: {c1}%<br />{a2}: {c2}%<br />{a3}: {c3}%<br />{a4}: {c4}%<br />{a5}: {c5}%',
	            backgroundColor: 'rgba(0,0,0,0.7)', // 背景
	            padding: [8, 10], //内边距
	            extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
	        },
	        grid: {
	            borderWidth: 0,
	            top: 20,
	            bottom: 80,
	            textStyle: {
	                color: "#fff"
	            }
	        },
	        xAxis: [{
	            type: "category",
	            axisLine: {
	                lineStyle: {
	                    color: '#32346c'
	                }
	            },
	            splitLine: {
	                show: true,
	                lineStyle: {
	                    color: '#32346c',
	                }
	            },
	            boundaryGap: false, //坐标轴两边留白策略，类目轴和非类目轴的设置和表现不一样
	            axisTick: {
	                show: false
	            },
	            splitArea: {
	                show: false
	            },
	            axisLabel: {
	                inside: false,
	                textStyle: {
	                    color: '#bac0c0',
	                    fontWeight: 'normal',
	                    fontSize: '12',
	                },
	            },
	            data: datas.jaDate,
	        }],
	        yAxis: {
	            type: 'value',
	            axisTick: {
	                show: false
	            },
	            axisLine: {
	                show: true,
	                lineStyle: {
	                    color: '#32346c',
	                }
	            },
	            splitLine: {
	                show: true,
	                lineStyle: {
	                    color: '#32346c',
	                }
	            },
	            axisLabel: {
	                textStyle: {
	                    color: '#bac0c0',
	                    fontWeight: 'normal',
	                    fontSize: '12',
	                },
	                formatter: '{value}',
	            },
	        },
	        series: series,
	    }
	    chart.setOption(option);
	}
	var nowDate = new Date();
	var now;
	if(nowDate.getHours()<10){
		now = + new Date(nowDate.getFullYear()-1, nowDate.getMonth(), nowDate.getDate()-1);
	}else{
		now = + new Date(nowDate.getFullYear()-1, nowDate.getMonth(), nowDate.getDate());
	}
	var oneDay = 24 * 3600 * 1000;
	
	var value = Math.random() * 1000;
	function randomData(value) {
	    now = new Date(+now + oneDay);
	    return {
	        name: now.toString(),
	        value: [
	            [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('-'), Math.round(value)
	        ]
	    }
	}
var jx = [
	{name:'360100',   value:[115.9,28.73, 0]},
	{name:'360101',   value:[115.9,28.68, 0]},
	{name:'360102',   value:[115.910312,28.70536, 0]},
	{name:'360103',   value:[115.883697,28.663429, 0]},
	{name:'360104',   value:[115.92,28.63, 0]},
	{name:'360105',   value:[115.73,28.72, 0]},
	{name:'360111',   value:[115.95,28.68, 0]},
	{name:'360112',   value:[115.821652,28.699492, 0]},
	{name:'360121',   value:[115.93,28.55, 0]},
	{name:'360122',   value:[115.82,28.7, 0]},
	{name:'360123',   value:[115.55,28.85, 0]},
	{name:'360124',   value:[116.27,28.37, 0]},
	{name:'360200',   value:[117.17,29.32, 0]},
	{name:'360201',   value:[117.17,29.30, 0]},
	{name:'360202',   value:[117.17,29.27, 0]},
	{name:'360203',   value:[117.2,29.3, 0]},
	{name:'360222',   value:[117.25,29.37, 0]},
	{name:'360281',   value:[117.12,28.97, 0]},
	{name:'360300',   value:[113.87,27.70, 0]},
	{name:'360301',   value:[113.87,27.68, 0]},
	{name:'360302',   value:[113.87,27.65, 0]},
	{name:'360313',   value:[113.73,27.65, 0]},
	{name:'360321',   value:[113.95,27.13, 0]},
	{name:'360322',   value:[113.8,27.88, 0]},
	{name:'360323',   value:[114.03,27.63, 0]},
	{name:'360400',   value:[115.98,29.73, 0]},
	{name:'360401',   value:[115.98,29.71, 0]},
	{name:'360402',   value:[115.98,29.68, 0]},
	{name:'360403',   value:[115.98,29.73, 0]},
	{name:'360421',   value:[115.88,29.62, 0]},
	{name:'360423',   value:[115.1,29.27, 0]},
	{name:'360424',   value:[114.57,29.03, 0]},
	{name:'360425',   value:[115.8,29.03, 0]},
	{name:'360426',   value:[115.77,29.33, 0]},
	{name:'360427',   value:[116.03,29.45, 0]},
	{name:'360428',   value:[116.18,29.27, 0]},
	{name:'360429',   value:[116.22,29.73, 0]},
	{name:'360430',   value:[116.55,29.9, 0]},
	{name:'360481',   value:[115.67,29.68, 0]},
	{name:'360500',   value:[114.93,27.85, 0]},
	{name:'360501',   value:[114.93,27.83, 0]},
	{name:'360502',   value:[114.93,27.8, 0]},
	{name:'360521',   value:[114.67,27.82, 0]},
	{name:'360600',   value:[117.05,28.28, 0]},
	{name:'360601',   value:[117.05,28.26, 0]},
	{name:'360602',   value:[117.05,28.23, 0]},
	{name:'360622',   value:[116.82,28.2, 0]},
	{name:'360681',   value:[117.22,28.28, 0]},
	{name:'360700',   value:[114.93,25.92, 0]},
	{name:'360701',   value:[114.93,25.90, 0]},
	{name:'360702',   value:[114.93,25.87, 0]},
	{name:'360721',   value:[115,25.87, 0]},
	{name:'360722',   value:[114.93,25.38, 0]},
	{name:'360723',   value:[114.35,25.4, 0]},
	{name:'360724',   value:[114.53,25.8, 0]},
	{name:'360725',   value:[114.3,25.7, 0]},
	{name:'360726',   value:[115.38,25.13, 0]},
	{name:'360727',   value:[114.78,24.92, 0]},
	{name:'360728',   value:[115.03,24.78, 0]},
	{name:'360729',   value:[114.52,24.75, 0]},
	{name:'360730',   value:[116.02,26.48, 0]},
	{name:'360731',   value:[115.42,25.95, 0]},
	{name:'360732',   value:[115.35,26.33, 0]},
	{name:'360733',   value:[115.78,25.6, 0]},
	{name:'360734',   value:[115.65,24.95, 0]},
	{name:'360735',   value:[116.33,26.33, 0]},
	{name:'360781',   value:[116.03,25.88, 0]},
	{name:'360782',   value:[114.75,25.65, 0]},
	{name:'360800',   value:[114.98,27.17, 0]},
	{name:'360801',   value:[114.98,27.15, 0]},
	{name:'360802',   value:[114.98,27.12, 0]},
	{name:'360803',   value:[115,27.1, 0]},
	{name:'360821',   value:[114.9,27.05, 0]},
	{name:'360822',   value:[115.13,27.22, 0]},
	{name:'360823',   value:[115.33,27.62, 0]},
	{name:'360824',   value:[115.4,27.77, 0]},
	{name:'360825',   value:[115.43,27.32, 0]},
	{name:'360826',   value:[114.88,26.8, 0]},
	{name:'360827',   value:[114.52,26.33, 0]},
	{name:'360828',   value:[114.78,26.47, 0]},
	{name:'360829',   value:[114.62,27.38, 0]},
	{name:'360830',   value:[114.23,26.95, 0]},
	{name:'360881',   value:[114.27,26.72, 0]},
	{name:'360900',   value:[114.38,27.85, 0]},
	{name:'361000',   value:[116.35,28.03, 0]},
	{name:'361001',   value:[116.35,28.01, 0]},
	{name:'361002',   value:[116.35,27.98, 0]},
	{name:'361021',   value:[116.63,27.55, 0]},
	{name:'361022',   value:[116.92,27.3, 0]},
	{name:'361023',   value:[116.53,27.22, 0]},
	{name:'361024',   value:[116.05,27.77, 0]},
	{name:'361025',   value:[115.83,27.43, 0]},
	{name:'361026',   value:[116.22,27.55, 0]},
	{name:'361027',   value:[116.77,27.92, 0]},
	{name:'361028',   value:[117.07,27.7, 0]},
	{name:'361029',   value:[116.62,28.23, 0]},
	{name:'361030',   value:[116.32,26.83, 0]},
	{name:'361100',   value:[117.95,28.48, 0]},
	{name:'361101',   value:[117.95,28.46, 0]},
	{name:'361102',   value:[117.95,28.43, 0]},
	{name:'361121',   value:[117.92,28.43, 0]},
	{name:'361122',   value:[118.18,28.43, 0]},
	{name:'361123',   value:[118.25,28.68, 0]},
	{name:'361124',   value:[117.7,28.32, 0]},
	{name:'361125',   value:[117.6,28.42, 0]},
	{name:'361126',   value:[117.43,28.4, 0]},
	{name:'361127',   value:[116.68,28.7, 0]},
	{name:'361128',   value:[116.67,29, 0]},
	{name:'361129',   value:[117.07,28.7, 0]},
	{name:'361130',   value:[117.85,29.25, 0]},
	{name:'361181',   value:[117.57,28.95, 0]}
];
var yc = [
	{name:'360901',   value:[114.38,27.83, 0]},
	{name:'360902',   value:[114.38,27.8, 0]},
	{name:'360921',   value:[115.38,28.7, 0]},
	{name:'360922',   value:[114.43,28.12, 0]},
	{name:'360923',   value:[114.92,28.23, 0]},
	{name:'360924',   value:[114.78,28.38, 0]},
	{name:'360925',   value:[115.35,28.87, 0]},
	{name:'360926',   value:[114.37,28.53, 0]},
	{name:'360981',   value:[115.78,28.2, 0]},
	{name:'360982',   value:[115.53,28.07, 0]},
	{name:'360983',   value:[115.37,28.42, 0]}
];
var areaInfoMap = {
	'360000':'江西省',
	'360100':'南昌市',
	'360101':'南昌市',
	'360102':'东湖区',
	'360103':'西湖区',
	'360104':'青云谱区',
	'360105':'湾里区',
	'360111':'青山湖区',
	'360121':'南昌县',
	'360122':'新建县',
	'360123':'安义县',
	'360124':'进贤县',
	'360200':'景德镇市',
	'360201':'景德镇市',
	'360202':'昌江区',
	'360203':'珠山区',
	'360222':'浮梁县',
	'360281':'乐平市',
	'360300':'萍乡市',
	'360301':'萍乡市',
	'360302':'安源区',
	'360313':'湘东区',
	'360321':'莲花县',
	'360322':'上栗县',
	'360323':'芦溪县',
	'360400':'九江市',
	'360401':'九江市',
	'360402':'庐山区',
	'360403':'浔阳区',
	'360421':'九江县',
	'360423':'武宁县',
	'360424':'修水县',
	'360425':'永修县',
	'360426':'德安县',
	'360427':'星子县',
	'360428':'都昌县',
	'360429':'湖口县',
	'360430':'彭泽县',
	'360481':'瑞昌市',
	'360500':'新余市',
	'360501':'新余市',
	'360502':'渝水区',
	'360521':'分宜县',
	'360600':'鹰潭市',
	'360601':'鹰潭市',
	'360602':'月湖区',
	'360622':'余江县',
	'360681':'贵溪市',
	'360700':'赣州市',
	'360701':'赣州市',
	'360702':'章贡区',
	'360721':'赣县',
	'360722':'信丰县',
	'360723':'大余县',
	'360724':'上犹县',
	'360725':'崇义县',
	'360726':'安远县',
	'360727':'龙南县',
	'360728':'定南县',
	'360729':'全南县',
	'360730':'宁都县',
	'360731':'于都县',
	'360732':'兴国县',
	'360733':'会昌县',
	'360734':'寻乌县',
	'360735':'石城县',
	'360781':'瑞金市',
	'360782':'南康市',
	'360800':'吉安市',
	'360801':'吉安市',
	'360802':'吉州区',
	'360803':'青原区',
	'360821':'吉安县',
	'360822':'吉水县',
	'360823':'峡江县',
	'360824':'新干县',
	'360825':'永丰县',
	'360826':'泰和县',
	'360827':'遂川县',
	'360828':'万安县',
	'360829':'安福县',
	'360830':'永新县',
	'360881':'井冈山市',
	'360900':'宜春市',
	'360901':'宜春市',
	'360902':'袁州区',
	'360921':'奉新县',
	'360922':'万载县',
	'360923':'上高县',
	'360924':'宜丰县',
	'360925':'靖安县',
	'360926':'铜鼓县',
	'360981':'丰城市',
	'360982':'樟树市',
	'360983':'高安市',
	'361000':'抚州市',
	'361001':'抚州市',
	'361002':'临川区',
	'361021':'南城县',
	'361022':'黎川县',
	'361023':'南丰县',
	'361024':'崇仁县',
	'361025':'乐安县',
	'361026':'宜黄县',
	'361027':'金溪县',
	'361028':'资溪县',
	'361029':'东乡县',
	'361030':'广昌县',
	'361100':'上饶市',
	'361101':'上饶市',
	'361102':'信州区',
	'361121':'上饶县',
	'361122':'广丰县',
	'361123':'玉山县',
	'361124':'铅山县',
	'361125':'横峰县',
	'361126':'弋阳县',
	'361127':'余干县',
	'361128':'鄱阳县',
	'361129':'万年县',
	'361130':'婺源县',
	'361181':'德兴市',
    '110000':'北京市',
    '120000':'天津市',
    '130000':'河北省',
    '140000':'山西省',
    '150000':'内蒙古自治区',
    '210000':'辽宁省',
    '220000':'吉林省',
    '230000':'黑龙江省',
    '310000':'上海市',
    '320000':'江苏省',
    '330000':'浙江省',
    '340000':'安徽省',
    '350000':'福建省',
    '370000':'山东省',
    '410000':'河南省',
    '420000':'湖北省',
    '430000':'湖南省',
    '440000':'广东省',
    '450000':'广西壮族自治区',
    '460000':'海南省',
    '500000':'重庆市',
    '510000':'四川省',
    '520000':'贵州省',
    '530000':'云南省',
    '540000':'西藏自治区',
    '610000':'陕西省',
    '630000':'青海省',
    '620000':'甘肃省',
    '640000':'宁夏回族自治区',
    '650000':'新疆维吾尔自治区',
    '710000':'台湾省',
    '810000':'香港特别行政区',
    '820000':'澳门特别行政区'
};