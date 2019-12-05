var yAxisSingle = [
    {
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
    }
]

var yAxisDouble = [
    {
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
        name: '增速',
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
    }
]

var markPoint = [
	[
		{
        	symbolSize : 35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#fff"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#799C0E"
        		}
        	}
        },
	],
	[
		{
        	symbolSize:35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#000"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#FCFF00"
        		}
        	}
        },
        {
        	symbolSize : 35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#fff"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#799C0E"
        		}
        	}
        }
	],
	[
		{
        	symbolSize:35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#000"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#FCFF00"
        		}
        	}
        },
        {
        	symbolSize : 35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#fff"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#799C0E"
        		}
        	}
        }
	],
	[
		{
        	symbolSize : 35, 
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#000"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#FCFF00"
        		}
        	}
        },
        {
        	symbolSize : 35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#fff"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#799C0E"
        		}
        	}
        }
	],
	[
		{
        	symbolSize : 35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#000"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#FCFF00"
        		}
        	}
        }
	],
	[
		{
        	symbolSize : 35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#000"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#FCFF00"
        		}
        	}
        },
        {
        	symbolSize : 35,
            data : [
                {type : 'max', name: '最大值'},
                {type : 'min', name: '最小值'}
            ],
            label:{
        		normal:{
        			textStyle:{
            			color:"#fff"
        			}
        		}
        	},
        	itemStyle:{
        		normal:{
        			color:"#799C0E"
        		}
        	}
        }
	]
]

var markLine = [
	[
		{
            data : [
                {type : 'average', name: '平均值'}
            ],
            lineStyle:{
            	normal:{
            		color:"#88CFFB"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        }
	],
	[
		{
			data : [
                {type : 'average', name: '平均值'}
            ],
        	lineStyle:{
            	normal:{
            		color:"#5EC9F4"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        },
        {
            data : [
                {type : 'average', name: '平均值'}
            ],
            lineStyle:{
            	normal:{
            		color:"#799C0E"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        }
	],
	[
		{
			data : [
                {type : 'average', name: '平均值'}
            ],
        	lineStyle:{
            	normal:{
            		color:"#8AEED6"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        },
        {
            data : [
                {type : 'average', name: '平均值'}
            ],
            lineStyle:{
            	normal:{
            		color:"#94BD9F"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        }
	],
	[
		{
			data : [
                {type : 'average', name: '平均值'}
            ],
			lineStyle:{
            	normal:{
            		color:"#E8B600"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        },
        {
            data : [
                {type : 'average', name: '平均值'}
            ],
            lineStyle:{
            	normal:{
            		color:"#799C0E"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            },
        }
	],
	[
		{
			data : [
                {type : 'average', name: '平均值'}
            ],
			lineStyle:{
            	normal:{
            		color:"#9AA585"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        }
	],
	[
		{
			data : [
                {type : 'average', name: '平均值'}
            ],
			lineStyle:{
            	normal:{
            		color:"#CD0567"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        },
        {
            data : [
                {type : 'average', name: '平均值'}
            ],
            lineStyle:{
            	normal:{
            		color:"#9AA585"
            	},
            	emphasis:{
            		color:'#5EC9F4'
            	}
            }
        }
	]
]

var itemStyle = [
	[
		{
        	normal:{
        		color:'#88CFFB'
        	}
        }
	],
	[
		{
        	normal:{
        		color:'#5EC9F4'
        	}
        },
        {
        	normal:{
        		color:'#F16B4E'
        	}
        }
	],
	[
		{
        	normal:{
        		color:'#8AEED6'
        	}
        },
        {
        	normal:{
        		color:'#94BD9F'
        	}
        }
	],
	[
		{
        	normal:{
        		color:'#E8B600'
        	}
        },
        {
        	normal:{
        		color:'#799C0E'
        	}
        }
	],
	[
		{
        	normal:{
        		color:'#9AA585'
        	}
        }
	],
	[
		{
        	normal:{
        		color:'#CD0567'
        	}
        },
        {
        	normal:{
        		color:'#9AA585'
        	}
        }
	]
]
