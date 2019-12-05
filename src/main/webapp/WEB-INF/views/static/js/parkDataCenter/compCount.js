var data = "";
var max = "";
var min = "";
/**
 * 企业按产业类型统计
 * @param orgId 园区id
 * @param chartType 图表类型 bar：柱形图 pie：饼图
 * @param standardSize 企业类型 1：规上 （没有规定传null）
 * @returns
 */
function loadEchart(ctx, orgId, chartType, standardSize) {
	if (data != null && data != "") {
		var myChart = echarts.init(document.getElementById('chart'));
		if(chartType == "bar"){
			bar.xAxis[0].data = data.xAxis;
			bar.series[0].data = data.bar;
			myChart.setOption(bar);
		}else if(chartType == "pie"){
			pie.series[0].data=data.pie;
			myChart.setOption(pie);
		}
	} else {
		var postData = "";
		if(standardSize==null){
			postData = {"orgId" : orgId};
		}else{
			postData = {"orgId" : orgId, "standardSize" : standardSize};
		}
		
		$.ajax({
			url : ctx + "/interface/json/dataCenter/compCount",
			type : "post",
			data : postData,
			success : function(result) {
				var myChart = echarts.init(document.getElementById('chart'));
				if(chartType == "bar"){
					bar.xAxis[0].data = result.compData.xAxis;
					bar.series[0].data = result.compData.bar;
					max = result.compData.max;
					min = result.compData.min;
					myChart.setOption(bar);
				}else if(chartType == "pie"){
					pie.series[0].data=result.compData.pie;
					myChart.setOption(pie);
				}
				data = result.compData;
				
				$("#total").text(result.compData.total);
				
			},
			error : function() {
				layer.msg("图表数据获取异常！");
			}
		});
	}
}

var bar = {
	tooltip : {
		trigger : 'axis',
		axisPointer : {
			type : 'shadow',
			shadowStyle : {
				color : 'rgba(40, 40, 80, 0.3)'
			}
		}
	},
	grid : {
		bottom : '3%',
		containLabel : true,
	},
	xAxis : [ {
		type : 'category',
		data : [],
		axisLine : {
			lineStyle : {
				color : "#5EC9F4"
			}
		}
	} ],
	yAxis : [ {
		type : 'value',
		name : '企业数（单位：个）',
		axisLabel : {
			formatter : '{value} '
		},
		axisLine : {
			lineStyle : {
				color : "#5EC9F4"
			}
		},
		splitLine : {
			lineStyle : {
				opacity : 0.2
			}
		}
	} ],
	series : [ {
		name : '总量',
		type : 'bar',
		data : [],
		barWidth : '30%',
		markPoint : {
			symbolSize : 55,
			data : [ {
				type : 'max',
				name : '最大值'
			}, {
				type : 'min',
				name : '最小值'
			} ],
			label : {
				normal : {
					textStyle : {
						color : "#000"
					}
				}
			},
			itemStyle : {
				normal : {
					color : "#FCFF00"
				}
			}
		},
		markLine : {
			lineStyle : {
				normal : {
					color : "#FCFF00"
				},
				emphasis : {
					color : '#FCFF00'
				}
			},
			data : [ {
				type : 'average',
				name : '平均值'
			} ]
		},
		itemStyle : {
			normal : {
				color : function(params) {
					var value = params.value;
					var color = "";
					if (value == max) {
						color = '#ff00cd';
					} else if (value == min) {
						color = '#f5ff00';
					} else {
						color = '#00DEFF';
					}
					return color;
				}

			}
		}
	} ]
};

var rich = {
	total : {
		color : "#ffc72b",
		fontSize : 40,
		align : 'center'
	}
};
var pie = {
	title : [ {
		text : '各产业企业',
		left : 'center',
		top : '43%',
		padding : [ 24, 0 ],
		textStyle : {
			color : '#fff',
			fontSize : 18,
			align : 'center'
		}
	} ],
	tooltip : {
		trigger : 'item',
		formatter : "{a}{b}:  {c}  ({d}%)"
	},
	series : [ {
		name : '',
		type : 'pie',
		radius : [ '40%', '55%' ],
		label : {
			normal : {
				formatter : '{b|{b}：}{c}  {per|{d}%}',
				backgroundColor : '#eee',
				borderColor : '#aaa',
				borderWidth : 1,
				borderRadius : 4,
				rich : {
					b : {
						fontSize : 16,
						lineHeight : 33
					},
					per : {
						color : '#eee',
						backgroundColor : '#334455',
						padding : [ 2, 4 ],
						borderRadius : 2
					}
				}
			}
		},
		data : []
	} ]
};