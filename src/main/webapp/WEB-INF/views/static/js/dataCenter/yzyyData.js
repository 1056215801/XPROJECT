var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
function yzyyData1(data1,data2,title1,title2,id,seriesName1,seriesName2,unit1,unit2,legend,type1,type2){
	var xData = [];
	var yData1 = [];
	var yData2 = [];
	if(data1&&data1!=undefined){
		for(var i=0;i<data1.length;i++){
			var temp = data1[i];
			xData.push(temp.name);
			if(type1==1){
				yData1.push(temp.percent);
			}else{
				yData1.push(temp.value);
			}
		}
	}
	if(data2&&data2!=undefined){
		for(var i=0;i<data2.length;i++){
			var temp = data2[i];
			if(type2==1){
				yData2.push(temp.percent);
			}else{
				yData2.push(temp.value);
			}
		}
	}
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
	$("#"+id).removeAttr("_echarts_instance_");
	var chart = echarts.init(document.getElementById(id));
	var option = {
	    tooltip : {
	        trigger: "axis",
	    	formatter: function(params){
				var par1 = ''; 
	        	var par2 = ''; 
	        	var unit = ''
	        	if(params[0]){
	    			params[0].seriesName==seriesName1?unit = unit1:unit = unit2;
	        		if(params[0].value != undefined && params[0].value!=''){
	        			par1 = params[0].marker +params[0].axisValue+ '<br>'+ params[0].seriesName + ':' + params[0].value + unit;
	        		}
	        	}
	        	if(params[1]){
	    			params[1].seriesName==seriesName2?unit = unit2:unit = unit1;
	        		if(params[1].value != undefined && params[1].value!=''){
	        			par2 =  '<br>' + params[1].seriesName + ':' + params[1].value + unit+'<br>'; 
	        		}
	        	}
	        	if(par1 == ''){
	        		par1 = params[0].marker + params[0].axisValue;
	        	}
	        	return par1 + par2
			}
	    },
		grid: {
	        left:'4%',
	        right:'4%',
	        top: 50,
	        bottom: 30,
	        containLabel:true
		},
		legend: legend,
	    calculable: true,
	    xAxis: [{
	        type: "category",
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
	          },
	         data: xData,
	    }],
	    yAxis: [
	    
        {
            type: 'value',
            nameTextStyle:{
            	color: '#00DEFF',
            },
            name: title1,
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
        },
        {
            type: 'value',
            name: title2,
            nameTextStyle:{
            	color: '#00DEFF',
            },
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
                show: true,
                formatter: '{value} %',
      	        color: "#00DEFF"
                },
          }
	    ],
	    series: [
	         {
	            name: seriesName1,
	            type: "line",
	            symbol: 'circle',
	            yAxisIndex:1,
	            symbolSize:8,
	            itemStyle: {
	              	borderWidth: 2,
	                color: '#FFE42D'
	            },
	            data: yData2,
	        },
	        {
	            name: seriesName2,
	            type: "bar",
	            barMaxWidth: 25,
	            barGap: "10%",
	            color : [
	    	        {
	                    type: 'linear',
	                    x: 0,
	                    y: 0,
	                    x2: 0,
	                    y2: 1,
	                    colorStops: [{
	                        offset: 0, color: 'rgba(0,255,255,1)' // 0% 处的颜色
	                    }, {
	                        offset: 1, color: 'rgba(0,255,255,0)' // 100% 处的颜色
	                    }],
	                    globalCoord: false // 缺省为 false
	                }],
	            data: yData1,
	        },
	    ]
	}
	chart.setOption(option);
} 
//冰山图
function yzyyData2(data1,data2,title1,title2,id,select,seriesName1,seriesName2,unit1,unit2,legend,type1,type2){
	select = 3;
	$("#"+id).removeAttr("_echarts_instance_");
	var myChart = echarts.init(document.getElementById(id));
	var xData = [];
	var yData1 = [];
	var yData2 = [];
	if(data1&&data1!=undefined){
		for(var i=0;i<data1.length;i++){
			var temp = data1[i];
			xData.push(temp.name);
			if(type1==1){
				yData1.push(temp.percent);
			}else{
				yData1.push(temp.value);
			}
		}
	}
	if(data2&&data2!=undefined){
		for(var i=0;i<data2.length;i++){
			var temp = data2[i];
			if(type2==2){
				yData2.push(temp.value);
			}else{
				yData2.push(temp.percent);
			}
		}
	}
	xData.unshift('');
	xData.push('');
	yData1.unshift('');
	yData2.unshift('');
  var option = {
  	grid: {
        left:'4%',
        right:'4%',
        top: 50,
        bottom: 0,
        containLabel:true
	},
	legend: legend,
	tooltip: {
		show: true,
		trigger: 'axis',
		formatter: function(params){
			//console.log(params);
			var par1 = ''; 
        	var par2 = ''; 
        	var unit = ''
        	if(params[0]){
    			params[0].seriesName==seriesName1?unit = unit1:unit = unit2;
        		if(params[0].value != undefined && params[0].value!=''){
        			par1 = params[0].marker +params[0].axisValue+ '<br>'+ params[0].seriesName + ':' + params[0].value + unit;
        		}
        	}
        	if(params[1]){
    			params[1].seriesName==seriesName2?unit = unit2:unit = unit1;
        		if(params[1].value != undefined && params[1].value!=''){
        			par2 =  '<br>' + params[1].seriesName + ':' + params[1].value + unit+'<br>'; 
        		}
        	}
        	if(par1 == ''){
        		par1 = params[0].marker + params[0].axisValue;
        	}
        	return par1 + par2
		}
	},
  	xAxis: [{
          type: 'category',
          show: false,
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
    	  type: 'value',
          nameTextStyle:{
          	color: '#00DEFF',
          },
          name: title1,
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
      }, {
    	  type: 'value',
          nameTextStyle:{
            	color: '#00DEFF',
           },
          name: title2,
          axisLabel: {
          	show: true,
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
          name: seriesName1,
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
          data: yData1,
      },
      {
      	type: "line",
      	symbol: 'circle',
      	symbolSize: 8,
        name: seriesName2,
        yAxisIndex:1,
        data: yData2,
        itemStyle: {
          	borderWidth: 2,
            color: '#00FFFF'
        }
      }]
  };
  myChart.setOption(option);
}
function rankPie(d1,t,unit,id,subTitle){
	var fz1 = 28;
	var fz2 = 13;
	if(width<=1600){
		fz1 = 25;
		fz2 = 12;
	}
	if(width<=1366){
		fz2 = 10;
	}
	$("#"+id).removeAttr("_echarts_instance_");
	var myChart = echarts.init(document.getElementById(id));
	var option = {
			color: ['#F16279', '#FCD434', '#4EC973', '#34C9C9', '#965DE4', '#399EFF',"#849CD1","#B1B3B6", "rgba(0,0,0,0.2)"],
			title: {
				 text:t,
		         subtext: subTitle,
		         textStyle: {
		             color: '#FFEE2D',
		             fontSize: fz1,
		             lineHeight: 10,
		         },
		         subtextStyle: {
		             fontSize: fz2,
		             color: '#fff',
		             lineHeight: 10,
		             align: 'center'
		         },
		         x: 'center',
		         y: '40%',
		         itemGap:0,
		     },
		     grid: {
		         top:10,
		    	 bottom: 10,
		    	 left: 20,
		    	 right: 20,
		    	 containLabel:true
		     },
		     series: [
		    	 {
		             radius: ['33%', '61%'],
		             center: ['50%', '50%'],
		             type: 'pie',
		             label: {
		            	 show: true,
		                 formatter: function(param){
		                	return param.name+'\n'+ param.value+ unit +'('+param.percent+'%)'; 
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
		             radius: ['45%', '33%'],
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